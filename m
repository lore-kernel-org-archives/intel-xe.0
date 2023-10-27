Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E439C25B6E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 22:29:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5381610EA60;
	Fri, 27 Oct 2023 22:29:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC78410EA5E
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 22:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698445787; x=1729981787;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T7F4bRF8w55VCBfDNpPALds48EWb+9jqeEwJjBesTAs=;
 b=a8lDzruJ66FxH6EV+P8UXZdK5Ch1GIC6mYgDHq9R+vQJAKk6kblShoQB
 QJKCvb1r99nrptHF3vedEmOHtwlWqBtrdNM8k8gBT2aSDmvE9+F36zJ2q
 fQzWzxWLi1/vHplDPdtyQtTnMCJepb0u9vveI1JHUdFIRLknmoxrELRxu
 rQMk8mXSVp9b+guRAHym3OxRp9fIFHiZ/plSRE1TKMwAjDM2L6oZYZ4nC
 DUf0xJxB8bnbC55ImtSmeRN5WaHZIUn+gZGL2f/Ej8t5R3sq8xcQoJjSQ
 7i+lI8KoFue1QWiYcvv3u1I4jf3BokwjHGkJqhx5jpoWYQsG+eIXV3lin g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="9397792"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="9397792"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 15:29:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="763360384"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; d="scan'208";a="763360384"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 15:29:46 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 15:29:25 -0700
Message-ID: <20231027222928.1981633-12-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 11/12] drm/xe/gsc: Define GSCCS for MTL
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

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci.c       |  2 +-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b5b084590888..142783177e45 100644
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
index 2fae45b9d88e..c09b51735ee4 100644
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

