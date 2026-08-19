Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30FFC5DF88
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:15:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991B710EEB1;
	Wed, 19 Aug 2026 19:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBl2Z2ap";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D63D10EEAF
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787166901; x=1818702901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s2TjUfJIJP+Fudo1fCLcWFe6m4k/dXSjYncsZFZhg3Y=;
 b=hBl2Z2apbAflxNdDRLvT4s9vUwjbBjUnXS9f9RoPS3BHWnmujbGYmw+Z
 OiR3CdBANAV4jFnxWmI2zS1TYtEihxgNgWNaoR7XQ7h2McpqHNXHDBkwL
 FLUndmJYq7R5qV0+7mORQ+qwlrVEkbA3nlzvS+KL+WdYQidiQ8laRszyZ
 Kb9maoYercup9l1DiovW2Cehzi/yAuDtVEulK2nzXoOjvRDn0A4iehrK1
 j6a1BdyOeyfElyPPVZmv0mxSW1rMOJgVQ9L5sRBh20lHMskj2Xl1aVeRx
 ICGNhflaa37eMNcwpaV2fxJdFYtJB46LC5q2qxmap6KUFpp54Xfifuj2x g==;
X-CSE-ConnectionGUID: /Gtj76JCRgWhT+CDEKPtrg==
X-CSE-MsgGUID: WpwqW0qXQ8mgFFT8PHg+pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="86647298"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="86647298"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 12:15:01 -0700
X-CSE-ConnectionGUID: ekgr4YLYQ86zBp3SNJbfrg==
X-CSE-MsgGUID: k7wbttHRT5a8vA7bWQ1/aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="295556773"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa002.jf.intel.com with ESMTP; 19 Aug 2026 12:15:00 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: mallesh.koujalagi@intel.com, michal.wajdeczko@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 10/12] drm/xe/pci: Report unknown GMDID versions using
 structured xe_log API
Date: Thu, 20 Aug 2026 00:44:39 +0530
Message-ID: <20260819191442.1957986-11-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
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

Replace drm_err() with xe_log_err() using the GT component tag when
hardware reports unrecognized graphics or media IP versions during
GMDID handling.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1e04e8ef2611..392c9e12e653 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -718,8 +718,9 @@ static int handle_gmdid(struct xe_device *xe,
 
 	*graphics_ip = find_graphics_ip(ver);
 	if (!*graphics_ip) {
-		drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
-			ver / 100, ver % 100);
+		xe_log_err(xe, GT, -EINVAL,
+			   "Hardware reports unknown graphics version %u.%02u\n",
+			   ver / 100, ver % 100);
 	}
 
 	ret = read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
@@ -732,8 +733,9 @@ static int handle_gmdid(struct xe_device *xe,
 
 	*media_ip = find_media_ip(ver);
 	if (!*media_ip) {
-		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
-			ver / 100, ver % 100);
+		xe_log_err(xe, GT, -EINVAL,
+			   "Hardware reports unknown media version %u.%02u\n",
+			   ver / 100, ver % 100);
 	}
 
 	return 0;
-- 
2.54.0

