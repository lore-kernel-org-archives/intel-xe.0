Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E154BC98310
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 05:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9584610E711;
	Thu, 24 Sep 2026 05:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cfculz7e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224FC10E711;
 Thu, 24 Sep 2026 05:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790229468; x=1821765468;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sCLpUrvi9pc3Da9ANKJ4OnBAT0pFqPorIu2thc/N+Iw=;
 b=Cfculz7eZ+QOfDkidpBAF+YRtjtF3o/aDMBWaC3fzmOyoufwlnw9Yjvv
 7OIXQkxNARGLQstwNJGNgFVIgMgrQLqXn/OJlElP9BlIjI4tby0wdU6iT
 GIeKuSqMSAKyXZMIkq/39q4Ta8/ezT73HHUAlffVAu7f9LZS1ev3vVfjR
 gIdFzofrsj4WSTY0Bh64qDpLv48SIMScpTnRrXCro8HerwTDZfuT+Ny5o
 iyg345+wcs0+BiIG6OOMBt5aCkYLNvc76PQtyTpu4H8MvBelf8ZFYRDxw
 47OIZ8eBGw7GCzxvqjz7KIFvLOmjp2sZ77Sm0E5Bhw75oqF7nJEJw+xiA A==;
X-CSE-ConnectionGUID: G4CAEjXRQY+O5gjIa7bAhg==
X-CSE-MsgGUID: lYb6LXJmTTa7R0/rZ/o1JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="107375056"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="107375056"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 22:57:48 -0700
X-CSE-ConnectionGUID: Ccg7rMVyTJmAVVUuhOox3A==
X-CSE-MsgGUID: 0YT3v+zOQyquzyIyb8vjWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="5170379"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa013.fm.intel.com with ESMTP; 23 Sep 2026 22:57:46 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 animesh.manna@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 0/2] drm/i915/display: Couple of DC3co fixes
Date: Thu, 24 Sep 2026 11:27:33 +0530
Message-Id: <20260924055734.2138787-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

While looking at why DC3co sequences I came across some steps
that were missed or miscoded.
The first one is a plain missing register write. DC3co enabling is
double buffered on a CMTG delayed vblank and CHICKEN_DCPR_1 bit 5 picks
which CMTG that is, but we never program it. Setups running on CMTG B
end up armed off CMTG A's vblank and only work because the reset value
happens to be the one we want half the time.
The second one is us being stricter than the spec. We only allow DC3co
when pipe A drives port A or pipe B drives port B, but Bspec has no such
restriction and neither does CMTG, so an eDP panel on the other port
just loses DC3co for no reason.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (2):
  drm/i915/cmtg: Select the right CMTG vblank for DC3co
  drm/i915/display: Don't require a 1:1 pipe to port mapping for DC3co

 drivers/gpu/drm/i915/display/intel_cmtg.c          |  2 ++
 drivers/gpu/drm/i915/display/intel_display_power.c | 10 +++-------
 drivers/gpu/drm/i915/display/intel_display_regs.h  |  1 +
 3 files changed, 6 insertions(+), 7 deletions(-)

-- 
2.34.1

