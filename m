Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD0FC5DF64
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 19:15:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8C410F0F5;
	Wed, 12 Aug 2026 19:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oexi7seD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C6410F0F1
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786562150; x=1818098150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NUFYw3/WDLrucEcQXUg1oR1hY+ObvtBmG7JVCk3IUwI=;
 b=Oexi7seDr1vagV/L2qZLl+Kl6GSi/zVvCAEie/bOzxULa8N0Ze75RlqG
 Gj4fxwsqMtfR11ZQaaHKqF2mpT9Hi/KlPua9UVYJ2FboXfC5kuPfJu6Bw
 zW2iyaPlVH+bW6eAk38TvLjsnpgyizeZIeL1DsxcEwMAyNemp6VeDpaCD
 SyZ3lFo8UWcT8fdsss9kacvAT6F2qGG0dx2u65HFTeSasWIEGk0fRgR8D
 2/8tp8woxKVhfkxO0vGibu9O8Autw1isHnIDAul3dpXCNdEbbdhc9eQFv
 0Gy5I0d3BgzfngTgCVrVZrTdPa1QTrxyqwQkqm4gsTZcWMRZte4TDZebi g==;
X-CSE-ConnectionGUID: XSYY123VQ3SEofShC2KMtQ==
X-CSE-MsgGUID: Vj812s9yR1OIBER47bKgMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86987602"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86987602"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:50 -0700
X-CSE-ConnectionGUID: Lmrx1YH8QpyKtA1CZMZrqw==
X-CSE-MsgGUID: LK4Dk3rTTaihesZfUWDsPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="268892084"
Received: from miqurash-mobl2.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.41])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 12:15:48 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v4 27/32] drm/xe/pcode: Report 'initialization timedout' error
 using SIGID
Date: Wed, 12 Aug 2026 21:14:43 +0200
Message-ID: <20260812191450.11690-28-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812191450.11690-1-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
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

Report 'initialization timedout' error using xe_log_err() helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 14b13a11d1d6..e1b8062541a9 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -297,7 +297,7 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
 {
 	u32 status, request = DGFX_GET_INIT_STATUS;
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
-	int timeout_us = 180000000; /* 3 min */
+	long timeout_us = 3 * 60 * USEC_PER_SEC; /* 3 min */
 	int ret;
 
 	if (xe->info.skip_pcode)
@@ -318,8 +318,8 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
 		mutex_unlock(&tile->pcode.lock);
 
 	if (ret)
-		drm_err(&xe->drm,
-			"PCODE initialization timedout after: 3 min\n");
+		xe_log_err(tile, PCODE, ret, "initialization timedout after %ld seconds\n",
+			   timeout_us / USEC_PER_SEC);
 
 	return ret;
 }
-- 
2.47.1

