Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4375CD6E60
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 23:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A487911246A;
	Wed,  3 Jun 2026 23:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VY4KXV3B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA7211246A;
 Wed,  3 Jun 2026 23:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780527957; x=1812063957;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qexud8my5w6lQp0xeA4iuil5/uQknJcGTg4X1T/4ius=;
 b=VY4KXV3BR4aaiS5n/i97XqtoXxU7eunIbr0DrIv3mJYbP3aDh28b0vr9
 HQNlU2VbtmMMUZls2+NYiUAyfJoUm5VHW96I7q5q1gdkF5VTo8KrynP4k
 gZMX2DlQMX0+ea7zxtGmqcOmsZIYE1BHTx8aimYZcFBw15rM2MN5TzTur
 Tw+z4kvxTbLM/lLZ68LZBW4QdLPBezFNi1A+mhsCdRyYwZBbY70U5RgF6
 o6Hfky/1JpSN1yWKgZ2kbOVskSMfwXJqFIM3PamCq7DVf6g+Fc5BYqN+R
 ykgu3nGcz2xgnBkmPRusknny3d9zhkpqXSFuP6Owt13wuhtUvJEOEcC1N Q==;
X-CSE-ConnectionGUID: rCt4HKYJTZuC3Q2P6ySlsA==
X-CSE-MsgGUID: 0GTPr9J4QSagKtEpvZZl2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="104013963"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="104013963"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 16:05:56 -0700
X-CSE-ConnectionGUID: B5eGPCstTke7/gVavPysDA==
X-CSE-MsgGUID: qyNFV4ugTJ+Rs6FKwoV46g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="244223622"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 03 Jun 2026 16:05:55 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v6 0/8] Vswing / Preemphasis Override
Date: Thu,  4 Jun 2026 01:05:36 +0200
Message-ID: <20260603230544.1993439-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Next version of [1]. IGT is at [2] and still pends v2.

This version finally fixes NULL pointer dereference seen consistently on
module load on fi-hsw-4770, which blocked all of i915 testing.

Booted and successfully overridden default VS/PE with custom VBT on PTL.

BR,
Michał

[1] https://lore.kernel.org/intel-gfx/20260602170031.1163205-1-michal.grzelak@intel.com
[2] https://lore.kernel.org/igt-dev/20260507012821.527453-1-michal.grzelak@intel.com

---
Changelog:
v5->v6
- check if devdata is not NULL
- add Bspec (Suraj)
- remove drm_WARN_ONCE (Suraj)
- pass default VS/PE tables to LT's BIOS accessor (Suraj)
- set txswing & _level from default VS/PE tables (Suraj)
- add helper checking if VS/PE-O has been allocated (Suraj)

v4->v5
- set devdata->vspeo->num_entries in intel_bios.c
- add if-ladder instead of function pointer
- blend index computation with table parsing
- remove WARN and debug messages
- remove enums entirely
- add spaces around operators (Suraj)
- remove spaces after type casting (Suraj)
- remove INTEL_DISPLAY_STATE_WARN (Suraj)
- change funcs prefix from snps_ to mtl_ (Suraj)

v3->v4
- add Bspec (Suraj)
- remove unnecessary init of VS/PE-O metadata (Suraj)
- add helper for computing number of rows (Suraj)
- fix num_rows's type (Jani, Suraj)
- declare num_rows (Suraj)
- change debug message when requesting VS/PE-O (Suraj)
- stick to solely changing VBT data into current structures (Jani)
- move iterator declaration to declaration block (Suraj)

v2->v3
- remove unnecessary braces from if block (Suraj)
- return -EINVAL instead of -1 (Suraj)

Michał Grzelak (8):
  drm/i915/bios: search for VBT #57 by default
  drm/i915/bios: store VBT #57's metadata in intel_vbt_data
  drm/i915/bios: print VS/PE-O port info
  drm/i915/bios: de/allocate VS/PE-O buffer for each port
  drm/i915: override LT's VS/PE when requested
  drm/i915: override Snps's VS/PE when requested
  drm/i915: override Combo's VS/PE when requested
  drm/i915/bios: remove VS/PE-O warning

 drivers/gpu/drm/i915/display/intel_bios.c     | 184 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_bios.h     |  13 ++
 .../drm/i915/display/intel_ddi_buf_trans.c    | 133 ++++++++++++-
 .../gpu/drm/i915/display/intel_display_core.h |   7 +
 4 files changed, 327 insertions(+), 10 deletions(-)

-- 
2.45.2

