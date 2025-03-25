Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB3CC36005
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 20:32:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7111710E5FB;
	Tue, 25 Mar 2025 20:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U50ycE9F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC2D10E5FB
 for <Intel-Xe@lists.freedesktop.org>; Tue, 25 Mar 2025 20:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742934733; x=1774470733;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y3nacGNUrD9wmi9pg5Mj5fu9miCDzBH0wnxFDjBQKtM=;
 b=U50ycE9Fk6qstMj1/SwT8h6zfCUk+VeWd8YQbUkE2qs6JbawVkz3uNZ7
 OWoKmbLwQQ7jpWnodXsqV9I3bxXqoYyK06e+fRXyrXsp/CFsJs8axgV6o
 tIgYcWbsxdxNTXPPnY/abpDX9ziwGiYg8xhRvaChMd+pQRl/jP+xKZUeq
 T4Dkd6r3rAHx8FlPybz+6MjVulUUd/ztL8gAGL0ZvSeW5l1o8xEWIJgy4
 aN7Qho+mpTQ0vKlR0e3J1JH4+tZ6Q3/KCfoNnbRzkD1HSIEeAHHWkjeO+
 W1LnTJWPWpHaI3TlFK1yHjBFFlMx2iKe1/iLU46ukIWjbg8oMgaNzq3ed w==;
X-CSE-ConnectionGUID: JyJVYiNxQZqCybTrf2MCKA==
X-CSE-MsgGUID: QTJROy9yTcqgQ9xgYzh8JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="55581339"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="55581339"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 13:32:11 -0700
X-CSE-ConnectionGUID: nlilwXyiQwCAVKzAQEze/Q==
X-CSE-MsgGUID: SPTwD8weRdSa5zgOMy4F/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="129618463"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa004.fm.intel.com with ESMTP; 25 Mar 2025 13:32:11 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe/guc: Re-word message about ADS size changes
Date: Tue, 25 Mar 2025 13:32:11 -0700
Message-ID: <20250325203211.3907890-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

The error capture list in the ADS is initially allocated using a
placeholder size. When the actual size is determinied later on, there
is a debug print about the new size. However, the wording is such that
some people see it as an unexpected thing and therefore a potential
problem. So re-word it to be a little less concerning.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index e7c9e095a19f..bee4e0cfe7b8 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -682,8 +682,8 @@ static int guc_capture_prep_lists(struct xe_guc_ads *ads)
 	}
 
 	if (ads->capture_size != PAGE_ALIGN(total_size))
-		xe_gt_dbg(gt, "ADS capture alloc size changed from %d to %d\n",
-			  ads->capture_size, PAGE_ALIGN(total_size));
+		xe_gt_dbg(gt, "Updated ADS capture size %d (was %d)\n",
+			  PAGE_ALIGN(total_size), ads->capture_size);
 	return PAGE_ALIGN(total_size);
 }
 
-- 
2.49.0

