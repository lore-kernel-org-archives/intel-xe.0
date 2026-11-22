Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1A2606A320
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 08:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RkuZFJsl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18B010E1DE;
	Sun, 22 Nov 2026 08:08:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D509E10E1DE
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 08:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795334926; x=1826870926;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UkqNZk4r2QUtQtPSV7pCjEDBB3d8CLzQPXpTfRHpq5g=;
 b=RkuZFJslY4JMyh873B6MNJmWZpRLB83DdPCbsy47L7hOi/kynXpClBwP
 E3nDOjTMxX9Xt2FVHd1LNqYw+9W2VUZcMZ/dtdmS3Hi5IG4OgKsM8ZgRI
 TV6RogC51T5E+JLNmxySMLUpe/iin8lF5KDBk2lXncpNstYb/qdng/aQu
 e2/ZClXxpBqLcvlTlkRsu6HxSMic4EVmasqelxZ2hVi5cqNDwC5hQSv1F
 rMsrzCMQ+zdQRT77pIqdz2mgEq0mYZ0oVfapvzJJpPbd1z9wd6FiknUhy
 9oSVj6G0b6pYqegis98gravH9mfmqvww1JTg0dRMFXvJ9JJUsgBL9cTV3 w==;
X-CSE-ConnectionGUID: jGhMbApgToKalnSjlK6JGw==
X-CSE-MsgGUID: irUpPG7iTwWRsoZA2u58jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4194774"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4194774"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 00:08:45 -0800
X-CSE-ConnectionGUID: aNaEeNi6Txi6oe4CkY1Arw==
X-CSE-MsgGUID: wo5l698sQim8COHB+e0Bug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; d="scan'208";a="11117134"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 00:08:42 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v10 0/3] Extend CPER records with RAS info queue data
Date: Sun, 22 Nov 2026 13:38:39 +0530
Message-ID: <20261122080838.196649-5-badal.nilawar@intel.com>
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
v10:
  - Fix v9 review comment of patch 2 (Raag)

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

