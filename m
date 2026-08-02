Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431E2C55174
	for <intel-xe@archiver.kernel.org>; Sun,  2 Aug 2026 23:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C34A10E48C;
	Sun,  2 Aug 2026 23:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nLSE8DOq";
	dkim-atps=neutral
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994BB10E48F
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Aug 2026 23:59:06 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-39f20d19895so20082291fa.2
 for <intel-xe@lists.freedesktop.org>; Sun, 02 Aug 2026 16:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785715145; x=1786319945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=arsNW5Mu1vrOERu9zkJBJEd3LsUpCKoSBUOxjC9FURQ=;
 b=nLSE8DOqAJ9DfkDf9IWJbHtA/LFSiMoVI8TeD4iQJLzag2X0iWuJ8AXorBDK/Oqd3P
 C2mG/kAACZt9900LzjUriQxPQiWnCpk0I4FB0qgdnlISmvmxmCaotAa0hsuqbWgZxLBX
 pm+YaIsBbz6qqakZcMmlWxFgu5d0qSdTnXtflSlVqLGN+I96uI1dR68Cd8k7Se1FXBgc
 x/Z1MXJdXUbnbrBNR3B3riuU5RclEO7TtL6U/h118cmq/6gUS4l0O97ZBhTTXYBSnQUb
 ZWDMHNgRViXjpNadOs5hdHnaoPuEbx5laiebP7W/0hEVlM2HXYeMSgE8022nkIhjzI4U
 IvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785715145; x=1786319945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=arsNW5Mu1vrOERu9zkJBJEd3LsUpCKoSBUOxjC9FURQ=;
 b=c5LH14LjFzl7RoqAm2gBEmI4jBhuKmiUlYWv6qj3C2L/zcbD31Jk09urtuKt4wW9GC
 qwJ3AlMFxjJ31Hl5rsY/H0r2hdESSoa8OOnbv48FRZmz2PxSdsGJKdyjsCmvIrDliwdS
 0jfZKL9eeM7qaZetpVe/mxEi36n3REHGc9eW8eeWSjpAmoqF7B5W+01MYhOmIXiavho6
 oQGFEm+/Q749F5tc1foZgYY3rv0w1ZfyBg21+KpsqxuzuCiwgfn5a/6RxLkRMSKtMmbo
 KPIiJ2Q9ffwVxa8Kp1L8vz2/H69VSjY32t8WikOKkVnBcxq2q7f69TweARssIEC0nsr/
 L0Ew==
X-Gm-Message-State: AOJu0YzMGLGglYZkkdJcxRn7dOnGwgpyd5hWmnW0p5swRweNBWFLNWTF
 VulyRjS8TR3MmL9b2Ui1XCozt7U6P8Y9mXeTSav+/b2T/Td3ZmuQF/J0
X-Gm-Gg: AR+sD11U3eEa+zF32PB4monXKvVLreGEihaemoglwL5HY5ah8pwycXLv9JUmHl5tdy3
 Cx9/+QlSyJ3oGagKqZZhNw9Kk/7vCWFSsRo4uvLbCaiaQWmmW0lUc5HjVzr2jrW767TYaPbjxeu
 l/quFEifdk/iNUgFzHTH+pC+ae8sZDuHCy66jlP9m9rB0QSQTsdYpfKB6fzzLrCXzMR2uDJTmNi
 VViniJ6pgf3xlKvJYrodVMXw1SaSh7cyWoSEv/bYyUL/J1/5S84rQ3rmrKNUt1Yv72zAJM6WW1Y
 RQ/SFj+RJC8Xd0VBwE5we7UnEytIyCPQq3wJt/dxUy3sf0dmk+ZSqB8H2uH0hr0OCbDdzX3JMGM
 kMQ7+m7tZkxry6j4vDF3jVdC03hx60Nvtkpoc6k7wgAzozGJz5Ak6WkPl5ErASNfKsj+nFRN3qM
 O06xCanllJCpEWbMVz69JvI+k43gYMHzA5AKDduEyqDtY4geOtCHQPp3VBrikqDuQ8qKNaCRN94
 7xzE8ZQv2xPJk785JbQdxiWEQ==
X-Received: by 2002:a2e:a901:0:b0:39e:ec19:4cd1 with SMTP id
 38308e7fff4ca-39f8648922dmr13483581fa.37.1785715144232; 
 Sun, 02 Aug 2026 16:59:04 -0700 (PDT)
Received: from NUC.lan (danayer.ru. [78.109.43.71])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-39f810dc89dsm9570221fa.12.2026.08.02.16.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 16:59:02 -0700 (PDT)
From: Daniil Seliverstov Denisovich <daniil.seliverstov2003@gmail.com>
X-Google-Original-From: Daniil Seliverstov Denisovich
 <Danayerofficial@yandex.ru>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Seliverstov Daniil Denisovich <Danayerofficial@yandex.ru>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH v4] drm/xe: add DG2 HuC GSC support and MEI integration
Date: Mon,  3 Aug 2026 07:58:11 +0800
Message-ID: <20260802235811.6574-1-Danayerofficial@yandex.ru>
X-Mailer: git-send-email 2.55.0
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

From: Seliverstov Daniil Denisovich <Danayerofficial@yandex.ru>

This enables HuC firmware initialization and authentication
on DG2 hardware when using the Xe DRM driver.

Changes include:
- add DG2 MEI GSC interface support
- add HuC firmware parsing for GSC BPDT/CPD layout
- improve HuC loading and authentication handling
- add GSC register definitions and firmware ABI updates
- add Xe MEI DG2 module support
- update Xe workarounds and engine handling for HuC/GSC
- update MEI GSC support for DG2

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608012014.L7f9m7Nm-lkp@intel.com/
Signed-off-by: Seliverstov Daniil Denisovich <Danayerofficial@yandex.ru>
---
Changes in v4:
- Bumped version to v4 to fix versioning confusion on Patchwork (old v3 was sent by mistake).
- Added IS_REACHABLE(CONFIG_INTEL_MEI) to fix kernel test robot linkage error.

Changes in v2 & v3:
- (Superseded/Mislabeled versions)

 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h |   1 +
 drivers/gpu/drm/xe/xe_gsc.c           |   5 +-
 drivers/gpu/drm/xe/xe_heci_gsc.c      | 212 ++++++++++++++++----------
 drivers/gpu/drm/xe/xe_heci_gsc.h      |  12 +-
 drivers/gpu/drm/xe/xe_huc.c           |  66 ++++++++
 drivers/gpu/drm/xe/xe_huc_types.h     |   5 +
 drivers/gpu/drm/xe/xe_mei_dg2.c       | 126 +++++++++++++++
 drivers/gpu/drm/xe/xe_mei_dg2.h       |  27 ++++
 drivers/gpu/drm/xe/xe_uc_fw.c         |  44 +++++-
 drivers/gpu/drm/xe/xe_wa.c            |   3 +-
 drivers/misc/mei/gsc-me.c             |   5 +
 12 files changed, 412 insertions(+), 95 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_mei_dg2.c
 create mode 100644 drivers/gpu/drm/xe/xe_mei_dg2.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 6d728f8c4c39..596669e2b553 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -53,6 +53,7 @@ xe-y += xe_bb.o \
 	xe_gsc_debugfs.o \
 	xe_gsc_proxy.o \
 	xe_gsc_submit.o \
+	xe_mei_dg2.o \
 	xe_gt.o \
 	xe_gt_ccs_mode.o \
 	xe_gt_clock.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
index 180be82672ab..6b7551bcfb7a 100644
--- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
@@ -20,6 +20,7 @@
 
 #define DG1_GSC_HECI2_BASE	0x00259000
 #define PVC_GSC_HECI2_BASE	0x00285000
+#define DG2_GSC_HECI1_BASE	0x00373000
 #define DG2_GSC_HECI2_BASE	0x00374000
 
 #define HECI_H_CSR(base)	XE_REG((base) + 0x4)
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index aab59dc647fb..ef3647a57d44 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -467,8 +467,11 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
 	if (!xe_uc_fw_is_available(&gsc->fw))
 		return 0;
 
-	if (!hwe)
+	if (!hwe) {
+		if (xe->info.platform == XE_DG2)
+			return 0;
 		return -ENODEV;
+	}
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, SZ_4M,
 					  XE_BO_FLAG_STOLEN |
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index 5af8903e10af..9b14a8e9ed6e 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -15,8 +15,14 @@
 #include "regs/xe_gsc_regs.h"
 #include "xe_platform_types.h"
 #include "xe_survivability_mode.h"
+#include "xe_gt.h"
+#include "xe_gt_printk.h"
+#include "xe_mmio.h"
+#include "xe_bo.h"
+#include "xe_map.h"
+#include "xe_force_wake.h"
 
-#define GSC_BAR_LENGTH  0x00000FFC
+#define GSC_BAR_LENGTH 0x00000FFC
 
 static void heci_gsc_irq_mask(struct irq_data *d)
 {
@@ -37,7 +43,8 @@ static const struct irq_chip heci_gsc_irq_chip = {
 static int heci_gsc_irq_init(int irq)
 {
 	irq_set_chip_and_handler_name(irq, &heci_gsc_irq_chip,
-				      handle_simple_irq, "heci_gsc_irq_handler");
+				      handle_simple_irq,
+				      "heci_gsc_irq_handler");
 
 	return irq_set_chip_data(irq, NULL);
 }
@@ -50,6 +57,7 @@ static int heci_gsc_irq_init(int irq)
  * @bar_size: size of the mmio bar
  * @use_polling: indication of using polling mode for the device
  * @slow_firmware: indication of whether the device is slow (needs longer timeouts)
+ * @lmem_size: size of local memory (VRAM) to allocate for the device
  */
 struct heci_gsc_def {
 	const char *name;
@@ -57,6 +65,7 @@ struct heci_gsc_def {
 	size_t bar_size;
 	bool use_polling;
 	bool slow_firmware;
+	size_t lmem_size;
 };
 
 /* gsc resources and definitions */
@@ -66,10 +75,19 @@ static const struct heci_gsc_def heci_gsc_def_dg1 = {
 	.bar_size = GSC_BAR_LENGTH,
 };
 
-static const struct heci_gsc_def heci_gsc_def_dg2 = {
-	.name = "mei-gscfi",
-	.bar = DG2_GSC_HECI2_BASE,
-	.bar_size = GSC_BAR_LENGTH,
+static const struct heci_gsc_def heci_gsc_def_dg2[] = {
+	{
+		.name = "mei-gsc",
+		.bar = DG2_GSC_HECI1_BASE,
+		.bar_size = GSC_BAR_LENGTH,
+		.use_polling = true, /* Bypass broken HECI1 interrupts on DG2 */
+		.lmem_size = SZ_4M,
+	},
+	{
+		.name = "mei-gscfi",
+		.bar = DG2_GSC_HECI2_BASE,
+		.bar_size = GSC_BAR_LENGTH,
+	}
 };
 
 static const struct heci_gsc_def heci_gsc_def_pvc = {
@@ -90,40 +108,48 @@ static void heci_gsc_release_dev(struct device *dev)
 static void xe_heci_gsc_fini(void *arg)
 {
 	struct xe_heci_gsc *heci_gsc = arg;
-
-	if (heci_gsc->adev) {
-		struct auxiliary_device *aux_dev = &heci_gsc->adev->aux_dev;
-
-		auxiliary_device_delete(aux_dev);
-		auxiliary_device_uninit(aux_dev);
-		heci_gsc->adev = NULL;
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		if (heci_gsc->adev[i]) {
+			struct auxiliary_device *aux_dev =
+				&heci_gsc->adev[i]->aux_dev;
+			auxiliary_device_delete(aux_dev);
+			auxiliary_device_uninit(aux_dev);
+			heci_gsc->adev[i] = NULL;
+		}
+		if (heci_gsc->irq[i] >= 0)
+			irq_free_desc(heci_gsc->irq[i]);
+		heci_gsc->irq[i] = -1;
+
+		if (heci_gsc->gem_obj[i]) {
+			xe_bo_unpin_map_no_vm(heci_gsc->gem_obj[i]);
+			heci_gsc->gem_obj[i] = NULL;
+		}
 	}
-
-	if (heci_gsc->irq >= 0)
-		irq_free_desc(heci_gsc->irq);
-
-	heci_gsc->irq = -1;
 }
 
 static int heci_gsc_irq_setup(struct xe_device *xe)
 {
 	struct xe_heci_gsc *heci_gsc = &xe->heci_gsc;
-	int ret;
-
-	heci_gsc->irq = irq_alloc_desc(0);
-	if (heci_gsc->irq < 0) {
-		drm_err(&xe->drm, "gsc irq error %d\n", heci_gsc->irq);
-		return heci_gsc->irq;
+	int i, ret;
+
+	for (i = 0; i < 2; i++) {
+		heci_gsc->irq[i] = irq_alloc_desc(0);
+		if (heci_gsc->irq[i] < 0) {
+			drm_err(&xe->drm, "gsc irq error %d\n",
+				heci_gsc->irq[i]);
+			return heci_gsc->irq[i];
+		}
+		ret = heci_gsc_irq_init(heci_gsc->irq[i]);
+		if (ret < 0)
+			drm_err(&xe->drm, "gsc irq init failed %d\n", ret);
 	}
-
-	ret = heci_gsc_irq_init(heci_gsc->irq);
-	if (ret < 0)
-		drm_err(&xe->drm, "gsc irq init failed %d\n", ret);
-
-	return ret;
+	return 0;
 }
 
-static int heci_gsc_add_device(struct xe_device *xe, const struct heci_gsc_def *def)
+static int heci_gsc_add_device(struct xe_device *xe,
+			       const struct heci_gsc_def *def, int intf_id)
 {
 	struct xe_heci_gsc *heci_gsc = &xe->heci_gsc;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -134,7 +160,8 @@ static int heci_gsc_add_device(struct xe_device *xe, const struct heci_gsc_def *
 	adev = kzalloc_obj(*adev);
 	if (!adev)
 		return -ENOMEM;
-	adev->irq = heci_gsc->irq;
+
+	adev->irq = def->use_polling ? -1 : heci_gsc->irq[intf_id];
 	adev->bar.parent = &pdev->resource[0];
 	adev->bar.start = def->bar + pdev->resource[0].start;
 	adev->bar.end = adev->bar.start + def->bar_size - 1;
@@ -142,10 +169,35 @@ static int heci_gsc_add_device(struct xe_device *xe, const struct heci_gsc_def *
 	adev->bar.desc = IORES_DESC_NONE;
 	adev->slow_firmware = def->slow_firmware;
 
+	if (def->lmem_size) {
+		struct xe_tile *tile = xe_device_get_root_tile(xe);
+		struct xe_bo *bo;
+
+		bo = xe_bo_create_pin_map_novm(xe, tile, def->lmem_size,
+					       ttm_bo_type_kernel,
+					       XE_BO_FLAG_VRAM0, false);
+		if (!IS_ERR(bo)) {
+			xe_map_memset(xe, &bo->vmap, 0, 0, def->lmem_size);
+			heci_gsc->gem_obj[intf_id] = bo;
+			adev->ext_op_mem.start = xe_bo_main_addr(bo, PAGE_SIZE);
+			adev->ext_op_mem.end =
+				adev->ext_op_mem.start + def->lmem_size;
+			xe_gt_dbg(tile->primary_gt,
+				  "GSC HECI%d: VRAM at DPA 0x%llx\n",
+				  intf_id + 1,
+				  (unsigned long long)adev->ext_op_mem.start);
+		} else {
+			drm_warn(&xe->drm, "GSC HECI%d: Failed to alloc LMEM\n",
+				 intf_id + 1);
+		}
+	}
+
 	aux_dev = &adev->aux_dev;
 	aux_dev->name = def->name;
+	/* Add intf_id to ensure unique device IDs */
 	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
-		      PCI_DEVID(pdev->bus->number, pdev->devfn);
+		      PCI_DEVID(pdev->bus->number, pdev->devfn) |
+		      (intf_id << 8);
 	aux_dev->dev.parent = &pdev->dev;
 	aux_dev->dev.release = heci_gsc_release_dev;
 
@@ -156,13 +208,11 @@ static int heci_gsc_add_device(struct xe_device *xe, const struct heci_gsc_def *
 		return ret;
 	}
 
-	heci_gsc->adev = adev; /* needed by the notifier */
+	heci_gsc->adev[intf_id] = adev;
 	ret = auxiliary_device_add(aux_dev);
 	if (ret < 0) {
 		drm_err(&xe->drm, "gsc aux add failed %d\n", ret);
-		heci_gsc->adev = NULL;
-
-		/* adev will be freed with the put_device() and .release sequence */
+		heci_gsc->adev[intf_id] = NULL;
 		auxiliary_device_uninit(aux_dev);
 	}
 	return ret;
@@ -171,78 +221,74 @@ static int heci_gsc_add_device(struct xe_device *xe, const struct heci_gsc_def *
 int xe_heci_gsc_init(struct xe_device *xe)
 {
 	struct xe_heci_gsc *heci_gsc = &xe->heci_gsc;
-	const struct heci_gsc_def *def = NULL;
 	int ret;
 
 	if (!xe->info.has_heci_gscfi && !xe->info.has_heci_cscfi)
 		return 0;
 
-	heci_gsc->irq = -1;
-
-	if (xe->info.platform == XE_BATTLEMAGE) {
-		def = &heci_gsc_def_dg2;
-	} else if (xe->info.platform == XE_PVC) {
-		def = &heci_gsc_def_pvc;
-	} else if (xe->info.platform == XE_DG2) {
-		def = &heci_gsc_def_dg2;
-	} else if (xe->info.platform == XE_DG1) {
-		def = &heci_gsc_def_dg1;
-	}
-
-	if (!def || !def->name) {
-		drm_warn(&xe->drm, "HECI is not implemented!\n");
-		return 0;
-	}
+	heci_gsc->irq[0] = -1;
+	heci_gsc->irq[1] = -1;
+	heci_gsc->gem_obj[0] = NULL;
+	heci_gsc->gem_obj[1] = NULL;
 
 	ret = devm_add_action_or_reset(xe->drm.dev, xe_heci_gsc_fini, heci_gsc);
 	if (ret)
 		return ret;
 
-	if (!def->use_polling && !xe_survivability_mode_is_boot_enabled(xe)) {
+	if (!xe_survivability_mode_is_boot_enabled(xe)) {
 		ret = heci_gsc_irq_setup(xe);
 		if (ret)
 			return ret;
 	}
 
-	return heci_gsc_add_device(xe, def);
-}
+	if (xe->info.platform == XE_DG2) {
+		struct xe_gt *gt = xe->tiles[0].primary_gt;
+		u32 val;
 
-void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir)
-{
-	int ret;
+		/* Wake up GSC to unmask HECI1 interrupts and clock gating */
+		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC) == 0) {
+			val = xe_mmio_read32(&gt->mmio, XE_REG(0x1900f4));
+			val &= ~(BIT(15) | BIT(14));
+			xe_mmio_write32(&gt->mmio, XE_REG(0x1900f4), val);
 
-	if ((iir & GSC_IRQ_INTF(1)) == 0)
-		return;
+			val = xe_mmio_read32(&gt->mmio, XE_REG(0x190044));
+			val |= BIT(15) | BIT(14);
+			xe_mmio_write32(&gt->mmio, XE_REG(0x190044), val);
 
-	if (!xe->info.has_heci_gscfi) {
-		drm_warn_once(&xe->drm, "GSC irq: not supported");
-		return;
-	}
+			xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
+		}
 
-	if (xe->heci_gsc.irq < 0)
-		return;
+		heci_gsc_add_device(xe, &heci_gsc_def_dg2[0], 0);
+		heci_gsc_add_device(xe, &heci_gsc_def_dg2[1], 1);
+		return 0;
+	} else if (xe->info.platform == XE_BATTLEMAGE) {
+		return heci_gsc_add_device(xe, &heci_gsc_def_dg2[1], 1);
+	} else if (xe->info.platform == XE_PVC) {
+		return heci_gsc_add_device(xe, &heci_gsc_def_pvc, 1);
+	} else if (xe->info.platform == XE_DG1) {
+		return heci_gsc_add_device(xe, &heci_gsc_def_dg1, 1);
+	}
 
-	ret = generic_handle_irq_safe(xe->heci_gsc.irq);
-	if (ret)
-		drm_err_ratelimited(&xe->drm, "error handling GSC irq: %d\n", ret);
+	return 0;
 }
 
-void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir)
+void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir)
 {
-	int ret;
-
-	if ((iir & CSC_IRQ_INTF(1)) == 0)
+	if (!xe->info.has_heci_gscfi)
 		return;
 
-	if (!xe->info.has_heci_cscfi) {
-		drm_warn_once(&xe->drm, "CSC irq: not supported");
-		return;
-	}
+	if ((iir & GSC_IRQ_INTF(0)) && xe->heci_gsc.irq[0] >= 0)
+		generic_handle_irq_safe(xe->heci_gsc.irq[0]);
+
+	if ((iir & GSC_IRQ_INTF(1)) && xe->heci_gsc.irq[1] >= 0)
+		generic_handle_irq_safe(xe->heci_gsc.irq[1]);
+}
 
-	if (xe->heci_gsc.irq < 0)
+void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir)
+{
+	if ((iir & CSC_IRQ_INTF(1)) == 0 || !xe->info.has_heci_cscfi ||
+	    xe->heci_gsc.irq[1] < 0)
 		return;
 
-	ret = generic_handle_irq_safe(xe->heci_gsc.irq);
-	if (ret)
-		drm_err_ratelimited(&xe->drm, "error handling GSC irq: %d\n", ret);
+	generic_handle_irq_safe(xe->heci_gsc.irq[1]);
 }
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.h b/drivers/gpu/drm/xe/xe_heci_gsc.h
index a76f4122b778..80efc2092203 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.h
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.h
@@ -9,6 +9,7 @@
 
 struct xe_device;
 struct mei_aux_device;
+struct xe_bo;
 
 /*
  * GSC HECI1 bit corresponds to bit15 and HECI2 to bit14.
@@ -24,13 +25,14 @@ struct mei_aux_device;
 /**
  * struct xe_heci_gsc - graphics security controller for xe, HECI interface
  *
- * @adev : pointer to mei auxiliary device structure
- * @irq : irq number
- *
+ * @adev: array of pointers to mei auxiliary device structures
+ * @irq: array of irq numbers
+ * @gem_obj: array of pointers to allocated VRAM memory objects
  */
 struct xe_heci_gsc {
-	struct mei_aux_device *adev;
-	int irq;
+	struct mei_aux_device *adev[2];
+	int irq[2];
+	struct xe_bo *gem_obj[2];
 };
 
 int xe_heci_gsc_init(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 57afe21444b1..281da48a1e86 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -12,6 +12,8 @@
 #include "abi/gsc_pxp_commands_abi.h"
 #include "regs/xe_gsc_regs.h"
 #include "regs/xe_guc_regs.h"
+#include "xe_pm.h"
+#include "xe_mei_dg2.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
@@ -42,6 +44,8 @@ huc_to_guc(struct xe_huc *huc)
 	return &container_of(huc, struct xe_uc, huc)->guc;
 }
 
+static void xe_huc_auth_work(struct work_struct *work);
+
 #define PXP43_HUC_AUTH_INOUT_SIZE SZ_4K
 static int huc_alloc_gsc_pkt(struct xe_huc *huc)
 {
@@ -67,6 +71,7 @@ int xe_huc_init(struct xe_huc *huc)
 	struct xe_gt *gt = huc_to_gt(huc);
 	struct xe_device *xe = gt_to_xe(gt);
 	int ret;
+	INIT_DELAYED_WORK(&huc->auth_work, xe_huc_auth_work);
 
 	huc->fw.type = XE_UC_FW_TYPE_HUC;
 
@@ -228,6 +233,39 @@ static const struct {
 				  HECI1_FWSTS5_HUC_AUTH_DONE },
 };
 
+static void xe_huc_auth_work(struct work_struct *work)
+{
+	struct xe_huc *huc = container_of(work, struct xe_huc, auth_work.work);
+	struct xe_gt *gt = huc_to_gt(huc);
+	struct xe_device *xe = gt_to_xe(gt);
+	int ret;
+
+	xe_pm_runtime_get(xe);
+
+	ret = xe_mei_dg2_auth_huc(xe, huc);
+	if (ret == -EAGAIN || ret == -ENODEV) {
+		schedule_delayed_work(&huc->auth_work, msecs_to_jiffies(1000));
+		goto out;
+	}
+
+	if (ret)
+		goto fail;
+
+	ret = xe_mmio_wait32(&gt->mmio, huc_auth_modes[XE_HUC_AUTH_VIA_GUC].reg,
+			     huc_auth_modes[XE_HUC_AUTH_VIA_GUC].val,
+		      huc_auth_modes[XE_HUC_AUTH_VIA_GUC].val,
+		      100000, NULL, false);
+	if (ret)
+		goto fail;
+
+	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_RUNNING);
+	goto out;
+fail:
+	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
+out:
+	xe_pm_runtime_put(xe);
+}
+
 bool xe_huc_is_authenticated(struct xe_huc *huc, enum xe_huc_auth_types type)
 {
 	struct xe_gt *gt = huc_to_gt(huc);
@@ -253,6 +291,33 @@ int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
 	if (!xe_uc_fw_is_loaded(&huc->fw))
 		return -ENOEXEC;
 
+	if (huc_to_xe(huc)->info.platform == XE_DG2) {
+		ret = xe_mei_dg2_auth_huc(huc_to_xe(huc), huc);
+		if (ret == -EAGAIN || ret == -ENODEV) {
+			xe_gt_dbg(gt, "HuC: MEI not ready, deferring authentication\n");
+			schedule_delayed_work(&huc->auth_work, msecs_to_jiffies(1000));
+			return 0;
+		}
+
+		if (ret) {
+			xe_gt_err(gt, "HuC: failed to trigger auth via MEI: %pe\n", ERR_PTR(ret));
+			goto fail;
+		}
+
+		ret = xe_mmio_wait32(&gt->mmio, huc_auth_modes[XE_HUC_AUTH_VIA_GUC].reg,
+				     huc_auth_modes[XE_HUC_AUTH_VIA_GUC].val,
+		       huc_auth_modes[XE_HUC_AUTH_VIA_GUC].val,
+		       100000, NULL, false);
+		if (ret) {
+			xe_gt_err(gt, "HuC: firmware not verified by MEI: %pe\n", ERR_PTR(ret));
+			goto fail;
+		}
+
+		xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_RUNNING);
+		xe_gt_dbg(gt, "HuC: authenticated via MEI\n");
+		return 0;
+	}
+
 	switch (type) {
 	case XE_HUC_AUTH_VIA_GUC:
 		ret = xe_guc_auth_huc(guc, xe_bo_ggtt_addr(huc->fw.bo) +
@@ -312,3 +377,4 @@ void xe_huc_print_info(struct xe_huc *huc, struct drm_printer *p)
 	drm_printf(p, "\nHuC status: 0x%08x\n",
 		   xe_mmio_read32(&gt->mmio, HUC_KERNEL_LOAD_INFO));
 }
+
diff --git a/drivers/gpu/drm/xe/xe_huc_types.h b/drivers/gpu/drm/xe/xe_huc_types.h
index cfbaa5e0dfca..80bb3c994461 100644
--- a/drivers/gpu/drm/xe/xe_huc_types.h
+++ b/drivers/gpu/drm/xe/xe_huc_types.h
@@ -6,6 +6,8 @@
 #ifndef _XE_HUC_TYPES_H_
 #define _XE_HUC_TYPES_H_
 
+#include <linux/workqueue.h>
+
 #include "xe_uc_fw_types.h"
 
 struct xe_bo;
@@ -19,6 +21,9 @@ struct xe_huc {
 
 	/** @gsc_pkt: bo to store the packet for auth via GSC */
 	struct xe_bo *gsc_pkt;
+
+	/** @auth_work: deferred authentication deferred work */
+	struct delayed_work auth_work;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_mei_dg2.c b/drivers/gpu/drm/xe/xe_mei_dg2.c
new file mode 100644
index 000000000000..83d597dc401e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_mei_dg2.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) 2026 Intel Corporation. All rights reserved.
+ */
+
+#include <linux/kconfig.h>
+
+#if IS_REACHABLE(CONFIG_INTEL_MEI)
+
+#include <linux/device.h>
+#include <linux/mei_cl_bus.h>
+#include <drm/drm_managed.h>
+#include <uapi/drm/xe_drm.h>
+
+#include "xe_mei_dg2.h"
+#include "xe_bo.h"
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_huc.h"
+
+#define PXP_APIVER(x, y) (((x) & 0xFFFF) << 16 | ((y) & 0xFFFF))
+#define PXP_STATUS_SUCCESS 0x0
+#define PXP_STATUS_OP_NOT_PERMITTED 0x1003
+
+struct pxp_cmd_header {
+	u32 api_version;
+	u32 command_id;
+	u32 status;
+	u32 buffer_len;
+} __packed;
+
+#define PXP43_CMDID_START_HUC_AUTH 0x0000003A
+
+struct pxp43_start_huc_auth_in {
+	struct pxp_cmd_header header;
+	__le64 huc_base_address;
+} __packed;
+
+struct pxp43_huc_auth_out {
+	struct pxp_cmd_header header;
+} __packed;
+
+static int match_pxp_client(struct device *dev, void *data)
+{
+	if (!dev->bus || !dev->bus->name || strcmp(dev->bus->name, "mei") != 0)
+		return 0;
+
+	if (strstr(dev_name(dev), "fbf6fcf1")) {
+		struct device **result = data;
+		*result = dev;
+		return 1;
+	}
+	return 0;
+}
+
+static int find_pxp_client_deep(struct device *dev, void *data)
+{
+	if (match_pxp_client(dev, data))
+		return 1;
+	return device_for_each_child(dev, data, find_pxp_client_deep);
+}
+
+int xe_mei_dg2_auth_huc(struct xe_device *xe, struct xe_huc *huc)
+{
+	struct device *cl_dev = NULL;
+	struct mei_cl_device *cldev;
+	struct pxp43_start_huc_auth_in in = { 0 };
+	struct pxp43_huc_auth_out out = { 0 };
+	ssize_t byte;
+	int ret;
+	static int retry_count;
+
+	device_for_each_child(xe->drm.dev, &cl_dev, find_pxp_client_deep);
+
+	if (!cl_dev) {
+		if (retry_count++ % 5 == 0)
+			drm_info(&xe->drm,
+				 "HuC auth: waiting for MEI PXP client (HECI1) to initialize...\n");
+		return -EAGAIN;
+	}
+
+	get_device(cl_dev);
+	cldev = to_mei_cl_device(cl_dev);
+
+	if (!mei_cldev_enabled(cldev)) {
+		ret = mei_cldev_enable(cldev);
+		if (ret) {
+			put_device(cl_dev);
+			return -EAGAIN;
+		}
+	}
+
+	in.header.api_version = PXP_APIVER(4, 3);
+	in.header.command_id = PXP43_CMDID_START_HUC_AUTH;
+	in.header.buffer_len = sizeof(in.huc_base_address);
+	in.huc_base_address =
+		cpu_to_le64(xe_bo_main_addr(huc->fw.bo, PAGE_SIZE));
+
+	byte = mei_cldev_send(cldev, (u8 *)&in, sizeof(in));
+	if (byte < 0) {
+		put_device(cl_dev);
+		return byte;
+	}
+
+	byte = mei_cldev_recv(cldev, (u8 *)&out, sizeof(out));
+	if (byte < 0) {
+		put_device(cl_dev);
+		return byte;
+	}
+
+	put_device(cl_dev);
+
+	if (out.header.status == PXP_STATUS_OP_NOT_PERMITTED) {
+		drm_info(&xe->drm,
+			 "HuC auth: GSC reports already authenticated (0x1003).\n");
+		return 0;
+	} else if (out.header.status != PXP_STATUS_SUCCESS) {
+		drm_err(&xe->drm, "HuC auth MEI rejected: status 0x%x\n",
+			out.header.status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+#endif /* IS_REACHABLE(CONFIG_INTEL_MEI) */
diff --git a/drivers/gpu/drm/xe/xe_mei_dg2.h b/drivers/gpu/drm/xe/xe_mei_dg2.h
new file mode 100644
index 000000000000..b6029b8ed411
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_mei_dg2.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (c) 2026 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __XE_MEI_DG2_H__
+#define __XE_MEI_DG2_H__
+
+#include "xe_device.h"
+#include "xe_huc.h"
+#include <linux/kconfig.h>
+
+#if IS_REACHABLE(CONFIG_INTEL_MEI)
+
+int xe_mei_dg2_auth_huc(struct xe_device *xe, struct xe_huc *huc);
+
+#else
+
+static inline int xe_mei_dg2_auth_huc(struct xe_device *xe, struct xe_huc *huc)
+{
+	/* If the MEI subsystem is disabled, return -ENODEV gracefully */
+	return -ENODEV;
+}
+
+#endif /* IS_REACHABLE(CONFIG_INTEL_MEI) */
+
+#endif /* __XE_MEI_DG2_H__ */
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index a8e6f18cc9b4..edc8019bea95 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -133,6 +133,7 @@ struct fw_blobs_by_type {
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	no_ver(xe,	huc,		bmg))		\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	no_ver(xe,	huc,		lnl))		\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc_gsc,	mtl))		\
+	fw_def(DG2,		GT_TYPE_ANY,	no_ver(i915,	huc_gsc,	dg2))		\
 	fw_def(DG1,		GT_TYPE_ANY,	no_ver(i915,	huc,		dg1))		\
 	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
 	fw_def(ALDERLAKE_S,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
@@ -488,6 +489,26 @@ static u32 entry_offset(const struct gsc_cpd_header_v2 *header, const char *name
 	return 0;
 }
 
+static int parse_manifest_direct(struct xe_uc_fw *uc_fw, const void *data, size_t size)
+{
+	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
+	const struct gsc_manifest_header *manifest = data;
+	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
+
+	/* 0x4 is the expected header_type for a manifest */
+	if (size < sizeof(*manifest) || manifest->header_type != 0x4) {
+		xe_gt_err(gt, "Direct manifest too small or invalid!\n");
+		return -ENODATA;
+	}
+
+	release->major = manifest->fw_version.major;
+	release->minor = manifest->fw_version.minor;
+	release->patch = manifest->fw_version.hotfix;
+
+	uc_fw->has_gsc_headers = true;
+	return 0;
+}
+
 /* Refer to the "GSC-based Firmware Layout" documentation entry for details */
 static int parse_cpd_header(struct xe_uc_fw *uc_fw, const void *data, size_t size,
 			    const char *manifest_entry, const char *css_entry)
@@ -654,9 +675,20 @@ static int parse_headers(struct xe_uc_fw *uc_fw, const struct firmware *fw)
 	case XE_UC_FW_TYPE_GSC:
 		return parse_gsc_layout(uc_fw, fw->data, fw->size);
 	case XE_UC_FW_TYPE_HUC:
-		ret = parse_cpd_header(uc_fw, fw->data, fw->size, "HUCP.man", "huc_fw");
-		if (!ret || ret != -ENOENT)
-			return ret;
+		if (uc_fw_to_xe(uc_fw)->info.platform == XE_DG2) {
+			/* Check if binary starts directly with manifest */
+			if (fw->size >= sizeof(u32) && *(const u32 *)fw->data == 0x4)
+				return parse_manifest_direct(uc_fw, fw->data, fw->size);
+
+			/* DG2 HuC is loaded via MEI, so we don't need a CSS header (pass NULL) */
+			ret = parse_cpd_header(uc_fw, fw->data, fw->size, "HUCP.man", NULL);
+			if (!ret || ret != -ENOENT)
+				return ret;
+		} else {
+			ret = parse_cpd_header(uc_fw, fw->data, fw->size, "HUCP.man", "huc_fw");
+			if (!ret || ret != -ENOENT)
+				return ret;
+		}
 		fallthrough;
 	case XE_UC_FW_TYPE_GUC:
 		return parse_css_header(uc_fw, fw->data, fw->size);
@@ -780,12 +812,14 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
 			       XE_UC_FIRMWARE_MISSING :
 			       XE_UC_FIRMWARE_ERROR);
 
-	if (err == -ENOENT)
+	if (err == -ENOENT) {
 		xe_gt_info(gt, "%s firmware %s not found\n",
 			   xe_uc_fw_type_repr(uc_fw->type), uc_fw->path);
-	else
+	} else {
 		xe_gt_notice(gt, "%s firmware %s: fetch failed with error %pe\n",
 			     xe_uc_fw_type_repr(uc_fw->type), uc_fw->path, ERR_PTR(err));
+	}
+
 	xe_gt_info(gt, "%s firmware(s) can be downloaded from %s\n",
 		   xe_uc_fw_type_repr(uc_fw->type), XE_UC_FIRMWARE_URL);
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 139434946f8f..75af3a22c56a 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -137,7 +137,8 @@ VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was = XE_RTP_TABLE_SR(
 	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1200, 1255),
 		       ENGINE_CLASS(VIDEO_DECODE),
 		       FUNC(xe_rtp_match_even_instance)),
-	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS,
+			     XE_RTP_ACTION_FLAG(ENGINE_BASE))),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
 	{ XE_RTP_NAME("14011059788"),
diff --git a/drivers/misc/mei/gsc-me.c b/drivers/misc/mei/gsc-me.c
index 73d5beeb9c34..0741962a2e79 100644
--- a/drivers/misc/mei/gsc-me.c
+++ b/drivers/misc/mei/gsc-me.c
@@ -278,6 +278,10 @@ static const struct auxiliary_device_id mei_gsc_id_table[] = {
 		.name = "xe.mei-gscfi",
 		.driver_data = MEI_ME_GSCFI_CFG,
 	},
+	{
+		.name = "xe.mei-gsc",
+		.driver_data = MEI_ME_GSC_CFG,
+	},
 	{
 		/* sentinel */
 	}
@@ -299,5 +303,6 @@ MODULE_AUTHOR("Intel Corporation");
 MODULE_ALIAS("auxiliary:i915.mei-gsc");
 MODULE_ALIAS("auxiliary:i915.mei-gscfi");
 MODULE_ALIAS("auxiliary:xe.mei-gscfi");
+MODULE_ALIAS("auxiliary:xe.mei-gsc");
 MODULE_DESCRIPTION("Intel(R) Graphics System Controller");
 MODULE_LICENSE("GPL");
-- 
2.55.0

