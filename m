Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2306C5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 18:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4289210E820;
	Mon, 24 Aug 2026 18:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TuqPCidE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1437B10E820
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 18:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787596973; x=1819132973;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uIA36EaawSYjMME/bKb/mRfYLWeIuWeMHch3w30pzUY=;
 b=TuqPCidEgDok8iP3Yc48jtF2a53YPWTeOMOmF99fflZYqZAyZ9AWsO49
 stCdomxW2z7aGKoiOswIfb9QKfcTn8LBKtXyWpHfdV8GUNKvhRF7E+voT
 kdWTHTGhp6mYYIVVCPISBRsmofZrPh1qXmX4KfCy6P8uHQ10vp3B2WN/5
 76gTjlWzLol1KJ5slb/2WQqMK9Z1cypMk2GVwJ/ZOyFhVkkqIKVoCu9Uy
 f6+SjKvHHdFBQ13QOp0YfYsvoRBs9U4vsM3Nbc4SrtcSnuNWQ5vKYmXT7
 LJ7SeNo4InYJ8X3kUf1EvLrCFHx8k96PTUlX+laX8xb1B5dv2/etMwUV8 g==;
X-CSE-ConnectionGUID: 6oSjt0q7R/OjZ7tAfI2ltw==
X-CSE-MsgGUID: izUQYUt8TDW1p70GO0Pi8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="110840999"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="110840999"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:42:53 -0700
X-CSE-ConnectionGUID: ikI2RqCCSOKtRvaALljagA==
X-CSE-MsgGUID: vdIi65fUTaCUXvYFYWsHHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="262776557"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:42:50 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH 3/3] drm/xe/hwmon: Correct group selection for memory
 controller temperature
Date: Tue, 25 Aug 2026 00:11:33 +0530
Message-Id: <20260824184137.2164727-4-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260824184137.2164727-1-karthik.poosa@intel.com>
References: <20260824184137.2164727-1-karthik.poosa@intel.com>
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

Read all the necessary groups when reading memory controller
temperature in get_mc_temp().

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: 3a0cb885e111 ("drm/xe/hwmon: Expose memory controller temperature")
---
 drivers/gpu/drm/xe/xe_hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 6e7cb250e628..286f43320ce0 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -844,7 +844,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 	int ret, i, count = 0;
 	s32 average = 0;
 
-	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
+	for (i = 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
 		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
 				    (dword + i), NULL);
 		if (ret)
-- 
2.25.1

