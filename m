Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B404C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 15:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F48D10E102;
	Fri, 10 Nov 2023 15:42:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6789310E102
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 15:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699630927; x=1731166927;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Szp2O1nVpLWYS23SlZG45bjaJ3X+zFc72oH47inMivg=;
 b=RDMTtZy84n217DtwPmHh1pbILoalKfyfEtF9oQu0i+7/YAXjEW4N6z/h
 YXNvPVPsvBqNJ0eKRn+QkgH1FHxPcoMy6Z64ZYcOc6st73WCQMSaMXqOh
 lvZ6TlxFdQatkmQrnHhHSyLCiILom4YitWSISeLgdyj2GPyaUA7czPxKp
 ZSSiRMvvz8hMQutwFckuaqJz6fPvLJ8ur6qw/mmXf6Wxhxz6t8Usg3sZT
 nMtCZKyi6w+cP5zvoXEFgEyLMzxcrxMX/2XtEq8AILIZDauLZ++UF999v
 na18Dmb468+6AhATmOFM8isxRJ5KOZw8aTuNjAQd5q1HA791sDPvfcAwB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="394104118"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="394104118"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 07:42:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="937193705"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="937193705"
Received: from jponna-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
 ([10.249.43.153])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 07:42:05 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Nov 2023 15:41:49 +0000
Message-Id: <20231110154156.6-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v1 0/7] uAPI Alignment - Remove unused features
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The series "uAPI Alignment - take 2 v3" [1] has grown too much which makes
it difficult to review and to digest by UMDs. This new series is a first
break down which focuses only on removing features which were not used.

[1] https://patchwork.freedesktop.org/series/126203/

Aravind Iddamsetty (1):
  drm/xe/pmu: Drop interrupt pmu event

Francois Dugast (4):
  drm/xe/uapi: Remove useless XE_QUERY_CONFIG_NUM_PARAM
  drm/xe/uapi: Remove unused inaccessible memory region
  drm/xe/uapi: Remove unused QUERY_CONFIG_MEM_REGION_COUNT
  drm/xe/uapi: Remove unused QUERY_CONFIG_GT_COUNT

Rodrigo Vivi (2):
  drm/xe/uapi: Remove GT_TYPE_REMOTE
  drm/xe/uapi: Kill VM_MADVISE IOCTL

 drivers/gpu/drm/xe/Makefile        |   1 -
 drivers/gpu/drm/xe/xe_bo.c         |   2 +-
 drivers/gpu/drm/xe/xe_bo_types.h   |   3 +
 drivers/gpu/drm/xe/xe_device.c     |   8 +-
 drivers/gpu/drm/xe/xe_irq.c        |  18 --
 drivers/gpu/drm/xe/xe_pmu.c        |   9 -
 drivers/gpu/drm/xe/xe_pmu_types.h  |   8 -
 drivers/gpu/drm/xe/xe_query.c      |   6 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c | 299 -----------------------------
 drivers/gpu/drm/xe/xe_vm_madvise.h |  15 --
 include/uapi/drm/xe_drm.h          | 121 ++----------
 11 files changed, 29 insertions(+), 461 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
 delete mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h

-- 
2.34.1

