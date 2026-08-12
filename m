Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3608C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A82610F0D9;
	Wed, 12 Aug 2026 19:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1s/qG70";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEFB10F0DF
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562124; x=1818098124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1hcl0FqZkBz4+EyBM1tl3j9BQLYoQBj7q1Tv/+jW48I=;
 b=D1s/qG70XK/zRHaQUnf71wCTTEJ36oN6vPTrehbfG5GhPZrrxSoByP2E
 ARyd8jvVQUU+XZX5DFdBJLuMuvh2S16PIDBBzI8ZqKYvce74NsmRYMQjd
 BCWVp1weu6osyUJQYfbWY3tkWehr1EtOYuuUly86sxlwwNt/aX5FymiSV
 sn3rdVibtg59yh35mNq3lA883EbOm6VSx5TyFpcetXZ+euAjJ7UrACXl1
 yDnf4Sa1ejRvRQZCvKDnyHf0LBlTojogmhN5VSTzgY6oJFpyXDwMI/As3
 ig4+FzLBvkPmY/fgZGU8h9OIJ7BewnxDZGCaG3RboxPuWcbKA2dY1VvJ6 Q==;
X-CSE-ConnectionGUID: WWwWpA8oRAizgJxpZhRCsQ==
X-CSE-MsgGUID: ml11inyxSPWt/qRql0E3yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987539"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987539"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:23 -0700
X-CSE-ConnectionGUID: DtS6/D8GR8igVfCi+J9C7g==
X-CSE-MsgGUID: aByt8v4oTQ+nJiDenfZCtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268891960"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:22 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Yoni Levitt <yoni.levitt@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 12/32] drm/xe/log: Add hardware error signatures
Date: Wed, 12 Aug 2026 21:14:28 +0200
Message-ID: <20260812191450.11690-13-michal.wajdeczko@intel.com>
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

Extend our error signatures definitions xe_sigid to cover also
hardware-originated errors and make them distinguishable from
initially defined software-initiated errors.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Yoni Levitt <yoni.levitt@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: update comment (Sashiko)
v3: rebased
---
 drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
index 93967183ae51..8e3c7ef579b9 100644
--- a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
@@ -137,12 +137,18 @@
  * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset).
  * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault.
  * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault.
+ * @XE_SIGID_HW: Generic hardware failure.
+ * @XE_SIGID_PCIE: PCIe interface errors.
+ * @XE_SIGID_DEVICE_MEMORY: Device memory errors.
+ * @XE_SIGID_CORE_COMPUTE: Compute/shader core errors.
+ * @XE_SIGID_FABRIC: Fabric errors.
+ * @XE_SIGID_SOC_INTERNAL: SoC-internal errors.
  *
  * Each SIGID represents the report sites the driver detects and reports.
  * Values are numbered sequentially, are only ever appended, and are never
  * renumbered or reused.
  *
- * Firmware- and hardware-originated signatures are not listed yet here.
+ * Firmware- and hardware-originated signatures are numbered separately.
  */
 enum xe_sigid {
 	XE_SIGID_SW			= INTEL_SIGID_GPU_XE_SOFTWARE_START,
@@ -154,6 +160,13 @@ enum xe_sigid {
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

