Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A046F44840
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 11:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB8F10E937;
	Fri, 10 Apr 2026 11:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EV7JQott";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFC910E937;
 Fri, 10 Apr 2026 11:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775820305; x=1807356305;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SXpQtKRDCvI6RQ8XlfZOVdH6LkIxYbb0WqenhPheF3Q=;
 b=EV7JQottUe2toTXtLDSwJwATObDzKZ8RjsVMWCS5+AOuWQKaPb9pNarM
 O5/DkoeA601u/IJQshr2b4r0XDgNNsGiseVbJ/aUx5fVD4jgIpyhRY3Fe
 ppsbnzoNDXWTS6SXJDH8YXBt90oUhi/davhy2TDpumNMEKHTTRl2IoKU/
 SoeQFBwtrXNi7oLMZ5sAhYED8UDfuY3Xrp1oItMA01641SqgZ9JHYX2m0
 4SY0IGdBVuwkHRPpRvrcu4drrSypaMmJ2lZ0sGzouQzlwjBTXi6J/uGgq
 9KnJGEog0q6sZa78vnpJa5Lg7i2YhJM+a8paRU0dWBwUdoGkIiQXMVMtS g==;
X-CSE-ConnectionGUID: KoZrhxHbT7++riPkDGQCkQ==
X-CSE-MsgGUID: /of4LMm6Q+CtQ7aQvHrZpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87466186"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="87466186"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 04:25:04 -0700
X-CSE-ConnectionGUID: vV7BW0tRTKyUYDNoWCkWdg==
X-CSE-MsgGUID: SrrEHC/HR7+2bKAn8HVcgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="259528317"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.89])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 04:25:03 -0700
Date: Fri, 10 Apr 2026 14:25:00 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 00/12] drm/i915/fb: Prep work for more generic remapping
 support
Message-ID: <adjeDC2pOqVB4J6j@intel.com>
References: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Tue, Apr 07, 2026 at 06:50:41PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> I had a quick look at implementing tile64/Ys support.
> https://github.com/vsyrjala/linux.git remap_tile_ys_64
> is the result.
> 
> I think I want the whole generic remap thing from there
> even if we don't end up adding the actual tile64/Ys support.
> So here is an extract of some prep work from that branch,
> though I didn't include the generic remap thing itself yet.
> 
> Ville Syrjälä (12):
>   drm/i915/fb: Nuke intel_tile_row_size()
>   drm/i915/fb: Make intel_fb_needs_pot_stride_remap() static
>   drm/i915/fb: Reject per-plane remapping with DPT
>   drm/i915/vma: Add helpers to check GTT view type
>   drm/i915/fb: Use i915_gtt_view_is_*()
>   drm/i915/fb: Use intel_fb_needs_pot_stride_remap() in
>     intel_fb_view_init()

I merged all those to get intel_fb.c into shape. 

>   drm/xe/fb: Use the correct gtt view for remapped FBs
>   drm/xe/fb: Remove weird VMA end alignemnt
>   drm/xe/fb: Extract xe_dpt_size()
>   drm/xe/fb: Use i915_gtt_view_is_*()

Left out the xe specific stuff for now to see if Maarten/others
have any comments.

>   drm/i915/selftests: Eliminate duplicate vma size check
>   drm/i915/selftests:  Use i915_gtt_view_is_*()

And I need to take another look at the selftests.

Thanks for the reviews.

> 
>  drivers/gpu/drm/i915/display/intel_fb.c    | 42 ++++++++++-----------
>  drivers/gpu/drm/i915/display/intel_fb.h    |  2 -
>  drivers/gpu/drm/i915/i915_gtt_view_types.h | 15 ++++++++
>  drivers/gpu/drm/i915/selftests/i915_vma.c  | 33 ++++++-----------
>  drivers/gpu/drm/xe/display/xe_fb_pin.c     | 43 ++++++++++++----------
>  5 files changed, 72 insertions(+), 63 deletions(-)
> 
> -- 
> 2.52.0

-- 
Ville Syrjälä
Intel
