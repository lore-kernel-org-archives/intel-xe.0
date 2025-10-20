Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD5DCCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 18:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F7310E4AF;
	Mon, 20 Oct 2025 18:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7ocf6tS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D493A10E4AF
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 18:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760984678; x=1792520678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HYRwYVKx0kW2Yl3GeTvpSYnRGLTFW0LI7bFEsQbRQyU=;
 b=i7ocf6tSzaxvPh3jmYdi97wcb1aI6Ss4vmhllGweaLFv4qIYFPO+cSRL
 +q5qy+ugkZr04KMLGKUGCajlNRXot6MrBZf2/5YxUrL3jciFa3bvRgpoB
 PnxX84M2Vw77yGHoPnxo4BycSkButHhJew6aKvGUKCkcCAhJczPJEe/zK
 MzepyqSIwAtm3RdqY/whndJfi0hwV6fZFbCCZ2bReMnPQ243gVVyDXzxh
 SAbDLoqRTwXFK9XZW8vvIg7LYhGNV76K1wbGX39b42AhAdsaAQoMLDGm/
 +N8RZEZJUvotjCWlElSy2zQCoVM4ydzMDA2VB2FF7wFimTiKXNvNymwy9 Q==;
X-CSE-ConnectionGUID: Af/TgEkvR9KjqyAH0yKJZA==
X-CSE-MsgGUID: BADXV6VVQJWgCm3dyOGWZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63013062"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63013062"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:38 -0700
X-CSE-ConnectionGUID: pqm/lsUpQPKa/Lkh0Pd6Qw==
X-CSE-MsgGUID: YPj+FvqNTWGvEZTUGRIGkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183802109"
Received: from vthervee-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.249.135])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 11:24:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 04/14] drm/xe/pf: Relax report helper to accept PF in bulk
 configs
Date: Mon, 20 Oct 2025 20:24:04 +0200
Message-ID: <20251020182414.576-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251020182414.576-1-michal.wajdeczko@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
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

Our current bulk configuration requests are only about VFs, but
we want to add new functions that will also include PF configs.
Update our bulk report helper to accept also PFID as first VFID.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index c0c0215c0703..0a591b86d94e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -924,7 +924,8 @@ static int pf_config_bulk_set_u32_done(struct xe_gt *gt, unsigned int first, uns
 				       const char *what, const char *(*unit)(u32),
 				       unsigned int last, int err)
 {
-	xe_gt_assert(gt, first);
+	char name[8];
+
 	xe_gt_assert(gt, num_vfs);
 	xe_gt_assert(gt, first <= last);
 
@@ -932,8 +933,9 @@ static int pf_config_bulk_set_u32_done(struct xe_gt *gt, unsigned int first, uns
 		return pf_config_set_u32_done(gt, first, value, get(gt, first), what, unit, err);
 
 	if (unlikely(err)) {
-		xe_gt_sriov_notice(gt, "Failed to bulk provision VF%u..VF%u with %s\n",
-				   first, first + num_vfs - 1, what);
+		xe_gt_sriov_notice(gt, "Failed to bulk provision %s..VF%u with %s\n",
+				   xe_sriov_function_name(first, name, sizeof(name)),
+				   first + num_vfs - 1, what);
 		if (last > first)
 			pf_config_bulk_set_u32_done(gt, first, last - first, value,
 						    get, what, unit, last, 0);
@@ -942,8 +944,9 @@ static int pf_config_bulk_set_u32_done(struct xe_gt *gt, unsigned int first, uns
 
 	/* pick actual value from first VF - bulk provisioning shall be equal across all VFs */
 	value = get(gt, first);
-	xe_gt_sriov_info(gt, "VF%u..VF%u provisioned with %u%s %s\n",
-			 first, first + num_vfs - 1, value, unit(value), what);
+	xe_gt_sriov_info(gt, "%s..VF%u provisioned with %u%s %s\n",
+			 xe_sriov_function_name(first, name, sizeof(name)),
+			 first + num_vfs - 1, value, unit(value), what);
 	return 0;
 }
 
-- 
2.47.1

