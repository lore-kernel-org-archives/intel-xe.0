Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F64D68BCD
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 19:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E794510E3CA;
	Fri, 15 Nov 2024 19:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dr5U5cZc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87DB10E3CA
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 19:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731698484; x=1763234484;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LFq+65BUPGPd7/PzDTIxTP6p2X8VTl1Yiw+ep2f5vn8=;
 b=Dr5U5cZcZlDPmj6c1imgo7QicjKmiGnh5gbUOigg3kcsZbhaRtFh0xMc
 0s+IjlQhndqVy8N3Rf9gEfZett/1a8ntvTZ6O2yXcDbmOR+KREw/L0ks0
 73SyZ9fw1xHkrJupJ934cttBbLUPT0OCl0BgzW0TMJFMxec2BWD+MHEDL
 edp06yaomodH/jOf8K/R1iXHtpS/dH8zfLNWUaZ3IHcKxItYI8qjIpemp
 jT9TF1+tL3zlWRGwPK0LJFp877UdyDXcm/CXuuIdLCGHkobpezV75G4IZ
 NcAGCng1h7cRYfO9ZTVrizQZ+HxYeIOrRWOdADQEGUWoem0lP9THDH5X2 Q==;
X-CSE-ConnectionGUID: 2jH4S/rjS4OAEpstZTRm9g==
X-CSE-MsgGUID: SWnLZKFdTaaVjYcFBWYf2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="49247070"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="49247070"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 11:21:24 -0800
X-CSE-ConnectionGUID: epJwSht8SlC8OjNv/QozGw==
X-CSE-MsgGUID: aUDFWfhQSceeHCrtT9Qm7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="111926137"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 11:21:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Drop useless d3cold allowed message
Date: Fri, 15 Nov 2024 11:21:55 -0800
Message-Id: <20241115192155.2050987-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

This message just spams dmesg providing little benefit. Remove it.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 40f7c844ed44..80699dbeb2e9 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -738,9 +738,6 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
 		xe->d3cold.allowed = false;
 
 	mutex_unlock(&xe->d3cold.lock);
-
-	drm_dbg(&xe->drm,
-		"d3cold: allowed=%s\n", str_yes_no(xe->d3cold.allowed));
 }
 
 /**
-- 
2.34.1

