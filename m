Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8154D44D77
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 14:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7843B10E6F6;
	Wed,  6 Nov 2024 14:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAhKDxMi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4E110E6F3;
 Wed,  6 Nov 2024 14:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730902024; x=1762438024;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gyxI8gJEurCXRHLw63mRpvLI2qDDQ5C2sGyQU2MnGJU=;
 b=PAhKDxMiO7WIvpALHJPogsgonXa9bqQ7IWqoc0sZekn9LSi7KHXBWSdh
 wN43xWemodk/B1OzbVqMg+JGpY7PhoXpKKcVsOdHInQujM+4aZp60Gemg
 xEm2IT8OGYICr+brK9TvuPWI7Nt1oKo1IIc1x1f0N/K8qmM4h7wLK3SPP
 k1pF3+RYiDykGxuUo3znnZbpvkRJAK1WCcKT4t+lYDRTnuiwxRi5wER2/
 X1Z6ly+jd4QmK52xoKdQ1vKTtuMEqxWGFee8jCfV4Pbb20jggY9hXyKqb
 5cjbMZqVcSJvK6RHtMq+rtdLFPaj4G152CD+BohbHMCvhL6z66/bwvTeO g==;
X-CSE-ConnectionGUID: 0ZwOM9IZQemHMMCHtGjlDA==
X-CSE-MsgGUID: QMnwDi1uSTGqXj9gDouiTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="41323294"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="41323294"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 06:07:03 -0800
X-CSE-ConnectionGUID: mw8Rsk3TQpGg5A87LAY7oQ==
X-CSE-MsgGUID: byLizpo/QsW3bFVm89lP2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="84653927"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 06 Nov 2024 06:07:01 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 06 Nov 2024 16:06:59 +0200
Date: Wed, 6 Nov 2024 16:06:59 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@intel.com, jani.saarinen@intel.com
Subject: Re: [PATCH 3/8] drm/i915/display: update use_minimal_wm0_only to use
 intel_display
Message-ID: <Zyt4A8kfBqwqRRwB@intel.com>
References: <20241105071600.235338-1-vinod.govindapillai@intel.com>
 <20241105071600.235338-4-vinod.govindapillai@intel.com>
 <87ses6gi93.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ses6gi93.fsf@intel.com>
X-Patchwork-Hint: comment
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

On Tue, Nov 05, 2024 at 11:08:40AM +0200, Jani Nikula wrote:
> On Tue, 05 Nov 2024, Vinod Govindapillai <vinod.govindapillai@intel.com> wrote:
> > Avoid using struct drm_i915_private reference and use intel_display
> > instead. This is in preparation for the rest of the patches in this
> > series where hw support for the minimum and interim ddb allocations
> > for async flip is added
> 
> This is technically correct, but it's self-contained in a single
> function. I've preferred two approaches over this:
> 
> - Convert entire files (sometimes internally first, with the external
>   interface changes in a separate patch, depending on how big the patch
>   becomes).
> 
> - Convert single functions which are widely used and have struct
>   intel_display as parameter, to limit the size of the patch (as opposed
>   to doing the conversion as part of an entire file change).
> 
> I think Ville said he's had a go at converting skl_watermark.c. Ville,
> do you have a patch for that?

Nothing usable atm. The unconverted dependecies at the time
were rather extensive so it became a bit of a mess. I might
have decent conversions for some of the dependencies though.
I'll have a look around and post them if I see anything sane.

-- 
Ville Syrjälä
Intel
