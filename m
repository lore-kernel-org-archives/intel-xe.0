Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2DDC001DF
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 18:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E2310E39E;
	Wed, 16 Aug 2023 18:05:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC21710E39E
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 18:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692209109; x=1723745109;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xFrwqW+Pl0Qxd5wGK6IhohcldlUgzp3jKKOsaepvoxo=;
 b=nu+vFovkudILLHQ8kL9hE3Oty+/XfKU+dbY+5Km2TbbE9yao3ZDkVYPf
 L2Ec+viqm0yQT1YA3u5bpmBO6oW1Bb+cF0FjJHcuGkWPVJoYIvgH3P5wh
 trfg7auzPanybx/WFL8q/++29AIKFUT03Q9s0JvICLkAMtUgxoo9L7OvO
 uJy2HvIH72ZMdf2UxJ3A0CwLnbFRgYoO779BEX/ePPuYxVcNzlsnPvF6f
 NqlkzLIlBNzD3fphSndZ744FotU/zNPGlVZsrEKZch2R8F3Z0rxsn9oIK
 XKVQjF/lJ1GaZvmi5KYYe7oPVq0Yb7Y7Q/WYjT8IQeH52L3I0Y9+ujpDQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="458956560"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="458956560"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 11:04:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="980816306"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="980816306"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 11:04:32 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 16 Aug 2023 11:04:19 -0700
Message-ID: <20230816180425.1481448-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] Add plumbing for submitting to the GSCCS
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

The GSCCS is used to load and communicate with the GSC FW. This series
adds all the required defines and functions to submit to the GSCCS. Note
that the GSCCS is not added to the list of available engines as part
of these changes because we have no use of it until we add support for
the GSC FW (which will come in a separate series after this one is
merged).

Cc: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>

Daniele Ceraolo Spurio (6):
  drm/xe: common function to assign queue name
  drm/xe: base definitions for the GSCCS
  drm/xe: add GSCCS irq support
  drm/xe: add GSCCS ring ops
  drm/xe: GSC forcewake support
  drm/xe: don't expose the GSCCS to users

 drivers/gpu/drm/xe/regs/xe_gt_regs.h    |  5 +++++
 drivers/gpu/drm/xe/regs/xe_regs.h       |  1 +
 drivers/gpu/drm/xe/xe_exec_queue.c      | 26 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h      |  1 +
 drivers/gpu/drm/xe/xe_execlist.c        | 20 +------------------
 drivers/gpu/drm/xe/xe_force_wake.c      |  7 +++++++
 drivers/gpu/drm/xe/xe_guc.h             |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c         |  8 ++------
 drivers/gpu/drm/xe/xe_guc_submit.c      | 20 +------------------
 drivers/gpu/drm/xe/xe_hw_engine.c       | 10 ++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  2 ++
 drivers/gpu/drm/xe/xe_irq.c             | 25 +++++++++++++++++-------
 drivers/gpu/drm/xe/xe_lrc.c             |  1 +
 drivers/gpu/drm/xe/xe_ring_ops.c        | 26 ++++++++++++++++++++-----
 14 files changed, 97 insertions(+), 56 deletions(-)

-- 
2.41.0

