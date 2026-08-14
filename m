Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F61C5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 09:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411E210E145;
	Fri, 14 Aug 2026 09:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kei0g5z1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3E710E145
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 09:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786701199; x=1818237199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wN0EdI2pPSojnksX7vqyVh7kkeN6+m44A4enlsLVQ1U=;
 b=kei0g5z14qoxOtF3pNy9eTT4n46udZ6H+ajiROWtkqThnwnm0+yXGbV4
 lysU/ibE/ipu0lvWNbLFHCCImdhbj/U3+vCOvR5wQUgq3mcgLWspdm/U6
 Zwxcje974uO2k7tcQd2yQFpPG5VXpk98JHsWbbs08l3PFZU+OpT6BrXoU
 5TBHkV47vw1H5hAYymJDv2zA6KNrEs5tHKvctIYKZiizayNotO3X5jWWt
 yW65tEqBib5fvT/OrrnQXZONgj5POTm8DeEAZLwCpEsKJQhTqIpBgBxqW
 OOmR2ysCH/DpeCApZhVHunAORmUdLRGUkQckrru/UBdkJLcDk8y6KaFED g==;
X-CSE-ConnectionGUID: UWSVzEMXTj6knVYRMQSzNQ==
X-CSE-MsgGUID: hWdJIjjhTx2xufoVhSAKDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="74815255"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="74815255"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 02:53:19 -0700
X-CSE-ConnectionGUID: c0nRHtJtQhOdoMqjqa7lWg==
X-CSE-MsgGUID: xvM86A57RoGywVejUSx7xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="268037168"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 02:53:15 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v7 2/2] drm/xe/sysctrl: Add helper to check oCode firmware
 readiness
Date: Fri, 14 Aug 2026 02:53:07 -0700
Message-ID: <20260814095306.2482289-6-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814095306.2482289-4-anoop.c.vijay@intel.com>
References: <20260814095306.2482289-4-anoop.c.vijay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

Add xe_sysctrl_is_oobmsm_fw_ready(), a convenience wrapper around
xe_sysctrl_check_app_status() to check oCode application readiness.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
v6:
- New patch — split oCode application readiness helper out of the
  original patch into its own commit

v7: (Umesh)
- Clarify xe_sysctrl_is_oobmsm_fw_ready() comment for sysctrl-less platforms
- Add XE_SYSCTRL_APP_OCODE to enum xe_sysctrl_app_id in xe_sysctrl.c
---
 drivers/gpu/drm/xe/xe_sysctrl.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index c53a26af3189..488e30b3d075 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -42,6 +42,7 @@
  * application ID.
  */
 enum xe_sysctrl_app_id {
+	XE_SYSCTRL_APP_OCODE	= 0x0C,
 	XE_SYSCTRL_APP_DIAG	= 0x0D,
 };
 
@@ -189,6 +190,28 @@ xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id app_id)
 	return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
 }
 
+/**
+ * xe_sysctrl_is_oobmsm_fw_ready() - Check if oCode firmware is fully initialized
+ * @xe: xe device instance
+ *
+ * Returns true if oCode firmware has reached the initialized state, indicating
+ * it is ready to handle requests. On platforms without System Controller
+ * support there is no System Controller mailbox to gate on, so oCode firmware
+ * readiness is not tracked through this path; the function unconditionally
+ * returns true so callers are not blocked by this check on such platforms.
+ *
+ * Return: true if oCode firmware is initialized, or if System Controller is
+ * not present on this platform; false otherwise
+ */
+bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe)
+{
+	enum xe_sysctrl_fw_status status =
+		xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_OCODE);
+
+	return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
+	       status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
+}
+
 /**
  * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is fully initialized
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
index 8dc576796890..b69a3f474236 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -20,6 +20,7 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
 int xe_sysctrl_init(struct xe_device *xe);
 void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
 void xe_sysctrl_pm_resume(struct xe_device *xe);
+bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe);
 bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
 
 #endif
-- 
2.43.0

