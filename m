Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57009EDF150
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 10:53:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670AF10E7D0;
	Fri, 13 Feb 2026 10:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DbtOmCxu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589DB10E7D0;
 Fri, 13 Feb 2026 10:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770980029; x=1802516029;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=3RZM4X58KU91SzjoNHUxsLzB7DZKyzagmmaBlYd5nS8=;
 b=DbtOmCxuUM+kNKQlx2bZ7rzza9OsapEry9RO+SDzqwX21GyLkkJ+vLCu
 nY31f7y2NJZvapeePsxfL51jltMu4XhTC6TXKyaPhIwfIBXKMvBCgkEWx
 pAFSTq5JCBYQVQF7e4S1pQZoxHLGcDSK4ljWaCpgNUH3/6ODhxyA7PgjD
 sZMYcgCZKhfP3N+vhJx+Dq1wdusoBVyhD6RTO4O1XpVonMGhuc3kq42bE
 /ZQT5ON21JeQX/inFyRsjs8FW7hzIKZeCvWs4piSL2Wiz5TztLnXZLWip
 IC7CZryv6FU3ohQd3qDjUqMKfY2qhYi5ZJahBxO6dB5swQPrFvacjFzk0 g==;
X-CSE-ConnectionGUID: iTeCM9HESA26h+y5NcIjtw==
X-CSE-MsgGUID: Z5YLzwEqRMyJhfG9EXypvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89748441"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="89748441"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:53:49 -0800
X-CSE-ConnectionGUID: +XHFlqiYT3632E7a7tG+Lw==
X-CSE-MsgGUID: icP7cmP7R+2rieQbNeACVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="212987534"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 02:53:44 -0800
Date: Fri, 13 Feb 2026 12:53:41 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-next-fixes
Message-ID: <aY8CtbhijtetQ6P3@jlahtine-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Dave & Sima,

Here is drm-intel-next-fixes PR towards v7.0-rc1.

Three display fixes: one 4K HDR regression, Dell XPS 13 eDP rate limit fixups
and small memory leak fix.

Regards, Joonas

***

drm-intel-next-fixes-2026-02-13:

- Regresion fix for HDR 4k displays (#15503)
- Fixup for Dell XPS 13 7390 eDP rate limit
- Memory leak fix on ACPI _DSM handling

The following changes since commit 3e28a67a85f9b569066f6dfcddadb39294c0c9d4:

  drm/i915/display: fix the pixel normalization handling for xe3p_lpd (2026-02-02 13:41:03 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-fixes-2026-02-13

for you to fetch changes up to 57b85fd53fccfdf14ce7b36d919c31aa752255f8:

  drm/i915/acpi: free _DSM package when no connectors (2026-02-12 08:03:11 +0200)

----------------------------------------------------------------
- Regresion fix for HDR 4k displays (#15503)
- Fixup for Dell XPS 13 7390 eDP rate limit
- Memory leak fix on ACPI _DSM handling

----------------------------------------------------------------
Ankit Nautiyal (1):
      drm/i915/quirks: Fix device id for QUIRK_EDP_LIMIT_RATE_HBR2 entry

Imre Deak (1):
      drm/i915/dp: Fix pipe BPP clamping due to HDR

Kaushlendra Kumar (1):
      drm/i915/acpi: free _DSM package when no connectors

 drivers/gpu/drm/i915/display/intel_acpi.c   |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c     | 20 +++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_quirks.c |  2 +-
 3 files changed, 19 insertions(+), 4 deletions(-)
