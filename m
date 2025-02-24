Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776B3C021BB
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 15:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4124110E08D;
	Mon, 24 Feb 2025 15:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jKJ/SRfb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766AE10E08D
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 15:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740409634; x=1771945634;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kxqamrzou4TY4YUwhuWk/3QG5Xl2c50vPu3gx9kdK9M=;
 b=jKJ/SRfbHmgefk7nxTyQK0i1vvyNTZCahpWiE7K55KSAI3CQwLri3PJR
 OaYPcrI0mykvHuGCqdZdEimDPizn58RVU0A4lOq7+6SL8DFyfXsyu1sm/
 gLvVMKGE4rg5WbcxKcadIH8ExJEapLWfIxpQOgti6nx0/dElBMEDxLObX
 vRAEZ2F2TcrTDvp/SxsZjBUmCBUzZ4E5xeYVQbN+upzdPWD2YRIkpIrZt
 h4nCH1yo9/iPNQOZpuWUWJlzE4vI89H3FyxPup9X7G7M6hrrrrYe2x3h4
 8ABEQnBpzUJSnBsFB+pJN3sPIH0HbHV3kZBSUD4PPCQDqoilcyshZ9Lwr g==;
X-CSE-ConnectionGUID: 5YU9gtyMQM6CCZCx0c6XTQ==
X-CSE-MsgGUID: F/SJeTxHTD+LWQXyBYhvag==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="28763873"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="28763873"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:07:14 -0800
X-CSE-ConnectionGUID: PiDz9Lg9StmqiJzCApcRzg==
X-CSE-MsgGUID: EDBMUW3lQD+IFkSaf1StSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121349468"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.79])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:07:12 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 0/5] *Prepare RTP to define SR-IOV specific rules
Date: Mon, 24 Feb 2025 16:06:55 +0100
Message-Id: <20250224150700.1778-1-michal.wajdeczko@intel.com>
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

This is a respin of [1][2] series from 2024 but this time with focus
on OOB workarounds. Additionally it helps to avoid misleading reports
in /sys/kernel/debug/dri/*/gt?/workarounds where VF could report all
OOB workarounds that were not explicitly disabled.

v2: tag no_media_l3 as VF_READY
    update optimized IS_SRIOV_PF() to work with const pointer

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

[1] https://patchwork.freedesktop.org/series/134918/
[2] https://patchwork.freedesktop.org/series/135034/

Michal Wajdeczko (5):
  drm/xe/rtp: Prepare RTP to define SR-IOV specific rules
  drm/xe/sriov: Prepare IS_SRIOV_PF to accept const pointer
  drm/xe/kunit: Export xe_step_name for KUNIT
  drm/xe/kunit: Update RTP tests with SR-IOV rules
  drm/xe/rtp: Remove redundant rule to omit VF

 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 112 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_rtp.c            |  25 ++++--
 drivers/gpu/drm/xe/xe_rtp.h            |  19 ++---
 drivers/gpu/drm/xe/xe_rtp_types.h      |   4 +
 drivers/gpu/drm/xe/xe_sriov.h          |   2 +-
 drivers/gpu/drm/xe/xe_step.c           |   2 +
 drivers/gpu/drm/xe/xe_wa_oob.rules     |   4 +-
 7 files changed, 147 insertions(+), 21 deletions(-)

-- 
2.47.1

