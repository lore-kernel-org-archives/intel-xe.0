Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA95606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 21:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HLmLWg63
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5C710EBC6;
	Thu, 12 Nov 2026 21:35:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304FD10E6C0
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 21:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794519311; x=1826055311;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eUAeX7zOvDkQ9l4q4rN2nMliKS511Eg7Zz6jrVPAptY=;
 b=HLmLWg63YmA3wTGJ9BdSf1k+jwye6rU0C6sk+2NvZIkG+RkOalLDs4Ko
 0Ij0ofYABbz4AhM799OCykOfx2ltYlOfIwCzDRvOja1zWxyqrapd378f7
 ErTLXnsdEhFmvVIyyjbhVjhVNjFaV6KoGohUgPyfSNtnx4XHhi2kyBKbC
 sJ1AHX0ToeAkxXKXm2MnpHAxeOAEDhfExaSmMbBD00/6iALFZoMsbAJXR
 v4h8xkDWZPQyxilmLC8H9vFs+XIRECORvCBuahwOMLPMCOyMHRU98yUk9
 69tONt5JN611pQaqYhpbUN8+KH6772MqBsKsyR8+RUxsIDqQIPirFpHix w==;
X-CSE-ConnectionGUID: WKDzEqAQRh+ef+smXqljhw==
X-CSE-MsgGUID: VaZnyFvqSJSxdgxx/C8wpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3351719"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3351719"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 13:35:10 -0800
X-CSE-ConnectionGUID: fjYl0Og/Tkq1CVtK9I0UHw==
X-CSE-MsgGUID: 8Ap4TYZXR+2pbf28QldcEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8754514"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 13:35:10 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, gustavo.sousa@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/8] Set up for debug configfs group
Date: Thu, 12 Nov 2026 21:35:05 +0000
Message-ID: <20261112213508.457213-10-stuart.summers@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Splitting out patches from [1] which have already been
reviewed to get CI results and get these merged. I'll
send out an updated series with the rest of the patches
after.

Note that I removed the "Assisted-by: LLM" attribution
per latest requirements. I also made some minor changes
around the rebase - mostly dropping the fallback functions
since those were removed. There was also a new function
added for the disable vram page offline configfs, so that
function was rebased in to this series as well.

Everything here has an R-B already.

[1]: https://patchwork.freedesktop.org/series/165879/#rev10

Stuart Summers (8):
  drm/xe: Guard configfs attribute reads in getters
  drm/xe/configfs: Fix out-of-bounds read in parse_wa_bb_lines()
  drm/xe/configfs: Copy wa_bb out under the configfs lock
  drm/xe: Invert vram_page_offline configfs attribute
  drm/xe: Make survivability_mode configfs attribute a bitmap
  drm/xe: Sort xe_config_device fields
  drm/xe: Split out configfs data structures
  drm/xe: Add a new debug focused configfs group

 drivers/gpu/drm/xe/Makefile                |    3 +
 drivers/gpu/drm/xe/xe_configfs.c           | 1299 ++++++++++----------
 drivers/gpu/drm/xe/xe_configfs.h           |   35 +-
 drivers/gpu/drm/xe/xe_configfs_debug.c     |   14 +
 drivers/gpu/drm/xe/xe_configfs_debug.h     |   13 +
 drivers/gpu/drm/xe/xe_configfs_types.h     |   58 +
 drivers/gpu/drm/xe/xe_lrc.c                |   38 +-
 drivers/gpu/drm/xe/xe_ras.c                |   18 +-
 drivers/gpu/drm/xe/xe_ras.h                |    2 +-
 drivers/gpu/drm/xe/xe_ras_types.h          |    4 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c |    7 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       |    2 +-
 12 files changed, 798 insertions(+), 695 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.h
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_types.h

-- 
2.43.0

