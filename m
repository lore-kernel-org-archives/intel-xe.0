Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23E3606A32E
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 23:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UMggRpna
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A105910E96E;
	Tue, 10 Nov 2026 23:15:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304A310E394
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 23:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794352496; x=1825888496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G4NMIeJwbD9q+9FN/M3BjAPjYHrrbF567FPbOrXxb38=;
 b=UMggRpnaUFDcDJQz5XjBn8ydNRdbigBhtFl/cpdUuiuzfFQCAllxixY3
 Y25q3kWdWnGaicOdWH1DBVpdrV3CyPc0aX5TTnLix47YEhsRcJpxNZzGO
 7UjiVRnG/e/XYn28Eyu6FckUGahEbU4JZ2mt9I1zAifZYO629WM9Iwq2U
 sSJnG5n1KjBkW9taum+tHtH8GsULGHCvA+b6pAgI89uJy2JDZytgEnG3D
 vdU0jya7Rnj/FNfbpL8g4T5SdwozVOqM6BJA3GQzavVBwIt5g8JMs3uSD
 688lH0S2eFqfz9EkP3nX9mD3EjpjSkRdz//0bNJSgwBdUOYOnB4r+Py7D g==;
X-CSE-ConnectionGUID: Qq/OQ6X6Rn+leGclslJN8Q==
X-CSE-MsgGUID: 5+itMGkMSvu/zKqUBj4wFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3120824"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3120824"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:14:50 -0800
X-CSE-ConnectionGUID: H3KNfnAMQv+VpqSq/atfcQ==
X-CSE-MsgGUID: Xs0mQo5FR7GrW4OQIB3Vcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8133950"
Received: from dut4463arlhx.fm.intel.com ([10.105.9.57])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:14:50 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, matthew.d.roper@intel.com, fei.yang@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 02/11] drm/xe: Tolerate a missing graphics IP in xe_info_init()
Date: Tue, 10 Nov 2026 23:14:44 +0000
Message-ID: <20261110231442.218721-15-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110231442.218721-13-stuart.summers@intel.com>
References: <20261110231442.218721-13-stuart.summers@intel.com>
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
index a59bb1c9b478..34e8ffeeeb09 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -902,6 +902,9 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *gt;
 
+	if (!graphics_desc)
+		return NULL;
+
 	if (!xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev))) {
 		xe_tile_info(tile, "Primary GT disabled via configfs\n");
 		return NULL;
@@ -1054,9 +1057,14 @@ static int xe_info_init(struct xe_device *xe,
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
@@ -1067,16 +1075,19 @@ static int xe_info_init(struct xe_device *xe,
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

