Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E923CCF9EB
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 17:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C585610E643;
	Tue, 28 Oct 2025 17:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="grMYBaSs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F291D10E642
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 17:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761674339; x=1793210339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yOapyiDjAXTkStKg7ra4f2cDrkihXIoD0IYrPcuOuhY=;
 b=grMYBaSsHqMOyzEiPhzhuIpX9p72UUNUPxbaXdejYNnMzSoPdPbClJd4
 w7matr2dKQzxmoaQdXVg2t4kuwaV3pqv/8nvE/OcX+GLr7a8tLiSAqLsC
 7hq6SIYiW6nvd5W1rPbaLZNshGNanimr7/LaER5TwypRc7beGX+HFcA+P
 AKddLh2RfARm3emk/tIsgmYBnsRn6eD+GesFh17yl+U1m4qznDBxI7JAu
 sl+2K5Jsuh+2APy7H2c2olNNjTxUykyjnfTMKrdWMpidYXXZDqN50ktC7
 qCQpA6qRSXA+1k9R+KgmxFxayF6CMJ4QfNhc3kq1qZKxU3Y0YtTPmXxiy w==;
X-CSE-ConnectionGUID: EGjW3HpWSIestvc0NBdOyA==
X-CSE-MsgGUID: iAJCA/KNSequ3ceojKZ3IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63687836"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63687836"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:58:58 -0700
X-CSE-ConnectionGUID: 4BIHjSzXTtCyCLFsHmNYCw==
X-CSE-MsgGUID: iah7eKVWSxaPzquIdbTgaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189469363"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:58:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 06/17] drm/xe/pf: Relax report helper to accept PF in bulk
 configs
Date: Tue, 28 Oct 2025 18:58:20 +0100
Message-ID: <20251028175832.184534-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028175832.184534-1-michal.wajdeczko@intel.com>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
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
index e48457bd7d12..343ab4a32cb1 100644
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

