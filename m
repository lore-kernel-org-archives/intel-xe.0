Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2025FCD8C8E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 08:47:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55FF10EF80;
	Mon,  8 Jun 2026 08:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/Jt/MpQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CAE10EF7E
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 08:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780908474; x=1812444474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3clktXSSIxImRv+Dw1J6EYpugKygmdYAqTBXb5TGw3Y=;
 b=f/Jt/MpQDNF0tCJ11HtVAE4LEYFC2xlAATI3b1g7P8xLO7+2agbjzN2W
 dRUftQHMQ9gWbnc6C/2DArRv2ZW71iy5ty10QwpOQ6BsdEhJpGTNNdr3n
 fE4Tb5KIJ+DGhxKFlQTzCyHu5ybCETVLZeGkFYARvuEcvL3aJDbJH9Bwj
 ofJVT1+EyE8V7VKm0+ISnCxsiSuz+tsXsEwo2KGmNUl+89KPZzt4jIKZC
 44eTOo5mH4AVrwKcopRPnQG2Nv3vSvHUI+vwb2aL4E0x4OaLQmKFwLkY3
 atMYEAHzscuas5hbRzlwWByyX8i9YFo47p2nWsTCiclLc7LZ4RKbVfK5r w==;
X-CSE-ConnectionGUID: XM14ikUTRZuhIjeFkkYTFw==
X-CSE-MsgGUID: lRNhA6hBR5G89ZWbbAM0cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="93029105"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="93029105"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:47:54 -0700
X-CSE-ConnectionGUID: XXTWBgdKTJeagDmxUegZEQ==
X-CSE-MsgGUID: MbyJK30bQcCINAmFGo8MUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="269466121"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:47:50 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Anoop Vijay <anoop.c.vijay@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v8 10/15] drm/xe/xe_ras: Query errors from system controller
 on probe
Date: Mon,  8 Jun 2026 14:17:11 +0530
Message-ID: <20260608084700.640376-27-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260608084700.640376-17-riana.tauro@intel.com>
References: <20260608084700.640376-17-riana.tauro@intel.com>
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

During probe, process and log any errors detected by firmware while
the driver was not loaded. Critical errors such as Punit, CSC are
reported through Pcode init failure, causing the driver to
enter survivability mode on probe.

Move soc remapper and system controller initialization
up in xe_device_probe to allow querying errors on module load

Cc: Anoop Vijay <anoop.c.vijay@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2: fix comment (Raag)

v3: reword commit message (Umesh)
---
 drivers/gpu/drm/xe/xe_device.c | 20 ++++++++++----------
 drivers/gpu/drm/xe/xe_ras.c    |  7 +++++++
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ac3d6ae56fb9..7ee2148f1321 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -989,6 +989,16 @@ int xe_device_probe(struct xe_device *xe)
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
@@ -1029,10 +1039,6 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_nvm_init(xe);
 
-	err = xe_soc_remapper_init(xe);
-	if (err)
-		return err;
-
 	err = xe_heci_gsc_init(xe);
 	if (err)
 		return err;
@@ -1071,12 +1077,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
-	err = xe_sysctrl_init(xe);
-	if (err)
-		goto err_unregister_display;
-
-	xe_ras_init(xe);
-
 	err = xe_device_sysfs_init(xe);
 	if (err)
 		goto err_unregister_display;
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index cd4b19b57c04..837cb51fc854 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -326,4 +326,11 @@ void xe_ras_init(struct xe_device *xe)
 
 	if (IS_ENABLED(CONFIG_PCIEAER))
 		aer_unmask_and_downgrade_internal_error(xe);
+
+	/*
+	 * During probe, process and log any errors detected by firmware while the driver was not
+	 * loaded. Critical errors such as Punit and CSC are reported through Pcode init failure,
+	 * causing the driver to enter survivability mode.
+	 */
+	xe_ras_process_errors(xe);
 }
-- 
2.47.1

