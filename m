Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57460606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 09:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XpfVWQXL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA4C10E513;
	Fri, 27 Nov 2026 09:29:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AEC10E513
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 09:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795771764; x=1827307764;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0UbhoPNMWzuXgJYOQUufveK+p90lcWT/cUlHQI3cQBc=;
 b=XpfVWQXLTvvMzn22ebyPp8zTZ/y8kFsVlQZXC8qSxhyaQAqvZnhLLr8J
 i00D8j8v99L5KrQUzZVvjIjiSDgWYbTD+36ONPjyzc28aapElbgU1nuh8
 sryWP/gGcpac7n+XMmCMJS4TkxyQqGHAs6qPkb40YEvmw5BuBzz1PBMf7
 UC+25qSq2uAO7Kd7bzd7oWfOlx8aFaN7x0HGmnm+DCRyPOyirbw8uDggD
 7dYDmTTARxwfJanGgZbcvYr4Y8b6IWd6iW2Dl3ym+zntCDNyb15Y5rpSk
 sVnzjG25NDOcgejXt+vDXild9Ldk0zR4hkQ8oWg1ZESMWTUicgFBVzkTz w==;
X-CSE-ConnectionGUID: mofzO/HHTvujFY68EExn1w==
X-CSE-MsgGUID: DQQ94fU2TuykY73rDJZM1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4678857"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4678857"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 01:29:24 -0800
X-CSE-ConnectionGUID: 6eBMlwzMR9GosEyw8zg97w==
X-CSE-MsgGUID: XLT15yw4SC6+sR90UKqKdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12276020"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 27 Nov 2026 01:29:20 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 daniele.ceraolospurio@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v7 0/6] drm/xe/cper: Software (driver-detected) CPER error
 reporting
Date: Fri, 27 Nov 2026 14:59:14 +0530
Message-ID: <20261127092914.2176025-8-mallesh.koujalagi@intel.com>
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

This series wires up CPER record generation for driver-detected
(software) errors, i.e. the INTEL_SIGID_GPU_XE_SOFTWARE_START..
INTEL_SIGID_BATCH SIGID range, alongside the existing RAS-counter-
sourced (hardware) CPER path.

v2:
- Move union inside xe_cper_intel_hdr structure. (Badal)

v3:
- Rebase.
- Handle early PCI probe where xe device is null. (Sashiko)
- Introduce structure where it's used. (Badal)
- Move error-class union inside cper_init_intel_hdr. (Badal)
- Handle atomic context when SIGIDs are logged. (Sashiko)

v4:
- Add has_driver_cper flag. (Badal)
- Update commit message. (Badal)
- Use ktime_get_real_ns.
- Add BUILD_BUG_ON. (Raag)
- Emit complete message. (Badal/Aravind)
- Add can_sleep bool parameter in per_record_emit. (Badal)

v5:
- Update commit message. (Badal)
- Handle severity with single line.
- Call timestamp near to use. (Badal)
- Move initialization closer to use. (Badal)
- Warn if CPER Message allocation failed.
- Emit CPER record header without msg if allocation failed.
- Move gfp variable where it's used.

v6:
- Rebase.
- s/record data/info data/. (Badal)
- Pass gfp_t directly. (Badal)

v7:
- Update commit message. (Badal)
- Remove dropped variable from xe_cper structure.
- Use only GFP_NOWAIT.

Mallesh Koujalagi (6):
  drm/xe/cper: Add software CPER emission entry point
  drm/xe/cper: Prepare CPER headers for software errors
  drm/xe/cper: Emit software CPER records
  drm/xe/cper: Handle CPER allocations in atomic context
  drm/xe/log: Add software CPER information to KUnit output
  drm/xe/log: Test software CPER emission parameters

 drivers/gpu/drm/xe/tests/xe_log_kunit.c | 103 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_cper.c            |  63 +++++++++++++--
 drivers/gpu/drm/xe/xe_cper_types.h      |  36 ++++++++-
 drivers/gpu/drm/xe/xe_device_types.h    |   2 +
 drivers/gpu/drm/xe/xe_pci.c             |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h       |   1 +
 6 files changed, 197 insertions(+), 10 deletions(-)

-- 
2.48.1

