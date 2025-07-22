Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD15C83F34
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 18:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33AE10E6F6;
	Tue, 22 Jul 2025 18:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQFwOhHi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D7310E6EE
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 18:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753208793; x=1784744793;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3rt60e6eol0tIbgqpOGpku5pcFCrx6AHxF4yiLDNY74=;
 b=eQFwOhHia5y3OkarnN1zToxbzVHMLRe29LAn3eSUeX2g9JLLVJyJFFQt
 b/AjHLO+jyYwwI37lWEO9syZESxqsfr/BjQp+MRDdLgS/5eU1NHSsnJH0
 kyr/6WYZvCZ3I8xvikDsWa0+o4JipHySopYpKxiyDc0MI6DcaFk5vm16w
 HPABJmQ7cNeJAFu2etdPzFtMWOjpTxOwDV12lYEuAB8uc+FuB5yL/DU57
 QL/XG8l3rzLRB8yKHRp9tjQxrqdcXiu5w2U0PKA/wP1AKrPcc4TT9DyWJ
 k0z6mb42izoSiM8RqBDDDaJPnjdhycQug4ZTYNTWssXACreg2Ztvs+jfR w==;
X-CSE-ConnectionGUID: 1iRh3i0LRGezezqmhx1qOw==
X-CSE-MsgGUID: Y2R5UFn9TAGIPsoxTozjNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66045763"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="66045763"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 11:26:33 -0700
X-CSE-ConnectionGUID: 9T9+K1zJQ1qcVDBZkMOKrQ==
X-CSE-MsgGUID: PpvW8hktTgesouqIXGpWKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; d="scan'208";a="159308231"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 11:26:31 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/4] drm/xe/pf: Enable SR-IOV PF mode by default
Date: Tue, 22 Jul 2025 20:26:16 +0200
Message-ID: <20250722182618.30811-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722182618.30811-1-michal.wajdeczko@intel.com>
References: <20250722182618.30811-1-michal.wajdeczko@intel.com>
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

