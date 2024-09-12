Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE265EEE245
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:58:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E46410EC27;
	Thu, 12 Sep 2024 18:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOBpE7dm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBD510EC25
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726167506; x=1757703506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rNE0eVzQR40gQ5QMeheh1ym3OIjvSiAwX7Kmy8a+5YA=;
 b=EOBpE7dmAnFzLg+eJYtlyW90k2p/ZSM1uXjvxVtsIKKt725VeLH4GNV3
 HGpaD7uuP5DGXq27dhmmInxR8I3zPf54HoN7Ajo67+BtHYkgMP/AfO/OH
 J3GGFfJLI5nVZ//FBz3zUiJcZJ17BwswXEZ4riiZDe/w6JobkQaHxUXt2
 44lkU25D9TXOJ3QBpvjuKE0WicS06y84/8v8jT1Td7Md25TrWg8eGGkhP
 qYtq7O7pCu64VM9N87IUZcxu5z6VG82IfkY4M+eZXtYXF25FIN7y0YivH
 p/Ei/JvVBw4fVymsHRrLr2N9GWnlyHDekGMTl9g5P4IOIh7q42LXs5xcn Q==;
X-CSE-ConnectionGUID: b4NK0Fm3SnGNle3NP2rL4w==
X-CSE-MsgGUID: H8KZb/kvQoKvyWgg2hjezw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25202977"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25202977"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:58:26 -0700
X-CSE-ConnectionGUID: OxNPwFSvQ3KXFy9xMsSDrA==
X-CSE-MsgGUID: 2KsAaIPqTvynNcXt3mqRPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="71910186"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2024 11:58:25 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 14/23] drm/xe/huc: Update handling of xe_force_wake_get
 return
Date: Fri, 13 Sep 2024 00:45:54 +0530
Message-Id: <20240912191603.194964-15-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented domain
mask, a return value of 0 indicates failure for single domains
(excluding XE_FORCEWAKE_ALL).

Modify the return handling of xe_force_wake_get() accordingly and pass
the return value to xe_force_wake_put().

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_huc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 77c5830309cf..8908267ce5f3 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -296,19 +296,19 @@ void xe_huc_sanitize(struct xe_huc *huc)
 void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
 {
 	struct xe_gt *gt = huc_to_gt(huc);
-	int err;
+	int fw_ref;
 
 	xe_uc_fw_print(&huc->fw, p);
 
 	if (!xe_uc_fw_is_enabled(&huc->fw))
 		return;
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
 		return;
 
 	drm_printf(p, "\nHuC status: 0x%08x\n",
 		   xe_mmio_read32(&gt->mmio, HUC_KERNEL_LOAD_INFO));
 
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
-- 
2.34.1

