Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB47BC982C9
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 21:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E36810E09F;
	Wed, 16 Sep 2026 21:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zx/Y2KU0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF7B10E09F
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 21:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789594201; x=1821130201;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3Rd57uZ1/L+t5kW0fr+rOa9yMo0xzjD6ph7EqF0y1sc=;
 b=Zx/Y2KU0P4dKdxVlog2J5/D+rwwpP8T1RspZk2liBNSyJe4crzaC6Ji9
 f1C0f2hHWwnKyECC350nwtBc2LxAkG7tTE3WoPoGWg5DHu0PDyAEekHeW
 QryrJQkzwWQoYDdmMJ6vYKT9yYZJlK3NcUANuOGg7z0iVjxrORwph/Xct
 0W4lrxyFexqR6H4+xD9acJ+CVZLNluGMEnBX8MCqRCUc0uDM7bSg9XrX2
 0ilg9Per1Mq/1ij09Gc6NEPqg7o8sUh/n18aVuMXLGDoY1Tw++XAMGLVR
 t8NL9JmnnM+fxIuUQnqufQT2eoO0lFxqilmiaqUmeB6Klxg7FhHz+WbgC w==;
X-CSE-ConnectionGUID: 26ijB1ROS9eIfFF0v1ovAQ==
X-CSE-MsgGUID: myfgxP4LTnat3ltr9xgkMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89999361"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89999361"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 14:30:01 -0700
X-CSE-ConnectionGUID: +NlaZaEuRBaUBE4QRwsQIQ==
X-CSE-MsgGUID: W3pKBSfqTpmFS1mhrnwuVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271672406"
Received: from awalabdu-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.64.211])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 14:29:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Move locking to xe_sriov_pf_reprovision_default
Date: Wed, 16 Sep 2026 23:29:49 +0200
Message-ID: <20260916212949.13120-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

We should avoid taking the mutex in the helpers. Move guard from
the helper to the main entry function.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index 0ec7ea83f12a..c37e422b5a5c 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -112,7 +112,7 @@ static int pf_reprovision_default(struct xe_device *xe)
 	int result = 0;
 	int err;
 
-	guard(mutex)(xe_sriov_pf_master_mutex(xe));
+	lockdep_assert_held(xe_sriov_pf_master_mutex(xe));
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_sriov_pf_policy_set_sched_if_idle_locked(gt, false);
@@ -138,6 +138,8 @@ int xe_sriov_pf_reprovision_default(struct xe_device *xe)
 {
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
+	guard(mutex)(xe_sriov_pf_master_mutex(xe));
+
 	if (!pf_auto_provisioning_mode(xe))
 		return 0;
 
-- 
2.47.1

