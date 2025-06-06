Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF0DC677C4
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 19:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87FE10ECAB;
	Fri,  6 Jun 2025 19:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DlmbQpWz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5617D10ECAB
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 19:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749239474; x=1780775474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UxAA1sJfP+oKiDLPtPUIdlIVwgldD57X5DKmRf2R9Qo=;
 b=DlmbQpWzEkme9PtISG/lUIXpUEZhDLtyPhFfBOGX56l2fhnqIk3hKdYi
 R25uDUcUinD1J60v3U9UtAkNMxedTKVBuYJsyrLkowPj8vL+hi3gAJLP9
 5IYKjf3GwpeJ0aGalS7n8Qv7Oj8LX16c0GDRVlj2Ejt0+bvWWmRTXEJ/O
 aegGRKN1uFyFSx3OgDyayV6xrVl7oM4Wy3rYMzQOiGeomoZct20vKgEik
 TbbpkM9aRN0hdKXkA7llFY9FODmuHzdU0Ml/IemnBpyGNbJh+B1Oo/+Aj
 WNMIghK/IdtxW5j/F8tlVvUPe3SjF819irrmyEgSq6c/AyWYuPvVxBXzV A==;
X-CSE-ConnectionGUID: jlMSbrToTvu+a+uzUbG2Bw==
X-CSE-MsgGUID: rgGgNbPHT9+fcYtpsvJ5vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51277292"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="51277292"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 12:51:14 -0700
X-CSE-ConnectionGUID: nRKwwL4ERW247DjFoZxiuQ==
X-CSE-MsgGUID: 5UfRXNhLSXOqY0jT1zSlAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="145796051"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa006.fm.intel.com with ESMTP; 06 Jun 2025 12:51:12 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 5/9] drm/i915: Set max cdclk for display 30.02
Date: Sat,  7 Jun 2025 01:21:00 +0530
Message-Id: <20250606195104.1771715-6-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
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
index f0c673e40ce5..4625c9cea4b2 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -3385,7 +3385,9 @@ static int intel_compute_max_dotclk(struct intel_display *display)
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

