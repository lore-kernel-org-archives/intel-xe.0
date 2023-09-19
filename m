Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58950CE79B0
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 16:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D2610E3D0;
	Tue, 19 Sep 2023 16:16:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F07410E293
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695140181; x=1726676181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TcKnHukk23QeXCAaKh3Ti5SWCmZVMQDwDP9FG+F4ewc=;
 b=fqS6HxDoMgoPcys5J8FNKGpAw4Z+G450qW+oAoR2HiM4kyNTsSLF25rR
 hA6WSWtKjRNhf06ASaLjsUSpD2Zq0BRvAj0r1ruR79UAmLj5twiJv6kTh
 9WhFOvQgyw5aI0EVbWqxHaChuBjVYls6H+NdnJvRrmUeP3vWGNZNyisxh
 WUOOUDdQG65VoroAfgHnoPGYelQW8p8ybAhIgB1QQW3OWM4LY9+3KFElG
 SwxZz20OlxqS5fEBkV4aM28L36Oc01VwaH7or0U+R8ufX4Gzja74qeNlD
 dVFxlxhSUrjqXrKhnk9hpihuVSqYrR72xuZ61lM2maiUv9JMDYg54oR4a g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410913577"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="410913577"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870016551"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; d="scan'208";a="870016551"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 09:10:54 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 09:10:45 -0700
Message-ID: <20230919161049.2307855-18-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 17/21] drm/xe/oa: Remove filtering reports on
 context id
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

At present XE OA code does not obtain context id's from GuC. Even if these
context id's were available it is not clear if included reports for
userspace should be filtered on context id's. Till these issues are
resolved remove filtering reports based on context id's.

Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 33 +++-----------------------------
 drivers/gpu/drm/xe/xe_oa_types.h |  9 ---------
 2 files changed, 3 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 8648652e05aa5..077698a0c5628 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -184,13 +184,6 @@ static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 *report)
 		report[1] = 0;
 }
 
-static u32 oa_context_id(struct xe_oa_stream *stream, u32 *report)
-{
-	u32 ctx_id = oa_report_header_64bit(stream) ? report[4] : report[2];
-
-	return ctx_id & stream->specific_ctx_id_mask;
-}
-
 static void oa_context_id_squash(struct xe_oa_stream *stream, u32 *report)
 {
 	if (oa_report_header_64bit(stream))
@@ -368,7 +361,7 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 
 	for (; OA_TAKEN(tail, head); head = (head + report_size) & mask) {
 		u8 *report = oa_buf_base + head;
-		u32 ctx_id, *report32 = (void *)report;
+		u32 *report32 = (void *)report;
 		u64 reason;
 
 		/*
@@ -379,7 +372,6 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 		 * this field and it is valid to have a reason field of zero.
 		 */
 		reason = oa_report_reason(stream, report);
-		ctx_id = oa_context_id(stream, report32);
 
 		/*
 		 * Squash whatever is in the CTX_ID field if it's marked as invalid to be
@@ -388,10 +380,8 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 		 * Note: we don't clear the valid_ctx_bit so userspace can understand that
 		 * the ID has been squashed by the kernel.
 		 */
-		if (oa_report_ctx_invalid(stream, report)) {
-			ctx_id = INVALID_CTX_ID;
+		if (oa_report_ctx_invalid(stream, report))
 			oa_context_id_squash(stream, report32);
-		}
 
 		/*
 		 * NB: The OA unit does not support clock gating off for a specific
@@ -419,21 +409,10 @@ static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
 		 * since it's not-uncommon for periodic samples to identify a switch
 		 * before any 'context switch' report.
 		 */
-		if (!stream->exec_q || stream->specific_ctx_id == ctx_id ||
-		    stream->oa_buffer.last_ctx_id == stream->specific_ctx_id ||
-		    reason & OAREPORT_REASON_CTX_SWITCH) {
-			/*
-			 * While filtering for a single context we avoid
-			 * leaking the IDs of other contexts.
-			 */
-			if (stream->exec_q && stream->specific_ctx_id != ctx_id)
-				oa_context_id_squash(stream, report32);
-
+		if (!stream->exec_q || reason & OAREPORT_REASON_CTX_SWITCH) {
 			ret = xe_oa_append_sample(stream, buf, count, offset, report);
 			if (ret)
 				break;
-
-			stream->oa_buffer.last_ctx_id = ctx_id;
 		}
 
 		if (is_power_of_2(report_size)) {
@@ -497,12 +476,6 @@ static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
 	/* Mark that we need updated tail pointers to read from... */
 	stream->oa_buffer.tail = 0;
 
-	/*
-	 * Reset state used to recognise context switches, affecting which reports we will
-	 * forward to userspace while filtering for a single context.
-	 */
-	stream->oa_buffer.last_ctx_id = INVALID_CTX_ID;
-
 	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
 
 	/* Zero out the OA buffer since we rely on zero report id and timestamp fields */
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 3cc1d88fe4a51..7566fef55b0ab 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -222,12 +222,6 @@ struct xe_oa_stream {
 	 */
 	struct llist_head oa_config_bos;
 
-	/** @specific_ctx_id: id of the context used for filtering reports */
-	u32 specific_ctx_id;
-
-	/** @specific_ctx_id_mask: The mask used to masking specific_ctx_id bits */
-	u32 specific_ctx_id_mask;
-
 	/**
 	 * @poll_check_timer: High resolution timer that will periodically
 	 * check for data in the circular OA buffer for notifying userspace
@@ -261,9 +255,6 @@ struct xe_oa_stream {
 		/** @vaddr: mapped vaddr of the OA buffer */
 		u8 *vaddr;
 
-		/** @last_ctx_id: last context id for OA data added */
-		u32 last_ctx_id;
-
 		/**
 		 * @ptr_lock: Locks reads and writes to all head/tail state
 		 *
-- 
2.41.0

