Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A25EC43458
	for <intel-xe@archiver.kernel.org>; Sun, 12 Jul 2026 11:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A66610E411;
	Sun, 12 Jul 2026 11:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cl66PzLW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B5D10E411
 for <intel-xe@lists.freedesktop.org>; Sun, 12 Jul 2026 11:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783854894; x=1815390894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cI4q3KF/YhFd/7hAE3f4hlNfjK+ytKajpl/sIK8Bt0M=;
 b=Cl66PzLWKevhegHtYdKJ2S0cReGmdhUKa+8nYwHM2KXBDizrgYsOU7jK
 YRb32u4oo3TtlRxziaxVLX7c9Ts/SykErfAc1elgjmc7UnZV3LQJgJ+Fm
 oaggkH3eIF8sD8hfpR0P5GnyvwoSk4SmXHOklnx6YtuP2Dqj27vIneDr7
 RIEsDZZYm2Dy+GPSgecHVwohMl85Gf5/MHYcrnSzNOuftQz6aV0kcvhzh
 eBrEquIX4cbhTHQJsUjdbq/RUHwnpsGkzVCouEOiQ4/9vleegN8OyObRV
 GbhZtMJUPeERpq13KuJriYu0DFYFyPJJDAJL0TOa9QPkUUllyGSv1qs1A w==;
X-CSE-ConnectionGUID: tNmXe22vRdi9X81UPtH8cA==
X-CSE-MsgGUID: lvCuW3hPQoaMAyqH9UFt+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84457622"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84457622"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 04:14:54 -0700
X-CSE-ConnectionGUID: TrTIw6qwRYSamNK2cziXNA==
X-CSE-MsgGUID: ByoUJsqpT/yKW2r3xOFt0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255367710"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa007.jf.intel.com with ESMTP; 12 Jul 2026 04:14:54 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v3 3/8] drm/xe: add Kconfig option for debug page-size
 allocation control
Date: Sun, 12 Jul 2026 16:45:12 +0530
Message-ID: <20260712111517.1956177-4-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712111517.1956177-1-naresh.kumar.g@intel.com>
References: <20260712111517.1956177-1-naresh.kumar.g@intel.com>
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

Add a Kconfig option to enable the debugfs interface used to control user
BO page-size allocation policy for validation and development.

When enabled, the driver exposes a debugfs knob that can force 2M mode,
force 1G mode, or select mixed round-robin page-size allocation behavior
on platforms that support multiple page sizes.

This option is intended for debug/testing only and does not provide a
stable userspace interface.

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 01227c77f6d7..1ab911b1c9de 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -86,6 +86,23 @@ config DRM_XE_KUNIT_TEST
 
 	  If in doubt, say "N".
 
+config DRM_XE_DEBUG_PAGE_SIZE
+	bool "Enable user BO page-size allocation control (debug)"
+	depends on DRM_XE_DEBUG && DEBUG_FS
+	default n
+	help
+	  Expose a debugfs knob to override the page-size allocation policy
+	  (forced 2M, forced 1G, or mixed round-robin) used for user BOs on
+          platforms that support multiple page sizes.
+
+	  This is an unstable debugfs interface intended for validation and
+	  development only. Its layout, contents and existence may change or
+	  be removed at any time with no regression warranty. It has no
+	  effect when disabled.
+
+	  Recommended for driver developers only.
+	  If in doubt, say "N".
+
 config DRM_XE_DEBUG_GUC
         bool "Enable extra GuC related debug options"
         depends on DRM_XE_DEBUG
-- 
2.43.0

