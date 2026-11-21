Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2473606A333
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 06:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DxeHazsL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CFD10E17D;
	Sat, 21 Nov 2026 06:45:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E3010E17D
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 06:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795243554; x=1826779554;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RHt8JZ5kG9ghn40HodINoMklizkaYYu+GfSUq2Ep+TE=;
 b=DxeHazsLAqMCbPFagRSEzy3YAQmRdpkyHIaCYwhqp4ffXA0euQUvi+uJ
 wOpy0kCZ+19FbRj+O9PIXn/HUgaBLtStiInJTtAoSQGwZlxfAj32TCwaY
 apCla5e90ayjFif5f0IPVsmIKqzIwrQG/ZtsUh9DEoW8KrlfPUlRvst6a
 1uS9CmJL/ReupXa5tSZ1HaKPsja8mM8uU70vSIhiXiLRxZ6Hpe48OHdKt
 27vw3VVWsER8KHZRUUJLXHNtdWL9Kx9P7B8PbLNrWmF4Jl5bgXJ5O1Gx2
 ZiGuuiQ16XCyCYx82ezGEkVV3uCbguU92mP822OO3IA1T7vdxtHpoQrHA Q==;
X-CSE-ConnectionGUID: ABgkJq7wRE+wUyH+AMFaow==
X-CSE-MsgGUID: HpthuL45Swqr1gakqDg2/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4008533"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4008533"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 22:45:54 -0800
X-CSE-ConnectionGUID: M5vVkZLiTI6x4S47bscLzg==
X-CSE-MsgGUID: ZHd2LzWqShWRc3JVXRhgHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; d="scan'208";a="12869378"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 22:45:50 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v9 0/3] Extend CPER records with RAS info queue data
Date: Sat, 21 Nov 2026 12:15:46 +0530
Message-ID: <20261121064545.168470-5-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.56.0
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

This series continues the RAS info queue support from
https://patchwork.freedesktop.org/series/169692/#rev5

v8:
  - Address Raag's review comments on info queue draining and CPER
    construction: naming, helper APIs, assertions, and formatting.
  - Fix the single-chunk drain assertion and missing kernel-doc
    reported by Sashiko.
v9:
  - Fix v8 review comments (Sashiko, Raag)

Badal Nilawar (3):
  drm/xe/cper: Drop redundant counter argument
  drm/xe/xe_ras: Add support to retrieve info queue data
  drm/xe/cper: Prepare Intel CPER info records

 drivers/gpu/drm/xe/xe_cper.c                  | 263 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_cper.h                  |   3 -
 drivers/gpu/drm/xe/xe_cper_types.h            |  59 +++-
 drivers/gpu/drm/xe/xe_ras.c                   | 188 ++++++++++++-
 drivers/gpu/drm/xe/xe_ras.h                   |   6 +-
 drivers/gpu/drm/xe/xe_ras_types.h             | 118 +++++++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 7 files changed, 619 insertions(+), 20 deletions(-)

-- 
2.56.0

