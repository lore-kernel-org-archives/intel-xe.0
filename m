Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B9EC636EE
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 18:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DD810E5A8;
	Wed, 28 Aug 2024 18:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mfJTOlCq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4E710E5A8
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 18:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724869417; x=1756405417;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ulV6wJO502W9bgiSA2VURBH8M+d+0Yn1IozOT/k4wGk=;
 b=mfJTOlCqpmI3Sl3b95eKzw5KFmsKRgLITlbGYERWXtiIWtsAeVmfaqJ+
 DXzLpLiQqp5ufAYShO1ODdUOifh4Wysnv9nKyyhVAEzyjDhhq2pXrjOOP
 1Yey04e/KUkiyInvOEzEgIwe456vezRaW8+2U/IH02lKGBCqztd+mvN1G
 gZ6am68h1cXDFuHcD5PyI5IQp0SOVMDmzV8IjXnKGf3kw61eg5xoykOXs
 JXtV5bf+qgoio4k1vLdUNy6krhxeXKlcj+sgriFg70TKvBtut3FgHTGX8
 /RmAE6ZrVb1Zi0oBKpD7KDwZINHVllIHAN1N0CYfmUKwZ0CHlxH+n2GYa Q==;
X-CSE-ConnectionGUID: 4nzVle1nSUiGk9K1Qn6zDQ==
X-CSE-MsgGUID: 1OiqBjhmSamv/ByzcW8DSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="33988700"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="33988700"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 11:23:37 -0700
X-CSE-ConnectionGUID: yc7q1MMxTiKUGJLoNrHNng==
X-CSE-MsgGUID: KUnny8SgRwaRO84/foBMAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="68107408"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 11:23:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 11:23:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 11:23:36 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 11:23:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCt27z82vrRfGhhPA2AWZg4oZ1h2LMypRQ3Uxyk/BAOBD3J+OlIy8MzY9yfKXoLYiD5yWNaZxjL7y2fEa4NzVmJ4NaHsxmRzd8G87uvKNcWretVTY2AjcGtBFUkuxUTPLW8E8vXonwZn/EX0la0kCZ/rxh87ltpWqlxQYOum16Gz+KvRXIIM0+juxXWtrbD4CFoUkzvj+tarxaVMP86Z/bCF8Su3JyWA54Bxda8GMya4qj8qBMznRc30E6MCn3nBLYqE9epihf1Aci1mVv9nkBxGKyU5RJ3GbQIUpyH588pMOZ1L2bke2guoB4LedRI44Sb1LvXebnRkzFNbGkPcjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVSQrxAvGyv50nZmnvuoPSJl9ohXfsA/mmNSQIOppaM=;
 b=RvGzLo7e65wd4Lv4qYiAYFA3ZgGRcRvJ9IunmFrZhxJiKmMmstn8KvVhxPc6goc9g3i3a2tAq5QpBxiXuWQ2uG9LkudUElhzlDeilQiWGf5Xi7QsPq0InS5s6IUSddihf4mDY4ll56yeJ1KzPLV+lRJT8tOVQGooGSKUeohzROZYBdla/jF+elaQgUY4/f1TjyFuOEJ27ZtZWXhTf/1RECABCcBv67Jo+uTN7lTmRZpoFE3OMOtR6HT2h1dQLutamfRDxM5hnuA+C9knCynOmGYTtflJ3v0LlyCX/tmLlYpulXlaxIZ35SkqPoEKPuLMNNicXp+HCjPrfqTxC+GUVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CYYPR11MB8308.namprd11.prod.outlook.com (2603:10b6:930:b9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 18:23:34 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7897.014; Wed, 28 Aug 2024
 18:23:34 +0000
Date: Wed, 28 Aug 2024 14:23:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: prevent potential UAF in pf_provision_vf_ggtt()
Message-ID: <Zs9rI2MIMezCDtA0@intel.com>
References: <20240828104341.180111-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240828104341.180111-2-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0339.namprd04.prod.outlook.com
 (2603:10b6:303:8a::14) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CYYPR11MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d23ddad-79ed-4497-db31-08dcc78e86e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oiu7apuq+VRlRVC5pxJ9AYH6JGJ2P9J+2S4JEupBae1cbXSj3lNQOzMyxK92?=
 =?us-ascii?Q?pmpdhUs5JauXtlRMsH+cuGv6jE99O3wXoEu8tNM1MT1sXY76+nKMvZXsf33/?=
 =?us-ascii?Q?Scb3BVTjQKX/uWlmG7M7jk32tPA0JuCsbhJsrbtASWJdYWKZbj8h+4e98cI1?=
 =?us-ascii?Q?3Q14nb5vtzOWQxyXdKH3pas9xiLUp6n6RJt1+FKVIuISf976ZJhD0YgZOo3x?=
 =?us-ascii?Q?PtSsvKjxWZMlOuk2RqORRNrdVQS6jxCcqW1rVBMvTy2omtcwznTlou63oyCm?=
 =?us-ascii?Q?z8Bnp5/Ypg+9TsAfw5927guDysQB5IgnXR4DQrT/IWmwn676wQZ3ys/3tHNz?=
 =?us-ascii?Q?dy+YWtKn+Qw6n0n2pdaHc1g7A1EhPH0ghGTmtoaVL6TrxUmWcIzhd1hicYxC?=
 =?us-ascii?Q?9+y5QwbF2D0e5uDJ+sSHC4dKtJG9qeckczWzfRe2m80SXUDNDjI05whJpS6e?=
 =?us-ascii?Q?pImCNwTmUfDCjuZ4SlM6uS+vLsNmDLhXArwYHrkf8eH54RODqk614n4o2DuW?=
 =?us-ascii?Q?1oqLig7PChgMC9EPn3VAtY2OzQ9ycJGT3AF+otHHwGQnohHjn8irgcBtJa0P?=
 =?us-ascii?Q?rLl0tTJMvTxORBerf0jaRtvCXlbfhRHg5Gnn8RQHDoF2X2X4/A3rlwcJ6mQv?=
 =?us-ascii?Q?vsuTch7mEolexqrSdCN8gwsRpTRUX54ntWvV5+eJMWSs/YnAaxWCzf8cdOVF?=
 =?us-ascii?Q?zxyUe3qJvXq2zUe1WX9mqSSXtCc5Ah/qpBlYzRdtGB6PYRoCA2qyHB5b0iRP?=
 =?us-ascii?Q?UxBGD2MmqoJ9Eu/Ah4UmYNyeILKSIseDrypTn/3AVLzWr9mJz5enGZmY2zF4?=
 =?us-ascii?Q?Kfqftptbjfon8e1bJiFWnp1+tNAKC1r7FwG1gm5Mp2TUqhXskwf9ymIn8KsK?=
 =?us-ascii?Q?yDYPxKrfOBXUVgH2acIBV8+J0LQggEFUVrT13WZklyaidySQ8KMipeEB5RQz?=
 =?us-ascii?Q?iSP6ppsAgE48sG7Gl0u4rMsg8e8B63qezNGQbTPgMagRMZ3mC5OXyK2H1PCN?=
 =?us-ascii?Q?wANkB2wKO/KayZnXXYYG66Gb2GdGtwlax8Sxmji+uVJppvZFs/meaU63Ga73?=
 =?us-ascii?Q?sFjNHJxq2S4r0lShLIzzUYFsCDe0zBhbd28vJTDWPaeGVUc337BGEsKn6q9C?=
 =?us-ascii?Q?bYPz74cgL21h5bPX1bPuWXtDiA1vfp5WAPTQaTsmdLx6YWy5C0R9P7NKUoTz?=
 =?us-ascii?Q?TgZDosFXtoU4m9vb/luo1/+ZaCjwYLHLz74B2e1HMV27Hox8hXhzxHjKIV3w?=
 =?us-ascii?Q?0PiBUYC2qpJUvSoUnu8davHtH4BojE908eq7sMyPCveqOAf2ck9WXTZoLymN?=
 =?us-ascii?Q?tyiMwFLlkTFpz1LM02/rj0AvSKHegyoycrZdpJ0GacKixg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hrjtYqzeGcxtl/7kMH3EbBylodrS/ci+1S9cX/ULepaHtXox27LboeXt5ldz?=
 =?us-ascii?Q?kdcxONeI/HLy/d6V0E3BXGzLV8iMxh4Bcm9+KwQUDyK3tbB97jYPOuUHK0Yw?=
 =?us-ascii?Q?Kv0M/FQeLXk6oYsxGl6xrSW3ZcP1ig6RNQS0HtK/LtdFpgVo4bKLCYzFCYJu?=
 =?us-ascii?Q?iOVrfD2sVgbOUM70IDYpkU1Gsidkpbe+zRuxgbHJYLm0bszcqWt9HEFE84Cd?=
 =?us-ascii?Q?893gsMVwLsNIf3zXLPMaVARGcOq8SabS+PnvVMxKaeShcEfsQGY4rh8FYuXW?=
 =?us-ascii?Q?sk351urArSgItVfMMOE0Fu9WzKAlg7mbvX4litqOhNB3Yf/9LZjAdBVWvHnn?=
 =?us-ascii?Q?Gstb17nBhOHaoV2RN+v9jaoKJbA0KfP2V0YVP74PC1lfRGSJzavPAneN4Ldh?=
 =?us-ascii?Q?F5jHHqOPiBc6Q0IroG5vofM8w497yMatyqImrWTqjymVCNbIRgBQXgsaqFkF?=
 =?us-ascii?Q?AHytzDLzGghcAHvdtC/KdFM2k5avDPWgWs6F/E42kCKRw09LsugrgGhiA66s?=
 =?us-ascii?Q?Ww2z1nSMlvnYxY9KzYeoLkHKlyOhalmgpx+lMq8a9+Y9bfM2376N32Fs53Dj?=
 =?us-ascii?Q?oYPYgFJO07ENVwqaXFmA2ou2WU4tRUtN2bxWWWTd+oaAcT36ZU/qv8da95t2?=
 =?us-ascii?Q?6v22uGgogbme/9IctkiQT2NRmjzhwd3S7gfaLygFJfTYtjNa3WVOHHii75Fz?=
 =?us-ascii?Q?l7s9azT3kKU47swg6sH7h9lao8w1oTs27Pb7bVNCzmgRy87LRc1v1C9G0mRC?=
 =?us-ascii?Q?CrRF7+EjYQWZn6usDi00xycDadLaSuQpJ6KEB2Cq/EGPk1iR3EzeNisSBVng?=
 =?us-ascii?Q?stIf8zGznhBtYoap6SRmhN3zzRYGH0hCHjM7y+VLD6Cj+HReENy/hy9f06HG?=
 =?us-ascii?Q?Qf7K5335r/qTzTewxKIMQ1wHzqSZim951dM3giufnw9CaTqquotXm+KZnJtm?=
 =?us-ascii?Q?Tj8DGT4S7HhkziU/Ddat22FWjtvxw+aqv0NtTS9Sv5V1hLVME67FajURS0xV?=
 =?us-ascii?Q?jtkyf6f9xa7BQ3YLNIrk4MoZFz1mK//tUWZFBiPl6ocoiUsvTlMHkuNii4Ss?=
 =?us-ascii?Q?tUgdh8MjI4htpLYL4Z0nhyUl+5j+z4jk2FIZLhrLjl8WADzsH/qPtlm0AwPM?=
 =?us-ascii?Q?pl4lzaLST7NrsxozqmVUcw6D3mkl5HzZGuGTHYRh1zlOhD9J8Fwmb0b8TmjM?=
 =?us-ascii?Q?nQGWUiC2QZ35AaSrTN1pQxnkIklmrbsh3SSooqxWBU2mqvwUjZ6J0D5cd6OQ?=
 =?us-ascii?Q?m/P1EzmCGVwMTuQG4b3dDZT82J6hc9PnufXNGx/VSZMtOERAM8wj7RYfU7d4?=
 =?us-ascii?Q?XcLdabMzrtjZcxcZuPTkgvafNRGStJ6nvsyzJwf3ldygLfuBr8sxShfQN+Pp?=
 =?us-ascii?Q?1wG3JIsk2o/XzeY7NUV3cMhx6cAUqN2sPH473r1hKBltoeaYDWdQPYtOI+Z3?=
 =?us-ascii?Q?LWrKP4/F7I8B55po/4VEd1rJ8pY3D+Y7zIt1BrTrFpU9StAJhjamvVwv6EFn?=
 =?us-ascii?Q?VmNionxR9J+X6Ncr3uWJW2T+D56llPqQI0BnuIpsRX4u1tg/k4nLHM+5N0+S?=
 =?us-ascii?Q?b5eVmzYtPp/pFWCH0+KUsjnx+trY8Tkwx32Stg+3JrdrM2tP1T8fyd8L2fKW?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d23ddad-79ed-4497-db31-08dcc78e86e8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 18:23:34.5003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJe3Vs1GKVQ0/+JuuEXnhEAFaKor0IBryuiPL7izODJUvB/+wwg3yeWs4gWxFpAAu2R4vVP6A1s/fF/8SXKOUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8308
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

On Wed, Aug 28, 2024 at 11:43:42AM +0100, Matthew Auld wrote:
> The node ptr can point to an already freed ptr, if we hit the path with
> an already allocated node. We later dereference that pointer with:
> 
> 	xe_gt_assert(gt, !xe_ggtt_node_allocated(node));
> 
> which is a potential UAF. 

Not true because xe_ggtt_node_allocated is checking for that.

But probably after this patch we could remove the check there?!

> Fix this by not stashing the ptr for node.
> Also since it is likely a bad idea to leave config->ggtt_region pointing
> to a stale ptr, also set that to NULL by calling
> pf_release_vf_config_ggtt() instead of pf_release_ggtt().

This is a very good idea.

I wonder if this should be a separate patch, or another commit message,
but the end result is cleaner code, so no reason to block:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Fixes: 34e804220f69 ("drm/xe: Make xe_ggtt_node struct independent")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 41ed07b153b5..be198a426cdc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -390,7 +390,7 @@ static void pf_release_vf_config_ggtt(struct xe_gt *gt, struct xe_gt_sriov_confi
>  static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> -	struct xe_ggtt_node *node = config->ggtt_region;
> +	struct xe_ggtt_node *node;
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_ggtt *ggtt = tile->mem.ggtt;
>  	u64 alignment = pf_get_ggtt_alignment(gt);
> @@ -402,14 +402,14 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  
>  	size = round_up(size, alignment);
>  
> -	if (xe_ggtt_node_allocated(node)) {
> +	if (xe_ggtt_node_allocated(config->ggtt_region)) {
>  		err = pf_distribute_config_ggtt(tile, vfid, 0, 0);
>  		if (unlikely(err))
>  			return err;
>  
> -		pf_release_ggtt(tile, node);
> +		pf_release_vf_config_ggtt(gt, config);
>  	}
> -	xe_gt_assert(gt, !xe_ggtt_node_allocated(node));
> +	xe_gt_assert(gt, !xe_ggtt_node_allocated(config->ggtt_region));
>  
>  	if (!size)
>  		return 0;
> -- 
> 2.46.0
> 
