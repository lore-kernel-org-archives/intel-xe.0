Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0AFC87FC5
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 21:49:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CE710E0D5;
	Thu, 24 Jul 2025 21:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZkfxiKoA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2A010E0D5
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 21:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753393756; x=1784929756;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CW367B1/mD4fsEeGrHKVaP5ODfF3qB7aJ+OkkRHUjJk=;
 b=ZkfxiKoAP2Jv+H1wVF7Q74/3RdwG9hP/aujH3KmqMQqsp9WbGduwX5xs
 iCZzwXjn3A3W2KpPuGVcUkXtFG7g7yOVpEVM18UBMSRXOlimeevBNHPtX
 uHcCGV2MHfUmpboRU1rHEINBzljp4JCI1Kag5S3oXbiYsWIvWaBQws/AP
 WxL8P1yRanDyKB62cSpOa36KDy6ThQbcHZvGso7Ji2prETjI+FKoXFd4w
 5ZkE4AzQTgS8RaOUHoGy0AMz0nVmiGQVF6a17P5ISU7F4j83FKesb+OKk
 2D0yJqH/fGHHux4/O3xvHfpHZsizU/Z8PeIgp1Lub7KHM6dT+oDcRYYb3 Q==;
X-CSE-ConnectionGUID: r/rT97QVSeOZdBos/BnqoA==
X-CSE-MsgGUID: C141QR+TSkS8KR6PPrWayw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66799949"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="66799949"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 14:49:15 -0700
X-CSE-ConnectionGUID: tsnJMS87TMapWB/qzhGsZg==
X-CSE-MsgGUID: ugXX7vd/S1eMDMVBm5SptQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="160095890"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 14:49:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 14:49:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 14:49:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.58)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 14:49:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzBUCgWSnC1JTJzEQr38kmaTzV0NOq5g0NpemA6c4yHfGnNY1l6BUta9UHP6ex491Z7085Nsw9plQWeTG73ViPneOnke7cnA9gOQtxh2+nWcWchnlgbcxZMC+z7gltHweGmdI1OG+qj/+HzWvY4367+xGPwDXHmD9ibCCEejUlM7yW2ZvYCvnI5zxemiFx65b14BfS5JDgTotdxJvtRj0XEoFm/iOEUs3NfEo+ZDzp7jVYMLWI7Z9lsp9x1X6cYgyCJvDwrqmAt6dr19RN/611muBpRICM06ARBdsBBPVP0hkQOux5Iwkm2W5XTop5IXHwAqC7Hc+x5iMItcuLqvOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BR229U0+lomBYmuddgvxfCnUnSggL1GizblKbEJLaWU=;
 b=FE3C+FtMPBfLINgE88eF8uR8bkPYLcnhrRm4wptRjKTXkROi3XeqwXVLmZj4K2RT/LnkLz8WgEU+7I0FIKgYHZqBIMYgec+J57nQ725eXNJ4EN8fFxXWUuT0LnlG9BFpVxtO/sJMlYqNFD/5ykWzu4qE0e3fEktcANAwzJobNVFw0RYtL27ZGagzycpJUZIr0yAi8LVQnY52pNdT3GcU9I0ZH8o1WrNRLAeZWMr+wK2aU+hgW2lt08SKQof5VArC+KDZSDcdVGJzbSiXYpAQd2aQgoYUQVguNwO7HimhfXpllSiKa/IUa0BV+aquixf4UH4PZcuZreP9az7iB36WEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6005.namprd11.prod.outlook.com (2603:10b6:510:1e0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 21:48:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 21:48:59 +0000
Date: Thu, 24 Jul 2025 14:50:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 20/23] drm/xe: Reset VMA attributes to default in SVM
 garbage collector
Message-ID: <aIKqt67Ob0sYuDIO@lstrano-desk.jf.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-21-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250722133526.3550547-21-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6005:EE_
X-MS-Office365-Filtering-Correlation-Id: 29ea849a-42bd-45b7-d769-08ddcafbe52c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R5m97r5Rfi9nauQ6B9J9xYA9LbkXBymsDtvKWq64UfyFZcNPx+Nu+dkvprUu?=
 =?us-ascii?Q?h1i+EPzCFrzo3HHpvdfSLzOag7IIYr3o7CZVkUKoWZ9z+MPONohveNMtVPzS?=
 =?us-ascii?Q?9BqieDJh6HxHYZmcccDWQqBcajkxnx1I+bZKwpcG+a7ZeCAs4Gb3D1kTXWHG?=
 =?us-ascii?Q?Fdj1UfC4S8yjSl+5wwzasAr4uGx6IEWa765ST2CxAqFoR/nSfSW3OoBouw3i?=
 =?us-ascii?Q?78TIWdVGMm9dklvYeexPAd+AIZ61EFytCT2LyJZ5YTdgk46ECcqdXcvMmBW+?=
 =?us-ascii?Q?oEjgu9tQPd/OipTwt0d8HyrDSljcjHBj7NLLZxm07lyhv6PBNN4vBJ1xaUFf?=
 =?us-ascii?Q?DaU5ImkTuf7PZNiToxIkph5tuz1G66X3GCOmsGgPWulwAcLZzZs8cAvOey+w?=
 =?us-ascii?Q?DP9Oi6JhMzC02THLhnd/DINbW/l78GdN40gKfDIM8kd0C8vTwOsRmfseVAVn?=
 =?us-ascii?Q?9eEBWyRMnrg4fTAXj2bPQi2sjkXFMiYys8niyUvYlBeN4pT8WZyp4rJfXWOn?=
 =?us-ascii?Q?UGfQDCRLrnhkOiwe1TXx5E1O26CtQxPQj5hEdsPIxljNVpZ0jsbMTeq0zGnO?=
 =?us-ascii?Q?a7ZkR7VgxlAR/e6//ber5uRb8BxC5tkjngOlH3DpXJoGUgQQLuNvj1D8E1tv?=
 =?us-ascii?Q?l+wvYVT+k/ZuaxzgH3mkxbOmXbHbJ0CgKp8iew5U7S55Om1UQhGaZa/aFFGG?=
 =?us-ascii?Q?tB/dANSQ1axHWqdqTjBv+YZG694zehQGqXewOxmQKqE/5iSuRH4u/r08Ny72?=
 =?us-ascii?Q?TRr72f8vEX1d9zSF+ZSsxopMXpYtdvJ8ZGhEK5vDTB/OR7EMe0Nl5Ktzlc73?=
 =?us-ascii?Q?bc+55KN+g6NmzzfeHIrzEXx8NZCkY5QlLu3EOZXKEeisBCrPf4AKDkcnvhAY?=
 =?us-ascii?Q?S5X9ant7v3F6PiypegQxSKYaOQ9nheS61TrI8u0tgUVg8qfsajq2GhduAFy/?=
 =?us-ascii?Q?w2H4Ioy5AyDxVgGUgQXxKC8UGomqwnKlsEWWxLeqakW8kONQ6U9USSSs+aKm?=
 =?us-ascii?Q?syxs+I8JwvzAKJ5itad9KQrmvFDBKpLSuaF6S68Uagg5wHjsZ01aPT9R6adR?=
 =?us-ascii?Q?ikmDSG5NZU56W6QzBvjR8dBLZ0vTsKuJzESgwHGRzd8YKyH08vDr1RysPjTq?=
 =?us-ascii?Q?mopmteMeVInsAj4+Zajkjq++e32ccJp4cJy64CVjW6eKFjWadNoLDJY9MUxd?=
 =?us-ascii?Q?HMEfeY0qtSMQ/V8l+WnYv1UazVzxAXwrR/uMeNvP3D++CEvDI+8j0I2iJlYu?=
 =?us-ascii?Q?fDn1xJTrgiZI9PoPGJsnHzT1EtSeJJ17cxQzIANLkbOPTKEB2u7vM6Wm62+Y?=
 =?us-ascii?Q?hSX+A5UD0IUFg4lhk/X5T07bYeRtW8htnTgV2znGHWNiAmpYIqlzVR7J4tHA?=
 =?us-ascii?Q?KhUkZn1ys2IJKEL0k1abni0BL07hu7bljhT10j1p8cWA39HQU9vHoBw/Bgkj?=
 =?us-ascii?Q?lVq60FKV1tc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SYr7nSY35j7/A7VXJdip1q4Y3Eru7OkimmiYhAyTAEuD2V7sej01ZQ/y+5qX?=
 =?us-ascii?Q?sZ9gyfpLIFOEdF3Wi4qYQf22ekmZ0AGcQXPpF530q8SZwcN+upNsNByZiAEV?=
 =?us-ascii?Q?eHrTBlo5A8GZAU5SkS8Ajy2oJvIjD+RsSrx7dH9/i2brHLSrlSbX1vp+ENKt?=
 =?us-ascii?Q?KGEqWxDmmUT/rYxltlOLw5cnIufvO+CrUWpQzJ8F4tXIxM1scsQYsjvjuCN9?=
 =?us-ascii?Q?tGG53TEL/q87H0P/wanULZGvZTID2qzSneD+Usf6OzNApzTJN+KUgcqSLCS1?=
 =?us-ascii?Q?qm1ssT4KW8myiUQQY2R61c3XFbTFt5/0c25T+i5dSj3me88ENcjZuvEE+vDz?=
 =?us-ascii?Q?dCm2rBa00IioxaAIAbaCTOJKqoSlSMpsSqA7Mt67fznJq1jFqVtCflh1vyNa?=
 =?us-ascii?Q?3i4esxHoEnQojgQjviTALUAD3rHCoSfkQMEEq/X57luz1sEx2P7jfnasV6YT?=
 =?us-ascii?Q?Hho9a8UnaX5YdyVxEpt9skPAmIXWRwzePcSz3G+z8IXRqbUedBghSDbJlx3o?=
 =?us-ascii?Q?0n21mZa8ahhV3Sk9A/55Z5qvvZY4C0I5YXUGEZrxJOTcJStmvN+FLDTcZluR?=
 =?us-ascii?Q?mJIbtCIkJPralH18oiXt7vGf3/CshmHu07XZrA+VZzHBywXQHir29zfE0wDP?=
 =?us-ascii?Q?HSn2Wj4vFZoZkszfjlxh6bFP5gxKTiQhYsigeTHDqMBw13CE15XxWFRXhfEI?=
 =?us-ascii?Q?Oyzykg/7D9VmP+xhLijPSzE3goxaHWJHejyhQ/aqEM/2qSnBbepRbQmucREV?=
 =?us-ascii?Q?5MAt4CgB7EnaZLgqfmXeBeJl03NCNy3T8/wjXJYzi6wWvLQIISZGOtpsQlMX?=
 =?us-ascii?Q?8LV9VAPU5Hyx9wzD6wEnCv/KEo6xvxznmj0YcArG4CCD+1JRKEFLdrKwBp6W?=
 =?us-ascii?Q?93yJ6GtYXM5enEbwnIk3XAZiB6nHa2NEWwEeq8+pZreIqFN6TZzEWDbL3+DP?=
 =?us-ascii?Q?+87swdV+5ARqeyOUI5PZLozPLWbiawPJa1dZQcWYYQv2VLbNLedZFYgFHXd9?=
 =?us-ascii?Q?C5uSA9PfSbhVqNPRSRb1VvuGcazKQL8ogptq2wKyvDIVnz9bTh7MXSvC2Vuc?=
 =?us-ascii?Q?LsOQLwaWs/zYZDS/0hdYXOL7fUAtzVaavJ+6lVhaNfKgrACfleE5EBeoSzIP?=
 =?us-ascii?Q?u5vknFH7nFT1R8x/lPv6tXFS19eH8t6flZa4ktTRCXUbiNyd5MEZYgkAQvY/?=
 =?us-ascii?Q?CIXKibUQlP1zPXy7to3Yg4IO/jMwCLXgjEgkwqTE5CtlpZPYf5YtquDWdCqg?=
 =?us-ascii?Q?9ILZelBZNTtRuPdZxGp5fAkXiLdwySYPSx7+jitZ1jcHtl5EqEXsdmx11CCx?=
 =?us-ascii?Q?mf0OKnhu8CwxNkWcJryYkWJSg/DaqcKc3ajPDESna8Pkb2czzIDg7W/7ttL3?=
 =?us-ascii?Q?Tnu1gclrz1zdRi/EmpqTsKqfVZ7et6aFlYL9onOvZTy0SQJ3iGhgb/FF+Ywn?=
 =?us-ascii?Q?uNf1v6qJNp77fy1LNNzSgjSxkVCCpsY3Q3vVVc9ho5AFhcczrhp1wWpWKEGa?=
 =?us-ascii?Q?/g8CUlOpWMug06l8RWcXlkcItEIVECoJmNVssOnrhLd1p12AxaylPOW2Ti5Z?=
 =?us-ascii?Q?woDUNaAuWxcB1CZKo/j+MABYE224bV0bN7SAIqlSJPWdyCjmDTKYWLbb7NgE?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ea849a-42bd-45b7-d769-08ddcafbe52c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 21:48:59.0559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p91umB9KXP0esNb3L5PsrKTNO8Wtadyx/QPgg7zV7qkSmlpDqC0co+D0mLuumupDHSS6wjg/ne4iKWZDX+cCZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6005
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

On Tue, Jul 22, 2025 at 07:05:23PM +0530, Himal Prasad Ghimiray wrote:
> Restore default memory attributes for VMAs during garbage collection
> if they were modified by madvise. Reuse existing VMA if fully overlapping;
> otherwise, allocate a new mirror VMA.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c |  34 +++++++++
>  drivers/gpu/drm/xe/xe_vm.c  | 140 +++++++++++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_vm.h  |   2 +
>  3 files changed, 135 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index ba1233d0d5a2..79709dc066b9 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -255,7 +255,18 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
>  static int xe_svm_garbage_collector(struct xe_vm *vm)
>  {
>  	struct xe_svm_range *range;
> +	struct xe_vma *vma;
> +	u64 range_start;
> +	u64 range_size;
> +	u64 range_end;
>  	int err;
> +	struct xe_vma_mem_attr default_attr = {
> +		.preferred_loc = {
> +			.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
> +			.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
> +		},
> +		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
> +	};
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
> @@ -270,6 +281,12 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>  		if (!range)
>  			break;
>  
> +		range_start = xe_svm_range_start(range);
> +		range_size = xe_svm_range_size(range);
> +		range_end = xe_svm_range_end(range);
> +
> +		vma = xe_vm_find_vma_by_addr(vm, xe_svm_range_start(range));
> +

I'd find the VMA outside of the svm.garbage_collector.lock.

>  		list_del(&range->garbage_collector_link);
>  		spin_unlock(&vm->svm.garbage_collector.lock);
>  
> @@ -282,7 +299,24 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>  			return err;
>  		}
>  
> +		if (!xe_vma_has_default_mem_attrs(vma)) {

It seems possible the VMA could be NULL in error cases. I'd check for
NULL and error out.

Also could this code be moved to a helper? Internal SVM seems ok, in
that case xe_vm_find_vma_by_addr could also be in the helper.

> +			vm_dbg(&vm->xe->drm, "Existing VMA start=0x%016llx, vma_end=0x%016llx",
> +			       xe_vma_start(vma), xe_vma_end(vma));
> +
> +			if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
> +				default_attr.pat_index = vma->attr.default_pat_index;
> +				default_attr.default_pat_index  = vma->attr.default_pat_index;
> +				vma->attr = default_attr;
> +			} else {
> +				vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
> +				       range_start, range_end);
> +				err = xe_vm_alloc_cpu_addr_mirror_vma(vm, range_start, range_size);
> +				if (err)

On error, I'd print a message and kill the VM as it shouldn't be
possible to fail aside from a memory allocation failure and we can't
code with errors given this can be inside a worker.

I'll circle back to the rest of the patch a bit later.

Matt

> +					return err;
> +			}
> +		}
>  		spin_lock(&vm->svm.garbage_collector.lock);
> +
>  	}
>  	spin_unlock(&vm->svm.garbage_collector.lock);
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d3f08bf9a3ee..003c8209f8bd 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4254,34 +4254,24 @@ bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool
>  	}
>  }
>  
> -/**
> - * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
> - * @vm: Pointer to the xe_vm structure
> - * @start: Starting input address
> - * @range: Size of the input range
> - *
> - * This function splits existing vma to create new vma for user provided input range
> - *
> - *  Return: 0 if success
> - */
> -int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> +static int xe_vm_alloc_vma(struct xe_vm *vm,
> +			   u64 start, u64 range,
> +			   enum drm_gpuvm_sm_map_ops_flags flags)
>  {
>  	struct xe_vma_ops vops;
>  	struct drm_gpuva_ops *ops = NULL;
>  	struct drm_gpuva_op *__op;
>  	bool is_cpu_addr_mirror = false;
>  	bool remap_op = false;
> +	bool is_madvise = flags == DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE;
>  	struct xe_vma_mem_attr tmp_attr;
> +	u16 default_pat;
>  	int err;
>  
> -	vm_dbg(&vm->xe->drm, "MADVISE IN: addr=0x%016llx, size=0x%016llx", start, range);
> -
>  	lockdep_assert_held_write(&vm->lock);
>  
> -	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
>  	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, start, range,
> -					  DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE,
> -					  NULL, start);
> +					  flags, NULL, start);
>  	if (IS_ERR(ops))
>  		return PTR_ERR(ops);
>  
> @@ -4292,33 +4282,56 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  
>  	drm_gpuva_for_each_op(__op, ops) {
>  		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +		struct xe_vma *vma = NULL;
>  
> -		if (__op->op == DRM_GPUVA_OP_REMAP) {
> -			xe_assert(vm->xe, !remap_op);
> -			remap_op = true;
> +		if (!is_madvise) {
> +			if (__op->op == DRM_GPUVA_OP_UNMAP) {
> +				vma = gpuva_to_vma(op->base.unmap.va);
> +				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
> +				default_pat = vma->attr.default_pat_index;
> +			}
>  
> -			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
> -				is_cpu_addr_mirror = true;
> -			else
> -				is_cpu_addr_mirror = false;
> -		}
> +			if (__op->op == DRM_GPUVA_OP_REMAP) {
> +				vma = gpuva_to_vma(op->base.remap.unmap->va);
> +				default_pat = vma->attr.default_pat_index;
> +			}
>  
> -		if (__op->op == DRM_GPUVA_OP_MAP) {
> -			xe_assert(vm->xe, remap_op);
> -			remap_op = false;
> +			if (__op->op == DRM_GPUVA_OP_MAP) {
> +				op->map.is_cpu_addr_mirror = true;
> +				op->map.pat_index = default_pat;
> +			}
> +		} else {
> +			if (__op->op == DRM_GPUVA_OP_REMAP) {
> +				vma = gpuva_to_vma(op->base.remap.unmap->va);
> +				xe_assert(vm->xe, !remap_op);
> +				remap_op = true;
>  
> -			/* In case of madvise ops DRM_GPUVA_OP_MAP is always after
> -			 * DRM_GPUVA_OP_REMAP, so ensure we assign op->map.is_cpu_addr_mirror true
> -			 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
> -			 */
> -			op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
> -		}
> +				if (xe_vma_is_cpu_addr_mirror(vma))
> +					is_cpu_addr_mirror = true;
> +				else
> +					is_cpu_addr_mirror = false;
> +			}
>  
> +			if (__op->op == DRM_GPUVA_OP_MAP) {
> +				xe_assert(vm->xe, remap_op);
> +				remap_op = false;
> +				/*
> +				 * In case of madvise ops DRM_GPUVA_OP_MAP is
> +				 * always after DRM_GPUVA_OP_REMAP, so ensure
> +				 * we assign op->map.is_cpu_addr_mirror true
> +				 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
> +				 */
> +				op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
> +			}
> +		}
>  		print_op(vm->xe, __op);
>  	}
>  
>  	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
> -	vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
> +
> +	if (is_madvise)
> +		vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
> +
>  	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
>  	if (err)
>  		goto unwind_ops;
> @@ -4330,15 +4343,20 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  		struct xe_vma *vma;
>  
>  		if (__op->op == DRM_GPUVA_OP_UNMAP) {
> -			/* There should be no unmap */
> -			XE_WARN_ON("UNEXPECTED UNMAP");
> -			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
> +			vma = gpuva_to_vma(op->base.unmap.va);
> +			/* There should be no unmap for madvise */
> +			if (is_madvise)
> +				XE_WARN_ON("UNEXPECTED UNMAP");
> +
> +			xe_vma_destroy(vma, NULL);
>  		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
>  			vma = gpuva_to_vma(op->base.remap.unmap->va);
> -			/* Store attributes for REMAP UNMAPPED VMA, so they can be assigned
> -			 * to newly MAP created vma.
> +			/* In case of madvise ops Store attributes for REMAP UNMAPPED
> +			 * VMA, so they can be assigned to newly MAP created vma.
>  			 */
> -			tmp_attr = vma->attr;
> +			if (is_madvise)
> +				tmp_attr = vma->attr;
> +
>  			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
>  		} else if (__op->op == DRM_GPUVA_OP_MAP) {
>  			vma = op->map.vma;
> @@ -4346,7 +4364,8 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  			 * Therefore temp_attr will always have sane values, making it safe to
>  			 * copy them to new vma.
>  			 */
> -			vma->attr = tmp_attr;
> +			if (is_madvise)
> +				vma->attr = tmp_attr;
>  		}
>  	}
>  
> @@ -4360,3 +4379,42 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  	drm_gpuva_ops_free(&vm->gpuvm, ops);
>  	return err;
>  }
> +
> +/**
> + * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
> + * @vm: Pointer to the xe_vm structure
> + * @start: Starting input address
> + * @range: Size of the input range
> + *
> + * This function splits existing vma to create new vma for user provided input range
> + *
> + * Return: 0 if success
> + */
> +int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> +{
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
> +
> +	return xe_vm_alloc_vma(vm, start, range, DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE);
> +}
> +
> +/**
> + * xe_vm_alloc_cpu_addr_mirror_vma - Allocate CPU addr mirror vma
> + * @vm: Pointer to the xe_vm structure
> + * @start: Starting input address
> + * @range: Size of the input range
> + *
> + * This function splits/merges existing vma to create new vma for user provided input range
> + *
> + * Return: 0 if success
> + */
> +int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> +{
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	vm_dbg(&vm->xe->drm, "CPU_ADDR_MIRROR_VMA_OPS_CREATE: addr=0x%016llx, size=0x%016llx",
> +	       start, range);
> +
> +	return xe_vm_alloc_vma(vm, start, range, DRM_GPUVM_SM_MAP_NOT_MADVISE);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index a4db843de540..f7b9ad83685a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -177,6 +177,8 @@ bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool
>  
>  int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>  
> +int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
> +
>  /**
>   * to_userptr_vma() - Return a pointer to an embedding userptr vma
>   * @vma: Pointer to the embedded struct xe_vma
> -- 
> 2.34.1
> 
