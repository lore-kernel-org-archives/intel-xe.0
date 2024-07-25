Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595C0C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 23:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F0410E075;
	Thu, 25 Jul 2024 23:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6tsQs/2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E0810E075
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 23:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721949435; x=1753485435;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vommkjyKWEHbOpXJqo30vBSn9JnHICz+Q7qAJagarPI=;
 b=b6tsQs/2nBEF2Rxy9RT6+ST6UI+ctjfyRVbCwyiSz5EPnbeFJHn1Z+DO
 KpNOOiII2qbvez/1gDBZrpZGWs7BJ2lgBoYpZ1ssLKhgO47qpDmNXNJ/8
 2ownnCc/C5eXkXnpTD6fXN+1vd+jhZGK8jPR43thdl1qMCDSVaYXSv8fm
 T55+N+Ibk/bSqN8Z1Q8nyi++DDMoRYKz4UUQ2Io39Ea2g95Tz4EHpNUOk
 zEMD2jhHmOhQvuV3txQOx3bckbfFGHh1rLRdx8VD5R7kV5bTR3tMyvfqK
 pjPaNo4H+o3w8Ad0A01DOHr7QgNF35kW8ZKuX4fctknO1R0hOXXtMA2v0 A==;
X-CSE-ConnectionGUID: gKpWR2TASv6cgEGKINlsdA==
X-CSE-MsgGUID: 0yW0t1hETE+ylkwp6Jywtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19859374"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="19859374"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 16:17:14 -0700
X-CSE-ConnectionGUID: +xRmnMunSMeDvu3cibDB7g==
X-CSE-MsgGUID: O7AXGp7XQT2GkKLT7x/9ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="76296462"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 16:17:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Assert G2H outstanding when releasing G2H
Date: Thu, 25 Jul 2024 16:18:01 -0700
Message-Id: <20240725231801.1958038-1-matthew.brost@intel.com>
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

Ensure we are managing G2H credits correctly. Extra important now that
this is tied to PM.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 64afc90ad2c5..beeeb120d1fc 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -516,6 +516,7 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
 	lockdep_assert_held(&ct->fast_lock);
 	xe_gt_assert(ct_to_gt(ct), ct->ctbs.g2h.info.space + g2h_len <=
 		     ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
+	xe_gt_assert(ct_to_gt(ct), ct->g2h_outstanding);
 
 	ct->ctbs.g2h.info.space += g2h_len;
 	if (!--ct->g2h_outstanding)
-- 
2.34.1

