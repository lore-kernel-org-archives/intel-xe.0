Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEF4C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 16:50:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CE210E47F;
	Mon, 24 Feb 2025 16:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IIzCq1HC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467C410E47F
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 16:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740415830; x=1771951830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+tzhPS7HbM96Xz5fwzMJJuNB5rQ2qrFynbHteGeSjy4=;
 b=IIzCq1HCjAyQhZeaSkpmwIFmBb7/VmwNuIpBYY4pirlj8NNM4ItQadCO
 M/1hEd1i9SuwYKJCFqp8ZP3XBGj366NgvUzfb4WisDh4cPnUV1ejS0ZXY
 Fsja2/WPDme6mOKa1s0t5u+KwarEIoFjWNxn8k9lZU2zShnUxjW8mSCdC
 2TN5pehUxs3yE5Xve0ySqPUtOyK9JxV1Xmuc8RPmIeUUdx8fGQvLAvimk
 Tkat3oWUsNSQuvCpzGeh10ddlSXa+6OUO0bCWWRQHO8RqrFtwsDzPjTdB
 1JKN9e8zqP9xDnckAwCGt8VE5dj+9EYFbWnSo8vXpRWlLOC0exzK9K8er g==;
X-CSE-ConnectionGUID: 0bIVZ1JoScuKJDiW9eBP2Q==
X-CSE-MsgGUID: q4vP5PtrRliQTD5YGaCBNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41063218"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="41063218"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 08:50:30 -0800
X-CSE-ConnectionGUID: GRjqqAFYTGC297OjOVmNgQ==
X-CSE-MsgGUID: flbK8NBpRpyW9P7xs8HBBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="121032432"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 08:50:27 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: rafael@kernel.org, lenb@kernel.org, bhelgaas@google.com,
 ilpo.jarvinen@linux.intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, badal.nilawar@intel.com, kam.nasim@intel.com,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [RFC 5/6] drm/xe/pm: D3Cold target state
Date: Mon, 24 Feb 2025 22:18:48 +0530
Message-Id: <20250224164849.3746751-6-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224164849.3746751-1-anshuman.gupta@intel.com>
References: <20250224164849.3746751-1-anshuman.gupta@intel.com>
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

Trade-off D3Cold target state based upon current vram usages.
if vram usages is greater then vram_d3cold_threshold and GPU
has display connected then target D3Cold state is D3Cold-VRSR
otherwise target state is D3COLD-Off.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/display/xe_display.h |  1 +
 drivers/gpu/drm/xe/xe_pm.c              | 12 ++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 02a413a07382..140a43d6b1b6 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -548,3 +548,25 @@ int xe_display_probe(struct xe_device *xe)
 	unset_display_features(xe);
 	return 0;
 }
+
+bool xe_display_connected(struct xe_device *xe)
+{
+	struct drm_connector *list_connector;
+	struct drm_connector_list_iter iter;
+	bool ret = false;
+
+	mutex_lock(&xe->drm.mode_config.mutex);
+	drm_connector_list_iter_begin(&xe->drm, &iter);
+
+	drm_for_each_connector_iter(list_connector, &iter) {
+		if (list_connector->status == connector_status_connected) {
+			ret = true;
+			break;
+		}
+	}
+
+	drm_connector_list_iter_end(&iter);
+	mutex_unlock(&xe->drm.mode_config.mutex);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 685dc74402fb..c6bc54323084 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -40,6 +40,7 @@ void xe_display_pm_resume(struct xe_device *xe);
 void xe_display_pm_runtime_suspend(struct xe_device *xe);
 void xe_display_pm_runtime_suspend_late(struct xe_device *xe);
 void xe_display_pm_runtime_resume(struct xe_device *xe);
+bool xe_display_connected(struct xe_device *xe);
 
 #else
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 81e67b5693dc..6d28aedcb062 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -198,6 +198,14 @@ static void xe_rpm_lockmap_release(const struct xe_device *xe)
 			 &xe_pm_runtime_d3cold_map);
 }
 
+static void xe_pm_suspend_prepare(struct xe_device *xe)
+{
+	if (pm_suspend_target_state == PM_SUSPEND_TO_IDLE)
+		xe_pm_d3cold_allowed_toggle(xe);
+	else
+		xe->d3cold.allowed = XE_D3COLD_OFF;
+}
+
 /**
  * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
  * @xe: xe device instance
@@ -213,6 +221,8 @@ int xe_pm_suspend(struct xe_device *xe)
 	drm_dbg(&xe->drm, "Suspending device\n");
 	trace_xe_pm_suspend(xe, __builtin_return_address(0));
 
+	xe_pm_suspend_prepare(xe);
+
 	err = xe_pxp_pm_suspend(xe->pxp);
 	if (err)
 		goto err;
@@ -875,6 +885,8 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
 
 	if (total_vram_used_mb < xe->d3cold.vram_threshold)
 		xe->d3cold.allowed = XE_D3COLD_OFF;
+	else if (xe->d3cold.vrsr_capable && xe_display_connected(xe))
+		xe->d3cold.allowed = XE_D3COLD_VRSR;
 	else
 		xe->d3cold.allowed = XE_D3HOT;
 
-- 
2.34.1

