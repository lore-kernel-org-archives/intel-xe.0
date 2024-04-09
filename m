Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A516C67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 11:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7F910F706;
	Tue,  9 Apr 2024 11:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTyt74Il";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343E710F9AD
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 11:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712662181; x=1744198181;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ukYR2KaB3L3wkxNhprdfUxi+5hNFzqM9f6jB34MdQLg=;
 b=ZTyt74IlC43XgKe3LTDt1h6KDHT+QY+jqBbueMSVoSLjAU5VdQm7Fp6U
 BL8AONAuRFaz69FhfpMPsTVe0d6XNi6wcsR7SE4ZwyVm4FG3//O+PRnRB
 LdI7gPnCrrQSYxEms0P0JljLNVpt3rnMKYlrPx96mbuYEtV5Ti3yALAhJ
 Jtn7lhK0rv8l0dUWHFsggXXUbFod89r+/TN5WRIMvJ08JOWkGe+77a/WR
 uyRLyA31zg0KL9fuj74o2wkI2UZoiHqnif/3reol9LX+wvJagcnSbz0Ox
 FLTNnAHIxxOlTdzsiexMmq5f5znw8OOHmkY+LlWUVbs7lB82NIov+5Y4p g==;
X-CSE-ConnectionGUID: 4e9m4D9ESd6Xivt7svEFzQ==
X-CSE-MsgGUID: njDOGY1iTbaQtZS5+CJvSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8127820"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="8127820"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:29:40 -0700
X-CSE-ConnectionGUID: /3pfZ6vHTmKvYwuzI7S83g==
X-CSE-MsgGUID: f8yxzZ1QToCp8ZlSdDcfDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="24682367"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:29:39 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/i915: Use enum mode in drm_mm_insert_node_in_range
Date: Tue,  9 Apr 2024 13:15:41 +0200
Message-ID: <20240409111541.2478-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Use DRM_MM_INSERT_BEST as mode instead of zero.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index ff2239c0eda5..910153eed457 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -408,7 +408,8 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
-					  alignment, 0, start, end, 0);
+					  alignment, 0, start, end,
+					  DRM_MM_INSERT_BEST);
 	if (!err)
 		xe_ggtt_map_bo(ggtt, bo);
 	mutex_unlock(&ggtt->lock);
-- 
2.42.0

