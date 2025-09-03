Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D78DCA1013
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 21:37:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1485510E949;
	Wed,  3 Sep 2025 21:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IzMEXSz8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE6910E946
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 21:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756935448; x=1788471448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/DqiXOKbr+haT2HGBLbPfPi/XL9UkBV27pQqi1z1yIU=;
 b=IzMEXSz8GWdo7MQ8Eim9Y2bqg99kDli4DXdC87udWhVo9ZEKZdoiJOuu
 dgmIh+LODPBxQp8e/pItkGTIYgRt+Ydr+v5sc3ZePsjWmx8fvc5hDk+qR
 EmyK9C7qkeeg8K3gr/p94zSq04EcFWnpiP3tC+jSHb91ClPxb6KsNO6qz
 An5PhtP5WxReMTiZ8mSeg3aP9i5NtutAk22fmn3T/9OaL7uU5bpmoW0Zf
 vmtFEdlO4D4NFUdXXJG4VgKnNhFaf5DsZTfGZfdkbXBtV3hUeCGupC0hF
 AyscKwtP1MXNGSLfQor5tYoTGQ1jEIlzDHF1HXWyOsuvsVfWz8R08K+J+ g==;
X-CSE-ConnectionGUID: /ouXkOeLR0SVu9E2Omykig==
X-CSE-MsgGUID: ie2ye5CYToWbnWCue6nSZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59178982"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59178982"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 14:37:27 -0700
X-CSE-ConnectionGUID: vEEd2P6rSI+H8o8ynI9Q+A==
X-CSE-MsgGUID: 8/cqDRLxQ0WlVq2tJHkN8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="170957541"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 14:37:26 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/7] drm/xe: Prepare format for GT-oriented messages in one
 place
Date: Wed,  3 Sep 2025 23:36:08 +0200
Message-ID: <20250903213712.6364-4-michal.wajdeczko@intel.com>
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

To avoid code duplication (and thus potential mistakes) and to
allow easier changes (if needed) of the prefix format of the
GT-oriented messages, prepare that prefix in dedicated macro.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_printk.h | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index f2091c734aba..5aaacaa6780c 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -10,8 +10,10 @@
 
 #include "xe_gt_types.h"
 
+#define __xe_gt_printk_fmt(_gt, _fmt, _args...)	"GT%u: " _fmt, (_gt)->info.id, ##_args
+
 #define xe_gt_printk(_gt, _level, _fmt, ...) \
-	drm_##_level(&gt_to_xe(_gt)->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+	drm_##_level(&gt_to_xe(_gt)->drm, __xe_gt_printk_fmt((_gt), _fmt, ##__VA_ARGS__))
 
 #define xe_gt_err(_gt, _fmt, ...) \
 	xe_gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
@@ -34,11 +36,14 @@
 #define xe_gt_dbg(_gt, _fmt, ...) \
 	xe_gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
 
+#define xe_gt_WARN_type(_gt, _type, _condition, _fmt, ...) \
+	drm_WARN##_type(&gt_to_xe(_gt)->drm, _condition, _fmt, ## __VA_ARGS__)
+
 #define xe_gt_WARN(_gt, _condition, _fmt, ...) \
-	drm_WARN(&gt_to_xe(_gt)->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+	xe_gt_WARN_type((_gt),, _condition, __xe_gt_printk_fmt((_gt), _fmt, ##__VA_ARGS__))
 
 #define xe_gt_WARN_ONCE(_gt, _condition, _fmt, ...) \
-	drm_WARN_ONCE(&gt_to_xe(_gt)->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+	xe_gt_WARN_type((_gt), _ONCE, _condition, __xe_gt_printk_fmt((_gt), _fmt, ##__VA_ARGS__))
 
 #define xe_gt_WARN_ON(_gt, _condition) \
 	xe_gt_WARN((_gt), _condition, "%s(%s)", "WARN_ON", __stringify(_condition))
@@ -72,7 +77,7 @@ static inline void __xe_gt_printfn_dbg(struct drm_printer *p, struct va_format *
 	dbg = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, NULL);
 	dbg.origin = p->origin;
 
-	drm_printf(&dbg, "GT%u: %pV", gt->info.id, vaf);
+	drm_printf(&dbg, __xe_gt_printk_fmt(gt, "%pV", vaf));
 }
 
 /**
-- 
2.47.1

