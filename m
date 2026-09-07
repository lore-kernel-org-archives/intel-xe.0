Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0519C79FA0
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 17:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032F610E8AC;
	Mon,  7 Sep 2026 17:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYJY2bfE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3D610E04F;
 Mon,  7 Sep 2026 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788801543; x=1820337543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HejdWYRPFl13PjRjvdT7tsI5Grs8elik5RhhgIsm7eg=;
 b=OYJY2bfEZ3NODqzOndxx/wWOx8rSbcKfnKCP9l/JhILh+qu+DUxbAmfE
 S2ZDIaSG5OU/Su6DGOTzjfksSypJ3Lpy8iNKsU2tb5MD+VnZ1x/eBmBgM
 5c1pkbP6dOFGM4DRFWcdswsPSD77rBVcNER/+tUOzD/s8qTITZ5z+K+ft
 J7fJ8Qzq3lQ1BbMFzl5htBiszvel2cyQmRdcpXTaQ/foy/TtqaYXcAJRX
 N3YnAn+UhOm53Sm6eVxJvXANejQAFlVd6Ex1XsUWC4U75n2KzuAEWQxq4
 ztOFKRypdC1QDc9Lb6oow++1ZCSw5XVmA41OH+EZQZIzG4HTtuWOkvyxv g==;
X-CSE-ConnectionGUID: 81qJwOuQQ1uAy8IcGhlRnQ==
X-CSE-MsgGUID: kUa+QdboRW2LYdb0nu6myQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="111980762"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="111980762"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 10:19:03 -0700
X-CSE-ConnectionGUID: xGuFSL6BRcmRiyhDxfDG3Q==
X-CSE-MsgGUID: nkiA/G7nSdaWYRA4zXRauA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="269449168"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 10:19:02 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
	jani.nikula@intel.com
Subject: [PATCH v4 1/2] drm/i915/dmc: Add sanity check for DMC load address
Date: Mon,  7 Sep 2026 22:48:58 +0530
Message-ID: <20260907171856.1484854-5-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907171856.1484854-4-dibin.moolakadan.subrahmanian@intel.com>
References: <20260907171856.1484854-4-dibin.moolakadan.subrahmanian@intel.com>
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

For DMC firmware header version 3, the firmware load address is stored
in dmc_info->start_mmioaddr and later used by dmc_load_program().

Unlike the MMIO address table, the firmware load address is not
validated. Add a sanity check to ensure it is within the valid range.

BSpec: 69671, 68378
Fixes: 3d5928a168a9 ("drm/i915/xelpd: Pipe A DMC plugging")
Cc: stable@vger.kernel.org
Assisted-by: Claude-Code:Sonnet-5
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c      | 79 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dmc_regs.h | 12 +++
 2 files changed, 80 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index a191eee240d9..051b721a0895 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -1023,6 +1023,56 @@ static void dmc_set_fw_offset(struct intel_dmc *dmc,
 	}
 }
 
+/*
+ * Check if the load address is within the valid range for the given DMC ID.
+ */
+static bool dmc_load_addr_sanity_check(struct intel_dmc *dmc,
+				       u32 start_addr, u32 payload_size,
+				       int header_ver, enum intel_dmc_id dmc_id)
+{
+	struct intel_display *display = dmc->display;
+	u32 start_range, end_range, end_addr;
+
+	if (header_ver != 3)
+		return true;
+
+	switch (dmc_id) {
+	case DMC_FW_MAIN:
+		start_range = DMC_MAIN_PROGRAM_BASE_START;
+		end_range = DMC_MAIN_PROGRAM_BASE_END;
+		break;
+	case DMC_FW_PIPEA:
+		start_range = DMC_PIPEA_PROGRAM_BASE_START;
+		end_range = DMC_PIPEA_PROGRAM_BASE_END;
+		break;
+	case DMC_FW_PIPEB:
+		start_range = DMC_PIPEB_PROGRAM_BASE_START;
+		end_range = DMC_PIPEB_PROGRAM_BASE_END;
+		break;
+	case DMC_FW_PIPEC:
+		start_range = DMC_PIPEC_PROGRAM_BASE_START;
+		end_range = DMC_PIPEC_PROGRAM_BASE_END;
+		break;
+	case DMC_FW_PIPED:
+		start_range = DMC_PIPED_PROGRAM_BASE_START;
+		end_range = DMC_PIPED_PROGRAM_BASE_END;
+		break;
+	default:
+		drm_warn(display->drm, "Unknown dmc_id %d for load address sanity check\n", dmc_id);
+		return false;
+	}
+
+	if (payload_size == 0)
+		end_addr = start_addr;
+	else if (check_add_overflow(start_addr, payload_size - 1, &end_addr))
+		return false;
+
+	if (start_addr < start_range || end_addr > end_range)
+		return false;
+
+	return true;
+}
+
 static bool dmc_mmio_addr_sanity_check(struct intel_dmc *dmc,
 				       const u32 *mmioaddr, u32 mmio_count,
 				       int header_ver, enum intel_dmc_id dmc_id)
@@ -1125,6 +1175,24 @@ static u32 parse_dmc_fw_header(struct intel_dmc *dmc,
 		return 0;
 	}
 
+	rem_size -= header_len_bytes;
+
+	/* fw_size is in dwords, so multiplied by 4 to convert into bytes. */
+	payload_size = dmc_header->fw_size * 4;
+	if (rem_size < payload_size)
+		goto error_truncated;
+
+	if (payload_size > dmc->max_fw_size) {
+		drm_err(display->drm, "DMC FW too big (%u bytes)\n", payload_size);
+		return 0;
+	}
+
+	if (!dmc_load_addr_sanity_check(dmc, start_mmioaddr, payload_size,
+					dmc_header->header_ver, dmc_id)) {
+		drm_err(display->drm, "DMC %d: firmware has wrong load address\n", dmc_id);
+		return 0;
+	}
+
 	if (!dmc_mmio_addr_sanity_check(dmc, mmioaddr, mmio_count,
 					dmc_header->header_ver, dmc_id)) {
 		drm_err(display->drm, "DMC firmware has Wrong MMIO Addresses\n");
@@ -1169,17 +1237,6 @@ static u32 parse_dmc_fw_header(struct intel_dmc *dmc,
 	dmc_info->mmio_count = mmio_count;
 	dmc_info->start_mmioaddr = start_mmioaddr;
 
-	rem_size -= header_len_bytes;
-
-	/* fw_size is in dwords, so multiplied by 4 to convert into bytes. */
-	payload_size = dmc_header->fw_size * 4;
-	if (rem_size < payload_size)
-		goto error_truncated;
-
-	if (payload_size > dmc->max_fw_size) {
-		drm_err(display->drm, "DMC FW too big (%u bytes)\n", payload_size);
-		return 0;
-	}
 	dmc_info->dmc_fw_size = dmc_header->fw_size;
 
 	dmc_info->payload = kmalloc(payload_size, GFP_KERNEL);
diff --git a/drivers/gpu/drm/i915/display/intel_dmc_regs.h b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
index 6b7978fb8986..324320afad58 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
@@ -521,6 +521,18 @@ enum pipedmc_event_id {
 #define TGL_PIPE_MMIO_END(dmc_id)	_PICK_EVEN(((dmc_id) - 1), _TGL_PIPEA_MMIO_END,\
 					      _TGL_PIPEB_MMIO_END)
 
+/* For DMC header version v3*/
+#define DMC_MAIN_PROGRAM_BASE_START	0x80000
+#define DMC_MAIN_PROGRAM_BASE_END	0x86fff
+#define DMC_PIPEA_PROGRAM_BASE_START	0x90000
+#define DMC_PIPEA_PROGRAM_BASE_END	0x96fff
+#define DMC_PIPEB_PROGRAM_BASE_START	0x98000
+#define DMC_PIPEB_PROGRAM_BASE_END	0x9efff
+#define DMC_PIPEC_PROGRAM_BASE_START	0x52000
+#define DMC_PIPEC_PROGRAM_BASE_END	0x53fff
+#define DMC_PIPED_PROGRAM_BASE_START	0x59000
+#define DMC_PIPED_PROGRAM_BASE_END	0x5afff
+
 #define SKL_DMC_DC3_DC5_COUNT	_MMIO(0x80030)
 #define SKL_DMC_DC5_DC6_COUNT	_MMIO(0x8002C)
 #define BXT_DMC_DC3_DC5_COUNT	_MMIO(0x80038)
-- 
2.43.0

