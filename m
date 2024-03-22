Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E739C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 19:15:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6ECA10F1CA;
	Fri, 22 Mar 2024 19:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HasF44t5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B7A10F0E2
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 19:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711134899; x=1742670899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ftkRoRr55CECEsAD706SVeLGE0xvZyIqF23jY2A2eHQ=;
 b=HasF44t5URB9KH6UEZnFxxf9eUtxDhkKxg3UpRi7HYATMyoDUEdNGRUA
 wyKxPOyxovpJx6eNrCxeyy1cPyDEkVRbidfoDg6Rqh2K1cdzylfpecmRt
 up5xKvz/7k+/2LOkM5WsSUT/kvDHeGfkoCvNgRW115iejNh/8HE1vhO6x
 W8Ilz0Pl562L0+SAMbq2y8SwEB9kmBwmd52FGd9jz5ztQXFwZ3tq5qGEa
 TK/LleooE+NTIOBIPnOOWHg2cWH3foRuCvrwB7sReAEtzVQIk1tijQler
 AqkE4yn4OI2zuDpcbrdEGi8UwFC6HgnZuAnLjaIF9SCFZYwpwFBG6zJCA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="31637541"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="31637541"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 12:14:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="15041101"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 12:14:58 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com
Subject: [PATCH v3] drm/xe: Use FIELD_PREP for lrc descriptor
Date: Fri, 22 Mar 2024 12:14:55 -0700
Message-ID: <20240322191455.7613-1-niranjana.vishwanathapura@intel.com>
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

Use FIELD_PREP for setting lrc descriptor fields instead
of shifting values to fields.

v2: Use ULL macro variants
v3: Do not use FIELD_PREP for 1-bit values

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index db0793273de0..2ba111b89a47 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -26,13 +26,13 @@
 #include "xe_sriov.h"
 #include "xe_vm.h"
 
-#define LRC_VALID				(1 << 0)
-#define LRC_PRIVILEGE				(1 << 8)
-#define LRC_ADDRESSING_MODE_SHIFT		3
+#define LRC_VALID				BIT_ULL(0)
+#define LRC_PRIVILEGE				BIT_ULL(8)
+#define LRC_ADDRESSING_MODE			GENMASK_ULL(4, 3)
 #define LRC_LEGACY_64B_CONTEXT			3
 
-#define ENGINE_CLASS_SHIFT			61
-#define ENGINE_INSTANCE_SHIFT			48
+#define LRC_ENGINE_CLASS			GENMASK_ULL(63, 61)
+#define LRC_ENGINE_INSTANCE			GENMASK_ULL(53, 48)
 
 struct xe_lrc_snapshot {
 	struct xe_bo *lrc_bo;
@@ -796,7 +796,7 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
 
 	lrc->desc = LRC_VALID;
-	lrc->desc |= LRC_LEGACY_64B_CONTEXT << LRC_ADDRESSING_MODE_SHIFT;
+	lrc->desc |= FIELD_PREP(LRC_ADDRESSING_MODE, LRC_LEGACY_64B_CONTEXT);
 	/* TODO: Priority */
 
 	/* While this appears to have something about privileged batches or
@@ -806,8 +806,8 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		lrc->desc |= LRC_PRIVILEGE;
 
 	if (GRAPHICS_VERx100(xe) < 1250) {
-		lrc->desc |= (u64)hwe->instance << ENGINE_INSTANCE_SHIFT;
-		lrc->desc |= (u64)hwe->class << ENGINE_CLASS_SHIFT;
+		lrc->desc |= FIELD_PREP(LRC_ENGINE_INSTANCE, hwe->instance);
+		lrc->desc |= FIELD_PREP(LRC_ENGINE_CLASS, hwe->class);
 	}
 
 	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
-- 
2.43.0

