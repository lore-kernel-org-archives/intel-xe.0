Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DEAEB64D8
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jun 2023 14:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F8F10E499;
	Wed, 21 Jun 2023 14:42:23 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA5310E499
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jun 2023 14:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687358542; x=1718894542;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GDBscrThp78TU0QinpjE8aWxtGydwXEyIMcWOD79eNI=;
 b=C17YZt6PrVFpLXM9+D1+zJX9QECVBML6BAItvsGu4l5kMYMkI/CfM1lA
 Bw6cyP/8G+i3qlG28FYFnytTBJchzsEC6K7OsZ7ElmjFsirzo6QNUpDpP
 kqxmApZo5/HpW+7F+bJ2aSuM0qij3Ze4lTpXjvVuqzZ80G81u8e7U7MKh
 vTBDU/hAuIcTrq9hdyQ5Rc/cF5hFMs5dprvarROBLkrNyhBs9+WofAVB0
 4hVgMzkfQMAIfkc34NT7+v5QL3hVllDokKBN9jQWknrEwreBILF73NAho
 PBeEWOvQEmUbzTRYXLMokr09YHmG1gLCQEfsYfqH6pt4hx/1waevvOibp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="349924046"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; d="scan'208";a="349924046"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 07:42:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="714511419"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; d="scan'208";a="714511419"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 07:42:19 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 21 Jun 2023 20:15:29 +0530
Message-Id: <20230621144531.4189853-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/2] Add gtidle properties
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
 9 files changed, 285 insertions(+), 38 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h

-- 
2.40.0

