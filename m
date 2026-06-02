Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74524CD6E60
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 22:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35EA10F62E;
	Tue,  2 Jun 2026 22:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FCQYu296";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D893110F62D;
 Tue,  2 Jun 2026 22:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780439821; x=1811975821;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cT16KCWktF+GIKO8qFgN32x9kTHlLnpcAFeNBqNzWXU=;
 b=FCQYu296oqoFvwF8lBdBSZZAKRiXspGnXqy4LI/6FVohpknoHgBBcA9q
 mx9ZoH6PBkVc18qTDAhn+gvRv/A7j0CYEkJnbVN1i2OPAxn/3QFPaCA2D
 gYW/p9WwKxA9DqJBfqNuulFrKtU1wmboZwhv2OLLZkHd/GtaOzSpbtdD9
 rQIGXOcgf0e3gSnmbmziPfPQJWy88kqt/8+bIFdAdittSUpfFdSntMOyA
 KEQ4teydz10zjz8iNK21TslKl/s0oDoxTf0X0IjCH8kYqNV46PmX5unxb
 L1e8TcKsUYxiqGkcaoNZ7igfiSru7S3Z5ELoYTKJDdSXtRlo0v3hSWk5+ g==;
X-CSE-ConnectionGUID: IProK5OUS0ejYLKT+oB50g==
X-CSE-MsgGUID: 2VhvEeRGT9CtcDIioTKvew==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92348346"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="92348346"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 15:37:00 -0700
X-CSE-ConnectionGUID: zwxvzvpjQsedajIY1R5+4w==
X-CSE-MsgGUID: 2gAFX3dJRFucfMOhXVgsXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="243879079"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 02 Jun 2026 15:36:59 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v4 0/2] match GEN6_/PCODE_DATA naming with spec
Date: Wed,  3 Jun 2026 00:36:38 +0200
Message-ID: <20260602223640.1375933-1-michal.grzelak@intel.com>
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

Next version of [1].

BR,
Michał

[1] https://lore.kernel.org/intel-gfx/20260507193601.533356-1-michal.grzelak@intel.com

---
Changelog:
v4->v5
- split i915 changes from xe (Jani)

v3->v4
- apply the rename to the read()'s signature as well (Sashiko)

v2->v3
- resolve conflict from rebase

v1->v2
- rebase onto drm-tip (Jani)


Michał Grzelak (2):
  drm/i915/pcode: rename GEN6_PCODE_DATA to match spec
  drm/xe/pcode: match argument naming with PCODE_DATAx

 drivers/gpu/drm/i915/display/intel_parent.c   |  4 ++--
 drivers/gpu/drm/i915/display/intel_parent.h   |  2 +-
 drivers/gpu/drm/i915/gvt/handlers.c           |  2 +-
 drivers/gpu/drm/i915/i915_reg.h               |  2 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c   |  2 +-
 drivers/gpu/drm/i915/intel_pcode.c            | 14 +++++++-------
 drivers/gpu/drm/i915/intel_pcode.h            |  2 +-
 drivers/gpu/drm/xe/display/xe_display_pcode.c |  4 ++--
 drivers/gpu/drm/xe/xe_pcode.c                 |  4 ++--
 drivers/gpu/drm/xe/xe_pcode.h                 |  2 +-
 include/drm/intel/display_parent_interface.h  |  2 +-
 11 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.45.2

