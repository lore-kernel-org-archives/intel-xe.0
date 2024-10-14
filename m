Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3FFD16248
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 11:38:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E4A10E43C;
	Mon, 14 Oct 2024 11:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GmA58cZ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6397B10E43E
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 11:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728905878; x=1760441878;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+ldR4TuLD6n9n8Ra3U87PGFYwM+9JbiqBogu06f3nqk=;
 b=GmA58cZ+PCpl+J8/KqSj+T7/Cn7LsVUbTB8y2u/Oobx9MYs4hb/Aqw0R
 u0GbdUuGXzBaZ0ugWvHiaj+frd1bMH3GR5Ph0rMR/rcBYi0ca/U09QVYK
 l6hfhiPld7ZiTR4gDNR2/IYnCaYIbrWUY8KKXCa0BOKH//Gd9BCxVfDHV
 sIdyuArWMZdoBNW5lQtcX4SvadO9dmTsXIqP/dxVbeFnDWcR2N1eGbqr9
 ZnUddGus+qCzLgm0nGIwsG+YaI8Wn1tYPbHjuMnk+tsxldjVQ00HUoT9u
 Me7N+ej2Gw+NSYvC99V4ZjcpqBvi7dTw8SGvCon0ka/onqCIQ/whRYJxg g==;
X-CSE-ConnectionGUID: hdLlI0rCQaimrlum68pIIg==
X-CSE-MsgGUID: rFaOT9oPRCGp7T40cro8oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="27707311"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="27707311"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 04:37:58 -0700
X-CSE-ConnectionGUID: CBgqQeRoT1SsfWYsfW2DIQ==
X-CSE-MsgGUID: bjM/nqFTS6yOkVONGSbJxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="115001874"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 04:37:58 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 04:37:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 04:37:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 04:37:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qv0wnvjVtLTnhxFaTbMj1dkOiILLGTvqDFcU0zdcENgeCnaEhxUK3galLA5lsySi/+hY/OvTlDAiK0135lkZzJUG70u+CvY4IFUusfGcvN9rq762FsImrdgqzesq/MJy+QUqiDiKpvY38CEA6BCYRXK2zGtmDqTgjcnXaADJHZCRDEq1/LH54HdbstBPGvqPcIFOE9Ld7ku7fVmTvEiZ1ITgtgO9KnS1gylm5F7NRDNGC2de+p1mkROfdX3QW4m7nrVbcvb1hkRTpqJ1xR2zJXAuxaeY54qXYH3m8u7ZdeQPoCvff9H7bfTnaPWuFn4kslDzIqa4jglhPUzmzVEvyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElTKnhmQy8GWFJXmovWioPQuxuOjbbBJlQN7HMiB/9M=;
 b=OoWEAaV8MSlJMZc9xeSbUe+AcaiTJ96dGuWVpNZGr7OI03zXuisC+xT37uwM1QrccuStYhBUGf4C2CD7dag/ubr9y0fZ8LxWOgzJJ2ZZpcVg/Zu/QwWYQBpd3W8awY2uvhAaSponP367XifoU/bmwiy8qeCkUcxSQ1vGcUEag4vAYID7f82egzS0paBkjhOpzqVEFYx0ZjCtIElUItsRUfJ4R0FMB1C5MOgjdu5iNpu/pkBpGuK0uTMTyahI4CwS979sSfVRWBn31RiRucvRXDFA3Np1u1uNfDZaYHZdFlRBkhfui6ZiYZik/LWm7jQuDPAUhOTQ5VRasoH1rBKXoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SN7PR11MB7995.namprd11.prod.outlook.com (2603:10b6:806:2e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Mon, 14 Oct
 2024 11:37:55 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 11:37:55 +0000
Date: Mon, 14 Oct 2024 13:37:48 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/ufence: Warn if mmget_not_zero() fails
Message-ID: <Zw0CjNsJzjN-DVrJ@fdugast-desk>
References: <20241011115715.3486872-1-nirmoy.das@intel.com>
 <20241011115715.3486872-2-nirmoy.das@intel.com>
 <Zwzj4N466Z3uZryR@fdugast-desk>
 <f2646225-171e-4101-a0b6-73a0dfd017fd@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f2646225-171e-4101-a0b6-73a0dfd017fd@linux.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0347.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::20) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SN7PR11MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: d97cf3f7-6eae-46d9-4af9-08dcec44a529
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Cv71w6L3CS3wvMIua2gBNwBcCvGOZ+t++RLpqK0kpiWPn/wxa/D+uH1Fr7BX?=
 =?us-ascii?Q?ycuktW+Bwz391w00dIapgMfF5AoSMk+QzxOxJ0xvQjRLHvCUTkv/G6rXGs3J?=
 =?us-ascii?Q?uO58rbPlQa01GuJ1QSblWfV3zdYwLq9VTf4bU7MbjdLQIIweLaxB9ZycXcbq?=
 =?us-ascii?Q?0u6BH3f1lqmxSMmUktYnSkGHv7zAfAGSX2BqCUDnIOUMHx7WCfeWjLVpU3hI?=
 =?us-ascii?Q?hDfFCXd7jeIYdURMF4HunyavK9G0pRiuuhSwVokq5cQOaHAiQOTAzNMGBZmY?=
 =?us-ascii?Q?PlRUV4hqxR5+9NI3VyFIZUATJPHmSsfOXQNfAcyGWTYqT9K/1VxnmNyl8efp?=
 =?us-ascii?Q?+HeyA1WOlLv73m5mKMyyrkcnApmXvemtefS4mezZw1KWxjBQZo+BsYstdrc/?=
 =?us-ascii?Q?pGpbeo4e0qNmG572iBoS2fryjZ12u0IoWGpriH8mn3+Dev69blqQpX9ulL1A?=
 =?us-ascii?Q?WeDJwN7llApO5xPR6o+QpBr7F6nHWIwYGU6dM5gHviq/M6orQzr0MKFEv51E?=
 =?us-ascii?Q?jQaC2wi2pdOkTfL73ApmOWe3hobpTlIWI2KDPrgh5fMi2eGoRaYJOTgWEHzq?=
 =?us-ascii?Q?W3jlJD5kP3sLFpKi31kByLNw0NWfOiMlVzzmp4DORVjCTksZUsnj6dJxwfSX?=
 =?us-ascii?Q?UwC/PlbguCFMhY9jXbwFF5GdjhtYoCOh59hK9/7yui6Zb+mcDbi4oW/0NSFC?=
 =?us-ascii?Q?y49sQxMXpYqltBkQL6/08liuvW+pU8QR1OyeiiBlPAqLUQWGrQmpJBW7nbgu?=
 =?us-ascii?Q?zgYstId1lZ3guQlGoKZUXspdpAYYPqDbBK3eGjkhWk+DOYuSBVzIZZPT0P5f?=
 =?us-ascii?Q?pE/gWohEcs/Vx/rVSvfsmOR5FsRENi/LI8qlIwvLjqt0dg754LOcD0OkO6h7?=
 =?us-ascii?Q?Pyng4qTRCXyDZN1XWC+r22beLw/eRlVX1QO+nXlNBkWJCEDeGk77wpuwdjhI?=
 =?us-ascii?Q?4Tedk3ZkPToXyrNZHcWo0isPEW3P9nh3V/K+c+ZlVwGd4eijUfSyXtoyctQN?=
 =?us-ascii?Q?3/xy3FHf5SHnJV1iI5396rLmY8N6J7Cl0oWSdiq1jB4WLYLZHK3LhJKUgjmK?=
 =?us-ascii?Q?bEViIZjh+QN/J/eUhsxUB0HBooJrr0UrJHa9RhssirT/UbYGp8QNioSoed0i?=
 =?us-ascii?Q?mwfBFF6RUZ5y7iRxJBPZE7p+T0+Ix8nzmGaRjr7wOUe9mFRRlxbKAUoDsFk4?=
 =?us-ascii?Q?InCiu29rC1lSgh7IAvfagw79U/uqRJ6AgVI1oqwBynMIUM/xtPtelaoMDX4?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ww7khpNHqVUEuFqBLL+vpTiwEiddxie23cNTmuPCS3PO4yu1/BI1OnjIaQLm?=
 =?us-ascii?Q?8REnqkQUdj8PglsrqJlAbDrLv0wQnJ2ZAYXdwFmPqLJESgCXQOIRZFlHiSDF?=
 =?us-ascii?Q?rYodklrUQV2NWAbS0kkiaTDU7gkhG4qpcCp/u6XEh6VlA7g5Pb4mnr0qaaYS?=
 =?us-ascii?Q?4PLkNya+4hGKSWE7sgn67fdt0Px0GulDIwYRvuCxFXLb5/N2DWWWAefbGGzD?=
 =?us-ascii?Q?bsAUPsz7I+iSJHaZGG3mB5umaR1rJJEf1dJx6ydOBRBFz+i4puOPfv/yPTn+?=
 =?us-ascii?Q?rKdRKUTL8EPxX1e6GFIo/3DpzRwEFglTyuqm4Rkfeu0GC65xI3gXhHpR6tMu?=
 =?us-ascii?Q?OINRkSIFQKtlotsHyjeN5CB3KsLan23jlN33GeDCpOgcbY00qaC98D8XhioU?=
 =?us-ascii?Q?pvXHc90o7jN5CKkaR1hAUQYnfwdBFOjzcnA2m41w3mCP0KXo+tsWRI3AETiW?=
 =?us-ascii?Q?2S1R4S1mCIIMdk/V+zaFMYS/zjDtxzWLFMJg9faLSM9JMHYMoFKWXboRfbE4?=
 =?us-ascii?Q?MTJiMzlv0Dsb6fssIB12PQeyk9gmfjaVxK3ogyZa/8kYeEtXUPyHr1Xk3uVP?=
 =?us-ascii?Q?errFFRVcwZ+Cxwf07Dmx+pOgodrR7BrOiNSbGsb9G4Ydj79l1ahGa4uZtzg/?=
 =?us-ascii?Q?qPmvP8O5TbXxHBWvuJYmPDgfwnaP8O7r9pRMXPW22rdWAzc1045BJw96gK90?=
 =?us-ascii?Q?M4tFwPpKzYhvBgrFlMgg34dvpGFETq8ZZfeNkZsLm65pe1LUc1F96iFlXoob?=
 =?us-ascii?Q?BJC9UPhhYchj2XIKdiw83ah2lgMd3PZSPFekiWb8YGeLGWstYLy0VtpYe3iM?=
 =?us-ascii?Q?DfqQ4y0lIF1K6OlX/rnJPDfsx9gKfunfo3xyF2s4e2DnPKLLusbMir1162lA?=
 =?us-ascii?Q?L2SfbFb0IKJJyaL5j3uGOXQvYjq6jMzC6BLE+VRQo5it0bym+ggXJU7pHsto?=
 =?us-ascii?Q?4O5fbc4PKXSqNnvlMFjrYkRkiYk2RTzTnfLvllxfFa1hvkekIzapJoej1JwO?=
 =?us-ascii?Q?DDVGY/m5M43QrT3PWigDOc6WmYUiNDQd5JNV7cgdQh4TKkdKMTbieCfBkCnO?=
 =?us-ascii?Q?exneMsEnvvABIoEIKF2C5oCRf1dSVHP/g+ijq0dyYsVrc1tEnpefLjo6Vv7+?=
 =?us-ascii?Q?vL6ct/DYueAnIcMAgkZw30UkPYMMWC1VkYGYJn0WPDijNtqW02BC7qjIr1R4?=
 =?us-ascii?Q?tltr8T54+sae1uADb5yxEUuikycESM8u4OQVyaXI16G6mu3zD+p2bKy1MbIZ?=
 =?us-ascii?Q?n3CW0r9r2FngGe5UmssxleiMAGI9glPJvzavKodYMThmQzLWOxRC7sRbzxqG?=
 =?us-ascii?Q?lffL+7HZJur4JkltjOvoVvny0zsslLaRAFI9soCEHX9dSk6jFCHeAadEC0MB?=
 =?us-ascii?Q?xg2PG8LA/3ktxDqItUhPR6ZOQbS0JmoqI4iL0OJ9PbbZRkV0SIwmLNwI67bI?=
 =?us-ascii?Q?4jxZeFUbMgoRZ/x5FbiDVWcSgEQQ83aG7XuwsoF3lfoKn5uP9OTNyjLu6DFi?=
 =?us-ascii?Q?aBATh30lpiUn0/AUSoKnLJnZNbhPZfjL0isLS2hDwi1JMAp3xttGxYpjjfm+?=
 =?us-ascii?Q?QIjIXB7zzLX7oNg+ClVhnZaTJAavnNihDzfVqBUJbbUmU4uOxsMQVTr6MsFq?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d97cf3f7-6eae-46d9-4af9-08dcec44a529
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 11:37:55.3718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SsBmvu2qdCQtZrb3ujRervEizq1S2KKOi7dWYaeacbcsIkinFzolZTsOuZTkuEKK03vBc/fWBrh4CpD2VOlSOsD7xk6dhw42nvTWIBzU0fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7995
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

On Mon, Oct 14, 2024 at 12:58:29PM +0200, Maarten Lankhorst wrote:
> I believe this is triggerable from userspace, so this should be a
> XE_IOCTL_DBG

Actually it seems this code is executed from the context of the worker (which
can be kicked from userspace). Besides, XE_IOCTL_DBG is used to check IOCTL
arguments, which I think is not really the case here. See:

    $ git grep XE_IOCTL_DBG drivers/gpu/drm/xe

> 
> Den 2024-10-14 kl. 11:27, skrev Francois Dugast:
> > On Fri, Oct 11, 2024 at 01:57:15PM +0200, Nirmoy Das wrote:
> > > This shouldn't happen but seen this while debugging ufence timeout
> > > issue time to time so log it to isolate this particular case.
> > > 
> > > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > 
> > Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> > 
> > > ---
> > >   drivers/gpu/drm/xe/xe_sync.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> > > index 6a2e4dd41d56..41758f528d7c 100644
> > > --- a/drivers/gpu/drm/xe/xe_sync.c
> > > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > > @@ -83,6 +83,8 @@ static void user_fence_worker(struct work_struct *w)
> > >   			XE_WARN_ON("Copy to user failed");
> > >   		kthread_unuse_mm(ufence->mm);
> > >   		mmput(ufence->mm);
> > > +	} else {
> > > +		XE_WARN_ON("mmget_not_zero() failed");
> > >   	}
> > >   	wake_up_all(&ufence->xe->ufence_wq);
> > > -- 
> > > 2.46.0
> > > 
> 
