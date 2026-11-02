Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F35D606A326
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J82FwXtB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53D110E5B0;
	Mon,  2 Nov 2026 10:02:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B635D10E5B0
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 10:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793613762; x=1825149762;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BpXHr28mZXop7CfzFccffk+tuXPls0bGBALcr0O4WGA=;
 b=J82FwXtBWpgBWDltPaIIuTrB1GHspF3fUMyce8UzDS0Rq+TIWYez/9NM
 vt4fvUy9Ahc36ADbsD1WwUewk9Ql2KMQjqoWZUCtnj+cj2Dj6pFmmUERx
 RVc6uLRIIw2SHQG+5sqXPkfN6WBzg9Z8NavQeBxPzNsQMLWIAYtoEBKhP
 HjqAPd+mNR1EeaCPEmyNbs35k0xbZBzMol4QaswwSZg872Alc3bbgjPuC
 hdm944eRddDZexVhsScuKXxyhDpsi/tNPNvbyigEurl+5KEGwywxqWth2
 zgHGbzQjhSaS7OssSbNYY5rhvtT7vKgafA7jDabbYo2AXBX84oSbuMgJM w==;
X-CSE-ConnectionGUID: dRQ8v+g/TOu4GyDIY8SPMg==
X-CSE-MsgGUID: hjYvuG8rTYaYB0ZuA+bXpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2325027"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2325027"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:02:41 -0800
X-CSE-ConnectionGUID: p0kktPsbTkeYuWaXHQIPEQ==
X-CSE-MsgGUID: ejrkWflhSLO81ysIHlPLZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6208908"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa003.fm.intel.com with ESMTP; 02 Nov 2026 02:02:39 -0800
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, satyanarayana.k.v.p@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 0/3] drm/xe: Use MI_SEMAPHORE_WAIT_64 (Wa_16029281913)
Date: Mon,  2 Nov 2026 15:30:15 +0530
Message-ID: <20261102100018.2209034-1-tilak.tirumalesh.tangudu@intel.com>
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
support at stepping B0; that exception is applied when resolving the
final value, so no caller needs to special-case it.

Patches 2 and 3 switch emit_fake_watchdog() and emit_ulls_postamble()
over to MI_SEMAPHORE_WAIT_64 on platforms that support it, falling back
to the existing 32-bit MI_SEMAPHORE_WAIT otherwise. ULLS_JOB_SIZE_DW is
bumped from 48 to 50 since the 64-bit postamble is 2 dwords wider and
the fixed-size ULLS job slot has no headroom to spare in the worst case
(SRIOV VF).

This series has not been validated on affected hardware.
Posting as RFC to get the approach reviewed while this is tested. Will 
repost as a regular PATCH once validated.


Tangudu Tilak Tirumalesh (3):
  drm/xe: Add has_sem64 bit for MI_SEMAPHORE_WAIT_64 support
  drm/xe: Use MI_SEMAPHORE_WAIT_64 for fake watchdog where supported
  drm/xe: Use MI_SEMAPHORE_WAIT_64 in ULLS postamble where supported

 .../gpu/drm/xe/instructions/xe_mi_commands.h  |  5 ++
 drivers/gpu/drm/xe/xe_gt_types.h              |  2 +
 drivers/gpu/drm/xe/xe_pci.c                   | 21 ++++++-
 drivers/gpu/drm/xe/xe_pci_types.h             |  2 +
 drivers/gpu/drm/xe/xe_ring_ops.c              | 55 ++++++++++++++-----
 drivers/gpu/drm/xe/xe_ring_ops_types.h        |  5 +-
 6 files changed, 73 insertions(+), 17 deletions(-)

-- 
2.46.0

