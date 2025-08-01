Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E406C87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 18:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EC810E8DB;
	Fri,  1 Aug 2025 18:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TlyPAxeR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC6710E317
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 18:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754072044; x=1785608044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H/hDroiny0qw2y4fZiseG1qzujqCqCjHd2n4DXHLjn0=;
 b=TlyPAxeR4/crBi50cTN5B78+LU0+rI1NrAFAspmtDp4aKGASATxXjJBw
 NiHdVxr1ipAGiTCAk+uLRMhbcwtRyEwNAOKDHoFoMoM3JU+KDdXAS4Z4S
 xbUIfgjgcPYa0jiU061RqG/iHczKitcjM8cI13c0AEuAqeOHaFOmA3O3s
 IiV5eczyzF/K6MytG3uTYkHRh8GmmQ4r4OqQp9rjb/a3Mh3MYn1eMzOac
 FWBtZwo6w5fWg4X/SyGnVsBZcqU3xCXlERSQbqiRNno3MVtnI5kOiTMWc
 4Fviwtu0hzvZUg9O5BFW6OWHYNuMS98Z/aN70AtorSaz7o1rzVIt+OQsl Q==;
X-CSE-ConnectionGUID: srvmBKqnSSS5tXf3ghiJXw==
X-CSE-MsgGUID: iH3MwRVJTEeZPw9RMn2Srg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56315565"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56315565"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 11:14:03 -0700
X-CSE-ConnectionGUID: RAPBASsWTA6Dhq8BOqSu2A==
X-CSE-MsgGUID: XwHp+ruJQ0S0zAVL67GdNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163553806"
Received: from mkolod1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 11:14:01 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/6] drm/xe/kunit: Introduce xe_pci_fake_data_desc()
Date: Fri,  1 Aug 2025 20:13:46 +0200
Message-ID: <20250801181350.180780-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801181350.180780-1-michal.wajdeczko@intel.com>
References: <20250801181350.180780-1-michal.wajdeczko@intel.com>
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
the fake PCI device and soon we will be using thios struct also as
direct parameter for the parameterized Xe KUnit tests.

Add function to generate description based on that config data.

For platform or subplatform name lookup pciidlist which already
have definitions of all supported platforms.

Examples:

  TIGERLAKE
  TIGERLAKE A0
  TIGERLAKE SR-IOV PF
  ...
  PANTHERLAKE
  PANTHERLAKE SR-IOV PF
  PANTHERLAKE 3000 3000
  PANTHERLAKE 3000 A0 3000 A0
  PANTHERLAKE 3000 A0 3000 A0 SR-IOV VF

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 101 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_pci_test.h |   1 +
 2 files changed, 102 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 81bc86647499..5c6403785984 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -12,6 +12,107 @@
 #include <kunit/test-bug.h>
 #include <kunit/visibility.h>
 
+static const struct xe_device_desc *lookup_desc(enum xe_platform p)
+{
+	const struct pci_device_id *ids = pciidlist;
+	const struct xe_device_desc *desc;
+
+	for (; ids->vendor || ids->subvendor || ids->class_mask; ids++) {
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
+		snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s%s%s %u%s%s %u%s%s%s%s",
+			 lookup_platform_name(param->platform),
+			 subplatform_prefix(param->subplatform),
+			 lookup_subplatform_name(param->platform, param->subplatform),
+			 param->graphics_verx100,
+			 step_prefix(param->step.graphics), step_name(param->step.graphics),
+			 param->media_verx100,
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

