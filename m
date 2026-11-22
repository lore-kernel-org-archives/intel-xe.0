Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54846606A32A
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 14:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bcEWzesz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061FF10E52A;
	Sun, 22 Nov 2026 14:48:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA0210E50B
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 14:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795358927; x=1826894927;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MZvIZb4Il/eny+sck3hEezQaStDtGwg5/427zg70D9E=;
 b=bcEWzeszzA1B/cU7gZyz93mGI+um8oF8ZWdRPSnhqI52TpdH3RfnwP3C
 cANoqonJ5Yi76m6nuAqPxaLZirddos4qdi6w/Y7zDeb7X3RVC5BYvodOr
 RO4Q6DR4DCUv8N2ht7cl/3VgQF2A+R4LAf7ywBp+9NfDz7UXW5rNTDGJA
 47GNfKvqzhPIDl/IclkJDnOCh2/oDFn8NwDlKyHyromFt62C+uLM5rXWv
 5D6K8NX04pUKbbBIeOhxeyU4cCrJwf+CrW7dYb9AYJlz3FotfP/NfUP/f
 YwPsUb49rx8kzuqUF0BwXJftM168WaVyN3dwE8obK8pa4tHswLQlT7IMK w==;
X-CSE-ConnectionGUID: 2C9mIWuwRhGg5qTeJWAujQ==
X-CSE-MsgGUID: uciDnX//RGOBIzpV0LjOaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4071050"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4071050"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 06:48:46 -0800
X-CSE-ConnectionGUID: hKXBecXWSPewSd+tGvj4Vg==
X-CSE-MsgGUID: 64OxbdFjRe2A2afHOArlIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11224874"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 06:48:41 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, matthew.d.roper@intel.com
Subject: [PATCH v11 0/3] Extend CPER records with RAS info queue data
Date: Sun, 22 Nov 2026 20:18:39 +0530
Message-ID: <20261122144838.214706-5-badal.nilawar@intel.com>
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
v11:
  - Drop the offset assertion and stop fetching at the buffer limit (Raag)

Badal Nilawar (3):
  drm/xe/cper: Drop redundant counter argument
  drm/xe/xe_ras: Add support to retrieve info queue data
  drm/xe/cper: Prepare Intel CPER info records

 drivers/gpu/drm/xe/xe_cper.c                  | 263 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_cper.h                  |   3 -
 drivers/gpu/drm/xe/xe_cper_types.h            |  59 +++-
 drivers/gpu/drm/xe/xe_ras.c                   | 186 ++++++++++++-
 drivers/gpu/drm/xe/xe_ras.h                   |   6 +-
 drivers/gpu/drm/xe/xe_ras_types.h             | 118 +++++++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 7 files changed, 617 insertions(+), 20 deletions(-)

-- 
2.56.0

