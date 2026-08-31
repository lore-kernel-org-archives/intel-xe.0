Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A93C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 08:36:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E029E10E777;
	Mon, 31 Aug 2026 08:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKC2e+jR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E38D10E767
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 08:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788165382; x=1819701382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5i0BA8xmy2C7u240lNV3+c0UQTIpjyLBd1WLKyl9tgc=;
 b=gKC2e+jRTmgouAJQEFhe5lVQ7njkdspM2XCWuW8ygTg9wKsKq002jGei
 yVxAh8CB8cdMwP2J/jgf5Zz9kU5zSOtk4U90VAJb/KvlhkdS2bpykz4cf
 2lQ/TjNO0iRgDwDjy6GR0W7ldEO8Q5WUs0gQuRQh7BYmFMI0p3aRXwl1J
 L8mjHr3km0TZbvWgeLTnNpY97TDrqcd7EoczmM/CLbz+1fCBvwV/BxX4i
 Y7NEpUpwTqax/R6MS80DDkrKDxUsQ2gAstiQZqi2N4X9w+q4EH9lYw08A
 gWKtDTBcSxBdPmBJHroTJcvHMYH1A35OUyzMyAOr2kmImMBX7KKjW7kWx g==;
X-CSE-ConnectionGUID: NiV+AYPhTpqHwX5ZgcRQOQ==
X-CSE-MsgGUID: P5rSfvC0T6S8EwttblCTvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106089712"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="106089712"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 01:36:22 -0700
X-CSE-ConnectionGUID: b5VFzfItS7SCFoD9o1jnLA==
X-CSE-MsgGUID: rSyzwCPGRz+Bm9znG/lETg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="293546339"
Received: from unknown (HELO ksatya-dev.iind.intel.com) ([10.190.229.72])
 by fmviesa001.fm.intel.com with ESMTP; 31 Aug 2026 01:36:20 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v7 04/10] drm/xe: use SZ_4K for default VRAM region page size
Date: Mon, 31 Aug 2026 14:06:06 +0530
Message-ID: <20260831083605.2115328-16-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831083605.2115328-12-satyanarayana.k.v.p@intel.com>
References: <20260831083605.2115328-12-satyanarayana.k.v.p@intel.com>
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

The memory region query uses PAGE_SIZE for the default min_page_size
value. On systems where PAGE_SIZE is 64K, this incorrectly reports a
64K minimum page size for normal regions.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V6 -> V7:
- New commit
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index dc975f595368..8ee5e3676935 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -290,7 +290,7 @@ static int query_mem_regions(struct xe_device *xe,
 				mem_regions->num_mem_regions;
 			mem_regions->mem_regions[mem_regions->num_mem_regions].min_page_size =
 				xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ?
-				SZ_64K : PAGE_SIZE;
+				SZ_64K : SZ_4K;
 			mem_regions->mem_regions[mem_regions->num_mem_regions].total_size =
 				man->size;
 
-- 
2.53.0

