Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E993CD4840
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 16:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546A610E837;
	Mon, 11 May 2026 16:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AuFgkFau";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF7B10E84F
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 16:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778518598; x=1810054598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5o80rVACov1kihBWx69pdPTFTiTu9tor+QUWjqZnaJs=;
 b=AuFgkFaufhnufyj9HyWse3WUJvmJonRCWSqr1Fnj9NaSpbsINX0cg3+u
 yb8tXVe42QDPA0t6LJ4A+fgygZ0TPBilhW/+twd8zDO109x9NR5JM4weO
 coP9pz5pKy4TXtc1/YrakjX9KgHZdtol2s6cxroHcO0vAoEpeWDClGdOM
 fKqgGgWBdj0kS1EeMFrFStxs6Kxo7q7PrJc+k4h9NPfUaqCffLjLmlFyB
 vPtkv8CD9OBS79/oc0bKeZyOWRdbXaOysAaILlx3bkCpMsbrb9nho7bHm
 VYiBgS+PQCOcxXfVKPd5yABZgmtfuYF9kV5YDq/7U9+ygPwczviSdSVd1 g==;
X-CSE-ConnectionGUID: MSE9OaJ6T6uFf+Yz09TfRg==
X-CSE-MsgGUID: QHMV3InRQW2nmeaPo5fAzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90513573"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90513573"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:38 -0700
X-CSE-ConnectionGUID: hIVDOJ3CTBKKSfWjun5Btg==
X-CSE-MsgGUID: Zs5oMb73QB2Ow2vFOPVHoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="260988785"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:34 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Anoop Vijay <anoop.c.vijay@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v5 11/14] drm/xe/xe_ras: Query errors from system controller
 on probe
Date: Mon, 11 May 2026 22:59:18 +0530
Message-ID: <20260511172908.1122252-27-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260511172908.1122252-16-riana.tauro@intel.com>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
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
v2: fix comment (Raag)
---
 drivers/gpu/drm/xe/xe_device.c | 20 ++++++++++----------
 drivers/gpu/drm/xe/xe_ras.c    |  7 +++++++
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 200d6bbb1b70..041af7ffc8bb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -963,6 +963,16 @@ int xe_device_probe(struct xe_device *xe)
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
@@ -1003,10 +1013,6 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_nvm_init(xe);
 
-	err = xe_soc_remapper_init(xe);
-	if (err)
-		return err;
-
 	err = xe_heci_gsc_init(xe);
 	if (err)
 		return err;
@@ -1045,12 +1051,6 @@ int xe_device_probe(struct xe_device *xe)
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
index a1ae7a3d9696..b99c092a1799 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -450,4 +450,11 @@ void xe_ras_init(struct xe_device *xe)
 
 	get_queued_pages(xe);
 	get_offlined_list(xe);
+
+	/*
+	 * On init, process and log any errors detected by firmware before driver load.
+	 * Critical errors such as Punit, CSC are reported through PCode init failure,
+	 * causing the driver to enter survivability mode.
+	 */
+	xe_ras_process_errors(xe);
 }
-- 
2.47.1

