Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C76CFA441
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 21:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E26A10E08A;
	Thu, 20 Nov 2025 21:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WkfPb6jG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A8710E08A
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 21:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763673515; x=1795209515;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Dv84ud5SA8YlOK4SRv6w0WD+yVqox9/YtCV6SkAKVPA=;
 b=WkfPb6jGi1thbL1+UjuD7GWj89PJZP8Z0GuKM53ZnVw9nk8PYTjD0Drg
 9r4EzA3gmW93mpIHVxN1ZR+y1hrGWSxL0RKV/vY+jyvuOUVqm2Rg714SA
 aQQjcU6I/jKOZp3YsDAuhUUW927aeWTPR/kCe7DH7x3ytpoLX9Edwq7lF
 /yjZNd5HE8S8thxnvH3OYG4jfmiAtbataEXrwzIE+Ybw9wmhWaIWzdXuK
 eZTj53qVmj3ltpzDc1KE62FUNaSCPIoAX9J7BVFw1S5G3gXO7Cs+0ZP1V
 RZjEruWvmeUdhCaPnvmXfhXZWHWAoD0XTbIhkC4Qlc70n2oAgcoKB/YyB w==;
X-CSE-ConnectionGUID: HNRCQQAPQLeZYlV8Q729qg==
X-CSE-MsgGUID: SVMXcOXdR8yFeIpx/ra22w==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77228185"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="77228185"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 13:18:35 -0800
X-CSE-ConnectionGUID: SqputSXTTl+TjEMdq/lA7w==
X-CSE-MsgGUID: p3AYiyo1SiSVeEMMpWZB3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="191171539"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 13:18:34 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 13:18:33 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 13:18:33 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 13:18:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVuCA3lWVHm2V6Z0SezhexCuYK/MYJaJWbUrMICQowQ7WZ63GoqDlyMshSacswF+ptxdZVvkYFrCzVUV2I7bTguW8glGdvG1y4LBNyUZhAMbS4bvpZuGIy0D9HH6g5C04a/fI8na2dPg4qRU45myyaOYm6Z4P6ogsPn//tFyVRLJJoVjWRR2RFpOGEo55NYnbjQd2dTVZxMe9V9FLmMOIhUo8rHTgxiNvp4rsYqG3qGTJtsBV6JoTvJZmgTOAKIHIRQSG3DcEV8O7fX8TCO5M7+GNz/vgvEYOwZ8Rf0VRpvhmpuptZTuCozKl04n9cAmmmemDNFsx0gz7wF/61dwug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44tJlUv496SkuvrxdH3fHi5Nk8NSmS4gfIBQJamMLyM=;
 b=vz/1z1zwpAtn04uTpYW+qw/hw3Eaz4XsDc5zGnrzCE6G7sB/HcJ6/UTJEwX8lRBIhCzUVCBEio+f6teMeBhmSfh0lWNHg/J5yH+ocPuGCrLa+4CBQdQHG8/Op0q56dYBViFh/BI2Vs5JvUggJQQ5xDMFU9BClpoX0RW2wUBiNVew3B4kGs0NXItdOxkCCPTNdYnta3yPjp3OkBafJCCghJrUusMc9N4Kt2uFPCuRGqf31HPCiFkNmWJ2QRqWeg6mpCRCkPd4zf5D4Xig71fvOkevsSVyw59Z7+EnwcRvtT9OIeR7XMxIYmQjxd8SmHeBWgqurw3Xz1kFzPwm7S6Stw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM6PR11MB4675.namprd11.prod.outlook.com (2603:10b6:5:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 21:18:30 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 21:18:30 +0000
Date: Thu, 20 Nov 2025 13:18:28 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVy?=
 =?utf-8?Q?e_for_series_starting_with_=5Bv2=2C1=2F2?= =?utf-8?Q?=5D?= drm/xe:
 Track pre-production workaround support (rev2)
Message-ID: <20251120211828.GI4063759@mdroper-desk1.amr.corp.intel.com>
References: <20251119220459.3997343-3-matthew.d.roper@intel.com>
 <176367328063.15649.16251382227788014258@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176367328063.15649.16251382227788014258@a3b018990fe9>
X-ClientProxiedBy: SJ0PR13CA0227.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM6PR11MB4675:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f3a76e6-78d9-4b48-6c88-08de287a5a77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yvH093itedixZFWNGcT+hzh+E2uTndy0x2LErW6sj4HGBtk3JlfxfjtFIuQH?=
 =?us-ascii?Q?BUHhG7UV/oPN/tHU0p15FrcqOAu+D9Sw61kIJd8e+kryGVw92/UdXQ7xz/GV?=
 =?us-ascii?Q?z0r2UkJ2gh2C9vC2O7YjLZkGrBAtpRdOtO2bRkay508jOBHDcG/5Anm3pAWn?=
 =?us-ascii?Q?kRohs/qlri5ft33a5oLdcFC9YqszhMR22pr0Bf4kolE9LIprY4He+nRS3vNJ?=
 =?us-ascii?Q?fXxb9GrOB8F7R7qsa+0Tv33tmTwAYMic8P9pa8knmwfMRHqJtfHenlZoDpwL?=
 =?us-ascii?Q?QMn6X5bCCWEaVwG5/TklXv5tlNqT4MWs/LmgP4Z0FEB9I+hH/pLNqM5CQGO2?=
 =?us-ascii?Q?foynd/tU/tRhLwhzgM3UspLL4Yo3FICAAjePUVCv0Id6mqZO7/tBABY67Oy4?=
 =?us-ascii?Q?6VdJ8JqWyevABFWv8dnvIH1/BXhEmmX4ENZ2jDORv3Cj1obgWXVebEIoMox7?=
 =?us-ascii?Q?uhJeTND3yqrQkWq00pJVbYnmgHt3zYC0lR0NvLRpXpR6cc34JDzy5WPI0LEi?=
 =?us-ascii?Q?/rxB4h2iTY2Wff9QEP4gkgx240sFz6pskjhuLfaMi8lEtbJea57F9FHQ+pR2?=
 =?us-ascii?Q?e+T9DnPjTRo/5VawrNdL/sCsoHGwhiBsfW2mIqwS566ZNzFOwDmZRNs9Af9G?=
 =?us-ascii?Q?CUzq51VrgG+LX+a4mUY6uzvPOC6pAmUSNhyrE4xZZlZslQyVPjtbJorQLP4y?=
 =?us-ascii?Q?kvHCK+asueZtMwdHrsuDrJU/6cYBFPyaUdZgiZcLpumNWWlA9TDEbWxkZbN7?=
 =?us-ascii?Q?aJfbeRslyz09YC684/raElCdK6R9u6EnX3EjYZViSCw3oB24Tkv1uN61faSP?=
 =?us-ascii?Q?3Q4m2ss17H7LPq5ejRm8aDDzoB2NFUIMiqmyGY13mZFr2dvlMW85uFqSsyjD?=
 =?us-ascii?Q?pXVhLdhm6mS6wamgEuGnys7ils+eCqM4L+QGiyF9hiGiUkb4ThTbm6dPo5+X?=
 =?us-ascii?Q?NFX1maBUut35qEJqucHixNPD5nkLVcFD9E9F0TJv0O0dXsoDmSn6ZQ3HM22L?=
 =?us-ascii?Q?oXIiqQ4/WqfLXW9j0kGvUoc9xpI1VC5SNU8eME3IBPeumSaxWB5vkQHb5a/Y?=
 =?us-ascii?Q?HHxKx7QyxCIQp0oY8EI+pIgWNKstiXtZfOlro3ungBWgvSKLSsk9EjKHUbx8?=
 =?us-ascii?Q?CagiyqYJ460VQc2I58hFMYFM2/4X4Gsib4UHKq93vquZ40U7H+vbf8I+3vN6?=
 =?us-ascii?Q?oajwttcjWcbQ+pvH0JampieIMhzJkIQWdt2dWCxCIaYd0WeNi1lmvp2TmSO/?=
 =?us-ascii?Q?TPwZ3fKUjwV6ti0sVGLqhjCEQ2OrpErFHZCikqLWmuituvvWY3cNkMVhO7xI?=
 =?us-ascii?Q?RXy+3tb574eCdlWGNSI4qtSPdQ5q5ACGIL5GnLA4oaq6tDxXTRfI2G3t7Mft?=
 =?us-ascii?Q?uUu/FSTsQooD6sQE1n+wkGdbLJDFyqCDxaBxXtnFqVEPPBHuFQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/UxpvZYZNfs2jLNappfCwd8OdxFiFBFAvL6+nNKpd4ZOlMC+p7djvrIcPvPN?=
 =?us-ascii?Q?xPMAORVj9V6xgVUbLfk9qj5qa3aKGrpoiY0YKN2vBOqE/wDX9DZLN9gPE7tY?=
 =?us-ascii?Q?0X4sbCGvArUEVnW1yP+CC2xwIRtxTlpNt7kcoih8UC7VT5m9OtmYNNpcb9/Y?=
 =?us-ascii?Q?O79ndWUruTRNIHglovzciy6B94ZGo9AAKOM0AjnChbpa7sNFMobRNVk8phFn?=
 =?us-ascii?Q?Kn0weEZthUICQi0C6f4hUEZWqwuDf2Q+cq1jWLnLVulJjeBNz9tdzEToGaNi?=
 =?us-ascii?Q?L8A+LIADpFfWpNKuzREcusa53fdFisTxaT7S0qwnAvYHEmJtSAiRppJXmlVP?=
 =?us-ascii?Q?f2KzzyVCwnH5UZDajcTliKRHHAIkbeRkdq6KUEU/f/eU8t74Gof3B+8/GRij?=
 =?us-ascii?Q?VV4hN+VAm2IgEG0LXgXJxKYQiqjWYtiQPJF9yz0ofZqycv3Pgt69irsFn2+b?=
 =?us-ascii?Q?0j8xt3NnHQIA4yJkt7p/bQpUcacUWqiXGZRCOlplVhBPRWnT0iwDd/apcGmo?=
 =?us-ascii?Q?U4MRDHSNbuNXpIXJ6gZkfuWMmQeVQKuD3wMzTV7gvkbfE0uO8dWpnN1Mzq//?=
 =?us-ascii?Q?D7xavh1q5uQJ9yPyOn/kwxUl4z0C97k5bKRIFhtHN1OStGRimirMLTsIRht7?=
 =?us-ascii?Q?3cGARBZptuSkuUMv8QOmEpQ8npzSzN/QGN0PX60VdqvpSNfErDwPPK/Xlv8f?=
 =?us-ascii?Q?0pgNOwGzLRSF8cW028GOeWTPKgdJbK9PSDy0G4WLJNFHvtw42nfP/J5ncURE?=
 =?us-ascii?Q?+lW2QQw54ysEveGrZsHMEdJAxL0gKgDD59cZmR0YytWzHWd+UqNFq9EHBWo7?=
 =?us-ascii?Q?WuOdm3+uYZaFucIcqQjzEzU+S71WVJRyVehnkCEUud2ceLlw0HuFPwa/+7eQ?=
 =?us-ascii?Q?ZQz+OB8Sz4ELuE/HWzGcM9fVjYEAsDgqBW7JJCphfjVLZ3Q9lW/CPu2ln6OY?=
 =?us-ascii?Q?Me+Z5NYyrbIrrEEabSA3MsDzDuXL09qpRbTxPrX3qTZ5LZyM0nTDcN23wSz6?=
 =?us-ascii?Q?lUGVhnlqfPWbQ/7TFemlmrQHGFFFam2UhKhByAfRAfxSlcaPIuXvhxPHsHaC?=
 =?us-ascii?Q?0zPHFy/ViptCV2gghx1tJc0A2wUK931hFmpDl+alUOEdUMNV7HfgGRGIfmxt?=
 =?us-ascii?Q?YQFqQXHHbLKO9salYNrqpkOcZp5XqSMLiTG+RXHEfEkSgzxeYmoclx4LfEPT?=
 =?us-ascii?Q?1MqMS2ni2I7pgM91+Hfn1LsAQljg7rh5oByyepOOv7CUyT+qdylMDU0+M+S3?=
 =?us-ascii?Q?rIg07Jhmh6Cip9tsBxyzzcPd9HvAW/MyQO54SDR75q97TGcg3BM3hqkANJkZ?=
 =?us-ascii?Q?AGFmW4fO7ZZ6qX6kAsL7FxlqjEOVLyYc7OUkKd08zLHSkdiWoOyC1lxdehYI?=
 =?us-ascii?Q?uDjG2BPlriKtadyAoAmMwv5zWQZa8dbnOQmyI2BP3Td0CHMKYKqzbqcsUbAE?=
 =?us-ascii?Q?FzBmmPZ4j9VcSFvh7XqxYXwiFyoIP0++ewf3IUZIAvLQ89h7Xo6zyMWI8FSo?=
 =?us-ascii?Q?l1FXA652ifOEsN52KefQ3UNfkIAAlv4Z1Mj+8LVsB1ibQ/woLAW1bWULjiTQ?=
 =?us-ascii?Q?707Bs2/MBPS8na3BIihmUskMEHCwOafRiiA4dU0g/OgnbwcPYX9E00vi6CI3?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f3a76e6-78d9-4b48-6c88-08de287a5a77
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 21:18:30.3720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5XwAGRMcTbqvbgJdOAdGUXVAhYfWSAIS+6nlIC6+GZJkyczElvE3CL++d0P+dcRHSfLrdfkgPnaCoOJt0k9fdRabPWJYFlV4vKLQF/C9POk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4675
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

On Thu, Nov 20, 2025 at 09:14:40PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [v2,1/2] drm/xe: Track pre-production workaround support (rev2)
> URL   : https://patchwork.freedesktop.org/series/157804/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7_BAT -> xe-pw-157804v2_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-157804v2_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-157804v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (13 -> 13)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-157804v2_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - bat-ptl-1:          [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html

Looks like I'll need to add a !sriov check in the next version as well
since VFs don't have access to this register.

Michal, we don't have any other means of determining production vs
pre-production status on a VF, right?


Matt

>     - bat-adlp-7:         [PASS][3] -> [ABORT][4] +1 other test abort
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
>     - bat-ptl-2:          [PASS][5] -> [ABORT][6] +1 other test abort
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
>     - bat-atsm-2:         [PASS][7] -> [ABORT][8] +1 other test abort
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
> 
>   * igt@xe_module_load@load:
>     - bat-adlp-vm:        [PASS][9] -> [ABORT][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-adlp-vm/igt@xe_module_load@load.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-adlp-vm/igt@xe_module_load@load.html
>     - bat-ptl-vm:         [PASS][11] -> [ABORT][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-ptl-vm/igt@xe_module_load@load.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-ptl-vm/igt@xe_module_load@load.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-157804v2_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@xe_waitfence@reltime:
>     - bat-dg2-oem2:       [FAIL][13] ([Intel XE#6520]) -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/bat-dg2-oem2/igt@xe_waitfence@reltime.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/bat-dg2-oem2/igt@xe_waitfence@reltime.html
> 
>   
>   [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7 -> xe-pw-157804v2
> 
>   IGT_8636: 254cd102396ff95d61f2ebe49fc09128878bf483 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7: 3d718db04a365cc44a3bc81ffa4db7bbd2e645d7
>   xe-pw-157804v2: 157804v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
