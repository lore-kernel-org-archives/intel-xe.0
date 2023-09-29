Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BF8E743EC
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 06:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C2210E0DD;
	Fri, 29 Sep 2023 06:16:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD94310E0DD
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 06:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695968175; x=1727504175;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qxCBaQy6QHoUv3GxJ/9S7RL+aMxdBGoDgU094PfX5oc=;
 b=cDaJE7/Inz56viJjSRY2pVqs/dLJmdIrDSa+TbDYOkprWS+pmVT/3usg
 jhfSHDPYwPdmtUy0StKdqYtpoILd3Xb9bjkRbee66UJwRW4XwEtmAohAY
 yHIJkrnXoaRNQHNwsP+sXxwXJDUEM70myedFjonqdZEi8kZGr5rbMP1Xo
 2vCPP5Ao8yYii3fTuQ8nCyovApZnxJBgoUN5GO0UJTIKZyI8Z7NxHZlOD
 N6JgmulCxMChX5BZhqO6HTeWmzx4Wjo6N9300R8zAF05nFK9tWdT8NCG0
 oaD6pIXdyFaV+w7nXtNXpJ0xZnXsiP+nh1itL7bCTsbJ6jRftYmngEWM0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="386104567"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="386104567"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 23:16:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="923521132"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="923521132"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga005.jf.intel.com with ESMTP; 28 Sep 2023 23:16:13 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 29 Sep 2023 11:54:18 +0530
Message-Id: <20230929062420.394375-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V5 0/2] drm/xe: Count and report low level driver
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
Cc: Roper@freedesktop.org, Wajdeczko@freedesktop.org,
	Matthew D <matthew.d.roper@intel.com>
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

 drivers/gpu/drm/xe/xe_device_types.h        |  9 ++++
 drivers/gpu/drm/xe/xe_gt.c                  | 24 +++++++++++
 drivers/gpu/drm/xe/xe_gt.h                  |  4 ++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 15 +++++--
 drivers/gpu/drm/xe/xe_gt_types.h            | 10 +++++
 drivers/gpu/drm/xe/xe_guc.c                 | 15 ++++---
 drivers/gpu/drm/xe/xe_guc_ct.c              | 44 ++++++++++++-------
 drivers/gpu/drm/xe/xe_guc_pc.c              | 16 ++++---
 drivers/gpu/drm/xe/xe_guc_submit.c          | 47 +++++++++++++++------
 drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
 drivers/gpu/drm/xe/xe_reg_sr.c              | 20 ++++++---
 drivers/gpu/drm/xe/xe_tile.c                | 23 ++++++++++
 drivers/gpu/drm/xe/xe_tile.h                |  3 ++
 13 files changed, 183 insertions(+), 53 deletions(-)

-- 
2.25.1

