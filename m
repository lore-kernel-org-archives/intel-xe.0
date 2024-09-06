Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E275E6FE49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 23:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3E810EB26;
	Fri,  6 Sep 2024 23:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4/1y4Y8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81A010EB25
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 23:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667007; x=1757203007;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SQXX/btA1P33eakPWJ+LGbGM+j997sL4Y2HEVEFgvuc=;
 b=Q4/1y4Y8IhEipbquR3ALGiLtvKwU2/0eAAieZMp6Ej1yUylRvJec3pgi
 zRTvNYFyBsC1Z6ebstEUxJrrzl7OcbxWN1f5UP14/tewd/TqxG2wiaZ4H
 ey5e75n76M72mp01J3nQe0LqN2oBcqwiS2yRvMR4bZ9H9tYgpuYdxzAkP
 lq3icRkRzs7cyY56wtfDOlifxbPb63gZ0OHaHUaPDW5XY605JOnGpKRkI
 ye2hZrPqJZJTnpxGGKrgSgRLEPGtqwVYnudFwaX6ZW6+/AQ4aTjfShR7Z
 JTLMqwiFISVGwz7I0WH7MKUium2WmedhBjz893MWCzJ3iKRQx30Kqhe1e w==;
X-CSE-ConnectionGUID: a5fh5kVITuiNFp8Y/dQXAA==
X-CSE-MsgGUID: YE0GpURnQ1qpjeu8v4deBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35016280"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="35016280"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 16:56:47 -0700
X-CSE-ConnectionGUID: dZadr/wPTxikdb4qr7P+3w==
X-CSE-MsgGUID: JoIrn0pqQsW6MYNMEv8crg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="71062288"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 16:56:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 16:56:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 16:56:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 16:56:46 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 16:56:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=so6rxIS2sO7qrp9M3yoQtDkeAe+spPoIOZ0AOA4tayIzeNS4L597TQo58k8iJK0aQS/S9m6KKMnQmik/rYA5VNViiX9afOLmc7pwegetaaU9F4gm7zomUO8BBsXamsezJvV3wtrgiY847YajntV392AraKRSfnWzhkXwML3w+hW6S0T3qAcqbhO9Ie60qNHJHZ/78ESwXNLnwzgQIkFjPsY8rXud7Udn7dmyHlCTsDAG1+SgqLAk+ZADtWMAR8tpJWenudsl1Ppkqz63Wxh4T/U2zUGG66ofqsQvP45oLiYK9YDsufA0lYSxuLFfuU7AYzVX+bIRVE3V71/Gj6I85Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjCvQn2/SgKeBMWkyZY5EUQGR0+9yecYKjxAdQZG8S0=;
 b=TOFs3vUZgE5Ji6NsXTzkzQUYigpDICMZmdG7jv/fe6jyCxK93XPcN4AJiI04C3KP0grXpQsqJVlXpauJqbIBcaE8HBnao56Zg+rEXHS72fwWxl+8dnb/13kVfk2kZ1LA+V6ko7QXcdIOhNBcAGpTwtMQlDc8/hlC3qqnX3knLKZdDNMsBY/HHRixFEhH8PgINaH7wGST9wKBMXLlYxDMLzqU54K0Ng0fpfruDwRuiKZYi93K/qysGrWpuPEIqEd2ASFZciUz7YQy3AY8nZOQr+yCpEbazqfPAeTj1KHJlC0NjulRUwZ7oPrXxAADixSYWn8cvMMKCaPBeTydO/Fh+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV2PR11MB6070.namprd11.prod.outlook.com (2603:10b6:408:179::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.18; Fri, 6 Sep
 2024 23:56:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 23:56:43 +0000
Date: Fri, 6 Sep 2024 16:56:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Haridhar Kalvala
 <haridhar.kalvala@intel.com>
Subject: Re: [PATCH 9/9] drm/xe/ptl: Add PTL platform definition
Message-ID: <20240906235640.GB5774@mdroper-desk1.amr.corp.intel.com>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
 <20240906215153.31210-10-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240906215153.31210-10-matthew.s.atwood@intel.com>
X-ClientProxiedBy: SJ0PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV2PR11MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: dc758dfc-a98e-4dc6-0c2d-08dccecf8ed1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4qUaAMaHGwabCaPl9z1yiUeBmgS3kRJUFpfJoHzypyliklGXp9lvmbEzGj3a?=
 =?us-ascii?Q?hmuprxJiffoxH6Hl1yw2f6e8nHQZYk4TIodyeCIGhEJTTvUlFu7XDseylGxX?=
 =?us-ascii?Q?t9dw1MysLm31TNX7lSP5Xubn7BYR8tr1VWQIgG78ihbmUb6xwOB/U/7AW8Vv?=
 =?us-ascii?Q?qkTbF6yQng1J+9MqkcPD3VSXinGFQ3RxquZmmyewzW9Hcz2AtWEILgFUigyX?=
 =?us-ascii?Q?bHHwrGToOrkh5LddOBaKZWS95kaYeltUSyPeyF4yV6uPe3nKIfTfwudgXqio?=
 =?us-ascii?Q?dsT2kROD3P5UUYvAkJzDAAq82G8MPBds7iiMEtcWTJuTPlQ/wx4OUOL6od1C?=
 =?us-ascii?Q?yTmUEL47LfL15y2CQxzPKJzHSRiA9AbqW6XfuxOOVfCHu8P4LvBu/AfMZuNz?=
 =?us-ascii?Q?mHQRthAtKt4kjNRZv0bxhBsNFC9AjmyUjtKKCwZLHyLgSmMSOPYz335lA4o+?=
 =?us-ascii?Q?2bAlNCMSzzNzAP4TYKHvmLqKFxv53dsk7xBNHxTIRVIfvyeSSmb0vUf+nL1h?=
 =?us-ascii?Q?k0i8aDFLq3YySPHV7Ljy6m1pthzO7ApBMHBbV8K7egpAG0w9LsMEjEUpZnJG?=
 =?us-ascii?Q?88ZQHD6JLNwenMNiww2jv7paASzgh3TPtLD5wDkjZzydn2Mvd7eGSPA9kUb2?=
 =?us-ascii?Q?J5tsR4Prxl4x+Is6iHdewUcNQVNTTLCibFTae4U0IDceSnrgtynSx/9ilfkc?=
 =?us-ascii?Q?kPxgv6ZOBHCoKxNRnnqkcitN6ybh2IoT/m3CUnzjpG4nVZJVAX9xWV5giMqu?=
 =?us-ascii?Q?mroMtLr1abrAAACAsMFWeYT5L2PDi7eAdZYHrBBFvHLxG+jPeCFMPI3vxMdG?=
 =?us-ascii?Q?sYCB3gPRDe2aVpVY/JRyjImFMGN6GP0JAxkVlONyjWvuaKBTqyG2z1Jq21Lp?=
 =?us-ascii?Q?5R/sAYgouCltMmBgs05LwXgXsgqA61N5SExMC5PtsDf5ArsbLaly6C7KPfIn?=
 =?us-ascii?Q?1dQ8K5L5iHWGW1c0MLBcahbcM32QzuPKhAc67/5dGfB/8wssDI8JG0eGzjk5?=
 =?us-ascii?Q?VmZ3cMI4toaixvEKGKlYKVH1gBe/T24SyOZPbhAxrw7P0VKmcU5568oMtQDW?=
 =?us-ascii?Q?+i5qZTwr7FycNW0geLaSQYru3i+B8cz76UwAUGAHFTp+t8RT/S/dRzG8zaRp?=
 =?us-ascii?Q?deCDWCl52xF+HQVnPiAcQ+/iktHmJhbIrs11OAGExwkq/3jh9OjPQc897D5/?=
 =?us-ascii?Q?UT5ijo3AFU/xPoXC+8wt6FhqhhqomeJTEsWvoe5TLTwdd84nP0wXjOv0j2XY?=
 =?us-ascii?Q?XS3LyKpKAnS7+3fHal16Yf5qniGa8N7FYIIRWDAchELlY353+115nZ62MoAy?=
 =?us-ascii?Q?tC3rnoif2VbqcI/d5TqnUTXJG24gWbXrLf8IrBo54aBmBg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tVxRKJnCKbL+iBKweg9XTfuT+fbhA4cseISf+OsDctksknV4gXpO4uNG941V?=
 =?us-ascii?Q?lPbIzYHE7/T4XswNStzKihJ6SlGxEutAIm9ofAujRne3iDuCDOnRoG8bZ9ob?=
 =?us-ascii?Q?ykaPaagAhRVRCMThNy/WpNA30BtJ0Kialm+UV0NWn2lEommg5+XFTvBunIbs?=
 =?us-ascii?Q?9/ZKk5BB2qccIRxuK7nil+piqPwNp8142onP3V9U88BDDDP0mWq9is7vV4gt?=
 =?us-ascii?Q?ap0Pu464R16blqsk61Z+JKnoREUqBSOYLB3PcfPOMc63bYVy9TmBtBwWy9a6?=
 =?us-ascii?Q?2CUIu7LtdHSwmRqV6fAEi8ALrZHyKJ4h3AcXc2vF9jcl0sLbL40Ev2FMN9W6?=
 =?us-ascii?Q?x31uPaXbBi6/yTE6OiGZGQPUr0/Lrf7SGiFgJfG7r3wZ6TgSBTV/DZ9KcYpA?=
 =?us-ascii?Q?R+Rii82WpcXP5+35noXew5fNcU0YIDtIX/L4OM4s/SAoqkO+l+x8mqhFoG/U?=
 =?us-ascii?Q?UgnktL0LssKWMof8pyh4Q5E3XqKuhXsdQWO3H5wWpWmuDBb14e0eANIIs746?=
 =?us-ascii?Q?ZJsh6DxaHuf3F6Q1juy8vFGvj7+luL2JJN6XCIuje03YAlcitOcJLAnRjvv5?=
 =?us-ascii?Q?enlWHuGXa8mYnj2P/x4+0dDL1KzIbMahkWp7mTE2lmBNhuh2u6GUO9YYHE1J?=
 =?us-ascii?Q?Qp+K5xKXC/9DZ24NnCxTa/GkmpoExoeHGah6gWDK4I9UKPd9Usgt5G1qwhtZ?=
 =?us-ascii?Q?YQDFjecV4N+WVghxWEEFZHLLRyYAzUmT3xN2aiLUIiIT2y9riyTuHqgs/XN2?=
 =?us-ascii?Q?o/khnjzBOXjkkCxAeYLk69nK5jpWJzJ/imXNn1FrTPaI3lXedZP0+obb7BCc?=
 =?us-ascii?Q?Gj7rfCqvQg0+DfGwXVZN41LYz8S9EInaevVgalB90nvPKH7Y+krIF7sybRf6?=
 =?us-ascii?Q?vhQkVOemRei7F5ky2pPvrCXvnx9RGoulaRni8ep2bTvZWtwidX7cKipcjdQB?=
 =?us-ascii?Q?R2AZ5i7+kIBG19PkxsFOcll8Vs8CR+ex+kmGmbMzamjJUDKvXyVRFo/YfI8j?=
 =?us-ascii?Q?bJqcY2yuVw2+quBq0ST1tWjwEt/XjXrZdh5/SrPaYQqjxmxEpdUr0N7z87mI?=
 =?us-ascii?Q?B2pXcXaYjjbBjvG65F6RXHrbh3PWDdwV9XWYigbp5jmxWRFk+gx5pkXDFBBD?=
 =?us-ascii?Q?BNpTnYjMZ0XZqvwH3bAJBPG+8kop+USAxx3CUjVHDOwmjUK0ysmQ43dW6gTo?=
 =?us-ascii?Q?eIKKTkELmDpWik3HBCKhZVnT5AUlvtTKejEA8KLbHwiFjRreoQGrCOSMF7M6?=
 =?us-ascii?Q?f0opuYlu5v/M0z9JhPDn1/erWs7gSEZmf9pqZ5QhjH1xfH3L5SU65rJMAuRl?=
 =?us-ascii?Q?b20tMvThQZquGR9ETZEpQvg1S4t1GSsISA9U3saFQ9oy5vAHAZsLVHa9fTcD?=
 =?us-ascii?Q?DUDdL4kystJsaFZkVMgc+m6MlOPsnl+zEFIR8QYuNQnZsXCwVNIRtJCXQfJQ?=
 =?us-ascii?Q?6ahKyo5UA8zTj84Cq/KWRKtRnq0Ulfs5TZXFnN9mAkkMYjVCoqdU7TBno7EI?=
 =?us-ascii?Q?58HG92xPFdBHkkXj21E3oZBlWuWta1yQ/MEWIWMn4WQJ4AJEJgWEM1ffBszg?=
 =?us-ascii?Q?xoQx2/qRPOy8BXv4xar8w3rm3RDU3Od1U5/UuYfsreS4zOqGB1FO+OZbAArL?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc758dfc-a98e-4dc6-0c2d-08dccecf8ed1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 23:56:43.0584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UtvPCJ2BMK/bZ1KZZJ7TDSiwB+Sr2WsMUixZ24ByYuqXoNo1gSis8o2wj5QOkb0L/TxpmQ7x0macNWruvnOtYHnM6JpwW39QOnr2OzndOVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6070
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

On Fri, Sep 06, 2024 at 02:51:53PM -0700, Matt Atwood wrote:
> From: Haridhar Kalvala <haridhar.kalvala@intel.com>
> 
> PTL is an integrated GPU based on the Xe3 architecture.
> 
> Bspec: 72574
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c            |  7 +++++++
>  drivers/gpu/drm/xe/xe_platform_types.h |  1 +
>  include/drm/intel/xe_pciids.h          | 11 +++++++++++
>  3 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index b30d09508a38..e471832a7a7f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -370,6 +370,12 @@ static const struct xe_device_desc bmg_desc = {
>  	.has_heci_cscfi = 1,
>  };
>  
> +static const struct xe_device_desc ptl_desc = {
> +	PLATFORM(PANTHERLAKE),
> +	.has_display = true,

You haven't sent the display patches yet, so this shouldn't be true
(yet).  We usually leave this off until we start enabling the display
and then include it in that patch series.


Matt

> +	.require_force_probe = true,
> +};
> +
>  #undef PLATFORM
>  __diag_pop();
>  
> @@ -418,6 +424,7 @@ static const struct pci_device_id pciidlist[] = {
>  	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
>  	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
>  	XE_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
> +	XE_PTL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(pci, pciidlist);
> diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
> index 79b7042c4534..d08574c4cdb8 100644
> --- a/drivers/gpu/drm/xe/xe_platform_types.h
> +++ b/drivers/gpu/drm/xe/xe_platform_types.h
> @@ -23,6 +23,7 @@ enum xe_platform {
>  	XE_METEORLAKE,
>  	XE_LUNARLAKE,
>  	XE_BATTLEMAGE,
> +	XE_PANTHERLAKE,
>  };
>  
>  enum xe_subplatform {
> diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
> index 73d972a8aca1..0e0256072acd 100644
> --- a/include/drm/intel/xe_pciids.h
> +++ b/include/drm/intel/xe_pciids.h
> @@ -215,4 +215,15 @@
>  	MACRO__(0xE20D, ## __VA_ARGS__), \
>  	MACRO__(0xE212, ## __VA_ARGS__)
>  
> +#define XE_PTL_P_IDS(MACRO__, ...) \
> +	MACRO__(0xB080, ## __VA_ARGS__)
> +
> +#define XE_PTL_U_IDS(MACRO__, ...) \
> +	MACRO__(0xB090, ## __VA_ARGS__), \
> +	MACRO__(0xB0A0, ## __VA_ARGS__)
> +
> +#define XE_PTL_IDS(MACRO__, ...) \
> +	XE_PTL_P_IDS(MACRO__, ## __VA_ARGS__), \
> +	XE_PTL_U_IDS(MACRO__, ## __VA_ARGS__)
> +
>  #endif
> -- 
> 2.44.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
