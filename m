Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE2D606A889
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 13:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WFc3cZQu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A2F10E5E9;
	Thu, 12 Nov 2026 13:47:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A134610E5E9
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 13:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794491232; x=1826027232;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z226PWukou7QRAndL9nPoG0koaasYmfUSwcwO2gYH0c=;
 b=WFc3cZQu8P5C0E1gYHLaC8G+IU1ZnCLY3YAMg6/hpBswNG9ZQrmiIAt+
 YBdrOL8iNkMOV0lT2Av8qeidN3EhgsK+CzilwH5f0/lGYxt6Ln1FTVlHu
 7t7oguhn+OIWvqNcIYqjBWNs2Bn4eU5Fnepo3jRaDfc0SwDNYtXrduxQP
 rwni5PFIXGMMQWwiv1UWYSB3ITCPij3OWfzFiwmpO49ijGV8NuHj103e1
 B+I3zXkLnml3ey9/ttYoBMTmtOAwrQiY6c1MSumtYddvklOKRYMct/Vjr
 yROUZu5aEP9IZWZFwRIMTApXl25mO06+PIPaj2Ai8LDB1ukZhKa8e8A8F w==;
X-CSE-ConnectionGUID: suRLqOVkSZybr9MYHMtPnQ==
X-CSE-MsgGUID: h9qh0t14RGStEVFydesxYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3306635"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3306635"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 05:46:55 -0800
X-CSE-ConnectionGUID: sPCUSeKsT4uuzainwsK0lw==
X-CSE-MsgGUID: Hl0lxemiT7atd+cjnadS9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8527890"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 12 Nov 2026 05:46:51 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v4 0/6] drm/xe/cper: Software (driver-detected) CPER error
 reporting
Date: Thu, 12 Nov 2026 19:16:37 +0530
Message-ID: <20261112134636.1860446-8-mallesh.koujalagi@intel.com>
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

Mallesh Koujalagi (6):
  drm/xe/cper: Add software CPER emission entry point
  drm/xe/cper: Prepare CPER headers for software errors
  drm/xe/cper: Emit software CPER records
  drm/xe/cper: Make software CPER emission atomic-safe
  drm/xe/log: Add software CPER information to KUnit output
  drm/xe/log: Test software CPER emission parameters

 drivers/gpu/drm/xe/tests/xe_log_kunit.c | 103 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_cper.c            |  64 +++++++++++++--
 drivers/gpu/drm/xe/xe_cper_types.h      |  38 ++++++++-
 drivers/gpu/drm/xe/xe_device_types.h    |   2 +
 drivers/gpu/drm/xe/xe_pci.c             |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h       |   1 +
 6 files changed, 200 insertions(+), 10 deletions(-)

-- 
2.48.1

