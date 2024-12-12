Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C119CE7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 18:54:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C0810E048;
	Thu, 12 Dec 2024 18:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/cAyWh8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303CE10E048;
 Thu, 12 Dec 2024 18:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734029695; x=1765565695;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e2eiWy/uL12mLEhSleUlGcJ86ygMZ5e2gBgF/ZJKtBg=;
 b=M/cAyWh8DRXV13bQk57BBGV5x84eDRyXPL5Ym48wTw/60PCwEAjBd4Gd
 TtYacWqtow/k2X/DdsyketMAa4QyHirCJCWc7E2DF9ugcjfV3EFlnhuKR
 2E9aU87DEz/rBtgs5tjR4HvZ+VFS/OHP4UL1mHlm/CSg5qsFo8+7OcVfa
 qrXUYKTFcgovwdUZ2pu/UUMP/HfLpxObnDBEbljzArpL5IMeZGFZ6R2pt
 3JJHLk6BELffxJYRBoRgS7N/b37q2NEzanVxmf30AAzIsI6Sacj5wxDME
 zWlqYinUF1yRPrvCCMrISVxJWX/L83rLx/Bn3gtIGYTeI11wiZJ8WHojU A==;
X-CSE-ConnectionGUID: 6977Kh8HTOa6n+ksjatlIw==
X-CSE-MsgGUID: VIaDqijdTq2G6TjZ8RJEdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="33793526"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="33793526"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 10:54:54 -0800
X-CSE-ConnectionGUID: Y8gIF2ExSAWK1qkM3dkguA==
X-CSE-MsgGUID: /yKW02yWTWams1V+RdcmNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="101171738"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 10:54:52 -0800
Date: Thu, 12 Dec 2024 19:54:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Harrison, John C" <john.c.harrison@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Maslak, Jan" <jan.maslak@intel.com>
Subject: Re: [i-g-t] lib/xe: set hwconfig NULL for unsupported platforms
Message-ID: <20241212185435.fhs5jkrkcx2kpavm@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Harrison, John C" <john.c.harrison@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Maslak, Jan" <jan.maslak@intel.com>
References: <20241209085709.1979242-1-tejas.upadhyay@intel.com>
 <60c6f1d7-6bee-40fa-9f7b-8f138b3a3501@intel.com>
 <20241209203822.GR3224633@mdroper-desk1.amr.corp.intel.com>
 <DS7PR11MB6197C4D88FE377DC248FA3B3813E2@DS7PR11MB6197.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DS7PR11MB6197C4D88FE377DC248FA3B3813E2@DS7PR11MB6197.namprd11.prod.outlook.com>
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

Hi Upadhyay,,
On 2024-12-11 at 09:13:50 +0000, Upadhyay, Tejas wrote:
> Going ahead with merge of this patch. 
> 
> Tejas
> 

Merged,

Regards,
Kamil

> > -----Original Message-----
> > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > Sent: Tuesday, December 10, 2024 2:08 AM
> > To: Harrison, John C <john.c.harrison@intel.com>
> > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; igt-
> > dev@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Maslak, Jan
> > <jan.maslak@intel.com>
> > Subject: Re: [i-g-t] lib/xe: set hwconfig NULL for unsupported platforms
> > 
> > On Mon, Dec 09, 2024 at 11:20:07AM -0800, John Harrison wrote:
> > > On 12/9/2024 00:57, Tejas Upadhyay wrote:
> > > > There are hardware platforms which are not supporting hwconfig
> > > > table, for example ADLS. Querying hwconfig on unsupported platforms
> > > > leads to assert and failure for some of tests like,
> > > > ./build/tests/xe_module_load --r load
> > > The module reload test should not be querying the hwconfig table?!
> > 
> > See the Fixes: line; that patch made it so that anything calling
> > xe_device_get() will fetch and cache the hwconfig (and assert if it's
> > missing).  xe_module load calls __drm_open_driver ->
> > __drm_open_driver_another -> xe_device_get so it does indeed fetch the
> > hwconfig table now and hit the assertion added by that patch.
> > 
> > I don't know if always grabbing and caching the hwconfig was actually a
> > good idea or not.  As we've seen here, the hwconfig may legitimately be
> > NULL, so as we remove the assertion here, we still need to do
> > NULL-checks at the point the hwconfig gets used to truly be safe.
> > 
> > >
> > > But the hwconfig test itself should be failing on platforms which do not
> > > have a table. That is intentional. There is no platform which is POR for the
> > > Xe driver which does not support hwconfig tables. So the test is supposed to
> > > fail if it ever does not get a valid table.
> > 
> > The Xe driver is only officially supported on the Xe2 platforms and
> > beyond, but it can still load and run on some pre-Xe2 platforms that
> > people were using as development platforms; some of those don't support
> > hwconfig.  And even though our CI setup is only trying to test a subset
> > of those platforms that do contain hwconfig, note that our DG2 setups
> > also have an ADL-S igpu that also gets probed during module load, and
> > that's what leads to the CI failures that were reported here.
> > 
> > 
> > Maybe XeKMD is mature enough now (and we have enough real platforms for
> > testing now) that we could prune the list of platforms that Xe is
> > willing to load on with unofficial support.  E.g., drop the unofficial
> > support for TGL, RKL, and ADL-S since those platforms don't have
> > hwconfig and I don't think any of our developers are still using them as
> > development vehicles at this point.  That's probably a separate
> > discussion from the patch at hand though.
> > 
> > 
> > Matt
> > 
> > >
> > > John.
> > >
> > > >
> > > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3683
> > > >
> > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > Cc: Jan Maslak <jan.maslak@intel.com>
> > > > Fixes: 37a230e50 ("lib/xe_query: add hwconfig to xe_device")
> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > ---
> > > >   lib/xe/xe_query.c | 6 ++++--
> > > >   1 file changed, 4 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> > > > index f3731d9d3..8f0a5392c 100644
> > > > --- a/lib/xe/xe_query.c
> > > > +++ b/lib/xe/xe_query.c
> > > > @@ -51,7 +51,8 @@ static uint32_t *xe_query_hwconfig_new(int fd,
> > uint32_t *hwconfig_size)
> > > >   	/* Perform the initial query to get the size */
> > > >   	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query),
> > 0);
> > > > -	igt_assert_neq(query.size, 0);
> > > > +	if (!query.size)
> > > > +		return NULL;
> > > >   	hwconfig = malloc(query.size);
> > > >   	igt_assert(hwconfig);
> > > > @@ -858,7 +859,8 @@ uint32_t *xe_hwconfig_lookup_value(int fd,
> > enum intel_hwconfig attribute, uint32
> > > >   	igt_assert(xe_dev);
> > > >   	hwconfig = xe_dev->hwconfig;
> > > > -	igt_assert(hwconfig);
> > > > +	if (!hwconfig)
> > > > +		return NULL;
> > > >   	/* Extract the value from the hwconfig */
> > > >   	pos = 0;
> > >
> > 
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
