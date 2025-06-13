Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC23C71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 19:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6F610EA52;
	Fri, 13 Jun 2025 19:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrTF0wVd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1466210EA45
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 19:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749843117; x=1781379117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EIElUrKFkDwdELXFYGaGoOXmRj25eCe35unOEGEe7No=;
 b=mrTF0wVd8VDO6QgfJQc0dxZ8TwZws+ljnR5Yk+mPJznO5xGKs5coutUJ
 7L2J+0pBmwntWP0H1VFbe2VDeMlzFufh8gt2EIZu0IxEuNqbK4Z010qdZ
 FoMg8l8WcmdF2BptoeywbCSe5LsHUPbnKlTeHpOB3nXeKrYklLvGeUe3t
 gM9Du9K3dHOfBKLJybDEkMRILmD05CuoTxjr4tJx2Wzez7pXhfC7ECgsu
 FP1QC2BQmA3iLqseQ90BFWz77rO/Y67nj+TO4LtVUnMaNR/fxqw01qS17
 QbQvLlUI9/uAICxvfN6vwQuZcTg+S2KKz3YYJ50qLhY/UOxmDoWK7GK2y w==;
X-CSE-ConnectionGUID: ASpY4SGST/efpB+M3NPHdQ==
X-CSE-MsgGUID: QAcRR4cYRG6idZS0euZEBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69510514"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="69510514"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 12:31:57 -0700
X-CSE-ConnectionGUID: bhnhjwppTTW1d+TDdWXbdA==
X-CSE-MsgGUID: KCNXtE4KSD6C+GngfyrWTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="151722659"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2025 12:31:55 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v6 5/9] drm/i915: Set max cdclk for display 30.02
Date: Sat, 14 Jun 2025 01:01:42 +0530
Message-Id: <20250613193146.3549862-6-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
References: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
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

From: Matt Atwood <matthew.s.atwood@intel.com>

Display version 30.02 has a lower max cdclk rate than 30.00.

Bspec: 68861
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 38b3094b37d7..1cbb1d526fe8 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -3386,7 +3386,9 @@ static int intel_compute_max_dotclk(struct intel_display *display)
  */
 void intel_update_max_cdclk(struct intel_display *display)
 {
-	if (DISPLAY_VER(display) >= 30) {
+	if (DISPLAY_VERx100(display) >= 3002) {
+		display->cdclk.max_cdclk_freq = 480000;
+	} else if (DISPLAY_VER(display) >= 30) {
 		display->cdclk.max_cdclk_freq = 691200;
 	} else if (display->platform.jasperlake || display->platform.elkhartlake) {
 		if (display->cdclk.hw.ref == 24000)
-- 
2.34.1

