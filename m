Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC22CD6E5D
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 09:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2420E11A66F;
	Fri,  5 Jun 2026 09:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WFUDsZpA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445E111A66F
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 09:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780652148; x=1812188148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GwyzASXGmLxOfPlodiO1bkNIGM3U2sqiCg85CueTtWc=;
 b=WFUDsZpA28EiL3S6nI+RnrJu2ZGMLTs1/2ZHGM1KhEiLIkhgroBu097H
 0Y8lkk1Oop6FGtVsJ4y2aAgPFwFqe2zk0vGqKAc1HpMM/Y3z1Ou6bGXHi
 uGr9qvnu0ZvGPQLf4XD6AawBfBk5vr4afks8X5k0iP54ahtMQNVj3td0j
 zXTDYk7uD+wZOUNja4CR8bVHWViqzVpaQ6weZc1eYXmqkvM9UEdaeOg6R
 2LnQo2BrA8LcniJkOyqDvGzci15yLv7xHgxZcDqG+jDMvg21L4Tk//kit
 Cb95CIrsaeG+YuZ0KfUfZy7i0xRVrEw0IsBgLjaPEHSk4PeR9ZOu0r6E0 w==;
X-CSE-ConnectionGUID: s+7Y3gaDSHSNTzqUe/kQTA==
X-CSE-MsgGUID: mBlBQw10R7GEE3ZTakMXTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="98903996"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="98903996"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:35:48 -0700
X-CSE-ConnectionGUID: oJdmF+tQTqmpAXc+7PHp3A==
X-CSE-MsgGUID: Kp+x+RebQF+zFIbKzYEW8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="249133691"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:35:45 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Anoop Vijay <anoop.c.vijay@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v7 11/15] drm/xe/xe_ras: Query errors from system controller
 on probe
Date: Fri,  5 Jun 2026 15:04:57 +0530
Message-ID: <20260605093446.4189929-28-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260605093446.4189929-17-riana.tauro@intel.com>
References: <20260605093446.4189929-17-riana.tauro@intel.com>
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
index f22603e9e548..68f6eae60b68 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -344,4 +344,11 @@ void xe_ras_init(struct xe_device *xe)
 
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

