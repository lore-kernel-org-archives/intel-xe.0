Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12D2D3C928
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 17:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9370D10E70B;
	Wed, 10 Dec 2025 17:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQ5CAUwY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD9D10E70B
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 17:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765387889; x=1796923889;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VZQAuAr3nf8y66I4VRSqS/oj8sAE6Y/zd8nRJFvL/GY=;
 b=MQ5CAUwYud23tCgUZiczCBVjdGIpd+FwKuFsP5POqgNIN8t1IIZi3OI8
 tLqYGlDyJEGiDWgoQewzcyHJBdD3+ZfylEXnyaxbGwerdDlo/KfnOQY4o
 aiY+skRFFJp1GwNZWUkAOtuCoJhe3LAjuQsNbfeiHdUGI/6mLde9t0kcU
 37FjQP0tS+EophvQr1RzqK+rQKe0gGhNGMiIIgt+mnnH73wSYVWuz487D
 aquY8E5c1ym0f9n7Szj0+wqaF1qgUPFMosuOhRdfBD96tp7UEDQoUbYfx
 HlJiygd4T28l+rihhNx4APOZYpPiAKVGZi0uYCUeEEcT1I+UspvGJJrA6 w==;
X-CSE-ConnectionGUID: gxM6RubGTn+2j9JA1PIjBg==
X-CSE-MsgGUID: oxXCO1otTvCfJwwZIzqimA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="70988484"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="70988484"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 09:31:27 -0800
X-CSE-ConnectionGUID: BP37+EhxTvWSWp2f98vklQ==
X-CSE-MsgGUID: R8f3xZTBRqa5X6axjJKWqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="196171896"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 09:31:27 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 09:31:26 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 09:31:26 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 09:31:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgEGKsWQg4BnMZl4Nh7VnbsphMk9X8+wR2EsNHzsTCV4VLZO1b/Iwn+v9tJNlrXNxu5NOGhoAyqeCB+oAcc9Q8KmoGqOQWIwvLf8iIhQRCSdftTJYmOh6hRB+KPnC0aWFCuBQXMM3jHFq65C7KhcZcPhrYMHaWPzeSrjonKRgtjvlxkEqJQjRfEGANFv4r81Gs5gxFStKl9MRhCV57y2ef04VhqCLdt9i9svLR8PkfqZpFZEpD8e9aa42vSE7Zd8CH6mPCHKBodO03N2seA+vBDjUjoMILZShuT1wZu61w+KEZffTAPmubWP67DvPjkl3E82R07wWw2nLk0P0p6lRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbVS96Xh9hre3050yJ/+3/aF52HxLdQbH3KXPfGDZJo=;
 b=GFxzi3NjYvG/Bof3ljDKoD9BqU1LRX1B/GPAufY3BaTeGvOQaT44lnDG+BRni4bL5mx6yyjipKL37ues7qJtbqaJhFy+V97HLNC52pcanEj0cKuW/L3o9FRyK5YaTHZmdIZoBfqgyy3B4FzL5dby7JwmIwJC9+klEFscuSTPYNMW30/Z2Hm7ARlm7NtUW0b5n5eVRfMikwKnUZHUnt81SjiX71mtN3L1TqoayUA2/m9jRfBAHxIO4ZlBTkKRQMFgbyKs8LU05FzGxZGUTSxBfrJURMn8DKtPw3nbowJXyveB5aETsh8ZGYCVs3uqCVhLxL/ndqE/BB5il4x0FEsIOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8387.namprd11.prod.outlook.com (2603:10b6:930:c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 17:31:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 17:31:20 +0000
Date: Wed, 10 Dec 2025 09:31:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe/hw_engine_group: Add stats for mode switching
Message-ID: <aTmuZTR5lAsfQMd7@lstrano-desk.jf.intel.com>
References: <20251210165000.60789-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251210165000.60789-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR04CA0163.namprd04.prod.outlook.com
 (2603:10b6:303:85::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8387:EE_
X-MS-Office365-Filtering-Correlation-Id: 460075eb-44a5-4fe8-593b-08de3811ee84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?YqqcM+xhY6Ws/zAKT8sQBnXsv/nbSTs8YqSycoj7wwJ4Xuj3D7AbI/WjMc?=
 =?iso-8859-1?Q?q5ePDJx0L5uIPhdhbaFzugET1FDSpRkjTuuyFaKJzNWi8VzbZn+NNt5Wgd?=
 =?iso-8859-1?Q?UKp85pSdyziA08wCUNeibiwO1XpLxVZSlo7PiNmFDoLEEUqqbD3t2PipXc?=
 =?iso-8859-1?Q?MiymEfliDiV4jEl8L1TcuPArSnl00F7ktDCUpJtBuT/LU4gPZ6sgotDb0c?=
 =?iso-8859-1?Q?IPI4oir8JudV4WXY+OR9+NtNwyYX0CylperelQORjDdiFr7VWu+oHxJPOn?=
 =?iso-8859-1?Q?uYOXwzJir4A+KuDklpgDS91pCQ/9pDfUSkTe7tB5FlLzRnLvGmu05OQ0X1?=
 =?iso-8859-1?Q?w64jUlOCYaXHUtT7lB3Ahs0kCVr6D9MZAFhX3Ytwk39SmFQLQ51iQXYVue?=
 =?iso-8859-1?Q?9T5cA+Phts+/LwgbOp8fOUkaVWFhage1iZtzKK3qjJEJs0hjfQ6AM0VKBo?=
 =?iso-8859-1?Q?SQWcO4quCRsbfQnoDwVrd0GPeWSURWJDuPnPQQNymeI21eoT/mPyr2cZvb?=
 =?iso-8859-1?Q?lL+NkBp21q0hiMF5ca2XiAQ4eEdWZSqDyJTqRWNPeUg+46hJxvBVqjJkXa?=
 =?iso-8859-1?Q?ASdEHJ/nNXqkgxtWvroiM0p0G7C5vB/ncfy1LWznAfE4w/9o2RH7HGy+TR?=
 =?iso-8859-1?Q?sCac8Yvy3i4u14/qLqp2uXIJjraGCGbtyIBgcac29Mo9aBgA7J3R3AZXpB?=
 =?iso-8859-1?Q?7mN2JuVEmerq2xNZUDHFqp+5oHmH7IZahxH6kaP1jGM4GbLyZhvwNcG5ps?=
 =?iso-8859-1?Q?U9j/k8t93zKhpDznjdkqc4mi+5hjdlaPiDZklTexh0SO6YL7IKbOsJ7ol4?=
 =?iso-8859-1?Q?yalRBlyXq/LAgCwt8+fJ4nZdAUXosxscSBsRQ1JmtSOtWeQ3p5BsCP6382?=
 =?iso-8859-1?Q?b4wk0Vu03k7GpUb54poaBQISungc3+PzZS4CVQxKfwDZJ/+ZLf4JDOEcsE?=
 =?iso-8859-1?Q?0KGqsKcdWSTogtOjW9YDdOkSKMH4EUNZmcP1qU53QHtcq7L+NC35wJC5bV?=
 =?iso-8859-1?Q?Z9oZaWcd9mp1ubD2A1n+Abj4kThdQcwkD31GV/6FK47kJrqVsFEs9/YwYW?=
 =?iso-8859-1?Q?FT92ay45UA07p2+I3gWbRyBvItmKkZ1iJwzBrNa4+skHau7O//XWskuP38?=
 =?iso-8859-1?Q?IEqTUjPyCsFHZpdzSvahtDL2b38axZ1zn/OjubrDcflcPKfkJ+7h4yKO0r?=
 =?iso-8859-1?Q?uu5ctbRVX374n6vnUoArX7olHyZc9dweK2MNbsu8Ndy3LbJ2MftVKHY+sT?=
 =?iso-8859-1?Q?XVDG1ClWQB3EpBGKH4RA3XiHGlkg37SLHD17XbpnUMpLpXqgUMkmWuHY2X?=
 =?iso-8859-1?Q?/FzoSJA7VCuG6e0pk4acYlSKwOTjb7Eja9xOQDWDxic29vE0uh9bUUCpa3?=
 =?iso-8859-1?Q?PefF547oaQ2c2kdZg0J7oyopbiib0xdLgjwO2b5UKl/vp+10k9PV0hUlsr?=
 =?iso-8859-1?Q?x24y9uS+avhi2ZPc+6Qxv2fKTnPIrtZPiQcDyQkg4WvrxN9jpaQaF1KB23?=
 =?iso-8859-1?Q?ifaijPpUDh4kiMYG2AyunI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bCEVcEMV45GyrmOG46svXUpFoAYsZ4r1seEp/5t3yp+jgnPytnAlbAp7iH?=
 =?iso-8859-1?Q?sJODKIFldsYgj7gPKpccGCOaBvQx+S5dvUCAFlluxadfb4xzxoxsrnN3qB?=
 =?iso-8859-1?Q?Pt3apvSY4Hnq+hGmD5vwWy9H3vvBvjXXKQQWuayIubhDqb6PxmqGIlM2YC?=
 =?iso-8859-1?Q?YHi5gN2Gm2FRQhIghK9u5fjL2qd5+L35AIl1Q46zqCJp2uicWDBHb/HnOx?=
 =?iso-8859-1?Q?LzPNfAu4+y2d08rRTlNb0Glv18W5VQ7lgADAC6V+TeWoz005TfhP5+eFZ0?=
 =?iso-8859-1?Q?mE6aHBGufzUwtsclMFI3h8ZtCFLmGRDgQCi65o031NP6cMlbczg11Nklf4?=
 =?iso-8859-1?Q?CizGEktBoSUc2IUumrJ/0cynJBIK5ObLWXOkjMNcw17ANQieUpBroBJc83?=
 =?iso-8859-1?Q?wYRmwwOP6B/sSGkZKEBpMpLLqW3AQkEgoT5K6080Llbd/15mRTkm2C0fDX?=
 =?iso-8859-1?Q?vcgWzeF1corhiEqwN84HQ0j2XOeFiO9GXEBKUMSjuBLgwnM+nX1U7VwbOC?=
 =?iso-8859-1?Q?BXgPMNdQjkpC/CjMlHo25Cc/h7DtE/N9smn1CWjzEeBlnAJSYBVIMPPMdy?=
 =?iso-8859-1?Q?5RIU8+yGTEk7zQARK3lzuuzxDvdoNqLQOs8tkp8YM4Z76KvtCbBCwe78yh?=
 =?iso-8859-1?Q?DVV6N2eKnOLV13zmMLjknMw3KzdEwDbbgJK7ltRzMRhCjxUTRa/QOc0nwA?=
 =?iso-8859-1?Q?BG4DgRgwXh1TZYOhIIg1j7mIrI6ylFiB8PRIiAkhR16Y8Rgl5fsXXlEHyM?=
 =?iso-8859-1?Q?khpUpqQZJaqntdTSd32HArRPGqipmejNFy6hp6J1LBKHZXlzDCvRx2bv17?=
 =?iso-8859-1?Q?ZTlBa3mpA8s6/tVxJ9aE73MgHw1oMVfq1VaxzcyUplAscks7/Z+Cg489NZ?=
 =?iso-8859-1?Q?8BRWdhuuoJlairovg3eHV3pKqiXEbQNPLCowHxBHJoSeNWiVYVKfZ0jLLt?=
 =?iso-8859-1?Q?DUxDeZXKZkpB57mCI7nnehE0LfJFUOLazztQ4KAgKDg1BpCSo8FrCgLUMs?=
 =?iso-8859-1?Q?sxIkxIwZbmp9MJWSI04Nib5qdzpGCj5+b92VaUZYWn1rVyU6GnNYwbhzRa?=
 =?iso-8859-1?Q?2pc3BEwYYXg4fnPvZPObGqDU/pAbMLS60/btXyFDTFiTwz+ph07mv0aDSH?=
 =?iso-8859-1?Q?5SWjD/UQHdKxuoiU150cqzVOAR9O1L68e7zm5+KJ9deMyl/jOeb4PmdXAl?=
 =?iso-8859-1?Q?E961aC23SpWGmvhFPlDmqRVJUJ79HCriaRnsTIlqZI6oE3MZ9Ix0D3MB3C?=
 =?iso-8859-1?Q?sou9SgyYJXg61JGIywWo11X/nRYtymZA6SG0uOqARG88LWknSCHqC1N1Lv?=
 =?iso-8859-1?Q?2MdmhSwycwYyUYG8RoCfFoO3NQO4BJ6SRkeyKbH/33RE8qE6r9wz090RUq?=
 =?iso-8859-1?Q?tyWYOWxNKnDiriLMNhQkxnLft/NHFy/fj7fJMJnhIABQ2fRRFUJtnicU36?=
 =?iso-8859-1?Q?ILWM+C8CJ/66100W/7jgA+WMrM4/3cgYkMIfCmhPfXhOQoeJvfL1UxtEMw?=
 =?iso-8859-1?Q?99EPb3vLzjwUP+B+Ew5lc61gcjndA6DALQwzicfpt7u7/GrSiyADW1u4ME?=
 =?iso-8859-1?Q?L1vbjAxBxw6Z3hd5ErmxWOeDC82PGQyh6ZnTDc9dSNJCTbply4nk51j/4H?=
 =?iso-8859-1?Q?9Sb46QdpUhnWOkYreMEXC8trv9qVMd7a0h9ogrzYdnHT4Slvwp4mw4JA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 460075eb-44a5-4fe8-593b-08de3811ee84
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 17:31:20.1786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PI8uqv/A+uPfYTLYI51RPozaU0IztGvpeTlXYId7iB/Me14TqFBsHj+7eo4d9Wh4jgPBmdUVkYmh6jkE37g3+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8387
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

On Wed, Dec 10, 2025 at 05:50:00PM +0100, Francois Dugast wrote:
> The GT stats interface is extended to include counters of how many
> queues are either interrupted or waited on in the hardware engine
> groups. This can help application debugging.
> 
> v2: Rename to queue as those operations are queue-based (Matthew Brost)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_stats.c        | 4 ++++
>  drivers/gpu/drm/xe/xe_gt_stats_types.h  | 2 ++
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 3 +++
>  3 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 5f74706bab81..714045ad9354 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -66,6 +66,10 @@ static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>  	DEF_STAT_STR(SVM_4K_BIND_US, "svm_4K_bind_us"),
>  	DEF_STAT_STR(SVM_64K_BIND_US, "svm_64K_bind_us"),
>  	DEF_STAT_STR(SVM_2M_BIND_US, "svm_2M_bind_us"),
> +	DEF_STAT_STR(HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT,
> +		     "hw_engine_group_suspend_lr_queue_count"),
> +	DEF_STAT_STR(HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT,
> +		     "hw_engine_group_wait_dma_queue_count"),
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index d8348a8de2e1..aada5df421e5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -44,6 +44,8 @@ enum xe_gt_stats_id {
>  	XE_GT_STATS_ID_SVM_4K_BIND_US,
>  	XE_GT_STATS_ID_SVM_64K_BIND_US,
>  	XE_GT_STATS_ID_SVM_2M_BIND_US,
> +	XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT,
> +	XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT,
>  	/* must be the last entry */
>  	__XE_GT_STATS_NUM_IDS,
>  };
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index fa4db5f23342..290205a266b8 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -9,6 +9,7 @@
>  #include "xe_device.h"
>  #include "xe_exec_queue.h"
>  #include "xe_gt.h"
> +#include "xe_gt_stats.h"
>  #include "xe_hw_engine_group.h"
>  #include "xe_vm.h"
>  
> @@ -203,6 +204,7 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
>  		if (!xe_vm_in_fault_mode(q->vm))
>  			continue;
>  
> +		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
>  		need_resume = true;
>  		q->ops->suspend(q);
>  	}
> @@ -244,6 +246,7 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
>  		if (xe_vm_in_lr_mode(q->vm))
>  			continue;
>  
> +		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT, 1);
>  		fence = xe_exec_queue_last_fence_get_for_resume(q, q->vm);
>  		timeout = dma_fence_wait(fence, false);
>  		dma_fence_put(fence);
> -- 
> 2.43.0
> 
