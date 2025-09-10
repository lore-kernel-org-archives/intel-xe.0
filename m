Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F294FCA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 15:12:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC32810E946;
	Wed, 10 Sep 2025 15:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gYgEqRdv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C2610E946
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 15:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757517124; x=1789053124;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rv3AMRy4VpqEypZEwaUKymS2jm5+n+Lnhcn/34ovmps=;
 b=gYgEqRdvdqVjLV/kjCiXjagKIs6QlfuwnVCdv7JH8AkGOx3bUpHj3BO1
 zA3cL8R1oh9Iy1yeCokiYQE640d7AQe37mWSYhNLp7cgv7n37oxB+cuGZ
 CQn2NauapSC0O1oq4+tk7yjmjMQfqrRpZ34mNhAdrsWV6iwwwTl4GSPcY
 +SAPC0i2hhksgGV47DVfZc7gy0KrkEnEyDoxLG03zNeRxOKwcyjS07cKS
 +WHN/QQI5z9IGGODkXojky+hq6gVukc8vaG3HhPUUvtoawibjSi3u4RfV
 JhGtiMQOHvYuEulJuyo0/LZuZ0BDFaOqIVzTjxEpI0wnX7ZfIECr64nb1 A==;
X-CSE-ConnectionGUID: QeHlG9gxQyG+9ot1Fzee+Q==
X-CSE-MsgGUID: GnFdI9HyQHuTt+AdcWbn7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70521672"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="70521672"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 08:12:03 -0700
X-CSE-ConnectionGUID: eY7xDDwGSemB9OeV5t+XDg==
X-CSE-MsgGUID: RFWJV6D3SxK+zLr4Vozl1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="174224588"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.22])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 08:12:02 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH] drm/xe: Fix uninitialized return values
Date: Wed, 10 Sep 2025 17:11:28 +0200
Message-ID: <20250910151128.49693-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

clang warned about two uninitialized variables used as return
values in the exhaustive eviction series.

Fix those.

Fixes: 1f1541720f65 ("drm/xe: Rework instances of variants of xe_bo_create_locked()")
Fixes: 7bcb6e38c14d ("drm/xe/display: Convert __xe_pin_fb_vma()")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h | 2 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c                       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
index a2d1f684a3a8..f097fc6d5127 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
@@ -22,7 +22,7 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
 						       u32 start, u32 end)
 {
 	struct xe_bo *bo;
-	int err;
+	int err = 0;
 	u32 flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_STOLEN;
 
 	if (start < SZ_4K)
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 287b0c4355ef..1fd4a815e784 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -283,7 +283,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	struct xe_bo *bo = gem_to_xe_bo(obj);
 	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
-	int ret;
+	int ret = 0;
 
 	if (!vma)
 		return ERR_PTR(-ENODEV);
-- 
2.51.0

