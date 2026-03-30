Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8951061B1F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 20:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899D010E802;
	Mon, 30 Mar 2026 20:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S86QtOip";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E8310E7FE
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 20:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774903261; x=1806439261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dZ0iCAKrHCgHIlSriCF/VD7JWKsjsz14iHevVEwlfJc=;
 b=S86QtOipAfMgbK0z7sy8WWE5wUxoCdYfTxnIPUEkTRl8T86+xymwtYj2
 2quTRdGAnJqEPoXts+l8ARa9BoOhWvCBO+sC9uIhzx/BeEBR/0JhRDqdF
 erokuyJYA9CuNm+zErk+z1Q4uQM1XeeQ7iUfqj1PESjZKzSVTN0lNYdn7
 Um8rVBTxb60yi6YbjqJ4YTqS+DdpwsnGVamLpufXsbF26sWz//fgNMuBg
 /Db1KvYAqq5L1k/M56Woze+mWXF8IhBfpkmuzpQxGFygIAoGu42H8cgXr
 jHXBO8owD5D4O72APg4a5Q9NiuEsxJwbyqIjRn5bts+ouFB5hHPJNv3rN Q==;
X-CSE-ConnectionGUID: kaqTYXjHQfSy+i6RdzIUjg==
X-CSE-MsgGUID: YZ1nCVXvRqq/W9OBvbkbjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75923699"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75923699"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:41:00 -0700
X-CSE-ConnectionGUID: 4vbuZgJZR9ayXhE08ofcLA==
X-CSE-MsgGUID: 980vnnWNTlSmLT1ND/cbvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="225329359"
Received: from liyantan-mobl1.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.179])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:40:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 02/13] drm/xe/pf: Fix pf_get_sched_priority() function
 signature
Date: Mon, 30 Mar 2026 22:40:33 +0200
Message-ID: <20260330204046.567-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330204046.567-1-michal.wajdeczko@intel.com>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
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

The pf_get_sched_priority() function returns scheduling priority
that we defined as u32 so while it works we shouldn't return int.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 2f376b5fb088..658e9b048751 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -2500,7 +2500,7 @@ static int pf_provision_sched_priority(struct xe_gt *gt, unsigned int vfid, u32
 	return 0;
 }
 
-static int pf_get_sched_priority(struct xe_gt *gt, unsigned int vfid)
+static u32 pf_get_sched_priority(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
 
-- 
2.47.1

