Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A634C531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 11:49:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B0F10F389;
	Fri, 24 Jul 2026 11:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eOxvr3RI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87CF10F389
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 11:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784893792; x=1816429792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IR2JyHzpEmWuV0eb5SerFxF420nxM2YbTN9+5V/BMuo=;
 b=eOxvr3RIdeHbb80/7Utm/XOaQHEwFmHB4QhMVCmxdW1tHFaWZ4U9hIlT
 tadBYDMq6TP5PW26aGOfxs9K6auK80l/INBr9tnUbabOYOEwzktoO8T64
 NUD193o0QcTZfjE4nQg28Li+TNLHFD1H+oUhqziOn41Tm05yDJn74l7Db
 HfnVWTfgWa10VmFWr4bB2QGXKrEmQSnNEyflXSXyfSMXPXjlN2B2lWCOh
 /sv7lwTmW6wxgltZwh3tdYkN6dkJi51iJPjNLQh+XpFC6etEKZ6fPGVtX
 ioCsu3jUqjaymDzZPKaLOBU96SBM3SYe6HAv1xn/otVwax/KCiXe6OJ8/ Q==;
X-CSE-ConnectionGUID: ovFqnNGHR6WBrvz9Dltd/A==
X-CSE-MsgGUID: Z9jx56zzQ126zisfoHNTZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89385155"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="89385155"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 04:49:52 -0700
X-CSE-ConnectionGUID: fJeT59iySM6GLzy08IRPTQ==
X-CSE-MsgGUID: 55ThJZbaT9OaAnn6ts8baQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="296909372"
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by orviesa001.jf.intel.com with ESMTP; 24 Jul 2026 04:49:50 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 3/4] drm/xe/pf: Allow valid doorbell configuration during
 VF provision
Date: Fri, 24 Jul 2026 11:49:38 +0000
Message-ID: <20260724114939.1560743-9-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724114939.1560743-6-satyanarayana.k.v.p@intel.com>
References: <20260724114939.1560743-6-satyanarayana.k.v.p@intel.com>
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

VF doorbell provisioning must stay within the valid range accepted by the
VF configuration query path.

Fixes: ac6598aed1b3 ("drm/xe/pf: Add support to configure SR-IOV VFs")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V2 -> V3:
- New commit.
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 2c9b85b84b1b..be67731c66e0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1263,7 +1263,7 @@ static int pf_provision_vf_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_dbs)
 
 	xe_gt_assert(gt, vfid);
 
-	if (num_dbs > GUC_NUM_DOORBELLS)
+	if (num_dbs >= GUC_NUM_DOORBELLS)
 		return -EINVAL;
 
 	if (config->num_dbs) {
-- 
2.43.0

