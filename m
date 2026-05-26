Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A15ACD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 19:55:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0AB10E499;
	Tue, 26 May 2026 19:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VGB69R1x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258E088C11
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 19:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779825309; x=1811361309;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Ceg1BHV5hnPvMavA19I2ZfQJnKQJUqHpe7n4AdJjGpE=;
 b=VGB69R1xsHOw9zl9jnBhoIpeD5cE+0QhVVGnFW3/IvXeK1zSKS7af2VS
 91c1Z/atN2y5kKUY9XyftVvPDh0Rd4rf7Pc5x9DYSl/SDe9yHBC008dOv
 TodTClBdgTfX1YOItynmy2AekqqRrGevOS8lgO1iUSjrEXnsdGEoDo2bN
 FN6hQ5mx2pfBf6YKXkyqFzbId9kcKE5cTzqZlcKikd8+gtQnlE4a49rjZ
 mZM+F2lmIyC5pValPLXki3886/0FKuZb9+rDGRFwcxQKH3aIi+eX8zZlC
 bkUyXvrbPLkj1qF7tZEIgHS4xzUSOSUPeN3XpTSIwzzyB/GJseQkyCwUo w==;
X-CSE-ConnectionGUID: YdBsklJxS/C1XNqUpBiyAA==
X-CSE-MsgGUID: hjEHlVsKQt6jal27ULC4FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80498762"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="80498762"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:55:09 -0700
X-CSE-ConnectionGUID: 6EjGG4WdR9eYX5wc+lRLoA==
X-CSE-MsgGUID: stSNohT1S2SH1inpkbebSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="239013287"
Received: from adobrzyn-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.151])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:55:08 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 3/7] drm/xe: Move xe->info.force_execlist initialization
Date: Tue, 26 May 2026 21:54:48 +0200
Message-ID: <20260526195452.20545-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526195452.20545-1-michal.wajdeczko@intel.com>
References: <20260526195452.20545-1-michal.wajdeczko@intel.com>
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

The xe_info_init_early() is a place where we initialize those of
the xe->info fields that do not require any additional hardware
probes. Move the initialization of the force_execlist flag there.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 1 -
 drivers/gpu/drm/xe/xe_pci.c    | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3f063e5530bb..cdc7e0935c13 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -523,7 +523,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
 
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
-	xe->info.force_execlist = xe_modparam.force_execlist;
 	xe->atomic_svm_timeslice_ms = 5;
 	xe->min_run_period_lr_ms = 5;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b2484503f432..715e76d72a1a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -778,6 +778,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				 xe_modparam.probe_display &&
 				 desc->has_display;
+	xe->info.force_execlist = xe_modparam.force_execlist;
 
 	xe_assert(xe, desc->max_gt_per_tile > 0);
 	xe_assert(xe, desc->max_gt_per_tile <= XE_MAX_GT_PER_TILE);
-- 
2.47.1

