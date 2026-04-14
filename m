Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AC4F9D0EC
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 18:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675A310E14C;
	Tue, 14 Apr 2026 18:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gftD8NTL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB70910E089
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 18:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776190532; x=1807726532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MDnT9jmxN/GpkreITs3Nrd5Kzr636FW6+es6xKS5tEw=;
 b=gftD8NTLoW+2MKZTg6+sL1gYm/KLlD3uWPTszj/0tzkZHG7YtFGSy+A3
 XveGtlEcOApZ18DPm8XIAWgTH7pxO7uFbACHjPFWrSD4TRGMkmBt6CwNv
 sjQD223aAjNRq9KohtpKnmGtfYcW9uAVnD9QKFTzAsamGZly9J/PC+YRD
 BNuh1X63K9xXCEHYqDkEPIWFvKF0QUI7fMVOPxLL6C7Q/wnn8A5Kh3zkZ
 E3IKLJ85sBsvquHZRsgTpZA1SZ3R6KTjHLLpQ7Tp5NGKDIJzACXauUuUW
 CdZceNyYNzghU5mEbJYazLPIsdw7P8Aehm8+h+ED1/mA32uwvcmfKQa87 g==;
X-CSE-ConnectionGUID: 91fqSEALSOG15o7pc6S+3Q==
X-CSE-MsgGUID: pTovKJHvSbeOSFz2duUQ8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="87464706"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="87464706"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 11:15:31 -0700
X-CSE-ConnectionGUID: F2ikJustSXaHVVUdPMEeYg==
X-CSE-MsgGUID: Cu2xAesbSVejiKLjpjUpmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="253387934"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa002.fm.intel.com with ESMTP; 14 Apr 2026 11:15:31 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 1/3] drm/xe: Standardize pat_index to u16 type
Date: Tue, 14 Apr 2026 11:15:26 -0700
Message-ID: <20260414181528.282398-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414181528.282398-1-x.wang@intel.com>
References: <20260414181528.282398-1-x.wang@intel.com>
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

Ensure all pat_index definitions consistently use u16 type across
the XE driver. This addresses two remaining instances where pat_index
was incorrectly typed:

- xe_vm_snapshot structure used int for pat_index field
- xe_device pat.idx array used u32 instead of u16

This cleanup improves type consistency and ensures proper alignment
with the PAT subsystem design.

Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 +-
 drivers/gpu/drm/xe/xe_vm.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 150c76b2acaf..51af55020ae0 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -403,7 +403,7 @@ struct xe_device {
 		const struct xe_pat_table_entry *pat_primary_pta;
 		/** @pat.pat_media_pta: media GT PAT entry for page table accesses */
 		const struct xe_pat_table_entry *pat_media_pta;
-		u32 idx[__XE_CACHE_LEVEL_COUNT];
+		u16 idx[__XE_CACHE_LEVEL_COUNT];
 	} pat;
 
 	/** @d3cold: Encapsulate d3cold related stuff */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2408b547ca3d..f97c7af2f17c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4407,7 +4407,7 @@ struct xe_vm_snapshot {
 #define XE_VM_SNAP_FLAG_IS_NULL		BIT(2)
 		unsigned long flags;
 		int uapi_mem_region;
-		int pat_index;
+		u16 pat_index;
 		int cpu_caching;
 		struct xe_bo *bo;
 		void *data;
-- 
2.43.0

