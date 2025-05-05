Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EBAC3ABC1
	for <intel-xe@archiver.kernel.org>; Mon,  5 May 2025 22:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C46A10E5A2;
	Mon,  5 May 2025 22:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/RKC+GQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E1410E5A0
 for <intel-xe@lists.freedesktop.org>; Mon,  5 May 2025 22:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746485931; x=1778021931;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=a7adUxdpfNYBaXishGKOgFN7TA6fnJd1XFWiDcJa10E=;
 b=A/RKC+GQoczxrjO5dpN+Yxa3Or2TWUhic3maZh5Va8DKeYHQlgj/MAmU
 RSzGptwVcNFGZvfqg/JP3Nl4EseSg/EbyhvhsP9jRHDDIkFh7w4X06X70
 ebu52uXrKshSZLDTWMkp01Gvr2r7efjaj3DBwd2w8yBuJO3170gfn86Y1
 GUT4WHV9maN4zadPjUsavwio72IujQoS9riWjpkk43iDg03CuzSr0u/Vn
 7GaQriyEanXOqGgLnKFDhSLRT9mTJM+NWiDBViEzRq5v3Hj9IKjVaLkpd
 iUfqYkc7hpFvGJpTrbOnC0n0sM5oeBtjwWAf7Jz9IejGdCUtXdmEPlbwn A==;
X-CSE-ConnectionGUID: TxI6IB6JT5e2eogN3N6UPA==
X-CSE-MsgGUID: yHDc0aKBQouOaTuov/WDbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="35740153"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; d="scan'208";a="35740153"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 15:58:50 -0700
X-CSE-ConnectionGUID: IHiiyXVPTFqCb7KZsgJKRg==
X-CSE-MsgGUID: NEqszhxbRL+oJXqfCbJQKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; d="scan'208";a="166467816"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 15:58:50 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 matthew.brost@intel.com
Subject: [PATCH v3 1/4] drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC
 value
Date: Mon,  5 May 2025 15:58:53 -0700
Message-ID: <20250505225852.1994431-7-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505225852.1994431-6-umesh.nerlige.ramappa@intel.com>
References: <20250505225852.1994431-6-umesh.nerlige.ramappa@intel.com>
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

