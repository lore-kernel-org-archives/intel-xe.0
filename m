Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726E3C4450A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 07:36:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AD610E726;
	Thu, 16 Jul 2026 07:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uebapv4m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF59E10E726
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 07:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784187379; x=1815723379;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zq48NoczXHRcdcOjIjZ8kBBr+wfRv52GaF+DuB9hhYk=;
 b=Uebapv4meDbeintnzAit4xKlBS8f4f7CyVAzFxPzIeg4KkH2GPWVc+O0
 8hDTOyHguZsGJ6exHlgZaHI3Rqio+E6tB7mnx3Xarca9JVWZx22GEtTNV
 K9q1Hn8/xH4kFpeMvqmTBHt4lidZZgDd2Whrc+u3AkzRDBbIfzAoSW1d9
 WdR2zfmUMPrGBsqKmLxLFGxUk52zYtdPbaohLNyxS09PqDhJqTMwoloZt
 LT1Zp0cJkywSgiy2RElIlt37h60BghCv7x5PiQbkpJmeniRi7KYB+E1lF
 xtA9dMt1G4+nAPMewiMCallefTdtpBbwE/UT4lwGBQmzTPxk25xG5Fnhe w==;
X-CSE-ConnectionGUID: zDWu+NUtQuW+zo27H4pbVQ==
X-CSE-MsgGUID: qcIF0AmkRJSdihcOLaLcMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95979144"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="95979144"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:36:18 -0700
X-CSE-ConnectionGUID: KP87kgZzTsOA5aMzQKY6Lw==
X-CSE-MsgGUID: PrxeQyuoQNKQkfGydh8N3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="250055925"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 00:36:15 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 andi.shyti@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v11 0/1] drm/xe: Add support for GPU health indicator
Date: Thu, 16 Jul 2026 13:06:01 +0530
Message-ID: <20260716073600.674089-3-soham.purkait@intel.com>
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

Userspace consumer (Level Zero Sysman):
  https://github.com/intel/compute-runtime/commit/3d974c6d9b65bede475c118e582761670ef110d2

Soham Purkait (1):
  drm/xe/xe_ras: Add RAS GPU health indicator

 .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 ++++
 Documentation/gpu/xe/xe_device.rst            |   7 +
 drivers/gpu/drm/xe/xe_ras.c                   | 153 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h             |  41 +++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
 5 files changed, 235 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras

-- 
2.43.0

