Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C22C3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 19:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E2D10E638;
	Wed, 14 May 2025 19:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cc8LLTvr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92F410E2F0
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 19:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747249291; x=1778785291;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eWOmP/6CC6cKmLzuredKnz++Z1AjW2f/rPBy8Skin88=;
 b=cc8LLTvreRiyvLN0+e2FMYQKHyVDEt5/97UsKkhWmkuHLSPyoOKArSp7
 q4gqEoBDHFNQQAJlV5dK1VTJK0mXSikuSMBmLt4Jhlcn+4lK5piSoaFR0
 Ijf1ydwH6XWo7B739mb0ICxp6j6+SiSv2rg90DKw9ECYcD1V3+hr5qFq2
 LGvYTtvhUzndJToRIosu66uspsJxF7v8BeLwjbBlqYJd8hXiVKy60heiK
 EXmOePyMub/P/g18u3GVjdepzvd0tKeLZPn3IYQnN/G9qR/RBnKdDHBOO
 vDFLh4b/dj+Omz9p5DgndlpDdnCCo5rlclf2tiqujA8WrxmZv18Ie2hbI w==;
X-CSE-ConnectionGUID: nu5RVygoTz6ynNOzt70OHA==
X-CSE-MsgGUID: 3yfObdSHR8289wYXD44jCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49098783"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49098783"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 12:01:25 -0700
X-CSE-ConnectionGUID: RDViB/YqTXWgaCFLnVL98w==
X-CSE-MsgGUID: B9c3sqf1TVaR5EcnEotapQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="138009067"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 12:01:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 12:01:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 12:01:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 12:01:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zq67bAQxvPg4ijtWVu65hWOhBCIXyqOFQ32BRk+oCeAB3JM1s8C8WTe7vrW6/+yzy6NTGFw4E8yjlDx/s+ABIWkqKmX06aCw+rehI2ytF3mqLz5eZlxX2f6DUn7zCWzzRm2Pg2WQeVPYNTmeOnoP1G7zFVktPxLgg4f3jup9DBi6/o9pvVBrAs/NNDqIKZ6XTJR7gT9dOOmLxs0Kc4O49X5sh2KlATXrDRzs6Wvi6gUUR3HwyfK7HCQOj5g2XfPThDoMmFmoOOvlUYZBwwLDok/fatKT/TDJZ2FFf2KXVyCB3z3ub7ICoYpk92SvLN3Ym7SCoF1p2m5VzCJC8XBffQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDHDpzIJrfGapPBVT8ghj0TD5V/bvF+PWk2vO3Bq0N4=;
 b=mQj4NF43XUb7kBTGCcdn3FWuBI1YyoTafPYEneeu5kmFU42CpuQBXuJy0RtaVAH7h3WsEkghj9XNR1GX3C7Ofo0wW3x4DU6tc7lGuFfq1+JhxNCRXr/B8w88XU0IfZ43YZfBAXbj2f4hJvYMrx02gCf9tIHz9gFWXMxO1aE34g2Uh9dIqPN9jUUb5Wcp7eEvACNwwALcm9HkM/KhFV2b93olUaOK3JLjEpGvpdZGI0TG2XUKGJTrXPJm7CaU8ee6TuWjeZXCOnx36WMGqOZlIz0WPGSur3qGxEhkei2zLU4lcEx3tyX47GH2gYJ3j3CuLyWxPX9CCllcadA0lPLMwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6900.namprd11.prod.outlook.com (2603:10b6:806:2a8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 19:00:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 19:00:51 +0000
Date: Wed, 14 May 2025 12:02:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 22/32] drm/xe/svm: Split system allocator vma incase
 of madvise call
Message-ID: <aCTouvgf70mFiGB6@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-23-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-23-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0048.namprd04.prod.outlook.com
 (2603:10b6:303:6a::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9b0820-f8c4-4c18-df90-08dd9319a523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JlZMWu60pZhWQlmUj0f6YABVfJ8LxnXm++sZwwVfjGasU5kUlq9mr43rZKoh?=
 =?us-ascii?Q?/x5RcejL37uB/dbwKV7uEd6Y1VPZywGDPOZH0ua2g54p5Zbt+txfxAkFSV+F?=
 =?us-ascii?Q?xKtAp954ZNAsUgZUscQ+iofpydkq3upUoehmwhp+3WIQmOk9JislKT8p8KbI?=
 =?us-ascii?Q?xRGyduLqDATqnx/Ty1pfR3Ftxb3ndWxI6nCoo4181sedkcaTDP3qXw7v93B+?=
 =?us-ascii?Q?bf82/fpb2HxvT8d6UBFpNmwdhYgCuwl4/XK59CSVHOmBCAY+SOQuwU3p67XD?=
 =?us-ascii?Q?IfnMzSiyPlqWi1IEtr5AEv9xlsuWA6wGKSBZ38/6l7BuQR1a5/jsTQ2IrgkF?=
 =?us-ascii?Q?1Ucqa1TAnbeKffGrz9SEIQa580TAkGKieTtbo3OXBmBRToH9PBO4a/x0l52I?=
 =?us-ascii?Q?oir3TyyARuhJGGckUy8CltB5W08Ej/XCHJdO2pstMvBq6RUuyNxmKY5aSpGn?=
 =?us-ascii?Q?qrpeNPcB5YNHI5vtzxOwEWt7eTO/9CsWkC5oTLMT7XfCN4393k//EX7n/wXR?=
 =?us-ascii?Q?5yMM0paFVR+5gfY26JOeIHNojd8dwOKayLsCeyBM8YBnL4gsf2AONjeuEViZ?=
 =?us-ascii?Q?0cYuNb/j1mAqyZwJ0CR12ZAnfKceIDggJ4yq4/AJ51sCL8ofSIT8mG/8EOiC?=
 =?us-ascii?Q?gOMypQd//EdvXtE04e5ffdV/mFbgElujZWV5/1kYOa3w9XSZIYdekKoVkQr2?=
 =?us-ascii?Q?NELUg+poZjzZjugjUB6tJWPbIK5LmX6gy2BNB7JTavy4S2R21zVd6HS1ak4A?=
 =?us-ascii?Q?kVBwze4BE8IG/rIRl40kbjysYnOzC9h+RZ+sdrhmDGQiYdjvMoaWjR3ORzuC?=
 =?us-ascii?Q?Avk83IZTilUAjAsXiwOkvotGoenwtvhIOMIOJOP6EktnfwGaTG52yiMtLJ1u?=
 =?us-ascii?Q?TFwIbWMGUvfNtA+9f7LpP2ZxUgicqNRn4EHukMbuo2lO/lktAKXDbKAuLCir?=
 =?us-ascii?Q?uyzPLobNRpoIfJs/tTMpOT1z5MicH1oxA3jIqd2Rk5pcsaCtEsJam8NFaEnc?=
 =?us-ascii?Q?QWYMCd7teI4PPu2AeildkF/SpF4XwPIQ8wbX1Wo7IfsSV1VWbs+8eNPh3GuE?=
 =?us-ascii?Q?crSAulMSPNMVTr068Pyc1FNOEq3tqv5U3Kwp54hWsXAwN2bGh2Ws9bDp1/S4?=
 =?us-ascii?Q?K8agdAJcEsEPB9zB27hnBL7wNdOaSdn0E4OphjIwGEo1YOrriuZpJAfCmx8n?=
 =?us-ascii?Q?Dh5NMvFBPqeArqDac+esn25M6KD/7ehaYF/KGID2ebB4xmtkMyf+WmLS3Y2I?=
 =?us-ascii?Q?ZVItNfm41DjCETK3uwLhe2vJ446hEm8bHS2TcmDvWpZUrv6hCWbDW/lGhQih?=
 =?us-ascii?Q?x71qe8Eb6G89JsUG6HXFIPuUnm4GXk+taAuxYBYNiZq+hCnAu6KvgxYJjA6o?=
 =?us-ascii?Q?oiA/UVTiT56/Yug2T0GLrcufZ77yG8OxJcQoe0p3nSACPbtvDESgje6tHJV6?=
 =?us-ascii?Q?JNZK2R3bA44=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vbaqtUzhaIpmwHwRdleyyuU1TgA3icq3rWH7X4othQCdjEBgnz9F0qN2Ij6z?=
 =?us-ascii?Q?OfcKsQa0Ha77gwsiFNxYAzruagWd1CFVOjH27tP7ilTG4a2no8dSEm3UT2bB?=
 =?us-ascii?Q?wc3VG8Xgv8tUzwFFwN1oqxIB2Ze56nN8q/41g8+e6Y9PaUpKv61VXPyO7sP/?=
 =?us-ascii?Q?/EFqpRV7goRGpUIwB2luk6elrwchMJhhBAVZa85+vZgmFGehcFdpVXKO9vRs?=
 =?us-ascii?Q?20oNBI5tEMdoGy2/CQbboHuYhQmg9L5FQNKX6ZXbb2ow4uU0GGs44sZYYODd?=
 =?us-ascii?Q?V+FqH6xjpHxiWkCuPWrJ6qXbAMBmy42DJr+GjdFwYc8qQsKRVlR+FJDL4sl+?=
 =?us-ascii?Q?gsMs0MI8o+FUHSF9PAv40PM0mB+OFS+2ZNQTkYDjLPzK91+xkXOTFYx0tFUt?=
 =?us-ascii?Q?3tohzKt1SsUR8ILCkzkee9jYIR7w/VCgSgWOR1gZ3ntukZHMWpuekmXiNfCB?=
 =?us-ascii?Q?6sUXuDyN0NSxYdHJDIkHDPog2qrMgSARY3H0EHXKU6ZCxthnMfOyB8SYUPpR?=
 =?us-ascii?Q?1Dk8QWSJ9PdN3JJTMRcn8cQPE9v/hAAbfT9AUj6p9y7UNkf22YYcfFv7T6ZW?=
 =?us-ascii?Q?Sm+/GqcHz4ICoWsEU4xZ7imQLQcBZQLXw4b4Ozz+KxcnRw25WeCYohoU7Lrs?=
 =?us-ascii?Q?IzLE5a7A79McqHcWoLmZKdWHeiHETWsgdv3mAxCGEnL776yeLXYa74Umji0I?=
 =?us-ascii?Q?Q2Ek50/J3x0tf4A5ia3+nXl7lJ9FOha4NnO02k1PffkIaNyuxtj1AIUiW79w?=
 =?us-ascii?Q?Sh4kkL89o5Hagjhqfyu/p1O5Ns/JmnfM1QIDhCHdYfa+vQMj+aWPwxHzaOvD?=
 =?us-ascii?Q?zNtS9mFgynXmdIwkcrK7sRBebVMRmJaPmlnBurwwzaFtcXleOWXEHVZVVTUM?=
 =?us-ascii?Q?8+BLvii+bw/lMY0j1MxT0ikve1rFNikXAVtNSLZ9wJ0u64jFBgCEaGn21yt6?=
 =?us-ascii?Q?Lo1jj9Liv2lPsVhDHmeNFj299PLx1FwfIgSc0PqGwIiPwZB0vPA/QW3kD8XX?=
 =?us-ascii?Q?1uYij/fqgibyLyncMws/0GbI4/kTJc1qnOblFRATNBJgg98MNwUTzWU8LVPQ?=
 =?us-ascii?Q?ZvOhCDtjeSBhViaVfk2FRhzaqrbMpG1Ojkp1q63dpSDZ0fU8zqu7Wk2p78hG?=
 =?us-ascii?Q?gvGsQIt2NCydSGiV4OtdhGPxMxyOaQIEs6ONK4sG3SNCpYRRR17VHyre6K4K?=
 =?us-ascii?Q?/nYGcJRqaPhuyNurngW+nlu8ttXLV5yPcdHwmQ+wEtDFQYqVANii7a+vbS5f?=
 =?us-ascii?Q?oVbiByYH65E9BLGEODNTdzhTwpdkOhaCM9xDhRibvDbYTBxjBsvrA1qsF3X5?=
 =?us-ascii?Q?vpH9N+v6SQaxRfAo20SutgldnTUA3Va4HMXqa4hBo5LiajIKg9MPwMDQGGT5?=
 =?us-ascii?Q?JCoUIcePCfMirTxqMRWjThfE3cmd31Orqbi2fN08HzSVlxdV9FioK18Y6Fbz?=
 =?us-ascii?Q?asVv/7nEH7Fd3mhbEO+xC2MpJ7GmS9/UuoQ+BqxHXAndihT/RzTJo8HKZrBH?=
 =?us-ascii?Q?gAHnwlQw8Eq1Bck5x62T4nvZ12E9xQjIP+3GucWBKoBNYOPEMa9bmPtGVwFT?=
 =?us-ascii?Q?SxoZa/pqxVAA+KtnFgDpq5ANpM6mDgNggih52RfFg2rIbU2PxO4VTWEh7j3A?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9b0820-f8c4-4c18-df90-08dd9319a523
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 19:00:51.2485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gpGSb+ntLA8O/VteXDAqjnI3G2LNKPrLqUzc0tD3MxCYMaKvSRUvOTg/ikWKi8Cot5kTpmK8oldpsEUwRhiAgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6900
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

On Mon, Apr 07, 2025 at 03:47:09PM +0530, Himal Prasad Ghimiray wrote:
> If the start or end of input address range lies within system allocator
> vma split the vma to create new vma's as per input range.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 84 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h |  2 +
>  2 files changed, 86 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6e5ba58d475e..c7c012afe9eb 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4127,3 +4127,87 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>  	}
>  	kvfree(snap);
>  }
> +

Kernel doc, missed this previous reply.

Matt

> +int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> +{
> +	struct xe_vma_ops vops;
> +	struct drm_gpuva_ops *ops = NULL;
> +	struct drm_gpuva_op *__op;
> +	bool is_cpu_addr_mirror = false;
> +	int err;
> +
> +	vm_dbg(&vm->xe->drm, "MADVISE IN: addr=0x%016llx, size=0x%016llx", start, range);
> +
> +	if (start & ~PAGE_MASK)
> +		start = ALIGN_DOWN(start, SZ_4K);
> +
> +	if (range & ~PAGE_MASK)
> +		range = ALIGN(range, SZ_4K);
> +
> +	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
> +	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, start, range,
> +					  DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE,
> +					  NULL, start);
> +	if (IS_ERR(ops)) {
> +		err = PTR_ERR(ops);
> +		goto unwind_ops;
> +	}
> +
> +	if (list_empty(&ops->list)) {
> +		err = 0;
> +		goto free_ops;
> +	}
> +
> +	drm_gpuva_for_each_op(__op, ops) {
> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +
> +		if (__op->op == DRM_GPUVA_OP_REMAP) {
> +			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
> +				is_cpu_addr_mirror = true;
> +			else
> +				is_cpu_addr_mirror = false;
> +		}
> +
> +		if (__op->op == DRM_GPUVA_OP_MAP)
> +			op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
> +
> +		print_op(vm->xe, __op);
> +	}
> +
> +	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
> +	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
> +	if (err)
> +		goto unwind_ops;
> +
> +	xe_vm_lock(vm, false);
> +
> +	drm_gpuva_for_each_op(__op, ops) {
> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +		struct xe_vma *vma;
> +		struct xe_vma_mem_attr temp_attr;
> +
> +		if (__op->op == DRM_GPUVA_OP_UNMAP) {
> +			/* There should be no unmap */
> +			xe_assert(vm->xe, true);
> +			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
> +		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
> +			vma = gpuva_to_vma(op->base.remap.unmap->va);
> +			cp_mem_attr(&temp_attr, &vma->attr);
> +			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
> +		} else if (__op->op == DRM_GPUVA_OP_MAP) {
> +			vma = op->map.vma;
> +			cp_mem_attr(&vma->attr, &temp_attr);
> +		}
> +	}
> +
> +	xe_vm_unlock(vm);
> +	drm_gpuva_ops_free(&vm->gpuvm, ops);
> +	return 0;
> +
> +unwind_ops:
> +	vm_bind_ioctl_ops_unwind(vm, &ops, 1);
> +free_ops:
> +	if (ops)
> +		drm_gpuva_ops_free(&vm->gpuvm, ops);
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 99e164852f63..4e45230b7205 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>  
>  struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
>  
> +int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
> +
>  /**
>   * to_userptr_vma() - Return a pointer to an embedding userptr vma
>   * @vma: Pointer to the embedded struct xe_vma
> -- 
> 2.34.1
> 
