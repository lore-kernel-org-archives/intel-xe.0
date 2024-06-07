Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C12EC27C55
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 06:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EAC10E297;
	Fri,  7 Jun 2024 06:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GNZs9koq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C85110E297
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 06:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717743109; x=1749279109;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=m0G3len9+R45CXG+zA+7HPEtBBQplt5TCKIAAI5fMzQ=;
 b=GNZs9koqdkSARpKtOWt0t4GxekN1Q+GjxaBGP+bTAN1sucEzdjVINxZn
 t/AZ5LXu9il6Z1QxgLQRm0ftbATU2b2L/Q0cV45SCC7m9TYYyKKc0aCuO
 x/ZBoiCC3VAZYkBTE27b8VfkxCq7x7BIsVsVGJQ/L4hKDUedf4lI9WT0q
 To91pJVpM1YbImZa//IQ62QnjbsN7vnTFEDE7CBzO6gaIZTmo6KawWNX5
 Pmy4cLUuQX4lVQAacji3wO2DbRH7aEDaDLdfZcdbNS6EgzWfW/rKa//LW
 Qm+ZWPJKDY2sP23+975uVQlcyykEZURUPbbETfScf36Kn2Q6zDmdFv7cN g==;
X-CSE-ConnectionGUID: rIOr/KIiS+SyXU/DC2lVVQ==
X-CSE-MsgGUID: gdxaPXfTQxyiSzhWyO8eow==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14254925"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="14254925"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 23:51:48 -0700
X-CSE-ConnectionGUID: 3oWn6ZylRg+9KO+y/QRpUg==
X-CSE-MsgGUID: 2m1+Ec6uTheXGw4y8qkGsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="75702760"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 23:51:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 1/5] drm/xe: Add LRC ctx timestamp support functions
Date: Thu,  6 Jun 2024 23:52:15 -0700
Message-Id: <20240607065219.2264624-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607065219.2264624-1-matthew.brost@intel.com>
References: <20240607065219.2264624-1-matthew.brost@intel.com>
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

LRC ctx timestamp support functions are used to determine how long a job
has run on the hardware.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 42 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h |  5 +++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index c1bb85d2e243..76d61b5d5cb6 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -652,6 +652,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
 
 #define LRC_SEQNO_PPHWSP_OFFSET 512
 #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
+#define LRC_CTX_TIMESTAMP_JOB_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
 #define LRC_PARALLEL_PPHWSP_OFFSET 2048
 #define LRC_PPHWSP_SIZE SZ_4K
 
@@ -680,6 +681,12 @@ static inline u32 __xe_lrc_start_seqno_offset(struct xe_lrc *lrc)
 	return xe_lrc_pphwsp_offset(lrc) + LRC_START_SEQNO_PPHWSP_OFFSET;
 }
 
+static inline u32 __xe_lrc_ctx_timestamp_job_offset(struct xe_lrc *lrc)
+{
+	/* The start seqno is stored in the driver-defined portion of PPHWSP */
+	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_TIMESTAMP_JOB_OFFSET;
+}
+
 static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
 {
 	/* The parallel is stored in the driver-defined portion of PPHWSP */
@@ -691,6 +698,11 @@ static inline u32 __xe_lrc_regs_offset(struct xe_lrc *lrc)
 	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
 }
 
+static inline u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
+{
+	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
+}
+
 static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
 {
 	/* Indirect ring state page is at the very end of LRC */
@@ -716,11 +728,41 @@ DECL_MAP_ADDR_HELPERS(pphwsp)
 DECL_MAP_ADDR_HELPERS(seqno)
 DECL_MAP_ADDR_HELPERS(regs)
 DECL_MAP_ADDR_HELPERS(start_seqno)
+DECL_MAP_ADDR_HELPERS(ctx_timestamp_job)
+DECL_MAP_ADDR_HELPERS(ctx_timestamp)
 DECL_MAP_ADDR_HELPERS(parallel)
 DECL_MAP_ADDR_HELPERS(indirect_ring)
 
 #undef DECL_MAP_ADDR_HELPERS
 
+u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc)
+{
+	return __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
+}
+
+u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
+{
+	struct xe_device *xe = lrc_to_xe(lrc);
+	struct iosys_map map;
+
+	map = __xe_lrc_ctx_timestamp_map(lrc);
+	return xe_map_read32(xe, &map);
+}
+
+u32 xe_lrc_ctx_timestamp_job_ggtt_addr(struct xe_lrc *lrc)
+{
+	return __xe_lrc_ctx_timestamp_job_ggtt_addr(lrc);
+}
+
+u32 xe_lrc_ctx_timestamp_job(struct xe_lrc *lrc)
+{
+	struct xe_device *xe = lrc_to_xe(lrc);
+	struct iosys_map map;
+
+	map = __xe_lrc_ctx_timestamp_job_map(lrc);
+	return xe_map_read32(xe, &map);
+}
+
 u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc)
 {
 	return __xe_lrc_pphwsp_ggtt_addr(lrc);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 882c3437ba5c..391ea47ff0fb 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -94,6 +94,11 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
 void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p);
 void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot);
 
+u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc);
+u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
+u32 xe_lrc_ctx_timestamp_job_ggtt_addr(struct xe_lrc *lrc);
+u32 xe_lrc_ctx_timestamp_job(struct xe_lrc *lrc);
+
 /**
  * xe_lrc_update_timestamp - readout LRC timestamp and update cached value
  * @lrc: logical ring context for this exec queue
-- 
2.34.1

