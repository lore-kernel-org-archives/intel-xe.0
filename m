Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82941CCF9E0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 20:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2424A10EB3F;
	Fri, 24 Oct 2025 20:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DMXfjaKz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529DA10EB3F
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 20:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761339518; x=1792875518;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A6l8CDwYzGnht7LscEdyAvE9t9s0WeRHlG5Ch32A51Y=;
 b=DMXfjaKzkmztf91Nv+mX4fLRNcvrYHFQUhXo5MmJhf3k3CnL6cf9+Pel
 5SIkhI2WO3qfsBbjpZX8VnAEgaRfGmEjeCLYZ3CMD2vdnPluFHZ4FLsay
 O51AWCnK//Bvcq5AkKZEp29Hw8bMwjq1sc5G2Hi2pAx8ba9bO0n697e9i
 +Ch24gK5HeWJSUFzBbqPFsHvGZR0lTPAeD6jHLzwz/miomj0rVNDa6aGv
 R1K4acm/issZ8h0Qbl8P0u54OT3whBJUUSsGDE/sjfiG1MhNNGGqE54eJ
 OnK+aeeJ4zbdUBNHb9aXPOgKp+1V5x6z3u1KGhpY2Q/qzKBFAC89JlNVq g==;
X-CSE-ConnectionGUID: XZFofugvT9mIY4Eo+p67Sw==
X-CSE-MsgGUID: IBgbhZIYTF2LJ8vZfXWvOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63426680"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63426680"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 13:58:38 -0700
X-CSE-ConnectionGUID: l2+LblozRGKhJ4fUodLnyw==
X-CSE-MsgGUID: H/TFR8IOQHSknjU+LoTkhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="183742549"
Received: from jeroenke-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.249.73])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 13:58:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH] drm/xe/pf: Access VF's register using dedicated MMIO view
Date: Fri, 24 Oct 2025 22:58:25 +0200
Message-ID: <20251024205826.4652-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Instead of creating ad-hoc new register definitions with altered
register addresses to mimic the VF's access to these registers,
prepare new MMIO instance per required VF, with shifted internal
location of the register map.  This will allow to use unmodified
register definitions in all calls to xe_mmio() functions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 36 +++++++----------------------
 drivers/gpu/drm/xe/xe_mmio.c        | 29 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.h        |  4 ++++
 3 files changed, 41 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index c4dda87b47cc..0714c758b9c1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -158,39 +158,19 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
 	xe_gt_sriov_pf_service_update(gt);
 }
 
-static u32 pf_get_vf_regs_stride(struct xe_device *xe)
-{
-	return GRAPHICS_VERx100(xe) > 1200 ? 0x400 : 0x1000;
-}
-
-static struct xe_reg xe_reg_vf_to_pf(struct xe_reg vf_reg, unsigned int vfid, u32 stride)
-{
-	struct xe_reg pf_reg = vf_reg;
-
-	pf_reg.vf = 0;
-	pf_reg.addr += stride * vfid;
-
-	return pf_reg;
-}
-
 static void pf_clear_vf_scratch_regs(struct xe_gt *gt, unsigned int vfid)
 {
-	u32 stride = pf_get_vf_regs_stride(gt_to_xe(gt));
-	struct xe_reg scratch;
-	int n, count;
+	struct xe_mmio mmio;
+	int n;
+
+	xe_mmio_init_vf_view(&mmio, &gt->mmio, vfid);
 
 	if (xe_gt_is_media_type(gt)) {
-		count = MED_VF_SW_FLAG_COUNT;
-		for (n = 0; n < count; n++) {
-			scratch = xe_reg_vf_to_pf(MED_VF_SW_FLAG(n), vfid, stride);
-			xe_mmio_write32(&gt->mmio, scratch, 0);
-		}
+		for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
+			xe_mmio_write32(&mmio, MED_VF_SW_FLAG(n), 0);
 	} else {
-		count = VF_SW_FLAG_COUNT;
-		for (n = 0; n < count; n++) {
-			scratch = xe_reg_vf_to_pf(VF_SW_FLAG(n), vfid, stride);
-			xe_mmio_write32(&gt->mmio, scratch, 0);
-		}
+		for (n = 0; n < VF_SW_FLAG_COUNT; n++)
+			xe_mmio_write32(&mmio, VF_SW_FLAG(n), 0);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index ef6f3ea573a2..350dca1f0925 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -379,3 +379,32 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
 {
 	return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
 }
+
+#ifdef CONFIG_PCI_IOV
+static size_t vf_regs_stride(struct xe_device *xe)
+{
+	return GRAPHICS_VERx100(xe) > 1200 ? 0x400 : 0x1000;
+}
+
+/**
+ * xe_mmio_init_vf_view() - Initialize an MMIO instance for accesses like the VF
+ * @mmio: the target &xe_mmio to initialize as VF's view
+ * @base: the source &xe_mmio to initialize from
+ * @vfid: the VF identifier
+ */
+void xe_mmio_init_vf_view(struct xe_mmio *mmio, const struct xe_mmio *base, unsigned int vfid)
+{
+	struct xe_tile *tile = base->tile;
+	struct xe_device *xe = tile->xe;
+	size_t offset = vf_regs_stride(xe) * vfid;
+
+	xe_assert(xe, IS_SRIOV_PF(xe));
+	xe_assert(xe, vfid);
+	xe_assert(xe, !base->sriov_vf_gt);
+	xe_assert(xe, base->regs_size > offset);
+
+	*mmio = *base;
+	mmio->regs += offset;
+	mmio->regs_size -= offset;
+}
+#endif
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index c151ba569003..15362789ab99 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -42,4 +42,8 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
 	return &xe->tiles[0].mmio;
 }
 
+#ifdef CONFIG_PCI_IOV
+void xe_mmio_init_vf_view(struct xe_mmio *mmio, const struct xe_mmio *base, unsigned int vfid);
+#endif
+
 #endif
-- 
2.47.1

