Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2966FCA1012
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 21:37:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D7110E946;
	Wed,  3 Sep 2025 21:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="avgMgjWL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1917110E946
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 21:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756935446; x=1788471446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XAo+wiiOVwAlx323prdoTpD09Dm17xG019GLQ9+5eEs=;
 b=avgMgjWL5HO+PbrnfMGKL4wNPsgeK26bgHKKi2c9UdCdJ6vj1DuO5cNY
 bnLNNdphzTVLl/ot2s9oiXplBuyZKfxhk3J0mHQ3cvEZLqcyxJNkb6LWq
 c6HCN7i6Qg/XwRxRAU3UWRGp6gA4YRBuIsRd2yu/z9xw1z1oPH04JA4s1
 YBQJ2PjtdJI4mevqtrJGhBkHzQ2+R7YM+tGQ4Ehj8wQ5l0xMo28rj9dZN
 kp4IMGRBUuc4CccpykyFKtNmoQu5tnHjeImwW79gmZLzGgLyJ5rM6URKl
 6sXFejKwjxkr8ctkyV8H6sFj1PVYaO/zMJXe0MGlqusZlH+NG/+KnusS5 A==;
X-CSE-ConnectionGUID: 029NPmyDQVWnNqkDK18HFQ==
X-CSE-MsgGUID: 19tBEx+/RPqO4vxnpEyw8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59178978"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59178978"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 14:37:26 -0700
X-CSE-ConnectionGUID: bLMTG9afSOmQbCa4yX622A==
X-CSE-MsgGUID: 7xp/h+6SRXuUGWJ6AHHRKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="170957535"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 14:37:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/7] drm/xe: Drop "gt_" prefix from xe_gt_WARN() macros
Date: Wed,  3 Sep 2025 23:36:07 +0200
Message-ID: <20250903213712.6364-3-michal.wajdeczko@intel.com>
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

Those WARN messages will already include GT-specific "GT%u:" prefix
so there is no point to include additional "gt_" prefix.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_printk.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index fd9cba14383a..f2091c734aba 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -41,10 +41,10 @@
 	drm_WARN_ONCE(&gt_to_xe(_gt)->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
 
 #define xe_gt_WARN_ON(_gt, _condition) \
-	xe_gt_WARN((_gt), _condition, "%s(%s)", "gt_WARN_ON", __stringify(_condition))
+	xe_gt_WARN((_gt), _condition, "%s(%s)", "WARN_ON", __stringify(_condition))
 
 #define xe_gt_WARN_ON_ONCE(_gt, _condition) \
-	xe_gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringify(_condition))
+	xe_gt_WARN_ONCE((_gt), _condition, "%s(%s)", "WARN_ON_ONCE", __stringify(_condition))
 
 static inline void __xe_gt_printfn_err(struct drm_printer *p, struct va_format *vaf)
 {
-- 
2.47.1

