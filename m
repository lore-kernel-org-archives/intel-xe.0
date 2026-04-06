Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C844BF46C45
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 14:22:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C4310E139;
	Mon,  6 Apr 2026 14:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Na/wMnWS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0490E10E139
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 14:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775485341; x=1807021341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CkcmMhheGEsePet8cyqscxnaNRBa3uV2Qq5d+CE2/lM=;
 b=Na/wMnWSj/67lIc54RbtVSRwMe4h62n5/TRVsVn9uzNOV6BhyUE4DynS
 l1HUGdC3YN0TB+cRJu/D3miPyD9908NuA6IRbRhuWm9kxfyTSuoIQyLpE
 2K2HVFUMFnNwtYOCFeaioQIEFm83B8x2i7wxgmsNDPC91ziuDh2ayLBPG
 bTJnQc3hQhua11i+0S21pOFwAB90jdiv3upFxPkaawIweIDQQgOB8E/uO
 55uqHRPJPy2W+KvnHWXnwoIwpOd1YJLQQTuY3QZzObcFA6iDpsbMPsp0b
 IeCgjiwNSWCH3mn0KdXQHRWONjNBmqC4ce1WYwa2CrHAmE5c0+sk4vkgq A==;
X-CSE-ConnectionGUID: Rh3Jyp1UR3KzFRBaoG0huw==
X-CSE-MsgGUID: TnQj/fISQjmDftbZmkMclQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="75473076"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="75473076"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 07:22:20 -0700
X-CSE-ConnectionGUID: Nfrp911GSA6Cjlcgw/RRBw==
X-CSE-MsgGUID: sko2kFyASymDWi425NLnfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="232746923"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 07:22:18 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v2 4/5] drm/xe/xe_ras: Add helper to clear error counter
Date: Mon,  6 Apr 2026 20:24:43 +0530
Message-ID: <20260406145440.2016065-11-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260406145440.2016065-7-riana.tauro@intel.com>
References: <20260406145440.2016065-7-riana.tauro@intel.com>
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

Add helper function to clear error counter value.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
Note: This will be integrated with drm_ras implementation
once clear-error-counter patch is merged.
https://patchwork.freedesktop.org/series/163019/
---
 drivers/gpu/drm/xe/xe_ras.c | 48 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h |  2 ++
 2 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index b5fdad2c801d..56abcb9783a4 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -121,3 +121,51 @@ int xe_ras_get_error_counter(struct xe_device *xe, const enum drm_xe_ras_error_s
 	guard(xe_pm_runtime)(xe);
 	return get_error_counter(xe, &error_class, value);
 }
+
+/**
+ * xe_ras_clear_error_counter() - Clear error counter value
+ * @xe: xe device instance
+ * @severity: Error severity level to be cleared
+ * @error_id: Error component to be cleared
+ *
+ * This function clears the value of a specific RAS error counter based on
+ * the provided severity and component.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_ras_clear_error_counter(struct xe_device *xe, const enum drm_xe_ras_error_severity severity,
+			       u32 error_id)
+{
+	struct xe_ras_clear_counter_response response = {0};
+	struct xe_ras_clear_counter_request request = {0};
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_error_class *error_class = &request.error_class;
+	size_t rlen;
+	int ret;
+
+	error_class->common.severity = drm_to_xe_ras_severity[severity];
+	error_class->common.component = drm_to_xe_ras_component[error_id];
+
+	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_CLEAR_COUNTER, &request, sizeof(request),
+				&response, sizeof(response));
+
+	guard(xe_pm_runtime)(xe);
+	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
+	if (ret) {
+		xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
+		return ret;
+	}
+
+	if (rlen != sizeof(response)) {
+		xe_err(xe, "[RAS]: Sysctrl response size mismatch. Expected %zu, got %zu\n",
+		       sizeof(response), rlen);
+		return -EINVAL;
+	}
+
+	if (response.status) {
+		xe_err(xe, "[RAS]: Sysctrl Failed to clear counter %u\n", response.status);
+		return -EIO;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index e468c414148e..19e0e649d55f 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -12,5 +12,7 @@ struct xe_device;
 
 int xe_ras_get_error_counter(struct xe_device *xe, const enum drm_xe_ras_error_severity severity,
 			     u32 error_id, u32 *value);
+int xe_ras_clear_error_counter(struct xe_device *xe, const enum drm_xe_ras_error_severity severity,
+			       u32 error_id);
 
 #endif
-- 
2.47.1

