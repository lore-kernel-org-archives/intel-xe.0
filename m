Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B69C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 21:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD1610E3E3;
	Mon,  3 Jun 2024 21:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+k+9VCO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECBE10E3E3
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 21:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717449684; x=1748985684;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ni+OxuqRpE3z9a1IoMmHiQ2iuDZ/+ywVrKCyiHdjjY8=;
 b=I+k+9VCOws8PaY8dX7+pN7LkQLX4HOs/z2X9G8c0+RA9Ta36aPyVx3h7
 P3cPym25wU/Wnd+SdFV8h3JGlpLGSuGiLQhZfTVH6Hkiingxgy3NJM/qs
 sjby60jNgpvf7/CVbdB2Ij+iPJRsTkHI4mKnW6oBRzbNHBFPCZpEhaUtN
 nSYcWW51lIgJyi9WMP6bw9+aeu36TDe/GKrdpUJS8LeNufeuMGIfpxvd5
 FT7hq8je0bt36fy4nwYF268f9JoiDyVPd8AjMrOLnWEhACUzNhgfgcGN6
 9sZrknqvlN2HVSwNKm7ZXmHRcvDx/mRRhdVMjCWyfir2ZQaJWfjawXDFT A==;
X-CSE-ConnectionGUID: qBxEDedGRqmdwhAkIFRjvQ==
X-CSE-MsgGUID: 76vlaRgLThKccakGACXOkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14083733"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="14083733"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 14:21:13 -0700
X-CSE-ConnectionGUID: 2Ubq6rsNTl2r720qwiTARg==
X-CSE-MsgGUID: ztt2x/f3QGOy6G8B6QC5VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="41936234"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 14:21:14 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, john.c.harrison@intel.com,
 stuart.summers@intel.com
Subject: [PATCH] drm/xe/xe_guc_submit: Declare reset if guc stopped
Date: Mon,  3 Jun 2024 14:05:54 -0700
Message-Id: <20240603210554.2458942-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
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

An exec queue should be considered reset if the guc it was running on
has had its submission state disabled, as this normally only occurs on
a reset.  So, add the condition to the reset_status guc_exec_queue_op.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: John Harrison <john.c.harrison@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>
CC: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d9c159e3c5320..8c0b0c70fa5ea 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1414,7 +1414,8 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
 
 static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
 {
-	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
+	return guc_read_stopped(exec_queue_to_guc(q)) ||
+	       exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
 }
 
 /*
-- 
2.25.1

