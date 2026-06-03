Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE26CD6E64
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 10:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CF310FB7D;
	Wed,  3 Jun 2026 10:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O9LzyxHY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25B310FB7C
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 10:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780482163; x=1812018163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3LPn2GhGcIEi26mbF/Bw9Tn/ukiJnkfq5bbnRyj7ku8=;
 b=O9LzyxHYz+rSU+nSmZphRKedkViB7iYOCi9p9QeZmMVoLqJA2ly48kmi
 /IWQTyBxTRuoASa92SFumxu+FNY1IG4CWg/srHMW34s0orL1t7PTECQUR
 35b5qMvxTUId3WQd7KTrlOuUgT2I4jjIOJZPLNNslQYFqox64X8bVPyC8
 X/FQTbr8iaWL8MJFiFpsrNAj3In3pELisv+VAsrqvOcVYhx42SRMmyKbx
 MZ6McMkMmpb4I738xTmtxsstq77MKi5qW8bT8EEdtN8l8tFns/Im6ili2
 hX7A2NEHIYjzwqKedG3K7E5LoWFchy/Z+RSdLXrnsMApYsV34OkIZWm3D w==;
X-CSE-ConnectionGUID: 2cQc+7/sTzmpDoTZmOn8Tw==
X-CSE-MsgGUID: j/hlKjs/TCGgys/5orAJ3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81143333"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81143333"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 03:22:43 -0700
X-CSE-ConnectionGUID: nGTabt/9SmqMMXWO1imufQ==
X-CSE-MsgGUID: PNT9iAZGToCtz+UPie2Knw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="248495710"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa004.jf.intel.com with ESMTP; 03 Jun 2026 03:22:39 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v8 10/10] drm/xe/doc: Wire up PCI Error Handling
Date: Wed,  3 Jun 2026 15:47:10 +0530
Message-ID: <20260603101814.916948-11-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603101814.916948-1-raag.jadav@intel.com>
References: <20260603101814.916948-1-raag.jadav@intel.com>
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
---
 Documentation/gpu/xe/index.rst        | 1 +
 Documentation/gpu/xe/xe_pci_error.rst | 8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_pci_error.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 874ffcb6da3a..34470ea5a32f 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -30,3 +30,4 @@ DG2, etc is provided to prototype the driver.
    xe-drm-usage-stats.rst
    xe_configfs
    xe_gt_stats
+   xe_pci_error
diff --git a/Documentation/gpu/xe/xe_pci_error.rst b/Documentation/gpu/xe/xe_pci_error.rst
new file mode 100644
index 000000000000..93f724c555bc
--- /dev/null
+++ b/Documentation/gpu/xe/xe_pci_error.rst
@@ -0,0 +1,8 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+==================
+PCI Error Handling
+==================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_pci_error.c
+   :doc: PCI Error Handling
-- 
2.43.0

