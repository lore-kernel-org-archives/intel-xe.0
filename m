Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB12C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 22:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AD610E8F3;
	Tue, 16 Jul 2024 22:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMIR9n5f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7070E10E8F3
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 22:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721167430; x=1752703430;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zSGPQBY3bMJK/dETapUs0vws6ieevJM9bD0ZD2FW4D0=;
 b=dMIR9n5fbTSwcfwDquROuIy60YF4DC1bLMv/2E1RgHpdkKRiWBBauFAe
 seAjldz6CJRCDvga9TJQhpix7u0ejLK0niZeLMzssdnCZbx6UP3DMtpi8
 0+CPkrWrgrDIqod5COvmyB0RzVH61V+kz30KlCVsf5wM3Dmi0OgrMBDsm
 RfaggISUQRxn0kfAiJZKHZReh7p7q8xHWrXAhEIsCVh77Hm5n5ug93cdl
 Nh27GIDL7K94XqFpDkXA0sb1UmhZoZpCvBMv90Lt4IrVN0LUTuMc9vFDd
 FaGJV/ovlWyjbW7pYEOQhphcrRFVdIKtbs4ohEnhBUZriPF+Fusvb5Bwx Q==;
X-CSE-ConnectionGUID: 9ivNUWImT8+Vdu9x2eprSQ==
X-CSE-MsgGUID: KsgcJdLmR6y/BM1E7hnMxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18451359"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="18451359"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 15:03:49 -0700
X-CSE-ConnectionGUID: Cx8xbO0CSQ+0lCcYDBkJEw==
X-CSE-MsgGUID: +oMALSl1SV208EX4N/Ij8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="54385633"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 15:03:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 15:03:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 15:03:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 15:03:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rcCGcQvpnHeG3x7drL4ACbUw3uMtVXWlYVIweZmCHPuh7cCEzwgEEG6TAmr7Uh0Lrr17qBC6Am04HD3IR0mFUeJ2uJemr/2nCoCHNnVRyT6Nnyt9VTibi1j73KaRqjvsi0HQf0xSs+3xSKGuIsRYlcjuHEYNpU2BI0rq1CsWhhMPhz4CB7JJecmJUkMGCVLIqvso6Fqavky6CHZ7TpNu2N0FrCWloYUo29s4x4lPyE/seMMcqKo4wCRpC0mox9b8ATVRMbNeA28SA4M316UjKKsk4tjYEgMFiXPeKuMwGNTEUj7eq9tobN3lerBtwjfMYVFs20W0Iz2Ut9lo+/LisQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTSgMaa1GHO1zbTPWWFunmO6yJvWUZifXVKnH0zyFIE=;
 b=AzyIQmH4DsdcGxOSlZDNDmzMgADsfiznbHVb9u9e+adh8y/c9WFqh1TMkicJFzD0YiOAtp112JLLwTq2mnmsqaRlujeM8mgVQUYLfcoeH8TMMfmcMCtEbMxjkOkxHSTY7Fr4LHQsvSfZQaBhvqKmX3fjtD7s8lFAXCRU+TMnIlpv2iJn1m4GtrItMDhYwvRS9yoDeRkx716b8wzVMqmTYaW5n6k8tDbiLzPihSkJZdvASVZovfn1iElPuOF8A8sfWrnneblKD9mLSS5nIz6T/qu4xiGfd7KSmohjGsIrKKL/RcJeBrUdmWh/88dFUR7lopZRxPXgOfl0nfQCupjQsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5271.namprd11.prod.outlook.com (2603:10b6:208:31a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.15; Tue, 16 Jul
 2024 22:03:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.013; Tue, 16 Jul 2024
 22:03:45 +0000
Date: Tue, 16 Jul 2024 17:03:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Koby Elbaz <kelbaz@habana.ai>, Moti Haimovski <mhaimovski@habana.ai>
Subject: Re: [PATCH] drm/xe: Refactor mmio setup for multi-tile
Message-ID: <qg5oxgencv5gtmzzbt3s3tcx6765dnun6524adgutbdmukfnth@ickveqdtm4ev>
References: <20240716195608.2819428-1-lucas.demarchi@intel.com>
 <145dbe6d-4493-4f2d-b723-f575c68109a1@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <145dbe6d-4493-4f2d-b723-f575c68109a1@intel.com>
X-ClientProxiedBy: MW4PR04CA0039.namprd04.prod.outlook.com
 (2603:10b6:303:6a::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5271:EE_
X-MS-Office365-Filtering-Correlation-Id: 087d208d-460c-49b5-abda-08dca5e3299b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5h7RJHuYxTg2hx4o+EGqHw8oMfw1A/HpwiwJH88ocZ4pbmwAkhbRhyvMu/eu?=
 =?us-ascii?Q?q7AFkMp1g+NGYEC5/hlIplEfMbkwxUjgx1gcXnSNN5WPTVQ6mjUvgM70LeQw?=
 =?us-ascii?Q?HOSWQFqLiC22rbYuG+WcvKRa/WXnPoNDPv0Ki7/kl2lPS0vNIjnvqlNexrky?=
 =?us-ascii?Q?nUS81aEJiQ23eMcyF4Ol12yDy6es4cqYqfqlVV2tYs0Vkzsua5hTcTeqdz9f?=
 =?us-ascii?Q?eHnDA9LQqhz99UJk0DC0CjDRWui7IDMrO6ER7C4KJx/7NyP3nBsxwd5VSqiN?=
 =?us-ascii?Q?fUmd4YTENEEyeG/uaI33Bdi2Czr9qsY6H7wdx3+Ttug5hT/lViOSSNqIPhf3?=
 =?us-ascii?Q?f7GsTCmuqIeH7h/bsPQwjuxZ1gDi2YGsiAhXmKfOo0VcL1AuxUX4BZahUsdo?=
 =?us-ascii?Q?ljEzC8bmpdZO+f5zeL3/ZCb661hPiwKQL1amcb6bW8VIaEi8w7hOJDHmGvP6?=
 =?us-ascii?Q?R/SIewEimSXwW1uMh4maWeeG46uqt6UL1lytN1Wbi0yTfHVMqMeBVz9tBK8b?=
 =?us-ascii?Q?AuIlVJ20fYpu0gDOn1Q469Bi9D36iGzI9iwcnNF2BImKuUlSSG9c5gHyNBn9?=
 =?us-ascii?Q?9XbHnbLSjn4O3NZjkQ7O7lYz1f2DiRkNbDgYsFem024LkhJpz0ugdRTJJn+R?=
 =?us-ascii?Q?WbZqqzBB4MTDs2Ay62a/Jmr6po14QXBFTK5zNGN3hxzOkqSHJvLGLofwNecM?=
 =?us-ascii?Q?S7rY+de9xLtzQ0lRxLoNb5sYbCS+qf/BJyqYyZmNwuikKstFCbRnqLCo/GlS?=
 =?us-ascii?Q?utDMt4VjV2Vgyh2V8YaF2XSa9bcOZZ204Bpav05cOzR9KBbWRw8/4FSUcC9n?=
 =?us-ascii?Q?LkbMPRz3LJhRFHXM87Fls1kOe6zJ0p71vdxRx3xS1ksUBcn9w2uuKoBffEyM?=
 =?us-ascii?Q?lgiTZR1icRcXALcn+hWRAzuTu7NFY3yftGLCDAuWNmyQbdP7EzcwPlgxOyJ0?=
 =?us-ascii?Q?rQFBUwOV49y8RpoAKVELhcFFyXidN+K0Kgz3LHY2euoKyjkN6qrFyd0x3gx7?=
 =?us-ascii?Q?/YqGZfADWPkh013Qu619J43PzDGL3rfqjd22iPTmHW5V3MeXdrTQsJQsmkAU?=
 =?us-ascii?Q?ryxUz8/OikQFrcziP7cOGv4RKCfl5yklVDD2nkaw+skpIpBNKevw6Nd0lWpA?=
 =?us-ascii?Q?nCX9CXskSwAYiJL+dgDI4DhhI415sRKuUcW6Q1dy1yBRELBQlBGuRMJydL01?=
 =?us-ascii?Q?+KcynsfjESYDT9qXvX2FxgWdLxQw3qXsPmmG2REHqnKvW3r0jii+/2Et6Hpt?=
 =?us-ascii?Q?xMzeaPYgXRkFowMcvSlSfk8doKd7g7arTvTZfkUj9hAD+0N82ktLUvlOub6q?=
 =?us-ascii?Q?KQkSR2sZgQrC7LAJqZgt75Pvx+kbKR5RabJGIty1fLQ2Dw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tiw/nc/6wZj7vijT8KhLfXYeDxkP2HlClrH/ucsBBL1ZR2bbSFSfJhIs+5E7?=
 =?us-ascii?Q?G0zQhw3p2w1s45Wn8nF9UDBsk3YL4E8WWSBCaIWuvIoGURUMHsHqcGK9TC2z?=
 =?us-ascii?Q?X0+mVFrcMeVCeq6zCbb+Quxfs7dyjmC34Nzj3tuh+OS0a9+5UJMsUh67I9Q0?=
 =?us-ascii?Q?RbEL6bPy50lC41V7+NaALRtFn9VrJyBVKef9wROrTxlTyyvK4p5BBSdKx8yw?=
 =?us-ascii?Q?xyo/eKYYIKeA8TrDuHn/zHJduB5pPWDWe/Q6ABUrB33aFl5IpinZF1eO3dYk?=
 =?us-ascii?Q?oJGCd2SqUekKAIEBcox2Juzv2oGTHwGCk+qNCDBkvGRkkZ/+PuNikpGuflpL?=
 =?us-ascii?Q?mFGmQF6OGmqEgAcskAgE8jnaVxVAYmTt1KIYeN6sIM9Ht0louB/v1QysCGcv?=
 =?us-ascii?Q?Occk4FkgVQwvIsZV39IxvRNcMg0IPjWvCieoePHdTwmPue8Qfq4PvLmHi0dX?=
 =?us-ascii?Q?9zYKVGqpGI/sQTaIfFHXfFX/o4p1LW43naHv9UiQofeGkPzs6cyEvQzN7R6z?=
 =?us-ascii?Q?JEC5d+pUD0Mb97eGKV2vAXP+P6B0yOdzm2XcEhpehWRUgGfujE6XnlJHmrxh?=
 =?us-ascii?Q?0AjoXBQBl4mchens9jAH2L0M1ydMYbbsn/RazXg4zCuHNSapOaPZ56T+8X7+?=
 =?us-ascii?Q?7YKruWxHZlulR3eRv67fSf7lKuDWw77Ym0Ew2qIovTzwoBZOJOkaLH1H+Jff?=
 =?us-ascii?Q?rnPqnw/u0IJPhj0iYX1F/T9pUBTL1TJ6MwzffC1QGZhBdASmJ3s9mTGFxLh/?=
 =?us-ascii?Q?EwRXCJWixMJGA11Z6wyVQFwaFg8OkYsCNEcjP8bPb+pR8CCQixgwm27CyE5/?=
 =?us-ascii?Q?u/qT7uNwqFdbBlExdZoKIaPW/Dk1iRjapR0Qr5l+LNBmhDunYaGG+VC9eQcB?=
 =?us-ascii?Q?T1/A+FKQiDT/yy/6y8H+NZRwv7HO5xGNJNeuV5uTRAVip7U3u4S6qN/kR+9m?=
 =?us-ascii?Q?SHErde6rVZRU/jtRIkIxRhjmSHa3UxMI/wmCXziDF+7D63lo0p4gi+03gsFR?=
 =?us-ascii?Q?UY4otNq+k3XJT7ihrMcvGMbItIqxbg8OGM9zzb+ygQIIBmnztrZajNTiPfpl?=
 =?us-ascii?Q?G6aEFNhX9Cru2hVVeOBwYknbRY4mBab2fHH1Xq2SHdK27juA22n6zP8QruDW?=
 =?us-ascii?Q?r7E4QpTLJtN1Gsw+bA3Hf5FNngoF2thMcHMMtcuBo8YhgdX6KZS6QLOk4qR+?=
 =?us-ascii?Q?zwoFLyZyESnTuHBpyrhG6L3HPqFmxTYtvzMNZkdf/yB1W/hJCbbX3KZNxR7X?=
 =?us-ascii?Q?HD183yPODPi1hvAmZ567DaEOmXirGI2HdBUcNdcOMsjsplZFyZhU2RW8NmpB?=
 =?us-ascii?Q?JEsEEaWYNX8Uu5+YKVysHmaawAYTAml8/sc+K+erKpUcI+4uJEm8yqaXu+bP?=
 =?us-ascii?Q?lxPhYkRIetF1pyg39PG+kH8GY+bUWKYaIInAzdPU/8NlWX2Z1tEimS4Jv/hT?=
 =?us-ascii?Q?ajPrzYVGCNQpCObGKs+pnswXPnQJV6j6A6Iw+e0W8WDz7CBiQZQ0TOUasfA7?=
 =?us-ascii?Q?UJznjWjgS9kLSdfUjkPlMD374Mx0gEMLYwFE2mCqEBzEoDFGAWrwXhuhCRHh?=
 =?us-ascii?Q?5bht6ojnWWH+9+H6zsnvVhKDcE8QtOfUMP/lm+AxWb7sAXZZWpcdRr6n7fDV?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 087d208d-460c-49b5-abda-08dca5e3299b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 22:03:45.5692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcEXZ8CzqOPVRCtqUW/J68n2JaM2TlGQ4Ie7qdGDENWqa63GZWRJ9KeDcopMqe8DWAE1TgP5rYxZScx7LztInfx6f5nwXWZeO1zl+6w5wXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5271
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

On Tue, Jul 16, 2024 at 11:51:05PM GMT, Michal Wajdeczko wrote:
>
>
>On 16.07.2024 21:54, Lucas De Marchi wrote:
>> Extract functions to setup the multi-tile mmio space and extension
>> space, while better documenting the final memory layout.  No change in
>> behavior.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>
>> tested only on single-tile platforms for now. It shouldn't change the
>> behavior, but it would be good to get some extra testing.
>
>hmm, but CI likely wont help here as our PVC are running with:
>
><6>[  149.783555] xe 0000:aa:00.0: [drm] tile_count: 2, reduced_tile_count 1

yes... I will have to do some manual testing and also asking for help
from original authors (Cc'ed) to check if it doesn't break their use
case.

>
>>
>>  drivers/gpu/drm/xe/xe_mmio.c | 99 ++++++++++++++++++++++++++++--------
>>  1 file changed, 77 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index ea3c37d3e13f..31f6703daec2 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -33,29 +33,56 @@ static void tiles_fini(void *arg)
>>  		tile->mmio.regs = NULL;
>>  }
>>
>> -int xe_mmio_probe_tiles(struct xe_device *xe)
>> +/*
>> + * On multi-tile devices, partition the BAR space for MMIO on each tile,
>> + * possibly accounting for register override on the number of tiles available.
>> + * Resulting memory layout is like below:
>> + *
>> + * .----------------------. <- tile_count * tile_mmio_size
>> + * |         ....         |
>> + * |----------------------| <- 2 * tile_mmio_size
>> + * |   tile1->mmio.regs   |
>> + * |----------------------| <- 1 * tile_mmio_size
>> + * |   tile0->mmio.regs   |
>> + * '----------------------' <- 0MB
>> + */
>> +static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
>>  {
>> -	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
>> -	u8 id, tile_count = xe->info.tile_count;
>> -	struct xe_gt *gt = xe_root_mmio_gt(xe);
>>  	struct xe_tile *tile;
>>  	void __iomem *regs;
>> -	u32 mtcfg;
>> +	u8 id;
>>
>> -	if (tile_count == 1)
>> -		goto add_mmio_ext;
>> +	/*
>> +	 * Nothing to be done as tile 0 has already been setup earlier with the
>> +	 * entire BAR mapped - see xe_mmio_init()
>> +	 */
>> +	if (xe->info.tile_count == 1)
>> +		return;
>>
>> +	/* Possibly override number of tile based on configuration register */
>>  	if (!xe->info.skip_mtcfg) {
>> +		struct xe_gt *gt = xe_root_mmio_gt(xe);
>> +		u8 tile_count = xe->info.tile_count;
>> +		u32 mtcfg;
>> +
>> +		/*
>> +		 * Although the per-tile mmio regs are not yet initialized, this
>> +		 * is fine as it's going to the root gt, that's guaranteed to be
>> +		 * initialized earlier in xe_mmio_init()
>> +		 */
>>  		mtcfg = xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
>>  		tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
>> +
>>  		if (tile_count < xe->info.tile_count) {
>>  			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
>>  					xe->info.tile_count, tile_count);
>>  			xe->info.tile_count = tile_count;
>>
>>  			/*
>> -			 * FIXME: Needs some work for standalone media, but should be impossible
>> -			 * with multi-tile for now.
>> +			 * FIXME: Needs some work for standalone media, but
>> +			 * should be impossible with multi-tile for now:
>> +			 * multi-tile platform with standalone media doesn't
>> +			 * exist
>>  			 */
>>  			xe->info.gt_count = xe->info.tile_count;
>>  		}
>> @@ -67,23 +94,51 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
>>  		tile->mmio.regs = regs;
>>  		regs += tile_mmio_size;
>>  	}
>> +}
>>
>> -add_mmio_ext:
>> -	/*
>> -	 * By design, there's a contiguous multi-tile MMIO space (16MB hard coded per tile).
>> -	 * When supported, there could be an additional contiguous multi-tile MMIO extension
>> -	 * space ON TOP of it, and hence the necessity for distinguished MMIO spaces.
>> -	 */
>> -	if (xe->info.has_mmio_ext) {
>> -		regs = xe->mmio.regs + tile_mmio_size * tile_count;
>> +/*
>> + * On top of all the multi-tile MMIO space there can be a platform-dependent
>> + * extension for each tile, resulting in a layout like below:
>> + *
>> + * .----------------------. <- ext_base + tile_count * tile_mmio_ext_size
>> + * |         ....         |
>> + * |----------------------| <- ext_base + 2 * tile_mmio_ext_size
>> + * | tile1->mmio_ext.regs |
>> + * |----------------------| <- ext_base + 1 * tile_mmio_ext_size
>> + * | tile0->mmio_ext.regs |
>> + * |======================| <- ext_base = tile_count * tile_mmio_size
>> + * |                      |
>> + * |       mmio.regs      |
>> + * |                      |
>> + * '----------------------' <- 0MB
>> + *
>> + * Set up the tile[]->mmio_ext pointers/sizes.
>> + */
>> +static void mmio_extension_setup(struct xe_device *xe, size_t tile_mmio_size,
>> +				 size_t tile_mmio_ext_size)
>> +{
>> +	struct xe_tile *tile;
>> +	void __iomem *regs;
>> +	u8 id;
>>
>> -		for_each_tile(tile, xe, id) {
>> -			tile->mmio_ext.size = tile_mmio_ext_size;
>> -			tile->mmio_ext.regs = regs;
>> +	if (!xe->info.has_mmio_ext)
>> +		return;
>>
>> -			regs += tile_mmio_ext_size;
>> -		}
>> +	regs = xe->mmio.regs + tile_mmio_size * xe->info.tile_count;
>> +	for_each_tile(tile, xe, id) {
>> +		tile->mmio_ext.size = tile_mmio_ext_size;
>> +		tile->mmio_ext.regs = regs;
>> +		regs += tile_mmio_ext_size;
>>  	}
>> +}
>> +
>
>as you are adding some documentation to static functions, maybe you can
>also add true kernel-doc for xe_mmio_probe_tiles() below ?

will do

>
>> +int xe_mmio_probe_tiles(struct xe_device *xe)
>> +{
>> +	size_t tile_mmio_size = SZ_16M;
>> +	size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
>> +
>> +	mmio_multi_tile_setup(xe, tile_mmio_size);
>> +	mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
>>
>>  	return devm_add_action_or_reset(xe->drm.dev, tiles_fini, xe);
>
>btw, I'm wondering if we really need this tiles_fini as it just reset
>some pointers, while in general we don't do such detailed cleanup any
>more, since actions are called in order and only care about resources

c7117419784f ("drm/xe: reset mmio mappings with devm") added this on
purpose and it seems like a good reasoning.

Lucas De Marchi

>
>>  }
