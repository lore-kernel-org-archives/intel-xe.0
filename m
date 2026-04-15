Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2FBF433CC
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 23:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233B710E784;
	Wed, 15 Apr 2026 23:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="clCSfuc8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFAB10E77F;
 Wed, 15 Apr 2026 23:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776296814; x=1807832814;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gDMyTr6B5+J5kmBwUfazVw6mQzJrgDGx717wiqLAQlk=;
 b=clCSfuc8tl11dACdoYAcVC3y61pS7ZyD9rOBLcCINFLvFoAIRh28xS9w
 2U/7eeMhlmoSXSDaZRpKdwIhzUgGkDvENOCd2b1H5RB54CnKGdIzbzfVq
 zhMZckccUI986WSjgREz9C/lj9I771xGqkUqdKFrDvAPDPKzuqxToJVWU
 /wd8yqfYGCC7CJCs2+hgHG/JEurOGQLngC+fNnvkVC/+xO2xeN4ckMNGl
 tDc+hWl2i1gAZhvBFrPO5IXkZkoJ+6I0wx+2Elk1uSnDyWwB5lrChE1Qb
 aqjpFQoFJcKWs1L3y0ZrBXwSQJ55VqsB1sZlnpkuoSC9klg9vNknAr/99 Q==;
X-CSE-ConnectionGUID: vmiYP3nDQ3W9udFAcc/9yA==
X-CSE-MsgGUID: lak5b5kJReuLBlh7PTz/qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77403481"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77403481"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 16:46:54 -0700
X-CSE-ConnectionGUID: 554/bwbWTw6C2OAOH2RHHg==
X-CSE-MsgGUID: 9q4pUlcVSEyydkR50qr9PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235511098"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 15 Apr 2026 16:46:53 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v2 00/32] Vswing/Preemphasis Override
Date: Thu, 16 Apr 2026 01:46:07 +0200
Message-ID: <20260415234639.3577774-1-michal.grzelak@intel.com>
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

Next version of [1]. The series inflated and transformed so vastly that
there is little point in adding the changelog.

Currently there is no IGT support in decoding VBT #57; in near future I
will try to fix it.

Throughout the series I use the acronym of VS/PE-O; by using it I refer
to Vswing/Preemphasis Override. In few places I use VS/PE, by which I
mean the default tables. 

BR,
Michał

[1] https://lore.kernel.org/intel-gfx/20260331183332.1773886-1-michal.grzelak@intel.com/

Jani Nikula (1):
  drm/i915/ddi: add wrapper for calling ->get_buf_trans() hook

Michał Grzelak (31):
  drm/i915/buf_trans: align xe3plpd with VS/PE-O layout
  drm/i915/bios: search for VBT #57 by default
  drm/i915/bios: log unsupported VS/PE-O parsing
  drm/i915/bios: store VBT #57's metadata in intel_vbt_data
  drm/i915/bios: de/allocate VS/PE-O buffers' matrix
  drm/i915/bios: structurize VS/PE-O metadata
  drm/i915/bios: add buf_trans for each bios_encoder
  drm/i915/bios: de/allocate buf_trans for each port
  drm/i915/bios: check VS/PE-O in helper func
  drm/i915/bios: print VS/PE-O port info
  drm/i915/bios: remove VS/PE-O warning
  drm/i915/ddi: expose VS/PE-O buffers to intel_encoder
  drm/i915/buf_trans: override VS/PE-O when requested
  drm/i915/buf_trans: abstract VS/PE-O index computation
  drm/i915/bios: parse LT's VS/PE-O tables
  drm/i915/bios: shrink all LT's VS/PE tables
  drm/i915/buf_trans: compute LT's VS/PE-O index
  drm/i915/buf_trans: enumerate LT's VS/PE-O indices
  drm/i915/bios: parse Snps's VS/PE-O tables
  drm/i915/bios: shrink all Snps's VS/PE tables
  drm/i915/buf_trans: compute C20's VS/PE-O index
  drm/i915/buf_trans: enumerate C20's VS/PE-O indices
  drm/i915/buf_trans: compute C10's VS/PE-O index
  drm/i915/buf_trans: enumerate C10's VS/PE-O indices
  drm/i915/bios: parse EHL's VS/PE-O tables
  drm/i915/bios: shrink all ICL's VS/PE tables
  drm/i915/buf_trans: compute EHL's VS/PE-O index
  drm/i915/buf_trans: enumerate EHL's VS/PE-O indices
  drm/i915/bios: parse JSL's VS/PE-O tables
  drm/i915/buf_trans: compute JSL's VS/PE-O index
  drm/i915/buf_trans: enumerate JSL's VS/PE-O indices

 drivers/gpu/drm/i915/display/intel_bios.c     | 195 ++++++++++++++-
 drivers/gpu/drm/i915/display/intel_bios.h     |   3 +
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  |   2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |  17 +-
 .../drm/i915/display/intel_ddi_buf_trans.c    | 232 +++++++++++++++---
 .../drm/i915/display/intel_ddi_buf_trans.h    |  58 ++++-
 .../gpu/drm/i915/display/intel_display_core.h |   6 +
 .../drm/i915/display/intel_display_types.h    |   1 +
 drivers/gpu/drm/i915/display/intel_dpio_phy.c |   2 +-
 drivers/gpu/drm/i915/display/intel_fdi.c      |   3 +-
 drivers/gpu/drm/i915/display/intel_lt_phy.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c |   2 +-
 12 files changed, 462 insertions(+), 61 deletions(-)

-- 
2.45.2

