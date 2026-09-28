Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0957ACA5FA3
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 09:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF12410E913;
	Mon, 28 Sep 2026 09:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E3JoDPcP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B09D10E840
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 09:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790587451; x=1822123451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o40OoPsH0nzWQabSIfMYV1YoSpqVlP6coDQpF/rffac=;
 b=E3JoDPcPrN1NZKsJHB8sHIXsyp7XmrRGI/WMMhCg9FB/I2nS3mGeJcqf
 h2w1IjRjmXvL9Ghs9Tjb+Hq2rnIMICaK0xw5paMZKNZtpdF4zPF+IOOo3
 Q4XnynZYxkeFbO67MWgplsvKu5Zocm68etO8AadBCQ47HzpgkV0LzWpAV
 JH/AOVAqloNz+KFfNR0+tq/bJQCPF37axCDa87LOryWa77SkDZYMAMuby
 1BsxB506wdK9Hm6Ntcb3Ejsk4JZ67Tq973ij597R8F6WIm6tjr09S2PaB
 c4NBovDtRTG4jpgQL+cT8eCLd8J8XMJ9wM003BhcVUgY7FtUaMwd6akQb g==;
X-CSE-ConnectionGUID: IyWHAMl7SmOvmvpLRydl5g==
X-CSE-MsgGUID: YD2Hj/t8SiOiaKc1NwF4ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="78845500"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="78845500"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 02:22:20 -0700
X-CSE-ConnectionGUID: SiT66EVTTsurfWVtnEeDtw==
X-CSE-MsgGUID: BJxu0tnhTUy8ThqE2TuyMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="283078063"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa005.fm.intel.com with ESMTP; 28 Sep 2026 02:21:33 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, mallesh.koujalagi@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v4 11/12] drm/xe/vram: Report tile vs device VRAM visibility
 errors
Date: Mon, 28 Sep 2026 14:51:13 +0530
Message-ID: <20260928092114.1610203-12-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
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

