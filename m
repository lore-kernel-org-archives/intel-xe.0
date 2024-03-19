Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352D7C54E60
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 13:23:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1A410FAA3;
	Tue, 19 Mar 2024 13:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nTVEselQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35E810F00F
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 13:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710854594; x=1742390594;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TZRzoGYTr1cOnYrOvKCJKpchdW+6S5q4ajYpEmpa7yQ=;
 b=nTVEselQ05QDnntYVKp/A9d1hbl8rSVAywJ471cFjVUhl8iivo/dShkz
 kjPbkvZ7p2YO1W+cmBptbN4e7G+Nmc6d5Vf6PvM7TwDtAaUJXcVKznC+P
 eJBeL2jsXl7AV8G997W6QX+/DniUZWLExnLtK0le1vNso7LcFbJPu6DJC
 iARgIsQvQE+ciwxJdaLB8fiANIZiWpEwlyztoexqAmpMtGut0IBM6WVO8
 u2j5Z/r0AlGnuJSWgC1W8Tdr45D0a0vw1Blow6aisjRiqYXcDhh4fP4AC
 lCHQ1Je7okxK0V/h0XgJh+qEYF9wVJ8IhNr/58brVHPYMCOsCOPfJGrGQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="17125606"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="17125606"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 06:23:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="18382086"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 06:23:13 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Add a NULL check in xe_ttm_stolen_mgr_init
Date: Tue, 19 Mar 2024 14:09:25 +0100
Message-ID: <20240319130925.22399-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Add an explicit check to ensure that the mgr is not NULL.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 3107d2a12426..fb35e46d68b4 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -207,6 +207,11 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 	u64 stolen_size, io_size, pgsize;
 	int err;
 
+	if (!mgr) {
+		drm_dbg_kms(&xe->drm, "Stolen mgr init failed\n");
+		return;
+	}
+
 	if (IS_SRIOV_VF(xe))
 		stolen_size = 0;
 	else if (IS_DGFX(xe))
-- 
2.42.0

