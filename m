Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394B7C282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 13:49:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D341B10E9F6;
	Fri, 14 Mar 2025 13:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lSQFl+XX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCAA10E9F6
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 13:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741960197; x=1773496197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s4o1XL3tV2Er1gt4ILM6Fd3S+QhU2PBIW4wUWkZf4qo=;
 b=lSQFl+XXEqIJXz6VYz9XZImwXcE5GM2TkCRnPyvDrhcUghXwh2NrcTTS
 VS/9iCovI/7wHe3kTax0ECHah504qsDp6QVMN228cvad4dKR0OSDz3Vjr
 Fp4Xd94ve1w3IPF0u253+E6YnttbBJZl+QH6HtOWkGbPQk6nja3w50BjT
 V24B7LOrubp8dwc7ivXKXFKxhZRxsXGhlfGJ3hiVTPvrTjc3OG6QXHKxu
 QAbfKfoH+rDzus2iUzj37NFFDQwv0lRVLaqr509jqVcwEcCpXLZZrarUT
 yn5piKzSTQGk220MKOY2wBMPfsHPgqZZIE9jPikf7hDxc67jGv5DIDugZ w==;
X-CSE-ConnectionGUID: TfSzwVjHRkyTK4jIdKeIZA==
X-CSE-MsgGUID: ZTBLuAh0S2axBIIoEHoQgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43240761"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43240761"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 06:49:57 -0700
X-CSE-ConnectionGUID: ubjsea+xSj2qVZoHYgbCCw==
X-CSE-MsgGUID: 5a4fEwboRnyCUayLwDLScw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126500317"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 06:49:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v5 1/3] drm/xe: Move survivability back to xe
Date: Fri, 14 Mar 2025 06:48:58 -0700
Message-ID: <20250314-fix-survivability-v5-1-fdb3559ea965@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314-fix-survivability-v5-0-fdb3559ea965@intel.com>
References: <20250314-fix-survivability-v5-0-fdb3559ea965@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-c25d1
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

Commit d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")=0D
moved the survivability handling to be done entirely in the xe_pci=0D
layer. However there are some issues with that approach:=0D
=0D
1) Survivability mode needs at least the mmio initialized, otherwise it=0D
   can't really read a register to decide if it should enter that state=0D
2) SR-IOV mode should be initialized, otherwise it's not possible to=0D
   check if it's VF=0D
=0D
Besides, as pointed by Riana the check for=0D
xe_survivability_mode_enable() was wrong in xe_pci_probe() since it's=0D
not a bool return.=0D
=0D
Fix that by moving the initialization to be entirely in the xe_device=0D
layer, with the correct dependencies handled: only after mmio and sriov=0D
initialization, and not triggering it on error from=0D
wait_for_lmem_ready(). This restores the trigger behavior before that=0D
commit. The xe_pci layer now only checks for "is it enabled?",=0D
like it's doing in xe_pci_suspend()/xe_pci_remove(), etc.=0D
=0D
Cc: Riana Tauro <riana.tauro@intel.com>=0D
Fixes: d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")=0D
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>=0D
---=0D
Changes in v5:=0D
- s/xe_survivability_mode_requested/survivability_mode_requested/ since=0D
  it's now static and tweak the docs to better explain the behavior=0D
=0D
Changes in v4:=0D
- Swap the returns for err and save_err (Riana)=0D
- Reword commit message to detail where the behavior before commit=0D
  d40f275d96e8 is being restored (Rodrigo)=0D
=0D
Changes in v3:=0D
- Stop using -ENOTRECOVERABLE as it may be confusing wrt=0D
  critical/non-critical failure. Returning 0 is sufficient=0D
- s/xe_survivability_mode_capable/xe_survivability_mode_requested/=0D
  as it's not only about it being capable, but also about the type of=0D
  error, firmware signaling it, etc.=0D
---=0D
 drivers/gpu/drm/xe/xe_device.c             | 17 +++++++++++++++--=0D
 drivers/gpu/drm/xe/xe_pci.c                | 16 +++++++---------=0D
 drivers/gpu/drm/xe/xe_survivability_mode.c | 19 ++++++++++++-------=0D
 drivers/gpu/drm/xe/xe_survivability_mode.h |  1 -=0D
 4 files changed, 34 insertions(+), 19 deletions(-)=0D
=0D
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.=
c=0D
index b2f656b2a563e..0e8805f93468d 100644=0D
--- a/drivers/gpu/drm/xe/xe_device.c=0D
+++ b/drivers/gpu/drm/xe/xe_device.c=0D
@@ -53,6 +53,7 @@=0D
 #include "xe_pxp.h"=0D
 #include "xe_query.h"=0D
 #include "xe_shrinker.h"=0D
+#include "xe_survivability_mode.h"=0D
 #include "xe_sriov.h"=0D
 #include "xe_tile.h"=0D
 #include "xe_ttm_stolen_mgr.h"=0D
@@ -711,8 +712,20 @@ int xe_device_probe_early(struct xe_device *xe)=0D
 	sriov_update_device_info(xe);=0D
 =0D
 	err =3D xe_pcode_probe_early(xe);=0D
-	if (err)=0D
-		return err;=0D
+	if (err) {=0D
+		int save_err =3D err;=0D
+=0D
+		/*=0D
+		 * Try to leave device in survivability mode if device is=0D
+		 * possible, but still return the previous error for error=0D
+		 * propagation=0D
+		 */=0D
+		err =3D xe_survivability_mode_enable(xe);=0D
+		if (err)=0D
+			return err;=0D
+=0D
+		return save_err;=0D
+	}=0D
 =0D
 	err =3D wait_for_lmem_ready(xe);=0D
 	if (err)=0D
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c=0D
index 4d982a5a4ffd9..6fea3091e2348 100644=0D
--- a/drivers/gpu/drm/xe/xe_pci.c=0D
+++ b/drivers/gpu/drm/xe/xe_pci.c=0D
@@ -808,16 +808,14 @@ static int xe_pci_probe(struct pci_dev *pdev, const s=
truct pci_device_id *ent)=0D
 		return err;=0D
 =0D
 	err =3D xe_device_probe_early(xe);=0D
-=0D
-	/*=0D
-	 * In Boot Survivability mode, no drm card is exposed and driver is=0D
-	 * loaded with bare minimum to allow for firmware to be flashed through=0D
-	 * mei. If early probe fails, check if survivability mode is flagged by=0D
-	 * HW to be enabled. In that case enable it and return success.=0D
-	 */=0D
 	if (err) {=0D
-		if (xe_survivability_mode_required(xe) &&=0D
-		    xe_survivability_mode_enable(xe))=0D
+		/*=0D
+		 * In Boot Survivability mode, no drm card is exposed and driver=0D
+		 * is loaded with bare minimum to allow for firmware to be=0D
+		 * flashed through mei. If early probe failed, but it managed to=0D
+		 * enable survivability mode, return success.=0D
+		 */=0D
+		if (xe_survivability_mode_is_enabled(xe))=0D
 			return 0;=0D
 =0D
 		return err;=0D
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/x=
e/xe_survivability_mode.c=0D
index d939ce70e6fa8..7b1ec643f0f09 100644=0D
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c=0D
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c=0D
@@ -178,15 +178,16 @@ bool xe_survivability_mode_is_enabled(struct xe_devic=
e *xe)=0D
 	return xe->survivability.mode;=0D
 }=0D
 =0D
-/**=0D
- * xe_survivability_mode_required - checks if survivability mode is requir=
ed=0D
- * @xe: xe device instance=0D
+/*=0D
+ * survivability_mode_requested - check if it's possible to enable=0D
+ * survivability mode and that was requested by firmware=0D
  *=0D
- * This function reads the boot status from Pcode=0D
+ * This function reads the boot status from Pcode.=0D
  *=0D
- * Return: true if boot status indicates failure, false otherwise=0D
+ * Return: true if platform support is available and boot status indicates=
=0D
+ * failure, false otherwise.=0D
  */=0D
-bool xe_survivability_mode_required(struct xe_device *xe)=0D
+static bool survivability_mode_requested(struct xe_device *xe)=0D
 {=0D
 	struct xe_survivability *survivability =3D &xe->survivability;=0D
 	struct xe_mmio *mmio =3D xe_root_tile_mmio(xe);=0D
@@ -208,7 +209,8 @@ bool xe_survivability_mode_required(struct xe_device *x=
e)=0D
  *=0D
  * Initialize survivability information and enable survivability mode=0D
  *=0D
- * Return: 0 for success, negative error code otherwise.=0D
+ * Return: 0 if survivability mode is enabled or not requested; negative e=
rror=0D
+ * code otherwise.=0D
  */=0D
 int xe_survivability_mode_enable(struct xe_device *xe)=0D
 {=0D
@@ -216,6 +218,9 @@ int xe_survivability_mode_enable(struct xe_device *xe)=
=0D
 	struct xe_survivability_info *info;=0D
 	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);=0D
 =0D
+	if (!survivability_mode_requested(xe))=0D
+		return 0;=0D
+=0D
 	survivability->size =3D MAX_SCRATCH_MMIO;=0D
 =0D
 	info =3D devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),=0D
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/x=
e/xe_survivability_mode.h=0D
index f4df5f9025ce8..d7e64885570d4 100644=0D
--- a/drivers/gpu/drm/xe/xe_survivability_mode.h=0D
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.h=0D
@@ -12,6 +12,5 @@ struct xe_device;=0D
 =0D
 int xe_survivability_mode_enable(struct xe_device *xe);=0D
 bool xe_survivability_mode_is_enabled(struct xe_device *xe);=0D
-bool xe_survivability_mode_required(struct xe_device *xe);=0D
 =0D
 #endif /* _XE_SURVIVABILITY_MODE_H_ */=0D
=0D
-- =0D
2.48.1=0D
=0D
