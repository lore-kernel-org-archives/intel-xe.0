Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683A7C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 09:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E4310E262;
	Tue, 25 Jun 2024 09:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="duB499SL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6197F10E07C
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 09:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719309449; x=1750845449;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+q3qPa53CW/eWCjl+FZU4ifn0bM3zzfwVczHR+sLLT0=;
 b=duB499SL+wx9iugvDeTv9GIBOzV3u2kZpO7FEmIGuR3dpsvWCu8HvpHD
 r1TaXSoufaTumqZPJBKFZCKWn6WaHCDFFV7q6bPHBRoZSUwfNzD1RrZCc
 99f8KoYkdu00PA3rbFMqI5SCRfCvTZEZ6KPMvKcex5rZQb7IUbhNsFhkO
 KWhgAn7/L1v6hFp3A7GzkIiGHymb2S4m6bK/Af0l3URPkmjv24bWl7QOw
 oJp3BL4Gm3h/1366zDLRTdhYhWcKlcS6WFNqYVwZm/H0+z2/bfRyGNyRr
 jYTOkC0dl5Qw1MqfCBpIbunmMQ8WrWX7Ikmb8XKVMyeHjiCoQVDo93HFY g==;
X-CSE-ConnectionGUID: ONj+9sjXQLqXF1PvkNby0A==
X-CSE-MsgGUID: lTaTuTs9RmujBOEiTs6T8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="12234669"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="12234669"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 02:57:29 -0700
X-CSE-ConnectionGUID: CR3ovO1tQGGw649o3Jyb6A==
X-CSE-MsgGUID: gCWCr3/dSF6ulsN9UQhTQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="48144720"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 02:57:27 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH RESEND] drm/xe/client: Check return value of xe_force_wake_get
Date: Tue, 25 Jun 2024 11:42:28 +0200
Message-ID: <20240625094228.5327-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

xe_force_wake_get() can return error so check it's return value
before reading gpu_timestamp value.

v2: set HWE to NULL instead of setting timestamp to 0(Lucas)
    Add a warn on for xe_force_wake_put(Himal)

Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 4a19b771e3a0..4bdb909eabfc 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -264,9 +264,13 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 		if (!hwe)
 			continue;
 
-		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT)) {
+			hwe = NULL;
+			break;
+		}
+
 		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
 		break;
 	}
 
-- 
2.42.0

