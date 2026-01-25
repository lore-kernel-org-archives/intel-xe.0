Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD7CE63C81
	for <intel-xe@archiver.kernel.org>; Sun, 25 Jan 2026 01:57:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54EE210E238;
	Sun, 25 Jan 2026 01:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hjSWnNy1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4494110E238
 for <intel-xe@lists.freedesktop.org>; Sun, 25 Jan 2026 01:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769306222; x=1800842222;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1MN979UJMhTURZn9mWKmIY9AoDfJaY6fvxtqJwkLn+8=;
 b=hjSWnNy1MkmHjqxF+PqNh/wCOLJs32I25eaOYfQFMmHvMzLKAW8hXYFt
 k9+NZPISL5dou+o37EujXZ2fOlDihnzJAZvY3gNabuhD+2JQBKWJ6fo68
 QfjJWcDV48301+hB6TL5wVxhqUx9aZP4t8SAEwfBdG3HDjT4cxiUpDekd
 4iT6ubSp+5fyvJ4On5hbMuqCGytUE6GoaoFMmqr9HR87Ri546Jds0cqv3
 klG1n/f6Hpl5/YPcDBcuHUhzYYgTbTy6DGkF2SshG0710SJ+0cO33knr1
 k7Z4y0Q+r2lC3cfmYDCwEjw2VMR25i1NRNNDLfUdLaqNkZLc8zDIh8Pgq Q==;
X-CSE-ConnectionGUID: Dc2kQ40rRG+Wa0JuRsG83A==
X-CSE-MsgGUID: EIrSvEwzRzq0EM0p9kOgFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="88092398"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; d="scan'208";a="88092398"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2026 17:57:02 -0800
X-CSE-ConnectionGUID: /AXkOrmCQYSidVPMYQpwtQ==
X-CSE-MsgGUID: o4OnIba3QryqqbvQz7isCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; d="scan'208";a="212216813"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.45])
 by fmviesa004.fm.intel.com with ESMTP; 24 Jan 2026 17:57:01 -0800
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>
Subject: [PATCH] drm/xe: Fix memory leak in color pipeline initialization
Date: Sun, 25 Jan 2026 01:56:59 +0000
Message-ID: <20260125015659.4073656-1-jia.yao@intel.com>
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

Fix kasprintf() allocated pipeline names not being freed in
intel_color_pipeline_plane_init(). The function allocates a string
'Color Pipeline N' for each pipeline via kasprintf() but never freed it.

Store the return value of drm_plane_create_color_pipeline_property()
and free each allocated name before returning.

Fixes kmemleak:
  unreferenced object 0xffff88c14e99cae0 (size 32):
    comm "(udev-worker)", pid 599, jiffies 4294671854
    hex dump (first 32 bytes):
      43 6f 6c 6f 72 20 50 69 70 65 6c 69 6e 65 20 33  Color Pipeline 3
      39 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  9...............
    backtrace (crc 993a6a5):
      kmemleak_alloc+0x4a/0xa0
      __kmalloc_node_track_caller_noprof+0x3be/0x760
      kvasprintf+0x6a/0xe0
      kasprintf+0x55/0x80
      intel_color_pipeline_plane_init+0xef/0x1f0 [xe]
      skl_universal_plane_create+0x436/0x810 [xe]
      intel_crtc_init+0x399/0x4e0 [xe]
      intel_display_driver_probe_nogem+0x60/0x1c0 [xe]
      xe_display_init_early+0xa8/0x130 [xe]
      xe_device_probe+0x3eb/0xb20 [xe]
      xe_pci_probe+0xe02/0x1210 [xe]
      local_pci_probe+0x47/0xb0
      pci_device_probe+0xf3/0x270
      really_probe+0xf1/0x410
      __driver_probe_device+0x8c/0x190
      driver_probe_device+0x24/0xd0

Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color_pipeline.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
index 942d9b9c93ce..da3bda80a7e5 100644
--- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
+++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
@@ -83,7 +83,7 @@ int intel_color_pipeline_plane_init(struct drm_plane *plane, enum pipe pipe)
 	struct intel_display *display = to_intel_display(dev);
 	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
 	int len = 0;
-	int ret;
+	int ret, i;
 
 	/* Currently expose pipeline only for HDR planes */
 	if (!icl_is_hdr_plane(display, to_intel_plane(plane)->id))
@@ -95,5 +95,11 @@ int intel_color_pipeline_plane_init(struct drm_plane *plane, enum pipe pipe)
 		return ret;
 	len++;
 
-	return drm_plane_create_color_pipeline_property(plane, pipelines, len);
+	ret = drm_plane_create_color_pipeline_property(plane, pipelines, len);
+
+	/* Free allocated pipeline names */
+	for (i = 0; i < len; i++)
+		kfree(pipelines[i].name);
+
+	return ret;
 }
-- 
2.43.0

