Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18126CD98CC
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 09:34:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4C010E83B;
	Wed, 10 Jun 2026 09:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fpF1NV1p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58AFE10E83B
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 09:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781084055; x=1812620055;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CcnU0zL470THVC7K6E0nAh61cofED3exZowqoTI4BRw=;
 b=fpF1NV1ptaj4AE3C+9dBzJOZemhwgKJMoW7fxu1RG/ltz3HsA/nGxYQi
 Q0fxYx+H0AJBfdd5V/osmliesMuhp3TDIaUB1Ax1qdmbXIrnNLm681F7B
 0vTutbFcHNC2qZ43UJAmMwXgtHdG1kSE7ZzL/GZSh3e7fx5IYge/663eo
 wNdizvsD4Pfr+LTTLQYLWBIBdSMSubaxlHg6ju4MSaa6U1vLjfbV70Un2
 JhyU0D0PrwtIZI8JROlllMLcQ1yupWjRbQ13mACS8NuWZbJvJlMO0QtQp
 wSmdfTHNhrYxbqD7HgflBeQWLXckwWI/iPCuXmGAkcTui6IL68bmYwD5X g==;
X-CSE-ConnectionGUID: +2sbDqiuQniF2XRHpKb0Bg==
X-CSE-MsgGUID: 9+pdjD5eSlSCepEcxey4mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="99450233"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="99450233"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 02:34:15 -0700
X-CSE-ConnectionGUID: kyfEkP/GTVKWzFnoSwBhmA==
X-CSE-MsgGUID: C9VqBV92Q/a+HDQI+xvgNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="251203836"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 02:34:12 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 andi.shyti@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v4 0/1] drm/xe: Add support for GPU health indicator
Date: Wed, 10 Jun 2026 15:03:54 +0530
Message-ID: <20260610093353.2538576-3-soham.purkait@intel.com>
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

GPUs commonly rely on various reactive health monitoring approaches.
The Xe GPU health indicator is intended to fit into such reactive
monitoring flows, where it could be used by management tools to fetch
and update GPU health status.

This patch adds Xe GPU health indicator support as a RAS feature.
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

Soham Purkait (1):
  drm/xe/xe_ras: Add RAS GPU health indicator

 .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 +++
 drivers/gpu/drm/xe/xe_ras.c                   | 177 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |   1 +
 drivers/gpu/drm/xe/xe_ras_types.h             |  60 ++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       |  28 +++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |   3 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
 7 files changed, 303 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras

-- 
2.43.0

