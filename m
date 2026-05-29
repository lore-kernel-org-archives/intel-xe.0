Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B090CD6E49
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 19:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A3E11245E;
	Fri, 29 May 2026 19:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPtealR7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1AA11245D;
 Fri, 29 May 2026 19:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780082955; x=1811618955;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jHqv9bP/R7RP887K8OdctoSNbzijnQMfBmn9uDviyLc=;
 b=TPtealR786CGM3jTgduebj/pnWk/UD+QLqtbPG3+sGrInaI/gkpFCmbA
 m4BEBbITtfBV+9Iku/tHsd7QYxtoyXpvERDkAGWJ+eluPaqqZVF2Xo8n/
 JIxhNdDKeRMRn5Vx8UJepHniBNvTkJvWrZQaTSjQHbbp1VwxzD7KkMNz5
 puuSBNaw0y++Qsfs5+kzSMItXJe1T4UvSwdbIn+mCu4fnpffnLl1xiyfw
 vzIgWaTuRMsev6LqaRW2sJE6Igl5sBEubHsnxLdByFOVkZsh+1L8wWqVl
 q0LSQ0SwP1Tog0J5SOajwR8JmsIza5J+IfXE5vXXMITRi962AiVr27x7v Q==;
X-CSE-ConnectionGUID: v+zbrAa2TxuiOv1i9wchwA==
X-CSE-MsgGUID: JIKME/NYQHiHnHpKdgQxuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="103611789"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="103611789"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 12:29:14 -0700
X-CSE-ConnectionGUID: uCz35o8TRjmq5IZobYaehQ==
X-CSE-MsgGUID: zNcN2475Ry6F0GHyWS66xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="240393469"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa008.fm.intel.com with ESMTP; 29 May 2026 12:29:13 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v4 00/10] Vswing / Pre-emphasis Override
Date: Fri, 29 May 2026 21:28:49 +0200
Message-ID: <20260529192859.4172376-1-michal.grzelak@intel.com>
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

Next version of [1]. IGT is available at [2], but needs another version.

Couple changes:
- patch shuffling xe3plpd_lt_buf_trans got dropped;
- "buffers' matrix" (two-dimensional superior table of
  intel_ddi_buf_trans_entry prepopulated with data from VBT #57)
  got completely slashed;
- instead, *vspeo pointer stores intel_ddi_buf_trans per each port.
  Buffer is still allocated during intel_bios_init() and is filled with
  deparsed data from VBT #57 on each VS/PE-O request in
  intel_ddi_buf_trans_get();
- index computation and accessing VBT #57 has been abstracted into
  separate, platform-dependent function hooks added into intel_encoder.

Booted and loaded custom VBT #57 on PTL with panel showing up.
Successfully overridden default with requested tables. 

[1] https://lore.kernel.org/intel-gfx/20260507013137.527510-1-michal.grzelak@intel.com
[2] https://lore.kernel.org/igt-dev/20260507012821.527453-1-michal.grzelak@intel.com

BR,
Michał


Michał Grzelak (10):
  drm/i915/bios: search for VBT #57 by default
  drm/i915/bios: store VBT #57's metadata in intel_vbt_data
  drm/i915/bios: structurize VS/PE-O metadata
  drm/i915/bios: print VS/PE-O port info
  drm/i915/bios: de/allocate VS/PE-O buffer for each port
  drm/i915/buf_trans: abstract VS/PE-O access and index computation
  drm/i915: override LT's VS/PE when requested
  drm/i915: override Snps's VS/PE when requested
  drm/i915: override Combo's VS/PE when requested
  drm/i915/bios: remove VS/PE-O warning

 drivers/gpu/drm/i915/display/intel_bios.c     | 192 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_bios.h     |  11 +
 .../drm/i915/display/intel_ddi_buf_trans.c    | 149 +++++++++++++-
 .../drm/i915/display/intel_ddi_buf_trans.h    |  33 +++
 .../gpu/drm/i915/display/intel_display_core.h |   7 +
 .../drm/i915/display/intel_display_types.h    |   5 +
 6 files changed, 382 insertions(+), 15 deletions(-)

-- 
2.45.2

