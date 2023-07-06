Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B41DEB64DC
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 16:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3468610E476;
	Thu,  6 Jul 2023 16:20:53 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE46410E474
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 16:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688660451; x=1720196451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N7fBlc2YVEc13BhE1Lb6M0zmc58aQBwGTnTcX8pHX9k=;
 b=NeZ1J0DulherqqEGPehHGEj8q6fL8njjkLy2UUGA9MJB1kPj/b9rG5s/
 Pt6E/12R5cfSUD3l4zUbPdrEo+riWsoEwuqAhx5Iy5unYCqT/TBN7omO3
 X51ucsXH73fArZOKA5ECS2kjbxb6ofk3XkmUloPaEny9pYYpTu8xD5tVh
 9OiNchNvstjBlAFLxupWc5nP+YC08/eVkiL4mexJfSfZgeGc/WbVW92aQ
 78k3BvyoaAn5qos/Cqq8bJocQLlSTv9vKOaH8evy7kw96TxnDxOp8oh9e
 btzKz5YpFxZ1BqngDTnQdaXmrEn1J7RXw9Wf6vnCGde4EmnJYMqxEF70k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="394409309"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="394409309"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 09:20:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="722849909"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="722849909"
Received: from fmahon-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.26.229])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 09:20:50 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Jul 2023 17:20:07 +0100
Message-ID: <20230706162003.427026-15-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706162003.427026-12-matthew.auld@intel.com>
References: <20230706162003.427026-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 03/10] drm/xe: hold mem_access.ref for CT
 fast-path
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

Just checking xe_device_mem_access_ongoing() is not enough, we also need
to hold the reference otherwise the ref can transition from 1 -> 0 as we
enter g2h_read(), leading to warnings. While we can't do a full rpm sync
in the IRQ, we can keep the device awake if the ref is non-zero.
Introduce a new helper for this and set it to work in for the CT
fast-path.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 5 +++++
 drivers/gpu/drm/xe/xe_device.h | 1 +
 drivers/gpu/drm/xe/xe_guc_ct.c | 5 ++++-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 07ae208af809..94b0089b0dee 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -412,6 +412,11 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
 }
 
+bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
+{
+	return atomic_inc_not_zero(&xe->mem_access.ref);
+}
+
 void xe_device_mem_access_get(struct xe_device *xe)
 {
 	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 779f71d066e6..8e01bbadb149 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -138,6 +138,7 @@ static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
 }
 
 void xe_device_mem_access_get(struct xe_device *xe);
+bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
 void xe_device_mem_access_put(struct xe_device *xe);
 
 static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index e71d069158dc..dcce6ed34370 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1044,7 +1044,8 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 	struct xe_device *xe = ct_to_xe(ct);
 	int len;
 
-	if (!xe_device_in_fault_mode(xe) || !xe_device_mem_access_ongoing(xe))
+	if (!xe_device_in_fault_mode(xe) ||
+	    !xe_device_mem_access_get_if_ongoing(xe))
 		return;
 
 	spin_lock(&ct->fast_lock);
@@ -1054,6 +1055,8 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 			g2h_fast_path(ct, ct->fast_msg, len);
 	} while (len > 0);
 	spin_unlock(&ct->fast_lock);
+
+	xe_device_mem_access_put(xe);
 }
 
 /* Returns less than zero on error, 0 on done, 1 on more available */
-- 
2.41.0

