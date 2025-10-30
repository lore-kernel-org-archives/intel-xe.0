Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22722CCF9FA
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 22:24:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D915D10EA5F;
	Thu, 30 Oct 2025 22:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WYhkgDfB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1782F10EA56
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 22:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761863054; x=1793399054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KwsIB5G0enCTDOrFF+q3omlTwgmHD4cUitT7u/2SfF4=;
 b=WYhkgDfBTFUPnHmCmTQqlIOqPFqjkFw7QlGO7d4SzU6Z1K8MXY+UD0r4
 zKi217yef0rBc7biZ6+20OVFooJUPUXzPUSKa6yq6MZCcP9BU1XSbJgfJ
 jFmTPj0hEiQPvLoZ2dC0ueVdnteT5xrc7gvFH80+h1+lVkwVJfDSVrjQ4
 CMATARykdE2LDdKSTDLihwXVfEVDJ2UADFbJxJxvGh3h0s5KHcnKPyVff
 IWQesCnFupUbaLz0YyYNSzSgxnshQ2ZtsGm1rsh8hc8hEicUqkv656Cb6
 Spg/YMA0Ve7G/chzYi39Tc6yL+sFomS3vod/XBIRfO78CFFijmrJK/bCS w==;
X-CSE-ConnectionGUID: 9ltFCHI2RBWSW2vLjtbbHg==
X-CSE-MsgGUID: i3OKZgx+S/qWAoeNuB1SUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64059941"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64059941"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:24:14 -0700
X-CSE-ConnectionGUID: HJ//oEAISc+m2AHbu5Kjnw==
X-CSE-MsgGUID: sSuYNRB2Sdy0YGqoehOmhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185346377"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:24:09 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 02/17] drm/xe/pf: Take RPM during calls to SR-IOV
 attr.store()
Date: Thu, 30 Oct 2025 23:23:33 +0100
Message-ID: <20251030222348.186658-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030222348.186658-1-michal.wajdeczko@intel.com>
References: <20251030222348.186658-1-michal.wajdeczko@intel.com>
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

We expect that all SR-IOV attr.store() handlers will require active
runtime PM reference. To simplify implementation of those handlers,
take an implicit RPM reference on their behalf. Also wait until PF
completes its restart.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
index 0f2b19ca873e..439a0cd02a86 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
@@ -9,7 +9,9 @@
 #include <drm/drm_managed.h>
 
 #include "xe_assert.h"
+#include "xe_pm.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_sysfs.h"
 #include "xe_sriov_printk.h"
@@ -129,11 +131,16 @@ static ssize_t xe_sriov_dev_attr_store(struct kobject *kobj, struct attribute *a
 	struct xe_sriov_dev_attr *vattr = to_xe_sriov_dev_attr(attr);
 	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
 	struct xe_device *xe = vkobj->xe;
+	ssize_t ret;
 
 	if (!vattr->store)
 		return -EPERM;
 
-	return vattr->store(xe, buf, count);
+	xe_pm_runtime_get(xe);
+	ret = xe_sriov_pf_wait_ready(xe) ?: vattr->store(xe, buf, count);
+	xe_pm_runtime_put(xe);
+
+	return ret;
 }
 
 static ssize_t xe_sriov_vf_attr_show(struct kobject *kobj, struct attribute *attr, char *buf)
@@ -158,13 +165,18 @@ static ssize_t xe_sriov_vf_attr_store(struct kobject *kobj, struct attribute *at
 	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
 	struct xe_device *xe = vkobj->xe;
 	unsigned int vfid = vkobj->vfid;
+	ssize_t ret;
 
 	xe_sriov_pf_assert_vfid(xe, vfid);
 
 	if (!vattr->store)
 		return -EPERM;
 
-	return vattr->store(xe, vfid, buf, count);
+	xe_pm_runtime_get(xe);
+	ret = xe_sriov_pf_wait_ready(xe) ?: vattr->store(xe, vfid, buf, count);
+	xe_pm_runtime_get(xe);
+
+	return ret;
 }
 
 static const struct sysfs_ops xe_sriov_dev_sysfs_ops = {
-- 
2.47.1

