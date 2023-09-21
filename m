Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF902CD4958
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 05:55:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADC510E06B;
	Thu, 21 Sep 2023 05:55:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C612C10E06B
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 05:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695275720; x=1726811720;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kVhxomzbYar6AbsuFH3ut39w6xFOf+waFbZO+pC/aP8=;
 b=mWwuXxxeNu9xR1c4/yOd9fn2eWksOfk6kKJ14XzlmVoaArfdNkhjZWvZ
 kif5P538bK0RxgPR4rqcJ5MaQJ/EOBgJHKlDQgkhV64L7NhL+W//h3HBm
 ozw+cElouSZZpoAtU8y6Wjb0WQyCEiCZrTryd2gykrIijkOfl60dmLIgv
 9Dg0Kvuw5CydGUzzY8a0pMbryzrvFRHsgTF+b1LzuuusDwQ2hxwVdxIbv
 K+gFN/zsbpzZwHMUh85B6AIUYJEgWllq3yvfNywcjQ97XT8eyBf89UWKc
 mcDCPs09K1UYsHyzg0XxDtxQNsfdRw2Bw2XIeUOrpJqkJHlHizmtWvQvW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="444528065"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="444528065"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 22:55:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="993939368"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="993939368"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga006.fm.intel.com with ESMTP; 20 Sep 2023 22:55:18 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 21 Sep 2023 11:33:12 +0530
Message-Id: <20230921060314.5933-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] drm/xe: Count and report low level driver
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
Cc: Matt Roper <matthew.d.roper@intel.com>
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
  drm/xe: Indroduce low level driver error counting APIs
  drm/xe: Update counter for low level driver errors

 drivers/gpu/drm/xe/xe_device_types.h        | 13 +++++++++++
 drivers/gpu/drm/xe/xe_gt.c                  | 24 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 ++
 drivers/gpu/drm/xe/xe_gt_types.h            | 12 ++++++++++
 drivers/gpu/drm/xe/xe_guc.c                 |  3 +++
 drivers/gpu/drm/xe/xe_guc_ct.c              | 20 +++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_pc.c              | 10 +++++++--
 drivers/gpu/drm/xe/xe_guc_submit.c          | 16 +++++++++++++
 drivers/gpu/drm/xe/xe_irq.c                 |  1 +
 drivers/gpu/drm/xe/xe_reg_sr.c              |  4 ++++
 drivers/gpu/drm/xe/xe_tile.c                | 25 +++++++++++++++++++++
 11 files changed, 126 insertions(+), 4 deletions(-)

-- 
2.25.1

