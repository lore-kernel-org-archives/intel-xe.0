Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB44C7EE30
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 10:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA38010E5C9;
	Fri,  3 Mar 2023 10:16:19 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2043210E5C8
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677838577; x=1709374577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZmUfxLxFvp6+8M1AhJsv8pN5lZyK1VUqxsHqzaR/U1c=;
 b=SxErHIvDawVyS3cOoJG15FKAUCNHZz9HN7y9gK++Z4QsusmjhQm0YI6h
 z4F1475iA1D8vjND49YVs0m0pHzyUrwioB9uxtJYKttx6EUkeONaU9P/U
 R6y+YMyJ3EpfiBlKiadPqvbYExwxT4SmSllz7oe/Bm1u4kGTAAWzGCgmy
 rjnxY7EsFrAlnVO3d0SSnXdYz3/5Q25XuPQeBrlrfvI3Uw4+kYTYgwXJj
 gBdZFm1MufR/XjHWSieyxPtrRJb9mZuHdAZUcEH5xEpb1WkB4ZwsPekxd
 QjWgx8qWaCmPG8cWOLBuIwsVjzcT63tuMudEQ4rDbfJEhYDF9XSxCicPe Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="335034908"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="335034908"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:16:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="1004537315"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="1004537315"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:16:16 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Mar 2023 02:16:08 -0800
Message-Id: <20230303101610.21520-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230303101610.21520-1-niranjana.vishwanathapura@intel.com>
References: <20230303101610.21520-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/4] drm/xe/migrate: Use proper BO in kunit
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

