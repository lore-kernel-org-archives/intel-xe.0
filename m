Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C32CCD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 14:31:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E037C1139D9;
	Fri,  5 Apr 2024 14:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="frWy6m68";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC3B10FA69
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 14:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712327495; x=1743863495;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OASf+D0yumIzMZRdl3x1+QCYC/+338QBeuXQvhixkQE=;
 b=frWy6m68AF2zJp9H5bcspLe3PZTT9aMLp3rr2mIYlXMMzs8WvGAK4NGC
 uxgqBPFp4OvIfp2ugT6P4B4NfRnhFawwStjiqqcoSivuoIqoGgvzjSwde
 qwGKGDhXPWKtE1WjVTcBp9sLx+bclZejI2Rx59IaXQiJcj9Crv/AmvlSu
 DJUGWh82srYC79wQeayumPDhaO6jG1Ury4jHoseK3Ixljvi9woKjqW13d
 3K4/ijIHxAoCY9gxN8CYo/jpvAuPylOYQgxjRdPBvqFD56SioO7WNfv5J
 h4D+GVSuMtoDzjbiW9nUBqked1D1Exfqu55Y/X0JF/MvSa78ETUZjPj5W Q==;
X-CSE-ConnectionGUID: DX9v3IdLRbqrySRGIFYsTg==
X-CSE-MsgGUID: RRwCtABBSoO9yGI48UUuHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="33056082"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="33056082"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 07:31:12 -0700
X-CSE-ConnectionGUID: zzONIOBISrWPY3x/e4HiXQ==
X-CSE-MsgGUID: g+YYqJNjT6OmubHEaah2Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19034965"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 07:31:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 07:31:11 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 07:31:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 07:31:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 07:31:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ge/wgmaEjErNMqEecuI6eVC58qqC7jprhmnM5FYSj9ynEd0i2KYugz8SrmiUuQFCfCUMqt34woNvQnMT0TiBT5Ytad84IkhX8h3HduUiPhFZnibFzUoibUqoAP0doN064h19+f6hvFpZFtHMBqBJ8BzrL0dhOTiAYxjuHmbTjrPAmT8N5NNrspKCNcns0A9/9a9GQOcd6q+wHbniCBP13dxWDeuQHFaN6UUjgwnYx1sD0QuvH/2M6jrFF+CbT/7tgkCyz7yLK7FYdgwRgfX54cmypZkmpE/T6IRuTPbWuWr/666YVfpudUOEvKdtAe0RT5xL0HwKSLH+GdNpsti9Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDXFSQ16o/+C5+jlWcBJm/4cizBVQyELPEe0G2ql2K8=;
 b=EFZOGR9kySennISJM/9b95I4KF/YQvfTUXzVDeCtzTiSrKKyQfTEmaE5IGciKORVrn9nIrkra9PmgilbYYNQ7W2Sp7zBjPrPaaD2Jztrg59vTir6G3tHENQTMcgeeTlV0xhTAO8pnWXuWqtcR5dBV33nn3qe+lxU8nH9gQhG4CEA9KtvtF/53RgF8V3Q6o0OXpubacQNZKCr3CPCBWW5QIKmqPgZmORhQP7Y4uyC9FVIRnA7BCGtRhEM1NGc2eivwcE7t6F3vdsOdsYsxduJitKE7kwR7uaHc0pCY6I461RS0h9+pFIKEdu1REUR31WrL8teXWB1vnU6q+0ggYnyoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7310.namprd11.prod.outlook.com (2603:10b6:8:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 5 Apr
 2024 14:31:05 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 14:31:05 +0000
Date: Fri, 5 Apr 2024 07:31:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/xe2_lpg: Add workaround 14021567978
Message-ID: <20240405143102.GW6571@mdroper-desk1.amr.corp.intel.com>
References: <20240404093529.734251-1-tejas.upadhyay@intel.com>
 <20240404153309.GB958162@mdroper-desk1.amr.corp.intel.com>
 <SJ1PR11MB6204F5A4DCD9D6CFE87F42B181032@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6204F5A4DCD9D6CFE87F42B181032@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7310:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vmzKgk9x7DVXiu2BY5JZhn1tpKQnKpUQ7gtG1jsnU5Jti3853ZZxU8ACNRVkzqADxw/lfMKtDHt8qnf4clG0LbogjxYwqbwuFcbEQdVXvFJxLUet1JmFFORFsdUMpmJDwiCwOSgFq+q9kipQjHoiE2HIhjr2RifrYs5FVstmIRXvCvSYiiRBcgffElJl6AANOTtcIUkHKKcjjfI/4qktS1+JqY/uUdTMQX7XzjBL1C/kyh9878tFuxGEPbUfBpbobLdC4X9anm0frCmBFb/Fnr67XXVTPSxVQFnsSQ1radLOrdF2gbpT6PcD6ktbHmT7xFzURPgqd2VUyKDCyCPH+nZXohKjMm6LomMYPb+Oyn6FiLpPgHJS8+DEisUOtZwTSin0I2ZYch9XFUYuKAdKeVNRuneKZOOzGh0dCOFA5sA1iQJU9FlR4TV7R2aj8nsflPsy3qsD4+n6YEGPQocoFVRzj8IVRsaZvPooaxGyQ7cnNXYGto27pHJo+HvxwXFDwyKXcpZkwi9a5wDA2Mn+SLO74FFq0dUn1D00cjRdovgEI45tU4cspCew4HJYnqcGsX55vQKWnOVkH8146yYg8gMClzze5A0qutaQUOhVhw4ZwoyBWRC9dhi8A9+w/GrwUvhWPOCyfP6R+Azu1HpN5di6yE/w1oaIEG47DiC9KFA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G00WHSYiyTIb2ysmPgPQJGwDcOPSQMKw0xyOFUJoPZqHc+Q/mBO4NVtl1jk7?=
 =?us-ascii?Q?59czJzDDSihUDfwAcJ1dE1An25p/QIUOasHheYFxHlboRLQnFxXbTbeqqEPW?=
 =?us-ascii?Q?qs60MRDaMbM1qjtj/QbkEakmkVD5igTXTD6EhHmBiiDOj7rCt8TTdITInKdh?=
 =?us-ascii?Q?Lgm1mC8c11KsWBMd96IO9C3CZIV1B1zb+s+CYIahhdkIBH3MqdIAwSMgb0Fd?=
 =?us-ascii?Q?dIDkdIPhZRIcxfyVP5+Q2cU3n/M7F/FkSeKKcMnUfSLGIqjkvjTUDwKPfHCG?=
 =?us-ascii?Q?NFrmZcPpB2QMBtug+IKS65fF+aop2KqTXLXYtn/Hzuw0vNufxlBBrTvmQEew?=
 =?us-ascii?Q?gkz0/+Qm2xCH7hSaoR5V1YQ8GMH4bs2fimG9RGxCI+acWUpXmJln+XQ+TKE0?=
 =?us-ascii?Q?tAM0dHDOYpBD1acBPMuRpXdoKL444awTGLLV4MRaxq1VuYyFMZnHrik3zUpN?=
 =?us-ascii?Q?wIfZv9KfmNaU2AkjRuduYnc5X3NfbyTNyMSueKVqkwrticer9kT6LZpRIJoJ?=
 =?us-ascii?Q?o50IJGq7EM25oRsumM/LvmpVjdPsPotLv9tVbG2ENE4bk2AyNRJPnH/8nuTo?=
 =?us-ascii?Q?TB0NVXzAO+b79cLdnx5gr9esxG1s9u7pxei1CntFryU56Vrikpr/JLuMzhZn?=
 =?us-ascii?Q?L/LfarzYTLXBQSvdKfbohnie7jdNHolYh300FpB+OfF5psOypX34g2HQWW3X?=
 =?us-ascii?Q?zOWlKM3klpZJjugDL2lR4ebQdr7mROOSwfAw5kbhiamS9TftyU7g8MDRhCXe?=
 =?us-ascii?Q?xz0KUxPP21xtq9W6hwpxn2+kU9aDRUZb/ZiP/xNwyVATtwbndBHjYikgce/X?=
 =?us-ascii?Q?cHMGHEYhGd+W3BG2nS2tKFMmjVHWOTdUE0HRYMYbTH9WKLHwabU3C8bncdZO?=
 =?us-ascii?Q?9bjiWqn3qwCWabTCWEEQWLwWzns3+amaoMVuVCa+GGDBZUFG8Z6O/b4RByD3?=
 =?us-ascii?Q?3/Li02jnI7ObnCoO8/RYQrsAUxHvjsN4iZHd00ZqiC1yJHslUSdnVcpLTCSk?=
 =?us-ascii?Q?mwUf23qUNWNlWpDD5cQWQt7rsaemxF6BZ4t8dLLd5qNlpfW9ks7z2i3LoJjS?=
 =?us-ascii?Q?e0PQN1o6Ru7I/GuIO7efyK7br5ESFXTZtuMzhlcpH6qwbRlgBGb3P50pZFa3?=
 =?us-ascii?Q?CEbnMYoyPe+nFoqfrdXgP1oLKBPUWb1Qyeu8ERVnS7wBguqOW5eIXdqwXLc9?=
 =?us-ascii?Q?PBlBSghDlhK3O+a1ZvnRIdT0x2hjBiQWch7zyOmwARlM8DBeWNyfxIG33zCi?=
 =?us-ascii?Q?QIoBW2u5cNeFifn32QyN3NwZDkLCAw0Hh8wKYwzf+3pR5f/up4DGSmPekOMz?=
 =?us-ascii?Q?K3zAOge2wCFfLbb+I0vbVAasWSDyiekl/nzvpZh9ydAGeMRh5EG7iyMH54lr?=
 =?us-ascii?Q?KlfqBdvIszMYXdwEBLtVgzJC46rFN21TZIlXwdpXi3AEis+a0jZVJQNomLHx?=
 =?us-ascii?Q?j/805hzueDE7DwBUCYNgpfE1N7HKCZX1MWDPVN80bXFLCxRHfnNjrQQjxnBP?=
 =?us-ascii?Q?UvhnRdb9yFKhDYyn3NCYlDQCG4huxBRW5eYZUcaYn2DfJPJR0WmD595gX/l+?=
 =?us-ascii?Q?169FClEXWoM5pOZ7MLY4y5N05BZkUxKknYeAPVmY3Qc1chVbfTsecSJ8+iRj?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4d7eb6-a446-4fc2-41c3-08dc557d06ed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 14:31:05.6901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZx1CTuxdAE1YgptJbF+M5q/p9B9S5aynneCHelP1Q45wukFIJ09HO6hVd8D27YYDzDf0xOA5IZ/6g6U0VV3nzn2siPIgjgt79XVkF5Zq1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7310
X-OriginatorOrg: intel.com
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

On Fri, Apr 05, 2024 at 01:55:43AM -0700, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > Sent: Thursday, April 4, 2024 9:03 PM
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; De Marchi, Lucas
> > <lucas.demarchi@intel.com>
> > Subject: Re: [PATCH] drm/xe/xe2_lpg: Add workaround 14021567978
> > 
> > On Thu, Apr 04, 2024 at 03:05:29PM +0530, Tejas Upadhyay wrote:
> > > Workaround 14021567978 applies to RenderCS xe2_lpg
> > 
> > This is one of those rare workarounds that's documented as not only applying
> > to the single platform that has the record in the WA database, but also
> > carrying forward to all future platforms forever (at least until they make a
> > permanent documentation change).  Since this starts with the Xe2 family in
> > general (not specific to LNL or BMG) and goes forever, it might be best to write
> > the bounds as
> 
> But this 14021567978  is only talking about xe2_lpg. Even if it applies to future platforms, we will have new WA #s for them which then we can mark with "#WA1, #WA2" and modify version range. Should not we go buy WA#s to keep track?

Not in this case.  When an item in the workaround database gets marked
with "driver_change_required" rather than the usual permanent/temporary
workaround status, it means that they don't plan to continue tracking it
on a platform-by-platform basis anymore.  Instead they're just going to
update the bspec details to make it the official "proper programming"
for all platforms going forward.

In this case the register now has a new note on the register page that
says "SW must set this bit to 1" if you view the page without any
filters.  Unfortunately they screwed up some of the tagging on that page
and the whole bit goes missing if you try to use the LNL or BMG filters
at the moment.


Matt

> 
> Thanks,
> Tejas
> > 
> >         GRAPHICS_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED);
> > 
> > Also, it's still technically considered a "workaround" due to being documented
> > in the workaround database with a lineage number, rather than a tuning
> > setting documented on bspec 72161, so we should probably keep this in
> > xe_wa.c instead of xe_tuning.c.
> > 
> > 
> > Matt
> > 
> > >
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_tuning.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_tuning.c
> > > b/drivers/gpu/drm/xe/xe_tuning.c index bb6db2817ada..cc65e5b4353b
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_tuning.c
> > > +++ b/drivers/gpu/drm/xe/xe_tuning.c
> > > @@ -93,6 +93,13 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
> > >
> > REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
> > >  	},
> > >
> > > +	/* Xe2_LPG */
> > > +
> > > +	{ XE_RTP_NAME("Tuning: TBIMR fast clip"),
> > > +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> > ENGINE_CLASS(RENDER)),
> > > +	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
> > > +	},
> > > +
> > >  	{}
> > >  };
> > >
> > > --
> > > 2.25.1
> > >
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
