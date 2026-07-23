Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE74C531CC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 20:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4E410F1FD;
	Thu, 23 Jul 2026 20:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpDJw/UZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DC910F1FC
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 20:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784839105; x=1816375105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QKLtyySDwuSnISJgQSi9gu+3i39Js2iCHMOiag83VSI=;
 b=YpDJw/UZMhp9ZK/W8jrpb3eP6JXyplAWDxyZW4E8HbOj7FcpDgjGJbK9
 OYN41C484aBfKVJe9fT/O4AJJ4KMH55j/g1sRDQHf3ghibi3E0VxhcO9c
 PkzqQ8Yam/vtuTpAkcd81uf3dy6EdFnzs7Kzt6biHWWW+po7XFUWabLLJ
 sMuWhcvlO54NVl14GV1HMu+ngPS41tO9+8N+viPkHKCMngEFL29vRy4Ao
 1LOOSm29u+EhYYIaIe9t2VwJrajwPkZqaqKIJQbsDlA0/9ab8XyQV6rMx
 RjNyILJVE55wfOCrgDh8+9wTYiWLd9BNPZpAqq2aadnoMSiPPmHY/0T5z w==;
X-CSE-ConnectionGUID: vET6qw5XQ7GCJ1W/3oZrhQ==
X-CSE-MsgGUID: cXgsdCSbSgu99N0OTx0lxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84484310"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="84484310"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:25 -0700
X-CSE-ConnectionGUID: /8xQT+IlSSu+oFYiCQ/EpQ==
X-CSE-MsgGUID: eDdkgAmkT1ebfF6ZrS7PHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="254578608"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:24 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 10/19] drm/xe/log: Extend components list with hardware items
Date: Thu, 23 Jul 2026 22:37:43 +0200
Message-ID: <20260723203754.3782-11-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723203754.3782-1-michal.wajdeczko@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
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
---
 drivers/gpu/drm/xe/abi/xe_log_abi.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/xe_log_abi.h b/drivers/gpu/drm/xe/abi/xe_log_abi.h
index cde86c6c08f2..edf4dc13377d 100644
--- a/drivers/gpu/drm/xe/abi/xe_log_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_log_abi.h
@@ -124,6 +124,10 @@ enum xe_log_location_bits {
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
@@ -151,6 +155,13 @@ enum xe_log_location_bits {
 	define(DRIVER_FIRMWARE, 3, GSC, RUNTIME_FW, "GSC")			\
 	define(DRIVER_FIRMWARE, 16, PCODE, DEVICE_FW, "PCode")			\
 	define(DRIVER_FIRMWARE, 17, SYSCTRL, DEVICE_FW, "System Controller")	\
+
+#define DEFINE_XE_LOG_HARDWARE_COMPONENTS(define) \
+	define(HARDWARE, 1, PCIE, PCIE, "PCIe Interface")			\
+	define(HARDWARE, 2, HWCORE, CORE_COMPUTE, "Core Compute")		\
+	define(HARDWARE, 3, DEVMEM, DEVICE_MEMORY, "Device Memory")		\
+	define(HARDWARE, 4, FABRIC, FABRIC, "Fabric")				\
+	define(HARDWARE, 5, SOC, SOC_INTERNAL, "SoC Internal")			\
 	/* eod */
 
 /**
-- 
2.47.1

