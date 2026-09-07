Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243DFC79F9F
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 08:36:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC36510E6E4;
	Mon,  7 Sep 2026 08:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7UTm23j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCB710E6E7
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 08:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788770176; x=1820306176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H7/Xs5pErhZL0YDAKJy843KOWGpOEmh7NDvYV5MVIK4=;
 b=k7UTm23jABvoBFg4Pw9a0+qJU0s1QuarnMXJWXlJu4xM92U8/6yKFSNj
 YmDPL+4giMiBlRO5FulTVZFmUEZwcZzDQB5HZ8w0DHRFRshFQDLQ6eGsu
 4J9CX96c6uCsM0+hDFhlEPBmTxMBqp7Q1AQcliMnft1WIlN31oBF/6sWw
 OP0uXmWB+e6ssn685s2fiHoKTv4kN3WCkzQkOGjoIPI4Jq0guBC3M8nwL
 yaWShb64GewlvlgVOu+gAiSnjTki/qKDffGQzAOF5xhiCRbkPj7f1Ea3u
 FrwZ32c+ttcj9NWjvE1u5m9xqbBW9aledhmc9SLq4kgQYB+ZRY81V6A+3 w==;
X-CSE-ConnectionGUID: MM41oFHgSM6WY0ywzBuGnQ==
X-CSE-MsgGUID: Ex1d5dDvQweAkhS4oyv89w==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="99829312"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="99829312"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:36:16 -0700
X-CSE-ConnectionGUID: Cu3bEunRQT2/rXDKfFt8xA==
X-CSE-MsgGUID: Ht+jVGDpTW21wVhwfOGtzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="266299836"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:36:13 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 2/2] drm/xe/hwmon: Use shared pcode default timeout for
 power limit write
Date: Mon,  7 Sep 2026 14:05:20 +0530
Message-Id: <20260907083520.192418-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260907083520.192418-1-karthik.poosa@intel.com>
References: <20260907083520.192418-1-karthik.poosa@intel.com>
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

Drop the local PL_WRITE_MBX_TIMEOUT_MS macro and use the common
PCODE_DEFAULT_TIMEOUT_MS for the power limit write mailbox command.
This removes a duplicate timeout definition and keeps hwmon in sync with
the pcode default (now 10ms).

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5284cab6703d..5edeac961ec3 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -101,11 +101,6 @@ enum sensor_attr_power {
 
 #define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? "PL1" : "PL2")
 
-/*
- * Timeout for power limit write mailbox command.
- */
-#define PL_WRITE_MBX_TIMEOUT_MS	(1)
-
 /* Index of memory controller in READ_THERMAL_DATA output */
 #define TEMP_INDEX_MCTRL	2
 
@@ -252,7 +247,7 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
 							     (channel == CHANNEL_CARD) ?
 							     WRITE_PSYSGPU_POWER_LIMIT :
 							     WRITE_PACKAGE_POWER_LIMIT, 0),
-							     val0, val1, PL_WRITE_MBX_TIMEOUT_MS);
+							     val0, val1, PCODE_DEFAULT_TIMEOUT_MS);
 	if (ret)
 		drm_dbg(&hwmon->xe->drm, "write failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
 			channel, val0, val1, ret);
-- 
2.25.1

