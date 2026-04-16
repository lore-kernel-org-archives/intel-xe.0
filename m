Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A1DF8A14D
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 09:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA69B10E184;
	Thu, 16 Apr 2026 09:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BoQkjfG1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C08110E023
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 09:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776332969; x=1807868969;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RMTZsgLohpCU34B9k3KM3369c3NMWhNvmGSSxaU7T+w=;
 b=BoQkjfG1zQD2H73fzQl69TwVie328XJEjzPvfxX57r9OrSSN4rQYfb0Q
 2SJKoennUs4cXVbLKtnabEBQAGARlAvORBc8kU3vsf6TmAypkj5sZTL4I
 vKJUOxVbCY6gXQEywv27iN3zSm2qyKDQotAQk3PHnfs42WXm/EIG4bMBw
 s9Cak7e4yv2hRH8+8Tig3tCT39wz7VxzR43Ho4OviPqiOgF4hNqlhvKN0
 /qv6vDWzzp8e2FbDiq0CQ4S54GW0Hq/0S7haJAnTpoCTYQ5na3UOqcRWp
 unjMqKYWhgahPsPIqYcacGDyqa0P6ZcurwAsnldY/oNq8LKNnniEuGj4N Q==;
X-CSE-ConnectionGUID: jLYj0vLoT02uLWVkcqQkmw==
X-CSE-MsgGUID: 01jGAnvARimDEqy6IQ+b+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="76360096"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="76360096"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:49:28 -0700
X-CSE-ConnectionGUID: +CeOennmQqu1Nj9e+0UHbQ==
X-CSE-MsgGUID: rOfTaN9qTzGYBt1iRRJzsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235068589"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:43:32 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v1 0/2] drm/xe: Add support for GPU health indicator
Date: Thu, 16 Apr 2026 15:06:08 +0530
Message-Id: <20260416093610.4085667-1-soham.purkait@intel.com>
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

        Large-scale service providers and tier-1 datacenters commonly
deploy various reactive health-monitoring approaches. The Xe GPU health
indicator is intended to fit into such reactive monitoring flows, where
it can be consumed by management and orchestration software.

This series adds Xe GPU health indicator support as a RAS feature
through the System Controller mailbox and exposes it through sysfs.

It introduces the health command IDs and request/response structures
used by the System Controller mailbox, and integrates the feature into
Xe through the gpu_health sysfs interface.

The sysfs file, gpu_health, is created at the device level and
provides a simple interface for observing and updating the reported
GPU health state. It is exposed as read-write on PF/native functions
and read-only on VFs.

Soham Purkait (2):
  drm/xe/xe_ras: Add structures and commands for RAS GPU health
    indicator
  drm/xe/xe_ras: Add RAS support for GPU health indicator

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device.c                |   3 +
 drivers/gpu/drm/xe/xe_ras.c                   | 181 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |  13 ++
 drivers/gpu/drm/xe/xe_ras_types.h             |  65 +++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  15 ++
 6 files changed, 278 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h

-- 
2.34.1

