Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1277BC3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 16:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CFF10E39B;
	Tue, 20 Aug 2024 16:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFy+Tg1F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0945A10E39B
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 16:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724170004; x=1755706004;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cF84b4YoWFBU1qWbybzubK0cg2AypIB7xSNV+lANG84=;
 b=CFy+Tg1FaDqZey6kwnIl3Lo5h3DIB1du3o32DYDrJNFLjHw8YPGXjF/N
 lC91DCjgqWw17lcvJy3+zw5z6eT6KppLyFGzAq2asxvUMm5t9WfispsO9
 mtcLZPRDB4zrXpG+DWTW1i4X25caVPgJrbmG307WbpKcZnrb0xmLyqMSG
 SWEtup2HBCY+ws/z73Zvt+qg5MFNVX0lJFckhQ2w8/g0ccA2jGumNcqRe
 thYZzPB3r7IVLav9ZYzovtstqhE5ol/Vn1ApT8f+8H3x4AO+quOglvAak
 BHI/2SSLmriLKt/UWHI1PIr/LJ6fpLqcpuy4AEADrxLMW1SQm4Hl152RJ A==;
X-CSE-ConnectionGUID: 6BbIRRpcSwePfOjgCEMXdA==
X-CSE-MsgGUID: qO0kwQSsQTaBwomUBUf4ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26235508"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="26235508"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 09:06:43 -0700
X-CSE-ConnectionGUID: Kdi8EnebQ2SsSm2VvIeUWQ==
X-CSE-MsgGUID: moGMBn95QouwRwBU9537PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65623606"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 09:06:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 09:06:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 09:06:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 09:06:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3bqI6ZiyPZgVv8xxG/Dj97Lg6btPZsUhf07h8HVmrFgkC8Y0P/xoOLPs7LiePeElGOs++l8Vw3P6jHTVn60VY64ZGZD+UadburkGjGMCMfgA09HUfzXIbncvLbwv1CW/QD67VqNp/buvprTNNm8t7wscXY1QSLZ2vCtfgE+oSbNMGJYH/hB+VyPojHOV9RL+0Zy1tD0UWCfygj1gJOnUF3ByqGavjSfTy1QWzzoQZzk1VwHJXu+rSN1GDttUrlI748uIgboNwSuljO+ypRAEyGzrTBcRpkv6p3DLelPNBgv8Zc/4elcV4SeybcuGNsBvsCFKteOmMf3hXKKhaVWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfocIdjG0zWpIKRAaAupI/9GIJ0knqvlYkacrKjoze8=;
 b=M1geRpofaGJ7y3L6jTM60S7ElBeg1mkEySxOj5Uox5zBHVFzE5A4M+RBwXkBgNY8YH03KlUFbALwlG+opJujHnOCw6LnMW3bqKSwi6tIXKjJcRgP8fmU1fQsHwtJOpcGJY7mldZn41zAHCg/52i+MTm8jBuAn8aF9cik6dJg+tp1RBcQuC+mGPDToCXWjNIf+546vwZl2DhgCNfivhZGN9H2n/m5h4J5azsTuvT7wl1+HxFnwlKkbg74YhwAs+2QDZ23c4kLhQ4erPYTjBR1/nAvbiek6XQXVlEsis2mv4Fv+rOj31O5whOt530vM3Edbk0e2x8aE+ubqth2KFGoSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB8004.namprd11.prod.outlook.com (2603:10b6:806:2f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Tue, 20 Aug
 2024 16:06:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Tue, 20 Aug 2024
 16:06:39 +0000
Date: Tue, 20 Aug 2024 16:05:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe: Remove unrequired NULL checks in
 xe_sync_entry_cleanup
Message-ID: <ZsS+wFvsoNhtFkXO@DUT025-TGLU.fm.intel.com>
References: <20240820090230.3258128-1-himal.prasad.ghimiray@intel.com>
 <20240820090230.3258128-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240820090230.3258128-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR01CA0051.prod.exchangelabs.com (2603:10b6:a03:94::28)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB8004:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a4b4fc4-f070-41ee-988e-08dcc13212dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YtD3hgmiwpf2VVD11CQ9lk7luCT1y/ytsSyatqZdxgnK2b48vJVcPM3uaDll?=
 =?us-ascii?Q?wjDlg552KftuHyuy1PyZKbpQmB+DUl2kxTrfFjtnmFrzic3/jJtATMNe9wkP?=
 =?us-ascii?Q?eX9/b10BiD8YgH9xR8u6CMxomnjNpaf14A5j8qf4GkrcPJFK2NtV+fqhSP+C?=
 =?us-ascii?Q?kun4R3KFAPD+Q9sKUXOu8NjbIWYI6Oq2cmeNq/Fea9Vnw4xh5BUA/h7fuQ77?=
 =?us-ascii?Q?OMA2BNgkyk6/0CtRC3+DxBRY6fL0P3x0C7IBaUWNL2w/bVvg8LpLilV3VLuL?=
 =?us-ascii?Q?VwHcg4Xc+KOCgQ+NSdlTEIgkbNPBSWD0UlJPSHdlK5BE84fWcoAKRPRRN6J4?=
 =?us-ascii?Q?TRr6hfuCaXUf3ePMqGYl7ufV57K4hDNip0D0SSuGqKN/lFWyJQjOnQkjHvZk?=
 =?us-ascii?Q?rij8bhB+hfX9Jv4eCiTw4TwRN5Do3GSrwpbPP+k2nuMkEvKTH+SCy/H0vrJj?=
 =?us-ascii?Q?T1RGKs6xYV7WBYMZRGUbZ/nhcpNQft/mdiIfKmCkQvahaa4BmxI86ajhQhPf?=
 =?us-ascii?Q?qrqbb4sDx5SqKZ9gBMOPC+SRC7IybLZHY84TkJJdpLTgqwoRorzCohqXC5fF?=
 =?us-ascii?Q?q5dDMSZDZVLaAlYpK2Yo5ZmmeU/2G+zm/GH/zuEu71X1c26piOxCHjBcuSe9?=
 =?us-ascii?Q?zwiLit1gI1PkADpdwndCrvYmBgxnq4RV0jTsQ9J4oQ40m91o+uZ88if5vhJ4?=
 =?us-ascii?Q?LzAVIjSds6eByVl0zbprVkIE3d/KSJBS3199j2tfTyApIQRiFNvF2R3rtIsS?=
 =?us-ascii?Q?vkLBqa3DChhg/WZlZDLXVUFku5QHkF2bkWKDDhTUpfoWiCa13O8GspHZkGZ4?=
 =?us-ascii?Q?j4HidBh/nGsebFKgAwZSZuPCUp+e/ZJ1+o4/BM9nSSsne398t8Jq64U3Iwcy?=
 =?us-ascii?Q?mzgj9lO+pXyIbJpHewTG4YjtGlgKhVD3xXpj4jpwEikNKmTun27o36pd1pF7?=
 =?us-ascii?Q?Ww6GrvvjnnptxfdVvPsV1UVv1RDDcI8MWnp+38IFQyd9G3PoogTfpiC6/82C?=
 =?us-ascii?Q?EcSJwGb+2AJwRAfGhg88alqYFEm6Y6Jqx8C4gyW5cSj38SPLgljeH14iCz38?=
 =?us-ascii?Q?SxsYYDoZ51OMcCve3VE874hJmBUliAA4QiVARyeMlknNGqKcBe2I7+LBzKP0?=
 =?us-ascii?Q?FZRzCuNjSG+HNfviUZVquvnmrbT6Ujr0tjwXd4EkPsdzG+7lFYHGaeA2Un1o?=
 =?us-ascii?Q?PlZUyCP0gHTjhEMvAk21ZBYFMdyo+PjWf47XHiG0L+22tZRHmNeLgUpq1Sat?=
 =?us-ascii?Q?Kx79gMSmaF8wZpJ/hyBHfg9Q2lsPSJ/1iDnq8i5E2MKLxKfdmjJjQ7z3FsNG?=
 =?us-ascii?Q?cveEz/HEgbrWEMsKEDE9IPgtoylhKOeLy9JT7RitplAq2w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dAt+ikdr49JA/GS1JfOcvcOPelpA0zhC3fIGwRNpQtAymHaHTLwXdygx8olR?=
 =?us-ascii?Q?1hjvTR0d83ghZDogciPCAJtYqBQropOa5UQPjqVZ0zt9bk1NJCEmvkdV+NYe?=
 =?us-ascii?Q?BZwkq+eTm/E+uWaiF6cBjN0jt/4BKBZXlX8VWi7kb5inp86QlZpHDGgSjx1m?=
 =?us-ascii?Q?5EP2fFf0ZLz1CPeldP0pam7z/DfLyxK9WwOyzu+opH+MgdAniAaUB8CCkr3L?=
 =?us-ascii?Q?MO/LfFEXxEeOaBRVCCxYtVappkXpHbteF4OPnIPgvuEVyU7xjz+qNg/T/EQI?=
 =?us-ascii?Q?0LxAybAAO0kH716LV58lcyhxFYpVPD4lOpHHlVRx55tEqNpOKak5V61o5mla?=
 =?us-ascii?Q?/eY+1W3yqePvQ02b+ddglhs5Te7OLh3xHcy6ZwtIxEJ62HTmIRpxrMZFRoKa?=
 =?us-ascii?Q?mXVqnQBRGTxkg8I+UmF2MZzhT8urev1xWF91d1rMCO0Oj2omJ2KUgP4iGqyv?=
 =?us-ascii?Q?uMZx1ds6i+AnY4wNkj1eN2QCRzpyo8MuCudvUtSySgXiAi6T5sWtJFkve2sw?=
 =?us-ascii?Q?yfbX+S3Qrfeg89MWpFfmGdp2644l1PuihEVpkK427mw5sJVERSZQO5RbbZ6L?=
 =?us-ascii?Q?ODx8LjzqsDGGdknEiwvLC2t8Dsn9B5dyGNSzVdJEQZgKE/TLWeSFAX3pGpwm?=
 =?us-ascii?Q?2y4g1UbP37rxFB55j/f8BfhjphlWTMN6yNVuAz/i2T1FWYOWXCYe1Kz5JEtz?=
 =?us-ascii?Q?gWDc4wMdQ3xRchg22ghVw47rnTbfTZwbP8PlW+ydfRyl8PiXfL3RmQAHS6AS?=
 =?us-ascii?Q?uSs8uPUJqNLRyza+s0D2BDXA5zJhqy+7x+b8JC+1270FgbVTMQEdpa/IxRfd?=
 =?us-ascii?Q?TShZeJwfmlE/DNLcDr1pn+Cs8ycLfuQLDSWnXmG2RdwD2jwgd2AMYKW7sYnM?=
 =?us-ascii?Q?Rl3nXpgjRLtxu17vC4HwBNHO8A3MLFDtIjS/eYfI4yzGNC+4T+Yo+VJbbtws?=
 =?us-ascii?Q?UGHdVl1M7kv3bGj5ikTe1EeUBIjudBAn600lE5/EceZXLwdB7UBjirvGXesb?=
 =?us-ascii?Q?YTtKiW+43nk4p1q5IGJB6792Mju2src08yoNFH9UNvsr4N/9zelCYYoPcHgf?=
 =?us-ascii?Q?rj3vszoG9l8iGxRWm5BtuyAisdM5YiwEyNBjYL6IsccSdrqFFFT6GFcmP/bG?=
 =?us-ascii?Q?fVSZXNtxbZ/Is1R/dVckVCGS7D7CckE3YaIj5PyiUuPcBhJ0KfObS8L4YZQB?=
 =?us-ascii?Q?cfCWFV4LoqoEsRP4tetwP2Rl/RN53EzwW2prIz6PJCtK1rwTlLpPm6oEOPwU?=
 =?us-ascii?Q?4EgWNkRtUYsbwz/STT7bCCfbdgBT+WUEY6HyWXsuWJfaUJBmlTGY1O69zzp0?=
 =?us-ascii?Q?S7vj5mz8M+Ul7uwlov80Npok0CA6C1RXSAwb6YbmCXZJnqy74taf1OA+Y98k?=
 =?us-ascii?Q?imA8qi4F9L4hTYa5wghlI4EZc7PFOQP6sRV8TM5J8ALZ28OCaGQYyCAayQsb?=
 =?us-ascii?Q?CYBZA+FAZwIf3OzdNe2MoZM4+BBiA+7yxmqhV7Mvbi7oif7EiUxBdi3G1QxI?=
 =?us-ascii?Q?H3JiabWNRZJYEtIXzmc7TmBWfrapc3Elpp82PJFdggHjMfKSk7FviiTeqphK?=
 =?us-ascii?Q?WSSUcvRu6t+6a9rg7jfpGqkFCNQAy70KB9sXYqrBTc5+UjBMLs8vb1Lmiuh8?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a4b4fc4-f070-41ee-988e-08dcc13212dc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 16:06:38.9634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wJhUYoyGjivB2yN1Dw2i5x2FK1bcJ1skbkjrn0dAloWBSNOi1o+0ayrnSM94QpQ7R1kXYykKbEmEiKYs4Wb3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8004
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

On Tue, Aug 20, 2024 at 02:32:29PM +0530, Himal Prasad Ghimiray wrote:
> dma_fence_put() and dma_fence_chain_free() can handle NULL input,
> there is no need for NULL check by caller.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sync.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index a0675f57a398..436faff09bac 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -249,10 +249,8 @@ void xe_sync_entry_cleanup(struct xe_sync_entry *sync)
>  {
>  	if (sync->syncobj)
>  		drm_syncobj_put(sync->syncobj);
> -	if (sync->fence)
> -		dma_fence_put(sync->fence);
> -	if (sync->chain_fence)
> -		dma_fence_chain_free(sync->chain_fence);
> +	dma_fence_put(sync->fence);
> +	dma_fence_chain_free(sync->chain_fence);
>  	if (sync->ufence)
>  		user_fence_put(sync->ufence);
>  }
> -- 
> 2.34.1
> 
