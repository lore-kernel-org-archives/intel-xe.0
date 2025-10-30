Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41BCCCF9FA
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 22:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF6D10EA48;
	Thu, 30 Oct 2025 22:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iY0iA4C/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3538110EA62
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 22:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761863067; x=1793399067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=spaxP183FV6zwO2UVlh7mucHL93dbiIEAO0JWyQO1v0=;
 b=iY0iA4C/IxZdk0hH8xX7Rgdygpo6XxlQZdY4pYbdzqiV7hEnU/57DTHu
 YXQ3gy2HH/00QarUuflH3upPgEixlo06nD+Gdf+v9WXgtVesCh7Fy+TDH
 sfRB/cF48/hxjRcH7AsyaCre3Egs0VrEbj/+ttJ7zJ+gRRWkO8NEKOdgn
 ABQErH/rcK8QpM2l+Q59I3oY9uDuVj0RSY7izOIzAAPyf9P4tbO4HqZp9
 8fG0Zu0KPlQC4vBj7lLIZPAiAE6fhxd3+13BQn4ZHMyp3DU/eaOmLOVPe
 XbHdknJ8CKyMbysk+Cc0g8y42faiExcknUzZpkb9ZP26bFPBNInN2hSau A==;
X-CSE-ConnectionGUID: u0cJLnBxSWuu/gnyfszclw==
X-CSE-MsgGUID: LLeP/oeCRluZUoTUo1tX5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64059959"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64059959"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:24:27 -0700
X-CSE-ConnectionGUID: KPmQMPtnRFO1sQVF48sCOg==
X-CSE-MsgGUID: a+wK/SW8QV+mP0JhbtJJpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185346515"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:24:26 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 12/17] drm/xe/pf: Allow bulk change all VFs priority using
 sysfs
Date: Thu, 30 Oct 2025 23:23:43 +0100
Message-ID: <20251030222348.186658-13-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030222348.186658-1-michal.wajdeczko@intel.com>
References: <20251030222348.186658-1-michal.wajdeczko@intel.com>
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
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 42 +++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
index 0430ffaa746a..19724a28fb33 100644
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

