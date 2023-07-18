Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C954EB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 08:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B6010E2EC;
	Tue, 18 Jul 2023 08:11:38 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AC610E2EC
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jul 2023 08:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689667897; x=1721203897;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z0OMcnyFCj30/fyBMKb9mI9Y8jEFicr1ObMXJ6JskKY=;
 b=UsAJKeoqSkHSzqDHE7KTsY6lXDG3g/E3hNtVcAYxWCsc32IbOijMVPkf
 fHq5EnE7MtKHH4ez7bOv3trAUOz+8pMO4XZ1mmA9+v5rwZIjaAaOEtGwG
 22yT9P7VmPqkhclmRW8RpFjs7raxh06ES9m0231S0Oilil1yz9fAdBDbc
 rx/Rgtv//ZP6IT3kSDRV3KPOUlzKcnyFDQPIa/7mDjjJD4CZ8ZMC9nOwX
 +RCrgpfR0DbOC/7asBV4rL8vBLQnkS6XCuTyLCuAjW47PoNMXy9WLbtxG
 0EQ5SQwldQpVY0clhYaSJzU0Cjkq12Wxv4HcRMdYmf1Y/dGJCDjbUeC+Q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="356084410"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; d="scan'208";a="356084410"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 01:11:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="717508149"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; d="scan'208";a="717508149"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 01:11:34 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jul 2023 13:36:58 +0530
Message-Id: <20230718080703.239343-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 0/5] D3Cold Policy
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
Cc: sujaritha.sundaresan@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Adding Xe d3cold policy support.
v5 -> v6:
- No functional change, only code comment and commit log
  improvements.

Anshuman Gupta (5):
  drm/xe/pm: Add pci d3cold_capable support
  drm/xe/pm: Refactor xe_pm_runtime_init
  drm/xe/pm: Add vram_d3cold_threshold Sysfs
  xe/drm/pm: Toggle d3cold_allowed using vram_usages
  drm/xe/pm: Init pcode and restore vram on power lost

 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device_sysfs.c | 89 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_sysfs.h | 13 ++++
 drivers/gpu/drm/xe/xe_device_types.h | 26 +++++++-
 drivers/gpu/drm/xe/xe_guc.c          | 27 ++++++++
 drivers/gpu/drm/xe/xe_guc.h          |  1 +
 drivers/gpu/drm/xe/xe_pci.c          | 62 +++++++++++++-----
 drivers/gpu/drm/xe/xe_pm.c           | 94 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pm.h           |  6 +-
 9 files changed, 297 insertions(+), 22 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.h

-- 
2.38.0

