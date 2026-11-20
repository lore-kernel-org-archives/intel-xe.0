Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E21606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 04:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KT1rx+oR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5DC10E5CB;
	Fri, 20 Nov 2026 04:33:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED17910E05E
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 04:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795149190; x=1826685190;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/hkxxh8OIiCMkb4xDlGYlUzifmPvGMwYeGvHBNsaBEY=;
 b=KT1rx+oRUeBlXXuW0tf/oSGQxpdEJSkwPey6FtwSVetou+F+CZPArpa1
 oDOdxQsn6EAjiR3LzgQezSXRb/MhYKuge/A9zlpYShiwvsHmkKMSbXyI9
 1oBBjT6ZhW5EzkiBmL3fkvyDj+zkinl5m0UVFOAH9FbdOSP5fdDe7/440
 LsSB1y/frAxQDoNBclTFBFtsloAUz5cF/OwkZiwbBPJVVBGCcHeqzCvoq
 O+Yv4qNuOxWd3wckujLdjAMRf42/wB+LyN2AeNiCfA/DYV8yuGdkejSH0
 5TE3El7WS9zzrXu6vGvarB426wG1wcSs1a9VFKO6KITcsuSJTieIcLZ9r g==;
X-CSE-ConnectionGUID: RpnAVM/PQoyOyGn3iXN+lg==
X-CSE-MsgGUID: PRWQgbH4QR2GU9/X4V4Q/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4062501"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4062501"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 20:33:10 -0800
X-CSE-ConnectionGUID: RHuecohERIKPsSWN6zwitQ==
X-CSE-MsgGUID: uAaOEyLrRRihEkr4qA4saw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10689424"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 20:33:06 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v8 0/3] Extend CPER records with RAS info queue data
Date: Fri, 20 Nov 2026 10:03:03 +0530
Message-ID: <20261120043303.107183-5-badal.nilawar@intel.com>
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

Badal Nilawar (3):
  drm/xe/cper: Drop redundant counter argument
  drm/xe/xe_ras: Add support to retrieve info queue data
  drm/xe/cper: Prepare Intel CPER info records

 drivers/gpu/drm/xe/xe_cper.c                  | 263 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_cper.h                  |   3 -
 drivers/gpu/drm/xe/xe_cper_types.h            |  59 +++-
 drivers/gpu/drm/xe/xe_ras.c                   | 189 ++++++++++++-
 drivers/gpu/drm/xe/xe_ras.h                   |   5 +
 drivers/gpu/drm/xe/xe_ras_types.h             | 118 +++++++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 7 files changed, 620 insertions(+), 19 deletions(-)

-- 
2.56.0

