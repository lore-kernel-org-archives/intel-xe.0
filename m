Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47530C25B7F
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 15:45:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46FC10E7BE;
	Mon, 20 May 2024 15:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ashDDrZA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B17410E55F
 for <intel-xe@lists.freedesktop.org>; Mon, 20 May 2024 15:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716219955; x=1747755955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E2UjfIab0hQwed9jVcwf0dHwQa1B+2Jd3fLpEknH4EA=;
 b=ashDDrZAutGUDhBytUs7n14RyRVFRoHfNDO9n4zMPfCJYpHDZTbviHTT
 1mDMOnj6Td8QrUlmBVrwhWlgJvEfCenrcBonSLl0t7DxZg0raDB2FgxRj
 yZUYBhLMFRrY7pMwJvGXmLeSJ3EfLB9Nq3a0UiqaLLHjnkexh6QK4EfiO
 +tnpn+2AAJNWTnKdac7e8tz8kKmwOaDyRq86Mpm3BhwNvdSjtFpJgC4cT
 Cz/cVpAtBETDH/emeBD5q+0sKosLEWTJtgfnD1C+NotV8zKIrnlCcTgiJ
 IVJrlesAFmxw7+ec8shxkBA0PGKM5UtUjPE1drZxNYciErTDVQlxodNoL Q==;
X-CSE-ConnectionGUID: yiNEI/lqRh6fKaxdxYcrtw==
X-CSE-MsgGUID: ewgICe84RtqfDdC058Kinw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="34873251"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="34873251"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:55 -0700
X-CSE-ConnectionGUID: Y0iErNc1RtiA7nwCqS/fSw==
X-CSE-MsgGUID: lQAOCcZcRpi5XZN2PExDtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32610533"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:54 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [CI v2 17/18] drm/xe/display: stop calling domains_driver_remove twice
Date: Mon, 20 May 2024 16:43:06 +0100
Message-ID: <20240520154249.52888-35-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520154249.52888-19-matthew.auld@intel.com>
References: <20240520154249.52888-19-matthew.auld@intel.com>
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

Unclear why we call this twice.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 18fffa894f7d..7065e34a460e 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -131,7 +131,6 @@ static void xe_display_fini_noirq(void *arg)
 		return;
 
 	intel_display_driver_remove_noirq(xe);
-	intel_power_domains_driver_remove(xe);
 }
 
 int xe_display_init_noirq(struct xe_device *xe)
-- 
2.45.1

