Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D38C7EE33
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 21:26:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9B010E2F1;
	Thu, 26 Jun 2025 21:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YO04gdZ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6249E10E2F1
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 21:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750973167; x=1782509167;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jgqx3ELpbKO3LCaYgf5FQqjxYmO0CSaaVmMpio9kP98=;
 b=YO04gdZ2wv8t0TnoLZu+61Mb9pkHoFpnVWY5Y5vyG1i0GdzU5Vj7oYKl
 mhMdSKNz0n2iZ+OXcBeSzUwVLM0/G/FSEtllLlpJQbBXB0/Fbj+sHKxj3
 dsziPyUfjC7CsEDr039c+2hk7r4lOs0EP1bn3/PTIVicqv+0oGd5Qp1oC
 9vfzt5v4zxK3IKtImdpr35t+SBDWF0L6/OZSbFShEfba3HEvgjwHFD191
 +3FHzI6Ig8lYblUwMAFrPYtKu23WYxWtyAbYskuV5OU3jVXmjVl9euLUp
 YGlw8OjkEfUz7l7ebfCteNJXkJVdzvNmusVTp21GqT++SK1oevfgSR68G A==;
X-CSE-ConnectionGUID: qEYEX6/gR/GIiXaImVC26g==
X-CSE-MsgGUID: gZKxBaXJTx2pMZaTEPJ+FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="52403569"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="52403569"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 14:26:07 -0700
X-CSE-ConnectionGUID: 0VN4NHOER3GQqmOE59pxCw==
X-CSE-MsgGUID: 8H38dIVhQWa+9vVCiVMEhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="152731957"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 14:26:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3] drm/xe: Normalize default param values
Date: Thu, 26 Jun 2025 14:25:53 -0700
Message-ID: <20250626-guc-log-level-v3-1-c3ed8b452e91@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250612-guc-log-level-79f87ca03396
X-Mailer: b4 0.15-dev-a7f9c
Content-Transfer-Encoding: quoted-printable
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

Document xe module params with the default values following a similar=0D
strategy for all of them:=0D
=0D
	1) Define a DEFAULT_* macro with the default value. When the=0D
	   value can't be directly stringified, also define a *_STR=0D
	   variant=0D
	2) Use __stringify() or the _STR variant to make sure the=0D
	   default value shows up in the param description=0D
=0D
This allows us to show the correct default according to the=0D
configuration. max_vfs for example was wrongly documented for=0D
CONFIG_DRM_XE_DEBUG and svm_notifier_size didn't have its default=0D
documented.=0D
=0D
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>=0D
---=0D
Changes in v3:=0D
- First 2 patches merged=0D
- Rework the last one according to review feedback (John Harrison):=0D
  - Add missing DEFAULT_VRAM_BAR_SIZE=0D
  - Define DEFAULT_MAX_VFS_STR based on DEFAULT_MAX_VFS if possible=0D
  - Bring back ifdef for CONFIG_PCI_IOV=0D
- Link to v2: https://lore.kernel.org/r/20250613-guc-log-level-v2-0-cb84a63=
e49fe@intel.com=0D
=0D
Changes in v2:=0D
- Rework the second patch so the default is kept in a single place and=0D
  the module description doesn't need to be repeated according to the=0D
  configuration, suggested by Michal Wajdeczko.=0D
- Add a new patch to normalize all module param descriptions=0D
- Link to v1: https://lore.kernel.org/r/20250612-guc-log-level-v1-0-51f124a=
3be6d@intel.com=0D
---=0D
 drivers/gpu/drm/xe/xe_module.c | 44 ++++++++++++++++++++++++++++----------=
----=0D
 1 file changed, 30 insertions(+), 14 deletions(-)=0D
=0D
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.=
c=0D
index 192908fa074cb..064093bf1adca 100644=0D
--- a/drivers/gpu/drm/xe/xe_module.c=0D
+++ b/drivers/gpu/drm/xe/xe_module.c=0D
@@ -19,34 +19,47 @@=0D
 #include "xe_sched_job.h"=0D
 =0D
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)=0D
-#define DEFAULT_GUC_LOG_LEVEL	3=0D
+#define DEFAULT_GUC_LOG_LEVEL		3=0D
+#define DEFAULT_MAX_VFS			~0=0D
+#define DEFAULT_MAX_VFS_STR		"unlimited"=0D
 #else=0D
-#define DEFAULT_GUC_LOG_LEVEL	1=0D
+#define DEFAULT_GUC_LOG_LEVEL		1=0D
+#define DEFAULT_MAX_VFS			0=0D
+#define DEFAULT_MAX_VFS_STR		__stringify(DEFAULT_MAX_VFS)=0D
 #endif=0D
 =0D
+#define DEFAULT_PROBE_DISPLAY		true=0D
+#define DEFAULT_VRAM_BAR_SIZE		0=0D
+#define DEFAULT_FORCE_PROBE		CONFIG_DRM_XE_FORCE_PROBE=0D
+#define DEFAULT_WEDGED_MODE		1=0D
+#define DEFAULT_SVM_NOTIFIER_SIZE	512=0D
+=0D
 struct xe_modparam xe_modparam =3D {=0D
-	.probe_display =3D true,=0D
-	.guc_log_level =3D DEFAULT_GUC_LOG_LEVEL,=0D
-	.force_probe =3D CONFIG_DRM_XE_FORCE_PROBE,=0D
+	.probe_display =3D	DEFAULT_PROBE_DISPLAY,=0D
+	.guc_log_level =3D	DEFAULT_GUC_LOG_LEVEL,=0D
+	.force_probe =3D		DEFAULT_FORCE_PROBE,=0D
 #ifdef CONFIG_PCI_IOV=0D
-	.max_vfs =3D IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,=0D
+	.max_vfs =3D		DEFAULT_MAX_VFS,=0D
 #endif=0D
-	.wedged_mode =3D 1,=0D
-	.svm_notifier_size =3D 512,=0D
+	.wedged_mode =3D		DEFAULT_WEDGED_MODE,=0D
+	.svm_notifier_size =3D	DEFAULT_SVM_NOTIFIER_SIZE,=0D
 	/* the rest are 0 by default */=0D
 };=0D
 =0D
 module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint,=
 0600);=0D
-MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), mu=
st be power of 2");=0D
+MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size in MiB, mus=
t be power of 2 "=0D
+		 "[default=3D" __stringify(DEFAULT_SVM_NOTIFIER_SIZE) "]");=0D
 =0D
 module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool=
, 0444);=0D
 MODULE_PARM_DESC(force_execlist, "Force Execlist submission");=0D
 =0D
 module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);=
=0D
-MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left unt=
ouched (default: true)");=0D
+MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left unt=
ouched "=0D
+		 "[default=3D" __stringify(DEFAULT_PROBE_DISPLAY) "])");=0D
 =0D
 module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 06=
00);=0D
-MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size (in MiB) - <0=3Ddis=
able-resize, 0=3Dmax-needed-size[default], >0=3Dforce-size");=0D
+MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB (<0=3Ddisabl=
e-resize, 0=3Dmax-needed-size, >0=3Dforce-size "=0D
+		 "[default=3D" __stringify(DEFAULT_VRAM_BAR_SIZE) "])");=0D
 =0D
 module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);=0D
 MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=3Ddisable, =
1=3Dnormal, 2..5=3Dverbose-levels "=0D
@@ -66,18 +79,21 @@ MODULE_PARM_DESC(gsc_firmware_path,=0D
 =0D
 module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 040=
0);=0D
 MODULE_PARM_DESC(force_probe,=0D
-		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PRO=
BE for details.");=0D
+		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PRO=
BE for details "=0D
+		 "[default=3D" DEFAULT_FORCE_PROBE "])");=0D
 =0D
 #ifdef CONFIG_PCI_IOV=0D
 module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);=0D
 MODULE_PARM_DESC(max_vfs,=0D
 		 "Limit number of Virtual Functions (VFs) that could be managed. "=0D
-		 "(0 =3D no VFs [default]; N =3D allow up to N VFs)");=0D
+		 "(0=3Dno VFs; N=3Dallow up to N VFs "=0D
+		 "[default=3D" DEFAULT_MAX_VFS_STR "])");=0D
 #endif=0D
 =0D
 module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600)=
;=0D
 MODULE_PARM_DESC(wedged_mode,=0D
-		 "Module's default policy for the wedged mode - 0=3Dnever, 1=3Dupon-crit=
ical-errors[default], 2=3Dupon-any-hang");=0D
+		 "Module's default policy for the wedged mode (0=3Dnever, 1=3Dupon-criti=
cal-errors, 2=3Dupon-any-hang "=0D
+		 "[default=3D" __stringify(DEFAULT_WEDGED_MODE) "])");=0D
 =0D
 static int xe_check_nomodeset(void)=0D
 {=0D
=0D
=0D
=0D
