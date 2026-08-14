Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBA8C5CFCF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:18:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36F410E58A;
	Fri, 14 Aug 2026 17:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UV9C+Y4x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789C810F6CE
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786727919; x=1818263919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iX0mtMYFEteVmBc7+JtplPlP1z1pOYFWChii5nU1/Dg=;
 b=UV9C+Y4xDQBgzBxkM/U2WduWHjhgiMn9rcFHLyInaaEg0p9b2Acd/PPe
 4e1JZaSNKRMRpi5ZRRYVl9FO3xuJjMb7dwrdSu/vZWQhM7/IY9Dd453Lm
 k4P6kVkbE7UirOOa7SG+4P4tEKItiLHhiLzlIx4pOwhSlr2a1nP6MTSEx
 AwlJJ/dLGCfZfRSJqLpuQLZVftLWBQo2nxbtW1jhPevmSKp3LJrLDp4Ac
 9wZjzfYUTa4Uehcd/dWYmVLjr2CnlwhXD2PC2bsJItH6cbKomx0rEnUFj
 8k9vT7opAPrIPF9QWuYUbQHeLCSaumphA7h1dHXeawcNkPfgmTYddgACV w==;
X-CSE-ConnectionGUID: d/JANkMLTeGrppa0CxF18g==
X-CSE-MsgGUID: htfOhPduSZi2OBoNjL6fMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98464042"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98464042"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:39 -0700
X-CSE-ConnectionGUID: ADeDVXCvRmili0hWS/qnLA==
X-CSE-MsgGUID: LS5WXj79QCe5SOdvRtywPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262946185"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 10:18:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v5 13/33] drm/xe/log: Extend components list with hardware
 items
Date: Fri, 14 Aug 2026 19:17:39 +0200
Message-ID: <20260814171801.13347-14-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814171801.13347-1-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
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
index b38db5e9fcb5..d6105520173e 100644
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
 	define(SYSTEM, 1, PCI, IO_BUS, "Linux PCI Subsystem")			\
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

