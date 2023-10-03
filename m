Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E0AE75458
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 18:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5078610E30F;
	Tue,  3 Oct 2023 18:09:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABBC10E30F
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 18:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696356558; x=1727892558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cpMSMAlal2OO14lCLe1M9RrUrrU6vXtXu1k7d2LG7uA=;
 b=bNfbFmGAjQ5yEGbChXe8RxXuhIzLYte6thDvbUfWP84/2Y1nNeXurMox
 YKZZ1yDw/I0y2QuCdh/8TSkTh2Yq315FpB9VwtLkqtFT/Y35Ov88GqChJ
 XvLqToggQhCUE84bt4WJfprlGQY3Jk2+rsACYlfwTvPdGn8aPLm6T/Qqy
 PwRSuGzX4fRxzwaqMQ0y6/PWGhbqdvD6Ft8+5/HwIQWX/QqfrtoYOlxgp
 595b+ZnJMdkCR9yDjqHK0pbaG6Uf+JsUf8exhHNOlsloftFwm+1mcf3yh
 ow2TTNrkK4cLsUBwT95DliIKDiFEeD0Pc2na8wrynawFWqjiuNO4p2BLO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="386813749"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="386813749"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 11:09:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="866977601"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="866977601"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 11:09:16 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, francois.dugast@intel.com,
 jose.souza@intel.com
Date: Tue,  3 Oct 2023 11:09:07 -0700
Message-Id: <20231003180909.3241390-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20231003180909.3241390-1-umesh.nerlige.ramappa@intel.com>
References: <20231003180909.3241390-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/3] drm/xe: Fix array bounds check for queries
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

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
2.38.1

