Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E02DE9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 20:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C62310E625;
	Wed, 18 Feb 2026 20:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nVe2bqux";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A582310E625
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 20:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771448193; x=1802984193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K2MiBUf57yYxp6wjzWy5JeUmx1pyL+Eau3ol041uD+U=;
 b=nVe2bquxJ0rE5ntflOc+Vzo46X6kueIBrmDkFryZEKqeimoacmw1gm8q
 hBttKFuzPUhjlJvu9DN/hpAlD8DWzfJR24OQkn4g1gbN7Hp00W9NEycDv
 B4drcUuBRI5s0LVj0IU4M9bzlU9r7wGiuxTNoFs0NTynJ1cO4PHL3Tgfp
 s9vpn1DwtR6qqT9m8Hx6/B3eyoZATe9LIV29piZ3Fv8NOYWc3D5NzmkFy
 FE9AAW58vjEBSoR/dooUe9BaDDYWzvk9rO3IHIo4oP+S2441pkPO+v0se
 pcmscYrgpORxSjWKjDyyB/ocHzpZ/k7r8rQaHN10hoohx2rRzNKMEUwRE w==;
X-CSE-ConnectionGUID: YkmbGkUnSOChzF8TqL1ZmQ==
X-CSE-MsgGUID: 9K39NOV7QzKsVhSTt0mKcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72710601"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72710601"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 12:56:33 -0800
X-CSE-ConnectionGUID: kssRl4+7TMSiC70VYTdDcg==
X-CSE-MsgGUID: 3aRS8cHiSeilYvMdm8ek/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213548269"
Received: from unknown (HELO mwajdecz-hp.clients.intel.com) ([10.246.18.5])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 12:56:31 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 07/10] drm/xe/pf: Don't check for empty config
Date: Wed, 18 Feb 2026 21:55:49 +0100
Message-ID: <20260218205553.3561-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218205553.3561-1-michal.wajdeczko@intel.com>
References: <20260218205553.3561-1-michal.wajdeczko@intel.com>
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

We already turn off VFs auto-provisioning once we detect manual VFs
provisioning over the debugfs, so we can skip additional check for
all VFs configs being still empty.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
index f22ff65c59aa..abe3677d33ed 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
@@ -33,17 +33,6 @@ static bool pf_auto_provisioning_mode(struct xe_device *xe)
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
@@ -52,8 +41,6 @@ static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
 	int err;
 
 	for_each_gt(gt, xe, id) {
-		if (!pf_needs_provisioning(gt, num_vfs))
-			return -EUCLEAN;
 		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
 		result = result ?: err;
 	}
-- 
2.47.1

