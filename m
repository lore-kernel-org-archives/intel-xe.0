Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3BEC43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 08:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0400510E13F;
	Fri, 10 Jul 2026 08:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpfZ7mTT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B0A10E13F
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 08:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783672425; x=1815208425;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+rJlcWvz+0Wm9oZE0dY3JspsnD06R/hwLFoU3rR/y5I=;
 b=dpfZ7mTTc67mkPLcHnrUyiMjRasbdRfexq/9gLuhmpdtvq/K8ZOUooec
 tAL35bjW8Uhg2ZqbOLRf6/RZ/1CaMGzXYVQ0FktTO3UQriG6yQYs82CRS
 WSr4kDJTxQEnEd0mlv6+kmB7Jx50U5CUcTFAghL/gIti7zOQ8Oi+unKA+
 jeIHK20g/zS6PpPllbZydIqEs9kHAhRO2SrTJ7x6TohODXghFPv2xIn0P
 afK6gfByMGs5TJVpLOhSwcSOfbURJl84SY7XUexBNTMmyh7eyDrOUtEzY
 3NSXNsaUy3Hxd1gEmkZPJug+QMmYVXb3cev9sHs0oLh440EgJdvKkQFkz w==;
X-CSE-ConnectionGUID: NJTphVW4RWKrzj12/q/jOw==
X-CSE-MsgGUID: FuxK3KhYSm2J9FN/5sAz+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107167356"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="107167356"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 01:33:45 -0700
X-CSE-ConnectionGUID: jZF7a+BDTv2N9efh5RcrAg==
X-CSE-MsgGUID: v2Mdy5qiQOqqlZV1Gf9K0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255482745"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 01:33:42 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 andi.shyti@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v10 0/1] drm/xe: Add support for GPU health indicator
Date: Fri, 10 Jul 2026 14:03:26 +0530
Message-ID: <20260710083325.300389-3-soham.purkait@intel.com>
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
 drivers/gpu/drm/xe/xe_ras.c                   | 154 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h             |  42 +++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
 5 files changed, 237 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras

-- 
2.43.0

