Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BC6606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 00:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L0XfpXx1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD89410EAC9;
	Tue, 17 Nov 2026 00:56:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716EC10EAC9
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 00:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794876960; x=1826412960;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V7BX278N26iWj//3TU/rrCIrpWvtMZiL5gxkq30UF2M=;
 b=L0XfpXx1XPK8fSo0e6IH4MLcX+NajICH9a3rtxN/iH6R7oOc73SzTamE
 Ys4QPGqjHT+9U2taB9UgOu/d7mw7g2LywfDhGelkS7sJ6N5qJcTCpUCTG
 b22GyDVdDPAtnDcNwqvzCMU0d/OW4X4cOM7PDKOxo8L2D+qyhYNex8ReS
 w4xHgvmgPGHw19qD5gBV0dZ1o1JnUbLiPIDJ9UqFHkJtJ36/GLhWD3gBg
 hi4pan1kdBd0XpZGu1Hll7Iv9DJsVF2FVFgRZU4HGbQw2N59QvDeK848U
 YXZNHoHtTKB75Yr8Cu19mFQ9DmOo/nKfTgH2/eqZR7KZJjeflCkiIVAU1 w==;
X-CSE-ConnectionGUID: LxJFTVHxS9qqP06kwHq/Uw==
X-CSE-MsgGUID: GJ1QJ3eySlWxk4nD/rLk6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3526338"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3526338"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 16:55:59 -0800
X-CSE-ConnectionGUID: xFBZse8+TfyIsOWnzEaudQ==
X-CSE-MsgGUID: Q9lheiSmQMuaRS9ra9bM2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9761861"
Received: from jesusnar-vm-u24.iil.labsad.intel.com ([10.111.58.210])
 by orviesa001.jf.intel.com with ESMTP; 16 Nov 2026 16:55:57 -0800
From: Jesus Narvaez <jesus.narvaez@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Jesus Narvaez <jesus.narvaez@intel.com>
Subject: [PATCH v4 0/2] drm/xe: Handle GuC semaphore instruction field check
 error
Date: Tue, 17 Nov 2026 02:55:35 +0200
Message-ID: <20261117005534.2322094-4-jesus.narvaez@intel.com>
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

Patch 1 is Tilak's patch, and it is carried over to this series unmodified.

Patch 2 is v4 of the GuC patch, and the only change between v3 and v4 is the use
of the has_sem64 flag in the opt-in condition and updating comments accordingly.
Daniele's Reviewed-by for v3 is kept with his permission.

v3 of the GuC patch: https://lore.kernel.org/all/20261029202643.2233648-2-jesus.narvaez@intel.com/
Tilak's patch: https://lore.kernel.org/r/20261113155734.4164230-2-tilak.tirumalesh.tangudu@intel.com

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

