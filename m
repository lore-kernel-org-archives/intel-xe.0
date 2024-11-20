Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A59FD743D0
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 19:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B2F10E065;
	Wed, 20 Nov 2024 19:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2siZBFD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727FB10E065
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Nov 2024 19:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732132654; x=1763668654;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yhSQNVmu4LdlAVNJaVHNsCFhGAqYz9dp4oAN9RWIlrM=;
 b=g2siZBFD4u+hldxXfcPw1JvbAeXqvkrgX9J+CeTrfRWswFOfPRbPdQvb
 ndYgfbr372XvoM6zfaD6hu44ukcBBQspn/1/C/Dj5QPonNRnHkdep5V7F
 Bin1WUUVRR3KE1FXTUE1GLlc1NvLlVsFkxdzdKP6g9oiGhV+I1O3YwpqZ
 sGEZWHxNsGT03r6hk5OS5JQZOqOCYkoZI4TA8S0rxwE4MB9ea0WNz7997
 bfThw9+Om5vRRoQVkavGbGIpDxWWRO+xMotqX/bdiEsb4KZHFUB8erMlD
 PHIEL54vOOEgVe3wJaGEuPWh2G+0Ulv1Q4VJZxf3pnnF5oBKR4zyvJ55/ g==;
X-CSE-ConnectionGUID: 12+VMvd/S4ikgtgVPbDaJg==
X-CSE-MsgGUID: YBbzOK/vRzKHMBBSp4gPNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="36127511"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="36127511"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 11:57:34 -0800
X-CSE-ConnectionGUID: yjzAjGFMQoq+9KTdCGEiqg==
X-CSE-MsgGUID: L3/+tjqnRa+L6WfkKt7I+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="90819028"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 11:57:34 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v3] drm/xe: Sort again the info flags
Date: Wed, 20 Nov 2024 11:57:10 -0800
Message-ID: <20241120195710.3447100-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

Those flags are supposed to be kept sorted alphabetically. Unfortunately
it's a constant battle as new flags are added to the end or at random
places. Sort it again.

v2: Include the other non-has_* 1-bit flags in the sort
v3: Add comment to keep flags sorted

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 32 ++++++++++++++++------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8592f1b02db11..6a04f975ec16a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -294,14 +294,24 @@ struct xe_device {
 		/** @info.va_bits: Maximum bits of a virtual address */
 		u8 va_bits;
 
-		/** @info.is_dgfx: is discrete device */
-		u8 is_dgfx:1;
-		/** @info.has_asid: Has address space ID */
-		u8 has_asid:1;
+		/*
+		 * Keep all flags below alphabetically sorted
+		 */
+
 		/** @info.force_execlist: Forced execlist submission */
 		u8 force_execlist:1;
+		/** @info.has_asid: Has address space ID */
+		u8 has_asid:1;
+		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
+		u8 has_atomic_enable_pte_bit:1;
+		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
+		u8 has_device_atomics_on_smem:1;
 		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
 		u8 has_flat_ccs:1;
+		/** @info.has_heci_cscfi: device has heci cscfi */
+		u8 has_heci_cscfi:1;
+		/** @info.has_heci_gscfi: device has heci gscfi */
+		u8 has_heci_gscfi:1;
 		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
 		u8 has_llc:1;
 		/** @info.has_mmio_ext: Device has extra MMIO address range */
@@ -312,6 +322,8 @@ struct xe_device {
 		u8 has_sriov:1;
 		/** @info.has_usm: Device has unified shared memory support */
 		u8 has_usm:1;
+		/** @info.is_dgfx: is discrete device */
+		u8 is_dgfx:1;
 		/**
 		 * @info.probe_display: Probe display hardware.  If set to
 		 * false, the driver will behave as if there is no display
@@ -321,20 +333,12 @@ struct xe_device {
 		 * state the firmware or bootloader left it in.
 		 */
 		u8 probe_display:1;
+		/** @info.skip_guc_pc: Skip GuC based PM feature init */
+		u8 skip_guc_pc:1;
 		/** @info.skip_mtcfg: skip Multi-Tile configuration from MTCFG register */
 		u8 skip_mtcfg:1;
 		/** @info.skip_pcode: skip access to PCODE uC */
 		u8 skip_pcode:1;
-		/** @info.has_heci_gscfi: device has heci gscfi */
-		u8 has_heci_gscfi:1;
-		/** @info.has_heci_cscfi: device has heci cscfi */
-		u8 has_heci_cscfi:1;
-		/** @info.skip_guc_pc: Skip GuC based PM feature init */
-		u8 skip_guc_pc:1;
-		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
-		u8 has_atomic_enable_pte_bit:1;
-		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
-		u8 has_device_atomics_on_smem:1;
 	} info;
 
 	/** @irq: device interrupt state */
-- 
2.47.0

