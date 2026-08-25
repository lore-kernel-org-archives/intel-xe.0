Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A58FC61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF3710EB2C;
	Tue, 25 Aug 2026 17:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+xS1xlQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A3F10EB2A
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787679757; x=1819215757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MgOQsxNlSqseap7TcQcoiYYyxF07OJQz56pLR6gpdAg=;
 b=U+xS1xlQusszjG7OERJuT2WxWS9MSkIL4tdEx9CrVb6SOpFaxoMIpWJ2
 gHhSAKPCUsBS4HhWxAdvVNOgZuR6yWJRMujVMSupASFDq3Z7so1nHmAsb
 HA3Z1tbByVVle3DJv1opwdTQLUKvrTQQxeA/fPFKmIFk0KdpB/6m8wzya
 /9S08F8DN2Yr1hVd7Nuzv8xX89bQAd3g54BvjZ2IP0OUmr7e/FhjeEf6Y
 UmtSgdvrij+/3W1XgLNlxbjDxUrnm/Nm1tGKyre05JrxL2/B6yyPT+Rf6
 WVNUCQfLehIQ5AxFI1NZdsXXgcs8EUBOG6f4WeM9JWvzPXijp2oypfByB A==;
X-CSE-ConnectionGUID: 2a4d/Tv5Rjqi5GAGF4lXKg==
X-CSE-MsgGUID: iemueHVlTtyjWh1G/sMLVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88210809"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="88210809"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:42:37 -0700
X-CSE-ConnectionGUID: jCNohSRfSnGsJidRpCgAlg==
X-CSE-MsgGUID: 6OLo9WWATqyPITNqaMppTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="272585075"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:42:34 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com
Subject: [PATCH v2 02/11] drm/xe/xe_ras: Refactor get_counter() to return
 response structure
Date: Tue, 25 Aug 2026 23:29:19 +0530
Message-ID: <20260825175916.1103841-15-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260825175916.1103841-13-badal.nilawar@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
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
v2: Drop temporary response structure (Mallesh)
---
 drivers/gpu/drm/xe/xe_ras.c       | 36 +++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_ras_types.h | 10 +++++++--
 2 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 683087235482..e913235e9cce 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -102,7 +102,8 @@ static const char * const gpu_health_states[] = {
 };
 static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_MAX);
 
-static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter, u32 *value);
+static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
+		       struct xe_ras_get_counter_response *out);
 
 static u8 drm_to_xe_ras_severity(u8 severity)
 {
@@ -283,21 +284,21 @@ static void ras_usp_aer_init(struct xe_device *xe)
 static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component)
 {
 	struct xe_ras_error_class counter = {0};
+	struct xe_ras_get_counter_response response = {0};
 	u8 drm_severity, drm_component;
-	u32 value;
 	int ret;
 
 	counter.common.severity = severity;
 	counter.common.component = component;
 
-	ret = get_counter(xe, &counter, &value);
+	ret = get_counter(xe, &counter, &response);
 	if (ret)
 		return;
 
 	drm_severity = xe_to_drm_ras_severity(severity);
 	drm_component = xe_to_drm_ras_component(component);
 
-	xe_drm_ras_event(xe, drm_component, drm_severity, value);
+	xe_drm_ras_event(xe, drm_component, drm_severity, response.value);
 }
 
 static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
@@ -432,19 +433,20 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 	}
 }
 
-static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter, u32 *value)
+static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
+		       struct xe_ras_get_counter_response *out)
 {
-	struct xe_ras_get_counter_response response = {0};
 	struct xe_ras_get_counter_request request = {0};
 	struct xe_sysctrl_mailbox_command command = {0};
 	struct xe_ras_error_common *common;
 	size_t rlen;
 	int ret;
 
+	memset(out, 0, sizeof(*out));
 	request.counter = *counter;
 
 	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_COUNTER,
-				  &request, sizeof(request), &response, sizeof(response));
+				  &request, sizeof(request), out, sizeof(*out));
 
 	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
 	if (ret) {
@@ -452,19 +454,18 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
 		return ret;
 	}
 
-	if (rlen != sizeof(response)) {
+	if (rlen != sizeof(*out)) {
 		xe_err(xe, "sysctrl: unexpected get counter response length %zu (expected %zu)\n",
-		       rlen, sizeof(response));
+		       rlen, sizeof(*out));
 		return -EIO;
 	}
 
-	if (!ras_counter_is_valid(xe, &response.counter))
+	if (!ras_counter_is_valid(xe, &out->counter))
 		return -EBADMSG;
 
-	common = &response.counter.common;
-	*value = response.value;
+	common = &out->counter.common;
 
-	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", *value, comp_to_str(common->component),
+	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", out->value, comp_to_str(common->component),
 	       sev_to_str(common->severity));
 
 	return 0;
@@ -595,12 +596,19 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value)
 {
 	struct xe_ras_error_class counter = {0};
+	struct xe_ras_get_counter_response response = {0};
+	int ret;
 
 	counter.common.severity = drm_to_xe_ras_severity(severity);
 	counter.common.component = drm_to_xe_ras_component(component);
 
 	guard(xe_pm_runtime)(xe);
-	return get_counter(xe, &counter, value);
+	ret = get_counter(xe, &counter, &response);
+	if (ret)
+		return ret;
+
+	*value = response.value;
+	return 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index d87db9f5174a..3c6d0419c51a 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -224,8 +224,14 @@ struct xe_ras_get_counter_response {
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

