Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD81C3DA61
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 21:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C5910E067;
	Wed, 24 Jul 2024 21:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CsfTI8kh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B7710E067
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 21:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721857996; x=1753393996;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+FCYTJsjC+7rHXb1YNv2tuzgd7jn41qyclaTK3Gixxw=;
 b=CsfTI8khYhTc/nGIIhIVSizl/loY3vdJW4pwoAmm2lrfGLTEdBhryxAV
 enTJggKgVR9zYZZLqSxTiARGR0VVHZvy2JEtlH3kFQQDE0jt0rAg24twK
 ioFkou84cLyXv5jXIjCPLlIy+er34p1tp1DWAHTzr9zsksiClADfNEVhL
 O2l6qkr6JmS+ZTOGYy6U0XGvk6x/2/FGGeWbUb++nU2urLfR08Jit+9Ho
 quYGpFBhd7F3o9CrlXEb8LyOC/NWZrV5m3kIevv9LPTB89GJRh9Big2p/
 Y1ynJJztbpraUWqu7C/BbZ/kCFWCto9D5xVk+F7hnHgFORTQojDBp9wN3 g==;
X-CSE-ConnectionGUID: TEBCJNG9R2SsyrqzoY+Lhw==
X-CSE-MsgGUID: u7K5ZtOeQHKbj3W8AtZ/PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19443651"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="19443651"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 14:53:16 -0700
X-CSE-ConnectionGUID: 5kilMDwaR+Wap6lB9Lx8nA==
X-CSE-MsgGUID: JlM9qPOHRkCLY/Imx80Sog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="56860030"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 14:53:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Fix opregion leak
Date: Wed, 24 Jul 2024 14:53:09 -0700
Message-ID: <20240724215309.644423-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Being part o the display, ideally the setup and cleanup would be done by
display itself. However this is a bigger refactor that needs to be done
on both i915 and xe. For now, just fix the leak:

unreferenced object 0xffff8881a0300008 (size 192):
  comm "modprobe", pid 4354, jiffies 4295647021
  hex dump (first 32 bytes):
    00 00 87 27 81 88 ff ff 18 80 9b 00 00 c9 ff ff  ...'............
    18 81 9b 00 00 c9 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace (crc 99260e31):
    [<ffffffff823ce65b>] kmemleak_alloc+0x4b/0x80
    [<ffffffff81493be2>] kmalloc_trace_noprof+0x312/0x3d0
    [<ffffffffa1345679>] intel_opregion_setup+0x89/0x700 [xe]
    [<ffffffffa125bfaf>] xe_display_init_noirq+0x2f/0x90 [xe]
    [<ffffffffa1199ec3>] xe_device_probe+0x7a3/0xbf0 [xe]
    [<ffffffffa11f3713>] xe_pci_probe+0x333/0x5b0 [xe]
    [<ffffffff81af6be8>] local_pci_probe+0x48/0xb0
    [<ffffffff81af8778>] pci_device_probe+0xc8/0x280
    [<ffffffff81d09048>] really_probe+0xf8/0x390
    [<ffffffff81d0937a>] __driver_probe_device+0x8a/0x170
    [<ffffffff81d09503>] driver_probe_device+0x23/0xb0
    [<ffffffff81d097b7>] __driver_attach+0xc7/0x190
    [<ffffffff81d0628d>] bus_for_each_dev+0x7d/0xd0
    [<ffffffff81d0851e>] driver_attach+0x1e/0x30
    [<ffffffff81d07ac7>] bus_add_driver+0x117/0x250

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 8b83dcff72e1..ca4468c82078 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -132,6 +132,7 @@ static void xe_display_fini_noirq(void *arg)
 		return;
 
 	intel_display_driver_remove_noirq(xe);
+	intel_opregion_cleanup(xe);
 }
 
 int xe_display_init_noirq(struct xe_device *xe)
@@ -157,8 +158,10 @@ int xe_display_init_noirq(struct xe_device *xe)
 	intel_display_device_info_runtime_init(xe);
 
 	err = intel_display_driver_probe_noirq(xe);
-	if (err)
+	if (err) {
+		intel_opregion_cleanup(xe);
 		return err;
+	}
 
 	return devm_add_action_or_reset(xe->drm.dev, xe_display_fini_noirq, xe);
 }
-- 
2.43.0

