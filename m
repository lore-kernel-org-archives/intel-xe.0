Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4327C83F07
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 22:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B5E10E917;
	Thu,  3 Jul 2025 22:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RJrkNgpB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A750810E912
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 22:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751582488; x=1783118488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C5ltj8NdvxpbjME4F26/Uc7QbVqhNufUQUx13OrrgAU=;
 b=RJrkNgpB9PMGg52nRfEAPBn2yp+qTw6HqaMwQNr6ZQNvxI+F06apJ+lp
 jaHkGBJ9fko5yN5qaZsrQJwhKcXKK6Rpjj9MARAKbEhUfTNo3BtioJNI+
 4VnY5emhg+7zWHkMzkdrXopQmj5yZRRaRiN6XBXU3e/f1XTIB1ffOl6sB
 2SKNwDklYrvp1j3bS9SUEhk4G1F0DWLDN7Wnj5HFKcXgj+ithwH7XxOWq
 JmubBaCgZ7D7FiBGkGeGxNPCI5DnzI/cYJ/+rJM+/rMF1Tcw/kZcBHwV6
 j/8wELLf+8TYw83KMfSvA68Lnhu/qCasmRfdvdFjeD3enVw8VSyulNRbx A==;
X-CSE-ConnectionGUID: iDwjli2HRamvZoMW2hgMQg==
X-CSE-MsgGUID: VJX8E7SESAOAY20K9YqjIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76468788"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="76468788"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 15:41:27 -0700
X-CSE-ConnectionGUID: G+ixjVPHTjeo8h729odHOw==
X-CSE-MsgGUID: kQQUsDRFQxqblNTXgybGAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="159048809"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 15:41:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 6/7] drm/xe/gt: Drop third submission for default context
Date: Thu,  3 Jul 2025 15:41:15 -0700
Message-ID: <20250703-lrc-refactors-v1-6-6aa22f174041@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 67425e37c2187..439e7c703ed84 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -361,14 +361,6 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
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

