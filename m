Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA729CF11D5
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 12:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8FF10E094;
	Thu, 10 Oct 2024 12:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BtGp+E6d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A706C10E094;
 Thu, 10 Oct 2024 12:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728561646; x=1760097646;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mKEwbDt8IfZPGU3Eku+D8qTKhl4XGbxLYMf3ihzP7QI=;
 b=BtGp+E6dm/Hd3V8QTWY+QGX2Bvo26zqGFNe8dw8itpOxYJJ2qfaLSotd
 mffW02UarKz/INYZc/fg2C0XGSwWPuP31L283fHqTor0IKDE0OQJA2flc
 fAI6v3WLG+RPPR4RfTXXuevrp1jqoXG5FCipe0Ro5jDRYD3vzqTVsUvW0
 dTBveGQRYqG53Mba6bYvtbt7Afgwti1le9kftT+jAkKc2jWKWGeTvOEGA
 3GZf/iYiOTBXgz1L0C6DF5hzuCqtiEqDnaPOpgtKygj3tOjjAMoSx5Q+w
 zjBDRKivrU8OYJBxTos/Gh05FB4patO4tY/bd7OT8qni/Xff3GT6Q8An0 g==;
X-CSE-ConnectionGUID: 3eE8z46CSHKpq5psZYMv3A==
X-CSE-MsgGUID: X1hUIw3ARYew6kmtORI+yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28044832"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="28044832"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 05:00:45 -0700
X-CSE-ConnectionGUID: kAPcNnf2QKGIjXglvj7ypg==
X-CSE-MsgGUID: GBUM9DkUTGG9MYvCjl8x2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="76663060"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 10 Oct 2024 05:00:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Oct 2024 15:00:42 +0300
Date: Thu, 10 Oct 2024 15:00:42 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/i915/irq: s/gen3/gen2/
Message-ID: <ZwfB6l8nQelIYx2c@intel.com>
References: <20241008214349.23331-1-ville.syrjala@linux.intel.com>
 <20241008214349.23331-4-ville.syrjala@linux.intel.com>
 <87o73ta86y.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o73ta86y.fsf@intel.com>
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

On Wed, Oct 09, 2024 at 01:20:53PM +0300, Jani Nikula wrote:
> On Wed, 09 Oct 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Now that we use the gen3 codepaths also for gen2
> > rename everything to gen2_ to match.
> 
> This was fine for the gt stuff where there are gen5 and gen6 functions,
> but should we just call these something more generic since there are no
> platform specific functions?
> 
> The naming is a bit funky already.
> 
> intel_irq_init() is *not* the higher level function for init. It's
> actually intel_irq_install() -> intel_irq_postinstall() that calls
> gen3_irq_init() and some other stuff.

intel_irq_init() seems like it should be ripped apart and distributed to
more appropriate places. The guc stuff at least. And most of the l3
parity stuff also lives in some gt code, so the rest should probably
move as well (Either that or we rip out the wole thing. I suspect no
is actually using that anywhere).

But no idea what to do about the gen2_ stuff.

-- 
Ville Syrjälä
Intel
