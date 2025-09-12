Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E834CAC582
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 05:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD7410E442;
	Fri, 12 Sep 2025 05:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nCx5s86U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E529B10E442
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 05:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757656730; x=1789192730;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SBQxuOdwAnJi7fEgbpEZIbTNMvt65A7rfrkcN0+KQt4=;
 b=nCx5s86UJHTLstM8kKO7Ig5WS5DjI3xfg2n1oQeYh+ftRjeUtkutjmrh
 OzwzlDBwKcK7j7IWQAwB8vGSwZMKta0Jp2tQTtySlHEnw9UlVc+qtKmvQ
 uNbLl/Uqk1tUexlNUJhKaBd3U+HXttvVcQ8JfZGp/Dj06oFvxeK9g9fRZ
 mdwLfntWJHuSXhUCRDqOOlR9+p0EGeCCKXTc00nSDO+EGLvowq8ykr94r
 Sw+tvgKRacq2Z2aqzvvZ7xT0+epZAUn0IxcW5JRsCaCxX+sKglhp5R8cL
 65q4AZUt51J9w8clk7cJp/+IbeWjJ0RDy9iGA1u6jZFVc7kiy1748jurq Q==;
X-CSE-ConnectionGUID: GYAV0gFcQEO6tWi32iQpQg==
X-CSE-MsgGUID: +uf3unQvTnC+aiG62iaxDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59921842"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59921842"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 22:58:50 -0700
X-CSE-ConnectionGUID: YYK/QO7fTs6eBcJCZ3dTdw==
X-CSE-MsgGUID: b3r9jxjRQGq8oqSC5tw0Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="173713407"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 22:58:47 -0700
Date: Fri, 12 Sep 2025 07:58:44 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v4 4/6] drm/xe/configfs: Allow to select by class only
Message-ID: <aMO2lGS2ldLZ6945@black.igk.intel.com>
References: <20250911-wa-bb-cmds-v4-0-c8f7e48f7eae@intel.com>
 <20250911-wa-bb-cmds-v4-4-c8f7e48f7eae@intel.com>
 <aMOtLe6FIwy0X_JQ@black.igk.intel.com>
 <dc5frrvi2wi6fbfd3mggumu3ohlbjohbifrxil4fzsy7pqxa75@zaofnmz5tea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc5frrvi2wi6fbfd3mggumu3ohlbjohbifrxil4fzsy7pqxa75@zaofnmz5tea5>
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

On Fri, Sep 12, 2025 at 12:30:03AM -0500, Lucas De Marchi wrote:
> On Fri, Sep 12, 2025 at 07:18:37AM +0200, Raag Jadav wrote:
> > On Thu, Sep 11, 2025 at 12:36:28PM -0700, Lucas De Marchi wrote:
> > > For a future configfs attribute, it's desirable to select by engine mask
> > > only as the instance doesn't make sense.
> > > 
> > > Rename the function lookup_engine_mask() to lookup_engine_info() and
> > > make it return the entry. This allows parse_engine() to still return an
> > > item if the caller wants to allow parsing a class-only string like
> > > "rcs", "bcs", "ccs", etc.
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Reviewed-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > > v2:
> > > - Rename function to lookup_engine_info() and return the entry
> > >   directly instead of the index (Raag Jadav)
> > > - Add named initializer for new entry for consistency (Raag Jadav)
> > > ---
> > >  drivers/gpu/drm/xe/xe_configfs.c | 50 ++++++++++++++++++++++++++++------------
> > >  1 file changed, 35 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> > > index 8db7a2af11011..45fdb6cf26b5d 100644
> > > --- a/drivers/gpu/drm/xe/xe_configfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_configfs.c
> > > @@ -152,6 +152,7 @@ static void set_device_defaults(struct xe_config_device *config)
> > >  struct engine_info {
> > >  	const char *cls;
> > >  	u64 mask;
> > > +	enum xe_engine_class engine_class;
> > >  };
> > > 
> > >  /* Some helpful macros to aid on the sizing of buffer allocation when parsing */
> > > @@ -159,12 +160,12 @@ struct engine_info {
> > >  #define MAX_ENGINE_INSTANCE_CHARS 2
> > > 
> > >  static const struct engine_info engine_info[] = {
> > > -	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
> > > -	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK },
> > > -	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK },
> > > -	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK },
> > > -	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK },
> > > -	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK },
> > > +	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK, .engine_class = XE_ENGINE_CLASS_RENDER },
> > > +	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK, .engine_class = XE_ENGINE_CLASS_COPY },
> > > +	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_DECODE },
> > > +	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_ENHANCE },
> > 
> > Hmm, so now checkpatch doesn't feel so good about this.
> > I usually try to shorten the variable/macro names instead of wrapping,
> > but I guess a few more lines in an already huge driver wouldn't be much
> > noticeable ;)
> 
> it's a table and wrapping the line doesn't really improve readability.
> In this case we should taked checkpatch output with a grain of salt

Ofcourse. I had the same understanding, but I've always managed to find
myself coming across random DRM rules :D

Raag
