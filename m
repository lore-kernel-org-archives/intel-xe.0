Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F903C77B75
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 16:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC54A10E450;
	Wed, 17 May 2023 16:15:05 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C9010E450
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 16:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684340104; x=1715876104;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jRvu4QaSOdiBNpZIhN4p2f9RNFOKGxViPYyb2ErHi90=;
 b=Vis++c+Mj9RF8IM/gTOVB2VxOUIahUSk3igYHn3yGzUwTSJAOfH4BSmd
 mjoab+Ay/vYJ3vZVYLnzh5hu3HdQBswHBe/0RtTBkCdvafaTqhcJAEUXs
 GArzm8Tw3WBbxOMFSOvc6TRvIg74JTRopLsck0VkUMUIGSnUYEEZ9E5pv
 1tGPJSuG/7kST6Q54PnJ89lv9QKK6TSinFLwQaL2c+/KKHjplpTfkwt3b
 eJOBoRXXkMniuyl/7Y93NJjiXViUZlOZy84pulmMWtT1cGBh0Qg+2uGBt
 bF1GoHjs33sWvREwaDqrP2fu3aNwu+7Dt7ABAqfVd+8URmOmTsfLfLzUO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="351823444"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="351823444"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 09:09:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="734744806"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="734744806"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 09:09:03 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 17 May 2023 12:08:53 -0400
Message-Id: <20230517160857.2791619-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 0/4] drm/xe: Rework multi tile device memory
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
 drivers/gpu/drm/xe/xe_mmio.c           | 279 ++++++++++++++-----------
 drivers/gpu/drm/xe/xe_mmio.h           |   6 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  34 +--
 9 files changed, 210 insertions(+), 155 deletions(-)

-- 
2.39.2

