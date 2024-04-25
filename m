Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7204C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 22:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFA210ECDC;
	Thu, 25 Apr 2024 22:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWRlr372";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41B510ECEA
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 22:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714084729; x=1745620729;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pNTlGUXL63en01VcMtjhfDq2tbl5bEy9kjEsQCQWKkk=;
 b=jWRlr372pFq9miV2N3frsvUYgFll1yznnU7i/MbZDWbM8UWwWrn0GNSx
 rXwKM43fifYob3YwMMMs17DyrneRGOfQYzDkKAsvOkyJH+42/131C+QJC
 ep4H2Eizd6o48CaGo7kDvIDzaN86BxXziv/rl2ANTsz0sOjc8nsAc8vzU
 KUEvi/wei1gq2jmLI6Y/SylVZIn9eXiUxDohG3afu2s83bSVs/YwzlCAq
 8mG2nITg6y4nWlJEDHRSHwy3Z/9lR6B4FcZ7BEtuyLBoqTz6uq0pq7S8b
 VkLwXwV/u942sShpa6cEeDnuRdNrNuLVbQKfnWrRNlL8eV2yfVRKV+RrH A==;
X-CSE-ConnectionGUID: e3xnsYcGQGaAczQug6KkmA==
X-CSE-MsgGUID: vnox0I31ROCk3gNtFCrjzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="27325059"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="27325059"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 15:38:49 -0700
X-CSE-ConnectionGUID: qxYL1GW4ThmM/Y1JgiIsJQ==
X-CSE-MsgGUID: YYH3FNkkQvurSk8iqzaHxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="56167322"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 15:38:48 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Oak Zeng <oak.zeng@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v4 3/5] drm/xe: Introduce has_device_atomics_on_smem device
 info
Date: Fri, 26 Apr 2024 00:23:44 +0200
Message-ID: <20240425222346.13026-4-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240425222346.13026-1-nirmoy.das@intel.com>
References: <20240425222346.13026-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v2: Set has_device_atomics_on_smem for all platform but
    PVC.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Oak Zeng <oak.zeng@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7cddb00f9c35..0af739981ebf 100644
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
index 5618318e6f3a..c6e8a264348c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -632,6 +632,8 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.vm_max_level = graphics_desc->vm_max_level;
 	xe->info.has_asid = graphics_desc->has_asid;
 	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
+	if (xe->info.platform != XE_PVC)
+		xe->info.has_device_atomics_on_smem = 1;
 	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
 	xe->info.has_usm = graphics_desc->has_usm;
-- 
2.42.0

