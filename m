Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5629CF395D
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 17:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AE510E6E9;
	Thu, 19 Sep 2024 17:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IAZAFloE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B8110E732
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 17:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726766145; x=1758302145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zH9YU0ezUUaECDU0YZL4TME1sh3Ak/MQSr2G2PKJoKE=;
 b=IAZAFloEAKurg4U5bWu7zTTZQpDlIw8vMXc1caSyirUnsK8SOrcCWLfN
 zCY+0c7H46aG8X7sAedL4JCFk+CLRU7DdDQOSaLf4ypFiLZPwNh0y7IzC
 jW1Wtd4vdEkRcV4JOcpYzRXq13Yu8oAogbG0De+N27UyJUY0NHVHMDpZl
 nq6Icdyj6NnMm8Vt/ECbFI5L1yZ6SeD6BaKH1C9+Utu/JxiGKHAncpWDi
 yJRdkM1E2mgDp+iIvby0XU/gctszhOK+9QyibV9LUuBXW1ZzDiGzYh2T0
 M144AVp8QT/psb5/pWY00H2LZ0Fgn7sWkFz18/bkjFWqFx0T/CIZfhmJt w==;
X-CSE-ConnectionGUID: veMfhr+ySiCpupsyEHDYvA==
X-CSE-MsgGUID: tNcLKta2Q6KduKiF7VSacg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29534495"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="29534495"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 10:15:45 -0700
X-CSE-ConnectionGUID: zoOHMW5NR8CWS7MszrYkeg==
X-CSE-MsgGUID: 5z3C7NhPRE+vNREhWTWk9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="107481121"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.120.199])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 10:15:45 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/5] drm/xe/guc: Add yet another helper macro for threshold
Date: Thu, 19 Sep 2024 19:15:24 +0200
Message-Id: <20240919171528.1451-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240919171528.1451-1-michal.wajdeczko@intel.com>
References: <20240919171528.1451-1-michal.wajdeczko@intel.com>
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

We already have and use MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY, but
in upcoming patch we want to generate the key for the length.
Add MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN for this purpose.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
index da0fedbbdbaf..da10cf0389cb 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
+++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set.h
@@ -17,6 +17,13 @@
 #define MAKE_GUC_KLV_VF_CFG_THRESHOLD_KEY(TAG) \
 	MAKE_GUC_KLV_KEY(CONCATENATE(VF_CFG_THRESHOLD_, TAG))
 
+/**
+ * MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN - Prepare the name of the KLV length constant.
+ * @TAG: unique tag of the GuC threshold KLV key.
+ */
+#define MAKE_GUC_KLV_VF_CFG_THRESHOLD_LEN(TAG) \
+	MAKE_GUC_KLV_LEN(CONCATENATE(VF_CFG_THRESHOLD_, TAG))
+
 /**
  * xe_guc_klv_threshold_key_to_index - Find index of the tracked GuC threshold.
  * @key: GuC threshold KLV key.
-- 
2.43.0

