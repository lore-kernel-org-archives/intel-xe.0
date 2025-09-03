Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A32CA1010
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 21:37:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187FA10E944;
	Wed,  3 Sep 2025 21:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ObQj7WAs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6E310E944
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 21:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756935445; x=1788471445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uF/0NEoFGuT9higLrxzQTF4OC+r11PCzUA5PLbHHStU=;
 b=ObQj7WAs4qYZWc+RQIVPBtU6cggFg1mtFnldXpOvVaifN4uPnZacTS4M
 6A/62cld3COaiGWReER2dR/AKm3ytf5bQY//j8QwkaZIMMosWhXXSJ9WO
 ptrJKRH3JQTmKDf3j7f7iIuuYkZFydR0pNWpEXBydl67lihDomgv7siLt
 ZulIOk0nvamJLCe63jKzb2mKqaE2I3xyC6hMJlcknEuk+3W2Gv/KSXG3p
 9oRNK0qY/4FAydu3BIoIQHJnEGkUdHLg67RwvHzjR+4ENNDYsHPQ+rSMS
 kAy+tQB4jH28bogCIGhbO7lpdfgdPPLMvBdHN7KE0ghnouil2CJAUMnMY Q==;
X-CSE-ConnectionGUID: l1z5JqKwTxiRNluHNJBd0A==
X-CSE-MsgGUID: CbHhiywjT6eVMzVSmRX63A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59178974"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59178974"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 14:37:25 -0700
X-CSE-ConnectionGUID: 7J+WX/E2R6m6F9/uApQdNg==
X-CSE-MsgGUID: fkpLEcuzRziFPDioR8TlDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="170957527"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 14:37:24 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/7] drm/xe: Keep xe_gt_err() macro definitions together
Date: Wed,  3 Sep 2025 23:36:06 +0200
Message-ID: <20250903213712.6364-2-michal.wajdeczko@intel.com>
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

There is no need to keep them separated. No functional changes.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_printk.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index 11da0228cea7..fd9cba14383a 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -13,12 +13,15 @@
 #define xe_gt_printk(_gt, _level, _fmt, ...) \
 	drm_##_level(&gt_to_xe(_gt)->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
 
-#define xe_gt_err_once(_gt, _fmt, ...) \
-	xe_gt_printk((_gt), err_once, _fmt, ##__VA_ARGS__)
-
 #define xe_gt_err(_gt, _fmt, ...) \
 	xe_gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
 
+#define xe_gt_err_once(_gt, _fmt, ...) \
+	xe_gt_printk((_gt), err_once, _fmt, ##__VA_ARGS__)
+
+#define xe_gt_err_ratelimited(_gt, _fmt, ...) \
+	xe_gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
+
 #define xe_gt_warn(_gt, _fmt, ...) \
 	xe_gt_printk((_gt), warn, _fmt, ##__VA_ARGS__)
 
@@ -31,9 +34,6 @@
 #define xe_gt_dbg(_gt, _fmt, ...) \
 	xe_gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
 
-#define xe_gt_err_ratelimited(_gt, _fmt, ...) \
-	xe_gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
-
 #define xe_gt_WARN(_gt, _condition, _fmt, ...) \
 	drm_WARN(&gt_to_xe(_gt)->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
 
-- 
2.47.1

