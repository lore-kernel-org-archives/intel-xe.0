Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D53BFF8862
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 13:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E693110E744;
	Mon, 27 Apr 2026 13:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SD+7uigh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1ECD10E2B0;
 Mon, 27 Apr 2026 13:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777295172; x=1808831172;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GjOxuVG4sQL59nu/J9HwwTTI5aEbFrV3iEwnvhxyBPw=;
 b=SD+7uighmOhUPSz/KuCrAA/+WVSrU8evPhM8FuXgpgLnS82FhdkkOcYC
 CZFwlBjjVqiTIY8iaCg4vSqRE9dve+JAV+A9OJnujBc5IQcaXkut1oEI9
 pJMMEbmI/w42gmqRy2v5tkkqDy/MkzC+oTq9P3QCqAkguQ+AHrIwHZ5YM
 Sph60WmNTUuP1B0PHn26lrtJfgqf5iRUvr14KHNzFSno/eEkXiwM/8/Cy
 Szi5fRjV3Uv56S7VoncF8w9hY3cBDYjuYwL4HnHHEB1JBsc1vQ8QOuWWa
 cAnf8g1sLZxfYin7U0gIApZKEBqP+iRb8BFEQLo8orU56i36nF5vhbXra g==;
X-CSE-ConnectionGUID: H3kvCgQmSrq6lFWYuMSYFA==
X-CSE-MsgGUID: bPotMi9MQaKvXlaGwoBc8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="88495002"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="88495002"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 06:06:12 -0700
X-CSE-ConnectionGUID: 8lfCh+mpR4iNcn0hV5F2Ig==
X-CSE-MsgGUID: T6Lqx7lTRn+o2Pf/Ri/9lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="235400500"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.244.126])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 06:06:11 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH] drm/i915/psr: Disable Panel Replay on Dell XPS 16 DA16260 as
 a quirk
Date: Mon, 27 Apr 2026 16:05:54 +0300
Message-ID: <20260427130554.86040-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

We are observing same problems with Dell XPS 16 DA16260 as we saw with XPS
14 DA16260. This device seem to have also LGD panel with same feature as in
XPS 14. Due to this disable Panel Replay as a quirk on this setup as well.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7682
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 883f297d4b83..b6e840bffd44 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -269,6 +269,14 @@ static const struct intel_dpcd_quirk intel_dpcd_quirks[] = {
 		.sink_oui = SINK_OUI(0x00, 0x22, 0xb9),
 		.hook = quirk_disable_edp_panel_replay,
 	},
+	/* Dell XPS 16 DA16260 */
+	{
+		.device = DEVICE_ID_ANY,
+		.subsystem_vendor = 0x1028,
+		.subsystem_device = 0x0dba,
+		.sink_oui = SINK_OUI(0x00, 0x22, 0xb9),
+		.hook = quirk_disable_edp_panel_replay,
+	},
 };
 
 void intel_init_quirks(struct intel_display *display)
-- 
2.43.0

