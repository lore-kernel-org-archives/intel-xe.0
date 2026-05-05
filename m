Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77818CD3443
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 23:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3694210EC67;
	Tue,  5 May 2026 23:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUUO75ys";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B88210E4C1
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 23:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778024657; x=1809560657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HKn7hDS2Gw73OlIQ/XNWXc2phiVI2Wulwl8+GqqFH54=;
 b=BUUO75ysLNguXI4YZAYBOxjcspmo0PTinOuJQT679yMdG6ZO5l6k1kVB
 WVglKcd/0MN1WKqMpWYRXNkC/+5VYfasd7st7rsHfIUX1aKony9xppdSM
 bodwzxt04Kc0XSW/9XabQ1wYyyj8/6U+HZk4ah/fTSAuyrwGHEQXHJSxp
 0Qym5ukQ5BzcGbuRfiPQykRObdxU6der05DfTDPepkHCs84/RkV+D3Zlj
 Fg6TjmOl4/LXMGRp4C3ggylyyULtxuSRQ6k4hOYDRIqnHEwpLtj5oQwET
 8rsTjpbD77eyNtE+uWEXodGQKL5W1JvPYvkjZIEUrDtgA3d4FKWFdqdca Q==;
X-CSE-ConnectionGUID: 6dcHolDnQQCYM2xBQm6egA==
X-CSE-MsgGUID: E+j8pOUrS3Wdp5X1ManhQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78771092"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78771092"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:44:16 -0700
X-CSE-ConnectionGUID: BCUT33gqQ9SaFoj1AN8riQ==
X-CSE-MsgGUID: +wYK2yemSmO/gIhK1C3xdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="231569031"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 16:44:16 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	niranjana.vishwanathapura@intel.com
Cc: matthew.brost@intel.com,
	stuart.summers@intel.com
Subject: [PATCH v3 01/11] drm/xe/lrc: Use 64 bit ctx timestamp in the LRC
 snapshot
Date: Tue,  5 May 2026 16:44:10 -0700
Message-ID: <20260505234408.3552147-14-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
References: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
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

Use the 64 bit value when available for the context timestamp in the LRC
snapshot.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
 drivers/gpu/drm/xe/xe_lrc.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index fdfe2ed5f683..570ff9f55849 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -2462,7 +2462,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	snapshot->replay_offset = 0;
 	snapshot->replay_size = lrc->replay_size;
 	snapshot->lrc_snapshot = NULL;
-	snapshot->ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(lrc));
+	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
 	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
 	return snapshot;
 }
@@ -2515,7 +2515,7 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 	drm_printf(p, "\tRing start: (memory) 0x%08x\n", snapshot->start);
 	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
 	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
-	drm_printf(p, "\tTimestamp: 0x%08x\n", snapshot->ctx_timestamp);
+	drm_printf(p, "\tTimestamp: 0x%016llx\n", snapshot->ctx_timestamp);
 	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
 
 	if (!snapshot->lrc_snapshot)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 5440663183f6..bef7af9a578b 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -37,7 +37,7 @@ struct xe_lrc_snapshot {
 	} tail;
 	u32 start_seqno;
 	u32 seqno;
-	u32 ctx_timestamp;
+	u64 ctx_timestamp;
 	u32 ctx_job_timestamp;
 };
 
-- 
2.51.0

