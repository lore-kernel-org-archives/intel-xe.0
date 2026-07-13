Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBC8C44506
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 02:27:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A047B10E0D5;
	Mon, 13 Jul 2026 02:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WzQtLG6z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D079810E0D5
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 02:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783909661; x=1815445661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jXxxAlLb33DxviBWPYGtpki6peuf1CVFVNdqjtuF5/w=;
 b=WzQtLG6zh/OXqZsAm7lzrb2diPCPmxv/pW3tARrbMwuB1rXuHOb/K1mX
 ShyIV8IYWT0dZjz47KOIaLvB3di9OQY68dxWbRGNrhn1pqDU4UOf4xAjz
 TiXoMld5mtF584bAbW85VRgYbLs+aOcUjlOSqKnxY+Ty9Jz12vjatTCYE
 jrkLgdUmcnWji82womVn0qmAOgbiIfQXlELoPAYR+jjsbd7jFTPjafMot
 kDOsB2IUOViajwksnksHZy28cpsTHeVO9WYQZ18xez4mSXlACgD9Fp4eN
 DD2trKv5pm5nrDpfC7y4SpdC6Girm9xf6rAnwSLLVTP8rxs3puhkyKjrH Q==;
X-CSE-ConnectionGUID: T1DiQkY/R8WzHpCd8XHIjQ==
X-CSE-MsgGUID: yEEckXTGSDSwrWg9b2bhig==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88197450"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="88197450"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 19:27:40 -0700
X-CSE-ConnectionGUID: BdTNZ7XTQyyaGAiSOQZDnA==
X-CSE-MsgGUID: cB2ZvdgPTwmBmrgLChNDvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="253680026"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa006.jf.intel.com with ESMTP; 12 Jul 2026 19:27:40 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	naresh.kumar.g@intel.com
Subject: [PATCH v4 2/8] drm/xe: add Kconfig option for debug page-size
 allocation control
Date: Mon, 13 Jul 2026 07:55:35 +0530
Message-ID: <20260713022541.2581814-3-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713022541.2581814-1-naresh.kumar.g@intel.com>
References: <20260713022541.2581814-1-naresh.kumar.g@intel.com>
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

v4
- remove default n and refactor help and description

Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 01227c77f6d7..79118d9efd93 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -86,6 +86,22 @@ config DRM_XE_KUNIT_TEST
 
 	  If in doubt, say "N".
 
+config DRM_XE_DEBUG_PAGE_SIZE
+	bool "Enable debug control for user BO page-size allocation"
+	depends on DRM_XE_DEBUG && DEBUG_FS
+	help
+	  Expose a debugfs knob to override user BO page-size allocation
+	  handling for validation and debug. Supported modes include forced
+	  2M, forced 1G, and a mixed mode that exercises 4K, 64K, 2M, and
+	  1G page-size paths on platforms that support them.
+
+	  This is an unstable debugfs interface intended for development and
+	  validation only. Its layout, contents, and existence may change or
+	  be removed at any time with no regression warranty.
+
+	  Recommended for driver developers only.
+	  If in doubt, say "N".
+
 config DRM_XE_DEBUG_GUC
         bool "Enable extra GuC related debug options"
         depends on DRM_XE_DEBUG
-- 
2.43.0

