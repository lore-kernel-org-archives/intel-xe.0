Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65765ECE57A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 13:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4FF10E7BE;
	Tue, 10 Sep 2024 13:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ccrj3rZk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF3110E7BE
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 13:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725973923; x=1757509923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CjQmzg0BXwzPTuv3/TllwkJHZkMQNMnb1Nl1PbMXnqs=;
 b=ccrj3rZkIMHY+1tfwKFM3FgxbADZHNAfOTVjHXEwx6mMKOttq0IfunU/
 ednA4ghkDMsUTeF40Ja9oCvHeg2baeW78tbtBqvXeKq/ND479j0WAlf2c
 scXtu0gcBeMcrH+lTtKAC8SGuoiF04aPpd9fQ5NmyT+XfBHpE+2opJ7kZ
 XySzSvZVgqeXo8oJBzINxvMo7dBGf12GnOaN7SqZRt2kfWnlCDf6b+NBh
 wkt6+JURTJu6fiJaBFKbIXTTndczjYLi0glk+fQ3FlLChaTJ8L4rslAd5
 M6xvXYnr9I/f6dM8srW7CNIJr2Y6NS7hL+KDLuCFwmBuOPug5IL/QNFTH Q==;
X-CSE-ConnectionGUID: /7YYjxuMSauQW9v6Mkrw1A==
X-CSE-MsgGUID: OXqio7i7SBSJbNmx0d5O1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24861238"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24861238"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:12:03 -0700
X-CSE-ConnectionGUID: M0gPZZzySa2/8AjjkgXK6Q==
X-CSE-MsgGUID: JXMRdmTMQhyRc180iBKjQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67037964"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.215])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:12:01 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 3/4] drm/xe/client: use mem_type from the current resource
Date: Tue, 10 Sep 2024 14:11:48 +0100
Message-ID: <20240910131145.136984-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240910131145.136984-5-matthew.auld@intel.com>
References: <20240910131145.136984-5-matthew.auld@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Rather extract the mem_type from the current resource. Checking the
first potential placement doesn't really tell us where the bo is
currently allocated, especially if there are multiple potential
placements.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 3cca741c500c..578d2825c1fc 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -168,12 +168,7 @@ static void bo_meminfo(struct xe_bo *bo,
 		       struct drm_memory_stats stats[TTM_NUM_MEM_TYPES])
 {
 	u64 sz = bo->size;
-	u32 mem_type;
-
-	if (bo->placement.placement)
-		mem_type = bo->placement.placement->mem_type;
-	else
-		mem_type = XE_PL_TT;
+	u32 mem_type = bo->ttm.resource->mem_type;
 
 	if (drm_gem_object_is_shared_for_memory_stats(&bo->ttm.base))
 		stats[mem_type].shared += sz;
-- 
2.46.0

