Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21370CCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 22:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC1110EA5F;
	Thu, 30 Oct 2025 22:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="el2uLoY+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEF510EA48
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 22:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761863074; x=1793399074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WEBHpcaTdf2hav4/bhF+UYFqGXlfTg9R61m2pw4e5Es=;
 b=el2uLoY+S9ZjFrRIlScOlRmcyF2JmWzsuDrjKHvuuqA0cBP7wisIMOf8
 5pZEQcJpJDo177erkoe2LRl7X8O3z2hFSOgCu4KPz0eiLo9/kvfyAgAcJ
 BpZtYWdSyjlYiCHuvsJFiGa9oQVsGgIF+jejOQ7UkXVW48MLwv9ffs2RC
 GzgxW3c9yzJGatVc809GPgrrHFEBGzWS8oqyKlenbUuODmvv3szY0WkL4
 lQ3+yX4GezBoGxSZ/gbYZQandDIMQ79xxqSjCadZM5JtPH5IM5l7peQ79
 DZowhQDPFdvszXbRGsM9JlFkri9wPh05s4I1xIRsPvWazUMz2CKnNd967 A==;
X-CSE-ConnectionGUID: lIng8+1KRP2z19ppQ28Wwg==
X-CSE-MsgGUID: 0U9AmYfrSyWPhHySaC9JeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64059969"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64059969"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:24:34 -0700
X-CSE-ConnectionGUID: lcqzGjXwS4+fut1kl98ZIg==
X-CSE-MsgGUID: 3K5hzLgRS2mDuULVXfQnQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185346547"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:24:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 16/17] drm/xe/pf: Allow to stop the VF using sysfs
Date: Thu, 30 Oct 2025 23:23:47 +0100
Message-ID: <20251030222348.186658-17-michal.wajdeczko@intel.com>
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

It is expected that VFs activity will be monitored and in some
cases admin might want to silence specific VF without killing
the VM where it was attached.

Add write-only attribute to stop GuC scheduling at VFs level.

  /sys/bus/pci/drivers/xe/BDF/
  ├── sriov_admin/
      ├── vf1/
      │   └── stop		[WO] bool
      ├── vf2/
      │   └── stop		[WO] bool

Writing "1" or "y" (or whatever is recognized by the strtobool()
function) to this file will trigger the change of the VF state
to STOP (GuC will stop servicing the VF). To go back to a READY
state (to allow GuC to service this VF again) the VF FLR must be
triggered (which can be done by writing 1 to device/reset file).

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: drop reset file (Rodrigo, Lucas)
v3: fix patch title (Piotr)
---
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 49 ++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
index a3205bd1c21f..c0b767ac735c 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
@@ -13,6 +13,7 @@
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
+#include "xe_sriov_pf_control.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_provision.h"
 #include "xe_sriov_pf_sysfs.h"
@@ -54,6 +55,7 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
  *     ├── vf1/
  *     │   ├── ...
  *     │   ├── device -> ../../../BDF.1
+ *     │   ├── stop
  *     │   └── profile
  *     │       ├── exec_quantum_ms
  *     │       ├── preempt_timeout_us
@@ -293,8 +295,55 @@ static const struct attribute_group profile_vf_attr_group = {
 	.is_visible = profile_vf_attr_is_visible,
 };
 
+#define DEFINE_SIMPLE_CONTROL_SRIOV_VF_ATTR(NAME)					\
+											\
+static ssize_t xe_sriov_vf_attr_##NAME##_store(struct xe_device *xe, unsigned int vfid,	\
+					       const char *buf, size_t count)		\
+{											\
+	bool yes;									\
+	int err;									\
+											\
+	if (!vfid)									\
+		return -EPERM;								\
+											\
+	err = kstrtobool(buf, &yes);							\
+	if (err)									\
+		return err;								\
+	if (!yes)									\
+		return count;								\
+											\
+	err = xe_sriov_pf_control_##NAME##_vf(xe, vfid);				\
+	return err ?: count;								\
+}											\
+											\
+static XE_SRIOV_VF_ATTR_WO(NAME)
+
+DEFINE_SIMPLE_CONTROL_SRIOV_VF_ATTR(stop);
+
+static struct attribute *control_vf_attrs[] = {
+	&xe_sriov_vf_attr_stop.attr,
+	NULL
+};
+
+static umode_t control_vf_attr_is_visible(struct kobject *kobj,
+					  struct attribute *attr, int index)
+{
+	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
+
+	if (vkobj->vfid == PFID)
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group control_vf_attr_group = {
+	.attrs = control_vf_attrs,
+	.is_visible = control_vf_attr_is_visible,
+};
+
 static const struct attribute_group *xe_sriov_vf_attr_groups[] = {
 	&profile_vf_attr_group,
+	&control_vf_attr_group,
 	NULL
 };
 
-- 
2.47.1

