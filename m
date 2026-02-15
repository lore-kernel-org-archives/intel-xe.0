Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D32E63F14
	for <intel-xe@archiver.kernel.org>; Sun, 15 Feb 2026 20:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E737210E241;
	Sun, 15 Feb 2026 20:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TgSd1nQA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC8C10E241
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Feb 2026 20:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771187627; x=1802723627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4zfpUC7HsSXhzgXwl8YdzLqGlpk1R/62DHtQuBjdxDA=;
 b=TgSd1nQAe+oaBP6zb6Ee6HK0MLyxr9od9QwWUH63a2Ad3rhP1Sr1l4CZ
 dgbwAR9p3otCm4PJ0w22P+nOk9P78j5iDOkSbHNq4dLZqDUalkl8JBb09
 MZ9HL00j/ECsd0RnjVhIwTXSJMF6wlNpqqtSDQsjduNIT2G6M04tLpbAI
 2nPSAe6ODXnXYmBAua//6UxoXC1F1HZdmuBege73frmVN0B5MROoDJFVz
 DtVqmFLPJAWq2uHZzOYrB3xh5ktFqnsOCvrB55S/2a48mMvwA7CNGGQkV
 s4+FYHkxVMyMc1DzKU654VaVM3+TQB+74Xu9GVVMY5mJ7l/owq3lB3L6U w==;
X-CSE-ConnectionGUID: W9VkVo2WS5+peq6NKH8LPA==
X-CSE-MsgGUID: jm1oM7UoRJ2BmmSg7WAGhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71996392"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="71996392"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 12:33:47 -0800
X-CSE-ConnectionGUID: 63eQGTp6QHqyvfWBDlO2Cg==
X-CSE-MsgGUID: z2mDhBlTQneGtmFuRCfrrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="251096609"
Received: from shealy-mobl3.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.64.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 12:33:46 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 6/9] drm/xe/pf: Don't check for empty config
Date: Sun, 15 Feb 2026 21:33:20 +0100
Message-ID: <20260215203323.595-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260215203323.595-1-michal.wajdeczko@intel.com>
References: <20260215203323.595-1-michal.wajdeczko@intel.com>
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

We already turn off VFs auto-provisioning once we detect manual VFs
provisioning over the debugfs, so we can skip additional check for
all VFs configs being still empty.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index e7187d03fe1b..95c8f01e0264 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -32,17 +32,6 @@ static bool pf_auto_provisioning_mode(struct xe_device *xe)
 	return xe->sriov.pf.provision.mode == XE_SRIOV_PROVISIONING_MODE_AUTO;
 }
 
-static bool pf_needs_provisioning(struct xe_gt *gt, unsigned int num_vfs)
-{
-	unsigned int n;
-
-	for (n = 1; n <= num_vfs; n++)
-		if (!xe_gt_sriov_pf_config_is_empty(gt, n))
-			return false;
-
-	return true;
-}
-
 static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
 {
 	struct xe_gt *gt;
@@ -51,8 +40,6 @@ static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
 	int err;
 
 	for_each_gt(gt, xe, id) {
-		if (!pf_needs_provisioning(gt, num_vfs))
-			return -EUCLEAN;
 		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
 		result = result ?: err;
 	}
-- 
2.47.1

