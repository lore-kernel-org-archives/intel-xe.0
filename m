Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF541606A320
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 18:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SgonjqpN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B207210E9EF;
	Sat, 21 Nov 2026 18:24:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409A710E9F4
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 18:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795285427; x=1826821427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LmzE74OVLHuRXbYwy5rCUAv+XyOaWIIP41xXNDGUDWY=;
 b=SgonjqpNyK4qYmgclDxcBGBu/ns+CF/yDFoRlgpeuTjkEdPR3XGxd1BG
 ++k5Xz4mAgiQZ/CH2XkhPOC/mu+e1gT5Zg4vOmbZmBaYWdx1TUeHZr1vN
 5Dj/HzBQRk0vGnBjHZtAXJM6Epr7TcZKVoplDysL81WZAI5muwzfrw4tT
 dwEuC6bWKxIFm/DuCaTdQ98fh+9PyknXtasGyZHW/SjZ9h3onxGFM6wRi
 xPvgJvZ6Xluy0iUHHQdjvCVmJI1kaGw3N2yrrVoyJuE5evcx0kcNg/14j
 vhCh1vw8a53djAkb4GOsJbw4eHHqRKc/Rxe2fEB+8+LzjflbEdZKV1K5c Q==;
X-CSE-ConnectionGUID: KqXp7DrpTfOv28w6yBs9Qw==
X-CSE-MsgGUID: mR1kRYfPSVKse4I7AVE7Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4034072"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4034072"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:21 -0800
X-CSE-ConnectionGUID: Tjyfxko1RqOpiXiytGggYw==
X-CSE-MsgGUID: Onib6aAgQmKhxN6MB4xXcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; d="scan'208";a="10934449"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:20 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, anoop.c.vijay@intel.com,
 matthew.d.roper@intel.com, fei.yang@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 16/17] drm/xe: Work around media 52-bit limitation on CRI
Date: Sat, 21 Nov 2026 18:23:32 +0000
Message-ID: <20261121182317.48981-35-stuart.summers@intel.com>
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

CRI media only supports 46-bit GPA. With the IOMMU handing out IOVAs
above 46 bits this shows up as ATS translation errors and a media
GuC load failure.

The workaround for this is broken into a couple of parts:
1) Media is now disabled by default on CRI.
2) When media is enabled, implement certain workarounds to
   ensure compute performance remains optimal and media accesses
   do not result in the above mentioned translation errors.

The first part of the workaround means for the customers who are
not interested in using media, they can retain the full 52-bit GPA
range for a broader PCIe installation without worrying about any
specific limitation to support the media workloads on this device.

Additionally, to ensure power is not consumed by media in this
configuration, a new interfaces is added between the KMD and the GFSP
firmware to bring media down into a low power state.

The second part of the workaround again is broken down into a few
parts:
1) The whole device is restricted to 46-bit GPA.
2) Disable address translation in the media block alone to allow
   faster translation for compute workloads with PCIe level address
   translation enabled while ensuring host accesses beyond 46-bits
   (e.g. coming from another 52-bit supporting device) are still
   limited to 46-bits for the CRI media.

Media needs every device DMA address to stay within 46 bits. With the
IOMMU translating device DMA that is guaranteed by the IOVA allocator
honoring the clamped mask. Without it, DMA addresses are host physical
addresses, so media stays enabled only when host memory fits in 46 bits.
Beyond that the host can hand out an address media cannot reach, so
disable media.

In order to disable address translation for media, a certain register
programming which is not accessible from the host must be engaged. To
facilitate this, an additional new interface is added between the KMD
and the GFSP firmware to do this programming.

HSDES: 14028632488

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c                |  10 +
 drivers/gpu/drm/xe/xe_device_wa_oob.rules     |   1 +
 drivers/gpu/drm/xe/xe_pci.c                   |  54 ++++-
 drivers/gpu/drm/xe/xe_pm.c                    |   4 +
 drivers/gpu/drm/xe/xe_sysctrl.c               | 185 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |   2 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  34 ++++
 drivers/gpu/drm/xe/xe_sysctrl_types.h         |   6 +
 8 files changed, 294 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e179d298cbba..06caa593313a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -994,6 +994,12 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	/*
+	 * Let the System Controller know how media is configured as early as
+	 * the mailbox allows, before any media GT is brought up.
+	 */
+	xe_sysctrl_media_probe(xe);
+
 	err = xe_ras_init(xe);
 	if (err)
 		return err;
@@ -1518,6 +1524,10 @@ int xe_device_resume(struct xe_device *xe, bool flr)
 
 	xe_sysctrl_pm_resume(xe);
 
+	err = xe_sysctrl_media_defeature(xe);
+	if (err)
+		return err;
+
 	xe_irq_resume(xe);
 
 	for_each_gt(gt, xe, id) {
diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index 300207596893..14308f90938e 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -8,3 +8,4 @@
 14026779378	PLATFORM(CRESCENTISLAND)
 14028586678	PLATFORM(CRESCENTISLAND)
 14028434957	PLATFORM(CRESCENTISLAND)
+14028632488	PLATFORM(CRESCENTISLAND)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 31dbd5a32d65..f853d10aa825 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -7,6 +7,9 @@
 
 #include <kunit/static_stub.h>
 #include <linux/device/driver.h>
+#include <linux/dma-mapping.h>
+#include <linux/iommu.h>
+#include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
@@ -816,6 +819,44 @@ static int xe_probe_info_early(struct xe_device *xe,
 	return 0;
 }
 
+/*
+ * Number of address bits media is able to reach on CRI, where it has no
+ * address translation of its own.
+ */
+#define XE_CRI_MEDIA_ADDR_BITS	46
+
+static bool device_iommu_iova_backed(struct device *dev)
+{
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+
+	return domain && domain->type != IOMMU_DOMAIN_IDENTITY;
+}
+
+/*
+ * Decide whether media can be used on CRI.  Media there cannot translate
+ * addresses, so it is only usable if device DMA is guaranteed to stay within
+ * XE_CRI_MEDIA_ADDR_BITS.  The IOMMU guarantees that by allocating IOVAs
+ * below the device dma mask.  Without it, DMA addresses are host physical
+ * addresses, so media is only usable when the host cannot produce an address
+ * wider than media can reach.
+ */
+static bool cri_media_addressable(struct xe_device *xe)
+{
+	u64 host_max_addr = DIRECT_MAP_PHYSMEM_END;
+
+	if (device_iommu_iova_backed(xe->drm.dev))
+		return true;
+
+	if (host_max_addr <= DMA_BIT_MASK(XE_CRI_MEDIA_ADDR_BITS))
+		return true;
+
+	drm_info(&xe->drm,
+		 "IOMMU is not translating device DMA and the host can produce %u bit physical addresses, media is limited to %u\n",
+		 fls64(host_max_addr), XE_CRI_MEDIA_ADDR_BITS);
+
+	return false;
+}
+
 /*
  * Whether the user wants media at all.  The default (-1) leaves the decision
  * to the driver.
@@ -823,7 +864,7 @@ static int xe_probe_info_early(struct xe_device *xe,
 static bool media_wanted(struct xe_device *xe)
 {
 	if (xe_modparam.enable_media < 0)
-		return true;
+		return !XE_DEVICE_WA(xe, 14028632488);
 
 	return xe_modparam.enable_media;
 }
@@ -860,9 +901,18 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe_wa_process_device_oob(xe);
 
 	xe->info.media_allowed = media_wanted(xe) &&
-		xe_configfs_media_gt_allowed(to_pci_dev(xe->drm.dev));
+		xe_configfs_media_gt_allowed(to_pci_dev(xe->drm.dev)) &&
+		(!XE_DEVICE_WA(xe, 14028632488) || cri_media_addressable(xe));
 
 	xe->info.dma_mask_size = desc->dma_mask_size;
+	/*
+	 * Some device media blocks cannot address beyond 46 bits. Clamp the
+	 * dma_mask_size to reflect this.
+	 */
+	if (XE_DEVICE_WA(xe, 14028632488) && xe_device_media_allowed(xe))
+		xe->info.dma_mask_size = min_t(u8, xe->info.dma_mask_size,
+					       XE_CRI_MEDIA_ADDR_BITS);
+
 	xe->info.va_bits = desc->va_bits;
 	xe->info.vm_max_level = desc->vm_max_level;
 	xe->info.vram_flags = desc->vram_flags;
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index d25dbec6472e..765155ac2640 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -662,6 +662,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	 */
 	xe_sysctrl_pm_resume(xe);
 
+	err = xe_sysctrl_media_defeature(xe);
+	if (err)
+		goto out;
+
 	xe_display_pm_runtime_resume_early(xe);
 
 	xe_irq_resume(xe);
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index 405d339d6a7d..a7f8c8edd012 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -5,12 +5,16 @@
 
 #include <linux/device.h>
 #include <linux/mutex.h>
+#include <linux/pci.h>
 
 #include <drm/drm_managed.h>
 
+#include <generated/xe_device_wa_oob.h>
+
 #include "regs/xe_irq_regs.h"
 #include "regs/xe_sysctrl_regs.h"
 #include "xe_device.h"
+#include "xe_force_wake.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_printk.h"
@@ -19,6 +23,7 @@
 #include "xe_sysctrl_mailbox.h"
 #include "xe_sysctrl_mailbox_types.h"
 #include "xe_sysctrl_types.h"
+#include "xe_wa.h"
 
 /**
  * DOC: System Controller (sysctrl)
@@ -103,6 +108,7 @@ int xe_sysctrl_init(struct xe_device *xe)
 
 	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
 	INIT_WORK(&sc->work, xe_sysctrl_work);
+	sc->has_media_feature_disable = true;
 
 	return devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
 }
@@ -251,3 +257,182 @@ int xe_sysctrl_sdk_api_version(struct xe_device *xe, u16 *version)
 
 	return 0;
 }
+
+static int sysctrl_media_defeature(struct xe_device *xe, u8 feature)
+{
+	struct xe_sysctrl_media_defeature_req req = { .feature = feature };
+	struct xe_sysctrl_media_defeature_resp resp = {};
+	struct xe_sysctrl_mailbox_command cmd = {};
+	size_t out_len = 0;
+	int ret;
+
+	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_RUNTIME,
+				  XE_SYSCTRL_CMD_MEDIA_DEFEATURE,
+				  &req, sizeof(req), &resp, sizeof(resp));
+
+	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
+	if (ret)
+		return ret;
+
+	if (out_len != sizeof(resp)) {
+		xe_err(xe, "sysctrl: unexpected media defeature response length %zu (expected %zu)\n",
+		       out_len, sizeof(resp));
+		return -EPROTO;
+	}
+
+	return 0;
+}
+
+/* Check whether the ATS Enable bit is set in the PCI ATS Control register */
+static bool sysctrl_ats_enabled(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	int ats_cap;
+	u16 ctrl;
+
+	ats_cap = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_ATS);
+	if (!ats_cap)
+		return false;
+
+	if (pci_read_config_word(pdev, ats_cap + PCI_ATS_CTRL, &ctrl))
+		return false;
+
+	return ctrl & PCI_ATS_CTRL_ENABLE;
+}
+
+/* Send the media defeature command and report the outcome */
+static int sysctrl_media_defeature_send(struct xe_device *xe, u8 feature)
+{
+	bool media_allowed = feature == XE_SYSCTRL_MEDIA_DEFEATURE_ATS_DISABLE;
+	int ret;
+
+	ret = sysctrl_media_defeature(xe, feature);
+	if (ret) {
+		xe_err(xe, "sysctrl: failed to defeature media (0x%02x): %pe\n",
+		       feature, ERR_PTR(ret));
+		return ret;
+	}
+
+	xe_info(xe, "sysctrl: media %s, %s defeatured\n",
+		media_allowed ? "enabled" : "disabled",
+		media_allowed ? "address translation" : "media");
+
+	return 0;
+}
+
+/*
+ * The System Controller reaches into media while processing the request, so
+ * hold the media GT forcewake for its duration.
+ */
+static int sysctrl_media_ats_defeature_send(struct xe_device *xe, struct xe_gt *media_gt)
+{
+	int ret = 0;
+
+	xe_with_force_wake(fw_ref, gt_to_fw(media_gt), XE_FW_GT) {
+		if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
+			xe_err(xe, "sysctrl: failed to wake media GT, defeaturing media ATS anyway\n");
+
+		ret = sysctrl_media_defeature_send(xe, XE_SYSCTRL_MEDIA_DEFEATURE_ATS_DISABLE);
+	}
+
+	return ret;
+}
+
+/* Whether this platform needs the media defeature workaround at all */
+static bool sysctrl_media_defeature_needed(struct xe_device *xe)
+{
+	return XE_DEVICE_WA(xe, 14028632488) &&
+	       xe->info.has_soc_remapper_sysctrl &&
+	       xe->info.has_sysctrl &&
+	       xe->sc.has_media_feature_disable;
+}
+
+/**
+ * xe_sysctrl_media_defeature() - Tell System Controller how media is configured
+ * @xe: xe device instance
+ *
+ * The driver and the System Controller must agree on the media configuration
+ * before media is used. When media is enabled, address translation for media
+ * is not supported and must be defeatured. When media has been disabled by the
+ * user, via either the enable_media modparam or the gt_types_allowed configfs
+ * attribute, media itself is defeatured.
+ *
+ * This is restricted to platforms that need this workaround.
+ *
+ * Once a request has failed, the System Controller is assumed not to support
+ * it and it is not sent again; this returns 0 from then on.
+ *
+ * Return: 0 on success, error code on failure
+ */
+int xe_sysctrl_media_defeature(struct xe_device *xe)
+{
+	bool media_allowed = xe_device_media_allowed(xe);
+	struct xe_gt *media_gt;
+	u8 feature;
+	int ret;
+
+	if (!sysctrl_media_defeature_needed(xe))
+		return 0;
+
+	feature = media_allowed ? XE_SYSCTRL_MEDIA_DEFEATURE_ATS_DISABLE :
+				  XE_SYSCTRL_MEDIA_DEFEATURE_DISABLE;
+
+	media_gt = xe_device_get_root_tile(xe)->media_gt;
+
+	if (media_gt && feature == XE_SYSCTRL_MEDIA_DEFEATURE_ATS_DISABLE &&
+	    sysctrl_ats_enabled(xe))
+		ret = sysctrl_media_ats_defeature_send(xe, media_gt);
+	else
+		ret = sysctrl_media_defeature_send(xe, feature);
+
+	if (ret)
+		xe->sc.has_media_feature_disable = false;
+
+	return ret;
+}
+
+/*
+ * Drop media from the device.  Only safe during probe, before the media GT is
+ * brought up.  The dma_mask_size cap derived from the early media decision is
+ * left in place, which is harmless since it is only more restrictive than
+ * needed.
+ */
+static void sysctrl_media_drop(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	u8 id;
+
+	xe->info.media_allowed = false;
+
+	for_each_tile(tile, xe, id)
+		tile->media_gt = NULL;
+}
+
+/**
+ * xe_sysctrl_media_probe() - Configure media with the System Controller at probe
+ * @xe: xe device instance
+ *
+ * Same as xe_sysctrl_media_defeature(), but media cannot be used while the
+ * System Controller does not know how it is configured, so on failure media is
+ * dropped and probe continues without it rather than failing driver load.
+ *
+ * Must be called from the same place xe_sysctrl_media_defeature() would be
+ * called during probe.
+ */
+void xe_sysctrl_media_probe(struct xe_device *xe)
+{
+	if (!xe_sysctrl_media_defeature(xe))
+		return;
+
+	/*
+	 * Media is going away, so ask the System Controller to defeature it
+	 * too.  Nothing more can be done if even that fails, but the driver
+	 * does not touch media from here on either way.
+	 */
+	if (xe_device_media_allowed(xe))
+		sysctrl_media_defeature_send(xe, XE_SYSCTRL_MEDIA_DEFEATURE_DISABLE);
+
+	sysctrl_media_drop(xe);
+
+	xe_info(xe, "sysctrl: media configuration failed, continuing without media\n");
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
index c0b6d4330c88..e1d4181942e0 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -18,6 +18,8 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
 
 void xe_sysctrl_event(struct xe_sysctrl *sc);
 int xe_sysctrl_init(struct xe_device *xe);
+int xe_sysctrl_media_defeature(struct xe_device *xe);
+void xe_sysctrl_media_probe(struct xe_device *xe);
 void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
 void xe_sysctrl_pm_resume(struct xe_device *xe);
 bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index cdacceebca06..74cf02c2d630 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -15,11 +15,13 @@
  *
  * @XE_SYSCTRL_GROUP_GFSP: GFSP group
  * @XE_SYSCTRL_GROUP_DIAG: Diag group
+ * @XE_SYSCTRL_GROUP_RUNTIME: Runtime group
  * @XE_SYSCTRL_GROUP_CORE: Core group
  */
 enum xe_sysctrl_group {
 	XE_SYSCTRL_GROUP_GFSP			= 0x01,
 	XE_SYSCTRL_GROUP_DIAG			= 0x02,
+	XE_SYSCTRL_GROUP_RUNTIME		= 0x31,
 	XE_SYSCTRL_GROUP_CORE			= 0xFF,
 };
 
@@ -94,6 +96,38 @@ struct xe_sysctrl_diag_ras_err_inj_req {
 	u32 params;
 } __packed;
 
+/**
+ * enum xe_sysctrl_runtime_cmd - Commands supported by Runtime group
+ *
+ * @XE_SYSCTRL_CMD_MEDIA_DEFEATURE: Disable feature in media
+ */
+enum xe_sysctrl_runtime_cmd {
+	XE_SYSCTRL_CMD_MEDIA_DEFEATURE		= 0x11,
+};
+
+#define XE_SYSCTRL_MEDIA_DEFEATURE_DISABLE	0x01
+#define XE_SYSCTRL_MEDIA_DEFEATURE_ATS_DISABLE	0x02
+
+/**
+ * struct xe_sysctrl_media_defeature_req - Media defeature request
+ *
+ * @feature: Media feature to defeature, one of
+ *	XE_SYSCTRL_MEDIA_DEFEATURE_DISABLE or
+ *	XE_SYSCTRL_MEDIA_DEFEATURE_ATS_DISABLE
+ */
+struct xe_sysctrl_media_defeature_req {
+	u8 feature;
+} __packed;
+
+/**
+ * struct xe_sysctrl_media_defeature_resp - Media defeature response
+ *
+ * @flags: Firmware status flags
+ */
+struct xe_sysctrl_media_defeature_resp {
+	u32 flags;
+} __packed;
+
 /**
  * struct xe_sysctrl_app_status_req - Get application status request
  *
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
index 605bdc62e0bf..0cf265df1aa7 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -75,6 +75,12 @@ struct xe_sysctrl {
 	/** @event_lock: Mutex protecting pending events */
 	struct mutex event_lock;
 
+	/**
+	 * @has_media_feature_disable: The System Controller accepts media
+	 * defeature requests.
+	 */
+	bool has_media_feature_disable;
+
 	/** @debugfs: Debugfs entries */
 	struct {
 		/** @debugfs.root: Root debugfs directory */
-- 
2.43.0

