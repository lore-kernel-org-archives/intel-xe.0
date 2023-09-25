Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BCECE7A81
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 14:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E4710E25E;
	Mon, 25 Sep 2023 14:16:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70C210E255
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 14:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695651370; x=1727187370;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jXI+fK5IVUE/MbWZQh44UWzamXfzriQnCjWp1hIhsF8=;
 b=HjyTDMq1zAhjmrZPKAZK8gg8qT5sHhHXo3ZF6q0Dx5eoa/ReRcnQ7m+w
 GOReEApiP1oqv/PfEOOfRHH5ANOHjJa9GabKdv6j63lvVR79PhkRFcXsf
 oluCZhhvTkRG9RMxgaABwLZ0xl3ivQE8OZpfJgwAvNEk/k4YlNPOYWlEf
 15EJxogM0Xldn1kzkMv5m2sCzCcJt8iODnhNbf2HLB+TZG+5ROye0TkZm
 dk3gojYJXvIvYJ14cO1BL+EsN4vUS5SZ7HJAQvn3M4A5SpKv2XiPWZ3Nh
 dMSGZWt2VAYjYj+dfjMotosXcrSAyZYl5DyriXTLTxs+EeUvMVDZr5b+t Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380133922"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="380133922"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 07:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="725001674"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="725001674"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga006.jf.intel.com with ESMTP; 25 Sep 2023 07:16:07 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 25 Sep 2023 19:54:07 +0530
Message-Id: <20230925142409.189969-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V2 0/2] drm/xe: Count and report low level driver
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
  drm/xe: Indroduce low level driver error counting APIs
  drm/xe: Update counter for low level driver errors

 drivers/gpu/drm/xe/xe_device.h              |  2 ++
 drivers/gpu/drm/xe/xe_device_types.h        |  9 +++++++++
 drivers/gpu/drm/xe/xe_gt.c                  | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h                  |  3 +++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 ++
 drivers/gpu/drm/xe/xe_gt_types.h            | 10 ++++++++++
 drivers/gpu/drm/xe/xe_guc.c                 |  3 +++
 drivers/gpu/drm/xe/xe_guc_ct.c              | 11 ++++++++++-
 drivers/gpu/drm/xe/xe_guc_pc.c              |  8 ++++++--
 drivers/gpu/drm/xe/xe_guc_submit.c          | 10 ++++++++++
 drivers/gpu/drm/xe/xe_irq.c                 |  1 +
 drivers/gpu/drm/xe/xe_reg_sr.c              |  4 ++++
 drivers/gpu/drm/xe/xe_tile.c                | 18 ++++++++++++++++++
 13 files changed, 96 insertions(+), 3 deletions(-)

-- 
2.25.1

