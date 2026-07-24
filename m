Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C15C53209
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 21:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED2E10F3F1;
	Fri, 24 Jul 2026 21:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVpGnS+V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2202610E5CE
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 21:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784928301; x=1816464301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r/nEMkkDeW20RVpDdA+MKeU8DRyTcQ+e38wZmjfqOjI=;
 b=AVpGnS+VY47AEe0cXlcjwrfi6njSFzx2A8P1txnyE1Aw0rN0g86ROBVn
 a5FXdaj/qYWtW2JekM0GjXFqovVV4tmsts6BmM01Z/OYZZr9ziOzc31In
 t6wpVo73b71K0MhEZObGbMrQc6DubgrZM+n5VHrJDvo4Dn4yRfjiO5kBo
 tOu9SQ6WPu6ZP2vvXG1LtuC551AFfiWSlaWcBZ4nEXAAjddu4ADKd9Ac/
 FQPzpjCMB1vclGU/hnFuXH4ePmgftzMkDZrBdGlX007AKSRr58O1bcOF8
 XPs6eIjmNhlos8b4R70U7wqwVc349SmSMdzt68p4Az08njwqEYv5ZgKIo A==;
X-CSE-ConnectionGUID: CItTFFxgQ/2lyssv9w6yQQ==
X-CSE-MsgGUID: 5dU6T6jHSS2ZLy08Z1NHZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="84580175"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="84580175"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 14:25:00 -0700
X-CSE-ConnectionGUID: pWXXd+9mSMm9Hv2rZilkZQ==
X-CSE-MsgGUID: oQD6lnPnQ8uqD0lEOdKLbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="254886710"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 14:25:00 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 1/2] drm/xe/mcr: Take vcs1/vecs1 into account for first
 media slice
Date: Fri, 24 Jul 2026 14:24:53 -0700
Message-ID: <20260724212454.2823014-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260724212454.2823014-1-ashutosh.dixit@intel.com>
References: <20260724212454.2823014-1-ashutosh.dixit@intel.com>
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

vcs1 and vecs1 may also be present on the first media slice, so take
vcs1/vecs1 also into account when determining if the first media slice is
absent.

Bspec: 77977

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 9799ffadf85d2..9b11c2e3413b7 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -454,9 +454,10 @@ static void init_steering_oaddrm(struct xe_gt *gt)
 {
 	/*
 	 * First instance is only terminated if the entire first media slice
-	 * is absent (i.e., no VCS0 or VECS0).
+	 * is absent (i.e., no VCS0, VECS0, VCS1 or VECS1).
 	 */
-	if (gt->info.engine_mask & (XE_HW_ENGINE_VCS0 | XE_HW_ENGINE_VECS0))
+	if (gt->info.engine_mask & (XE_HW_ENGINE_VCS0 | XE_HW_ENGINE_VECS0 |
+				    XE_HW_ENGINE_VCS1 | XE_HW_ENGINE_VECS1))
 		gt->steering[OADDRM].group_target = 0;
 	else
 		gt->steering[OADDRM].group_target = 1;
-- 
2.54.0

