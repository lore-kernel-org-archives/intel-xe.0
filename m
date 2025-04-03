Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FC0C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 09:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADB710E980;
	Thu,  3 Apr 2025 09:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y4yXxpRz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E803010E97F
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 09:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743673323; x=1775209323;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G7CdqPNidnNA7Cz8X2+KVwxLZgyM60jdm/YjDjlT7po=;
 b=Y4yXxpRza3yI+dHois4XsYkibv90KuCpaH1yIPFzCLqhRPR78QjJEO8E
 mZ/IGDBknW8umqdun90IG6rXQofOjk5mHlYZsCNQ9NDlYHTD6Vg8BEcvP
 YRk//4nwf67VI/iEbSBtxq782b+8sLH9ipGLn3B8saQ4yJ0YmcEqerqvt
 6vBam6jmjbza3F9qHf66Q8H5iF+rnkgNQ6BfVg8MxKG174RK7knBCG257
 qIqB2nOznc/qus4QNlipMJNHY8s9rHHq96imoNbIylosAe4zImS84Ialh
 VowX3zCU+ZR3RGMRsHYy4pBlrkns7MFvOB6KYRJEGKVBnq7PmHC9UwEbi Q==;
X-CSE-ConnectionGUID: ipqKft8gTPGUBewF1apWng==
X-CSE-MsgGUID: Ja2i641gQ/mDreAJIAawAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44955487"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="44955487"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 02:42:03 -0700
X-CSE-ConnectionGUID: P/3zns4DReqJwLvp2VUFyg==
X-CSE-MsgGUID: Vr6nxuccSaidmSWIKX8v2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="131938100"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 02:42:02 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	lukasz.laguna@intel.com
Subject: [PATCH 2/2] drm/xe/vf: Don't update GuC reset policy when changing
 wedged mode
Date: Thu,  3 Apr 2025 11:41:41 +0200
Message-Id: <20250403094141.25941-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250403094141.25941-1-lukasz.laguna@intel.com>
References: <20250403094141.25941-1-lukasz.laguna@intel.com>
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

Prevent the VF from attempting to update the GuC reset policy when
changing the wedged mode, as this operation is not supported for VFs.

Log a message to indicate that GuC may still cause engine reset even
with wedged_mode=2.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d0503959a8ed..062668d02365 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -171,6 +171,11 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 
 	xe->wedged.mode = wedged_mode;
 
+	if (IS_SRIOV_VF(xe)) {
+		drm_info_once(&xe->drm, "VF can't change GuC's engine reset policy. GuC may still cause engine reset even with wedged_mode=2\n");
+		return size;
+	}
+
 	xe_pm_runtime_get(xe);
 	for_each_gt(gt, xe, id) {
 		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
-- 
2.40.0

