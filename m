Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8302F433E3
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 04:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEAC10E17D;
	Thu, 16 Apr 2026 04:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jMxadTBk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A3810E17D
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 04:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776315329; x=1807851329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MDnT9jmxN/GpkreITs3Nrd5Kzr636FW6+es6xKS5tEw=;
 b=jMxadTBkEeyU1vsYUtAAcXKxcNypekbhYTtrE+EXCA5/Cimm6RTuMZV9
 ilhc3YSFk3hJSvc6wkoqQyfuyHP23x/d2xE5GHIPU27/ROeG3lP8R5KOm
 ewFqVtAmObvBBhcuHFqFR4jESPDT//KNzJQm3DVB7kBxgoF3plXjzrnGS
 I3Ibv1TE0fXvvW3YMJWd2PmPJYD5XJch3IM6rQU666BL8YnEbkaRa5eJT
 i6xXA3RwjifmoTqFGTO8296MQ6kEaz+/wDNxmJQ8doQ1NdNca0//FL6bk
 PPcODNxWkAtSJdInnLrLrZ3WZY00qLasjrEZsajg8HCg0KM22EW/U7UNj A==;
X-CSE-ConnectionGUID: c5FzuNEjTgqMcoW5VtaYPQ==
X-CSE-MsgGUID: AUX35zm1QqyoweeJRB4b9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77487476"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77487476"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 21:55:28 -0700
X-CSE-ConnectionGUID: K0PcS6XGRpe6VDCiuSHrRQ==
X-CSE-MsgGUID: CR2Vb3gcS9m4T8ktWAW35A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="232356473"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa004.fm.intel.com with ESMTP; 15 Apr 2026 21:55:27 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v5 1/3] drm/xe: Standardize pat_index to u16 type
Date: Wed, 15 Apr 2026 21:55:24 -0700
Message-ID: <20260416045526.536497-2-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416045526.536497-1-x.wang@intel.com>
References: <20260416045526.536497-1-x.wang@intel.com>
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

