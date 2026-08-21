Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3A4C5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 21:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6C110E357;
	Fri, 21 Aug 2026 21:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ViO8kt0v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6847F10E35A
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 21:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787346454; x=1818882454;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=O/omrhzIywCgimwZuKgCt4KwkWwwamJudoDJgTOxakI=;
 b=ViO8kt0vcKiExIwZ5Fy/AlJmwou099q5Bgwcg8nuse95kH9EWMCuX4qd
 w4aX4uTTP9F8Z2WMZthfdKEQpuou8vVybDtBBfGDu89qRm3a5F8NJ9zqB
 hEpHs3jRXJNLvX+ALZLi5r0g7ba/zh6yFiPhVfU/zhJ3iWxNx7RE8cvXf
 pJM19ELsMHdg8XijL4Y5i80jWoEnGejFtEeK02mjiI9yuqXFeDCHei5vB
 nrleSLzM166lagHBYHw5s6v1+rE3JoWwKDybBTDy3qnRgmd9tjcJZCYc0
 iJFr4lJo1wHwOPBRE8HYm1qFigGVFm/MSuWfthbTaPP/veSnd4+w70mpY w==;
X-CSE-ConnectionGUID: tE2ArLTfRDq5PyqL1ZU7WQ==
X-CSE-MsgGUID: Hss6ylEnQgCF4jE1hB+ysg==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="75438521"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="75438521"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 14:07:33 -0700
X-CSE-ConnectionGUID: xq8mm71RR3CeIH5hiT52dg==
X-CSE-MsgGUID: iYFCgU3eTNeG+QV/p7t11w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="304649976"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 14:07:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 14:07:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 14:07:33 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 14:07:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obFrlHjGxO8xoM/QwTLqU7+MR9pnKAWgz9PQbAlcYWJxMswUR/R1aZG5qMNe16DWLQafI8mtFvAMn604oKPJdAYP1yfhjkuodfrnD1JR+8lUbIPglKcUYxzj2DcaqKLDjjzvBdJtORKjCCeEBnbxLF0urSGh6LWYwWPJDd0/fiWhJcLYwXej6p0Mzx8Q5tkUb0WYaGbI3+k98qxfhAd2RdqKoAQKFrdguf5NDFl5ZFhrFHDiScIFUc6xbphbeWGpHljsVQx9c1MXO/0P7TZr4nlQx7fizB+s03BxEXc9o4tMlY9wW5KP4qCQz1LN8J/slkF3qeRfPnWdY366ySxXLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsL9OUVZY0rSDahRGaDLoIB6g4UZrc+VN5L7LCnV6Uc=;
 b=IP63ld2SkUgfnbU7nbyR/lRtrt2Ttbb5dblM3JrlOB507XCbuhk/VBP2xr+RmkqDgpKepbzakEIrIqawsAs6tL3rRCOesw3Zyy4CPfPPv+brmNQkBpBOIeX3K6XzqjO/k075GByxR2oKzB0or1Iur+tRXrLZrZSmKeqNJay+icsPYY1akzLWwftE9A3aX2paYRP+AFHbkO7c/5ReXxe+oMwpuwIy4BP7LHsc2ZOAwo0v9kmtqqHgkm1CMEVLFabFKmu68bxfREEXKxNDakbiRcKpD9HCCmNvP8d99UfTSreJV5Xg1Ra3uhVMHjrIeuJn//8vKNLMii8xpFJN21nvFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPFC222DF22F.namprd11.prod.outlook.com (2603:10b6:f:fc02::4a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 21:07:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 21:07:22 +0000
Date: Fri, 21 Aug 2026 14:07:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Reject page faults from non-fault-mode scratch VMs
Message-ID: <aoi+BzuiZE0NLr89@gsse-cloud1.jf.intel.com>
References: <20260820065445.567228-1-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260820065445.567228-1-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0153.namprd04.prod.outlook.com
 (2603:10b6:303:85::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPFC222DF22F:EE_
X-MS-Office365-Filtering-Correlation-Id: cd45f5fb-bf3c-4cd1-f5e0-08deffc83176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|5023799004|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6f/joj9d49qJQ7i2YzFVfpufwLgeyB2Sn1+HqByABNXUEpSWztM4/gg0iPttrbhHDz0L4GBzh5BopOUWfkX/HlXYlMRdAAD36LSpfO4A0KLvUl5TTKa+8qQnSYJhf1Wdi01lVQF+UsOfuCAhPlKI1vcJhp8f06Dd4/z11aLNO29OVLSnrEQg1GvDsehhXySivDHjiLpZjMjBXIs3pUPBXO3Nw7ORd0bbGOGN7J4NDvYgreHaWgDxKCHiP0yY2vRUYYTD5MkY2kkVX7bFYHLiVvvIlNj/3dcIHJbb3/d1QrV3dOM/mR/8hWhYPwTVFCa+e6PX5q2ahxZa92VWQ9iwfMvWqCt9wms6xDg4WYFcuQTilz+zJ6lyr9LhEPebImjtcoyC7ybjtIjFS2ZKEK01NxFN3Oi8fxLaOGnGML2aaeT0EC/tVjhURpY2l1WOmweBrJNJIj5LRcKLoK80yYaRgrUH6p/rLJInA3A67BIimLMeftmAMICGDuwNKl68hmSsb/Y4of7mYmAmml9U3e9chb7BTvkUlIHclhQ6QVzMwnvtFFu5oKNUk6JK86rHENElhTSDEOlyobMp/l86KpDrrh2X++EQwNINpnyszcCLN0bjWtU2Kf0T1FZMRReRafk6m3IFU4vouuQMWw4P1Tz/nDax9Rv2WDKI9wygP6otZ5M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eJvchYD3u6VKWQQMXV8UI18AXOXquRMG/3bIk94z070v9bh4oI+xVEzrWu?=
 =?iso-8859-1?Q?fqNCQOvSM7oqKx2eYVNZ+JAC0X18iOqz9caB2mumvg2teYO0/3HBvxU7rt?=
 =?iso-8859-1?Q?hD0xU4N1z5MrkWUUE0bCaEYToKb2dZuNebNHJwJjmFGlqciSpQ8jUHEkWY?=
 =?iso-8859-1?Q?ybdxZ9yqfOfXTohESqltM+qvY+x8MxQ3PStaHRBjK65MlXxFiO95ZDugvX?=
 =?iso-8859-1?Q?w9q/6lJOc0U8cdqpD5UaNm7JBRpckzm/B2paoj7EL58wiyGimFtYNF8Vjl?=
 =?iso-8859-1?Q?bjM7YAOFfoNO+2YgmvTIJcR06xl+bY/+WQHtBuN7CZLmiX3sFjz3oXVMhy?=
 =?iso-8859-1?Q?fZkFZ0MJYfUaD/T0ndSiPin/lTQTA8Vqw6y0D3hGY50+I5ChkEH53ukooG?=
 =?iso-8859-1?Q?mF/VLEdkjpYH4iTDbYU+KDFRz/hiJ/aj5CEUVmTnBJE+96NEekO4LKtQlf?=
 =?iso-8859-1?Q?2LwocMj0uy19hcM8j0TbSDF+axr7lRa4M9oBIFdunJRyj1HJkYf9zP3qHk?=
 =?iso-8859-1?Q?HfGK4fdCA6UzpeRSMQXs7syDTxxogU2gO/FweX0b3vGdJbecyFUMaGbiLF?=
 =?iso-8859-1?Q?0oMSL8TFfFw8u9gAyp1TxaNdpSUh/OGGvYR7sG1OsV209n/JVGppt/Qzvw?=
 =?iso-8859-1?Q?ZGhT/Co5b404WlBkIKg6rP5mzpY0vKuynWC1HTSO6qgPjoVLqrZBPRQzo2?=
 =?iso-8859-1?Q?OcYe/O5xbyrINbklhf+h0dvmO41slCzYjHTyjZSnfEdiYRsSQsiFKMp/Ip?=
 =?iso-8859-1?Q?XijuiKrSAXaJd56hhGy/ueZDSiLe0eFWWFfSJbb4HCe8CCwiRlNuwbmXvW?=
 =?iso-8859-1?Q?O1rrDSBU5vtsAjQW2vjSg0nTGH5PaZZWQONIUwQHeDXQs/BITwqZ4SyIWE?=
 =?iso-8859-1?Q?HNGEA0134NGoP954jn8ZW5mkw7chipjkCIViqynO3RWudilWAG+MGvl/sU?=
 =?iso-8859-1?Q?ZSglTwuaz+6XIRBKs5Fx2aQTFhp4W2mUNR698cECgoxs9hcoYBf5/0a31w?=
 =?iso-8859-1?Q?2LRo5JZW6PzeSMM8hlu64x/hBEmZB9eI3V8dbuIyqD3vIXVO4ExaizgATR?=
 =?iso-8859-1?Q?e68J5EnwxdC3Q+PhShVetKZc7xBXGb2QRK/6l8eq4zUGNJFOgv23Xnhn3g?=
 =?iso-8859-1?Q?60lX+vfogzeRkiPQnZ6v63htxAfAzNGQtNtVORIh2emS6zyWA6U+oYKLrm?=
 =?iso-8859-1?Q?u7DQmATCUpPtrHVS1kMBVpqICOqEWUTRAoZPJ2VjoO7AdpgCVF9U+/AmBf?=
 =?iso-8859-1?Q?B6yP8ko2N0q4A9WqwBHiS5dOk1cXoDySQjLmI37zlb++dMEtia9FP4Z9hq?=
 =?iso-8859-1?Q?9ssRotx7PlAUyll1c1D357Uf3arGlVCY5rtjr3EOo6yGWkoq3VweBTmUXn?=
 =?iso-8859-1?Q?1cBKiTQVr9xlod6G4CUg5GRlDMtjIr1lGmDx94T9xbHa3VqGUX97/NK317?=
 =?iso-8859-1?Q?25BaAYprAK2DIVTlTBQ4DiUat3Nv6ol+HC8Njy7R76NEpxGJ9SES+wUbWd?=
 =?iso-8859-1?Q?LJD+Kj7O9MXJ/OCLrA5VEKDOpEhBk/226o479Bo5pr+1mp61XvvpHx2aJf?=
 =?iso-8859-1?Q?RLLSb7CpfCX5zl9hQtRFrk2LhMaSvvAVSejjR2QhIpznTHk/mHCrZgp8Tj?=
 =?iso-8859-1?Q?2F7S/9V5wLUDHCCikddd2spxjS0h5U2peoA3ciexia9cPA4UT2pDi5MuJ/?=
 =?iso-8859-1?Q?coGr5b6mYqqyO94oLVzdW6Ucz5QpFEPg2gGwaTTeAHzNnuLI+9CsOzXZy2?=
 =?iso-8859-1?Q?dd90gh5TDSMiOVp9SFXkbSql7GxVUJyMQQYTnmy3xXrRohIZQPoDInmBs1?=
 =?iso-8859-1?Q?hbNIgC18YO6/CXjLhPo66NvPtP4kEQ4=3D?=
X-Exchange-RoutingPolicyChecked: h/pY6PX5bmWUSUbB4u5tw76Mc2ZyVGAaUwQ6EB/onOdLLOK4Gq2NgL6AZz9JX43xoFXqrG9Ye7jhA33mQ+GyM8XcRE/8Aby/7OFsKlKZaetek7aPFWzfwXHIEwkgbxpnrdvXbv6hBy3sFaOGP7G/KT8/NKiiu9unXbBsdK5P6mW6TPFoBJRkxaCVMKzXBkfliixbLVWh7RsVSqhF/TgFuiPEf10MKEFUJIgfpkNLp1OugHK89St2GzBzZLGK8v1ucOCZy3K5yEhvnKJ8F3Z/xb7r0PmBLP1gQi7+R0jUpVdAUwkrQ/w2P9mtCdoe3WFOkZUzckQYrP9NzOIGuik40g==
X-MS-Exchange-CrossTenant-Network-Message-Id: cd45f5fb-bf3c-4cd1-f5e0-08deffc83176
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 21:07:22.4302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPLcwlJexfQr+jIgPY3MtJfMJ7GXKu4VpBDeDxWJsBkgAZ4op3ZzY0xxmjPBUa/ikwyUFkNUTIQ45z+QQtiCQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFC222DF22F
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

On Thu, Aug 20, 2026 at 12:24:45PM +0530, Arvind Yadav wrote:
> Having scratch enabled does not make a VM capable of handling recoverable
> page faults. Allowing scratch VMs through the ASID lookup also admits
> dma-fence mode VMs.
> 
> If such a VM faults on an already valid VMA, the handler reports success
> without fixing the fault, causing the GPU to retry indefinitely.
> 
> Only allow fault-mode VMs through the ASID lookup. Fault-mode VMs using
> scratch remain supported, while faults from 3D VMs are rejected.
> 
> Fixes: ad9843aac91a ("drm/xe/madvise: Implement purgeable buffer object support")
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index b2d7bca9e407..19cc7c59bec4 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -234,7 +234,7 @@ static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
>  
>  	down_read(&xe->usm.lock);
>  	vm = xa_load(&xe->usm.asid_to_vm, asid);
> -	if (vm && (xe_vm_in_fault_mode(vm) || xe_vm_has_scratch(vm)))
> +	if (vm && xe_vm_in_fault_mode(vm))
>  		xe_vm_get(vm);
>  	else
>  		vm = ERR_PTR(-EINVAL);
> -- 
> 2.43.0
> 
