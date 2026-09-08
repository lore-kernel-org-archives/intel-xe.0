Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87264C79FAA
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 22:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3520710EDD9;
	Tue,  8 Sep 2026 22:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kc9v45cQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745EF10EDD7
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 22:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788906247; x=1820442247;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9hsQqmiV746rmK3PaXmD/D79Pl9ADiOVBtydZLRSTJU=;
 b=kc9v45cQjv3Wd4en63IMtnwaGjmXetQm+U2rPPJSlp8LeoH7SzW9fpWe
 GhLZ+iISPIxbVBkR8qUBp5kUgRM+gcT3PWO9wcT32kWW40Rosc0x3Hn4K
 Ynn5JJw4kT/+fjR1h/uQTRPCG5dZHhcDw7RNeCVjvI68bJDMMBeaYSmwK
 igUrcN7GEsycQWdc3SLHoOKXD1tXBnHPH+g6hIn1XNPThOR1ZpXZ89oMV
 MrZ5BFhnzc0iCyCX4xYbqSo0aXRcxPYQYThTb2YaqkKNQISbcJvzYd1fC
 qooRCGfu1/n2mpzLnOJqIlEgyjko1rbobT/Bh/j6C4gHwzb3tB/A0buYX A==;
X-CSE-ConnectionGUID: lhMDzDg+Qs68sf52+UJUjw==
X-CSE-MsgGUID: QeKmwqLcSSKKGvLn1TBcgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100677200"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="100677200"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 15:24:06 -0700
X-CSE-ConnectionGUID: mHPi4xrPRaaI11uOjgExUQ==
X-CSE-MsgGUID: jdHcsOSGRV6aPU29OmY/Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="270638223"
Received: from unerlige-desk1.jf.intel.com ([10.24.80.43])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 15:24:07 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 3/3] drm/xe/xe_oa: Add a lag to the reports that is exported
 to user
Date: Tue,  8 Sep 2026 15:24:00 -0700
Message-ID: <20260908222356.1210175-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908222356.1210175-5-umesh.nerlige.ramappa@intel.com>
References: <20260908222356.1210175-5-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

When running heavy workloads, reading the OA reports too soon does not
guarantee that the report has landed in memory. To make sure correct
reports are copied to user buffer, only return reports that lag the
current HW_TAIL register by 32 reports. This is an empirical number
based on a heavy render workload and several test iterations.

The reports that user reads will always lag the HW tail by 32 reports,
however since OA is used for post processing analysis, this should not
affect any current use cases. When the stream is closed or disabled, we
let the user read the remaining reports up until HW tail.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 08d6e94f5fce..034c9c27538c 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -223,8 +223,8 @@ static bool mert_wa_14026633728(struct xe_oa_stream *s)
 
 static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 {
+	u32 hw_tail, partial_report_size, available, lag, num_reports;
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
-	u32 hw_tail, partial_report_size, available;
 	int report_size = stream->oa_buffer.format->size;
 	unsigned long flags;
 
@@ -234,20 +234,29 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 	hw_tail -= gtt_offset;
 
 	/*
-	 * The tail pointer increases in 64 byte (cacheline size), not in report_size
+	 * The hw_tail pointer increases in 64 byte (cacheline size), not in report_size
 	 * increments. Also report size may not be a power of 2. Compute potential
 	 * partially landed report in OA buffer.
 	 */
 	partial_report_size = xe_oa_circ_diff(stream, hw_tail, stream->oa_buffer.tail);
 	partial_report_size %= report_size;
 
-	/* Subtract partial amount off the tail */
+	/* Subtract partial amount off the hw_tail */
 	hw_tail = xe_oa_circ_diff(stream, hw_tail, partial_report_size);
 
-	stream->oa_buffer.tail = hw_tail;
+#define LAG_REPORTS 32
+	lag = xe_oa_circ_diff(stream, hw_tail, stream->oa_buffer.tail);
+	num_reports = stream->wait_num_reports;
+	if (!stream->enabled) {
+		num_reports = 1;
+		stream->oa_buffer.tail = hw_tail;
+	} else if (lag > LAG_REPORTS * report_size) {
+		stream->oa_buffer.tail = xe_oa_circ_diff(stream, hw_tail,
+							 LAG_REPORTS * report_size);
+	}
 
 	available = xe_oa_circ_diff(stream, stream->oa_buffer.tail, stream->oa_buffer.head);
-	stream->pollin = available >= stream->wait_num_reports * report_size;
+	stream->pollin = available >= num_reports * report_size;
 
 	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
 
@@ -1416,10 +1425,6 @@ static void xe_oa_stream_disable(struct xe_oa_stream *stream)
 
 	if (stream->sample)
 		hrtimer_cancel(&stream->poll_check_timer);
-
-	/* Update stream->oa_buffer.tail to allow any final reports to be read */
-	if (xe_oa_buffer_check_unlocked(stream))
-		wake_up(&stream->poll_wq);
 }
 
 static int xe_oa_enable_preempt_timeslice(struct xe_oa_stream *stream)
@@ -1490,6 +1495,11 @@ static int xe_oa_disable_locked(struct xe_oa_stream *stream)
 		ret = xe_oa_enable_preempt_timeslice(stream);
 
 	stream->enabled = false;
+
+	/* Update stream->oa_buffer.tail to allow any final reports to be read */
+	if (xe_oa_buffer_check_unlocked(stream))
+		wake_up(&stream->poll_wq);
+
 	return ret;
 }
 
-- 
2.53.0

