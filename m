Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8764DC44501
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 13:51:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC5B10F12B;
	Wed,  8 Jul 2026 13:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2mvnRlq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6B710E5FE
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 13:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783518706; x=1815054706;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S7x6xkRhze5WhMzyGDMpYe9XER7SXtvyUnUDBj78L88=;
 b=h2mvnRlq7/qTikiA+vyVHTGhAsdBnumJEI4MbKCPyey/8uncoH+gM3Ie
 MCDXOpd68QW8x6ZjBFUrnxPcD7C6HHbEXNipDkuAZnzc19SahXc++nSJU
 2L0/0hEd9eZ40/fL3GQwnE5f1v0pCbBlov2qSVTPaDON/D1I+2pU3qjjv
 vDCSsWzPviXmg54jHQB2nfee6xgcAqOJRRBf9Ty8f8jfIh8jplydCA7Pr
 BaPJ7lPmfVTByzM9baCOtA+KaRII4p9r4lpHPjXeIvPKcmUiT/XaduS0j
 ooN34rj811zHUxEnOczMLDLWAR5YCGYa63pXtShQXmQNWFys76qutO/ps A==;
X-CSE-ConnectionGUID: k/zYxrUFT/CWGyzzylwRsQ==
X-CSE-MsgGUID: Aelml/E1ScOZp8yn1hrFRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109724379"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="109724379"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 06:51:34 -0700
X-CSE-ConnectionGUID: +ogzNdnES7y3+boK3saJBA==
X-CSE-MsgGUID: hWwI7EnSSumKhQGcyTMTFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="251634794"
Received: from psoham-ms-7e03.iind.intel.com ([10.223.55.64])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 06:51:31 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 andi.shyti@intel.com, rodrigo.vivi@intel.com
Cc: soham.purkait@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v8 0/1] drm/xe: Add support for GPU health indicator
Date: Wed,  8 Jul 2026 19:21:11 +0530
Message-ID: <20260708135110.4117174-3-soham.purkait@intel.com>
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
 drivers/gpu/drm/xe/xe_ras.c                   | 147 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h             |  57 +++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
 5 files changed, 245 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras

-- 
2.43.0

