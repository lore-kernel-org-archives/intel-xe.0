Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F014C7EE2E
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 05:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F277110E58C;
	Thu,  8 Jun 2023 05:03:28 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7363B10E589
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 05:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686200604; x=1717736604;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zNBTtqRje+Er/4cGw4HwNIw27EQBrEXLh0RmSbICbMc=;
 b=XMa+Q5b+wetWB5j0TGT7I9kRILjRz8gv+Kdo15qJkoH0+WDdF2Lil94K
 IPPhdId+r8EClkHUje628G2lNDWhco48D+3SNNO39op8yPSDg3sd1Hj7j
 I0p9bix47pWP1v7HZBCvilVI+X1NQCExnTNfnjtC8788vVU8F5/w/DHKd
 UBIMrmP/4GYeZ46NBsUL5BziGOpbvfIjLoGSe1GUqGXXP6luNVpm5Zhlw
 sLhJbIaqT6Kc/d/B3tiqKRPoLfmcvSUWoEpqg+e2PtJr/TFFEMEGj0YPw
 4XtPVZExqzPQJetkf1exuqTnnA5YrdUKcgA9dlFJ/BCSUqj5p3vADbmDS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="354692401"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="354692401"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 22:03:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="822450159"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="822450159"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 22:03:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed,  7 Jun 2023 22:03:30 -0700
Message-Id: <20230608050333.37581-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] NULL bindings aka sparse bindings
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

This feature has been request by Paulo ahead of the GPUVA series [1]. It
doesn't strickly require GPUVA so here it is.

All of the comments in [2] should be addressed.

Havea local version of IGT [3] up and running, expect that on the IGT
list shortly.

Matt

[1] https://patchwork.freedesktop.org/series/117156/
[2] https://patchwork.freedesktop.org/patch/534922/?series=117156&rev=2
[3] https://patchwork.freedesktop.org/patch/534957/?series=117177&rev=2

Matthew Brost (3):
  drm/xe: s/XE_PTE_READ_ONLY/XE_PTE_FLAG_READ_ONLY
  drm/xe: Move XE_PTE_FLAG_READ_ONLY to xe_vm_types.h
  drm/xe: NULL binding implementation

 drivers/gpu/drm/xe/xe_bo.h           |   3 +-
 drivers/gpu/drm/xe/xe_exec.c         |   2 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c |   4 +-
 drivers/gpu/drm/xe/xe_pt.c           |  73 ++++++++++++++-----
 drivers/gpu/drm/xe/xe_vm.c           | 105 +++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm.h           |  12 ++-
 drivers/gpu/drm/xe/xe_vm_types.h     |   2 +
 include/uapi/drm/xe_drm.h            |   8 ++
 8 files changed, 146 insertions(+), 63 deletions(-)

-- 
2.34.1

