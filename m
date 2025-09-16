Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60355CAC598
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 17:17:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B1E10E0AE;
	Tue, 16 Sep 2025 17:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C05sUgs/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3C210E0AE
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 17:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758043020; x=1789579020;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E3hs+qTwIQRytXoel2qkLyGtG0LZC8Cy5hXQKVZ26SY=;
 b=C05sUgs/UrhYatoerVeufCIhI3QqceYW1m+P9DE0B3I4/oFnIz7GrLoZ
 9wqxuqJHrDfIpq76qg1iORfBP9bsB7uxAV0CsQ0xmziS6Y6LXqw4PnliF
 2J+e5oJq6/NwYIB+av4Ae/MnpFBcmsCmUIknzwDNdSZIkvHXWP5unQSfX
 yGGlXzEHuYeHhtlScvP74ftquDg7XfuKgYw5tobA3E9fvpxUK/hu7OUWc
 jRwOZzYda7O1MdHWYxveugxC6CptymlfAdtYdmyyHeCGHqalzE4dkuiuu
 lqXjdNR1pxT4e3oXus7+UYdGT0bNGxQIw3pYGc+uVgYsfDIIg8PMboN0l A==;
X-CSE-ConnectionGUID: OwuyMudqSsOupzUTO8AQ9g==
X-CSE-MsgGUID: kdBdsTJ2SmqzH0xuzcxghg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64135022"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64135022"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 10:17:00 -0700
X-CSE-ConnectionGUID: J7i3NaPxTJ6XoWWSzPjOdQ==
X-CSE-MsgGUID: 8C7Ql9R5RX27m0RoFrWBdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="175779396"
Received: from rjayathi-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.43])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 10:16:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v3] drm/xe/tests: Add pre-GMDID IP descriptors to param
 generators
Date: Tue, 16 Sep 2025 19:16:45 +0200
Message-ID: <20250916171645.3335-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Recently introduced kunit parameter generators were based on
the existing arrays which have only GDMID-based IPs and didn't
take into account IP definitions from pre-GMDID era.

Add test only arrays with pre-GMDID IPs (as those will not change)
and extend param generators to start iterating over them.

 [ ] =================== xe_pci (2 subtests) ====================
 [ ] ==================== check_graphics_ip  ====================
 [ ] [PASSED] 12.00 Xe_LP
 [ ] [PASSED] 12.10 Xe_LP+
 [ ] [PASSED] 12.55 Xe_HPG
 [ ] [PASSED] 12.60 Xe_HPC
 [ ] [PASSED] 12.70 Xe_LPG
 [ ] [PASSED] 12.71 Xe_LPG
 [ ] [PASSED] 12.74 Xe_LPG+
 [ ] [PASSED] 20.01 Xe2_HPG
 [ ] [PASSED] 20.02 Xe2_HPG
 [ ] [PASSED] 20.04 Xe2_LPG
 [ ] [PASSED] 30.00 Xe3_LPG
 [ ] [PASSED] 30.01 Xe3_LPG
 [ ] [PASSED] 30.03 Xe3_LPG
 [ ] ================ [PASSED] check_graphics_ip ================
 [ ] ===================== check_media_ip  ======================
 [ ] [PASSED] 12.00 Xe_M
 [ ] [PASSED] 12.55 Xe_HPM
 [ ] [PASSED] 13.00 Xe_LPM+
 [ ] [PASSED] 13.01 Xe2_HPM
 [ ] [PASSED] 20.00 Xe2_LPM
 [ ] [PASSED] 30.00 Xe3_LPM
 [ ] [PASSED] 30.02 Xe3_LPM
 [ ] ================= [PASSED] check_media_ip ==================
 [ ] ===================== [PASSED] xe_pci ======================

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: use generic is_insidevar() macro instead custom one (Michal)
    add comment about pre-GMDID IP array (Lucas)
v3: avoid using "legacy" word (Jani, Lucas)
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 35 +++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index f19b1a64128b..aa29ac759d5d 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -204,6 +204,27 @@ static void xe_ip_kunit_desc(const struct xe_ip *param, char *desc)
 		 param->verx100 / 100, param->verx100 % 100, param->name);
 }
 
+/*
+ * Pre-GMDID Graphics and Media IPs definitions.
+ *
+ * Mimic the way GMDID IPs are declared so the same
+ * param generator can be used for both
+ */
+static const struct xe_ip pre_gmdid_graphics_ips[] = {
+	graphics_ip_xelp,
+	graphics_ip_xelpp,
+	graphics_ip_xehpg,
+	graphics_ip_xehpc,
+};
+
+static const struct xe_ip pre_gmdid_media_ips[] = {
+	media_ip_xem,
+	media_ip_xehpm,
+};
+
+KUNIT_ARRAY_PARAM(pre_gmdid_graphics_ip, pre_gmdid_graphics_ips, xe_ip_kunit_desc);
+KUNIT_ARRAY_PARAM(pre_gmdid_media_ip, pre_gmdid_media_ips, xe_ip_kunit_desc);
+
 KUNIT_ARRAY_PARAM(graphics_ip, graphics_ips, xe_ip_kunit_desc);
 KUNIT_ARRAY_PARAM(media_ip, media_ips, xe_ip_kunit_desc);
 
@@ -232,6 +253,13 @@ KUNIT_ARRAY_PARAM(pci_id, pciidlist, xe_pci_id_kunit_desc);
  */
 const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc)
 {
+	const void *next = pre_gmdid_graphics_ip_gen_params(prev, desc);
+
+	if (next)
+		return next;
+	if (is_insidevar(prev, pre_gmdid_graphics_ips))
+		prev = NULL;
+
 	return graphics_ip_gen_params(prev, desc);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
@@ -249,6 +277,13 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
  */
 const void *xe_pci_media_ip_gen_param(const void *prev, char *desc)
 {
+	const void *next = pre_gmdid_media_ip_gen_params(prev, desc);
+
+	if (next)
+		return next;
+	if (is_insidevar(prev, pre_gmdid_media_ips))
+		prev = NULL;
+
 	return media_ip_gen_params(prev, desc);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
-- 
2.47.1

