Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0415C61DE4
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 03:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA5210E372;
	Tue,  1 Sep 2026 03:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YC1CWZqr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6017710E372
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 03:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788233530; x=1819769530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EG7MnfTLdxLeOKYIVnkrgU6zGF+VwXWONTK8wdbYWKU=;
 b=YC1CWZqr7Sga4sktaGwiseurq/4kPUTcX24QxIlPBPAxrZqo1YRjJ/kq
 etnubBudDQdKFHLiY7OZaqGNc1D9aUnAGowCyvQ7/yt5BZVKRL/wcltvP
 RmWsBGm9FlZ0biv6c1/via/KSJun6ANRbljcubBQE9So1jBKwfNEutbTt
 4hMS0nbxNhob4ZH8Fqmjb4TANTa/QQpQjFrDfa8Q8CzQ+5J0zEBdecthC
 xMIr+mOaKxjexOaf/gFFlK7VJFDCIEAWndeEw/04CIyIwSWA+5vF27sjc
 I3Elh0ZG4y2MHNPPmFu3D2755wR6gnk6ElcVXdHoj3JAbHIF72m4s6SRw g==;
X-CSE-ConnectionGUID: kCjbUfanQFKtMQbcAdCALg==
X-CSE-MsgGUID: npyyCJpnS6K5b+nB86TctA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="99249706"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="99249706"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 20:32:10 -0700
X-CSE-ConnectionGUID: 1FI7gDOxQc2r4cxOvHaGwQ==
X-CSE-MsgGUID: Phu/lA9qS8Gq02GeMsyyPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="264685142"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa006.fm.intel.com with ESMTP; 31 Aug 2026 20:32:08 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, Sashiko <sashiko-bot@kernel.org>,
 stable@vger.kernel.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 1/2] drm/xe/shrinker: Do not abort the walk on unshrinkable
 bos
Date: Tue,  1 Sep 2026 03:31:52 +0000
Message-Id: <20260901033153.219481-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260901033153.219481-1-shuicheng.lin@intel.com>
References: <20260901033153.219481-1-shuicheng.lin@intel.com>
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

xe_bo_shrink() returns -EBUSY for a bo that is simply not a candidate:
a kernel bo, a non-purgeable bo during the purge pass, or one that is
not eviction valuable.  ttm_bo_shrink_suitable() does not filter those
out, so __xe_shrinker_walk() ends the walk at the first one it meets and
returns the error in place of the pages it had already freed.

xe_shrinker_walk() re-enters the walk for each escalation level, so the
remaining bos are usually still reached and the effect is repeated
restarts rather than lost reclaim.

Skip the bo on -EBUSY and keep walking, and on a real error report what
was already freed rather than dropping it.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_shrinker.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 83374cd57660..953a911b51b3 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -79,8 +79,10 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
 				continue;
 
 			lret = xe_bo_shrink(ctx, ttm_bo, flags, scanned);
+			if (lret == -EBUSY)
+				continue;
 			if (lret < 0)
-				return lret;
+				return freed ? freed : lret;
 
 			freed += lret;
 			if (*scanned >= to_scan)
-- 
2.43.0

