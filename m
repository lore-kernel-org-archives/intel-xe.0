Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44C4CCFA13
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 10:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F51110F30E;
	Thu, 30 Apr 2026 10:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kehO8xTb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1269E10F30E
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 10:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777546447; x=1809082447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aAcA5qd66SPh+tm+SKRQgAK5Y2++87AFpKT7mpsIIrk=;
 b=kehO8xTbl5WrmXZfLJGnVEkcBiuuaL0jyccRbZqnTqrmT/l+rJJSYHSL
 Q7PqzJeBufSQ46pVfJHAlv2SZwb6j4LmOmbpQaLd/VrH8dVntErf3iHdF
 BiYqxlEmghMkMqUFqFH2X8Yu5/0Th8l2VLSghRRKS3CdAh7iW80FQoT/H
 LainrSLf9iyMmdcfdywfL+n0bPHJd7dOEiRvKcHIPLJzZHJrzxb7m5itG
 NmA4Pb8dNjw4vxi1niqiGRU53Gi5BNnOKOKu4BlofF0Lir3ifBjZUBbKP
 gmXtZbemlrZvfu6XiKct8x1evQmOiinWNrjXs3yTIYeVHdwN1WODGgT3F w==;
X-CSE-ConnectionGUID: eYb0emZcR3uzy2om9MUZcw==
X-CSE-MsgGUID: X48LLG9eRFKelawKj5h+XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89586089"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="89586089"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:54:07 -0700
X-CSE-ConnectionGUID: 6MfUXDBUTWWSN5uebyPEpA==
X-CSE-MsgGUID: +NNL5l17TRyEaT4BKW8p3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233518958"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.250.15])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:54:02 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 24/24] drm/xe/eudebug: Disable SVM in Xe for Eudebug
Date: Thu, 30 Apr 2026 13:51:20 +0300
Message-ID: <20260430105121.712843-25-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
References: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
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

From: Maciej Patelczyk <maciej.patelczyk@intel.com>

Missing SVM pagefault intergration. Temporary exclude SVM in Xe until
there is SVM support in EU Debugger.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 78d4673665b4..542198a60ed9 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -81,7 +81,7 @@ config DRM_XE_GPUSVM
 	depends on DRM_XE
 	depends on !UML
 	depends on ZONE_DEVICE
-	default y
+	default n
 	select DEVICE_PRIVATE
 	select DRM_GPUSVM
 	help
@@ -132,6 +132,7 @@ config DRM_XE_FORCE_PROBE
 config DRM_XE_EUDEBUG
 	bool "Enable gdb debugger support (eudebug)"
 	depends on DRM_XE
+	depends on !DRM_XE_GPUSVM
 	default y
 	help
 	  Choose this option if you want to add support for debugger (gdb) to
@@ -139,6 +140,9 @@ config DRM_XE_EUDEBUG
 	  With debugger support, Xe will provide interface for a debugger to
 	  process to track, inspect and modify resources.
 
+comment "Gdb debugger support (eudebug) disabled for CPU to GPU address mirroring"
+	depends on DRM_XE_GPUSVM
+
 menu "drm/Xe Debugging"
 depends on DRM_XE
 depends on EXPERT
-- 
2.43.0

