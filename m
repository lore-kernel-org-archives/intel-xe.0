Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E17DD2ED0F
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 14:35:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E09F10E60E;
	Tue, 20 Jan 2026 14:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQQor9Z4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2CF10E610;
 Tue, 20 Jan 2026 14:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768919727; x=1800455727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eANmgwh6I7wTk1hINXLsRVD7TElAfA3Ioh4MeZ+ZhVk=;
 b=lQQor9Z4mbiv18ZOOUyl/SoCa7ISj+xuPEdqNZ3MlBK3DUy93W6P9zYn
 efBA7ZVhmri36WcP7FgH8HvdpABbFKyU6KFlm+N9ca/oNty4xKz/BQOlF
 At8tbvn3ib1n2fQ+9E4UXljUz+5NIlyTy6Vjrp4Q01Yb6QzSZfsK9FTuh
 +AiYW/kOEgMSQtl5dm5nuMpSkN4I/0U/sABzYlouuJM3pPsriDeZ2JrUQ
 EzWKS9Vh9jA6jrLrCODRqEpx6at9bMA4vd5W2RqydUxbRkqS6GpIbdqBL
 bwoX7NJO0lpGX9MLy3McSR0rIeiZvWwYHeTXNFAdw++Aaa3eHFCUbp2+V w==;
X-CSE-ConnectionGUID: A/skw1YeQMGXjA1nuBUx7Q==
X-CSE-MsgGUID: /PuhvK0uRxC1dp4oUtt4lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69327964"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="69327964"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 06:35:27 -0800
X-CSE-ConnectionGUID: M1e4gMhcRS+TJWhcxUGkaA==
X-CSE-MsgGUID: GX2Ni0XkRgSYCpcypKM4sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="206172001"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.250])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 06:35:26 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/xe: Select CONFIG_DEVICE_PRIVATE when
 DRM_XE_GPUSVM is selected
Date: Tue, 20 Jan 2026 15:34:59 +0100
Message-ID: <20260120143459.9485-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120143459.9485-1-thomas.hellstrom@linux.intel.com>
References: <20260120143459.9485-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

CONFIG_DEVICE_PRIVATE is a prerequisite for DRM_XE_GPUSVM.
Explicitly select it so that DRM_XE_GPUSVM is not unintentionally
left out from distro configs not explicitly enabling
CONFIG_DEVICE_PRIVATE.

v2:
- Select also CONFIG_ZONE_DEVICE since it's needed by
  CONFIG_DEVICE_PRIVATE.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index c34be1be155b..39edcdc6d33c 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -80,8 +80,9 @@ config DRM_XE_GPUSVM
 	bool "Enable CPU to GPU address mirroring"
 	depends on DRM_XE
 	depends on !UML
-	depends on DEVICE_PRIVATE
 	default y
+	select ZONE_DEVICE
+	select DEVICE_PRIVATE
 	select DRM_GPUSVM
 	help
 	  Enable this option if you want support for CPU to GPU address
-- 
2.52.0

