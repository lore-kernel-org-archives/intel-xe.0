Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC595C4345F
	for <intel-xe@archiver.kernel.org>; Sun, 14 Apr 2024 19:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF63112323;
	Sun, 14 Apr 2024 19:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fKQ+UeWt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BB8112323
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Apr 2024 19:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713121322; x=1744657322;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Kjgs7ZqvovhCh7whkADr/50fQw39Ka5G3mBsqYwxU2w=;
 b=fKQ+UeWtUK9DDAH4FEac2xIpN0/Q1ZRNOFqEuR0N+C/7mWcs+FaE7RzS
 OQeaImhWbQRrgHR4pJ0rnYN946rF2YKElTdS5W9ekVABSCIdDI7U+Ja7e
 SsS+ARClk9+jUq4D8M7Q4T3v5RIAA9PbHQpuLN982rkx5l6dCfxAB0+/Q
 jR7FCinDW2ZGvkGPXiDH4dyBGK7Ynf0AXE7CiIzUZsbtZRBFDbkEc6NB1
 PXqF25kSUVgu+6U7jKYxQeQJBw7LAUmHwmZLUW/DYptPU4xusrt6lA0F8
 pNIZ7yUhEznRkzunJ1mFWIecN6Wbz/6Tzz+n04/SKs2CW+zE3IPg8HakW g==;
X-CSE-ConnectionGUID: FUHHJdOYSXeBKTNzdl9PRw==
X-CSE-MsgGUID: 9izqoOYGSRWuqsiovPLfkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="30983592"
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; d="scan'208";a="30983592"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 12:02:01 -0700
X-CSE-ConnectionGUID: m5uE1vBaRCCJ4ANbg47pdg==
X-CSE-MsgGUID: ID/moDL1Sd2xcxPtIe77XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; d="scan'208";a="26383426"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.61.42])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 12:02:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/6] drm/xe: Add helper to format SR-IOV function name
Date: Sun, 14 Apr 2024 21:01:32 +0200
Message-Id: <20240414190137.1243-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240414190137.1243-1-michal.wajdeczko@intel.com>
References: <20240414190137.1243-1-michal.wajdeczko@intel.com>
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

While the GuC firmware and the Xe driver are using VF identifier
VFID(0) to represent the Physical Function, we should avoid using
"VF0" name and use proper "PF" name in all user facing messages
related to the Physical Function and use "VFn" name only when
referrinf to the true Virtual Function. Add simple helper to get
properly formatted function name based on the function number.

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

