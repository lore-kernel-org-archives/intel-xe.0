Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A93C43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 04:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3296510E105;
	Fri, 10 Jul 2026 04:16:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JgrecXJA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8175910E105
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 04:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783656978; x=1815192978;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JeASVLYLbonfjdtZ7y2X1dB/Mxvn+iBwdgcUztSJTcU=;
 b=JgrecXJAalqvdQ48HeyRDTF3MUMrfEFoHocgrAGLqifPavetUPoOMGAt
 /2nsE+0nBMXD9ToZ6n74gkdRpqUqqKYw1cXUBUM6CtH+HJ4rcqnenRZSf
 fu20N0YlgMhDOYUUYWQSqFCiI4AOy7BWfis1O+34lDpttOm6xFa5tfRnm
 bj1Gh/U2EmGR9Q7YBv92PqWMOOtcLsIFecwcHc7mZG3lMXYFXPSoypa+y
 l2oR8kgfgQTftNy/FViaoVGI3mYlOX4Asi2Zo7WsBdTG3ShryqfK/cd44
 arAVmNCNGL0HJP+LN5EF7tv4AsAIE/taHdmemEXdfsALbssepFUXPYnhE A==;
X-CSE-ConnectionGUID: RvFi7jQHRYK/IQDtHCdAcQ==
X-CSE-MsgGUID: lXHENtB8SLaNOLKaZ+ufDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95506275"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="95506275"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 21:16:18 -0700
X-CSE-ConnectionGUID: m+FvChPFQye39jI860qrzg==
X-CSE-MsgGUID: 72NyzM92TdO3C4xFPRnnwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="279185579"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 21:16:15 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 andi.shyti@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v9 0/1] drm/xe: Add support for GPU health indicator
Date: Fri, 10 Jul 2026 09:45:56 +0530
Message-ID: <20260710041555.19974-3-soham.purkait@intel.com>
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
 drivers/gpu/drm/xe/xe_ras.c                   | 146 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h             |  57 +++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
 5 files changed, 244 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras

-- 
2.43.0

