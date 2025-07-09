Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3833AC83F0F
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 17:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F121D10E35C;
	Wed,  9 Jul 2025 17:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WioWiJ+v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB9F10E35C
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 17:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752082851; x=1783618851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mPpmmdyZiPelxAMQBwYhpulTzCD05qKcY9GuzgNOm+4=;
 b=WioWiJ+vz1szWd6YLpj8uFMhwEgwTtVBUjyKpj4nW6bTbMbhzuU/XPHw
 63imlX3/uz8b6GIqbllNS7IGBKMUg8hJ5KliT1uoJj4hh0fpqQ4eVjqv4
 qoppV08jMF0l3fvTTTlmiwUfBmtEvZnINd2EK4zglkGjtlsIT0UpRZzbw
 5SifeUh6iWf00/d1ncuk+z3fZJqIar5xI9SxIUzV2GCfB6kLWjOfAnKA+
 q9slnaIxzSBT09G3UH+Wdft5WcOzeYBthKKphWg2Jq0XrfvrnoKEwa1He
 2anA7YIjC0010LnHG7yWji9zo6yPtsCMBfrSVXjZfAkGUjIVBw0l+q7pe g==;
X-CSE-ConnectionGUID: CcAvx9JDRY2MEcs52VZHsQ==
X-CSE-MsgGUID: hS/dsXA/TQKHDbtCDi3KXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="64932181"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="64932181"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 10:40:51 -0700
X-CSE-ConnectionGUID: 8m/zo2jzTGKtSDAfCa9NuQ==
X-CSE-MsgGUID: edAk5CQ3SSy9poI7ylirtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="159863325"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 10:40:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/3] drm/xe/guc: Move state change logger to helper
Date: Wed,  9 Jul 2025 19:40:37 +0200
Message-Id: <20250709174038.1876-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250709174038.1876-1-michal.wajdeczko@intel.com>
References: <20250709174038.1876-1-michal.wajdeczko@intel.com>
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

In the state change helper we are already doing extra stuff,
move debug state logger there to cover all state changes.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 2a052dc22ff2..17e5870baf33 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -387,6 +387,8 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
 static void guc_ct_change_state(struct xe_guc_ct *ct,
 				enum xe_guc_ct_state state)
 {
+	struct xe_gt *gt = ct_to_gt(ct);
+
 	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
 	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
 
@@ -398,6 +400,10 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
 	ct->g2h_outstanding = 0;
 	ct->state = state;
 
+	xe_gt_dbg(gt, "GuC CT communication channel %s\n",
+		  state == XE_GUC_CT_STATE_STOPPED ? "stopped" :
+		  str_enabled_disabled(state == XE_GUC_CT_STATE_ENABLED));
+
 	spin_unlock_irq(&ct->fast_lock);
 
 	/*
@@ -473,7 +479,6 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 
 	smp_mb();
 	wake_up_all(&ct->wq);
-	xe_gt_dbg(gt, "GuC CT communication channel enabled\n");
 
 	if (ct_needs_safe_mode(ct))
 		ct_enter_safe_mode(ct);
-- 
2.47.1

