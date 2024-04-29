Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B02C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 19:34:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D47010E9D7;
	Mon, 29 Apr 2024 19:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVKQpwN6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B2310E9D7
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 19:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714419255; x=1745955255;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AdPDT7NBgRXysDhFFSU5hYP3hFrEuFLxkbCen06vCFQ=;
 b=AVKQpwN6yxqt96lhMd4TlbAYjolwEdIAy6fBYPwmtxB4L810OyCQFLJr
 WSsA/S0sPxidCjC9TxCPfnieTd+mvEPyHKAFsGX73pXqUpOl2s0I55lvf
 MF+qcyAtFs6ws1m97vLek92fAjNRgCu64KVUHlf5rGfRHwkbwmL9iUYO9
 5bzTKpvnG95TJNSF5s0amwLdBCTXMVSUOqiLkDdydQGLZ0Yv04ixTHUfI
 fyuzEM8qi+4ts6Ds7GveKZZwsCrwgCyoV1ayymRuYgVGvN1tyyc9hv7lk
 hRKmtLDtPjtlXYQj1WumBdeL6fbqvcfeQYCZww7orN2JSuA40p1bnRudn w==;
X-CSE-ConnectionGUID: +KFXFkuzQ1eu39x1/qMXmQ==
X-CSE-MsgGUID: JqFKXsniQ5OpfRJ0b6+5ug==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="21516084"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="21516084"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 12:34:00 -0700
X-CSE-ConnectionGUID: aBtZkSPtTfeFH1yRq9dYHg==
X-CSE-MsgGUID: Si+o8qB6QkCJbW5T3IjBaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="26156604"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 12:34:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 12:33:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 12:33:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 12:33:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 12:33:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZc044dz9TS4ehJTfN44eFpqZieNVHc9dZYA+c971uzsTg65yvtNMqaAVRyFSkLy6/VHOAOJyCLh3CwEa1RGPHi2M63Vh08/yfCHOxmaDDZhDbwRKw7kbFeuTwNXuh1Bd+Tu5JUhY+fZHS/SL3rEDgVzgIw83F0BojVeBmnh3IN9oHWby8emdKhMHI6FhY050jrbcK2VIwQxi4BfWXgF82fxVHB9m1mW7f8++PrQuvbMturBMMdnyI6c8q9LIKqb08Q8yNK57C4/eODbQFnAZrahM6DBp9tQn7sRXHCEaU6m8gvRq5+2vg4XQNeBLKmOUrK9fCSGQ3xQXHljaPy2oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSA78Sq8X8X3ndMkjDPeW0xN1g3US1CVqyBqKKLq3Wg=;
 b=HZbXiLcFP4F/1xhlkwJu9FyQQ7nXkJypGn8AXkt8M5UqErzH+A+z/dDv8M2qJGYz29d1l/p5xtIJqFdULV4tssrI5s5S9zYZX2C75W/NSbJko7wiKXw9bMQUN1NN8m71A9S3RHPt+1Y9JrqV189NUijX+ZseJTpZ1x6z78NnIkDTVcH9BVhM53X/OlX4DYIq9ApGS2nloN2NnkrMG8Kp1Ikwv+3YfdBWWW8wCrdTEzbyXoj33tsD972JIsljHEKhQvBUNvo3TSSUD+iHqnWLdHDwzINey9QCz2EnGOLjvCaisOKRhZ7nPH/cUXVImptYBFD6Cbf0kPoVwQQCGnlAxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7815.namprd11.prod.outlook.com (2603:10b6:208:404::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Mon, 29 Apr
 2024 19:33:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 19:33:56 +0000
Date: Mon, 29 Apr 2024 19:33:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Remove uninitialized end var from
 xe_gt_tlb_invalidation_range()
Message-ID: <Zi/2God6Cc0BzNwH@DUT025-TGLU.fm.intel.com>
References: <20240429152821.27490-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240429152821.27490-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a03:505::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 18d1642d-a66a-44ea-bc5c-08dc68834f47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EQhVvv9/hLFyZtV0cdXa1fQ5X8MCRrUEoHDVfzbIVYhsmrwKGxoUZImTGd6r?=
 =?us-ascii?Q?4PoCODBeu4Osk9kwnoRfMbaiBLIvGW3vm4BuCHahIDWzPW7y0aSe8CKlkfTv?=
 =?us-ascii?Q?juYWFWmgvZo+fIddiLi6S1qc6H3Zi0NdY285humliH8l9GgX8VCHRyCyT7ab?=
 =?us-ascii?Q?A/Fy6SKDglxJONKznwPn3UCK1vEif9so2B1QfVyvkAskZC3fhjUZhX4mnegK?=
 =?us-ascii?Q?611I6jnpHHHoneHCydFE/v5ubRTWpy4JDoIkQUOpQ5Ga2v7VzECwDAHKP/WW?=
 =?us-ascii?Q?xnUIzatKEu6/M4Mf0135L8hH8pyWq2LKnTb9TajkyRRJuXT2P6ID05jdeYDz?=
 =?us-ascii?Q?VKHUtPfa30tFb5oG97ZxpvUihMdiJZ0OTddSAG7nc1XiMVBaMqrNmQbeUSAf?=
 =?us-ascii?Q?3tK4vP2OOmrrTIXanw19TMao2ahgKlfZ3N9ftxncQB1FQ/aswvww0aoaDorj?=
 =?us-ascii?Q?Pi0/jHLIhI7gpy3kuXGN4M51WOO2BwvsFTvJA3a5Hdu0fy/atSPwC3KUb82D?=
 =?us-ascii?Q?c+7ln91FW8DOzJl2ngL8Dsi+W35auT7GP489meFwua/uvjGV5a/KVHWZGXPV?=
 =?us-ascii?Q?PiPcPeTOIsPiJXbkxpbWUrDNFqOzM9JVtWOwQFbRttA1tvc6e/l4Qc5I8X1y?=
 =?us-ascii?Q?zxdHyye2XHbcyX/OwDr1pS5R7+Sm2t5k9U8P7NOHq+CnRkrqMCOXW6uxmMFm?=
 =?us-ascii?Q?zNAHVbqilA8Av3V+ewsT17apaKqMr4xpAiujv0ENl3FegFio2awxS0+myquW?=
 =?us-ascii?Q?ePBAs54dOM6DfLclckZM778kQxb3m84AkmxAlpNk0KnYaMf8l0fNdXUtqGGr?=
 =?us-ascii?Q?k000yVIbTnAmRH/YU5u9BQa6uXs/7WQN+tEAFv3UH2sGbKb21LLPHPZeHlTE?=
 =?us-ascii?Q?wSbtCaz0aK8xMaMd0rLVNwN7ahtK2mdkcPOdG9zB0GRAyeHPiAsqaREtRBmp?=
 =?us-ascii?Q?ce0EAB5GypU4Js/CvqL0mj39PqbUQigOoYtrzDdIwen75GoW2OjQcig0jFVl?=
 =?us-ascii?Q?4/YsiHWA1olv36xsyWclbel8k1aCOSefRevd0kMM2Sn1uyTPB8wCrMALIkbF?=
 =?us-ascii?Q?0Y71pCiW/UzDOa0fsm0v4DmD7D09laGy7aRkxapGyhwiP6c1dcIz1AZvRBHu?=
 =?us-ascii?Q?M9BgpYMjZpoTMRztmHkWirY0wM2WQrNav6TSc+aQts/6nNSXE2pZUbt9glpZ?=
 =?us-ascii?Q?9E4pzDPWp5hlJsHpOuH3wkf21178nCtdUF5hOFiNmP+3i6uj2Gdv7zeZgRWx?=
 =?us-ascii?Q?7H83K3LLLcj7T+oZYcFx9IVVHqJ0kgJ40zjBEUslJg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pUooNdADCiAsSP1SnWvi0rqpV9Gx9KN//DgcHz6TL9I5ieykLQsXiMCRcM3q?=
 =?us-ascii?Q?BPQtGIFM6l98Ii0QzVjxR5ETCV/m6H+jjo5v41GbJ2e7/COjY+qkwNkFJmYF?=
 =?us-ascii?Q?3+q9D21EAR+vPSavuYnkDTYEHyah8924sIdoyDB5TYQHHGRwsO538lKGY84d?=
 =?us-ascii?Q?OCyiFkU5K7wmbek2NPnHTLcywwAQBekkel8GXkmIN7NhbwCsD7v6Ot4nblse?=
 =?us-ascii?Q?WXQpeSDrEJ6BBzMhlXuc+jzagCzkM4G9cwmGBxEeSwMkpU4FTnQlR2E9P7XM?=
 =?us-ascii?Q?iXkQn8Oaq5D0uAmGr41GhzRwkAxAVeURPSErGNNjPTg0KEN9RsoXOuaW/bbB?=
 =?us-ascii?Q?llegLQ8+w7SH2J1W8SPIjJgTuiXh0ZVteyrei/DY2GYSjE0GxtPMrNb00qE7?=
 =?us-ascii?Q?ie2r6GTNDqLJiq298w7/CnqZVnqSTZleoTWpYX6YiF8jmd7SXH9xzEpCpYII?=
 =?us-ascii?Q?ruf6JxskEKRAl8ig7Mznh8ksCnVafkUSqhJPulcha7m0J3aBAa/2CualcTSL?=
 =?us-ascii?Q?5Krb4mbeVhzcR2ca460FYf6usTapGcgnXL0rbhOTy6wrcxmgsExfL89H6pa/?=
 =?us-ascii?Q?tIRFkhuwayovVC333if6IwD8gdabOcl6pOX8va5Lj7vGSabBD5XxqTaMQn0l?=
 =?us-ascii?Q?UsAu3NOpaGbVmYYgPA6T+GdurcaJ/8VRV9E3s8rS52i+PfFeWA9Pj27V+b8U?=
 =?us-ascii?Q?czQMRhm1lIgG498AWp/c7gEoCLpPsCjArD7iFT0jTqow4v9yetEMXkN+YK0R?=
 =?us-ascii?Q?Uy865Mkwj2B7dBjUJyofQDa6fpNQIYrJW0B9Q+f3em0KHY/8m07hEpJCjgke?=
 =?us-ascii?Q?M/pkxCe8rTsHcMCOhkb9n/4dsXHKu3kW93ixrR7HbJznlO7reTGpV/++nTt0?=
 =?us-ascii?Q?o23AMVj2fxxhlWKXhTfSdVXtUKpUEpX8470SCwBtSuVqm6EAUviA/EYC3TGd?=
 =?us-ascii?Q?MFbuNG94/oqZysjfKD0Q9W2Z3waXfUb/Z1OycYxbfkj5SGZeYSykxJ800oxh?=
 =?us-ascii?Q?DSmEO5T77Lyw1+2UkG6pDWF55hHUZEezRE7+RE3N+AeAZ6ewmRZX2HUOBk9G?=
 =?us-ascii?Q?ElT8KwfvwvmUSBAVJwnbmM+/dnr/8yMu1/X90GoanFTG0QifUoVFaj3PxNhK?=
 =?us-ascii?Q?mZQ13NLQAL4aO96PWVHB5Qrdo6yo2VdHSSGXAOxO2ksIw+b8qydoqduITgra?=
 =?us-ascii?Q?QxtL+MGz2nRJmHjMX8b+5WVm29+Cmbust0bcn4bswa+GQh6PGnuPdfFcCmtv?=
 =?us-ascii?Q?MjFZ3v9K9FG9wTP9FM5PlcLeePdSWTK8K9okrafsS1M/8KNXkI+7t3jlCLZm?=
 =?us-ascii?Q?2kMjGKqU1mT+lwMn6C6qlpa9W0G/Bl7sLK/pm9Boni4yNg5u1/ih5J77VKVw?=
 =?us-ascii?Q?gLLcrZpsPBY+tJSA80EmB7dytyKY5/7XsBSmS+W4Gt3V8S2FZx882awqfO3J?=
 =?us-ascii?Q?wx2r+SHXDphG465YNA60mvbKHvEuygTKpiEk4U1AZjsCAZr8KR+9JBLXYIl3?=
 =?us-ascii?Q?EW+WuR6vTj7rwSLm6+9kCwZdetzQpknZecwJcW25bCiF8F7IQPE7BONeK4Xf?=
 =?us-ascii?Q?tPOKv535Rmlhxw+1lgFUJqs/vSixzdnUBf4SWREGN2Xfg0nv+sTXuTAPY03n?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d1642d-a66a-44ea-bc5c-08dc68834f47
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 19:33:56.1198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +QOSqEW27knPkZmrWlYWH3O2GM/UpwNU1mGxYw7YUOviQdU/BkVY+jCjxzvdc2tVrn9PG03wNyCauuiR+cxi3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7815
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

On Mon, Apr 29, 2024 at 05:28:21PM +0200, Nirmoy Das wrote:
> This fixes commit c4f18703629d ("drm/xe: Add
> xe_gt_tlb_invalidation_range and convert PT layer to use this")
> which added the end variable as part of the function param.
> 

Good catch, thanks. I think this needs a proper fixes tag:

Fixes: c4f18703629d ("drm/xe: Add xe_gt_tlb_invalidation_range and convert PT layer to use this")

With the new tag:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index d0ee1e0df0bd..c3d015a7ac33 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -305,7 +305,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
>  	} else {
>  		u64 orig_start = start;
>  		u64 length = end - start;
> -		u64 align, end;
> +		u64 align;
>  
>  		if (length < SZ_4K)
>  			length = SZ_4K;
> -- 
> 2.42.0
> 
