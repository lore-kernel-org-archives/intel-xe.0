Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD17AD68BCF
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 18:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525D310E8B6;
	Fri, 15 Nov 2024 18:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWs8SyEH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE0D10E8AE
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 18:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731697016; x=1763233016;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zcHXKsrIJwVgyZqF4H0sPUxLdPuzruH1DdHK8uyyx6c=;
 b=ZWs8SyEHXTYjiZ+hY7S21uLxuHiorct8OjVwmgZQfxhjScTuImqGbTJN
 txvCFvhbm4nlr+FtmhM5bVUM+AdWfcx+hfE73sWbKf/azi5ASr+K6EDCM
 0E3uwmP98vfeCNx218oURPjkjUCVKX0++oTs0JWiL+rs8P8zrqqIttRjo
 tF2UitAeA9o6PmGxffmW8wREUCbrpI2JQz/LfftgBKG8ta91YLoiR8tE5
 IRf28mrtIrq0ls+3dIqjwdwN7ckutTh3m+/nxwBRm4px5mH4je6qIZ4CP
 SU5o2PWuImvFNeJdY3n1bBblAR26Tw6uyhJ8B5Ki/uze22GqPbXPpuxs+ g==;
X-CSE-ConnectionGUID: YHk5VUYVT22egWeM9xlluA==
X-CSE-MsgGUID: NC8BH5rNR7+tcRcrzUC6LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31849616"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="31849616"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 10:56:55 -0800
X-CSE-ConnectionGUID: kuUkKVAvQRSw4WW6AQVqDg==
X-CSE-MsgGUID: Kpwjuwx7SeufHWvQ+BmW4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="88221949"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 10:56:54 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 10:56:54 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 10:56:54 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 10:56:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y27le2jmw231GGHUdgxvAe/VWk2eG0cPExtk5rX02vfnx4u6E0rc1H/29/NwL3m48VXAaBcNGvkS/4ryXNQDqtlIirDA+XzPfiLEl3/oMxRruHZGZIjvoamdtNC6aT/En/kBQIROzNHqepxpxxVdraO0SpcZ59/7o89cKwlYBsw4bYyLfVGZ0i2nBfcvhKvH7Ndg5ifiLC8s6OQ0Ks9my8dCbI+dMHPrtwroCckQ0/h/Mr9SFACN3dyGT2ZYxhbN4isdhKzZvZS8pSXaaGmNtPygEzdsJrH6xF97YjFedbOb65QccpQ8Af54F+Y3X4WTY4eMOslRhOqfBT1YnGXNoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2NH5BP5A14lknwY4mH0TvmN/wnDI446XGIIl6o77z0=;
 b=NVESlJDxbAB75sIb0Z/un1uY62WIzYxtbHN9Q3u7WKPNzuzmtl3B1j8eG11mY99xPxdN9o2rsiI4ctPXuTh4EEOzodPKfHkjNKB2XRssuptLvG1laRkyX53jQCxbg4q6yeS2ca7WarD5v5Si7YY5rPjUaYhZumtCmhIr+VLSLZjHpKQBJRUtlp0Cu2qwxL13TW3lh932wfuYsPEXmUu2T+1fk1/6kC9aIUFhr8afrFBGGqBcJhITcGuEhbR11VfN3u86zr6Qr9nR8WGmzHVxozM9a+11wCuTuwsZnJkIYHvAncQb7BamJFiTF5OlBVZV5gFnqcfdVu2LwLNIHwNtPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SN7PR11MB7138.namprd11.prod.outlook.com (2603:10b6:806:2a1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 18:56:51 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Fri, 15 Nov 2024
 18:56:51 +0000
Date: Fri, 15 Nov 2024 13:56:47 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>
Subject: Re: [PATCH v1] drm/xe/throttle: Log throttle reasons
Message-ID: <ZzeZb2tTgbeshyLj@intel.com>
References: <20241115125614.857611-1-raag.jadav@intel.com>
 <d81e0758-95f7-44bd-a899-252b0b9a60ad@intel.com>
 <85a5e0y5dq.wl-ashutosh.dixit@intel.com>
 <ZzddcQoXLFGNwfOZ@black.fi.intel.com>
 <858qtky28u.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <858qtky28u.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:303:16d::20) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SN7PR11MB7138:EE_
X-MS-Office365-Filtering-Correlation-Id: c17546f9-376d-4e8a-d929-08dd05a74382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?haNX3uSkJ+rcUQpG2WU04EXh9iJAqDDzu7TwqfWc4Or3X9hAjlgqZTV1pRiO?=
 =?us-ascii?Q?n7GVHWcCbh6jB3gPBepKOrI4ECrCNlQ7m2YUATfmNGpWMHTgXNOAHGfidJr+?=
 =?us-ascii?Q?O+cyuu6+5SbxI+bXRpdASvfqjFQPcaSGT4Fj4VhJZKInWbLUVVpP1/c3/Slj?=
 =?us-ascii?Q?z+M4/CZUi3YbYuEFaGoEl8HR0WCzmjEDtJvubdomhvbaAM5uIH23e/JShtlf?=
 =?us-ascii?Q?6o++0gDdhYM0aBTFMBKlneHtoaKouV0bx1mr+8ZFACb2ZrmCIgQ7zhtumaxq?=
 =?us-ascii?Q?vW77gu1i+qkZyQ8lmSvGTYmfa+MuVApndRYFIpcKtGXX3gUoK3foujKBK1Lh?=
 =?us-ascii?Q?5CQkuQOEBOSMszPui5FkpsmHPfm2xyYBOM4kM/uOJHgHiH0bJhP0dbXoYmm1?=
 =?us-ascii?Q?PgwcyD+5NeagBsNCgomsOzvEYMdZv6KJm16bPisXfR2c3I0J3+zaa+Z1TIso?=
 =?us-ascii?Q?ResGDfQ5ioOqp0Ofw2BYU9XCy8Kz38QP1uBM8iNfX+W0wwxk6fyaHk1U7wYb?=
 =?us-ascii?Q?oRxhtzsbqWmviGSAHgV2ZRLK2YadUfPFtTeciUrnjFXuQB1mGK/lmwC89SjI?=
 =?us-ascii?Q?dsU4m5cqkUa2imUK6KXeWntk8xTEU+byL+use10hQMRKyUjwfL51YXcHJlTe?=
 =?us-ascii?Q?woIACa2c7bBeH6FRp2/4lyMyjblpqnTUPi4IJLT4Ql3h0tr8t7u5TlTNQM9Y?=
 =?us-ascii?Q?eHETWLB2k8LPmsiiy8YLkjYU2R31bFfXpK15xutBZ8v3F3ZfFrKXyQ4DFYZe?=
 =?us-ascii?Q?E2elK1+lnXK1MdWuX1qRBls7qzPQNAqzsPisBcoyd835lOj7TQZEjcmJgopL?=
 =?us-ascii?Q?1YZVeiEC7gfj80cxc12u4aXLJ9grhUyLKdIdW6zTL6CFV1raY3TaKDzwKk+r?=
 =?us-ascii?Q?rjZKqf/rsYbSyOtYoiwcIl9tGF/KCqtq1z0w29/5CaQI95P0U0ETB7sG/AZO?=
 =?us-ascii?Q?XbexnZJSjC6yg50/NzcuktXHwvJQP08OHPgRA3dZxSJCKq6apvo8kb1gOS67?=
 =?us-ascii?Q?q6VGZge9W23X3zGviVV3NLSNwZlZj5Obq7d6wejjd6Cch0b1wnRaF26wviW1?=
 =?us-ascii?Q?ieuuIn6KvQQH4gVHswbn5ZHdT4+ATvymg28z69jbH0TkPO02rQiaMXn6OlM0?=
 =?us-ascii?Q?Ow8WXPklG/gt0EZsrcUJlbpaXq+hKHC/C2PaKTLINuvLBW+iqhD7ec4Ztt0A?=
 =?us-ascii?Q?w7aYmDbZhKqbU+aHh159ipcomTveMPpquPhlJz1hUkQxGMAEW3xWT6nhyDlr?=
 =?us-ascii?Q?GsJnz8omvEaG2k7yg9rTq7eFSYu8uRmRBrQprGY7TCyU2NiMtvAI1nNhgfRL?=
 =?us-ascii?Q?CbzOI4V/DE4aXTH8MNVZ6BzV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zlQOrlx5eMh61OI5ek5KTvLLj9C2YN/u2e+t9WNas0p4thUXYQbe4lqWgYlO?=
 =?us-ascii?Q?q21HsgS2fxVYdVmyItJKYJqyppMFbVYpGsPhJ4n7Tnu3qpge2Rsh1drs/fg8?=
 =?us-ascii?Q?6PGZgEtxXPnBndNN1yfdg2scmKL9A//y1i09MrNRA+D6d+mbB89BnsLuUx6e?=
 =?us-ascii?Q?5fgpE3rUU3SeeA0ke/MnXMXXsuOPKLM3lNOyhmpveNVXQVYf9Ekoymozakd+?=
 =?us-ascii?Q?NbLcbYo21ftwbS80waoem8UqaKt9Z0BBPfVCANN+D8Re+LeV4nKGSvhSu4w4?=
 =?us-ascii?Q?YbSjq3s87ZNTLGCnXGWAqgmap0FdASg/QhvCBpMkTgYVLe7rIFymC+6MKnPa?=
 =?us-ascii?Q?IbaBuLDu2bWXrLJOVe/bQariLHJtnYyLmGMZgVL3hstwn94y4XcPoSVNsVLw?=
 =?us-ascii?Q?d8DceAachv6AOKrDLckqxupzmoRsVoAwVccWSknrguGvSuyOxlWgN5PP7j7L?=
 =?us-ascii?Q?hwxZrlVcO1CZEOp34RpgrSNc3oELtVmCo0EHIqoLxmhy9ODDlUSgT9ayiiKA?=
 =?us-ascii?Q?Zw3ZFoHKV9R+NPILO44kZcOxKaGg8UQWIpq3MnLSCenP2MxgVThjCi9d7q/M?=
 =?us-ascii?Q?qoxbaTgxPPXHaknvRaxa+Oge5zB/sdfBJBqXcrIukBYc70xzH1QTBfZv0pqC?=
 =?us-ascii?Q?TJy/kI1sSuPeswjoOa8rPO4pL/UvivU3egkiLUb+HD7bkYlNoBx+piHWoHdS?=
 =?us-ascii?Q?lWAts7b4M1sEgFtRnybQu1EH1nt/XsS5mPmBu76LUoxq32MyA/UzolB4miXk?=
 =?us-ascii?Q?SO6BtEnvej2LP8Ybf2iUx574iRMtFltiv4ZGG96YS0Yw8azF3RsIVENnSsiT?=
 =?us-ascii?Q?aslKKphOcqSpORJojqve35e5SfYJHTMUZGgGbGc581sUHWdoZ70xBn9AkRzU?=
 =?us-ascii?Q?qile7qksrlUvqoL4u2zanopi1bTOWomaM+udEAyaXZoWn7nlUPcsOWrfUss6?=
 =?us-ascii?Q?GuRiZQJde5sV3VPJ4V5WyIjIiXD1o93pdza0O2yVhf9QZM3p1nGbhwRqoD0j?=
 =?us-ascii?Q?KK7ErheDS8Ysv/SJNkXt5puSyxBY6N/UVmkgh/32PERV8XGBqRT8HNNsxmRF?=
 =?us-ascii?Q?hnjmC/9t4bQ7G8NqaTLQ/r2LZwIZDMYFnszNVkkQ2gcqONUBJTW2rhsTtdy2?=
 =?us-ascii?Q?IJ0auJirflyER5zpMLMriXE0aE+pRjgMrzDyfbztnrd5H6qUumNkGJlDKnoR?=
 =?us-ascii?Q?54eNOcvMVv2gLru+TVTGq2r8Y2BiOVbXux/XsVJqBKggiTT6LL2dTY1YGMIm?=
 =?us-ascii?Q?krUrOwls95RLgN9astHJe8/zELKjHWEKveBRT0DIEEdD/sJwXF9g/IUm/IBV?=
 =?us-ascii?Q?wOLrqv0oy9FP/xOKs66LuA0wW73atAoGa7B+6PMvLqw+OS/sOd96ctrQwl11?=
 =?us-ascii?Q?+8fAlHRy93yELeihFztI7hiZ0MLvu06sInzMjaLUzwmdLSBqD48Jf4ka4fa7?=
 =?us-ascii?Q?yEXsaeoJgsmhgdlcXtgv2c2HpK9ipCHXnid8Bm1laMfiY9eZXPpTN/0xwtry?=
 =?us-ascii?Q?IdfU7OL/Z7mJ/GTV18CAQFPYNmbJqL0ytUqjgxxQh1l3YKfrwnrPCoVBfVax?=
 =?us-ascii?Q?DY/dnXGFH9i8zErCGDeXzK/SakqniFQfvsRLN1kIdU55mvW4aBbQA0bccI2+?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c17546f9-376d-4e8a-d929-08dd05a74382
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 18:56:51.0083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iM4FZHIufzWcPyiJcBmFIbReEcqqa2T3xivFNYFYPTNGq/0OKOLtjga96aiISNQdm1TJHM43ZljBLXZljMqjyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7138
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

On Fri, Nov 15, 2024 at 06:56:33AM -0800, Dixit, Ashutosh wrote:
> On Fri, 15 Nov 2024 06:40:49 -0800, Raag Jadav wrote:
> >
> > On Fri, Nov 15, 2024 at 05:48:49AM -0800, Dixit, Ashutosh wrote:
> > > On Fri, 15 Nov 2024 05:12:08 -0800, Michal Wajdeczko wrote:
> > > > On 15.11.2024 13:56, Raag Jadav wrote:
> > > > > Log throttle register MMIO reads which will be useful for debugging.
> > > > >
> > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_gt_throttle.c | 9 ++++++---
> > > > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
> > > > > index 03b225364101..0ce21ffc08dc 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_gt_throttle.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
> > > > > @@ -37,15 +37,18 @@ dev_to_gt(struct device *dev)
> > > > >
> > > > >  u32 xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
> > > > >  {
> > > > > +	struct xe_device *xe = gt_to_xe(gt);
> > > > > +	bool media = xe_gt_is_media_type(gt);
> > >
> > > Also not sure what the point of these new variables is, previous code is
> > > fine. I actually prefer it to the new code.
> > >
> > > So this patch should be just a single line of xe_gt_dbg, IMO.
> >
> > We normally have temp variables for repeated uses. Makes the rest a bit
> > easier on the eyes.
> 
> Disagree. Adding additional lines to do unnecessary things makes the code
> harder to read, easier.

I agree with Ashutosh.

I liked the Matt Roper threashold: new gt/tile variables only for 3 or more
calls inside the same function.

But also, in this case here we do not have to print 'media' this information
we already know by knowing the gt. So, just use the gt dbg variant as Michal
pointed out.


> 
> >
> > Raag
> >
> > > > >	u32 reg;
> > > > >
> > > > > -	xe_pm_runtime_get(gt_to_xe(gt));
> > > > > -	if (xe_gt_is_media_type(gt))
> > > > > +	xe_pm_runtime_get(xe);
> > > > > +	if (media)
> > > > >		reg = xe_mmio_read32(&gt->mmio, MTL_MEDIA_PERF_LIMIT_REASONS);
> > > > >	else
> > > > >		reg = xe_mmio_read32(&gt->mmio, GT0_PERF_LIMIT_REASONS);
> > > > > -	xe_pm_runtime_put(gt_to_xe(gt));
> > > > > +	xe_pm_runtime_put(xe);
> > > > >
> > > > > +	drm_dbg(&xe->drm, "%s reg: 0x%x\n", media ? "media" : "gt", reg);
> > > >
> > > > we prefer GT oriented logs, so this should be:
> > > >
> > > >	xe_gt_dbg(gt, "....
> > > >
> > > > >	return reg;
> > > > >  }
> > > > >
> > > >
