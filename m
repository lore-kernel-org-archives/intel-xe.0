Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4FEC74A44
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 13:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F37710E2B0;
	Fri, 10 Mar 2023 13:47:50 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1D910E2B0
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 13:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678456068; x=1709992068;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qK3OHAcsqomLz+JzkOF4LN1L2UFGxrPaioiS84zCqcQ=;
 b=FueVa7tnXIKUCwK7u+Js2Q8ApMg9AGyWOYKMvSIfHrZ+D+VM6KoJc4UZ
 +NUBNE4Qs1XlRPdhPURiwJs5Ekx5ViLR3R5o2RotN0KCNHcL3bJuozgqP
 qefL/2y/yDLrkPTTekWzsmGWT79kHCaodyFPZYvv062KAK3YITynDdpb3
 TUOW6vTGw6dl1/OAU3+v5JK/uYB4IT/Whm+XVDkkVFOjLHHZQBf7ppNFp
 xZ7/rB4mySFq2ER11h60XjK9M/8fMspQwcQxei4OkIsSRnbTAh2CnSxdT
 7IWSJSXlmgDE2ajYXU2WTck0jCQkI7iWi1rtu+pYk38O37v9X7GIezkUi A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="401588444"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="401588444"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 05:47:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="671088352"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="671088352"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga007.jf.intel.com with SMTP; 10 Mar 2023 05:47:43 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 10 Mar 2023 15:47:42 +0200
Date: Fri, 10 Mar 2023 15:47:42 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZAs0/r9z1toD47JF@intel.com>
References: <20230309191923.670451-1-jani.nikula@intel.com>
 <eec81b09-8add-a080-710b-8226bba6c470@linux.intel.com>
 <87ttys9ar5.fsf@intel.com> <ZAstS5b+9ea3y0RY@intel.com>
 <87edpw91a2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87edpw91a2.fsf@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-xe] [RFC] drm/i915: add kconfig option to enable/disable
 legacy platform support
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Mar 10, 2023 at 03:36:05PM +0200, Jani Nikula wrote:
> On Fri, 10 Mar 2023, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Fri, Mar 10, 2023 at 12:11:26PM +0200, Jani Nikula wrote:
> >> On Fri, 10 Mar 2023, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> >> > On 09/03/2023 19:19, Jani Nikula wrote:
> >> >> Add config option DRM_I915_LEGACY to enable/disable legacy platform
> >> >> support. This is primarily for the benefit of the drm/xe driver, and
> >> >> legacy is defined in terms of the platforms drm/xe does not support,
> >> >> i.e. anything before Tigerlake.
> >> >> 
> >> >> While the kconfig option will be CONFIG_DRM_I915_LEGACY, the intention
> >> >> is that it's not used in code. Instead, we'll pass -DI915_LEGACY=1 in
> >> >> the i915 Makefile for CONFIG_DRM_I915_LEGACY=y, while the xe Makefile
> >> >> does no such thing, regardless of the kconfig value.
> >> >> 
> >> >> Initially, the knob does the bare minimum: drops the legacy platforms
> >> >> from module PCI ID table (and the compiler in turn automagically drops
> >> >> all the unreferenced device infos).
> >> >> 
> >> >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> >> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> >> >> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> >> >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> >> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >> >> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> >> 
> >> >> ---
> >> >> 
> >> >> *** NOTE ***
> >> >> 
> >> >> For now, I'm only sending this to the intel-xe mailing list with a bunch
> >> >> of Cc's for first impressions.
> >> >> 
> >> >> The xe driver reuses i915 display code, but there's a lot of unnecessary
> >> >> and/or incompatible code for platforms xe does not support. Currently
> >> >> this is handled with a bunch of #ifdef I915 added to i915 in the xe
> >> >> branch that isn't really upstreamble, and I'm thinking this patch might
> >> >> be a better option.
> >> >> 
> >> >> This patch alone does what the commit message says, and drops the legacy
> >> >> platform support, although all the code is left in place. Everything
> >> >> beyond this is basically an optimization of what more to drop out of the
> >> >> build. It doesn't really need to be perfect for starters but we could
> >> >> start converting the legacy platform related #ifdefs from I915 to
> >> >> I915_LEGACY, and that could be upstreamable to i915.
> >> >> 
> >> >> Not all of the #ifdef I915 in the xe branch are related to legacy
> >> >> platforms, and they need to be handled differently. But this kconfig
> >> >> knob would hopefully be a future compatible start to clean up one aspect
> >> >> of them.
> >> >> 
> >> >> Thoughts?
> >> >
> >> > Two questions for now:
> >> >
> >> > 1)
> >> > This does not still end up a sprinkling of #ifdefs in i915, just 
> >> > I915_LEGACY instead of I915? I mean I don't immediately follow how this 
> >> > leads to a more upstreamable solution?
> >> 
> >> In general, I find it difficult to accept any solutions upstream that
> >> cater only for out-of-tree code. Xe *alone* is not a good justification
> >> for making changes upstream. Everything that I've done in terms of
> >> refactoring stand on their own merits, but they *also* help Xe.
> >> 
> >> The current #ifdef I915 in the Xe branch are conflated between dropping
> >> some legacy platform support as well as for using different interfaces
> >> for gem, etc. Some of it might be okay when Xe is merged upstream, and
> >> the justification is upstream. But not now.
> >> 
> >> I'm arguing a way to build a trimmed down version of i915 with legacy
> >> platform support dropped is somewhat useful in itself. Something that
> >> I'm hoping we could take in upstream i915 much before Xe is
> >> upstream. And it would also help Xe by letting us remove a lot of
> >> out-of-tree #ifdef I915. Not everything, but a lot.
> >
> > I was worried about exposing this and some crazy distros turning
> > it off thinking those "legacy" platforms aren't actually relevant
> > at all. But I guess the EXPERT dependency should deter that
> > somewhat.
> >
> > What is the plan for building i915+xe at the same time btw? Would
> > we always have to disable the new platforms in i915 or can we build
> > support for the same platform into both drivers? I think having
> > both drivers available without rebuilding could be helpful in
> > debugging. But I don't know how the modprobe et al would deal
> > with that.
> 
> In general, we build the same display source files to two sets of object
> files, in i915 and xe, with different build flags. IOW, in the same
> kernel build, the display files get built twice, once for i915, once for
> xe, provided both are enabled in kconfig. They become two completely
> independent binary .ko.
> 
> As to the legacy, with this patch, i915 Makefile would pass
> -DI915_LEGACY=1 for CONFIG_DRM_I915_LEGACY=y, while the xe Makefile
> would do no such thing.
> 
> As to probing, both have the module device tables for the PCI IDs they
> support, and you need to play with the force_probe parameter in both to
> force/block probing. Maybe modprobe blacklisting could also be used to
> choose the driver for the devices supported by both drivers.

Hmm. I suppose one option might be to remove those platforms from
the PCI ID table in i915, but still allow the driver to probe them.
And it should still require force_probe so that if you have old+new
GPU in the system and i915 loads first it wont't snatch up the
new GPU by default.

-- 
Ville Syrjälä
Intel
