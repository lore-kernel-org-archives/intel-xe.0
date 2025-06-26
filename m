Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63118C7EE33
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 20:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B1C89023;
	Thu, 26 Jun 2025 20:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cpvUtI/s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB0489023
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 20:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750971393; x=1782507393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0vc7neUU9iSGqVKX07xqr7RzyoDBDkfTkZNhJNx/0IY=;
 b=cpvUtI/sL7NWxKkXBQESYMwfvyVS3aQK0qUVUD1+vyrgIyiJW3xp6uWG
 RQJswyFdL/1+BxOP4cb+kCzBAdnxAh5rsoOxhCFU+RD8zc2J5TZ7waaZn
 Go+4SKtjSkpunrPANMF3qT99jVDPz1tjLi9yFQdaJ+C45jDRzoy5RxJb6
 pP1jDuJ/+fNmGVCcekBr49TzczhDi23UDK2vhOS/YB8mPeadm6nfIuXHa
 HJD5Rb/kfWLqwPYpRItcF5kABBQdFhqbCOv/994AlzVjGeRThoafHikKe
 FHx3HU+p5F9Fhdn5SVBBaGs5cZmPi6ZBn5dINTwyJkBNHb+MefMpnE8Pg w==;
X-CSE-ConnectionGUID: axHI7el3QuaK46FX91ADNw==
X-CSE-MsgGUID: M1NiE5ZFRYm17iaXfDyblw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53360375"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="53360375"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 13:56:33 -0700
X-CSE-ConnectionGUID: AKZLh49UTFGRSsbfFNRvAg==
X-CSE-MsgGUID: RSs/cGKsQfiNeLSnhbNPkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="157003209"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 13:56:32 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Harry Austen <hpausten@protonmail.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 2/2] drm/xe: Allow dropping kunit dependency as built-in
Date: Thu, 26 Jun 2025 13:56:19 -0700
Message-ID: <20250626-xe-kunit-v1-2-2440e6d9a4b5@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626-xe-kunit-v1-0-2440e6d9a4b5@intel.com>
References: <20250626-xe-kunit-v1-0-2440e6d9a4b5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-a7f9c
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

From: Harry Austen <hpausten@protonmail.com>

Fix Kconfig symbol dependency on KUNIT, which isn't actually required
for XE to be built-in. However, if KUNIT is enabled, it must be built-in
too.

Fixes: 08987a8b6820 ("drm/xe: Fix build with KUNIT=m")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Harry Austen <hpausten@protonmail.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 553c29e1030b1..827bc75b8b48f 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_XE
 	tristate "Intel Xe2 Graphics"
-	depends on DRM && PCI && (m || (y && KUNIT=y))
+	depends on DRM && PCI
+	depends on KUNIT || !KUNIT
 	depends on INTEL_VSEC || !INTEL_VSEC
 	depends on X86_PLATFORM_DEVICES || !(X86 && ACPI)
 	select INTERVAL_TREE

-- 
2.49.0

