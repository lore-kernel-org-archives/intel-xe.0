Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CADCA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 17:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8552E10E24E;
	Fri, 29 Aug 2025 17:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eNnOzBEL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A8F10E1BF
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 17:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756487988; x=1788023988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lSpdkL+dEYhMBie0L5NdQe/xyzmg8ieXSpI+bRnwfGU=;
 b=eNnOzBELBiZ9OYBRAWDUbZqtRSSYDyTEv2ETsF1LDAGebqrc3g69GfOm
 Q+lbiln6RIRBOXTJl/irEzlf4KEf7uBEOLbgJGIu14EH1gCQ1dIQp4CnF
 pu6rVf30UdjWYcoIqkOpa8455mY77RVcmVUCc+GK8vDxFRbLWyyFu5QPE
 AUkHMe4O1u7gln+4iNz79AIScg0yQISLsQsXeDKtbsJ4u188qdhBJT1wM
 X3dHJ7dWqEvInZ//4HPvAfOVlafmEehAChY82NEwYpoX0Rkz2muuLEpSL
 csSSCLMkdKjz9filuiL+ycEpUthehGp75YX6qifcfwtArjIS3wFmswr8F Q==;
X-CSE-ConnectionGUID: E62YVQjrRM+fZJjYSLevbg==
X-CSE-MsgGUID: OoSJsZOmR3KcqN5FcV6V5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="70212760"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="70212760"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:19:48 -0700
X-CSE-ConnectionGUID: XDapH8PPQnicrNA3X8UwUA==
X-CSE-MsgGUID: ijgAh8ZkSOykZYbRB7foyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170818273"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:19:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 2/7] drm/xe/kunit: Update struct xe_pci_fake_data step
 declarations
Date: Fri, 29 Aug 2025 19:19:17 +0200
Message-ID: <20250829171922.572-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250829171922.572-1-michal.wajdeczko@intel.com>
References: <20250829171922.572-1-michal.wajdeczko@intel.com>
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

The struct xe_pci_fake_data has fields that specify graphics and
media stepping of the fake PCI device used during KUnit testing.

Change definitions of those separate step fields and use existing
struct xe_step_info definition that already have required fields.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: copy whole struct (Lucas)
---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 4 ++--
 drivers/gpu/drm/xe/tests/xe_pci_test.h | 4 ++--
 drivers/gpu/drm/xe/tests/xe_wa_test.c  | 3 +--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index db30c5156d0c..bb0ce0dc9b31 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -94,10 +94,10 @@ static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
 
 	if (type == GMDID_MEDIA) {
 		*ver = data->media_verx100;
-		*revid = xe_step_to_gmdid(data->media_step);
+		*revid = xe_step_to_gmdid(data->step.media);
 	} else {
 		*ver = data->graphics_verx100;
-		*revid = xe_step_to_gmdid(data->graphics_step);
+		*revid = xe_step_to_gmdid(data->step.graphics);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index ce4d2b86b778..32452bd65bff 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -10,6 +10,7 @@
 
 #include "xe_platform_types.h"
 #include "xe_sriov_types.h"
+#include "xe_step_types.h"
 
 struct xe_device;
 
@@ -17,10 +18,9 @@ struct xe_pci_fake_data {
 	enum xe_sriov_mode sriov_mode;
 	enum xe_platform platform;
 	enum xe_subplatform subplatform;
+	struct xe_step_info step;
 	u32 graphics_verx100;
 	u32 media_verx100;
-	u32 graphics_step;
-	u32 media_step;
 };
 
 int xe_pci_fake_device_init(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 416258c193f6..a0de55f09267 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -93,8 +93,7 @@ static int xe_wa_test_init(struct kunit *test)
 		.subplatform = param->subplatform,
 		.graphics_verx100 = param->graphics_verx100,
 		.media_verx100 = param->media_verx100,
-		.graphics_step = param->step.graphics,
-		.media_step = param->step.media,
+		.step = param->step,
 	};
 	struct xe_device *xe;
 	struct device *dev;
-- 
2.47.1

