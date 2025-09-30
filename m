Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A100BCCA476
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 23:35:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E09710E2E4;
	Tue, 30 Sep 2025 23:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nh/TeOnS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A8210E2E4
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 23:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759275340; x=1790811340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=81Hh0GQQW6kCDxor6AisaTU7VtIR8eSECSbY41FNKpM=;
 b=nh/TeOnSzy/pJ/2a7RPDWEqAD8MRattU7GSQ9mQv/1iWFbbvtq9rla0D
 mhhH5UCqDXrBDoF+wFvWDWxnIGjJGmBgumf744OtHPKHaBNDE5azo6k87
 ZMnBpC3BGemV9qsl2QwAOQvEE7wL9U5cXdrHfAkgh5Ax4dqtXpYAyexMK
 bUqYFL6OGy7938uEXhbxjBBtHhv48nx94xdi+SWqePrPLdoC2Vma2s4Bx
 G+SLGIX7ODlO7xaMlZWPXqGEA+gBBa0RURIGpRZx5cLoGE3p3AmaC3/9X
 1jbGJqnv65PZIZLy6gQ+GPKuovRWkj+34syGAGvZi9fDWBpA3HkI/eTUK A==;
X-CSE-ConnectionGUID: m7QFRrH7SUqZKqfC9VF8fA==
X-CSE-MsgGUID: GRxa0FKRTpeaBIYi7IltQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72646735"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="72646735"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 16:35:40 -0700
X-CSE-ConnectionGUID: zFJswnNGQrCKQsqfxSMdfQ==
X-CSE-MsgGUID: ZpzMErpfRFG2gY0cc3sk7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="177775518"
Received: from krychlik-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 16:35:39 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 4/6] drm/xe/pf: Unify VF state tracking log
Date: Wed,  1 Oct 2025 01:35:22 +0200
Message-ID: <20250930233525.201263-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930233525.201263-1-michal.wajdeczko@intel.com>
References: <20250930233525.201263-1-michal.wajdeczko@intel.com>
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

By using single function that dumps VF state transition, final
logs are easier to analyze as there is always the same call site
in every debug message.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index e582f4d60015..90fb69b0e041 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -271,12 +271,19 @@ static bool pf_expect_vf_not_state(struct xe_gt *gt, unsigned int vfid,
 	return result;
 }
 
+static void pf_track_vf_state(struct xe_gt *gt, unsigned int vfid,
+			      enum xe_gt_sriov_control_bits bit,
+			      const char *what)
+{
+	xe_gt_sriov_dbg_verbose(gt, "VF%u state %s(%d) %s\n",
+				vfid, control_bit_to_string(bit), bit, what);
+}
+
 static bool pf_enter_vf_state(struct xe_gt *gt, unsigned int vfid,
 			      enum xe_gt_sriov_control_bits bit)
 {
 	if (!test_and_set_bit(bit, pf_peek_vf_state(gt, vfid))) {
-		xe_gt_sriov_dbg_verbose(gt, "VF%u state %s(%d) enter\n",
-					vfid, control_bit_to_string(bit), bit);
+		pf_track_vf_state(gt, vfid, bit, "enter");
 		return true;
 	}
 	return false;
@@ -286,8 +293,7 @@ static bool pf_exit_vf_state(struct xe_gt *gt, unsigned int vfid,
 			     enum xe_gt_sriov_control_bits bit)
 {
 	if (test_and_clear_bit(bit, pf_peek_vf_state(gt, vfid))) {
-		xe_gt_sriov_dbg_verbose(gt, "VF%u state %s(%d) exit\n",
-					vfid, control_bit_to_string(bit), bit);
+		pf_track_vf_state(gt, vfid, bit, "exit");
 		return true;
 	}
 	return false;
-- 
2.47.1

