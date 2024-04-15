Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F90DC04FF9
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 17:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C2410FCC2;
	Mon, 15 Apr 2024 17:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BFR37GaK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A8A11273D
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 17:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713202787; x=1744738787;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1cmIR6NQYgA2icaQt55q/NWRE5wFboKxIQ19m+zacZ0=;
 b=BFR37GaKFOju4JrVfNI9JUg7rNwV5z/BOF0/cT76hu2C51FH88Hv5vv0
 EEGlD5v09/oEqcF7S4HTOs9DrA1LrJCEg/G1vNe4sx14QmMqaz053zoWj
 FA3+H3SQNQTuyft4jqwkD9H54v4lT+q00fwTTVcVscdapX3oXywUGRwvy
 ZN8XRAwoLS3ww3/V6oAdTZBrRKmwEmO87ox1TpkkdVclMwd6lXyzvKWeg
 7wkX780EZt3tlXIM2mjUfKMYf5TQ38GzR040YjIfrvSPei5E7hP/DMpk4
 oQUhyKXyKInx7sFUFZ4QVjrxdZ2mr/lj0/hOLOTHfm3yKGs7dcO/AQVUw w==;
X-CSE-ConnectionGUID: 8M3zPu0XRnqTPTssP3/Qhg==
X-CSE-MsgGUID: EIUAApvaT7i+WjEE2mnN1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19998701"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="19998701"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 10:39:47 -0700
X-CSE-ConnectionGUID: IVMZWRdIRP2clwym0r8NSg==
X-CSE-MsgGUID: 8zmaIj/3TESrD2HH9yVpdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22082752"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.45.29])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 10:39:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/6] drm/xe: Add helper to format SR-IOV function name
Date: Mon, 15 Apr 2024 19:39:32 +0200
Message-Id: <20240415173937.1287-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240415173937.1287-1-michal.wajdeczko@intel.com>
References: <20240415173937.1287-1-michal.wajdeczko@intel.com>
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

While the GuC firmware and the Xe driver are using VF identifier
VFID(0) to represent the Physical Function, we should avoid using
"VF0" name and use proper "PF" name in all user facing messages
related to the Physical Function and use "VFn" name only when
referrinf to the true Virtual Function. Add simple helper to get
properly formatted function name based on the function number.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov.c | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 1b40f5de9ef5..1c3fa84b6adb 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -122,3 +122,20 @@ void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p)
 	drm_printf(p, "enabled: %s\n", str_yes_no(IS_SRIOV(xe)));
 	drm_printf(p, "mode: %s\n", xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
 }
+
+/**
+ * xe_sriov_function_name() - Get SR-IOV Function name.
+ * @n: the Function number (identifier) to get name of
+ * @buf: the buffer to format to
+ * @size: size of the buffer (shall be at least 5 bytes)
+ *
+ * Return: formatted function name ("PF" or "VF%u").
+ */
+const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
+{
+	if (n)
+		snprintf(buf, size, "VF%u", n);
+	else
+		strscpy(buf, "PF", size);
+	return buf;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
index f9dec84d77e3..486bb21c3256 100644
--- a/drivers/gpu/drm/xe/xe_sriov.h
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -13,6 +13,7 @@
 struct drm_printer;
 
 const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode);
+const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
 
 void xe_sriov_probe_early(struct xe_device *xe);
 void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
-- 
2.43.0

