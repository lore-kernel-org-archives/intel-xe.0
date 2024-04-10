Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F54CD1284
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 21:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2182511331A;
	Wed, 10 Apr 2024 21:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VEcOjJ8v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068A1112E09
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 21:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712785160; x=1744321160;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=chMMo6oSK62hDZbQ7kyydloPtxIchzw1B3lTSn+AG8M=;
 b=VEcOjJ8viAcUVOXJgXGF9VNRSC6TdlmXkyNtwPHamRqtu+bY0tgnAeHQ
 fQfVUZCW0mK0TvoQ6dPcjLsJdajftp7yA+CFpl0N5wDBQRPiK+rKMHYWc
 OhtAlJaI1Fb6YXWq33HNfwdAaT8bCZG0HXiq+m4cCCGIibF2qB/Q9zAK1
 TJZqRZ4bcnUPFuxyGUcaehuV2Q7zPS3tozNg7byXBiG5yCIiFzyJa/ZvT
 UDBfqCPHI1d3Qo79LC5PioLmGQIYHxaCTFiYqypKSr7gJxNAi051f7cvY
 VLFUkHmNTqrjm40A4UR6hMXu+OpA6OJtZAtLppN/VuXB8+IRD6bIJfW0G g==;
X-CSE-ConnectionGUID: 1xBok7JATPOvIXxZ8GNz1g==
X-CSE-MsgGUID: l0N99/GwQky5FcVKGHVTtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19566667"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="19566667"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 14:39:19 -0700
X-CSE-ConnectionGUID: O9gol5C3RMCowrhQ7+J+cg==
X-CSE-MsgGUID: 9IlEdQnzTnuE3pZCBFsLtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="20754481"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 14:39:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 14:39:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 14:39:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 14:39:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/NxxWFt6u6mY05JRhFsxxkeo1hSKXy2kcFXZjJoizPK6AeZ5+K2XfE0ESymyVTqERGpiFlQuuOIX3+RO4c7lxErNz49AOZKQ+KY1wemrms/1axQOBxZzvwLE79ANKJv+vCwZKxaHZzHIw7U3KdJjGI0IRHbqhw/C45NeJX/C1djc2xypXM/rZtIUKlM4ZyOWVKvoDlgwxNhwSg1UGC1vR//k1pHUE9AqL93Uw6SzIlWf8CvL/YkHyL9uN8UDvMJNqEKfHD3HLdZQJlgJR/zo3QIxaig6HX8KQZycuhvdJOzG0HheI8WrXTEFdryX9nUr2G1QxziUkR7/jblGJgH6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qp4jcrlUYqfgIK+ZlgeWf4mA1XdZCQqc7rc2tGuZyCc=;
 b=Vw8oa2p8O6zsONrt606ykpvyCetR+DdhGQItI1is0JavPiKovCcqfs1FiKUGWg1hamLKkcT2qGVfhlyDw5CTgwd7uup37J0xT21guvZleBlbRNfm1oPrpMIEyVEAh802tnaAbGZY/ormrg/CjcDCp5QWsb79FdXPQ7J072ZTxbPo4ADyQZj+WLeAqR+VEsScqMqN/g+Zb3SDM81RNAP39BO6BQb1LAD6mdM71K6NNAMmJt539c+b1vX8nKNq022CVDoAA2x2y6l8oI+mmcsE8YoqXcpuim9B/8du9J0ZkkMgTCFSnx1KWydmn/tHE61sC9K8Mm1/pO+sD8ZrZSlC6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6485.namprd11.prod.outlook.com (2603:10b6:930:33::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 21:39:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 21:39:10 +0000
Date: Wed, 10 Apr 2024 21:38:03 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <krishnaiah.bommu@intel.com>, <Thomas.Hellstrom@linux.intel.com>,
 <brian.welty@intel.com>
Subject: Re: [v2 16/31] drm/xe/svm: Get xe memory region from page
Message-ID: <ZhcGuwnz8hizLU2d@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-17-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240409201742.3042626-17-oak.zeng@intel.com>
X-ClientProxiedBy: BYAPR11CA0066.namprd11.prod.outlook.com
 (2603:10b6:a03:80::43) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6485:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aW59mG/adIw+72T3lg7l9+oSGYbHzw+vm3f+HFlZ7+OQL7/lwxW0DzXAPrRZSwMJflM7twbEEi5sOYwezIY2SbPGVubSW+HjVP946A8NSQFdPv9Di0AroIoM2HduT+EPXbslj+ASMnC4PHyfEr2c5wQAUoezAOAZ5CwyDTOIhOfhn+SkMnvh32LmbsFd0KgyFKkqAAK4hbvjG7luADAxUo+eWmSNwuQQJGr0MYRIlHhleUK3fQF1QXuPsLKsNeRC9n5HuwtpNhmA2k5V2ZgTtLM76a64HoaFiHY4X2Z38oqW2JVSmModFs5GS1bZGgifNN/Hswh9vZhnNQJfgXfOtZb9Q+6yAf+dUnnfl2lR3CgnZY+WlPH8yH2H8VsYIuZMfzocEaZvbmE678Fnpa52sbCJRFtTQnxN4qCa1O43mQwiMcCbOozNGia4BstJSm/BnlhqiUhIEtXpzrD17sIk+IDSE47aImDgqLsEJjTkmCjYvTpoHO9P/gm7LIiHVeDGJOZklxBzKlpb80aNbcHA9PNr4TGnNpjnFDRmERMRop6wcvOLVoxUP8r4uWoeBE3zzlbdqh1O3UUV/ll9YK9aZSVxh7sShBVeDDggYiwwfyCQq8hZRTVdK2Lf68m9joX2RDIgdBhb7DylhYNH+RqyIoeXXyQyLpjjifbMN0xHnBk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jkxHzE6Qfzp326Y4xVxBz5+7exQ/pYibHSw8mG7Se+Bh+LU/2PFua3E6adTO?=
 =?us-ascii?Q?hTAvlFQUxpOH9Lt4Vh0Cj6GOzakw1seInXxU0dV9jniBQGoDfFrbQQBY6dts?=
 =?us-ascii?Q?vTX10Jnb4vPAeVAYvgF+6rWsjJMfGOWAg1EuvoYg5oxxp5S5l62O3eQwjOwq?=
 =?us-ascii?Q?ZN50j76HG6NUje6kX2Za4hgbnFO1eIvtxm/k5l8WenymfK1acAxCvR9edxTI?=
 =?us-ascii?Q?0+HFRFi9DIqtJQ6wjCBWYd6OCrSP3Hom2eUfBoUUzgk4vTCRLrAjCncsu5+t?=
 =?us-ascii?Q?KKSzZi8EzgfZV2gZYG6vOGzC0tUY9WjIMe4oYLRQW7qTOaHsKl7oTmqZW8cp?=
 =?us-ascii?Q?SmlNnqhgZhtgHOUzQVQ/FNtvQnWUW2dAOEY9IXwSSUCqT1eg6TPg63oD7Kpx?=
 =?us-ascii?Q?YUK2g36hi3ONnuAfqB+3Le5E3yK2evef1zTw4aUwORIFFDCISSWG9hKPJKVh?=
 =?us-ascii?Q?7wk/lqtnutcL70FSLnnBxrqz/t/SnPl+nWnSVTZOGZaEqIIVkCv6siQDoPfp?=
 =?us-ascii?Q?SZ4reuMRzgmZtCkdCocMNBlRPLuFifXNFx06+eTyF1g0HDX5wRNXdOj/2Ysm?=
 =?us-ascii?Q?eM0FY+MRmFW35zzdDLnI/Pt4bpvG0IGq2u62Us+z2cS4HTN5Kzg0altedUjt?=
 =?us-ascii?Q?lUha1KHi91J3oHFtPzQDnWWyPyzNKkzB/oj/LMBGzx1VCzUIwIIMdmntMAoe?=
 =?us-ascii?Q?gn9hmrYePmYTEveIpzLschQoEcUho1iT5ANTqWRhjhkZ7GJRVNXM6m8JaDi3?=
 =?us-ascii?Q?d9LfapKTMKVBpSBmxoJBZr7XkcZnDfooGRLk5zQTErmSVkKacfqLBwvU1Npq?=
 =?us-ascii?Q?SFo86OreCjeOynardANSLEz/fbBWsEPQKU1oFowsHJuhx2wk69vyAQOnflrO?=
 =?us-ascii?Q?YUCZcSY5hokj9KUFtQtyNf41s+IvyDSCmdrAFp2D5pkpTHEwykNvLrcBi9iW?=
 =?us-ascii?Q?c4OZ5UAIUXGwIsE8pKZlEbwu++deVWZKENEd4R3+XhV7+wPWaJVV8KDkZJUz?=
 =?us-ascii?Q?KX7G4b18DC7ncAIVxKfjVlbRg+b7WN/eXqFP1tDomepVNjsf+qRtQ7KGuCig?=
 =?us-ascii?Q?MjuH5RpYtxyqt02Ggqr0WuUqJUwiFaX8FlJicLCoUAsLnkVEBihest9JrprJ?=
 =?us-ascii?Q?wlhOARKNigo71MCcr6tezV1LIfFJXf4UHJDM+2nJ8oH9Gh0E+Ve4pAfSDcTG?=
 =?us-ascii?Q?aHBHT/1ycdO/YY8POXOcBCmhEZs5ypb4bEEXFO+kwJGf5G1/WSa988Cz42Ij?=
 =?us-ascii?Q?sEcHYAJh2ZmWOZaF3wobAmBrZNIqwxMG84RncBd9v/8AeDRzQGcZNWj16+am?=
 =?us-ascii?Q?7nCvgCDvBs1h7fbsbbH8E9CONbfSMbBa4XVT+T8NnCeG62H5DUW6AMax6JGL?=
 =?us-ascii?Q?7DnB3hexhvtttIIOCPXcmdsbAO0nZ6f6yHyDTyLoqOmzzF5O23mkL9ENogmZ?=
 =?us-ascii?Q?HfqsAoWDHm1tfhFNBYQRjnnOcRE/TXMw9R77EeQlKhh+YScA2EsF8nRJxZ9j?=
 =?us-ascii?Q?oQV6xhVb5IJ+IMsy2T55EfcqFCPvLBAfSWAPytJMtFC9eJymx8pi6tjK+Tjm?=
 =?us-ascii?Q?ddwEt2z47Odsh5BR2wyU7EP3ujiBhB81X9+ouynen1etk6LjrZYHPn/wo2Cc?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fac13182-bf22-4e79-1eb2-08dc59a6a844
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 21:39:10.4212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nVKSJVNjClQgi66gisuIb9sXv7FX9TIf/d7HFIngJc4Qpdx/iIBkv/QAJgNOvvJu+76eDL0Z8e1LuzXjoFi8Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6485
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

On Tue, Apr 09, 2024 at 04:17:27PM -0400, Oak Zeng wrote:
> For gpu vram page, we now have a struct page backing of
> it. struct page's pgmap points to xe_memory_region's
> pagemap. This allow us to retrieve xe_memory_region
> from struct page.
> 
> v1: move the function to xe_svm.h
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 8a34429eb674..624c1581f8ba 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h

See my comments about location in previous patch and also if this can be
a private function if implementation is in 1 *.c file.

> @@ -6,6 +6,7 @@
>  #ifndef __XE_SVM_H
>  #define __XE_SVM_H
>  
> +#include <linux/mm_types.h>
>  #include "xe_device_types.h"
>  #include "xe_device.h"
>  #include "xe_assert.h"
> @@ -35,4 +36,14 @@ static inline u64 xe_mem_region_pfn_to_dpa(struct xe_mem_region *mr, u64 pfn)
>  int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
>  void xe_devm_remove(struct xe_tile *tile, struct xe_mem_region *mr);
>  
> +/**
> + * xe_page_to_mem_region() - Get a page's memory region
> + *
> + * @page: a struct page pointer pointing to a page in vram memory region
> + */
> +static inline struct xe_mem_region *xe_page_to_mem_region(struct page *page)
> +{
> +	return container_of(page->pgmap, struct xe_mem_region, pagemap);
> +}

If the previous patch is xe_mem_region_page_to_dpa and want very robust
code we could add an assert to that function.

xe_assert(xe, mr == xe_page_to_mem_region(page));

Matt

> +
>  #endif
> -- 
> 2.26.3
> 
