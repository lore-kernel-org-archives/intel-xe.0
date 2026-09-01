Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F26C624D3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 17:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657B310EDFF;
	Tue,  1 Sep 2026 17:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="narG8EpD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AA810EDFF
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 17:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788283876; x=1819819876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aQPtZU5dKlQ1c0+bGOkaAo7lRfeU+axD0xVwyFVEwdY=;
 b=narG8EpDl9JFk4jPRJ+v6AEGiZ3bt2q7LoYYZhKfAFy8+gqmNzDpoqVB
 //TClQqtGpEp7Llh9+v42XYS/f77MBnxY2Ep5tjCGFJfHTG9opyqsvhkg
 NouUw7pwHc41tr0WvwZV35hE/t8xmwPcErVvjgJpKc7OSxbn3b5JKE0dg
 mICEPrgptYywfZnPZa71rY7MRsQCS5MKMbk6zPH0b/CsjCVHdcrWnv0eg
 rGX5Phr7aKaDfw7D0oPR00uGJAyC9kMwvedYMybbk7xf70fu4iBc4QJL8
 BZM7+o8Q/c9mlIPqfewzeAp88Mgs47BZwei+E033Z8FjtZKmDcmOEKs9R A==;
X-CSE-ConnectionGUID: ZbMZebv/SiCHmdPKqCFSJA==
X-CSE-MsgGUID: aewgAOo5QjujezzsNokmPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="87862141"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="87862141"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 10:31:16 -0700
X-CSE-ConnectionGUID: EJ61YDQpRC6ovlLTPP0XqQ==
X-CSE-MsgGUID: Hb3liPyjTAyA/scIWCdtZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="269750053"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa009.jf.intel.com with ESMTP; 01 Sep 2026 10:31:15 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, Sashiko <sashiko-bot@kernel.org>,
 stable@vger.kernel.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v5 1/2] drm/xe/shrinker: Do not discard freed pages on error
Date: Tue,  1 Sep 2026 17:30:58 +0000
Message-Id: <20260901173059.455469-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260901173059.455469-1-shuicheng.lin@intel.com>
References: <20260901173059.455469-1-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

__xe_shrinker_walk() and xe_shrinker_walk() both return the error in
place of the pages they have already freed.  xe_shrinker_scan() only
accumulates non-negative returns, so those pages are never reported,
while *scanned is updated by pointer and does count them.  The shrinker
then tells mm that it scanned without freeing, which skews the reclaim
accounting away from it.

Report what was freed when there is something to report, and the error
only when there is not.

v2: drop EBUSY check and add more return check. (Sashiko)

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
Assisted-by: Claude:claude-opus-5
Cc: stable@vger.kernel.org
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_shrinker.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 83374cd57660..7f40153911ff 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -80,7 +80,7 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
 
 			lret = xe_bo_shrink(ctx, ttm_bo, flags, scanned);
 			if (lret < 0)
-				return lret;
+				return freed ? freed : lret;
 
 			freed += lret;
 			if (*scanned >= to_scan)
@@ -119,7 +119,7 @@ static s64 xe_shrinker_walk(struct xe_device *xe,
 	if (!ctx->no_wait_gpu) {
 		lret = __xe_shrinker_walk(xe, ctx, save_flags, to_scan, scanned);
 		if (lret < 0)
-			return lret;
+			return freed ? freed : lret;
 		freed += lret;
 		if (*scanned >= to_scan)
 			return freed;
@@ -128,7 +128,7 @@ static s64 xe_shrinker_walk(struct xe_device *xe,
 	if (flags.writeback) {
 		lret = __xe_shrinker_walk(xe, ctx, flags, to_scan, scanned);
 		if (lret < 0)
-			return lret;
+			return freed ? freed : lret;
 		freed += lret;
 	}
 
-- 
2.43.0

