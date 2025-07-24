Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0CFC83F26
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 06:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA04F10E888;
	Thu, 24 Jul 2025 06:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lG+sCt+a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A10610E888
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 06:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753337174; x=1784873174;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/yaLEoSk/sT1wjWHqOteNyJ4El5XFVdBW0kbj6ilbWg=;
 b=lG+sCt+a6bfjO3Nqx95Tgv5ob9U8jpAXTxG6JUiRuv3BwrzwxU85qRXe
 C6nEaFSnlXbUdCaRBdp3z6xcFjih36X3CiWIsT7/UJz+i8KXVSLRaIHPR
 te7kHvYJJhN3vzXelGhskPBQLuaP9kxdQV+BBSpkNzAycg9D8rYX8g6pN
 OMe3k2GqyJEKHNW93COfnRuNCu0BL4Pc11gSB41DcSMev1h1s27hPaes1
 bk3Kjt8SPIYJQGYgSFZm60xRAFlpi17zIhyl9fIQ7BJT0bP3AUOraw56p
 QpS1fiHayb+idNXNPTqsWOclGDreJ9SU1wayeZfVqsiH7ne4+Zfb41dDk g==;
X-CSE-ConnectionGUID: 8wlH7c3vQ+a/nmKk1p+52Q==
X-CSE-MsgGUID: pEjyJ5c7RNuO4vAzM1QM/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="67063929"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="67063929"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 23:06:13 -0700
X-CSE-ConnectionGUID: SRzpgPyLQWeQTh1VEAlcMQ==
X-CSE-MsgGUID: OV6xX+jiThmbH3NQ9Fmd1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; d="scan'208";a="160733350"
Received: from unknown (HELO priyanka.iind.intel.com) ([10.190.216.153])
 by fmviesa010.fm.intel.com with ESMTP; 23 Jul 2025 23:06:11 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, intel-xe@lists.freedesktop.org,
 tilak.tirumalesh.tangudu@intel.com
Subject: [PATCH] drm/xe/uapi: Add documentation for
 DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING
Date: Thu, 24 Jul 2025 11:36:10 +0530
Message-Id: <20250724060610.3310628-1-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add documentation for drm_xe_gem_create structure flag
DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING.

v2: Modified to be in a more generalised way.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 include/uapi/drm/xe_drm.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index e2426413488f..2ceafa5305d2 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -760,7 +760,11 @@ struct drm_xe_device_query {
  * gem creation
  *
  * The @flags can be:
- *  - %DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING
+ *  - %DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING - This flag modifies the GEM
+ *    object allocation strategy by deferring physical memory allocation
+ *    until the object is either bound to a virtual memory region via
+ *    VM_BIND or accessed by the CPU. As a result, no backing memory is
+ *    reserved at the time of GEM object creation.
  *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT
  *  - %DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM - When using VRAM as a
  *    possible placement, ensure that the corresponding VRAM allocation
-- 
2.34.1

