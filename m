Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7045ACD6E79
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 03:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D69510E064;
	Tue,  9 Jun 2026 03:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMpiZIzW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE7E10E064;
 Tue,  9 Jun 2026 03:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780974665; x=1812510665;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z9p25p0vVkNvirUffzHXMr2pU+NWfa5Rb3UzJ0FFnhg=;
 b=CMpiZIzWu8w87DACDv6ATFjIqRL+c/duzFyVzhfFj/d3TzuKcel+2EX0
 VcqKtlBJLqAblo9XHcuqmwc+uSM2V1bnWLJ+xt6E6qDaAFVF1extoe95j
 /7fTSK/JMffj+yFXh5w1qp/j3Ul4+U8uyEP2ZTGM1LM62Lyan1tki5VBD
 SGO5mqO0b0grk8qcRAZvLxY1X5bkAxT9yqHT1FcffkT82tz/zSvw+3kcw
 Vur1Lywtf2K8TiS0Jnrz+xCODyHDWkTJabHd/p95OzuepZqx8GH1DjFfi
 yTQprtdw57HRfYurOBXZS1EI38kyBdMkbQ0Vi4pZR6MOgcBfSBxIN1SZG Q==;
X-CSE-ConnectionGUID: +oX507kBR2SfWwVz7IWMhA==
X-CSE-MsgGUID: GcL/pWw+REiQ14+sOd9arA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85351715"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="85351715"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 20:11:04 -0700
X-CSE-ConnectionGUID: jouVcOXPTDSPdaCvQSuBcA==
X-CSE-MsgGUID: MtkfgtVdSLC6/XpLx+akvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="241287283"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 20:11:02 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 0/2] drm/i915: Handle VSYNC timing changes in the LRR path
Date: Tue,  9 Jun 2026 08:23:23 +0530
Message-ID: <20260609025325.1128543-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This two patch series was originally part of [1], where these were
reviewed by Ville. The rest of that series is being reworked along
the lines suggested in [2], so splitting these out for separate
merge.

Patch 1 extends the LRR fast-update path to also program TRANS_VSYNC,
so VSYNC-only timing changes go through LRR instead of a full modeset.

Patch 2 keeps the Vtotal-to-Vsync distance constant when vtotal is
stretched for a lower refresh rate on fixed modes.

Minor review comments from v1 are addressed in the individual commits.

[1] https://patchwork.freedesktop.org/series/165604/#rev3
[2] https://lore.kernel.org/intel-xe/aiA8bL4E1SCZQVsw@intel.com/

Ankit Nautiyal (2):
  drm/i915/display: Handle VSYNC timing in LRR path
  drm/i915/panel: Preserve Vtotal-Vsync distance while adjusting vtotal

 drivers/gpu/drm/i915/display/intel_display.c | 16 ++++++++++++++--
 drivers/gpu/drm/i915/display/intel_panel.c   |  9 ++++++++-
 2 files changed, 22 insertions(+), 3 deletions(-)

-- 
2.45.2

