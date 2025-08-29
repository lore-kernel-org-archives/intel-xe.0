Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10862CA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 17:19:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC1210E223;
	Fri, 29 Aug 2025 17:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lq8qHezH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6333410EC13
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 17:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756487990; x=1788023990;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0uYBLpNBWHCmY6IZ5Ut8gujQ80fYeMics9SOHIeF9cg=;
 b=Lq8qHezHgtM+OF0v6l2nXhuGTfnPs2J5rr0q6zPMMLoiqOsI7gV1NUg3
 u2l2p1VyWyiMQFTgEzSbtNuT2OOTL1f4z1Eey5adni/APtEKfjtGYvHRd
 Ql1WFeRU5XIOcJqXLAAYtJnVUI3h6WfC9OP5VSJSkqhYvHpXjOfaeGmB8
 BYRiC53DvW0qstRNUOsXmOCu9I92xbAR2PoTiQCZaMeAFIIMpxaYCwsVG
 BM1yknElDLiWoDAf/ILoExt+QneEui6Gjl3s2BIkg6CEriV2n1Gp5urti
 qtuyFvcaVVtN2uy8W7Pnue6R+fSLfM9AtQYSwwQJkool9oWp2pQQGO3CN g==;
X-CSE-ConnectionGUID: Bn9c2q2lQluDNlK+u0QwqQ==
X-CSE-MsgGUID: zD8ZvV8ZSuSrEdasg2rx/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="70212761"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="70212761"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:19:50 -0700
X-CSE-ConnectionGUID: /RB4lDJKRUyyD7k8ojdjiA==
X-CSE-MsgGUID: uFzKWw08SmKDRzPhKutwcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170818289"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:19:48 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 3/7] drm/xe/kunit: Introduce xe_pci_fake_data_desc()
Date: Fri, 29 Aug 2025 19:19:18 +0200
Message-ID: <20250829171922.572-4-michal.wajdeczko@intel.com>
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

We already use struct xe_pci_fake_data to provide custom config of
the fake PCI device and soon we will be using this struct also as
direct parameter for the parameterized Xe KUnit tests.

Add function to generate description based on that config data.

For platform or subplatform name lookup pciidlist which already
have definitions of all supported platforms.

Examples:

  TIGERLAKE
  TIGERLAKE A0
  TIGERLAKE SR-IOV PF
  ...
  PANTHERLAKE 30.00(Xe3_LPG) 30.00(Xe3_LPM)
  PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0
  PANTHERLAKE 30.00(Xe3_LPG) A0 30.00(Xe3_LPM) A0 SR-IOV VF

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: don't look at vendor/class_mask (Lucas)
    use %u.%02u notatation and print IP name (Michal)
---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 117 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h |   1 +
 2 files changed, 118 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index bb0ce0dc9b31..a8b35439131f 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -12,6 +12,123 @@
 #include <kunit/test-bug.h>
 #include <kunit/visibility.h>
 
+static const struct xe_device_desc *lookup_desc(enum xe_platform p)
+{
+	const struct xe_device_desc *desc;
+	const struct pci_device_id *ids;
+
+	for (ids = pciidlist; ids->driver_data; ids++) {
+		desc = (const void *)ids->driver_data;
+		if (desc->platform == p)
+			return desc;
+	}
+	return NULL;
+}
+
+static const struct xe_subplatform_desc *lookup_sub_desc(enum xe_platform p, enum xe_subplatform s)
+{
+	const struct xe_device_desc *desc = lookup_desc(p);
+	const struct xe_subplatform_desc *spd;
+
+	if (desc && desc->subplatforms)
+		for (spd = desc->subplatforms; spd->subplatform; spd++)
+			if (spd->subplatform == s)
+				return spd;
+	return NULL;
+}
+
+static const char *lookup_platform_name(enum xe_platform p)
+{
+	const struct xe_device_desc *desc = lookup_desc(p);
+
+	return desc ? desc->platform_name : "INVALID";
+}
+
+static const char *__lookup_subplatform_name(enum xe_platform p, enum xe_subplatform s)
+{
+	const struct xe_subplatform_desc *desc = lookup_sub_desc(p, s);
+
+	return desc ? desc->name : "INVALID";
+}
+
+static const char *lookup_subplatform_name(enum xe_platform p, enum xe_subplatform s)
+{
+	return s == XE_SUBPLATFORM_NONE ? "" : __lookup_subplatform_name(p, s);
+}
+
+static const char *subplatform_prefix(enum xe_subplatform s)
+{
+	return s == XE_SUBPLATFORM_NONE ? "" : " ";
+}
+
+static const char *step_prefix(enum xe_step step)
+{
+	return step == STEP_NONE ? "" : " ";
+}
+
+static const char *step_name(enum xe_step step)
+{
+	return step == STEP_NONE ? "" : xe_step_name(step);
+}
+
+static const char *sriov_prefix(enum xe_sriov_mode mode)
+{
+	return mode <= XE_SRIOV_MODE_NONE ? "" : " ";
+}
+
+static const char *sriov_name(enum xe_sriov_mode mode)
+{
+	return mode <= XE_SRIOV_MODE_NONE ? "" : xe_sriov_mode_to_string(mode);
+}
+
+static const char *lookup_graphics_name(unsigned int verx100)
+{
+	const struct xe_ip *ip = find_graphics_ip(verx100);
+
+	return ip ? ip->name : "";
+}
+
+static const char *lookup_media_name(unsigned int verx100)
+{
+	const struct xe_ip *ip = find_media_ip(verx100);
+
+	return ip ? ip->name : "";
+}
+
+/**
+ * xe_pci_fake_data_desc - Describe struct xe_pci_fake_data parameter
+ * @param: the &struct xe_pci_fake_data parameter to describe
+ * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
+ *
+ * This function prepares description of the struct xe_pci_fake_data parameter.
+ *
+ * It is tailored for use in parameterized KUnit tests where parameter generator
+ * is based on the struct xe_pci_fake_data arrays.
+ */
+void xe_pci_fake_data_desc(const struct xe_pci_fake_data *param, char *desc)
+{
+	if (param->graphics_verx100 || param->media_verx100)
+		snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s%s%s %u.%02u(%s)%s%s %u.%02u(%s)%s%s%s%s",
+			 lookup_platform_name(param->platform),
+			 subplatform_prefix(param->subplatform),
+			 lookup_subplatform_name(param->platform, param->subplatform),
+			 param->graphics_verx100 / 100, param->graphics_verx100 % 100,
+			 lookup_graphics_name(param->graphics_verx100),
+			 step_prefix(param->step.graphics), step_name(param->step.graphics),
+			 param->media_verx100 / 100, param->media_verx100 % 100,
+			 lookup_media_name(param->media_verx100),
+			 step_prefix(param->step.media), step_name(param->step.media),
+			 sriov_prefix(param->sriov_mode), sriov_name(param->sriov_mode));
+	else
+		snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s%s%s%s%s%s%s",
+			 lookup_platform_name(param->platform),
+			 subplatform_prefix(param->subplatform),
+			 lookup_subplatform_name(param->platform, param->subplatform),
+			 step_prefix(param->step.graphics), step_name(param->step.graphics),
+			 sriov_prefix(param->sriov_mode), sriov_name(param->sriov_mode));
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_data_desc);
+
 static void xe_ip_kunit_desc(const struct xe_ip *param, char *desc)
 {
 	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%u.%02u %s",
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index 32452bd65bff..1195839999ab 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -24,6 +24,7 @@ struct xe_pci_fake_data {
 };
 
 int xe_pci_fake_device_init(struct xe_device *xe);
+void xe_pci_fake_data_desc(const struct xe_pci_fake_data *param, char *desc);
 
 const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc);
 const void *xe_pci_media_ip_gen_param(const void *prev, char *desc);
-- 
2.47.1

