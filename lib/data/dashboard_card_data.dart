class CardData {
  String taskName, status, description, date;

  CardData({
    required this.taskName,
    required this.status, 
    required this.description, 
    required this.date
  });
}

List<CardData> cardDataList = [
  CardData(taskName: 'Project #1', status: 'DONE', description: 'Shopping and market mobile app designed by me.', date: '03/8/2022'),
  CardData(taskName: 'Project #2', status: 'IN PROGRESS', description: 'TODO app for customers.', date: '04/10/2022'),
  CardData(taskName: 'Project #3', status: 'PENDING', description: 'Web page for car company.', date: '04/16/2022'),
  
];