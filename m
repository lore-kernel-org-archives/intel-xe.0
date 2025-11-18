Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1500CF2560
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 22:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3B810E205;
	Tue, 18 Nov 2025 22:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TDLXSLXz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D57610E205
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 22:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763506325; x=1795042325;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/+mng3kXwPk7OHFD/qGQcFfw3gpYSfPlrDTZsvt0UtY=;
 b=TDLXSLXzqkQGF1Noolhe7I1URWbALjzkR0tpjwNBPikp/pxTmbX+b9xi
 woROiHkLO2jDlqvQ4n/bOviZiI1Bd5G8GpHwr0UbUZf70eLsFNEZP+PM1
 vSAZuiDig06GX+AfRfRb/SsSBbYn2nivI30BDT7VFAeN3eFtjPWVh7riW
 n+tQGY+BxkzuUDbS5W3MFqhQRf2d3pHnqZzM/NIenc+frroLuRpCJu0Wk
 FH56X8JbFCVr+K+DHtdNEAhKPb/sjHm3HrxvIe4bRzXabkJhASW158RHU
 lq6N1ToBkKksoqDEDn02wLKbpsONZ1Du5e3UraAJECW/29OON349vrciX A==;
X-CSE-ConnectionGUID: llbM3DKhQpyftwk1flBVxA==
X-CSE-MsgGUID: JgSZD3krRbWRhuGW7IcZHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65634518"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65634518"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 14:52:05 -0800
X-CSE-ConnectionGUID: x+Dnf7Z5SEetdVXh6Q0GvA==
X-CSE-MsgGUID: KJSnvku0TIWu6P2fRaErsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="191128053"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 14:52:05 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 14:52:04 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 14:52:04 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 14:52:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRt/aX0KIvBYugEFKjDBIdEs2NaeZqlfC6/JMapkfGP5+SI9eHPX2bQG8ko5/Q7F7z7Xy8Z0EZow4Co3H8bvgvPMp5uJ5QuQlOp+695NkJrgpCFIVJ/A8LK/fZ5Qi8rYBcQxjk6QDuDC9kvLaZrNW1t9NlFCAjexQPhKm5CCr0TljTfYbRVlEPtlL0/lQHBsOWigpmd1tfVslrqAqzdRdyezarHfg0X6BP6zmYp3oaNeObR+cyFi+Lk9G1TJ7K1DH+6gB6RDk8BjRndkD0Ffy6ntUJ60BOOJgmtHWFv4TNdClyDGSkL+l3ZyjLoAOmKS1WWaOghX77F1qZm/fyisLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+Erly+2XnnucAKPRYxA2vSu65StPO9ICW4u4ywel3o=;
 b=EXkorAMbETk/xdgszqoKmmMHVJ5AMAbdE5UQzEdQPEYXhp37Z3sRb/yracGnquLQXQ8Kb7kyK0gnl+UR9dH8nJKMYC+orOCdBKgZgGuIegS+gC80fdG5TmyshHrTt5Nxnuh+jNbrZg/L5DCcNSLQjQe/ShuZYkbW87V73AOtzCs7Uyn8/y4H3cqJs/57d6ZKoEddYu+itoQtHJB+twLX6nFTjniWADN5yoUce6VNNHQBgw3h96bJYzV3uqgDLBd6x9pxr5lmE+t8SSTcsJJJ3EpUmsOaIxpB234D3lKalATxK/Sf2J6mbjQAN92wcbPlqloZNLt6nfC+SNt2CYYXdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7788.namprd11.prod.outlook.com (2603:10b6:8:f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Tue, 18 Nov
 2025 22:52:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 22:52:01 +0000
Date: Tue, 18 Nov 2025 14:51:58 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/vm: Use for_each_tlb_inval() to calculate
 invalidation fences
Message-ID: <aRz4jtZku6BXs2PI@lstrano-desk.jf.intel.com>
References: <20251118201439.3688178-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251118201439.3688178-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:303:b8::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b58e54c-4b68-4ea1-e15a-08de26f51613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gins4GIlPvVeWaZkz7J+sC7V5AYGnI08aowkYuVn2hfSBZpyLivF3oxMDCGL?=
 =?us-ascii?Q?uGjgm9Kgd7ifLSpYgxupytPxK6dXjnWaaFOdOlBZMWEZzM+kCbh27obZMIYo?=
 =?us-ascii?Q?a1mhMUCqxJ2s0Owzltods+sfNv2yP2MfxzrC/+FYn4grXkDjCcgB/G70c6Kf?=
 =?us-ascii?Q?D7Yn1PeMVJTvZlJLJXWcCInMxY/zvGbV6QNY6yHVaf7A8vNLdaSvEvsjttWA?=
 =?us-ascii?Q?zquIvAsHTPk6pnqDy3/m1MOAFULrB7IiAzYj6Dh4cMmYwOiAOfOQnTl/p/64?=
 =?us-ascii?Q?pYmYJebbBbxOtQ4z7vVbBxRQMaO+5oAdSMaHD6VCPsN5PmTsEHzQn0uB9+lf?=
 =?us-ascii?Q?7Ry+bIYQu4vBWE7tMTpfX5YIeqlrYV06/Ak7rQFOeFn4CFKpFe/e/uof4lbN?=
 =?us-ascii?Q?KVeAepFHERyigVnwCJXSgdBc6ZFM44/nCw6cbSA0bZ5xmK7t/kAaf5rgcyMv?=
 =?us-ascii?Q?W+78pajcq6wDGsmNhIMT6HMgthJKZbCp2E+LJS/Y1qtWCJ35nEHmaTmWgU81?=
 =?us-ascii?Q?yjhAXN9bbhQv+ZbbhyUIIKLY+2+ZX03XIlP4vziF0DXj5PjyJaJT4RLNFxKt?=
 =?us-ascii?Q?WqsPaMw3gQBHOfBT3Vg+BxiGv3jxdUEIUNmPFYwg2DVjCOfMlMoaT7wUcQ7H?=
 =?us-ascii?Q?Ar/D2FRZFtaGwmssb7/Z8NCoRL2+s9DzsivCIIwZMS5dNV6CeQg2T68G4jSp?=
 =?us-ascii?Q?2aPMldsO+DLcSCjyQRF5VRZlxdpzdsmLNHTK7C/6gCluL4gPJd+b9SiW9Odr?=
 =?us-ascii?Q?TGPlqeooHTASDsHczFWYw9R1/YeOhTs26sSSkDxkeCLVeDh4hEyUX11R590y?=
 =?us-ascii?Q?8MevJ0BgwH4hb1j+7FQv38uHgkB7ely3zXG1mcN8c89vkKS8WKAy0f87CEnP?=
 =?us-ascii?Q?TmPfbAWdYNb3HB1fncMyBuEdjO5/ciARVPHIqh0NR0lXI48iAouj/G32azjS?=
 =?us-ascii?Q?liFGnDARsHVi5jn0xXCJP828sx6ex7lLH/fNa/fYDjFndC70dfsbpd2nSlhH?=
 =?us-ascii?Q?y+cMm2+5Tsmd+4kWC9nYqj9y5CwJilH04vRjxRbEpOGZ/Khs71hSZpoyrlqr?=
 =?us-ascii?Q?Svjcynkw2bBOpaudjSfDC/y18lrbKigRtA52J7w3PmXkdOVeKUbOpnbfVPrY?=
 =?us-ascii?Q?QHGXb5Iq68aC90D+EKHoMmpQa1nhEqDzJDffwmWLPHbdYK+whQzMk/N5uIkO?=
 =?us-ascii?Q?5/Z8/C8rxMPilhkkYyWEk2wlEq0F6lzamXyghJFTuEwfO5dlBkGtQEQ4N6dr?=
 =?us-ascii?Q?KkbsM1SC7NFFarR+AYXZ1KptioUZG/ApDOOgWh5ySqRFRZ0uW1XRuqNMF2Qa?=
 =?us-ascii?Q?f/ldTCyvmbb55khQ+uAVdBF5HZbutrlIrq8QbrTif4DXVmBLcrPeSaPY1d2+?=
 =?us-ascii?Q?Ng7l1D/+HT6chrNaJGHiPrC+3G3mDAoM4gxE5Tmm28EPeCjqgQPe6RnJRhOE?=
 =?us-ascii?Q?sMjv5mWzj49Mca35m2+U7sydO/oGsDFN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Uo1S8HqJjrV4bqAV6LFAHL/r9j9upLqo5Jc3kZtgWN8lp/atewr7vYnFCEha?=
 =?us-ascii?Q?T/30TiEu2RtHls6Q3ueCRfrzZIWV3j8aiv8T9ek/h+vVUZtQVySse26GzYGM?=
 =?us-ascii?Q?B8pNgcw/58QgCTwYzqAZ3EivhFmrcF9LseMhm1QTx3pl6AmdiIHHoh4ZiAO3?=
 =?us-ascii?Q?43o7p87yKFDnTjuIaz1LRKadH7wIv6ruQIYSDb+/Ycr98mdMTUjcT4os1xYR?=
 =?us-ascii?Q?pFIkoQzlfI1Nkn845FrLPNUxJrrVIz8pEOg11lOW5Wo44IIkhhg0NT5lmSP/?=
 =?us-ascii?Q?bUk+B1qEzavNguv5Mcb4owjEGuhLMFXjSphxes1FL90zGh1VIlBUvT57w+kS?=
 =?us-ascii?Q?hYBz1c4x0sPwhxjcabG9hU55U+4wsw1hY26TxfSLkqqDkBSPqaHp2xXGdkyz?=
 =?us-ascii?Q?R7HPLxwLCo1g4EaiY5h2ZxvVn1npRz/OZq0xMgnmqAyMSbuV8O622TGZei1I?=
 =?us-ascii?Q?n1rfWT6EujlA9uWgYNpb+dZUKMLmklOOoV23P5ZJ5kG5RFVQDN5vK8gx1GjZ?=
 =?us-ascii?Q?EvDCEXK0yCJZOkUywCdRltQw/BN4NU8a32NK7MBQ1ut0T7mzaDnCVrMKycPN?=
 =?us-ascii?Q?hsMncSrjJjEsJGw4QuRlyFL7X8mwLf7XisIvDWKSP71JqfT4FcDj4wnRFmDs?=
 =?us-ascii?Q?kxJbzmhP924IunljMrI+5nleUTP9khU+VvapAncTbXrfxYzvz9NYZZ5S9NHq?=
 =?us-ascii?Q?SPR7pUefYWybeEgCdqI5I64ud3TJdqoIV2hrA22ZLIhXTQU2WBBhf7A5Cnr4?=
 =?us-ascii?Q?OdUwyj8ClgqFP2pWDS/aPNQ6Xz0rFbkZkmRUL5XujAQ4vBrJhmICKHs8CNgR?=
 =?us-ascii?Q?ePKYLMq/eCAw53diFotgZwApQmNaylXgUP5G/bjsxhT7tT8PfKdcNKJ8lvcW?=
 =?us-ascii?Q?4K/SN/7P5AoM4CQ8e07iTSy6Pj44d6ofXfnFum4ZMCGIPlkWNdZH9zPg3ZOa?=
 =?us-ascii?Q?AndY+ny8c2gqekraGYcqF9jYJze3AWCTM6owJBW87vuBJNZF894kQqSWug51?=
 =?us-ascii?Q?nEwGj0NL0OS9tN3Iel/GZNg6C6FgWH5Lbt8G+T+W0KnNIDlkvOpgqmqFlHy5?=
 =?us-ascii?Q?92TxidxUS29q7PTCRjB45icO+72VAUafsLkLJ1zSC5w+oRlXZ+imCGn0Ermo?=
 =?us-ascii?Q?EePb3hFdUyGP8S4Xzsq/4aH3YYkAYy95hJLOYncZYDvWFFo5Hpw2A7+Fcdnz?=
 =?us-ascii?Q?xYbJM80+wmVL8aWUHnvm7Xefgj6oFqjdgcCQrnA43f8ibV+zCxpZhvDnMefd?=
 =?us-ascii?Q?ejuLTf20cljz8B68qCIlULKuCg2Vmmk4Ikj3VhFaroA+PntlXuaXo/9XOCH1?=
 =?us-ascii?Q?AlFhrHrBauMqTN0NipWJS6W5MRSIDhqC+e6WCaxxNONQyBJ5dy3ScBLcgDec?=
 =?us-ascii?Q?02lvwV6fsJJRguTLOwNzi5JEm4NhSBtDJlLAm+qaf//oeF+EoakJDdepf277?=
 =?us-ascii?Q?t3NYmLvfRh42tzWNGWAy+qeDzfAnpLEFvxucgnhs9iIKlTWStXF+ENPuRTuW?=
 =?us-ascii?Q?4IQS+7KdTLr1iw0AA1yUWFCVeJ/P09dn2UEBw0uccBGGPa0O5bgOSMv148p9?=
 =?us-ascii?Q?ohprpzAmmBA9gp63dhHptHIg6ymZsJOEPztLVMbkPO6jZwAKNAM6SLaY2LcQ?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b58e54c-4b68-4ea1-e15a-08de26f51613
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 22:52:01.6237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EppTbxD6ibuYkMpNKc/pCo95qdGbJjyTIHyVzIB0/ecq4IzbQ34sdmH0YJVPt1c5jTX66Fh/Gpe4f9oBnP754w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7788
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

On Tue, Nov 18, 2025 at 12:14:40PM -0800, Matt Roper wrote:
> ops_execute() calculates the size of a fence array based on
> XE_MAX_GT_PER_TILE, while the code that actually fills in the fence
> array uses a for_each_tlb_inval() iterator.  This works out okay today
> since both approaches come up with the same number of invalidation
> fences (2: primary GT invalidation + media GT invalidation), but could
> be problematic in the future if there isn't a 1:1 relationship between
> TLBs needing invalidation and potential GTs on the tile.
> 
> Adjust the allocation code to use the same for_each_tlb_inval()
> counting logic as the code that fills the array to future-proof the
> code.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7cac646bdf1c..6794f38b9340 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3111,12 +3111,12 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
>  	if (number_tiles == 0)
>  		return ERR_PTR(-ENODATA);
>  
> -	if (vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT) {
> -		for_each_tile(tile, vm->xe, id)
> -			++n_fence;
> -	} else {
> -		for_each_tile(tile, vm->xe, id)
> -			n_fence += (1 + XE_MAX_GT_PER_TILE);
> +	for_each_tile(tile, vm->xe, id) {
> +		++n_fence;
> +
> +		if (!(vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT))
> +			for_each_tlb_inval(i)
> +				++n_fence;
>  	}
>  
>  	fences = kmalloc_array(n_fence, sizeof(*fences), GFP_KERNEL);
> -- 
> 2.51.1
> 
