Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDF5EE0210
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 22:32:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6728110E1F4;
	Wed, 13 Sep 2023 22:32:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781E410E1C2
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 22:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694644357; x=1726180357;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uEL2ermgRb+uP22NyXI18ISm+NiifIVh3z1HuYrHrfw=;
 b=R/CkD3XkdACuBNTsi29ij6sKBvwc7IQXFEBngZ5Avyj0WgIDCoevC2um
 enDSqU+u4JfVdOF3Jt/AChvycvUa5GxgKjHnumsu+s0D9j2NmyzFNZ0Fy
 5I6Pl+tYsBHBaHLR5V7EkFbyE6DKrbVYpJk9Uz/YkhptnZtbQ+mVLD4NH
 /FPY8HnPNe5AYSKyJeGt/KsqWszPPwDt9goXY1dHbxM70hD9qm+PFDD1b
 FNQDXiGCEA4gvdcnkFmNPZniJkLxq67DtuPu70TWkkiPT+h1aOIhaQCju
 FwYEkpr+MoTho9Xv+jPGm67kSPbm3v5cTkSae1HYMp6REogLmHj2bLvPf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="442829020"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="442829020"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:32:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="868004481"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="868004481"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 15:32:36 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 13 Sep 2023 15:32:25 -0700
Message-ID: <20230913223228.2788706-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/3] uC management cleanup
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

A couple of simple cleanup/fixes for uC management, plus the addition of
overrides for the FWs.

Cc: John Harrison <John.C.Harrison@Intel.com>

Daniele Ceraolo Spurio (3):
  drm/xe/uc: Rename guc_submission_enabled() to uc_enabled()
  drm/xe/uc: Fix uC status tracking
  drm/xe/uc: Add GuC/HuC firmware path overrides

 drivers/gpu/drm/xe/xe_device.h     |  2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c |  2 +-
 drivers/gpu/drm/xe/xe_execlist.c   |  6 ++---
 drivers/gpu/drm/xe/xe_ggtt.c       |  2 +-
 drivers/gpu/drm/xe/xe_gt.c         |  4 +--
 drivers/gpu/drm/xe/xe_guc.c        |  3 +++
 drivers/gpu/drm/xe/xe_guc_pc.c     |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c |  4 +--
 drivers/gpu/drm/xe/xe_huc.c        | 15 +++++------
 drivers/gpu/drm/xe/xe_hw_engine.c  |  4 +--
 drivers/gpu/drm/xe/xe_irq.c        |  2 +-
 drivers/gpu/drm/xe/xe_module.c     | 10 +++++++
 drivers/gpu/drm/xe/xe_module.h     |  2 ++
 drivers/gpu/drm/xe/xe_uc.c         | 24 ++++++++++-------
 drivers/gpu/drm/xe/xe_uc_fw.c      | 42 +++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_wopcm.c      |  3 +--
 16 files changed, 87 insertions(+), 40 deletions(-)

-- 
2.41.0

