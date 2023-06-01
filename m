Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBBBC7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 17:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B277B10E0C1;
	Thu,  1 Jun 2023 17:49:31 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0756510E0C1
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 17:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685641769; x=1717177769;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=563igZ4lHiat59VEdqS2wS+s2T5+ryuxuQ3v9P59kAc=;
 b=GBaE8KpdrsjkW3H6Wl9pb31pkhaQxJr1Mgy+NtmCorb8G2gNXEdN230D
 gCJ9m41jupBFb6tNn4gJCZXiHeAe4jfxC8rXSYb0gDWfPS1+xfdh3Vlmb
 xHvEh0KXwkgJzgQpwJU1n5nTW0vm66cJ78/rXgN4bE/WaPjLZbuPL2aTr
 N/Dn4MyivldpOrWVcDKghVnn+xavRwoW7NzvoBv/XsuUMW51+bXTNIVEq
 2ri7DfjfDW8hzRkm++DwH2v2fXhh/4NoOE7RtZlG7GU6LEEFc0mm0ciYA
 ZktkfQmDrf5/5At7tbmoRsyJDzAXaASi73Ja+Rn3qyrBifhFc8ew6XSL9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="354491941"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="354491941"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 10:49:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="881718122"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="881718122"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 01 Jun 2023 10:49:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 10:49:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 10:49:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 10:49:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZYSSXW1F0fqgdbL+gkd+M93PuSSGjQfzwRtMkE8i/3Ub+CoTlks9fXmXu/ddFtcT8b6G81FgZK/KVuyWOqitBijYP7E0buVFyr3+onLW9YGzSrqEHZ6GZwtoWt9DQxWwSUfvSUEfXau1vldodEw9V/vheeZjOcRkSlOVl4sJy/sUyPLn0ydg1QIKgRYFrpFKgQ2p0bHiV/g46Ts/2m5gQyJqTBggihgrhMB8dqxwbFuSNqnfB9+lhLSSqUJvjGFYwYRXyev9lTxsmYfG2z/Stcs329cQBnZgO43X+HvLSAfpNCUMDCT/zfhCdSAgFuiE6lk6wCQT1MKSj08Gj7VzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uaqqbgzf2NXxMKcfokEBBUTnys52XjkzWJgaI7phV2I=;
 b=RrULLfSo9kV7uY5ZwbZ5LiN5l8zouJ2uv04HcHi01VKmyA9IpadwjzVu86f4RYeKPM3W1ZMGY6L2pUfLejJe9LTKIEJS+F2itSWTQI7HaPUIBi+eCmlUi2wFeNHO35UsOHUPwsf4XR9cimbYYCnzzDqkcpy4ZnAVt/XkZ1DiWnizAlrIKDpvkiXfslrndYI3rFrCoh9JaQD7YIxG5tNhSnY/MkDvbimRHDwo1QmuvoB/CIPLHXvq3o1pS6SBCJ5gmVuhvlRXrEMzoGpn1g85RagTaTmwhn7VeykzSzlQu6OwDVd4uM1xHTODcJCsST3UmFL8P3Ai+wf20uNkDWhtYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA0PR11MB8400.namprd11.prod.outlook.com (2603:10b6:208:482::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Thu, 1 Jun
 2023 17:49:17 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 17:49:17 +0000
Date: Thu, 1 Jun 2023 10:49:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230601174914.GL6953@mdroper-desk1.amr.corp.intel.com>
References: <20230525161643.7-1-francois.dugast@intel.com>
 <jxctfqc4627xgu3nxumherp724kyqiz6iqhtxkrbp3ibtagpjn@mqeyghmdhwvf>
 <20230601164106.GJ6953@mdroper-desk1.amr.corp.intel.com>
 <w6uvvepfl3b34n2sbli5htn77j2g3jnaqg6fa2kkvntpgwnj6u@wqsakk7vtg5d>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <w6uvvepfl3b34n2sbli5htn77j2g3jnaqg6fa2kkvntpgwnj6u@wqsakk7vtg5d>
X-ClientProxiedBy: BY3PR10CA0015.namprd10.prod.outlook.com
 (2603:10b6:a03:255::20) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA0PR11MB8400:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e4a8fd-4a7b-4f05-bbd3-08db62c8852c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gXjoQkra5W3xZLZg5U26dlXDsAZO+IyfVNW9RmB7MEXgolmJeWoqZCulQR+nBcn7wBpBjUwk/Sa9tjfPPrPK3LxvTB7s+u/Z1EuhNIuvDzkHcgPlgKEqvU+RYEfkIbLlJVn1lNrfJgRCtC/0k392zC26rRf7HLKA2a+mV2Yhsp4YvexrjjTwN5PRxYcal7vqMWpPabCsL2X7PH6DgjYdBpFG/yzSjgDm2HaEMUP547UqgrgRAJ1BYwwcvYr3noCcX8bg5HrXflMKc03xC6gCVCPCbfzIyK5KuT+m4bLQkhhxPtTKurgvY6TaAW9y3X6G/w5RUiNdroz60p6jC9qYh2/q2ll4XZ1cq9ZrcDQxkl3T5xyNbySkBiAxU1LzgBpq0EaeDTku9g6Kyd0/lGB/4Bv86WyfPj559d9X+f3b/Ex351rTtK/w0MAtuoWvSOwvUBdYbBNXctuw4r7+hpdmLamJZEuiML3DckzEPjC8Xab+hvj4KOEZl6IpMuo9tDR2ZTCEg8wNFTLb/ss5uPQCOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199021)(966005)(186003)(41300700001)(38100700002)(83380400001)(6486002)(26005)(6506007)(1076003)(6666004)(6512007)(6862004)(54906003)(478600001)(66476007)(82960400001)(66946007)(66556008)(6636002)(316002)(2906002)(8936002)(8676002)(5660300002)(33656002)(4326008)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ciqJD4Rngwwti2kB7FIZkbEKR55IM7w8hji0KAjVHIRZOFQwdM2PjrIb/Ksu?=
 =?us-ascii?Q?+/qND6+fZ+zRn485u8WIhPSwP10ze2R5XGILtTYFvYxrCF0Q6q1Z7439h14L?=
 =?us-ascii?Q?rSmxOWvcGYwvza3pRCkL9mDU3k1FiAcQLyuczpOMptqiMJ4wfIZKtR6UjgPT?=
 =?us-ascii?Q?7AgQ53u6hHvSP02xs8Tajg7FO1v8mUdqy9GJsrJD7FIzMalrtGZwrhUHrgAn?=
 =?us-ascii?Q?7srdzHkaK1cl57aZCdKLepbxTUCELdO7039o/q0zT1GSu4Bycei2lCkDdXCp?=
 =?us-ascii?Q?45pleZEXQLZwQKT/WibgcBRwNHUu5Ihj2ybffiRRzXg3doAYiC2yLbSy8Mcm?=
 =?us-ascii?Q?GMkcBibxgBuMFogbdmfn1WjvqotsakNF43xIu3RpTKy7V/cApwEfDPfL6jdi?=
 =?us-ascii?Q?hQkLTb86U+1BTZr1xlkFFECSQ+wTL20Y3aWi8lfIDGDsHs5y8px8ZNrzYgmC?=
 =?us-ascii?Q?GlNradPFus2VE2XXwNoPfN3ZrMVl6VOvSdBl3aLfmHgJ8TVHtaKKGXRBl8uA?=
 =?us-ascii?Q?TBIsr+1/Gzxoqbr1LOvAP/bzW3jGtnFC8gXfkMgBA67l1Ys2Ey2YCNKA6LbT?=
 =?us-ascii?Q?CWt9SOtzsCtzFg/g+suvjpzk8KN8z0vj1osy6hUVMM8OK1KTCeE6B7H6/H7i?=
 =?us-ascii?Q?GqlaBb1TczxHRPNji5DygccWz/NjySpccv5N5CIWfBh1FRGTej5E+Vg2loRi?=
 =?us-ascii?Q?P0tJXRfe6WAi8knqTd9eta4ff4YQWqA7csR5aqHn/myfZlLmROSvfQIGpwGc?=
 =?us-ascii?Q?eS+bD+uAdimUD7HU9P/RgDa6iUrdQqfVzaCByJTQfzSdfEFavUAPp4X7kGdt?=
 =?us-ascii?Q?BcaLjojTzU+BxYYG1eV1AJ6xJ2lpGx6dvz3p2ad2iZusQOhKTD6z7ArZIrp0?=
 =?us-ascii?Q?g6ivj7VVc1xZ0MxUDTAAIPDR50ZqfyFLqKFyVLcLTJfzaRccH7jkwcFXJVy2?=
 =?us-ascii?Q?/US4lV8y7NqbS+TgPIx4QxwgwuCBnWDSBR1dKBU2kZOkGM6PAqh1JP3+hWPy?=
 =?us-ascii?Q?MBGZEHdoGoLjMm4efqM18nzNqMTq3q1Q940/yejcyhtJXz8QFmNMFl1kp7hT?=
 =?us-ascii?Q?1ma9aTan58xRHZpewNT3LoD6Kll7vbX2yIMOYjLo68+kLO5hBlReuMV9MwAN?=
 =?us-ascii?Q?brDxxDqdgUuI3TvscN2n0qriba7feQI3cRI5JhWHZUYR/yKF7VWdS3kkK+7s?=
 =?us-ascii?Q?nMhJf0oQeUPXJAULtcedXQhQ/Xtlf0dd45GApIeoH5u3bZnKR1gau1xG2FxY?=
 =?us-ascii?Q?gKA1QHV+N4vsC7tWWfOi7A8BS8hEWkRGlMQuHMQqjMlYLz4o8Hbmrv1/4Lqa?=
 =?us-ascii?Q?KXU65HunPjbt3XyyK1700Lb67niaZFfBrn/5TQu9OLCWPTqMc1haacm4fDBn?=
 =?us-ascii?Q?tgc4any0MqdzB9bqVK/jtIk65xAuMY/gv0evp1puZIy/zRUfoyWriG3nTjfE?=
 =?us-ascii?Q?+0MPACC2jajc8TKUirUcpz2Pc1Kzk+0CGzYRKM/oRvL3CZ/+vuj/A8Kx0Ccp?=
 =?us-ascii?Q?9iaDITdw+mxOZ5x/McaOOKMHA9Yj/y4m9KLE4d0l96SmIywSvIOQXBAyat1n?=
 =?us-ascii?Q?aBFIkdNP+BmT3AFe4hAPLVixzbmx+3SqwlRtJH9TTvf0tIqlJxdvXgDSwDMO?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e4a8fd-4a7b-4f05-bbd3-08db62c8852c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 17:49:17.3001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: veB5OIEBwnX58yDcj/URhybUMeqII8KJa/+e//vn3BH/b2oVay+KMUBeR2HpwFyP6mJkXCTNQkkeYJbk7LASkLFdVo5spRa3B3FkZsvUiRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8400
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Prevent flooding the kernel log with
 XE_IOCTL_ERR
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jun 01, 2023 at 10:28:41AM -0700, Lucas De Marchi wrote:
> On Thu, Jun 01, 2023 at 09:41:06AM -0700, Matt Roper wrote:
> > On Wed, May 31, 2023 at 09:45:07AM -0700, Lucas De Marchi wrote:
> > > On Thu, May 25, 2023 at 04:16:43PM +0000, Francois Dugast wrote:
> > > > Lower log level of XE_IOCTL_ERR macro to debug in order to prevent
> > > > flooding kernel log. Rely on drm_dbg macro output which includes
> > > > function name, so removing file and name macros.
> > > >
> > > > Reported-by: Oded Gabbay <ogabbay@kernel.org>
> > > > Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
> > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_macros.h | 6 +++---
> > > > 1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
> > > > index 0d24c124d202..2b8a46ffb93e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_macros.h
> > > > +++ b/drivers/gpu/drm/xe/xe_macros.h
> > > > @@ -13,8 +13,8 @@
> > > > #define XE_BUG_ON BUG_ON
> > > >
> > > > #define XE_IOCTL_ERR(xe, cond) \
> > > 
> > > 		   ^^^
> > > 
> > > > -	((cond) && (drm_info(&(xe)->drm, \
> > > > -			    "Ioctl argument check failed at %s:%d: %s", \
> > > > -			    __FILE__, __LINE__, #cond), 1))
> > > > +	((cond) && (drm_dbg(&(xe)->drm, \
> > > 
> > > 			^^^
> > > 
> > > now you have a mismatch.
> > > 
> > > From a quick look we already have
> > > several places with mixed usage. See e.g. engine_set_timeslice(),
> > > engine_set_preemption_timeout(), engine_set_priority(). There are also a
> > > few places that will log on ENOMEM, which should not be there, but is
> > > not caught by checkpatch since it's obfuscated in the macro (see
> > > scripts/checkpatch.pl - "# check for unnecessary "Out of Memory"
> > > messages")
> > > 
> > > Can we get away simply removing it?  retsnoop is a thing nowadays and to
> > > understand where the error is coming from, userspace could simply run it
> > > on the side... something like
> > > 
> > > 	# ./retsnoop -e '*sys_ioctl' -a ':drivers/gpu/drm/xe/*.c'
> > > 
> > > which returns more useful things if the error is farther down the
> > > call stack.
> > 
> > That requires manual execution though...I think there's still value in
> > having debug-level messages for failures like these so that we get
> > meaningful CI logs when something goes wrong.  It's not always quick or
> > easy to grab a suitable machine to reproduce a CI-reported failure
> > locally with retsnoop.
> 
> so XE_IOCTL_DBG()? XE_IOCTL_CHECK()?
> 
> Not a pattern I see much in the kernel, but other projects use is below.
> It removes the dbg/err mismatch and makes the code shorter to read, but
> the return inside the macro is not something very common... but hey,
> using the comma operator is not that common neither :). Thoughts?

One concern with "_ASSERT" is that people may incorrectly assume that
it's something that only gets compiled into debug builds.  But with a
different name like "_CHECK" or "_EXPECT" your proposal below looks okay
to me.

We may find cases in the future where we also want a second macro that
takes a printf-like string for a custom error message (e.g., to include
the actual value of something rather than just the expression that
failed).  But we can cross that bridge if/when we get to it.


Matt

> 
> 
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index 1a9082db8f1b..7070912edd96 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -249,11 +249,8 @@ static int engine_set_compute_mode(struct xe_device *xe, struct xe_engine *e,
>  static int engine_set_persistence(struct xe_device *xe, struct xe_engine *e,
>  				  u64 value, bool create)
>  {
> -	if (XE_IOCTL_ERR(xe, !create))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_ERR(xe, e->flags & ENGINE_FLAG_COMPUTE_MODE))
> -		return -EINVAL;
> +	XE_IOCTL_ASSERT(xe, create, -EINVAL);
> +	XE_IOCTL_ASSERT(xe, !(e->flags & ENGINE_FLAG_COMPUTE_MODE), -EINVAL);
>  	if (value)
>  		e->flags |= ENGINE_FLAG_PERSISTENT;
> @@ -266,11 +263,8 @@ static int engine_set_persistence(struct xe_device *xe, struct xe_engine *e,
>  static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
>  				  u64 value, bool create)
>  {
> -	if (XE_IOCTL_ERR(xe, !create))
> -		return -EINVAL;
> -
> -	if (!capable(CAP_SYS_NICE))
> -		return -EPERM;
> +	XE_IOCTL_ASSERT(xe, create, -EINVAL);
> +	XE_IOCTL_ASSERT(xe, capable(CAP_SYS_NICE), -EPERM);
>  	return e->ops->set_job_timeout(e, value);
>  }
> @@ -278,11 +272,8 @@ static int engine_set_job_timeout(struct xe_device *xe, struct xe_engine *e,
>  static int engine_set_acc_trigger(struct xe_device *xe, struct xe_engine *e,
>  				  u64 value, bool create)
>  {
> -	if (XE_IOCTL_ERR(xe, !create))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_ERR(xe, !xe->info.supports_usm))
> -		return -EINVAL;
> +	XE_IOCTL_ASSERT(xe, create, -EINVAL);
> +	XE_IOCTL_ASSERT(xe, xe->info.supports_usm, -EINVAL);
>  	e->usm.acc_trigger = value;
> diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
> index 0d24c124d202..6660ab49c8a8 100644
> --- a/drivers/gpu/drm/xe/xe_macros.h
> +++ b/drivers/gpu/drm/xe/xe_macros.h
> @@ -17,4 +17,11 @@
>  			    "Ioctl argument check failed at %s:%d: %s", \
>  			    __FILE__, __LINE__, #cond), 1))
> +#define XE_IOCTL_ASSERT(xe__, cond__, retcode__)				\
> +	if (unlikely(!(cond__))) {						\
> +		drm_dbg(&(xe__)->drm, "Ioctl argument check failed: %s",	\
> +			#cond__);						\
> +		return retcode__;						\
> +	}
> +
>  #endif
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > Lucas De Marchi
> > > 
> > > > +			    "Ioctl argument check failed: %s", \
> > > > +			    #cond), 1))
> > > >
> > > > #endif
> > > > --
> > > > 2.34.1
> > > >
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
