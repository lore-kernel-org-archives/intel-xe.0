Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2666BC43327
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 11:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FC810F2D3;
	Thu,  2 Jul 2026 11:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T/GnXaOY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273E110F2D3
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 11:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782990177; x=1814526177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gfC0Vmx9pQ0G5eQkgCdHwjEm8bsBlaoMM+KnQsUjXSU=;
 b=T/GnXaOYTi/4KVvIyq3ubpSKVa2aGL/AifAu9Xb1EllNo6y65V+W1BCf
 9xkAdkVZfuiiq1f//JZmOg0f0h5t0mft7gAi9KNbKUjKDVZYkCcdfVrXV
 nstMZiQpVOcSrXIXiBYXNy+RIH27cmiDHb14CDUbdS1AYalcjK6xbANQL
 A+gRT6u0x1gpEu8tAJq0u1mSZd9xn6wZjgVu4exbYM3NWpVB51Jq3ddWs
 TeMXFkaAzuIirU3VAo4WmIk/ib7eaYB6nxntUDioDg0LBDLA9bmTaSGm2
 Ya+V4tcJrFVeqdHqEGKtQj9JcPqJsRexuThiDLEFiWTkYd8MfUJBiudOa g==;
X-CSE-ConnectionGUID: xWspcOAdT+ONcaf/PO6VSg==
X-CSE-MsgGUID: 3sTtHuvWTOueA6x/tSY3Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82852889"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="82852889"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 04:02:57 -0700
X-CSE-ConnectionGUID: gRWTirvjTveaJ9lapJRYZQ==
X-CSE-MsgGUID: infc/ERCQXe7iHAxAAw9hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="256738746"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 04:02:54 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com
Subject: [RFC PATCH 3/7] drm/xe/xe_ras: Refactor get_counter() to return
 response structure
Date: Thu,  2 Jul 2026 16:44:05 +0530
Message-ID: <20260702111401.3680214-12-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702111401.3680214-9-badal.nilawar@intel.com>
References: <20260702111401.3680214-9-badal.nilawar@intel.com>
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

Return the complete response structure from get_counter() instead of
only the counter value. This allows callers to access additional
response fields, such as has_info_queue for CPER record building.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/xe_ras.c       | 23 +++++++++++++++--------
 drivers/gpu/drm/xe/xe_ras_types.h | 10 ++++++++--
 2 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 85b0202467f6..e594d4d3a23f 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -157,12 +157,12 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 	}
 }
 
-static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter, u32 *value)
+static int get_counter(struct xe_device *xe, const struct xe_ras_error_class *counter,
+		       struct xe_ras_get_counter_response *out)
 {
 	struct xe_ras_get_counter_response response = {0};
 	struct xe_ras_get_counter_request request = {0};
 	struct xe_sysctrl_mailbox_command command = {0};
-	struct xe_ras_error_common *common;
 	size_t rlen;
 	int ret;
 
@@ -183,12 +183,11 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
 		return -EIO;
 	}
 
-	common = &response.counter.common;
-	*value = response.value;
-
-	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", *value, comp_to_str(common->component),
-	       sev_to_str(common->severity));
+	xe_dbg(xe, "[RAS]: get counter value %u for %s %s\n", response.value,
+	       comp_to_str(response.counter.common.component),
+	       sev_to_str(response.counter.common.severity));
 
+	*out = response;
 	return 0;
 }
 
@@ -207,12 +206,20 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
 int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value)
 {
 	struct xe_ras_error_class counter = {0};
+	struct xe_ras_get_counter_response response;
+	int ret;
 
 	counter.common.severity = drm_to_xe_ras_severity(severity);
 	counter.common.component = drm_to_xe_ras_component(component);
 
 	guard(xe_pm_runtime)(xe);
-	return get_counter(xe, &counter, value);
+
+	ret = get_counter(xe, &counter, &response);
+	if (ret)
+		return ret;
+
+	*value = response.counter_value;
+	return 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index fc496888b3f8..befdaf297103 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -155,8 +155,14 @@ struct xe_ras_get_counter_response {
 	u64 timestamp;
 	/** @threshold: Threshold value for the counter */
 	u32 threshold;
-	/** @reserved: Reserved  */
-	u32 reserved[57];
+	/** @reserved: Reserved for future use */
+	u32 reserved:9;
+	/** @has_info_queue: Set if info queue is available */
+	u32 has_info_queue:1;
+	/** @reserved1: Reserved for future use */
+	u32 reserved1:22;
+	/** @info_queue: Initial info queue data (first chunk) if available */
+	struct xe_ras_info_queue_response info_queue;
 } __packed;
 
 /**
-- 
2.54.0

