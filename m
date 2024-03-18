Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8ACDC54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 11:37:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466F310E180;
	Mon, 18 Mar 2024 11:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3NJ36JZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F7D10E180
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 11:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710761853; x=1742297853;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Bvw2YhGDSxEsUouikjaRBl2hAR2/6AE/8isFaMu+kUo=;
 b=R3NJ36JZjwdvnDhGtpW2ikY66B42+xQfkcHZ5/2f+rND6MkU71HlWLvw
 gOEhcftFPuz+eDxqQgGx/dC0Vk07VlreAg04MaKGKZEtyKbNdA6cWZo+o
 iu9r5msZjlUquyYXSXOQKC8jSl8FVjOOJ5IQw4jXIeTCC2sk+1QyawCJV
 NZ7G/U+NelFIELJLLXbSfhmURTbItByvzin8IMblX0S9gOg0aWvClkNxq
 ZFEw+wbVC4DPl37mB59W9kJIHO45ic8qehz5ymmAy44zQK69fc6fZVkwt
 3Lxk/yUir998GUwdv1q8mSD/wDh95Ppz8O+RJ4WVDGuCfAw3UrOmcG0aA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="9340148"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="9340148"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 04:37:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="14083137"
Received: from unknown (HELO mwauld-mobl1.intel.com) ([10.245.245.16])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 04:37:32 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH] drm/xe/device: fix drm_WARN_ON() check
Date: Mon, 18 Mar 2024 11:37:09 +0000
Message-ID: <20240318113708.32938-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
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

Here XE_MAX_TILES_PER_DEVICE is the gt array size, therefore the gt
index should always be less than.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 14be34d9f543..6b32f09a4c89 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -79,7 +79,7 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
 	if (MEDIA_VER(xe) >= 13) {
 		gt = xe_tile_get_gt(root_tile, gt_id);
 	} else {
-		if (drm_WARN_ON(&xe->drm, gt_id > XE_MAX_TILES_PER_DEVICE))
+		if (drm_WARN_ON(&xe->drm, gt_id >= XE_MAX_TILES_PER_DEVICE))
 			gt_id = 0;
 
 		gt = xe->tiles[gt_id].primary_gt;
-- 
2.44.0

