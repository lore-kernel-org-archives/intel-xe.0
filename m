Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8A4E80AAD
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 14:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394E910E53B;
	Wed, 27 Sep 2023 14:21:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62C510E53B
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 14:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695824477; x=1727360477;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ihmjAwgK/srpzMs9Nj+9uo1BfibtHCFHmGuLOI4fVSs=;
 b=Vs/xWv3dNpI1B/ANzOyMrjFWI4yIOhZYpnMxpvv/XqWObjYcAJ5BNTFa
 U6C3vSHxDu7AJ7xng2L09y2wTUuhD1IacliLkWPc+dXXIKb2XvaBHnjGr
 834f2UODtYCi11uUSd8aPnqdtl2fFGmzIbJOnetTNB0BTbzZ0Yet0VyZv
 WoEhAzyDlQlxUu7zUpVWnKLRC9v8y2JLLqwtnRN2fg2cAccO6Y5fQs3pL
 bZij6S4xYUszqD1reFzACk1hVI62RaosL8JPSNo2AVQfMCkbekYxpYuHd
 R1AQ4IBv5TrsFURJ46W1rsxF6yv1bYRx5OJKc+/t6DfVZRBIsLT4seXRT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="372178007"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="372178007"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 07:21:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="1080184764"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="1080184764"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga005.fm.intel.com with ESMTP; 27 Sep 2023 07:21:15 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 19:59:17 +0530
Message-Id: <20230927142919.272895-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V4 0/2] drm/xe: Count and report low level driver
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
Cc: matthew.d.roper@intel.com
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

 drivers/gpu/drm/xe/xe_device_types.h        |  9 +++++
 drivers/gpu/drm/xe/xe_gt.c                  | 18 +++++++++
 drivers/gpu/drm/xe/xe_gt.h                  |  3 ++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 15 +++++--
 drivers/gpu/drm/xe/xe_gt_types.h            | 10 +++++
 drivers/gpu/drm/xe/xe_guc.c                 | 15 ++++---
 drivers/gpu/drm/xe/xe_guc_ct.c              | 43 ++++++++++++--------
 drivers/gpu/drm/xe/xe_guc_pc.c              | 16 +++++---
 drivers/gpu/drm/xe/xe_guc_submit.c          | 44 +++++++++++++++------
 drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
 drivers/gpu/drm/xe/xe_reg_sr.c              | 19 ++++++---
 drivers/gpu/drm/xe/xe_tile.c                | 18 +++++++++
 drivers/gpu/drm/xe/xe_tile.h                |  2 +
 13 files changed, 165 insertions(+), 53 deletions(-)

-- 
2.25.1

