Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99BDCCF9FA
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 22:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6529A10EA62;
	Thu, 30 Oct 2025 22:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHbfMzrI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9C810EA62
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 22:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761863058; x=1793399058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nBH4GD2kAECWQpsDcL3eSAQkAZ+DQI6hnxIC38MCPyg=;
 b=IHbfMzrIgH+h/Qduf62/Lm0cRK+wy/lioW6SPi6RnV9URXQ3D9oxfidA
 MqNIOk/4LZKUttv9NHwdllI5xIQ4YuttWiIIO593PlYawo7JqUJnTbTUg
 RjUlmdnFWbyi90iIQSv5Ma7RJgKy4mgAE4qfdbVD6A2g2PKV2PJAa5x4u
 tee1c/vMMErt8oX6CpfsXzcOYWrkEpuChN9zY2NLtrN0iykQIn0tKaGjb
 Hk2j4DsXyNqioSC7+qJNkNw9AQe4l7lP7e5zQjb1f9NytT5pn5enDpwAI
 knecbITP3BWzK7sEy/TJySaT8NVXi/L5OoAEI1TGDWtbTV5PjuS9BRHBJ Q==;
X-CSE-ConnectionGUID: PJEU2ca9RZmAfTX6qyt3Rg==
X-CSE-MsgGUID: +iih1GHlTgabfu6fYeR1oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64059947"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64059947"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:24:18 -0700
X-CSE-ConnectionGUID: nF0DHM93R2+uO73KtdSUtA==
X-CSE-MsgGUID: e/NHyv1YQyKoLDMpyWT4Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185346441"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 15:24:17 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 06/17] drm/xe/pf: Relax report helper to accept PF in bulk
 configs
Date: Thu, 30 Oct 2025 23:23:37 +0100
Message-ID: <20251030222348.186658-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030222348.186658-1-michal.wajdeczko@intel.com>
References: <20251030222348.186658-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index ce733bde43e3..169f975ade56 100644
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

