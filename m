Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7499ACD8C8E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 05:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3840110ED03;
	Mon,  8 Jun 2026 05:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqmrmjGn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A97110ED03
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 05:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780896387; x=1812432387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nBQ3f3QDjz37fQzbitoSW3Hn0Ud+hary21dJmziiSzs=;
 b=bqmrmjGn9iYdOS37gGZRYKgxAZIMg09l9mr1BRBurXrQi1LBzV7SDR/g
 FAWeDDkDVKBnCRat7d+pyYyr5MrDIdv6XgZNbc+dFIeaupr3rU02piYbj
 Ic7E9FUYBpEw4yA/WGdw/79jdZVqXoTJp8tQVSVJeR3FOhIXyxxJzp6Kg
 xKWC2VGxlNO3y/GHZT8lEsI6dGcJyqL/aeYETQWZHnmekMPTVg5jyumBW
 yOvFMBmEKXTd4UJfjNPlJtiWrk+S8+P0vo+Y5nusA0RxF+/oGy1u3vpqY
 k0iOtTAlipuEhGW/PUkLHkQMz+MlvpZ66KH+8VjcKDlgtffewDqZHi9td Q==;
X-CSE-ConnectionGUID: DLxAF3cMRIGwZj/fqF5lOw==
X-CSE-MsgGUID: VkYaUNr3Sq+BugHkvD8/EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="84198433"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="84198433"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 22:26:27 -0700
X-CSE-ConnectionGUID: wdl42MliQTWAUUmf9JcI1Q==
X-CSE-MsgGUID: 31+tlPKCS1OxpT6WwIrXbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="245551447"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 22:26:24 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 andi.shyti@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v3 2/3] drm/xe/xe_ras: Add types and commands for RAS GPU
 health indicator
Date: Mon,  8 Jun 2026 10:55:59 +0530
Message-ID: <20260608052556.1744123-7-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608052556.1744123-5-soham.purkait@intel.com>
References: <20260608052556.1744123-5-soham.purkait@intel.com>
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

Add RAS GPU health status values and mailbox payload types for
querying and updating GPU health. GPU health states are encoded as
numeric values defined by enum xe_ras_health_status, and the GET_HEALTH
and SET_HEALTH commands fetch and update the current state through the
System Controller mailbox. struct xe_ras_get_health_request/response and
struct xe_ras_set_health_request/response describe the corresponding
request and response payloads, with the SET response also carrying the
operation status and resulting health state.

v1:
 - Add enum for health status instead of xe_ras_health_status_t.
                                                         (Andi), (Rodrigo)
v2:
 - Make logs and structures consistent with their counterparts.
                                                         (Riana)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 drivers/gpu/drm/xe/xe_ras_types.h             | 57 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 ++
 2 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 6688e11f57a8..438746b5ffd9 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -10,6 +10,21 @@
 
 #define XE_RAS_NUM_COUNTERS			16
 
+/**
+ * enum xe_ras_health_status - Device health status values
+ *
+ * @XE_RAS_HEALTH_STATUS_OK: Device is healthy and operating normally.
+ * @XE_RAS_HEALTH_STATUS_WARNING: Device has minor issues but is still operational.
+ * @XE_RAS_HEALTH_STATUS_CRITICAL: Device is in a critical state and may not be operational.
+ * @XE_RAS_HEALTH_STATUS_MAX: Sentinel value for validation
+ */
+enum xe_ras_health_status {
+	XE_RAS_HEALTH_STATUS_OK = 0,
+	XE_RAS_HEALTH_STATUS_WARNING,
+	XE_RAS_HEALTH_STATUS_CRITICAL,
+	XE_RAS_HEALTH_STATUS_MAX
+};
+
 /**
  * struct xe_ras_error_common - Error fields that are common across all products
  */
@@ -121,4 +136,46 @@ struct xe_ras_clear_counter_response {
 	/** @reserved1: Reserved for future use */
 	u32 reserved1[3];
 } __packed;
+
+/**
+ * struct xe_ras_get_health_request - Request structure for get health
+ */
+struct xe_ras_get_health_request {
+	/** @reserved: Reserved for future use */
+	u32 reserved[2];
+} __packed;
+
+/**
+ * struct xe_ras_get_health_response - Response structure for get health
+ */
+struct xe_ras_get_health_response {
+	/** @current_health: Current GPU health, see &enum xe_ras_health_status */
+	u8 current_health;
+	/** @reserved: Reserved for future use */
+	u8 reserved[3];
+} __packed;
+
+/**
+ * struct xe_ras_set_health_request - Request structure for set health
+ */
+struct xe_ras_set_health_request {
+	/** @new_health: New GPU health to set, see &enum xe_ras_health_status */
+	u8 new_health;
+	/** @reserved: Reserved for future use */
+	u8 reserved[3];
+} __packed;
+
+/**
+ * struct xe_ras_set_health_response - Response structure for set health
+ */
+struct xe_ras_set_health_response {
+	/** @status: Status of set health operation, see &enum xe_ras_response_status */
+	u32 status;
+	/** @current_health: Resulting current GPU health, see &enum xe_ras_health_status */
+	u8 current_health;
+	/** @reserved: Reserved for future use */
+	u8 reserved[3];
+	/** @reserved1: Reserved for future use */
+	u32 reserved1[2];
+} __packed;
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 6e3753554510..d4da6e9ef774 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -25,11 +25,15 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
  * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
+ * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve current health status
+ * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
  */
 enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
 	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
+	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
+	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
 };
 
 /**
-- 
2.43.0

