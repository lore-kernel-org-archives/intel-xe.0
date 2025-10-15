Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B564CCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 22:38:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44EE810E0DA;
	Wed, 15 Oct 2025 22:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRC6cC9m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5901010E0DA
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 22:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760567921; x=1792103921;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KE0VOZnEJtdMEDVTzPeLOwqpEm7HzzSE+m9BxjAMf/s=;
 b=cRC6cC9miReAyRjTy92IiMJWsjDyWQwwVoIRXLwmSRvUjobrJu10bys9
 8PCzehoxgbKRD/M+MUryh5UQIWpWOX7lV9wOVY7zSzfNKEoycex++pjQ/
 1mzyXrXW+b4/qON7tlX/7YDVqeWPI90HV4mDn7fFG3FZJ2IIqSzyIqy6k
 edO1Rx1XjmUXc7lxOuZuiGfL1MCxgPK7vTJ6uAUVmYA/vEYCawvY06UqJ
 0IxzzcJ7V+VuK0F7n2vGIXYvp5ZMzZCOkhsHaUlZQaGTfm9v69OVIAUNL
 /4zOF5i4xuOXZvx4AEGalHPXXIuN2A2uv3GzCXcgvt+dhO1M4Bd4jUyCc w==;
X-CSE-ConnectionGUID: JNygEaKhTCWmdbAxB+tBaw==
X-CSE-MsgGUID: wrRfQZGyRiOOpNFcOh5AKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="74095070"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="74095070"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:38:41 -0700
X-CSE-ConnectionGUID: 1Ku09JEdRJWqu/PLhBKRug==
X-CSE-MsgGUID: avEcr+WSSrmuQyKIXc/+dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="182082248"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:38:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 15:38:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 15:38:40 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 15:38:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuvR+DmBmnJ6ApxJB458iJaOuRw6GCx2grCvUr4IFUBLSM/HjfrHuRjbKNvJAs5vLv3ohMqW5KDBdaQaBxJwUYX8UMVBBx3NL/zinLLVnDT9Wr6g/dgei2omOrO4xLKx+sHXFNv3EryaFMejSVqMnoMFbe7vVdCwM4Upa8TlEgu87hXlieNd8ls4wmcNDxuwsG+fBc3ecH6hdVvN3tFl6iSMpfUITB2jk79FDBajWehXMOpRJX/HXMMObjowCtIc7XY5SEe0wIpACoZKsrXMc+BgDnZ/iAQoOiOp8a4Yx2G37I90P43pk39SRnn0u+yIljvmLSubPKZGuQFNTuXmRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ry8G5lhwn5eAMYqZDt+oABrC/OuWijoEc9QvOZ7i3lA=;
 b=WMX8NrFovh+n2zbofPvVerBf+MCEEU8OwCLYG2j31eA8DNNvpRBY6hTdJcQsQMTjmeB1BF97j82eDyXjrYpZmqCtHXErbb3d03svKyMBYSqSdIuCoX1CPJhuyBD7bcZaiOA/NMxw/dJnrVgAstFFwCOkCbheeL3zfNnfvXQXXZUQNxWi+mtlG8z/WkRSDuJBVyOfDCTLKUiMl4mVUc9vIorpDufXfXVxD9kSIOIM+vVZVGkyRfqE7KVWbRMpxrOR+1rqxJdm/wQD76SGel+jl7GwbH8cIN/e07CDOKzvLi+Spdz3nHgsxZ3A1j8MiHEK7voK+cT0EESIYltFme6QQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 22:38:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 22:38:37 +0000
Date: Wed, 15 Oct 2025 15:38:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 08/12] drm/xe: Make xe_ggtt_node offset relative to
 starting offset
Message-ID: <aPAiapLgXihvfKES@lstrano-desk.jf.intel.com>
References: <20251015074708.1654014-14-dev@lankhorst.se>
 <20251015074708.1654014-22-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015074708.1654014-22-dev@lankhorst.se>
X-ClientProxiedBy: MW3PR06CA0023.namprd06.prod.outlook.com
 (2603:10b6:303:2a::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8427:EE_
X-MS-Office365-Filtering-Correlation-Id: 06bd7882-d9d3-4d71-c512-08de0c3b94c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N8B57PMSYbMYn7Spby4Rb5pxcnk4BaGl6aF3gSWK8h3p1LAGDi0NEALP+Ycx?=
 =?us-ascii?Q?aDpyYTutouvb89E6Fo7DvpoxKxBGIIXwTP/afdwqS1FoE1Jnk0dWRRzlWQU6?=
 =?us-ascii?Q?qa0JSbc3BkN2mZlbBFAuvQtnTbv/rJ20NQHsMA9aV6Md6G3wxETfccyMmcjd?=
 =?us-ascii?Q?F5yqiRDLDSYFIw+Zl3TczLXnGQtPS9eOyRAB8oW8IbdJOqv4BPNuorVx7S5I?=
 =?us-ascii?Q?P+cHy5HRj68P3CkRjQRGDD954+4vSzSvFBnEyaZjB8ouI3DpEhq/rnyUkQBU?=
 =?us-ascii?Q?8+QklhdFkVDdt9or77CLS93uBtBI5aiG0QCpAf5mcoyfnItV7eow8HbrWW+o?=
 =?us-ascii?Q?6rnwiuKEKTCkX27dn4sY8P0JdAX0GnPh7H1qILSI0XoZ7oq7ayilkAeFdc06?=
 =?us-ascii?Q?JkCfvfYanut+kdkHdw1uxLH9TmLH497+H3AuwmaAOeYA1FjoTI2AGDUPb/MM?=
 =?us-ascii?Q?Ifs6+fgWRcKuRsenbuAewnOwLRk0vqR/TQ3ngN0v4hFR4cLt1ctda5y3pHqX?=
 =?us-ascii?Q?rELP1fG10YfBwceBLE8+7S96al9jXDLXOGrNAgoH6CQDGMaVCeADU0tN4YRp?=
 =?us-ascii?Q?jxazq+AtFFtyNfX5DK0GkppVOfokrq7SezysOXCWDjlBi+eyAJiaup0KCDsY?=
 =?us-ascii?Q?mt18afmNDrU3LJ7J+1tSBvArw39cPVhAF2XM+wL8AYyHNJUA9oRnoST+D76H?=
 =?us-ascii?Q?EGuOe7ha77DCxxyJQ/iRHSEvRRtlwMqp4AkxEcdYwwjo9Sdp8BQQmlKKV+S9?=
 =?us-ascii?Q?XrJgstVt77uFWzzFyQsP7QVXmYv/K2D2NvWvjP+Qr37GAawJYWExtZQDgs6i?=
 =?us-ascii?Q?f9a5llbTI/fs7Ymlzv7I81Jv8KgJkBzWVKUxwfCnrgiofptQm1FPC4M6GyM5?=
 =?us-ascii?Q?ObfObrCCcyyDzexEk7hR77YUSoyPkcTQzXmrXxrOcX5e/k6sHZ5dSU57bQUO?=
 =?us-ascii?Q?FKVfaseNIfpcD7+XYnE1QqwqJcWwTx4DRVWp/X4Z2bGpD1rZcAydC/TRV+2U?=
 =?us-ascii?Q?5EKRGlgzn6UFEyaJpb9lrS6BAWAsSKkwVOijgS0j2lkpmnPGkykhFdemfu39?=
 =?us-ascii?Q?pwedlExZWkHxbhH23vo9bxw0Cpj4iWZQmpfpFL+qaMKF0GZrpHv2x/3eTDcq?=
 =?us-ascii?Q?FagEvYfsmyEgPFY98zie6+r0fRw2q89ByJoUZhSuCusfZw8BCAUE+v/mOJZy?=
 =?us-ascii?Q?6bJNPpKRedTHB/UqxbMhT214UU3Oqbz4pyw+J+TnWyQ0pCR6ERcYA2pbT3Sz?=
 =?us-ascii?Q?oEYPUrid/bx19s3ajcETTIq2mCtYhvvEjJ3WbCsxMLGAC7Id2+Z71ilxneap?=
 =?us-ascii?Q?G8mcC0uRoCdLKt25y4VHkA9p46FtOEHekbf00pb5Wluy774toVT6iZ3f1V7y?=
 =?us-ascii?Q?QuOua6qD5DfZGQ15ghsZZ4hJiaMoTpjrR6whhVNXOM0a/rRCflYtvbIc+dE1?=
 =?us-ascii?Q?xvz8HLaRAu/eab2+Ijb/vQNbvsEVW/Jv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oAGV2z66RKNOFq5cacpMgLq97ZYmUF6upxmJS0NaYNsRZFNnAMsYlIx6J1o4?=
 =?us-ascii?Q?BN/ltaibtEbBdl/VZe3ZWPoFZUlCPK1nsuWXezcY5qd8kWJSFDFAzT1Vnor4?=
 =?us-ascii?Q?Dus30Ff1vjwEbfe5zAenlHxg1DLcmJHnVNHh/X02HYj5c8fIA4g2r4bXD7nl?=
 =?us-ascii?Q?uD4py9dZT2aHkdryCVbZbYE6jahf5KIzV5Yek2FQ9WVsuXqUgak7+4bFPbI9?=
 =?us-ascii?Q?skyGkYXVmeHJmgvwXVQA1meWuqyN8moELxjMt34kgxfJUsljoK4RQotJpZPL?=
 =?us-ascii?Q?B7gXhN9otFrp1DzvuPZQ5+Szwd9ZThU6lSVzcSXGJr73xSUD/1KkF3Jdm85v?=
 =?us-ascii?Q?0U+c7O1fM9tfcgzFaj2mFekxQh7j6GaHvYHET46glIv9T6o7tvPUsEyRrpgw?=
 =?us-ascii?Q?5xTmM6AI/+Joz+okju/0672kPwfu0w6G2zyTXmMEmIh3cfP9fHLABaB8EC7I?=
 =?us-ascii?Q?8BMdpHAP/T3+n9uF685EUVQLPZhbtBlkq0C4oG50HJn6f+oVDxund5nucIUF?=
 =?us-ascii?Q?YaaDYf4tyTN9/DRl6qlascolHEYYtcFY4FbQWyBKwuWn4gb0hFTYLiUPorJg?=
 =?us-ascii?Q?NJ6YRbSsLIBwrAkmNxfxbEzDBZpECGW92l6ZZoi2+oDqZLLmXtv9QLdd3A5l?=
 =?us-ascii?Q?oj2vErmIthKUngJY5Ac0GaXlkGJrVq0MEEI/YnuU+m72XeZ2E2YhCeM/D7Zf?=
 =?us-ascii?Q?Hgc8elRDEhD8ktS5oFti2CrbYqsYRtCjrJ8WSXMMam5Nbw6NPeW9xWNW2Bq4?=
 =?us-ascii?Q?VjD5eRmtcWAMp9z5PjO8xXNZIOi1F7TMzQC5MgXH2wW4fcEl5uy1rLlR1JdD?=
 =?us-ascii?Q?9AAzUmHpvJi8BgieSYpehKxVhTOJa+eRIq/YuAmVjj/exxbslSC29awaBf4Y?=
 =?us-ascii?Q?nrTOhZX8rWWkIKEpKZbAJRr2SKS+UOBmOYyfhxirg50ODjs3g2fagS+EdaOf?=
 =?us-ascii?Q?nVm/+cGoh4ph/J17o51ix/yNGPgBhX4Z2DO52gBDYqVDWbP9dRsJJxeUf78O?=
 =?us-ascii?Q?gojmbNdKNGLMUCqVyxVQpoZUdhaBRWVctSDq4Ai/YcILcAzSdknFd6B95gY4?=
 =?us-ascii?Q?JIu60iozZHpzlZYGLNmXPqPpr0dsYpa06yyuttSvFUdYcQIHggWEWBDNwA7n?=
 =?us-ascii?Q?8LyEq7rI+qnbTNOPkKMYE0zEEp0Pgkt46cICCVPdQir8j7vataD82VrZfyGN?=
 =?us-ascii?Q?r9jEIFsxfCb8sCm4P5v2e5UzzHvSaSxveHlvrb27Z26IPQpkaTiE6lyCw3JC?=
 =?us-ascii?Q?50DuADcIaXvQ0FE0O4s5j/mVQowWTW2oy0VOG1id5Pqg6drEkqprl6clVQOq?=
 =?us-ascii?Q?w7nFfCHle4BUl7kc3yEhx0yAADidY+tIsgpA4xSXOA2DxF/sieDovGEpQ98V?=
 =?us-ascii?Q?mhyRoiG+nkUC0XlE8wI9tlwHt30cJGpbCmwjysh+kBf5mp+J8+4drzSc9RPt?=
 =?us-ascii?Q?2IEY0x4kHUas9vORkbKuxRc8z93Mo0AzQ/YH6iy2N+PM3r7tpgwN2rxUaP60?=
 =?us-ascii?Q?LoA8rlsp/71nY3vI8B7u5MveJVk+0KBoky0lapKXaE8JkkDFZwTiymksmZ3l?=
 =?us-ascii?Q?U3B6gFQQNCgidBK3/y9nTeZfB6p4cmfYPbJymEkc7zmM39iQ5QecjhA4R8Dq?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06bd7882-d9d3-4d71-c512-08de0c3b94c5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 22:38:37.4310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYeYXowSmg/0R1AfPd60Qm3OCcXAXNWxFXZLGGWClIUaQk/KHiLOQeqnaLB4EFAb+g79S3q8wSIoqa2rDTAixw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8427
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

On Wed, Oct 15, 2025 at 09:47:17AM +0200, Maarten Lankhorst wrote:
> This will make node shifting in the next commit a one-liner.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 5c07d63189ab1..1c97a06424b5c 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -289,7 +289,7 @@ static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
>  {
>  	ggtt->start = start;
>  	ggtt->size = size;
> -	drm_mm_init(&ggtt->mm, start, size);
> +	drm_mm_init(&ggtt->mm, 0, size - start);

We should probably fix the drm_mm_init function signature so the last
argument is called 'end' rather than 'size'. Can be done in a follow up
though.

>  }
>  
>  int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
> @@ -388,7 +388,7 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
>  	/* Display may have allocated inside ggtt, so be careful with clearing here */
>  	mutex_lock(&ggtt->lock);
>  	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
> -		xe_ggtt_clear(ggtt, start, end - start);
> +		xe_ggtt_clear(ggtt, ggtt->start + start, end - start);
>  
>  	xe_ggtt_invalidate(ggtt);
>  	mutex_unlock(&ggtt->lock);
> @@ -405,7 +405,7 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
>  
>  	mutex_lock(&ggtt->lock);
>  	if (bound)
> -		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
> +		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), node->base.size);
>  	drm_mm_remove_node(&node->base);
>  	node->base.size = 0;
>  	mutex_unlock(&ggtt->lock);
> @@ -561,13 +561,13 @@ int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64
>  	lockdep_assert_held(&ggtt->lock);
>  
>  	node->base.color = 0;
> -	node->base.start = start;
> +	node->base.start = start - ggtt->start;
>  	node->base.size = end - start;
>  
>  	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
>  
>  	if (xe_tile_WARN(ggtt->tile, err, "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
> -			 node->base.start, node->base.start + node->base.size, ERR_PTR(err)))
> +			 xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + node->base.size, ERR_PTR(err)))
>  		return err;
>  
>  	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
> @@ -744,7 +744,7 @@ static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>  	if (XE_WARN_ON(!node))
>  		return;
>  
> -	start = node->base.start;
> +	start = xe_ggtt_node_addr(node);
>  	end = start + xe_bo_size(bo);
>  
>  	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
> @@ -865,6 +865,13 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  	}
>  
>  	mutex_lock(&ggtt->lock);
> +	if (start >= ggtt->start)
> +		start -= ggtt->start;
> +	else
> +		start = 0;

Does this logic work if let's say start == 0x1000 and ggtt->start ==
0x2000. It seems like that is caller bug which we should assert 'start
>= ggtt->start', right?

> +
> +	end -= ggtt->start;
> +
>  	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
>  					  xe_bo_size(bo), alignment, 0, start, end, 0);
>  	if (err) {
> @@ -1106,5 +1113,5 @@ u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
>   */
>  u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
>  {
> -	return node->base.start;
> +	return node->base.start + READ_ONCE(node->ggtt->start);

Why the READ_ONCE here?

Matt

>  }
> -- 
> 2.51.0
> 
