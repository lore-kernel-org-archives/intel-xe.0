Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE7EC61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2705010ED13;
	Wed, 26 Aug 2026 13:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dDKzfEGV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22D610ED13;
 Wed, 26 Aug 2026 13:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787751638; x=1819287638;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QKZa/l2z6KafvZ9ES55rAUMah6AK5pR2/m65Rj6Ebyg=;
 b=dDKzfEGV4DTL6Acg9l/juhlWEbFKz6a63MuFwEEFIw6RAO1zzMSGXman
 Z15oHnLsqmdXqJnLwV4bbBA9oX1Z0R7+6xoyfyOFyIalvrJJgZip3DKHE
 gSbAoW1wYVJTwUgq9OlWtxdtLMCONeu7O7DBOmlNnaqEk0DJlZjiVQtas
 A1/FtLf2oP78Ku6ByFL0/dlOQjY6nozI9MuIQTwh8U0H8f/ZqE6M+Zj0y
 D8HG0sz253xmRUGKYN0dpEeNQ928kQJ4cxe+Ibb+44Ehy3TKtZ2/6RLeE
 ysf5Tv/OJitffVxjA4LwmIDCwwT6d4jB7cZ5ShdMm+hb8JJqHIdtnPV48 Q==;
X-CSE-ConnectionGUID: HNItWlG3SwGSH6qNYmXKpw==
X-CSE-MsgGUID: mLf5uSDNQ0uNnDgDqrXczA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88152235"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88152235"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:40:37 -0700
X-CSE-ConnectionGUID: wAHUTBkZR82+zYVKTGVSbg==
X-CSE-MsgGUID: 3HHK94ouRi2XXu8dtnmobw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="264980460"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.39])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:40:36 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 00/14] drm/i915/cdclk: cdclk pcode related fixes and
 refactoring
Date: Wed, 26 Aug 2026 16:40:19 +0300
Message-ID: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
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

Fix up some bugs around the cdclk pcode notificatiosn on DG2,
follow up with some unification/cleanups, and finally convert
the pcode stuff (except on dg2, due to it doing weird things)
into vfuncs (goal being to make the code less messy).

v2: s/cdclk/cdclk_mhz/ in the dg2 code

Ville Syrjälä (14):
  drm/i915/cdclk: Don't bail if pcode post nofify fails
  drm/i915/cdclk: Pass CDCLK in MHz to pcode on DG2
  drm/i915/cdclk: Do the DG2 CDCLK/pipe power well notify properly
  drm/i915/cdclk: Notify DG2 pcode about pipe power wells regardless of
    CDCLK
  drm/i915/cdclk: Stop forcing voltage level to 3 all the time on DG2
  drm/i915/cdclk: Drop pointless platform check from bxt_set_cdclk()
  drm/i915/dg2: s/intel_/dg2_/ for DG2 specific stuff
  drm/i915/cdclk: Unify the pcode pre/post notify in bxt_set_cdclk()
  drm/i915/cdclk: Unify pcode related debugs
  drm/i915/cdclk: Extract bdw_cdclk_pcode_{pre,post}_notify()
  drm/i915/cdclk: Extract skl_cdclk_pcode_{pre,post}_notify()
  drm/i915/cdclk: Extract bxt_cdclk_pcode_{pre,post}_notify()
  drm/i915/cdclk: Introduce CDCLK .{pre,post}_notify() vfuncs
  drm/i915/cdclk: Hoist intel_cdclk_{pre,post}_notify() calls upwards

 drivers/gpu/drm/i915/display/intel_cdclk.c | 314 ++++++++++++---------
 1 file changed, 180 insertions(+), 134 deletions(-)

-- 
2.54.0

