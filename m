Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF076E9D411
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 16:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FF410E6C6;
	Wed,  4 Feb 2026 16:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iGTkDo2O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B9C10E6D0
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 16:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770223622; x=1801759622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PWLKXbZ4gRKNhikVhMbcEiUuDd4gYGaU6gh8DbPTSZo=;
 b=iGTkDo2OqNveTTNSmwgCXRM6ko+GsXx453ZI6cXU6JvNI0FEpMpkCJtl
 yBKI45i79H8bgSXhxPA5jTaMRVHkSm8u78PxczQtU9xrkPWZ6sp/3OYw8
 FB5/+fiL0XSZzH6BWYwJbpzOofWTPhnanWmC6e4+/XwRf4os1nONqhvps
 yBXYeo3WX1zlDPKAsvWw0Kb3WPzpeLR2/rwnXAL0P9p4weOy9UhHBfUer
 CfcYPhXz91BG8S89eZExkaNgYpMXQFstDmaTs8iRi2R6jNbC78QIwknTs
 dh3yBkVobts4cougx++LZrUBJgaMxWvr63HnCjErfyA3J15uK8eBXopzp A==;
X-CSE-ConnectionGUID: xcT85BjyTbyJHGkASZtQNg==
X-CSE-MsgGUID: yYdRZ9aVSZ+qg0QEOQeT3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70433621"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="70433621"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:47:02 -0800
X-CSE-ConnectionGUID: D+Z/wZTKR26GgBUlMU91Lg==
X-CSE-MsgGUID: BQOhLcDwTDmVdxn9th348A==
X-ExtLoop1: 1
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by fmviesa003.fm.intel.com with ESMTP; 04 Feb 2026 08:47:00 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 2/3] drm/xe/sa: Add lockdep annotations for SA manager
 swap_guard
Date: Wed,  4 Feb 2026 16:46:45 +0000
Message-ID: <20260204164642.3509298-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204164642.3509298-5-satyanarayana.k.v.p@intel.com>
References: <20260204164642.3509298-5-satyanarayana.k.v.p@intel.com>
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

Annotate the SA manager init path to model taking swap_guard while under
reclaim context. This helps lockdep catch potential circular dependencies
between fs_reclaim and swap_guard in debug builds.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

---
V1 -> V2:
- None.
---
 drivers/gpu/drm/xe/xe_sa.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index b738102575d4..5efbb5a09f77 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -89,6 +89,12 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
 		if (ret)
 			return ERR_PTR(ret);
 
+		if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
+			fs_reclaim_acquire(GFP_KERNEL);
+			might_lock(&sa_manager->swap_guard);
+			fs_reclaim_release(GFP_KERNEL);
+		}
+
 		shadow = xe_managed_bo_create_pin_map(xe, tile, size,
 						      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 						      XE_BO_FLAG_GGTT |
-- 
2.43.0

