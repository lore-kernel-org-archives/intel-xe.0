Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE77C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 10:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F2510E466;
	Tue, 31 Oct 2023 10:26:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1B210E465
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Oct 2023 10:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698748001; x=1730284001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8QbSuXifcv+rfYBx8JZi3gsBcVWQqvrnM0doszBvrW8=;
 b=Baxof5qwy7UtoqPbVn2aiG0rRoLlvxXDqojSrM1mKg7nsCgDIIhmvvNO
 quLcTJC8v6zAe8/Tb7wSQAAs6ibAqO4AY109OIi3gvLqP5xaeNn6Zd8Gj
 XTRtNHnIWwKsUF0rkWmd2EVsjzUIGV1gTcTnMjYt97+d06aRd+ljLUWAd
 s6EHjVlzAvgDDyBVSA7/xltS51g8vfEFHI9S0n7tzBNE4zBJCvhBA9ibo
 gG8z1xYYE7epke1PRc4TQthpUAkhfUJgL9Hn9MF7PLceXf5XP/p1JixCr
 ieeVcDg5ToreDLB2mJ6wYNNBop+5pFvxi/j8rO/mG6O7wDUz6Ww7GM2aw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="419369798"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="419369798"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 03:26:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="8287206"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa001.jf.intel.com with ESMTP; 31 Oct 2023 03:26:39 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 31 Oct 2023 16:05:24 +0530
Message-Id: <20231031103525.2433645-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V11 0/1] drm/xe: Count and report low level
 driver errors
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

This series adds low level driver error counter. Mainly adds :
1. APIs to count different category of errors under Tile and GT
2. Counter increment at all existing error tap points

Focus is not to add new error checks but maintain counter for errors
on existing errors which can create performance impact.

Later on when netlink interface is ready, we will export these
counters through netlink interface.

Tejas Upadhyay (1):
  drm/xe: Introduce and update counter for low level driver errors

 drivers/gpu/drm/xe/xe_device_types.h        | 16 ++++++++
 drivers/gpu/drm/xe/xe_gt.c                  | 41 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h                  |  4 ++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 13 ++++---
 drivers/gpu/drm/xe/xe_gt_types.h            | 18 +++++++++
 drivers/gpu/drm/xe/xe_guc.c                 | 16 +++++++-
 drivers/gpu/drm/xe/xe_guc_ct.c              | 43 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
 drivers/gpu/drm/xe/xe_reg_sr.c              | 22 +++++------
 drivers/gpu/drm/xe/xe_tile.c                | 41 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile.h                |  3 ++
 11 files changed, 198 insertions(+), 25 deletions(-)

-- 
2.25.1

