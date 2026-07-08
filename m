Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB0EC43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 22:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C265E10F315;
	Wed,  8 Jul 2026 22:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abt/Zsq6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C521210F315
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 22:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783550740; x=1815086740;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kl1j2F8v4iD+zpv9Ws7YlRZ1XgQ6wDKRXSvH+mTf04c=;
 b=abt/Zsq6kEJgbUmAq0h+t1y1EpQtRqz9wo7i6jsmjKn6Z8oWlkAySlpg
 GZefKIhHB/NC+EmNrm+ZJOBsEIgh8e3XyxEOONAZdh8zSwDYMl+PbTE4b
 z8VbfNUP9A8ers/RWqrnfh9tHmdVRL0L9bURtYVOgkAIZko6FVewqFFbM
 x+b3bXKEMpIlCpdelRdEoPj9NvuEz0SQ0l90XuMdTZz64d2Tj4kY9d/3y
 +YcZiZX8tf44o2N+P+xnPPWaIeOY72wnyUqzu8iglLA0mlr+yHmTQAm9s
 Wo+/dNFLBWUxQL7E95xL0wdLqq++g45oMxo5xKi8/WlVeHlfNEEdvTFYu A==;
X-CSE-ConnectionGUID: LPVcYNvmQNyoI3bTN61cUA==
X-CSE-MsgGUID: qxG652NySPCiGSMVYKzfgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95383608"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="95383608"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 15:45:39 -0700
X-CSE-ConnectionGUID: u5V4GTKORRSx+o+YkSav2Q==
X-CSE-MsgGUID: JCnSi13jQX2TOkUVuoocOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="256323608"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 15:45:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 15:45:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 15:45:38 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 15:45:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwqlX0QqdtVOxMm1lopccecifnOj9aG7Aj+2XA9Q64cOs/qi+8RFxyBFcVe9AytO8JOfD1xgvr9lnRzW1pe2KUj9rrs+Js4hYZE1qss1226e/+mZGcXMG2r7el8y2A9ix7RLBXziwoCNHyDedWm2/3PlfBWOBL7heyMUr0RA9EpxCJ164Yo0M7L9GZdhs/KnDDWeTRM9nXlwejNOG7ymYU+t2FskwfY8MgLBXLdiSZWt88IIKUbThBpIavBo6pqiXBrqx3dMJlu303b2snIUO0Ky6fo9W3Zuo8hfyfDdX4IoOKAJEAfdDs16ogC6d0rM0DPFN+9YXeKNr34HqlJ8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4yEKRCZcz6+zQCkJun2/crmpPKZdwO6lU2Z0COj398=;
 b=Ia/13DXr2H3yKC+XaFFcB0Rb6zp4oyy0Jgtlk7zomwjBqZXp5d8zbXvdFtJfeq+PjVB5GsH4tyjNpmwdKgzw1kLgCEwxm0r4sWX5Prxu+gqZlJl4FGGGyO/pSuM0v5GgnpJOTxKDwbq/eg86h6EWtLrYCqnbbOwbDEPqQOnzxVHp/ue7Q1zwzcBYOarS0vPRByEJ11i9QKgoAhI8Vm1XawV3KcnUXTELd9zqp4BNnBNSLRvtJwT8cZujmBJfw2up9hKStGMnkHFbgmzXdFDgYaDJTD4D/ZG4jL5u7G48l7E1ySndcjnIYqzUvieD3wWmu/n04vMDDY0FkyMzdEAPnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SAWPR11MB9571.namprd11.prod.outlook.com (2603:10b6:806:4e2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 22:45:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 22:45:36 +0000
Date: Wed, 8 Jul 2026 15:45:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe/userptr: Stub notifier_lock helpers when
 DRM_GPUSVM=n
Message-ID: <ak7TDhMMPC6LDZp+@gsse-cloud1.jf.intel.com>
References: <20260630192221.2998168-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260630192221.2998168-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: BY1P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SAWPR11MB9571:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e70b457-6aaa-4e27-db6c-08dedd42a067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|11063799006|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: cjUuCUaLIk7VFyo4KcJnTQfTKKsqAXJfJ00uqSLX+/KTk7rRM6cqBdw+Bj5oN7Zbt3LIRVvgazud1t615BO3XqafmK8WP58EnIj4FOAgl5ekXZ6kmXHbEr0ha3JzdSXhYxC0jvw5s7yhnOOCw9ULbAmdTbt4IUl9exL1hULxOwS5cl+XXg/dQFP1wvudt+e1Yi9l0g1qsTmCG/aBikCjg9krKj3MAeqjkRmRznlSD2UgpRVw5lif7bo6n0cAr3NCpK1LGlobjmTdbpAWxQHNlv+/wQ+c3+pjraFD+RFSuOo/n7LkbQ4aMjEdAQXhnOEPkGhTXkTkzDM1cgSK8Ae+7OJqT+lu0CmxloYLOvqHT+ph9SYJKfvV31USJBy3KWrgoiM1s1HkQC+ty9u1u0ErHUb54ZAJC784BObMcyjGtQpli8H0e08wmimvQDycNR3eHGWg00rZlgEnPs5Xgo6Wix8JOPquTY64NcBTb+eUPNJUnDI3bd4ySQajtqJ6hK2+2H+IzDyjDUFIgRWr7QpRVvVuH9eICPWeLOnxcwhBENsXH9QyZH/cWDnEGTaSlY/3Jq4MhTchWFvq0zFLRTwzovqajY4qfH2OMdsctEh4sbRu/00P62XEAJsM1hADlsiYgTKgeGeEtwtRV6MAugTq2DD40mo94yBxuKHtiD7uxck=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(11063799006)(18002099003)(6133799003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S/xBnVBhqImEQJ7WW+MH9WlAyThKQCnKjJ4mOW7uVV9sVXC15F3e/kzQb1H8?=
 =?us-ascii?Q?4u9vgZ+pl/hjMUXqrX9GBsH5twO48nEPhwC9PFWAoko+4ippmofiZ+ltWj4v?=
 =?us-ascii?Q?qlffs+YIdtX3zGGZaFtZ0rspoWMGrQ+Wp/+a8tcT0nyzo0CXGjxNMTzOUq6I?=
 =?us-ascii?Q?ktIdTbrQaWRFXUt1N9knKfBC9TkBWOtCI3etLamHQSiEHLBVTn2xDjWhAYP/?=
 =?us-ascii?Q?flfU1/ye5Y0i0iAu/x29DglH9KaJPi7ldt7TtNC4IWu5jVsv8fVtj5AqDwrY?=
 =?us-ascii?Q?SRHhM/bebUhJIsx6F+wahMDnMrNY9RfgFlza1Q2MyKcPEdhntkH0w7Gli1in?=
 =?us-ascii?Q?9GRcH49hZU+6A3iLcPOrrW3Jhqtu5iYWio849JrjY8A074Ls70MH0I8Bvi3/?=
 =?us-ascii?Q?X9uqZVaJR4vMYaw6MCtSa9Bzh13LegI5aD4a51f96huwZOx3FwsieF3OwiR9?=
 =?us-ascii?Q?pBJ3Qvey5rXxO1pkHSvdUjdmhjXmmJhDAfIIKs4PVVhWyQsDXlR8/tsuYt1a?=
 =?us-ascii?Q?HsbkRQku9eAyVmBzcpIBhCFwVEj9j8tHLdX0nhzVUHDIvx2OHS6QYBHGajVo?=
 =?us-ascii?Q?mUAsy8I7JO+ZHR1Ru3saJxBcYNzZT+dgiqGSeEqyUw3OwSqWQdGYNsSYEbOz?=
 =?us-ascii?Q?dTJcWtbZq+kU5HYHoMlxRLRX323Kt1qNrqMl6XX3c7ym6Gl3+775R1orRjvb?=
 =?us-ascii?Q?oHrAiZSmW/OExj05gKawsBlqWNLMQqG04GMJA7j6Kj3waKrQpNDapeSojT8N?=
 =?us-ascii?Q?GGJTNZiDUzC0e45sXDH2BZkVDYRt8vj3+2udr4LlmH74WxqtGH52SztKPy9R?=
 =?us-ascii?Q?ii5mFpGfFy7+VCVgyOoTYpNq6BrRLWvzZyz5KmJTm9RZ2ETeKATjul1ItGux?=
 =?us-ascii?Q?3Q0Mprn99mCjbjxHK3/8quR6t3xtkbVLbYwooDeMS/bcoABLlXSenbUZB8wc?=
 =?us-ascii?Q?81572XU9OwFhr6ePP0n4tMcxoAz4Hxo/7vOHbtD9or5vV20N9EeL51iWWQIU?=
 =?us-ascii?Q?bQ94Hl5zOUN0Qesdl2H51Yxl+/YXXLLEPC/3yd5AtXcLqG20ebcXbXRmZvig?=
 =?us-ascii?Q?wwg2Di7awWi5QVqPNkTzsewxh0XVvdhb181MaSdpPJsPCqx6EGFyrdb8JIkr?=
 =?us-ascii?Q?L3KyEjAMZcGwdLo+E+AD8q8PpY7MJLA+/DqKWKBIahVZMe/8ILmmhB+o55Lk?=
 =?us-ascii?Q?YdlXxDzR10fxnNQeVqzWRwxeUOXFLFizOUQkfyIEmYCOHx34Ll0X1mwM+z5H?=
 =?us-ascii?Q?+ABPQr3XZXFR5aXZLsv5AB2mffJLsM2g7lME7BL+8fN9hMhVGHEmVapGZSHp?=
 =?us-ascii?Q?Y7K2jJJqWruWw2PI4PjqRcr9HL96OAXslhrBAwUjFEDGPvx0W/js6dEkOD3Y?=
 =?us-ascii?Q?5u64YCG/ub40emaLipbORa5jRZM/sQhnDXZeGghuR89LNuTMfE4vT/RYcMRU?=
 =?us-ascii?Q?7cPjBuUM+WBUvFOzE0KwJNbFgL8gzXcaqXBspO2TVCbFZPG/mhuBhWoo3HUY?=
 =?us-ascii?Q?1qTgMjwh79ptlNszY1a7ZG+I6vF+9jS5TVog7mb8+H9tiQUdDYTLbbNWGIhk?=
 =?us-ascii?Q?yoRHaNwCqQ/z7Wod0a4GXk1DxUyVYaNQGHMWExNq/bqhcrz59Gyu7bqVems0?=
 =?us-ascii?Q?kKWiovQW7+mWbYUcKdetEOe0FqqBpb+e3UNfjYtj4IaVQXlx+ivoKCRf4nQo?=
 =?us-ascii?Q?K75PWss5UOSHW8QnXo7gdt/jqGgtu1F1ovRTMHcBC3g8/LHGAE023s0Fagpe?=
 =?us-ascii?Q?0AD3o++UEQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: FawKIB9z70VFhKgtZRB67hbU/NheTm0Npo6gQDWdQMOmLVV8WZIkxOifwnbcyAEYQdGZlTWQ+GZUEJSgnboSmjz4TIKQ/7XRGPOeWfN5r0Sk5bV7J29CB9U+ULidjfRCEJP0Yfc6BREst+FTS4MAI05hSxnltNwm5LQ9ILT6gMB+s/07mc0vQcTpmWAJawv8WBgu0kkBktDbtxpRcoJcuS+0dKsIRRYOx3nzr9/qD0P0O6up92rpkzOfo1hpq3/glTGUWlkMrKTHR88qA3K4l63MHfhUUTbDmfZfq53HQqMelbiFcn91Xw1nUTwKaJ8y7D0RCeji5s+1TU+BDuD8PA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e70b457-6aaa-4e27-db6c-08dedd42a067
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 22:45:36.3423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PaZe86+5817iIbFvz1TUMCGZbKwnVwjCJa47dCt6pkcXZM1Vbllf9i8tGnGHwD+5nJwu1628B2myQipUMdEhUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9571
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

On Tue, Jun 30, 2026 at 07:22:21PM +0000, Shuicheng Lin wrote:
> When CONFIG_DRM_GPUSVM=n (e.g. um-allyesconfig), the only caller of
> xe_pt_svm_userptr_notifier_lock() is compiled out, triggering:
> 
>   drivers/gpu/drm/xe/xe_pt.c:1418:13: warning:
>     'xe_pt_svm_userptr_notifier_lock' defined but not used
>     [-Wunused-function]
> 
> The helpers cannot simply be removed in this case: the matching
> xe_pt_svm_userptr_notifier_unlock() is also referenced from
> xe_pt_update_ops_run(), which lives outside any DRM_GPUSVM ifdef and is
> gated only at runtime by pt_update_ops->needs_svm_lock. The symbol must
> exist in all builds.
> 
> Provide empty static inline stubs for !DRM_GPUSVM, matching the pattern
> used by xe_svm_notifier_lock()/_unlock() in xe_svm.h.
> 
> Fixes: 80ccbd97ffee ("drm/xe/userptr: Hold notifier_lock for write on inject test path")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606302210.QqcLbOEN-lkp@intel.com/
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 4f0f438d6b9b..20b9611e993b 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1406,6 +1406,7 @@ static int xe_pt_pre_commit(struct xe_migrate_pt_update *pt_update)
>  				     pt_update_ops, rftree);
>  }
>  
> +#if IS_ENABLED(CONFIG_DRM_GPUSVM)
>  /*
>   * Acquire/release the svm notifier_lock around xe_pt_svm_userptr_pre_commit()
>   * and the matching late release in xe_pt_update_ops_run(). Read mode by
> @@ -1432,6 +1433,10 @@ static void xe_pt_svm_userptr_notifier_unlock(struct xe_vm *vm)
>  	xe_svm_notifier_unlock(vm);
>  #endif
>  }
> +#else
> +static inline void xe_pt_svm_userptr_notifier_lock(struct xe_vm *vm) { }
> +static inline void xe_pt_svm_userptr_notifier_unlock(struct xe_vm *vm) { }
> +#endif
>  
>  #if IS_ENABLED(CONFIG_DRM_GPUSVM)
>  #ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
> -- 
> 2.43.0
> 
