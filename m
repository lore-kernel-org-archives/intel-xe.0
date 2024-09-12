Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83E3EEE241
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C9E10EC30;
	Thu, 12 Sep 2024 18:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SdXuhq6X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C88D10EC2C
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726167518; x=1757703518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tN6QiIknXsoLG8Vw0G+DWj3C3JrikLc5gYqxyHjjoQ4=;
 b=SdXuhq6Xu5ge1dlCrxevkND3WZB8gGvzU0BT+hd3Ss8n6OmERPHz3+QY
 43v9NLZyO6cygVG+fAU3emSraQutY4wSabAsZpn8d5J2m8oGNHBOoz6Ly
 jnSrp+2NhWNtDrZGCPNHS+MrISrFlDZp6fvcnIIN+DBIgwsnZprNLidJV
 HdT4creiBBgKprfg/xjRotmiXNkOuF0Kk2JU2HU+GK0lZec9ZTzI7VbEk
 +wi881pPFZIh0umlP2K0wQJKQKHUj0GZg/x2anDqWE/0TfqaOl35lLJ/E
 hzAR1DX2VkkC/GfENy/7lMKGcHY1+EBtR6TLQ5cXdqIanDps8Sn4lj3s9 w==;
X-CSE-ConnectionGUID: r2PQvJF9SCu663wycf7fAg==
X-CSE-MsgGUID: 38IxxdK+T0iuds/W4XUDbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25203006"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25203006"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:58:38 -0700
X-CSE-ConnectionGUID: Dx5S2YHqTFOyZ5luJJbvwg==
X-CSE-MsgGUID: CpKAZ+JEQkSyvdRuToFTkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="71910233"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2024 11:58:37 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 20/23] drm/xe/vram: Update handling of xe_force_wake_get
 return
Date: Fri, 13 Sep 2024 00:46:00 +0530
Message-Id: <20240912191603.194964-21-himal.prasad.ghimiray@intel.com>
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

Modify the return handling of xe_force_wake_get() accordingly and
pass the return value to xe_force_wake_put().

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 7e765b1499b1..3b5256d76d9a 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -220,7 +220,7 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *gt = tile->primary_gt;
 	u64 offset;
-	int err;
+	int fw_ref;
 	u32 reg;
 
 	if (IS_SRIOV_VF(xe)) {
@@ -239,9 +239,9 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 		return 0;
 	}
 
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		return err;
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref)
+		return -ETIMEDOUT;
 
 	/* actual size */
 	if (unlikely(xe->info.platform == XE_DG1)) {
@@ -263,7 +263,7 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 	/* remove the tile offset so we have just the available size */
 	*vram_size = offset - *tile_offset;
 
-	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	return xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
 static void vram_fini(void *arg)
-- 
2.34.1

