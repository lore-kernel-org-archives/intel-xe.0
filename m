Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F572C7EE24
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 19:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E3410E257;
	Mon, 15 May 2023 19:26:41 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5209610E257
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 19:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684178799; x=1715714799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0lMQNByeVJi/Pd1hcQFyeRSv9W9RxnNjZSi5PrDOXkI=;
 b=YTqUCPir4kK/Y5+0UKSbzw/FSQWlNp3RYI8slHLswgLV+JKlxev+O/Rr
 4mlYLLNkGhNOLiOebd6hd2nH+0ZopGy/tvlHB6xlXr90n60Iqd8JoelcX
 FfFajy/wIs1ARVtHPAfyjjqc/WgkEK2DgFWBOZAHS5dRLN2jTZVbd/5vR
 8VIcV8u40nOx1elQikAm44g7pdYP7Izm+tvgB945amETaaCMaYTDS6vaE
 2iPCtDuiHHtGMqB9itZW/gL8O79nZ2Bmhkfs0NyWYhEfSQq8hl23OgKmW
 CGI48XpL7v4EYCbVu0rXMmWVewfariGXxzk4c76Cc3krirCYb+di15fpw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="353566685"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="353566685"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 12:26:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="733998689"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; d="scan'208";a="733998689"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 12:26:37 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 15 May 2023 15:26:24 -0400
Message-Id: <20230515192628.1990279-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 0/4] drm/xe: Rework multi tile device memory
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
 drivers/gpu/drm/xe/xe_mmio.c           | 277 ++++++++++++++-----------
 drivers/gpu/drm/xe/xe_mmio.h           |   6 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  34 +--
 9 files changed, 208 insertions(+), 155 deletions(-)

-- 
2.39.2

