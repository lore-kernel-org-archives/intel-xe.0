Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E5D606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 08:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JOg8ivxM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0C6112261;
	Thu,  5 Nov 2026 08:54:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2ADA10E067
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793868839; x=1825404839;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IJo6RRnYvKZEPiBMbkOPSGr+lb9N3WVK5yAp/b5blcE=;
 b=JOg8ivxMHyR2FKbIb21c07PJDShJ3f97m9CC3JqFQzstCD51P3+3oD2M
 eLNXU5LfQo61vbbxxsokkkuEUoY8zzpa2cEjp/noa7CRY5cd/A8x+0nGi
 z4FpnuBvWvstsiugP9KTOCWvuDTCYRY4KEN90QaS7roY4/wSuiwhoeYVU
 1LwdSOA7/QxfidOonPaAgaenDp3T9ITtn9rBy/AbORaHz+rr/Z+oA5DzC
 3WLCINAhjRhQSgzThLYelPN9dwgZFD+MydNXkX0j/izmW6wXbkk5cdyge
 jeSCWB4r9Rr1ru2qch3eUujTkUJcB9YdFfdjcZ54q2GtSWe5ZfbPM22s8 A==;
X-CSE-ConnectionGUID: CEHIb2rOQG+9iSsGwz+Txg==
X-CSE-MsgGUID: 5O66lyfnR1GFP2maet4Ipw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2641552"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2641552"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 00:53:58 -0800
X-CSE-ConnectionGUID: kKo8R/ylRs+BvumNTLbPZw==
X-CSE-MsgGUID: WoTiDtuMQB+JFC2f4lvI8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="8721469"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa011.fm.intel.com with ESMTP; 05 Nov 2026 00:53:55 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com, jani.nikula@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v3 0/6] drm/xe/cper: Software (driver-detected) CPER error
 reporting
Date: Thu,  5 Nov 2026 14:23:49 +0530
Message-ID: <20261105085348.1467925-8-mallesh.koujalagi@intel.com>
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

Mallesh Koujalagi (6):
  drm/xe/cper: Add software CPER emission entry point
  drm/xe/cper: Prepare CPER headers for software errors
  drm/xe/cper: Emit software CPER records
  drm/xe/cper: Make software CPER emission atomic-safe
  drm/xe/log: Add software CPER information to KUnit output
  drm/xe/log: Test software CPER emission parameters

 drivers/gpu/drm/xe/tests/xe_log_kunit.c | 103 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_cper.c            |  63 +++++++++++++--
 drivers/gpu/drm/xe/xe_cper_types.h      |  36 ++++++++-
 3 files changed, 192 insertions(+), 10 deletions(-)

-- 
2.48.1

