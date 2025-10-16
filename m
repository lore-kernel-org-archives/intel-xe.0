Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE54BCCD185
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 03:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7103A10E13F;
	Thu, 16 Oct 2025 03:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVUd9yid";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A373B10E13F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 03:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760585082; x=1792121082;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nDOEj1RGjhuS0xNpn/OnaPjpD/QeT4pEDB/8oioa+WM=;
 b=BVUd9yidC48vD8MeDUmZXKe/tNtJbFvBqqjmMhXPBZ97dVX5PpFIo9oE
 l/XDb3v6lMaIxxxezUe6uf71vGNpEY2vRMQNr3hv17ujY6FUz6/VrZoVX
 TvjZtrIXdgcxnscHiaF9rPGIf9TDyUTa3Cto1r310cJtexZ5zShLdpURb
 do37VWmf2EIXLtnQOICTyyLIIXJze9qzGYwMzbos/0UIgs4DSNcr5/sYE
 AwMP1AEKLctUoorXH8zFbgJ+DuE3yLQPKpNHccpJBoxGEE86h3UMQ9aUW
 42HC9rBgMY3A2wIslAiDIqbveGG1dOvSmHkvkn8IubK5jlBSNoi87YOei w==;
X-CSE-ConnectionGUID: lAa1mFTnThSSc/DvIKNERA==
X-CSE-MsgGUID: NpEYCvw5S/O2NLKJyn2aPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62666203"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="62666203"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 20:24:41 -0700
X-CSE-ConnectionGUID: mejUmVuMRiS1CnW5q3LO2Q==
X-CSE-MsgGUID: gJAVx58wSf6ZOlUxZIYh1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="212937800"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 20:24:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 20:24:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 20:24:40 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.8) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 20:24:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJgogLEwA8+DvAcX+KZLd7BGWb+YvaHhKMLFMT+Yb3D3k9c82k6fDp4X2aE6Zg5wh6aSiYalxlH3UTcpEp+qK2NouPUyz6Ah4P5v1HXjIB5GeICwG4AnVPOAndFgfcTExvVxduKvizLNP3wFvHWyJ5L9r64NH8+WKhns8zbHXClBl6YBym+II2kJQTemLAbCrlQ/Gcj5oE6Irc3cIVBri2Kmk9a+B0ZfltrNMsU196aoSLnVuVDWJgFrNkAstXO+mEBQqTqd8TFQs1+quBIbS8y4sj8qi4LHCDEDe38JwOa5WH5iXppBNEn65fIn5O5bVIkFDB0f7kKjzPVpHSupPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVnZtrJxCukJ/Ql4pYnhLzWdUx9gXQc0HTFoJ9FEGlo=;
 b=meJD77sHe8PGyliLVYZNxnzr5IzN1osKKqTklq38DbRbEY7z9mHCO77n5SO/xl6pU+HbamoUgoubvpjtGOIMt/958NlN5RdhuTzY6sA76q8+ZEQJDWWd8Pslm4WE4iycMKgAGJl+5C0mIW+XTnnwy9t1T7nLmRHPasnGcqklEjwhwkI7C/LDeqyx6t45q5i3816AeLhnaBMQukjTyspg7HXuIqM072ym0RENeMpxUs7jBfUk8CIhnHxHbno8lwGVaEuqZiu72Qyt3ufwjfqDjVb2Y8vItIX/B27uCMTMNu7rFETReRjVbssCFobtNuRxpj3wMm3k0d4OKw4vclitdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 03:24:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 03:24:37 +0000
Date: Wed, 15 Oct 2025 20:24:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/guc: Destroy LR exec queue directly if GuC is not
 running
Message-ID: <aPBlcnzi1a3rUZ9m@lstrano-desk.jf.intel.com>
References: <20251014033646.1619865-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251014033646.1619865-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR04CA0108.namprd04.prod.outlook.com
 (2603:10b6:303:83::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a356a97-8a8d-49ab-41cb-08de0c6388b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SpXmV8X8m1dVv1xdautC82gruMKwFmFZKpckKiGgJsb6AQYgTUjUTdUwhxIR?=
 =?us-ascii?Q?HiocOrOJfkpkAD2PFw4bJU0bJ8m08DYb2XY3MIYLkvf5uZrBzWl9XIXPF+rR?=
 =?us-ascii?Q?lZ0nkz4i11wM2vZG7gBZ91X1UUYedPASWepRzRtW74/7Xa+yKTAlUgqb9dWv?=
 =?us-ascii?Q?rEBRgByuAI47AweiPzY23zTymK3fU2sZGSK3ROMjZ78Sh1eE3RKlhfLD8iwn?=
 =?us-ascii?Q?2Xs87l6X+vaOftpaXoIPcCioWmy2Q33gjHeBSPuBjP7i1miUGE1jQJ7hhqz9?=
 =?us-ascii?Q?ljThAEJ5guFmxWY3ty3R4x/GHNGoLqGsamtru88/DJm6Q3ld8fw5EKMUj/K7?=
 =?us-ascii?Q?R7l9QgesV/b0RS1K4ELQUPf7KSX5DwaAq56Nvbfkp8JYbpgQ5M+Ie2Sl0l2D?=
 =?us-ascii?Q?UgQ173hKsqWsOuPTtmA2s2OmRHfAPmtAvHBftSq59feeulC9kAFkJTaS16FB?=
 =?us-ascii?Q?oJRrR+EpYE80Dnt566SmxrgGEMuV0L3/n2eX2Gy0gHxZHTHGNjznYyubT+vI?=
 =?us-ascii?Q?rY0sBbqbPeihanoCRmsmPdD2pClL+HJNwHYG1YzBMEsPHB7vjERhc3S4XOvb?=
 =?us-ascii?Q?pqS/Ou7CDmFF1XMRKuHBsPuUEw0bMUXqWh92LVQy0HMZlAg6uuFvR/1btdId?=
 =?us-ascii?Q?dJDdhtcP4f4VM0wHKl+6IMnXu2Wey38j8J0dciTjnLGZbueVq+4ICXhuv0kH?=
 =?us-ascii?Q?wUFtn+t4H97zBYkiFgdLqaEeg4+Ye3jATZAMJyzvHsb/doSsqPbXBux9iw9t?=
 =?us-ascii?Q?yU4QOq1aBIdWZNISPQ5bVdMD2+7v9t8pxEK58m3xwWhFzp74bpX07nv8j6CG?=
 =?us-ascii?Q?prA0d3Wa/vIIPX2dFG+yNm55KrwJblCuUDKe9bn45YjKAB1NO/VBCR6wZKOd?=
 =?us-ascii?Q?WhyWa2QVGa5HJIh0zBeavoiVvm6zT8VCX1ICFrz2y0IxwkmWCZ0x2yjqG53m?=
 =?us-ascii?Q?/7VsldfgHBro4UARf7vNb+fRInULNIwhd8kuZx3QfJGxH+p0NagfkHsCkTvc?=
 =?us-ascii?Q?AxZEdFJtSqnwfFFaFgH349kwertVapSzU4tuw1waGsIRyEPaNAUd8V/9IWyo?=
 =?us-ascii?Q?YaiUEmOSA0Vcv14MF7im42RcQ2LRN65P+kjX9PwWtVpiV9q8rRskojhOZ5YR?=
 =?us-ascii?Q?RxZeea86F0olH9xWRegoLk8uhYOiJkCdw4YGGp/BOptRb2JI+K4kyRg+r3I4?=
 =?us-ascii?Q?+z0XB+1oZ2Z8790ny6gUbcn2z/ABscnYLpUWFXtefsdk7M1o1/O3znipj7DC?=
 =?us-ascii?Q?EB2f8pmIveI4v10YhXAVMI8Ad8KM1I8J6vr5DL5ljBe8xdo1ZDe6r5yhvZuQ?=
 =?us-ascii?Q?seW3MTgNSIo/y/ZJVuCBTz5iNB9kaa1Mw8pvks+SN3ntwbZXqg4gSNhRtxQw?=
 =?us-ascii?Q?bbRPQfjOs450ACkYTpCoAgMuCayP6WfyULfhnl/8BZjCcy/kgR/sAmXqZ47q?=
 =?us-ascii?Q?KItc7mEDla5f5X650J6E/VTiBGRxB/K6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8hxTafWJM0WS+DCZUca69NHHx/OFg5MIJA7prPFsjUCi6FqKe18GSLGO90dk?=
 =?us-ascii?Q?aVigz39YduCRHWwUb12YDQ671LejkeM7O5FeYhcOtEhLStaKyoOLb23uL7wk?=
 =?us-ascii?Q?iHn1EkM1TJA57rR1Imasaj7b2nv4mCB/NGUEl3CJcNceeZ9qH+/F/24rU0W+?=
 =?us-ascii?Q?ufTskPJkJQQm+/OWkUBxTciMjM7ldlSXXkiejuzWkxdms+rdoWzcFf9qFDXg?=
 =?us-ascii?Q?vTKm6ZOzN7TR5cUNND1kL1WdpivYTHGSxE5etCApowSaexBaj3QxyQrCHzTz?=
 =?us-ascii?Q?BNE01ofuNJZhI999aJS5UYdyvqh7eDvwvGAZAXCaFJ2s4N4TFOlhVFBIO+7S?=
 =?us-ascii?Q?b2IBg5CO2JmUqdrIXDCdgL1phI6gUID+KdA0TbTMjGfxFIq1erSYGFqBWfT4?=
 =?us-ascii?Q?uCpjcM/QwHr1wqYGfGnnqLWf4aSKbUmjzpPJj9xAD+J3w7vm+MS/piztetpH?=
 =?us-ascii?Q?i9sZXE+ZoYbAldQCZ7bbdzw+IEHwZnkUE8wk3mDZJPc2IyIKImEJbvyS7Lp8?=
 =?us-ascii?Q?pItP6mL9GtXMVSkbL0uvb6g6xCQq880bAfvx73LuU8C3bxr/D2062QvX42BW?=
 =?us-ascii?Q?EA3uS9e+bwRVigS2swsDMMKe+y/m7/wzNgVZctSvqeFtg5FQSF3W4PRZkQPB?=
 =?us-ascii?Q?jPfCUwibbLNGSIcipc+qF/etfV8vGv+EuQ1ru86FfD8HmdvO8P9OwwVCjgGU?=
 =?us-ascii?Q?YXrCeBoNynbAx761LfRazrF0eDtAxyloJ7HVkGXRyH/7XpN71WEv+N5a7sX4?=
 =?us-ascii?Q?TTsd4HvsU04Sod3G4c8ITjmhdp02jza7N/oV9Gl+3AlX1B7QmbPv/URyrh88?=
 =?us-ascii?Q?fTx+feIzBDNmgxCapDyGzRbDMAGg7DvjNSwcam90d+p5xJ2uUy2h6RZZbvL7?=
 =?us-ascii?Q?ie+NsagreXuprJ4AlKJdNzlTwI5ZqeiUSObbBs4LsuHuN4ufP2Q+0kTLftbh?=
 =?us-ascii?Q?tKnXxUisCkFlSad6D+49sLRL5yPnN6qum8ltOUnBHEJjNKD9Su/t4mM6TYel?=
 =?us-ascii?Q?8kSmENBMHTMUMW7LrAKw5d6ZFTJ6ZbY9cmfLg2ibBF4pAJgt3FoRMVPoisXt?=
 =?us-ascii?Q?QSYjQ1FOJfGFwIuJHh5kjMr9cR5Zgob5heh2PbyyGejRTCbDVnEi1LWGvaKs?=
 =?us-ascii?Q?isHg1SQyLknmj225wvVbiP039i1XZmKCM1jryIKGUdkoENN+821OYwTGMUEm?=
 =?us-ascii?Q?z1I0TXjyH4pOP8Bxp0na9R+2IrbLbScsrfJ/9HlarfE3IxHJnnKAlLlXeZF6?=
 =?us-ascii?Q?ekKqNM5biR3WMjyIUQI/2fLsDr2yAt6mOtW7b9kkRsbS+F7AYYt71Z36iEOc?=
 =?us-ascii?Q?WNXIg8qHf3rQAgOyStP0WBqqg4XqO9rdScfKyC1vONPR0FrNKuavug+GU41P?=
 =?us-ascii?Q?OGryrl6tKRCCSM3QG/CgST0yknRV/gorCWblLk+LFKK3uEgxX9Wnk/jbxOBl?=
 =?us-ascii?Q?1RyQvUAwg0Z+EBu92B5NYZ7tpKXpdTZU/BLPqSvtKzqqiOdESkwvYgKvB5hZ?=
 =?us-ascii?Q?EwfgJmmFjhlJBVhn6geabf+hU49nNd19HPc62p9AgoeCo60AbsOe6Qvez4EK?=
 =?us-ascii?Q?0km+Mkpzv5dtxhaWp1MENoRSDTBTZr+xdz2K4GR2tW4z6/ZicmcqSTOYSXVh?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a356a97-8a8d-49ab-41cb-08de0c6388b7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 03:24:36.9812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DY8UKjU8Bw/eptaYWmlaBq9GMc6DLm0aAYAorTrLQ2oJ0Zt5AejHTOjsm/ayu8GzRLKuLh5Mdw1aSZGaN8SEyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7484
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

On Tue, Oct 14, 2025 at 03:36:47AM +0000, Shuicheng Lin wrote:
> During LR exec queue cleanup, if the GuC firmware is not running,
> the driver cannot communicate with the GuC to properly deregister
> the exec queue. In this case, directly destroy the exec queue
> instead of attempting deregistration.
> 
> This prevents schedule disable failure and GuC ID resource leaks as
> below dmesg log:
> "
> [   50.242564] pci 0000:03:00.0: [drm] GT0: Schedule disable failed to respond, guc_id=2
> [   50.242568] ------------[ cut here ]------------
> [   50.242584] pci 0000:03:00.0: [drm] Assertion `ret` failed!
> ...
> [   50.244942] pci 0000:03:00.0: [drm] *ERROR* GT0: GUC ID manager unclean (1/65535)
> [   50.244970] pci 0000:03:00.0: [drm] GT0:     total 65535
> [   50.245002] pci 0000:03:00.0: [drm] GT0:     used 1
> [   50.245032] pci 0000:03:00.0: [drm] GT0:     range 2..2 (1)
> "
> 
> Fixes: 8ae8a2e8dd21 ("drm/xe: Long running job update")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0ef67d3523a7..d2dfbdc82920 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -47,6 +47,8 @@
>  #include "xe_uc_fw.h"
>  #include "xe_vm.h"
>  
> +static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q);
> +
>  static struct xe_guc *
>  exec_queue_to_guc(struct xe_exec_queue *q)
>  {
> @@ -1060,10 +1062,15 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  	 * state.
>  	 */
>  	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
> -		struct xe_guc *guc = exec_queue_to_guc(q);
>  		int ret;
>  
>  		set_exec_queue_banned(q);
> +		/* If GuC is not running, just destroy the exec queue as we can't communicate with it */
> +		if (!xe_uc_fw_is_running(&guc->fw)) {
> +			__guc_exec_queue_destroy(guc, q);
> +			goto skip_deregister;
> +		}
> +

I want to rework LR queues to use the normal TDR / refcounting scheme.

I don't really like a direct destroy here as it can invert or we have
have dangling refs to queue here.

So I'd say live with this until I rework this.

Matt

>  		disable_scheduling_deregister(guc, q);
>  
>  		/*
> @@ -1088,6 +1095,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  		}
>  	}
>  
> +skip_deregister:
>  	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
>  		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
>  
> -- 
> 2.49.0
> 
