Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D806CCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 15:48:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E285E10EA01;
	Thu, 30 Oct 2025 15:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fHslQGtl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC31010E9F8
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 15:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761839297; x=1793375297;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2xItS/WRWLzlkoYXpNofCTWk0MwguKun6vz0tq9Mj8Q=;
 b=fHslQGtlrubtM25IFWvxLqA7tYUwOeaXnfq2N9sBtkaQhxS5rl5IPmsu
 ZbBqeW2HBqjJxSa3+RuBABYiUPGkfhu2r/kkyHdOqa6HHRczi4t+M5Wd2
 S/6hM3ZzODLbVfslJmEkWG3cI0+gU+ctjNVEXuWvvxWj4XZhWCuR7cbzK
 NXbLnupBy+dasOMyhV1P5ZjnqILPukewuzXUuNBgG2rXRluINWX/4LAFs
 pchJDHAo/roSj2Dkd4e8BVLtki6b9r894KDSsZ8+nc48dTHmW7h7gV8vq
 mWFnrOLzjGH9uMlFuL15QskN7b+7b5muGQ+43XwL82Om+7Y/Rh8xl8lmG Q==;
X-CSE-ConnectionGUID: QCGWDF6tTaCQonihTZnI5Q==
X-CSE-MsgGUID: sWZjiWmfQSSI3k6K3zHUsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64083065"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="64083065"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:48:16 -0700
X-CSE-ConnectionGUID: CrJgtOHhR/ic3gUYef3Xcg==
X-CSE-MsgGUID: YiQ7YH/XSZOWkqJLZ96ryQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185868473"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa006.fm.intel.com with ESMTP; 30 Oct 2025 08:48:15 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: matthew.d.roper@intel.com, gustavo.sousa@intel.com,
 tilak.tirumalesh.tangudu@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/xe3: Extend wa_14023061436
Date: Thu, 30 Oct 2025 21:16:26 +0530
Message-ID: <20251030154626.3124565-1-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Extend wa_14023061436 to Graphics Versions 30.03, 30.04
and 30.05.

Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index ec638b431131..81e62291af45 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -679,6 +679,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	},
 	{ XE_RTP_NAME("14023061436"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
+		       FUNC(xe_rtp_match_first_render_or_compute), OR,
+		       GRAPHICS_VERSION_RANGE(3003, 3005),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE))
 	},
-- 
2.46.0

