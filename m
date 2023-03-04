Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6146AC64EC4
	for <intel-xe@archiver.kernel.org>; Sat,  4 Mar 2023 00:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2009B10E791;
	Sat,  4 Mar 2023 00:14:12 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096F410E78B
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Mar 2023 00:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677888850; x=1709424850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=20RcmSymPxpHfMYaaUkj9NL4kDyli49wM3/B5w/gy1A=;
 b=cAmoECU32RAAHL61RtKU4svh7EMDlPCPznaeKvQxj/8mlH/m1sMf2mZB
 JAcyR0Tq+rwfH1kKF4mTyN4iUooPIWw5m97Bxd+hn9v5MJA6Z/48oxLYi
 lcYswTZfx6z4TQoinHJYfdofYGW1kIGPdrm3VbhV+asbn4h/wcmyu8Dgd
 Er6OY6Lmwp0fnMw0PXJTM7FgZbA/9kNVvcljIyQQbNBQ1lHjzy2jmbuMl
 ulcUlP0bewY8pR9M048tVJksstl+YNRvfBicR9P+/NhhJoYhCxyZAKZW2
 ngX+BTHLUZydGC1e7vSjQgupiNOO12CP6q6ZHrUmNjUo2EVgTGR9To2hj w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="336710235"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="336710235"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 16:14:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="799389747"
X-IronPort-AV: E=Sophos;i="5.98,232,1673942400"; d="scan'208";a="799389747"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 16:14:09 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Mar 2023 16:14:01 -0800
Message-Id: <20230304001403.11761-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230304001403.11761-1-niranjana.vishwanathapura@intel.com>
References: <20230304001403.11761-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 2/4] drm/xe/migrate: Use proper BO in kunit
 test
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
Cc: dev@mblankhorst.nl, thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Pass source object as 'bo' in xe_migrate_copy() call

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 3d8f4dfe2834..12f1681ff705 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -150,7 +150,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 	xe_map_memset(xe, &sysmem->vmap, 0, 0xd0, sysmem->size);
 	xe_map_memset(xe, &bo->vmap, 0, 0xc0, bo->size);
 
-	fence = xe_migrate_copy(m, sysmem, bo->ttm.resource,
+	fence = xe_migrate_copy(m, bo, bo->ttm.resource,
 				sysmem->ttm.resource);
 	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo vram -> sysmem" :
 				 "Copying small bo vram -> sysmem", test)) {
-- 
2.21.0.rc0.32.g243a4c7e27

