Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B988C001DB
	for <intel-xe@archiver.kernel.org>; Mon, 14 Aug 2023 22:37:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4FA10E021;
	Mon, 14 Aug 2023 22:37:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1B310E021
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Aug 2023 22:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692052662; x=1723588662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RTBWVrIzoxWRL8qqf8TlDVE8+teQifj6wSIN8j2v8jc=;
 b=j4+jc/p2OgVzAyN39mUvDsanX/GUXL7RWDVUWYZyO4FDXvmrn+3dI/j+
 pIFFQLdBaBREdgSOWBKE4TE0mxMhUbrKTwT6+6qQiP/BEDU0UBjttSgt2
 TJfvV3dZ5OVo+F68FLdf4OLvDt3ObKjOtmrXbue5LDVQEWbBZ1kNnpj3N
 /SbkbeoUXu/RPxyhbvGwMCwzE1vUlrpw4HZp9edTnA9mhGiWF+6QshxC5
 PMnuJDqI9yQ4TAuEBO0UCahN4QJ9gyzfwim8M1iGXMbr7zYRC+56Dyi7m
 ewfWMGdhWl5krCKe7lq4+c4AFl8z7e+FH/ABx8ahx7jNCmjGPEJq5gswZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403130428"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="403130428"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 15:37:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="1064239871"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="1064239871"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 15:37:40 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 14 Aug 2023 15:37:31 -0700
Message-Id: <20230814223734.375449-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230814223734.375449-1-umesh.nerlige.ramappa@intel.com>
References: <20230814223734.375449-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/4] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
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
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Queries are 0-indexed, so a query with value N is invalid if the
ARRAY_SIZE is N. Modify the check to account for that.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 7ea235c71385..297e93a0eb8c 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -385,7 +385,7 @@ int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	    XE_IOCTL_DBG(xe, query->reserved[0] || query->reserved[1]))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, query->query > ARRAY_SIZE(xe_query_funcs)))
+	if (XE_IOCTL_DBG(xe, query->query >= ARRAY_SIZE(xe_query_funcs)))
 		return -EINVAL;
 
 	idx = array_index_nospec(query->query, ARRAY_SIZE(xe_query_funcs));
-- 
2.38.1

