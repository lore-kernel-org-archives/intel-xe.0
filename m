Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D07C52D7F
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 23:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8436D10E3E5;
	Tue, 13 Aug 2024 23:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GYDic2RB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A5F10E3E5
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Aug 2024 23:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723590721; x=1755126721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1BwxbfnExCmwSqB8x0nk0G2IdszXb1Tg/2f9XjINal8=;
 b=GYDic2RB7T+8SHKGOZxF9KJac66ps0CfryTP7yznVsA9eWWqcZRYjRc1
 nhNqDBPtP57Cjcow+5bpuvNJsi16sLJ3supP0YY1pes3+9UgeB1cNoQtO
 zFY6P7+R2oew/H2cg4DVfzLFzP851Fh8D6fp5BUXa+/Mr+olis94d478O
 4ZTw00IeVNlH1DXAMSMqY5MwdAbT+qmYiVBZkHKW4M2tLsrXToYLJVL/x
 U4we+MAi6lCqhGE1GsU80vhn7fR5ybTNA/boLXcKWpchFm3lgRup0GqE1
 yw5CiTf+1gwEG9dWjgIFDjIAeQgKb+5TDzyY8qF/x3ZJs+GH7io+2VAPd A==;
X-CSE-ConnectionGUID: Sl66u4Y7QfSWHbt5EGVRqA==
X-CSE-MsgGUID: loEFFKZwQXeTXTAbk/rwww==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21599842"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; d="scan'208";a="21599842"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 16:12:00 -0700
X-CSE-ConnectionGUID: 1k4QBaimQQSkkSyCAsPCPw==
X-CSE-MsgGUID: 9ELbaaBQT8iS65GOequOww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; d="scan'208";a="58515527"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 16:12:01 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH 2/4] drm/xe/gsc: Fix FW status if the firmware is already
 loaded
Date: Tue, 13 Aug 2024 16:11:45 -0700
Message-ID: <20240813231148.1663731-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240813231148.1663731-1-daniele.ceraolospurio@intel.com>
References: <20240813231148.1663731-1-daniele.ceraolospurio@intel.com>
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

We set the FW status to "TRANSFERRED" after the load completes and to
"RUNNING"once we're done with proxy init, so do the same if we're trying
to re-load the FW and it is already loaded.

Note that there is no difference in driver behavior between the 2
states, but it's useful to be accurate when we dump the status for
debug.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 66963e26c574..85a6a65063c4 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -537,7 +537,10 @@ void xe_gsc_load_start(struct xe_gsc *gsc)
 
 	/* GSC FW survives GT reset and D3Hot */
 	if (gsc_fw_is_loaded(gt)) {
-		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
+		if (xe_gsc_proxy_init_done(gsc))
+			xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_RUNNING);
+		else
+			xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
 		return;
 	}
 
-- 
2.43.0

