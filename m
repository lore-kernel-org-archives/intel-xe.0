Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C5BCD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 16:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526F910E3C1;
	Mon, 25 May 2026 16:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mY78h6Sa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B4110E3B7
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 16:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779725140; x=1811261140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5/rheGvWdK/gXvP6EFJ0G9jaxuYrZswL5wXrYj/Griw=;
 b=mY78h6Sa2U/zxWGxi4a0PbdUIk8LWn1EDG1ZuU8t7rXvPCfm3TagpoL1
 oR3CMQu+oFUdVHZ+76URfTSxX7EmAgZgR7ANm4MHyomuSNWduTSgZbGew
 YbuwDN0tXg1JF21Abd5SmPEhIT99Y9y1y2rMhFA09FaF+JVsd0p9HjiEG
 Lmnlflm/SZeSlF30fpvi1XQBYVtAcF5ERP8q2iON5se0edIMevMDGozQ4
 L8J/PkMxQuAaUGrVwSK4dktoKDaig27mu0LH45+l4Ed++78yOgjzbYotU
 lU+37uRqPvZdOenZ9soFIeMtEy0r6PNivTFz15XxR2kXjU3LIhyrH+WZq w==;
X-CSE-ConnectionGUID: oS/MELHWTwyQ9kwkpSc7iQ==
X-CSE-MsgGUID: ASuFFHUaRGedgl/T8kqdpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80275435"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80275435"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 09:05:40 -0700
X-CSE-ConnectionGUID: 2oK4fyyzTDuoIfpuq6Zzig==
X-CSE-MsgGUID: jXOOsX/XTB2kHpwzxr3e0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="235275241"
Received: from gkearney-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.94])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 09:05:39 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/6] drm/xe: Move xe->info.force_execlist initialization
Date: Mon, 25 May 2026 18:05:25 +0200
Message-ID: <20260525160529.15890-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525160529.15890-1-michal.wajdeczko@intel.com>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
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
index c2bf9f0c325b..b1f5f0098f26 100644
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

