Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FE2C79FBD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7F010F1FB;
	Wed,  9 Sep 2026 16:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="USWJI7Kv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D605D10E1CA;
 Wed,  9 Sep 2026 16:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970654; x=1820506654;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=59XHPZANc9FE11WD0/y5rOU9QUEtbWE0cAxiocawY9g=;
 b=USWJI7KvTZVdKd/ETTspsdOUA2l/XwfNArL+V87oGhtnLskVqOJyKVa4
 JPS/DCG/mmmBEOrCNmTSquOGINm7uJkuU5bDyDyKb0k9DbmjRM9ILTZLV
 Y7AVLFMiDdjCN8fMmmDw77PM/0NhlNnEDOdB8kkHQkZNEGPCUdhq8SAfA
 Oi5/O8vEHLXPw8z1YF47aJj/U9P10Bt+Esjzt8xazm9S02rDuISk3Du+i
 WZacepHMyCttZxdIFTlKoBfyFVhqp9tVyxKUJDtONK9Hl6JEjHputB+Xp
 tsFlxj3r0JQqgH2T3X52wmgegoVe5nx1g/HvK4Lc3RU0xnRF6hc7L22/N Q==;
X-CSE-ConnectionGUID: jhrhQv4vTPi/APC/y8mzGg==
X-CSE-MsgGUID: QQ7lR/OoTpyC0jwKl4ybEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="114946742"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="114946742"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:17:34 -0700
X-CSE-ConnectionGUID: GV9K7fjOR3WBduZOASfogA==
X-CSE-MsgGUID: l8X6Kcb9Q4S3goXKByrHpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296298810"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.137])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:17:33 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 00/13] drm/i915: Some DSB/flipq stuff
Date: Wed,  9 Sep 2026 19:17:17 +0300
Message-ID: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Some fixed and cleanups to the DSB/flipq stuff. The main
thing is consolidating the use_dsb/flipq booleans into
a more sensibler commit type enum.

v2: Drop a change to intel_crtc_needs_vblank_work()

Ville Syrjälä (13):
  drm/i915: Give up on DSB/flip queue if we fail to allocate the color
    DSB buffer
  drm/i915: Check use_flipq in intel_crtc_needs_vblank_work()
  drm/i915: Don't initialize flip queue on pre-LNL
  drm/i915: Warn about use_flip==true in MMIO commit codepaths
  drm/i915: Refine vblank evasion DSB check
  drm/i915: Make intel_crtc_needs_vblank_work() easier on the eye
  drm/i915: Extract intel_dsb_supported()
  drm/i915: Use intel_dsb_supported() to determine 'use_dsb'
  drm/i915: Extract commit_dsb_max_cmds()
  drm/i915: Introduce enum intel_commit_type
  drm/i915: Carve intel_atomic_commit_type() up a bit
  drm/i915/dsb: Add tracepoints for DSB commit
  drm/i915/dsb: Add tracepoints for flip queue

 drivers/gpu/drm/i915/display/intel_atomic.c   |   3 +-
 drivers/gpu/drm/i915/display/intel_color.c    |   7 +-
 drivers/gpu/drm/i915/display/intel_crtc.c     |  12 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 135 +++++++++++-------
 .../drm/i915/display/intel_display_trace.h    | 111 ++++++++++++++
 .../drm/i915/display/intel_display_types.h    |   8 +-
 drivers/gpu/drm/i915/display/intel_dmc.c      |   3 +
 drivers/gpu/drm/i915/display/intel_dsb.c      |  18 ++-
 drivers/gpu/drm/i915/display/intel_dsb.h      |   1 +
 drivers/gpu/drm/i915/display/intel_flipq.c    |  10 +-
 drivers/gpu/drm/i915/display/intel_vblank.c   |   6 +-
 11 files changed, 245 insertions(+), 69 deletions(-)

-- 
2.54.0

