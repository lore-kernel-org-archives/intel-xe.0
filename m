Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CE2C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 18:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619B010E7B8;
	Wed, 25 Jun 2025 18:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c1GU2H2y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6281A10E236
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 18:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750874895; x=1782410895;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DGq4ePyFoqeEj5PD8Uc+w0HpctS7FgpoOtaub0IO/TI=;
 b=c1GU2H2yoQNfZ3dLszssSs8hKOwBKruXeQ2yVGxIlQlJaqZL25nJI9pj
 0gc3L8dZ4XM3eLvyexIc/e/B/YJGZPyGqej61B/kit/ef60xE6yeV2RmX
 tp84ww68UFEU9o0q3JBywy1sU+0Nlr5KDcfEDgt7R+Fx5oQ+ehUDhxa7c
 a1gRjATCrXFfDAc9ejYpYBS3fOZstfSDb9Dn9CAkK3zpLuWNO8YKWYq1Q
 6ZI4PneX1SOZZOavA2JQzKBeJleyPYL4oyRCJhW4uHiSZcijHv97yBTSp
 s5MgbWCsNCWMkoT031g5NALOeDb7hina+8IqeMN+CPSRVGYOCFrlR9ZBj A==;
X-CSE-ConnectionGUID: D3wkgNMAQZGOXAlCZf5hpQ==
X-CSE-MsgGUID: lN+gfeTHT42hoJL0b2Qu8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53293581"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53293581"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 11:08:15 -0700
X-CSE-ConnectionGUID: gI4VMe8LSJ2Zr0SMGipf+A==
X-CSE-MsgGUID: Wy/KCjlcRFm01foljLen3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="175941830"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 11:08:14 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 rodrigo.vivi@intel.com, Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v2 0/5] drm/xe: Create and use XE_DEVICE_WA infrastructure
Date: Wed, 25 Jun 2025 11:08:06 -0700
Message-ID: <20250625180811.17112-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
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

There currently is not a way to apply and track workarounds that are
needed ahead of GT init. This series adds a bit field to the xe_device
structure similar to those in the GT structures to apply and track
workarounds applied at runtime (oobs).

Device workarounds in this new infrastructure are tracked in the
existing sysfs entries in gtX/workarounds.

Currently 15015404425 is the only workaround like this, so move it to
using this new infrastructure.

PTL A0 is impacted by 15015404425, but only applies to Compute Die A0
stepping. The reality of modern platforms is that we're a Multi Chip
Package with logic spread acress multiple dies. This information not
being readily available during PCI probe without a read makes this more
complicated.

Apply 15015404425 to PTL unconditionally during PCI probe (and GT init).
After GT init use the Media GT stepping to determine if we can disable
this workaround.

v2: Change naming from SoC to device, address styling issues, update
commit messages

Matt Atwood (5):
  drm/xe: add xe_device_wa infrastructure
  drm/xe: Add infrastructure for Device OOB workarounds
  drm/xe: Move Wa_15015404425 to use the new EX_DEVICE_WA macro
  drm/xe: extend Wa_15015404425 to apply to PTL
  drm/xe: disable wa_15015404425 for PTL B0

 drivers/gpu/drm/xe/Makefile               | 11 +++++-
 drivers/gpu/drm/xe/xe_device_types.h      |  9 +++++
 drivers/gpu/drm/xe/xe_device_wa_oob.rules |  2 +
 drivers/gpu/drm/xe/xe_gen_wa_oob.c        | 27 +++++++++----
 drivers/gpu/drm/xe/xe_mmio.c              | 10 ++---
 drivers/gpu/drm/xe/xe_pci.c               | 11 ++++++
 drivers/gpu/drm/xe/xe_rtp.c               |  5 +++
 drivers/gpu/drm/xe/xe_rtp.h               |  3 +-
 drivers/gpu/drm/xe/xe_rtp_types.h         |  2 +
 drivers/gpu/drm/xe/xe_wa.c                | 46 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.h                | 18 +++++++--
 drivers/gpu/drm/xe/xe_wa_oob.rules        |  1 +
 12 files changed, 127 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_device_wa_oob.rules

-- 
2.49.0

