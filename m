Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3814EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jun 2023 05:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA5510E5D2;
	Fri, 23 Jun 2023 05:21:38 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678F910E004
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jun 2023 05:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687497696; x=1719033696;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IVfyfhs6FRulIIN9X5MWqlwdaa6Pm+u1gu+7nfbEP0g=;
 b=WsQRrgWcrpApq6Pl9rPuFyrbH+zxAIN9wcUtRKWENWm5PDmzDLkJXruD
 TtM9refAsaPW4np3cjE8NdZY0L2LTxNI1u/DSu0yFPwZz0qBt6FpQaC/9
 tB+2Qvwx96m19cKmkVzliHiIuvJwUorcgKdjrKwAoK8rKUy2FMHo8PaTd
 zYptsfdA01p1vN+lqUolreVcN/STYK0nsIVX6BvDigDiB+3Wms2Oxoqgs
 eHyTaXiLDdTxFd0Up+set2kTL/c8YMjunixciF9daQDGdwYN+YcwdeO0Y
 OHGM4x6yxn9SOilg3mlBGUWwGdCJHBR9GYRmZHKSHn/WTKYd7B3fAZfTB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="359555522"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; d="scan'208";a="359555522"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 22:21:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="692545726"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; d="scan'208";a="692545726"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 22:21:16 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 23 Jun 2023 10:54:29 +0530
Message-Id: <20230623052431.75578-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/2] Add gtidle properties
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

Rev2: address review comments
Rev3: updated patch 2 
Rev4: Rebase
Rev5: remove extra lines

Badal Nilawar (1):
  drm/xe/mtl: Add support to get C6 residency/status of MTL

Riana Tauro (1):
  drm/xe: add a new sysfs directory for gtidle properties

 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h        |  11 +-
 drivers/gpu/drm/xe/xe_gt.c                  |   3 +
 drivers/gpu/drm/xe/xe_gt_idle_sysfs.c       | 168 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h       |  13 ++
 drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h |  38 +++++
 drivers/gpu/drm/xe/xe_gt_types.h            |   4 +
 drivers/gpu/drm/xe/xe_guc_pc.c              |  82 +++++-----
 drivers/gpu/drm/xe/xe_guc_pc.h              |   3 +
 9 files changed, 284 insertions(+), 39 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h

-- 
2.40.0

