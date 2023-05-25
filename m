Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E5DC77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 11:46:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C3010E0A3;
	Thu, 25 May 2023 11:46:17 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DF310E0A3
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 11:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685015175; x=1716551175;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f8Hf6umMMms3K31v9otgqJLjNnAdb5hAmGuAzTVCAp0=;
 b=cECptJiq7/xxYRh7fVNJE5iy7eYiIrXevtEPdEUdIMtrhKYsXfq0+cnk
 g3M9eTgSODQnbV5D7unUoxn3QxC8s9HQEsi62gMxrMHAVTB4mfKKy4DD2
 IonPX62oPI4Vz+Qzi9dpYAy0YNYvHDh+JgRVZR24tj+MepwbcdTQ3okbU
 mdZKfeGIOBe+DBx+MJVlJmCb9VgWFhMS0yVpiG0TFAlbRUda1Tu41Vp50
 iSDBuiX7PDKIo7TBRa5ffWNvL40QrBV8cf2VOMFZOk/Z97HnRicmgb4B4
 QdD2ruBluF0gLY3zjLb7/rA5odmtAyISmYJDj7zQXRAKK2ViMp9ZC7dmT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="440219436"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="440219436"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 04:46:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="774649489"
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; d="scan'208";a="774649489"
Received: from jwosulli-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.1.81])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 04:46:12 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 12:45:42 +0100
Message-Id: <20230525114543.400106-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/bo: further limit where CCS pages are
 needed
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

No need to allocate extra pages for this if we know flat-ccs AUX state
is not even possible, like for normal system memory objects.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c82e995df779..f994dbed634b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -283,6 +283,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct xe_device *xe = xe_bo_device(bo);
 	struct xe_ttm_tt *tt;
+	unsigned long extra_pages;
 	int err;
 
 	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
@@ -291,12 +292,15 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 
 	tt->dev = xe->drm.dev;
 
+	extra_pages = 0;
+	if (xe_bo_needs_ccs_pages(bo))
+		extra_pages = DIV_ROUND_UP(xe_device_ccs_bytes(xe, bo->size),
+					   PAGE_SIZE);
+
 	/* TODO: Select caching mode */
 	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags,
 			  bo->flags & XE_BO_SCANOUT_BIT ? ttm_write_combined : ttm_cached,
-			  DIV_ROUND_UP(xe_device_ccs_bytes(xe_bo_device(bo),
-							   bo->ttm.base.size),
-				       PAGE_SIZE));
+			  extra_pages);
 	if (err) {
 		kfree(tt);
 		return NULL;
-- 
2.40.1

