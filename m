Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F422C19F4F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 16:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52253112CF0;
	Tue, 30 Apr 2024 16:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UWMKAavK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFFC112CEC
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 16:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714495216; x=1746031216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pNTlGUXL63en01VcMtjhfDq2tbl5bEy9kjEsQCQWKkk=;
 b=UWMKAavKXbvLQOwKziCbixYn1g3BlWUsl24F7WXA9yUPqlQP9XIaRrfn
 5b42cMmY2gqwr+OTwnaWLxlpGmX91gy8dkoIKEHAnAjyYbw3cAeNIZ+G7
 RJnD+ekrDZK3PHYHaLQw5Tz8mGs/44g1kfqPY517+xEw3conuYX6V4FGo
 Ezh/nIaGeAl9JYJvGDW0POzgaJNQ52C8BA/4mVPDiJdpB5RJagIwWrYA0
 wBCYXdrPqN7CU0PkPqiG1rZLyWH8yXJW83p74pQdS0gSO80kdknq9VOn8
 IldlmBos4DsA0Wd4KL7Nj6tkbpgLOxQ3jQ0bCJFi5iwk60P77P08kzOGB g==;
X-CSE-ConnectionGUID: L4cqPE4ISpqqMKPQk9uJng==
X-CSE-MsgGUID: tINnO1cLQESpVhXDTrWovw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10073958"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="10073958"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 09:40:16 -0700
X-CSE-ConnectionGUID: gmf/FykmSdijGgLX9K3YFQ==
X-CSE-MsgGUID: cEU8ib8OSD2qGe9Un6MJhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="26519131"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 09:40:15 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Oak Zeng <oak.zeng@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH v6 3/5] drm/xe: Introduce has_device_atomics_on_smem device
 info
Date: Tue, 30 Apr 2024 18:25:27 +0200
Message-ID: <20240430162529.21588-4-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240430162529.21588-1-nirmoy.das@intel.com>
References: <20240430162529.21588-1-nirmoy.das@intel.com>
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

