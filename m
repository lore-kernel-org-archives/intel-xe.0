Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65F0CCD199
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 18:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FD710E4AD;
	Mon, 20 Oct 2025 18:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXt7vjk0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6246C10E4B2
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 18:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760984698; x=1792520698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YTu3Za+zskItNK9wVOHy1DgXflws/CyUGCO5Y14O9EI=;
 b=dXt7vjk0TIel1uk17hIjQ7g3H9nBbcaYDlw6uAk2DCy6+fO1w2Z+zSJq
 0xhqy+RdWoaDLlhIKlrik/+FfwGLlOr4YNbFOV6QMV66/Y9ee62X5liAa
 eyF2PrA8xPY8CV1+UfCPQ1B57x/tktG8rKCDa+S1wBKe8jofAQsIVxats
 Tr7pOfvVXoJkZII4DIOT4BfHGatXUfonJR8XuhY8vrvCiRkaOVc4UMIq8
 jEFIGJtyTOrHyz17q6Mfp8hpnVFfVYOoe740Gl4tX5TIlX+agRX0hj6Kl
 eS3k+XjnDX5Ypb5T6tYQ8eTyrPUDaZgThUV1LALy3zQu4Y+p3EHJUFH09 Q==;
X-CSE-ConnectionGUID: IdQlRRo3SjuXotoAmz3UsQ==
X-CSE-MsgGUID: 7CHODRN5SSaljO6SvF221Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63013095"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63013095"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:57 -0700
X-CSE-ConnectionGUID: gOU7i9hEQsqlKjZ12f4Exg==
X-CSE-MsgGUID: ml+oHTeQT8i/6w2WSRBXkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183802180"
Received: from vthervee-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.249.135])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 13/14] drm/xe/pf: Allow to stop and reset VF using sysfs
Date: Mon, 20 Oct 2025 20:24:13 +0200
Message-ID: <20251020182414.576-14-michal.wajdeczko@intel.com>
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

It is expected that VFs activity will be monitored and in some
cases admin might want to silence specific VF without killing
the VM where it was attached.

Add write-only attributes to control GuC scheduling at VF level.

  /sys/bus/pci/drivers/xe/BDF/
  ├── sriov_admin/
      ├── vf1/
      │   ├── reset		[WO] bool
      │   └── stop		[WO] bool
      ├── vf2/
      │   ├── reset		[WO] bool
      │   └── stop		[WO] bool

Writing "1" or "y" (or whatever is recognized by the strtobool()
function) to these files will trigger the change of the VF state
to STOP (GuC will stop servicing the VF) or back to READY (GuC
will start servicing this VF again but after completing the full
sequence of the software initiated VF FLR).

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 52 ++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
index c68acf6cd34f..f872013313c1 100644
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
@@ -52,6 +53,8 @@ static int emit_choice(char *buf, int choice, const char * const *array, size_t
  *     ├── vf1/
  *     │   ├── ...
  *     │   ├── device -> ../../../BDF.1
+ *     │   ├── reset
+ *     │   ├── stop
  *     │   └── profile
  *     │       ├── exec_quantum_ms
  *     │       ├── preempt_timeout_us
@@ -291,8 +294,57 @@ static const struct attribute_group profile_vf_attr_group = {
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
+DEFINE_SIMPLE_CONTROL_SRIOV_VF_ATTR(reset);
+
+static struct attribute *control_vf_attrs[] = {
+	&xe_sriov_vf_attr_stop.attr,
+	&xe_sriov_vf_attr_reset.attr,
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

