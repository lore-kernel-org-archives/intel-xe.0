Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4A0F8DFCE
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 08:26:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2786810E997;
	Fri, 17 Apr 2026 08:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bp8i9wvF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB2610E997
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 08:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776414382; x=1807950382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+5kHTju4JiElibNXW+1fkwwGlVJkFtg50Kd5YCrc6k4=;
 b=Bp8i9wvFonx6q1S2l58CvsS/m12gOEZ1cHUx1Be7atm5X4PGcGXACpwH
 BBiGFRfCjQk6OKlARla9sPjXAsd7q1nX3GppMPjRpDn1tVkGIUKRBRAt0
 HoammjaW1BdB15/RlwvOqhVKo/rKhLaTOtHU912BJR+FW7KSfpQkF6sPy
 cEuoXqJjr1yNs9GqmTIa9wdc4iidU2vnpe+MXoLVN1wMsA63csiGdlikQ
 TWcnWgWi8hLcqpv6Kk4aAq1p2t43nFWl4wbCSInPJmUny/p+iWBHZRnm1
 lTTBo+ffrKTruel57IxjlzSuSjRVx5RhJLNbom0VDForMrPVf5C4/dL0i w==;
X-CSE-ConnectionGUID: tXKvSWwhREW6MY1CKseUJQ==
X-CSE-MsgGUID: ha5xmpIBTBCgpJD6LcvGrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88045917"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="88045917"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:26:21 -0700
X-CSE-ConnectionGUID: 6wMvzVUeSleHPK8S9ksfRg==
X-CSE-MsgGUID: rVdvjXJRRKmSMTdY+YbKnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235962323"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:26:16 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Anoop Vijay <anoop.c.vijay@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v4 12/13] drm/xe/xe_ras: Query errors from system controller
 on probe
Date: Fri, 17 Apr 2026 14:28:24 +0530
Message-ID: <20260417085812.4013309-27-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260417085812.4013309-15-riana.tauro@intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
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

Reorder soc remapper and system controller initialization to
early probe to allow querying errors on module load.

Cc: Anoop Vijay <anoop.c.vijay@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 20 ++++++++++----------
 drivers/gpu/drm/xe/xe_ras.c    |  7 +++++++
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c1c54836ac73..035c8151605a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -970,6 +970,16 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_soc_remapper_init(xe);
+	if (err)
+		return err;
+
+	err = xe_sysctrl_init(xe);
+	if (err)
+		return err;
+
+	xe_ras_init(xe);
+
 	/*
 	 * Now that GT is initialized (TTM in particular),
 	 * we can try to init display, and inherit the initial fb.
@@ -1010,10 +1020,6 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_nvm_init(xe);
 
-	err = xe_soc_remapper_init(xe);
-	if (err)
-		return err;
-
 	err = xe_heci_gsc_init(xe);
 	if (err)
 		return err;
@@ -1052,10 +1058,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
-	err = xe_sysctrl_init(xe);
-	if (err)
-		goto err_unregister_display;
-
 	err = xe_device_sysfs_init(xe);
 	if (err)
 		goto err_unregister_display;
@@ -1075,8 +1077,6 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_vsec_init(xe);
 
-	xe_ras_init(xe);
-
 	err = xe_sriov_init_late(xe);
 	if (err)
 		goto err_unregister_display;
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 42ec27c05e9a..7598eeb796f0 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -479,4 +479,11 @@ void xe_ras_init(struct xe_device *xe)
 	/* Get any pages that need to be offlined from firmware and reserve them */
 	get_offlined_list(xe);
 	get_queued_pages(xe);
+
+	/*
+	 * On init, process and log any errors detected by firmware before driver init.
+	 * Critical errors are handled in xe_pcode_probe_early(), which enters survivability mode
+	 * if required.
+	 */
+	xe_ras_process_errors(xe);
 }
-- 
2.47.1

