Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03553C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 13:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89B810E3AB;
	Wed,  1 Jul 2026 13:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NItlg5SV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D0110E3D5;
 Wed,  1 Jul 2026 13:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782914016; x=1814450016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SfyM6T6Nxe1zYL0hdVvu1uKtOhw6/wVM9KNtwpa4UjA=;
 b=NItlg5SVmPuIj9UWcCP7gDXoydEoWQfThK8NFdKpePPPk/O0Z23obb0R
 tj7Hh4/ckk3ozApqDt4oMYy6W2De/iNPLVnZpAPF1yzxCZU9xoYsOlU4Q
 Zg/5vC8WOGCPrIxgd1FJU49JoXivJwT4v0rVyXnFuZtDsPEfp3XsWd3Nm
 oQiOT8Yua4Q4OlU9JA/DaMCftNNAfcSXtieKdv9HhWdWfVJqovTy2D00M
 RhFVpWz1d84I0+SIrLtnIdamIP9WArYQU/MuLjQoPajd95LL+8h+fBqNc
 HH13Q5nydc1AYXRygsTGvhTQpDj0D6C5QXR06D0oUPABeLB0NFNRJ1z8J A==;
X-CSE-ConnectionGUID: ZS6nEcDQQQiPOvnUzXyKbQ==
X-CSE-MsgGUID: uwCmN/IOQZe2Vlqa+Db6vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83733936"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; d="scan'208";a="83733936"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 06:53:36 -0700
X-CSE-ConnectionGUID: SVSS4rGqThOEfvld293AuA==
X-CSE-MsgGUID: zb9XEiGOQ1Sa8YfRXlgMow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; d="scan'208";a="249207306"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.61])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 06:53:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 rodrigo.vivi@intel.com
Subject: [RESEND v2 6/8] drm/xe/display: separate d3cold handling from
 xe_display_pm_runtime_suspend_late()
Date: Wed,  1 Jul 2026 16:53:04 +0300
Message-ID: <73693f137e9601e027ab7e7add2a7b08d5a2f675.1782913901.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782913901.git.jani.nikula@intel.com>
References: <cover.1782913901.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Make the special d3cold paths completely separate from the rest of the
runtime pm calls.

The intel_dmc_wl_flush_release_work() call right after
xe_display_pm_suspend_late() might be completely redundant, but this
avoids any functional changes.

Wiggle the comment while at it. It gets duplicated for now, but this
will be addressed in the follow-up.

v2: Update comments

Acked-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index e0376409d71c..01b6501a204a 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -371,14 +371,14 @@ void xe_display_pm_runtime_suspend_late(struct xe_device *xe)
 	if (!xe->info.probe_display)
 		return;
 
-	if (xe->d3cold.allowed)
+	if (xe->d3cold.allowed) {
 		xe_display_pm_suspend_late(xe);
+		/* Ensure the wakelock release work gets flushed */
+		intel_dmc_wl_flush_release_work(display);
+		return;
+	}
 
-	/*
-	 * If xe_display_pm_suspend_late() is not called, it is likely
-	 * that we will be on dynamic DC states with DMC wakelock enabled. We
-	 * need to flush the release work in that case.
-	 */
+	/* Ensure the wakelock release work gets flushed */
 	intel_dmc_wl_flush_release_work(display);
 }
 
-- 
2.47.3

