Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A96AC77B6C
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 22:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BCE10E9E7;
	Wed, 12 Apr 2023 22:52:58 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C10610E9D8
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 22:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681339976; x=1712875976;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O7YotP0Brb3gYqUtzSGfk0PqgFcc9oLHCYPKLmAudDU=;
 b=j4W+gnN+4uPLgwNfVakIQ4p2AWsEi4zsLca//tWVmQFv/FxUe2/9IsAU
 6ve/UrrSvirMCMxF7fe0JCaYWhn/pAosDbYX15zT/B6NxHic4VC/+8i+5
 RzigIeimsQZipBoDJC1Us9ZwoCTLZFbgcUKdwWVBLuufnMc/hqLu01aAK
 wmtFOogHni2QtUYyQWxplczdmQat8LRveyO6XZdSBU/NvrSTbwPdRNKda
 2czngyydY74KKS2H13bbZ6dmzyQEeOlipYN1z7uwFRVO3Gm+4+OR7aMvP
 q2gRUMCew73D2DL0da1FDiK7FcdmQbPuQR1p4Ub1prydpXOeI4OTPsn3N A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="344038891"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="344038891"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 15:52:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="721757066"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="721757066"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 15:52:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 15:52:40 -0700
Message-Id: <20230412225248.3229571-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/8] Meteorlake interrupt & TLB handling
 updates
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Although Meteor Lake has multiple GTs, we need to be careful not to use
multi-tile flows when processing interrupts.  The platform as a whole
only has a single copy of the SGunit interrupt registers, and interrupts
relating to the media GT are delivered as part of the primary GT's IRQ
reporting flow.  Only when an engine (or GuC) interrupt is raised do we
need to determine which GT it relates to for further processing.

The whole multi-GT vs multi-tile situation is made more confusing by the
Xe driver's misuse of 'gt' as the target of all register operations.
That's probably something we should refactor in the future so that
xe_mmio_*() will take something more appropriate than an xe_gt
parameter.

With the fixes in this series, interrupts are now properly flowing on
both the primary and media GT for MTL.  We're still seeing some TLB
invalidation timeouts, but those no longer seem to be caused by problems
with interrupt handling.


Matt Roper (8):
  drm/xe/irq: Cleanup media GT interrupt flow
  drm/xe/irq: Improve warnings and assertions for GT handling
  drm/xe/irq: Process Gunit interrupts in relation to the device
  drm/xe: Fix xe_mmio_rmw32 operation
  drm/xe/irq: Ensure primary GuC won't clobber media GuC's interrupt
    mask
  drm/xe: Include GT ID in error message if TLB invalidation times out
  drm/xe: Invalidate TLB on all affected GTs during GGTT updates
  drm/xe/tlb: Obtain forcewake when doing GGTT TLB invalidations

 drivers/gpu/drm/xe/xe_ggtt.c                |  24 +++-
 drivers/gpu/drm/xe/xe_ggtt_types.h          |   2 +-
 drivers/gpu/drm/xe/xe_gt.c                  |   4 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   4 +-
 drivers/gpu/drm/xe/xe_gt_types.h            |   2 +
 drivers/gpu/drm/xe/xe_guc.c                 |  11 +-
 drivers/gpu/drm/xe/xe_irq.c                 | 115 +++++++++++++++-----
 drivers/gpu/drm/xe/xe_mmio.h                |   2 +-
 8 files changed, 125 insertions(+), 39 deletions(-)

-- 
2.39.2

