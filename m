Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DFCC79FAD
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA17E10EB11;
	Tue,  8 Sep 2026 10:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FfhnLFe8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8290510EB10
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788862748; x=1820398748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o40OoPsH0nzWQabSIfMYV1YoSpqVlP6coDQpF/rffac=;
 b=FfhnLFe86B247Lx40/qdowDMV+Tp5gkH9DUOihYledFW1k5I50jr6uT5
 YsTzIarEyKhNbhG+VCHDS8wfSd/uH87VkleoWKany1AXObV5d4q91Wnvc
 xuLFfEhgTKedpwcmd27rbX+4yi0us81B9NyBSgoUG2yrNnrMlZz4QqYjb
 t4xAdiMhLq8R5m+KHBWp+AaiSmvqVqdOCpKbirwfr0H/ADlGigfDqu72Y
 2KmQvu/4k1w6+Vlbk0hoolW+0vVRoekQACZ/ndmXxD0sdzhWiOvM8XQkN
 dGyxH/uUCVJk+ueBgf1aaXxc4wIGuzQGmpsyrqZrX7yzieH0E2CssG1OF Q==;
X-CSE-ConnectionGUID: +PvEooekRA+07dXN2H7Flw==
X-CSE-MsgGUID: 5Rg2m/QaQbqm5cRzwugFIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89278282"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89278282"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:19:08 -0700
X-CSE-ConnectionGUID: KwuAFY4kQo+xSB8KjeTssw==
X-CSE-MsgGUID: zz70SusKT+W6ugEJLdX38g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="269628479"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa010.jf.intel.com with ESMTP; 08 Sep 2026 03:19:08 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v2 12/13] drm/xe/vram: Report tile vs device VRAM visibility
 errors
Date: Tue,  8 Sep 2026 15:48:48 +0530
Message-ID: <20260908101849.1219614-13-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908101849.1219614-1-dnyaneshwar.bhadane@intel.com>
References: <20260908101849.1219614-1-dnyaneshwar.bhadane@intel.com>
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

Derive the owning tile of a struct xe_vram_region inside
vram_region_init() from vram->id, so the "no CPU visible VRAM"
error can distinguish a per-tile region from the device-wide
region without changing the function's signature.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index dcedd8cfd731..fa06c7ae56b1 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -244,6 +244,7 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
 			    u64 region_size, resource_size_t remain_io_size)
 {
+	struct xe_tile *tile = vram == xe->mem.vram ? NULL : &xe->tiles[vram->id];
 	/* Check if VRAM region is already initialized */
 	if (vram->mapping)
 		return 0;
@@ -253,7 +254,8 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	vram->io_size = min_t(u64, usable_size, remain_io_size);
 
 	if (!vram->io_size) {
-		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+		drm_err(&xe->drm, "%s without any CPU visible VRAM. Aborting.\n",
+			tile ? "Tile" : "Device");
 		return -ENODEV;
 	}
 
-- 
2.54.0

