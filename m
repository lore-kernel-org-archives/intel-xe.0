Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CA0C5DF89
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 11:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F1410E278;
	Fri, 21 Aug 2026 11:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g10fs7TT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0471C10E2A1
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 11:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787311555; x=1818847555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TcniHyGZH36HNECntk+lFMh3XVfFaESLvd1RoJoglr4=;
 b=g10fs7TTjMKo3IuXqckbFmVQQ+IBQJacwBhfavNfIZIny5YTsLvSuWqc
 Ldpb+N+gcc1M2cj6Qhq6AaALL5xNDduU9bxtRi9N/ac7MJOj7jgS/8TFm
 JO5zSfH7iDT3GxbpKd890U4I0jRbrs4jm7UQ1ZOcpZLZ2b048cZ9fg+R5
 hMyP26WlMWPy+ixm0AlwTPbo+IP649zDSFmgwZBv3xsvFaiSHzlHLkSNG
 oHMR1I9S5Yn4LI5T8NEwlOHtOzrhAZMV67Rmol7bR74VD8EUbJrj206xI
 KKwSiPXy7j5BSR2d/XigIDHpg4UYW5O2YGJYX5jdOGVqbiWiSQ60/J9XP A==;
X-CSE-ConnectionGUID: hNQk82IURM2GekmQ+3yAKQ==
X-CSE-MsgGUID: +8uXAH5/SNm3Z428IBHmSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="90377571"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="90377571"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 04:25:55 -0700
X-CSE-ConnectionGUID: XbVnDzKzRJGph6LiX3I4mA==
X-CSE-MsgGUID: lFIw0fYFTuKyRsg0LqQ8sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="304523479"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 21 Aug 2026 04:25:51 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, lukas@wunner.de,
 daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v10 10/10] drm/xe/doc: Wire up PCI Error Handling
Date: Fri, 21 Aug 2026 16:53:32 +0530
Message-ID: <20260821112436.545405-11-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821112436.545405-1-raag.jadav@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
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

