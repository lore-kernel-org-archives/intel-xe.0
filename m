Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFC2CAC5B8
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 19:26:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8252710E097;
	Fri, 26 Sep 2025 19:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AqqlMsYM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF04C10E097
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 19:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758914794; x=1790450794;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zwVGHQ3rB6OQ56ua0fyvGQ6C6Llo3IaTD1QKsXBT9nE=;
 b=AqqlMsYMkcx+1SWmVanTALrUfW4gBxtBCY4DqLd7MT7FJR8pRbYq72hF
 7/9JbvOxZtOov7Wd1OsDdYVC5J7w9DJfE95p9KnqmbzwTJutHImMhYEUD
 6ieKswtra5wUNs+Fvl0MGJGu93HYlQuIkhuVJhZrcAYRksE7Dau4RjbTL
 DIjs97KQYf6Cb04U1xiLcmXw4GfzBKAqXJIyzRCHWWqq4o7K9AAjnGSSJ
 tLZeQkoO9QJ6C98ZL6/d9Pvq4gPgmHnKMu0fWBTk4s+F4pKVBJzX6GT6z
 32vbCnqyXdlLFVjDLZ1OSqD7lxwr9ndJNvnqgyuN5B+myhtet3UycIQe9 A==;
X-CSE-ConnectionGUID: kilTFWcITRe7tVSCg/tGuw==
X-CSE-MsgGUID: fA9i/7HAQnSdyVBYBdVcBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="61364154"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="61364154"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 12:26:33 -0700
X-CSE-ConnectionGUID: BLNayB6eTsuxT1zpPZRJgQ==
X-CSE-MsgGUID: 4e5mvb9hTXSC3m6Ze87Jrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="176966732"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 12:26:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 12:26:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 12:26:32 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.69)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 12:26:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQN9pR9c9rhrQRPEHey/3SYBslkbbPf5Cz/ecehq95s344yv6+2Wzn2R8fl8Fjy/JgIAVoP9G3+UbmhC9jX6H4NqqZfmJ4rBg7NV4oNo57B2gLx35TgYrlrsrz7tOKm9BaoSQdq8g+ZT37sHmre04xqAyguVptP0dfx9EPo6UnI7mk0IJDhRVnsycOuWwPJgHIi4Q2Yh9QYDJvrdFCOlAoT4Fwj8lsm6aocw5s1rB49J04u+K1AjcMSp0JOvRU/qzb1jdjh4zn29nGzx8YOHvhldV4ZTobCGW22iM+luf+xX6EdxXyjUjdlncKEdUUyiaEYk9c/VRvgUli5UyRPIHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8r+zn/pQ9tLSlj9MMlaXhd3ZIFhbztK3WlbbQD/+Vo=;
 b=hUsIgaSTW9N1y+FZW/QDop+TM0OYxINTXLjnIW+crhU4hhnmjzFPw4TjWhVcMSeRtMlZzF3Vtds4UfeT/XoQ24wXbYSyqSZEPKgXBJMyl+Ga2diNTM5b2GTFoIt4ugu1lTAd04w5sFW6rHfRlYD5G1LcS7J96de2avq2+TyT4rKh+aWpPivfah/P/iSPOrfF2OxAfuZwy97sa7gWBk28yEWm+Kygv+lPjT9f2qr+nReF/LJSsoeNqbZk4qMnpQBp8lD0Bb98AiR1tcFaC6eg3Sd4ImRQJDcU7ML2314gSN7WUlRzgbIBctTcscxD6j9Zu58QxwTYwQG8Ej3tURQslw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH3PPF4324011F4.namprd11.prod.outlook.com (2603:10b6:518:1::d1a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Fri, 26 Sep
 2025 19:26:30 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 19:26:30 +0000
Date: Fri, 26 Sep 2025 12:26:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>
Subject: Re: [PATCH 4/5] drm/xe: Guard against NULL GT in xe_guc.c
Message-ID: <20250926192628.GD10167@mdroper-desk1.amr.corp.intel.com>
References: <20250926155948.145934-7-jonathan.cavitt@intel.com>
 <20250926155948.145934-11-jonathan.cavitt@intel.com>
 <6ba18666-d2e9-4184-b717-b0c5d160d998@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6ba18666-d2e9-4184-b717-b0c5d160d998@intel.com>
X-ClientProxiedBy: SJ0PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH3PPF4324011F4:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df08220-ca61-4940-459b-08ddfd329879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vhM8ZvCOUdrMTrj3HcHHVP2VBG2jyPgxkuq4vNmtYLrET6aYz+byXNJKZtCM?=
 =?us-ascii?Q?uHI5CMDw51WOhZv0qul8dRFv3ZU4MSgILAQH2jtAFKFtXxMJO4R8oJlrK7Z0?=
 =?us-ascii?Q?7/B4unv9eMLaZ5EHKL2gbkDA5ic5Fb90ygaRyefdvw868u/G6d0BbS2yf7Gj?=
 =?us-ascii?Q?M6J/NKUJXCXjh9AMnmeHh4TwR9Rj13VvAnUSgxw2kKT2HTxPZi+p7SkYVrt+?=
 =?us-ascii?Q?31A0gDzhZ/c/9ATCBDuOwmoP94AaofXbJkDd7/SyC5QaqMS+xm8BxGQBn/r5?=
 =?us-ascii?Q?BCgvkMvdr9fy2rsZO3GC1/263XLebMXEhuCt11xDnBuL/1BXho5ZLoylvq2k?=
 =?us-ascii?Q?nVOCmk5brax6lXBqskgHQxhmu0j64PNDePjJWONP3G2DIFAq+xH2sOM/FtFK?=
 =?us-ascii?Q?SPuZF4vKLW80pNVQge4+OCJ3qTmJgsSrH4v6RhOp1QDT2oy9VLvAsdhwOIZ+?=
 =?us-ascii?Q?M96k7uy7uUUJS2TM3g9pI0vVkNG+x0RnByfiDROrq2k286lynYwOHO+IUPVg?=
 =?us-ascii?Q?SG9nAp81JCC0KJK/h1Yc/atkI/JqK6jxTfk9rhkdz0fiW0NE5cCFVZZ5B6OJ?=
 =?us-ascii?Q?byy58Uw8bfDT7XyDd5DRbdap+lY74dM1FH4r5c9CE58hbFol2MU/zLFCxtCn?=
 =?us-ascii?Q?KlQbiiaYk6aT0FLN7Qhr2n/JLozht2B8HnOdq9fsZsDqAU66twnqpgyKVJyh?=
 =?us-ascii?Q?N/vllr7H/ouqbiA7hAZNGL0dGwOqqxxqAMrU2dbnJLLi5PQeZgTTTzoxxXvx?=
 =?us-ascii?Q?aoEauD8HfDuLQtmcjpmlECA0upyV2/+XSn8Imz+ypeoIkHnTkqSsaleYQxDe?=
 =?us-ascii?Q?zQlva8Fq3+vt5zHC2+ZvlnzMq8sZ0jP4jVKcpg9pUll8F4aiwx4WswqudK9w?=
 =?us-ascii?Q?wayHZxCwCcydT7FNT7qtwNvd7/CHa/lNRjA+m+CLVyRt63AlEWGH1cxgc6x1?=
 =?us-ascii?Q?h1mVgs6+zrnhV3eV75kXQ7KCpeMNgLsNPb6o5NmzMWoi5iMHomUOkP4H6l+o?=
 =?us-ascii?Q?V8vC0aRPoWk0gHsuCy8sxVuysiItvg6orHytUO8RJUmP8b4lDFfXGAv5mmPu?=
 =?us-ascii?Q?OQKVb4bg/ZzMPIRpF0SUBK9K7eQuwgzs6ZDdV0aPMZk5CTGNqWBqn7oBKoQV?=
 =?us-ascii?Q?aoURaPwPDtJHbE9vyklRPvPuREdymFd1CO4HZxRJGeU9VqCtRZ8eUoq/h2+G?=
 =?us-ascii?Q?PfBQkPrfLuchZeXQZbb9f0uYBvKH/Z6cY+6YQZX9Ah2qoqeYWD8NimxsBRh7?=
 =?us-ascii?Q?h/8SqTr2Wpw+0FMZTfkYXdE6uJZRusX0danax4mGQ09O7KFADLaxPdvWPo9T?=
 =?us-ascii?Q?Zm9vugZKm4IR5OIqYFeKjyYmVgSIrRxDqq87u4cYfHz083rqGSZ8XoSMJRgK?=
 =?us-ascii?Q?/fIwk58TVZE8BDYdp11ZNmMamQBEXvEnrXkZmN3RJb0Tj20f9w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZU3nR0I5CP2F4RF1eVEBMeYDj3EIcqJXnJI2m9ZlvqAbpZp9Gik7DUR7bHRv?=
 =?us-ascii?Q?/J4Sl/qHKs/t21mt1Tp1U7VQeInNC7E+BExZUHdRq0iuOVIBwwDRejRvtwUZ?=
 =?us-ascii?Q?W2D87lPmLYh1EkUP0kEfBvBbldfkYi20q7IRMpCRuJoOrcACbL+m08xcVrUA?=
 =?us-ascii?Q?8EBk97nFR7xVC73L9sSKNk41f12ZHG23Rgaj9TfHDRJA5PAF8XYs/LcGLCa1?=
 =?us-ascii?Q?0VGNL8e0pMB+zsKDGqcJ5EwyxbZw11Gk4mYerKKy4k++J2KHSBjgs1spimEJ?=
 =?us-ascii?Q?Svoq3KiZtcfyx6cS0g3JB39GBQbbKFpcVqYlkFHVuo3UHOJXMrIYS+O8KvY0?=
 =?us-ascii?Q?gOvUcf00nY5lb5+rDL8V3r7X2uvgh03vrzgVVZXyoNLxfs5DBpPg2zJ7qc22?=
 =?us-ascii?Q?j1zWsWL9JTGiT4L4L6U9TRD9LlUyj30nnhX3AbUwRVeAaTTXAtMBxZc+wciW?=
 =?us-ascii?Q?DEReh0AY0MKBv3IqAHL8aDKRyyKXiHybzk2AiMDNBufFGkEHpyEBDrLhN/58?=
 =?us-ascii?Q?lIboqYtzWsjeTA59vOipso+mpQOpaQoVp6tBKRVpgqFZEc4+Wldc7B4gbdW/?=
 =?us-ascii?Q?8xcqW1koxglI5qvnT7Pm/PtRqYMfyWxEBeSzxlUvgYqvylanmNBODzw2Bf5P?=
 =?us-ascii?Q?Jg6GU7XzKn/8qOUZ6Y5GeMWmdHYIRDSe5FYkdBKfQMzhX/KdUPMz0qed6j4r?=
 =?us-ascii?Q?u3neEsXtDRhGiqguaNntqLe6n8Rm1irHi2ns1L5uDT0AwdE3Jr6nRH6C24uD?=
 =?us-ascii?Q?Y5BwIlzMlm+G0nNNk9Rt48Da61jIbKFoM6uwJq37fz9lYJrZr0HqEF9YmFub?=
 =?us-ascii?Q?cahqX09lSN8LTg8HV14J90WKRXCspqJQc8KW3ITL8m3ianmgRXKzyRG18EVQ?=
 =?us-ascii?Q?/PpwElqJOyMMsAh6i/Ep/PMCdoUYwJG5u7RQg2r94Z6iG73TFGRFUib99ckK?=
 =?us-ascii?Q?yf+AlpRaMZ7OWp+OkeZ5BFsHHo0pd0sRlA7TdtpQJ90MK5UZYmJJFNVH2nOy?=
 =?us-ascii?Q?nD+eYPiaGn7mD1gQQwrAoswgQ+aObq4nqEwKzRwNoSZeCQ/U7zCggnwLl3kT?=
 =?us-ascii?Q?pkMS5n0OOmlNyUGiKJqAsnw2vVZkSareoWrJYsi+ICvIluOrMrK/DVqQwra9?=
 =?us-ascii?Q?KNEVOzdZ5m7bJDiENE3JyBjpkauf0tw/Va3KXIRl5T83vGRYx7dqn3ZTtXDP?=
 =?us-ascii?Q?v/RTwCf6VUhvStqy9LwGMbF4J7KCbkzp90R5/S/2oQTabzeCfsCiBrXJg9pS?=
 =?us-ascii?Q?JfsAHkCX1bw5SsJ/rECsw4sCAewtvfWrxxWip57qToM5bAKBEFKzYUj4bKOX?=
 =?us-ascii?Q?SVjH44UsRtm9guTCJIc5xEuMaO1VlxyKanG3nIkCo6yChkBrCK2Ey6jJRiiX?=
 =?us-ascii?Q?d84enzAHDqTH6s/M12nGMW6tSe9zL85CeILdnMm2jdxDajlFlwA+lmz7vUtN?=
 =?us-ascii?Q?2JkL2/Q6Jf1GEVKokiyyPjRGRu7MAr19o5mf5QYoaXLDNn0n3GG7LAep4oZK?=
 =?us-ascii?Q?BkFVZ5+NVtHax7wMUvL4j8zR6CLSDp+HT+2CF5pXkHZ4uLSnfUxSchmCq6+B?=
 =?us-ascii?Q?AmYQGQWiBTNcImmMCHYCe5ag0sIKvCuOgu0FYpecNycAcy7OJoDnbB4BhMRG?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df08220-ca61-4940-459b-08ddfd329879
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:26:30.6114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLveVbxyN5QRoyJFEm97fEWOPj+nIfb8Sp8LdzI1dAteNt6y0ZLBSiGDibub4fbmF+jltY2mtReiqhEEqabZW+qao94XUpHGBMmHAsAkowM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4324011F4
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

On Fri, Sep 26, 2025 at 08:36:31PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 9/26/2025 5:59 PM, Jonathan Cavitt wrote:
> > Static analysis reveals the following issue:
> > xe_device_get_gt is theoretically able to return NULL in some cases, but
> > several use cases don't check the return value before performing a
> > dereference, resulting in a NULL pointer dereference.
> > 
> > Use xe_root_mmio_gt instead of xe_device_get_gt to prevent this in
> > xe_guc.c
> > 
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index d5adbbb013ec..0bf1402c61a0 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -466,7 +466,7 @@ static int guc_g2g_alloc(struct xe_guc *guc)
> >  		return 0;
> >  
> >  	if (gt->info.id != 0) {
> > -		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
> > +		struct xe_gt *root_gt = xe_root_mmio_gt(xe);
> 
> while this looks ok today, I'm not sure how this will work after [1]
> 
> maybe we should check and abort here? + @Matt

On today's driver, xe_device_get_gt(xe, 0); can never return NULL.
Hardware-wise there's always at least one tile, and every tile has a
primary GT.  If something went wrong during init of the tile or GT and
we couldn't create/initialize the structures, then we already aborted
the device probe immediately and we'll never get further on to places in
the code that would be chasing a NULL pointer.

As Michal pointed out, there's work to change this (i.e., allow the
primary GT to be disabled via configfs for debugging purposes), but even
with the referenced series we're not at the point where that can happen
yet.  More patches will need to be written and land before we relax the
probe-time checks and allow probe without a primary GT.  Once that
happens, xe_device_get_gt(xe, 0) and xe_root_mmio_gt(xe) are both
equally problematic, so replacing one with the other doesn't really
help.


Matt

> 
> [1] https://patchwork.freedesktop.org/series/154739/
> 
> >  		struct xe_guc *root_guc = &root_gt->uc.guc;
> >  		struct xe_bo *bo;
> >  
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
