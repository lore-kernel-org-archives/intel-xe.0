Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C16AC3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 01:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B257210E008;
	Wed,  7 May 2025 01:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XIfq5PHM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2CB10E0BE
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 01:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746581445; x=1778117445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a7adUxdpfNYBaXishGKOgFN7TA6fnJd1XFWiDcJa10E=;
 b=XIfq5PHM/j/BdHJr4xraSKa/Ch8ayQMBm1Ei/MBmERVXiIs/CXBEqI6m
 amoikVq8XAG5EuCLivu43vkiW0h8FRvfMNA5XV/r/0LI79Rzibj0NwqGg
 HqzddBPxUpUFfRpmHGzOkVPuyMmP2vnQR7TTMF6Sl2KHOM1I8czzLT4Ne
 Fy+2RvJ/Dro19Ib2PuyaCj0+0Hg6hNYtAOrQW1Ev26KhFAOBrOb2AKDfy
 7Tz5UhBvi0rH+95wUKf1ohrq9Gmmq4/Kh3Y98iET7/GUe21e88BJ5WUpk
 wHSxF9bmAkdGb2JItSzFDYW/h+WUIDU7j6sJUSwxqLSxFpnUejo3QWbBk w==;
X-CSE-ConnectionGUID: DaT8FszqQEKyEgt432/6Sg==
X-CSE-MsgGUID: 2Em5FCx7Rnqrwu7LF5s1JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58913459"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="58913459"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 18:30:42 -0700
X-CSE-ConnectionGUID: 1kmnOF2TQVaLTFYaYlWlFA==
X-CSE-MsgGUID: 0ydOZje/TMGDOiY0KhvyFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="135792199"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 18:30:41 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 matthew.brost@intel.com
Cc: michal.wajdeczko@intel.com
Subject: [PATCH v4 1/4] drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC
 value
Date: Tue,  6 May 2025 18:30:40 -0700
Message-ID: <20250507013039.2043897-7-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507013039.2043897-6-umesh.nerlige.ramappa@intel.com>
References: <20250507013039.2043897-6-umesh.nerlige.ramappa@intel.com>
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

For determining actual job execution time, save the current value of the
CTX_TIMESTAMP register rather than the value saved in LRC since the
current register value is the closest to the start time of the job.

v2: Define MI_STORE_REGISTER_MEM to fix compile error

Fixes: 65921374c48f ("drm/xe: Emit ctx timestamp copy in ring ops")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 4 ++++
 drivers/gpu/drm/xe/xe_lrc.c                      | 2 +-
 drivers/gpu/drm/xe/xe_ring_ops.c                 | 7 ++-----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index eba582058d55..9153a7cd2ceb 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -62,6 +62,10 @@
 #define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
 #define   MI_LRM_USE_GGTT		REG_BIT(22)
 
+#define MI_STORE_REGISTER_MEM		(__MI_INSTR(0x24) | XE_INSTR_NUM_DW(4))
+#define   MI_SRM_USE_GGTT		REG_BIT(22)
+#define   MI_SRM_ADD_CS_OFFSET		REG_BIT(19)
+
 #define MI_LOAD_REGISTER_REG		(__MI_INSTR(0x2a) | XE_INSTR_NUM_DW(3))
 #define   MI_LRR_DST_CS_MMIO		REG_BIT(19)
 #define   MI_LRR_SRC_CS_MMIO		REG_BIT(18)
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 855c8acaf3f1..015b00a73c0b 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -687,7 +687,7 @@ static inline u32 __xe_lrc_start_seqno_offset(struct xe_lrc *lrc)
 
 static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
 {
-	/* The start seqno is stored in the driver-defined portion of PPHWSP */
+	/* This is stored in the driver-defined portion of PPHWSP */
 	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_OFFSET;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index a7582b097ae6..bc1689db4cd7 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -234,13 +234,10 @@ static u32 get_ppgtt_flag(struct xe_sched_job *job)
 
 static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
 {
-	dw[i++] = MI_COPY_MEM_MEM | MI_COPY_MEM_MEM_SRC_GGTT |
-		MI_COPY_MEM_MEM_DST_GGTT;
+	dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
+	dw[i++] = RING_CTX_TIMESTAMP(0).addr;
 	dw[i++] = xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
 	dw[i++] = 0;
-	dw[i++] = xe_lrc_ctx_timestamp_ggtt_addr(lrc);
-	dw[i++] = 0;
-	dw[i++] = MI_NOOP;
 
 	return i;
 }
-- 
2.43.0

