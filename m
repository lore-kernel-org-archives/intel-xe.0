Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B13CD6AAFD
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 19:18:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACCC10E550;
	Thu,  2 Apr 2026 19:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JEgzRoSN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80FC10E533
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 19:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775157490; x=1806693490;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wq9vIEMp1T1AKLpEF9Yj2ZTv7gDz9KaEVvhVTUWLOqc=;
 b=JEgzRoSN18ko2XUMZ01TpRtF679ppVkhVeaRRcQ6uYhJ4XAlN9gP8vPB
 UFUgbNdhQ71HhJMa/EqHCU7sIEp3NFQYJQINFO7nLtMEuT/5fWZNPeh7k
 RMqtBTanilLOkPjsQDotkksrDYNGD8acUSSkY2yFurEsUIuzkvBjPoA2T
 TXcyHfZSMkZ8zdzKe6b/XpXEu3g9D6011J+cplomjL5eomuHg0LPWyEjs
 NhsgLf7B0R2mww7oRhzYasQYl4sIw1+9b93Bkt+u/H92SOSgmEBzQ2Zxv
 mejld+3YnRYCQMDagnpGYJUj886zFTK92QGKGEA3SZukY9rV9v6fjjZhO w==;
X-CSE-ConnectionGUID: A3oZLsP5Shi182gMuxFZlg==
X-CSE-MsgGUID: rPWBqanFTBC5lDTWPaohVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76241087"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76241087"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:10 -0700
X-CSE-ConnectionGUID: 5xOkuNZnQnSsX8+NkTOqfw==
X-CSE-MsgGUID: 3jA+ZMUrSGiuqHCe/o7Jmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="222212951"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:08 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 02/13] drm/xe/pf: Fix pf_get_sched_priority() function
 signature
Date: Thu,  2 Apr 2026 21:17:15 +0200
Message-ID: <20260402191726.4932-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402191726.4932-1-michal.wajdeczko@intel.com>
References: <20260402191726.4932-1-michal.wajdeczko@intel.com>
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

The pf_get_sched_priority() function returns scheduling priority
that we defined as u32 so while it works we shouldn't return int.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
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

