Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CCAC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 09:38:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9825310E39C;
	Fri, 12 Apr 2024 09:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WlPjBQuS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A1F10F546
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 09:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712914643; x=1744450643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WtG+BaFxzDwMokqEJRlqV158yTm6oc13cTPt593MZbs=;
 b=WlPjBQuS6OSYP63FnroEgwP93VXCX4h/3OSRLsN0GltKsThEIU8YNOcy
 wv1KcUuJRREkbLXWDRvjNW6ZBWkNcMiaFyiSRZ8GBOY+RmMVUrusuM7qX
 4OrYGsQyxyu0jjU/R0ZY2kCLBhJFBTpNPzN7oB+eIO9pIYEYglBojcVj/
 AFeSuWP0LknJgFyRXOWt2Pn89AkhvJcO9hAZOkcbMKCepZp0JxgvhcCPf
 1kIkTqy7ujDB3nNiwFAYBxgiAdlLvJBkSWI73AVdBxtsZzW2P03PJA3ac
 xo8FnYyilsW0ZY4DMCUHdRNYdfuekMnVVr8qWC+QmekfoUK0h8IKD8mB4 Q==;
X-CSE-ConnectionGUID: RguSmQJcTLOXAs17rKw2Jw==
X-CSE-MsgGUID: iB6+wZWhSn2672NR6F32Nw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19075958"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="19075958"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:37:03 -0700
X-CSE-ConnectionGUID: 9rfWa64DQYubuht3nCmNeQ==
X-CSE-MsgGUID: lihEbcpeSuu0d2Qr7+t8/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="52342163"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:37:02 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v2 5/7] drm/xe: Introduce has_device_atomics_on_smem device
 info
Date: Fri, 12 Apr 2024 11:22:47 +0200
Message-ID: <20240412092249.3636-6-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240412092249.3636-1-nirmoy.das@intel.com>
References: <20240412092249.3636-1-nirmoy.das@intel.com>
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
 drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
 3 files changed, 5 insertions(+)

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
index 9cf45559b915..4e4699962337 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -165,6 +165,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 	.dma_mask_size = 46, \
 	.has_asid = 1, \
 	.has_atomic_enable_pte_bit = 1, \
+	.has_device_atomics_on_smem = 1, \
 	.has_flat_ccs = 1, \
 	.has_range_tlb_invalidation = 1, \
 	.has_usm = 1, \
@@ -630,6 +631,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.vm_max_level = graphics_desc->vm_max_level;
 	xe->info.has_asid = graphics_desc->has_asid;
 	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
+	xe->info.has_device_atomics_on_smem = graphics_desc->has_device_atomics_on_smem;
 	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
 	xe->info.has_usm = graphics_desc->has_usm;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index e1f2b4879fc2..d403814a7a84 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -26,6 +26,7 @@ struct xe_graphics_desc {
 
 	u8 has_asid:1;
 	u8 has_atomic_enable_pte_bit:1;
+	u8 has_device_atomics_on_smem:1;
 	u8 has_flat_ccs:1;
 	u8 has_range_tlb_invalidation:1;
 	u8 has_usm:1;
-- 
2.42.0

