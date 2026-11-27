Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8355A606A321
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nnYhgaYT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4740511211A;
	Fri, 27 Nov 2026 06:13:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2B310FC6C
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 06:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795760020; x=1827296020;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=91eNsdPp/oekh78i9ztqfwLCkO1yUK/eiW+KoYYMr/4=;
 b=nnYhgaYT6jHxmNS3NW5DAtkZmnXqDxHSquKcsovsXwVKRuNK1MU9jv43
 qv2noZEK9p9kGHubOJaSOZ9MQzB3vjX1gT+OxXBuu9a1k9x/p6PSg8yPe
 pTu7XT5mxFoOueADK6b81au6LILuURzyvd0eQoAANZ+M5VPcE2iKYt6nM
 +J8MZSO24uyZkUJEXD2QmoFwUpfAfJs+Aa8NJ5Y6RZ/i3/6B0MgN2vcPS
 VZTj+wAZVFlL8ChQxTy5zpXwm+V/sReieVZcXlN1Vm75eFNGVCe1v1ftA
 QpbhjYWgytMNCXI0G7s0AE5gzWPRYblMhy0rALm/gVmBDzPEwsKEv8SZl w==;
X-CSE-ConnectionGUID: j4ISanS9RVWuhVJI5MaZnw==
X-CSE-MsgGUID: sYPQS8JTSKeqSpFCIAFrrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4554495"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4554495"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:13:40 -0800
X-CSE-ConnectionGUID: xSY8VqcfQmaKdXVAclDIbQ==
X-CSE-MsgGUID: PJsmiSgkQUa7LfUg4SkMPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12353925"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:13:37 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, heikki.krogerus@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 0/5] Process AMC alert
Date: Fri, 27 Nov 2026 11:43:34 +0530
Message-ID: <20261127061333.1019047-7-badal.nilawar@intel.com>
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

This series exposes appropriate recovery mechanism for AMC alert.
Also creates the sysfs to expose AMC alert. 

Sysfs patch has fixes for review comments from https://patchwork.freedesktop.org/series/175359/

Badal Nilawar (5):
  drm/xe: Request cold-reset recovery on AMC thermal trip alert
  drm/xe: Request cold-reset recovery on AMC OOB request alert
  drm/xe: Request cold-reset recovery on AMC CATERR alert
  drm/xe/i2c: Expose AMC alert reason through sysfs
  drm/xe: Request vendor recovery for AMC firmware download alert

 .../ABI/testing/sysfs-driver-intel-xe-amc     | 24 +++++
 drivers/gpu/drm/xe/xe_amc.c                   | 88 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_wedge.c                 | 20 +++++
 3 files changed, 124 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-amc

-- 
2.56.0

