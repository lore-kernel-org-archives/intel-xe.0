Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC69C369C9
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 23:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A656910E1A9;
	Thu, 17 Apr 2025 23:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WmvJFSro";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FF510E1A9
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 23:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744932933; x=1776468933;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wc6WF/cSdstQq4zrL4m+6o0R7+Jv1EEZdSrt1gQJu/8=;
 b=WmvJFSroRPsThCUK1a0VyWW5JdX1BmHEoPSRp0cIefF3Sl4laZJTaHln
 2OBnb56JSvKa+JUhCbjHNMLvIcN0/X1F4VStY8WTZYimATAaGCDp2YHk/
 S/XVtsAi/I18kjKaH6m9c3+QZ9lTh7SWJM1yF1RFfDR5DSVSkdFLuzij6
 0hSYWsYjjAghC4vkaJaGntIEItAovlLNIBjizxZsrISixBkdRa8obcNgC
 01+yVVHNQFT7jQZh4n/+g7TdQKFE2ksvPyB88jsKuBHFZ73Kc+jWv1yYc
 HlXovkdOQDDpJtsAes2Huq18+ihhG3dTTSRLDEKps7frvCj+dv2ugS0Da w==;
X-CSE-ConnectionGUID: 8FdmxqMiTUW99PNt2l3uUw==
X-CSE-MsgGUID: Sk+EMcsuQE2gEJ4wA5H4Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57222524"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="57222524"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 16:35:32 -0700
X-CSE-ConnectionGUID: V9IgU8yqRaWRetAKV33BIw==
X-CSE-MsgGUID: pXCIVoByTwSGtjJH2tDQsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="130922291"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.215])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 16:35:32 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, kenneth@whitecape.org, fei.yang@intel.com,
 lucas.demarchi@intel.com
Subject: [PATCH] Revert "drm/xe: enable lite restore"
Date: Thu, 17 Apr 2025 16:35:28 -0700
Message-ID: <20250417233528.455736-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
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

Lite restore is breaking some functionality in MangoHud. While lite
restore is certainly preferable, it is throwing off per context
utilization calculations that rely on the context switching out. The
utilization counters are used by MangoHud to overlay GPU utilization on
screen.

Hold off on enabling lite restore until we find a better way to
accomodate lite restore with per context utilization counters.

This reverts commit 6ef3bb60557d5e7f5af442c8c9ef0a9190bf3d23.

Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4532
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c      | 2 +-
 drivers/gpu/drm/xe/xe_guc_fwif.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index c5aace59b62c..97c4ffc63302 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -80,7 +80,7 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
 
 static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 {
-	u32 flags = GUC_CTL_ENABLE_LITE_RESTORE;
+	u32 flags = 0;
 
 	if (!guc_to_xe(guc)->info.skip_guc_pc)
 		flags |= GUC_CTL_ENABLE_SLPC;
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 6f57578b07cb..4a7d6fe95a05 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -106,7 +106,6 @@ struct guc_update_exec_queue_policy {
 
 #define GUC_CTL_FEATURE			2
 #define   GUC_CTL_ENABLE_SLPC		BIT(2)
-#define   GUC_CTL_ENABLE_LITE_RESTORE	BIT(4)
 #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
 
 #define GUC_CTL_DEBUG			3
-- 
2.43.0

