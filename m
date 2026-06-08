Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1B0CD8C8E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 05:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1F510ED01;
	Mon,  8 Jun 2026 05:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lrv/C8je";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42F210ED01
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 05:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780896381; x=1812432381;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a2wrhOP7iSJKehRd3Ebs+oKeP/J9yMqox8KOmK8QWus=;
 b=lrv/C8jezJ1pF6NRy2IZV0Lh1A/HmEDwXgFR/XJ85utgvMla3N2EfbVF
 6h+Ls5AN1ckkfAaj2X558I34u36TvfkVAl2i+TYWzWF3XgUHZk1hYSXXK
 IvUvxNWiNCYnimZTym+F19emKZKJL/uX+aeuQDfKd/Yxh//nEshBpdrFH
 zzLWD7xnCuTFC6CIbVIXKX66gqVkEglpsohceKMwSypqkzNR/E+Uilg9/
 yZdY786Ii08tsWK9bADd4pHxOc51O7OvN/wPT2rpC9mWo9GFe8BDgQIgx
 Ky6Rkicip516jlLPGM6rmtauGUWRXDvX4wjhsj+D1whdSEWPBwq8mYT5Y w==;
X-CSE-ConnectionGUID: D9J7er+qS7C7RsJVdq6/KQ==
X-CSE-MsgGUID: 0e9dUkYTTC+jQiMjCpludw==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="84198413"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="84198413"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 22:26:20 -0700
X-CSE-ConnectionGUID: UaPXjzgYRtGOSVLulw0SSg==
X-CSE-MsgGUID: Ad3n2eSuRxCFnIpKcz8v6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="245551425"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 22:26:17 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 andi.shyti@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v3 0/3] drm/xe: Add support for GPU health indicator
Date: Mon,  8 Jun 2026 10:55:57 +0530
Message-ID: <20260608052556.1744123-5-soham.purkait@intel.com>
X-Mailer: git-send-email 2.43.0
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

GPUs commonly rely on various reactive health monitoring
approaches. The Xe GPU health indicator is intended to fit into
such reactive monitoring flows, where it could be used by
management tools to fetch and update GPU health status.

This series adds Xe GPU health indicator support as a RAS feature.
It introduces the health command IDs and request/response structures
used by the System Controller mailbox, and integrates the feature
into Xe through the gpu_health sysfs interface.

The sysfs file, gpu_health, is created at the device level and
provides a simple interface for observing and updating the reported
GPU health state. It is exposed as read-only for non admin users while
write access is only provided to the admin users.

The sysfs file (gpu_health) is placed at the device level and behaves
as follows:

$ cat /sys/.../device/gpu_health
ok

$ echo critical > /sys/.../device/gpu_health

$ cat /sys/.../device/gpu_health
critical

Riana Tauro (1):
  From: Riana Tauro <riana.tauro@intel.com> DO NOT REVIEW. COMPILATION
    ONLY

Soham Purkait (2):
  drm/xe/xe_ras: Add types and commands for RAS GPU health indicator
  drm/xe/xe_ras: Add RAS support for GPU health indicator

 .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 ++
 drivers/gpu/drm/xe/xe_device.c                |  20 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_drm_ras.c               |  41 ++-
 drivers/gpu/drm/xe/xe_hw_error.c              |  13 -
 drivers/gpu/drm/xe/xe_pci.c                   |   3 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_ras.c                   | 327 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |   5 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 108 ++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       |  28 ++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |   3 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   8 +
 include/uapi/drm/xe_drm.h                     |  11 +-
 14 files changed, 563 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras

-- 
2.43.0

