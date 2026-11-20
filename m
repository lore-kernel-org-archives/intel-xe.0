Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A42606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 05:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OZ0XQOwW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA72910E047;
	Fri, 20 Nov 2026 05:47:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4325210E047
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 05:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795153646; x=1826689646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vm/wo7iUjIg1AjYJRlegdqednxbKcUwodVoTY41NSm4=;
 b=OZ0XQOwWG1pmJKcy6vdk8qMiQ9qh9bpnMLyuYe4fO/Pu79F0bWjtZo1j
 xzhyQyV7SuaOohrsLktlmvgGmgHuRNi4+qtdE0CZinF6AN0dm10MickUu
 RdGnsnR74sqG4vGHeGvDpWIMlVtldum7I7n4i76HlSXNjN5KKT0p4/5lq
 XjHLH2P9qJGGglWOmhRI2rpkS3TPxVDLzlOMzkB3IqZdrAGiPhFu+qErD
 WwD5OzBMip9uJSp51Xl5Fwx1nTMPPMECWrSmXh11zqPdwWvK7+HsYx3rT
 /od3Et05ycJNax5HOsfpocSAFqqeFQt4+00ZGu0DhLevd3WkgeDrpgiD+ Q==;
X-CSE-ConnectionGUID: UFzUe5BSTSiMaHO3IexS3w==
X-CSE-MsgGUID: Q3KiId4oRBSQUXYSNtnmfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4018527"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4018527"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:47:16 -0800
X-CSE-ConnectionGUID: 96JVqmBzT3m7Dr/deoT56Q==
X-CSE-MsgGUID: +uw690DiSumAkA54/c2mCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10617136"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:47:16 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, anoop.c.vijay@intel.com,
 matthew.d.roper@intel.com, fei.yang@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 06/16] drm/xe: Tolerate a missing graphics IP in xe_info_init()
Date: Fri, 20 Nov 2026 05:47:17 +0000
Message-ID: <20261120054712.377573-24-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120054712.377573-18-stuart.summers@intel.com>
References: <20261120054712.377573-18-stuart.summers@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A device without a graphics IP is still rejected a few lines further
down, but handle_gmdid() can already hand back a NULL graphics_ip, so
stop dereferencing it unconditionally and mirror what is done for media
instead. alloc_primary_gt() gets the same treatment, since it reads the
descriptor for every field it fills in.

No functional change: the graphics IP is still required.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1fce1c993a2c..5e0150c873e1 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -933,6 +933,9 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *gt;
 
+	if (!graphics_desc)
+		return NULL;
+
 	if (!xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev))) {
 		xe_tile_info(tile, "Primary GT disabled via configfs\n");
 		return NULL;
@@ -1085,9 +1088,14 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.step.graphics = probed_info->step.graphics;
 	xe->info.step.media = probed_info->step.media;
 
-	xe->info.graphics_verx100 = graphics_ip->verx100;
-	xe->info.graphics_name = graphics_ip->name;
-	graphics_desc = graphics_ip->desc;
+	if (graphics_ip) {
+		xe->info.graphics_verx100 = graphics_ip->verx100;
+		xe->info.graphics_name = graphics_ip->name;
+		graphics_desc = graphics_ip->desc;
+	} else {
+		xe->info.graphics_name = "none";
+		graphics_desc = NULL;
+	}
 
 	if (media_ip) {
 		xe->info.media_verx100 = media_ip->verx100;
@@ -1098,16 +1106,19 @@ static int xe_info_init(struct xe_device *xe,
 		media_desc = NULL;
 	}
 
-	xe->info.has_access_counter = graphics_desc->has_access_counter;
-	xe->info.has_asid = graphics_desc->has_asid;
-	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
+	if (graphics_desc) {
+		xe->info.has_access_counter = graphics_desc->has_access_counter;
+		xe->info.has_asid = graphics_desc->has_asid;
+		xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
+		xe->info.has_range_tlb_inval = graphics_desc->has_range_tlb_inval;
+		xe->info.has_ctx_tlb_inval = graphics_desc->has_ctx_tlb_inval;
+		xe->info.has_usm = graphics_desc->has_usm;
+		xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
+	}
+
 	if (xe->info.platform != XE_PVC)
 		xe->info.has_device_atomics_on_smem = 1;
 
-	xe->info.has_range_tlb_inval = graphics_desc->has_range_tlb_inval;
-	xe->info.has_ctx_tlb_inval = graphics_desc->has_ctx_tlb_inval;
-	xe->info.has_usm = graphics_desc->has_usm;
-	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
 	xe->info.has_mem_copy_instr = GRAPHICS_VER(xe) >= 20;
 
 	if (IS_SRIOV_VF(xe)) {
-- 
2.43.0

