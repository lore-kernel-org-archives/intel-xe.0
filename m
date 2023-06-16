Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63295EB64D8
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 09:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EB110E0B7;
	Fri, 16 Jun 2023 09:22:34 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA5B10E0B7
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 09:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686907352; x=1718443352;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0yYQMFfdW9PrQYHgrfUrVlel7ZVdrySTViWpdAWwcKQ=;
 b=GdfQI0xfdzJpN5cMy8XpOEItIoALdNFkySVH09LGY8PheBl93p8NYRHv
 IBBeNU5nE3ypKQuIGXxg3X+UjoStF6hFCiu/YJ9xeQiZJEltFTbDUQ+rh
 v27UVhGT1LLas5gsxRPFBvmJ4FQwqin1082yT+FTo0WrBvIK85CjHTZPS
 0+Z8avYJhi7fYS5wtgNej76B7RUwqcLO+hrnUgOshISizT2GEOYNyF2/J
 ThayNglNau5kZWsmwkEqVvhRbXlTXYNMihK/+z7TA7qX/LEIaGOaU00u+
 8m2bc9NZzugkmWMYg/BRDAnBUykOEz71psV5WK7oi49IpsqA3/uhFvVJM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="338786982"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="338786982"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 02:22:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="959552236"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="959552236"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 02:22:10 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 16 Jun 2023 14:55:19 +0530
Message-Id: <20230616092521.3862926-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] Add gtidle properties
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
Cc: joonas.lahtinen@linux.intel.com, vinay.belgaumkar@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add gtidle sysfs interface under device/../gt#/
Currently there are three properties name, idle_status and
idle_residency

These display both media and render c state properties according
to gt

The new sysfs structure will have the below layout

/sys/bus/.../bdf
             ├── gt0
             │   └── gtidle
             │       ├── idle_residency_ms
             │       ├── idle_status [gt-c6, gt-c0]
             │       └── name [gt#-rc, gt#-mc]
             ├── gtN
             │   └── gtidle
             │       ├── idle_residency_ms
             │       ├── idle_status
             │       └── name

Test-with: 20230609094457.3355182-1-riana.tauro@intel.com

Rev2:  address review comments

Badal Nilawar (1):
  drm/xe/mtl: Add support to get C6 residency/status of MTL

Riana Tauro (1):
  drm/xe: add a new sysfs directory for gtidle properties

 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h        |  11 +-
 drivers/gpu/drm/xe/xe_gt.c                  |   3 +
 drivers/gpu/drm/xe/xe_gt_idle_sysfs.c       | 169 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h       |  13 ++
 drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h |  38 +++++
 drivers/gpu/drm/xe/xe_gt_types.h            |   4 +
 drivers/gpu/drm/xe/xe_guc_pc.c              |  82 +++++-----
 drivers/gpu/drm/xe/xe_guc_pc.h              |   3 +
 9 files changed, 286 insertions(+), 38 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h

-- 
2.40.0

