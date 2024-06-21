Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6FEC27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 19:23:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E88F10E064;
	Fri, 21 Jun 2024 19:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jouv4nxz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DDF10E064
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jun 2024 19:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718997807; x=1750533807;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0AGyCOICIBl+mySHFGZNhnaquuQ3Y4f6KzzlLihgIGY=;
 b=jouv4nxzweLSA65oka3DIVSN6RH3ftXTNXwVQS0YPw2H5WN/zbGA7ION
 ifluN6eDc6C82TPKOMqqblrb97wZVOI62D8k0ABQ0KUkvWWe7yWc9FvyR
 uJcAplFknJuZ4rkYWFAr3mBJnQ96KSIEYTtFDQx3rZsoV7w+D9H4ZZHNK
 qFY0t1VplAfQFVSGxzqGNiZXNw1se407Y+Yhov989j2LhumVfPplnA4a9
 Lqon07PJuPz+oIOTPgwOyOOR6rq4g5HCtIVI97x+UntpLt2U8KqS6iISJ
 bKm5HigSAPmhTZMDdKZJAjQ1/GzxDC7D9XaAdHV+XUq7BF295jeObN2Pn w==;
X-CSE-ConnectionGUID: KRlivY36T4CUkj8nFHhnow==
X-CSE-MsgGUID: COX0uTt+TXKgL2kchSVLpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="19931614"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="19931614"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 12:23:26 -0700
X-CSE-ConnectionGUID: mqvdBKaIRcagmGJIfd8mrw==
X-CSE-MsgGUID: 7Vcondq7QOepPpeegUwG4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="42777462"
Received: from xpumcyp04.jf.intel.com ([10.75.202.213])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 12:23:26 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	lucas.demarchi@intel.com
Subject: [PATCH] drm/xe: Get XE_FORCEWAKE_ALL to read RING_TIMESTAMP
Date: Sat, 22 Jun 2024 03:23:25 +0800
Message-Id: <20240621192325.227230-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
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

Per client engine utilization uses RING_TIMESTAMP to return
drm-total-cycles to the user. We read only the rcs RING_TIMESTAMP in
platforms that have render. While this works for rcs and
ccs, it is observed that this value is 0 when running work on bcs, vcs
and vecs. Ideally we should read the engine specific RING_TIMESTAMP, but
to keep the logic simple, just get XE_FORCEWAKE_ALL instead of XE_GT_FW.

This should work fine on multi-gt platforms as well since the
gt_timestamp is in sync on all GTs.

Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 4a19b771e3a0..74f2244679f3 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -264,9 +264,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 		if (!hwe)
 			continue;
 
-		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+		xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 		break;
 	}
 
-- 
2.34.1

