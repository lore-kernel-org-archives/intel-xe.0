Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E77C7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 09:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017AC10E2D6;
	Mon, 23 Jun 2025 09:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hcHhj7TY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2769F10E33E
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 09:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750671468; x=1782207468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SVi/DWhuUPkCMh/G6iuuiB2/+rolfUIFiGYCgT1F6Ls=;
 b=hcHhj7TYf8p9YuAFY2IN5pulFSwGLEJldK0Th5sffvFB0khU4wYgPk3p
 MbW5lzeMRh6NYBWBYR+aY4Gkzzo9ll02LUmtegTtk5W6pf+gsx4ItA1OY
 t8sHi33yoFlejbnwWvRS2iHp73wQ0qQyQjX4bnWt7Y3KFnxY/q1UqCpib
 c57DWyJlSGeF7phJdrxhYOm201Rmini7atXFauP2Vi3mSx9QWem6NAPfc
 VXcwpiWDv9NCOYtqgZFNDBcsuRXqwm/hGeeUsdlgIz26DXCM3W4PNi2vB
 SgFLSrA6Kerqd78/eENoWH3gC+63Dn7PLgJq92+ML8ADfOCoRk6i7kU64 Q==;
X-CSE-ConnectionGUID: +G9UBIBVQ/Ole+i7Ata39Q==
X-CSE-MsgGUID: XIsMJ9dfS2+9UBek/Nu+UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52740313"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52740313"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 02:37:47 -0700
X-CSE-ConnectionGUID: ZqtqP9uWTuqt+EzzKAF5bQ==
X-CSE-MsgGUID: /YnE94sXSiephzehUZCifw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="152057638"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 02:36:48 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2 1/5] drm: Add a firmware flash method to device wedged
 uevent
Date: Mon, 23 Jun 2025 15:31:04 +0530
Message-ID: <20250623100109.1086459-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250623100109.1086459-1-riana.tauro@intel.com>
References: <20250623100109.1086459-1-riana.tauro@intel.com>
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

A device is declared wedged when it is non-recoverable from
the driver context. Some firmware errors can also cause
the device to enter this state and the only method to recover
from this would be to do a firmware flash

v2: modify documentation (Raag, Rodrigo)

Cc: André Almeida <andrealmeid@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 Documentation/gpu/drm-uapi.rst | 6 +++---
 drivers/gpu/drm/drm_drv.c      | 2 ++
 include/drm/drm_device.h       | 1 +
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 263e5a97c080..cd2481458755 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -422,9 +422,8 @@ Current implementation defines three recovery methods, out of which, drivers
 can use any one, multiple or none. Method(s) of choice will be sent in the
 uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
 more side-effects. If driver is unsure about recovery or method is unknown
-(like soft/hard system reboot, firmware flashing, physical device replacement
-or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
-will be sent instead.
+(like soft/hard system reboot, physical device replacement or any other procedure
+which can't be attempted on the fly), ``WEDGED=unknown`` will be sent instead.
 
 Userspace consumers can parse this event and attempt recovery as per the
 following expectations.
@@ -435,6 +434,7 @@ following expectations.
     none            optional telemetry collection
     rebind          unbind + bind driver
     bus-reset       unbind + bus reset/re-enumeration + bind
+    firmware-flash  firmware flash
     unknown         consumer policy
     =============== ========================================
 
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 02556363e918..5f3bbe01c207 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -535,6 +535,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
 		return "rebind";
 	case DRM_WEDGE_RECOVERY_BUS_RESET:
 		return "bus-reset";
+	case DRM_WEDGE_RECOVERY_FW_FLASH:
+		return "firmware-flash";
 	default:
 		return NULL;
 	}
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 08b3b2467c4c..9d57c8882d93 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -30,6 +30,7 @@ struct pci_controller;
 #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
 #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
 #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
+#define DRM_WEDGE_RECOVERY_FW_FLASH	BIT(3)  /* firmware flash */
 
 /**
  * struct drm_wedge_task_info - information about the guilty task of a wedge dev
-- 
2.47.1

