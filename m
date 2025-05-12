Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6F8C3ABCC
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 16:20:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E795B10E43B;
	Mon, 12 May 2025 16:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZnvu4z4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D6C10E43B
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 16:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747066807; x=1778602807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dTRDHC6Q/mhWQQVCGhQh8J8vqX/i98GxzXCgNL5xtRM=;
 b=QZnvu4z4qxM4SU+bGH0+vmja2k1kIcis3I4nTf5ACCA68XDPsQ4CxA97
 epuJ5wi2ycbhsivc6yriWSZSDKjpAQXOl1an6RpRwQ9Fn7WnkvlY5grlh
 UdQvtRP4NGZbAbKBWHhPvCif5N+oMG6tfAGs1TW13p+gt828pNLfrjYtB
 Ej8WZ78ZKq3CKBR+Dt6gyprsoKJnubpu5PbMTtHnoC2MknJLh8gkA2b0C
 VWQJm9N05M4RkVwVRbOiLOLLUuAm15xSa/XNExiay61s5zmwNogpcSUZC
 5gwNF8cMXbu/byI9wtEqegeoaaUGaWkiJXDNnf5Tu6KyjP2eFOa0iORIN g==;
X-CSE-ConnectionGUID: qYsUT/+NTxO+qtHY0W9jbw==
X-CSE-MsgGUID: A9WMJiARRxOF8yu6HhfIKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66282571"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="66282571"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:20:07 -0700
X-CSE-ConnectionGUID: BU0q0dRaRruI7rtEtMXWog==
X-CSE-MsgGUID: iNtHWYJPSdGWFZPGdPu9mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142187522"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.179])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 09:20:04 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Subject: [PATCH 1/2] drm/xe: Introduce flag to indicate possible fault
 injection
Date: Mon, 12 May 2025 18:19:46 +0200
Message-Id: <20250512161947.128-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250512161947.128-1-michal.wajdeczko@intel.com>
References: <20250512161947.128-1-michal.wajdeczko@intel.com>
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

When running some fault injection tests the driver might generate
a lot of error logs which might unnecessary stress our CI systems.

Introduce a flag exposed in debugfs that can be used by the fault
injection tests to give the driver a hint to suppress non-essential
error logs or dumps that might be otherwise generated.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      |  5 +++++
 drivers/gpu/drm/xe/xe_device.h       | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d0503959a8ed..0567a57597d3 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -235,4 +235,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	xe_pxp_debugfs_register(xe->pxp);
 
 	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
+
+#if IS_ENABLED(CONFIG_FAULT_INJECTION)
+	debugfs_create_bool("fault_injection_in_progress", 0600, root,
+			    &xe->fault_injection_in_progress);
+#endif
 }
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0bc3bc8e6803..ea25d8161050 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -209,4 +209,16 @@ void xe_file_put(struct xe_file *xef);
 #define LNL_FLUSH_WORK(wrk__) \
 	flush_work(wrk__)
 
+#if IS_ENABLED(CONFIG_FAULT_INJECTION)
+static inline bool xe_fault_injection_in_progress(struct xe_device *xe)
+{
+	return xe->fault_injection_in_progress;
+}
+#else
+static inline bool xe_fault_injection_in_progress(struct xe_device *xe)
+{
+	return false;
+}
+#endif
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 06c65dace026..513a811a3121 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -578,6 +578,15 @@ struct xe_device {
 	u8 vm_inject_error_position;
 #endif
 
+#if IS_ENABLED(CONFIG_FAULT_INJECTION)
+	/**
+	 * @fault_injection_in_progress: flag used by the fault injection
+	 * tests to allow the driver to suppress non-essential error dumps
+	 * that might be otherwise generated due to an injected fault.
+	 */
+	bool fault_injection_in_progress;
+#endif
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-- 
2.47.1

