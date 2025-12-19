Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9D0D7495D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 07:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53D310EBF8;
	Fri, 19 Dec 2025 07:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+LCOwTO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A684010EBF8
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 07:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766129753; x=1797665753;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S4r1vbYgk2Dvijomku/Os2Z/UVyVIWv/X5JpNaMXFZo=;
 b=M+LCOwTOAIvYvsxv24L0OtP7JetZMeqMFYn5zsjnPIQ4dEp7c+B8cnEL
 s41VQlctd4GaglK+gzULsVevc00B3sx7vG/x2zo5RGnzNS4OsbqOpo9g5
 FYhNIbeaBVvyUN8hLmOjadlGpCYJaO5SYK7u/mlx+kkLLRFbxB2iMmVd/
 YjK4z4LLbeTTEL+EY0icvPdy+4d6Y09sEpURHdzAIsCRpU+LnSUjyVwy9
 LF1BKzDavq5unsBSm3B1a4Ty2XWSJZ+Jt9qfTWqdsqhuW76Z4lcqBqhax
 4r/jAG8SQj7NOQlndbEE7l8Ya3FRI+UDM51E9ZbQFRWUjpOFRCJXGqNCf g==;
X-CSE-ConnectionGUID: cz8nqNdBS3uLFabIa+QMqQ==
X-CSE-MsgGUID: hrsukRejSG6JOx7bSMmC8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79546737"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="79546737"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 23:35:53 -0800
X-CSE-ConnectionGUID: DkaURDA9R8mchVspXyOiIQ==
X-CSE-MsgGUID: E9m44cuxRvmYu/X3TiuYXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="198805174"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 23:35:51 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH] drm/xe: select CONFIGFS_FS dependency
Date: Fri, 19 Dec 2025 13:35:14 +0530
Message-ID: <20251219080513.848072-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Xe driver uses configfs functions to expose configuration to userspace.
If CONFIGFS_FS is built as module (=m) when Xe is built-in (=y),
undefined reference errors occur.
Add select CONFIGFS_FS to ensure configfs is built at minimum required
level.

Cc: Matt Roper <matthew.d.roper@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512190827.IeXYj4qg-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202512181854.hPyTAXc5-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202512190407.CcUFXX2F-lkp@intel.com/
Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 4b288eb3f5b0..1094c5fc5bdf 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -46,6 +46,7 @@ config DRM_XE
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
 	select REGMAP if I2C
+	select CONFIGFS_FS
 	help
 	  Driver for Intel Xe2 series GPUs and later. Experimental support
 	  for Xe series is also available.
-- 
2.47.1

