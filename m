Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3700ACAC5A7
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 08:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D655B10E10B;
	Wed, 24 Sep 2025 08:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hd4/1Ya3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B918D10E10B
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 08:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758702544; x=1790238544;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UT/4nc7RyrZ3NW+kJ4FE1Uf/Jt/6FMvLhTLtIPZwdm4=;
 b=Hd4/1Ya3MXTWo73avaxlF+yU27ruELELHaU/jOfw6T0ZcfZUyvDYabhB
 IQazEOE5uhQHY460Lh8ZWlIVm5OcBrfqly4muVHarh1i9KI+kk8tyntb9
 oT6WlNlD6XirkP9GENPtwiLQ7e1IQLHlQbCUMstlkiu/+oWQ7wOWexDHF
 YKfXWBoC7HDecu0B+onkeP51ufT6Hv1kTGa/ivGbZjqa3DLE4SbNPzYXQ
 rxMT/YqQ6+uIL5OmB0Wh5qEsiVjIUMGtIEDICwWaoXPu1KHDEr8zz/YYG
 /doJZxtTDANQCNXByVmkDr4a5JR7hTnRe5f3SVfK5QUYNyxVyhJh7Z0B6 A==;
X-CSE-ConnectionGUID: SdhEFfNbTsK0NDAgq+ingw==
X-CSE-MsgGUID: ptmtsGLRRl233qOrzZeq7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="83597119"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="83597119"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 01:29:03 -0700
X-CSE-ConnectionGUID: HyG3WD36R1agqfgaEIQqoA==
X-CSE-MsgGUID: nPcv512HTXSo/LufIP0FMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="181369383"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 01:29:01 -0700
Date: Wed, 24 Sep 2025 10:28:59 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/xe/configfs: Fix engine class parsing
Message-ID: <aNOry3gcJ4kqkEvk@black.igk.intel.com>
References: <20250922221209.110737-2-lucas.demarchi@intel.com>
 <aNKFkyQvpvy1c3_X@black.igk.intel.com>
 <z5ajmlwhcqfifll7xenysqh22h6ys5xwv3ec6gswl47zeawr2v@ln4s7ssok74g>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <z5ajmlwhcqfifll7xenysqh22h6ys5xwv3ec6gswl47zeawr2v@ln4s7ssok74g>
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

On Tue, Sep 23, 2025 at 10:06:25AM -0500, Lucas De Marchi wrote:
> On Tue, Sep 23, 2025 at 01:33:39PM +0200, Raag Jadav wrote:
> > On Mon, Sep 22, 2025 at 03:12:10PM -0700, Lucas De Marchi wrote:
> > > If mask is NULL, only the engine class should be accepted, so the
> > > pattern string should be completely parsed. This should fix passing e.g.
> > > rcs0 to ctx_restore_post_bb when it's only expecting the engine class.
> > 
> > Should we add to the doc so we don't mix up expectations between different
> > attributes?
> 
> afaics it's already there... it's just the parsing that had a bug for an
> invalid input.
> 
> > 
> > Or do we care about the rest of pattern of mask is NULL? Perhaps it'll
> > allow us to have common expectations between attributes.
> 
> I'm not sure I follow... if mask is NULL, it should only accept the
> engine class. If mask is not null, then it should continue parsing the
> instance (or glob).
> 
> attributes like ctx_restore_post_bb and ctx_restore_mid_bb, use only the
> class, as mentioned in the doc:
> 
>  *      # echo 'rcs cmd 11000001 4F100 DEADBEEF' \                       *

Yes, the "only" part will probably help make it clear, aleast for the folks
who don't have the required "context" :D

Upto you.

Raag
