Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72562E6FE49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 21:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358DF10EB04;
	Fri,  6 Sep 2024 21:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3i/zDEv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477F010EB02
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 21:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725659526; x=1757195526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Z3zJEdCMdl9djqX4bXMEjEVeCI9fufcU9NRecvJzwg=;
 b=X3i/zDEvwAHmlx0zyoFW17M/ARvdtox2ddxjKxz6Oo6M9Za1E+BHPmwZ
 ekg5nPlb3j28mYc2zFvjVfWgfZzCMN1ZG46JlsnkP/TkUBk2THCJuRKov
 MTzmJxag5f0FXV69BiYAThW5Y4+gsEKvejjAZHn23PeRwrYFXJnjCVDV7
 gsx0PlC+GUhgHczLAYBfP90GABafml29/yDVbGIGuzhiz0idhbL7cmzXO
 05Coi4o/PUawmQ1zbcKNlPeB0gE7hbhJSvhWk/ljlFTMzIpNsyq2YTpUW
 mrCU568h1vLkA+05QfrrDkNVdRzj06sZ3BQZg7pN3+29gue+7Zbq8GZt5 w==;
X-CSE-ConnectionGUID: JC1TFOIqRp6ydzWWbdC21Q==
X-CSE-MsgGUID: mbNecWRMS1CeRFAECn3qtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24580589"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="24580589"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:52:06 -0700
X-CSE-ConnectionGUID: kFq/7QExRNW/4Mk4IRfLnw==
X-CSE-MsgGUID: 0O9J7QVhSTWxhRQ7L/3OSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="70656342"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.110.176])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 14:52:05 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 7/9] drm/xe/ptl: PTL re-uses Xe2 MOCS table
Date: Fri,  6 Sep 2024 14:51:51 -0700
Message-ID: <20240906215153.31210-8-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240906215153.31210-1-matthew.s.atwood@intel.com>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
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

From: Haridhar Kalvala <haridhar.kalvala@intel.com>

PTL is Xe3 architecture but there is no difference between LNL and PTL
in MOCS table.  So, PTL uses the same MOCS table as LNL.

Bpsec: 71582

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 7ff0ac5b799a..51c192f3fdfd 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -576,6 +576,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 	memset(info, 0, sizeof(struct xe_mocs_info));
 
 	switch (xe->info.platform) {
+	case XE_PANTHERLAKE:
 	case XE_LUNARLAKE:
 	case XE_BATTLEMAGE:
 		info->ops = &xe2_mocs_ops;
-- 
2.44.0

