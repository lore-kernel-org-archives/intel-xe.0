Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C934BE7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 04:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E91910E3CB;
	Wed, 11 Dec 2024 04:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CB6iBTBk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E8310E5EE
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 04:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733893106; x=1765429106;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Qk2HRGABCFd1cEGDDEZYrezqFx4dRraDdCsq56YxafA=;
 b=CB6iBTBkFmnsWYIpvqa/cbfAttTLJf/FKGL0pqtud1E3ZahD/BOI8oVy
 l/z8XwkA4wl/SgHaD74O065XeVjRWzPbH89UyJplwxuskHaowniiMCDDB
 30EzPirh9RRgy23vbdrtLaLkIIWsjhMlAYOMBOtsVstOGr9yPguFS96Ga
 QKyYiMEizbuHAh1B5LDpCUwfS3WnMvh2xlPfWv8ca590y0QhWSpFM5hrg
 6JOOX92t+4EXuQjghyxtRO8h8h7w9NZCKG3y6bIuyo+jRL0bCJko4BYpe
 v36lzZ4DE1+/UKkDcvsC3thl3dfJawQBU+AMKYj87FcjKoXLP9w/WNQIk Q==;
X-CSE-ConnectionGUID: Q2T6rbBuSnS2nX3OIleCCw==
X-CSE-MsgGUID: FpooL/lNSX6/oe1O/TnG9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38043176"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="38043176"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 20:58:26 -0800
X-CSE-ConnectionGUID: IjTGrq+STTe4Ap6J0GiAow==
X-CSE-MsgGUID: vEpLQU/5Qr+P1hp20/e7gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96121774"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 20:58:24 -0800
Date: Wed, 11 Dec 2024 06:58:21 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 intel-xe@lists.freedesktop.org, niranjana.vishwanathapura@intel.com
Subject: Re: [PATCH v2 1/2] drm/xe: introduce xe_gt_reset and xe_gt_reset_wait
Message-ID: <Z1kb7U8wySkkXk95@black.fi.intel.com>
References: <20241210143748.1417098-1-maciej.patelczyk@intel.com>
 <20241210143748.1417098-2-maciej.patelczyk@intel.com>
 <tqxh2dlo2mzhxujoelfr2b2chnb4lrvt3wvlq4uig2frpvn5fc@u2qn3c5jqi3q>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tqxh2dlo2mzhxujoelfr2b2chnb4lrvt3wvlq4uig2frpvn5fc@u2qn3c5jqi3q>
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

On Tue, Dec 10, 2024 at 07:56:20AM -0800, Lucas De Marchi wrote:
> On Tue, Dec 10, 2024 at 03:37:47PM +0100, Maciej Patelczyk wrote:
> > Adding synchronous version gt reset as there are few places where it
> > is expected.
> > Adding also a wait helper to wait until gt reset is done.

...

> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index 3e8c351a0eab..79f61532fd00 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -135,7 +135,7 @@ static int force_reset_sync(struct xe_gt *gt, struct drm_printer *p)
> > 	xe_gt_reset_async(gt);
> > 	xe_pm_runtime_put(gt_to_xe(gt));
> > 
> > -	flush_work(&gt->reset.worker);
> > +	xe_gt_reset_wait(gt);
> 
> this can become a xe_gt_reset() since the only thing we are doing
> between the calls is to release the runtime pm.... doesn't really
> matter for this debugfs call.

I see the worker taking a pm ref as well, can this be a problem?

Raag
