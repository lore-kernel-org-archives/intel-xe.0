Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B66C7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 19:43:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B85C88FF9;
	Thu, 25 May 2023 19:43:39 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64C688FF9
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 19:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685043815; x=1716579815;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=03hTgL2f1d4/89TqRpl9RHmH4VoG4IfYDK0J+pi9A3Q=;
 b=SgafV/fXTvSxYcffqPHlZ5PoT81FOWKv68T0WXxUX8CI1NBQBVDYtBud
 aq6tQFtct8qkr8q6Q/NiquLv5CDhfbeJLuKVoQgSuGqsCVqzHKZSTZ6mL
 wBbdozWBb6lUT9JKkN8CwNBM+0TBtu6HrpkrMvkk0LtHzp4FsEfecQrVK
 LUZrBFku2xDnej2g1s2O70wlVHMX9zkxPjSSI48VW0AtNcHk6SNc1ebEk
 Vya+shCilcV8edhSdAMj1IH5oOzD0fTxqQwdev4RZkuPl7okl2Ctvvp2f
 QPHlzJAtHrTKWHrQjYfmQjEMeeOkdOXyhAXm3n01pzbkSjNS+ydWxrnKr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="351514326"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="351514326"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 12:43:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="774799872"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="774799872"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 12:43:34 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 15:43:22 -0400
Message-Id: <20230525194326.1648781-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v7 0/4] drm/xe: Rework multi tile device memory
 initialization
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
Cc: matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The vram initialization path does not take into account
each tile's actual memory size.

While updating this, simplify the rebar algorithm and clarify
some helper functions.

v2: Address review comments
    - separate tile sizing to the initial patch
v3: Re-add deleted warning for small bar systems
v4: Address review comments
    - stolen size check should be against pci resource
    - limit size (patch 2) to keep bisection correct
v5: Include actual memory size for Xe level for use (1:1 map for xe_migrate,
    for example)
v6: Limit gt memory size to visible size (small bar)
    Fix forced resize missed __fls
v7: Use GPU offset information (helper) for PT rather than IO offset

Michael J. Ruhl (4):
  drm/xe: Rework size helper to be a little more correct
  drm/xe: Simplify rebar sizing
  drm/xe: Size GT device memory correctly
  drm/xe: Rename GPU offset helper to reflect true usage

 drivers/gpu/drm/xe/regs/xe_gt_regs.h   |   2 +-
 drivers/gpu/drm/xe/xe_bo.c             |   8 +-
 drivers/gpu/drm/xe/xe_bo.h             |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h   |  16 +-
 drivers/gpu/drm/xe/xe_gt_types.h       |  14 +-
 drivers/gpu/drm/xe/xe_migrate.c        |   4 +-
 drivers/gpu/drm/xe/xe_mmio.c           | 276 ++++++++++++++-----------
 drivers/gpu/drm/xe/xe_mmio.h           |   6 +-
 drivers/gpu/drm/xe/xe_pt.c             |   5 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  34 +--
 10 files changed, 208 insertions(+), 159 deletions(-)

-- 
2.39.2

