Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEAEC3600B
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 06:20:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7942910E089;
	Thu, 27 Mar 2025 06:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TEdH80kc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A2410E089
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Mar 2025 06:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743056433; x=1774592433;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4s10eOinClJUmHGkePVliqaqAdbB8sjMIkY6jzq3ku8=;
 b=TEdH80kcRvhLzKpszyiNIgyrwwZ99glHKuN/K/nsWLCfL1X4DQozwlL0
 fw/emfK0RJzVE0H9COy7ivSkSGzw+EJqIfHxhMdC0k2yzT9wmEFlO8py/
 b87xuXHvjdIeLlN6cy2RVY76cTYWz4GfFesUSCTTZ8p+tmZ32bPrdj2w0
 tC2KAxhAwOjx/SwvHVciP3kZq0z0NM2ve5UFlsmDmRGqjQWg/x8z+FVCY
 k5hRVVcDRCQ2EI01ZbSTKbBAYSpkw6pzp7KSHuMFav3yVYzhbZrH0CK8y
 eN/lYoL0vZgZwe7a2BIJGnslTV0Qn24Cf+ItBTq8sGkqF771U/59P+dms A==;
X-CSE-ConnectionGUID: DHilAv9pT5yrfpV0uWElfg==
X-CSE-MsgGUID: LeuAVzaiT7uc7xSnTN3tvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44289750"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="44289750"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 23:20:32 -0700
X-CSE-ConnectionGUID: KG0tCbRuR0yoDAyazMKqCw==
X-CSE-MsgGUID: GJzXDSZmSr2OaAUqWSUKIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="130232508"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 23:20:29 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 aravind.iddamsetty@linux.intel.com
Subject: [PATCH 0/2] Add configfs support for survivability mode
Date: Thu, 27 Mar 2025 12:12:00 +0530
Message-ID: <20250327064204.459968-1-riana.tauro@intel.com>
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

This series proposes to expose attributes via xe configfs
subsystem. Xe registers a configfs subsystem named 'xe'.
Userspace can then create directories for the devices they
want to configure and set appropriate attributes

This is done by

mount -t configfs none /config
mkdir /config/xe/0000:03:00.0 

echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind
echo 1 > sys/kernel/config/xe/0000:03:00.0/survivability_mode
echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind

This is an alternative to introducing module param that causes
all the connected and supported GPU cards to enter survivability mode.
Manually entering survivability mode is useful when pcode does not
report failure, in field repairs and validation

Rev2: use config_groups (Lucas)

Riana Tauro (2):
  drm/xe: Add configfs to enable survivability mode
  drm/xe: Enable configfs support for survivability mode

 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_configfs.c           | 236 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h           |  16 ++
 drivers/gpu/drm/xe/xe_device.c             |   2 +-
 drivers/gpu/drm/xe/xe_module.c             |   5 +
 drivers/gpu/drm/xe/xe_pci.c                |  19 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c |  39 +++-
 drivers/gpu/drm/xe/xe_survivability_mode.h |   2 +-
 8 files changed, 299 insertions(+), 21 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs.h

-- 
2.47.1

