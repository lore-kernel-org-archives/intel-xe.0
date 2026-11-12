Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1474606A323
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 14:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nA1628YQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A54911216C;
	Thu, 12 Nov 2026 14:02:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCEA11216C
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 14:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794492152; x=1826028152;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TcniHyGZH36HNECntk+lFMh3XVfFaESLvd1RoJoglr4=;
 b=nA1628YQps9ZJutJEoTne9efsXvTetVyqnH2Ufd/obuNO0f10Cf9D2Ea
 CC6p9H4uRGKrDMJTDF+7g9EVqvyAmLv9+A3pHRyldQBNeV9NwfDrHGtoV
 0xBvMIuYzbjx/ty0dKyK2SGzSflOS9PxFNgvWE2WtWYtv1W5r/6ifxSrh
 JuqcAz0GdY//a/+7uAMGrfMBomPwjU4sVaKRJ/Ho+S8clqWeieFo0INEa
 oWmr8cjFLYZ67luUFH7VlHNM9kpsVD1t3qnK5+KY3/Sr40Ir5ygF7bOrO
 iR+tV80V2NdPnjKWEBLEigfcZYRCSVwBK8EGOQpw/EjmBzFjv0lfIHDYb w==;
X-CSE-ConnectionGUID: tATyiQqKRaeTbIAE+xT9GA==
X-CSE-MsgGUID: GyXxKpJlSTuucpv2ycN49Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3154898"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3154898"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 06:02:31 -0800
X-CSE-ConnectionGUID: EnP3XguSTC+OfVvKDe4H3w==
X-CSE-MsgGUID: eWxf7DP/QLeJY2uLY4CTgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="9009532"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 12 Nov 2026 06:02:27 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 matthew.d.roper@intel.com, michal.winiarski@intel.com,
 matthew.auld@intel.com, dev@lankhorst.se, jani.nikula@intel.com,
 lukasz.laguna@intel.com, lukas@wunner.de, daniele.ceraolospurio@intel.com,
 badal.nilawar@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v16 10/10] drm/xe/doc: Wire up PCI Error Handling
Date: Thu, 12 Nov 2026 19:30:08 +0530
Message-ID: <20261112140126.1861005-11-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112140126.1861005-1-raag.jadav@intel.com>
References: <20261112140126.1861005-1-raag.jadav@intel.com>
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

