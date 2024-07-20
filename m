Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A470C3DA49
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jul 2024 23:15:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01B410E050;
	Sat, 20 Jul 2024 23:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mbH34/b8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5B710E050
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jul 2024 23:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721517337; x=1753053337;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bwLbIb+30D7ZpnRA239VllyHtCb/9WD3Ph9Lztxy9uI=;
 b=mbH34/b8VrCuH1lrdXICZg8+JR/cGbFF3v3x0imlzek5k3/9+Gw48DGP
 xhLIBCrlSN6E7ggSVOS0Nymkraldixswv9dqdgX6ZdfOjtPJ8woefbYoF
 j7qfhB3WPy70a8aamb3IPd9qFpt/ssrhufVgXbcm+zER9P0/TM2EndWa6
 Ah7CFAneY8NChXt1hEP+U7ndxIN6wMEw/jB0RUpNjU4zDFZaCgd/THCUj
 oq7kvqV5A/lnbZ0qdBVdV6XGVWb5/gBu338w5B/lGIqxvxsda1y9QT9u4
 y12zEFE2qB+xXbXBzGEn7vUnIC027pLKxM0koaT3nhCCTMr4cI+lVye0v g==;
X-CSE-ConnectionGUID: 6PCYaPVfRg2H21iJN9u6cQ==
X-CSE-MsgGUID: 313BoFgmSjWB/xTRMb8uMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="44540080"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="44540080"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2024 16:15:35 -0700
X-CSE-ConnectionGUID: SthgfRbzSAy73UTUxXUWGw==
X-CSE-MsgGUID: Z7UWIXgBT8aDaOrU1ke/DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; d="scan'208";a="51531428"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jul 2024 16:15:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 20 Jul 2024 16:15:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 20 Jul 2024 16:15:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 20 Jul 2024 16:15:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3epCaPEtvb/5i0exbJQGU1bbrmGMUYUN7utxr4qZq6oI3BygTs5igqFBbRQDpUMvGrpzJNRYPsn7K081tfCejSslAOxfWRm8Ji4+oIzxcJaVZGBCnXA0E00O8UFhANuoMMb5tfqQtzcIQfmabyNCoisfyCY5oT9hpe4l/Gq+MPcrS2cOl21rFJNUSqOT+zMF7Xf0JBELNi3yCXAB/3WD8mHJrqCPFpoh4ChN9JhKkuLDs8bg56m/YPE8JkuVQ1K4Yo/AJ+RDcOQ4eXBUrnmittnp+hrI9IbkFHQwNA+O0Vi1g4ayd0ZXMwTp+qPmI0YnV6qBMglVU0x0Y8uBG4u8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VF1y7WGvsjGPyq2+9P/up7O6cwTRb4caZps7uz5CwRE=;
 b=PCOH9jSbZg12mMbsD0nxkp+rTwYICbfSFtk14UjZeW61U2KirxV0NclP0GKOXhdCfhfh9nul5w0Xk/bYASqEAaif5466i2qs4cSkPRj21dKEussTMwwHCuPzJ0fAZUxBcHBYVkvAEwD3ZhcpmhHqh0748EOX8vpTCX2YD6Gjx9e4uRAQk6BBaSEdp4dlfeE/IeV6k0wYt8PO7CKAxptNSsz8zcgMXGRCQbuw6O5l7PtDqGK/okx/RqvLr3dfu4oyNBejdAxnAb0K70DOiCt/7v8OumUFVuNSBNQhdt+ewUuE3Yrz3r4b1ZmjJLQ5+y1wq4dRviY0k6CNEiWFhtgdMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Sat, 20 Jul
 2024 23:15:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Sat, 20 Jul 2024
 23:15:25 +0000
Date: Sat, 20 Jul 2024 23:14:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH] drm/xe: Return -ENOBUFS if a kmalloc fails which is tied
 to an array of binds
Message-ID: <ZpxE3A6BrzymJZYL@DUT025-TGLU.fm.intel.com>
References: <20240719172334.1527484-1-matthew.brost@intel.com>
 <3bf93639-74b9-41ff-9d6c-1911506772a2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3bf93639-74b9-41ff-9d6c-1911506772a2@intel.com>
X-ClientProxiedBy: BYAPR01CA0070.prod.exchangelabs.com (2603:10b6:a03:94::47)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BY1PR11MB7981:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d8c22fa-c016-42fa-af05-08dca911d637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t8n0m/4jfVfLhaHsJyEd0ufq3XHiHeDpQ5zyUg5tFBgCxaFB8yOkIAhrKIVW?=
 =?us-ascii?Q?g1+oCBkAdjgkfSVeTs2sy/hqKh35khrSIYnRrJHqPGcH5v7NfZwj0gDQaDaV?=
 =?us-ascii?Q?aIuhHFDYOWCrFJ0EE59mcpGljMqa/VkFPoN6Kwq5ZLO16c6QEFuATJAihB1G?=
 =?us-ascii?Q?W1N6qEkyJB13V6+s0NpTRN8mihnwqmTpKJBsQ02dj5o/lTUKU5xy6GDzAzw6?=
 =?us-ascii?Q?f68UnPRrwl30lCI+10MWJSYFnrQqGCIVWF2IQdAlMHD3B8JoQDH3v/0B6CHP?=
 =?us-ascii?Q?U0b1XUQLNX2MR2FwS7s4fl1VbZ0v1sIUf4M76O+nrrNiqU9J7aWhqYUyrnyC?=
 =?us-ascii?Q?Vwh8MMwM8wXuozDi64+U5l2LJTisCH48sbHY8F/8Q7sYk1rtyDXP98v7inAS?=
 =?us-ascii?Q?JRBBBDecXyZ+XO7x/EdJjxvWnf9a6a7rhpbQsPv6UxOlK3eemEDBxO8f4l77?=
 =?us-ascii?Q?1Ptf87I+s1CWdLkfI2LO85RyDk1U6S6PzjImB0o/zzwP9BsQj95tBlp21emr?=
 =?us-ascii?Q?VESpPx9pZDDguRA/lEdBvYXQClUyLO857ijEit9ToQROCfthQlqKLkCg+0Id?=
 =?us-ascii?Q?DYjqV6pyOGj9yrbyfDTyByyXUy7TJqfwWA4wFajs+g6vnuDq/YAx4ugaerOo?=
 =?us-ascii?Q?s1N/xO5J4Wwov1ENXLk/uM9JfX07TDpI8R6+vkJfRu4PuJAvajuqgsRJJpgj?=
 =?us-ascii?Q?j7HqMo0+/hPzXAYaMwq2SXFBnEn5dx5F1uHOfyQlWaL3oXya+xlO2xgMLxx7?=
 =?us-ascii?Q?3LnxrLwbyxtfParmwSpB5ZQEw3G1W35wNU8LQT8O7qp0x69j5MyBX2bVKl6p?=
 =?us-ascii?Q?PXMEuGmv12SQztGtOXD5i8TOLhvulbRMggORGDhRietSWh0td+taSrAu+dYL?=
 =?us-ascii?Q?M1C1SPAU836D5qfNCb8YoTFRj/PCjpwGrK1NDomWJ16yDj6pefZaFLV6VNfB?=
 =?us-ascii?Q?gUEUtWUxYXt9GokDLMpzKTM9G/a/THyhq8rU5qOLBMmP5ZYk6j7G+pGDTo32?=
 =?us-ascii?Q?rYBnE97pDs4yOyR5af7f2Yn0dw5YoMUhrx0NpjQ2D7eHaMJ8hA/sl7hyd+qq?=
 =?us-ascii?Q?8h6BZMeNmVoyXfIuvyLkNRIypJATuDMWhIfuuGQWm201XuCx+Y/Lgl8Fh4Pi?=
 =?us-ascii?Q?PNt3YkKHo38/+RvjdyT+vJK9E7GAjOtXOJZgU5h3YaxpntpNPcT4qLjZAgBc?=
 =?us-ascii?Q?Zs9cjRSCAePodIQCqLhDUEV8gBdLoq32TS7HgtELNNNiuGecoxA8f+Es5obU?=
 =?us-ascii?Q?aSv54v3//DNMEYvzqTRp1J+/rsz3VocJgJPqKc990qqQuVk9MLVsxt4jweVy?=
 =?us-ascii?Q?Lu4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xMUVN85WcNH1itLMYMww5oEOBGPE5r2iOpUUlLXyFEz2QhXu1EffifX0lRY/?=
 =?us-ascii?Q?3df7lLsbIcVXc71+/IRFdxNDrt+hSOLeVmMU7MeTvXQGA50Xe3C0XDKEHyTE?=
 =?us-ascii?Q?OfgssGkcUOBK6LU6+FeHlfAzl03tgd1+tKK0SJRGZ42XGKVWkelR4UDEHhtv?=
 =?us-ascii?Q?Sib86BNA4Ibv7I8M6938aVw9yAmBjREDFlkGevosHJi70nITUwT5BsNG1sOG?=
 =?us-ascii?Q?0yw6EietE2TS/WwuqO/f/55Y6eI5PTolSP+zxJVDAbVJNYbQ9OU6vaRlQn0l?=
 =?us-ascii?Q?Vv7Qge3IJKA2dyuJaxlvFCMzy20hjZM7+1zOY/UidwhZuAYqGovVfpjFpwte?=
 =?us-ascii?Q?9vm6I/446qIhwW22/V/Fy1hQVtkS0/C4PVMYFAxczH82g7XVZ448veLloxHc?=
 =?us-ascii?Q?cgdVhRfF3KgjOi0J57N39Q/IcPrxronQdRhrdUOYs63YbwiJR8yTecqvnK9D?=
 =?us-ascii?Q?FBm+Y+Spx3SF9hl84ySCiT/vwAwMj64/F8uKKkWN1BsMiFSMIFaC9Fa3n48r?=
 =?us-ascii?Q?+/GWf4gAxnbVpX9drRrelHripSF/La3JmkvLBTx6QnW0Wgdcd4UDcQjLwxNT?=
 =?us-ascii?Q?vDfxi0xHvDYuAITQ653e1iRh0EpIRftIjN5okZjdvg0Q+qiSQ5iStIxB3hjp?=
 =?us-ascii?Q?QKUrb6H3FSU6klJNPxUc5QFFB5gPi8oNu9duaSY6SnI1m4sMElEAV/OhfkzL?=
 =?us-ascii?Q?lU+MtLuSNiH3o/OiyAC/a6MYT7Kll0AOWf10B2dYiqMrkV8m2qKEowZOliKC?=
 =?us-ascii?Q?tCV9xpZ5CxiKiVYsdWPLEw7JuTujfdQ6maEzHtS5tTzoNPgjm/y4kn1QMSew?=
 =?us-ascii?Q?FHNdXafIX67Wi97efFYnwd00URYSf8SHwT3RVqGNgJA/wxUy+TEtax39XAim?=
 =?us-ascii?Q?jgHvz5Qe7Ju7l2WP50wDZ+ay9XV31PnJ5yO8FCC38KzcUgEmVp0gGkazn3DF?=
 =?us-ascii?Q?uz0az8E/DdSQ1G2j5DVthsg/z9yfIAT/8rKA/qbTggKD+5Zub97a/ZNPY3G4?=
 =?us-ascii?Q?b1jgPd7Y44hI9M1xGJ04Xbz3Or7999AaCETeUpZwMlpo5JggwORGLyKWZ6FY?=
 =?us-ascii?Q?QkvKWsiGddl2Ib4aikk8sGnMuB5QFVqyRKfbT9Z9/f1AHqHr6M5h2hMpMFjl?=
 =?us-ascii?Q?1245iJUlOGlFLGNmdaNSqfUb44WQ1Hx4eWpVo6tRW8qCekBpnRRxW6FhB0B7?=
 =?us-ascii?Q?iyqBN8SAQNTjERDGgClxYN8uZcaS1f8spFjs1tuKxbSUuL5GBItwr4imDAww?=
 =?us-ascii?Q?eI07JjpdyHlT+kgn3pmThrwZ9hfSkrU+I66AF5zBYjBVOyPw/+tdRpieqLHU?=
 =?us-ascii?Q?jLepFuJsqPHa5tx12xgfDpak19Dp79ISfF/mOJ/x7r3guwSJcHpMK3E1ttoH?=
 =?us-ascii?Q?lsPuc498Ud89oKerlowoUvgZkvAPHH07aRo9VHGdI7qi0aHMnAoTbF0prV/r?=
 =?us-ascii?Q?JqkCB4XivGh+jYEhhTkONyZa0rLpg0wpovg9w+4tDOtcY4h2H6S30+kQuJW6?=
 =?us-ascii?Q?12HBo03K21krqRF4tFDA09h7WzGYUohoudWQKUFVECnRGp3aKb7+7bbaICS0?=
 =?us-ascii?Q?BZar8TBUjzzvcGrlgEBVUsrUCroVtUVEbfdZMqIdQe471JBffmWzITdPBkK/?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8c22fa-c016-42fa-af05-08dca911d637
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 23:15:25.4238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZ9mtpCToOeKeqBw4ULYP1kihUSmqL09fpA8mWYYCai4k7s4Cpmw6tX2qgiEhzwnSwTBW6b1yqkZvEuGqMKN3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7981
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

On Sun, Jul 21, 2024 at 12:34:27AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 19-07-2024 22:53, Matthew Brost wrote:
> > The size of an array of binds is directly tied to several kmalloc in the
> > KMD, thus making these kmalloc more likely to fail. Return -ENOBUFS in
> > the case of these failures.
> > 
> > The expected UMD behavior upon returning -ENOBUFS is to split an array
> > of binds into a series of single binds.
> 
> Would it be appropriate to have some doc/guidelines in the form of drm_err
> or kernel doc regarding expected behavior from UMD if the ioctl returns a
> -ENOBUFS error ?
> 

Yes, this on the todo list as part of error handling cleanup for both
exec and bind IOCTLs. I think kernel doc should go in xe_drm.h with a
list of errno returned and expected UMD actions. Eventually I'd like to
get this in place for all IOCTLs. I was going to work on getting exec
and bind IOCTLs fixed up in the next couple of weeks (we have an
internal doc of required changes) to have it ready for when Thomas is
back (2 more weeks).

I made this change as we already have -ENOBUFS implemented in a
different failure point for array of binds (BB being to large, see
xe_migrate.c) so might as well just finish up this error code to make it
complete as it is fairly simple change. Also Mesa has a MR [1] inflight
to handle -ENOBUFs situations.

Matt

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30276 

> > 
> > Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_vm.c | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 3fde2c8292ad..b715883f40d8 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -718,7 +718,7 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
> >   		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
> >   }
> > -static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
> > +static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
> >   {
> >   	int i;
> > @@ -731,7 +731,7 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
> >   				      sizeof(*vops->pt_update_ops[i].ops),
> >   				      GFP_KERNEL);
> >   		if (!vops->pt_update_ops[i].ops)
> > -			return -ENOMEM;
> > +			return array_of_binds ? -ENOBUFS : -ENOMEM;
> >   	}
> >   	return 0;
> > @@ -824,7 +824,7 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
> >   			goto free_ops;
> >   	}
> > -	err = xe_vma_ops_alloc(&vops);
> > +	err = xe_vma_ops_alloc(&vops, false);
> >   	if (err)
> >   		goto free_ops;
> > @@ -871,7 +871,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
> >   	if (err)
> >   		return ERR_PTR(err);
> > -	err = xe_vma_ops_alloc(&vops);
> > +	err = xe_vma_ops_alloc(&vops, false);
> >   	if (err) {
> >   		fence = ERR_PTR(err);
> >   		goto free_ops;
> > @@ -2765,7 +2765,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> >   					   sizeof(struct drm_xe_vm_bind_op),
> >   					   GFP_KERNEL | __GFP_ACCOUNT);
> >   		if (!*bind_ops)
> > -			return -ENOMEM;
> > +			return args->num_binds > 1 ? -ENOBUFS : -ENOMEM;
> >   		err = __copy_from_user(*bind_ops, bind_user,
> >   				       sizeof(struct drm_xe_vm_bind_op) *
> > @@ -3104,7 +3104,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		goto unwind_ops;
> >   	}
> > -	err = xe_vma_ops_alloc(&vops);
> > +	err = xe_vma_ops_alloc(&vops, args->num_binds > 1);
> >   	if (err)
> >   		goto unwind_ops;
