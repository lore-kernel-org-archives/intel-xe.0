Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6381CAC583
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 17:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9468310E32D;
	Tue,  9 Sep 2025 17:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OjfG0/r1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F21910E32D
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 17:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757438559; x=1788974559;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VeOH/OvlmANtLMWx+9au9X5RMSZup6maD/i/RdWDiU8=;
 b=OjfG0/r1y8g4QP3X8rvvQG1cb3LdE5qpm2K79K6CyJ5n8ItZr3cdNcup
 j7qsd543+737JFLNG4lTUA5N+ujlwPkE279Z4RUXnIqtY1u0kR8Cn7bqu
 Elf7HGbrQ2JOsbulWPGeZZBrkVRKrbvflqglt18at3vII1WPfDhkXCkr2
 gUiIdxVckp4EJUlnsO6NNFiZB702mlvswGyAA87gHEC5Bu8TWgFHxsfYq
 W6ZIS6vKLbDpo70iMg+gciQLqL3poHPNykaKfc9k12C/gC+eeTy0jDGrQ
 BTzE24E1gxNgz7s2J+yZjiMpq+2W10x9B9lvo9sCnaL21TAiUqbAPgygk Q==;
X-CSE-ConnectionGUID: rqBEa/BtTdWwLaheRmrJhA==
X-CSE-MsgGUID: yNrOK67VQ7SmRwPReoUcRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59684006"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59684006"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 10:22:39 -0700
X-CSE-ConnectionGUID: /4Q/kzcBTu2FXpiXrnUMNA==
X-CSE-MsgGUID: AyizQtSTT46TtgYH4aS+kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172312820"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 10:22:37 -0700
Date: Tue, 9 Sep 2025 19:22:33 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v3 4/6] drm/xe/configfs: Allow to select by class only
Message-ID: <aMBiWZ4w9bYIo_0M@black.igk.intel.com>
References: <20250905-wa-bb-cmds-v3-0-3da2b7bdc73e@intel.com>
 <20250905-wa-bb-cmds-v3-4-3da2b7bdc73e@intel.com>
 <aMAA9V14iZqHK8fz@black.igk.intel.com>
 <x3prpxb3zxfvuzt7txomppfv2dpc5pvwliyultq2kgh77tda34@zrhvrxe7od4x>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <x3prpxb3zxfvuzt7txomppfv2dpc5pvwliyultq2kgh77tda34@zrhvrxe7od4x>
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

On Tue, Sep 09, 2025 at 07:42:14AM -0500, Lucas De Marchi wrote:
> On Tue, Sep 09, 2025 at 12:27:01PM +0200, Raag Jadav wrote:
> > On Fri, Sep 05, 2025 at 10:50:32PM -0700, Lucas De Marchi wrote:
> > > For a future configfs attribute, it's desirable to select by engine mask
> > > only as the instance doesn't make sense.
> > > 
> > > Rename the function lookup_engine_mask() to lookup_engine_info() and
> > > make it return the entry. This allows parse_engine() to still return an
> > > item if the caller wants to allow parsing a class-only string like
> > > "rcs", "bcs", "ccs", etc.
> > 
> > ...
> > 
> > > -static bool lookup_engine_mask(const char *pattern, u64 *mask)
> > > +/*
> > > + * Lookup engine_info. If @mask is not NULL, reduce the mask according to the
> > > + * instance in @pattern.
> > > + *
> > > + * Examples of inputs:
> > > + * - lookup_engine_info("rcs0", &mask): return "rcs" entry from @engine_info and
> > > + *   mask == BIT_ULL(XE_HW_ENGINE_RCS0)
> > > + * - lookup_engine_info("rcs*", &mask): return "rcs" entry from @engine_info and
> > > + *   mask == XE_HW_ENGINE_RCS_MASK
> > > + * - lookup_engine_info("rcs", NULL): return "rcs" entry from @engine_info
> > > + */
> > > +static const struct engine_info *lookup_engine_info(const char *pattern, u64 *mask)
> > 
> > Now that we're returning engine_info, I'm wondering if we have any use for
> > mask parameter?
> 
> We do, because otherwise we'd have to parse the rest of the pattern in
> the caller: rcs0 vs rcs* vs rcs.

Fair.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
