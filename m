Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FDBC5DF8C
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 20:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EAF10E34F;
	Fri, 21 Aug 2026 20:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ho0+eben";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836C510F3BA
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 20:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787342858; x=1818878858;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=giSJex20VDL2tEYZlrst6/ToT6FcxFESGNCuT8zgVOw=;
 b=Ho0+eben6u3+mIfsS+rCjTqaBysIMOGL7ZxYHY2Kzp9CiogFHEY0KLZi
 tHCYBkXiE5LeNps/Gt9IEIA6M2bfccAfGA9Ix5zm5Gn2ZR93jo6OsvV71
 0Qa+gyo4GuoUeZsalu/iy7UH/+zmmN62+VX8n5ZrcOjr6wiJUc8Ou9bJK
 Y0no47IcF+lqES9Hk4ub7K3QqOT77r44j3WnDSCpNaqoOAfTpkbHfJSUQ
 CIDLBu4LpsMgh15/RftGGeondiIvfVE4o1NOINMC/TvF33rqOV3fMHRyN
 xs+A0GIS6SK1lTeUoCeC4wZ6+W5MrXiypTxBvtuDSosQS68yjUHBNM4Fa Q==;
X-CSE-ConnectionGUID: r82/QSk5QCaqHcZGTGgxyQ==
X-CSE-MsgGUID: JJbQAKYCTwSXYJXOmqo9KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87957216"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="87957216"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 13:07:37 -0700
X-CSE-ConnectionGUID: UOm2z3iKTB2fyO5M4mcF+Q==
X-CSE-MsgGUID: F2rON/0wRDWEm8vAGMuZQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="266491050"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 13:07:38 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 3/3] drm/xe/xe_oa: Add a lag to the reports that is exported
 to user
Date: Fri, 21 Aug 2026 13:07:32 -0700
Message-ID: <20260821200728.1048699-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260821200728.1048699-5-umesh.nerlige.ramappa@intel.com>
References: <20260821200728.1048699-5-umesh.nerlige.ramappa@intel.com>
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
v2: Fix the LAG logic by using sliding window (Sashiko)
v3: Fix checkpatch warning
v4: Update sw tail on stream disable (Ashutosh)
---
 drivers/gpu/drm/xe/xe_oa.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index d7647f37ab02..2a88f7d9e67c 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -224,7 +224,7 @@ static bool mert_wa_14026633728(struct xe_oa_stream *s)
 static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
 {
 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
-	u32 hw_tail, partial_report_size, available;
+	u32 hw_tail, partial_report_size, available, lag;
 	int report_size = stream->oa_buffer.format->size;
 	unsigned long flags;
 
@@ -234,17 +234,23 @@ static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
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
+	if (!stream->enabled)
+		stream->oa_buffer.tail = hw_tail;
+	else if (lag > LAG_REPORTS * report_size)
+		stream->oa_buffer.tail = xe_oa_circ_diff(stream, hw_tail,
+							 LAG_REPORTS * report_size);
 
 	available = xe_oa_circ_diff(stream, stream->oa_buffer.tail, stream->oa_buffer.head);
 	stream->pollin = available >= stream->wait_num_reports * report_size;
-- 
2.51.0

