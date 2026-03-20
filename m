Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125941093180
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 07:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1F610E960;
	Fri, 20 Mar 2026 07:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G3cX8c8x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB28810E960
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 07:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773991545; x=1805527545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1bf9vVLboOfwtUBCsZ7ZT6UUjMLGFGht/bS6PlaWbWg=;
 b=G3cX8c8xG00glaTyUM0crnu746WaTerGINVFL61wo3DOvVlyPFVy/w37
 JSG+18KjuMyMm2Tr3x90Inz5csuWpyKHMVmYK82TmWRthxyateQgXzAls
 3F981LeG6PhMZhYA7YRGRl7L0TTNs0+a3nmgB7sadD7jyuCeQsLUrgzxm
 C9ohorg7W1/7JAh8oTXSxzY2d8TY2M6VseVURZxumlbcvhrp4xOiv71f8
 WyQNAZm5pS6vueBpHa8UzdWvpLMRQyJ51+FpG9WLm7ldg1o4Vqng5X25c
 F6mrlF5F8A3Y193iqOimOMaBnKdnHY7Jt56gMEJplLafCKT3fjxVRB/M6 Q==;
X-CSE-ConnectionGUID: Sa7Hp3ZMShy8Jtx0Pzd19Q==
X-CSE-MsgGUID: iH89zikASV+w6jaDsKYzFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="62634649"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="62634649"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 00:25:45 -0700
X-CSE-ConnectionGUID: mfcKSwGbRHKIjN9jEUsxLw==
X-CSE-MsgGUID: tivF1hhLQHyt47eJsrT1OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="227335862"
Received: from anoopcvi-vm.gar.corp.intel.com ([10.109.80.88])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 00:25:41 -0700
From: "Anoop, Vijay" <anoop.c.vijay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: umesh.nerlige.ramappa@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, anshuman.gupta@intel.com, matthew.d.roper@intel.com,
 michael.j.ruhl@intel.com, paul.e.luse@intel.com,
 mohamed.mansoor.v@intel.com, kam.nasim@intel.com, anoop.c.vijay@intel.com
Subject: [RFC v1 2/5] drm/xe/fwctl: Add uAPI definitions for Xe FWCTL support
Date: Fri, 20 Mar 2026 00:25:30 -0700
Message-ID: <20260320072528.1780651-9-anoop.c.vijay@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320072528.1780651-7-anoop.c.vijay@intel.com>
References: <20260320072528.1780651-7-anoop.c.vijay@intel.com>
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

From: Anoop Vijay <anoop.c.vijay@intel.com>

Add Xe-specific uAPI definitions for FWCTL support. Introduce
include/uapi/fwctl/xe.h to describe userspace ABI for Xe firmware
control operations, and extend core FWCTL uAPI to recognize
Xe device type.

This patch adds uAPI definitions only. No functional kernel code
is introduced.

Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
---
 include/uapi/fwctl/fwctl.h |  1 +
 include/uapi/fwctl/xe.h    | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 include/uapi/fwctl/xe.h

diff --git a/include/uapi/fwctl/fwctl.h b/include/uapi/fwctl/fwctl.h
index 716ac0eee42d..c63bc15159d3 100644
--- a/include/uapi/fwctl/fwctl.h
+++ b/include/uapi/fwctl/fwctl.h
@@ -45,6 +45,7 @@ enum fwctl_device_type {
 	FWCTL_DEVICE_TYPE_MLX5 = 1,
 	FWCTL_DEVICE_TYPE_CXL = 2,
 	FWCTL_DEVICE_TYPE_PDS = 4,
+	FWCTL_DEVICE_TYPE_XE = 5,
 };
 
 /**
diff --git a/include/uapi/fwctl/xe.h b/include/uapi/fwctl/xe.h
new file mode 100644
index 000000000000..fb5612dec610
--- /dev/null
+++ b/include/uapi/fwctl/xe.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _UAPI_FWCTL_XE_H_
+#define _UAPI_FWCTL_XE_H_
+
+#include <linux/types.h>
+
+/**
+ * DOC: Xe FWCTL Interface
+ *
+ * The Xe FWCTL interface provides userspace access to firmware subsystems
+ * on Intel Xe discrete GPUs. It exposes firmware management capabilities
+ * through the kernel FWCTL framework.
+ */
+
+/**
+ * struct fwctl_info_xe - FWCTL Information struct for Xe
+ *
+ * @fw_caps: Firmware capability bitmap
+ * @platform: Platform type
+ */
+struct fwctl_info_xe {
+	__u32 fw_caps;
+	__u32 platform;
+};
+
+/**
+ * struct fwctl_rpc_xe - Common Xe FWCTL RPC header
+ * @firmware_type: Firmware type
+ */
+struct fwctl_rpc_xe {
+	__u32 firmware_type;
+};
+
+#endif
-- 
2.43.0

