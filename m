Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C05CDE008
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 09:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE96010E327;
	Fri, 26 Jun 2026 09:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRUGjGbs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE15310E327
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 09:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782465398; x=1814001398;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NdgyMHHmA15QLZ5wRBQz5qAykyJvqQj2djJ9jQdi17U=;
 b=YRUGjGbsLTylXmKd6mOKyU8mkqlkxo7Xxv4jNfYV0bfT8NZSdCId6uLb
 0PKUPgfywvW0cb4o2OI8b6D05f2dikZ9FRQnCuRkyUs0HE2lu0iYG6j0O
 TYQeKHQ4V9hhrscbgtCs3+qaDUS4l6JnRmlYthoGGy6Z9q7xeT0tR9o1+
 1tqjRkXo2S+qLzbN5NThQCPEzAmxihER1ppg/NCMgzk32I9gfpkloKTfw
 m7K0gyH9EcU8LXicrmZsumgRW2sEttfdjaPVH5FqSxX1FBFePdRgPEixP
 aJkV4+glKpTySxdPuHsDKl8k32619zDUZcidZ1IpK10wv7HN6titshqZm w==;
X-CSE-ConnectionGUID: MC+cI3hQT96SzeqvKieAng==
X-CSE-MsgGUID: 8Odpm7h7T+ChYsQtT0TToQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="87104423"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="87104423"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 02:16:38 -0700
X-CSE-ConnectionGUID: RwGWXF0gSUKXSqQIPxvbVw==
X-CSE-MsgGUID: XO4OlbjjT8+nqpolN8I8fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="247317672"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 02:16:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 02:16:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 02:16:38 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 02:16:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tR/sTHT0elqcMLMANqlgSYpqTcGPUyXbmI9mz9CwgTpoXnQJsZK5eUemYbWIzOCAZcfgWcyG9WsVbZUaWVyIaoeKhn33wFVYjGG7NBNUh88sB+X7bL7P4nD6sifv7RFoC8u2yyWkmiQ7mUSgdZMa7R4qYkjEimvk1DVBWg62PKALQFqIw35tO+B+bZPSGagoyzGNg1f1P2c6yViAPGra3sDuC7L8x/0zd8TY1+LnI027o0wb/dCfBGPslWOpSPo3t7NkGCxMRCTE1ULTWqYv2MF20FzWGQcvD4B2/cdkPHQcLEzswy/gZRkF4c177gauvVzdwO1O08/AbvHj+sKk8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAKTgxEUwP5+PKmNBvDGLWULbU8vmLvF0O/OLgCuTYk=;
 b=kNtAkaNlwrjOkyW3iLfWSY2SqOwKB25RSDmWgAX/CjQH21eFgMM+8HTPx5QlC7TE491VREE748b07IIStvF9L2J3s9eZjcnV1R1oNtxnlCqwDeGgMm2piOh7a/0wk3CLkcj6jZWdAZTrGfMushAHCzYOxMbgTIBLdQjxn43j2R/oh9rr+DqWNZ22JOzlaycjsifp5YFdppFL++U2/g+DJjMXW18fYjDF5P01dS8jV2q7orhqiN47Zkh87VphkjmGXwXy+mm0Ynsw0V+UN5nxd3MCOd+S+k77bFhBOuDUX1jlVpuYGDdGJYf4hbzMuGRWk1nFOC/hmFWmXAyU5TfE5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8837.namprd11.prod.outlook.com (2603:10b6:806:468::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Fri, 26 Jun
 2026 09:16:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 09:16:27 +0000
Date: Fri, 26 Jun 2026 02:16:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/userptr: Drop bogus static from finish in
 force_invalidate
Message-ID: <aj5DaeJmRViA260Y@gsse-cloud1.jf.intel.com>
References: <20260625224452.3243231-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260625224452.3243231-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: SJ0PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8837:EE_
X-MS-Office365-Filtering-Correlation-Id: 27f7b707-0cbd-4e13-8b4f-08ded3639a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ImvSR2JLEvb+fq6AZHRGXiasKVRfEnQnmigBXgpdvyaO9sdrXo9ohwfuDnN8WjGBRJnwOSCapG41Q2QeQXF0D4lwjgtdewkws7x3gvHQOuZa+zWGcWuFpOzT70fv+tvHKOTQ/ayCBeRGrjWU3mQ2rX68KUGnQbzMLbc+xZSF0I/iFAvd8qDPwjSLHywNco1vLxN06/+jW4Weyi+VG9pkaSdQPOVkTKCWZ8jVgObZzvO+Z9+iebrD3STZLQrodcjPn1SmaSkG1Pm0O2ZXe97bJL6Up3FH8jxOBZY0CtpQ9RD6+1F361dVrHJow+swz1eZa9A4Jdw1J+SpgYSFILUZ3wxRACrvZEcEYrziaXtgABWP5lRAQjd9xiBLGV2zc2YyxDasMvuBxtzmIkGV0L4ykoU81FqYFHolEMuvEC4mXa7H8b+Yy5f5zN2WcL3mDP700GuL7y91siF+9HtgmSX7mobKFCqyuwq6nndyMcKYCgNrFy+tMvYJ9Fl7Knhm2oaINrufmUNGB3NQeVP74BcNpJko7xM4vTmjkiC4xCIDGNmlJz2E3GAJaPY0BA5pRmtkxa5Z5R2Rdm1HtgAd0njgkf7HlcjM4Dw04KWrzQ8sJ/DarG49Kb9oc/uJdPXCWRUt9Z74X2Zon/lXBauYXQBWgA3SnYzn0Ng0/3+mi7UanXQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Gd6sC4jBmXk2UPLo+33IKXG3cEg81IxzhfpvW+rbOXgPV24/4NPxn1/DaJ?=
 =?iso-8859-1?Q?MTdIyP2z7zZjiF1uxkKFD8gIHD1C/pk0P8ogF7wufceDopHwgQHcVCnzw3?=
 =?iso-8859-1?Q?GXkPzOrdmuMnSmIEIiV7pztElx6Gjg2051wBKVYXsXftis7x3A7apGYei7?=
 =?iso-8859-1?Q?/uWYz4cGrZmUrXmPUkGa+PzyGDK75XhXnFdifa4W47exj3HXALOtVTItFv?=
 =?iso-8859-1?Q?GsjrfaqZDQRAKD+wJd0Kha9NGqoyB1bIAhbww7ckCkxSewWtHoP7SrKFPQ?=
 =?iso-8859-1?Q?w6mvX27sqO6HChxsHDl804VRCTpma8f1LQZYhR5p0UdFEC/dVAe97p7SNB?=
 =?iso-8859-1?Q?re3TUNYmNfg+eg6lV2Zq8KyXt7KkmvKwj/PGUI2enUvUIA6EqV26JBDxNk?=
 =?iso-8859-1?Q?gmAhSNBIKXSXnMYI41m836/xLYyYCuld51qXVYwXEIGFYJKTY/FhaqcDn2?=
 =?iso-8859-1?Q?J7BmJu8gbA3VJUdyxqqufIBHLsjr37S6cM+juWsWVlOg8JYUFQal0bNqsb?=
 =?iso-8859-1?Q?SgrwYmCcAyVOHE92Uxoif2YcnTzsFPeOoInT05S+UWKQkIty2MFK6xz/hw?=
 =?iso-8859-1?Q?B2M2schQWCa1PHrevSWt9j6sv9l6naNPn08UXkXXl5h5fyNKr1DC9nKNkv?=
 =?iso-8859-1?Q?FiQOaW/9r0XPhmoLSNRvTx4mprs9imCcpr3cC5/0LlQ1HKnpo9Pj0bKbPV?=
 =?iso-8859-1?Q?c7t/jPJcFV4SLrBaef26V8McFkcYiNhsfAmpYVpxBy30O5QU29bsvA7QrG?=
 =?iso-8859-1?Q?lsTObk+EWIobjNCLmCm0lvIeE6x2aaw8rLVaPE51YsI/hxtS557ONRllYo?=
 =?iso-8859-1?Q?JLlrl0oLBF8doqOLecFuKP25KnsQcGIdtIxBz//QeDxAAOMMcrdaVRp5Ov?=
 =?iso-8859-1?Q?RBsZafesFPLQFDe5woHKyHqo0OSW9N8sM0gfL1T3MxuriRro0DW1mWFb8q?=
 =?iso-8859-1?Q?cs5VYZX5jjNRevIPRj7XWXpAmIMpoyGnafggR8ZW5wr57/xe0Y5iZduTSj?=
 =?iso-8859-1?Q?3L2qm61vO71nMniQPHbMMnAew/4P+WXTwpgL0m/3239TgRuZ9LsDTwxb17?=
 =?iso-8859-1?Q?1ntL8J1UBT+OAPzU2/c+u1T2ltJVWcPYLfzZmYl3VeU7ZN0ethSqBLwTyC?=
 =?iso-8859-1?Q?t/74GdKUb5peXv4N8nlX4IRsM01QWMKS1bF1wvIRXXImLvC4k3b7DN9IIV?=
 =?iso-8859-1?Q?JajRoRoIr07HfN62VkqibIMx+fx06woEpd4z0g8ByUH+LO8I6pZmwekaef?=
 =?iso-8859-1?Q?edGd1FqUKZaN1wyfMrPSdp4JziriPvuw6dtsV4C0QVWXa3smC2a/Mugkfy?=
 =?iso-8859-1?Q?9biu7Kv2550YJcD9wmuRBRY670w2WhLfnDI5O4mWNlmxJLR/nWUYfzj6VG?=
 =?iso-8859-1?Q?QQD3aLvMn2FC0qr6AWQpgkIHjl52L2q6igFsNJAZZ1wwk+hsIq8V8y9ZyN?=
 =?iso-8859-1?Q?ei17piZ4xTLzOhCJWB5wgAwrjNpsqudP+Ev9nPnRvXlHBzBC2OV9R1aZQg?=
 =?iso-8859-1?Q?t3BNfHnlZbGF89TFG72XPzFQOOZzj5PzgsN4ftdW/qT6nOwnQqbhZ2K1Oc?=
 =?iso-8859-1?Q?Jo+trpsy1eCuqmWbMbUkygB9KlNOg62AXpXJPwriuNHfKeCI1B4E5tRtO8?=
 =?iso-8859-1?Q?++3V/5/MvskwXbPN7j3LoUNbSl1Teuqv41i0JkSsBwesWwY0Cqgu0KIshy?=
 =?iso-8859-1?Q?/KLqQr6yjtuC0kXa3g+KXYqAz0MpDjflVVG5FNDIMytdVGyZW2vhfgbNwm?=
 =?iso-8859-1?Q?HjPpncqHQikaIa2f+2FATN0b20B7SMeVAICBHv4zvmcr/9X8Cw0Vilr/vv?=
 =?iso-8859-1?Q?lvmA2WlSeYOgICRoh70T2YQfONbBXKM=3D?=
X-Exchange-RoutingPolicyChecked: s45Nl788ll/8/KSuTg+DtA3CHPmRO/JPh/0ObZ7Ou67QF8GUlOTzXLAZ42+SmJ6mbm70He7FhytenQ+1t0NsFdiHGbVOhlwSxl4CE3OXelA0YhRYk/RCRAF3sk9zL5BiWpqqNxy+QhaO6613GHx++KY3l49Kkd0WeEuf5vkOYSvixQw72AUbeEiWorVmToFxniUzWn/qHoRsCOA1CZ/ZxONmiMbFKBAFIjYnROr4bj8263c1CKpdnHkri+KmycuXjpkonRdFmExLXtbVGqlh3wtivUhC1lyDk/CfH+cft6t6rulcLJ1MM71FDiYs+Mbx1GN5NwAhnO1tlvZO/R9h1A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f7b707-0cbd-4e13-8b4f-08ded3639a32
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 09:16:27.6801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4LjpYCznJ3S/a04zXesLIcRpeEwobtFXwRa+9W9Nx59fkg0V9BqZ0lKQiUeVm5xEK+5tA8wY8zYrUHEvPWKJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8837
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

On Thu, Jun 25, 2026 at 10:44:52PM +0000, Shuicheng Lin wrote:
> The local "finish" pointer in xe_vma_userptr_force_invalidate() is
> unconditionally written before each read, so the static storage class
> serves no purpose. Worse, it makes the variable a process-wide shared
> slot: the function's per-VM asserts do not exclude concurrent callers
> on different VMs, so two such callers can race on the slot and take
> the wrong if (finish) branch.
> 
> The function is gated by CONFIG_DRM_XE_USERPTR_INVAL_INJECT
> (developer/test option, default n), so production builds are
> unaffected.
> 
> Drop the static.
> 
> Fixes: 18c4e536959e ("drm/xe/userptr: Convert invalidation to two-pass MMU notifier")
> Assisted-by: Claude:claude-opus-4.7
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_userptr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> index 6761005c0b90..6f71bc66b14e 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -269,7 +269,7 @@ static const struct mmu_interval_notifier_ops vma_userptr_notifier_ops = {
>   */
>  void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
>  {
> -	static struct mmu_interval_notifier_finish *finish;
> +	struct mmu_interval_notifier_finish *finish;
>  	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
>  
>  	/* Protect against concurrent userptr pinning */
> -- 
> 2.43.0
> 
