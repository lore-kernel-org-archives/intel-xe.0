Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF14606A745
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 17:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WJ1YB0JG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCDE10EC52;
	Wed, 18 Nov 2026 17:28:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303C110EC52
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 17:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795022896; x=1826558896;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vu6iFpPZbKWJSlVqzvappj1vw2CJ/ltdm/CkkDQpgrE=;
 b=WJ1YB0JGqvSI7N6CzBTLIiFha913xbbbq1Z5vZegGjx/8MxSd6Ne/9C5
 G2+kCHLftq0zYIiL+dJYf1jgdeuUk9CY5Yd2sOIsX73LWXjvJVewDtAdQ
 sEnf9f15E3GlT69BDH8p2AIP8xraP/gSBVKgtbPUAQbfmIXMoR/LqtyWm
 szmSzQ0oPdjJ3BsV75uCRK3zORMFrm2GyWzte4uNVQfI/z9S2gQuYXFck
 YU5cTJcwluQEgzb1X/HmmAW/4CNgF4VFe09sSWs/vD0JLG5JLRAl8iPe7
 jmZaHoq3yz+EN0HwYB5Drhm0F8bVXi3QezuW3f76ysoAqcQ8nQySF85F0 g==;
X-CSE-ConnectionGUID: 8E9n/RrvQmSvvfUJgaJrTA==
X-CSE-MsgGUID: HDAocPFsQES5sWDgZ/sYMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3730756"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3730756"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 09:28:16 -0800
X-CSE-ConnectionGUID: 0pZ6+3LdRwCaZaEWeegPtQ==
X-CSE-MsgGUID: aiAEDx8tR+CPpk+dkEctvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10203775"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa006.jf.intel.com with ESMTP; 18 Nov 2026 09:28:15 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com, sk.anirban@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v3 0/3] drm/xe: Expose CRI memory capability limits via sysfs
Date: Wed, 18 Nov 2026 22:54:51 +0530
Message-ID: <20261118172458.316603-1-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds read-only sysfs attributes for CRI devices to expose the
maximum supported memory frequency and memory bandwidth.

These attributes allow userspace to discover platform memory capability
limits. They are needed by compute runtime software, including NEO [1], for
capability discovery on CRI.

The existing tile memory sysfs support currently focuses on frequency-
related handling. Since it is now being extended to cover broader memory
configuration information, rename the component/files from "freq" to
"config" to better reflect their scope.

The new attributes provide a stable userspace interface for discovering
platform memory capability limits.

The series consists of:
  1. Add PCODE MEMORY_CONFIG mailbox definitions and subcommands
  2. Rename xe_vram_freq to xe_vram_config
  3. Expose maximum memory frequency and bandwidth through sysfs for CRI

Reference:[1]
https://github.com/intel-innersource/drivers.gpu.compute.runtime/pull/57544

v2:(Sashiko/Badal)
RB'd as per [2]
[2]https://patchwork.freedesktop.org/patch/770315/?series=178849&rev=1

1. Fixed CFI violation by updating attribute types and callback signatures
2. Added a check for xe->info.skip_pcode in memory_groups() to prevent
   exposing these attributes on Virtual Functions,
   where PCODE access is disabled.
3. Changed kernel version in documentation from 7.4 to 7.5

v3:
 Reverted the device_uid version change because it was made by mistake

Himal Prasad Ghimiray (3):
  drm/xe/pcode: Add MEMORY_CONFIG mailbox definitions
  drm/xe: Rename xe_vram_freq to xe_vram_config
  drm/xe: Expose CRI maximum memory frequency and bandwidth in sysfs

 .../ABI/testing/sysfs-driver-intel-xe-gpu     |  24 ++
 drivers/gpu/drm/xe/Makefile                   |   2 +-
 drivers/gpu/drm/xe/xe_pcode_api.h             |   4 +
 drivers/gpu/drm/xe/xe_tile_sysfs.c            |   4 +-
 drivers/gpu/drm/xe/xe_vram_config.c           | 217 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_vram_config.h           |  13 ++
 drivers/gpu/drm/xe/xe_vram_freq.c             | 123 ----------
 drivers/gpu/drm/xe/xe_vram_freq.h             |  13 --
 8 files changed, 261 insertions(+), 139 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_config.c
 create mode 100644 drivers/gpu/drm/xe/xe_vram_config.h
 delete mode 100644 drivers/gpu/drm/xe/xe_vram_freq.c
 delete mode 100644 drivers/gpu/drm/xe/xe_vram_freq.h

-- 
2.43.0

