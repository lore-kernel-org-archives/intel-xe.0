Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0893CE7B1A
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 10:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8812A10E606;
	Thu, 28 Sep 2023 10:59:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E2910E605
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 10:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695898737; x=1727434737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m5zreZo5wVRQuugDEEqaXm7c4/FdxN3AprXTSuhg0aI=;
 b=SeKZN76xPYFpTw+V8L2ji7Ncmy5m5Ks7ekWI5p9wt0HCuPcVl4VyhbgA
 o4kf/gTC5klnlFrH1+pfPY35LRjglYryex4zc0WrozHjYI+MbZSZ2s7BC
 +bGqrkPTwAvjUzmgg7MmVM8sQmK7tBM2Nl1oGu2GDlQBSfLmWBMmeFkHW
 q9qeCxq7jJlJt85si8XIoUYB+Ing6OKGhxVd9dgo+hnLp4YPYm9Q5nCqv
 CPl3pMUBFdn+Rj9G0EQ9pZtxAq9KHENDz5oDJOqI/IeUcj8aghlT8XGt+
 8W+M5uf/s6BW4EDOn3w4Azi51YbZ/kxkKsKBQAyhtl1bc7rQn60AWxIwx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="640117"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="640117"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:58:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="923174406"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="923174406"
Received: from nsolmsdo-mobl.ger.corp.intel.com (HELO 8b338166fae8.intel.com)
 ([10.251.220.162])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:58:54 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 10:58:24 +0000
Message-Id: <20230928105843.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928105843.7-1-francois.dugast@intel.com>
References: <20230928105843.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 01/20] drm/xe: Fix array bounds check for
 queries
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Queries are 0-indexed, so a query with value N is invalid if the
ARRAY_SIZE is N. Modify the check to account for that.

Fixes: 22504d560287 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index a951205100fe..e0c2203e428e 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -381,7 +381,7 @@ int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	    XE_IOCTL_DBG(xe, query->reserved[0] || query->reserved[1]))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, query->query > ARRAY_SIZE(xe_query_funcs)))
+	if (XE_IOCTL_DBG(xe, query->query >= ARRAY_SIZE(xe_query_funcs)))
 		return -EINVAL;
 
 	idx = array_index_nospec(query->query, ARRAY_SIZE(xe_query_funcs));
-- 
2.34.1

