Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C186C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 11:32:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257BD113873;
	Fri,  8 Mar 2024 11:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jt9TYXyA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBB7113873
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 11:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709897567; x=1741433567;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DE1khRTalsKY+fwgQ4s4KlzWlqswhrPO/Hr68C4z+vc=;
 b=jt9TYXyAjSdFnk7NUVZm5rVYo+Q0/1b+MTZGbuwmNzVKNQbwnnQNl8RM
 YXV7Jh3JFYgaXefSJ6JGm2mbi3pV71X3tQhOam5fzEKRzM5E92czMrhyy
 VvknMqjaH+nh2MOSeXtwdZ5WRkQJ2/q5DoKM/YYSy7Qoq8GP8XjdrG5Ed
 ITnWGnw2NjBTXngY9KBiiSlT816M2W9ZihkJqMZqVwTYHZGcJgCWZrDfY
 IFyL+3Okhc0L8RAqHfJJPqTtz013G+oDF8ndWXKE5WZ+kEG5U08jgULnx
 3cYwCL8kDP3JwjcKZAhtksLQn6PB+Z/c8N/8nLnp7rAE+b5F06+p9H13r A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="8425046"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="8425046"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:32:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="15136583"
Received: from unknown (HELO intel.com) ([10.247.118.107])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:32:43 -0800
Date: Fri, 8 Mar 2024 12:32:36 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe/gt: Remove redundant num_engine check
Message-ID: <Zer3VEMhwktXTg36@ashyti-mobl2.lan>
References: <20240308070308.2651954-1-tejas.upadhyay@intel.com>
 <ca8373be-d0a8-402d-8e4a-09637c1e3217@intel.com>
 <SJ1PR11MB6204115AB85BA65F78AC3C2981272@SJ1PR11MB6204.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6204115AB85BA65F78AC3C2981272@SJ1PR11MB6204.namprd11.prod.outlook.com>
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

> > > In __xe_gt_apply_ccs_mode num_engines will never be 0 as it is already
> > > checked by parent function.
> > 
> > and that's why we are using xe_assert() instead of explicit checks, so you can't
> > say it's redundant
> > 
> > note that the purpose of xe_assert() inside one function is to enforce the SLA
> > for the caller who should be responsible for doing actual runtime checks
> 
> The static analysis tool Coverity is also complaining about checking obvious condition on num_engines to be 0. So decided to remove this.

yesm because it was checked before, as well.

BTW, please do not consider static analysis failures as bugs to
be fixed with the Fixes tag.

Unless they really are bugs, of course. Coverity is also able to
detect memory leaks and buffer overflows that need to be fixed
with massive Fixes tag :-)

Andi

> 
> Thanks,
> Tejas
> > 
> > >
> > > Fixes: 0d97ecce16bd ("drm/xe: Enable Fixed CCS mode setting")
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> > > b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> > > index 529fc286cd06..2bbd7b203cc2 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> > > @@ -22,7 +22,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt,
> > > u32 num_engines)
> > >
> > >  	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
> > >
> > > -	xe_assert(xe, num_engines && num_engines <= num_slices);
> > 
> > btw, instead of dropping num_engines condition completely this should be
> > rather split into two separate xe_asserts():
> > 
> > 	xe_assert(xe, num_engines);
> > 	xe_assert(xe, num_engines <= num_slices);
> > 
> > > +	xe_assert(xe, num_engines <= num_slices);
> > >  	xe_assert(xe, !(num_slices % num_engines));
> > >
> > >  	/*
