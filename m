Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BA1C624D3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 13:49:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F43810F9A9;
	Fri,  4 Sep 2026 13:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZZ6Q/xuX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7609310F9C0
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 13:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788529791; x=1820065791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ND4vPnHAnd2yu+Y9RhF8hdDvN4c8ArlsDRI4JAD6O2c=;
 b=ZZ6Q/xuX0GoUdF0xQ72xYUhrF9wxpFEYrVBjYh7rrxPwhgwiPmfpXdgL
 8EniKIb1t/Tcig2SzpVgJj7Tu8LrHkAGNDO2zxTNpP3Ihwwcx6umEGqBe
 n+7iOLMn1/8ChddvtcU5lC1TFcDB5uT3f8KGaYQaIMtV7BgGCEFur7Q0G
 yDyqL3cmAPJ4lELZzHt/4IJx31pN1LSqmH7gs9LLt0uoa/x2KRdK7SVz+
 Wq6IEdKy+gJMDIC5B6g7NKyWAehhq9mNyp9AwuZRtMEvvgY8rJQAjZ8YO
 UAZt//sBK+qMRYh5DAh3ML7nXT9xk3wnVWXb63x/zCQ2GOpWN/I08kRBo A==;
X-CSE-ConnectionGUID: FUtdtjrvRQqu0SgYvOHwjg==
X-CSE-MsgGUID: pXjgZ+7lQTmqkDKZFPIyUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100550409"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="100550409"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 06:49:51 -0700
X-CSE-ConnectionGUID: B1Al4aQmQ6SxGBjDLZE1TQ==
X-CSE-MsgGUID: Avf1St1KTQG5Bvb5HeYzGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="273565932"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 06:49:48 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v8 2/2] drm/xe/sysctrl: Add helper to check oCode firmware
 readiness
Date: Fri,  4 Sep 2026 06:49:37 -0700
Message-ID: <20260904134935.674507-6-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904134935.674507-4-anoop.c.vijay@intel.com>
References: <20260904134935.674507-4-anoop.c.vijay@intel.com>
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

v8: (Umesh, Rodrigo, Mike)
- Simplify oCode readiness helpers to a single
  XE_SYSCTRL_FIRMWARE_APP_INITIALIZED check
---
 drivers/gpu/drm/xe/xe_sysctrl.c | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index 3b7fa2c9c333..4067e1dfdcd5 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -42,6 +42,7 @@
  * application ID.
  */
 enum xe_sysctrl_app_id {
+	XE_SYSCTRL_APP_OCODE	= 0x0C,
 	XE_SYSCTRL_APP_DIAG	= 0x0D,
 };
 
@@ -181,6 +182,24 @@ xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id app_id)
 	return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
 }
 
+/**
+ * xe_sysctrl_is_oobmsm_fw_ready() - Check if oCode firmware is fully initialized
+ * @xe: xe device instance
+ *
+ * Returns true if oCode firmware has reached the initialized state, indicating
+ * it is ready to handle requests.
+ *
+ * Callers must only invoke this on platforms where System Controller is
+ * present (xe->info.has_sysctrl).
+ *
+ * Return: true if oCode firmware is initialized, false otherwise
+ */
+bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe)
+{
+	return xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_OCODE) ==
+	       XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
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

