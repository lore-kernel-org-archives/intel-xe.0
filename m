Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB60606A332
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 07:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bZC+ybpb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F0510E637;
	Wed, 18 Nov 2026 07:27:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2C610E637
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 07:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794986818; x=1826522818;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8gyE7tVrWsWa+U+fnxsxNTk8w8wk3v5KJ+woC/Fre5k=;
 b=bZC+ybpbc2Owwo1men8oPcNKiH65DD/X0yu5Mq+BTVGmpt8bNfEbp8HR
 nJ3q6lYj5clL9hQTDkjYaQJMLAGt6SAPpRvyyBZOXlecIN6yeIloC4YA3
 kIBMe0bWpilQcokLoAJOME0m/DeuUrX/NvECjJU1jlLdLoNJ4Pr5JZUhy
 5ixS+Z0pbCFeJAvATZdFNmCbAfXnOx3VcR55pbnGaUHuP9rRQcx/vyUfT
 lOBMP5kxDeAI4LuRkLdMAPkyAmHWYXWDZ4SVuoQfLYrP17Fc19rkpcYVF
 v87xcSv5f28ATcfW6GD6brpA04b/0Gx/Dz9iHT9DNFJkEacCn2K5R/JuI g==;
X-CSE-ConnectionGUID: ljUjJLccQGG9tMmozLTR6g==
X-CSE-MsgGUID: 1RjD61H6QeuYTpUAwHq+Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3645060"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3645060"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 23:26:57 -0800
X-CSE-ConnectionGUID: h5uaBk1hTvaNRqteCdDR3A==
X-CSE-MsgGUID: fXNGecdxSjS4YfFfVkwzFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9943929"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa005.jf.intel.com with ESMTP; 17 Nov 2026 23:26:55 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com, sk.anirban@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 0/3] drm/xe: Expose CRI memory capability limits via sysfs
Date: Wed, 18 Nov 2026 12:53:38 +0530
Message-ID: <20261118072344.4158760-1-naresh.kumar.g@intel.com>
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

Himal Prasad Ghimiray (3):
  drm/xe/pcode: Add MEMORY_CONFIG mailbox definitions
  drm/xe: Rename xe_vram_freq to xe_vram_config
  drm/xe: Expose CRI maximum memory frequency and bandwidth in sysfs

 .../ABI/testing/sysfs-driver-intel-xe-gpu     | 24 +++++
 drivers/gpu/drm/xe/Makefile                   |  2 +-
 drivers/gpu/drm/xe/xe_pcode_api.h             |  4 +
 drivers/gpu/drm/xe/xe_tile_sysfs.c            |  4 +-
 .../xe/{xe_vram_freq.c => xe_vram_config.c}   | 93 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_vram_config.h           | 13 +++
 drivers/gpu/drm/xe/xe_vram_freq.h             | 13 ---
 7 files changed, 129 insertions(+), 24 deletions(-)
 rename drivers/gpu/drm/xe/{xe_vram_freq.c => xe_vram_config.c} (53%)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_config.h
 delete mode 100644 drivers/gpu/drm/xe/xe_vram_freq.h

-- 
2.43.0

