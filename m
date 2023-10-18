Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5250CCDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 10:27:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3A410E3B5;
	Wed, 18 Oct 2023 10:27:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C1910E3D3
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 10:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697624867; x=1729160867;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o45+RLzWwFCn4cJ+GHfvnIzlqNalXpuBlpNmgPehbo4=;
 b=apoSxpeUvJPOF/itJUi/ivFDDhxKG8hwtx4o3CbNFF7zUv8QvOtub6y1
 lsSpeMStAB2WVB+S1xgRtVcsgZ48gvQrYEezcgqC19tDnyjv4l/0b9zlE
 Eh9mqwjsONRZgO5iOs4CADvyqBJAZ0EuqY9PnitBtvkdWtApoP3cxU3aR
 Ytt4CJwxKDvFdlCdkRuOC0oM+yiPtJ+W+TGqRtf7Pj9NKEDJ5LE2KSIhr
 oYrziAKA9vIPXb2GcqXvZNO/gmYCQSh8xVKGpFqlIJep96PLu2CqkVHXA
 5nAexMEpwRWtKFb/VOrFCbVtwENtgQkI4+3EGMZyiz1zL85cwzP3n2qwm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="417098403"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="417098403"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 03:27:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="1087887683"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="1087887683"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga005.fm.intel.com with ESMTP; 18 Oct 2023 03:27:33 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 18 Oct 2023 16:06:01 +0530
Message-Id: <20231018103603.1814906-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V8 0/2] drm/xe: Count and report low level driver
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
 drivers/gpu/drm/xe/xe_guc_pc.c              | 12 ++++--
 drivers/gpu/drm/xe/xe_guc_submit.c          | 11 ++++--
 drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
 drivers/gpu/drm/xe/xe_reg_sr.c              | 22 +++++------
 drivers/gpu/drm/xe/xe_tile.c                | 41 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile.h                |  3 ++
 13 files changed, 193 insertions(+), 51 deletions(-)

-- 
2.25.1

