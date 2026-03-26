Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C9B10A3D80
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 12:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCD210E9C3;
	Thu, 26 Mar 2026 12:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iD3ucI0L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9415810E9A0;
 Thu, 26 Mar 2026 12:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774526643; x=1806062643;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=utzU4rlyXmA6qgS8bIQO1GT4JlbkNNYvvWA3J4EPLdk=;
 b=iD3ucI0LcWTSGAc1bNdoqEYL1Hq3Y45zwILcIlNYWXPvX/vmMkj3k2Na
 q5y4XwKQ84WdXXEGJ4ThZAhkQ6RNf0zw51Nr5hkm8lcxBKmrr9kobUNaq
 wSxjrkqrbdrOpISbeTBpKKUHIlxyOQ2+gIVq8IY1PkTbEaWt7N13sv/rd
 xYr+jbiq1cnw8mgTW3PhbR/y+oQ2IyG4daZ+kmBI6zqmgu2QuB4Svvx/l
 X/VsPlm03Sex/n0p7he8kksQxB4HH8/CzgxbR05pfbvx791uhAkastq9X
 zE7R2v0ylTVb/+wDCt6JqEG1lwYSvBTez/ukXcZVrCkgBe70orb6/Y9XQ A==;
X-CSE-ConnectionGUID: 9RVyf1L7QUm/DtGnO4TKpg==
X-CSE-MsgGUID: tMJPKvEJQ6mnMVJkgorZDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86960530"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="86960530"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 05:04:03 -0700
X-CSE-ConnectionGUID: jt0vkpqORnCm9RLWHFWDig==
X-CSE-MsgGUID: zzNRUWDPRH+sXbiiaIUEyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="224999434"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa008.jf.intel.com with ESMTP; 26 Mar 2026 05:04:02 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 0/3]  Make casf updates atomic and dsb ready
Date: Thu, 26 Mar 2026 17:30:26 +0530
Message-Id: <20260326120029.3409676-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

  The existing implementation for casf scaler re‑implemented
parts of skl_scaler logic and programmed registers from
pre‑plane update hooks, which caused:
  - updates were not atomic.
  - prevented execution via Display State Buffer.
  - computed state was late.

This series fixes these issues by:
  - consolidating common logic into skl_scaler.c.
  - moving computation into crtc_compute_config().
  - Create a common wrapper for pfit and casf so
    that whenever pipe scaler is done through dsb
    casf can also be dsb compatible

Nemesa Garg (3):
  drm/i915/display: Move casf_compute_config
  drm/i915/display: Introduce skl_pipe_scaler_setup()
  drm/i915/display: Common wrapper for casf and pfit

 drivers/gpu/drm/i915/display/intel_casf.c    |  11 ++
 drivers/gpu/drm/i915/display/intel_casf.h    |   2 +
 drivers/gpu/drm/i915/display/intel_display.c |  36 +++----
 drivers/gpu/drm/i915/display/skl_scaler.c    | 104 +++++++++++--------
 drivers/gpu/drm/i915/display/skl_scaler.h    |   5 +-
 5 files changed, 89 insertions(+), 69 deletions(-)

-- 
2.25.1

