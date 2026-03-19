Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F90109192B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 22:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6473B10E9D5;
	Thu, 19 Mar 2026 22:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZmtbchF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7098F10E9C6
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 22:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773959445; x=1805495445;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=MHtiKT5XEZ9YH17ajrgQwEtRmOoEbqsLGsJEXP835uM=;
 b=mZmtbchFOWd/CUT3U4fB8id0Zr3EGZhsFVJZINYb3GyFSQ2UBttXbKLM
 /Z9PLSbOzPaUrYirQK9QP7q3fviIg0LNZ/rpI55XZcHoqGvzGN//xNfrA
 bQVJQcr+8FEUq0Oh8vD6iFEAn+W4mvwo3DBGgZKRqg7iWVBiCV4CjnOxX
 9rjBpqovXvvkpVIEv3ZdjXD4xF2ACheE33pU6WvXZ/e2OKbzPlBwhhyCm
 6N8RKELQDhqJ1cJ26jxA1axkm+zhHwrFqc4cPyqMs6lnqfxmS53+1ai7S
 bTKrmK3OZEyREeiw8+eyhZsFPElU1Hw6ZB3G1+PtK+9gBiZnGMRsIXU6V w==;
X-CSE-ConnectionGUID: E3QFOPrMQrmxvCoWgKA++A==
X-CSE-MsgGUID: DpVNKUVmQaifKiZeWd83AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78950284"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="78950284"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 15:30:45 -0700
X-CSE-ConnectionGUID: tFpPN0u4QZqYPCx+GZGDBA==
X-CSE-MsgGUID: SdHfQI24SwKFUPwKtrjCDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="222210639"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 15:30:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 19 Mar 2026 15:30:34 -0700
Subject: [PATCH] drm/xe: Implement recent spec updates to Wa_16025250150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-wa_16025250150_part2-v1-1-46b1de1a31b2@intel.com>
X-B4-Tracking: v=1; b=H4sIAAp5vGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0NL3fLEeEMzAyNTI1MDQ1OD+ILEohIjXRNzs2Qz82QjczMTCyWg1oK
 i1LTMCrCx0bG1tQAGlBUZZgAAAA==
X-Change-ID: 20260319-wa_16025250150_part2-476c67c27648
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2084;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=MHtiKT5XEZ9YH17ajrgQwEtRmOoEbqsLGsJEXP835uM=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpvHkUxA4wzaFbElXf4SuWxmLNA2+PKCD7yGH92
 9NMOcK0ho2JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCabx5FAAKCRBNeSQFyHKQ
 BBCXD/9JNRGqNHQyPOppJg3m5chrL5XFNZsPVh5rZxnsT+3maqFFQzQPoxCq6w6xEpXWngF4yez
 z1LSxXwil+yqkl5ptvxurGUKg/FK+IngMTEMsl1/82rJqFxOslwepB1C/P2yq6tWkEpOfRGANNb
 lg45RWm0J2E6iNWLLSB85Z1wdwWtR0DjhSSeUbAq5YhhrOMj34+rESRvQr8TkpQ0mimk81NATw3
 ZOdrxYyYXZ3KTkS331JNh/JKhFr9eDmOMWIVxhwfxcdu0hmpBnl5gOOIAOQ3GIXKXiuxgHoYzPf
 HVs65Os+ILCuX4omjUiYwxXyOQUvVjznElL72V6gx4rZAl6MQ5J/AJ8HWx5JP3mKRHEJ4gaVwwf
 5aFkm7eozDNsj/d61OD2aJsR7HjawsEwqVjv3EASPBf1u+ixuXAFuVAdgmO/XZdYf7S1IWJyd53
 HBca2OpKi4oTCZfUCgy26Go+93sNUB7I8uly5MMtEBtlLsjmzbjM23ol3fouciAdQA5MT6n9Ebe
 TLhUgABgxJJ0cM78jPwGD/gIa+7yahtfWqcOTgxq44YQ4S1kT2oMt16bqTb1jM8wqUIAn7WEAdH
 vojk24O+FbBUG+0bzBuOzGmVzUJdPlORcDC6N/Td2IV2C9s7rc3gpKuh65P+USLhLGA0aqrPPvk
 I6RUW910HqxYM/g==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

The hardware teams noticed that the originally documented workaround
steps for Wa_16025250150 may not be sufficient to fully avoid a hardware
issue.  The workaround documentation has been augmented to suggest
programming one additional register; make the corresponding change in
the driver.

Fixes: 7654d51f1fd8 ("drm/xe/xe2hpg: Add Wa_16025250150")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 84b80e83ac460b0af3777741ef02b15da707a4a6..4ebaa0888a433b4423e0180aa196f66c5dfa71c0 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -578,6 +578,7 @@
 #define   ENABLE_SMP_LD_RENDER_SURFACE_CONTROL	REG_BIT(44 - 32)
 #define   FORCE_SLM_FENCE_SCOPE_TO_TILE		REG_BIT(42 - 32)
 #define   FORCE_UGM_FENCE_SCOPE_TO_TILE		REG_BIT(41 - 32)
+#define   L3_128B_256B_WRT_DIS			REG_BIT(40 - 32)
 #define   MAXREQS_PER_BANK			REG_GENMASK(39 - 32, 37 - 32)
 #define   DISABLE_128B_EVICTION_COMMAND_UDW	REG_BIT(36 - 32)
 #define   LSCFE_SAME_ADDRESS_ATOMICS_COALESCING_DISABLE	REG_BIT(35 - 32)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 8c55cd187a0c2f17f1d6ed0ef2f9c7a87913a840..430fab6ae1d9abfccc36ffda1e8b88419587b901 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -260,7 +260,8 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 				   LSN_DIM_Z_WGT_MASK,
 				   LSN_LNI_WGT(1) | LSN_LNE_WGT(1) |
 				   LSN_DIM_X_WGT(1) | LSN_DIM_Y_WGT(1) |
-				   LSN_DIM_Z_WGT(1)))
+				   LSN_DIM_Z_WGT(1)),
+			SET(LSC_CHICKEN_BIT_0_UDW, L3_128B_256B_WRT_DIS))
 	},
 
 	/* Xe3_LPG */

---
base-commit: 242f4d8af4c4708eabb93e79949d45caec8d4354
change-id: 20260319-wa_16025250150_part2-476c67c27648

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

