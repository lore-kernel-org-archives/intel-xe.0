Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73E9D2AB3B
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 12:43:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E12E10E64A;
	Tue, 29 Oct 2024 12:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IeLNbxGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D6610E262
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 12:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730205805; x=1761741805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gV9o3ws1GAPBIVjNBH7xu5paAV+0ZjKwc3K4H1broVI=;
 b=IeLNbxGPp1hTtXT5ibxDILHhsk48rz4mS7oXd0HdyvEd2ddQKeKF5Bzq
 fmBCy9Nzj4LB21uWVg6049DUA38QfR4CqX1VXVf2totegBcgDcQNMWGrY
 tCBxkruQ3I/d2+qma67IaR+KWHdWEZRnKVMlStfw1u4HwNZAdPImsjtxH
 OU8x8qyB+NhgWbI7SK7CVohvffrxVdeGwFDxYeChaQOOBmPFQ53nwy/4s
 e3P+TM2DsQYt4QjRL8iQPw3hGe1muSFyTzHyrx9aHJFiqqrFXqXFK+EOi
 TbVHH1FmfevlESbCuZFPdbxMB/KkPLRTuGxwIqUrzdwm5i1llmP9wHEQN Q==;
X-CSE-ConnectionGUID: K42DBmugTZW+5WXv9st4tg==
X-CSE-MsgGUID: IDpiudEtSFWwJYaZgmkP2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="29950453"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="29950453"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 05:43:25 -0700
X-CSE-ConnectionGUID: 4dxTVPNcRyWhXS4fi+zZTA==
X-CSE-MsgGUID: IJkkdzU1SJigOA3VbX96QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="82021961"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 05:43:23 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org
Subject: [PATCH v5 3/3] drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
Date: Tue, 29 Oct 2024 13:01:17 +0100
Message-ID: <20241029120117.449694-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241029120117.449694-1-nirmoy.das@intel.com>
References: <20241029120117.449694-1-nirmoy.das@intel.com>
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

Flush the g2h worker explicitly if TLB timeout happens which is
observed on LNL and that points to the recent scheduling issue with
E-cores on LNL.

This is similar to the recent fix:
commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
response timeout") and should be removed once there is E core
scheduling fix.

v2: Add platform check(Himal)
v3: Remove gfx platform check as the issue related to cpu
    platform(John)
    Use the common WA macro(John) and print when the flush
    resolves timeout(Matt B)
v4: Remove the resolves log and do the flush before taking
    pending_lock(Matt A)

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: <stable@vger.kernel.org> # v6.11+
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2687
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 773de1f08db9..3cb228c773cd 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -72,6 +72,8 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_gt_tlb_invalidation_fence *fence, *next;
 
+	LNL_FLUSH_WORK(&gt->uc.guc.ct.g2h_worker);
+
 	spin_lock_irq(&gt->tlb_invalidation.pending_lock);
 	list_for_each_entry_safe(fence, next,
 				 &gt->tlb_invalidation.pending_fences, link) {
-- 
2.46.0

