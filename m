Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88147D6AAFD
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 19:18:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B7510F2C4;
	Thu,  2 Apr 2026 19:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tbjuxfby";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04AE10F29F
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 19:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775157496; x=1806693496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=viWN9Uvi/H/qa6oqeSDAgkMAaI1Rc+AvVusRS0JmQIE=;
 b=TbjuxfbyXxJGxd4exW8Qnt/axJm6g9IOeRmb4khC7PANwPi3zt9mC58p
 1VYvQgLT0FOeYIMVvNk/VeXXMPDgsJHiMKQMl0wMoRvliBkHXA0uLPCd8
 8eGAp0nkOdD9YYI4NleF0oSX7/JYp3M1SYmxvk8n/H1uEiGRMcFFxIsst
 rMEU35JXOSQtyJkVoDrxNu1nzqeVkPN+6DFlJ9g2vSf+YWQlGJpDfBxOC
 OfgD04rKZXfs8KB0LmAr3iv6bW6IjYE6PcL9eqCYrsWN1HYqJZKsLIQRJ
 1eqJenc2WiJX4KXeKoyggJqdOXdXDRwfl/ncaxF4oUXE3HZtxyQR/N7ev w==;
X-CSE-ConnectionGUID: s4MzcE/STTm4UWheSD/g2g==
X-CSE-MsgGUID: uRv8Uz4nQfiEUyvg9fG7Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76241097"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76241097"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:16 -0700
X-CSE-ConnectionGUID: nyG5+xwoT3yBVNyhAHVunw==
X-CSE-MsgGUID: npgy5/yFSRaClkptCfjIcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="222213012"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:14 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 06/13] drm/xe/pf: Don't reprovision policies if already
 default
Date: Thu,  2 Apr 2026 21:17:19 +0200
Message-ID: <20260402191726.4932-7-michal.wajdeczko@intel.com>
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

There is no need to send policy updates to the GuC if policies
were not changed from the default settings (usually zero value).

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index aa80b4abd42f..0007ed7e0d38 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -177,6 +177,9 @@ static int pf_reprovision_sched_if_idle(struct xe_gt *gt)
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
+	if (!gt->sriov.pf.policy.guc.sched_if_idle)
+		return 0;
+
 	return pf_provision_sched_if_idle(gt, gt->sriov.pf.policy.guc.sched_if_idle);
 }
 
@@ -255,6 +258,9 @@ static int pf_reprovision_reset_engine(struct xe_gt *gt)
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
+	if (!gt->sriov.pf.policy.guc.reset_engine)
+		return 0;
+
 	return pf_provision_reset_engine(gt, gt->sriov.pf.policy.guc.reset_engine);
 }
 
@@ -321,6 +327,9 @@ static int pf_reprovision_sample_period(struct xe_gt *gt)
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
+	if (!gt->sriov.pf.policy.guc.sample_period)
+		return 0;
+
 	return pf_provision_sample_period(gt, gt->sriov.pf.policy.guc.sample_period);
 }
 
-- 
2.47.1

