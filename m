Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C54ECD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 21:36:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D26112AE4;
	Wed, 10 Apr 2024 21:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iF0VThg6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C02112AE4
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 21:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712784982; x=1744320982;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nIz+n3Y1FESZQpRYdHpnhly7+nJ13qxAqkBm+ndvC60=;
 b=iF0VThg6lBTpTIPehEtAkxHaHL7dc4l75UddOchQY/HIccPq/hiICFoF
 H9TPHYpTNdbOfbH5ks1tUsFc3XygIE37BXJI0vQdbUh9yq5BTE1R75HCY
 MHW79GmNjVFwPKWiF5PiH9/VhcujrVz4skwKSPmFUoZz0pzXt6GlyvVvA
 qB6/STPrE9J4oMRDUVHaRk5X01FtPs4hM2oVSvYSP7m9edHUljsVhhy1S
 rjsSe5FE2KS9lZf4POSfeYk6XVAKwzqncudAwadIaUexDMkxk978lZOvd
 AZtC/tZt3kKcYUwoQ1CAP8ZIBnAnO/HiQgyrUF99eK/NedTc7xoXgqYmt g==;
X-CSE-ConnectionGUID: /yts2VEeSSi/LoYgxjZIHg==
X-CSE-MsgGUID: 4t0f/x5UShCQvd6Eu9prhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11954410"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="11954410"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 14:36:21 -0700
X-CSE-ConnectionGUID: aJ/Z9ujTRKihAo7KHRnNnQ==
X-CSE-MsgGUID: IOKSjXu9SSCZVx8+1FmWUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="20695824"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 14:36:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 14:36:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 14:36:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 14:36:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ui7I4YianDFSkT6AtB0HMmjFb/qwPJVKuHjZBNfiBLzuODouZ3XSBbETgwO9IliWYv98vThyTnhbUThRBmnksj0xa9HsX6YqanQAsYEyqvENNFUsTpuye0V3wG9fzbMihZ0uQ4PWbG+NzdS4Vt1leEJaJhaPSKwUM5HkklFQQTbOqdgGlv0veVlCE2uZVbITtUSqdgYnjQ3UVOHU/hvXO2isyqnqaGkTYK41Y5l92urq81BTTOsfuwmLZ0Q7xnR7Us1H74A4ozQ3E8dpUwi5Lp3Dgs4NLGtiWWtWwxNGBSSY8j6BCwgPnaC3sObsRFTq9jT1a1YhHd/GpZ2vHxRS5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/OHEzpCTDHlrMxV8Un2kW/LcVB7fYUaywpB897UiEI=;
 b=Gkwc+CPX67h2GJJ2gAOiPOEaql9lNS36m/dVPmNKFxDwCNSRPv8jX6Wd/Bn7qZxLZJ/KzQYo97J30mwX1un8YgLW14iG/BrzpzFf2qJUM88AQUr9p3JqpL9qFF9on9SAvPukEEdBgNeOm2wFYKazGbosOlDjNDDvnfiSwokP3n206Ruh6m7z/KbTRpuAU2j7CDYsG8qrsEIMLEQ0WSDQNrD0mnTl7+oSTj7DZ3GWc2RNYoik0gqGYmAlzg67qZw9C38KtgOwYbhxMJ02CTNUfc4YeB0fq3cblMwF0wkfs03eM/hli8uqt4BNytdeLkiFaq6Tx9JWXFegpQ60hrExeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 21:36:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 21:36:17 +0000
Date: Wed, 10 Apr 2024 21:35:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <krishnaiah.bommu@intel.com>, <Thomas.Hellstrom@linux.intel.com>,
 <brian.welty@intel.com>
Subject: Re: [v2 15/31] drm/xe: Introduce a helper to get dpa from pfn
Message-ID: <ZhcGDsliffKKgS1J@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-16-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240409201742.3042626-16-oak.zeng@intel.com>
X-ClientProxiedBy: BYAPR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::36) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4989:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pJwPdp19wI0M3To5dQLUch3fhkULTTErVklri/BcMH5CzEsyszsEP6I7q+6aFU+sz8q3Rhkt08FQvcfeq1uM8MZ6ABQTCJEplRncsReRzeZl0mEQ/hXuB2pQV/X/9rIIQARbf/VtPAL4I86yRArcfhXWMsYKRjXha3F+UO3n7+uRswZyeBZz6nzcrZkcPFpowh+gCw00PNmJclqDD3UhKFINwwp78Y9Fm8kMhiT8wnvMiqOyanskK9X9k4+uh88NIsUXBgR0LOJl3o8v0QQoM30M7zRo5xNp5U284bzmqJZ2gzvAEvYti1hvvNnqTXPxsQw8LH4XTPO4AEOGva0tXfHf/ZXq+LxG6jvtJA335xnECqBwaGbSGTf7o6qrlSprBnwE7XrCMeEy7PQgUu/0xTVrvZHUNOeNDT/7yQF8XGQTPeA1IGo6OJE8uKze19tXSwgyxNhlpHlnw7tQ3MbW7Uk1KuAQDU6nqwNboSyN/WO312PXI0bYEMwa/Q5pfPH3UAzxlBXmVvPmfotkmFD9VSVqFB9D/DiA5JFtWnkD5S88won1dIlcB5fC5JxnSl/a7jKrVTwDrsXTO5yhrBto5ACOf8Soc06Lt9Z3LC7/4hI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uFoxlIJGzTro+ZkhdkNRLv9CpmdWni/sfUOQRAmQUQteG2CgZEEj+smZcyfR?=
 =?us-ascii?Q?BFrpuW8BJ74p/YivL4vF9ZDMuSIuf9bRA+pOCgCEfAh//H1vxV66jgoFF1Hx?=
 =?us-ascii?Q?9WWJm1BjnYt20rj+RrjhG89WQw7Nt4jj3/S6iWAdHT81Mmvzke3qr7lCIya8?=
 =?us-ascii?Q?5SyH1UWetv0XsUx26Bnvr++/TCbF9ftdkE9Hpm7Dy6Wcmmt/o/0KnZgNMLv0?=
 =?us-ascii?Q?4VSIcsaR79VLQgFyQEHnnXG1yFmBRxk28xpeFu5WHfZOlBLstrRCacBa8N//?=
 =?us-ascii?Q?Hjeh7wOXlpn4q/hChRKcxQOi91tJnF/5TDtFDKQBjMr0vOxR8VrfRDz7To2s?=
 =?us-ascii?Q?sLjEmZuKcG+XTP63zjtblJaBaOdxKgTzCN7sp2X1DQepKftdldKD9HuVDfTK?=
 =?us-ascii?Q?pmXYAG1NvOBYE7Zq/H4WDoULgeyifgZfaMpgmQUWRXsyV9s5OI5Xk+1OE8kf?=
 =?us-ascii?Q?G0X48bkR7NCXPfFqcBZW7H8UMiLV/um5xtYVYG3gAroBqtZTh84Tp3WwsL6p?=
 =?us-ascii?Q?5VHkdKmEqADyk1fG29OFslI6D508WttMhtixzBzv6XbDPvaPMRtl9XMDFoRD?=
 =?us-ascii?Q?I/S/87W8ScJuNs7bZgt43RcPvbjgZdE76fVig7UyCF8/6gajvJKzft4UPj9t?=
 =?us-ascii?Q?GEYgzSENWBrNlGJIyYEslhAp775gM27Iq+lqnDaatDP2KD5lMMTYLwz51/OW?=
 =?us-ascii?Q?SqjMaErA/45GjZbMKm0APngUS+G92rWnhQaLQm6ajeYaoR+BYnumt6JVcRSa?=
 =?us-ascii?Q?8Z+w4tbt8KN89AgdPVIeqmQGG8H4oq7DB8k0NpFN8I2yWu39wK5W4wf52wTF?=
 =?us-ascii?Q?3IO1BmYsBNzxlHeF2OnzeFM01AM+R/+YN8PpNC825XzBi/kCBrEGlMEnU0C7?=
 =?us-ascii?Q?etHq5CyzHD3GZxHearksOWXJaBwe4OXN/BlhdqfZmIWJoC4cW+vBnC5vsR2Z?=
 =?us-ascii?Q?UNtAEOS5Ij26QRBHbfUP9UL/uIHJyVQ7+MGrl1jxhaedcbcA5Y3gq3gL9PVa?=
 =?us-ascii?Q?xJGxxNoPCexpHer/YuEE4U2YVwriSDZLPojjq4FA5zhmZ7HLEeb6ccGDvbaR?=
 =?us-ascii?Q?g4zj20xbJy+8VOqqzSd0r5MNfU2N6tw7Eezk1cslLCjmEC13W8g3oBrCURor?=
 =?us-ascii?Q?pruNrO1Pqeyuy/+kT9h/4kpV6L7qkIq7YrYz5FtEsYF4LOhDv34gGFwAdxGP?=
 =?us-ascii?Q?dYpFuCmfNlwhPCD4TT+HU2hVEs0pI3bmL4NUwBXL50vz2fh784DALpxYbuBf?=
 =?us-ascii?Q?NsTr3uGtreUzuyfcI3QyC6/SGtgdN0Lhu7zi5dMsjNkWwc83OMQdfauIW7an?=
 =?us-ascii?Q?7ggpwrBdka1nnM1zWMqVUgkdMnAxcC9nJS+foBh8dfc+r1iIVYzz3ZQeo6W7?=
 =?us-ascii?Q?oLyyM+7sp48GnVtBN8c0bE6Z0ds2P7UhmR/Bo0+9KOLLwJNUGKv5+YbO8+Iq?=
 =?us-ascii?Q?/Fv8qowZOuy/q0r3/9rPZ2wTWb3gYFmK4FQPyXTURng0Hzx1KHY1x0sspJxP?=
 =?us-ascii?Q?vZJuxeL3m3ry7E2Sqx7l1GpYeEehyhd2GIZs7dLEfoM55jPjXD5iwG6/G817?=
 =?us-ascii?Q?CRX6SXTv3JXjlNCbzLdKQOR4dNgHF4gpUuTT/9s1+rJzvotVXYuG6//D6SyM?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 913baf91-1efe-412f-b62d-08dc59a6414f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 21:36:17.6207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9UuSumri6Ql1ehlkOZ/IzrnY+WFN598iOE4eFab+WjqlgFkraCZilKHzlgzvGDrVqJU9Y9qI8DySRZkne7tdGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4989
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

On Tue, Apr 09, 2024 at 04:17:26PM -0400, Oak Zeng wrote:
> Since we now create struct page backing for each vram page,
> each vram page now also has a pfn, just like system memory.
> This allow us to calcuate device physical address from pfn.
> 
> v1: move the function to xe_svm.h (Matt)
>     s/vram_pfn_to_dpa/xe_mem_region_pfn_to_dpa (Matt)
>     add kernel document for the helper (Thomas)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.h | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index e944971cfc6d..8a34429eb674 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -6,8 +6,31 @@
>  #ifndef __XE_SVM_H
>  #define __XE_SVM_H
>  
> -struct xe_tile;
> -struct xe_mem_region;
> +#include "xe_device_types.h"
> +#include "xe_device.h"
> +#include "xe_assert.h"

Hmm, including all these headers is a frowned upon and indicates to me
this likely the wrong location. The new header hopefully is clean with
only forward delc and function defs. I know Xe headers are not great at
this but lets not make this worse than it is.

Maybe should be xe_device.h? Also if we move the entire implementation 1
*.c file it is possible this function be private to that C file too.

> +
> +/**
> + * xe_mem_region_pfn_to_dpa() - Calculate page's dpa from pfn
> + *
> + * @mr: The memory region that page resides in
> + * @pfn: page frame number of the page
> + *
> + * Returns: the device physical address of the page
> + */
> +static inline u64 xe_mem_region_pfn_to_dpa(struct xe_mem_region *mr, u64 pfn)

I'd change to xe_mem_region_page_to_dpa with a struct page argument
rather than pfn. The pfn then be derived from the page.

I think this better as we will 3 types pfn all with different values /
shifts.

- hmm pfn
- migrate pfn
- linux core pfn

If a migrate pfn or hmm pfn were passed in as argument we'd get the
wrong dpa. I think passing in a page is safer and less bug prone. In my
example if we had a migrate pfn or hmm pfn, we'd use the appropriate
helper to get the struct page.

This also aligns with how a similar AMD helper (svm_migrate_addr, [1]) is
implemented.

Matt

[1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c#L234

> +{
> +	u64 dpa;
> +	struct xe_tile *tile = xe_mem_region_to_tile(mr);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	u64 offset;
> +
> +	xe_assert(xe, (pfn << PAGE_SHIFT) >= mr->hpa_base);
> +	offset = (pfn << PAGE_SHIFT) - mr->hpa_base;
> +	dpa = mr->dpa_base + offset;
> +
> +	return dpa;
> +}
>  
>  int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
>  void xe_devm_remove(struct xe_tile *tile, struct xe_mem_region *mr);
> -- 
> 2.26.3
> 
