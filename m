Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCC9606A323
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cXeMJRtR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F6111236B;
	Fri, 13 Nov 2026 11:58:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D7410E4C9
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Nov 2026 11:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794571125; x=1826107125;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lqMPGKzhpN+lPxm/qdOHHMAX3ol0qp3Vf6G4UrrhwkQ=;
 b=cXeMJRtRUK8OE0XgS5AUQvgAqsmcHhVC82u6wqhPcRfALmjm2oqZ52rW
 ypFTOUJEye2pdX/2MEsKWAh9FqxIm8zWYerRwNrsdIkD6Llq0F1bc03Bp
 Qv60ehA9kuzC6Ia+56Vnto/9OeIs3QWIc+TMuiIo1Q6OZirbDnw7UZdJ7
 zzHPor4nSwvS+GZD8Fm3BzyEWfuUkRG1vJ+PYCwbNflPnP9Gh+pW4jhal
 EXKUpTLVucJQGvz+zPM++oiwu7T7RaLno+y9PU4xNq0R4hiwRFmrMbfcu
 Bz3nOXs98K8kGndVbp83bCqNgci6kReShUJ4bR69pzrNT72lqV/lhAmTB A==;
X-CSE-ConnectionGUID: yBrKfhS5RVq/jxZt5TUFxw==
X-CSE-MsgGUID: ZH2eA8+YQJu91TZ125hu6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3384386"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3384386"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 03:58:44 -0800
X-CSE-ConnectionGUID: GHGF6beHQSybo0ftJ5boXg==
X-CSE-MsgGUID: OgU/a4k9QaaJQRe9fjr2xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8983750"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa005.fm.intel.com with ESMTP; 13 Nov 2026 03:58:40 -0800
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v1 0/4] Add KUnit tests for CPER GUID mappings
Date: Fri, 13 Nov 2026 17:28:28 +0530
Message-ID: <20261113115827.1913629-6-mallesh.koujalagi@intel.com>
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

The patches add KUnit coverage for the Xe CPER platform GUID table.
Tests check PCI ID and GUID sync, uniqueness, UUIDv5 format and
the expected GUID for each PCI ID.

Mallesh Koujalagi (4):
  drm/xe/cper: Add KUnit tests for CPER GUID mappings
  drm/xe/cper: Add KUnit tests for GUID uniqueness
  drm/xe/cper: Validate platform GUIDs in KUnit tests
  drm/xe/cper: Add PCI ID to GUID mapping verification in KUnit

 drivers/gpu/drm/xe/Kconfig.debug         |   1 +
 drivers/gpu/drm/xe/tests/xe_cper_kunit.c | 184 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_cper.c             |   4 +
 3 files changed, 189 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_cper_kunit.c

-- 
2.48.1

