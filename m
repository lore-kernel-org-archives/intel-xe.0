Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBF6D68B32
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 15:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7DF10E801;
	Thu, 14 Nov 2024 15:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TTM3C9tU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D259B10E7FF
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731597778; x=1763133778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wOU9MEd3DnOrm2W5ms1TNI2t2elvlbQO6yDypSdsxeE=;
 b=TTM3C9tUHQ5YdE7g7xMTX643sii3/uvU2DDneeIFUZS3SpL4EcZZ40Uk
 wtJkQd/9WDuBYOKshAQAattmycEy+S9BPWVzL2kS/ieJzEzq9bD4Dn1GO
 +cmDdX0yKlx4Wxt+azdQBSMeFO0b+l3pzqfHBjQtQt3aImHXogpYXRsu0
 a0waeJFdthT+LCgI1Nqm9jR20R8H44lCTlwvaLnyNaHAGAnRHQz+xmcpH
 wM/UtK73F43/EreEnKqgQifNK12ClV02J7SGuD9cPS1zD3mJdv1liGoLh
 vAe0PhPa+tla1U+ju4PsjhQcgehzr/vweRuWpJEPxtxQhobvRvlBKybI+ A==;
X-CSE-ConnectionGUID: rVcflb2jRtS6DrtUE70NzA==
X-CSE-MsgGUID: nuYX7aB+R5i8Pm+JIfXjnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="49004054"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="49004054"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 07:22:58 -0800
X-CSE-ConnectionGUID: JgMRHWHtQy2lHkOuqoSEvA==
X-CSE-MsgGUID: QrGUBi5DTZOjsxKDqwXXeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="93189386"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 07:22:57 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/4] drm/xe: Sort again info flags
Date: Thu, 14 Nov 2024 07:21:45 -0800
Message-ID: <20241114152148.572447-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114152148.572447-1-lucas.demarchi@intel.com>
References: <20241114152148.572447-1-lucas.demarchi@intel.com>
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index fffbb7d1c40b4..2c6a2040f0d82 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -300,10 +300,18 @@ struct xe_device {
 		u8 is_dgfx:1;
 		/** @info.has_asid: Has address space ID */
 		u8 has_asid:1;
+		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
+		u8 has_atomic_enable_pte_bit:1;
+		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
+		u8 has_device_atomics_on_smem:1;
 		/** @info.force_execlist: Forced execlist submission */
 		u8 force_execlist:1;
 		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
 		u8 has_flat_ccs:1;
+		/** @info.has_heci_cscfi: device has heci cscfi */
+		u8 has_heci_cscfi:1;
+		/** @info.has_heci_gscfi: device has heci gscfi */
+		u8 has_heci_gscfi:1;
 		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
 		u8 has_llc:1;
 		/** @info.has_mmio_ext: Device has extra MMIO address range */
@@ -323,20 +331,12 @@ struct xe_device {
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

