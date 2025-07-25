Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F30AC87FCE
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 19:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B68B10E02C;
	Fri, 25 Jul 2025 19:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Be0i+60H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456E210E02C
 for <Intel-Xe@lists.freedesktop.org>; Fri, 25 Jul 2025 19:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753470696; x=1785006696;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1NyH7CHq3qyvgbWUQFo716TmaUbjjA/Bl/7EgRfplR4=;
 b=Be0i+60HoCkY9UgwsJznPOEj25LySL7mjxACgi0FUcvXvuM/dfjtxlLA
 uNdBTpVYPi72KvmyFSfqcbK3yhAHv8M7GirWBHpX+yT2QsfnhBOhipJcb
 fOfDRTBFRqmtDVVtBjWRuaBWHi9iot5oCFK7LzCBtIC9o1xA8gbAS945/
 O6ZKn5AAvxj2+vrS0yO8xjSKZdUKEYIjsAxo1uV2oB4fgR3koW5WmN0rG
 A1X5v0Q0NPZk2GhMa4S0SzkSiQet/MUk+gk0EHzS57nTDfCiCuytsiESS
 bociSG/5mQPz5lG16exrjOt9Bczm7DHrwew4M/o7pWs5665BrxOvwFBUr A==;
X-CSE-ConnectionGUID: /kVhA5JoT7iZci70kHwYPA==
X-CSE-MsgGUID: DPDjnVEASSKxQ3JGgf/xfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="59634526"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="59634526"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 12:11:33 -0700
X-CSE-ConnectionGUID: z04msVzPSt+3rtuvf9ezNg==
X-CSE-MsgGUID: sDh+GPmvQj69Ko26NlfQag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166566930"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa005.jf.intel.com with ESMTP; 25 Jul 2025 12:11:32 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/guc: Add more GuC load error status codes
Date: Fri, 25 Jul 2025 12:11:32 -0700
Message-ID: <20250725191132.4008357-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

The GuC load process will abort if certain status codes (which are
indicative of a fatal error) are reported. Otherwise, it keeps waiting
until the 'success' code is returned. New error codes have been added
in recent GuC releases, so add support for aborting on those as well.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/abi/guc_errors_abi.h |  3 +++
 drivers/gpu/drm/xe/xe_guc.c             | 11 +++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
index ecf748fd87df..ad76b4baf42e 100644
--- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
@@ -63,6 +63,7 @@ enum xe_guc_load_status {
 	XE_GUC_LOAD_STATUS_HWCONFIG_START                   = 0x05,
 	XE_GUC_LOAD_STATUS_HWCONFIG_DONE                    = 0x06,
 	XE_GUC_LOAD_STATUS_HWCONFIG_ERROR                   = 0x07,
+	XE_GUC_LOAD_STATUS_BOOTROM_VERSION_MISMATCH         = 0x08,
 	XE_GUC_LOAD_STATUS_GDT_DONE                         = 0x10,
 	XE_GUC_LOAD_STATUS_IDT_DONE                         = 0x20,
 	XE_GUC_LOAD_STATUS_LAPIC_DONE                       = 0x30,
@@ -75,6 +76,8 @@ enum xe_guc_load_status {
 	XE_GUC_LOAD_STATUS_INVALID_INIT_DATA_RANGE_START,
 	XE_GUC_LOAD_STATUS_MPU_DATA_INVALID                 = 0x73,
 	XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID   = 0x74,
+	XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR        = 0x75,
+	XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG                 = 0x76,
 	XE_GUC_LOAD_STATUS_INVALID_INIT_DATA_RANGE_END,
 
 	XE_GUC_LOAD_STATUS_READY                            = 0xF0,
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 1ca7f4f27e26..315ef74bb5ff 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -992,11 +992,14 @@ static int guc_load_done(u32 status)
 	case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
 	case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
 	case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
+	case XE_GUC_LOAD_STATUS_BOOTROM_VERSION_MISMATCH:
 	case XE_GUC_LOAD_STATUS_DPC_ERROR:
 	case XE_GUC_LOAD_STATUS_EXCEPTION:
 	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
 	case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
 	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
+	case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
+	case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
 		return -1;
 	}
 
@@ -1146,6 +1149,14 @@ static void guc_wait_ucode(struct xe_guc *guc)
 			xe_gt_err(gt, "illegal register in save/restore workaround list\n");
 			break;
 
+		case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
+			xe_gt_err(gt, "illegal workaround KLV data\n");
+			break;
+
+		case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
+			xe_gt_err(gt, "illegal feature flag specified\n");
+			break;
+
 		case XE_GUC_LOAD_STATUS_HWCONFIG_START:
 			xe_gt_err(gt, "still extracting hwconfig table.\n");
 			break;
-- 
2.49.0

