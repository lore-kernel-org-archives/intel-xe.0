Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F089CD6E56
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 10:35:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5FF1130CE;
	Mon,  1 Jun 2026 10:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjtBk0Xj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B5A1130CE;
 Mon,  1 Jun 2026 10:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780310121; x=1811846121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mD1eIrq6FrXMRchkARB+zPAOx4hwVnhaRRr6OVZwHt8=;
 b=kjtBk0Xj4PuMoVPB1bOfW3PkUfcoH3B7CW0m9iI+KQ3W3DmbIJBda0v+
 S/xhsfZf8IlsodTbrXQp3QxWIbmHvFXPpJhapPy3u8z1jP3x8m4xXA/dW
 BdFclwpxLIwrn/fkR7YOLh6NxaNXc/NkazbPdYCTAfldEZx3q1on3U/3J
 UlO523ipgQs6gNX32YeVnKdPvDR0H6jHpCsQ7GYtXHA8mmyehoEABF45o
 pHNmVPSUuaT8K67R6pDfGdQIz7/+jbGu2pIpCZ7uoOavzslfN8YOHppuQ
 gR62Q+Tog8bqG8Cx1iuoTx18PFPtjP8eRquA7lLYLabPkX62GeJYMTezn A==;
X-CSE-ConnectionGUID: 4B8KnbSkTAiKdTL8LEORWA==
X-CSE-MsgGUID: 8umXNzd0QoSBwstPKaQVqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80797241"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="80797241"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 03:35:21 -0700
X-CSE-ConnectionGUID: xXeEiXZjT+a8CIHv6h4VtQ==
X-CSE-MsgGUID: kYBSL6rXQ+KNaSA9qVNEHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="242728421"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.121])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 03:35:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com, ville.syrjala@linux.intel.com, jani.nikula@intel.com
Subject: [CI 2/5] drm/i915/xe: Enable HPD polling later during system resume
Date: Mon,  1 Jun 2026 13:34:57 +0300
Message-ID: <f9803b937ba3044052a81e1673ac374809548ba7.1780310011.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780310011.git.jani.nikula@intel.com>
References: <cover.1780310011.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Imre Deak <imre.deak@intel.com>

The detect hook of connectors - called by HPD polling - will check if
user accesses are enabled and prevent the connector detection if that's
not the case. Accordingly enable user accesses during system resume by
calling intel_display_driver_enable_user_access() before enabling HPD
polling.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 810d93fefcbc..c0d3e7d12823 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -452,8 +452,8 @@ void xe_display_pm_resume(struct xe_device *xe)
 
 	if (intel_display_device_present(display)) {
 		intel_display_driver_resume(display);
-		drm_kms_helper_poll_enable(&xe->drm);
 		intel_display_driver_enable_user_access(display);
+		drm_kms_helper_poll_enable(&xe->drm);
 	}
 
 	if (intel_display_device_present(display))
-- 
2.47.3

