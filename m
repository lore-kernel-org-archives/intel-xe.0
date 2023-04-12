Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB1BC77B77
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 22:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6594410E9E5;
	Wed, 12 Apr 2023 22:52:58 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6992610E9D7
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 22:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681339976; x=1712875976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oZIsaK1lRjxXAkHvAoppgf7m2ZYFgad3tGT7jqKSawI=;
 b=aUhXnglebRCxLkyAAk/eB8dUVp00ZXnMIX4oUnMv/nM6Y6MJ+dPlCrlb
 LdOzl8VmZIjReqVBZ4sRM21roE5EntleY+zquM4KW/mEM1nuKdzPHDjyn
 FryGuax4diqPA3SAfLdCuqkg8Z68EclYVt3YaxnXKyFqFjmEGW8c4uNqv
 UHJ9QvG1mjrbeZeEMMqpUldTH6N/Gz1F2IULJgt8rVuDpe0smHEjvvTMg
 ElSSIJ9AVdaSPBlh5xjTzE+AkFc9d5avdZ3Ng0bJNnuQJM0S0WHL36aNt
 sz6b2z63IDlgU0xO9rFeW5yocG6JPgiZaHhUxFeBdXGpIEf3CRbSAKrSw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="344038896"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="344038896"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 15:52:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="721757089"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="721757089"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 15:52:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 15:52:46 -0700
Message-Id: <20230412225248.3229571-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412225248.3229571-1-matthew.d.roper@intel.com>
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 6/8] drm/xe: Include GT ID in error message if
 TLB invalidation times out
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This will hopefully help debug TLB invalidation problems.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index f279e21300aa..796403b82531 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -285,8 +285,8 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
 				 tlb_invalidation_seqno_past(gt, seqno),
 				 TLB_TIMEOUT);
 	if (!ret) {
-		drm_err(&xe->drm, "TLB invalidation time'd out, seqno=%d, recv=%d\n",
-			seqno, gt->tlb_invalidation.seqno_recv);
+		drm_err(&xe->drm, "TLB invalidation time'd out on GT%d, seqno=%d, recv=%d\n",
+			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
 		return -ETIME;
 	}
 
-- 
2.39.2

