Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B273CCD19A
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 09:02:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CAF10E451;
	Tue, 18 Nov 2025 09:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKPq7Sg9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8CF10E451
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 09:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763456532; x=1794992532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2ipx5XlB5DkOEMkJqHyGz3tnJj9Y7y4qdccVAWTvyOs=;
 b=RKPq7Sg9vqsroO7R0IeDvbcxbXuR51/sv+h++AOaRNeZ+wIUehBjKojw
 yvIkssIO7pNg/7mkgAqaxZwPIKrvtz+OO3NvSfHIu3ETQe7Ru96t9qyrG
 Jg5/GEQIlWiUD74FG9j7JKvYQTdN6sV7xxv9Lppx3pQpv0bNcCi9MTtcz
 5v4SCddV/vv9LmU9SvZ2UBnNQiYOfls+NAt9GTmDhdSDYjmZGFekXv/ad
 1A4/KFEw/OwxdAUqY8rUDWkFzNrv+WnCenw+v0L7r7tlMBAhgxZSe/P95
 A6CcU//vRt5LL/RzvjBWJmUkk4JZO+ZkoHo0vVxELTiXQfiV9Cb3XU9sG A==;
X-CSE-ConnectionGUID: Lp/Rt2jgQRiTQOaae9tYPw==
X-CSE-MsgGUID: ZJML8TzmQh2jcoykoYNRLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="53042287"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="53042287"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:02:12 -0800
X-CSE-ConnectionGUID: mAs8Y0PSRRmxFL/8zJu+tQ==
X-CSE-MsgGUID: CRPfB4JsTvyUSFcjFT/qYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="228042538"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 18 Nov 2025 01:02:09 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com,
	jani.nikula@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com, ville.syrjala@linux.intel.com,
 karthik.poosa@intel.com, anshuman.gupta@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 3/4] drm/xe/hwmon: Use xe_pcode_read_probe() to check for
 mailbox command support
Date: Tue, 18 Nov 2025 14:29:19 +0530
Message-ID: <20251118090012.608250-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118090012.608250-1-raag.jadav@intel.com>
References: <20251118090012.608250-1-raag.jadav@intel.com>
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

Use xe_pcode_read_probe() to check for mailbox command support on the
device while exposing respective hwmon attributes.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 97879daeefc1..b2ae0e1bb68f 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -698,13 +698,9 @@ static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
 
-	/* Avoid Illegal Subcommand error */
-	if (hwmon->xe->info.platform == XE_DG2)
-		return -ENXIO;
-
-	return xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
-			     POWER_SETUP_SUBCOMMAND_READ_I1, 0),
-			     uval, NULL);
+	return xe_pcode_read_probe(root_tile,
+				   PCODE_MBOX(PCODE_POWER_SETUP, POWER_SETUP_SUBCOMMAND_READ_I1, 0),
+				   uval, NULL);
 }
 
 static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
@@ -726,7 +722,8 @@ static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 sub
 		return 0;
 	}
 
-	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
+	return xe_pcode_read_probe(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0),
+				   uval, NULL);
 }
 
 static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
-- 
2.43.0

