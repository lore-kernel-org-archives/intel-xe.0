Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F759C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 18:11:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21C010E9E6;
	Fri, 27 Jun 2025 18:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BEKKKHeA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF8610E9E6
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 18:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751047882; x=1782583882;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hzednyJMNKTgnAm27k/iknASfqNLCKGWGPHfnTfu4ok=;
 b=BEKKKHeANnANJB/CF0iGezYA5Oq+v7GVF7gPvFOBvkkui9jmHch3CnWJ
 v8MgTj9voZqKSwp0mnRfVzs6dA73tvnq9/x32/XlJXFI6+vCnDpi87qci
 XRTNgKRnnvjpQFrTqQseI9lN0WyqLBK2qIMqNiKno+TIhmesy844hLq0C
 yKLb+lPnJvwALBV6so9xuiE1lDcXnDa/Yfvs7KVwAYOP/wvcV27VrMt68
 386bhpT2L+RZiwl1KE+RSpZhQ6HYtIk+SY074Z2Ym47vZ84bg0bL7V7+4
 6mWQECffcKAfn/uIAw80FH3QwRfkXt4pcm6BwxZh7TPXsIfo+si6w0lwf g==;
X-CSE-ConnectionGUID: lF2qUhuZTz22WxGgv/j8rg==
X-CSE-MsgGUID: yOneAK3vRQG5rQjZSgnOAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="70802734"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="70802734"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 11:11:22 -0700
X-CSE-ConnectionGUID: +Sv5gqEpQZ+i01Qr2l9jtQ==
X-CSE-MsgGUID: QMVHBQULS8efBBdRu55W7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="183907105"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 11:11:21 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/tests: Add legacy IP descriptors to param generators
Date: Fri, 27 Jun 2025 20:11:10 +0200
Message-Id: <20250627181110.1436-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Recently introduced kunit parameter generators where based on
the existing arrays which have only GDMID-bsaed IP and didn't
take into account legacy IP definitions from pre-GMDID era.

Add test only arrays with legacy IPs (as those will not change)
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
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 33 +++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index baccb657bd05..c5acee52b458 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -12,12 +12,31 @@
 #include <kunit/test-bug.h>
 #include <kunit/visibility.h>
 
+#define IS_ARRAY_ROW(arr, row) ((typeof(&(arr)[0]))(row) - (arr) < ARRAY_SIZE(arr))
+
 static void xe_ip_kunit_desc(const struct xe_ip *param, char *desc)
 {
 	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%u.%02u %s",
 		 param->verx100 / 100, param->verx100 % 100, param->name);
 }
 
+/* Pre-GMDID Graphics IPs */
+static const struct xe_ip legacy_graphics_ips[] = {
+	graphics_ip_xelp,
+	graphics_ip_xelpp,
+	graphics_ip_xehpg,
+	graphics_ip_xehpc,
+};
+
+/* Pre-GMDID Media IPs */
+static const struct xe_ip legacy_media_ips[] = {
+	media_ip_xem,
+	media_ip_xehpm,
+};
+
+KUNIT_ARRAY_PARAM(legacy_graphics_ip, legacy_graphics_ips, xe_ip_kunit_desc);
+KUNIT_ARRAY_PARAM(legacy_media_ip, legacy_media_ips, xe_ip_kunit_desc);
+
 KUNIT_ARRAY_PARAM(graphics_ip, graphics_ips, xe_ip_kunit_desc);
 KUNIT_ARRAY_PARAM(media_ip, media_ips, xe_ip_kunit_desc);
 
@@ -34,6 +53,13 @@ KUNIT_ARRAY_PARAM(media_ip, media_ips, xe_ip_kunit_desc);
  */
 const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc)
 {
+	const void *next = legacy_graphics_ip_gen_params(prev, desc);
+
+	if (next)
+		return next;
+	if (IS_ARRAY_ROW(legacy_graphics_ips, prev))
+		prev = NULL;
+
 	return graphics_ip_gen_params(prev, desc);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
@@ -51,6 +77,13 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_graphics_ip_gen_param);
  */
 const void *xe_pci_media_ip_gen_param(const void *prev, char *desc)
 {
+	const void *next = legacy_media_ip_gen_params(prev, desc);
+
+	if (next)
+		return next;
+	if (IS_ARRAY_ROW(legacy_media_ips, prev))
+		prev = NULL;
+
 	return media_ip_gen_params(prev, desc);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_media_ip_gen_param);
-- 
2.47.1

