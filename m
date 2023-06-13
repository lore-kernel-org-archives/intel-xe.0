Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AC5C7EE29
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 08:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA3410E355;
	Tue, 13 Jun 2023 08:44:25 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB05B10E353
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 08:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686645862; x=1718181862;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eA39mFYpPUzhhy6EUzheN7VuawTx+Jg2KXOXHlGbMsE=;
 b=Pum8vEttez3lJksvohodyxgsEfG9/Ui5HbbraNiFFtuWm3G86J/nrj3r
 NhH+5dJKMOV0dbVmu8GQBMeypjzS8k0HgY3LNjCyd5/gTPiLgL+M41d78
 OhLqx1Nz67qKiKdrDGG9Izycz7MDDln8GRfgs7fSEBMEf2u+3sM2IXDnW
 8pLwiIuWqNvdunZT/06tanWNAWXHZHAZgYooFTpSbOPQkBbfoHU6HteWl
 pZglIuHVzXP2jfHkDMEoOq1nKeOe8SJopbIgfzDj9R2aw344/goZJ/KO+
 kVWRkmeRxiJjocb2PXafnj/eeOrhgSOnoEbeVCbYIReoSyb96bvNNYi5Y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="386663321"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="386663321"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 01:44:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="958330201"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="958330201"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 01:44:18 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 13 Jun 2023 14:17:19 +0530
Message-Id: <20230613084721.3698818-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Add gtidle properties
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
Cc: joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
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
             │   └── gtidle
             │       ├── idle_residency_ms
             │       ├── idle_status [gt-c6, gt-c0]
             │       └── name [gt#-rc, gt#-mc]
             ├── gtN
             │   └── gtidle
             │       ├── idle_residency_ms
             │       ├── idle_status
             │       └── name

Test-with: 20230609094457.3355182-1-riana.tauro@intel.com

Badal Nilawar (1):
  drm/xe/mtl: Add support to get C6 residency/status of MTL

Riana Tauro (1):
  drm/xe: add a new sysfs directory for gtidle properties

 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h        |   2 +
 drivers/gpu/drm/xe/xe_gt.c                  |   5 +
 drivers/gpu/drm/xe/xe_gt_idle_sysfs.c       | 168 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h       |  13 ++
 drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h |  38 +++++
 drivers/gpu/drm/xe/xe_gt_types.h            |   4 +
 drivers/gpu/drm/xe/xe_guc_pc.c              |  88 ++++++----
 drivers/gpu/drm/xe/xe_guc_pc.h              |   4 +
 9 files changed, 295 insertions(+), 28 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h

-- 
2.40.0

