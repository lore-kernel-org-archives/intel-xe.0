Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F2DC77B6C
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 17:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A00A10E0BF;
	Mon,  3 Apr 2023 17:57:50 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6A1890BB
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 17:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680544668; x=1712080668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B1KHTC+o8ecfjnMzRYYUnNonTiaQmu6mlwPT1MBxdm4=;
 b=j42c21HoLcjdmt+7PR/NIEsYAD0cP3M5P4+LMr3ovQY+8KbzdOpGm64+
 injj98oSCcnto8nSle29BPHSk6u/eUCA5BcwMDiYfeUbMMoSZAEydfh2u
 mGfIxSI0zXqttV+zVCaSRL57SknpDg9P+BjBp3MPKXgrS/zChWLjUerly
 Van53iWe0hkxF3PdFq0XmnqfWrNnTeR6v1Fgy2Wo3vlHsxMxq+BO1Vn3+
 CLeKNv/0wVV816XC+3FM532LwTmYc8+z6sYGYf+tFb5CE2XTIGAZlk3oq
 aF97U8wibNbo+eDBkrDYsy6ezDCkGu2+3vrL5RpewXRwEh3HgCyEExMmn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="341999532"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="341999532"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 10:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="686065674"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="686065674"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 10:57:42 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  3 Apr 2023 10:57:38 -0700
Message-Id: <20230403175739.32183-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230403175739.32183-1-niranjana.vishwanathapura@intel.com>
References: <20230403175739.32183-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/3] drm/xe/tests: Set correct expectation
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
Cc: thomas.hellstrom@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In xe_migrate_sanity_kunit test, use correct expected value as
the expected value was not only used for the xe_migrate_clear(),
but also for the xe_migrate_copy() operation.

v2: Add 'Fixes' tag and update commit text

Fixes: c1a4e05c9aeb ("drm/xe: Stop accepting value in xe_migrate_clear")
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 90f4e1c4f029..862d11b2210f 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -147,6 +147,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 	xe_map_memset(xe, &sysmem->vmap, 0, 0xc0, sysmem->size);
 	xe_map_memset(xe, &bo->vmap, 0, 0xd0, bo->size);
 
+	expected = 0xc0c0c0c0c0c0c0c0;
 	fence = xe_migrate_copy(m, sysmem, sysmem->ttm.resource,
 				bo->ttm.resource);
 	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo sysmem -> vram" :
-- 
2.21.0.rc0.32.g243a4c7e27

