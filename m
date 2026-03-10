Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A16FCC9DE
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 08:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D9310E689;
	Tue, 10 Mar 2026 08:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRUC/uPD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05CFD10E689;
 Tue, 10 Mar 2026 08:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773131362; x=1804667362;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=68cxXRRzLHdXXJqGEgoS2bI42dMva4qnaNSrAjNOz2s=;
 b=LRUC/uPDnQ9AyUTXhtmJTtPKczI9XhxYeFEiTU/5GjcqqjvT7AvEpmYm
 Whczc5FdN2FyB8jSJrK7Mk9GLT/S10UIJ7xSZK4RhsjAZS3i0BJIkWdAJ
 x8IYFDQecMP1qLcsKf81s3ddDLjKpM5UJYgXCNFcaRhwlNTsKhxVtqWLK
 Xurk7c9B3hL0M8m+7PkvJujlS6WXv0+E/O5RYfebbqWWuUE/QeVw7UeUR
 /j7rN7ijr1ILqAJePbDMNfjoZVVsLZzbxvemFzDjkR09O4XnlFsWMhBij
 TMFEKBLIQSiSF0QFq73o0Jv0iH2JC/AY3Dl5R++fYZ0Qd5t2gcHehMiLG g==;
X-CSE-ConnectionGUID: s9PYJSzYSAmP4rnjAOqxCg==
X-CSE-MsgGUID: ZOoE5bqxQhyaATJ/q9k86w==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="78022351"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208,223";a="78022351"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 01:29:22 -0700
X-CSE-ConnectionGUID: 9ufg1RbpTXidMzLnK+zs8g==
X-CSE-MsgGUID: epumpSfNQL2gS/sSIy3pgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
 d="scan'208,223";a="224982758"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 01:29:20 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com,
	swati2.sharma@intel.com
Subject: [PATCH] drm/i915/dmc: Update PIPEDMC interrupt mask
Date: Tue, 10 Mar 2026 14:00:47 +0530
Message-ID: <20260310083047.2593048-1-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
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

From display version 35 onwards PIPEDMC_ATS_FAULT and
PIPEDMC_GTT_FAULT interrupt bits are no longer defined.

Update the interrupt mask to drop these and
enable the PIPEDMC_ERROR interrupt.

Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index c3b411259a0c..e60f1f977070 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -509,6 +509,10 @@ static void pipedmc_clock_gating_wa(struct intel_display *display, bool enable)
 
 static u32 pipedmc_interrupt_mask(struct intel_display *display)
 {
+	if (DISPLAY_VER(display) >= 35)
+		return PIPEDMC_FLIPQ_PROG_DONE |
+			PIPEDMC_ERROR;
+
 	/*
 	 * FIXME PIPEDMC_ERROR not enabled for now due to LNL pipe B
 	 * triggering it during the first DC state transition. Figure
-- 
2.43.0

