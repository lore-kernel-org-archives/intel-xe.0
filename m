Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A74ACD3436
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 01:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2C410E23B;
	Thu,  7 May 2026 01:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VfAvng3T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F0A10E231;
 Thu,  7 May 2026 01:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117509; x=1809653509;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eoXuOnJRQOYAQr7C7o2m/JXzpSRrXdSrzkE8X/qgvxM=;
 b=VfAvng3TQlfCkjQ06onxdRZ5Kgyx+W65b6sGusjv30fgkedeMT8nUm2d
 mSFJzQXqPsI3hN3SdXqj7nqxrLOu53sIhvdOOsqCncFFWESaIyb2TV8gm
 bES5P9Musuog0nvPMP/dAF7MLoDp0WyNUVOHV9g1NJnDRA2+x/ZtJ4OQJ
 FDyRUx9UAyCxxf9xmXmDjO+pv+775JJgg97TOvs+j8NPocYjdUF1lsX0W
 ei7AcXT+4KJ2W2lsMEhh5aM/T24nPJagAlvzlWebPImjqk07i/ZrPY4Nq
 AU4t186RAdxIh5OeMzLtpFK4dIXWVAoz/gg9CPRcs3uk9HXnU6Q8Kjeyr w==;
X-CSE-ConnectionGUID: 3z9tyQkoSHmkNFBKxN75zA==
X-CSE-MsgGUID: swSe1lORQX2fEfBaN2tLig==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78089011"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="78089011"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:31:48 -0700
X-CSE-ConnectionGUID: eF6ddCWZRNm/XocAWHMsew==
X-CSE-MsgGUID: 9Iogyd8VQYmJlOP3dPsHOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="266692720"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 06 May 2026 18:31:48 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 00/31] Vswing/Preemphasis Override
Date: Thu,  7 May 2026 03:31:06 +0200
Message-ID: <20260507013137.527510-1-michal.grzelak@intel.com>
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

Next version of [1]. IGT series for decoding is available at [2].

BR,
Michał

[1] https://lore.kernel.org/intel-gfx/20260415234639.3577774-1-michal.grzelak@intel.com/
[2] https://lore.kernel.org/igt-dev/20260507012821.527453-1-michal.grzelak@intel.com/

---
v2->v3
- remove braces from if blocks (Suraj)
- return -EINVAL instead of -1 (Suraj)
- break logging into two lines
- remove null pointer check before kfree()
- switch from kzalloc() into kzalloc_obj() and kzalloc_objs()
- resolve conflict from rebase

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

 drivers/gpu/drm/i915/display/intel_bios.c     | 193 ++++++++++++++-
 drivers/gpu/drm/i915/display/intel_bios.h     |   3 +
 drivers/gpu/drm/i915/display/intel_ddi.c      |   1 +
 .../drm/i915/display/intel_ddi_buf_trans.c    | 228 +++++++++++++++---
 .../drm/i915/display/intel_ddi_buf_trans.h    |  55 ++++-
 .../gpu/drm/i915/display/intel_display_core.h |   6 +
 .../drm/i915/display/intel_display_types.h    |   1 +
 7 files changed, 438 insertions(+), 49 deletions(-)

-- 
2.45.2

