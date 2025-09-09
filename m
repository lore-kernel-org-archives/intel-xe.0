Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A17FCAC583
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 16:59:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E31010E263;
	Tue,  9 Sep 2025 16:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b4m51U7P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A7810E263
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 16:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757437192; x=1788973192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=grHO4+bTy6i4HGWyiKOK0LH5JGvDSn1J0eDcyZPlecs=;
 b=b4m51U7Pks2pSBtOMV2D/WyStDKvS8rbeyU0TRDoOyxxuzgcYd+5GGZR
 I7IkCNG23hmpS250Ie7ZtPeF4V36sTy2M0rpMCfn4/TAHtBbJZqicd4Xp
 1+jSpu5cVLISvi5qYa6+EEqjXoRbb2IEl9j0pEU5wfQyDvPwN3neomx9n
 98CiekSV1VLQzyowN1+kceUo3ZBdWGE9AzrtvXJaiSfv9CHwvXs8ERwTy
 sQyrKp/jrSms9VRypEtU0EF7mrRLGhhno+52kL5QXlCx+riw9jJZVX3ub
 5X36gkdM184JEriEy5EJBVP2M5/Wn0zsTryNCyo1aunW4DESbrB7D/uc5 A==;
X-CSE-ConnectionGUID: kGT6zMztTvO9/IAbIWVJOg==
X-CSE-MsgGUID: az8hmTzRRjyKq+ZGn4Z8jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="71148946"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="71148946"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 09:59:52 -0700
X-CSE-ConnectionGUID: 2iwUGKZsS6y9M6iIS5W7DA==
X-CSE-MsgGUID: G0AZDkV5S0yYSL0zAzh3UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="177426190"
Received: from dopitz-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.31])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 09:59:51 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 1/5] drm/xe: Keep xe_gt_err() macro definitions together
Date: Tue,  9 Sep 2025 18:59:35 +0200
Message-ID: <20250909165941.31730-2-michal.wajdeczko@intel.com>
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

There is no need to keep them separated. No functional changes.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

