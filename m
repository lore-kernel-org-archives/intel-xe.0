Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DF3C54E41
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 21:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589F2113590;
	Wed,  6 Mar 2024 21:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cZ9R40xJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242E3113590
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 21:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709761057; x=1741297057;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Qilb0NfkB1ONTub4dus/iY1/H2z+MJduIgSj9TZqBXs=;
 b=cZ9R40xJh4wp9Tx46kS9jXWNrYj090d+Dv0YTl6mK45+Kc+eLdGfI35t
 XUeNUR0kZphiLuJ6WGQRL8b+FjzHUv1Mwzg6hftNrcvInHkq6wMv3DBU0
 uPwNtpot1CTCz9gEFgLRbuXUYTIFA6z9hDiTL2j7bhSEf3a86ce9KlDi7
 +Lv67dn2xFh0eslLDD3h8ld1xts0JHdzcoTAkG9Hbg2P9Sb96d5/mZpny
 ap7gD4jI4CwRZtzR2xqYNjdIqAXUENiiatLxZpQoH7c+xc5GbqGcUiNGf
 i3tjb0MKu0fSHyodOZdUkzE7UNtR76XeljZKE1tEbkHQeQQcZQelXh+p6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15121381"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="15121381"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 13:37:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="40869743"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 13:37:37 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 13:37:36 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 13:37:36 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 13:37:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PI5odZrEfHMG64UO/3ho7eDTK8UGraPU2TRe8o3xVstLa/9RRMJiWgNlzxC2pLUmEk3LdLKDUc7hTY00xoAuV7d+jVBSQ4HfmZi7K0Muf7PnNi1vZehmaJi/B9DwSLR8LrJyzVDTYMW52T14h6Xg08CjNazTX7xQckAw3s0LsBMGqHJ+JGMranpRjhvjlCeL6PXaF6Lm/+O4B0vf3/PJ36qyMhKBe+VCl9Kq7v+1ewbyrZBh+7Vv4X7qCeoqJNwBl3agF65fCNddPy4qsdtc1l3k2LURGtFYfVSCEFVdXQIuQQYAnGtER9xS0PmX5NncYufAgYoix1N24Zc/5CuDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8RTwnGl1c0hf5X4Vhgx6HFeJ2HEjiUboC4e1xPNM8U=;
 b=WxY1uQ6exbyY+03D6ak9UROb1VfZX+pNjV98eWtfB32trxqzeer3zHod+hALK3vZtg9DLCO/opE9gJvGHOEjAEvOlxH3hJ6NxXlMHzTQCgseaQ52uZofESKcBTz9sXSrQRHWA1OInVstq+XrPPnrQ1HGUNsQFF+iNmfLp3ShgvkQRiCFYPhSk7YQvl9DxBG2ZR2GnbWF6B4lXI/yhfaWDPnsL00gKA3yjwztO+aFhQw3160jc/KGwlicxjHvPOqp4/6UAdxOcmI2PGJK29CWBaV9V/1+JM10K5qCDfOlIl+hYX55bM6qlkj/0otluJjZGRuwkoSiJ9Ts6eTdAz+RTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7011.namprd11.prod.outlook.com (2603:10b6:930:55::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Wed, 6 Mar
 2024 21:37:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 21:37:32 +0000
Date: Wed, 6 Mar 2024 16:37:29 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe: Return immediately on tile_init failure
Message-ID: <ZejiGZu4LRDdZ0RL@intel.com>
References: <20240306203110.146387-1-rodrigo.vivi@intel.com>
 <20240306205341.GA718896@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240306205341.GA718896@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR07CA0061.namprd07.prod.outlook.com
 (2603:10b6:a03:60::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7011:EE_
X-MS-Office365-Filtering-Correlation-Id: c5b69260-f493-4ba9-804d-08dc3e25a19f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1TLIjIjntr6N/hQrCA6edu53EMQMWtLYRmnSAogysfzrQptsTA4+PIRcmJbmdr/kcjXMxKX/eSlB+/ACJmMfrO3a25acvvULlqNvKGNP3vGjHzmx4Ek7EqJk1tBTpkBDMmru0inrsifYhvcZAPKuyzW1urXgn4XytwYLGHQbSczQLtTkdYZ7dComeMueJywQm1K26lQhULx2gS5KjpaI9BxTItC8b6F5G1jViULdFfUINwOxLAoQcKPJjwYEGCW1ajM9xQq1CtK0/RByvA3fZAqov7Gn8aTB0r3ofWoAsgpqhdKg0fasCH5y/4FvWXpbEnrYdKMPQA8Uc9lHgrGcb1F+MkyEA4DE0oYqN4eHVQr6wTsAn63Fl1/YYyTPFTXsgM1sd3zV5M95TIOd93m3xWfzgZ4QIxNNDjGZTh8cGueEzI3jEqoZIi15DAN+VMwApTXpmALnfnQVlGwcDya6Bv1/AJ3qoet6oAQMezI11ZJYd4UprMOhLY8v2aixwmM8ApQTbD8IESpbtjiXT+811pO9FC6JaHT+pOVjMOz9ik80z3QXpnmwTkCQm3X+FO12WT6uHAABsUJJbuGZWz40BbR7rfOwpOTPvX5Y8ZNLuPuGBDkrJ9Dc7U8HhpEUJk0kGn0MTr51NUzgPkks6nrEDawQt/WPDIjf24kVROE1ezI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FNe7pcNj+7kTc113FtjjHJRpkGQ240u6skkDN5kWP+N3ZkoVv5hRYEhmYRgN?=
 =?us-ascii?Q?3k0Vtdo7n+mGKJh4w/+vHPVhfCYreCjUDL5/H1ygJj02jWZ8c7bX2ouabdgT?=
 =?us-ascii?Q?kU50vEfHWekvT+LJydqVxy1TT0kFcIcuL83ghWd1/HJmluSDFMtVUFia7yeJ?=
 =?us-ascii?Q?9glWPZWX71FlaL6B/7SVkWp0+JJnSYAH3gnPWCQMcyM/yxNWveQktJzy6uhz?=
 =?us-ascii?Q?nHEtSsV7k17hifRsc9q5PmHKeXSSugdjkvR8/IsG9VaUxZyzkKEaX+kK1Gyl?=
 =?us-ascii?Q?Q8e+Hrwg5Wjo0e+9STnpov5i2WKy5PhJr7QNBSzj6Trw9Bnm/GzjLGC4/wqA?=
 =?us-ascii?Q?mLm7rBcvegZoMpBwr3YAKOZTDG+LPCt/Ti2Wpiuvyk5ClKkQMMMPCQZnF7KI?=
 =?us-ascii?Q?fayX7Pmf4tGPWkb0grkSlJc8jb5eXdI45CtYN67tXbYTAuzFDQqXzy/hdlCe?=
 =?us-ascii?Q?bQMTV/sURjwNOXz0bTEa14nyzQdKkOYlKGj1QpcQa2TH3wYqWFebE5/D4gWS?=
 =?us-ascii?Q?WnEPcWhktq6IjgwbZcWm2wjrqk0vC3GRms/GEkbL6hGimmuuT8mXwtctpocg?=
 =?us-ascii?Q?osHo088KwtQAddCsLDvOQX4hATkjBVlyFpc1LXZfik14iRWafvZDIOb7wS9m?=
 =?us-ascii?Q?Z4CLjiK8ihyz8QusyzVs97iHiA3rNU7vaAegdOASe/ZDvTlC/9PikpcAb4NJ?=
 =?us-ascii?Q?b1mbOreCS4ttN67oU9Z15NYNBdl/XgoBsBmRfgFplrC7HttrATBQwJDu8jRy?=
 =?us-ascii?Q?qOWplE7PLkvccn80Edu2fCVs5lE8Zct5+vJHr9ZM0EbY5fLI/UbwCqXNooXh?=
 =?us-ascii?Q?tVntt/JNXxIoLfgTseeimOhAH9ldp91wAyI1ZiJRL2+6urCRJjNt7pws59Hq?=
 =?us-ascii?Q?UoLlUEcbbxMVh6nXqLhDrdF+gQ93doAhcfjpkHRlTAZfltqCUKcnXM3ZgmxI?=
 =?us-ascii?Q?lqKKTo8KOvANGrztImrUjFH3vaWOmDlXfHDrrBV3v+ke97VC8QAG1pLl21j6?=
 =?us-ascii?Q?xCE1N6HYY+BexqPYe+yMXGh3HXmHDQ1DzwLrZFoakhS4/WWFMZ9/1OVsCn9E?=
 =?us-ascii?Q?qLvdU3a2AMJJj/IiXhbhvzs35oB5d5ImfNtx9AJgEaMjsYXfZ00wQsE+POmz?=
 =?us-ascii?Q?6WYLPbjQMzc7LBuZ58ReLrPWGAIuCgzzCgHA+a+Fp3843fyT6ybUul8RGKIV?=
 =?us-ascii?Q?X5ehSVijw+gXAVzqI0pp3AtSjKwD3Qq6EOlwt8WhdJwGNK+/Wk893Goi5WIA?=
 =?us-ascii?Q?sCROL8m6ncMCEL/1/Ixkr0mIL0ixd/OrH4k5E0oTUfkwirkxAaF5O1VCI5bE?=
 =?us-ascii?Q?im1xXWxhDUXE2tls8FyOkqbqe0wqmsJxzvakGFKva/30UELXMRR9YIBNNI/z?=
 =?us-ascii?Q?nMnzLul/8aq2XtlYLCRa7tcb92afn9K4M6cH0MUls4bU+ALKe8cpDkcGo9Dv?=
 =?us-ascii?Q?E4ekeJ7/go0+ar/WngO6RXKTLymXDvQvV2YOxEctAlKOonHFMfSaARSXH75b?=
 =?us-ascii?Q?m4GnCOvXDbczdAp4ih92iaAPjmW9CkTNDsCLL+sIgfcBnhP79s81gyUsTEJW?=
 =?us-ascii?Q?AJd/EHMmgHbxC7iHZyogNqLjHU4rrCIGD7koDPI+jYnneoj48G3b0EkO3GUc?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b69260-f493-4ba9-804d-08dc3e25a19f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 21:37:32.9092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8eOFeSF4mgRCSVrjYqdc9CE9bC+tFNGjUeWUbuwxZyT5nDNKSgB5LGJxUz1GWSyl+tLhPKGKq39tcoczFUrnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7011
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

On Wed, Mar 06, 2024 at 12:53:41PM -0800, Matt Roper wrote:
> On Wed, Mar 06, 2024 at 03:31:10PM -0500, Rodrigo Vivi wrote:
> > There's no reason to proceed with applying workaround and initing
> > sysfs if we are going to abort the probe upon failure.
> > 
> > Fixes: 876611c2b756 ("drm/xe: Memory allocations are tile-based, not GT-based")
> 
> Should this actually be
> 
> Fixes: e5a845fd8fa4 ("drm/xe: Add sysfs entry for tile")
> 
> instead?  The commit you cited here was already returning immediately as
> expected, but the sysfs commit started adding additional steps in the
> middle.

that was indeed the first bad case. I replaced the fixes while
pushing the patch. Thanks for the correction.

> 
> Anyway,
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_tile.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > index 044c20881de7..0650b2fa75ef 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.c
> > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > @@ -167,9 +167,10 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
> >  		goto err_mem_access;
> >  
> >  	tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);
> > -	if (IS_ERR(tile->mem.kernel_bb_pool))
> > +	if (IS_ERR(tile->mem.kernel_bb_pool)) {
> >  		err = PTR_ERR(tile->mem.kernel_bb_pool);
> > -
> > +		goto err_mem_access;
> > +	}
> >  	xe_wa_apply_tile_workarounds(tile);
> >  
> >  	xe_tile_sysfs_init(tile);
> > -- 
> > 2.43.2
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
