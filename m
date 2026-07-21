Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB70AC4451C
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 08:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A257710E718;
	Tue, 21 Jul 2026 08:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FcaG9m3f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6AE10E718
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 08:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784622833; x=1816158833;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RKmIG9/pBOf1LbD9iIfsfEsg2NRL+VDFPudL9Co4NkY=;
 b=FcaG9m3fY85mHFOVEuDtTIZhZsBV6NPUP31eGfTUnLEUvQaIuQpeWti6
 rUBDunL1GFXxWz65ZIKPtOPhd9vEfl4CkylbsXwlj0laEjMgAJXV0FVKd
 ZAdYREOVRPsatxVimQjvvNCdeY41XHDO7EAA+D9DcqPgl3YXcjXdfu02E
 F4ZP+YORMKBnMZjgUOby/1hhvPQwQ07nniPU2/Gk+3nTPIUL3P3RreI/r
 4jntfTk40g41rN6K/zUY5q6nB9nBEDb19EZhhSWICGE3A0JDME1aHT5wD
 TSPnoqiacioAWdGgIev6/7lliEBPr+H0c5VYwlKeOzL+Wvu43D5DEBgbB Q==;
X-CSE-ConnectionGUID: tfAeXE4pSjO29aC6vKWU7g==
X-CSE-MsgGUID: JjRCHWWmQaKp2O4smolJag==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="95865866"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="95865866"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 01:33:52 -0700
X-CSE-ConnectionGUID: Qw4G3cHcSxun9kso5dEgWw==
X-CSE-MsgGUID: uYU00ul9TgWJcXsQYic0QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="257763349"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 21 Jul 2026 01:33:50 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/ras: Validate sysctrl response
Date: Tue, 21 Jul 2026 13:59:53 +0530
Message-ID: <20260721082953.640497-1-raag.jadav@intel.com>
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
 drivers/gpu/drm/xe/xe_ras.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 5e294e9f8f99..e0bcd39e3b3a 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -156,6 +156,24 @@ static inline const char *comp_to_str(u8 component)
 	return xe_ras_components[component];
 }
 
+static bool ras_error_is_valid(struct xe_device *xe, struct xe_ras_error_class *error)
+{
+	u8 severity = error->common.severity;
+	u8 component = error->common.component;
+
+	if (severity == XE_RAS_SEV_NOT_SUPPORTED || severity >= XE_RAS_SEV_MAX) {
+		xe_err(xe, "sysctrl: unexpected severity %u\n", severity);
+		return false;
+	}
+
+	if (component == XE_RAS_COMP_NOT_SUPPORTED || component >= XE_RAS_COMP_MAX) {
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
 
+		if (!ras_error_is_valid(xe, &errors[id]))
+			continue;
+
 		xe_warn(xe, "[RAS]: %s %s detected\n",
 			comp_to_str(component), sev_to_str(severity));
 	}
@@ -358,6 +379,9 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
 		return -EIO;
 	}
 
+	if (!ras_error_is_valid(xe, &response.counter))
+		return -EBADMSG;
+
 	common = &response.counter.common;
 	*value = response.value;
 
@@ -422,6 +446,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 			component = arr->counter.common.component;
 			severity = arr->counter.common.severity;
 
+			if (!ras_error_is_valid(xe, &arr->counter))
+				break;
+
 			xe_info(xe, "[RAS]: %s %s detected\n", comp_to_str(component),
 				sev_to_str(severity));
 
@@ -532,6 +559,9 @@ int xe_ras_clear_counter(struct xe_device *xe, u8 severity, u8 component)
 
 	counter = &response.counter;
 
+	if (!ras_error_is_valid(xe, counter))
+		return -EBADMSG;
+
 	xe_dbg(xe, "[RAS]: clear counter for %s %s\n", comp_to_str(counter->common.component),
 	       sev_to_str(counter->common.severity));
 
-- 
2.43.0

