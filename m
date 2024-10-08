Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382BDCEF14D
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 10:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F355D10E4BE;
	Tue,  8 Oct 2024 10:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GCW2Ka5k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444C210E4BD
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 10:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728384494; x=1759920494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=drOceWFlIeSlqvExwUgmWr6ndEEacS2N2RNoe+utMds=;
 b=GCW2Ka5kLE7MB2wY1VAITLgx3uFxhe4gkIjY4Zvf6XmvmOLw2ugLJO7K
 8vRt847JJ00bMdqytzyTZM4MXeDqsvT/NMEQ6fKv0GE45Kwpw64qhJrlG
 bD6wXgEtLZqcq57AaadXQHU8yHG1z8ZlrLm6W3l//G1XXUHgMhDDntst6
 MEWP1c6sS/GCXHBaZlwx+TfCXpTeI6NOGD7AV2YVo7N78xZflM4WgwY5q
 /N/dRGc8MWbeSLb1hnIBKADpvjH4wgN6D9a0/WtKIDvQY0rU80x93attp
 sdxbg6V1G4KnlpBaUIG3YHwtPWAX9mzU1jpbBUxPiaNbeQmqL4yZJtRju Q==;
X-CSE-ConnectionGUID: xfPfpPgBQ9SCYxzO8bC0uw==
X-CSE-MsgGUID: K+w/xn6HRuWu2Co8cqhpqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27024540"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="27024540"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 03:48:09 -0700
X-CSE-ConnectionGUID: zxypt+52T02iC6pesZRjOg==
X-CSE-MsgGUID: +KJ8ox6pRYq3JKiuQvvWhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="79785656"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.62])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 03:48:08 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 2/2] drm/xe: fix unbalanced rpm put() with declare_wedged()
Date: Tue,  8 Oct 2024 11:47:25 +0100
Message-ID: <20241008104723.98300-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241008104723.98300-3-matthew.auld@intel.com>
References: <20241008104723.98300-3-matthew.auld@intel.com>
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

Technically the or_reset() means we call the action on failure, however
that would lead to unbalanced rpm put(). Move the get() earlier to fix
this. It should be extremely unlikely to ever trigger this in practice.

Fixes: 452bca0edbd0 ("drm/xe: Don't suspend device upon wedge")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cd241a8e1838..962751c966d1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1016,13 +1016,13 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		return;
 	}
 
+	xe_pm_runtime_get_noresume(xe);
+
 	if (drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe)) {
 		drm_err(&xe->drm, "Failed to register xe_device_wedged_fini clean-up. Although device is wedged.\n");
 		return;
 	}
 
-	xe_pm_runtime_get_noresume(xe);
-
 	if (!atomic_xchg(&xe->wedged.flag, 1)) {
 		xe->needs_flr_on_fini = true;
 		drm_err(&xe->drm,
-- 
2.46.2

