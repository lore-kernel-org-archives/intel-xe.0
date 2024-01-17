Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44779C47DA7
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 13:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030C710E6D8;
	Wed, 17 Jan 2024 13:41:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7407E10E6BD
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 13:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705498876; x=1737034876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OCkONg7KQrMI4fUs6h3STVgA41sTQbMKiD7XepoTwBU=;
 b=KQzwYSJGF4wTdnWIbq3W1T19LxJ688m3Mo+M5byOkYlSOoSJypzS6fI5
 HAYlr62TJRw3ncSxLZN3cIRfrjCO1Rx6Yj0o6v0bKFfZAYNC9RZU4UFA9
 /GR+Ze94C+UFvFIa7FPAjAU/lenprmjzp8BtFpj4+DJxwYWiLBGdlCyq8
 zBkIT93Q6Plrry+lI7hpGBcrgG568edo0Kdz5CIpXV+0L8FyL4HJU0tXj
 0WJ1bQl72hqypNGl1UAfKXicb1+X1+W25DDxs6ftLX4emqYAT+rmEGAW+
 98+oYDoJdh/WtzV1AdMTuv3OTVXIYHw1yo17K4JsBflP1XaluBRjvTFDd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="466549629"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="466549629"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 05:41:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="927831091"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="927831091"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 05:41:08 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/5] drm/xe: Don't use __user error pointers
Date: Wed, 17 Jan 2024 14:40:47 +0100
Message-ID: <20240117134048.165425-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117134048.165425-1-thomas.hellstrom@linux.intel.com>
References: <20240117134048.165425-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The error pointer macros are not aware of __user pointers and as a
consequence sparse warns.

Have the copy_mask() function return an integer instead of a __user
pointer.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 50 +++++++++++++++++------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 9b35673b286c..7e924faeeea0 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -459,21 +459,21 @@ static size_t calc_topo_query_size(struct xe_device *xe)
 		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
 }
 
-static void __user *copy_mask(void __user *ptr,
-			      struct drm_xe_query_topology_mask *topo,
-			      void *mask, size_t mask_size)
+static int copy_mask(void __user **ptr,
+		     struct drm_xe_query_topology_mask *topo,
+		     void *mask, size_t mask_size)
 {
 	topo->num_bytes = mask_size;
 
-	if (copy_to_user(ptr, topo, sizeof(*topo)))
-		return ERR_PTR(-EFAULT);
-	ptr += sizeof(topo);
+	if (copy_to_user(*ptr, topo, sizeof(*topo)))
+		return -EFAULT;
+	*ptr += sizeof(topo);
 
-	if (copy_to_user(ptr, mask, mask_size))
-		return ERR_PTR(-EFAULT);
-	ptr += mask_size;
+	if (copy_to_user(*ptr, mask, mask_size))
+		return -EFAULT;
+	*ptr += mask_size;
 
-	return ptr;
+	return 0;
 }
 
 static int query_gt_topology(struct xe_device *xe,
@@ -493,28 +493,28 @@ static int query_gt_topology(struct xe_device *xe,
 	}
 
 	for_each_gt(gt, xe, id) {
+		int err;
+
 		topo.gt_id = id;
 
 		topo.type = DRM_XE_TOPO_DSS_GEOMETRY;
-		query_ptr = copy_mask(query_ptr, &topo,
-				      gt->fuse_topo.g_dss_mask,
-				      sizeof(gt->fuse_topo.g_dss_mask));
-		if (IS_ERR(query_ptr))
-			return PTR_ERR(query_ptr);
+		err = copy_mask(&query_ptr, &topo, gt->fuse_topo.g_dss_mask,
+				sizeof(gt->fuse_topo.g_dss_mask));
+		if (err)
+			return err;
 
 		topo.type = DRM_XE_TOPO_DSS_COMPUTE;
-		query_ptr = copy_mask(query_ptr, &topo,
-				      gt->fuse_topo.c_dss_mask,
-				      sizeof(gt->fuse_topo.c_dss_mask));
-		if (IS_ERR(query_ptr))
-			return PTR_ERR(query_ptr);
+		err = copy_mask(&query_ptr, &topo, gt->fuse_topo.c_dss_mask,
+				sizeof(gt->fuse_topo.c_dss_mask));
+		if (err)
+			return err;
 
 		topo.type = DRM_XE_TOPO_EU_PER_DSS;
-		query_ptr = copy_mask(query_ptr, &topo,
-				      gt->fuse_topo.eu_mask_per_dss,
-				      sizeof(gt->fuse_topo.eu_mask_per_dss));
-		if (IS_ERR(query_ptr))
-			return PTR_ERR(query_ptr);
+		err = copy_mask(&query_ptr, &topo,
+				gt->fuse_topo.eu_mask_per_dss,
+				sizeof(gt->fuse_topo.eu_mask_per_dss));
+		if (err)
+			return err;
 	}
 
 	return 0;
-- 
2.43.0

