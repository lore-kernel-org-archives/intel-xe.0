Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADB8CDB483
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 13:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BAB10E4D8;
	Thu, 19 Oct 2023 13:21:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3636710E4DB
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 13:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697721684; x=1729257684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=25dUQOdoASoDTB/uBnluEZa7YXYF7aMmp7JZ5CXSs9g=;
 b=JkzA/3YhYdWZZIVCDWUvUNfO5GZxOEkqBAJpxezfDk9PeB48jqB6wkGa
 HUYv2sfNUI/pb16y9XxxTbRlimNAJJ/b0VnUiWF1PMCYSoOCL3zektcco
 fPmDKwjWz6aZKTgO+vwESEekyNlJpDAfx7bfXZaY0FZeDM68OUEnbF66q
 HUNk4pRBgdDZ5JgxQg/BaEEwyNVvbYYCS1xva2GTW8b69NEPKNIcaXj/C
 w6bYavxSjV56zGsEaIOeyn+n5ryS00odfVUrU1QktCQtL0JiXPjxtacjQ
 mrRwDp8VYcoQh++osoigQY3Id+BoN9mbTJAjUJk/s/LD+wvEoiU+o7vt+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385124064"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="385124064"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 06:19:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="757028213"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="757028213"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga002.jf.intel.com with ESMTP; 19 Oct 2023 06:19:07 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 19 Oct 2023 18:55:32 +0530
Message-Id: <20231019132534.1374903-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019132534.1374903-1-himal.prasad.ghimiray@intel.com>
References: <20231019132534.1374903-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 09/11] drm/xe: Handle MDFI error severity.
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
index 1b35fe5ee785..235dc93ce274 100644
--- a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
@@ -37,6 +37,8 @@
 #define SOC_LOCAL_ERR_STAT_MASTER_REG(base, x)		XE_REG((x) > HARDWARE_ERROR_CORRECTABLE ? \
 								(base) + _SOC_LERRUNCSTS : \
 								(base) + _SOC_LERRCORSTS)
+#define   MDFI_T2T                                     4
+#define   MDFI_T2C                                     6
 
 
 #define _DEV_ERR_STAT_NONFATAL                         0x100178
@@ -49,6 +51,13 @@
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
index 7c41e51fbb11..9b960292470f 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -629,7 +629,7 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
 	unsigned long mst_glb_errstat, slv_glb_errstat, lcl_errstat;
 	struct hardware_errors_regs *err_regs;
-	u32 errbit, base, slave_base;
+	u32 errbit, base, slave_base, ieh_header;
 	int i;
 
 	struct xe_gt *gt = tile->primary_gt;
@@ -697,9 +697,21 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 			"Tile%d reported SOC_LOCAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n",
 			tile->id, lcl_errstat);
 
-		for_each_set_bit(errbit, &lcl_errstat, XE_RAS_REG_SIZE)
+		for_each_set_bit(errbit, &lcl_errstat, XE_RAS_REG_SIZE) {
+			if (errbit == MDFI_T2T || errbit == MDFI_T2C) {
+				ieh_header = xe_mmio_read32(gt, LOCAL_FIRST_IEH_HEADER_LOG_REG);
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
 
 		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err), lcl_errstat);
 	}
-- 
2.25.1

