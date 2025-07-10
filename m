Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03529C83F20
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 20:35:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBF110E963;
	Thu, 10 Jul 2025 20:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fc/t8E3V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD33D10E95B
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 20:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752179725; x=1783715725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GYmKbVgeBekae0/yqrG9eDY3BpXM2bd6rKNKKDviCVE=;
 b=Fc/t8E3V5LYAs4peAp0xV+C1gw/kL+JLgckN9QcZL16K9s4YR8CD0DGt
 GMNVv8E13ThrEHf3ywwtwptsjz58oqa3aWJWasXjNSEKJ/1hW4nL2d4AC
 caE0Q85nLUmjTCfQ+dK2gGrAjteEoH4OHLe7Qa1/peL0aSu3kTeR63KT+
 l/lqwaWUWkhnmBHJBAdCrn/3FusyCUyOmRaYj2VHObERmQMM1sFdK/77t
 V4wy9XT49XwN2zlB1zeKsOFkXJEjoelyudT2sZe5a3SR1jQ0xjPWe7NYI
 SQCIpkjABuorM6/GeCJuFwZuPscKBbiU06tQV6/+upWbmsPSNuVNBO/hS w==;
X-CSE-ConnectionGUID: 2PdtdgQSQQyiH4QYUeEgMg==
X-CSE-MsgGUID: YtKve158Rtilo/q+vs8QjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="79908481"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="79908481"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:35:25 -0700
X-CSE-ConnectionGUID: ol8LHq/0TiCZXzT6QkHxjw==
X-CSE-MsgGUID: IuumAw5LRQOCt1mRt07I6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156744260"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:35:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 6/7] drm/xe/gt: Drop third submission for default context
Date: Thu, 10 Jul 2025 13:33:51 -0700
Message-ID: <20250710-lrc-refactors-v2-6-a5e2ca03f6bd@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710-lrc-refactors-v2-0-a5e2ca03f6bd@intel.com>
References: <20250710-lrc-refactors-v2-0-a5e2ca03f6bd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-858c0
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

There's no need to submit the nop job again on the first queue. Any
state needed is already saved when the first LRC is switched out. The
comment is a little misleading regarding indirect W/A: first of all
there's still no indirect W/A enabled and secondly, even after they are,
there's no need to submit this job again for having their state
propagated: the indirect W/A will actually run on every LRC switch.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index bd50fe946e54c..2d187606d2482 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -363,14 +363,6 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 			goto put_nop_q;
 		}
 
-		/* Reload golden LRC to record the effect of any indirect W/A */
-		err = emit_nop_job(gt, q);
-		if (err) {
-			xe_gt_err(gt, "hwe %s: emit_nop_job failed (%pe) guc_id=%u\n",
-				  hwe->name, ERR_PTR(err), q->guc->id);
-			goto put_nop_q;
-		}
-
 		xe_map_memcpy_from(xe, default_lrc,
 				   &q->lrc[0]->bo->vmap,
 				   xe_lrc_pphwsp_offset(q->lrc[0]),

-- 
2.49.0

