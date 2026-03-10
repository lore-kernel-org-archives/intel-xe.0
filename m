Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8584FCC9D6
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 07:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B32710E219;
	Tue, 10 Mar 2026 07:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQxxqSzR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1127D10E219;
 Tue, 10 Mar 2026 07:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773129424; x=1804665424;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7TwBzeNnkoshVUQVhFTePeCLRszhoh8FSFg0Jk5Epnw=;
 b=fQxxqSzReEZX7/9X8AkQVmRzUNltIFePOxRtBqCRJ6Xt/L/fWkqU3DCy
 RAPOp6/Q/snw1fOY9dl9GRpBYZw+LXdfd7jw9r8R9d1g1tFvkbzsarhqx
 KXVAm0ZZDvLMjYNi/+MnvELe/GoMXbINRTEkV2KIAeub0iwju0ynw3Qqa
 npmh7Nkxryk+lyvYNHi9N7u7IBuC8zdthtYVd8AbRJRnnEy2ljbfcJ6Be
 dhu2jX15kPsXPsuJgv2IOWL8Vf4ta2yaur0Lsp0kjAajB1RPqMaPZhnrb
 e1yjONqa5D327JJJXcdzxLycfMIJLX9Q16tXdor4uaSmWGZVfkc7P0vbs g==;
X-CSE-ConnectionGUID: IBBT+lAhQmyNGZWSfGFC0A==
X-CSE-MsgGUID: VmcKXcIQS26awylFWNjrZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85256039"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="85256039"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 00:56:59 -0700
X-CSE-ConnectionGUID: aGLs+ut6Qyq9uSuliGI9dA==
X-CSE-MsgGUID: wgj27m2uQp6kQU0GGa+ANw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="224975807"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 00:56:56 -0700
Date: Tue, 10 Mar 2026 08:56:53 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 matthew.brost@intel.com, rodrigo.vivi@intel.com,
 riana.tauro@intel.com, christian.koenig@amd.com, andrealmeid@igalia.com
Subject: Re: [PATCH v2 0/3] Update 'none' recovery method for DRM wedged event
Message-ID: <aa_OxUm6vthhaorE@black.igk.intel.com>
References: <20260305130720.3685754-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305130720.3685754-1-raag.jadav@intel.com>
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

On Thu, Mar 05, 2026 at 06:36:46PM +0530, Raag Jadav wrote:
> Currently 'none' recovery method for wedged event expects no explicit
> recovery from userspace consumer but it expects driver to have reset
> the device, which may not always be the case. Update documentation and
> log to reflect this expectation.

Anything I can do to move this forward?

Raag

> v2: Rephrase documentation (Rodrigo)
> 
> Raag Jadav (3):
>   drm/doc: Update documentation for 'none' recovery method
>   drm: Update log for 'none' recovery method
>   drm/xe: Send 'none' recovery method for
>     XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
> 
>  Documentation/gpu/drm-uapi.rst | 14 +++++++-------
>  drivers/gpu/drm/drm_drv.c      |  2 +-
>  drivers/gpu/drm/xe/xe_device.c |  9 ++++++++-
>  3 files changed, 16 insertions(+), 9 deletions(-)
> 
> -- 
> 2.43.0
> 
