Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A3CC636CC
	for <intel-xe@archiver.kernel.org>; Thu, 16 Feb 2023 17:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D34610E149;
	Thu, 16 Feb 2023 17:46:29 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0576510E149
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Feb 2023 17:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676569586; x=1708105586;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ke1GFEh7FxliP72aDJbhBGmAgeDLuWtbyrFq76vg6Xc=;
 b=CGjh/FnobFe+77eh5CJ/qAmmumvZ9ffe9PhQRfnG+jj1IyXF65pSCZWJ
 0WvkIhkzL9fbNQ9P3R7mMidmzhkbLXU3nMQsOUuseq/2bj1cbXqnVmpCR
 97HBOCY6JO9Tb2TT17B1/sy5ruMLSqdq32kwH1LoDFMKg8gGxgJlV5qrZ
 pKYzrwsSy1DV010j456ogx58xzXCDs2UwHyrB6/PN7PBcIWVrq5d9WurW
 79te17ElleG5VVsSQbU3hv4Zd9V43kvEWatldZ6rBRNnsYLq/VvA6uk8r
 pJmizDAUgpcgRKVskE3P9lc2ZMlLYxttIHQ8u7mUlhw71rM7khJRr4CQE A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="396456620"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="396456620"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 09:46:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="672272315"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="672272315"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 09:46:24 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Feb 2023 09:46:16 -0800
Message-Id: <20230216174616.302678-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Initialize ret in mcr_lock()
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

ret is not initialized in mcr_lock() when running in platforms with
graphics IP version < 1270, this could cause drm_WARN_ON_ONCE()
to hit eventually(what just happened to me).

Fixes: 62a813fa315e ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index bb71071c3435f..7617f03408794 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -383,7 +383,7 @@ static bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
 static void mcr_lock(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int ret;
+	int ret = 0;
 
 	spin_lock(&gt->mcr_lock);
 
-- 
2.39.1

