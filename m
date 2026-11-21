Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A766606A320
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 18:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XFiTmR5J
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8EE10E9FC;
	Sat, 21 Nov 2026 18:23:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B9810E447
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 18:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795285411; x=1826821411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vm/wo7iUjIg1AjYJRlegdqednxbKcUwodVoTY41NSm4=;
 b=XFiTmR5JtX2+NCRiJ2UhuYzKqyXmUGW0nmEl4JZsyxBd5r2aKW3H23+j
 wpNAVOPybzp8eN8qffvV1j13RoTXPE00t/mTbo1qb2JZVb+y4/WyAN0qP
 iFZ8U6TAHHtJ2cQbUT1pU/tmCzS0Vt4E5RUjCbDbD7kaWd+1J5YFoz8hq
 sN8m4Wgon7/hH83IJwJbR6crwZ8Okdw2NqH6/VbkPBi3T+Q/dd6JtPwzf
 UUzBySqNp7vbqNTBpFiSTX1KlU2bn4cpGhg2Vv4OIF5CD4zz/uPg+0CiJ
 SHx2ryd0YB7iooiYQQ6SP+PZp8NNcSw7T7nNCGcQkmMZui0QQEr2HocOr Q==;
X-CSE-ConnectionGUID: vsa3MFsMTRi2GtM1wpedww==
X-CSE-MsgGUID: mVt14v9aRRiQEPoEEQDwLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4034061"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4034061"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:20 -0800
X-CSE-ConnectionGUID: E/6PS4B/SD6kFKxkywslMg==
X-CSE-MsgGUID: wbQ61s7IQ5CC/Nz3RynGTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; d="scan'208";a="10934419"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:20 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, anoop.c.vijay@intel.com,
 matthew.d.roper@intel.com, fei.yang@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 06/17] drm/xe: Tolerate a missing graphics IP in xe_info_init()
Date: Sat, 21 Nov 2026 18:23:22 +0000
Message-ID: <20261121182317.48981-25-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121182317.48981-19-stuart.summers@intel.com>
References: <20261121182317.48981-19-stuart.summers@intel.com>
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

