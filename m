Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CB5E9128C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 08:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B53B10E7EC;
	Thu,  5 Feb 2026 08:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E8al/kwR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A4C10E7EC;
 Thu,  5 Feb 2026 08:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770278564; x=1801814564;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=W3HCSwVO02Jf4aCwQWQtsGXNqivdwb5pfp+JVt5AeHo=;
 b=E8al/kwRzg4W/v1pbHh9ZF4u0NDVor58BHgZBzlmU8pQ0pbOWN+HxMws
 qpHe45RMxPMdzy5uldLpTSgw9r9ot9MB4we6TsnTSJYvUMwWR+8cAdSdQ
 vgIvM2Vwu52irvXO/z5Ydfrtl2HE5SN8FQZlhp2RlD/TZGrEYcpw0w4CE
 +Yb4Xh4HSvZJj6UwPMHtzDjUEaWp/f/lD/gz0oRqH09IT4bUhsakRVS4Z
 HHZ922SBTmfiGZI383dvVFcGZp0r2OkgcZ0pyHX9AQWEJrpAOGxXTtkyT
 D/hwdjjg/AlO+RUEe/gHHLH8ZcyIqAlroAs0GTceMkFkjsd9yc2P3SQiC w==;
X-CSE-ConnectionGUID: Htrb7/vcQjmRD5wKy04CUg==
X-CSE-MsgGUID: +BIGO34lRLG7oDc1N08z7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="74073705"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="74073705"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 00:02:44 -0800
X-CSE-ConnectionGUID: +0aAbd+fTbiwJg7ZpRqrYw==
X-CSE-MsgGUID: ySThqqn4QOeriYv192hp1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="233363971"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 00:02:40 -0800
Date: Thu, 5 Feb 2026 10:02:38 +0200
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
Message-ID: <aYROngKfyUIyoQW0@jlahtine-mobl>
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

Here goes this weeks drm-intel-next-fixes PR towards 6.20/7.0-rc1.

Just one display fix for Xe3p_LPD pixel normalization.

Regards, Joonas

***

drm-intel-next-fixes-2026-02-05:

- Fix the pixel normalization handling for xe3p_lpd display

The following changes since commit ad3ebcc2d06875738cd463fb5424cda70cd94a34:

  drm/i915/display: Prevent u64 underflow in intel_fbc_stolen_end (2026-01-26 11:39:57 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-fixes-2026-02-05

for you to fetch changes up to 3e28a67a85f9b569066f6dfcddadb39294c0c9d4:

  drm/i915/display: fix the pixel normalization handling for xe3p_lpd (2026-02-02 13:41:03 +0200)

----------------------------------------------------------------
- Fix the pixel normalization handling for xe3p_lpd display

----------------------------------------------------------------
Vinod Govindapillai (1):
      drm/i915/display: fix the pixel normalization handling for xe3p_lpd

 .../gpu/drm/i915/display/intel_display_device.h    |  1 +
 drivers/gpu/drm/i915/display/intel_fbc.c           | 10 +++---
 drivers/gpu/drm/i915/display/intel_fbc.h           |  3 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 36 +++++++++++-----------
 4 files changed, 26 insertions(+), 24 deletions(-)
