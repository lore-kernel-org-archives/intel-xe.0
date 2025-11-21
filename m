Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E229CFA74D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 08:33:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5B310E2BA;
	Fri, 21 Nov 2025 08:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+pBPalP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A7110E2BA
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 08:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763714023; x=1795250023;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IMZ8iBi5wfbqplWcrIkAXC7uYYHHxzOTUg7RvhHp8go=;
 b=P+pBPalPqn8VevI/PbISM8Gou/8LVbtg9WgxnMCR7uePpsCm/lvQc063
 jRgnBJYhqx5z5Weyx1vNqO96z6wx66PHSYjuQ6Druzhfv9XrvQqppEECo
 /kajWTnV/wW32nGcW0VF3GKVnxw3ziF9JiY6NXOMiWnP4ERxRL3KN3WR7
 l6OYSECHnrOJubRtn6X1hLc5Rc8uP2RV462b6Qgdv7N5p5XW4vqFxXLo4
 kV5lpy1AeFUecp4mMrV4nc8bNAyKZb+mkiEO7VHB30fqU82kxATg/oIqx
 Hc8vfMjzAp5vzpIjPQXkqnMFReo/xleCO00bfFCN+vPW7WYuJqU3B9EJJ Q==;
X-CSE-ConnectionGUID: 2ClXbkvCT+KvE4nfY8rETw==
X-CSE-MsgGUID: nAWEFYjHRPKniGlEdi3D6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="91283487"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="91283487"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 00:33:43 -0800
X-CSE-ConnectionGUID: Ii0h9szzQICfvRz6vTd52g==
X-CSE-MsgGUID: 34NdbFVVRcq4B7eFaXdhxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="191748713"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 00:33:40 -0800
Date: Fri, 21 Nov 2025 09:33:37 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, jani.nikula@intel.com,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com, ville.syrjala@linux.intel.com,
 karthik.poosa@intel.com, anshuman.gupta@intel.com
Subject: Re: [PATCH v1 1/4] drm/xe/pcode: Introduce xe_pcode_read_probe()
Message-ID: <aSAj4aAKMH_isOvJ@black.igk.intel.com>
References: <20251118090012.608250-1-raag.jadav@intel.com>
 <20251118090012.608250-2-raag.jadav@intel.com>
 <aRx3u9LuWvhGvMZj@intel.com> <aRyTBkBgFK3OO_wT@black.igk.intel.com>
 <wcfsfjjncwfb5mwjkdixeqvmjvtfnr6vzx7bpwwu6jrbhoal24@orkpmm6x6nbh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wcfsfjjncwfb5mwjkdixeqvmjvtfnr6vzx7bpwwu6jrbhoal24@orkpmm6x6nbh>
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

On Thu, Nov 20, 2025 at 09:02:29AM -0600, Lucas De Marchi wrote:
> On Tue, Nov 18, 2025 at 04:38:46PM +0100, Raag Jadav wrote:
> > > > +int xe_pcode_read_probe(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1);
> > > 
> > > Is "probe" the right condition? I mean, the right name for the exported function?
> > > 
> > > The caller is deciding to downgrade the Illegal command from error to debug, but
> > > is it because it is in the probe? Or because we know that most of FW out there
> > > might not have this command yet and driver knows that and will handle the
> > > lack of backward compatibility properly... in a way that this is not an error.
> > > 
> > > But is this 'probe' ?!
> > 
> > This is following Ville's original comment[1] as in 'probing' for something
> > that may or may not exist.
> > 
> > [1] https://lore.kernel.org/intel-xe/aQ3xItyGMVnKdzoi@intel.com/
> > 
> > > I'm bad with naming as well, so asking help from AI:
> > > 
> > > Alternative naming ideas:
> > > xe_pcode_read_optional
> > > (Indicates the command is optional and failure is acceptable.)
> > > xe_pcode_read_safe
> > > (Suggests a safe read that won't break if unsupported.)
> > > xe_pcode_read_tolerant
> > > (Highlights tolerance for missing command.)
> > > xe_pcode_try_read
> > > (Common pattern for non-fatal attempts.)
> > > xe_pcode_read_if_supported
> > > (Explicit about conditional support.)
> > 
> > I don't even begin to qualify here so it's upto you all.
> 
> xe_pcode_read_if_supported() would be ok IMO, documenting it to mask
> not-supported errors.
> 
> But the the way this is implemented with the extra flag seems weird.
> By "having the caller check" I think it's about handling
> the return code from this function and treating it as a fatal or normal
> case depending on the command being sent, if there's a fallback etc.
> This patch seems to add a function and not used it, but I may be missing
> something.

Forgot to doc. I had an impression that -ENXIO could be used for the
fallback since we already have it here but ...

> I'd rather have this:
> 
> 1) Caller should handle errors and treat it as fatal or normal,
>    depending on having a fallback or not. Emit an err there if
>    appropriate rather than here. It seems we are already emitting
>    additional dbgs in the caller for when pcode_read fails
> 
> 2) What is the command/subcommand triggering this error? We could have a
>    helper like xe_pcode_strerr() that users could call if needed (but
>    then we'd need to return the undecoded error), or we could change
>    this specific return code to -ENOTSUPP.

... converting to -ENOTSUPP makes much more sense, considering the undecoded
return will be inconsistent with other pcode helpers.

>    Is the error we are seeing the latebind from drivers/gpu/drm/xe/xe_late_bind_fw.c?

The errors are from all over but the one currently on fire is the hwmon.

Raag
