Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD37BC52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 10:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A943B88EA1;
	Mon, 12 Aug 2024 10:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sk4Lr2wH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD45E88EA1
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 10:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723458644; x=1754994644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5dkG2dQqmxiM+Es/uyYRiC/7JRrrJ/RKIZVHK+Frn7g=;
 b=Sk4Lr2wHgFoIiw5kTbupvT6RGV5ngqppmEwphteCsgwX+DUiPI9Gwe8b
 q3jMZZYjdjK9h04bUtcCTG/o5CYWKfHG/7I6FMDk6YnDwV0qfA3b7zkE7
 g40x8DEA4gCM4YWbXTrcU3ov9RzobAl+z7tErbjNEqgh0jOKnG+XgHS0h
 PLFrnfLY2CkhM7/b/PobTRaD3mZzkd4GMEl2uyAIwCbASODjmkfbOcJJm
 qiFNPP1DTE4fXbS0Ce1Qr/fPp+alkLgqhfeG6o9JzMXMsLLTq8UeIPmqU
 9CEYwYpxE9PN0Bb6s3tI3wizvHwI61RkHF9cB89ZfO5AHiG62xnF12CU8 w==;
X-CSE-ConnectionGUID: wK/DTtCRT6Ckhg2zlLSQTQ==
X-CSE-MsgGUID: xkc050ubTSaMqBwQz1U3Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21439101"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="21439101"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 03:30:43 -0700
X-CSE-ConnectionGUID: ekANj+DfQhm0bt71KPIrHg==
X-CSE-MsgGUID: MV2YjGR/SZOIhAq98CRRzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="62876583"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.117])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 03:30:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, Gustavo Sousa <gustavo.sousa@intel.com>,
 jani.nikula@intel.com
Subject: [PATCH 3/3] drm/xe: add kdev_to_xe_device() helper and use it
Date: Mon, 12 Aug 2024 13:30:21 +0300
Message-Id: <38c80846e70c7e410850530426384e17cff9d031.1723458544.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1723458544.git.jani.nikula@intel.com>
References: <cover.1723458544.git.jani.nikula@intel.com>
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

There are enough users for kernel device to xe device conversion, add a
helper for it.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h    | 5 +++++
 drivers/gpu/drm/xe/xe_gsc_proxy.c | 9 ++-------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index db6cc8d0d6b8..2c96f1b2aafd 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -15,6 +15,11 @@ static inline struct xe_device *to_xe_device(const struct drm_device *dev)
 	return container_of(dev, struct xe_device, drm);
 }
 
+static inline struct xe_device *kdev_to_xe_device(struct device *kdev)
+{
+	return dev_get_drvdata(kdev);
+}
+
 static inline struct xe_device *pdev_to_xe_device(struct pci_dev *pdev)
 {
 	return pci_get_drvdata(pdev);
diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index aa812a2bc3ed..28e6a7a1d282 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -62,11 +62,6 @@ gsc_to_gt(struct xe_gsc *gsc)
 	return container_of(gsc, struct xe_gt, uc.gsc);
 }
 
-static inline struct xe_device *kdev_to_xe(struct device *kdev)
-{
-	return dev_get_drvdata(kdev);
-}
-
 bool xe_gsc_proxy_init_done(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
@@ -345,7 +340,7 @@ void xe_gsc_proxy_irq_handler(struct xe_gsc *gsc, u32 iir)
 static int xe_gsc_proxy_component_bind(struct device *xe_kdev,
 				       struct device *mei_kdev, void *data)
 {
-	struct xe_device *xe = kdev_to_xe(xe_kdev);
+	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
 	struct xe_gt *gt = xe->tiles[0].media_gt;
 	struct xe_gsc *gsc = &gt->uc.gsc;
 
@@ -360,7 +355,7 @@ static int xe_gsc_proxy_component_bind(struct device *xe_kdev,
 static void xe_gsc_proxy_component_unbind(struct device *xe_kdev,
 					  struct device *mei_kdev, void *data)
 {
-	struct xe_device *xe = kdev_to_xe(xe_kdev);
+	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
 	struct xe_gt *gt = xe->tiles[0].media_gt;
 	struct xe_gsc *gsc = &gt->uc.gsc;
 
-- 
2.39.2

