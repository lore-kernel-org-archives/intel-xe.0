Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A160EE57C1
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 04:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B0310E86F;
	Fri,  8 Sep 2023 04:23:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809E810E86A
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 04:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694147037; x=1725683037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GTKITqNQPjdyvakldLRDZ5r4L6dNUNPLzWLfEgXkGoA=;
 b=d6iwinW4fAHZsMDBrAnfA/pa4zhKNpzFStLucXrw/Zmn9hwMsfygOr22
 2VwmoPan/B3BNJUIqT+lCFdzkG0ReTxsv8sqEE04Td6ZL/g+NMIlgA5wO
 9JEu8/PcoRNYoc4AjqPeuwVkztcWDbGE4Ax7TXhnGQxt6YHhPWdL+lCNG
 tjMAnvotnw58bC5qfgeJc2y8i2kET52Vb5l/wiQgyG0oGeNqJwEaPD/94
 W1qV2ADKAvdH6AamBs2bWDnafYFjUi14bIqtNk22vCbc9RxUGGLHN4fyh
 eSdfi0Q134OU3wqkCFkeg+cxsUqLyCv7Q1z3mmZbpjRI5eGhNDUg9NNHJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="463935409"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="463935409"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="857200771"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="857200771"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 21:23:56 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Sep 2023 21:23:48 -0700
Message-ID: <20230908042348.1592535-18-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
References: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 17/17] drm/xe/oa: Remove filtering reports on
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
index eab19264b2f70..178722f0833ab 100644
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

