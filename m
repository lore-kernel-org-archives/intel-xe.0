Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383C6CAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 14:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB71B10E8CD;
	Thu, 18 Sep 2025 14:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmxJY3Xj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D8E10E8CD
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 14:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758205757; x=1789741757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uvBik9bUDqkzCPzyVtJCvFGftTE2VmWfpTXIdKTIwe4=;
 b=dmxJY3XjPRwVsZvaYewPm8VVqQYkkcvdhToewI/BK9hDwFtYZj8tdnB5
 avNPqF3aDLqnEjwGysB0824+yJTgvgPuL1HJN7JWiP2sUB5q+IWYE21O/
 3clTDiu1rrIpyLIq9iilXssb56zJjiwaQKld2QOll00Rif3snD5TUURAv
 1jScTJe4SWnjOQPnXd35wTay1rkPlkeUGq/ZUl5qUp/zgRLvnioK2gDJv
 3bduG0HXzpZnc4EojS8AdGHSOITFV0BzZElWVO4uZzFKPTIcbfb9DqX5T
 4Cj41PoLaOB9plqBBj5vvgJTS9rll3+Y0T+9VHiLe4AborzdZXWBN624x A==;
X-CSE-ConnectionGUID: JGpj3WkdSCKYCXu1xtsbtw==
X-CSE-MsgGUID: 9NiN51HQTdSiR99WEoGBSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60427006"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="60427006"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 07:29:17 -0700
X-CSE-ConnectionGUID: +5MP5E81RTCA/+5nMDFiMg==
X-CSE-MsgGUID: Kn5hMsVfRQWxTvZzukuotg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="212708408"
Received: from abityuts-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.244.175])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 07:29:16 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 1/2] drm/xe/pm: Hold the validation lock around evicting
 user-space bos for suspend
Date: Thu, 18 Sep 2025 16:28:47 +0200
Message-ID: <20250918142848.21807-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918142848.21807-1-thomas.hellstrom@linux.intel.com>
References: <20250918142848.21807-1-thomas.hellstrom@linux.intel.com>
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

During pm notifier eviction we may still race with validations.
Ensure those are blocked out during eviction to ensure we have
access to as much system memory as possible.

During the suspend operation itself, we run single-threaded so that
shouldn't be a problem.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 211935590e21..b1c536b39034 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -320,9 +320,15 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 	switch (action) {
 	case PM_HIBERNATION_PREPARE:
 	case PM_SUSPEND_PREPARE:
+	{
+		struct xe_validation_ctx ctx;
+
 		reinit_completion(&xe->pm_block);
 		xe_pm_runtime_get(xe);
+		(void)xe_validation_ctx_init(&ctx, &xe->val, NULL,
+					     (struct xe_val_flags) {.exclusive = true});
 		err = xe_bo_evict_all_user(xe);
+		xe_validation_ctx_fini(&ctx);
 		if (err)
 			drm_dbg(&xe->drm, "Notifier evict user failed (%d)\n", err);
 
@@ -335,6 +341,7 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 		 * allocations.
 		 */
 		break;
+	}
 	case PM_POST_HIBERNATION:
 	case PM_POST_SUSPEND:
 		complete_all(&xe->pm_block);
-- 
2.51.0

