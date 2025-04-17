Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7527BC369B2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 04:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE8510E05D;
	Thu, 17 Apr 2025 04:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W56QpHJT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDE210E05D
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 04:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744863498; x=1776399498;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jxz5RJ9H+cepUlV4QozSu0dQEEl735fz7Cm895/xbzQ=;
 b=W56QpHJTkaYtCIjOqX91Nd1JCDC2Reb/zaoUx4KQsB3G7yNke0bP8MZL
 GHVz4ipDnT1GHmi8YXKUVW8FmG20840YH8zT1hVuWaugIqThQD8lX53+c
 znLzB+j6d2Hus3wjga9OmcPsL3c1u9kPGdHp/UwBBNy3e6FNqfKKz+K32
 aetdSoKLDTAJPZA57pQxYYH+dxMkufsghB5Y1AXAUKTaNAFSjq50DBOE0
 2Q2mUp/UtPsh6PzISTzAPoGb779qwnQtkYJw+gKzAtQgTk3hQojq6VGQC
 K/xiNrPdSwFDyNclcxBIESHSGgSjXIecJUoDbhhd1OS44r06n+auf4kGk A==;
X-CSE-ConnectionGUID: XDyxKS9CTeWiRDdk8J99DQ==
X-CSE-MsgGUID: gL/OgtNhQQugO2RCZxl2nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="63971699"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="63971699"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 21:18:16 -0700
X-CSE-ConnectionGUID: VCaC3/oYQqWXCz4OHSlHGQ==
X-CSE-MsgGUID: I2tjrS76RmKD0FGmk84oBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="135772070"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 21:18:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 21:18:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 21:18:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 21:18:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcnRepuRLFOQTWGrPTrVcrhWhMXL/w0wIBGA01BdJWbv9Re2zlPz85liudS6qnQVLdRoWWY6mIs4hnwWRmfc7AGDEiviVWoXiw114FGkRcLb3vw8/Uj3tndFZ4tMKBnFPoSM9/U/NTMMo9X1V1qd+GmpypuyBRjnZXxThxZrT+7TtAqsce41TIlDKf3MmliGI73QbeKMtnEHJC5bItSpCkefX1uhxh6nx/+AdEy/+HtjxT/KNl2IbmIC/YypyzcB71/nWh5G8thudDwNtrZJ9eQM/C0zbsavLMB11MSQ62qnXzJNxq2Q/nsSWGFU6z1Cw3ft9KqfJUGUwkaTgYcLWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/STMSnl7B6iJWkyjOas9jpZfRvcLnSjLTg69zf1HDE=;
 b=Axw+w3y8fvPBoM4FFyuUA+eCEBF+ky5eBJiqnRT9S8bc4G5MrIycKakK6+nnceWNKrpMIUIv86m6eqH540RLFmAyBfb5Ckmy6QSglMdaF5YeshMvQBHnQ0UjlN2A5a029scS3jdM/G/qVnWhJ1qANXPduo3Ggw3zCjuCtv2dmt4CxaJHqkZ4AbsFEzqAUSA9jLvjFwHoYz7IQ3qfWNv4tbfGRqV6Wk8WuekgKdFcH3B2xrdpw+FicO7DM3xci3BVfoLQ+50sOcH4RjBf4faz5nt6PVnWj9pKFhBMBxMsDwVlA+N0dtRlrxfCTBKEbIZWwvW6+iQO4LLaQFaRo+2xUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8395.namprd11.prod.outlook.com (2603:10b6:806:38c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 04:17:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Thu, 17 Apr 2025
 04:17:58 +0000
Date: Wed, 16 Apr 2025 21:19:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 13/32] drm/xe/svm: Incase of atomic access ensure
 get_pages happens from vram
Message-ID: <aACBRZD2Up9VNZJm@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-14-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-14-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:303:b9::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8395:EE_
X-MS-Office365-Filtering-Correlation-Id: 699623de-3774-45f4-e74f-08dd7d66d5d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FaESr1BMlCTrVzRSQihlHH4c0ykcQOowwR3KggsuJsfh4YOCw3L67Hb8/p7y?=
 =?us-ascii?Q?W14zBY9H5hBNFvevRgChfbdAAkzg513eLr0728XprKwWDUSGSrafXLBlbL53?=
 =?us-ascii?Q?/4hw4QFiSzqzT8IMfAGtazj3B9d95ZUtErjPxQMuzhqLRHmZ3WtUmL6aw6K7?=
 =?us-ascii?Q?XA6nqmI0CekLjcUAQIDkfZgGHQdFOxbGdHRHys0hCQckzuQ/h2Z5eFnTvqGQ?=
 =?us-ascii?Q?AdYGwlQfS270h/RN9S51ZGI2mr+8BuT2FkoKuZSKFq3LCrJfaUmEl93XLzCV?=
 =?us-ascii?Q?LP6xtcb/yboQxBW5ktXyc2TCrbbFZNr2q36RQpHnH56bl0ENHN6lSbRffDwC?=
 =?us-ascii?Q?X34zTzmk5pviZUuSYesHhYwg3ul2d12ZclqRRE/FkQ66wUCwwNKJB5cAFa15?=
 =?us-ascii?Q?ZnjnuuzN/8v5cjJM1wQLo8sR40aZwQi9YpvSiEpctBCCfsVu3Z++hmSzPx4f?=
 =?us-ascii?Q?RS5Y8fvuZEX+hANeZPLbxOEk2N0ulRxIJHdY7fPQYwdjXQ9frKt6LVfGRQas?=
 =?us-ascii?Q?Wio82rFl1iwNSo4s/LrEFsiKFUcn9yow64srlpkBrUh+/rKaFxb+TL2gmbBD?=
 =?us-ascii?Q?K113aRa9CYvZOJmCYiz0mH76P63YprahFnnQe38WOWbzV51r7euxdBbVl4gt?=
 =?us-ascii?Q?qC3O+c/0Zy+cVYX/8plwAPIdUV1la2JYdvpbvSL16+9WGytW0vegOfUQXbYv?=
 =?us-ascii?Q?n7m8b+n8BJ7jqRpTDKu2ikOMBWx6EbTmtxqK9w9OllJabcwuabUcp2FiR4U/?=
 =?us-ascii?Q?aSCf0XD6JZmnCpXmDMXucALrbEZVsu60ihv7jPeFTURjhn6Dj2P3rmNnFtKb?=
 =?us-ascii?Q?JfI5cw+oN8x7rQySqXZmrGoxWODwT437dqTvwGoDbP7TlOOcpWLODn5Qvx6+?=
 =?us-ascii?Q?XDGtdgi/KJmbBbblPWVyOOxEP0fAsAO71Kl1C43EaHQ0HgkHxDSt7pAYRBQx?=
 =?us-ascii?Q?paf3EWmyNZEA6e8KOJtJp+g5dwOMh0i7zoUDOx5jwj6aD6VzsUwlT1yOr62v?=
 =?us-ascii?Q?jU2Ypp1USsjB076pAp/QG69xXJuWxo5a7stIl5MapdIZo5ryFN85hPOk7SQH?=
 =?us-ascii?Q?i5Dx017f2B7+h+issIn1DAunj1l5obTho1XmQl3nmwvkUI0WL8c54QXlLAf/?=
 =?us-ascii?Q?MBC5pLd+RV6OLnT6v/GseABxitNzSbNC3Y8kylN+UtmoG+KrWzVrW/UuKowi?=
 =?us-ascii?Q?8AGQbh9qNSngdJ2sgyz5ON04VKUTO4x6oHU62xSKc3z3HENqknPNjRzh1fCw?=
 =?us-ascii?Q?kIBKVCBUgSaX7TlVCMcyZv7M4BcJvplikoWOS64/TqdV9rXfwGF0nucbLPEN?=
 =?us-ascii?Q?pHpr+muTxKwlAHAvqifvGzZj/zL96Xeii+PoEzDIYt7eM7WStyqms5digVwL?=
 =?us-ascii?Q?HL4L+8k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZIkR0QqL6cmMcSzhNx5GCQp9I02EG1CuUL6VBx28be4UCjB1dj5J6hFvHRMN?=
 =?us-ascii?Q?ADfWONIHB3ta9u+q+v1XrSTwIZrECCAhGjw2WCMPlcj1tPw+7I0nofZIIi5J?=
 =?us-ascii?Q?HmMSfasFjkWSRX60Wljh3VaJa2hw+jcVx5cZ80CUsJJYsa5sI0fjthx5tWEf?=
 =?us-ascii?Q?ViwDMRx/ZpwL/ew/if5FlA6Q9zKE5qiEwXwtqY1Ocne+jDyF8OAt1qDsiWlJ?=
 =?us-ascii?Q?iVMqPzhSXO9+WqP4PlgsA51+sc4d9asaTeCA8CIdKhPm0kb+1pYPFd04NF4/?=
 =?us-ascii?Q?fM9dUBLQ1UqWDgiUCp2g3MXdcnyIoNxBxtwpj2hugHZUAcwtJf7QoJwV2+AU?=
 =?us-ascii?Q?U/+7d3wCmM4Tt1fueWIjFCFn5GFMlxzKmjnTdxfiq8X+4v9FzRj6/Dj7xJxf?=
 =?us-ascii?Q?6gJPb81R03/ImAuHoAvvwfMPjNzQzPBwkGqRsN1CcpWJh2piMlfYvIKj4OKZ?=
 =?us-ascii?Q?BpDiLOFfit//zRYE90MOi7aWprUoUC04n23ZivEuemFlgfi3FjaQJadkZ8Rq?=
 =?us-ascii?Q?EAv8q0X9anlcWrYNnVydzG+jzpVxG50pajBCPq0e1huilS3yuEY5jNw3mtkV?=
 =?us-ascii?Q?T/+EYrpAEFl4gjyF46xtt5e2mDgyRwv6pGE0h8Lx2/kwC//zYN8Kba8l66Ap?=
 =?us-ascii?Q?7xJWHt/SR6fy9hjvXocz5O1W2Ze1YBRI3sFprXS1lLWzhEIK6nfwyW5Cg1TZ?=
 =?us-ascii?Q?ZeT2UBDk+bjUQwSlzsTWSjzlq2zuL8ZW33XwcfMuoCRtx1VIZ02FqHp+ugSR?=
 =?us-ascii?Q?hyYuZvEztHj7MooXLJT+J9MXycuO7UfvqcjT1eEy8e5PJB+9Tbo4vL0xgWED?=
 =?us-ascii?Q?JjnSezw7E6yz1CnX1GO6ckMlDgBKXXA3i8Qr0UkiKch58pXeVqtzk5xB6OP1?=
 =?us-ascii?Q?Mj3ua3D+W5CB/NLXxhhBifAGQEhULHIaoR5GTqr5etBffgaZ6Z3vyf/y+0Yk?=
 =?us-ascii?Q?zR+JuqXHTBg1c/RhkzONTrm/q68vqavWKCG8vXrrgyt0lJFW4leHs4W4vDnM?=
 =?us-ascii?Q?xm19ppQH2/CnvATwbr4tbl9Qj7UJ7hVPuumXlqSYnLv78MwT/XD6A8dx8JhO?=
 =?us-ascii?Q?YFESi0GmBrvaLxtJktzblFZwiIFvIVm/9Ql8EWGbcgEgUMjh8+cEL++Om9T/?=
 =?us-ascii?Q?WFyWfivaK++aKVtekJ1Dcz9qfDKQBIGz1XcLFBP6XaY3vafHGAujORnHb7AK?=
 =?us-ascii?Q?vejoFGYl6H2jFu2TMS31QQ/9g6r77G4GvZs3rR+a3rKH3b3DVUIidJXh8lCK?=
 =?us-ascii?Q?+41SzPMkeryvENtDITCaiExVrLkpX9zlMkaWFMVB9M6DopE6EGPq8EDoHdE+?=
 =?us-ascii?Q?a36Fgy17O0IpK5QTWACHe83tB3SyUCmLAc+pFAaJNANHZVB2P5k49t7uUtj3?=
 =?us-ascii?Q?6p3H5cpa6zUka5a15MraoxUV5doYU2ajJMIVv9OCZUjfTc4V4qwdjevqEGrn?=
 =?us-ascii?Q?mp8fcZmTQWcqavwD0ORfUGv7h+wwFSutxJKiHXXG/MQjlAemlEzVq42BJ4PI?=
 =?us-ascii?Q?YCdCt+SAk+v1iq9tFXII4/F4KFn75VV/V3LxC9coRA9Oj6VloiU12BjBd4F1?=
 =?us-ascii?Q?EiWEmHSOkcna+Tl2h8pGpvQvLfCxXMmTTXgmodpG+MAP0FbUz36NS/Lp9vdV?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 699623de-3774-45f4-e74f-08dd7d66d5d9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 04:17:58.6333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJK3VgLXVyL8/bbOIIWohAFObNXh3JwFZraNOewzIKqiqdKWd8pbOMCb4ZW27rcu/cOcoeWoILmb0hiqKkUvEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8395
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

On Mon, Apr 07, 2025 at 03:47:00PM +0530, Himal Prasad Ghimiray wrote:
> Ranges can be invalidated in between vram allocation and get_pages,
> ensure the dma mapping is happening from vram only incase of atomic
> access. Retry 3 times before calling out fault in case of concurrent
> cpu/gpu access.
> 

Again I pulled this patch into a series which will minimally enable
atomics per UMD request. See the version of the patch [1] I landed on -
that is basically my review feedback. I took ownership but left SoB by
you as it based on this patch. We will need another reviewer though as
we are both contributors but feel to comment there.

Matt

[1] https://patchwork.freedesktop.org/patch/649010/?series=147846&rev=2

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 43 ++++++++++++++++++++++++-------------
>  1 file changed, 28 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index f4ae3feaf9d3..7ec7ecd7eb1f 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -778,11 +778,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>  		.check_pages_threshold = IS_DGFX(vm->xe) &&
>  			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> +		.vram_only = 0,
>  	};
>  	struct xe_svm_range *range;
>  	struct drm_exec exec;
>  	struct dma_fence *fence;
>  	struct xe_tile *tile = gt_to_tile(gt);
> +	int retry_count = 3;
>  	ktime_t end = 0;
>  	int err;
>  
> @@ -792,6 +794,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
>  
>  retry:
> +	retry_count--;
>  	/* Always process UNMAPs first so view SVM ranges is current */
>  	err = xe_svm_garbage_collector(vm);
>  	if (err)
> @@ -807,30 +810,40 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  
>  	range_debug(range, "PAGE FAULT");
>  
> -	/* XXX: Add migration policy, for now migrate range once */
> -	if (!range->skip_migrate &&
> -	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
> -		range->skip_migrate = true;
> -
> +	if (xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
>  		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
>  		if (err) {
> -			drm_dbg(&vm->xe->drm,
> -				"VRAM allocation failed, falling back to "
> -				"retrying fault, asid=%u, errno=%pe\n",
> -				vm->usm.asid, ERR_PTR(err));
> -			goto retry;
> +			if (retry_count) {
> +				drm_dbg(&vm->xe->drm,
> +					"VRAM allocation failed, falling back to retrying fault, asid=%u, errno=%pe\n",
> +					vm->usm.asid, ERR_PTR(err));
> +				goto retry;
> +			} else {
> +				drm_err(&vm->xe->drm,
> +					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
> +					vm->usm.asid, ERR_PTR(err));
> +				return err;
> +			}
>  		}
> +
>  	}
>  
> +	if (atomic)
> +		ctx.vram_only = 1;
> +
>  	range_debug(range, "GET PAGES");
>  	err = xe_svm_range_get_pages(vm, range, &ctx);
>  	/* Corner where CPU mappings have changed */
>  	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
> -		drm_dbg(&vm->xe->drm,
> -			"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
> -			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> -		range_debug(range, "PAGE FAULT - RETRY PAGES");
> -		goto retry;
> +		if (retry_count) {
> +			drm_dbg(&vm->xe->drm, "Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
> +				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +			range_debug(range, "PAGE FAULT - RETRY PAGES");
> +			goto retry;
> +		} else {
> +			drm_err(&vm->xe->drm, "Get pages failed,, retry count exceeded, asid=%u,, errno=%pe\n",
> +				vm->usm.asid, ERR_PTR(err));
> +		}
>  	}
>  	if (err) {
>  		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
> -- 
> 2.34.1
> 
