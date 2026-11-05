Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF988606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 11:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bqx2aXhZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99067112388;
	Thu,  5 Nov 2026 11:49:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC4F112388
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 11:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793879368; x=1825415368;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=10tsuD51o9lYcAA4tfuQYk3P/elnRb/oh4Df6+roIH8=;
 b=bqx2aXhZ+RImoDDa25Xsc2MNPWj8fSsVVaz8KdUz/3wrNYBrzPhrc1oZ
 4GL6AjJwtZa9z9bdhrMIdUIoF70huKJu7jl/VdQgMOpnF3OOVjlOKk3XM
 dRcw/GwKG75GCtXefhxlLGYgd0DlpfC3yQILxWkjDjVeYmhTw+0wxVdmx
 UDsZx4XPtKH5mSYtJGdBftSUptkMAtZGBMPiA3LJddYnbAG8csWu5TF8v
 GB0c2jYYAsGqdlhn6m0fwIDF/wuzCb/9kLc+SZU9N/O2ncVpw2DaYS3mQ
 UrG7kPnJodeOY8gXjnDdlwPRbmlZj5We9GCgMSDsRGcRZYllhYgVymbVF Q==;
X-CSE-ConnectionGUID: 4L9wTRE3S8WgOMwkD3MFmA==
X-CSE-MsgGUID: lDT27NSMTlW5DvPLspsQ6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2562827"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2562827"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 03:49:27 -0800
X-CSE-ConnectionGUID: CaGiPYcQSwK4xOISoszAPw==
X-CSE-MsgGUID: 8Hmnev4CRf66I7ZwxYkdZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7300116"
Received: from gsd-build.iind.intel.com ([10.190.229.108])
 by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2026 03:49:27 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 0/1] Fix VF probe issue due to missing LMTT dir ptr
Date: Thu,  5 Nov 2026 11:49:24 +0000
Message-ID: <20261105114923.880265-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In the recent platforms, while probing VF driver, seeing below error in
dmesg:

*ERROR* Tile0: GT1: H2G request 0x550e failed: error 0x103 hint 0x0
*ERROR* Tile0: GT1: failed to enable GuC opt-in features: -EIO
*ERROR* SIGID=101 FATAL (-EIO) PROBE: driver loading failed for device
'674c'
probe with driver xe failed with error -5

The LMTT directory pointer is configured on every GT of the tile only
from the primary GT's init/reset flow. On new platforms, both primary and
media GTs have their own forcewake. Primary GT's init holds only its own
forcewake, so the media GT write can be lost.

Program the LMTT directory pointer from each GT's own init and restart
path, while that GT's forcewake is held.

Also reordered include files in xe_lmtt.c.

Used MCR registers to write to primary GT and unicast register to write to
media GT.

---
V1 -> V2:
- Use MCR register for primary GT and unicast register for media GT
(Roper Matt).

Satyanarayana K V P (1):
  drm/xe/pf: Program LMTT directory pointer from each GT's init path

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_gt.c           | 14 +++----
 drivers/gpu/drm/xe/xe_lmtt.c         | 58 +++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_lmtt.h         |  5 ++-
 4 files changed, 55 insertions(+), 23 deletions(-)

-- 
2.43.0

