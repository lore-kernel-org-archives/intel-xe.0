Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F84F54ACE
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 15:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6F110E71A;
	Tue, 24 Mar 2026 15:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PfbJxZax";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBEC10E71C
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 15:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774366657; x=1805902657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H6IG3eL5Nk6Nlv7izIvyI8LI+MP16ORx2hWlmIzBHEU=;
 b=PfbJxZaxkLilvGIO6+Q0/2ilJzulVsQQ6TzD+czeQvfZKhUUWKC7QiwS
 1TK+2wVZye1LwYV+6E6MNkxkeFGyNCnO59c4AUxaR/p0AiaVih11EyKLK
 v++d5fAQG5JTH7eOUtIi1jcAy1dYWwKQZcBAa908NxUHwrz8A0giJn0nM
 eES4kBGzNocgCorqsTtdodTFGzPKkVz3QyyFoUZTAX9wsllewIG64+IxE
 RCd10utFc7nh5IsTJqMMCGUzwFgkr71+vaNhxS92BfkVr/C0OIwmPm8eT
 uJJ3Ztr7LUNzwZ4maWbIqMHvQpdUdN6k2q/BEDiTSBKpiT+cj4lXtMpRS Q==;
X-CSE-ConnectionGUID: VJ3A/9qZQQW1Ig4ikYeU+Q==
X-CSE-MsgGUID: YtiMav15Q5iEk20a25BQvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75102395"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75102395"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 08:37:37 -0700
X-CSE-ConnectionGUID: Q+EnCYMsTii5CPeqwdHEvw==
X-CSE-MsgGUID: x4SZummeS6SJ8OSV8LrOzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="228863582"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 08:37:36 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 2/4] drm/xe/pxp: Remove incorrect handling of impossible
 state during suspend
Date: Tue, 24 Mar 2026 08:37:21 -0700
Message-ID: <20260324153718.3155504-8-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324153718.3155504-6-daniele.ceraolospurio@intel.com>
References: <20260324153718.3155504-6-daniele.ceraolospurio@intel.com>
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

The default case of the PXP suspend switch is incorrectly exiting
without releasing the lock. However, this case is impossible to hit
because we're switching on an enum and all the valid enum values have
their own cases. Therefore, we can just get rid of the default case
and rely on the compiler to warn us if a new enum value is added and
we forget to add it to the switch.

Fixes: 51462211f4a9 ("drm/xe/pxp: add PXP PM support")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_pxp.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index b60ea85c3e11..a054b57f5ae5 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -871,11 +871,6 @@ int xe_pxp_pm_suspend(struct xe_pxp *pxp)
 		pxp->key_instance++;
 		needs_queue_inval = true;
 		break;
-	default:
-		drm_err(&pxp->xe->drm, "unexpected state during PXP suspend: %u",
-			pxp->status);
-		ret = -EIO;
-		goto out;
 	}
 
 	/*
@@ -900,7 +895,6 @@ int xe_pxp_pm_suspend(struct xe_pxp *pxp)
 
 	pxp->last_suspend_key_instance = pxp->key_instance;
 
-out:
 	return ret;
 }
 
-- 
2.43.0

