Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C24C3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 09:55:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB8710EA25;
	Fri, 16 May 2025 09:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mmBFxzSl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0009010EA25
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 09:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747389320; x=1778925320;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/EBMNax08H2t4QJWAZj9TPs08E4XW9nBurHP7bGTEm4=;
 b=mmBFxzSlKttasT7LTLonRUfVqCpMHZtCTZGojhFVQ8DHbQfk4KY/PNxq
 7d1aaNDiZfeUfLQjfAzxuiMPYvFgAfJj5WxPSlpa/vtetMumkUfywVDch
 yVzh6FH/B34s9FtQr/8WlbbZPtBndrYEkImkMaciojeMUyE2QAwyERcgX
 kYXWPl92Hs1haysbiAm+4ZeCVTv6ac0/UIPC4G+IswJzLUIls9b7Hgx9E
 J9D45MXi/K2sUkJfz+iioiCs/EORpTLdQyMTRZ4sEewNRn2dFTXaWWezk
 4sYNh5MAvXv2gZu4IwXZy1F7OfNOOzpGDEE98fuDnxcz2y5HrAa1DI9B2 g==;
X-CSE-ConnectionGUID: DyXtlQS+S4u7JzDOCi0HEg==
X-CSE-MsgGUID: Xg7LZkaoRCmXP/qlwRdsfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="59586843"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="59586843"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 02:55:20 -0700
X-CSE-ConnectionGUID: wN8yAk+NTY+bERMrw4dowg==
X-CSE-MsgGUID: qPWSLthmQAuxt3qg/c6TQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="143598755"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 02:55:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/xe/display: drop duplicate display->fb_tracking.lock init
Date: Fri, 16 May 2025 12:55:14 +0300
Message-Id: <20250516095514.398320-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

The spinlock is initialized in intel_display_driver_early_probe(). Drop
the extra init.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 699f401eff10..1fcca7acaef4 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -109,8 +109,6 @@ int xe_display_create(struct xe_device *xe)
 
 	xe->display = &xe->__display;
 
-	spin_lock_init(&display->fb_tracking.lock);
-
 	display->hotplug.dp_wq = alloc_ordered_workqueue("xe-dp", 0);
 
 	return drmm_add_action_or_reset(&xe->drm, display_destroy, NULL);
-- 
2.39.5

