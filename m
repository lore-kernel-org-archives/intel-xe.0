Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C22C54E58
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 14:51:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651701127DD;
	Tue, 12 Mar 2024 14:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ARLRPk1P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2E61127DD
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 14:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710255089; x=1741791089;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6YbryoVSPHV2R6s8zfwzPtn28OsKGU/zJOjtkQ2AU0c=;
 b=ARLRPk1PIuFkbMhTlF1NZGCYXUNgLMfh2VH6/Cm+AlcxILzcw+/w+Yfy
 taYwYJcdKvx26mlRxn2k2eAJoZdjGqL4qHD4b1G4v0bPIWgdUM/naySvj
 kKCuhANvbxOUGcKTrmiL8H4u5q3R0Gs1OMOWbUj2TZ1SZdj1kpLcFAnDt
 zi6AL1in7EnDzwxC/awvp9YI6AoclJs8rzezr3FDQPN8OMigywBH1lhtm
 T79Fb93dRXLSysBUFUuKuR2c8V1gbXg5PYAlKEQaAMs4ByLoECQ9ElGIQ
 qPEjANAdFnnxhRfje22zczIKIFhZy3VT2S0I5kNGLu9WPkErBw1ca0CEQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16109788"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16109788"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:51:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11468364"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:51:28 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [CI 2/2] CI: add MODULE_ALIAS for compat
Date: Tue, 12 Mar 2024 07:51:58 -0700
Message-ID: <20240312145158.2295351-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240312145158.2295351-1-lucas.demarchi@intel.com>
References: <20240312145158.2295351-1-lucas.demarchi@intel.com>
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

Probably just to test in CI and not worth squashing in previous patch.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
index eb1ea99a5a8b..d11086f44af1 100644
--- a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
+++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
@@ -8,3 +8,9 @@ MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("xe live kunit tests");
 MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+
+/* compat with previous names */
+MODULE_ALIAS("xe_bo_test");
+MODULE_ALIAS("xe_dma_buf_test");
+MODULE_ALIAS("xe_migrate_test");
+MODULE_ALIAS("xe_mocs_test");
-- 
2.43.0

