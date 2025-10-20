Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9173CCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 18:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6385710E4AC;
	Mon, 20 Oct 2025 18:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQBXf8C7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B151410E4AC
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 18:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760984685; x=1792520685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5cyAQ8mkflJ1qLIjGQQ5F5W9kGGd0j779OByNiXhINk=;
 b=eQBXf8C7MmLWFeUBh49w5bK5kN/uNUfjH4K6YZ1AxcMKcfVQ5X3OupkS
 wBJv/W8Gh3TwXP9kZknII/CvP0LTbk4YAAxt6uk+X4GF70I/0vuiJ0L7Y
 3JlFrxrqa5oPgpsqZ13cPwyTHwkkxv0zWAinnnr/+sSEZZ4kOhn1YBaiR
 hwdV1r6PdxH6EYyrnLmBVgBKb7mhwvOH1Cg170axX1/v+ob2Bklb5wzM0
 oxX0LAZa3SH1IsKEMSiabULEGe7ANgacuTKVBVj7UEEPDiOksFIvFzlna
 wtOQM1wFo77+IN2pZqJdZw1RoM6fEENY2Lhn8wfq64sLtiOmx71twS5bG A==;
X-CSE-ConnectionGUID: h/zji8KbQWKqO2E9LIioWA==
X-CSE-MsgGUID: 8zfpqagrSNidXFQ6Grc6Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63013074"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63013074"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:45 -0700
X-CSE-ConnectionGUID: mg+2UeHTReerBh7M0v50zQ==
X-CSE-MsgGUID: rZ0HVZyZT/q/L4FCBpMa+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183802133"
Received: from vthervee-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.249.135])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:42 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 07/14] drm/xe/pf: Allow bulk change all VFs EQ/PT using sysfs
Date: Mon, 20 Oct 2025 20:24:07 +0200
Message-ID: <20251020182414.576-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251020182414.576-1-michal.wajdeczko@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
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
---
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 36 ++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
index d5ad7aa7a899..5c445094e223 100644
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

