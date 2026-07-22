Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04100C44539
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 14:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EC610E46D;
	Wed, 22 Jul 2026 14:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jewPIoKM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAE910EE15
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 14:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784730950; x=1816266950;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YG9W+CgM+tD9OI5k79mMgYt5XTh2vMjz3tt2GzaO8Ho=;
 b=jewPIoKMUEklt+KOgB3vV3djxjad6l3I2jLC8sTu7LnRuzIxZsIzTmFl
 1hZEU9MGF6GUroh7+gQvFVF9QviZ6wiFznyeJKeGxe2+vpGky/y5iAouD
 lLCZ9nJuL5krVFl+oY67g9jvnNEjfeXc/ON3OnVeYgp0Ui4vznR/7TXYG
 NK5E6M7tEfaUOu0OA3pO5ClBIdD8QV9ec63+KD/nre19NZ8RP3y012ZEj
 b40L95pqicWfUlNyuNO8W2gJI7PEZJras9z0dFipZVUnpBXK/LDnId7+1
 90e3dQH2roHQO3nIt6S62VoEJ2X2KfyEihQVZpXOE0ODVIAgnLBbCE04A Q==;
X-CSE-ConnectionGUID: jAFRrC4ZQbWyRhVn/u31GQ==
X-CSE-MsgGUID: Z5RDpzAERCew5+KCZ8/McA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="72910143"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="72910143"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 07:35:50 -0700
X-CSE-ConnectionGUID: 4BdeWGxhRzGtiT84N7l8+g==
X-CSE-MsgGUID: 5MkkJSnSTR+Xm9IUtH2kFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="258175684"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 22 Jul 2026 07:35:49 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe/ras: Validate sysctrl response
Date: Wed, 22 Jul 2026 20:01:42 +0530
Message-ID: <20260722143142.675658-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

Validate errors raised by sysctrl firmware instead of blindly trusting
them.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Continue invalid uncorrectable error case (Riana)
    s/error/counter (Riana)
---
 drivers/gpu/drm/xe/xe_ras.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 5e294e9f8f99..28123f08e513 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -156,6 +156,24 @@ static inline const char *comp_to_str(u8 component)
 	return xe_ras_components[component];
 }
 
+static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class *counter)
+{
+	u8 severity = counter->common.severity;
+	u8 component = counter->common.component;
+
+	if (!in_range(severity, XE_RAS_SEV_NOT_SUPPORTED + 1, XE_RAS_SEV_MAX - 1)) {
+		xe_err(xe, "sysctrl: unexpected severity %u\n", severity);
+		return false;
+	}
+
+	if (!in_range(component, XE_RAS_COMP_NOT_SUPPORTED + 1, XE_RAS_COMP_MAX - 1)) {
+		xe_err(xe, "sysctrl: unexpected component %u\n", component);
+		return false;
+	}
+
+	return true;
+}
+
 static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
 {
 	struct pci_dev *vsp;
@@ -327,6 +345,9 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 		severity = errors[id].common.severity;
 		component = errors[id].common.component;
 
+		if (!ras_counter_is_valid(xe, &errors[id]))
+			continue;
+
 		xe_warn(xe, "[RAS]: %s %s detected\n",
 			comp_to_str(component), sev_to_str(severity));
 	}
@@ -358,6 +379,9 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
 		return -EIO;
 	}
 
+	if (!ras_counter_is_valid(xe, &response.counter))
+		return -EBADMSG;
+
 	common = &response.counter.common;
 	*value = response.value;
 
@@ -422,6 +446,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 			component = arr->counter.common.component;
 			severity = arr->counter.common.severity;
 
+			if (!ras_counter_is_valid(xe, &arr->counter))
+				continue;
+
 			xe_info(xe, "[RAS]: %s %s detected\n", comp_to_str(component),
 				sev_to_str(severity));
 
@@ -532,6 +559,9 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
 
 	counter = &response.counter;
 
+	if (!ras_counter_is_valid(xe, counter))
+		return -EBADMSG;
+
 	xe_dbg(xe, "[RAS]: clear counter for %s %s\n", comp_to_str(counter->common.component),
 	       sev_to_str(counter->common.severity));
 
-- 
2.43.0

