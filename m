Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496AACCF9F0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 17:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0957D10E647;
	Tue, 28 Oct 2025 17:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WQCO/UqZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5060F10E645
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 17:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761674345; x=1793210345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=soTZAxyCXd+wOxCQwrh6BWQcDg/Yfulssn0dyneV2fA=;
 b=WQCO/UqZbX0N6jTHeKh7mVwEVYVGDpeBQ1gasOFfNR49DTKHFy3WUoLn
 A52siTIVpa/P/bHCNAtu3kzZSvgVPUXI2t6vsxWqfFvN8GG0EoEHD0kib
 cbn9pnZGbqeVmaBkCSvebqJiI6aYMPFVdYlRyrSRdN4ny7BEl82EZqdwP
 AxU23COolzutrPXnml0XCngONvufMXKSf5fYEUqnh9f61uQSbptVgwXfp
 VPnQkpEqJ5RUHpT2o3yZidARqdIXE22yb86tw0YXBZ7cBM3A6TdzR3Msr
 yPxGbUx3eWbrPFuwGdEI0oFK5k8H8bt/9m7Pg2beHnObHZ36MlEg3BUL0 A==;
X-CSE-ConnectionGUID: G6TY4ahdRkqkOi94volubw==
X-CSE-MsgGUID: xnQ3pCYCS0G38doG0Zjlcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63687846"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63687846"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:59:05 -0700
X-CSE-ConnectionGUID: kaYsVj5hRlCFpSIF8MS/rQ==
X-CSE-MsgGUID: 8h5Dui+lRwO6aU5qWh9Vvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189469405"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:59:02 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 10/17] drm/xe/pf: Allow bulk change all VFs EQ/PT using
 sysfs
Date: Tue, 28 Oct 2025 18:58:24 +0100
Message-ID: <20251028175832.184534-11-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028175832.184534-1-michal.wajdeczko@intel.com>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
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

It is expected to be a common practice to configure the same values
of execution quantum and preemption timeout parameters across all VFs.

Add write-only sysfs attributes that will apply required EQ/PT values
globally, without forcing admin to update PF and each VF separately.

  /sys/bus/pci/drivers/xe/BDF/
  ├── sriov_admin/
      ├── .bulk_profile
      │   ├── exec_quantum_ms		[WO] unsigned integer
      │   └── preempt_timeout_us	[WO] unsigned integer

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 36 ++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
index f12d6752e9f1..0430ffaa746a 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
@@ -22,6 +22,9 @@
  * :
  * ├── sriov_admin/
  *     ├── ...
+ *     ├── .bulk_profile
+ *     │   ├── exec_quantum_ms
+ *     │   └── preempt_timeout_us
  *     ├── pf/
  *     │   ├── ...
  *     │   └── profile
@@ -84,7 +87,40 @@ struct xe_sriov_vf_attr xe_sriov_vf_attr_##NAME = \
 
 /* device level attributes go here */
 
+#define DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(NAME, ITEM, TYPE)		\
+											\
+static ssize_t xe_sriov_dev_attr_##NAME##_store(struct xe_device *xe,			\
+						const char *buf, size_t count)		\
+{											\
+	TYPE value;									\
+	int err;									\
+											\
+	err = kstrto##TYPE(buf, 0, &value);						\
+	if (err)									\
+		return err;								\
+											\
+	err = xe_sriov_pf_provision_bulk_apply_##ITEM(xe, value);			\
+	return err ?: count;								\
+}											\
+											\
+static XE_SRIOV_DEV_ATTR_WO(NAME)
+
+DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(exec_quantum_ms, eq, u32);
+DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(preempt_timeout_us, pt, u32);
+
+static struct attribute *bulk_profile_dev_attrs[] = {
+	&xe_sriov_dev_attr_exec_quantum_ms.attr,
+	&xe_sriov_dev_attr_preempt_timeout_us.attr,
+	NULL
+};
+
+static const struct attribute_group bulk_profile_dev_attr_group = {
+	.name = ".bulk_profile",
+	.attrs = bulk_profile_dev_attrs,
+};
+
 static const struct attribute_group *xe_sriov_dev_attr_groups[] = {
+	&bulk_profile_dev_attr_group,
 	NULL
 };
 
-- 
2.47.1

