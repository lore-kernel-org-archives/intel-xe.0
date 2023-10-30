Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18F3C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Oct 2023 11:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A2310E297;
	Mon, 30 Oct 2023 11:48:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B7810E297
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Oct 2023 11:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698666500; x=1730202500;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=75L0TkP5lYsfAsCjET24V16NJlQVrtVou2yDJMUlG0M=;
 b=REZMgZrzvqCoTKPoSmIOdHik+Tn1AlDZJ2tsjhc2HrlvFjBbLcGlDiax
 3ztJutCsf3tm/LSxmtHWu+nBoCzdXSe/hGbY76peA/Oo13l0Le8FRgf/P
 1XApxJ+mKUFw435FymocSSPgTxqnVgDnJxKxE9LpQhf5HUV+4KP4KDAu1
 a4+mgEE0rtyXOydgg97ccq5mASf4KK5cT6hYwi4a3LjseWSMuycPBD4t/
 +P+j7AMtsNTL5XzlPQh1I8AUw3uD9FVhiGy/q/+NhE/saQtROlm++soOq
 ae8IX4wx3qdLJd7OaWjcjaMooEPW/hSqAuKi2mennAFuHgr+4Bh0JHOBW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="391917213"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="391917213"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 04:48:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="736713675"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="736713675"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 04:48:18 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 30 Oct 2023 17:26:15 +0530
Message-Id: <20231030115618.1382200-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/3] DGFX HWMON Enhancement
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series contains some enhancements to xe hwmon.
The patch "Expose power1_max_interval" is, with couple of fixes, from
previous series https://patchwork.freedesktop.org/series/118934/

v2: 
  - Fix review comments (Anshuman)
v3:
  - Add code refactoring in seperate patch

Badal Nilawar (3):
  drm/xe/hwmon: Add kernel doc and refactor xe hwmon
  drm/xe/hwmon: Protect hwmon rw attributes with hwmon_lock
  drm/xe/hwmon: Expose power1_max_interval

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   9 +
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   8 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 375 ++++++++++++------
 3 files changed, 277 insertions(+), 115 deletions(-)

-- 
2.25.1

