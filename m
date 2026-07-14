Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D20C43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 06:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EE210E002;
	Tue, 14 Jul 2026 06:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRCXQfkU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B66A10E002
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 06:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784010701; x=1815546701;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cTHUhEgR5otfjpSnXSGspy0VVpf7PBIKGXsNjgcW9lQ=;
 b=IRCXQfkUyP0NN2wJp6ZIArSGtWgKD06W2HCIxwKHvLv84vp+SzrF4BMy
 inkf1rzw9jNZ1mbX67wNYe3brue3YNDHVHs7LqjzQ9wL3TpYvEzETe7Vp
 bnVZLnCMgTFIxv/kDzfhJPvnr/5A5e/tRrvalJJSzkjqaX8Vygy2+UXlv
 G3nR9Ts6WSzhXeagwmLck0a+HWp/p3Uw8Md4ltxjdV3JMsSkyDbxEyrqh
 7zuCZAMTTJb2c7hTMXDYX6xCg1k/HSkN/zFk9g9qVb2StTDYLNj/3ThWM
 9VMTyTmArWyKMwMuKXw7t9jm+DSvpwoHiJNuaye1ieNqmnekBCEc4fzsM w==;
X-CSE-ConnectionGUID: ukgcS0LJRxuajeeKTuTO9w==
X-CSE-MsgGUID: yomLsQ++SdqNnIEYGcCjpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="110172017"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="110172017"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 23:31:41 -0700
X-CSE-ConnectionGUID: zq47he/IQp2PQgXiTnme1w==
X-CSE-MsgGUID: D1QKXPadTo6mR7BZlYzp1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="280186097"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 23:31:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 23:31:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 13 Jul 2026 23:31:40 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 23:31:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zy6MVelkY1S+h6rYcGVxsB/BHk6DOHDa4YBI1r5ooX3TrwARX02svH4i46+9/Sm78Pig0g72XxI3RImjX9Y+heabm3bzEZwvtYBw09OKd3++0Y1He2K1HuO4vXeYXFBYlvcCEqjQwmLX91VVI58FXDLEf7qwKU+gyxfqbY381h3qQ7KKJ/oy8sEkE+zCGh6kFEDDUaw0WVsdoccFtEydS6UnoO6ii2Mm4qh1zPovnW+6tt42mjdKzYCZSM47aLYNXxpPa7smO2GZDuBDzw+TjDF+C/TK9OYp4O96hXomXs/jtyWkuoGQT5qMLYPAURPs+tzTkkM9uXVFNp8QxPy9NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0pgycNRrvozT4azmHTFsXk1HwGTMHuNXOU/KArJsSQ=;
 b=F59orgpgJJQ1alYjB3m9SLfgx91zfwbkzmGJ3TtzRddFeAqA1/XZmvEFOhMxzVNF3MKJtnbi7trevACLCU/BhfIk7xkapt18JpBQY5zYa2hYXZwmoJS+Io4IJiWsHYlNwnJ3LWaT8U4h7RdwxiadcVJ+dbUZ7KEQQyO6bJ46MTf/+I2ATL395T+gigoB3gYO2FUsh5VUWntAogh6chBhajVyVAm3yH1N34S02T+sm6vqwwEEoPxjV4D/sTfojuACqxHLG4l6GUad4Xpujl9Wi+h6Yk64puwAnzbniJ6HcwuIywSxeWlDkeqxwX9BQZ9wNaY4OXjAmRMz5DS0fIpt3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6987.namprd11.prod.outlook.com (2603:10b6:930:55::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 06:31:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 06:31:35 +0000
Date: Mon, 13 Jul 2026 23:31:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <Bai@freedesktop.org>
Subject: Re: [PATCH] drm/xe/pt: Reset prepare state in xe_pt_update_ops_init()
Message-ID: <alXXxHTxeVqUYgo2@gsse-cloud1.jf.intel.com>
References: <20260713230830.2662760-1-zongyao.bai@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260713230830.2662760-1-zongyao.bai@intel.com>
X-ClientProxiedBy: MW4PR04CA0149.namprd04.prod.outlook.com
 (2603:10b6:303:84::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6987:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a0971dc-ed72-4544-4b4a-08dee1718d49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 6uDU3EFmFO5/wU5k/dp9DhHDEa+1WJOfRwbquN+8hOoDs9eaTDKVME/CMadOxuwNZ8XXzJ91oZLU+xbuHKpdKJpvmOg4jpfrDDgwmYNn9Hp5xDv4rZswtErWKyrMO5ZJh/xQXtAQ0I9ugUANPYnCQtozTs/LiHopgqPdH3xCkQDCqiEI6QaheRxaDfFs9arQS3USyohB4k+OfSQYUkMtZzBsAQpEfIgwpN4KEfgp+7Qi36qLNOdXYoqJFoeav7aCBGprZ6G3BYP4d/sU6t5FWiYoDbL7ZlCJ5wDTEoAtyi/6K+ZSltiKAkTBDU5x6K6wnIrtVqYMx1S6A9DglD4fwCgU8vNQ/MmNrascXppqHUEt1ClTRE3/7ZR+A4R3D2CpdzMm+RNGTX9y/0313MtyBpPJ6WyFxl07sukXlhWxR2Uplshg2bF8MKzuVWXKvZYpjt5Y4AfYv6WfNkqTnost10WWFqgdom9s6Y/sh8jA/mEEL8JddU4Ds5bh+jl6VBo6MuNzA46R9EgoB9EvlnJ3Rk59udYR6Ahb3R9KPvESe4SKZaRDbAlRv9abeS6no8HjSWHdMvxJp9wGFpEo1WRSFKhaVngnWdjHFi2Cs1GPjcuJxX4Cyp5yE9CfCvydlZsF0az2yUifXrrQAS8c9aWOPsZMFBcj1c2qruzib/3Tojg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SsDwWRBWDmt0vMBW7s8KmQJo4laH4sCVtY0iRHEOvwQObcy0yYufPwhDP4LC?=
 =?us-ascii?Q?KaCo8tPc2X4iaKcCS4hwZpSKIGb5IhgbQzOdmesClBwf4f1QzvsryKc1ICrd?=
 =?us-ascii?Q?iqzuQa681VCXMldquo1A/0FpW1Sx/cM+IxVl4e/gDYFB5yjOKZbqotnJCFWF?=
 =?us-ascii?Q?NZFta6EmV6khzFL3jJ2WIxB8gUqLpV5hAfZovrJ11hDopla8y4bbpD8ItkLX?=
 =?us-ascii?Q?X7fpiHDUUOuRZBwSNYfPWnrzYmImxGIAYT23473+WHCuiwOcNDFJdNNcw0Te?=
 =?us-ascii?Q?8C7UpkGE283a0s7rwzhpLTV9PQhQAyvL3PYDj8EHaRVb77pcc+bqNfkw4b3t?=
 =?us-ascii?Q?4c6Smno69CmhNW9CIXY0mADV0E59zDa62Wt1hYlZevN7u7TH69BzQpTAAZpR?=
 =?us-ascii?Q?Vb5+1x3ngs4r4Bhv1rb/xzQ65QrFFMpZz4tyZJKliGQ7zOdsJCtPkmiZ/U88?=
 =?us-ascii?Q?yjgNl/0RXoPvZZJWEqCZb0dk1/+8ZFZXhxAhNYh/2p9a9LxNmcnmIwxqD2Ev?=
 =?us-ascii?Q?ujDeLhW7cEquO0YePDVgfxq44eWob2clmjJlk85HZAYL++XswyXelJSpv0Zw?=
 =?us-ascii?Q?0rUvmPbkVXDtPfgTN7A08vFk3L7uFe10gG6RDP+Q3MV1bwE8OHWK7rXovoGC?=
 =?us-ascii?Q?wd40uF/UqVqNcfmEAQWBXHzLd1KBGTaQU49+d9plsQudKfFWlX3UnOJBBVTb?=
 =?us-ascii?Q?gIFH3mM6EsZ2YKAqQ4tfkSnyxNOxYS/9A/OvG49cH5TIMpDKDwvMdGTZdnQX?=
 =?us-ascii?Q?gcPi+NQ54EvFn4s5nfMCPbgv/8OLdyPGaTwNrGfNd7lWi+ya/8O0nFbd3mSE?=
 =?us-ascii?Q?x82qGGf0lW40vBTCSunktuLlDplsYPbApbsYgW0NCPUfPsXnWAAY73GMw9cG?=
 =?us-ascii?Q?/4H51eWeyAvaLsyaQReJNSIf0UWzYRUIeqUgNuF8RisPDX/vlnkw4+kne4ji?=
 =?us-ascii?Q?QS0XzHplSFCenMPsa2Ct5NbGTjrUiWy1N+3kylTB0EGjY9/avzKcKhv+oj8n?=
 =?us-ascii?Q?OVXBxiH+FDPibxhWZdKMY9xlX+dhmmzvAfafSsoyprgldRojPAcgVPhSo1Ea?=
 =?us-ascii?Q?dmwfOzkCFIyw63/6n0ehEtr8ruvfQSgTlWajo09eNnUtCN81yXubPUkhKfdX?=
 =?us-ascii?Q?H8Vq+Y+TGOiuV6cUD8mPLUsMQst6BClZ43HOanTppIPRUvXCtCcTsL9C9HYS?=
 =?us-ascii?Q?stKK2Fjd4doL8h2WFpgDQFPSovdMYhU/7xXLnqlbGPfJIIEYvMC08IbgCDMa?=
 =?us-ascii?Q?/S89kZyXs3cuLB/Y9p/57JZjZUy8kpFeqcyoBR7FPqjiQ+N5isb75cVje7V6?=
 =?us-ascii?Q?jCJyWvmwbC6e4Z0wCSGzIi+CRCgBRu1EN2mqnLhVspz4SA9ZQighUt9wdLD2?=
 =?us-ascii?Q?bApvR/UDLQC9UhezegAWSTelX1iOSOR1pil/4sOzzEZaacFzlUBHlhL2mRH9?=
 =?us-ascii?Q?VPixRhwPvIB0MjdwTFGWcSW4pfQRyrwv+TMYx0qYOzb0hmQ/MjxAMTJIb7Qi?=
 =?us-ascii?Q?Na8pNqn251vRCifNn/JbUth7ODcPFlcWx1SY5muT2kNJvXuTDkVCy2fdpfu6?=
 =?us-ascii?Q?EEGd4lYkpIJ67ghY9dA5aHK3EecUiwbrBA9Q0vZjtvKt5W6RcRlv+bo1G1Tq?=
 =?us-ascii?Q?Auo5jCznOhuBacf9EWXvIj4k+L5/dDePHzfnqRAA85DXrbVwzbVUL3uyN/qM?=
 =?us-ascii?Q?Kc8v0TDy4A9M97rjGsf6YCZlaDFLzueMU028qpHVLjYW+O/wNiSAF8/J3v3d?=
 =?us-ascii?Q?bndob7c+ebMAnUOpmKBR9JLjBIesZs0=3D?=
X-Exchange-RoutingPolicyChecked: KURN++KJoka/rnxzjt8AdBgndtipifiKneKax2/7SMVkWAD2OPszinpUVvmP3SVmcF0r7UE+xgxJ8VNH/m/wPY14MWqF7Z5CGE+Qab/A91G2Ztm5Wv+lWZlitWI3AFGBWm1yZF61hu5PKXbwU9z3gIVc5zKZWsEkd4TlW++AZZpPvjL9yperlJVzAk5ZjUrindk2+geVMzR6PJDuejndIcCzVXBrTcIXLXd4GJqMpNz695X32OzmA0hUBgYtJ5gqbDh5Dt1xaLNJtAr1R5xQ9v1JfdJxZUO4hcfv5dhUb4DVLSGqUA0MxTXCWFzv2bRv0DgqZwP5P9nYLWFFPTGg4w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a0971dc-ed72-4544-4b4a-08dee1718d49
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 06:31:35.2714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdUHywdWlweDtvHcK7bA/kg0+FvQZcrk5BSiR58qVpGiQWkC5msAQUw3XJNU7tzYhxLXfN85LdIDvlvIw1eOKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6987
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

On Mon, Jul 13, 2026 at 11:08:30PM +0000, Zongyao Bai wrote:
> xe_pt_update_ops_init() resets the per-prepare address range and
> deferred state, but current_op was left unchanged. If the same
> xe_vm_pgtable_update_ops is prepared again, new operations are appended
> after the stale current_op value instead of starting from ops[0]. This
> can make current_op exceed the number of operations allocated by
> xe_vma_ops_alloc(), leading to out-of-bounds access to pt_update_ops->ops.
> So, reset current_op when initializing the PT update ops.
> 
> Also reset needs_svm_lock and needs_invalidation. These flags are derived
> during the same prepare pass as current_op and are consumed by
> xe_pt_update_ops_run(); leaving them stale can select the SVM migrate ops
> or request TLB invalidation even when the current prepared operations do
> not require it.
> 

I'm not opposed to this patch as it makes retires with the same set ops
possible, perhaps makes the code safer but to be clear this isn't a
problem in the code base is it?

Assuming this isn't a problem what is the motivation here - future
proofing?

Matt

> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Signed-off-by: Bai, Zongyao <zongyao.bai@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index e466f714bf86..598c6b2571e7 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -2371,8 +2371,11 @@ static void
>  xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops *pt_update_ops)
>  {
>  	init_llist_head(&pt_update_ops->deferred);
> +	pt_update_ops->current_op = 0;
>  	pt_update_ops->start = ~0x0ull;
>  	pt_update_ops->last = 0x0ull;
> +	pt_update_ops->needs_svm_lock = false;
> +	pt_update_ops->needs_invalidation = false;
>  	xe_page_reclaim_list_init(&pt_update_ops->prl);
>  }
>  
> -- 
> 2.43.0
> 
