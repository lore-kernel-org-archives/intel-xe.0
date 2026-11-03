Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D818606A326
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 12:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e3U4irpm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314AD10F56D;
	Tue,  3 Nov 2026 12:39:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C0310F56D
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 12:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793709590; x=1825245590;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jfRVFInBdJ/cdzODXU5ae7LxyjLT/7qU4Dlrvk//tX8=;
 b=e3U4irpmJ5BWAEA2umRzr6HHdy37XwJnr5AtTDJXCPtvaTZHqURkr462
 XcO9bjZeh+I/aYODnmSs59Ha5w68KYOTwZTlkXp0mwpO6CrFhrr4C6Wpz
 mQvSUXXqTo5b8IHjZ2A7xRbWV+DhNLRKy725zjTK/lfBPqw9vTLgOlH+g
 7wfmy9Exj0eM+UFEeK6DEOKYDhijJYPRWJaXScCJSgNUBAblQIhb8nMf0
 g9cp+tbUh4s80nJzPgGpM5nUoHMD3cjJ+pjIHkYw5PoZKCY+zo4JoRLhE
 LdpfWo7NPg1Z/VxAC4zr0rpZdN9Xb7TaLsZJVffY474cQMwdydcUqVloC w==;
X-CSE-ConnectionGUID: 3Ib7D9VmTWO5rytqknry7g==
X-CSE-MsgGUID: bYvNpteKSkGhXL4gMOP7og==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2425628"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2425628"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 04:39:50 -0800
X-CSE-ConnectionGUID: ZGvUayNuTCyS23K4SwTHQA==
X-CSE-MsgGUID: wzpancsASRKVYWtrwEQZmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6509341"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa009.jf.intel.com with ESMTP; 03 Nov 2026 04:39:49 -0800
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, satyanarayana.k.v.p@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 0/3] drm/xe: Use MI_SEMAPHORE_WAIT_64 (Wa_16029281913)
Date: Tue,  3 Nov 2026 18:07:24 +0530
Message-ID: <20261103123727.2465599-1-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Wa_16029281913: MI_SEMAPHORE_WAIT has an issue on some Xe3p platforms.
The recommendation is to use the 64-bit MI_SEMAPHORE_WAIT_64 instruction
instead wherever the GT supports it.

Patch 1 adds the MI_SEMAPHORE_WAIT_64 instruction definition and a
has_sem64 bit to the graphics/media IP descriptors, resolved into
gt->info.has_sem64 at probe time. Every Xe3p platform supports it
except Graphics version 35.10 and Media version 35.00, which only gain
support at stepping B0, and the stepping exception is applied when
resolving the final value, so no caller needs to special-case it.

Patches 2 and 3 switch emit_fake_watchdog() and emit_ulls_postamble()
over to MI_SEMAPHORE_WAIT_64 on platforms that support it, falling back
to the existing 32-bit MI_SEMAPHORE_WAIT otherwise. ULLS_JOB_SIZE_DW is
bumped from 48 to 50 since the 64-bit postamble is 2 dwords wider and
the fixed-size ULLS job slot has no headroom to spare in the worst case
(SRIOV VF).

This series has not been validated on affected hardware.
Posting as RFC to get the approach reviewed while
this is tested. Will repost as a regular PATCH once
validated

Tangudu Tilak Tirumalesh (3):
  drm/xe: Add has_sem64 bit for MI_SEMAPHORE_WAIT_64 support
  drm/xe: Use MI_SEMAPHORE_WAIT_64 for fake watchdog where supported
  drm/xe: Use MI_SEMAPHORE_WAIT_64 in ULLS postamble where supported

 .../gpu/drm/xe/instructions/xe_mi_commands.h  |  6 ++
 drivers/gpu/drm/xe/xe_gt_types.h              |  2 +
 drivers/gpu/drm/xe/xe_pci.c                   | 20 ++++++-
 drivers/gpu/drm/xe/xe_pci_types.h             |  2 +
 drivers/gpu/drm/xe/xe_ring_ops.c              | 58 ++++++++++++++-----
 drivers/gpu/drm/xe/xe_ring_ops_types.h        |  5 +-
 6 files changed, 76 insertions(+), 17 deletions(-)

-- 
2.46.0

