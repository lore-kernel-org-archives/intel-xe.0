Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E6EC197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 14:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BA110E5F1;
	Thu, 16 Nov 2023 14:17:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CCE10E5F3
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 14:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700144228; x=1731680228;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jDz9OTiYb1JRYLBGJ2z/VgVG7YpqJjjHHXxoCykdW+8=;
 b=PSLSu9X85eVIyIhq+me0m7WFhjQLGDrROoETp8UkK3pkguuV5Ox2L6k3
 aOT7Y/N63K0utRUKhOFI5V5A2an7ULvmmlGjh0B08g2xGjjexOu/qSm2X
 TDzzTIIN9CrnggTQ0huBamSGZvvO4kao00Ql4KoZJ5vYo4TELCbLB5vgi
 igIb3puOkeZzmEZmI9mWhtdE2pwzaxTl/cZW+ZtroTFfcVbQIlrNBad+J
 36GkzczQevl8XhuoAwmYnl2M3unv3gSHPWoatBrtg0LSnWJaF5TILIo8j
 EqWN+0XV+U/zbFbOGs1i98wENN4zbqp1dmQlDq8yxTr2hLB6WHaxldIzU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="12643362"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="12643362"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 06:17:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="715230467"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="715230467"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga003.jf.intel.com with ESMTP; 16 Nov 2023 06:17:06 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 20:00:39 +0530
Message-Id: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 0/4] Adding new frequency sysfs attributes
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 vivi.rodrigo@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The series adds vram frequency and throttle reasons sysfs
attributes. Along with this, we also add some directories
adn subdirectories to cleanup the sysfs organization.

Sujaritha Sundaresan (4):
  drm/xe: Moving and renaming existing frequency sysfs attributes
  drm/xe: Add memory directory for vram attributes
  drm/xe: Add throttle reasons sysfs attributes
  drm/xe: Add a new vram directory with frequency attributes

 drivers/gpu/drm/xe/Makefile               |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  12 +
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 266 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h |  17 ++
 drivers/gpu/drm/xe/xe_guc_pc.c            |  65 +++---
 drivers/gpu/drm/xe/xe_pcode_api.h         |   8 +
 drivers/gpu/drm/xe/xe_tile_sysfs.c        |  78 ++++++-
 7 files changed, 415 insertions(+), 32 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h

-- 
2.25.1

