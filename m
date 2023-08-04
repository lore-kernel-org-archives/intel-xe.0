Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A78C001DB
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 21:33:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A262010E119;
	Fri,  4 Aug 2023 21:33:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CD410E009
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 21:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691184779; x=1722720779;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZJlW09QcM0dQCvv7kgZvkIMrnXlz+7wd8n83WDYHbYQ=;
 b=Wwse89Uf9W0jG2x+nZCsUSQRrn/f8Oabx+Gan+fn0McsBZG4HPU9nPO2
 5p0Q/AMkHqnTV0fWFqx7Fyg5t31MaJ1KEgSLT7LHtbo2a1QQ8tEZh8odP
 EGNJr4pFBHb7Foi1SmwO7bBNdVJ5zEX3XQlWqStNmjNMMg4wFbuz9jSxS
 l6l4tikRTXaxZ/DUG3zrZpMVBNWfdfd2nUuIWzzu5HxWT+PFjrdtAHJa/
 wq+5hhFGpnmdKBKkvMi7bK9GO1eeyUjOKs8628VNZzh3wnYOUUlL3S/Iw
 s8q5p+mklRlBAU2ByEzqbMcd3RhOJeOPCstAPvXFeUX7BxDpGuC150ZIa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="370241002"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="370241002"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 14:32:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="820295551"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="820295551"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 14:32:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: jose.souza@intel.com,
 Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Date: Fri,  4 Aug 2023 14:32:51 -0700
Message-Id: <20230804213253.2381705-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230804213253.2381705-1-umesh.nerlige.ramappa@intel.com>
References: <20230804213253.2381705-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe: Fix array bounds check for queries
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

Queries are 0-indexed, so a query with value N is invalid if the
ARRAY_SIZE is N. Modify the check to account for that.

Fixes: 22504d560287 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
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

