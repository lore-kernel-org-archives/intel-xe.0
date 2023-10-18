Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD40CDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 07:46:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B462610E389;
	Wed, 18 Oct 2023 07:46:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088F510E389
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 07:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697615190; x=1729151190;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kBStgkpwWfUlYnwlJ12V/iKyZCJu9+S8Ppvuax4+Wu4=;
 b=bhuiGwzB7N9kvkmh6MPVqsiSx3b4CXPL8OGY2gyScO40HxDtlTpV1ANV
 BEdMrZ+IifisQm9Fkf69a6a88yrMEEhxdiZ1AU4mDbfX3zjxBEvEwwKc8
 V1Q0+/urLKLlYwKpngNWlFmVZUh+go5Sk/hoYRWcklWBbroMOucCmoFtF
 dOwJFQxrHlpIb9d16fLkorfN29FMSlXykp4U3Kl416Crdph17heC3aJHB
 l9MR+aqkZLpoydDqqJrdgqnyveCssJzkqHQOOzfqxp/1cMaUweW8AubhD
 gTItRAUr1zKxAT7k3azl/6ZUFgLeDiTDjLcDk27/mwdeMMskytUpm29HL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="383182501"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="383182501"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 00:46:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="930073374"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="930073374"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga005.jf.intel.com with ESMTP; 18 Oct 2023 00:46:26 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 18 Oct 2023 13:24:55 +0530
Message-Id: <20231018075457.1806599-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V7 0/2] drm/xe: Count and report low level driver
 errors
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
Cc: Vishwanathapura@freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series adds low level driver error counter. Devided
into below patches:
1. Add APIs to count different category of errors under Tile and GT
2. Add counter increment at all existing error tap points

Focus is not to add new error checks but maintain counter for errors
on existing errors which can create performance impact.

TODO: Later on when netlink interface is ready, we will export these
counters through netlink interface.

Tejas Upadhyay (2):
  drm/xe: Introduce low level driver error counting APIs
  drm/xe: Update counter for low level driver errors

 drivers/gpu/drm/xe/xe_device_types.h        | 15 +++++++
 drivers/gpu/drm/xe/xe_gt.c                  | 41 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h                  |  4 ++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 13 +++---
 drivers/gpu/drm/xe/xe_gt_types.h            | 17 ++++++++
 drivers/gpu/drm/xe/xe_guc.c                 | 15 ++++---
 drivers/gpu/drm/xe/xe_guc_ct.c              | 44 +++++++++++----------
 drivers/gpu/drm/xe/xe_guc_pc.c              |  6 ++-
 drivers/gpu/drm/xe/xe_guc_submit.c          | 11 ++++--
 drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
 drivers/gpu/drm/xe/xe_reg_sr.c              | 22 +++++------
 drivers/gpu/drm/xe/xe_tile.c                | 41 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile.h                |  3 ++
 13 files changed, 189 insertions(+), 49 deletions(-)

-- 
2.25.1

