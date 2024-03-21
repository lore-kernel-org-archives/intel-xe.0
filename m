Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34715C54E68
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 05:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D986910F681;
	Thu, 21 Mar 2024 05:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9M5gGuQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188B810F86D
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 05:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711000039; x=1742536039;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T5dvzdiT0oIWjcyca5tZs8Q0038OhVkfrY0CfJUq11g=;
 b=h9M5gGuQt48BOWLNXp4FRhE8ycXsKkIjnZUcUZe5nMQpvZtf+fSjs8bj
 0jKKhBwbIM8nzb0Pz3rM9ZqLyhvb/YLA0UJrPCiebIQPvh53e2v0M5CM2
 y0FLGm1EcmKDAT6k5QeeSfxGU0/0Qgv8/vJ5vbGpzXyTPp9AECYUDg5XQ
 VaQSUUj+dPYt1UfznVOR8jId2BsOXczJGIxoRJ8vmrIO3KzGtv7bO0LVk
 F1Kfyqm0+R+C03sTJeu2qaAOdZAPeZe3mkgYcIHrNUg45VRDA7ZfT1DGI
 nNndZJzZ/i3lREe9JSCj5HgpywCbtPEFlfE+L95iqQka7uzpvj4rVL99+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="17417265"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="17417265"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 22:47:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="18966051"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 22:47:18 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, stuart.summers@intel.com, matthew.brost@intel.com
Subject: [PATCH] drm/xe: Use FIELD_PREP for lrc descriptor
Date: Wed, 20 Mar 2024 22:47:15 -0700
Message-ID: <20240321054715.10440-1-niranjana.vishwanathapura@intel.com>
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 95e0f7b1ec3f..f07ee9d8b856 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -26,13 +26,13 @@
 #include "xe_sriov.h"
 #include "xe_vm.h"
 
-#define LRC_VALID				(1 << 0)
-#define LRC_PRIVILEGE				(1 << 8)
-#define LRC_ADDRESSING_MODE_SHIFT		3
+#define LRC_VALID				BIT(0)
+#define LRC_PRIVILEGE				BIT(8)
+#define LRC_ADDRESSING_MODE			GENMASK(4, 3)
 #define LRC_LEGACY_64B_CONTEXT			3
 
-#define ENGINE_CLASS_SHIFT			61
-#define ENGINE_INSTANCE_SHIFT			48
+#define LRC_ENGINE_CLASS			GENMASK(63, 61)
+#define LRC_ENGINE_INSTANCE			GENMASK(53, 48)
 
 struct xe_lrc_snapshot {
 	struct xe_bo *lrc_bo;
@@ -797,19 +797,19 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (xe->info.has_asid && vm)
 		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
 
-	lrc->desc = LRC_VALID;
-	lrc->desc |= LRC_LEGACY_64B_CONTEXT << LRC_ADDRESSING_MODE_SHIFT;
+	lrc->desc = FIELD_PREP(LRC_VALID, 1);
+	lrc->desc |= FIELD_PREP(LRC_ADDRESSING_MODE, LRC_LEGACY_64B_CONTEXT);
 	/* TODO: Priority */
 
 	/* While this appears to have something about privileged batches or
 	 * some such, it really just means PPGTT mode.
 	 */
 	if (vm)
-		lrc->desc |= LRC_PRIVILEGE;
+		lrc->desc |= FIELD_PREP(LRC_PRIVILEGE, 1);
 
 	if (GRAPHICS_VERx100(xe) < 1250) {
-		lrc->desc |= (u64)hwe->instance << ENGINE_INSTANCE_SHIFT;
-		lrc->desc |= (u64)hwe->class << ENGINE_CLASS_SHIFT;
+		lrc->desc |= FIELD_PREP(LRC_ENGINE_INSTANCE, hwe->instance);
+		lrc->desc |= FIELD_PREP(LRC_ENGINE_CLASS, hwe->class);
 	}
 
 	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
-- 
2.43.0

