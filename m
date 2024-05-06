Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D766C10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 13:59:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8B110EDDD;
	Mon,  6 May 2024 13:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bneJn8YL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705B210EDDD
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 13:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715003987; x=1746539987;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uNwMW4qam/ow18nu0nKyIKnT++VLC4GPqifJQLa+95A=;
 b=bneJn8YL+mY3QFBWiuGFqPEbmXnqkIOOHANvSimbnT4ij6q94lqTfJIt
 TG7rjClKk+bw2VxRmTwbp4HrAqUUQ1HFE0QVNcv7VjW305M3b6VXn7PEq
 pHG8emvstL8vOaomDUhQLRvr0SouVI0oVN5KVWZrzCpA7rL2wf9W/SN3N
 cgFrU3hk/R0vdRrAvpWXy0GQeZFuAeNOW3V8T4HLNjS/kO+ophKWWKuyU
 GEocRa+eFJaaNT8Fbmr670EI1iWYKASW5Iid/TmTI4aYEIQoK/qYV46jB
 Fc/7+lBAqFsMLud+thqonr8xkpcq2/sqMR7DpRL85UHYwPKenSy/Cejxk A==;
X-CSE-ConnectionGUID: 7zg5iPMNSH2n2wekouXC6w==
X-CSE-MsgGUID: AFKdC8QuRBKqkff8xrgjGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21361067"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="21361067"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:59:47 -0700
X-CSE-ConnectionGUID: /Cvw53RlQLaQolxcADl81A==
X-CSE-MsgGUID: 7cGEktprSbO1jloDEOELEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="32846539"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:59:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s3ysZ-00000004iNO-1rMH; Mon, 06 May 2024 16:59:43 +0300
Date: Mon, 6 May 2024 16:59:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 1/3] drm/xe: Add helpers for manipulating macro
 arguments
Message-ID: <ZjjiTzNlecRNLjLu@smile.fi.intel.com>
References: <20240502223313.2527-1-michal.wajdeczko@intel.com>
 <20240502223313.2527-2-michal.wajdeczko@intel.com>
 <ZjUJyy7Ziy8cWdx0@smile.fi.intel.com>
 <265a5c7a-0a22-4276-9535-2d6026cdfef7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <265a5c7a-0a22-4276-9535-2d6026cdfef7@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, May 06, 2024 at 03:17:32PM +0200, Michal Wajdeczko wrote:
> On 03.05.2024 17:59, Andy Shevchenko wrote:
> > On Fri, May 03, 2024 at 12:33:11AM +0200, Michal Wajdeczko wrote:

...

> >> +#define DROP_FIRST(args...)		__DROP_FIRST(args)
> >> +#define __DROP_FIRST(a, b...)		b
> > 
> >> +#define PICK_FIRST(args...)		__PICK_FIRST(args)
> >> +#define __PICK_FIRST(a, b...)		a
> > 
> >> +#define PICK_LAST(args...)		__PICK_ARG(COUNT_ARGS(args), args)
> > 
> > All but these have ARG(S) in the name, I would add it.
> 
> but then final names will be IMO little too long
> 
> 	DROP_FIRST_ARG
> 	PICK_FIRST_ARG
> 	PICK_LAST_ARG
> 
> maybe
> 	FIRST_ARG and LAST_ARG
> 
> would work still have no idea for the replacement for DROP_FIRST
> (and likely DROP/PICK FIRST will be more frequently used than LAST)

Works for me.

> besides, CONCATENATE also doesn't have ARGS in it's name

Yes, but it's not a good argument (pun is accidental).

> >> +#define __PICK_ARG(n, args...)		CALL_ARGS(CONCATENATE(PICK_ARG, n), args)
> > 
> > Interesting, why FIRST and LAST are not symmetrical. Maybe the first
> > counterpart can use the __PICK_ARG()?
> 
> the PICK_FIRST could be defined without introducing PICK_LAST combo
> 
> and PICK_LAST was initially considered less important (but still serves
> as a part of the complete solution) and it is implemented based on
> simpler (and more likely accepted) PICK_FIRST and DROP_FIRST macros
> 
> since series is now already merged to Xe,

How comes? I have not being notified. I assume we are still in the settling
down phase.

> I guess we can return to this
> discussion when we will be promoting these macros to linux/args.h

I would fix the namings right away, it will really help to avoid possible
and unneeded collisions.

-- 
With Best Regards,
Andy Shevchenko


