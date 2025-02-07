Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F96C02194
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 16:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B843710EB76;
	Fri,  7 Feb 2025 16:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoWHmwxv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C0110EB70
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 16:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738945469; x=1770481469;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d+WDzE2NUqVu2oN/Am/+ZrRjLlM+sbuSmJA+l9BUgCo=;
 b=XoWHmwxv37kRJIvvlXIY9lF/AJrvyR8UFrY7ZhIFAlISFB7Yz2/ynwrZ
 TwzXoW44KyEf1yN2jzI9OXidTBzUQBLT4bjEZHrcpXMmkYoQDuedJHlt3
 tg27eb9hlTR63dpYEA7bwMaffKfPPX9EboOjidzAIEsygXbof+lMJ7WGf
 DC5AfrGWi6wZszD9njX/Cwd6dStqv9cxlOQydarecd0xXtw10iaxhFYjl
 YZ30NCE28S3ImjVB+n4lDLlBzXTj5sMaynIoRGfmhbQdVU3b7Uv8UQjUq
 L9SCWdJUICtrGsVt/3BYEEOrIRCuJfjRQOdy4DuRlaVxjZ9VTUtgZTM/1 Q==;
X-CSE-ConnectionGUID: vpUrTk7IQOuOI8s7+kQ2pA==
X-CSE-MsgGUID: L0iey66vQyWVgwKZG5nPsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="57007698"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="57007698"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 08:24:21 -0800
X-CSE-ConnectionGUID: ozuHFcX6Rguc8Bo5c7tkkw==
X-CSE-MsgGUID: 5plcp+GKS5mk1ZKyR1wS2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="111770444"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 08:24:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 08:24:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 08:24:20 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 08:24:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2SM3dApD8jiwjxkQKF2RIRFvy2oEsNc1VGEjloQIXrqntOmi9/BzXKXpNTRafB/QffP9X4NuXLTUmMk/TLBeeHgPK/UUmp1Sgw6qL4v+GHtt5sbnWAdCaVQw9VYhNTUSmL7HhcBwqtbkbiWiD+gxa77P4/m/QnU5PpcCRg25/fvlw+c41dkETl63l2G6PjShWZRCSAxsAe3AsTZQizJ8stuGhi4cH5+EoYHN0r1qz1bB1xNUth8DUuemuG/oxKcg4kbiYIqvywHHzZrUoDBB+cS9rs5cpZt45t/CuWPrLMv2HLAY57ccaemILzJK6P2gwWvuZipEKQ/HAI004ATaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7J7l3oAhHdjfBC0DBC4nn4Hs7LEDEXWPGLC1pAgD7k=;
 b=y6bfP+vE93p2bJgNfyYEt6RZJsI8+loLgw0VyBQPJpnlZ/mpaBBnPeyA6tA2sw+HZpHmOvlLikHQotpuIhb+LXs522Z8Mu6a4/NcmEahx5rcn4CCbLxf9V5oExR4O/qJ71Ispv479whrkblA8KQ8NSFWE8m+dHIaGR0ZO7iVED0fU8mZJFnB1v2VMT4SoPL0AD+cO5DiaYDwOxhtMh0EQAjhudwQYhdS1DBc769M1XXB9bBRqIMLc3IKn7Qh2lgWoIdlQ5uDxuYeJLj/LxLlln0pC3tLnrC99HxKRRS1AyhMd7n5ce28fQd7mOs4JNSsScLqHEsAeyrKPXCIfTYR2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7291.namprd11.prod.outlook.com (2603:10b6:930:9b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 16:24:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 16:24:15 +0000
Date: Fri, 7 Feb 2025 08:24:06 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Atwood, Matthew S"
 <matthew.s.atwood@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3: Extend wa_15015404425 for xe3
Message-ID: <20250207162406.GW5109@mdroper-desk1.amr.corp.intel.com>
References: <20250129005551.106214-1-matthew.s.atwood@intel.com>
 <20250130173030.GH4460@mdroper-desk1.amr.corp.intel.com>
 <Z6Ttkcj_XWatYkkF@msatwood-mobl>
 <k4s4hzkryw33v6iy77ippwfqpzgvarbey2ac4vaapue4glsonv@3jhaz6lteoaw>
 <SJ1PR11MB6204B568C84D3D28ECCDB92481F12@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6204B568C84D3D28ECCDB92481F12@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:a03:255::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7291:EE_
X-MS-Office365-Filtering-Correlation-Id: a0731d3d-7231-4a8f-685b-08dd4793dd57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+rFtPPXVOSEdsuNSDISvJNfl165X1Qx4jS/SO48xGfhghsnF7O46J00icft5?=
 =?us-ascii?Q?9h2aic6x/CEjbOHwlY1faahrXypwsym4rdXthGfFFKEWec9re5t6cfO/F5YB?=
 =?us-ascii?Q?rZpRJZ14NZRBZK8q2KqtF4bsTYIxQdzZhmxvSiHTf6bZnHVXjRVaIIh3hq/M?=
 =?us-ascii?Q?/8QIYQc80gsx+gVhps37O3OIwMo+7QPyZwVlhP+V+Ean2d23qNO49bXk+aDm?=
 =?us-ascii?Q?w+ov2FWYB8wg41Sapgupiz11dvw5dzQrajoIh+yXyutYC/vPAcwsCYXL0CLc?=
 =?us-ascii?Q?ryMvgKXVX21EV67wWbJvld5fHwq7j1s1P9jGVaxp+huPOniAzdQDSVw/p/g5?=
 =?us-ascii?Q?+/gX+KqJ5WPb8TgCN/mahjIgTDSOoLqQAvGFLKzEy1hBQTzJ7wTuzYK4LU8T?=
 =?us-ascii?Q?+/vKTJRxCjF6RCJlK4jp9rg8jc4hXl4JhGso0xBAzfSGK+Rm5hM0ShDl5r1r?=
 =?us-ascii?Q?eUa1lIQHv+jYkb8OzwaNBGBBCuGP56X2fB8uLX7ujLjV3+zfm7g1gJ2bFVS4?=
 =?us-ascii?Q?E6soFMaq0uqCzPFCFEpUxW/LJUgc7Hh1wKXunVP8MOUi7C1otqrtH2QbiYnb?=
 =?us-ascii?Q?owP7uY5Ad6/VqiHyJEiT1Ntqy5x2JsNaD2xH77dqQKnF0eCETD0Jwa7QyiBD?=
 =?us-ascii?Q?L3bsIWaEVh7cqOK1CaVy8Ms6CVv0pq2IewUqgbulXNbNT84tIbTnIaP5N4Gu?=
 =?us-ascii?Q?EUqoXaUF92aT1j2VLarJARFRpzYIBJEuv9UqxbQTjA15fjDn6+RCUGuEPdNg?=
 =?us-ascii?Q?3YSHhXlTBROR0Ic975k/kcMZ91VtJ3AW/robdGWX5zAYSGLdgTq9UZhtljQ6?=
 =?us-ascii?Q?ao+q99cSd3YnjWXXP/QMA9G4qZjgYd2RBhqFhNhPUIQoxNgNwnGzLN2moLfn?=
 =?us-ascii?Q?oJCbYRk4PiqW4rOYuCtaMCvfNG6sZYINsFTeSVEpJ7F1fZc8npzQEhWFgHsU?=
 =?us-ascii?Q?GMUGegw2JF3oAEz06WyjyBtz4HlqXnDTKHFeIDUmb0cYQ6yQFdnlRiC9XeF7?=
 =?us-ascii?Q?M7Vw8ZWiJ4epsZZa20l7kynplcQgu0YZzwDy5IZKfBPu9RnaeUeWf1ZjICLm?=
 =?us-ascii?Q?64SwVWg8Or9pF0Fv5kYED7RxI678etdAr1BHD4labuP+UIEgZ2L88jAiBLi+?=
 =?us-ascii?Q?7l3EMBmGIg22Yfc7WovLl/XSrxzpEcF1FoW5tErr7h4mIVXTiKLf9zIwiJwt?=
 =?us-ascii?Q?qE4Mappau5QhxNTsD0AAeUEp7He4KAyr4wQQq/Vs/sifWUY73hggQnlytSJO?=
 =?us-ascii?Q?eJACX47DvX3pSkBCmYCIzIyzxUcLf61Z8jRTwJzI9PbkolSS0QezfRgKgnx0?=
 =?us-ascii?Q?CZjk0bekdvuyfzw2fpbmd+k2HXEEr9WwwmvM9Qj3+BaxxurT9XdHDvcXPMmZ?=
 =?us-ascii?Q?Xb1OkKoyuMIOXqcT4TJEg9AeryJ1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mCONQ3iRRvEAPtz52xMVQn8A1yqp2BmB+2ivf2EJa2a+O4vB03cHa+7LKV1Q?=
 =?us-ascii?Q?rFokUWAyCSFw0CxqbSgQwUIx7aGmsHN/038i2H2W7pAGuinqtSHWL4cUCiCM?=
 =?us-ascii?Q?J/Z+IojAUeQBFgIqrEdM7UwMLVxNzrSYNMNEgKa4H9B8VHehuUtv9681nzbt?=
 =?us-ascii?Q?oZJJA6/jmjLXhM0/GGSa0FgZ95K1ZuBNmvGBj1zumwMOjgtbt6azfENpMvsR?=
 =?us-ascii?Q?gYdCHMlMrA5S8CjjATwKtt3J4JXqCZovF/Oebm15Z+DRqHmPoqUKYra9DE9c?=
 =?us-ascii?Q?ZVfurKLfcs7G65lekRlMW3cxa65EbwhNjOOuD+hgcnazPJI0z6SD0+/CveIv?=
 =?us-ascii?Q?Hw+OAj9SWXcs5ZZaAsezCp9qzx0YpRPtQPbz2jR23AUM8qQtlscnThyvjo6r?=
 =?us-ascii?Q?Kq1kv+haxfPysfsd3uWthAor1ZocoL3cnywy2DCx+l/KvWQoRIxNLT00GaL9?=
 =?us-ascii?Q?xEcjatbjIT+INqidpNRQum73F/IEb68ylcx3HZolgjcyxPg2Q+IJO8g7hnK5?=
 =?us-ascii?Q?AD2WiLQmnABEGYh2rJk5QFzHzPaLzs5F3edIZas+gaIr0aVak3OLYKUPpJZq?=
 =?us-ascii?Q?hwE40OyMCgbH2Omld3y4G9gJ/S9tpt9oR3mDICDtrfytdf456cNaNZ93ktWq?=
 =?us-ascii?Q?0jccxm34VeR2/mucI8B8K1qlUyIPsAHD5XgnHvt8ID2+ccg3EjrOcmG3DqlG?=
 =?us-ascii?Q?y2/AIRbvV/FHC0HwsbTrFH+f0MmqEVUNT7RyArYPLgUmduueMwgew+kgAbk8?=
 =?us-ascii?Q?0RSeR9hh8Iro/AakDLzy3BpUMyztBcrH1L7rBM43nRB+0agVRtIoqR+lAAq9?=
 =?us-ascii?Q?JZl3V/FCeEERjNB83cVwfAZVXiBd07Bkmu28yVEVjqEgQEP8DonCzmDoj69q?=
 =?us-ascii?Q?5tse52HRL2wPjSuwaHAd7ZHsRWdKSvjfz4mAtb6gqJL66g3uP+siBgWfyvVh?=
 =?us-ascii?Q?7bKP9QvOj+OnxNbwPyzvZHq0X52q3+4G3efdV+LGH/JW9iYMLghHa1dkIiW1?=
 =?us-ascii?Q?KfGGLF0UEFciw+vlrPPixvve7pP+HcRM93qTmdv2kPLxo2tYdNUb33NaqpFl?=
 =?us-ascii?Q?vYKprg4A4L1t7aX1AqY3GazZntYXeFkXt7Q+x7xpJEYHJYoMiUcMRCzRLDl8?=
 =?us-ascii?Q?kXzRUnmBr2DO8ZcoKd9222WG2fcsnFiFlQo6cfwLvfLGn8s1r4fFy+1+KeJQ?=
 =?us-ascii?Q?Ku7De1q9g9KfMA4rb+DiUOc7rDkPJR1wO10bOh35MW0OiqzTv0KeAzIhfkAa?=
 =?us-ascii?Q?1CzSjN/kXmuakCSZ67szVNU3ulTiy0g61SqOKhwFR+1FZe3EIajeOqb+7PZ0?=
 =?us-ascii?Q?V/7QR3fSkPWIC1l7+mLs9H9qsoUltE7Rf3rcafNdMTExaOh5VPtM4Of35gXd?=
 =?us-ascii?Q?t9T3wXbUCxx/IgYj9oFDmbDKOPhkOoyyWPztdxc6xwwx4Ht9Od/2BL79/bJ1?=
 =?us-ascii?Q?2321+uQLNQCfONrqIcpOhmHyzHapuTo812W5W4kTGeQiVREO2gWBjUkm3v7i?=
 =?us-ascii?Q?vXxT7wknGJkKu57Zg956VxYuckThQPjOEKitw1hAjM8B4x6n4Esg6ukCUkEN?=
 =?us-ascii?Q?mtlSLDuaawmW9fcnwg2b7JmiSlUsc1l+2qtpXnQ69iwVYSwBxqBWok6nJ/t5?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0731d3d-7231-4a8f-685b-08dd4793dd57
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 16:24:15.6853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xzKkOLElYyzNbtojuh93aWvzZXQP1/0ExE4kQrp+tlpFHh8iEEw0ew4OTVafeuabVeTYUYUMA5Wg9Bd4UP8SZDroVOydbS6UxJbRnxKP+gQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7291
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

On Thu, Feb 06, 2025 at 08:56:32PM -0800, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: De Marchi, Lucas <lucas.demarchi@intel.com>
> > Sent: Friday, February 7, 2025 5:03 AM
> > To: Atwood, Matthew S <matthew.s.atwood@intel.com>
> > Cc: Roper, Matthew D <matthew.d.roper@intel.com>; intel-
> > xe@lists.freedesktop.org; Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Subject: Re: [PATCH] drm/xe/xe3: Extend wa_15015404425 for xe3
> > 
> > On Thu, Feb 06, 2025 at 09:12:49AM -0800, Matt Atwood wrote:
> > >On Thu, Jan 30, 2025 at 09:30:30AM -0800, Matt Roper wrote:
> > >> On Tue, Jan 28, 2025 at 04:55:51PM -0800, Matt Atwood wrote:
> > >> > From: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > >> >
> > >> > wa_15015404425 applies to xe3 A0 step as well.
> > >>
> > >> We really need a better commit message explaining how this workaround
> > >> is different from our usual ones and why it needs to be handled in a
> > >> special way that's different from all of our other workarounds,
> > >> especially since someone who just quickly skims the workaround
> > >> database without digging into the details is going to incorrectly
> > >> think this just applies to Xe2 media and isn't relevant to PTL.
> > >Ack.
> > >>
> > >> I was kind of hoping we'd add a more well-defined infrastructure for
> > >> handling device / SoC workarounds.  Adding quick hacks like this is
> > >> going to get out of hand quickly if more of these start showing up.
> > >Any particular ideas here?
> > 
> > at the very least, use XE_WA(). You may need to extend the matches it knows
> > about to implement what you need here.
> 
> As far as I remember, init of wa_oob was little late so we could not use XE_WA. I am not sure if init wa_oob moved elsewhere and we are good here!
> 
> I was seeing below assert and thus we decided to go with what we have here,
> 
> It asserts,
> [  778.229096] xe 0000:00:02.0: [drm] [drm] Assertion `(gt)->wa_active.oob_initialized` failed!
>                platform: LUNARLAKE subplatform: 1
>                graphics: (null) 0.00 step **
>                media: (null) 0.00 step **
>                tile: 0 VRAM 0 B
>                GT: 0 type 0
> [  778.229121] WARNING: CPU: 1 PID: 1567 at drivers/gpu/drm/xe/xe_mmio.c:133 mmio_flush_pending_writes+0x33d/0x350 [xe]

You can't use XE_WA unmodified since it's currently GT-centric and
relies on various stuff in the GT already being initialized, as you see
above.  However you can either extend it to also support device-level
workarounds, or at least create a similar XE_DEVICE_WA() framework that
works in a similar way.  Device workarounds ultimately depend on the
platform and an SoC stepping derived from the PCI revid, and that
information is immediately available on probe without needing to bring
up the GTs.


Matt

> 
> Tejas
> > 
> > Lucas De Marchi
> > 
> > >+Lucas
> > >>
> > >>
> > >> Matt
> > >>
> > >> >
> > >> > v2: query based off SOC stepping
> > >> >
> > >> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > >> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > >> > ---
> > >> >  drivers/gpu/drm/xe/xe_mmio.c | 13 +++++++------
> > >> > drivers/gpu/drm/xe/xe_step.h |  2 ++
> > >> >  2 files changed, 9 insertions(+), 6 deletions(-)
> > >> >
> > >> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > >> > b/drivers/gpu/drm/xe/xe_mmio.c index d321a21aacf0..98d068ad33bb
> > >> > 100644
> > >> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > >> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > >> > @@ -150,14 +150,15 @@ int xe_mmio_init(struct xe_device *xe)
> > >> > static void mmio_flush_pending_writes(struct xe_mmio *mmio)  {
> > >> >  #define DUMMY_REG_OFFSET	0x130030
> > >> > +	struct xe_device *xe = tile_to_xe(mmio->tile);
> > >> >  	int i;
> > >> >
> > >> > -	if (mmio->tile->xe->info.platform != XE_LUNARLAKE)
> > >> > -		return;
> > >> > -
> > >> > -	/* 4 dummy writes */
> > >> > -	for (i = 0; i < 4; i++)
> > >> > -		writel(0, mmio->regs + DUMMY_REG_OFFSET);
> > >> > +	if (xe->info.platform == XE_LUNARLAKE ||
> > >> > +	    (xe->info.platform == XE_PANTHERLAKE &&
> > >> > +	     xe->info.revid == PTL_SOC_STEP_A0))
> > >> > +		/* 4 dummy writes */
> > >> > +		for (i = 0; i < 4; i++)
> > >> > +			writel(0, mmio->regs + DUMMY_REG_OFFSET);
> > >> >  }
> > >> >
> > >> >  u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg) diff
> > >> > --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
> > >> > index 686cb59200c2..879486a818e9 100644
> > >> > --- a/drivers/gpu/drm/xe/xe_step.h
> > >> > +++ b/drivers/gpu/drm/xe/xe_step.h
> > >> > @@ -20,4 +20,6 @@ static inline u32 xe_step_to_gmdid(enum xe_step
> > >> > step) { return step - STEP_A0; }
> > >> >
> > >> >  const char *xe_step_name(enum xe_step step);
> > >> >
> > >> > +#define PTL_SOC_STEP_A0  0x0
> > >> > +
> > >> >  #endif
> > >> > --
> > >> > 2.45.0
> > >> >
> > >>
> > >> --
> > >> Matt Roper
> > >> Graphics Software Engineer
> > >> Linux GPU Platform Enablement
> > >> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
