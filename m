Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC910EE20A8
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 14:49:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0861610E008;
	Fri,  6 Feb 2026 14:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JYIf9JAL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52B010E008
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 14:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770389365; x=1801925365;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mSPzWO0ALF1FRT+a0eGNKJFtUJfLRanmliRnhL8sF7w=;
 b=JYIf9JALER1LxL2JnPGKhaGW6H28EV56vxbhAtLQaFnLBVdrzNztsB8v
 qZ4/RnJ4h8b/J9hvF+QXRYmFPDFXD/uxyvYhrz7wydZfWDiDZCQpM6+m9
 wXyTR4tqioyWis3rCNVXei8yyFGXCYk+X88FrG9kahAHVbjUbm+vLVQks
 xkXbP4qmxIs5UfGKgletkd5tJ+2zxS+7XjRN8O90Wursk1tZlY4N9G294
 DpnW2yaByR8CuiiX2gfC14sQhNFhXGCCm+N4Bz7k+ZfPc7IsWH6T7DZXK
 gVqh9wFljtw6LVsV5/JdA11dsRWtMFh9a6E9kGIGpuDTJUXS4Bbo/D/NK g==;
X-CSE-ConnectionGUID: mvyfKstlTvuFp/3AS0xtMg==
X-CSE-MsgGUID: 80vFkWRBSweGQL8QBPW7Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="70789720"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="70789720"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 06:49:24 -0800
X-CSE-ConnectionGUID: 4Vxwp16PSfSdwB0ojRPJcQ==
X-CSE-MsgGUID: Mv88iensTx+GnDmhgTU+XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="210767420"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa008.fm.intel.com with ESMTP; 06 Feb 2026 06:49:22 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v1 0/4] drm/xe/vf: Fix exec queue creation during
 post-migration recovery
Date: Fri,  6 Feb 2026 15:53:30 +0100
Message-Id: <20260206145334.674679-1-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
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

Fix a few issues which sporadically happen due to a race between
post-migration fixups procedure, and exec queue creation routine.

Tests which create a lot of exec queues were sporadically failing
due to one of LRCs having its state within VRAM damaged. This series
fixes most of such issues, by prolonging wait for fixups within EQ
creation, and also re-creating the one LRC whose creation happened
at the time of VF switch.


Tomasz Lis (4):
  drm/xe/queue: Call fini on exec queue creation fail
  drm/xe/vf: Avoid LRC being freed while applying fixups
  drm/xe/vf: Wait for default LRCs fixups before using
  drm/xe/vf: Redo LRC creation while in VF fixups

 drivers/gpu/drm/xe/xe_exec_queue.c        | 13 +++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 32 ++++++++++++++---------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  3 ++-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 +--
 4 files changed, 34 insertions(+), 18 deletions(-)

-- 
2.25.1

