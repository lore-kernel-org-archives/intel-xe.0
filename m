Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5949DC4167D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 21:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D34310E2F9;
	Thu, 14 Dec 2023 21:41:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7E110EA00
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 21:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702590033; x=1734126033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GML2l+oNQNqV45W7gX4XoAtlwtsM8Wjs1isMsjkUtVM=;
 b=QOz9E6+/mNMWX9dmlgUfjoC0bL4bMfr53IrLzr7RxeSVOv8z5okm5bP6
 CTZQY/oCIUuBbWZt0kAhMaokgx0xJt1wyr/bkf7jyM/cid9esNqZiqPeu
 0iTQlvym/RiNAhYLsATp5fvw3fIORdu+gubqZqZTcmZ3tvnRVYI+TRTIM
 +49PmXAYxaYBFjTLYAzzIjDytoxSV63dHhl5UD73QJH4aOR1PXBMv2+Yn
 zwt06s8wpMuHb++TN1ZryDitOxDkrmQLIKGKjbI96EsPqvkd6yXqbFKlS
 GAGC94NgJYshRXF9x5asOfn2UgpO2hHByvfiWJ2xx0EAzBzx1Uta/jBHe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="374696751"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="374696751"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 13:40:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="844878447"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="844878447"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 13:40:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/3] drm/xe/bo: Remove unusued variable
Date: Thu, 14 Dec 2023 13:39:53 -0800
Message-Id: <20231214213954.3223263-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231214213954.3223263-1-lucas.demarchi@intel.com>
References: <20231214213954.3223263-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

bo is not used since all the checks are against tbo. Fix warning:

	../drivers/gpu/drm/xe/xe_bo.c: In function ‘xe_evict_flags’:
	../drivers/gpu/drm/xe/xe_bo.c:250:23: error: variable ‘bo’ set but not used [-Werror=unused-but-set-variable]
	  250 |         struct xe_bo *bo;

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7c0037aecff3..8e4a3b1f6b93 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -247,8 +247,6 @@ int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 static void xe_evict_flags(struct ttm_buffer_object *tbo,
 			   struct ttm_placement *placement)
 {
-	struct xe_bo *bo;
-
 	if (!xe_bo_is_xe_bo(tbo)) {
 		/* Don't handle scatter gather BOs */
 		if (tbo->type == ttm_bo_type_sg) {
@@ -265,8 +263,6 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 	 * For xe, sg bos that are evicted to system just triggers a
 	 * rebind of the sg list upon subsequent validation to XE_PL_TT.
 	 */
-
-	bo = ttm_to_xe_bo(tbo);
 	switch (tbo->resource->mem_type) {
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1:
-- 
2.40.1

