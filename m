Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6644CCED62A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 08:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F45410E68F;
	Wed,  9 Oct 2024 08:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W8NjQQ3s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1307D10E68F
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 08:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728463713; x=1759999713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5Gdgh7vBEERMt8KzzoYjducWxhHbCJgRD2ZA7LX4XZc=;
 b=W8NjQQ3sN+fR7unQ7k+7ymuti0yPozBhu5tvEN1UfReIuTtOXY1rqran
 6s+0psxYUcHQKwiX6RBFrQohVXIZDKTT17L2pYVe9bN/Jh2to+xhHLUW+
 HANpm5xnXv3f70w1O7JxwZthlwIo1FSKU+wMfr1pJVi4IsNj6gS//GYlA
 eDEO0aRhkXgMW0ZARVmCtupMhuT7Lf80S6fs6MwaTeKEEy6kp+Zg8ZJuP
 mtMKPollJh3aMQklV+C10oivRD1YSCHYHsUs6dzLIQfGQ8RdZJKO1teme
 DE/b++JwMyr2tuF0bwjPf7WkJAtVYHh2oZvMu/jlaTRYfp76rUXCy9Q6I w==;
X-CSE-ConnectionGUID: sGAmKQSRT7it4l4bTPJXLQ==
X-CSE-MsgGUID: 3MhsyA8ZQeKLjW0uEmbq6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27198443"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="27198443"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 01:48:33 -0700
X-CSE-ConnectionGUID: 8p/lRzGNQAeWItz3t3qpDw==
X-CSE-MsgGUID: Yqlaz71KSjWHIJcut9ucQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="76191861"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.37])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 01:48:31 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v2 2/2] drm/xe: fix unbalanced rpm put() with declare_wedged()
Date: Wed,  9 Oct 2024 09:48:10 +0100
Message-ID: <20241009084808.204432-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241009084808.204432-3-matthew.auld@intel.com>
References: <20241009084808.204432-3-matthew.auld@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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

