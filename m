Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54504C47DB3
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 22:34:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137DB112B7E;
	Mon, 29 Jan 2024 22:34:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F53110EF1B
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 22:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706567649; x=1738103649;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=npQpz0imq24OXcaMl42KiM2u7LOiLIj3LO5iWpshWkU=;
 b=JGN6KhAKwNg+7iGlgZiQPCRyd5Cp8B5MyhzvYjy/ey2GuWSgnPhkrVWN
 mJwbeDZzN4CtCwYqJL5dLCqi1+hiIKY9MLIEa1dXp1EV+ST+cmOoHgNAK
 uG7M5K9W/Q7zeaUKeNMG8WXPumLiI8BLtBseeQ6juPG/y8Gd5wVy4CPkM
 AmnehG/HmoEevbqUO0EvzwQwMwu00CTbGGJUJ4/9m7x0X7TMcZbFP/VZg
 uleZIZQ/12fZSEfrqI0oOguB0QnuKVpqQ9suN9j4tqMp8ZYSujb88wd1B
 u1+qs/jwPazK5cSDN2joCdoeUt+pCB6Ry9oUYDan4hq1cMDtQcwUyX6xv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="434279943"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="434279943"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 14:34:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3544076"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa004.fm.intel.com with ESMTP; 29 Jan 2024 14:34:07 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/1] drm/xe: Expose number of dss per group and helpers
Date: Mon, 29 Jan 2024 14:34:02 -0800
Message-Id: <20240129223403.150578-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Expose helper for dss per group, features like GuC register
capture will need this info to prepare buffer required.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>

Changes from prior revs:
v3: Rename functions with mcr removed
v2: Resend with cover letter

Zhanjun Dong (1):
  drm/xe: Expose number of dss per group and helpers

 drivers/gpu/drm/xe/xe_gt_mcr.c          | 40 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_mcr.h          | 17 +++++++++++
 drivers/gpu/drm/xe/xe_gt_topology.c     |  3 --
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  3 ++
 4 files changed, 59 insertions(+), 4 deletions(-)

-- 
2.34.1

