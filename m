Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36315CA1012
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 21:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB60910E94B;
	Wed,  3 Sep 2025 21:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IUaE/OgU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1392810E94A
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 21:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756935450; x=1788471450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dD0OBEu2Wt+66r8EhQXgIkSOGTPlSeCA9OKlK3B8jxA=;
 b=IUaE/OgURO/WL3Txp5iAD6YeA+uk/hHvszQdC06EvjqjMNIe0Z7smqBA
 /oGy4v+Ul8zJ45Ui7LVRHpwAPuGUHCGIcu5kOi9usKtfrYBrNbwCq/3MU
 VWKKU1GlXqJnKtUMH6IGS/2UjSxOur953i3XDjKNaKMqNLgDh1EuX/7MT
 RpWVZlFpX1upTWSMr9LDm9hJyoXm4Lx53HkJ10l0V4Auhm+TTe+v/0RSY
 CdGmAzzoS0hf5ku3hIwWW+zGhXdDpjWAIpibXYHvlstv1BZzJyG5H6+rN
 joUkl5I4tSqbyiSXDWK5a5fWUlN9Rn77wjvCgcbQT4jW9CwbnyWuez9us g==;
X-CSE-ConnectionGUID: nzN75ZJKQ8SZXqg2XWyLlQ==
X-CSE-MsgGUID: Zq+GDs8UTFiIuhm9Lr2whQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59178985"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59178985"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 14:37:30 -0700
X-CSE-ConnectionGUID: 4cAPEqT9Q3+kg2dcTxclEQ==
X-CSE-MsgGUID: vY/dfYeQTV+lF3qFfBtqRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="170957574"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 14:37:29 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 5/7] drm/xe: Define verbose debug macros
Date: Wed,  3 Sep 2025 23:36:10 +0200
Message-ID: <20250903213712.6364-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903213712.6364-1-michal.wajdeczko@intel.com>
References: <20250903213712.6364-1-michal.wajdeczko@intel.com>
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

We might want to add (and in some cases already have) some debug
level messages that are too verbose and need to be guarded by the
CONFIG_DRM_XE_DEBUG. To simplify that define verbose variant of
our printk debug macros that will be compiled out on non-debug
builds, in same way like we already did with xe_asserts() macros.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_printk.h   | 6 ++++++
 drivers/gpu/drm/xe/xe_printk.h      | 6 ++++++
 drivers/gpu/drm/xe/xe_tile_printk.h | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index 8dc4217ddb4e..69c4553d0f80 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -35,6 +35,12 @@
 #define xe_gt_dbg(_gt, _fmt, ...) \
 	xe_gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+#define xe_gt_dbg_verbose		xe_gt_dbg
+#else
+#define xe_gt_dbg_verbose(_gt, ...)	typecheck(struct xe_gt *, (_gt))
+#endif
+
 #define xe_gt_WARN_type(_gt, _type, _condition, _fmt, ...) \
 	xe_tile_WARN##_type((_gt)->tile, _condition, _fmt, ## __VA_ARGS__)
 
diff --git a/drivers/gpu/drm/xe/xe_printk.h b/drivers/gpu/drm/xe/xe_printk.h
index 691d3611b889..9ffa26c869da 100644
--- a/drivers/gpu/drm/xe/xe_printk.h
+++ b/drivers/gpu/drm/xe/xe_printk.h
@@ -36,6 +36,12 @@
 #define xe_dbg(_xe, _fmt, ...) \
 	xe_printk((_xe), dbg, _fmt, ##__VA_ARGS__)
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+#define xe_dbg_verbose			xe_dbg
+#else
+#define xe_dbg_verbose(_xe, ...)	typecheck(struct xe_device *, (_xe))
+#endif
+
 #define xe_WARN_type(_xe, _type, _condition, _fmt, ...) \
 	drm_WARN##_type(&(_xe)->drm, _condition, _fmt, ## __VA_ARGS__)
 
diff --git a/drivers/gpu/drm/xe/xe_tile_printk.h b/drivers/gpu/drm/xe/xe_tile_printk.h
index ed951cdb08cb..33ebfd9722d3 100644
--- a/drivers/gpu/drm/xe/xe_tile_printk.h
+++ b/drivers/gpu/drm/xe/xe_tile_printk.h
@@ -34,6 +34,12 @@
 #define xe_tile_dbg(_tile, _fmt, ...) \
 	xe_tile_printk((_tile), dbg, _fmt, ##__VA_ARGS__)
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+#define xe_tile_dbg_verbose		xe_tile_dbg
+#else
+#define xe_tile_dbg_verbose(_tile, ...)	typecheck(struct xe_tile *, (_tile))
+#endif
+
 #define xe_tile_WARN_type(_tile, _type, _condition, _fmt, ...) \
 	xe_WARN##_type((_tile)->xe, _condition, _fmt, ## __VA_ARGS__)
 
-- 
2.47.1

