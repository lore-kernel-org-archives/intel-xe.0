Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE881D767F8
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 18:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8770D10E90C;
	Thu, 31 Oct 2024 18:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k2bFy2IN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC46710E90C
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 18:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730399382; x=1761935382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lNER5mL/uEkiXEE24+IynFrC4+8Tn9wIKIYyJhdVvv0=;
 b=k2bFy2INPb+o6gm18+LKF5C4TQfU9e+j/Y9xk+CqwK7Be7KKkX1LAUqY
 BH5uIYIYtpEVCANJahIRIOCGm0EFl1PdT6ZZI4JkRTgv/BT5REmkBeuqt
 Lb/1AnZ20lhWbtMVGt/IpNuc+TSaLZBpRxmkiB+RFx8mbNuqeZK/mMO/z
 PKYTK9GjNu0NHegClBMmX0rc0kZQyreQuOrhuKyunsGZP/CyA3MwHsgxp
 56Mc8ONWLSjF1szJ3RL2fIThTKYGSLmf+S504iTrCVesvKxCcB9UCfQ8V
 0ifIKYF7ZRPAzS/pRy5iWpX4gJmVGWm28y3gLOVTNyXqH+4Sq7ckXK34F Q==;
X-CSE-ConnectionGUID: 1Mem7bsgRpiVhX2VGYU84A==
X-CSE-MsgGUID: j9RHIJ6nRNumbUdAvUc8Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30323556"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30323556"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:29:41 -0700
X-CSE-ConnectionGUID: fovbBd32THGZvgvX8zHi0g==
X-CSE-MsgGUID: UpCNmR6ESRatSMJHP7qbfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="82626235"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:29:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 2/2] drm/xe: Wire up devcoredump in documentation
Date: Thu, 31 Oct 2024 11:29:16 -0700
Message-ID: <20241031182916.1441987-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031182916.1441987-1-lucas.demarchi@intel.com>
References: <20241031182916.1441987-1-lucas.demarchi@intel.com>
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

Add a documentation page to detail the device coredump as implemented by
xe - it was documented in the source code, but not visible in the
rendered (html) documentation.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 Documentation/gpu/xe/index.rst          |  1 +
 Documentation/gpu/xe/xe_devcoredump.rst | 14 ++++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_devcoredump.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 3f07aa3b54325..92cfb25e64d32 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -23,4 +23,5 @@ DG2, etc is provided to prototype the driver.
    xe_firmware
    xe_tile
    xe_debugging
+   xe_devcoredump
    xe-drm-usage-stats.rst
diff --git a/Documentation/gpu/xe/xe_devcoredump.rst b/Documentation/gpu/xe/xe_devcoredump.rst
new file mode 100644
index 0000000000000..ae4ec0e34dc01
--- /dev/null
+++ b/Documentation/gpu/xe/xe_devcoredump.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+==================
+Xe Device Coredump
+==================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_devcoredump.c
+   :doc: Xe device coredump
+
+Internal API
+============
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_devcoredump.c
+   :internal:
-- 
2.47.0

