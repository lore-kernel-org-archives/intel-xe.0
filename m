Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E32C36019
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 12:04:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0B610E283;
	Tue, 17 Sep 2024 12:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kKmJ0O/B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3906010E46A
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 12:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726574639; x=1758110639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iRIbqiLo4XHc8OtKSe4g7ZmapllNw9/WPrvMW6/Hj6w=;
 b=kKmJ0O/BNaO4Nsl2JRbP85QPp6WsZq8TS+d7wh9C+O6Cp3CwPIU5jHtD
 0a2s6OmjnHDLR44VFUr0CMvDrrqLwoxcE5FcKteUEzJK2G5xlRL3T+m4C
 pe3IpPPbtkLJgl93fY/0LzGCODMaF3AH77RkwaD7r5uF6SOh8kt6X0ISe
 pTOrKOkBFt8mnhJBrHN3h04W0dkt2tnUl+kCFoVJ0uDM5aSnH9LxSOu4h
 3PwTQPvlGl9k0YwkLh8QzpfLTUcUaiKtzRrBVsXF8H/OyuLPrXUYnnynv
 WHAewQVtdl639sWvKaCFOKLTNx/W/scKbIKIgaXzSidYjt1/G/P/pIGWn w==;
X-CSE-ConnectionGUID: afAMULi7RFKMvJ13TW/sFg==
X-CSE-MsgGUID: CoHxzwaTT7muUbTXRqMihw==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29210705"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="29210705"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 05:03:58 -0700
X-CSE-ConnectionGUID: wZhb5pfSQgOCwS/WttH0GQ==
X-CSE-MsgGUID: jNtZJeW/TRuN3eQJmxDRtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69388631"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa010.fm.intel.com with ESMTP; 17 Sep 2024 05:03:56 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 20/23] drm/xe/vram: Update handling of xe_force_wake_get
 return
Date: Tue, 17 Sep 2024 17:51:23 +0530
Message-Id: <20240917122126.438448-21-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
References: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
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

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()
- xe_force_wake_put() error doesn't need to be escalated/considered as
probing error. It internally WARNS on domain ack failure.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 2a623bfcda7e..3f087a07a434 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -220,8 +220,8 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *gt = tile->primary_gt;
+	xe_wakeref_t fw_ref;
 	u64 offset;
-	int err;
 	u32 reg;
 
 	if (IS_SRIOV_VF(xe)) {
@@ -240,9 +240,9 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
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
@@ -264,7 +264,9 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 	/* remove the tile offset so we have just the available size */
 	*vram_size = offset - *tile_offset;
 
-	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+
+	return 0;
 }
 
 static void vram_fini(void *arg)
-- 
2.34.1

