Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059B5C678D5
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 23:34:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D001410E3A2;
	Tue, 21 Feb 2023 23:34:08 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE9F10E391
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 23:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677022446; x=1708558446;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=11Hr1Loz+DRdEpU/uetkIyCs+zPynJFrNj2HTUSVdjs=;
 b=OROuaWueRCaUgay1r4jSzterYLadmKNVLrVMUn4DxXbtcM+ZycUtqH2Y
 +P08V2IJkuUXIKz26zziayzS1nDX+4eQcY7e/MGp0608qjLSzTxfVBZCB
 BhEKbLQ1fpXhrP+Qt61q8gT5piyNrTvqbGZjrlVPUKKnt59DYF8OYfJeV
 4fgAMOdv4DWLS2Fqbtb36F5/bvr6+nDtUJppXkqatpMAND1LCeocny/cY
 qCkelh08nlQPeLbZ2YJD0Y107wgJMSPhuy8Md+ef9M4GdpuzLQxKmgTyX
 onFjj9w7oItKVa4i4JKTE8zaMjqSCybiznpFCFu9byPM2yVEyeUd+YqQQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="313156245"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="313156245"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 15:34:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="621691830"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; d="scan'208";a="621691830"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 15:34:05 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Feb 2023 15:33:42 -0800
Message-Id: <20230221233348.883897-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] Cleanup warnings (fix build with W=1)
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Build with W=1 and fix all the warnings after applying both this series
and https://lore.kernel.org/intel-xe/20230221194002.819026-1-lucas.demarchi@intel.com/T/#t
([PATCH v3 00/13] Start register cleanup).

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/211

Lucas De Marchi (6):
  drm/xe: Make local functions static
  drm/xe: Fix application of LRC tunings
  drm/xe: Fix kunit integration due to missing prototypes
  drm/xe: Remove unused functions
  drm/xe: Add missing doc for xe parameter
  drm/xe: Add missing include xe_wait_user_fence.h

 drivers/gpu/drm/xe/tests/xe_bo.c        | 54 ++++++++++++++-----------
 drivers/gpu/drm/xe/tests/xe_dma_buf.c   |  2 +
 drivers/gpu/drm/xe/tests/xe_migrate.c   |  6 +++
 drivers/gpu/drm/xe/xe_gt.c              |  7 ++--
 drivers/gpu/drm/xe/xe_gt_topology.c     | 25 ------------
 drivers/gpu/drm/xe/xe_guc.c             |  4 +-
 drivers/gpu/drm/xe/xe_irq.c             |  2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c  |  1 +
 drivers/gpu/drm/xe/xe_tuning.c          | 15 ++++++-
 drivers/gpu/drm/xe/xe_tuning.h          |  2 +
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  8 ++--
 11 files changed, 68 insertions(+), 58 deletions(-)

-- 
2.39.0

