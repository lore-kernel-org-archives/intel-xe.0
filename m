Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AC7CCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 18:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D68810E4AD;
	Mon, 20 Oct 2025 18:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZSrcGSUZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0AD10E4AD
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 18:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760984674; x=1792520674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZHLN3tMnZlR1ezMe2PDAqMXwYcXUR/zWp/xg9bwqmCc=;
 b=ZSrcGSUZL1XVKUulk8PDJox/9mYw2Mw/F/YDr2+s5zSKnyuC+/cfqxla
 fMqP/UB6AKkZxvo5PtOd8SxL14Y4IcF4348DWwrCIjAX1V3zB+v7DX/oC
 DHi6K0tdvak6Dp083WQdY8xQdtGNx7qPrppsmVzpJImyWmLTa/fYaiaxR
 etAPoR34uNlnFbm9wLh8gD2omJtpH18c3IUjXY4lhUss3pqe1vGHZN9SM
 VH/a1XbZHPwXFrdAWYMyYBYb46oFOJm//rXRMa3fa2n4Nwz2y3+PPm0JJ
 FRjsjDn9xjxW2ScXnDrF2G4KgdH7x6A8nE/xY+SvWtO3bNHb5O/dIk+Y2 A==;
X-CSE-ConnectionGUID: MhZZj4ZSReSpjhnYeEx4Sg==
X-CSE-MsgGUID: dV3qIO0fQPebQFaFPfLXBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63013057"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63013057"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:34 -0700
X-CSE-ConnectionGUID: O9uRabnUSSao+kpqpr96LA==
X-CSE-MsgGUID: 8z30KLD+TOekawZKweq2Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183802084"
Received: from vthervee-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.249.135])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 02/14] drm/xe/pf: Take RPM during calls to SR-IOV attr.store()
Date: Mon, 20 Oct 2025 20:24:02 +0200
Message-ID: <20251020182414.576-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251020182414.576-1-michal.wajdeczko@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
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
---
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
index 91962155f80b..15072779be7d 100644
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
@@ -131,13 +133,19 @@ static ssize_t xe_sriov_dev_attr_store(struct kobject *kobj, struct attribute *a
 	struct xe_sriov_dev_attr *vattr = to_xe_sriov_dev_attr(attr);
 	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
 	struct xe_device *xe = vkobj->xe;
+	ssize_t ret;
 
 	if (!vattr->store) {
 		xe_sriov_dbg(xe, "attribute '%s' was not intended to be %s\n",
 			     attr->name, "writable");
 		return -EPERM;
 	}
-	return vattr->store(xe, buf, count);
+
+	xe_pm_runtime_get(xe);
+	ret = xe_sriov_pf_wait_ready(xe) ?: vattr->store(xe, buf, count);
+	xe_pm_runtime_put(xe);
+
+	return ret;
 }
 
 static ssize_t xe_sriov_vf_attr_show(struct kobject *kobj, struct attribute *attr, char *buf)
@@ -164,6 +172,7 @@ static ssize_t xe_sriov_vf_attr_store(struct kobject *kobj, struct attribute *at
 	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
 	struct xe_device *xe = vkobj->xe;
 	unsigned int vfid = vkobj->vfid;
+	ssize_t ret;
 
 	xe_sriov_pf_assert_vfid(xe, vfid);
 
@@ -172,7 +181,12 @@ static ssize_t xe_sriov_vf_attr_store(struct kobject *kobj, struct attribute *at
 			     attr->name, "writable");
 		return -EPERM;
 	}
-	return vattr->store(xe, vfid, buf, count);
+
+	xe_pm_runtime_get(xe);
+	ret = xe_sriov_pf_wait_ready(xe) ?: vattr->store(xe, vfid, buf, count);
+	xe_pm_runtime_get(xe);
+
+	return ret;
 }
 
 static const struct sysfs_ops xe_sriov_dev_sysfs_ops = {
-- 
2.47.1

