Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3063CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 17:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B474210E1BF;
	Fri, 29 Aug 2025 17:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d86Sb88+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12EF610EC0E
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 17:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756488004; x=1788024004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NkDPZhnaE4EcNGTZYgTwFygZsO7WXE0YmEVEej7NYr8=;
 b=d86Sb88+jvxgW/SP2i26kpJEAlgbBUgCaxttqiEOcBjthzPdDmaXEHBP
 QSefx7ztB30Tx6mUxwgqT2NPF4/0KpnyWJw7SkZpM9gRd8tLQ5fimAtam
 idS9mK/W+MR2gApmPdS3+o6W5In7wBjVwQGAsC4MPVmkEN0tRN2SC1grJ
 FzGycf6PXt7RI52swFEqJBzqwEYF7inY7sNPQrjl8KvHrwDLQ09IYP9Tt
 ARP/mG8uFxTixica2IrNyWd8jFw+IDk4YIV4aC1gtQJdDwLCJeM1mldeB
 Sg947g8PTYnBeFxya/bVki3nU3yQwx+hbk1an/qW4mrNy+qixlynU/dTY A==;
X-CSE-ConnectionGUID: RFXWbKpjTwaidc4tkqqGPA==
X-CSE-MsgGUID: 9x83lKsbR6SoaR6rPd2RkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="70212775"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="70212775"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:20:03 -0700
X-CSE-ConnectionGUID: xgzr0XArQ4G1elMEF4vZag==
X-CSE-MsgGUID: CGfTAt0sSiuK5+0XiC7rUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170818461"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:20:01 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 7/7] drm/xe/kunit: Allow to run tests against custom
 platform
Date: Fri, 29 Aug 2025 19:19:22 +0200
Message-ID: <20250829171922.572-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250829171922.572-1-michal.wajdeczko@intel.com>
References: <20250829171922.572-1-michal.wajdeczko@intel.com>
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

We might want to run our KUnit tests against not defined yet
future platform that differs from the existing ones only by
new GDMID versions being used, but otherwise it is similar
to existing graphics and media IP.

Add kunit-only "dut" modparam where we can specify GMDIDs to
be used by param generators:

    $ tools/testing/kunit/kunit.py run ... \
        --kernel_args=xe.dut=LUNARLAKE:2025:2025 \
        "*xe_[wp][ac]*.*_??"
    ...
    KTAP version 1
    1..2
        KTAP version 1
        # Subtest: xe_pci
        # module: xe_test
        1..2
            KTAP version 1
            # Subtest: check_graphics_ip
            ok 1 20.25 Xe2_LPG
        ok 1 check_graphics_ip
            KTAP version 1
            # Subtest: check_media_ip
            ok 1 20.25 Xe2_LPM
        ok 2 check_media_ip
    # xe_pci: pass:2 fail:0 skip:0 total:2
    # Totals: pass:2 fail:0 skip:0 total:2
    ok 1 xe_pci
        KTAP version 1
        # Subtest: xe_wa
        # module: xe_test
        1..1
            KTAP version 1
            # Subtest: xe_wa_gt
            ok 1 LUNARLAKE 20.25(Xe2_LPG) A0 20.25(Xe2_LPM) A0
        ok 1 xe_wa_gt
    ok 2 xe_wa

Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 125 +++++++++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index f19b1a64128b..0ab3f71b0fb7 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -12,6 +12,91 @@
 #include <kunit/test-bug.h>
 #include <kunit/visibility.h>
 
+/* defined as arrays to allow reuse param_gens macros */
+static struct xe_pci_fake_data dut_pci_data[1];
+static struct xe_ip dut_graphics_ip[1];
+static struct xe_ip dut_media_ip[1];
+
+static bool has_custom_dut(void)
+{
+	return dut_pci_data[0].graphics_verx100;
+}
+
+static enum xe_platform find_platform_by_name(const char *name)
+{
+	const struct xe_device_desc *desc;
+	const struct pci_device_id *ids;
+
+	for (ids = pciidlist; ids->driver_data; ids++) {
+		desc = (const void *)ids->driver_data;
+		if (!strcmp(name, desc->platform_name))
+			return desc->platform;
+	}
+	return XE_PLATFORM_UNINITIALIZED;
+}
+
+static const struct xe_ip *find_similar_graphics_ip(unsigned int verx100)
+{
+	size_t i;
+
+	for (i = 1; i < ARRAY_SIZE(graphics_ips); i++)
+		if (graphics_ips[i].verx100 > verx100)
+			break;
+	return &graphics_ips[i - 1];
+}
+
+static const struct xe_ip *find_similar_media_ip(unsigned int verx100)
+{
+	size_t i;
+
+	for (i = 1; i < ARRAY_SIZE(media_ips); i++)
+		if (media_ips[i].verx100 > verx100)
+			break;
+	return &media_ips[i - 1];
+}
+
+static int dut_param_set(const char *val, const struct kernel_param *kp)
+{
+	char buf[32], *s = buf, *tok;
+	const struct xe_ip *origin;
+
+	strscpy(buf, val);
+	tok = strsep(&s, ":");
+	dut_pci_data[0].platform = find_platform_by_name(tok);
+	if (dut_pci_data[0].platform < XE_METEORLAKE)
+		return -EINVAL;
+	tok = strsep(&s, ":");
+	if (kstrtouint(tok, 10, &dut_pci_data[0].graphics_verx100))
+		return -EINVAL;
+	tok = strsep(&s, ":");
+	if (kstrtouint(tok, 10, &dut_pci_data[0].media_verx100))
+		return -EINVAL;
+
+	dut_pci_data[0].subplatform = XE_SUBPLATFORM_NONE;
+	dut_pci_data[0].step.graphics = STEP_A0;
+	dut_pci_data[0].step.media = STEP_A0;
+
+	origin = find_similar_graphics_ip(dut_pci_data[0].graphics_verx100);
+	dut_graphics_ip[0].verx100 = dut_pci_data[0].graphics_verx100;
+	dut_graphics_ip[0].name = origin->name;
+	dut_graphics_ip[0].desc = origin->desc;
+
+	origin = find_similar_media_ip(dut_pci_data[0].media_verx100);
+	dut_media_ip[0].verx100 = dut_pci_data[0].media_verx100;
+	dut_media_ip[0].name = origin->name;
+	dut_media_ip[0].desc = origin->desc;
+
+	return 0;
+}
+
+static const struct kernel_param_ops dut_param_ops = {
+	.set = dut_param_set,
+};
+
+module_param_cb(dut, &dut_param_ops, NULL, 0400);
+MODULE_PARM_DESC(dut, "Specify fake GMDID platform to be used during tests:\n"
+		 "dut=<PLATFORM_NAME>:<GRAPHICS_VERx100>:<MEDIA_VERx100>\n");
+
 #define PLATFORM_CASE(platform__, graphics_step__)					\
 	{										\
 		.platform = XE_ ## platform__,						\
@@ -64,6 +149,13 @@ static const struct xe_pci_fake_data cases[] = {
 
 KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
 
+static void xe_pci_fake_data_desc_nc(struct xe_pci_fake_data *param, char *desc)
+{
+	xe_pci_fake_data_desc(param, desc);
+}
+
+KUNIT_ARRAY_PARAM(dut_platform, dut_pci_data, xe_pci_fake_data_desc_nc);
+
 /**
  * xe_pci_fake_data_gen_params - Generate struct xe_pci_fake_data parameters
  * @prev: the pointer to the previous parameter to iterate from or NULL
@@ -77,6 +169,8 @@ KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
  */
 const void *xe_pci_fake_data_gen_params(const void *prev, char *desc)
 {
+	if (has_custom_dut())
+		return dut_platform_gen_params(prev, desc);
 	return platform_gen_params(prev, desc);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_data_gen_params);
@@ -152,14 +246,14 @@ static const char *sriov_name(enum xe_sriov_mode mode)
 
 static const char *lookup_graphics_name(unsigned int verx100)
 {
-	const struct xe_ip *ip = find_graphics_ip(verx100);
+	const struct xe_ip *ip = find_similar_graphics_ip(verx100);
 
 	return ip ? ip->name : "";
 }
 
 static const char *lookup_media_name(unsigned int verx100)
 {
-	const struct xe_ip *ip = find_media_ip(verx100);
+	const struct xe_ip *ip = find_similar_media_ip(verx100);
 
 	return ip ? ip->name : "";
 }
@@ -207,6 +301,14 @@ static void xe_ip_kunit_desc(const struct xe_ip *param, char *desc)
 KUNIT_ARRAY_PARAM(graphics_ip, graphics_ips, xe_ip_kunit_desc);
 KUNIT_ARRAY_PARAM(media_ip, media_ips, xe_ip_kunit_desc);
 
+static void xe_ip_kunit_desc_nc(struct xe_ip *param, char *desc)
+{
+	xe_ip_kunit_desc(param, desc);
+}
+
+KUNIT_ARRAY_PARAM(dut_graphics_ip, dut_graphics_ip, xe_ip_kunit_desc_nc);
+KUNIT_ARRAY_PARAM(dut_media_ip, dut_media_ip, xe_ip_kunit_desc_nc);
+
 static void xe_pci_id_kunit_desc(const struct pci_device_id *param, char *desc)
 {
 	const struct xe_device_desc *dev_desc =
@@ -232,6 +334,8 @@ KUNIT_ARRAY_PARAM(pci_id, pciidlist, xe_pci_id_kunit_desc);
  */
 const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc)
 {
+	if (has_custom_dut())
+		return dut_graphics_ip_gen_params(prev, desc);
 	return graphics_ip_gen_params(prev, desc);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
@@ -249,6 +353,8 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
  */
 const void *xe_pci_media_ip_gen_param(const void *prev, char *desc)
 {
+	if (has_custom_dut())
+		return dut_media_ip_gen_params(prev, desc);
 	return media_ip_gen_params(prev, desc);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
@@ -292,6 +398,16 @@ static void fake_xe_info_probe_tile_count(struct xe_device *xe)
 	/* Nothing to do, just use the statically defined value. */
 }
 
+static const struct xe_ip *find_dut_graphics_ip(unsigned int verx100)
+{
+	return dut_graphics_ip[0].verx100 == verx100 ? dut_graphics_ip : NULL;
+}
+
+static const struct xe_ip *find_dut_media_ip(unsigned int verx100)
+{
+	return dut_media_ip[0].verx100 == verx100 ? dut_media_ip : NULL;
+}
+
 int xe_pci_fake_device_init(struct xe_device *xe)
 {
 	struct kunit *test = kunit_get_current_test();
@@ -332,6 +448,11 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 	kunit_activate_static_stub(test, xe_info_probe_tile_count,
 				   fake_xe_info_probe_tile_count);
 
+	if (has_custom_dut()) {
+		kunit_activate_static_stub(test, find_graphics_ip, find_dut_graphics_ip);
+		kunit_activate_static_stub(test, find_media_ip, find_dut_media_ip);
+	}
+
 	xe_info_init_early(xe, desc, subplatform_desc);
 	xe_info_init(xe, desc);
 
-- 
2.47.1

