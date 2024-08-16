Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C983C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 15:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0403010E7ED;
	Fri, 16 Aug 2024 15:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GbTLaAOH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECE310E7ED
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 15:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723820838; x=1755356838;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NVKVSNA2cG79QJLi2PU8Czxu9iYaoO/JrNxkjRdKwcI=;
 b=GbTLaAOHxQ8D3PGYJncQQDYdXJQ2bnameXwGit4STkigvLS8t1mC6zjQ
 4tVK7yjzGUworcDRTT3QL1yOpyegsSA+q3xyebQDefbUxoIbQUg15bctx
 kiHr8eqExw4fdHRBRG3jLj5SYhOUUQQn05/QNXGhfhXNRyjXvrced7orq
 HNQBdazTOXmNLLv4Hw0qP3hpJcBRPjKarnH2ObJhP295k03U20Ympj0Ki
 8yn+5uQxb+oTr5IdAxpPz9nzQwOJq07tIjz4/DJYg8VgQ1xbMP8GKJCwz
 L12fpKwA810niaYu8Tp4Bm53h6pjMLvBaZHdjn2yQjM/Osme8GEHsYDID g==;
X-CSE-ConnectionGUID: pdXc4qeeQBynLnDBzKrkmw==
X-CSE-MsgGUID: e2SgLydGQLmnpJsl2wx9JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33505674"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="33505674"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 08:07:17 -0700
X-CSE-ConnectionGUID: cZH39CvfR0aw88Ib1fnUFw==
X-CSE-MsgGUID: X2R1UvWKTWC8usQs4JJHrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59539931"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 08:07:17 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:07:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 08:07:16 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 08:07:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0qg4hl7boppSVR3Qy+kQ5FN0AK8E10GO0JaMkBGrMqkx/wQVik/o+RcTcrEPzwiTCpNtiQyu7P8wKAIOu1AkErylLq5V0duQdRimLIEOv904me6ppjt2zgPlnckn0IS+QIoP1GALd0ZbliG+tBZ4THpA2Ok0uS76lPCjoqXoM3bwuKjvU2K+BJzK765sScaqeQAb+I6YXtxPIAnsWKMz0jjLoHhkNiFDChmBNRgKjqplrpJ75JzwRg9uulPlCW7p1dj8Nmi8CMO3sAYkMbbLmN+02EOVDvQjmluKQxYq6DwdOVqtYmloOJZNxOXquj22JZzxv7f9zwtiLijjEZP1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9cc/9UXl+bXFhviwf7YbtqwrLBgQObjpu/O6/5umhY=;
 b=BGeSkpFgdHi5KJ8mHJdzLzzDSbeUO8LGNTESKNlKkN78HzvCjGk4miIP4dZJSnUV6YW7dfu6fDRFIrAzkQScXf8e38qSQlk9nCld5zAPTwYpSe/A2bypaK8vNCYvSO6fSiLs2YUffVHqgvc/uYV2BsWSheknzq7jfg48zzAZNw0GzhpGDTsdY7Bh353qMQ5/fsGusCnuNFkMjmz7IGP4OZWCsajrTrTS8iFA7X00NXC7MQaK9j1Nxr4my0vgrL+CFzwHbvGSiDxQdwehH3qW31zHrOKwP36Vwqlyvgpt5wzyRzAii6Apn7ysCRNSLg+cc3xRnW2l82ul2+gMJK5PGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6743.namprd11.prod.outlook.com (2603:10b6:a03:47c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Fri, 16 Aug
 2024 15:07:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Fri, 16 Aug 2024
 15:07:12 +0000
Date: Fri, 16 Aug 2024 10:07:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jose.souza@intel.com>, "Himal Prasad
 Ghimiray" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 01/12] drm/xe: Removed unused xe_ggtt_printk
Message-ID: <jlvmqqbjfwt2chrvktj5l5alwvben5wp56i6uqw5vizuu7e6sh@blnpfhcxwfqs>
References: <20240816150243.87596-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240816150243.87596-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4PR03CA0258.namprd03.prod.outlook.com
 (2603:10b6:303:b4::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: 3832f64e-ea1e-4213-cf44-08dcbe051b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UBNC0GPCKepUGrfQww1nYIhIPsiIDTXJDaA+njp8Dnfi7mASNWP4HzJB5DAQ?=
 =?us-ascii?Q?dXrFo5jZHkYDZ0Gp7zkaYCoNVYAITZLMfvRjMqxWqpTpdXAucSleisVgfr7M?=
 =?us-ascii?Q?yr1N6L3DMtfx3Dvm5mln9LtExOul4RKz9ypKkdNpoqq4Med+feCyGZa2H06Q?=
 =?us-ascii?Q?QwWp7XTET+EuHYQ2FeJXbXKi7E2yBQ/OH5BDnIw46Ghnr/XPMPaiCkjIAWKe?=
 =?us-ascii?Q?XXMvyA4NoZLDrTrSEgHmGaWEc0fmZWwdjOe0QEJ9coPX3HNgXkJm0ktaUJ/p?=
 =?us-ascii?Q?Cne+aOwNNOzPeQ8n90doZitwWxRG1b4GP4QFXjJFdDDoUDTYjVTtDIUM41id?=
 =?us-ascii?Q?NMFyqp3uLJJKY4rg09NWn7yefaRus+tyBeg/SljJBkibB8lgFyWhXSQL3B2c?=
 =?us-ascii?Q?sh1lNozP6HlfjJxMChRP2PUd7E1Y5RUCYrcw5awspWe4ZtATHBxghJZkC3OG?=
 =?us-ascii?Q?wDUQGGj81fgZKpSM56bWIw5bi77gl6Z6pf/whBVFtp/75eA/N13AEJQlWs3U?=
 =?us-ascii?Q?Re1qwEfFFaM45WIhPgDr8EbjagNkZXjgh+2vEbA+EKe3EbupEiPe3cczuEyS?=
 =?us-ascii?Q?4o0UATd/YCmKG0DX4AYWEe5rRqGT/dKvbUNpoiSkNII3uxcimmXZ2Adi/qwM?=
 =?us-ascii?Q?q41L41RA2u2veDT+7QdrPv9VEUrieqjv5XxgFsLwJ/dd9cXLV/Wkespch81f?=
 =?us-ascii?Q?PpXuSjlowtL8ZrPIvfJrZvHK5EsWbMHTY5qTolbHNyIxdD8IYajtfWQ8d1b3?=
 =?us-ascii?Q?aySzcVqcdmTDwTGaOKwCTDNCxnHZ5WiZ63Rlu+WFc4S0S/2nwj+Fs/8O1gDi?=
 =?us-ascii?Q?Ipk/lQ4vm/BsGnYCdCd5QGzV0u1EP5ikMeEO//BcwY5Yu4yRpuQDzt7wH7EC?=
 =?us-ascii?Q?5+cXoVp4M+ME31+p91Wc9P+vl4xqUXfhzOt8JztTMEwoEt7Ou5VcrtcAEYlD?=
 =?us-ascii?Q?dHjn98OEP0d3k2TYdYaC35TgO5et5Xd45Uaph5ULgf+HZlMkoiG4aQMEsdBR?=
 =?us-ascii?Q?c8xpdLOQRt8cS815ye9liHwhSU2WtHE+zDLjVS3+697k+1hmkTt650RFMceA?=
 =?us-ascii?Q?+a1VB5MSE7G6ckauHROc5U094c7EJfNC3kd9TeDvTwIVAhf1A5ckU272ZdeO?=
 =?us-ascii?Q?K1cIOZkhTMUcPIUvcscxXmYoB8y97ctqeZblD1wflShRTERpZjWKHNpRpohR?=
 =?us-ascii?Q?psjYXhUex/ppeaKLiiOWSpLXLgKfRXFRMWrwCurUMMi1EFbOfymk15d9gwUK?=
 =?us-ascii?Q?gAgq+FVItcHkXBUep71gGP7eAp2nT1ev/EqrIARsDwH3XOaZkOWFV55vk9OB?=
 =?us-ascii?Q?DSy+jMoJVi7Me/4TqdU/jKhN7db6YIPQ1zaRWMobljMsKdS4XEetiP3yZpH7?=
 =?us-ascii?Q?wuFdKGIFpBcFkZqLZsj4+ZacfzSU5lx48EClGBRjow4mT0CqbA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aIoNvsechhlKCkBKfMNF4hrustqYOJL8cvmrkZrP5GP153smtcQNwu+XVQrQ?=
 =?us-ascii?Q?isc9eI8n1121Eitsc0G5w102LmDpnznAYesvntzBKGYfUCgUkCgi9LkOHoAB?=
 =?us-ascii?Q?ry+j8CwHr3L6iJ368/sccgr2ds4Ps8EQ5XfhmqOzsbDXae3NR/ucgSRK5k/V?=
 =?us-ascii?Q?ODSEiy/YIFe4BOnFSTXbfgzxbdXIRTPAWIw2ooRjDG6yMgsfLCRp6wFpPtKQ?=
 =?us-ascii?Q?Va0iNYzBTATS9uupfuO1fHe4zbqtB/Cp4AZe0ifXChUVjoeDtzzohKeOWiLQ?=
 =?us-ascii?Q?XRtXXsMGzH79HHwsCdTTOwEuQBqTogBHIXXVQrkCYSroTryZUX5J63XKR+cg?=
 =?us-ascii?Q?6n00SoTh32dGsTwDjMW0hAZAzQazDIbx40BeF5c+czQOgbdsEKXTaTV6uWi4?=
 =?us-ascii?Q?sqTvPP7v1Ns63OTwnQQSkTg2lFDeotHRefy2yhKIuMSqd8veAKAbYYFK3XxP?=
 =?us-ascii?Q?fByrXhCBMUlwLMumtqoGh6BIzblyqx3SM6XP0HymF1ldTl0Amgi2JqbZlUeG?=
 =?us-ascii?Q?NCHFcpb7BMqqgISGYEJW72Uqt8ViamgZ8QZHjz0taYU1w6tU6pRUCf4/jRvH?=
 =?us-ascii?Q?DGxuF4e9vGhbqnaqDa2VPmLZyTYMZpNHc/Jz/PX0V2vuTKY3vJf7kdx2r/Pl?=
 =?us-ascii?Q?m56DN1u8oHVQZiDHQBQzrOzxpbS4AF1MkxhqvZ2GOJaRYioImiBmpfMhu45O?=
 =?us-ascii?Q?UFGilSQpzvaqF3xVhFcXwPDY/EB23Q+1PvovhwlfKs5P8uUQfWTEydboonxm?=
 =?us-ascii?Q?Gz2uRkWz4DBByrvJBvB0k6/rLwDFdkKpORhBQuXOrrMIwwfH4HU8GNLp0ZEn?=
 =?us-ascii?Q?Z1yCMhew581YXLcRLsRn6c3tsWNW2PiZwLzK2J1+aG1/mlN5JdO4EpwZW+Fd?=
 =?us-ascii?Q?ga6RCZgplGulQwv9DEYjQ5yACyDqZfn4SdOtFdRIMhXIBuxyyAZiG9zLfG5J?=
 =?us-ascii?Q?3s7+/KXujuxwF/lPBqKC2/vbfiY2pon/oj88UWb+VcST7SbTXoV84XcLFOLc?=
 =?us-ascii?Q?pv7OfszjySCtLspdmdk1VK+m7gRiX5RqQcQqGhUwV7bqfyYNYDq+Px/F3BBg?=
 =?us-ascii?Q?y6SwKhQUzJndv/5L2fSRrgAa15Whj8q9LeeaCBwthoDxYEq/NJ0HtFnNrbbL?=
 =?us-ascii?Q?2F52tNwkJJ1ezVTdJ2VePV7gCe8sa2OAxsbtNRLAgSs8NqLCIwH8yNrjFjxM?=
 =?us-ascii?Q?IfWK45hGdg/zTHljTWMR6AdPH8JcGwOguiYlRHqGreYjY2bIibg6Tu3V6lsX?=
 =?us-ascii?Q?QpSKD5WzSUHCv0E7HwSCNglz6JUjN6/nm7wrG51zH706ccdoQJOwddByoooi?=
 =?us-ascii?Q?ydpyfpnKuxuuhTMeUVVanO8/DMThlRxDsyXF289Ud/+M0hPjmPpDhcRhvjCd?=
 =?us-ascii?Q?qeEkI0OaacyAHrqCCDtSmdZ4ctOQpAFGoiwgv+IS4oijimuwy8vUoyFM1+T6?=
 =?us-ascii?Q?fzkde0SuoZRTp4PIELUL2RvnORDHxQTkkRiVyw8OlLAdILtMzUcw2CMU8ty7?=
 =?us-ascii?Q?PhgKLsxvb9CAPcS6wPO2N1Q/wxff4lPLBrA5xH3qpxp7LciloRM7WDSStykh?=
 =?us-ascii?Q?XmNkr2JJs2uRKVzSPAAqpwWOpLTSFgB+ryKg2jHe7pRsi4LGmWCgBGO+HmbI?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3832f64e-ea1e-4213-cf44-08dcbe051b23
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 15:07:12.2500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+8KCVZVQ+fdx7lj2U/BOKoLnISe0ZJy+DiF2QPFbZLvcxjwWYw8CnrwJfvdYn3x6v3chuNa2gWcXdouXSWx3bVNsXYEfWQJlJGuTTo4K7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6743
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

On Fri, Aug 16, 2024 at 11:02:32AM GMT, Rodrigo Vivi wrote:
>Apparently this was only useful when enabling ggtt support
>for the very first time and never used again.
>It is also not useful now that we have the ggtt_dump available
>through debugfs.
>
>Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_ggtt.c | 20 --------------------
> drivers/gpu/drm/xe/xe_ggtt.h |  1 -
> 2 files changed, 21 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 0cdbc1296e88..add14f3dea1f 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -314,26 +314,6 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
> 	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
> }
>
>-void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
>-{
>-	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
>-	u64 addr, scratch_pte;
>-
>-	scratch_pte = ggtt->pt_ops->pte_encode_bo(ggtt->scratch, 0, pat_index);
>-
>-	printk("%sGlobal GTT:", prefix);
>-	for (addr = 0; addr < ggtt->size; addr += XE_PAGE_SIZE) {
>-		unsigned int i = addr / XE_PAGE_SIZE;
>-
>-		xe_tile_assert(ggtt->tile, addr <= U32_MAX);
>-		if (ggtt->gsm[i] == scratch_pte)
>-			continue;
>-
>-		printk("%s    ggtt[0x%08x] = 0x%016llx",
>-		       prefix, (u32)addr, ggtt->gsm[i]);
>-	}
>-}
>-
> static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
> 			      const struct drm_mm_node *node, const char *description)
> {
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>index 6a96fd54bf60..2546bab97507 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.h
>+++ b/drivers/gpu/drm/xe/xe_ggtt.h
>@@ -12,7 +12,6 @@ struct drm_printer;
>
> int xe_ggtt_init_early(struct xe_ggtt *ggtt);
> int xe_ggtt_init(struct xe_ggtt *ggtt);
>-void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
>
> int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct drm_mm_node *node);
> void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node);
>-- 
>2.46.0
>
