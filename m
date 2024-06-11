Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D1DC27C65
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 16:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E7C10E6B9;
	Tue, 11 Jun 2024 16:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ts6006xk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B1810E6B9
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718123759; x=1749659759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rvR0befE6r0lt9GprHHb6Bqu5/9sXOH+srlZe9ooJDM=;
 b=Ts6006xknrE6q1KtfPzHoIo1b1W/tQifmFF/mvi00Vz43qcdIpPTmzCo
 TbRA0jE25GQkctW4PbPlE2ssU6LwM11WadXa/EqlkSy6qm0wdTy8AOimi
 BYqxREFRTOtMR0TD1brCfDSVTdED7dWrt46eJoFCTC7+79zl5I7Rowr3v
 i73XhZ6htEqaKx7EwEmS6OsTjWVW4HTxjvYYKTS3Oo5FlHqtHU3+VdB1A
 n3D7Jki1nwECOdPuoe2ICT+Z+r+2G3V9lOuo/ljnUywruIlvqty9GXJFb
 lOhvksu63yoTIkqTqmWq/LWWBIpVfoV9mxe+fIDJiQh6/kI2rgJ+KUT2X Q==;
X-CSE-ConnectionGUID: UVhB6UuETQOnwL00NlE/7w==
X-CSE-MsgGUID: MlrJD5a/QQ+catEgBaWWNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="40247886"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="40247886"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:35:59 -0700
X-CSE-ConnectionGUID: wDjxqQk0QZqj7h5Fweii7g==
X-CSE-MsgGUID: d/M/6uQtQ5mzEMtX03KfyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44388695"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.248.185])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:35:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 5/5] drm/xe/vf: Ignore force-wake requests if VF
Date: Tue, 11 Jun 2024 18:35:37 +0200
Message-Id: <20240611163537.1944-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240611163537.1944-1-michal.wajdeczko@intel.com>
References: <20240611163537.1944-1-michal.wajdeczko@intel.com>
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

The control and ack force-wake registers are not accessible for
the VF drivers. To avoid changing existing code logic that tracks
woken domains, simply ignore all attempts to access control or ack
registers if we are running as a VF driver.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 468aabd72d6b..5db6926120c3 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -12,6 +12,7 @@
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_mmio.h"
+#include "xe_sriov.h"
 
 #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
 
@@ -96,6 +97,9 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 
 static void __domain_ctl(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
 {
+	if (IS_SRIOV(gt_to_xe(gt)))
+		return;
+
 	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | (wake ? domain->val : 0));
 }
 
@@ -104,6 +108,9 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
 	u32 value;
 	int ret;
 
+	if (IS_SRIOV(gt_to_xe(gt)))
+		return 0;
+
 	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, wake ? domain->val : 0,
 			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
 			     &value, true);
-- 
2.43.0

