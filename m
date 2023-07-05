Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800CCEB64DD
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 16:08:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C0D10E3B6;
	Wed,  5 Jul 2023 16:08:25 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A32710E3AB
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jul 2023 16:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688573302; x=1720109302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IsIjoJEr614Sh645lUr8TlVlXXvK7Ypjyg9gRpSTUwU=;
 b=Nl2lIypfxT7qLwzQuOEsp7xGmJx4d3XQ1D6+i0dHhBBCx4LzJyZ9D41X
 VrOkR8HtDsT8COaz6kLnKmLlLxYqrz/uZt5t9qZOmzumuunT3okxvXrKT
 lQJfDrOmiMe/xNQQZ2bP73L1f2167YY/T1S2tf3MdgbRX7W5Hwap0PC0i
 Bayouvg7mRrB1sSMYL0rqS2GoE7XBEABcn127oDKFic7P7jU/HamrCT6h
 NPtqm6mTG0jII1Ln+jgxaQxu0TOUeXzKboC0tBQFBiqDqPuAMwx4wLHA+
 Y28PD7S3V4F//oX7BtHY3LO45PphdzDg9NPit+eG9yMCqOayKdb5S1pwQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="362248933"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="362248933"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 09:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="965879869"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="965879869"
Received: from peterhox-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.10.156])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 09:06:41 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Jul 2023 17:06:04 +0100
Message-ID: <20230705160602.237213-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705160602.237213-9-matthew.auld@intel.com>
References: <20230705160602.237213-9-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 1/7] drm/xe: hold mem_access.ref for CT
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
index 22bc9ce846db..b7aecc480098 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1038,7 +1038,8 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 	struct xe_device *xe = ct_to_xe(ct);
 	int len;
 
-	if (!xe_device_in_fault_mode(xe) || !xe_device_mem_access_ongoing(xe))
+	if (!xe_device_in_fault_mode(xe) ||
+	    !xe_device_mem_access_get_if_ongoing(xe))
 		return;
 
 	spin_lock(&ct->fast_lock);
@@ -1048,6 +1049,8 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
 			g2h_fast_path(ct, ct->fast_msg, len);
 	} while (len > 0);
 	spin_unlock(&ct->fast_lock);
+
+	xe_device_mem_access_put(xe);
 }
 
 /* Returns less than zero on error, 0 on done, 1 on more available */
-- 
2.41.0

