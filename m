Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13185EE645C
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 13:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 481AF10E63D;
	Fri, 15 Sep 2023 13:23:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A264D10E628;
 Fri, 15 Sep 2023 13:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694784219; x=1726320219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r/DkPwtFIiU2nAZ2sFLqYEMvEnRRqwmzPhhcoE0VrAQ=;
 b=E/H4+QHawIPQVB/xWDIwwLTtpoF3vudUmcFnox2pQiyLrjOQA2cKPLmb
 Pp5toYr8VYTSp+n4lzyvHYSAJW/iHbAAODv7fy9IofIOMh1o8ycudnxhK
 usCIHaGhsfBIKY07O7pDFUzEsDCSvjnvJqzQ6WFoL8lfyqos4bg/ppkvm
 0VqzP3igLgQEcPGdRPO5E3xMVrzOI/Lh413FNVAnZZZb9TNkveL1L/v6s
 yiJrZWV0ZBIkm8kb9Y8lnxRgyjHq0nnwfOMxvdK6+DXSDCKR+sPq0FEw0
 gu92q0zV0jiCe91LE6idiaqDXeIRAQBUZo2cKQERSyOzC1blkN8mr+T3L g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="364292144"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="364292144"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:23:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="810515451"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="810515451"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:23:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Sep 2023 06:23:43 -0700
Message-Id: <20230915132346.1845909-12-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230915132346.1845909-1-lucas.demarchi@intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 11/14] lib/igt_fb: Add Xe2 mocs to
 XY_FAST_COLOR_BLT
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_fb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 722996779..d353b439f 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2754,6 +2754,7 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
 	struct blt_copy_object *blt;
 	enum blt_tiling_type blt_tile;
 	uint64_t stride;
+	uint32_t devid = intel_get_drm_devid(fb->fd);
 
 	blt = malloc(sizeof(*blt));
 	igt_assert(blt);
@@ -2763,7 +2764,11 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
 
 	blt_tile = fb_tile_to_blt_tile(fb->modifier);
 	stride = blt_tile == T_LINEAR ? fb->strides[plane] : fb->strides[plane] / 4;
-	mocs = intel_get_uc_mocs_index(fb->fd) << XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
+
+	if (intel_graphics_ver(devid) >= IP_VER(20, 0))
+		mocs = intel_get_uc_mocs_index(fb->fd) << XE2_XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
+	else
+		mocs = intel_get_uc_mocs_index(fb->fd) << XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
 
 	blt_set_object(blt, handle, fb->size, memregion,
 		       mocs,
-- 
2.40.1

