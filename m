Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D879CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 19:58:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B5D10E7C3;
	Wed, 27 Aug 2025 19:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aee4f6+W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829F410E7C3
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 19:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756324715; x=1787860715;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5Z8DJ93qm9ncnDFNLKcQbxbXWNuoPQEbZr3niy0ehXY=;
 b=aee4f6+WxXlzPwe2yNojODJdxfLzwofsSA4hAbQG4oPKcdT1h2OM/cy1
 HHVnafmlqVOsDLjpDhmSWCxSdO/TgrWMP2comcda3QjIju4L3lV0ROl8o
 QLOVWzOk3qg5MY30Miv9cjRlhcr6FatpMNHJCBP89WUOggSCrQYKzXIeE
 wgB4QCuXlipgWvNXphPySQHBEl74x4PyhOWNbK/4GhEH3YvvKziajF8Pl
 xh7t7Rp00cAlrGKQ4B3kPA1m73feN9qEBohok6lTDXWb0bT0uHDYl5t7A
 2SYEJJ4JIrfqlQl6loJLEqRRHKbPqRbHlzBe0+mqKr+L1zU5bJ38eVq71 w==;
X-CSE-ConnectionGUID: gQJN4LQKRUyT8oIokI5bjQ==
X-CSE-MsgGUID: 5jLT07SnSeKLu3QVPGoW2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58438228"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58438228"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:58:35 -0700
X-CSE-ConnectionGUID: uTx+c7cgQweY/l5JwyRLtA==
X-CSE-MsgGUID: UWnfDAavTDaVX39O/bjWJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="169172720"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:58:35 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH] drm/xe: Extend Wa_22021007897 to Xe3 platforms
Date: Wed, 27 Aug 2025 12:57:55 -0700
Message-ID: <20250827-wa-22021007897-v1-1-96922eb52af4@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250827-wa-22021007897-fbea1fdd036d
X-Mailer: b4 0.15-dev-b03c7
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

WA 22021007897 should also be applied to Graphics Versions 30.00, 30.01
and 30.03. To make it simple, simply use the range [3000, 3003] that
should be ok as there isn't a 3002 and if it's added, the WA list would
need to be revisited anyway.

Cc: Matt Atwood <matthew.s.atwood@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 52c7df4c3afd8..e53edf1e5100c 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -879,6 +879,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 			     DIS_PARTIAL_AUTOSTRIP |
 			     DIS_AUTOSTRIP))
 	},
+	{ XE_RTP_NAME("22021007897"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3003), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
+	},
 };
 
 static __maybe_unused const struct xe_rtp_entry oob_was[] = {



