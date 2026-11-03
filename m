Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEBE606A329
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bdjqzN2X
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DB810E783;
	Tue,  3 Nov 2026 06:08:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D77710E783
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793686089; x=1825222089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TcniHyGZH36HNECntk+lFMh3XVfFaESLvd1RoJoglr4=;
 b=bdjqzN2X1UrMlWNkT1Vh2X9IPO4eiKYXHP+2s7m+FJlWhTJzqOX3uZ+o
 8xicwGQV6FlrqHThKgyTpHadosOl1Swwl9/oMCkL5tFfofZtb90mLKgxR
 XiSNgYP+zWbtLUaz1Ss7H1ekaQ5BhFSzo5TbidPKVMs3BUrWV9FOEMA9x
 d39fDRcgbcL4S1rJQelNE4Rf0bBaiOhZtA9p9/lKzIBwOcMHrxsAajWSf
 ylrDaUfi0CxWeIeWXfGknDf8wk8HBn5DSQ47xtfHRtdeqjvBCNZtbroWS
 4BPxR48XyrfwCQsjS73gMmGJF5z9sCFzqzFNOS7vt8/tMHmmfDcWM9YUu g==;
X-CSE-ConnectionGUID: hpzv4VCDRTuN5BxmPaKJLg==
X-CSE-MsgGUID: O/5CZsN0T3iwfi30ByLB1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2391661"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2391661"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:08:08 -0800
X-CSE-ConnectionGUID: EXdrPAOLRx+chxZJTTrv/A==
X-CSE-MsgGUID: ZvgI1ZGTQPW5yrcOxtIvlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6711675"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 02 Nov 2026 22:08:04 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, lukas@wunner.de,
 daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v12 10/10] drm/xe/doc: Wire up PCI Error Handling
Date: Tue,  3 Nov 2026 11:36:26 +0530
Message-ID: <20261103060649.1015468-11-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103060649.1015468-1-raag.jadav@intel.com>
References: <20261103060649.1015468-1-raag.jadav@intel.com>
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

Wire up PCI Error Handling documentation.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 Documentation/gpu/xe/index.rst        | 1 +
 Documentation/gpu/xe/xe_pci_error.rst | 8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_pci_error.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 0247a255f7e6..497a0a4b12f6 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -36,3 +36,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
    xe_configfs
    xe_gt_stats
    xe_sigid
+   xe_pci_error
diff --git a/Documentation/gpu/xe/xe_pci_error.rst b/Documentation/gpu/xe/xe_pci_error.rst
new file mode 100644
index 000000000000..25cc5a8adf99
--- /dev/null
+++ b/Documentation/gpu/xe/xe_pci_error.rst
@@ -0,0 +1,8 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+=====================
+Xe PCI Error Handling
+=====================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_pci_error.c
+   :doc: Xe PCI Error Handling
-- 
2.43.0

