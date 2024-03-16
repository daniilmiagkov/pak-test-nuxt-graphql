export function fetchGql(query: string, url: string = "http://localhost:4000/graphql"): Promise<any> {
    return new Promise((resolve, reject) => {
        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ query })
        })
            .then(response => response.json())
            .then(data => {
                // Данные успешно получены - передаем их через resolve
                resolve(data);
            })
            .catch(error => {
                // Возникла ошибка - передаем ее через reject
                reject(error);
            });
    });
}
