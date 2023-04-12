Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F61C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 18:48:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D075510E921;
	Wed, 12 Apr 2023 18:48:44 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4599110E124
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 18:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681325322; x=1712861322;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4n6S1CHxlZ7eUeuSIVk82BI2ies1kVqN17hZ28JSPC4=;
 b=Z1id6uCvJfwnnG+xczqYgWPgMKe+FVbC0pydNZvuSfadfWTkizhQscFK
 obYG+RyvdFBJYJ+VnTpJVYS5I83GqswF4BxF5fKOJ9VzFi+vISAcYUr3o
 inwRt9H2NZHlKp92Y6i6jkq+XqydyEmrR00jO0bng2/cF8RoYZm9FTmlw
 Ot/oa0Ort5uwg1NeyrEoOPGXH269Z+yTgaXc0lGFGzliBfGgl4mizAFBu
 p40/8E729AE/Jc/OLVvRVf6E79UgDhqfUkhwgqh63qoQtkq6wjAklWpe9
 tQoJx+1RdT5pwAla5OQ1XP9fRuZPD7VxgzeO56esI15Afl3J7BbQkWoez g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="430276541"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="430276541"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 11:48:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="691638607"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="691638607"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 11:48:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 11:48:29 -0700
Message-Id: <20230412184835.3157780-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] Meteorlake interrupt handling updates
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


Matt Roper (6):
  drm/xe/irq: Cleanup media GT interrupt flow
  drm/xe/irq: Improve warnings and assertions for GT handling
  drm/xe/irq: Process Gunit interrupts in relation to the device
  drm/xe: Fix xe_mmio_rmw32 operation
  drm/xe/irq: Ensure primary GuC won't clobber media GuC's interrupt
    mask
  drm/xe: Include GT ID in error message if TLB invalidation times out

 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   4 +-
 drivers/gpu/drm/xe/xe_guc.c                 |  11 +-
 drivers/gpu/drm/xe/xe_irq.c                 | 109 +++++++++++++++-----
 drivers/gpu/drm/xe/xe_mmio.h                |   2 +-
 4 files changed, 92 insertions(+), 34 deletions(-)

-- 
2.39.2

