Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8AD60A2621
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 19:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DrUf67hr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6589E112CB9;
	Fri, 20 Nov 2026 19:14:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8055112AAC
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 19:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795202052; x=1826738052;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QGf51dN/XaeQaC4RGcIcvbGXrdumhoBp5MUDmm75ha8=;
 b=DrUf67hrSxmDoisYwHRb0zBsGQzaaYkUjt5RUUEs+OdrEK+BebSY4uzX
 zDhtLYFacQ//vBCj9vdZCOV4vqRO1rdnB+s2RZmkEto8qnVXeJAjmF4Pw
 7jElZtKEKiHGfu811aRUJ7u/uQl10KvE2utSa+tZRRTTzlgxDKvq/MI1w
 kFUFIkFhBQaKkaCsXVN1WiCExnFyY6i5kutR541OWDxSmqBN9Qk23CH9f
 bqf97+fSJWMzqJrgSMdHnZeddBMdYx0G9Vy75i+l38XPH1QqG00h1mZji
 8rs1u/V6YqvnUXT5y0uxnyOfwKGfaGC8UGtGLkTO45uoO8FHVq4lGEW5M A==;
X-CSE-ConnectionGUID: 7nIJk9jFROiJ2tIqrCKs+A==
X-CSE-MsgGUID: 204r14ftRFy8vLWT/xEtgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4188027"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4188027"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 11:14:11 -0800
X-CSE-ConnectionGUID: HweP8Bw9TTasIwiH8vnJrA==
X-CSE-MsgGUID: mQIo8x0iSPe+r2Zwy7bTpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="11184616"
Received: from jesusnar-vm-u24.iil.labsad.intel.com ([10.111.58.210])
 by fmviesa001.fm.intel.com with ESMTP; 20 Nov 2026 11:14:10 -0800
From: Jesus Narvaez <jesus.narvaez@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Jesus Narvaez <jesus.narvaez@intel.com>
Subject: [PATCH v5 0/2] drm/xe: Handle GuC semaphore instruction field check
 error
Date: Fri, 20 Nov 2026 21:11:12 +0200
Message-ID: <20261120191111.4097737-4-jesus.narvaez@intel.com>
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

This series enables the driver to opt in to have the GuC check the SW Token Info
field of 64 bit semaphore instructions and then handle the G2H received from the
GuC when an unsupported value is detected.

Originally, I only had the patch to opt in to the GuC feature, but after
becoming aware of the series to add and use the has_sem64 flag, I added the
has_sem64 flag definition to this series and updated the opt-in patch to use the
new flag, with Tilak's permission.

Patches:
  1. drm/xe: Add has_sem64 bit to graphics/media IP descriptors
     Tilak's patch, carried over to this series unmodified (his v2)
  2. drm/xe/guc: Handle GuC semaphore instruction field check error
     Opts in to the GuC check when has_sem64 is set, and handles the G2H

Changes in v5:
- Patch 1: Updated to Tilak's v2, which now only compares has_sem64 when both
  GTs are present (Daniele). Added Daniele's Reviewed-by.
- Patch 2: No changes from v4.

Changes in v4:
- Patch 1: Added Tilak's patch to series, carried over unmodified.
- Patch 2: Updated to use the has_sem64 flag in the opt-in condition and updated
  comments accordingly. Daniele's Reviewed-by for v3 is kept with his
  permission.

v3 of the GuC patch: https://lore.kernel.org/all/20261029202643.2233648-2-jesus.narvaez@intel.com/
Tilak's patch: https://lore.kernel.org/all/20261120120231.748267-2-tilak.tirumalesh.tangudu@intel.com/

Jesus Narvaez (1):
  drm/xe/guc: Handle GuC semaphore instruction field check error

Tangudu Tilak Tirumalesh (1):
  drm/xe: Add has_sem64 bit to graphics/media IP descriptors

 drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h    | 10 ++++++
 drivers/gpu/drm/xe/xe_gt_types.h         |  2 ++
 drivers/gpu/drm/xe/xe_guc.c              | 10 ++++++
 drivers/gpu/drm/xe/xe_guc_ct.c           |  4 +++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 46 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h       |  2 ++
 drivers/gpu/drm/xe/xe_pci.c              | 27 ++++++++++++--
 drivers/gpu/drm/xe/xe_pci_types.h        |  2 ++
 drivers/gpu/drm/xe/xe_trace.h            |  5 +++
 10 files changed, 107 insertions(+), 2 deletions(-)

-- 
2.43.0

