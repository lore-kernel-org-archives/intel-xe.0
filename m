Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2787CE63F12
	for <intel-xe@archiver.kernel.org>; Sun, 15 Feb 2026 20:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61BC10E079;
	Sun, 15 Feb 2026 20:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VGIS8Lsz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2982C10E079
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Feb 2026 20:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771187623; x=1802723623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=okYCLFkTXt/YZYRQ4+eg4UingGQ9bPQKAGnFzC9DwzU=;
 b=VGIS8LszAqs5bkE8Jg841Vwd3/ibmY6lUg13pnkNwbCnc2BymqbQPNb/
 6AK2Cj8+jK6zqhy8XpgOC/Oq+aVgoTMsYR2O/20ksXg0zu79sjQ1Mpf02
 hdujlalMqiHvzMdBtVfzY6cTgQiLaKU15Bbnwu0CokhievIlXie50p0zG
 mi9ybY/q6HPzZnaCET4C+UtY3yEVz5ioHeJVnRtJRL32RqBeaQN8wHvG/
 0esYKss+0I6AeOzoFMU/X46q1X15C7QbbsPvFTF87RbEe3J/qRi3Edqfq
 WAqTSTVjAh200TqX6GF/r1JOz6cZQmLtVr6FUsfvMLcIzZen5LMWkfcWN Q==;
X-CSE-ConnectionGUID: AFmwh6lQS8KFQmAImYBYkw==
X-CSE-MsgGUID: qyLPVnqTRKGm7TcOwCl4mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71996389"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="71996389"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 12:33:43 -0800
X-CSE-ConnectionGUID: Dm81T2elRny9k1jgOf5lfg==
X-CSE-MsgGUID: uqOJmCizQKmYktbdHZ2SGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="251096596"
Received: from shealy-mobl3.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.64.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 12:33:42 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 3/9] drm/xe/pf: Allow to change VFs VRAM quota using sysfs
Date: Sun, 15 Feb 2026 21:33:17 +0100
Message-ID: <20260215203323.595-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260215203323.595-1-michal.wajdeczko@intel.com>
References: <20260215203323.595-1-michal.wajdeczko@intel.com>
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

On current discrete platforms, PF will provision all VFs with a fair
amount of the VRAM (LMEM) during VFs enabling. However, in some cases
this automatic VRAM provisioning might be either non-reproducible or
sub-optimal. This could break VF's migration or impact performance.

Expose per-VF VRAM quota read-write sysfs attributes to allow admin
change default VRAM provisioning performed by the PF.

 /sys/bus/pci/drivers/xe/BDF/
 ├── sriov_admin/
     ├── .bulk_profile
     │   └── vram_quota                 [RW] unsigned integer
     ├── vf1/
     │   └── profile
     │       └── vram_quota             [RW] unsigned integer
     ├── vf2/
     │   └── profile
     │       └── vram_quota             [RW] unsigned integer

Above values represent total provisioned VRAM from all tiles where
VFs were assigned, and currently it's from all tiles always.

Note that changing VRAM provisioning is only possible when VF is
not running, otherwise GuC will complain. To make sure that given
VF is idle, triggering VF FLR might be needed.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
index 82a1055985ba..09deda2fd8b2 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
@@ -44,7 +44,8 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
  *     ├── .bulk_profile
  *     │   ├── exec_quantum_ms
  *     │   ├── preempt_timeout_us
- *     │   └── sched_priority
+ *     │   ├── sched_priority
+ *     │   └── vram_quota
  *     ├── pf/
  *     │   ├── ...
  *     │   ├── device -> ../../../BDF
@@ -59,7 +60,8 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
  *     │   └── profile
  *     │       ├── exec_quantum_ms
  *     │       ├── preempt_timeout_us
- *     │       └── sched_priority
+ *     │       ├── sched_priority
+ *     │       └── vram_quota
  *     ├── vf2/
  *     :
  *     └── vfN/
@@ -132,6 +134,7 @@ static XE_SRIOV_DEV_ATTR_WO(NAME)
 
 DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(exec_quantum_ms, eq, u32);
 DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(preempt_timeout_us, pt, u32);
+DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(vram_quota, vram, u64);
 
 static const char * const sched_priority_names[] = {
 	[GUC_SCHED_PRIORITY_LOW] = "low",
@@ -181,12 +184,25 @@ static struct attribute *bulk_profile_dev_attrs[] = {
 	&xe_sriov_dev_attr_exec_quantum_ms.attr,
 	&xe_sriov_dev_attr_preempt_timeout_us.attr,
 	&xe_sriov_dev_attr_sched_priority.attr,
+	&xe_sriov_dev_attr_vram_quota.attr,
 	NULL
 };
 
+static umode_t profile_dev_attr_is_visible(struct kobject *kobj,
+					   struct attribute *attr, int index)
+{
+	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
+
+	if (attr == &xe_sriov_dev_attr_vram_quota.attr && !IS_DGFX(vkobj->xe))
+		return 0;
+
+	return attr->mode;
+}
+
 static const struct attribute_group bulk_profile_dev_attr_group = {
 	.name = ".bulk_profile",
 	.attrs = bulk_profile_dev_attrs,
+	.is_visible = profile_dev_attr_is_visible,
 };
 
 static const struct attribute_group *xe_sriov_dev_attr_groups[] = {
@@ -228,6 +244,7 @@ static XE_SRIOV_VF_ATTR(NAME)
 
 DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(exec_quantum_ms, eq, u32, "%u\n");
 DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(preempt_timeout_us, pt, u32, "%u\n");
+DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(vram_quota, vram, u64, "%llu\n");
 
 static ssize_t xe_sriov_vf_attr_sched_priority_show(struct xe_device *xe, unsigned int vfid,
 						    char *buf)
@@ -274,6 +291,7 @@ static struct attribute *profile_vf_attrs[] = {
 	&xe_sriov_vf_attr_exec_quantum_ms.attr,
 	&xe_sriov_vf_attr_preempt_timeout_us.attr,
 	&xe_sriov_vf_attr_sched_priority.attr,
+	&xe_sriov_vf_attr_vram_quota.attr,
 	NULL
 };
 
@@ -286,6 +304,10 @@ static umode_t profile_vf_attr_is_visible(struct kobject *kobj,
 	    !sched_priority_change_allowed(vkobj->vfid))
 		return attr->mode & 0444;
 
+	if (attr == &xe_sriov_vf_attr_vram_quota.attr &&
+	    (!IS_DGFX(vkobj->xe) || vkobj->vfid == PFID))
+		return 0;
+
 	return attr->mode;
 }
 
-- 
2.47.1

