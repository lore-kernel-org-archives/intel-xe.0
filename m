Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFA5CCF9EB
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 17:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F4D10E641;
	Tue, 28 Oct 2025 17:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RuptG3WH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3BA10E643
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 17:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761674340; x=1793210340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ohT57Xt0Ys5CSbhvZxrR4a35L8Dqq9S5zkDFxpaBoyc=;
 b=RuptG3WHTH/2iqQVv+1CZcLrYztyhj/uwWAgHnL/JxuGRfgNd6S+8TCf
 d2LLb0TNfZGLpPAYP127y3rRfIdgkHYXwF7N98ewrrKIy2efpYVJY1ee0
 89D7/2BA8z34K2LWig7lfgzXemQ6oN3IK4YCYlZX7AWbVvDNfTz9sm6Mc
 PcgLzr6F41oH0rBavGMKjU1NsL6ir2UX1Lxoce5g4qmLwj1Ex1ogTTj4Y
 4Hv06E71ku0VDmbyyzTjOpE4RGGIOuDw22fZ77USdnaAFMZqUJEWipkMJ
 LoRaTVajxQS8EMW8/N3pqfEre/iD2cMNbzY5YiVkyu+iLgtlRlS3079EF Q==;
X-CSE-ConnectionGUID: LK9IslxjT5q/fY4U9dkT8A==
X-CSE-MsgGUID: ERVrA7VYTjOMNhipgKfcrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63687840"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63687840"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:59:00 -0700
X-CSE-ConnectionGUID: 3h7lWdiPQwycL+c5mn70bw==
X-CSE-MsgGUID: VFmBFlyeSr+fUSWcqce0qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189469370"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:58:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 07/17] drm/xe/pf: Fix signature of internal config helpers
Date: Tue, 28 Oct 2025 18:58:21 +0100
Message-ID: <20251028175832.184534-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028175832.184534-1-michal.wajdeczko@intel.com>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
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

Both pf_get_exec_quantum() and pf_get_preempt_timeout() should
return u32 as this is a type of the underlying data.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 343ab4a32cb1..6365d5f2ae98 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1727,7 +1727,7 @@ static int pf_provision_exec_quantum(struct xe_gt *gt, unsigned int vfid,
 	return 0;
 }
 
-static int pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
+static u32 pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
 
@@ -1830,7 +1830,7 @@ static int pf_provision_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
 	return 0;
 }
 
-static int pf_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
+static u32 pf_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
 
-- 
2.47.1

