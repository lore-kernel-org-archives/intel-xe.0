Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D028C4828F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 21:57:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A1310EAA1;
	Fri,  2 Feb 2024 21:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSYaQoSv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E1D10EAA1
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 21:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706911029; x=1738447029;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iN9BUJh0ShBhMGYVHW6eZKdfyvinFq8jT9TIJRXMyXI=;
 b=DSYaQoSvJ8Kt8wHOxVD7FJrPyDTUXxewBMN9rhiRBH94sCfBr8+oaQzy
 MNGnyflQywMkfXZDATQzg0iRCLAObQwAtZcVPZ4DnzR5MCc/sPGLzA/La
 fv9mi7q+um/lKzYusNHlAyqLiIqz2xcoTVNB+eO6CkRPhsvORrhvpyrVJ
 +GP2X/BrxS8+ghY17yNcFaeIoL+IRAd461fMZq4uRT9NuwFT5HNY3QVpT
 E8UVzf10Cz9uP1t/nMqI/HNivOUWnyxrHZovFmLhB+cvGifEovjP6Obe9
 rvwlTuSj0wGyu1o/9HjvsAzgkXRdfqvmG4L4WqIkpfFz/vBznu0MfEzxS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="3209054"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="3209054"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 13:57:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="932588086"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="932588086"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 13:57:07 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Xiaoming Wang <xiaoming.wang@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/display: Fix memleak in display initialization
Date: Fri,  2 Feb 2024 13:56:58 -0800
Message-ID: <20240202215658.561298-1-lucas.demarchi@intel.com>
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

From: Xiaoming Wang <xiaoming.wang@intel.com>

intel_power_domains_init is called twice in xe_device_probe:
xe_device_probe -> xe_display_init_nommio -> intel_power_domains_init()
xe_device_probe -> xe_display_init_noirq -> intel_display_driver_probe_noirq
-> intel_power_domains_init(i915)

It needs remove one to avoid power_domains->power_wells double malloc.

unreferenced object 0xffff88811150ee00 (size 512):
  comm "systemd-udevd", pid 506, jiffies 4294674198 (age 3605.560s)
  hex dump (first 32 bytes):
    10 b4 9d a0 ff ff ff ff ff ff ff ff ff ff ff ff  ................
    ff ff ff ff ff ff ff ff 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff8134b901>] __kmem_cache_alloc_node+0x1c1/0x2b0
    [<ffffffff812c98b2>] __kmalloc+0x52/0x150
    [<ffffffffa08b0033>] __set_power_wells+0xc3/0x360 [xe]
    [<ffffffffa08562fc>] xe_display_init_nommio+0x4c/0x70 [xe]
    [<ffffffffa07f0d1c>] xe_device_probe+0x3c/0x5a0 [xe]
    [<ffffffffa082e48f>] xe_pci_probe+0x33f/0x5a0 [xe]
    [<ffffffff817f2187>] local_pci_probe+0x47/0xa0
    [<ffffffff817f3db3>] pci_device_probe+0xc3/0x1f0
    [<ffffffff8192f2a2>] really_probe+0x1a2/0x410
    [<ffffffff8192f598>] __driver_probe_device+0x78/0x160
    [<ffffffff8192f6ae>] driver_probe_device+0x1e/0x90
    [<ffffffff8192f92a>] __driver_attach+0xda/0x1d0
    [<ffffffff8192c95c>] bus_for_each_dev+0x7c/0xd0
    [<ffffffff8192e159>] bus_add_driver+0x119/0x220
    [<ffffffff81930d00>] driver_register+0x60/0x120
    [<ffffffffa05e50a0>] 0xffffffffa05e50a0

The call to intel_power_domains_cleanup() needs to stay where it is for
now. The main issue is that while the init is called by the display
side, shared by i915 and xe, the cleanup is called by a non-shared code
path. Fixing that will be done as a separate commit.

Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
Signed-off-by: Xiaoming Wang <xiaoming.wang@intel.com>
[ reword commit message and explain why the fini needs to stay
  where it is ]
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 74391d9b11ae..e4db069f0db3 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -134,8 +134,6 @@ static void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
 
 int xe_display_init_nommio(struct xe_device *xe)
 {
-	int err;
-
 	if (!xe->info.enable_display)
 		return 0;
 
@@ -145,10 +143,6 @@ int xe_display_init_nommio(struct xe_device *xe)
 	/* This must be called before any calls to HAS_PCH_* */
 	intel_detect_pch(xe);
 
-	err = intel_power_domains_init(xe);
-	if (err)
-		return err;
-
 	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_nommio, xe);
 }
 
-- 
2.43.0

