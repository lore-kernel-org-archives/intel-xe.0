Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74B2C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 10:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFF510E973;
	Thu,  3 Apr 2025 10:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e43hsldh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B6110E973
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 10:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743674653; x=1775210653;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pyk92V2ix1bagSk1dYDKoVQacaae4JCsHb5ywTwSH8o=;
 b=e43hsldhKuSWfLI9XbZoVQhtM3kTIj91p+rCEYHIweHEl/UjZ4dXKEt7
 ouQRBdzT71YG+suL+MVym6sEkU7YvnV+1BInNDE6e7Ily/QCa0IypqhjY
 axu43NHJO8pT1ShNgNdDUd1rnQKaWL3ueGINJ1uJQcgJSmg2nOMvWy1Mu
 Z/kXn91JIvmlOPOi719Q/NDAg8L7CDlpzxESeeYisGMwTumNcyA77GOlP
 WByc42n0sMWHicSKt8QCcY4+uz95/4zttXc96gHaDz7MU9zksYY1f9Ynm
 efucXwawlGV0B6/XmPEHLv51DMwu9ftSbM+BInFDWwzgQ0si/V6EC29uM w==;
X-CSE-ConnectionGUID: ctcVofD3Re28zq1AjCjETg==
X-CSE-MsgGUID: hGFT1DlcS5yv6GLUjeBC1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44224416"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="44224416"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:04:13 -0700
X-CSE-ConnectionGUID: pBIYT4dZRmuHw53HcXRZXQ==
X-CSE-MsgGUID: gVoE/POyS5iUlm6wxS1Vvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="127470096"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:04:10 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 aravind.iddamsetty@linux.intel.com
Subject: [PATCH v3 0/3] Add configfs support for survivability mode
Date: Thu,  3 Apr 2025 15:55:50 +0530
Message-ID: <20250403102555.1265786-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Add configfs support for survivability mode

This series proposes to expose attributes via xe configfs
subsystem. Xe registers a configfs subsystem named 'xe' which
creates a directory under configfs. Userspace can then create 
directories for the devices they want to configure and 
set appropriate attributes

This is done by

mkdir /sys/kernel/config/xe/0000:03:00.0

echo 1 > sys/kernel/config/xe/0000:03:00.0/survivability_mode
echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind

This is an alternative to introducing module param that causes
all the connected and supported GPU cards to enter survivability mode.
Manually entering survivability mode is useful when pcode does not
report failure, in field repairs and validation

Rev2: use config_groups (Lucas)
Rev3: fix review comments and kernel-docs (Lucas, Rodrigo)

Riana Tauro (3):
  drm/xe: Add configfs to enable survivability mode
  drm/xe: add documentation for survivability mode
  drm/xe: Enable configfs support for survivability mode

 Documentation/gpu/xe/index.rst             |   1 +
 Documentation/gpu/xe/xe_configfs.rst       |  10 +
 Documentation/gpu/xe/xe_pcode.rst          |   7 +
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_configfs.c           | 252 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h           |  24 ++
 drivers/gpu/drm/xe/xe_device.c             |   2 +-
 drivers/gpu/drm/xe/xe_module.c             |   5 +
 drivers/gpu/drm/xe/xe_pci.c                |  19 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c |  71 ++++--
 drivers/gpu/drm/xe/xe_survivability_mode.h |   1 +
 11 files changed, 363 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_configfs.rst
 create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs.h

-- 
2.47.1

