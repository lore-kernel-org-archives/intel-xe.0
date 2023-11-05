Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D76CC4332F
	for <intel-xe@archiver.kernel.org>; Sun,  5 Nov 2023 10:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B517510E0E6;
	Sun,  5 Nov 2023 10:58:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF8D10E0E6
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Nov 2023 10:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699181907; x=1730717907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vLlJCuiq03JXDoHD9gLL1FUuJopSkqfWqd3J7ZQTsFQ=;
 b=RKjTQZjD4fwRPhosxwMdlHUSKyXy1LQXkJ72bPJZhccujGs9W7uP5FuZ
 7z5bPMS4U5WNRYhziMvK9+/dH0RILSAZLfyrQ0jYQ5th3joRUDOdLyE9B
 alwA3na7PNq1IrwdwUMHs/WNrwwmYndMXR3IEp17pjU96lXtmjb4xT1Vf
 SwcZA6TYvaPwmQtBFcwD9fHGRDCVCWx6U4IlLcvoU5BKnfPSZc+zOmkPQ
 vGpqNp6kk3kO8moDwoTfAhOCjsXPZc4N2JI992l7rUvumZbXjfO/BfzdD
 VbYBokNbNERsnB7XNUP7YGEwkEzUGAI2N6S3gUB0uxvjTzrQ0623iENfg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="379531562"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; d="scan'208";a="379531562"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 02:58:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="935541561"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; d="scan'208";a="935541561"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 02:58:25 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Sun,  5 Nov 2023 12:53:06 +0200
Message-Id: <20231105105307.3710560-2-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231105105307.3710560-1-alexander.usyskin@intel.com>
References: <20231105105307.3710560-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/gsc: enable pvc support
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
Cc: Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Configure and enable PVC HECI GSC support.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h |  1 +
 drivers/gpu/drm/xe/xe_heci_gsc.c  | 11 ++++++++++-
 drivers/gpu/drm/xe/xe_pci.c       |  1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index a646d13af03a..ec9372aa739f 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -35,6 +35,7 @@
 #define XEHPC_BCS8_RING_BASE			0x3ee000
 
 #define DG1_GSC_HECI2_BASE                      0x00259000
+#define PVC_GSC_HECI2_BASE                      0x00285000
 #define DG2_GSC_HECI2_BASE                      0x00374000
 
 #define GSCCS_RING_BASE				0x11a000
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index 3328ddca42d0..d8e982e3d9a2 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -70,6 +70,13 @@ static const struct heci_gsc_def heci_gsc_def_dg2 = {
 	.bar_size = GSC_BAR_LENGTH,
 };
 
+static const struct heci_gsc_def heci_gsc_def_pvc = {
+	.name = "mei-gscfi",
+	.bar = PVC_GSC_HECI2_BASE,
+	.bar_size = GSC_BAR_LENGTH,
+	.slow_firmware = true,
+};
+
 static void heci_gsc_release_dev(struct device *dev)
 {
 	struct auxiliary_device *aux_dev = to_auxiliary_dev(dev);
@@ -172,7 +179,9 @@ void xe_heci_gsc_init(struct xe_device *xe)
 
 	heci_gsc->irq = -1;
 
-	if (xe->info.platform == XE_DG2) {
+	if (xe->info.platform == XE_PVC) {
+		def = &heci_gsc_def_pvc;
+	} else if (xe->info.platform == XE_DG2) {
 		def = &heci_gsc_def_dg2;
 	} else if (xe->info.platform == XE_DG1) {
 		def = &heci_gsc_def_dg1;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2fae45b9d88e..682ba188e456 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -315,6 +315,7 @@ static const struct xe_device_desc pvc_desc = {
 	PLATFORM(XE_PVC),
 	.has_display = false,
 	.require_force_probe = true,
+	.has_heci_gscfi = 1,
 };
 
 static const struct xe_device_desc mtl_desc = {
-- 
2.34.1

