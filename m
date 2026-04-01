Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3A9D35177
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 12:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8034110ED9D;
	Wed,  1 Apr 2026 12:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nkFH7SXP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF0010ED95
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 12:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775046017; x=1806582017;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zVXoqpJWPwY46hUmur89XwrK7CY1zrdoon7Ny0l0W84=;
 b=nkFH7SXP8Koe6K6VYZCYWn0/KRM4xQ8/ICT30nbQPFFqkltSWAEuk6/m
 veleqlc2KLNpjnk3g22WAU45oLU4TwAjkkJo32ZgqPXYmg9b7FDEoeTmO
 jzP8tDq6Dd8cQrxkFb/EGqzPld7lQSPuISGOls2oQeJejmY2HK+8J6a5u
 EFGiYfVQMo4pP4rRVshZbzL63kvjhpJDehVRXdegLNBz1De+3RoXqcjIF
 wmyfLxFu6XGWIDcRdl6fKRuYH3qdJDhuyBTHU2pOMlssM2x33nLlUHOEG
 95Zh4ibZhb8t3IdaWLv2NjSZuU/ciO8KypXun4iCUuLVyCSqS0EPyY8tx A==;
X-CSE-ConnectionGUID: oz9tNliCSXyebY5TZmKxRQ==
X-CSE-MsgGUID: Fq/289RJSXyz6+aGgPFYMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75975248"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75975248"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 05:20:17 -0700
X-CSE-ConnectionGUID: aZimNQNUTh6o2miVsvoE6w==
X-CSE-MsgGUID: 1wXiqayvQ/WbXrcEbx7ukg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="226900363"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 05:20:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 05:20:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 05:20:17 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 05:20:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfWekwT0pm1KDCREDU2KEjgHz0iU7fkMu1TbSeyMzIndYeHOQto4Sa7nbAmJwKh/wW2P6ZNV2358UFp6mL67cs3fw0Rr9eueTl+WtZnQoivwEmiZQBllmiGeCEGrqCyEPmHNfIC1EwR/cYJtkwx6T6ShBvib8q5HGA2bUfu9xQdhF5E5owEP8m7J082kFEOea+0TvFaS3uItxEq+5piK47gYv6DkklqHy6htCIualzYDLmF+XwTKwJPSlaM/XIaZFekfQEZe+J4FTJYVodziBM8iICSsDNdIwjsQRPJiwDTG1ZWolpZr1q5DM+UurxM/xnYfRrC/iL9l5uBLuu9prg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eun78XF7BSb2BD5/MUagzn9BSS4sN7r3QGW5L85Pi+M=;
 b=bLVIDo9iOfQ1dGzaxxF0yn0cQjtWMXEX9HQzlbJcxkEZ+Lq7Ob8RQrBBJiKkt2c9wF2jamxJrZbNFtJJ1czxEYx70cEwEg2RSd4Cp1iCB6s4UPoHHQQCR/CbYKa/i8GjDyEVs7TYtwJM1iKaifV5cDo4TYr+Ooi6in1FGvSKm2eDUJGnBs7gAE6KhwkX9hvixHxgQhjlhYgYus9IF3c16CxFgrtMjYx5E3tNi5aE0eC4QoWc/Lxj/wBkMhipVi2h73m5/YZoClhxd67SIAZGERUfZhq7IUzMrzlULCkya/uYUet6Fgj+qBG3NARC8DFR/ig18QTs7oHXMhubiGKjIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB8796.namprd11.prod.outlook.com (2603:10b6:806:467::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 12:20:14 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 12:20:14 +0000
Date: Wed, 1 Apr 2026 14:20:06 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 05/25] drm/xe: Update xe_bo_put_deferred arguments to
 include writeback flag
Message-ID: <ac0NbbTfD1Pzl_Up@fdugast-desk>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-6-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260228013501.106680-6-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0209.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::34) To IA0PR11MB7838.namprd11.prod.outlook.com
 (2603:10b6:208:402::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB8796:EE_
X-MS-Office365-Filtering-Correlation-Id: 31de9ee9-795e-4761-acae-08de8fe9066e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: tx+Nnh1vcbcu140vWk3hKGmVQs/IV50h6iA0Ur8flWSenhkTHSxwGu5XLYi/yqD7T3CcmV9X7LxVVe5tX2bdimVj7VEwmHSwvLzbwqQvPLtEUARCy/RfBHsVorjTiS5XVMHhku24TI+FfuyIHcLWsUCymL/XW3sKHtr7cNkA6chOE2hTDQgwW1Q0B8t0DMTzEhR8YEzNJdG3HH02WjCQC9GHpOyKPeKANqO1LrSqPP06BqiV8xfC7dENg7fSGmdnfJ+pIbilJPLZw1WvyYufy8tlS2WG8njdCdQ8vQtA8LU6lfx38hKqeWo65Mkes8wbcZK35IaMFPfuS58qze+lnHkwwO9nKUMf20GrhKBaP/aXDWSpeLbokDKN4yaqoOlNLD92ZAgVGq4gHhrtKjVM9b7t+uDKgb29kjWeOC3nnwBobk5F5n7nEvaTb2pKn77VY++wm4aDRYriPxtB8pDkeCowqqVaGKjYa6y0H2ydgUpwgTc69Z1Fw4EuhWtHY8RyhAAlw8CD+NNb+NBRHIhyVmaYv8yvFZ770EN16vrlEvjMyViceVlox44BqLtGgIkJqLa6UC+50k7wD0CtAQkcGxDwf1VFX4NUovq6i7aYYgUA3XmUtzd1o/ZExqIaZJuQmbRjXOqvUPXsOP99E4UjAuGJhGEYMJjtV+fgkHU1QCX4UBAWUA0V8X7hG1odFA41w/cm8W1nnblMITvf745tCT5gPGflmi+cq5YzrQ++08A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1DSgmH0C1qaByt5GoMEdG9RaILcqd1PGeYSM6kzal2BbHRHfXG56bEKXhCd2?=
 =?us-ascii?Q?XwErKzg9+o+xN0KM44ZupAiUXekCkJzKiSzIY6NKwn4COeDxas0DzXV/ry9S?=
 =?us-ascii?Q?v+ybaLXV9vynekoj+bfNx3iFVPuUKlacO20gLhnzQBYUdiT0KBkFT5zfJynw?=
 =?us-ascii?Q?xq54qtFvO9W8k7hRjLksWxWfnZULDkbpC1EM+b1tQQweLircW+FH2WvITbOh?=
 =?us-ascii?Q?yDkeqcVRdGTEMqreRAWUiTyj9OT/oYOJbKv0MKhnX90SzJpgbGNUFAOCYGqJ?=
 =?us-ascii?Q?XLMjcniA1u4asFU4SmuuAYgsnl8YQGdLnckqMFhTvspPzRp91tUDvha+zSRm?=
 =?us-ascii?Q?cbTcLLiNp/k2xjcVe/Ujtzy0TTAwGqYcVG80gyDjXQacQ+USRuWtQkA9QAkG?=
 =?us-ascii?Q?A8WXd4/3Shr2aCjy7Pux8KXYruw1ztDasGUWRmhHRVjy/t8/EBCLqOWV2Wi/?=
 =?us-ascii?Q?V14a6ioj9kgDD10q7aBjZLdIlnDJ0lRcXW503s72/kS4b2G8NoRKOuTmVfTq?=
 =?us-ascii?Q?PhN/0WrpF0GdyOIzOA4lOf1nWlZQ8pMI13HR9uGMV827/V5kPPWC7I0t+xY3?=
 =?us-ascii?Q?9AUISeGFwWDX11sCUQx5zRFqbCUKWt/kyPxouof7jz2SeX3MHm/vQNBCclgJ?=
 =?us-ascii?Q?UHeIaPjI+bhKVBfdoGiNn8CA/ePkITsaFCsvU7LO21jnqmeMsd2LBr5VZm20?=
 =?us-ascii?Q?aXhEJyLjbsLhBve+48pv5XgKBrhL6zz/1+LptBXJAgvqlzDI4BNgLk/2fa+g?=
 =?us-ascii?Q?VjyW7JA+2CXTL0z1LncdxG5d0kqU9IavdIAAfDmqnfxGwf8CpQ2NU7PBHxIs?=
 =?us-ascii?Q?2ez+56dsvb1LjEQPDQbcoZ8rvVn8k/YUYHQRugTHqJPFEE2Vb/KWraMHINQ+?=
 =?us-ascii?Q?k0L1iNlB0DBypYYw22h+a3uEndXb7SOaQerO+EugrKKWWdDJCgDsEWov4vws?=
 =?us-ascii?Q?mXg+GQoSTrc8xvrYk63jTXVTIj+EdWsiCAkGrvdD6zcZ17Se1hX3YJkdpfAT?=
 =?us-ascii?Q?CxIgZGGBOM4ZjKCzHot5FqstvlkHVO7rTGPHTanufYFRQqvISIX0obG1cDUE?=
 =?us-ascii?Q?kGPpuXqSNKr9I0BwabWFtKqZnahgzamZsuh77dOqeQzuWfn3Yh8B+fpL+84c?=
 =?us-ascii?Q?gyC/azohZ5vBbEKypDDd/G77vTFSqOrH3qcbuZXGNlmwhhbyJI7nbfA1Bgqo?=
 =?us-ascii?Q?2VT7Ihu4uzAgfa0QsTof3iCES6RAgSzLmE6btePtxLb/IwHZ09hChZgSK8I9?=
 =?us-ascii?Q?87q6movDNVKDvh0elqhGpYymz4uj1iBysh1P/UcuBcgJz+ibn/b8H4jW1fsW?=
 =?us-ascii?Q?TaS0dSxXWkVdo8UfWJHrYtz+44ytmYcUVR5RrYnYm6i+WwJoVdTqB/8JgpVX?=
 =?us-ascii?Q?nDlL6sK00gz/27RasehQV7yNBOdkJeOSJWnMZrzJTuQWhO8aYuSY+bV2Lsl+?=
 =?us-ascii?Q?pewD5xq5io98L+JUAGhia2mx5zeuFkPthyoliuljFPhH4i2NSSbnwuQv+/bQ?=
 =?us-ascii?Q?mkg4aZu3Y90DhkSMQ2Yn6x6wOjZpsb3WXL5ljLd/ozlyB7b5BBALqT2wpwZu?=
 =?us-ascii?Q?zFQ7P22B8+Ce2e9TTVqC4Pksxy929P+cy3w3cSFpKFIcEEuV2a+xcFHL8wME?=
 =?us-ascii?Q?IdDat1C7uAYdT1byecYET47HzYVZHOZ9zSwlNe/c7qozfgkFeoy45MzI0gs2?=
 =?us-ascii?Q?qP+FUqSvOgGsdE3PUp0oxxarLrihidMZyyJCz8LL35cUsfjGmKAzKTGH5W8/?=
 =?us-ascii?Q?ZMo7zan9OWHLP24KOS/utPOGDp9uIYQ=3D?=
X-Exchange-RoutingPolicyChecked: io5mCxda3J6G5PrC4gh72LdiUrSN9N5AbBQlKAPaRwPFt3qZECBTpoC33YvrXxwGLD3TvMZ+rXXjvstJGJaqj7LHi5PlfsVk/b20IawyHA6RnGruirPaMRFr2a97ifrPugBH9Dea5ld9FnAUsxtMatAU0xz+p9z4qtPmQtOFJNYnM8RnUbBn6tQs7MEmBrEaq2RyCw+TwRoxXWy6jcnBvLyZha/Go+a59TZYd4dYghzojbEWWVxUkGUTPccTp55W4z9Q6hf4hL/ZbaSL5VDRlfkm8Qx9Y2/g5Fdf017EZIBWlVseZNoMVDixIOiyY2+2Z9WRYhYsr3ZpkUFRpcO81g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 31de9ee9-795e-4761-acae-08de8fe9066e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7838.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 12:20:14.3078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hscaHU7xmyKHlKB6HyYFDZCBB5cBE3iKmd+Xu7/+XsR2+C8tbumSdr2HOoszekbKybtgYVhHbnZZCX6DZ2cOuGDMdpvdc0OUJ+D3PFrXNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8796
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

On Fri, Feb 27, 2026 at 05:34:41PM -0800, Matthew Brost wrote:
> Update the xe_bo_put_deferred arguments to include a writeback flag,
> which indicates whether the BO was added to the deferred list. This is
> useful when the caller needs to take additional actions after the BO has
> been queued for deferred release.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.h         | 10 ++++++++--
>  drivers/gpu/drm/xe/xe_drm_client.c |  2 +-
>  drivers/gpu/drm/xe/xe_pt.c         |  2 +-
>  3 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index c914ab719f20..bf284ed47325 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -348,6 +348,8 @@ void __xe_bo_release_dummy(struct kref *kref);
>   * @bo: The bo to put.
>   * @deferred: List to which to add the buffer object if we cannot put, or
>   * NULL if the function is to put unconditionally.
> + * @added: BO was added to deferred list, written back to caller, can be NULL if
> + * writeback is not needed.

We should add in this comment that if set by the caller then it must be
false, because this function only sets it to true. With that:

    Reviewed-by: Francois Dugast <francois.dugast@intel.com>

>   *
>   * Since the final freeing of an object includes both sleeping and (!)
>   * memory allocation in the dma_resv individualization, it's not ok
> @@ -367,7 +369,8 @@ void __xe_bo_release_dummy(struct kref *kref);
>   * false otherwise.
>   */
>  static inline bool
> -xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
> +xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred,
> +		   bool *added)
>  {
>  	if (!deferred) {
>  		xe_bo_put(bo);
> @@ -377,6 +380,9 @@ xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
>  	if (!kref_put(&bo->ttm.base.refcount, __xe_bo_release_dummy))
>  		return false;
>  
> +	if (added)
> +		*added = true;
> +
>  	return llist_add(&bo->freed, deferred);
>  }
>  
> @@ -393,7 +399,7 @@ xe_bo_put_async(struct xe_bo *bo)
>  {
>  	struct xe_bo_dev *bo_device = &xe_bo_device(bo)->bo_device;
>  
> -	if (xe_bo_put_deferred(bo, &bo_device->async_list))
> +	if (xe_bo_put_deferred(bo, &bo_device->async_list, NULL))
>  		schedule_work(&bo_device->async_free);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 84b66147bf49..45efe7a55427 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -246,7 +246,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>  			xe_assert(xef->xe, !list_empty(&bo->client_link));
>  		}
>  
> -		xe_bo_put_deferred(bo, &deferred);
> +		xe_bo_put_deferred(bo, &deferred, NULL);
>  	}
>  	spin_unlock(&client->bos_lock);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 99b15d37267f..83dacc91b7b3 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -212,7 +212,7 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
>  
>  	XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));
>  	xe_bo_unpin(pt->bo);
> -	xe_bo_put_deferred(pt->bo, deferred);
> +	xe_bo_put_deferred(pt->bo, deferred, NULL);
>  
>  	if (pt->level > 0 && pt->num_live) {
>  		struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
> -- 
> 2.34.1
> 
