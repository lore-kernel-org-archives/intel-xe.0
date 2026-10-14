Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748ADCC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 05:53:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F4C10FAE5;
	Wed, 14 Oct 2026 05:52:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0BF10FADC
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 05:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791957171; x=1823493171;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=525wEOLHQFoaa9v5GZE3C0OVwLdoHWjrXm4jyHMlbNU=;
 b=GEfbJZ+nB3xNLoIFwL/rMwNIVGfbytNO2KsFpy5Hvk3AhHDUFD2PD7oT
 t/tVanaZBLm2FbmN8JnrwJsW2XE1X6IH8CX3l9NyvlxzJBuA2yxTUG8u4
 KxKg5IgNHLTjOWjoRDDsaH95qOepttJqD0Ra4jz8wYxMkovXRNZYTDGDv
 7Kke7XlXVd0YwAH8w6NZmXYIDz7O98/ixMApr99xFwo3kQ3e1CPmVismL
 Yjb+KD63gJnCGLKsHl8cEltA0cb0oAGOGNkUj9/ybASIJ4HzCO9ovXsiA
 OTwlllbQKBGtA+6mfEJv+aaKXaI8YkqqHBxuZzOeLKt0PCtTvjkvCx3E0 w==;
X-CSE-ConnectionGUID: M9k5Z0KFRz+pjJsN+n8WWg==
X-CSE-MsgGUID: I8+rbnFrRam73D9Jws0U9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="679840"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="679840"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 22:52:51 -0700
X-CSE-ConnectionGUID: Z4fQ5oKHR46s272O7nphQg==
X-CSE-MsgGUID: X9i9Y09+RySWi2IY8plh3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1675776"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 13 Oct 2026 22:52:49 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v6 5/7] drm/xe/pci_error: Flush GT wedge worker before bus
 reset
Date: Wed, 14 Oct 2026 11:21:22 +0530
Message-ID: <20261014055215.330408-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014055215.330408-1-raag.jadav@intel.com>
References: <20261014055215.330408-1-raag.jadav@intel.com>
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

With GT wedging now done async, make sure the wedge worker is flushed to
avoid side-effects during PCI bus reset.

Fixes: 13b9555ffb03 ("drm/xe/xe_pci_error: Implement PCI error recovery callbacks")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_error.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index fdecd3e0b9a9..1dc8291f37ae 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -30,8 +30,10 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
 
 	xe_device_set_in_reset(xe);
 
-	for_each_gt(gt, xe, id)
+	for_each_gt(gt, xe, id) {
 		xe_gt_declare_wedged(gt);
+		flush_work(&gt->wedge.worker);
+	}
 
 	pci_disable_device(pdev);
 }
-- 
2.43.0

