Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ED7CFC510
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 22:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F2710E90F;
	Fri, 21 Nov 2025 22:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYvv+MIk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5F610E90F
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Nov 2025 22:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763764447; x=1795300447;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nmHVn7F/6B2gCAf6xMzaS9B/3bMSXhkjZAEmW4umqa8=;
 b=UYvv+MIkV/sFFuQVOagYKelvbPpVACE+bLXkgaMx8gzqevLEfiYoIhvU
 o9fSh31RSu6FqQ196OnXUi8j10LVg+cEFnUloG4DbghCAmff9m5qBXlBE
 HoZkrEC7ro0AA64GdVYTUACwuIyZnanU1l9/lVcup120lPTt3AF6d+0br
 ROwKgvjyarwrjGabpSFHpT/Xzx2+yvkolRLoegQSlAASb4v0nzFB+g4Dk
 x3xsbV8jgsVbYMLz4X7p9a8b6hR5cqGDuDPuGGu2FNR0Vf3WL3RbARCH4
 Vfle7n5akmiceEemt8ML+pIvXqaMKeWyXwR9pTVTFGwpGt+yxK1wtXjRf Q==;
X-CSE-ConnectionGUID: C8ofGZG5Qvmw4SEPkYzXIQ==
X-CSE-MsgGUID: PJxeYMixS1agfi2Ouvuwag==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="64869132"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="64869132"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 14:34:06 -0800
X-CSE-ConnectionGUID: Wjd7iLzBQD2ehzSm4hK3uw==
X-CSE-MsgGUID: T85H/zzCTPal+HFH7b4/Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="192581671"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 14:34:06 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 14:34:06 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 14:34:06 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 14:34:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWArp+tO2YsKVezYpBeSWhbsuJjO484Wrn4qJsn+SQHQhttt7c3oCA3b5/cBynD7txUx8505v6HKIL+E5/VE/mfPC1kM+iC3IM15l8dkanJPEq1oiANWAQamsdjBBiQCYaCu43PwK3gY1JGXkmNf499/0BLrVnrFKuPTycw3YFQnC057YGdPo1Piowh6YCiwz+FauCf1cU33T3LInspIrjfZxxXQGxXv98nh+z9fPITxLmM2ksxkqyBDtpkngkGpV5SEPo3KosUj7wUDF0PGwgZrMYAB7DqJSVOSNeoyY4zKRtbrHD/WvgcmRijpUir06BAfRntFBLj7DexAeAhZjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCgiE+Xu8p2cmEgRoWw9MLC+erTcURAjPBjOIQUPqoc=;
 b=FDl3h4/I2N3AI8XfOUsJpe3qbC0hncoB2VsfKMBpkR9Z9TM3Vmi4aI/nAuVj0tCufGdfQI/3spZupMKm84OPKVHFZqGC9JF7DrrpxNbz5K+57mnsqL9mTGI7QmUN8FTpqMLS/IsbzHGUc+/5veVPbgJOQp9FwyYx6n7gx023dGHr4oi8F87jaLNTRkzeac8jm/dkVvhXDxVBlCwpgjletGPsCR+jSXEakZB5cWHszge0xguNdQxtqv+mY3zkkN857veNR+9RNKZoF8jRGZZoQiUiP0KlNnLSg9q+tDwVVWqJNBe44gexTwuyOkQvd8jP2166kkHXTFGfWipFKtwKVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB6619.namprd11.prod.outlook.com (2603:10b6:303:1eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 22:34:01 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 22:34:01 +0000
Date: Fri, 21 Nov 2025 14:33:57 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/xe3: Remove graphics IP 30.01 from
 Wa_18041344222 IP list
Message-ID: <20251121223357.GA4065316@mdroper-desk1.amr.corp.intel.com>
References: <280ab3e8dce8d7a40540ae634a5432694ac17ab0.1763762330.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <280ab3e8dce8d7a40540ae634a5432694ac17ab0.1763762330.git.harish.chegondi@intel.com>
X-ClientProxiedBy: BYAPR01CA0065.prod.exchangelabs.com (2603:10b6:a03:94::42)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: cbcbdd33-d54c-4be9-5cf5-08de294e115f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QBb54HeiMAonJn611oL6tPIziWCRs990HnzulZNFQeKUnUnwb7j7LK6FRcqd?=
 =?us-ascii?Q?Zzjlmr/3OgOMw/tGkv5kcEEwtjf41FGm2B1H4eWST2BvHZDdoLn9fLmHIpLu?=
 =?us-ascii?Q?1Eb9CxZ15kbCKDd06N+b54EalwD5TcmHplxUEG4v1ITgEX52IdF6xv9qJOQZ?=
 =?us-ascii?Q?Vp49PcNlYf02Zh3SRfRpJn/NAbFJVf6l86ZAQyr+05fS6k92vWiQJermWbGb?=
 =?us-ascii?Q?BX2zq8Rw4rbIfpHuDkix7kTX7uJvaosWg6iACPJInAMuaS3pjNVxfLjHJSmo?=
 =?us-ascii?Q?5UjPO0LST07y13g+vCek16f2Bz9Shzdvu1WMqYZegQ4V0zlhMFDdZ/AVrDaq?=
 =?us-ascii?Q?fGOu4eM+BlQ6SUS9j5d5d7pAHTtaos2zakzRq7qOX3xXVumEG3igqArtSt6h?=
 =?us-ascii?Q?8JShudsJyOXcKdkaVQKFJ0uvoBDkyfc1D0ZQ4UIUSytgtGft1UrqakkH8hs4?=
 =?us-ascii?Q?Y13+hOXGQ+gMN89Y/PWZgE5XOy3bBAS9OQiS6UCapjhXPDoAjgZtf0Akv9Qh?=
 =?us-ascii?Q?dJiqlp+5d6SlNvPT1JguC7r5pWBu7CsmahbO/uNzxsSGZ1qdQ5qZpIKJdAyh?=
 =?us-ascii?Q?p6Gsvid7rRCXOewoyrEBRUL6WNirSD13NU2yXHUdc/kq0NQs9YHl5cVJ46g3?=
 =?us-ascii?Q?D/J6BPa6fSjIEKw2PsI3q67HHlctdhgQsPck6N1oQhxaOAcjCj1NOzfmxdip?=
 =?us-ascii?Q?LiWeZ6mmsYwbwpIAOfpXmeMLhX3z5M4nmU9S3q8QQt/bKPl085UObamxgBhd?=
 =?us-ascii?Q?Jn8EX0UzzQMeoczBrAeO2IlHS1pNL2VnUnw3L2ATzerLKw/VjnVGTCuYFons?=
 =?us-ascii?Q?+ENBPKeMlY45acgycom/Ss3nn9Cz1Oz9J8dVapCkkww6/PwdlwKVxHoYs52T?=
 =?us-ascii?Q?woqbnUAOaQDlV3UGpuyLpC9Qi6vfYxxwQv4pO0hZ9ITmlksq7l29+iHjAj3B?=
 =?us-ascii?Q?qy8kdPSXsN7pI0Y3/TSgVblnyln4CfbSNx+/vXrv4XW8VsXtRnjWbUzRAiOW?=
 =?us-ascii?Q?9yRQu19b2KEndX7TCUu6tzOpHFozR8RNt/VQyM65hIqnvNf9Rd6v4FLhJoVw?=
 =?us-ascii?Q?7X54StMU5v34t6cZQ29lmJmnWTbRyBmVI7NuG+W2oCOAnZEevfKobqqRZBYR?=
 =?us-ascii?Q?0u96Zb0iwaRQaYg+a/E4OY4qvOMDBYREwKMR7UOtP6lje1/MNJH915giY/lE?=
 =?us-ascii?Q?Fa1CXAyK8+QlVp6Ypn/ApPc48Vm1HR4YPfWBXSw5OK/5kFEeV/cOaH2uttfD?=
 =?us-ascii?Q?hUTf0+w7BVZZj9Rm2I5IaD2XYohcvK/QCTKqN9nX2SbTAWE9KYfilkIb84RB?=
 =?us-ascii?Q?mkrlcAjfG63FHsTj6cKiGdWlX6T65zSGHjdvHdrTufKo2b9lx/jM8jtVaR6A?=
 =?us-ascii?Q?LrSeS0SO/CGtLlzfxAjpcJn7u2q19CLeXDPC35nmLlBN0rLOx9r4L6Xm9BJA?=
 =?us-ascii?Q?o7+X1ANDhC98QknsuuF6YXxmmJfWGKR1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?enwPObxrfv6LL9C6GqbVe9D2JZlnFn4TSO7AgnnsMinIq257pTB6XzUzeQOK?=
 =?us-ascii?Q?BRSa/w6mAwBhtIvM0tjCul05KV6Peud2htuCcHBLq0nD1TcW8y+gdz2mXE14?=
 =?us-ascii?Q?IQmAOG2L88ynaiY3XGFiQHi/KqR3m7etQPs8F+vRM5qZos7RFqCHmmCR6t0r?=
 =?us-ascii?Q?O6/HWejSq2paQgNyXaCNuWM/Wx2nEBFe3plj5rHTvTwj+YiplGXWqUCH8T5r?=
 =?us-ascii?Q?HX8CkurCsSydu3XzMkQSZ8WoAP89OzglgGcoeM1CLdkMao4fpPTsZz5DiBwk?=
 =?us-ascii?Q?azygoOOjW2+zYYU4qX2PMrY+iETB7pO0VQL4EDxO4TjnBEkYNQFZ0DoGKCrz?=
 =?us-ascii?Q?zxOLGR2KGfnmGFiMT/0OA3rrr/ggI1Hb8NZvleqkp5otgJPlVTdsENESPI9J?=
 =?us-ascii?Q?GRSuFPvmX0PHcc5D6iKuhAC+e1CvRM5qxYyVcZQxiaEw5d11B5hwGRP0T61x?=
 =?us-ascii?Q?FpfkUtw+MqFmtpBOcN2CRE1wgkIb1WGmYg0Qs7DIZ8dQKQQDqXbuiNenOJl1?=
 =?us-ascii?Q?CaOHS5w1tYbPU6lZEmbJpd6tlZQ3hI063I64S5Ufe0J5oPwUXFmxXhhO/HQO?=
 =?us-ascii?Q?gZLswiTjc5NMg7ic+MUVTourix8Hb4dpe6iFOWkozqiwdoAhsEGhGjRLF4gr?=
 =?us-ascii?Q?TvnolbABHaF5Rzupeq57D9nJvaKK57/jbxcTQEWVahE1mYv+J3HYC4P7Gvfu?=
 =?us-ascii?Q?EiGNM4v8VdgAgzRuabqPnk6kfJ0K0Zd+lT3hm9KwBR1Ln/qzOQvCk3/wovuF?=
 =?us-ascii?Q?ZkBoQ8dbe/HW3NTHsHCsywn4lNHmU9NQzY4BfW/cu/iIHUh4jeyDYSSQr4+b?=
 =?us-ascii?Q?mnOn1hyD4dIpIzNGe5mOEjFkMpTEpXAeLFQkCUIYCzt3InAZz/bXVWB95OF/?=
 =?us-ascii?Q?/9YUO96iV9pvZShpn/xS86rHizCoST2cFIWxDxDjvS3Km2XwuF1oVg1G+o86?=
 =?us-ascii?Q?Gwq5oQRwnJHvz2CjAl0inpYHVasrNlp7tszmyfuOutoUXO85S6+ZXuQu4wTD?=
 =?us-ascii?Q?GnpjX6/cdX2sZfB8b9jsfuKnO5nZJcbClkaUQpzdPjoByAUQuIVF096nELfp?=
 =?us-ascii?Q?W9wTWSkvGj9WVBgZFB3MZFNjCr4GHcLKemVditdrOlCTxxW8if4ZzCfuAw/U?=
 =?us-ascii?Q?nUy0+/VOco2IAh70dnEireKhWou9KISOdWmAs+TonUNiodvSglxu996CD1KF?=
 =?us-ascii?Q?kMiE4Y/05kMpmVzMKrk1j+vbggWeKEZ7kLWwmPY93v/3EX1TDGMmgP2RLoYE?=
 =?us-ascii?Q?eEJRVqrz+QxcHqKe/LkAoj5STjzcxxkRt0hROtn0aMj785rA5p1Ibv5CNXtT?=
 =?us-ascii?Q?rfzzVf6KdfKeDeoDlkIst0zN+Pp43wYAACAsusjxuGbYPn7uqvoPOaJOixeS?=
 =?us-ascii?Q?MR6rHnWhWERqGG9JcyRcqK4c9IRJYJxxE03PbF4Ob3/HOBXWkvaPDFaLfxgW?=
 =?us-ascii?Q?TFsT/h9FVg5OrZUwtHonWk12vv1pFw+aKtYcru9v0dF4UvzSvGAlAYFng+18?=
 =?us-ascii?Q?jTUmdP2rgpcWdcKMfxQqhdecLVhmB4xk58RaYxGEEbwVpCsL5OxqmLEmvi7d?=
 =?us-ascii?Q?ExOk7rQp4XJokdP5OTgvywwnPOG2KFKgL0bRpIybn0bEWbLLf/A6pKxnj1GF?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbcbdd33-d54c-4be9-5cf5-08de294e115f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 22:34:01.1446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p38bIqsRbj2tQjOZtmA5ha9DzzFKppnzdbnS2Hed5xS/RyH+Iu3bXG+C28RjOSXAd4jCSoyXBWOazul/dUEvYecx1iV521U23QCcl3rcMxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6619
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

On Fri, Nov 21, 2025 at 01:59:17PM -0800, Harish Chegondi wrote:
> As per the updated WA database, Wa_18041344222 no longer applies to
> graphics IP version 30.01. Remove it.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 3764abca3d4f..237d96d6e275 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -701,7 +701,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
>  	},
>  	{ XE_RTP_NAME("18041344222"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3000),
>  		       FUNC(xe_rtp_match_first_render_or_compute),
>  		       FUNC(xe_rtp_match_not_sriov_vf),
>  		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
