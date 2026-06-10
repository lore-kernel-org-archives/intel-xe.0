Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0BCCD8C90
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 17:06:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C078A10E50A;
	Wed, 10 Jun 2026 17:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i7N3nXkW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD58F10E50A;
 Wed, 10 Jun 2026 17:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781111217; x=1812647217;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6yD6w63qbg8RKnbzyJqPL0v7NMj/K+wtyq1MWmhVzcM=;
 b=i7N3nXkWztnlKnXDNvm1Md/c0BmTUDCajdmrIguHX6fMKHs7PlKlkR7j
 SE2P7kp+yhPllPMzEZm7fkGOz9WzvutHmxF0pGXA3xLDhSbn14sAtJKJ5
 GSjSQN++vDghSo5vWLDj+sNotAWhSKtm68hK8dBVgiS3XTsvbblFcge1t
 vwW96iOm8HU5IzflbAQHGA1fm0YgGns+ThMqYGCGP05jI7V8Tk4TGidi+
 8nMbrMu0x8iyK4dcCCgDSMS0s9DHReS0ebH8ZboHqIhGVC/Sa7heaMAlF
 pbhYJgEUF+rmygY/Zcp3dThW8ypp6Ckj/tc5E4Kx7KPUMnydbw14kHQNA w==;
X-CSE-ConnectionGUID: tuFh4ymeRGC5nPaVR/Safg==
X-CSE-MsgGUID: /93AVLkkT/iuv4881xz8+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99490257"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="99490257"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:06:57 -0700
X-CSE-ConnectionGUID: 6yCSQVUzQq+0+X/o8IE93g==
X-CSE-MsgGUID: ZA/MRzwVRWSU4qrfN2e13Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="250507217"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.62])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:06:56 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 00/14] drm/i915/cdclk: cdclk pcode related fixes and
 refactoring
Date: Wed, 10 Jun 2026 20:06:37 +0300
Message-ID: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
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

 drivers/gpu/drm/i915/display/intel_cdclk.c | 301 ++++++++++++---------
 1 file changed, 171 insertions(+), 130 deletions(-)

-- 
2.53.0

