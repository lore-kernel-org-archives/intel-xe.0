Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E20C4707B
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 14:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638E410E7EC;
	Thu, 18 Jan 2024 14:31:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E348E10E7EC
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 14:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705588277; x=1737124277;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xYV76Yy5E0SUahIFbZJeXObUzE7gC/UcK88km4HKx5g=;
 b=dVxNFOvK3Ogc86FfrMrVYGZeh6ap9F3j40RPE/YBk5ttm98D1bGbF+2h
 zL2igTR1K53yZSU6ZHB4ifoYpWzEcbkdRC3ryVg7DAcIgIoaVbRakP0Hl
 TjF7FW4b1gkWwkNs8IfG4ng/9lYPLBhogvV7LrYrTmY1DsyJ0Ic6+wZDG
 F2lxZhrNibub2HjSKaxgsPh7R7fVLgqdbP+bt6G7Qn3jug72NXfbYexuk
 ay+vV/jt784VhRodqO622D24irW7+FBO1efDYESbKgMncHQs96c/Fxhcv
 G4DoDdO/hHGwRqx+Q6c21GoDk6eU9XPsMt4PdodedTPJSOCALCPNx+Wwi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="464740700"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="464740700"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 06:31:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="818798337"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="818798337"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 06:31:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 06:31:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 06:31:15 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 06:31:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YK9pHyozh20VtDXz8+DhVShOj6o7xy0eR0A9zhxks2BZf2J0OpkBKO1xU/nZi3A+LJe40od1/HU2y4MdFzO8EgWe9YJIYFcvR59nNki4D0x5lqQrPkQoi2vYVYHodM0HgTMKvdDLc/Oe2TGMw2aHzZZM8RfChjQToXWYgVb/e62hhJQJn1j5h9ACTXMBx5og2EVMoyDPgQr6jeCt4rznLAxu6U+RfBrzU9IMhbYa9YJdc43YTQkX6GyZgBOtwJZH42LBw+G09gpJBZ/82cl7c4T/MyQ4M043PhRgl7NDfw6nFTaOxs5O5eUnloC5E7FkfrJZB0yzMI7KkQ1A33Q/JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZo0GwbVSX/+CpRYsAbjmxNQm/YdywluqHk6k+TEr2I=;
 b=QTVu4wmBYk7QwE+9kzfFPNyRxA4hXBGuqr2hi+Z290LBURnZ5L89mLKLJlZ1nDhAVFvZ33fnxpUtRLEA7NjiFv3FdE6tRVABQaP2YBSSRYKa8ul3wWKKaGpZtO0CLw3E5BxLBcJmkpdB0huayHbylpVN4yK2gyKUwCwq2WERliYC1fzuc5ZgQchnSIKKSJit5wNQ2EJnr6iv8KH7kGB5lzEwIs4M9w7EOwWX8rl60g06q3h92t/0Xa7Ft1PTSsDQ7WViQxiL88p8HEt7XlhbA2UuUFIZPQ+AGqW0YA32MIGmKgcSJ7CYmevUsK/mV1jh1Fe22wEnnXnUjJxTn3BHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6741.namprd11.prod.outlook.com (2603:10b6:a03:47a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Thu, 18 Jan
 2024 14:31:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7181.031; Thu, 18 Jan 2024
 14:31:12 +0000
Date: Thu, 18 Jan 2024 09:31:09 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Do not flood dmesg with guc log
Message-ID: <Zak2LTfFOPRulNje@intel.com>
References: <20240117204059.345143-1-rodrigo.vivi@intel.com>
 <ztv76j5a2333n3sdl3h6nuulqcdscqcosambxe62rydprzpepz@mitp3w4jgb2o>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ztv76j5a2333n3sdl3h6nuulqcdscqcosambxe62rydprzpepz@mitp3w4jgb2o>
X-ClientProxiedBy: BYAPR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:40::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB6741:EE_
X-MS-Office365-Filtering-Correlation-Id: ad7c5325-d610-48c4-72e2-08dc18321ebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 93v1Ca1t6Rhn8zp9DN25nz+X7lHcCX4cCRMkAM5n2gTfwqJHSmxUtrV/PZE+WkOpabdAwO4Gec7LqAvXcOViWMszG8pkEu9/0JpZLKGqvvzHK5t7Cv3l/iachFhhRgGzvpIuYeOo5Se/1kHoNENKEvHgchzYLTVSrD+v5KAlykmxPANmeZINEadWce1uCddKUMPYk2R/yCSvbAeCgFHNK7BVy1mGMvKLP7G7pEp++NGWhxVAALTHxZj91+Eq0Tx/a2vvjleO+hTgoJSYig44dZuyp3eYFWFj78XkNoEh/Pm/lzJHc4o27T9VBrxL6elfwSFKqBJ3xPyR18ku9GpxWtV933xaIjqZAa9Jg4c8+upr3UjEtvQvbfJn9xgtSxz8entM/wAj8WMcoYqoc5ldd/l9GM3YBUJ2L+VgiRjKTdryh6WV3RLxlRwgmaAcxjsd5xdVvEgK45TQMKMuAdV1GXgWzmsL5M2v2U+CVzkx57wTsurj9f4Pl2r+z1LgNRCHGo54VxQXvd3n2KVaESmG0ylmnGx4CkqWvzGhj2Qj4G/2A2Ce196yPtVu9XAN14Yr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(136003)(376002)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6666004)(6506007)(2906002)(41300700001)(36756003)(86362001)(478600001)(38100700002)(82960400001)(66946007)(8676002)(8936002)(316002)(6512007)(66476007)(6636002)(5660300002)(37006003)(83380400001)(6862004)(66556008)(4326008)(26005)(44832011)(6486002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nQxCeJGeWF+I1Qh+1Ai594aoFHoKxPocCjXbEvislYwsRSD+Dw7rhHdZxoMm?=
 =?us-ascii?Q?nRBFJ4p/4Gd4PlrmyUP+SKS6uRhNfF9mV2CgdWtyxEB2pF58jq9LSea3UwC0?=
 =?us-ascii?Q?DeqoVCJqho4zWh4mnJIaCO+pMBqr1Hpa4zuwobj9wrsDXdcQOt9wDgzHoB0m?=
 =?us-ascii?Q?AWQ8Rwew78xIEB6WJ8szAFWGY+xqy/by9+8DRyT3UuNCbXz8s+ssAVKdTKxu?=
 =?us-ascii?Q?yMHJGvwf/FA63ag0iFKP3Ti6prKFwAbFhPn1NOSMnqViE/34cNx3GPh7YOFk?=
 =?us-ascii?Q?/wREKwNQD9uJRVsgq80QGi1pTl0pAQB+2k6EfromI32oeUXvDuq6VLLLUTES?=
 =?us-ascii?Q?OHn6edCyurhT+MVeMikkcfPRtzChOlT54yRDZcVW2x09EZ7C5Ut7N9YKS7Yj?=
 =?us-ascii?Q?3aAG/VdkteIiENgE0eNswj2C6rT7vPHs9cos6Up4PhQnDvRuGtgCj4EdsEjn?=
 =?us-ascii?Q?q1Wvjpa0sAqjlyxet0A3gr3qCCKAa3bis//G0hB3O2ZqHwlUoW5WL8k1v5bU?=
 =?us-ascii?Q?J0hi656y7NydZHorOKu8ZRySCO1dEIHy4ezkwQT8F+neMmPOP/KcqaI1IFfn?=
 =?us-ascii?Q?BcJxC0CTBJ+IzgHZh3xTGl0Pz1S1RII1nIeGmbGOSdiwwonDPxZasaY+2GMF?=
 =?us-ascii?Q?NRAr+hDZYLvG/YCckFts+s7GuLnDWfTNvdQnWcv6B/nKstu5UQ2+u+G4cvrG?=
 =?us-ascii?Q?hkIV+g3HTauXK6efE3Ok7ccdx+JrlZCS9lXIlh7C36seKycadEhpZgg6Aai9?=
 =?us-ascii?Q?wwN0ctpqplwVHw29vDGchc0a0Px2+scAzSwcms5rf1EdKSp2Ad5w66gTejW/?=
 =?us-ascii?Q?SAw6/Yp2kHhK2X+A0OsnNI2BofxnBoZLMENAsggYS0V0EQkNSyKgXPZ9hZq7?=
 =?us-ascii?Q?yccvKNKfyiBPDiIbH72EvOtzwg5JBegv9YG97UVKJmMzOqDJ6TXiGBbNti3W?=
 =?us-ascii?Q?Z/Da3WrqT2XX2kHzJv1SigsK+Gz6AbYRTagzLLXh/4YsAdvu1qlXUMMezEeh?=
 =?us-ascii?Q?Q8vM8+vV+A8IIbkypTubWuSiIAYnGKBWrgZUQmeX4RpzydOr7oCQC+dvUJxd?=
 =?us-ascii?Q?42JyfNbVEeNjQzUBh++IrHfwiVyB0f+LEPUxSB0/2QLyIgSV53jCLX667Ihn?=
 =?us-ascii?Q?kDbCGjvo98AtEN0EWEC8U0f1f7Ey3ljs4Y2A1WcnKcwJ2tdJYPlUKTZYluG9?=
 =?us-ascii?Q?+LYdI+pEKiPfwGPduVndxjhYhnpktrvgfYolCBjWQ7G9m5KsMK46OT3Lr3n/?=
 =?us-ascii?Q?++12/Z8rH6hANiTThAjLhCKjHrvYL6ed6OK2Ds3U/JPb8NKL8ZwoPIvvN78g?=
 =?us-ascii?Q?4qmvJUpXNiRt3uOz84ko97ed7p2QOanEN99fZjPBpR94DRLYf5HQDtH/g68w?=
 =?us-ascii?Q?/Q3ZKuenbG893S9NSJ4MPdsUvT8wpem+8pJRI5l3+Vq564KvCo9jjZR78rEF?=
 =?us-ascii?Q?dyioBlxKPY0G9Pj0nVrMuR6L/wBvkeOwxTNzqauT42yI0MLNwSXpxRFUKJTY?=
 =?us-ascii?Q?4Wp16FZJ/FqG+qmQw37LavYVWRx3oNRRQ3WN7IWVbO69/klLvTdMjopE3hVb?=
 =?us-ascii?Q?AjwhmP4awEl3taQCS9zKw4691KbMAFLP4bYatWlP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7c5325-d610-48c4-72e2-08dc18321ebb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 14:31:12.6250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJpUvwoStooEud5dpeo2qZF0K+q9UcTv7laugfendgwFvECuVdH1I3Llta3Kayu0SFgTpyjKTtf11McFeubAng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6741
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 17, 2024 at 05:42:00PM -0600, Lucas De Marchi wrote:
> On Wed, Jan 17, 2024 at 03:40:59PM -0500, Rodrigo Vivi wrote:
> > This information is already present at
> > /sys/kernel/debug/dri/0/gt0/uc/guc_log if needed.
> 
> but is it persisted if we couldn't load guc?

well, it was there here with the same content that was spit to dmesg.
Maybe just because I got this after a resume?

If so I would still prefer to make that persistent instead
of the flooded dmesg that gets really messed up and hard
to navigate to find the real useful information of the
failures.

> 
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_guc.c | 1 -
> > 1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 235d27b17ff99..2a71348c5deda 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -466,7 +466,6 @@ static int guc_wait_ucode(struct xe_guc *guc)
> > 			ret = -ENXIO;
> > 		}
> > 
> 
> trailing newline above

not actually a newline, but I can remove that extra line there
while removing this.
Wonder if I also should remove the spaces between the if/else
above this block as well... The "style" there looked strange,
but I decided to not touch.

> 
> Lucas De Marchi
> 
> > -		xe_guc_log_print(&guc->log, &p);
> > 	} else {
> > 		drm_dbg(&xe->drm, "GuC successfully loaded");
> > 	}
> > -- 
> > 2.43.0
> > 
