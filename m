Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D68606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 12:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JxcUUsH1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2970A11299C;
	Fri, 20 Nov 2026 12:05:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5777112974
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 12:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795176299; x=1826712299;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1LmtjzY6uXA3ki58yd7IoDDPOnvYpLXy4Iao1BugPKU=;
 b=JxcUUsH15kIluUVt+MS6SYydy84L/Zg5J9QCjpT68HtDSSkFUE1njdFQ
 NZfA9TCgeAFV5F7Kz8Oi6Qvs/5t+UFPlWBaKWP8GfgYvuHotM9KFuyNle
 sfGVonZhCLiguOacYlft6YG7KAe0I+2be0nZOT3lScNWmya24ehu5sw2q
 5kA1HnkD/baZtBqJ/SMFLIczn+2geghoqVlOozwNKda49uSKV5V9reU5q
 I6b2XVD2+ov+rALsUsLccJjxW7bv/ojH8kt5TByM6EXYvM2vqQqJSaI7O
 h1RNvgvVAJ7wbsQ1LB66BnYT+1TsV29Oex42ov64xTrFfn6ogCUXEvFgp g==;
X-CSE-ConnectionGUID: 2OQaNPIgRwGbvSvjIKgw6w==
X-CSE-MsgGUID: vMuGTvbKTBaqgv+s3x0+2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3936322"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3936322"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 04:04:58 -0800
X-CSE-ConnectionGUID: wBj7Kt98SKGPV81is2wriw==
X-CSE-MsgGUID: zGnjPt9MRDuR5frLhCbRrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10674122"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa004.fm.intel.com with ESMTP; 20 Nov 2026 04:04:54 -0800
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, satyanarayana.k.v.p@intel.com,
 piotr.piorkowski@intel.com, jesus.narvaez@intel.com,
 daniele.ceraolospurio@intel.com, stuart.summers@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 0/4] drm/xe: Use MI_SEMAPHORE_WAIT_64 (Wa_16029281913)
Date: Fri, 20 Nov 2026 17:32:27 +0530
Message-ID: <20261120120231.748267-1-tilak.tirumalesh.tangudu@intel.com>
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

Patch 1 adds a has_sem64 capability bit to the graphics/media IP
descriptors, resolved into gt->info.has_sem64 at probe time. Every Xe3p
platform supports it except Graphics version 35.10 and Media version
35.00, which only gain support at stepping B0; the stepping exception
is applied when resolving the final value, and both the primary and
media GT must agree before either one enables it, so no caller needs
to special-case it.

Patch 2 adds the MI_SEMAPHORE_WAIT_64 instruction definition.

Patches 3 and 4 switch emit_fake_watchdog() and emit_ulls_postamble()
over to MI_SEMAPHORE_WAIT_64 on platforms that support it, falling back
to the existing 32-bit MI_SEMAPHORE_WAIT otherwise. ULLS_JOB_SIZE_DW is
bumped from 48 to 50 since the 64-bit postamble is 2 dwords wider and
the fixed-size ULLS job slot has no headroom to spare in the worst case
(SRIOV VF).

Note: patch 1 (the has_sem64 flag) may end up landing via a different
series, since the capability bit itself is useful independent of this
workaround. If so, patches 2-4 here will depend on it being applied
first.

Testing status: patch 3 (fake watchdog) has been tested. Patch 4 (ULLS
postamble) still needs testing on a dGFX platform with USM support
where sem64 is supported.

v2:
- Patch 1: Only compare has_sem64 when both GTs are present (Daniele)
- Patch 2: Rename to MI_SEMW64_32BIT_COMPARE to fix alignment (Satya)
- Patches 3 and 4: Drop the WA comment, document the zero upper SDD
  dword (Satya)

Tangudu Tilak Tirumalesh (4):
  drm/xe: Add has_sem64 bit to graphics/media IP descriptors
  drm/xe: Add MI_SEMAPHORE_WAIT_64 instruction definition
  drm/xe: Use MI_SEMAPHORE_WAIT_64 for fake watchdog where supported
  drm/xe: Use MI_SEMAPHORE_WAIT_64 in ULLS postamble where supported

 .../gpu/drm/xe/instructions/xe_mi_commands.h  |  6 ++
 drivers/gpu/drm/xe/xe_gt_types.h              |  2 +
 drivers/gpu/drm/xe/xe_pci.c                   | 27 ++++++++-
 drivers/gpu/drm/xe/xe_pci_types.h             |  2 +
 drivers/gpu/drm/xe/xe_ring_ops.c              | 56 ++++++++++++++-----
 drivers/gpu/drm/xe/xe_ring_ops_types.h        |  5 +-
 6 files changed, 81 insertions(+), 17 deletions(-)

-- 
2.46.0

