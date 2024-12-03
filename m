Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECD2E6C5E4
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 00:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E7210E31F;
	Tue,  3 Dec 2024 00:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jR+17XcW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7602510E31F
 for <Intel-Xe@lists.freedesktop.org>; Tue,  3 Dec 2024 00:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733187594; x=1764723594;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hwy19WFOYtLAUmeJw6/8fRZMemQN43sh2Zl5Pl0nPH4=;
 b=jR+17XcWayfipBBJMERAb98CBTUPTfWcje/KXn55QtriUduyKYFjm0bz
 nwjP/miAlpljfwztpjEeC+wbeB6OZtjYE+kegXw829aeqo1nIEQjeBYap
 Qp6+721pcjK4RJU7bROk5IMMDuzFqWxHTqYBoMycJ6s/Kt+eOdyaGdzoB
 o3fVh6oWrkvBH3UZL7eowb1OlRurgLbXPnJirUPFPzd1sgoLsPlKtqknJ
 k/XT6DgCakj4+uA1PGzfMlnJgKE5+7fvKjfxLpeWvY3hrvrvOknVE5Cvn
 Ei5OEwyYipofJraC3K/fyAVrTNuAxBjyo37G94CvrO9omDzwuXy+seM3J w==;
X-CSE-ConnectionGUID: 6IZoFyCfQgeXZ5ft7c7R0A==
X-CSE-MsgGUID: UulbSB0LT7qyg2GFLluJDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33300903"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="33300903"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 16:59:51 -0800
X-CSE-ConnectionGUID: 9T27Z8ZES9+nVRN2hUJkZw==
X-CSE-MsgGUID: RuwRCN8VSKydwbeNuvI6bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="94102965"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 02 Dec 2024 16:59:50 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/guc: Fix for dead CT dump not re-arming
Date: Mon,  2 Dec 2024 16:59:49 -0800
Message-ID: <20241203005949.3947920-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

The state dump on a dead CT incident deliberately disarms itself after
running. This is to prevent a long stream of errors causing continuous
dumps. It was supposed to re-arm itself after a reset, however that
was not happening. The re-arm flag was being set but the worker was
not being run to process that flag. So fix that.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 7eb175a0b874..7d33f3a11e61 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -470,8 +470,10 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	 * after any existing dead state has been dumped.
 	 */
 	spin_lock_irq(&ct->dead.lock);
-	if (ct->dead.reason)
+	if (ct->dead.reason) {
 		ct->dead.reason |= (1 << CT_DEAD_STATE_REARM);
+		queue_work(system_unbound_wq, &ct->dead.worker);
+	}
 	spin_unlock_irq(&ct->dead.lock);
 #endif
 
-- 
2.47.0

