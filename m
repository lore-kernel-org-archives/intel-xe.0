Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF77ECAC583
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 16:59:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3B010E2B0;
	Tue,  9 Sep 2025 16:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKhZBu3d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5065910E2D6
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 16:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757437196; x=1788973196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2bUpCgHSxUuFAYXvC8t5wBuwy867qMXi2Bp1ig41OP0=;
 b=gKhZBu3dTNlgQnbrsX0VM8FiRd7VG6uMnMSjCLdzgLnoUU1c6PZsRe9f
 Mwj5Fyvgy2hMlqfoixoelBzeoL5CTSbeC7ExJH8CRL9B6KILJ7PGYFgq5
 Jx0iqOcPEdoN7aRacAmbkEMdgTzIhebkGEFrnad6GPCXwaszRbqdo2OB6
 LyMfPEsVYtRIuEJurwE5LGeVOFLWK/fux9lvsajO2wG8TKw48hvuyA6C5
 PRzP4xt059qS4q/1kj9xyHWlDUUD2QJ8LnJlpn+lnNkdyoGmYe40zdaTU
 BlGPSFZrhHxKGA0LCfW8OvtMVA+wb5pkZ1R//nxuzG4VESj/dOVrT1Ass Q==;
X-CSE-ConnectionGUID: +sCP+DuuS+eU5ke3jPubIw==
X-CSE-MsgGUID: ll1ISppvSPC4IOVYT9H2dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="71148956"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="71148956"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 09:59:56 -0700
X-CSE-ConnectionGUID: WBKucqlGTY+qOcQ2edzQDQ==
X-CSE-MsgGUID: 9HSjD37oRmeZX+ljoMtS5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="177426208"
Received: from dopitz-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.31])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 09:59:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 3/5] drm/xe: Prepare format for GT-oriented messages in one
 place
Date: Tue,  9 Sep 2025 18:59:37 +0200
Message-ID: <20250909165941.31730-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909165941.31730-1-michal.wajdeczko@intel.com>
References: <20250909165941.31730-1-michal.wajdeczko@intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v2: use uppercase for FMT macro (Rodrigo)
---
 drivers/gpu/drm/xe/xe_gt_printk.h | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index f2091c734aba..dcc45628cca9 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -10,8 +10,10 @@
 
 #include "xe_gt_types.h"
 
+#define __XE_GT_PRINTK_FMT(_gt, _fmt, _args...)	"GT%u: " _fmt, (_gt)->info.id, ##_args
+
 #define xe_gt_printk(_gt, _level, _fmt, ...) \
-	drm_##_level(&gt_to_xe(_gt)->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+	drm_##_level(&gt_to_xe(_gt)->drm, __XE_GT_PRINTK_FMT((_gt), _fmt, ##__VA_ARGS__))
 
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
+	xe_gt_WARN_type((_gt),, _condition, __XE_GT_PRINTK_FMT((_gt), _fmt, ##__VA_ARGS__))
 
 #define xe_gt_WARN_ONCE(_gt, _condition, _fmt, ...) \
-	drm_WARN_ONCE(&gt_to_xe(_gt)->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+	xe_gt_WARN_type((_gt), _ONCE, _condition, __XE_GT_PRINTK_FMT((_gt), _fmt, ##__VA_ARGS__))
 
 #define xe_gt_WARN_ON(_gt, _condition) \
 	xe_gt_WARN((_gt), _condition, "%s(%s)", "WARN_ON", __stringify(_condition))
@@ -72,7 +77,7 @@ static inline void __xe_gt_printfn_dbg(struct drm_printer *p, struct va_format *
 	dbg = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, NULL);
 	dbg.origin = p->origin;
 
-	drm_printf(&dbg, "GT%u: %pV", gt->info.id, vaf);
+	drm_printf(&dbg, __XE_GT_PRINTK_FMT(gt, "%pV", vaf));
 }
 
 /**
-- 
2.47.1

