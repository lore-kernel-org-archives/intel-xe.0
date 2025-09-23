Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BEDCAC5A5
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 21:16:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837DC10E04A;
	Tue, 23 Sep 2025 21:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nh4IV671";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5131410E04A
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 21:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758662188; x=1790198188;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NNDi6a3XeU49V2EnLqEIN5oLLDQlPad5kV/srhky8Mo=;
 b=Nh4IV671p6cHD/yDQgozHD6yovf8wbM8J2pSENqL9sX41TH8Tyuiav2U
 8UHzhyswOkoB7rp3C2Ciuy1Yyj78VzpdY4deKT1/6RTcNFmWNZ9EBgaK+
 Pq1jqBtxRCKJxAcPs3JuRrmhJrz16UNfDsx2Sh+hQFb55KXBZpnOgSjew
 x7TY0jVbbWO/AsohoLsLn3X1pWBTMXRAmLZiq8XBUpMKAsi27e3/ZazNi
 XLhuDi6VpXvRRUCePUV8rN/Laa93KRgEsjE6BNGihgFujN4hD6DCZxBfH
 lg5upgB0HciG17J3Jp5sxxCVXknw6w8w8A55U2Vzr//RYPhrH5eNl3Rv4 g==;
X-CSE-ConnectionGUID: 5l6GIkeUSNS2e6BGODibdA==
X-CSE-MsgGUID: 1zf1RCZXSVKonuut4DRplw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64592575"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="64592575"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 14:16:27 -0700
X-CSE-ConnectionGUID: u9hBvZ4VTTqiDdvrNlLSEw==
X-CSE-MsgGUID: a0w2blNFSCKszq35AqUnng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="175989805"
Received: from pczakx-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.84.166])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 14:16:26 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/5] drm/xe/debugfs: Avoid use of wrapper functions
Date: Tue, 23 Sep 2025 23:16:08 +0200
Message-ID: <20250923211613.193347-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

With simple signature change of the dump() functions, we may get rid
of several trivial wrappers. That results in:

  add/remove: 2/12 grow/shrink: 3/6 up/down: 817/-1140 (-323)
  Function                                     old     new   delta
  xe_wa_gt_dump                                  -     773    +773
  xe_tuning_dump                               536     560     +24
  __pfx_xe_wa_gt_dump                            -      16     +16
  xe_mocs_dump                                 249     252      +3
  xe_pat_dump                                   59      60      +1
  __pfx_xe_wa_dump                              16       -     -16
  __pfx_workarounds                             16       -     -16
  __pfx_tunings                                 16       -     -16
  __pfx_topology                                16       -     -16
  __pfx_pat                                     16       -     -16
  __pfx_mocs                                    16       -     -16
  xelp_dump                                    279     258     -21
  xehp_dump                                    276     255     -21
  xelpg_dump                                   371     347     -24
  xehpc_dump                                   287     263     -24
  xe2_dump                                     552     528     -24
  workarounds                                   26       -     -26
  tunings                                       26       -     -26
  topology                                      26       -     -26
  pat                                           26       -     -26
  mocs                                          26       -     -26
  ____versions                               81408   81344     -64
  xe_wa_dump                                   736       -    -736
  Total: Before=2871712, After=2871389, chg -0.01%

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Michal Wajdeczko (5):
  drm/xe/debugfs: Update xe_gt_topology_dump signature
  drm/xe/debugfs: Update xe_wa_dump signature
  drm/xe/debugfs: Update xe_tuning_dump signature
  drm/xe/debugfs: Update xe_mocs_dump signature
  drm/xe/debugfs: Update xe_pat_dump signature

 drivers/gpu/drm/xe/xe_gt_debugfs.c  | 40 ++++-------------------------
 drivers/gpu/drm/xe/xe_gt_topology.c | 11 ++++++--
 drivers/gpu/drm/xe/xe_gt_topology.h |  2 +-
 drivers/gpu/drm/xe/xe_mocs.c        | 15 +++++++++--
 drivers/gpu/drm/xe/xe_mocs.h        |  8 +-----
 drivers/gpu/drm/xe/xe_pat.c         | 40 +++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_pat.h         |  7 +----
 drivers/gpu/drm/xe/xe_tuning.c      | 17 +++++++++---
 drivers/gpu/drm/xe/xe_tuning.h      |  2 +-
 drivers/gpu/drm/xe/xe_wa.c          | 19 +++++++++++---
 drivers/gpu/drm/xe/xe_wa.h          |  2 +-
 11 files changed, 87 insertions(+), 76 deletions(-)

-- 
2.47.1

