Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BF0CEE330
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 17:21:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E749989D8E;
	Wed,  9 Oct 2024 17:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxYHY/xo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D1C89D8E
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 17:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728494501; x=1760030501;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1RI21MiUCKJ+VvHQHC0GTS6QTtRTjBBo9AHWQheP7a4=;
 b=cxYHY/xoSoGwA2GrQI3Fck7Ahwhi1KqyX1O4t99UHxqK7Lz/9UVD6Yyf
 tr8REntjdOETUmt6PjZ5YfLSVSbeyU5rlxfSsnqlGJrhUb1Cky0kwml4g
 L+az9mJP+uxuMhUi4xZrwINujOxg/j7XKFsUYa2jVbgLaKZnlUl9M+AtM
 +L8vqvT0qSCDJFvZs6aY5pQllE9rbIMJQo/EVQaOpbd0eceJlp7bFBuLH
 twiefjWlXwuyJp7/BOgMcdHJ4w2Av2ZQbDGtUDd0kN1+WLNVP5jsj+H9d
 EDUUR4jeW36vqBW/yLpvSnp4inXLoQ8Ymb5xe5+DsGhP2/2KPyQfb//s0 g==;
X-CSE-ConnectionGUID: FCMUf6icQXimnphuMnX59Q==
X-CSE-MsgGUID: mYHrvL3tSAeJK8JbR4aC7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27292653"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="27292653"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 10:21:41 -0700
X-CSE-ConnectionGUID: +s27GJ4wSHGkzfNzaqDUcQ==
X-CSE-MsgGUID: Vd/vSKeMS8qslxi6AUTSrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="76265751"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 10:21:39 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/5] GuC Buffer Cache
Date: Wed,  9 Oct 2024 19:21:20 +0200
Message-Id: <20241009172125.1539-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Michal Wajdeczko (5):
  drm/xe/guc: Introduce the GuC Buffer Cache
  drm/xe/kunit: Allow to replace xe_managed_bo_create_pin_map()
  drm/xe/kunit: Add KUnit tests for GuC Buffer Cache
  drm/xe/pf: Prepare GuC Buffer Cache for PF-only actions
  drm/xe/pf: Use GuC Buffer Cache during VFs provisioning

 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c | 450 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.c                  |   4 +
 drivers/gpu/drm/xe/xe_gt.c                  |   6 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c         |  32 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h         |   6 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  |  67 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h   |   4 +
 drivers/gpu/drm/xe/xe_guc_buf.c             | 391 +++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_buf.h             |  48 +++
 drivers/gpu/drm/xe/xe_guc_buf_types.h       |  40 ++
 11 files changed, 1017 insertions(+), 32 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_buf.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_buf_types.h

-- 
2.43.0

