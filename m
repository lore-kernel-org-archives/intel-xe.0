Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6360CC27C50
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 11:17:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153FB10E45B;
	Tue,  4 Jun 2024 11:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TdmmPNj/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECCD10E45B
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 11:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717499844; x=1749035844;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+uz6U/PKCTcpa2bst6O1SrDbI7f/gW7YBKCj5YuTx60=;
 b=TdmmPNj/Rj11JI2iYImcvPad/Xzc37vJt6MMhhVGKc7lJR5r/35hecIg
 1fqaYVjJRqVDmNLCKwbYFzPBhg8hYCpuRdNZKM5gbx4uSQpzAl3SWVFvn
 lQiL8lRgf1AyL8osk6wz2pGJUHqxWcbPh9l/dDD0lUEZVoyJLcE7U0ryT
 s29sTysRZ9bZt39txDKE53ev0kdEBpgOFMhHyxiYvZ8QBeT8rs7/2sk8x
 AG35wn2Moo7sh9v2ilEjQj/O54HEHtFeqUuJd1qizIWop9FSHnsvsOMbq
 1aaoOrLpAEOkvqlhsCxNJBZmUopOEseuOLXDVVpWQjpUTkBSVnHqwdATu w==;
X-CSE-ConnectionGUID: yunp0mZSSrWsr2tUkOPXLA==
X-CSE-MsgGUID: Jz4zAe0nQs2NHXLbuVD6Hg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24701853"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="24701853"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:17:24 -0700
X-CSE-ConnectionGUID: eJ2MuAiBQYOqJew6gsTG8g==
X-CSE-MsgGUID: 2mBoAh2bTFWCKyUn8Sgnjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37669687"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:17:22 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 5/9] drm/xe/uc: Always call xe_force_wake_put/get in pairs
Date: Tue,  4 Jun 2024 13:02:21 +0200
Message-ID: <20240604110225.29495-6-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240604110225.29495-1-nirmoy.das@intel.com>
References: <20240604110225.29495-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

xe_force_wake_get() increments the domain ref regardless of success
or failure so call xe_force_wake_put() even on failure to keep ref
count accurate.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc_proxy.c | 3 +--
 drivers/gpu/drm/xe/xe_guc_pc.c    | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index aa812a2bc3ed..56376c10ab86 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -493,8 +493,7 @@ void xe_gsc_proxy_remove(struct xe_gsc *gsc)
 	/* try do disable irq even if forcewake failed */
 	gsc_proxy_irq_toggle(gsc, false);
 
-	if (!err)
-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
 	xe_pm_runtime_put(xe);
 
 	xe_gsc_wait_for_worker_completion(gsc);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 8187dfb2ad6c..ab207a11ac0f 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -468,7 +468,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq)
 	 */
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (ret)
-		goto out;
+		goto fw;
 
 	ret = pc_action_query_task_state(pc);
 	if (ret)
-- 
2.42.0

