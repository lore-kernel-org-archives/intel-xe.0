Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F55FDEE2F
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 17:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A5D10E361;
	Thu, 23 Apr 2026 17:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OLP3y141";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010E110E361
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 17:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776966424; x=1808502424;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cFmkhfQ3PLK2y3Z8T7ma9/wW5EBwDLizydhkEJ9eJ2Y=;
 b=OLP3y141WTBFZPiX8UEGZlDJt5ypOreT61Vs7SpGXHHXfpZEu9bn8dTx
 Rebir5Ha539mxOBuIADsHp7sIziQN6V1+p3PGPXSLE6HsjYjjAsntCO3Y
 7dV6H1d4bxn6i4da3VMESl0p/5bicxKnHqQHsrov78XSHORUOcQFRlflq
 GSHlzulRccUbA84QLieCQjS2jfmjc0DdMCpJtKqYmqyHfEkfpqcED1uM/
 B9svU4db7jQb9pZpGz6Mwjli/JZqHt3UNgYBNH0xbGnq/JJxFWJNxbt+o
 LNGK7CfaqAB+vC99D/fwyPqgFduaw0oyXJKzH0f7Ivd2gt4PNm2CcXhKB g==;
X-CSE-ConnectionGUID: V/7pwznKTke2dcs14k/F9Q==
X-CSE-MsgGUID: BTz4pBaUS1matuzgoyVuGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="89407061"
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="89407061"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 10:47:03 -0700
X-CSE-ConnectionGUID: 3WU5e/bgTl2yfdH1I0TYcg==
X-CSE-MsgGUID: hq0e5lxUT4qPlqMUTsEwXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,195,1770624000"; d="scan'208";a="230058581"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 10:47:00 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 andi.shyti@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v2 0/2] drm/xe: Add support for GPU health indicator
Date: Thu, 23 Apr 2026 23:09:23 +0530
Message-Id: <20260423173925.699486-1-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
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
GPU health state. It is exposed as read-write on PF/native functions
and read-only on VFs.

The sysfs file (gpu_health) is placed at the device level and behaves
as follows:

$ cat /sys/.../device/gpu_health
ok

$ echo critical > /sys/.../device/gpu_health

$ cat /sys/.../device/gpu_health
critical

Soham Purkait (2):
  drm/xe/xe_ras: Add types and commands for RAS GPU health indicator
  drm/xe/xe_ras: Add RAS support for GPU health indicator

 .../ABI/testing/sysfs-driver-intel-xe-ras     |  33 +++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.c                |   3 +
 drivers/gpu/drm/xe/xe_ras.c                   | 202 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |  13 ++
 drivers/gpu/drm/xe/xe_ras_types.h             |  83 +++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  15 ++
 7 files changed, 350 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h

-- 
2.34.1

