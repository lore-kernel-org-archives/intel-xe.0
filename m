Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D37BCDD1D2
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 18:27:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA1410E346;
	Fri, 27 Sep 2024 18:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IdlfvER+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D208310E346
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 18:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727461671; x=1758997671;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bipS76wfPk3yEXcYJXo6jbBNdCz1F6Vafd5OrxvGFw4=;
 b=IdlfvER+rU1bKl5FZf21hWqGNO+kcUCRCtu3CZwnNnp3svAcPyqMNl+O
 fFuOVo+XsDcp7yyulKlXoFw3bs37dy+BI0RHRHXFf2ILYHIkLCtf9+9nN
 q+mBmc8yt3lgBTh1EF+wvJ1jC92ZwoyXH74a1wYa73my3MaMTAGmTswZ0
 H1+gFULqNJrSpkGTAykNF7n3A54Mvm8H6dRMjt3ROYW5RqttzUswVZLjv
 zzSq+eQYCEBDTIPyMiJgSqU0DpkfqPPqGZ+EjB2AeMhZN8QQD5aHAR8ng
 Kj2dJTa+l2pU/J1E9wLRJoN1qDilEVBpGTgptOb418ReQ4yOLtnQd/YIO g==;
X-CSE-ConnectionGUID: bWWLCykhTjOMv2omhfN9Uw==
X-CSE-MsgGUID: lgYc98sYSYuc76DLGDJPmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26714242"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="26714242"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 11:27:50 -0700
X-CSE-ConnectionGUID: AB7Lzhy1Rb69k2DrTa7aKg==
X-CSE-MsgGUID: 9pP8E8fzTgCAL4/iQ5w5sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="77554683"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 11:27:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 11:27:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 11:27:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 11:27:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 11:27:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfZ4t+n68g8i2taEnKOK8Bzj+dcv1/9m2mEYgEzOUEcopcAN48QXgUHf9Va8GnnX/BCZjAwVBwLIXj1ftDyoOO4ixMOUMaRfWsQPyqBRl197wZvwmuo5Quc16Ld/hqgn9RHRf8pKieKsCGyrbbEtdid6oCOZG/dDPjDAgkU4nEWbfDmeFw3fAljv4AwjDeUhwjHeeIGAuDb3q3N7jVNYJjyyeRP/u/Gi855DViQHez3Cs3Yjcw8SNwtZ9+g7WnjXFnKb14h3iiwvVc3pi1D31i2X1Zwc5rIL5HwC5tgvGvGuQvC2Ni1eEY7fyq4p943N+qtTKJFy3guVDGhMPi44tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qi78i2RJbf87wDTNLcGR3cHDQzZKNDu8YJRFnMRd0wc=;
 b=vluDVTrkOCymB11UZ278mkJtsxIigUdWULu/0buKiyp38U2L/5pIyUvCqFQ7q6rWTv1XMe6brWBPeuOqQeRzwVvmiVOTQfbeMG/QbZD4zdMQMTg9XasUzVDuEJeHM3gBBFr7RPP+048IC9+2tm+p52Fr/KmjWI2Dz9Ob4bAA0pQnUrGVO9bNVy9E8zsDIgLbzo1c4npoVChDUqmV8hjd/K/2y84jws3XItA/K5C/wp41u9X3aOpfhS9ZNeyTFZ4I7ka6ZQPxq1kyTB6gjUSLmEqRPPNDcueytvgsEgGzLjMjw7T85cn4c7A5P6/P0LzyaOn+s8WngMTnxMdvmjauGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2864.namprd11.prod.outlook.com (2603:10b6:805:63::26)
 by SN7PR11MB6875.namprd11.prod.outlook.com (2603:10b6:806:2a6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 18:27:42 +0000
Received: from SN6PR11MB2864.namprd11.prod.outlook.com
 ([fe80::c58f:66d9:46c0:d83d]) by SN6PR11MB2864.namprd11.prod.outlook.com
 ([fe80::c58f:66d9:46c0:d83d%6]) with mapi id 15.20.7982.016; Fri, 27 Sep 2024
 18:27:41 +0000
Date: Fri, 27 Sep 2024 14:27:37 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/pmu: Add GT C6 events
Message-ID: <Zvb5GcYYKzD4H1mj@intel.com>
References: <20240927002344.2565250-1-vinay.belgaumkar@intel.com>
 <20240927002344.2565250-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240927002344.2565250-3-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR03CA0074.namprd03.prod.outlook.com
 (2603:10b6:303:b6::19) To SN6PR11MB2864.namprd11.prod.outlook.com
 (2603:10b6:805:63::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2864:EE_|SN7PR11MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: d91789a2-dd5e-44fb-884a-08dcdf221239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZY3Ll2qrQbYMuyFy3N+zxwgQzTFvkassaf006rh1JDRbsFQ+gaabS03EsM8y?=
 =?us-ascii?Q?sxAqhXGZbJ9oOEDmLj6dnI/Gxg3rVYgHSGoHV99wCd1EJSChbZ6n7odoBa1b?=
 =?us-ascii?Q?aUpLFJrQaVjPBCPrazHWGFKFk8Pmj6zawxOUgsWBnwjhEPtnJnJi4kdgsSXq?=
 =?us-ascii?Q?0qh3SFvhoBAWVhlBVmwE83qlSl3/7mnPVIY9d4wAizTtCAaaFXRx8RMy1PWP?=
 =?us-ascii?Q?zcgGKz9zC8p4gDrLFECOgSxT15ribIAIiIG7JJFL1CCBvoxjakhPYE/EQ9jT?=
 =?us-ascii?Q?xfSXHNjsxPntomQ8BRkMJAocIwYsR1/TrTZSJYLS7CIhDDPc+e3OZdvfs8bW?=
 =?us-ascii?Q?sG46S2XRLbtkE0Blw7H+NqIQVBWlH5YsHwa0YbTnXWXkCCe6zxcuv08jgKue?=
 =?us-ascii?Q?pRC8+25MPWf8iiNQoZs8Ht8AW3bjnFX92Pmpew7YfdhY1wptp3Hqc95ERUcy?=
 =?us-ascii?Q?GAYBsFiN33uLhXxRaAuPEf5xLdn5dgU42bpDQ8Rhz5d9eDuN2c7VAxl6+XlI?=
 =?us-ascii?Q?c8Ric6wvpCZaljtw+El1Lp8wH8xzoodRAikpIHEJQhIebTpLbg0WJCV+3KKf?=
 =?us-ascii?Q?A3j8ydZOk/z5ApnxYjyWZzOLrnA2hUJPF1GhmtLvdMEFnKFVwWjv+FRbp59J?=
 =?us-ascii?Q?FxGyc9i8zWMq69XHghGqHHcwAjtD74M6OHymnW1tUpU2Z+NSTL1bfpeHv87P?=
 =?us-ascii?Q?yt95Q8BwuIA+lR0zZsdOEnCy9f3BbhqTXfA4XBmXXTCYeQdSWFk5uwO3WbWm?=
 =?us-ascii?Q?YGgRv3LYQbWp4jyjyKuIrJxC6jZd4mWWpWAnoBjAk8Exh6TGcaZW0mBb8N/9?=
 =?us-ascii?Q?Hxv7eMYzb3DtNnfcOndCMWjQbrxwkgJkye6XGDjspTJ9lznEyB2Uv1i6mxPC?=
 =?us-ascii?Q?4uuJVs2xUAcZ7T7bQGR40nUGasc0epP77Arx0rTfzQssdfbealEHsNQ2psLa?=
 =?us-ascii?Q?y2XbDIwjN4JzPYA8BIXRQwebAa4MxpBh8pLGh21uRHNyLtMYCwJ3JoEMZZlI?=
 =?us-ascii?Q?OGFDdFkGx//TeUqLGwrjEDiCrqUJgb9MeJRn6iUNu6M2mzLevUSp/Fh92iXA?=
 =?us-ascii?Q?Bituz4MtzRql7gWJdMNYJbQizGcdPz/1HS9roIB7d0tOHzeL96pEajO8POhD?=
 =?us-ascii?Q?l+8GRaw5rX3j4J9b9sIS1qgbEkmQL4Wa1HpwKfRwsqMo2nTLvuutwWtDVMqe?=
 =?us-ascii?Q?1ucUM2tXxJ4eq0FEJae0n7EQS1lE1c7dgoV6Ug+JlBIsDRgxKZCZB1PNs969?=
 =?us-ascii?Q?LJOZsAxJeK0HVqBMUZahvBbCrDZULFIuIZCjOqbYmw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hzc8mYJqdtv7BUvmO9erHxxbMUlXEeHzKdtD0bFKzoLIQAIymstLtEJQgylz?=
 =?us-ascii?Q?d2jdpLObPP4Y9rqV307IH44SXXCIGhmo64UySbpzYLWl0klpiiS9pSPlXwAx?=
 =?us-ascii?Q?xeFR+4KQZYq8TflHP5sPrRslhul1zjwmARue2ZdBQCK6+ABgZ6g+lqAHMUDU?=
 =?us-ascii?Q?1+TYLjCV9Gmc/amMeTuZDz/G7mivY9rU1ox/LvWN4lm5+Ya5DxIpcoiqQgEY?=
 =?us-ascii?Q?bJfsc9QJEwswuw8s4F7Vi+HCZawpgmG/OMn/psqTLW84krUhJJu0JN2CqRW8?=
 =?us-ascii?Q?TNvxOGKnfRRdokuTHtC+OTTKJ43/yvQvYcgUImQez8A555eTfQ1ErS+n98uq?=
 =?us-ascii?Q?Bsi1HhQy45mFm3kFF3xflSp776lZPcTtSdrfTeyfVDp9Jq0eWhtelxRfP3np?=
 =?us-ascii?Q?VI2m9XdWBYcPAh2RAzcBMNY2dkV5olx6QL3CUMTzEMRSwAB/uzCoM29C3rO1?=
 =?us-ascii?Q?fms7wz7vPgbA6d3eqIlWSvZ6JB9FY4W1wL63nQ1cDVvbNuEFPhQewXVw3Rbg?=
 =?us-ascii?Q?XgoL0ZvhTOO5iryNFgOK0rroS5TKshWKNJiLfWdvQrq6wv6WGeH0YdPPy+9o?=
 =?us-ascii?Q?0Uier2rCpDsvzAFti/8g0F6zCgBqfpJdH2znWXWH2DXvmRHTEEkoNXePaYMb?=
 =?us-ascii?Q?RFeVtoqPJPX9+6Pa7rt1TTrKtJfYNWr5IwLuI/bKm00bRETn6GHwnC6p+b8k?=
 =?us-ascii?Q?QmHooU0iHPLdlHTNVYMHN1PMkWOe224xGFWAOhBrjcpFC9Abf4dSD+SlxGjQ?=
 =?us-ascii?Q?l7IWfCXfQZ6GHxDeyevCN6ngZniZkNOQer0cXaUeztNK+SdkMd9++fuUrHXJ?=
 =?us-ascii?Q?3Ai8OfSwyfvxJrLDtx6ycTjY3/xn6CcTA6Pse/OeN8vblHt9IgmhIWL2JecM?=
 =?us-ascii?Q?XC8UUSt9aTdR3SLJ/LlHxHeHt2r1Zitqrq8N7Mita9YhfXLNFj7JXhw+0M/G?=
 =?us-ascii?Q?nNg0ZslqNJNtqgSLncWBD8V5QaO8/fT97FF21CB1+ujLpWnpbu8nx7jh7gpM?=
 =?us-ascii?Q?Tv/SGjTgVAK8AjWZo0ruohPn3tvh5gI/pbF2pZt/BBKGnkn7M9xfCpQqdAYe?=
 =?us-ascii?Q?BUKlFKyVEAH9Cy/Hghnr1Tmud2+5zlFlYftfMrwWVVK/3qv4kpuiji/5mdK6?=
 =?us-ascii?Q?YQpWAkgvQEEasxj1HSr8/tMC8Us146tmV+F6zZjoTizc7xyxq7cyjQ13OGsn?=
 =?us-ascii?Q?dsRQHeUqRXxpsDa4DqI62Uv12bZojKXr/Z2g9lMhbOat19Vjlb5cocxpFm7v?=
 =?us-ascii?Q?V1EvP1JU/Ivg0H9tf7rMqvQ10k2IDrMc9Uh0HSWzkMAK5Qt5Ie90qawfUPT9?=
 =?us-ascii?Q?YaIodIvJCgveB0QHZfVW2evt5WivQyELfL36OddqnC6CfU9j/cuG686EObea?=
 =?us-ascii?Q?bZ37MkiY/rUycohQf0GSDwSURw4zZ4RLsYPh9C8Gy6XL/dXgA6t5uvseBh0g?=
 =?us-ascii?Q?6pJjrV92y4cYK7rPCnAP6HjFlrbtm7FctoXD9Y00vhz6iMQanQVGQyesTbcD?=
 =?us-ascii?Q?R1wRtU+I8LdyLUrvEBlkDF58YWhTi8K1H7ZnIVvZRUkXeQQR5lO3M7lQEZQJ?=
 =?us-ascii?Q?gnyvZUdsR8/GLNmpHFALhscbDtURWkijSfk27Y/RSl3JJ6Q3PLcCvKO4HSJn?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d91789a2-dd5e-44fb-884a-08dcdf221239
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 18:27:41.8456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n35Pq3uIuCooUkT7HroHFL/KVANQAw+BJ2f4a1R2fw+sEcdQiYKQjCQOzZAKteS/QIR0vOeSE14LAt8rEJu0fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6875
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

On Thu, Sep 26, 2024 at 05:23:43PM -0700, Vinay Belgaumkar wrote:
> Provide a PMU interface for GT C6 residency counters. The implementation
> is ported over from the i915 PMU code. Residency is provided in units of
> ms(similar to sysfs entry - /sys/class/drm/card0/device/tile0/gt0/gtidle).
> 
> Following PMU events are being added-
> 
> >> perf list | grep rc6
> 
>   xe_0000_00_02.0/rc6-residency-gt0/                 [Kernel PMU event]
>   xe_0000_00_02.0/rc6-residency-gt1/                 [Kernel PMU event]
> 
> v2: Checkpatch fix, move timer code to next patch
> v3: Fix kunit issue
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c        |   2 +
>  drivers/gpu/drm/xe/xe_gt_idle.c   |  20 ++--
>  drivers/gpu/drm/xe/xe_gt_idle.h   |   1 +
>  drivers/gpu/drm/xe/xe_pmu.c       | 172 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pmu.h       |   2 +
>  drivers/gpu/drm/xe/xe_pmu_types.h |  58 ++++++++++
>  include/uapi/drm/xe_drm.h         |   4 +
>  7 files changed, 253 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 9b0218109647..7a190c49c573 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -872,6 +872,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>  
>  	xe_gt_idle_disable_pg(gt);
>  
> +	xe_pmu_suspend(gt);
> +
>  	xe_gt_disable_host_l2_vram(gt);
>  
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 531924b6c0a1..e0a12ac7387c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -277,18 +277,26 @@ static ssize_t idle_status_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(idle_status);
>  
> -static ssize_t idle_residency_ms_show(struct device *dev,
> -				      struct device_attribute *attr, char *buff)
> +u64 xe_gt_idle_residency(struct xe_gt *gt)
>  {
> -	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_gt_idle *gtidle = &gt->gtidle;
>  	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>  	u64 residency;
>  
> -	xe_pm_runtime_get(pc_to_xe(pc));
> +	xe_pm_runtime_get(xe);
>  	residency = gtidle->idle_residency(pc);
> -	xe_pm_runtime_put(pc_to_xe(pc));
> +	xe_pm_runtime_put(xe);
> +
> +	return get_residency_ms(gtidle, residency);
> +}
> +
> +static ssize_t idle_residency_ms_show(struct device *dev,
> +				      struct device_attribute *attr, char *buff)
> +{
> +	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>  
> -	return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, residency));
> +	return sysfs_emit(buff, "%llu\n", xe_gt_idle_residency(gtidle_to_gt(gtidle)));
>  }
>  static DEVICE_ATTR_RO(idle_residency_ms);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 4455a6501cb0..887791f653ac 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -17,5 +17,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt);
>  void xe_gt_idle_enable_pg(struct xe_gt *gt);
>  void xe_gt_idle_disable_pg(struct xe_gt *gt);
>  int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
> +u64 xe_gt_idle_residency(struct xe_gt *gt);
>  
>  #endif /* _XE_GT_IDLE_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index bdaea9ca1065..b1b38d245e00 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -11,10 +11,15 @@
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt_clock.h"
> +#include "xe_gt_idle.h"
> +#include "xe_guc_pc.h"
>  #include "xe_mmio.h"
>  #include "xe_macros.h"
> +#include "xe_module.h"
>  #include "xe_pm.h"
>  
> +#define FREQUENCY 200
> +
>  static cpumask_t xe_pmu_cpumask;
>  static unsigned int xe_pmu_target_cpu = -1;
>  
> @@ -35,6 +40,11 @@ static unsigned int xe_pmu_target_cpu = -1;
>   *
>   */
>  
> +static struct xe_pmu *event_to_pmu(struct perf_event *event)
> +{
> +	return container_of(event->pmu, struct xe_pmu, base);
> +}
> +
>  static unsigned int config_gt_id(const u64 config)
>  {
>  	return config >> __XE_PMU_GT_SHIFT;
> @@ -45,6 +55,35 @@ static u64 config_counter(const u64 config)
>  	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>  }
>  
> +static unsigned int other_bit(const u64 config)
> +{
> +	unsigned int val;
> +
> +	switch (config_counter(config)) {
> +	case XE_PMU_RC6_RESIDENCY:
> +		val = __XE_PMU_RC6_RESIDENCY_ENABLED;
> +		break;
> +	default:
> +		/*
> +		 * Events that do not require sampling, or tracking state
> +		 * transitions between enabled and disabled can be ignored.
> +		 */
> +		return -1;
> +	}
> +
> +	return config_gt_id(config) * __XE_PMU_TRACKED_EVENT_COUNT + val;
> +}
> +
> +static unsigned int config_bit(const u64 config)
> +{
> +	return other_bit(config);
> +}
> +
> +static unsigned int event_bit(struct perf_event *event)
> +{
> +	return config_bit(event->attr.config);
> +}
> +
>  static void xe_pmu_event_destroy(struct perf_event *event)
>  {
>  	struct xe_device *xe =
> @@ -64,6 +103,10 @@ config_status(struct xe_device *xe, u64 config)
>  		return -ENOENT;
>  
>  	switch (config_counter(config)) {
> +	case XE_PMU_RC6_RESIDENCY:
> +		if (xe->info.skip_guc_pc)
> +			return -ENODEV;
> +		break;
>  	default:
>  		return -ENOENT;
>  	}
> @@ -110,6 +153,63 @@ static int xe_pmu_event_init(struct perf_event *event)
>  	return 0;
>  }
>  
> +static inline s64 ktime_since_raw(const ktime_t kt)
> +{
> +	return ktime_to_ns(ktime_sub(ktime_get_raw(), kt));
> +}
> +
> +static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample)
> +{
> +	return pmu->event_sample[gt_id][sample].cur;
> +}
> +
> +static void
> +store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 val)
> +{
> +	pmu->event_sample[gt_id][sample].cur = val;
> +}
> +
> +static u64 get_rc6(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	const unsigned int gt_id = gt->info.id;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	bool device_awake;
> +	unsigned long flags;
> +	u64 val;
> +
> +	device_awake = xe_pm_runtime_get_if_active(xe);
> +	if (device_awake) {
> +		val = xe_gt_idle_residency(gt);
> +		xe_pm_runtime_put(xe);
> +	}
> +
> +	spin_lock_irqsave(&pmu->lock, flags);
> +
> +	if (device_awake) {
> +		store_sample(pmu, gt_id, __XE_SAMPLE_RC6, val);
> +	} else {
> +		/*
> +		 * We think we are runtime suspended.
> +		 *
> +		 * Report the delta from when the device was suspended to now,
> +		 * on top of the last known real value, as the approximated RC6
> +		 * counter value.
> +		 */
> +		val = ktime_since_raw(pmu->sleep_last[gt_id]);
> +		val += read_sample(pmu, gt_id, __XE_SAMPLE_RC6);
> +	}
> +
> +	if (val < read_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED))
> +		val = read_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED);
> +	else
> +		store_sample(pmu, gt_id, __XE_SAMPLE_RC6_LAST_REPORTED, val);
> +
> +	spin_unlock_irqrestore(&pmu->lock, flags);
> +
> +	return val;
> +}
> +
>  static u64 __xe_pmu_event_read(struct perf_event *event)
>  {
>  	struct xe_device *xe =
> @@ -120,6 +220,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>  	u64 val = 0;
>  
>  	switch (config_counter(config)) {
> +	case XE_PMU_RC6_RESIDENCY:
> +		val = get_rc6(gt);
> +		break;
>  	default:
>  		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>  	}
> @@ -151,6 +254,28 @@ static void xe_pmu_event_read(struct perf_event *event)
>  
>  static void xe_pmu_enable(struct perf_event *event)
>  {
> +	struct xe_pmu *pmu = event_to_pmu(event);
> +	const unsigned int bit = event_bit(event);
> +	unsigned long flags;
> +
> +	if (bit == -1)
> +		goto update;
> +
> +	spin_lock_irqsave(&pmu->lock, flags);

lockdep didn't like it:

[ 8969.701191] =============================
[ 8969.705238] [ BUG: Invalid wait context ]
[ 8969.709277] 6.11.0+ #44 Tainted: G     U     OE     
[ 8969.714289] -----------------------------
[ 8969.718326] perf/10438 is trying to lock:
[ 8969.722371] ffff88827ead2d50 (&pmu->lock){....}-{3:3}, at: xe_pmu_enable+0xdb/0x340 [xe]
[ 8969.731153] other info that might help us debug this:
[ 8969.736254] context-{5:5}
[ 8969.738912] 3 locks held by perf/10438:
[ 8969.742785]  #0: ffff888f73a11f98 (&cpuctx_mutex){+.+.}-{4:4}, at: perf_event_ctx_lock_nested+0x18b/0x340
[ 8969.752448]  #1: ffff888100fb6d98 (&event->child_mutex){+.+.}-{4:4}, at: perf_event_for_each_child+0x7d/0x140
[ 8969.762456]  #2: ffff888f73a11ef8 (&cpuctx_lock){....}-{2:2}, at: event_function+0x10f/0x460
[ 8969.770975] stack backtrace:
[ 8969.773882] CPU: 0 UID: 0 PID: 10438 Comm: perf Tainted: G     U     OE      6.11.0+ #44
[ 8969.782037] Tainted: [U]=USER, [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
[ 8969.788260] Hardware name: iBUYPOWER INTEL/B660 DS3H AC DDR4-Y1, BIOS F5 12/17/2021
[ 8969.795976] Call Trace:
[ 8969.798453]  <TASK>
[ 8969.800581]  dump_stack_lvl+0x8f/0xe0
[ 8969.804290]  __lock_acquire+0x159a/0x6270
[ 8969.808357]  ? __pfx___lock_acquire+0x10/0x10
[ 8969.812763]  lock_acquire+0x19e/0x500
[ 8969.816469]  ? xe_pmu_enable+0xdb/0x340 [xe]


> +
> +	/*
> +	 * Update the bitmask of enabled events and increment
> +	 * the event reference counter.
> +	 */
> +	BUILD_BUG_ON(ARRAY_SIZE(pmu->enable_count) != XE_PMU_MASK_BITS);
> +	XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
> +	XE_WARN_ON(pmu->enable_count[bit] == ~0);
> +
> +	pmu->enable |= BIT(bit);
> +	pmu->enable_count[bit]++;
> +
> +	spin_unlock_irqrestore(&pmu->lock, flags);
> +update:
>  	/*
>  	 * Store the current counter value so we can report the correct delta
>  	 * for all listeners. Even when the event was already enabled and has
> @@ -277,6 +402,7 @@ create_event_attributes(struct xe_pmu *pmu)
>  		const char *name;
>  		const char *unit;
>  	} events[] = {
> +		__event(0, "rc6-residency", "ms"),
>  	};
>  
>  	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
> @@ -465,6 +591,32 @@ static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>  	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
>  }
>  
> +static void store_rc6_residency(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	store_sample(pmu, gt->info.id, __XE_SAMPLE_RC6,
> +		     xe_gt_idle_residency(gt));
> +	pmu->sleep_last[gt->info.id] = ktime_get_raw();
> +}
> +
> +/**
> + * xe_pmu_suspend() - Save residency count before suspend
> + */
> +void xe_pmu_suspend(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (!pmu->base.event_init)
> +		return;
> +
> +	spin_lock_irq(&pmu->lock);
> +	store_rc6_residency(gt);
> +	spin_unlock_irq(&pmu->lock);
> +}
> +
>  /**
>   * xe_pmu_unregister() - Remove/cleanup PMU registration
>   */
> @@ -492,6 +644,24 @@ void xe_pmu_unregister(void *arg)
>  	free_event_attributes(pmu);
>  }
>  
> +static void init_rc6(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	struct xe_gt *gt;
> +	unsigned int j;
> +
> +	for_each_gt(gt, xe, j) {
> +		xe_pm_runtime_get(xe);
> +		u64 val = xe_gt_idle_residency(gt);
> +
> +		store_sample(pmu, j, __XE_SAMPLE_RC6, val);
> +		store_sample(pmu, j, __XE_SAMPLE_RC6_LAST_REPORTED,
> +			     val);
> +		pmu->sleep_last[j] = ktime_get_raw();
> +		xe_pm_runtime_put(xe);
> +	}
> +}
> +
>  /**
>   * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
>   *
> @@ -525,6 +695,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
>  	if (!pmu->events_attr_group.attrs)
>  		goto err_name;
>  
> +	init_rc6(pmu);
> +
>  	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>  					GFP_KERNEL);
>  	if (!pmu->base.attr_groups)
> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
> index d07e5dfdfec0..17f5a8d7d45c 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.h
> +++ b/drivers/gpu/drm/xe/xe_pmu.h
> @@ -15,11 +15,13 @@ int xe_pmu_init(void);
>  void xe_pmu_exit(void);
>  void xe_pmu_register(struct xe_pmu *pmu);
>  void xe_pmu_unregister(void *arg);
> +void xe_pmu_suspend(struct xe_gt *gt);
>  #else
>  static inline int xe_pmu_init(void) { return 0; }
>  static inline void xe_pmu_exit(void) {}
>  static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>  static inline void xe_pmu_unregister(void *arg) {}
> +static inline void xe_pmu_suspend(struct xe_gt *gt) {}
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> index ca0e7cbe2081..1213d2a73492 100644
> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -11,11 +11,34 @@
>  #include <uapi/drm/xe_drm.h>
>  
>  enum {
> +	__XE_SAMPLE_RC6,
> +	__XE_SAMPLE_RC6_LAST_REPORTED,
>  	__XE_NUM_PMU_SAMPLERS
>  };
>  
>  #define XE_PMU_MAX_GT 2
>  
> +/*
> + * Non-engine events that we need to track enabled-disabled transition and
> + * current state.
> + */
> +enum xe_pmu_tracked_events {
> +	__XE_PMU_RC6_RESIDENCY_ENABLED,
> +	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
> +};
> +
> +/*
> + * How many different events we track in the global PMU mask.
> + *
> + * It is also used to know to needed number of event reference counters.
> + */
> +#define XE_PMU_MASK_BITS \
> +	(XE_PMU_MAX_GT * __XE_PMU_TRACKED_EVENT_COUNT)
> +
> +struct xe_pmu_sample {
> +	u64 cur;
> +};
> +
>  struct xe_pmu {
>  	/**
>  	 * @cpuhp: Struct used for CPU hotplug handling.
> @@ -58,6 +81,41 @@ struct xe_pmu {
>  	 * @pmu_attr: Memory block holding device attributes.
>  	 */
>  	void *pmu_attr;
> +
> +	/**
> +	 * @enable: Bitmask of specific enabled events.
> +	 *
> +	 * For some events we need to track their state and do some internal
> +	 * house keeping.
> +	 *
> +	 * Each engine event sampler type and event listed in enum
> +	 * i915_pmu_tracked_events gets a bit in this field.
> +	 *
> +	 * Low bits are engine samplers and other events continue from there.
> +	 */
> +	u32 enable;
> +
> +	/**
> +	 * @enable_count: Reference counts for the enabled events.
> +	 *
> +	 * Array indices are mapped in the same way as bits in the @enable field
> +	 * and they are used to control sampling on/off when multiple clients
> +	 * are using the PMU API.
> +	 */
> +	unsigned int enable_count[XE_PMU_MASK_BITS];
> +	/**
> +	 * @sample: Current and previous (raw) counters for sampling events.
> +	 *
> +	 * These counters are updated from the i915 PMU sampling timer.
> +	 *
> +	 * Only global counters are held here, while the per-engine ones are in
> +	 * struct intel_engine_cs.
> +	 */
> +	struct xe_pmu_sample event_sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
> +	/**
> +	 * @sleep_last: Last time GT parked for RC6 estimation.
> +	 */
> +	ktime_t sleep_last[XE_PMU_MAX_GT];
>  };
>  
>  #endif
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 2c5f258eee3a..3ef3926551dd 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1396,6 +1396,10 @@ struct drm_xe_wait_user_fence {
>  
>  #define ___XE_PMU_OTHER(gt, x) \
>  	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
> +#define __XE_PMU_OTHER(x) ___XE_PMU_OTHER(0, x)
> +
> +#define XE_PMU_RC6_RESIDENCY                    __XE_PMU_OTHER(0)
> +#define __XE_PMU_RC6_RESIDENCY(gt)              ___XE_PMU_OTHER(gt, 0)
>  
>  /**
>   * enum drm_xe_observation_type - Observation stream types
> -- 
> 2.38.1
> 
