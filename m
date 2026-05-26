Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BB2CD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 14:49:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B7089EF7;
	Tue, 26 May 2026 14:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cws/jLlt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5465E89EF7
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 14:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779806983; x=1811342983;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1Inurw17J7nA7M9Dg8rbD64N4rZ7WTyMdrk4kCb+w94=;
 b=cws/jLltw/bC4TOTgu/myX8z/OXZSoyd7S3zFrC9bPwh/4lLqhLWjT3U
 zTkRQ/K+dUIdJ9cndgGGJp0ISiP03ItJIItuhRqBy+dHC5KC4xVZn7IFy
 fYmaxyvo1J+hUZ0vEseDhkDsyktbk9k8V2MWIU9fQxl5qKJ9y0/QJxV3V
 MPnyPX/S7H+oPw859OF9prkaSmpvC0E7XTpze/IuuQkpxS0zp0yGmZnsm
 0MyNkNZVQVPWTg9RsH7zPQd4FF7lrk5dIRkvhbCytGo9IMP6jGyp0nHky
 Zxu9s9NeRCHJbAIQ9IEttDUinNjV0tCW5vg62fcEwYPkaPMSatMTJQ3WK Q==;
X-CSE-ConnectionGUID: rahBU6gRSrSldeslWiuNsg==
X-CSE-MsgGUID: M25wG15eQ3GqlWwBu5cl2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80653970"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="80653970"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:49:43 -0700
X-CSE-ConnectionGUID: OPT4WDpbRXaSQ0U0PGKtpg==
X-CSE-MsgGUID: MEHzJub9Qt6XUubcaIsTBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="272274175"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.104])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:49:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, Imre Deak <imre.deak@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [RFC] drm/xe/display: do intel_display_power_{suspend,
 resume}() on runtime suspend/resume
Date: Tue, 26 May 2026 17:49:37 +0300
Message-ID: <20260526144937.1199524-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

The i915 driver calls intel_display_power_suspend() on runtime suspend,
and intel_display_power_resume() on runtime resume. Do the same on xe.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 8d08da60336d..f94a5f663be3 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -393,6 +393,8 @@ void xe_display_pm_runtime_suspend(struct xe_device *xe)
 		return;
 	}
 
+	intel_display_power_suspend(display);
+
 	intel_hpd_poll_enable(display);
 }
 
@@ -499,6 +501,8 @@ void xe_display_pm_runtime_resume(struct xe_device *xe)
 		return;
 	}
 
+	intel_display_power_resume(display);
+
 	intel_hpd_init(display);
 	intel_hpd_poll_disable(display);
 	skl_watermark_ipc_update(display);
-- 
2.47.3

