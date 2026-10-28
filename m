Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB88606A321
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 18:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mhqPoCQB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E3810E0DF;
	Wed, 28 Oct 2026 18:20:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D30410E0DF
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 18:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793211598; x=1824747598;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DDLOa8l1XZrZO9SqkK57fNIoL26HJGjz/Tr3/vzL6Ys=;
 b=mhqPoCQBjIpUiBqN0uAQp8XOn/P9VuA0RURkdS289G/ll/z86NPQZtC0
 IlUfkCCl1AYwm8XhIfcH3Iu71uXhDuAhXK2azGNAOjE1NNAhlombUCz4U
 Zq4gJIAdM4DjZmwrB5ahRLsK0k9SniBjA2Br7fLYFfUJjvGCJ3nK1W4Ju
 SBlPgtPJB7bv2T6htzfuXTASzOGvJZzP87Logbot4TLdAx5xymyTQi5ha
 IRoDSSdoXmdGD3H1TJNrHMJfCoJ8ZAH1RkEeh+Z/fKv2lO+Tt8n6wr2U+
 Fyv0i/nlZIuzfuGSvnB6dHQ2DDYbg6ry/giJvKkTTBGum0NsUUKzA1idV Q==;
X-CSE-ConnectionGUID: OjAlWHBxTrSOmpuBQvRs1w==
X-CSE-MsgGUID: CmEte/kcTXCR0Wh9Z3pWPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1819233"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1819233"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 11:19:58 -0700
X-CSE-ConnectionGUID: M53uYfhYQ32YU3xtwzPabA==
X-CSE-MsgGUID: B8XOpmFpSmONHbATbxhPxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5002971"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 11:19:54 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, michael.j.ruhl@intel.com,
 alexander.usyskin@intel.com, anoop.c.vijay@intel.com,
 shamim.begum@intel.com, kelvin.gardiner@intel.com
Subject: [PATCH v5 0/5] Add ocode late binding support for CRI
Date: Wed, 28 Oct 2026 23:49:52 +0530
Message-ID: <20261028181951.1093283-7-badal.nilawar@intel.com>
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

Ocode is the OOBMSM telemetry/manageability firmware, and on CRI it is
loaded through late binding flow.

v2: Dropped "[RFC,3/4] drm/xe/xe_late_bind_fw: Track firmware load status"

v4:
  - Fixed most of the comments from Daniele
  - Rearranged the patches
  - Introduced new patch to fix firmware leak
  - Improved "TODO: compatibility check" comments

v5: 
  - Select xe/cri_ocode_<ver>.bin via System Controller SDK API version
    and skip loading on mismatch

Badal Nilawar (5):
  drm/xe/xe_late_bind_fw: Fix firmware leak on missing manifest entry
  drm/xe/xe_late_bind_fw: Convert late bind flag to mask
  drm/xe/xe_late_bind_fw: Add support to load Ocode firmware
  drm/xe/xe_late_bind_fw: Enable late binding support for CRI
  drm/xe/xe_late_bind_fw: Refactor pm flow

 drivers/gpu/drm/xe/abi/uc_fw_abi.h            |   3 +-
 drivers/gpu/drm/xe/xe_device.c                |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +-
 drivers/gpu/drm/xe/xe_late_bind_fw.c          | 135 ++++++++++++++----
 drivers/gpu/drm/xe/xe_late_bind_fw.h          |   4 +-
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h    |   6 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   6 +-
 drivers/gpu/drm/xe/xe_pci_types.h             |   2 +-
 drivers/gpu/drm/xe/xe_pm.c                    |   6 +-
 drivers/gpu/drm/xe/xe_sysctrl.c               |  32 +++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |   1 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  12 ++
 12 files changed, 171 insertions(+), 42 deletions(-)

-- 
2.56.0

