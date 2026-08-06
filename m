Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E04C56205
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 12:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBFA10F1BD;
	Thu,  6 Aug 2026 12:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U/kcIvin";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E896F10F1BD
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 12:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786018024; x=1817554024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yJJLrkJcp9YOktZUKzjDxbySQ83N3uJHQor/BtNEXiQ=;
 b=U/kcIvin/P46kH6wnz0VXX4P3qOejMDOubN6EchI52h1M+ivN4C4JjqF
 zddltnlEY6P7oqYve3228n/ZY/l2++eYA5Q09WMSeRybMoV4XPwyGnO91
 SV6Wsg9kWFoIJtmarRt5wOfEt8wl6nnjz4cd1ncxCA11Oq8tnjPUIouCL
 yV4fDLakE4IomSukiPqjTfgR3yhl2FLZT4myK5pV/lcH/AwVjBjjz6gUo
 QYUgiOr0S4qL4QY5VhY8oRBnrNc5if6FKCJqFjRUhsZzq4+lA4UxykETB
 0IuFTWz3mlzmlZ1DB68L6x/ui6K6xvaeRJdOeOxMR98BtAdbPzJzvju9u A==;
X-CSE-ConnectionGUID: er0KAcIVRl++CLQD5DcqIg==
X-CSE-MsgGUID: 24z7zJTiRiKBgW/yHlnWrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86459580"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="86459580"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 05:07:03 -0700
X-CSE-ConnectionGUID: F5aJ6hwISFu7wMFCVshx9Q==
X-CSE-MsgGUID: 69p7WiG5TkqXALg0B6u/ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="260826795"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 05:07:00 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [PATCH v6 2/2] drm/xe/sysctrl: Add helper to check oCode firmware
 readiness
Date: Thu,  6 Aug 2026 05:06:51 -0700
Message-ID: <20260806120650.2068636-6-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806120650.2068636-4-anoop.c.vijay@intel.com>
References: <20260806120650.2068636-4-anoop.c.vijay@intel.com>
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
---
 drivers/gpu/drm/xe/xe_sysctrl.c               | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  2 ++
 3 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index 35b8b8b85a48..8eac58647265 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -175,6 +175,25 @@ xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id app_id)
 	return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
 }
 
+/**
+ * xe_sysctrl_is_oobmsm_fw_ready() - Check if oCode firmware is fully initialized
+ * @xe: xe device instance
+ *
+ * Returns true if oCode firmware has reached the initialized state, indicating
+ * it is ready to handle requests. Returns true also on platforms without System
+ * Controller support, as there is no firmware gate to wait on.
+ *
+ * Return: true if oCode is initialized or sysctrl is not present, false otherwise
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
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 5e39d2a9c2b0..b507e1553cbb 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -95,9 +95,11 @@ enum xe_sysctrl_fw_status {
 /**
  * enum xe_sysctrl_app_id - Known System Controller application identifiers
  *
+ * @XE_SYSCTRL_APP_OCODE: oCode application (firmware ID 12)
  * @XE_SYSCTRL_APP_DIAG: diag application (firmware ID 13)
  */
 enum xe_sysctrl_app_id {
+	XE_SYSCTRL_APP_OCODE	= 0x0C,
 	XE_SYSCTRL_APP_DIAG	= 0x0D,
 };
 
-- 
2.43.0

