Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFFEE776C3
	for <intel-xe@archiver.kernel.org>; Wed, 24 Dec 2025 16:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1E7112503;
	Wed, 24 Dec 2025 16:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WS5ffEpG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68775112503
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Dec 2025 16:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766593549; x=1798129549;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g/pRFIEn0A8s4247paEWy5C9vzlb8PeQWClkJ2/IEz8=;
 b=WS5ffEpGRGi1vXiPb05nyYDBMtkyKfk3XNSgK8DtCW1uxvDRY6f+YE/9
 Afni7DBVVaNy38hSyhrf44h558jxMZFXINLeQpKZiTy3wG8ez7yJHmkdF
 kdpEG83NvvV3THitdBCVyfHh7xjKXYfvkfEEyH8e66QVbM7E0EpyqyjcV
 QMCG54PXUtHoHxJUMrJ4o1GPyN+oe8iYDQpcEvKEP51+PZASK0qwo4jfJ
 ODPfTRHMF/w5aodDWiC9uL0X/X/EqJC4pHxTp4HFFUcrEctXPWpaK5MHW
 wUGN9tlixfKvlW8wbYyvA2mcCVp/JdZVHL57aHzMeOvejZZx+LCLfpVgx A==;
X-CSE-ConnectionGUID: ObGscbCDSNCzcbQlgkiIug==
X-CSE-MsgGUID: GNnvWyMsTcilyEwvK5pvAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79549658"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; d="scan'208";a="79549658"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 08:25:48 -0800
X-CSE-ConnectionGUID: 5in7RBy8S+yrsLxgf3F95A==
X-CSE-MsgGUID: vIx6VHZJQJa7louauqNBDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; d="scan'208";a="237436699"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 08:25:50 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 08:25:49 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 24 Dec 2025 08:25:49 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.58) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 08:25:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OoBcOJu2JHc/tpyRXyNigOzksIrWlvKIZjuozyCSr7J4/WAheC5yrVnlEu/eNLuW1Dxu26G+jd6sjq9mkv41Kf2Y7vd1/OeuEYSwG0KgMennxd3iF7M3MF3Cs2e93i0j6QidyI10gfAZx92iPUPoZU8kfp9mLQLZY8ZCKtRnsfpCFpWYbAkqopiIkT7BKNGKHKXtLmLgkDuEL3pkMMYgjR7D2VOaOQcfZgxPDwCzMynF0Xg/W211UyUqDenTqBj7YOXb0dIdQmii61ru/Znu/7IvubRjpeUgy3xxlmP13pTuh7RSCGLAwJoplNu1UWYX1Vr3ZN1ZnocuZcogRR4PVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6XwBhC4c0X1ZfvmxV3ygKLM4uvz8tJF5oJnF5TtRDg=;
 b=ixNfa3TZEf4BG2ESRPNiNvAYHxoQ4023KtjRgII1QvLhOWQu37cNBvBv//t9yTPsb6EJ3G44fPAG7npKUYnVvMIuh4JhMRDsGWlO08acIDBtLsK644EcmIu96A/D4vKm8mmxYlO+ZKWyvVMWlzCK5MrUynzS4zNlO38nD8Z46jkNj3RjNooUd16erqsT27c9d3K+5f5uW6QdaQinoliS2lD9iKtmDzeIOJlUp7AvL9Fgi+rTZjrI11O5zpNInn6d4ZNTZbT40MgypqBPJRaPs1Ll8sXrNSLTItJrpvXhP8KaA9KjIGbU8wAJvZefVebdf2hEyJCgFt4VP3YH8f+CjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ5PPF2F2B659FE.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::81c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 16:25:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9434.009; Wed, 24 Dec 2025
 16:25:45 +0000
Date: Wed, 24 Dec 2025 08:25:42 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 drm/xe: Add xe_pci_rebar (rev4)
Message-ID: <20251224162542.GV4164497@mdroper-desk1.amr.corp.intel.com>
References: <20251219211650.1908961-4-matthew.d.roper@intel.com>
 <176654629412.114937.9812783901030058679@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176654629412.114937.9812783901030058679@a3b018990fe9>
X-ClientProxiedBy: SJ0PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ5PPF2F2B659FE:EE_
X-MS-Office365-Filtering-Correlation-Id: 74df360d-5880-40c0-f451-08de430916c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ha9C7pOxNU8lGpITk4/FpJFZWesu8oAQTsqXc818/+251TsUN9PFl17OOOL+?=
 =?us-ascii?Q?JVIEAsrtNdk4Vc382gSeCSyhcKG36P4Ioh+ZZbVvH4WPYsoRCynYOmiqct1y?=
 =?us-ascii?Q?pOQKmxqsDc5cGtvItXT8FDXyHZpZ4ulUH4o/FgEAHjG4ujyzXDfBuLM+xgNF?=
 =?us-ascii?Q?PS950aysJKQW5tcNI1b0wnm5jNUfr2kLkYbPTFormhYko0zbw6htet+BLuJc?=
 =?us-ascii?Q?x8feQVLGZmSBEhfYmbT/mFJxB9do7rCifeTFlXKZXFVQc5hmXGJUmJ8XqMbq?=
 =?us-ascii?Q?XXzY7X6he15s5GeFUk9uRN6RtBDVVLFRTvhekpgW7qVAzoGc9xv1fA0J9GjO?=
 =?us-ascii?Q?/lQcQtc3VnjuGYoKlD85Z9Qq+GDOYvW3osOJgeyi6zHeNXYTuFfpYUTb9ru+?=
 =?us-ascii?Q?HeCtCvTk/O7rn8PsOom20oZeM4lqmSl5RMpzkaLesQ4FLnIxj95TIYcRE6Z6?=
 =?us-ascii?Q?yP5w5f9U7/0E7qRyq60toseXFA6vkYEi3zDrxg4y+W0kyLPTiW+q/q6vsWRx?=
 =?us-ascii?Q?NtxfiU3SNKt6qmVKF3w8j+H14bGkv3SkeUxjEtjc8YfOp7B90EQ9GeJOnM30?=
 =?us-ascii?Q?iM5TFPty9PxMo2bhD4nFqtxv4SwUgssPvqFFH9Yz8PdxvsFjzkrB6eQlnPfV?=
 =?us-ascii?Q?FaOKPmxaEGm7zdkcIzu5aveV6ek7qN9yf7DonffdnlyCZyCa230T3UuVEyRF?=
 =?us-ascii?Q?5Lvfats8GpKaNbgTsRdHUbRod8zdc0VSEZOybfG/cOafsE9UN/3G72uNWVxW?=
 =?us-ascii?Q?jPh7g0YVJ0kk2kzb+mjG7I3WR7SI6Q8lSLT+liWf+GpNf5DhfcFXW5c7Tu+v?=
 =?us-ascii?Q?l4yxQXAOhLYO0SxILtPW2KhmOSAFGo0Z5zJb2ZFefCcxV4kmZ2i3wmRLjxUE?=
 =?us-ascii?Q?1iWBdkJzzXilDhnu7LzjL7MErMUAb6mv6v3yrTMwIgkPvoa5mLShl2R1Q6Wx?=
 =?us-ascii?Q?6ECArhw6u1MGH9UIE3/e5j6Qu0oU1gE9/QL1xErqVoKrr6/+HnUWUqM34nAQ?=
 =?us-ascii?Q?1q/hh94wCOyvAWygLOSjzY5CcU4yU6GkUTx6NY/+qe1YtKyYhJoYoR4lnpHO?=
 =?us-ascii?Q?MKKm2TN3sMovgZCyZa8I2M3TX1i8y5w/vw3nb23g09GQCSlrg+1MZZ3AWNWA?=
 =?us-ascii?Q?k9SM6XHpWXtPMo4JRdo+AV744n4ExwbJMuZwR6gUDhNRWKGECioPsBK239ti?=
 =?us-ascii?Q?JOHiMZNYSF2Zff4a04IDaMZa1grokBhdRefNHxVF2OQTsTdUFC3y/fSApCUm?=
 =?us-ascii?Q?IIWhssiifzjhc99Y9+MM74wgQFRGx4uqyxtAcTH4hSqkh2TJZoLT73nMrHUO?=
 =?us-ascii?Q?n1mD3NWXnFOC1HRiQil58sse5oBVaaBzgY7iIHF6WIM4isv5eXCaf+GneyJB?=
 =?us-ascii?Q?gHZyMfPftzR1YkyWSTSk+3jUC48h24YiuPmHmjuRESNcB2GUCg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RgrXqBziyVwdgnP4OGNqMYb4w68EeC8bWZndOroRu5Mes7rZgJ2TTWJrPixm?=
 =?us-ascii?Q?q3HGcCVQGDlrmT3uxc4kfDaQnysS8hu0m2xIxaHW5w6o0rvpX6am271yFzEw?=
 =?us-ascii?Q?LvftKeAGgCbrOzXfncCzD1cwpVDXKT/uGxBqReRi9t247JMa9KnGqavQeeEG?=
 =?us-ascii?Q?tjAhd7HfOwPPyN5b59X8kSI7ooGG9S6NyuhY+xlAwbtP9vM2KUfVDA3HzNGp?=
 =?us-ascii?Q?YWK0aylT7Lea0iL4rdcoRnadOuaMnWPJe4efA4UjuWvjl6+tKMAmBCwISx7u?=
 =?us-ascii?Q?ivlSI84db31msHX8/24rSEYFNidKQp4B8N6eCQoms82ZjdnTZDHOiuKtUixK?=
 =?us-ascii?Q?ly9pBC3lg+USzejdiLWi/OIYVYp54psZm13Ke6e40AbQ7mYLW1PYgy5btt1x?=
 =?us-ascii?Q?rCr6qQUrJMa2qtl05+I2xEP+pdDyupdEXIuAVRxhsxc4D8ICBfjILtIvNltL?=
 =?us-ascii?Q?+ZTAq/3i39f/S+BY+tNJ2q9CumYCZSVWOySvjXWyBrgzB56qpI56mvtlzwZ/?=
 =?us-ascii?Q?S+6ON/P5CLZAoJZ9yybuEdoRD006t8Jxcl0STDTefzkzaDZW8QOqMxbCuAGO?=
 =?us-ascii?Q?ndduOLqy42/S3htgdlHxuZJDIV4wzv7ggNt04+knmZXXmS53xB4MtPBN6UCa?=
 =?us-ascii?Q?vIYRbtFhSd1wEh0eBQ5VKWJdGVjO8iIP3SNS4kUXzzuDsuqacbMpFSz+0l16?=
 =?us-ascii?Q?iVAjbq7/6C1rRuNZlzN99dt3z1VRjRK6zSUv0N1TTv2e1BuTJF7X0fHiRYTh?=
 =?us-ascii?Q?uUh3B0il0SpivrrVXaTuc3laGrv40qXA54saKOp5+l4CgMpvqa0yr3WLhVL3?=
 =?us-ascii?Q?5XbHpIw19yMWdmUrSK9gj/UBJF0gRHcTxB7MXYBU0u6OHxM6LwRGQGO7DCfs?=
 =?us-ascii?Q?hYXgu9cnQpucu5tojLFkFbksFY6DzRez9xIbdZsz26/6AiEyDbzIhoSIb6BU?=
 =?us-ascii?Q?zM6PEXyZ74Yiby1G78VFL3d0O7kJxiBJ+cMctJcHT+4/JdPbsFz74HZh3fsQ?=
 =?us-ascii?Q?RCTW5Y3ZV3YUzkSUEtI54geRx1pspL5pqQgB0saUOZl2wjb4JKhvg6SteP6j?=
 =?us-ascii?Q?J6/wjxx1So33TeY6SuFSeUwnx7oCobAZ/UAPesJuZ8bZOB1To9ajyE9Zj+VF?=
 =?us-ascii?Q?+vRtrjuEkn/AusYK6FlsYAqJ+7PA1U0oFwuGJnBCyLiaOvjkHyH95Oi3P7r/?=
 =?us-ascii?Q?2OcdAfDf+Nfb1/bjDmriAthhA7nLcbbEsUkP3UlS4vDa26qqIfHzep4Qalog?=
 =?us-ascii?Q?y93XDlk4eRyxN3UOIE64Bu+ashvaMeBGAzsyWP4EuliSBaPhjagsW/r/lqeP?=
 =?us-ascii?Q?BUnrEUkDFZdbtaecXy3hjJAu9cwN7/IfCg6EH7eyj2RBf6iIcPIsBvSN6bOK?=
 =?us-ascii?Q?aXhqWNN7jqE3VFQsgmSJ6qL58PlUAmwkXzpsnHJqJTGfk+d0yLq+til43fst?=
 =?us-ascii?Q?AX7mUStDJVWwtbSXhQYOMJ9shZ81aTZ2F3MqjvTF7zCHQ/DJ2hzZnaoQNWct?=
 =?us-ascii?Q?2FR7SEImC/ZrStpdJLmBU4Lni2wraKmqEEgMUM+415Fk3JSRKlTiqJrSznW7?=
 =?us-ascii?Q?kBWeGuj7+B9hsbo3DMVIEXLVa0EFhBO+u0JCCIGT6Clmw6zr3KFrWXoQj6uB?=
 =?us-ascii?Q?eRXYcWssNt62Z+/WzlHdR3PliUrvf2PdOmt8VjwT3RLAffWf3+qDFuQD3T/0?=
 =?us-ascii?Q?nuuR7Z1MwqwuBipECc/02ZX/feIuHWjfaeiHHkKUFJyJD7AlGVRR4t/YWa+8?=
 =?us-ascii?Q?wOVBxt5kDlPVFIb92vCx7TRjKRbpKwo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74df360d-5880-40c0-f451-08de430916c5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 16:25:45.1025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpyuNddeGIXMM0Vew1CtPbQPlr4iTGWASfYaGKvwCp1C7Ljx882OgtVNimFBtD+9cFasjZn1CL3+hs6Xr5qSp6YqknuGy6YNXtaMsqD7Z78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2F2B659FE
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

On Wed, Dec 24, 2025 at 03:18:14AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Add xe_pci_rebar (rev4)
> URL   : https://patchwork.freedesktop.org/series/156871/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0_FULL -> xe-pw-156871v4_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-156871v4_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-156871v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-156871v4_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset:
>     - shard-bmg:          [PASS][1] -> [TIMEOUT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-9/igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-8/igt@xe_exec_system_allocator@many-execqueues-malloc-mlock-nomemset.html

Seems to be a long-standing, sporadic issue that happens rarely enough
that we keep closing the gitlab tickets as "cannot reproduce:"
 - https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6788
 - https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6344
 - https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5686

Not related to the rebar changes here.  Patches applied to drm-xe-next.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-156871v4_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2233])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-10/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327]) +1 other test skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +6 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-bmg:          [PASS][6] -> [SKIP][7] ([Intel XE#2314] / [Intel XE#2894])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-9/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#367]) +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-10/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2887]) +9 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-10/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#3432])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2724])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-9/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2325]) +1 other test skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2252]) +5 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2341])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-3/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][16] ([Intel XE#1178]) +1 other test fail
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2320])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][18] ([Intel XE#5354])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-9/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>     - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#2291]) +4 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1508])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-10/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2373])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-3/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank:
>     - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#2316]) +4 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-7/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2316]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2293]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2311]) +14 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#4141]) +3 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2312]) +4 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2313]) +16 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2352])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [ABORT][33] ([Intel XE#6740]) +1 other test abort
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-8/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html
> 
>   * igt@kms_hdr@static-toggle@pipe-a-dp-2:
>     - shard-bmg:          [PASS][34] -> [ABORT][35] ([Intel XE#6740]) +1 other test abort
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-3/igt@kms_hdr@static-toggle@pipe-a-dp-2.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-9/igt@kms_hdr@static-toggle@pipe-a-dp-2.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#6901])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4329] / [Intel XE#6912])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#6886]) +4 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1406] / [Intel XE#2387])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-pr-primary-page-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-3/igt@kms_psr@fbc-pr-primary-page-flip.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full-aspect:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2413])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>   * igt@kms_setmode@invalid-clone-exclusive-crtc:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#1435])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> 
>   * igt@kms_sharpness_filter@filter-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#6503]) +2 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-8/igt@kms_sharpness_filter@filter-basic.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#4459]) +1 other test fail
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#1499]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-3/igt@kms_vrr@max-min.html
> 
>   * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#4837]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-10/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
> 
>   * igt@xe_eudebug_online@interrupt-all:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-9/igt@xe_eudebug_online@interrupt-all.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2322]) +4 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html
> 
>   * igt@xe_exec_multi_queue@one-queue-priority-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#6874]) +17 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@xe_exec_multi_queue@one-queue-priority-smem.html
> 
>   * igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#5007])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-10/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
>     - shard-bmg:          [PASS][54] -> [WARN][55] ([Intel XE#5786])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-10/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
> 
>   * igt@xe_exec_system_allocator@many-stride-new-prefetch:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][56] ([Intel XE#6480])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#4943]) +18 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2229])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4733]) +2 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#944])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   * igt@xe_sriov_flr@flr-each-isolation:
>     - shard-bmg:          NOTRUN -> [FAIL][61] ([Intel XE#6569])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-9/igt@xe_sriov_flr@flr-each-isolation.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          [FAIL][62] ([Intel XE#4633]) -> [PASS][63]
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check:
>     - shard-bmg:          [SKIP][64] ([Intel XE#2316]) -> [PASS][65]
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-9/igt@kms_flip@2x-wf_vblank-ts-check.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-lnl:          [FAIL][66] ([Intel XE#301]) -> [PASS][67]
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [FAIL][68] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][69] +1 other test pass
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_hdr@bpc-switch@pipe-a-dp-2:
>     - shard-bmg:          [ABORT][70] ([Intel XE#6740]) -> [PASS][71] +3 other tests pass
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-1/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-10/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation:
>     - shard-bmg:          [FAIL][72] -> [PASS][73]
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-3/igt@kms_rotation_crc@multiplane-rotation.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-lnl:          [FAIL][74] ([Intel XE#4227]) -> [PASS][75] +1 other test pass
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-lnl-3/igt@kms_vrr@flipline.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-lnl-4/igt@kms_vrr@flipline.html
> 
>   * igt@xe_exec_reset@cm-close-fd-no-exec:
>     - shard-bmg:          [ABORT][76] ([Intel XE#5545]) -> [PASS][77]
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-3/igt@xe_exec_reset@cm-close-fd-no-exec.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0:
>     - shard-lnl:          [FAIL][78] ([Intel XE#6251]) -> [PASS][79]
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][80] ([Intel XE#2311]) -> [SKIP][81] ([Intel XE#2312]) +7 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][82] ([Intel XE#2312]) -> [SKIP][83] ([Intel XE#4141]) +3 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][84] ([Intel XE#4141]) -> [SKIP][85] ([Intel XE#2312]) +3 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][86] ([Intel XE#2312]) -> [SKIP][87] ([Intel XE#2311]) +2 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
>     - shard-bmg:          [SKIP][88] ([Intel XE#2312]) -> [SKIP][89] ([Intel XE#2313]) +3 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][90] ([Intel XE#2313]) -> [SKIP][91] ([Intel XE#2312]) +8 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][92] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][93] ([Intel XE#3544])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [ABORT][94] ([Intel XE#6740]) -> [SKIP][95] ([Intel XE#1503])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-9/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-bmg:          [SKIP][96] ([Intel XE#5021]) -> [SKIP][97] ([Intel XE#4596])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][98] ([Intel XE#2426]) -> [SKIP][99] ([Intel XE#2509])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
>   [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
>   [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
>   [Intel XE#6480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6480
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
>   [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0 -> xe-pw-156871v4
> 
>   IGT_8677: 8677
>   xe-4297-98fdf8a438c3a1d9de8d5804cdcda94e097d53a0: 98fdf8a438c3a1d9de8d5804cdcda94e097d53a0
>   xe-pw-156871v4: 156871v4
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156871v4/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
