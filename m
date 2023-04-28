Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DD1C77B61
	for <intel-xe@archiver.kernel.org>; Fri, 28 Apr 2023 21:20:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36AA910E03B;
	Fri, 28 Apr 2023 21:20:00 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D60210E02F
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Apr 2023 21:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682716797; x=1714252797;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JTLlTvpYvTrHRRitryEvkwgrvxrcFvwvtw2PIxjupjk=;
 b=N40AMS+esTCy3kSetMXITIcz5BRVjlA3CJt9ycOIoht495VZFHCN8ecr
 Y/qDiOaFithIWjtxyLI06B9fNaGI+qx+m6Fh9QxmZLGq68MdoKsBDBt9F
 uikog5n/wYcKD+fzUvZjlmTDbDfTqVeE7wA0oGcRyW9E5QTKJ7/DvNwe4
 ZZ1olhMjD6Hp4d7UV6CtR2/P0hut4otKArUecakkqGnXuj6PW3iCOmkQg
 TS/aBqxM9SWXd6exoy1BXho+REju9OkE0sFPOXoQK27PooTm+7MeJzRQ5
 7R6T1Je1srveErsBxNgMRKEZCZtZhBw4+U55FaggcrOapv/RRPtz6BEAV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="349891633"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="349891633"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 14:19:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="694944771"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="694944771"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 14:19:55 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 28 Apr 2023 17:19:44 -0400
Message-Id: <20230428211948.4100170-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/4] drm/xe: Rework multi tile device memory
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
Cc: tejas.upadhyay@intel.com, michael.j.ruhl@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The vram initialization path does not take into account
each tile's actual memory size.

While updating this, simplify the rebar algorithm and clarify
some helper functions.

v2: Address review comments
    - separate tile sizing to the initial patch

Michael J. Ruhl (4):
  drm/xe: Rework size helper to be a little more correct
  drm/xe: Simplify rebar sizing
  drm/xe: Size GT device memory correctly
  drm/xe: Rename GPU offset helper to reflect true usage

 drivers/gpu/drm/xe/regs/xe_gt_regs.h   |   2 +-
 drivers/gpu/drm/xe/xe_bo.c             |   8 +-
 drivers/gpu/drm/xe/xe_bo.h             |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h   |  18 +-
 drivers/gpu/drm/xe/xe_gt_types.h       |  14 +-
 drivers/gpu/drm/xe/xe_migrate.c        |   6 +-
 drivers/gpu/drm/xe/xe_mmio.c           | 273 ++++++++++++++-----------
 drivers/gpu/drm/xe/xe_mmio.h           |   4 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  30 +--
 9 files changed, 200 insertions(+), 157 deletions(-)

-- 
2.39.2

