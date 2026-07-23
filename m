Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A760FC531FC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 20:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F19F10F208;
	Thu, 23 Jul 2026 20:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MqTkwufM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E8410F1FC
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 20:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784839104; x=1816375104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pHbAv3XkG9Jb6upM9ZFC67Oc9MosEU2uOmX0wTbkf1Y=;
 b=MqTkwufM11kFeMcF9LhHGPg43VbKP4XAoyf28PgHiqk7f3kykkY2wH8v
 CTRIYWRcFA90byYIUp0W4oeC1FzQkTFdOZDKEORATESkLKin756Kk1pjX
 3WrREq17q/VkDQLI7jvixS7/tDEafH5XO9+IKENtIRSUix/p52xDmKDXh
 zLCD3oEqPrUgacUIkNB7urfvL04FPNrlRVsSnQ3neC11ydOodhLcomDNo
 DoVkujEVQoQ2p0tOW1H/T8YOP3sfduLwGdSLp18xorhG4EwghZyG+q5qW
 OJUo0UfVZm6FXEsYXcTSvVyrTkzM4p4VJorNY5DJsc0RgJGUh42CuQucx w==;
X-CSE-ConnectionGUID: n/0ZKcTuR/KBMQz7NPMPJQ==
X-CSE-MsgGUID: vn3934SvRcSbaqOe5R0A2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84484309"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="84484309"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:23 -0700
X-CSE-ConnectionGUID: Qxd1yHdcT9a5InXAWoWW2w==
X-CSE-MsgGUID: cv17YoAXQaSi8SG77eyBIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="254578605"
Received: from psiebies-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.135])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:38:22 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Yoni Levitt <yoni.levitt@intel.com>
Subject: [PATCH 09/19] drm/xe/log: Add hardware error signatures
Date: Thu, 23 Jul 2026 22:37:42 +0200
Message-ID: <20260723203754.3782-10-michal.wajdeczko@intel.com>
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

Extend our error signatures definitions xe_sigid to cover also
hardware-originated errors and make them distinguishable from
initially defined software-initiated errors.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Yoni Levitt <yoni.levitt@intel.com>
---
 drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
index 99717fdf74a6..e00ea6f5fb87 100644
--- a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
@@ -159,6 +159,12 @@
  * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset). [RETRY]
  * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. [COLLECT]
  * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault. [RECOVER]
+ * @XE_SIGID_HW: Generic hardware failure.
+ * @XE_SIGID_PCIE: PCIe interface errors.
+ * @XE_SIGID_DEVICE_MEMORY: Device memory errors
+ * @XE_SIGID_CORE_COMPUTE: Compute/shader core errors.
+ * @XE_SIGID_FABRIC: Fabric errors.
+ * @XE_SIGID_SOC_INTERNAL: SoC-internal errors.
  *
  * The situations the driver detects and reports in software. Values are
  * numbered sequentially, are only ever appended, and are never renumbered or
@@ -178,6 +184,13 @@ enum xe_sigid {
 	XE_SIGID_GT_TDR			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
 	XE_SIGID_MEM_FAULT		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
 	XE_SIGID_IO_BUS			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
+
+	XE_SIGID_HW			= INTEL_SIGID_GPU_XE_HARDWARE_START,
+	XE_SIGID_PCIE			= INTEL_SIGID_GPU_XE_HARDWARE_START + 1,
+	XE_SIGID_DEVICE_MEMORY		= INTEL_SIGID_GPU_XE_HARDWARE_START + 2,
+	XE_SIGID_CORE_COMPUTE		= INTEL_SIGID_GPU_XE_HARDWARE_START + 3,
+	XE_SIGID_FABRIC			= INTEL_SIGID_GPU_XE_HARDWARE_START + 4,
+	XE_SIGID_SOC_INTERNAL		= INTEL_SIGID_GPU_XE_HARDWARE_START + 5,
 };
 
 #endif
-- 
2.47.1

