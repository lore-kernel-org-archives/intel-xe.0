Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2040CC5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39D010F0EE;
	Wed, 12 Aug 2026 19:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzbCgYul";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D2A10F0E8
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562125; x=1818098125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NIjfHHgam+60soW9G3Lw+XNUmXRGB+Qawh8n5vObaUQ=;
 b=lzbCgYulU4WSq3h0eZ8dH8NJFRkZzQIfs4PxjHBuxUewDN/biNShuuOG
 cgzYJqdIrzds2Qk3zmfC1P8/SnuXc2hfSgWDvL0VRcLD7kVPiXlX403C4
 mCOQbWR9VVVDIFjhZ42JA+XLC5B8gb/IR/MEB0NNvQG76p0o/q9LrqpdW
 cKgt3Yu7q2+dL+MkUj7F6Cbd/QYacMx/yaYGpQXMUr9mHwkvUws3m8ip7
 nKeipLiTvkSnFZB6819v7q/Kvvs4iaUQ31lHmlfXcxj7RwqpHQCgKYLYb
 bHjjC44gmSjaAmw1GuirkbrrrURu7U52Gju9/7uh5iYDknj/OCABCb9Ga g==;
X-CSE-ConnectionGUID: w1YpS/iEQJqyycJJJn/oQQ==
X-CSE-MsgGUID: oSlSdezxS8KvQqY08HYutw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987542"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987542"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:25 -0700
X-CSE-ConnectionGUID: g9q7omn0TeS3IQ1wINEgoA==
X-CSE-MsgGUID: G0Hpk1MSTDCQZNVry9So3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268891972"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:24 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v4 13/32] drm/xe/log: Extend components list with hardware
 items
Date: Wed, 12 Aug 2026 21:14:29 +0200
Message-ID: <20260812191450.11690-14-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com> #v2
Cc: Riana Tauro <riana.tauro@intel.com>
---
v2: follow enum xe_ras_component values (Aravind)
v3: use same COMP tags as in SIGID (Riana)
---
 drivers/gpu/drm/xe/abi/xe_log_abi.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
index 92547805326f..bb29003e2646 100644
--- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
@@ -130,6 +130,10 @@ enum xe_log_location_bits {
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
@@ -157,6 +161,14 @@ enum xe_log_location_bits {
 	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
 	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
 	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\
+
+#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
+	define(HARDWARE, 1, DEVICE_MEMORY, DEVICE_MEMORY, "Device Memory")	\
+	define(HARDWARE, 2, CORE_COMPUTE, CORE_COMPUTE, "Core Compute")		\
+	/*     HARDWARE, 3, RESERVED */						\
+	define(HARDWARE, 4, PCIE, PCIE, "PCIe Interface")			\
+	define(HARDWARE, 5, FABRIC, FABRIC, "Fabric")				\
+	define(HARDWARE, 6, SOC_INTERNAL, SOC_INTERNAL, "SoC Internal")		\
 	/* eod */
 
 /**
-- 
2.47.1

