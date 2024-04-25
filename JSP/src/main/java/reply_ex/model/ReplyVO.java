package reply_ex.model;

public class ReplyVO {

		private int replyId;	// 댓글의 번호
		private int seq;		// 게시글 번호
		private String user;	// 댓글 작성자
		private String reply;	// 댓글 내용
		
		
		
		public int getReplyId() {
			return replyId;
		}
		public void setReplyId(int replyId) {
			this.replyId = replyId;
		}
		public int getSeq() {
			return seq;
		}
		public void setSeq(int seq) {
			this.seq = seq;
		}
		public String getUser() {
			return user;
		}
		public void setUser(String user) {
			this.user = user;
		}
		public String getReply() {
			return reply;
		}
		public void setReply(String reply) {
			this.reply = reply;
		}
		
		
		@Override
		public String toString() {
			return "ReplyVO [replyId=" + replyId + ", seq=" + seq + ", user=" + user + ", reply=" + reply + "]";
		}
		
		
		
		
}
