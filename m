Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9194C001E0
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 13:51:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2C510E4AC;
	Wed, 19 Jul 2023 13:51:22 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737EB10E4A0
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 13:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689774680; x=1721310680;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fsZbYIQBE3Rl8uqnyddgaZuaArkc+Hird74PbdQK+I0=;
 b=CaZbRc2BVKz4IlYhYnmnHzqbqDosclqwBFYopwf1VsabVnwYQqeis1e4
 jVoW2AQcmfLiboZ+q7SDMW/WM8foj6qV1bqn1yhyCMS+fvfN7zudv7xSt
 sXtdyUfV72EM1W7OtB1FdeUiqdg2NrT/gTRPpjYNhqpbU0H42+r8+lmej
 ITuJVp6fsN0orIYXxZtUCdOMomeNT2lOlRB3P3naP8yt8XJL8JTquNwE8
 I9rEXbtEpezexIRqtNHpUMKOVgED2AudJKhMiSY10NK5ZwTdRt5ArZzcW
 sLs1UnvD6R7SvujjZ2v431YLfjGWErTMWmcX3wnkdeEWSeF5Dy2XBEywE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="366512196"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="366512196"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 06:51:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="897924637"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="897924637"
Received: from vshulan-mobl1.ccr.corp.intel.com (HELO b6cf8bcf6e1c.intel.com)
 ([10.251.223.230])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 06:51:17 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Jul 2023 13:51:06 +0000
Message-Id: <20230719135108.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] drm/xe: Style cleanup
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
Cc: Francois Dugast <francois.dugast@intel.com>, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

v2: Add a separate preparatory commit to remove printk (Lucas De Marchi)

Francois Dugast (2):
  drm/xe/execlist: Remove leftover printk messages
  drm/xe: Cleanup style warnings and errors

 .../xe/compat-i915-headers/soc/intel_dram.h   |  5 ++++
 .../xe/compat-i915-headers/soc/intel_pch.h    |  5 ++++
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 --
 drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
 drivers/gpu/drm/xe/xe_execlist.c              |  8 -------
 drivers/gpu/drm/xe/xe_gt_mcr.c                |  2 +-
 drivers/gpu/drm/xe/xe_gt_sysfs.c              |  4 +---
 drivers/gpu/drm/xe/xe_guc.c                   | 14 +++++------
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |  2 +-
 drivers/gpu/drm/xe/xe_map.h                   |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  2 +-
 drivers/gpu/drm/xe/xe_reg_whitelist.c         | 24 ++++++++++++++-----
 drivers/gpu/drm/xe/xe_res_cursor.h            | 11 ++++-----
 drivers/gpu/drm/xe/xe_wopcm.c                 | 10 ++++----
 14 files changed, 49 insertions(+), 44 deletions(-)

-- 
2.34.1

