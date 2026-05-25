Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30442CD5BBF
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 09:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B1010E10F;
	Mon, 25 May 2026 09:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W+xko10u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7D010E10F
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 09:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779701627; x=1811237627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LXG8d9V0UuDTv/MayP8qDSEJTqmu/PaXt/+D0N5Q3GM=;
 b=W+xko10uQe/45RqG5ZtMCksckxAKsKejtD6MoJWuab6nrt8zUiodBkm/
 VktNvSvRACHWbkz6cnKEw07FfU+y7UCOM89lom8f7vVWtZuaaRWvC6das
 ucGICipW9eFrehOzN7dWCGLOO7qeu8u86CKO9SN7TwGhzb1LHJxhUUaiS
 0cRiUmSBaH7AV8cIGJXCcTiqNTRJHpP/RXNYhgy+0aDfkmA+0AjiaP05p
 Nz+Iuv/kvk8Q4vQE9uHa3fFCM0aiIKWXO9gDR1oQZruMbZxMV2Q+XXm4x
 jRf6RgGvb7dZEpnXXebt1jX7GaWCvLKkKkIOrxzMe4N6QFTpv0QE3SsN2 w==;
X-CSE-ConnectionGUID: p6PxWa1mT/yRIspdKHZJAQ==
X-CSE-MsgGUID: hvh0sU4eR8m5rFSH8rQSyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="68046852"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="68046852"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 02:33:47 -0700
X-CSE-ConnectionGUID: E+XOo8M0Q3+zDPIYt9xZrw==
X-CSE-MsgGUID: fA/ZlNftQkeXTCzZ7+tucg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="279669724"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 02:33:44 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Anoop Vijay <anoop.c.vijay@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v6 12/15] drm/xe/xe_ras: Query errors from system controller
 on probe
Date: Mon, 25 May 2026 15:36:31 +0530
Message-ID: <20260525100619.3155663-29-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260525100619.3155663-17-riana.tauro@intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
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
index c321a5710f28..5a852e353258 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -964,6 +964,16 @@ int xe_device_probe(struct xe_device *xe)
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
@@ -1004,10 +1014,6 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_nvm_init(xe);
 
-	err = xe_soc_remapper_init(xe);
-	if (err)
-		return err;
-
 	err = xe_heci_gsc_init(xe);
 	if (err)
 		return err;
@@ -1046,12 +1052,6 @@ int xe_device_probe(struct xe_device *xe)
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
index 1710c6080554..2f9d25bda3f9 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -426,4 +426,11 @@ void xe_ras_init(struct xe_device *xe)
 
 	get_queued_pages(xe);
 	get_offlined_list(xe);
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

