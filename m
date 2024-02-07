Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA57C48297
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 00:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF307112FA9;
	Wed,  7 Feb 2024 00:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gxKfsXzT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4679112FA9;
 Wed,  7 Feb 2024 00:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707264770; x=1738800770;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ckwoxrlrsarZRVSiEcjzvUtDC5D2v86UBKy/1PvOxWQ=;
 b=gxKfsXzTmziU8eWLBmy2FscokxYRuPFVhfXjg32yVC27HCDj+JwgY4rH
 kxjtImEVsRcvF+9Mka5Wmlu/TteHZRSuGD2T8E9rsQqC7IvmEhEaKsb7W
 cTjKU0DilAmW6hp/6WDQBvxyvfpDgpUBWqQhaZCjtaoHyUsmo4zGPIi4T
 GMWSODAXaIzvWINsU/tXPfVGS2IAKp/SyTKJzUAYEALWn02fapOiTZqMD
 UZUkIR13b3TbzON4Z6u3GZsFy48sXSy+qZ94D3KPpCFCBOHgU1BhvH7Ef
 s2KQleAk7fHWxVktRNx/R4MbYSBXk5C+lYabDpi6BF+z1I8Fjon1dR2tr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="1033040"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1033040"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 16:12:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="824332191"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="824332191"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 06 Feb 2024 16:12:45 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 07 Feb 2024 02:12:44 +0200
Date: Wed, 7 Feb 2024 02:12:44 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, intel-xe@lists.freedesktop.org,
 Paz Zcharya <pazz@chromium.org>
Subject: Re: Re: [PATCH v4 00/16] drm/i915: (stolen) memory region related
 fixes
Message-ID: <ZcLK_HuISIPvd7YM@intel.com>
References: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
 <87cytbdttm.fsf@intel.com>
 <w2l7xe3sik5wjtjs6i3iwsvqmy36bambkigralbjhn3x6lornu@mglr2dfaw6ed>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <w2l7xe3sik5wjtjs6i3iwsvqmy36bambkigralbjhn3x6lornu@mglr2dfaw6ed>
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

On Mon, Feb 05, 2024 at 08:16:35AM -0600, Lucas De Marchi wrote:
> On Mon, Feb 05, 2024 at 01:38:45PM +0200, Jani Nikula wrote:
> >On Sat, 03 Feb 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> >>   drm/i915: Simplify intel_initial_plane_config() calling convention
> >>   drm/i915: Tweak BIOS fb reuse check
> >>   drm/i915: Try to relocate the BIOS fb to the start of ggtt
> >
> >>  drivers/gpu/drm/xe/display/xe_plane_initial.c |  67 +++--
> >
> >Lucas, Thomas, Oded -
> >
> >These three touch xe/display. Ack for merging via drm-intel-next?
> 
> as long as it passed CI,
> 
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Smashed the whole thing into drm-intel-next.
Thanks for the reviews/etc.

> 
> Lucas De Marchi
> 
> >
> >BR,
> >Jani.
> >
> >
> >-- 
> >Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
