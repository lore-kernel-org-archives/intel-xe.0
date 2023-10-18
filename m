Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81929CDB483
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 03:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2D310E369;
	Wed, 18 Oct 2023 03:54:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B01C10E366
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 03:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697601246; x=1729137246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qhJ6Zr35PKUox7RURQjMv8AVjvSNp8iIUuVlCuGgEWw=;
 b=FeBtwAeIQY9jZr4oes++zArcLmUVDUlh6VN7kFqSTySYUljth20YGE3d
 uZdlZc/jXCpsjWVv5Cbl2npiXhB4XJdYfOaAp9UoV4eUL88ezHf0qzXAc
 NGK9MZC1sMoxy9LOSeGk+yA57NGS4n0F8njNve6Sswu6v4FoklRej78ve
 Gol3fVgXOYZuvkPPwh9xZYvYDQxKkwo4rucZleTPkgyEIcS0QsiKHF9ad
 GR5pUD2NOQzi5GSmborxj6WNYlpirYmE/HxCWnLEqe8JlS2dav2edatIw
 Wz1vsrfdvyNte0suPBaSDc7lNn8QSZjSa1+T9rgAr8eMUgOgKJay7Szlp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="389806043"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="389806043"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 20:54:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="4351555"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa001.fm.intel.com with ESMTP; 17 Oct 2023 20:54:09 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 18 Oct 2023 09:30:31 +0530
Message-Id: <20231018040033.1227494-9-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018040033.1227494-1-himal.prasad.ghimiray@intel.com>
References: <20231018040033.1227494-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 08/10] drm/xe: Handle MDFI error severity.
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

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  9 +++++++++
 drivers/gpu/drm/xe/xe_hw_error.c             | 16 ++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
index f5b52932d9ce..20c76e25074f 100644
--- a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
@@ -38,6 +38,8 @@
 #define SOC_LOCAL_ERR_STAT_MASTER_REG(base, x)		XE_REG((x) > HARDWARE_ERROR_CORRECTABLE ? \
 								(base) + _SOC_LERRUNCSTS : \
 								(base) + _SOC_LERRCORSTS)
+#define MDFI_T2T                                       4
+#define MDFI_T2C                                       6
 
 
 #define _DEV_ERR_STAT_NONFATAL                         0x100178
@@ -50,6 +52,13 @@
 #define XE_SOC_ERROR                                   16
 
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
index 8b968b117c18..62b4051c6633 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -636,7 +636,7 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
 {
 	unsigned long mst_glb_errstat, slv_glb_errstat, lcl_errstat;
 	struct hardware_errors_regs *err_regs;
-	u32 errbit, base, slave_base;
+	u32 errbit, base, slave_base, ieh_header;
 	int i;
 
 	struct xe_gt *gt = tile->primary_gt;
@@ -704,9 +704,21 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
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

