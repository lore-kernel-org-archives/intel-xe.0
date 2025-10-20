Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1D4CCD199
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 18:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108B110E4B1;
	Mon, 20 Oct 2025 18:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="euHCeBxD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063A010E4AE
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 18:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760984689; x=1792520689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e6sbCpM0fJHBIjKvWCk2oX8YsYeUBC0aGWXMVMBNgtw=;
 b=euHCeBxDH4mgSE0bJl4DCY6bchypxFKDtF+O2/eOTreD8MiXOrDFdM/O
 cbq9Ospc67lWj4H5x5Wc20qlNxjxjPRAbu+Y0mihye/QS3dEhGVYILacw
 VJ2yd6Ijf9uH+mHHx5ADJGVRzcKLT1U5/m0+4sNpsBQRhSF6FGORysba/
 bA1G1w2bVaET+ODPJ72m1G+DxJ4vLTaJNRE6wxmxJaOJVr6/l6oJiDL3k
 3xMwh8ZQJyXf56XHtzYImzKP+iWNiCg3wGdZ5UZ8yFcpHqUU20oIFiauC
 xatNNr54GOXvh7Mpvek1JtycyYQortLwyZ53MPNfDF/NgTZC7nx+WA6y7 A==;
X-CSE-ConnectionGUID: l7DDk7sOR3Kj0DYHUCMoWw==
X-CSE-MsgGUID: oT4Mx1ozSquigpMT5j3bwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63013078"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63013078"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:49 -0700
X-CSE-ConnectionGUID: zFImAKMQSJuHjlhUBVBMgg==
X-CSE-MsgGUID: 4UxT4KHKRCavIAteUtN1FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183802143"
Received: from vthervee-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.249.135])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 09/14] drm/xe/pf: Allow bulk change all VFs priority using
 sysfs
Date: Mon, 20 Oct 2025 20:24:09 +0200
Message-ID: <20251020182414.576-10-michal.wajdeczko@intel.com>
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

It is expected to be a common practice to configure the same level
of scheduling priority across all VFs and PF (at least as starting
point). Due to current GuC FW limitations it is also the only way
to change VFs priority.

Add write-only sysfs attribute that will apply required priority
level to all VFs and PF at once.

  /sys/bus/pci/drivers/xe/BDF/
  ├── sriov_admin/
      ├── .bulk_profile
      │   └── sched_priority		[WO] low, normal

Writing "low" to this write-only attribute will change PF and
VFs scheduling priority on all tiles/GTs to LOW (function will
be scheduled only if it has work submitted). Similarly, writing
"normal" will change functions priority to NORMAL (functions will
be scheduled irrespective of whether there is a work or not).

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c |  1 +
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c     | 42 +++++++++++++++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index 3a3806055616..89b2feb43b77 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -6,6 +6,7 @@
 #include "xe_assert.h"
 #include "xe_device.h"
 #include "xe_gt_sriov_pf_config.h"
+#include "xe_gt_sriov_pf_policy.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_provision.h"
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
index 5c445094e223..26ba9a2efec9 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
@@ -24,7 +24,8 @@
  *     ├── ...
  *     ├── .bulk_profile
  *     │   ├── exec_quantum_ms
- *     │   └── preempt_timeout_us
+ *     │   ├── preempt_timeout_us
+ *     │   └── sched_priority
  *     ├── pf/
  *     │   ├── ...
  *     │   └── profile
@@ -108,9 +109,48 @@ static XE_SRIOV_DEV_ATTR_WO(NAME)
 DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(exec_quantum_ms, eq, u32);
 DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(preempt_timeout_us, pt, u32);
 
+static const char * const sched_priority_names[] = {
+	[GUC_SCHED_PRIORITY_LOW] = "low",
+	[GUC_SCHED_PRIORITY_NORMAL] = "normal",
+	[GUC_SCHED_PRIORITY_HIGH] = "high",
+};
+
+static bool sched_priority_high_allowed(unsigned int vfid)
+{
+	/* As of today GuC FW allows to select 'high' priority only for the PF. */
+	return vfid == PFID;
+}
+
+static bool sched_priority_bulk_high_allowed(struct xe_device *xe)
+{
+	/* all VFs are equal - it's sufficient to check VF1 only */
+	return sched_priority_high_allowed(VFID(1));
+}
+
+static ssize_t xe_sriov_dev_attr_sched_priority_store(struct xe_device *xe,
+						      const char *buf, size_t count)
+{
+	size_t num_priorities = ARRAY_SIZE(sched_priority_names);
+	int match;
+	int err;
+
+	if (!sched_priority_bulk_high_allowed(xe))
+		num_priorities--;
+
+	match = __sysfs_match_string(sched_priority_names, num_priorities, buf);
+	if (match < 0)
+		return -EINVAL;
+
+	err = xe_sriov_pf_provision_bulk_apply_priority(xe, match);
+	return err ?: count;
+}
+
+static XE_SRIOV_DEV_ATTR_WO(sched_priority);
+
 static struct attribute *bulk_profile_dev_attrs[] = {
 	&xe_sriov_dev_attr_exec_quantum_ms.attr,
 	&xe_sriov_dev_attr_preempt_timeout_us.attr,
+	&xe_sriov_dev_attr_sched_priority.attr,
 	NULL
 };
 
-- 
2.47.1

