Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBB9C54FB9
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 22:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2C710E79F;
	Fri, 17 Nov 2023 22:52:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B6810E781
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 22:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700261538; x=1731797538;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MujPpQfJ2F7yntyb6iWJn2e2KU5SdbpC1YeZbVIqKqw=;
 b=J+l34PPqHaqwOgDKb5jZqlfyN3pNfFa5BAI9Kza7qwEy8wAxk1uHgydC
 ALF+KYsOtzrRsZoaeUA9gG/JIOEsZGVSb+mk8+o3r0IXN5cs/NoXuzyHD
 mAPcr1HruEguusGDdlw3EfNmgIhmUneNcgKvfxKYU2/9Ko/Rqva6yTgf8
 q8fSn6jhdUshOBLlYQpk+rLcAwOxGvQZXxi4mXbynd5G31T/q4eK7gTJF
 LAYltyRYgzGWWaKLhagoE6nNjM4DLYhzr7w+BbGjq/bVn+HQMIx1SfhJ6
 qyWnPrrQuoFxKsGWnU4SJJI8oHYB1xX54HjENi6XP2y1upP3wQihx89EQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="4465552"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="4465552"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 14:52:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="765736138"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="765736138"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 14:52:17 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Nov 2023 14:51:51 -0800
Message-ID: <20231117225155.2614535-10-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231117225155.2614535-1-daniele.ceraolospurio@intel.com>
References: <20231117225155.2614535-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 09/10] drm/xe/gsc: Define GSCCS for MTL
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

Add the GSCCS to the media_xelpmp engine list. Note that since the
GSCCS is only used with the GSC FW, we can consider it disabled if we
don't have the FW available.

v2: mark GSCCS as allowed on the media IP in kunit tests

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci_test.c |  9 +++------
 drivers/gpu/drm/xe/xe_hw_engine.c      | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci.c            |  2 +-
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c b/drivers/gpu/drm/xe/tests/xe_pci_test.c
index 9c6f6c2c6c6e..98ecab51154e 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
@@ -33,13 +33,10 @@ static void check_media_ip(const struct xe_media_desc *media)
 	struct kunit *test = xe_cur_kunit();
 	u64 mask = media->hw_engine_mask;
 
-	/*
-	 * VCS and VECS engines are allowed on the media IP
-	 *
-	 * TODO:  Add GSCCS once support is added to the driver.
-	 */
+	/* VCS, VECS and GSCCS engines are allowed on the media IP */
 	mask &= ~(XE_HW_ENGINE_VCS_MASK |
-		  XE_HW_ENGINE_VECS_MASK);
+		  XE_HW_ENGINE_VECS_MASK |
+		  XE_HW_ENGINE_GSCCS_MASK);
 
 	/* Any remaining engines are an error */
 	KUNIT_ASSERT_EQ(test, mask, 0);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index e831e63c5e48..c52c26c395a7 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -26,6 +26,7 @@
 #include "xe_rtp.h"
 #include "xe_sched_job.h"
 #include "xe_tuning.h"
+#include "xe_uc_fw.h"
 #include "xe_wa.h"
 
 #define MAX_MMIO_BASES 3
@@ -610,6 +611,24 @@ static void read_compute_fuses(struct xe_gt *gt)
 		read_compute_fuses_from_dss(gt);
 }
 
+static void check_gsc_availability(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (!(gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0)))
+		return;
+
+	/*
+	 * The GSCCS is only used to communicate with the GSC FW, so if we don't
+	 * have the FW there is nothing we need the engine for and can therefore
+	 * skip its initialization.
+	 */
+	if (!xe_uc_fw_is_available(&gt->uc.gsc.fw)) {
+		gt->info.engine_mask &= ~BIT(XE_HW_ENGINE_GSCCS0);
+		drm_info(&xe->drm, "gsccs disabled due to lack of FW\n");
+	}
+}
+
 int xe_hw_engines_init_early(struct xe_gt *gt)
 {
 	int i;
@@ -617,6 +636,7 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
 	read_media_fuses(gt);
 	read_copy_fuses(gt);
 	read_compute_fuses(gt);
+	check_gsc_availability(gt);
 
 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 682ba188e456..406b4cd4c88a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -197,7 +197,7 @@ static const struct xe_media_desc media_xelpmp = {
 	.name = "Xe_LPM+",
 	.hw_engine_mask =
 		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
-		BIT(XE_HW_ENGINE_VECS0),	/* TODO: add GSC0 */
+		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_GSCCS0)
 };
 
 static const struct xe_media_desc media_xe2 = {
-- 
2.41.0

