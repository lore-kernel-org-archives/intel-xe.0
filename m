Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4D0CA0FFD
	for <intel-xe@archiver.kernel.org>; Mon,  1 Sep 2025 08:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B8D10E3AE;
	Mon,  1 Sep 2025 08:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCo75rM3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F7E10E3AE
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Sep 2025 08:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756715932; x=1788251932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JRIAqmSw+b6IVBNCwhygkbBfnOm+6XVmct7plXZqPV4=;
 b=eCo75rM3u0p0fKi2t9oDyRp1UAHscal4LkRj93SJPb61iMzY7qQGqBQq
 Eiaw1NhJO4+48njV4TeQOij7sw1luuhfAFh6SqFXevCh6wMRG7EZpjvVR
 9mgwZtMzWMUn/SJr+HhRNEDHwklCy9FocHUiMtR/E6MtXRbpfYQlvFtnI
 7XQW0UncguiW4yFHFit53eodr6gPm9HFPR1cxAgeYBplohddrLF6aGnFU
 dgiRpxJ/THXilBoPx5DZYdqdSrbWsAU4e6+kD+qrhLN/FP3dPekVimeE6
 HjeDdjM17YNmIwdy3oyrwHjHc667Q6P1gpzMc3GTVyaHL1CXy1+BSrS/l w==;
X-CSE-ConnectionGUID: m7aPvemVR6KGwFSNRDwneQ==
X-CSE-MsgGUID: cQHY4QX1R6C3lQ0iqDag0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="58899197"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="58899197"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 01:38:52 -0700
X-CSE-ConnectionGUID: 3FnZ54oFQTG5DQSoWSvtAQ==
X-CSE-MsgGUID: h1B+0p9VQj2zz+pTSR5q+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="201910250"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.171])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 01:38:50 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 2/3] drm/xe: Allow the pm notifier to continue on failure
Date: Mon,  1 Sep 2025 10:38:28 +0200
Message-ID: <20250901083829.27341-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250901083829.27341-1-thomas.hellstrom@linux.intel.com>
References: <20250901083829.27341-1-thomas.hellstrom@linux.intel.com>
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

Its actions are opportunistic anyway and will be completed
on device suspend.

Marking as a fix to simplify backporting of the fix
that follows in the series.

v2:
- Keep the runtime pm reference over suspend / hibernate and
  document why. (Matt Auld, Rodrigo Vivi):

Fixes: c6a4d46ec1d7 ("drm/xe: evict user memory in PM notifier")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: <stable@vger.kernel.org> # v6.16+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a2e85030b7f4..bee9aacd82e7 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -308,17 +308,17 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 	case PM_SUSPEND_PREPARE:
 		xe_pm_runtime_get(xe);
 		err = xe_bo_evict_all_user(xe);
-		if (err) {
+		if (err)
 			drm_dbg(&xe->drm, "Notifier evict user failed (%d)\n", err);
-			xe_pm_runtime_put(xe);
-			break;
-		}
 
 		err = xe_bo_notifier_prepare_all_pinned(xe);
-		if (err) {
+		if (err)
 			drm_dbg(&xe->drm, "Notifier prepare pin failed (%d)\n", err);
-			xe_pm_runtime_put(xe);
-		}
+		/*
+		 * Keep the runtime pm reference until post hibernation / post suspend to
+		 * avoid a runtime suspend interfering with evicted objects or backup
+		 * allocations.
+		 */
 		break;
 	case PM_POST_HIBERNATION:
 	case PM_POST_SUSPEND:
@@ -327,9 +327,6 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 		break;
 	}
 
-	if (err)
-		return NOTIFY_BAD;
-
 	return NOTIFY_DONE;
 }
 
-- 
2.50.1

