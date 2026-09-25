Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D15FC98324
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 12:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4929A10EA09;
	Fri, 25 Sep 2026 12:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wji9I0t8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6795410EA09
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 12:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790337630; x=1821873630;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=L2oqn8XO36FC7px9icqLRu0qBxWsBJ/xbOFKQa0uUJ8=;
 b=Wji9I0t8xqJnt5arCjJEcD2l9Gabxv2CM3Ub2SFEaMC0hlI404pbQGa9
 LLrBcGBORAZcziFUBMX8n6l2yp1T8efg6ZhPi3+hDbK0T1bJh8W5GG7t0
 tbqTSPXNZKrm79k00bGY/XOZQTF2MlscdnwtA9bFtDZrSp7dbmdDYn76U
 vwNutqWmzwzLNVoF6OvHVWHtkq5n2fo1CYjc16jTbrJSr8Q0n/IbPZ/X6
 E0wjmgnN27FGjksofFG9qGSDY1MAwTvV9zEVHR7dL8q1bbyI56n/ymyg0
 o9arWn8UFwBa1PzrtZXV9WcHwfAS9stfubWxMGU3N2IkLQeqI2kxwS5WN Q==;
X-CSE-ConnectionGUID: QXEMA/1ORsuCmdNqgjMOhw==
X-CSE-MsgGUID: cx5qoszdSXaD6F3l2E3g2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90248451"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="90248451"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 05:00:30 -0700
X-CSE-ConnectionGUID: 3n/7hjLtTp6T2S+J6cILvw==
X-CSE-MsgGUID: hhbaXXTwSH2k9jzjM+Rr0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="273872064"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 05:00:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 05:00:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 05:00:29 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 05:00:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUuuh2D6oOg/pWrHIIU2h7Pyw14hR4QDy7nLA7KYxq1WvvUlE/YUGVQnhJ+BkDy3Dv4RXs/dDmX5XOrguvI+3zqpym1peZ9XWrnlNCX6O1mzJgb/yp6NB5gQGhT8OnlzxwREW71nl9LzlVa0ObWYq79phfIlOzsGKKFdt4IUV88FblBAneidHdyNIMq9Yc81AZJjtzriaeZ5N+r8ttSosUpkZ2PJbxYi6aAYrFSR+3qcQ3Y9YXm7a4+SYQlywWrayd7LmwmUqz/+kDd/aIRycQB1Jg0SBht7wDLpZKK13EtxPAyzaifQHoxlzFQqfccJDlHnZ/g1LP+Jb/agN3hvIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KzRA8V7cqUf6TfkdqyWTQzceGkiSrZ/JRD4lkFTkD0=;
 b=Xxq6nH7dXdQosE6bmfl9v452LooCzE+NjAHLsrJZjGmUzyVXXevZ3cWceu0FOsIu7kq1hEVAmqkB4EzCOqbuKcNY1W6exDILPQ8t6kv8VEf4+OOxYXX3Un1xak+mPzuTsezwMLKc+foNrZLISNMXSOE+6BWCOH6FUGCKa4xeY6x/r3rf2ygMtIOCCj65QJx0z9Pgxo/2Ycjfo3rK0mEO+2aII6DAQWpAZKqQutgO3usWEAtr7ZHA4pUEqN/0hgmnD/9FPci5EqrxEkmRUk9kGUJ1D7OBEIEXNnFWiNW6AwMlIvMAaRzQbSFU1nosDbExiRem4fBJBWGtWPh5sogckQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB9534.namprd11.prod.outlook.com (2603:10b6:510:39f::22)
 by IA4PR11MB9249.namprd11.prod.outlook.com (2603:10b6:208:55f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 12:00:26 +0000
Received: from PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266]) by PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 12:00:26 +0000
Date: Fri, 25 Sep 2026 14:00:22 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 01/24] drm/xe: reference VM from PT BOs
Message-ID: <arZiVjq3XJHWFpyM@fdugast-desk>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260925045320.1325860-2-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0059.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::13) To PH8PR11MB9534.namprd11.prod.outlook.com
 (2603:10b6:510:39f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB9534:EE_|IA4PR11MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: e9335a05-22e9-4d0e-499a-08df1afc960d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: woZQJ0oexCD0/vtoLkY4lhU2zztgb/Cp7p7sI7mAGoF8hwhiC4jmSr0pWtpZxZjTBcPAdzgiel0q9dK9DWvb9Dr4sQYSWEjWgng1WnEL+UsguW/L42icGdYUlCmjissy2FS9RebvzH5E62l7b+RvYQaVTE5qLX6FsbWjTsDrM0l7BVI6G0xILGKQ0vU8nhVl5BnTUZnkCJEtkeDPKY9QRWoQ4PcYUZ3ox3a7i/KYsQzf++J53zCJxXblp37rZIhMg2j8xhFpyNz7gKx+4xOftUMiUso+Sfm93sR7XmUKLsYkVBBHa+CzqhFiNHIzvBnp6dLkGpAr6ToK+A/etEB0FhJJwduiYCOi/k0bBKXk5aEOZDKvOPEXpb4glF3H4e+ypHdRFSY9OOosj+qcCAZjq5DcM5VcQyMZD9p2bpUJlSCP1esC2QU9NVXAY68ajkVitqVrl8T5PGC32jZX+VCYb1kgO6gLEqO45KY14yIK9rvURcmlfegKlq1qERXhojiUOcGF10WddSIZU7I1mgdY1NW/Bqo6poegTuacs0ibikUOUM4/olKAHd6JfR/ZMbpMyXpFZifqhj3/5rHuyiF2oFQ97ocQLW7kZDnBty02Gjj3F2NpQBRvaC6MTyC8e9tdDKrmWPrUwAz88hK/8B0drLxmF4K6Nq2DjezJMVIlMro=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB9534.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xunMfuKWsUOIyQpGHOe6K1oASnm/3JtL7tQ7Rkaqn/u4cyq/UgX5kpurPk?=
 =?iso-8859-1?Q?WAQcr1vu3Fk1L6q8S7Au8iDqOPWSDgEmLYeqItyikiBBFjZToUNdEefR9B?=
 =?iso-8859-1?Q?iO0SVnJLzWZ1o7kATUfoLaurwZrSl7JFqRA6cN6J+cnEBpEeMp2MDuzsO3?=
 =?iso-8859-1?Q?fjSJC6OItU81+LV8PxfBGNl4tNcwXMc/dq56JQgE+badcyXUr1rSBRcHP5?=
 =?iso-8859-1?Q?wpnx0quAE6AsQvFQDCUENRa831NxCYZqzE3Mc7IHz77la+/BSGxLNB+yV7?=
 =?iso-8859-1?Q?uDKJL4TCPyz4fAR7MZDje3QE6D/pQMv6iwhgAHa+7qrQptMUQ4Wzd4XPEa?=
 =?iso-8859-1?Q?wDBxfPlxssJPsHvLE8J4R6v0f9utgDz/RqPvOYIzVW1RXq3YWWg1dIM6YN?=
 =?iso-8859-1?Q?mZ8f/NgF3iDtFcziNnhmw8uKSa7PkHVgVlBnosblUqWwaoqdz5xDqvXv4D?=
 =?iso-8859-1?Q?t8rel80satEaKyrGGO5C5i8efQP06u2nK82dZSowdeVGW02dlazDzM1mfR?=
 =?iso-8859-1?Q?lvUgOzSOIlA3YsKIuOKr0upunp2JeDGSasksM6ERZTnJCkgw/XlU9+/jln?=
 =?iso-8859-1?Q?GlCjK9ozoIqs9l2aPRdcrvIdAOz6MdFD11nr21N8sms2oy1tWStd+Z39TC?=
 =?iso-8859-1?Q?YYW2F7IaWD/btgMZ1C2nsEDU36f0JHgdh2d/0Noocfl0z7ApnZL23W8FDQ?=
 =?iso-8859-1?Q?kVso6qz1W0V5HHRHn6L0X+Ixx4pBxeRqvm3AEj1f8gpkHCwvu4w6C4pHJY?=
 =?iso-8859-1?Q?UXPfj+07aIPBdgS/jaLM2kevIzhQNwK5I04ZNG0yWDBuWpyNTyFRk9OXeD?=
 =?iso-8859-1?Q?ehhDOeVYX2tX1/ImGRHF7Y6Sy6dtJSFIINLuOnKJMYfitdPXY+Kl/P22de?=
 =?iso-8859-1?Q?wMCtad2YtnHMPSCmmyyzYlCV0b0bJe/T2DPU/6v1RUEYTGIWSozyai+oHH?=
 =?iso-8859-1?Q?t+vjQe/ayjBYWxYqddGiw0+gbd7E5lHkisfCFYD2p8yUsdE/8iRKNj4Vbg?=
 =?iso-8859-1?Q?hFZESXx8dnT32Zd14a4WQYldC/vR2T/8AIoilW0lFEnukRudBGAeutlgXo?=
 =?iso-8859-1?Q?XJwkfNmjOd2yZuY9eH5AXcx/kQnWDPzS3jsZf3NmJtu5YCrBCppTzG3WDy?=
 =?iso-8859-1?Q?EVHcw/BehfX31huF7MdnDv5JFwg8b+ybzG63koGU+bu05ZPjPt1pqmlRpZ?=
 =?iso-8859-1?Q?7lA+YsGcN70lkHtu09znc+zVW6ZFfp8i302LF49WCbIdmQEwSsgY/dquhA?=
 =?iso-8859-1?Q?7vH88wuLo1IsI9vEsZNyTnyPjE4gY3PR44nFSm3i4ooBN5isSIDD7ERHoG?=
 =?iso-8859-1?Q?+b7RyTK9f1ijz0/DpLxv0Lfr1ULxafFC0RR9F1a+aWmKlaYZ0VS6tQf5Ms?=
 =?iso-8859-1?Q?u3o1HtKEafjrSX3ws1GOAnVx9gT6ytGPOpbBR8q1eh0NIw/TUtLHDOl+7s?=
 =?iso-8859-1?Q?uA2O65AV3nESptF1q8Z3wqBGoePm4kgEcy7EQLXfgnoyXgkZTwLRINn1Lw?=
 =?iso-8859-1?Q?mN3XuvB+dJjRIBztDV8R563kqS0Y+YYAzYS/vw2AWAQZOghTi+bsqwyBmQ?=
 =?iso-8859-1?Q?SDNKeOH1hNNM27oA1B9okBVUopBWY/z3GMzwyUF876ui3evLJLXJOzFQAb?=
 =?iso-8859-1?Q?8tcJXZmwcswDxw+uM4y6OiSCKrOMObX88jUSfNs861x4ZqAtxPv3SkrBKw?=
 =?iso-8859-1?Q?poI7SZhlLLPuL3YtxpDzcSUkjEXICqf2XLU6v4LMjxMDIQIN3EqCMwyyC6?=
 =?iso-8859-1?Q?DLgtxUeglMbIE0HzUzGoIaXxjEbTkGziMS8mSNZFtbcDO3l8WehUweUrAU?=
 =?iso-8859-1?Q?vpxyyr+9kx997nyFPmIU645/DxiNKxk=3D?=
X-Exchange-RoutingPolicyChecked: kXsKKt/hbIz63zrIIRY34WAyC4S5o0alqvVQHYP/L8KFCR0XC+qhfFMRa4iPAw3b+027fNpgYq2Y5a9AcEiL1SQ666qRd8yt+8vl/l/HGpaaozDOYZGIu1c5moL7u6nJ3lu6nPDIMxqlsILtWfXx2fvNqoZoAZAoWa2W9Uy/ia6PtKQsyovbxZwyI7WuMKogziOxEn/J7w8ldhCln8jgJ4bAlN6WoImLXcehiSZUUa9gpaq2jtN44gSb8vuWO+Jo4Few7QAU121nn3GVW+crlAnQ1dIhh7DKgx2KIKsnVVLoOpFhd8dooSfYwItR7U9NYkAkJMrF/PJhtFfI0XuG0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: e9335a05-22e9-4d0e-499a-08df1afc960d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB9534.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 12:00:26.2274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rk4AV9jus8Bo1H9XezBrFM4Knkym95TKb5pH04jAr5IL67qtrljGp0tCDg7r7rRzw5hE8Qkln8QjbC1KB+CwoToLw06jDPYtYkjmRffwkMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9249
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

Nit: first letter of the commit title is usually capitalized.

On Thu, Sep 24, 2026 at 09:52:57PM -0700, Matthew Brost wrote:
> PT BOs share the VM's dma-resv and therefore must keep the VM alive
> until all PT BOs are destroyed.
>  
> Take a VM reference from PT BOs to ensure the shared dma-resv remains
> valid for the lifetime of the BOs. Scope the change to PT BOs rather
> than all kernel BOs to minimize risk and avoid extending VM lifetimes
> unnecessarily.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Did you observe any side effect without this change in earlier versions
of this series?

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index f2ab9bf43a86..6921b6967330 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1879,7 +1879,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
>  		xe_drm_client_remove_bo(bo);
>  #endif
>  
> -	if (bo->vm && xe_bo_is_user(bo))
> +	if (bo->vm && (xe_bo_is_user(bo) || bo->flags & XE_BO_FLAG_PAGETABLE))
>  		xe_vm_put(bo->vm);
>  
>  	if (bo->parent_obj)
> @@ -2575,7 +2575,7 @@ __xe_bo_create_locked(struct xe_device *xe,
>  	 * by having all the vm's bo refereferences released at vm close
>  	 * time.
>  	 */
> -	if (vm && xe_bo_is_user(bo))
> +	if (vm && (xe_bo_is_user(bo) || bo->flags & XE_BO_FLAG_PAGETABLE))
>  		xe_vm_get(vm);
>  	bo->vm = vm;
>  
> -- 
> 2.34.1
> 
