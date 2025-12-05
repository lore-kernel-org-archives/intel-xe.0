Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CB9D2CE16
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 03:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDE010E9C7;
	Fri,  5 Dec 2025 03:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFmL0ZkW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2FA10E9C7
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 03:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764904413; x=1796440413;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UICTgJzYPWhifkEmIWbXwNm72wNWskJfjyWdTDMutqo=;
 b=HFmL0ZkWA+za9ofViIXGAo/7lc33dR2R82Kefe7y2xAwyPzDRcn3zlpS
 loaCi0ZC+szmwJ5mOnXps7QFcjuBcaYXO8lP5yJVVt6aj6eS6lCbZ40FT
 y8UMuyT0ZNlFSryz3MeTW8I+jgQEdxy2EvoCkp17Q3jEFC1FvXDq2XIr2
 nvxV1F1O4ZY487m23eW0jlT2GB6yTqyr+ArG1mKXNmv1vaRZ/yG0a/SiS
 fOM/do9mbUhB7U9tS9gmeEhKhXJQje00pzQbrv/2NemVN8eZzWMXcPRdy
 +A1PayC71YahUrZx7eKohx4S3vkdizkn1d1Jyt1+Q84z6P/qN7KJ0Cnll Q==;
X-CSE-ConnectionGUID: RLk97A3VTgmsbjkDbfLcew==
X-CSE-MsgGUID: wLHia5rSQC+m1p+Th7kMAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="65937546"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="65937546"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 19:13:33 -0800
X-CSE-ConnectionGUID: gfM1BjvPQBKiuB+thnzPxw==
X-CSE-MsgGUID: xwJ6q749TlqaVuQkAMEDjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="194234864"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 19:13:31 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH] drm/xe: Use DRM_BUDDY_CONTIGUOUS_ALLOCATION for contiguous
 allocations
Date: Fri,  5 Dec 2025 08:41:13 +0530
Message-ID: <20251205031112.3590252-2-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
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

The VRAM/stolen memory managers do not currently set
DRM_BUDDY_CONTIGUOUS_ALLOCATION for contiguous allocations. Enabling
this flag activates the buddy allocator's try_harder path, which helps
handle fragmented memory scenarios.

This enables the __alloc_contig_try_harder fallback in the buddy
allocator, allowing contiguous allocation requests to succeed even when
memory is fragmented by combining allocations from both(RHS and LHS)
sides of a large free block.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6713
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 9f70802fce92..ef6cfb8af0ac 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -82,6 +82,9 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
 		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
 
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
+		vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
+
 	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
 		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
-- 
2.52.0

