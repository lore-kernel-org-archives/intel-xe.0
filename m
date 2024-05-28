Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6596C25B7C
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 20:48:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0DF10E290;
	Tue, 28 May 2024 20:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VeC1WkvW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFDA10E290
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 20:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716929335; x=1748465335;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3UCqJNTO8qXvRcdlUA28a6skIT/hTyg5TNxhdtTtL2A=;
 b=VeC1WkvWYehgsUXI5RP96VaqSnS30VQzFLjlPj2oQ031DG04rsqjsxyx
 Z1UTuK7kqk2Ylbk74hqcdU+g9EgSi73eGJecueTXLdUNf3jAm/oVpUc3d
 hRwT4TSBp7VYQ5IsCftXAaOAY8lN7zd8olNZzvwOsL27vrHMWkoSMFWLo
 9pruH0iYPCea5vkZzBXLyjfPJCuuwPg0zpCLOUKIsPeXJ7R9HFpYtU7HE
 DUCeu9zVi9lr+ccH7CnYUpm19iMT6TYtD5LoSqJDUAZ5HkX57SF4n0h6b
 5THB17Ix3QMtP1GYi3maQSsBdgHhgiCPSQkmM+7F3C0zaEWBxN6mGCqSz g==;
X-CSE-ConnectionGUID: PETaRD2JQIOk5vsTzsy7/A==
X-CSE-MsgGUID: 7w22+IuRSE+mEhaenLHT+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13151962"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="13151962"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 13:48:54 -0700
X-CSE-ConnectionGUID: RPfRmbi3QOmYUYURZMSH1Q==
X-CSE-MsgGUID: 9jA3oVgTTjCCQyXX8plmwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="66383228"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 13:48:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH] drm/xe/vf: Postpone GT topology initialization if VF
Date: Tue, 28 May 2024 22:48:37 +0200
Message-Id: <20240528204837.1196-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

We can't properly initialize GT topology without knowing the
values of the fuse registers. However, VF drivers will learn
those values only after establishing communication with the
GuC and the PF. While we need GT topology to correctly setup
MCR, which is required to program HW PAT table, both steps are
only applicable to the PF driver. For VF driver case, we can
postpone all these steps after xe_uc_init_hwconfig().

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 34c1896807e9..354f83677cc6 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -496,15 +496,23 @@ static int all_fw_domain_init(struct xe_gt *gt)
  */
 int xe_gt_init_hwconfig(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto out;
 
-	xe_gt_topology_init(gt);
-	xe_gt_mcr_init(gt);
-	xe_pat_init(gt);
+	if (!IS_SRIOV_VF(xe)) {
+		/*
+		 * Only native (or PF) driver need to initialize the HW PAT
+		 * table, and thus initialize GT topology and MCR, prior to
+		 * making any allocations required for GuC loading.
+		 */
+		xe_gt_topology_init(gt);
+		xe_gt_mcr_init(gt);
+		xe_pat_init(gt);
+	}
 
 	err = xe_uc_init(&gt->uc);
 	if (err)
@@ -514,6 +522,19 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 	if (err)
 		goto out_fw;
 
+	if (IS_SRIOV_VF(xe)) {
+		/*
+		 * By now VFs should have obtained the values of the fuse
+		 * registers from the PF and can continue with GT topology
+		 * initialization skipped above.
+		 *
+		 * Keep no-op MCR/PAT initializations for reference only.
+		 */
+		xe_gt_topology_init(gt);
+		xe_gt_mcr_init(gt);
+		xe_pat_init(gt);
+	}
+
 out_fw:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 out:
-- 
2.43.0

