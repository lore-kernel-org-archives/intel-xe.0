Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C925CD4F24
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 18:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A3910EBE8;
	Tue, 12 May 2026 18:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="me6WP4cD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6752910EBD5
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 18:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778610837; x=1810146837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o3j0Q6tGvGRIX/PPXOmJd6FAinWVV1DTHoirj3NTuEk=;
 b=me6WP4cD6/Sc0KwO/eg4V3YbRCHukBvOEQxKNz0qsMh8eymwNx4CFrTp
 CGeNywGP7BSwlrOsgCXVxrUxFyAwNL5bHnhXPRNoqnOG9GtrQSWlIdukh
 kfbfRLuK39trAKdoyBiQHobpFCDUnfS/fSTTGrS+jm5ndzQ57fYQRM9AE
 kDlH0YqGMnsWXMpqaEnslAmiIriShUiDnZZ+xUu6IOidHSBAfqg9OSy/B
 c1UDD2B4Kso/JUl4hHX2MWMEjCG7Etgh4Q3d6IcLKzg/j6QRjlH76gzc8
 4ffcKSYR9Yu/tNEzDRaNXmtrOP2an4iwTMqTU7wIzntZbqVRr5l0jCiwK Q==;
X-CSE-ConnectionGUID: 80uhnIDQRZ+flvN6iAvHjw==
X-CSE-MsgGUID: N/Y6ye48QHu7RgLpveHLGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79425721"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="79425721"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 11:33:57 -0700
X-CSE-ConnectionGUID: c3QUZLVAS8aekkbj6HOzdg==
X-CSE-MsgGUID: jO89WvMET5mboqRnpfT+aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="234791089"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 11:33:55 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 3/7] drm/xe/display: Prefer forward declarations
Date: Tue, 12 May 2026 20:33:38 +0200
Message-ID: <20260512183342.3374-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512183342.3374-1-michal.wajdeczko@intel.com>
References: <20260512183342.3374-1-michal.wajdeczko@intel.com>
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

There is no need to include xe_device.h in the xe_display.h header.
Include it in the xe_display.c file instead.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 1 +
 drivers/gpu/drm/xe/display/xe_display.h | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 0747044f7c2a..263e92203c9d 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -36,6 +36,7 @@
 #include "intel_hotplug.h"
 #include "intel_opregion.h"
 #include "skl_watermark.h"
+#include "xe_device.h"
 #include "xe_display_bo.h"
 #include "xe_display_pcode.h"
 #include "xe_display_rpm.h"
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index fb1db84db966..95acf0fd8e7b 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -6,9 +6,11 @@
 #ifndef _XE_DISPLAY_H_
 #define _XE_DISPLAY_H_
 
-#include "xe_device.h"
+#include <linux/types.h>
 
 struct drm_driver;
+struct pci_dev;
+struct xe_device;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 
-- 
2.47.1

