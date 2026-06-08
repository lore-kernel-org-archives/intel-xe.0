Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D870CD8CAB
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64B910F765;
	Mon,  8 Jun 2026 16:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FEQKe5kM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE18210F773
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780937696; x=1812473696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kjMLiGswdaOLSzq6jI4d4AuOQw+R8eGSgfSpcR1qx3A=;
 b=FEQKe5kMeeWMVo8VqwL7DfKjomSEihwhLen9m/bELO6pGYkqoqxRmPBA
 itd3W9CpuRpNeczDSotgKnKSn8sy4F1OzpRMEK3ue9f5b0/7q81RJJD1D
 wFKEjtOmtxytlOgcE66ZDMemE3u9moGvaM775T0cThJOa7Qx2xafCQoy0
 3CDzv4z+RObATyp3npZhM4rsm+Og98RwlnHiexuegVSjdND4eSxgC+KzZ
 j7rGlQzNdX94ZWOtoqTjyFk6dq4C8yPabnIvrxgxRVN/2jsitEa0+jmFP
 kNgA1A+isZaeX6p2EGfuWov0wEO2yqHTzZM/5PaD49SmXkr1VfZG5LhE6 g==;
X-CSE-ConnectionGUID: ukiFk9VCRu69GBaRqDCjYw==
X-CSE-MsgGUID: Np0Ae2rvS8u3nmmVXaaK5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81744573"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81744573"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:56 -0700
X-CSE-ConnectionGUID: ciWTN0fUSqSawchHtpF1bg==
X-CSE-MsgGUID: 9q3q4hijS8aZBRjL6JY/+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247467600"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 13/16] drm/xe/kunit: Add fake GTTMMADR
Date: Mon,  8 Jun 2026 18:54:26 +0200
Message-ID: <20260608165429.587-14-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608165429.587-1-michal.wajdeczko@intel.com>
References: <20260608165429.587-1-michal.wajdeczko@intel.com>
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

We want to reuse more unmodified xe code during initialization of
our fake xe_device, but in many cases this code is accessing the
MMIO BAR to either access the HW registers or update the GGTT. To
avoid adding stubs all over the places, it is easier to add fake
GTTMMADR implementation using logic_iomem and map that instead.

Note that by default we will ignore all writes to the GTTMMADR and
we will fail the test after any read operations except the VF_CAP
register, as all other read operations should be implemented by
the tests themselves, using custom logic_iomem ops.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 101 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h |   5 ++
 2 files changed, 106 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 9240aff779da..3a31cfe1d490 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -7,6 +7,8 @@
 
 #include "tests/xe_test.h"
 
+#include <linux/logic_iomem.h>
+
 #include <kunit/test-bug.h>
 #include <kunit/test.h>
 #include <kunit/test-bug.h>
@@ -338,6 +340,101 @@ static void fake_xe_info_probe_tile_count(struct xe_device *xe)
 	/* Nothing to do, just use the statically defined value. */
 }
 
+static unsigned long __gttmmadr_read(void *priv, unsigned int offset, int size, bool vf)
+{
+	struct kunit *test = priv;
+	unsigned long val = ULONG_MAX;
+
+	if (offset == VF_CAP_REG.addr)
+		val = vf ? VF_CAP : 0;
+	else
+		kunit_set_failure(test);
+
+	/* can't use kunit_info() as it allocates memory */
+	pr_info("fake GTTMMADR read %x %u %lx\n", offset, size, val);
+	return val;
+}
+
+static unsigned long fake_gttmmadr_read(void *priv, unsigned int offset, int size)
+{
+	return __gttmmadr_read(priv, offset, size, false);
+}
+
+static unsigned long fake_vf_gttmmadr_read(void *priv, unsigned int offset, int size)
+{
+	return __gttmmadr_read(priv, offset, size, true);
+}
+
+static void fake_gttmmadr_write(void *priv, unsigned int offset, int size, unsigned long val)
+{
+	/* can't use kunit_info() as it allocates memory */
+	pr_info("fake GTTMMADR write %x %u %#lx\n", offset, size, val);
+}
+
+static const struct logic_iomem_ops fake_gttmmadr_ops = {
+	.read = fake_gttmmadr_read,
+	.write = fake_gttmmadr_write,
+};
+
+static const struct logic_iomem_ops fake_vf_gttmmadr_ops = {
+	.read = fake_vf_gttmmadr_read,
+	.write = fake_gttmmadr_write,
+};
+
+#define FAKE_GTTMMADR_ADDR	0xe0000
+#define FAKE_GTTMMADR_SIZE	(XE_MAX_TILES_PER_DEVICE * SZ_16M)
+
+struct resource fake_gttmmadr = DEFINE_RES_MEM(FAKE_GTTMMADR_ADDR, FAKE_GTTMMADR_SIZE);
+
+static long fake_gttmmadr_map(unsigned long offset, size_t size,
+			      const struct logic_iomem_ops **ops,
+			      void **priv)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct xe_pci_fake_data *data;
+
+	if (WARN_ON(size > FAKE_GTTMMADR_SIZE || offset % FAKE_GTTMMADR_SIZE))
+		return -EINVAL;
+
+	if (WARN_ON(!test))
+		return -ENOPKG;
+
+	data = test->priv;
+	if (data && data->gttmmadr.ops) {
+		*ops = data->gttmmadr.ops;
+		*priv = data->gttmmadr.priv ?: test;
+	} else if (data && data->sriov_mode == XE_SRIOV_MODE_VF) {
+		*ops = &fake_vf_gttmmadr_ops;
+		*priv = test;
+	} else {
+		*ops = &fake_gttmmadr_ops;
+		*priv = test;
+	}
+	return 0;
+}
+
+static const struct logic_iomem_region_ops fake_gttmmadr_region_ops = {
+	.map = fake_gttmmadr_map,
+};
+
+static void add_fake_gttmmadr(struct kunit *test)
+{
+	KUNIT_ASSERT_EQ(test, 0, logic_iomem_add_region(&fake_gttmmadr, &fake_gttmmadr_region_ops));
+}
+
+static int fake_xe_mmio_probe_early(struct xe_device *xe)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	struct kunit *test = kunit_get_current_test();
+
+	xe->mmio.size = xe->info.tile_count * SZ_16M;
+	xe->mmio.regs = devm_ioremap(xe->drm.dev, FAKE_GTTMMADR_ADDR, xe->mmio.size);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe->mmio.regs);
+
+	xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
+	return 0;
+}
+
 int xe_pci_fake_device_init(struct xe_device *xe)
 {
 	struct kunit *test = kunit_get_current_test();
@@ -378,6 +475,10 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
 	kunit_activate_static_stub(test, xe_info_probe_tile_count,
 				   fake_xe_info_probe_tile_count);
+	kunit_activate_static_stub(test, xe_mmio_probe_early, fake_xe_mmio_probe_early);
+
+	if (IS_ENABLED(CONFIG_INDIRECT_IOMEM))
+		DO_ONCE_LITE(add_fake_gttmmadr, test);
 
 	xe_info_init_early(xe, desc, subplatform_desc);
 	xe_info_init(xe, desc);
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index 30505d1cbefc..90a33bd2a72b 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -22,6 +22,11 @@ struct xe_pci_fake_data {
 	struct xe_step_info step;
 	u32 graphics_verx100;
 	u32 media_verx100;
+
+	struct {
+		const struct logic_iomem_ops *ops;
+		void *priv;
+	} gttmmadr;
 };
 
 int xe_pci_fake_device_init(struct xe_device *xe);
-- 
2.47.1

