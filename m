Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F3AC54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 05:28:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C50D10E2FB;
	Thu, 14 Mar 2024 05:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZlYzyR1w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332A310E21D
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 05:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710394094; x=1741930094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TjFtO+4Bb/V5N5k9+5Tw5pvxN4guDjSVHBIBUy+FC1w=;
 b=ZlYzyR1wVTE+SzfczhYsfHzXqlU4U73gUQ4rlMge6i+AbahJMkjpk25F
 q2rG+E2JDvtkovL3SOBvEe9tWFh48e3gqI45jPYeVUxTEzfk5RSRnTCzf
 dq8ddlqVda0b8Pvq/9phWTHrpOissTzn+tZdkgwLzzyeBF2mMbz9XjpJD
 c/YV01ejAfQopVbU9z1xpTYOv3wG2Vg3WtE1Gt50h9y6TUCZv8flL79Ae
 LWrYw8H2D/OoZ5T7k28d1d/vKh1Pmb4Ygb1W1JhrkVnO9llOqGlOvnhyO
 +b2WKdidS0i6cWiUIzAwg0+452/46VoOh6OvMpi+vX3VWbbPPFTmTRMwd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5050005"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5050005"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 22:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="35298640"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 22:28:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/2] drm/xe: Stop passing user flag to xe_bo_create_user()
Date: Wed, 13 Mar 2024 22:26:18 -0700
Message-ID: <20240314052619.2628396-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240314052619.2628396-1-lucas.demarchi@intel.com>
References: <20240314052619.2628396-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It's quite redundant to pass XE_BO_CREATE_USER_BIT to
xe_bo_create_user() since the only difference of that function is to
force that flag. Stop passing the flag in the few cases that were
explicitly doing so.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 2 +-
 drivers/gpu/drm/xe/xe_bo.c            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 9f6d571d7fa9..2a86dc4eb8af 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -125,7 +125,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 
 	kunit_info(test, "running %s\n", __func__);
 	bo = xe_bo_create_user(xe, NULL, NULL, size, DRM_XE_GEM_CPU_CACHING_WC,
-			       ttm_bo_type_device, XE_BO_CREATE_USER_BIT | params->mem_mask);
+			       ttm_bo_type_device, params->mem_mask);
 	if (IS_ERR(bo)) {
 		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
 			   PTR_ERR(bo));
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d7e0deb1b869..afb8292af692 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2276,7 +2276,7 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 			       DRM_XE_GEM_CPU_CACHING_WC,
 			       ttm_bo_type_device,
 			       XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
-			       XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
+			       XE_BO_SCANOUT_BIT |
 			       XE_BO_NEEDS_CPU_ACCESS);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
-- 
2.43.0

