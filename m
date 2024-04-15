Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF94BC00A94
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 15:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638E3112661;
	Mon, 15 Apr 2024 15:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MGd8EwC2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C43F112661
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 15:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713193605; x=1744729605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X7couxwZzFCPYmtHzrrT85yeyCMyZfMp1w5ZYMH2Q1Q=;
 b=MGd8EwC2hoH0eN4TKZPsXzpXKhvObttctygChdooYCVY/xp9hIroStcX
 cXHquf+jl6NtWqGuIcDbNJ7y7v4HI9AzuDTSP8GPl4FcpbqGt0pdqdh3d
 xvdz+aOVQDdsQ5xIjRgz0EpP6Ga7IRtCP4R+15gfFcBei1ZOEJx5lzS3M
 ozVf2DHyF6NSWSot9dtWfOO1+lr01x7FWpuKshGSNPKT5M8GPfBzAozaF
 AvLmf9FMsnX07tepCia16s8VuEFxZFA8c28PAA3hN7FCEvMB359hN/XR4
 xD25G6XDtxKzkgnOHLHc3vnIcod6T5H2yXcqSZO5mIt0l74fvg7u40R0+ Q==;
X-CSE-ConnectionGUID: 6POUhk2eQIK2qfwHcVergA==
X-CSE-MsgGUID: HVuo/1SYSJKqd9gJldYf1g==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="20013319"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="20013319"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 08:06:45 -0700
X-CSE-ConnectionGUID: qvSNk9jdTaqmpl9QE88lTw==
X-CSE-MsgGUID: /Bo5MR09SQiR4sBd+iNGEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22414863"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 08:06:45 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v3 5/7] drm/xe: Introduce has_device_atomics_on_smem device
 info
Date: Mon, 15 Apr 2024 16:52:12 +0200
Message-ID: <20240415145214.25641-6-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240415145214.25641-1-nirmoy.das@intel.com>
References: <20240415145214.25641-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Add has_device_atomics_on_smem to specify that a device
supports device atomics on system memory. Currently XE2
supports this so set this for XE2.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bde42fe288ff..c06be1e00f1a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -283,6 +283,8 @@ struct xe_device {
 		u8 skip_guc_pc:1;
 		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
 		u8 has_atomic_enable_pte_bit:1;
+		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
+		u8 has_device_atomics_on_smem:1;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 		struct {
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 9cf45559b915..34eb4bbc2366 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -630,6 +630,8 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.vm_max_level = graphics_desc->vm_max_level;
 	xe->info.has_asid = graphics_desc->has_asid;
 	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
+	if (GRAPHICS_VER(xe) >= 20)
+		xe->info.has_device_atomics_on_smem = 1;
 	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
 	xe->info.has_usm = graphics_desc->has_usm;
-- 
2.42.0

