Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6ABC87FC9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 05:49:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A7010E035;
	Wed, 30 Jul 2025 05:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGoXSwOt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889E410E035
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 05:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753854585; x=1785390585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SFvMWgGxo3VeYNN6mc2msDel1A3436uB8p3mBSSWZTo=;
 b=dGoXSwOthTSSA30cPJ7cCgHpnufsB6QvpPnCqoy/+OXIwYGjdo6O/k1o
 xyYoAzOLll6snwIuxnlJU5BnxMMpoq4EPrc6d5/NLJXZadu1ag1Fv1zoV
 v8PWCErtNwLSglxddCITiYKmn7mE9lBMImuMUybcpsSFaW3Lw9Mr6KwZz
 H3q3mP6xsN8t2075inMWkGHL8XJQA4VApqL1ahJl8BDBWcI9BtHNm0hci
 JvydSLM60qiDbIQAk48aXRFy6vr55dcGKsUD/uaWbGQ9pL5DzB4LiCZWv
 oTW9F9/Q8ATpskvwIu8cnxAHc5tp/9JL9dDX4+O2t/76GyMUwdn8XGJNx Q==;
X-CSE-ConnectionGUID: 63+M5rnMS06YIsEn38e27Q==
X-CSE-MsgGUID: AX+R5YgJTBmNE0WxlYN0ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55215617"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55215617"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 22:49:45 -0700
X-CSE-ConnectionGUID: qbA5iMdBTJ+Am74tl9IyYg==
X-CSE-MsgGUID: 73xf3teMQ+6rZX6inzy4hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163240262"
Received: from aravind-dev.iind.intel.com ([10.190.239.36])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 22:49:42 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 himal.prasad.ghimiray@intel.com, anshuman.gupta@intel.com
Subject: [PATCH 08/10] drm/xe: Handle MDFI error severity.
Date: Wed, 30 Jul 2025 11:18:12 +0530
Message-Id: <20250730054814.1376770-9-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com>
References: <20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com>
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

From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

NONFATAL and FATAL MDFI(T2T/T2C) errors are reported by same IEH
register and bits (Bit 4 and Bit 6 of 0x282280). To determine the
severity read local first error header log register (0x2822b0).
Value 0x00330000 ensures severity is fatal and 0x00310000 is for NONFATAL
errors. This register doesn't need explicit clearing, clearing MDFI
bit in IEH reg will clear this register too. Incase of nonfatal value
being reported by status register in fatal flow don't clean the MDFI IEH
bit and continue. Same needs to be addressed if value read by status
register is fatal in nonfatal flow.

v2
- Add commit message.

Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  9 +++++++++
 drivers/gpu/drm/xe/xe_hw_error.c             | 16 ++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
index 31604138d511..77d397e650e5 100644
--- a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
@@ -38,6 +38,8 @@
 #define SOC_LOCAL_ERR_STAT_MASTER_REG(base, x)		XE_REG((x) > HARDWARE_ERROR_CORRECTABLE ? \
 								(base) + _SOC_LERRUNCSTS : \
 								(base) + _SOC_LERRCORSTS)
+#define   MDFI_T2T                                     4
+#define   MDFI_T2C                                     6
 
 
 #define _DEV_ERR_STAT_NONFATAL                         0x100178
@@ -50,6 +52,13 @@
 #define   XE_SOC_ERROR                                 16
 
 #define SOC_PVC_BASE	                               0x282000
+
+#define LOCAL_FIRST_IEH_HEADER_LOG_REG		       XE_REG(0x2822b0)
+#define MDFI_SEVERITY_FATAL		               0x00330000
+#define MDFI_SEVERITY_NONFATAL		               0x00310000
+#define MDFI_SEVERITY(x)			       ((x) == HARDWARE_ERROR_FATAL ? \
+							       MDFI_SEVERITY_FATAL : \
+							       MDFI_SEVERITY_NONFATAL)
 #define SOC_PVC_SLAVE_BASE                             0x283000
 
 #define PVC_GSC_HECI1_BASE                             0x284000
diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 705a670f01fc..690b7df7ccba 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -614,7 +614,7 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
 	unsigned long mst_glb_errstat, slv_glb_errstat, lcl_errstat;
 	struct hardware_errors_regs *err_regs;
-	u32 errbit, base, slave_base;
+	u32 errbit, base, slave_base, ieh_header;
 	int i;
 
 	struct xe_gt *gt = tile->primary_gt;
@@ -682,9 +682,21 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 			"Tile%d reported SOC_LOCAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n",
 			tile->id, lcl_errstat);
 
-		for_each_set_bit(errbit, &lcl_errstat, XE_RAS_REG_SIZE)
+		for_each_set_bit(errbit, &lcl_errstat, XE_RAS_REG_SIZE) {
+			if (errbit == MDFI_T2T || errbit == MDFI_T2C) {
+				ieh_header = xe_mmio_read32(&gt->tile->mmio, LOCAL_FIRST_IEH_HEADER_LOG_REG);
+				drm_info(&tile_to_xe(tile)->drm, HW_ERR "Tile%d LOCAL_FIRST_IEH_HEADER_LOG_REG:0x%08x\n",
+					 tile->id, ieh_header);
+
+				if (ieh_header != MDFI_SEVERITY(hw_err)) {
+					lcl_errstat &= ~REG_BIT(errbit);
+					continue;
+				}
+			}
+
 			xe_soc_log_err_update_cntr(tile, hw_err, errbit,
 						   err_regs->soc_mstr_lcl[hw_err]);
+		}
 
 		xe_mmio_write32(&gt->tile->mmio, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err), lcl_errstat);
 	}
-- 
2.25.1

