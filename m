Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EB0E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 15:47:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6A110E5F4;
	Wed, 18 Feb 2026 15:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dPtjpmsQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C038710E5EB
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 15:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771429665; x=1802965665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6gBstJ0Kv7iAhf89FS7aB7OUVTTVfhrz6y/PulL8t0A=;
 b=dPtjpmsQ8VKPAcPsYM+GQopyLhDan7aTCA6t+ZethQn0Z3QDpKI7wh9+
 1mlwGsa29RXln9pc8J83zH5zZmaYW0arXJiIbGBQKdBrsKS8nuGE07LJQ
 aRBrkzCcPbF9UiX3KjQJBA7fggz7yySxfk5rJsbb/L7qRwfZxsMlrclue
 /zMWd+P1usuFihJvN7nKpf285gB129e9iZ7EufjqcVzARDgnXiNlq3Bfs
 fH8SoxyD/mu1rZdWivO8nvnwYB2AFLUhVZbZMwc9sbAnT38LSRksfSCAD
 0i7JWTrp4pvNUnGWc66GoHu3xXRh+gh9U5JwHVxU870/UkANUTxNCJgDH g==;
X-CSE-ConnectionGUID: 3eWjZ6EuTPiVDgJgbQ0A9g==
X-CSE-MsgGUID: wvSVmVKwRRymQOE7UFt7/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83224414"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="83224414"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:47:45 -0800
X-CSE-ConnectionGUID: Dpi61IxQRuK4GsxQg8hDCA==
X-CSE-MsgGUID: iZLG9/VZTzOboIF7/1QZiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="212889151"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by fmviesa007.fm.intel.com with ESMTP; 18 Feb 2026 07:47:44 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v6 3/3] drm/xe/sa: Add lockdep annotations for SA manager
 swap_guard
Date: Wed, 18 Feb 2026 15:47:32 +0000
Message-ID: <20260218154728.1508151-8-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218154728.1508151-5-satyanarayana.k.v.p@intel.com>
References: <20260218154728.1508151-5-satyanarayana.k.v.p@intel.com>
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

Annotate the SA manager init path to model taking swap_guard while under
reclaim context. This helps lockdep catch potential circular dependencies
between fs_reclaim and swap_guard in debug builds. Without this annotation,
lockdep is unaware of this chain until the shrinker runs.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

---
V5 -> V6:
- None.

V4 -> V5:
- Fixed typo in commit message (Michal).

V3 -> V4:
- None.

V2 -> V3:
- Updated commit message (Matt).

V1 -> V2:
- None.
---
 drivers/gpu/drm/xe/xe_sa.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index bdb52606aed3..12e0435bd96f 100644
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

