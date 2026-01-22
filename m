Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA081D3EE74
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 15:19:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743C710E0CB;
	Thu, 22 Jan 2026 15:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2JM37Hn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BB110E9E2
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 15:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769095176; x=1800631176;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6lkBZIzRfPwlV21tAOlvGczjoGPEzW3zgChaOHztQSI=;
 b=B2JM37HnyCCOuyAnJIZwjLZMLMbzYHn7R0xcH+LCYz7186vf8r0oJwgr
 KpTWmgILuZ9SlqDrzFzydrxSJPWSoHRh1jdS1dEG5fklrU+hE/oKDGHSv
 wuXuZx+hfEKCT858weExpnlXRXrWv4Ewa/8r6+11TeY5sxlRAA7hi47FG
 B1WXeWRY3o6NCHfMq5gxVyfAU8PcSjf6f+NmwJEeiR6IAkFaNCZrgfX5x
 LoVZKC7FNlcMQKRXIPvAUwOoifzE5M9TpPlsUaeQPUZS36ZZxFVDt6UQR
 TzfnRUuH9Jl/VvVXPFMWB4HeLXHV237o23BOQQAdGZS4aMIrwyGtkqCog Q==;
X-CSE-ConnectionGUID: J1JvhxqPSJKCx8iSiwu/Xw==
X-CSE-MsgGUID: HbmB7q4aSja0N1Bo77NB4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81056656"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="81056656"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 07:19:36 -0800
X-CSE-ConnectionGUID: wP1A5TPLQJmDBrxjgf0AwA==
X-CSE-MsgGUID: yJqt00bbTtyrBPAg82JwGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="206664857"
Received: from ptelkov-mobl2.ccr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.16.241])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 07:19:34 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/xe/vf: Reset VF GuC state on fini
Date: Thu, 22 Jan 2026 16:19:24 +0100
Message-ID: <20260122151924.3726-1-michal.wajdeczko@intel.com>
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

Unlike native/PF driver, which was explicitly triggering full GuC
reset during driver unwind, the VF driver was not notifying GuC that
it is about to unwind, and this could lead GuC to access stale data,
which in turn could be interpreted as VF's malicious activity.

Add managed action to send to GuC VF_RESET message during GT unwind.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 44360437beeb..2efc4678fa73 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -668,6 +668,13 @@ static void guc_fini_hw(void *arg)
 	guc_g2g_fini(guc);
 }
 
+static void vf_guc_fini_hw(void *arg)
+{
+	struct xe_guc *guc = arg;
+
+	xe_gt_sriov_vf_reset(guc_to_gt(guc));
+}
+
 /**
  * xe_guc_comm_init_early - early initialization of GuC communication
  * @guc: the &xe_guc to initialize
@@ -772,6 +779,10 @@ int xe_guc_init(struct xe_guc *guc)
 		xe->info.has_page_reclaim_hw_assist = false;
 
 	if (IS_SRIOV_VF(xe)) {
+		ret = devm_add_action_or_reset(xe->drm.dev, vf_guc_fini_hw, guc);
+		if (ret)
+			goto out;
+
 		ret = xe_guc_ct_init(&guc->ct);
 		if (ret)
 			goto out;
-- 
2.47.1

