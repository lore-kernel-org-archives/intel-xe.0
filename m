Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F8BC021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 21:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAB310E7F7;
	Tue, 25 Feb 2025 21:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBLB4LH4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0DF10E7F7
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 21:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740519401; x=1772055401;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K0KrJidihhbTQpn3yX/SwFBSuIgZIbA8mh91jNrwK5o=;
 b=bBLB4LH4RGeLsVOHlGNJKVJj8l3QpSZlsbwUtdsSDj/gNMR7pgxlUEma
 t8o5OKrzB13V0HOl8xyEt5KUudpip1oit3CrxMqcTfyLKB9lteJ4ZvtPs
 rm5LAM8VGFOpT/2dfm/SrWFfUrfNOOz2XrLW41Kv+UUTSp8geTPX9REpA
 WPk9gP5DvUWqhfDlQfPnhmVp8OxtCngMHd6oBLAXOGNSwOzHCgvVCgYaN
 28PVfiFEnytlo8g2VnfjJbDkFqypytULNdxkqhh7yjUPe8HMUeYKOkF1T
 EmdGMTwI0JS8p9H8WidNDuZ5uJZdQI2CyKnxFiLlJaaDJjPQ1s8VHAQO7 Q==;
X-CSE-ConnectionGUID: f83dmEXeQjioSPV9JKnpUg==
X-CSE-MsgGUID: b6ROLKHVQCizsqCBGOH5NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45261390"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="45261390"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 13:36:41 -0800
X-CSE-ConnectionGUID: 8qC6TCdgRLmy7WhhgoFj3Q==
X-CSE-MsgGUID: Z8e34mTMTHyvTOGLjCE9iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="139747602"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 13:36:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 13:36:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 13:36:40 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 13:36:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+nWHf57KXvtkyWw/Wx5OF571zcCXw8bxD1BVP23Uy2T8jd0hEhCJAk8kppokxcYrJGc5L5Px5wx9w91Wac47WJ6AgdvKCKi6seUBGnDzp377w34zl0EMpAAnm9XEOWK9JsuP3zmsmKPCrh5zyr22mUY8DIFS+crctaniJDiHzs1hym9hDV/w0H/mphQOcqAyiTCYfIvR7iXOEzgSmyc0N27p7I+PZSxCosHGJXmE8DKHjtbYkpr5dTzo7fMdI73pwrZCwrsnd7AwgI6HovKkfTTzb5LytRqCZP+DxK4b/JbXJGyK8OJ5DbbYZLLW+/nLncCZlC4nNTey0j6ymW5tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwM5P+zPI1KkQEEvA9gUOjKgnZeAsQwgpH90Zms1ofs=;
 b=w0e/oqF9/FC/YXQ+d6P/mEU8Qux36FUAlE5K1Kajy3vak1nn/Ly/VoMfw+SFX6044LjPIB2azqlDdaQ4UJwrmiuWbGdt6PLffNW5FG6U4pMn8huaCGsy6fdkzS6ZSnM0RHr0mXrUVUNdKh/tEiLAMp8QOQE0gFJjJAEfhZtcBkrQypFDxOvlxBN2TYwFLHsS/KK2mzU9hkNqG27LHCSR51gK9UbMux5pb5xRuUYEVXd/SySpXikBhPZ5pKj5XvyThGS2ucIN0gRYbgJ18QEd84yUYa3w+4y2gal7jYbKhr2oqgKns1BxUccvVECoGPqUvi6eUsaz9sMm6iP1JEATUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 21:36:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 21:36:35 +0000
Date: Tue, 25 Feb 2025 13:37:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <Thomas.Hellstrom@linux.intel.com>,
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Introduced needs_scratch bit in device
 descriptor
Message-ID: <Z744I750MiBiBS+z@lstrano-desk.jf.intel.com>
References: <20250204184558.4181478-1-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250204184558.4181478-1-oak.zeng@intel.com>
X-ClientProxiedBy: MW4PR04CA0356.namprd04.prod.outlook.com
 (2603:10b6:303:8a::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: 889fd7de-f3b9-4e9b-1880-08dd55e47aa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HyjbbLUay0lcJKFt24Ua8BR0QUWJrZeDsdWp0hN2mL0cYAuWwbpw8ZNngfZP?=
 =?us-ascii?Q?9QViGyLcQNSguKZCpuxEyJ9EwfDYhlY4eBOcwvRVt6hYzmk9rgbVjoYpWNFn?=
 =?us-ascii?Q?P3OXF2PIqCn2KwOAcjh/wFxH52Dj6uZUoLSVnbOfB6dKm3AGfjkYxkmsD8sk?=
 =?us-ascii?Q?cj2BTXnfTBiz8cB6WDEWGUF+frUMzcn4B39e04aqOdgVH0OpRQtZdBeAAYRQ?=
 =?us-ascii?Q?DVYZ4EkwJxnAVVMN3prMrTESjazuEbvCsvOi6QDvysAURi5Jtl3Gm6IpXzNz?=
 =?us-ascii?Q?MjvGkUzQ9jIfVTbe+s13yYC9um1c5hGktMV389IQ385E8HBpTXLEpUdtPf+e?=
 =?us-ascii?Q?BA+ktHRXaCeX1EsvLIxJpMS7TA2zlNcwerXmokPXuGzDveWh5cR/OzLQqYQu?=
 =?us-ascii?Q?aWG8QopY4OlIb8eCvVJ19T7Q3ZRn23pYFvGhbobURnENJvVQXciwDhY+b6Vi?=
 =?us-ascii?Q?CHUBiFJiTEznH76NxjZ3T/XEclpOipniusQQcKk8XuPcXs8wtXYGUK1B6MAw?=
 =?us-ascii?Q?/F0/8xFgG3ofKbwRQ17ZQtKAIucBtE5tPXkn+eN3SJ1xdH/7fgvPBrvO8/ao?=
 =?us-ascii?Q?l2NitCyoaHDMQFkgmk25a7KV/iCStHxO2jXFmJZmBdaODgMeL+2DCgmW0TgT?=
 =?us-ascii?Q?Kv1lT5NWsnnw19zwSu3ErdUXNQVdTcdmZm0CpjKkYgDBUh54WA+TsAjBH736?=
 =?us-ascii?Q?MZ7NSTi3ektQZicHqHqr3aCEwOqXlZupJqwFUgdENzdEJCIFVylFykFxjHpq?=
 =?us-ascii?Q?WaQFr7nFv849WakgZHL7K1B2GNK68bKB9zPxGXwVRazlOVchvsXWQ/7ypwcC?=
 =?us-ascii?Q?7ygsUNnD9DQNWlEzsA68S0Yf+KkvB9P7tmKXGUfJAnggpUpCClzIUTj4IT2R?=
 =?us-ascii?Q?skoCHBq0yJooHRbyp7RhRc7u7e0WvBBIMD5hwVoecXIbrnNS9U0YcjLD8Jl/?=
 =?us-ascii?Q?gHeMv4lNkf23njo/MA69czry9ONy1cJIU6x0neSHHMWnhe6SKOCke4LB75k1?=
 =?us-ascii?Q?3LRUV4WmlZJlvo250uCzl+ndWByQweja5RSyYzYQx3JPJ2Me8r6bUOPt3+r4?=
 =?us-ascii?Q?WQpG3pv91gv0eHN5p/mWQ5Hhv3U0C4p21zhycSYIztE5Ld6daSEYi8OTpiwR?=
 =?us-ascii?Q?ion6IwLQrqV19WacxZy73/bY9OaLo6OaLE+cQz1LqGfdeoffMQpuRW39d+Je?=
 =?us-ascii?Q?AzhC2XqCWDLEMTqrUui3Uha41ftJAbkV+WSGSJHCy+VlRNvbBxXkB8wvwfwz?=
 =?us-ascii?Q?7aoQFgQftyoOuPvHBG0vO+DEzhmT+BhPEu7x2TZLOghPTrWHEy+cQksEczhj?=
 =?us-ascii?Q?1zzhdd9mxvTOLCdyXVBqm1U9dIWKmTzwngszsx59+ws6D9peIWtxbBNSngbB?=
 =?us-ascii?Q?IC5yoPdcpzuqVykDgltvgKSpx5q7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f0Gx3Xqpu7PT/deQWEcqlxkDhKlEm8kXbjWY0CvQVBhkGkM8L/5XXxEPRMVy?=
 =?us-ascii?Q?b9zhazJY8GJOjcJJEk1CGmNW8Qe4Vq4/MJKA5NBLXcvT5tZDEBy8WS+F7c75?=
 =?us-ascii?Q?NcWnElhDa6v33dmxty9f74au2DA+GElua55sjbsBcTPpg8qHBA/S9ITJix+n?=
 =?us-ascii?Q?2bwA5MyD16+YaBTiwEIeIEDBip7uvnqDOLULQD7VecELk1Kb52XnlQ2ZIN5Q?=
 =?us-ascii?Q?Ga5bjI9P0lqJAYDy2ThT3m5U1Tf5g3kkO/tPz1k3jbHhA5n115Rolnjo+DuK?=
 =?us-ascii?Q?uLd8P0ZcklLBkumpBuTYobFMEiFQsmFEMYDuMU26zolDnYecd/R+IyBXG13a?=
 =?us-ascii?Q?EJnOP4dJcGy55Ow2pXuYvltLp31E5d/sVK0SlUXjFpLtBVLpHsgaPXiy/8z9?=
 =?us-ascii?Q?xrlgFPol4yq6w/HpusB2g3BmJ2neaBS137n6DRPG2guOeFG4fFObsJI5okEp?=
 =?us-ascii?Q?8BESRu8688cNK/0tiJkWokxuLmPefzFfqgU0LDAVg+C4wSKtFQcJ9ZeLfjxz?=
 =?us-ascii?Q?JZgTtuP6oeYei+wtrAtItEMc7HQAz9k/fIwixlvO8vdZsjHHhX7ELjOkr+Ne?=
 =?us-ascii?Q?0HuQ69xN0JkhJb9vRM8aN3/1I5SeMoFjt2D1vfsrT4ldxK8WDQjHnU9X5XJj?=
 =?us-ascii?Q?wCTh/pEPr4LwL1oces1JsE+CZPp3lmrDseV93cEgcB1FAnnq4PGrEmieEWIV?=
 =?us-ascii?Q?P8CZp539ZCBdOwubaQZtLvR0AcM8gT3MUbd40V7gT6RE0C4kigU9dibfxDtE?=
 =?us-ascii?Q?rVFFziILts+W7ibemLvdwdswUF5QoQRatjtUdGnX2EUygJs86gvUL7TeXINd?=
 =?us-ascii?Q?UaXQD7hdHsIVOlenApL73O/x/UA3DcgQNYycaw4UGrWWfIg3ZmxW03TmFYON?=
 =?us-ascii?Q?rv239ynthOtj+IFdbWM2ER9i8hby9HAX+5NULQsNMsChe9IoxdYA3B/Iwn6U?=
 =?us-ascii?Q?iZDY6OMoeCM68p1EkXRhI3IWpkEsNWKgPSI84zPJUU0iW55XrnuDxP4k0z6t?=
 =?us-ascii?Q?mXLUy+6wZdPHavYjPlxSE0tdCsrgmkntnSpb6jrfpDHUanutspgtRCyFWqXr?=
 =?us-ascii?Q?V8vc/NiX0kAYSf4OKgD6pZkLhZm1BaFzFZLO/ZGvv7XRrJIy2eCIZl6Jruea?=
 =?us-ascii?Q?6rUErN3icNWPnweBp7kcoFTG2f0HAq3ozoGoXcQAvSqekC5oJWibu8iPWQkx?=
 =?us-ascii?Q?RRDvsn6IKqs5C3EoyE1sDVzUoKQq6VJ9xw6jXCJxAroGpJpK9X2xS2opewAk?=
 =?us-ascii?Q?mm1zd5RdhR3BfvVaTm1ysgv+zA7KnHuakS32LCHoYBEYTLELw2rh/CPP7j0J?=
 =?us-ascii?Q?p2kGL5ekWbDa56dB3RYLcO2A/6pXrd/yKHxgmb865mPyBK7IkfChiHUMjoCl?=
 =?us-ascii?Q?adYnjIvJ/r53Bnsk/b1tyFquiy6jvsoKLNQiStZME3SxEx8cbCyyABPU9cVw?=
 =?us-ascii?Q?OVBnX1fs8XOhumFvcLVCvnVxElYZvvB/n+rPhQ8bk15nqRPckXwvdYRVf3kB?=
 =?us-ascii?Q?He0O+JrjJuIESMbmDPVQt0eQaUfBbG0b0JgtZzYnJWyeBxa3furGtbdJSJfO?=
 =?us-ascii?Q?okpQAqOXmkYQ8bHvqUkVm9y/IuBi2NuSJEAmJdEa3CqQ6qH9+E3zg6WgtQvh?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 889fd7de-f3b9-4e9b-1880-08dd55e47aa9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 21:36:35.6631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/A73rNZBmdSsZ3E6kWtMF3C1RTV6IqFG8zQoSgEOQzUTyzqo7monuK06j925VqeufULNfCDvrFGYTAhXLoVJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7155
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

On Tue, Feb 04, 2025 at 01:45:56PM -0500, Oak Zeng wrote:
> On some platform, scratch page is needed for out of bound prefetch
> to work. Introduce a bit in device descriptor to specify whether
> this device needs scratch page to work.
> 
> v2: introduce a needs_scratch bit in device info (Thomas, Jonathan)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 3 +++
>  drivers/gpu/drm/xe/xe_pci.c          | 5 +++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index c0e886bac183..1197ab31e528 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -45,6 +45,7 @@ struct xe_pxp;
>  #define GRAPHICS_VERx100(xe) ((xe)->info.graphics_verx100)
>  #define MEDIA_VERx100(xe) ((xe)->info.media_verx100)
>  #define IS_DGFX(xe) ((xe)->info.is_dgfx)
> +#define NEEDS_SCRATCH(xe) ((xe)->info.needs_scratch)

I'd drop this macro. These are leftovers from the i915 code and I see
like value in a macro looking directly at a field. In the existing cases
these macros are used all over the code so they make a little more sense
so if change the variable we only have change this macro, but in this
new case the macro is used 2 places in the code so I'd say just look at
the variable.

Matt
 
>  
>  #define XE_VRAM_FLAGS_NEED64K		BIT(0)
>  
> @@ -318,6 +319,8 @@ struct xe_device {
>  		u8 has_usm:1;
>  		/** @info.is_dgfx: is discrete device */
>  		u8 is_dgfx:1;
> +		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
> +		u8 needs_scratch:1;
>  		/**
>  		 * @info.probe_display: Probe display hardware.  If set to
>  		 * false, the driver will behave as if there is no display
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e8ef7d6b4db8..09736674a77e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -67,6 +67,7 @@ struct xe_device_desc {
>  	u8 has_llc:1;
>  	u8 has_pxp:1;
>  	u8 has_sriov:1;
> +	u8 needs_scratch:1;
>  	u8 skip_guc_pc:1;
>  	u8 skip_mtcfg:1;
>  	u8 skip_pcode:1;
> @@ -353,6 +354,7 @@ static const struct xe_device_desc lnl_desc = {
>  	.dma_mask_size = 46,
>  	.has_display = true,
>  	.has_pxp = true,
> +	.needs_scratch = true,
>  };
>  
>  static const struct xe_device_desc bmg_desc = {
> @@ -361,6 +363,7 @@ static const struct xe_device_desc bmg_desc = {
>  	.dma_mask_size = 46,
>  	.has_display = true,
>  	.has_heci_cscfi = 1,
> +	.needs_scratch = true,
>  };
>  
>  static const struct xe_device_desc ptl_desc = {
> @@ -368,6 +371,7 @@ static const struct xe_device_desc ptl_desc = {
>  	.dma_mask_size = 46,
>  	.has_display = true,
>  	.require_force_probe = true,
> +	.needs_scratch = true,
>  };
>  
>  #undef PLATFORM
> @@ -643,6 +647,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.skip_guc_pc = desc->skip_guc_pc;
>  	xe->info.skip_mtcfg = desc->skip_mtcfg;
>  	xe->info.skip_pcode = desc->skip_pcode;
> +	xe->info.needs_scratch = desc->needs_scratch;
>  
>  	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				 xe_modparam.probe_display &&
> -- 
> 2.26.3
> 
