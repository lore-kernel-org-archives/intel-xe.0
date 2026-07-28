Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F663C54F4D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 16:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC0110E97D;
	Tue, 28 Jul 2026 16:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUK/D/eR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE89E10E97D
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 16:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785255086; x=1816791086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5NyIt7+AS/7m41XhsBuw9cEmva/DM+GtAQLvUQUG2so=;
 b=cUK/D/eRf8HvRmD5y3IPQm0uLGrdN8/4lSeE2OMD5KpyF06DTQKblV0R
 FCxkTwTVnSg6/2NGASEOgZZUWwVeR5Ly5beNN8GkSk67ACJATDApYwvsb
 ytt9BioOyO+dN6z0qw2wk7TZtI5tkapnnGWedKkUVVBP/w14VcO2MgNTX
 Lb92i+Yev3iQM6aJMkmiYp9zzYXCtHfifT1qgWBoeSvfUOz9h5N8Tm0kp
 O2BW3ewtUsAYeGyq88NGFD/77EAjUNjXgzLXCW3DCoLTRy/B9hTYaq2Tq
 sUk6rZgRFYTDdqdInn7h1DHHTMJvkPaMpsjcmp5HUa1PFy5KjsFnTjZXl g==;
X-CSE-ConnectionGUID: jqAn8g5MS3mxHTJWofQh3Q==
X-CSE-MsgGUID: yYJeCm7DQtidAxB/hJzeNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103386273"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="103386273"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:26 -0700
X-CSE-ConnectionGUID: sYYml3F2SouPR8YVp6MOXA==
X-CSE-MsgGUID: WHx6XuKJSXCn0No2HR3fMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="259819351"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 09:11:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: [PATCH v2 11/22] drm/xe/log: Extend components list with hardware
 items
Date: Tue, 28 Jul 2026 18:10:26 +0200
Message-ID: <20260728161039.579-12-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728161039.579-1-michal.wajdeczko@intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
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

Update our super macro with new top level hardware components.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
v2: follow enum xe_ras_component values (Aravind)
---
 drivers/gpu/drm/xe/abi/xe_log_abi.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
index fe6e59236f72..69acb5847543 100644
--- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
@@ -128,6 +128,10 @@ enum xe_log_location_bits {
  *     @SIGID is the default xe_sigid for the component (without the XE_SIGID_ prefix)
  */
 #define DEFINE_XE_LOG_COMPONENTS(define) \
+	DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
+	DEFINE_XE_LOG_HARDWARE_COMPONENTS(define)
+
+#define DEFINE_XE_LOG_SOFTWARE_COMPONENTS(define) \
 	/* */									\
 	define(SYSTEM, 1, PCI, SW, "Linux PCI Subsystem")			\
 	define(SYSTEM, 2, DRM, SW, "DRM")					\
@@ -155,6 +159,14 @@ enum xe_log_location_bits {
 	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
 	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
 	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\
+
+#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
+	define(HARDWARE, 1, DEVMEM, DEVICE_MEMORY, "Device Memory")		\
+	define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")		\
+	/*     HARDWARE, 3, RESERVED */						\
+	define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")			\
+	define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")				\
+	define(HARDWARE, 6, SOC, SOC_INTERNAL, "SoC Internal")			\
 	/* eod */
 
 /**
-- 
2.47.1

