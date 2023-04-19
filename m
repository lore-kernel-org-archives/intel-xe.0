Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72692C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 17:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A5110E1D2;
	Wed, 19 Apr 2023 17:55:05 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0209C10E1D2
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 17:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681926903; x=1713462903;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D6DLbFIgHL3kSsOGzLaPOgSNCwAj/LX9xuham4FenXo=;
 b=nLpofOzDPde9amZJfKpwDebJgtMkrnfxoXsbB8rE3qpiFJf9avcya0ZB
 J1tT2LSXsgl2KvyOByF4w6Cx6+0yNfGq5JTsk6PhqIyPsprvYbcsRcoJO
 OJXu5wvcnZVzLxXFZqJ2SDEE7VGFDHxwFJqrfGr5yGch60Zxi6s+zdOW/
 4d7pp6Iro0MsefQXpRtUDzbMa6LsfThfB7bplGc2Tgt7CnmLIVyrOsZyz
 ZaDcRujWxFEICQ+IRKtsvi2ITy5YtThlEsdxdOIe28JnwBIClyqMqzav7
 7cfc2R6PUkU/F7ZcOozxW4AE2lo1KPTQrb5yECv99Fc/Mzat1kgk6w3KZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="408429377"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="408429377"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 10:55:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="722022438"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="722022438"
Received: from dut125tglh.fm.intel.com ([10.105.23.23])
 by orsmga008.jf.intel.com with ESMTP; 19 Apr 2023 10:55:01 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Date: Wed, 19 Apr 2023 17:54:57 +0000
Message-Id: <20230419175501.155319-1-stuart.summers@intel.com>
X-Mailer: git-send-email 2.38.1.143.g1fc3c0ad40
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] RFC: Add new device configuration
 infrastructure to
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
Cc: stuart.summers@intel.com, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is attempting to take the best parts of i915 module parameters
(minus the actual module parameters) and add to xe to allow for better
debuggability and configuration in order to help isolate problems
on a per-device level instead of global module parameters.

Note that I did review a few options here: configfs (not generally
used by the drm stack), module parameters (we have some negative
history here), sysfs (not the right approach given the focus on
user interface here). Debugfs is used in various drm drivers to
configure various device characteristics. The infrastructure being
presented here has at a high level been present in the i915 driver
for some years now, so provides a good starting point for quick
debug additions without exposing users to some of the challenges
faced with module parameters in the past.

Stuart Summers (4):
  drm/xe: Refactor early device init
  drm/xe: Refactor debugfs into an early and late part
  drm/xe: Add new device configuration debugfs infrastructure
  drm/xe: Migrate module parameters to new debugfs structure

 drivers/gpu/drm/xe/Makefile            |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c        |  14 +-
 drivers/gpu/drm/xe/xe_debugfs.h        |   1 +
 drivers/gpu/drm/xe/xe_debugfs_params.c | 235 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_debugfs_params.h |  14 ++
 drivers/gpu/drm/xe/xe_device.c         |  23 ++-
 drivers/gpu/drm/xe/xe_device.h         |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h   |   4 +
 drivers/gpu/drm/xe/xe_display.c        |   3 +-
 drivers/gpu/drm/xe/xe_guc_log.c        |   2 +-
 drivers/gpu/drm/xe/xe_mmio.c           |   4 +-
 drivers/gpu/drm/xe/xe_module.c         |  16 --
 drivers/gpu/drm/xe/xe_module.h         |   5 -
 drivers/gpu/drm/xe/xe_params.c         | 118 +++++++++++++
 drivers/gpu/drm/xe/xe_params.h         |  43 +++++
 drivers/gpu/drm/xe/xe_pci.c            |  14 +-
 16 files changed, 461 insertions(+), 40 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_debugfs_params.c
 create mode 100644 drivers/gpu/drm/xe/xe_debugfs_params.h
 create mode 100644 drivers/gpu/drm/xe/xe_params.c
 create mode 100644 drivers/gpu/drm/xe/xe_params.h

-- 
2.38.1.143.g1fc3c0ad40

