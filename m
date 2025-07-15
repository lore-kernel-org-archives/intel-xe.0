Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E42C83F22
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 18:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5C710E234;
	Tue, 15 Jul 2025 18:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iu3ut+WI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322DF10E234
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 18:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752603290; x=1784139290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3rt60e6eol0tIbgqpOGpku5pcFCrx6AHxF4yiLDNY74=;
 b=iu3ut+WIviQPYvetqO4AH8Fg+ilZ/7NmvP4DbzlIVchBGhTB03JWdwOP
 ECRFs9oEJ3FdDVG8nuKFXrqnyGN4VywO6lMa4Ljk3gVI0LG0g9Z3DTbnH
 nvCYIxnMkQm9Uq59YohCH0JP7SDUO2x/C2NH5I/hCdQPagcNWIFzVNvNR
 ot7F8Owu/F4B1Jb3IzhyFDCSLb7ITEcjOMSlw37kpmEJK3Shxlae6NVQo
 Mc3wwtR/gdEgmUayrZMowYDirfWsr+4xiklLX9DfziwG9O5XESOgg1xRl
 F2qmVvJowca+rr6k1YIPj+ErhjORBjSKGvr5mKhbVXJ7/fiXC35pmm+fk A==;
X-CSE-ConnectionGUID: bERJm+m8Tr6opkFC5BZhEg==
X-CSE-MsgGUID: SnZb7fRYSuCkAXC+v43giQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65406511"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="65406511"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 11:14:50 -0700
X-CSE-ConnectionGUID: 7//T/Jg1SWyw0HywKlFmLg==
X-CSE-MsgGUID: msb05aO4TyqV2wmrMHlVsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="162845985"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.253.198])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 11:14:48 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/4] drm/xe/pf: Enable SR-IOV PF mode by default
Date: Tue, 15 Jul 2025 20:14:16 +0200
Message-Id: <20250715181419.807-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250715181419.807-1-michal.wajdeczko@intel.com>
References: <20250715181419.807-1-michal.wajdeczko@intel.com>
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

We already claim official support for SR-IOV PF/VF modes on PTL
and BMG platforms, but by default we start the Xe driver on those
platforms in non-virtualized mode (native) since we still have
max_vfs modparam set to disable creation of the VFs.

It's time to let the Xe driver support SR-IOV PF mode by default.
We were already testing this on our CI, which was relying on the
patch that was enabling it for CONFIG_DRM_XE_DEBUG used by our CI.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 107ffe87808c..d9391bd08194 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -27,6 +27,8 @@
 #define DEFAULT_PROBE_DISPLAY		true
 #define DEFAULT_VRAM_BAR_SIZE		0
 #define DEFAULT_FORCE_PROBE		CONFIG_DRM_XE_FORCE_PROBE
+#define DEFAULT_MAX_VFS			~0
+#define DEFAULT_MAX_VFS_STR		"unlimited"
 #define DEFAULT_WEDGED_MODE		1
 #define DEFAULT_SVM_NOTIFIER_SIZE	512
 
@@ -34,6 +36,9 @@ struct xe_modparam xe_modparam = {
 	.probe_display =	DEFAULT_PROBE_DISPLAY,
 	.guc_log_level =	DEFAULT_GUC_LOG_LEVEL,
 	.force_probe =		DEFAULT_FORCE_PROBE,
+#ifdef CONFIG_PCI_IOV
+	.max_vfs =		DEFAULT_MAX_VFS,
+#endif
 	.wedged_mode =		DEFAULT_WEDGED_MODE,
 	.svm_notifier_size =	DEFAULT_SVM_NOTIFIER_SIZE,
 	/* the rest are 0 by default */
@@ -79,7 +84,8 @@ MODULE_PARM_DESC(force_probe,
 module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
 MODULE_PARM_DESC(max_vfs,
 		 "Limit number of Virtual Functions (VFs) that could be managed. "
-		 "(0 = no VFs [default]; N = allow up to N VFs)");
+		 "(0=no VFs; N=allow up to N VFs "
+		 "[default=" DEFAULT_MAX_VFS_STR "])");
 #endif
 
 module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
-- 
2.47.1

