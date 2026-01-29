Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57918D358D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 08:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8D710E80C;
	Thu, 29 Jan 2026 08:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkV6ibll";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B115510E81A;
 Thu, 29 Jan 2026 08:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769674273; x=1801210273;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=/r7ByJy+EYnXQZNZ6uIsRji9ickMcjeejRxOnY7gB+k=;
 b=PkV6ibllplaOFXS0x9nTGxM8v9tkycLzCxUMsl+IToxmcZOyR19YDY2x
 DFH44heizZ/kpaB8JnvLU50U+odhpe+VHLIjkqpkHJSNthUqcKwBuvb2R
 E63P9JoXOovoWzF2NwogKImeL1KP1iAtSfY445oO+QcBnbLUjywV+XJ80
 6L29iyfsChRYCDz5L+WtAKskzhIdV6ll6FMCBRZXZRxhTt3dHwYzELZy7
 o2k2vdrG5H7S3S1eFfHGR4S44seKttBBXIDEyvw+Uro/HpXI1TM7xQBL4
 3Ab9xb8rh2wao5Dx4becDJ11evIt7qWx45dF2T+PJFkHU7PplgzfHpl4Z A==;
X-CSE-ConnectionGUID: eBmDpSmsSQ+FframDkz7Qw==
X-CSE-MsgGUID: YcNL0QtaTauvPstlVh9vqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74526694"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="74526694"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:11:12 -0800
X-CSE-ConnectionGUID: gxlGIFvDRHW7WFaXedj1XQ==
X-CSE-MsgGUID: Gi1kRkoFRuKQxZb19Eq/EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208747074"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.118])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:11:08 -0800
Date: Thu, 29 Jan 2026 10:11:05 +0200
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
Message-ID: <aXsWGWjacEJ03rTs@jlahtine-mobl>
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

Here goes this week's drm-intel-next-fixes PR.

Just one u64 underflow fix to appease the static checkers.

Regards, Joonas

***

drm-intel-next-fixes-2026-01-29:

- Prevent u64 underflow in intel_fbc_stolen_end

The following changes since commit 69f83f167463bad26104af7fbc114ce1f80366b0:

  drm/i915/psr: Don't enable Panel Replay on sink if globally disabled (2026-01-19 11:55:31 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-fixes-2026-01-29

for you to fetch changes up to ad3ebcc2d06875738cd463fb5424cda70cd94a34:

  drm/i915/display: Prevent u64 underflow in intel_fbc_stolen_end (2026-01-26 11:39:57 +0200)

----------------------------------------------------------------
- Prevent u64 underflow in intel_fbc_stolen_end

----------------------------------------------------------------
Jonathan Cavitt (1):
      drm/i915/display: Prevent u64 underflow in intel_fbc_stolen_end

 drivers/gpu/drm/i915/display/intel_fbc.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)
