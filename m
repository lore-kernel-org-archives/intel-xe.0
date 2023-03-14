Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467F4C7618D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 00:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B6810E6AA;
	Tue, 14 Mar 2023 00:30:48 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A68410E6A7
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 00:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678753845; x=1710289845;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gK28/aE1pLc0MHvkWxIk6ydUyd7iGR6ucxBV/dc7uqk=;
 b=jSvd4sKm3y7bXf7cy3SKULqRDzQZLMztNSPexif0e6xM2o2d9DsAvOWj
 F7vKhdEF8a4byKeSkxIDK3T8B+USjzS4DXiQTYHrbBKz5tYnpBIYNq1gE
 W7066CjvQUz6Q2MU0POR5s2x1UusP+qdFl9xyxopcXkk2P/RN5qnkaZkT
 rH38y0mICBOwMpQkeSFSdmgPXLnb21OugZW4vOhK5RJMAyCATUTuKT82M
 CH5UxyuofeHFuGkF4sTroftPWi4hLiEjUgxLYE0CFlSxHCID9cBhZipSC
 iMOnX0B2ftAXRYYy7gtyDTNwHxN1taDB9inNyGBeH+eVIINCe0kQdBQQn w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="402168019"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="402168019"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:30:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="789116671"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="789116671"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:30:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 17:29:58 -0700
Message-Id: <20230314003012.2600353-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 00/14] DG2 + PVC + ADL workarounds and infra
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some of the infra patches that got reviewed in v1 were applied.
Almost all patches from v2 were also reviewed, but one patch in the middle
blocks them. Also this includes missing workarounds from ADL-S and ADL-P.

Tested in DG2, ADL-S, ADL-P and PVC. The latter needs one additional patch:
https://lore.kernel.org/intel-xe/20230310191430.2229799-1-lucas.demarchi@intel.com/T/#u
(or passing enable_display=0 module param).

v3:
  - Add ADL-S and ADL-P workarounds
  - Move the patch with policy on preemption to the end, so it doesn't block
    the other patches. Also fix it to apply to all graphics versions.

Lucas De Marchi (14):
  drm/xe/rtp: Add match helper for gslice fused off
  drm/xe/reg_sr: Tweak verbosity for register printing
  drm/xe: Print whitelist while applying
  drm/xe/debugfs: Dump register save-restore tables
  drm/xe: Reorder WAs to consider the platform
  drm/xe: Add PVC gt workarounds
  drm/xe: Add PVC engine workarounds
  drm/xe: Add missing DG2 gt workarounds and tunings
  drm/xe: Add missing DG2 engine workarounds
  drm/xe: Add missing DG2 lrc tunings
  drm/xe: Add missing DG2 lrc workarounds
  drm/xe: Add missing ADL-P engine workaround
  drm/xe: Add missing LRC workarounds for graphics 1200
  drm/xe: Move policy on preemption from WAs to tunings

 drivers/gpu/drm/xe/regs/xe_gt_regs.h  |  92 +++++-
 drivers/gpu/drm/xe/xe_gt_debugfs.c    |  30 ++
 drivers/gpu/drm/xe/xe_hw_engine.c     |   2 +
 drivers/gpu/drm/xe/xe_reg_sr.c        |  32 ++
 drivers/gpu/drm/xe/xe_reg_sr.h        |   2 +
 drivers/gpu/drm/xe/xe_reg_whitelist.c |  59 ++++
 drivers/gpu/drm/xe/xe_reg_whitelist.h |  10 +
 drivers/gpu/drm/xe/xe_rtp.c           |  16 +
 drivers/gpu/drm/xe/xe_rtp.h           |  11 +
 drivers/gpu/drm/xe/xe_tuning.c        |  47 +++
 drivers/gpu/drm/xe/xe_tuning.h        |   1 +
 drivers/gpu/drm/xe/xe_wa.c            | 408 +++++++++++++++++++++++---
 12 files changed, 672 insertions(+), 38 deletions(-)

-- 
2.39.0

