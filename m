Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBC9C021B6
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 18:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6836210EB28;
	Fri, 21 Feb 2025 18:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mT6lkSEt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3876C10EB26
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 18:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740163957; x=1771699957;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=XpcYySPiLSAlLLSSbQVYyjgpSmnHxr1aWVfpO4uskAo=;
 b=mT6lkSEtkKd7AHKz17eFjVUKSI1QP3iutE/x1I4SxrcUGpOj+QwW+oat
 Cc9BovDV4VP2iytcW7DwukImOa6Yg1YX1qBDr0UQYWXUO++ZuMTG41qTs
 ZlMTQ7vW2wqn7KKtpp2g7CxuvEt+PCXUNUo3hxnXUXbKIe6egGAeHHVoF
 I8789nSFe+TiozVhAH+rgXQmFlxyOPOsagHwAEFOuTt6ca6RzAwREkSNg
 XdS4agJXVII2ZjwF3rcN9URRTRDLLGqPRTd4ER/re77d3LroUlrwzXYCi
 sCztSglS0nlL+oNSopwR3RJFhA7GJCwIb3s42tkQuo0VuFsENf4TbctXW A==;
X-CSE-ConnectionGUID: fZBkElr+SlOEitu38r3Q8w==
X-CSE-MsgGUID: MTGqbaY/RUCLe1NJnGbxOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="58403679"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="58403679"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 10:52:37 -0800
X-CSE-ConnectionGUID: Q9FMBmw5T0KamOFi4rpBZg==
X-CSE-MsgGUID: YbTiKOi1QZqTzGNEbalsRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120071315"
Received: from mgoodin-mobl2.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.110.181])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 10:52:36 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 21 Feb 2025 15:51:40 -0300
Subject: [PATCH v2 1/7] drm/xe: Set IP names in functions handling IP version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-xe-unify-ip-descriptors-v2-1-5bc0c6d0c13f@intel.com>
References: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
In-Reply-To: <20250221-xe-unify-ip-descriptors-v2-0-5bc0c6d0c13f@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.14.2
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

In an upcoming change, we will handle setting graphics_name and
media_name differently for GMDID-based IPs. As such, let's make both
handle_pre_gmdid() and handle_gmdid() functions responsible for
initializing those fields. While now we have both doing essentially the
same thing with respect to those fields, handle_pre_gmdid() will diverge
soon.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 70b697fde5b96c117056abcc148e64bbadd0696b..feea897f130d9bbf2d880a0b419764b96c0bc4ad 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -564,9 +564,14 @@ static void handle_pre_gmdid(struct xe_device *xe,
 			     const struct xe_media_desc *media)
 {
 	xe->info.graphics_verx100 = graphics->ver * 100 + graphics->rel;
+	xe->info.graphics_name = graphics->name;
 
-	if (media)
+	if (media) {
 		xe->info.media_verx100 = media->ver * 100 + media->rel;
+		xe->info.media_name = media->name;
+	} else {
+		xe->info.media_name = "none";
+	}
 
 }
 
@@ -588,6 +593,7 @@ static void handle_gmdid(struct xe_device *xe,
 		if (ver == graphics_ip_map[i].ver) {
 			xe->info.graphics_verx100 = ver;
 			*graphics = graphics_ip_map[i].ip;
+			xe->info.graphics_name = (*graphics)->name;
 
 			break;
 		}
@@ -598,8 +604,9 @@ static void handle_gmdid(struct xe_device *xe,
 			ver / 100, ver % 100);
 	}
 
-	read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
+	xe->info.media_name = "none";
 
+	read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
 	/* Media may legitimately be fused off / not present */
 	if (ver == 0)
 		return;
@@ -608,6 +615,7 @@ static void handle_gmdid(struct xe_device *xe,
 		if (ver == media_ip_map[i].ver) {
 			xe->info.media_verx100 = ver;
 			*media = media_ip_map[i].ip;
+			xe->info.media_name = (*media)->name;
 
 			break;
 		}
@@ -698,9 +706,6 @@ static int xe_info_init(struct xe_device *xe,
 	if (!graphics_desc)
 		return -ENODEV;
 
-	xe->info.graphics_name = graphics_desc->name;
-	xe->info.media_name = media_desc ? media_desc->name : "none";
-
 	xe->info.vram_flags = graphics_desc->vram_flags;
 	xe->info.va_bits = graphics_desc->va_bits;
 	xe->info.vm_max_level = graphics_desc->vm_max_level;

-- 
2.48.1

