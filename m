Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8323C282D3
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 17:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A4E10E4BF;
	Mon,  3 Mar 2025 17:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRmdMmsT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7563310E4BE
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 17:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741023342; x=1772559342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8WM+Fqd8R+XbgrBH8xoqj/RLXXgTW+K6TuVgoao5Gb4=;
 b=cRmdMmsTWMZGeOdp12/ucbK+ggMxDkei65iYQY4EK4FbJZYxJgRsNDMG
 1mVTqZkb6TD2xCPnnbfUWgfCXzOkfTHGMwQ3GGGQe7PdBuNLYKx3XEomq
 AHuEjsfzBOXUXhYSAirdimGrOvmSiot8zPSs0niAzTTBER81Tpes65Kq7
 91QXrHNaWkgicPEosPyzJ0NS/DylGjwg3T3jNLIs+ieQ/khrt4p/RwOiO
 wfq6gkjsbdL1vOSnpu3un2HU7Aoglxzkcjkmda7Qn2FWSeGrsB3P8+Ens
 YyAWLkLKj6QLqseQgMwwIuqnjGvlxzHJqCWTQD8JCD0nxyJPxs0AKNmvh g==;
X-CSE-ConnectionGUID: qO2f7byLSYu4UnwjsSmLyA==
X-CSE-MsgGUID: TSgJkPCfS3qbWmyhgpofzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41937523"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41937523"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:35:42 -0800
X-CSE-ConnectionGUID: tu9LIVyTQxiwOaJUHAMoxw==
X-CSE-MsgGUID: t5NTXcGYRf2HD4tH3ui4Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="118101320"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.99.10])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:35:40 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 4/5] drm/xe/vf: Stop applying save-restore MMIOs if VF
Date: Mon,  3 Mar 2025 18:35:21 +0100
Message-Id: <20250303173522.1822-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250303173522.1822-1-michal.wajdeczko@intel.com>
References: <20250303173522.1822-1-michal.wajdeczko@intel.com>
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

Currently we are blocking processing of all save-restore rules
by the VFs inside the xe_rtp_process_to_sr() function, but we
want to unblock that to allow processing of the LRC WA rules.

To avoid hitting WARNs about reading an inaccessible registers by
the VFs, stop applying save-restore MMIOs action if VF, without
relying that SR list will be always empty for the VF.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 9475e3f74958..fc8447a838c4 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -173,6 +173,9 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 	if (xa_empty(&sr->xa))
 		return;
 
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		return;
+
 	xe_gt_dbg(gt, "Applying %s save-restore MMIOs\n", sr->name);
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-- 
2.47.1

