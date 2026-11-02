Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B822606BA6D
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 17:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZPIhZhT2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED3E10E6AC;
	Mon,  2 Nov 2026 17:25:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7D210E6AC
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 17:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793640334; x=1825176334;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bEnyS5u2/TPloD8m6HEG8xPWAcHURBBf8nOo8fSfQF4=;
 b=ZPIhZhT2LwzZ7fIk+sMxSooPe45D0q85zVq3Fw2SEEB8a+jiAPyN1TDU
 CtMX3UQFspdvrFncyqLsTFq0btiVafn3X2RlJqdSkw6a9CMGlJDwW7fmw
 YiO3EvANygXAw3RPaK++vyLty9OryCDuL6mSojPvmUso+z116LrUiGLUW
 No5tqQGPZ15PFObNUd23oH6xSBzB5WmjQGaMhRaXjCf48grRw5D0BQbkM
 o6h+iz67RqbCRtc4PJPt+OGPaQ8D57FbtOxuBjDxObz7ryt771X6YFSCI
 GwgwqE6G/5YhQ7L5OziPKoGDAoXEn40bOxVfKfI7Hr4+0CWEdfs1fQsE+ A==;
X-CSE-ConnectionGUID: 53gFmgKGQVWUJRdBh1hRFw==
X-CSE-MsgGUID: njH6FnlASnOwgzE2s0lRpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2359668"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2359668"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 09:25:34 -0800
X-CSE-ConnectionGUID: L0alQR6fQzeux6b/J5N7vQ==
X-CSE-MsgGUID: b5Kslk1UTdm5mQPYPqZQ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6091246"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 09:25:32 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, michael.j.ruhl@intel.com,
 alexander.usyskin@intel.com, anoop.c.vijay@intel.com,
 shamim.begum@intel.com, kelvin.gardiner@intel.com
Subject: [PATCH v7 0/6] Add ocode late binding support for CRI
Date: Mon,  2 Nov 2026 22:55:28 +0530
Message-ID: <20261102172527.2794537-8-badal.nilawar@intel.com>
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

v6:
  - Fix review comments from Daniele

v7:
  - Fix Sashiko warnings
  - Dropped Assisted-by: LLM tag

Badal Nilawar (6):
  drm/xe/xe_late_bind_fw: Fix firmware leak on missing manifest entry
  drm/xe/xe_late_bind_fw: Add string mappings of status codes
  drm/xe/xe_late_bind_fw: Convert late bind flag to mask
  drm/xe/xe_late_bind_fw: Add support to load Ocode firmware
  drm/xe/xe_late_bind_fw: Enable late binding support for CRI
  drm/xe/xe_late_bind_fw: Refactor pm flow

 drivers/gpu/drm/xe/abi/uc_fw_abi.h            |  11 +-
 drivers/gpu/drm/xe/xe_device.c                |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +-
 drivers/gpu/drm/xe/xe_late_bind_fw.c          | 150 ++++++++++++++----
 drivers/gpu/drm/xe/xe_late_bind_fw.h          |   4 +-
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h    |   6 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   6 +-
 drivers/gpu/drm/xe/xe_pci_types.h             |   2 +-
 drivers/gpu/drm/xe/xe_pm.c                    |   6 +-
 drivers/gpu/drm/xe/xe_sysctrl.c               |  32 ++++
 drivers/gpu/drm/xe/xe_sysctrl.h               |   1 +
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  12 ++
 12 files changed, 193 insertions(+), 43 deletions(-)

-- 
2.56.0

