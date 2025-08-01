Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D10C87FDA
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 18:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D6C10E8D7;
	Fri,  1 Aug 2025 18:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Je4z5vFx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A415210E8D7
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 18:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754072044; x=1785608044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lBdPWLdC4Wo+C3N1JVGVFxFVWpJA226RrYuywco/6Bk=;
 b=Je4z5vFxYXSvLUCbodQ7hjvf+3OQmq19+8bems/AuXEDw0JUWDNVNGLR
 u80jWbykBUkGHFK9yBoBXvLjAP7PqClCBJ4A/PBH/PQc5zAzeELvJRCm3
 i64RYparwWcZtFtETuTUIeMmqbzBMABWQ/X8ihp20SqrJ5shqedYYSdEt
 LuO7PZg/8zeqJGlvq55vZf84YFWcmMLIfk9mMiEH81v/V/LiPW/v6LqdI
 Xw2h9I1Y0F+zaqL4lGuZGnaF3oKJtyqBAs/JHm27PgIEnApMwbAMmArmn
 dcIyiTr+UYORyT3khpfvFDWDtZZd+JyGy90lXI9et3Zm0EbZa9T4pEFDP g==;
X-CSE-ConnectionGUID: NbYj/w+8S9WfutaeRRO2LQ==
X-CSE-MsgGUID: FlMPIsgJTyKP5mGSbfP3lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56315556"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56315556"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 11:14:01 -0700
X-CSE-ConnectionGUID: vPLlRYIMSaOPw9xRScZYVA==
X-CSE-MsgGUID: +7eUhL/WQZWJ5GRRRFW2VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163553800"
Received: from mkolod1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 11:14:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/6] drm/xe/kunit: Update struct xe_pci_fake_data step
 declarations
Date: Fri,  1 Aug 2025 20:13:45 +0200
Message-ID: <20250801181350.180780-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801181350.180780-1-michal.wajdeczko@intel.com>
References: <20250801181350.180780-1-michal.wajdeczko@intel.com>
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
---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 4 ++--
 drivers/gpu/drm/xe/tests/xe_pci_test.h | 4 ++--
 drivers/gpu/drm/xe/tests/xe_wa_test.c  | 6 ++++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 9c715e59f030..81bc86647499 100644
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
index c96d1fe34151..a97d42b72d44 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -92,8 +92,10 @@ static int xe_wa_test_init(struct kunit *test)
 		.subplatform = param->subplatform,
 		.graphics_verx100 = param->graphics_verx100,
 		.media_verx100 = param->media_verx100,
-		.graphics_step = param->step.graphics,
-		.media_step = param->step.media,
+		.step = {
+			.graphics = param->step.graphics,
+			.media = param->step.media,
+		},
 	};
 	struct xe_device *xe;
 	struct device *dev;
-- 
2.47.1

