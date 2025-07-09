Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C274C83F03
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 17:40:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40ED710E35B;
	Wed,  9 Jul 2025 17:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g9Qx6t/L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DF310E355
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 17:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752082850; x=1783618850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JBKRBtarwtoasQIq89jElKr/pclsrgjfi6QuvpsVOVs=;
 b=g9Qx6t/LACvJuyRqg7LjbLQE6P1q/HGLaLPPE638okm5LkzKAuzZ1hAs
 OI/mBonBTdGyC2ihvUZord1IpmyXGMLAQm43OptwDrCobbeDYUPCqELAC
 zSb3luFPLoB0qNygX727Nr00qQm6UyyGAXubNE2t1aX0rrGNTaZ/zRVam
 1qQGd18pDZE1BRvKt3Kg0QasNk/roE/i4rxFvp2PJC3Vrgj8MtvPuvedH
 EtKPxDtdaxixqcB9FKnOl955vKGMQj4pp+bTnKtJGf+vA85XJr7Rr5gdu
 M1hty4AB97584L7veNVSAKjl0e9RIy3RCfW9NuSKn3ntv6z6n0hpbKHiZ g==;
X-CSE-ConnectionGUID: tBd5gLtOT2OEwI7U1811uQ==
X-CSE-MsgGUID: jTzuvvzTRs6JbNz16lBNVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="64932179"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="64932179"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 10:40:50 -0700
X-CSE-ConnectionGUID: cpvUP6l2T0aDiMECHuBiCA==
X-CSE-MsgGUID: fvjZjQJbQB6ETkbZ9vuX6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="159863315"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 10:40:49 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/3] drm/xe/guc: Rename CT state change helper
Date: Wed,  9 Jul 2025 19:40:36 +0200
Message-Id: <20250709174038.1876-2-michal.wajdeczko@intel.com>
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

In this helper we are already doing much more than just setting
a new CT state and its name was little misleading. Rename it.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 23e8c155025e..2a052dc22ff2 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -384,7 +384,7 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
 	return ret > 0 ? -EPROTO : ret;
 }
 
-static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
+static void guc_ct_change_state(struct xe_guc_ct *ct,
 				enum xe_guc_ct_state state)
 {
 	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
@@ -469,7 +469,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	if (err)
 		goto err_out;
 
-	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
+	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
 
 	smp_mb();
 	wake_up_all(&ct->wq);
@@ -514,7 +514,7 @@ static void stop_g2h_handler(struct xe_guc_ct *ct)
  */
 void xe_guc_ct_disable(struct xe_guc_ct *ct)
 {
-	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
+	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
 	ct_exit_safe_mode(ct);
 	stop_g2h_handler(ct);
 }
@@ -530,7 +530,7 @@ void xe_guc_ct_stop(struct xe_guc_ct *ct)
 	if (!xe_guc_ct_initialized(ct))
 		return;
 
-	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_STOPPED);
+	guc_ct_change_state(ct, XE_GUC_CT_STATE_STOPPED);
 	stop_g2h_handler(ct);
 }
 
-- 
2.47.1

