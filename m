Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC961C531F3
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 23:57:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876CC10E08F;
	Thu, 19 Feb 2026 23:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ULvQTa2O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C0910E08F
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 23:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771545452; x=1803081452;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K8GSysWCgO4uQuo5NNzCTx8sV/CqL6h8QYa6/7/Gdg8=;
 b=ULvQTa2ORlQQo/nZg5MDLO807xDYDDorN/g7boCJ9SY9It2G5mBMjieC
 YCzoYRrIZ49B4B/UEAcqsedecDtPuFrF8eRZVOuuNChuet5qJwznF0Gfx
 AQH/eqmkG3jb3n+M4O8K4O/uTFcX3SM295VGFSdbg6sBnvGTCygffPO7Q
 +aA0ARIiFAGN/WAnq3WazjWl3qT9oKErPN2f0YJY+DB/4b/qBw2z8gZ9V
 WykUoOkcee2e/VflsMhxTtQUVdZfWNbq+QodO7abGxxK6nC8KWueDX+zg
 D6/VZLR8hdrQlnPfhFDtXFxFr4TMbT+YDSMT6Bd/fAq2Z0nPov+Xlghem A==;
X-CSE-ConnectionGUID: E8iB5Y8tRPGXLAFOC+tlAg==
X-CSE-MsgGUID: l8p/BQHbS0+pX/OhLeG+0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72525095"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="72525095"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 15:57:31 -0800
X-CSE-ConnectionGUID: TTOcwzXySA6Sqs1cTXLIIg==
X-CSE-MsgGUID: 20gK4x+mQDOm6sNwgWSY7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="214808572"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 15:57:31 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 15:57:30 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 15:57:30 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 15:57:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfu17JZhDF28C6ULCrfeKfvHdQX9DDmC65dHbYbBbXdbRaPD/MhyibiwBVbDH/JcDoyz6OE1ogCUB+FNVPT2PMFs5MEcRxZ70uiGFc/5QfTiOfpsHie/TQqntgNAK4oDNU2Vcz/Bwc8KtQylxnH0kve27IclG826jv0g6ensLQGMnUanIJ29zTMWBVh76q7T2VVfENg9tf0hFugZVeW5QiG15/scSagIjmOQQ1giRmZurseOMwmLRk1EA4LSeY3eqibWtaEv5T6GNgavrw/EYOFiCg+VsCSTQ7uPbozPm0IRKebPDFKA0YHbL2PgjyGQq4dLs4dMEvTbRX1M9ezBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvZxIWLDcbnIdKcQgM+yd80DrbYBStzyIEO/RrZomsI=;
 b=nuBdp0rzp/dBRWZQGp8KpUFaP9+Uq2qe0TkNPYLHTG5uLxaSQpGdsFrnjcWgppSsVeesdhNfZgUEuY7clTWyFwr7jT33eYjlRI9FovWn6JxBhrICZenrEoXSfNVV/zytdYam9p7ZwgBX7ihaksYgP37wkdzO+NMiYCc23lb8UcWCL12/tLuTmZjoR654mlEdLjOu7TSpjXRM987gGSYs7AeJ0KAe3ODTRlLZMFL5/WKtoKj5EYVqtUe1rqXgogjO83kOvZu7s1sXBtwLslsuBITKd20FGk1ODvO9/LO2EMnbETHVGXHVTdLEuEHBWk6eFdrM0GYdSAXAycv+8QVJ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM6PR11MB4657.namprd11.prod.outlook.com (2603:10b6:5:2a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 23:57:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 23:57:27 +0000
Date: Thu, 19 Feb 2026 15:57:25 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Nitin Gote <nitin.r.gote@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/xe3p_lpg: Add Wa_14026781792
Message-ID: <20260219235725.GI52346@mdroper-desk1.amr.corp.intel.com>
References: <20260219082931.2199618-2-nitin.r.gote@intel.com>
 <177149531383.265880.13976395668572684486@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177149531383.265880.13976395668572684486@a3b018990fe9>
X-ClientProxiedBy: BYAPR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::41) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM6PR11MB4657:EE_
X-MS-Office365-Filtering-Correlation-Id: a9805f29-fcba-4dd1-c49e-08de7012a291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?72nbjibRrz1+PTZKPgHFd54czlfXe1lBOEJsFVwg76dlimok5CNHtUwwdPAT?=
 =?us-ascii?Q?4uORSPqbRaWCteiRPnBiVp80ee03lofpcq77p7RawtMYpFnpyVNQ/j9ChUFH?=
 =?us-ascii?Q?m+h+9cYuK7udSqHGRM/CHQ09hQNinLOwzVluxXo+K+Oxz3mqG7ucLEJEi0mk?=
 =?us-ascii?Q?LJL2WnsDJvE4Y3t/nxFRV4sZ0lJLjvLlwU+2UKSJ/njXTwMXInZVBkoUdOHs?=
 =?us-ascii?Q?jTV5Ah8lZYPh2YpgO5uuBXayM84r+AfTyGerrUDTmbtIaehtLg45u+gHHzlJ?=
 =?us-ascii?Q?lcfMJ7mwglxd/yqwj5qKP4BhD0woXZixP0VSlheAOSM/cUcjzZe00X/x9vol?=
 =?us-ascii?Q?5KT06rfGEehPQb8iT52jOyATfWdiz+HPrkV0/P9KqSclFTg96jUxKgEc9XE/?=
 =?us-ascii?Q?q3qpssx1VT+5KX5w0/Q69F+XcFCCvRzj7bSNKVeIjP4yHkJMD/JmNlJ66lcM?=
 =?us-ascii?Q?FF18aFzoqlyk5ciJp9ovRQSWPhbZ023CxH3feBExWi0AdUNIm1WjHuaaYckL?=
 =?us-ascii?Q?PsBtU0OIsBkNPkfZjL2zT+79iCWhQ0crIjmKl1CrvzUP2YNDZNd+V2zAQaG8?=
 =?us-ascii?Q?/Af/WkpgWAA8NSfEHFW+OyNludA3v43lgBOOVF2K1HQXOUwBIkDFXpN+81za?=
 =?us-ascii?Q?SgTuWvC1QeVmOEx/TaGNXBF9OpneGCuCLBKhqGf7DfI5mGD0Z26gMKkwH5KH?=
 =?us-ascii?Q?spOfquqp8a9j5D/KjyIImMz0uPulkJN2S99by+IsaqJ62H2YrCCONxWCr8RQ?=
 =?us-ascii?Q?pRmQmc6Bn5gJOpq+EJKD82P3PFFsXYWkYhWfSrtD1jvrvMnj/2b0Mx3WxG88?=
 =?us-ascii?Q?XcseztIGtOgN6bBXsVRabyE7jcgEBHUczPu/q379AAO4v3hOKA8YtQekWtdb?=
 =?us-ascii?Q?f+6ke6y6vp63PSBRU/unVbExeJzeQIBzjlWrBkoaIVJhbr/Gfva9nNDvNzDc?=
 =?us-ascii?Q?p6RhpzQsqOwrwSncP3vgufc2EpVQ2/1CfPvHP8YcweY8ycaaDD4AD7zAYPEG?=
 =?us-ascii?Q?/j8dAoHNwRuDiysCyNtGpsqT3vZE0eZ/EWlILYU4MQjWQd8T1x/2VTJgengV?=
 =?us-ascii?Q?0ErUdKpiieeH2405GikDHqnEtITK5B06EZbnzkQJnv+/nxrPYd3IM8xOlVlK?=
 =?us-ascii?Q?Ti7d0khSEAc3lu83Ko+Z1CpbNTEkcNaJoPk/yKCNxt9jVFf7CFVqO4zDDmE5?=
 =?us-ascii?Q?hnaM1bmTt4ozmP7gSldE974ecd9IRLzNvFQbcooKMlSZuml/pmgVMQi9XuN0?=
 =?us-ascii?Q?wv9dDRxcEfra0Q4YBgjEOgck1D3xZXm94ZZfg0lJY9jK7DM3v3/qP0JK62Us?=
 =?us-ascii?Q?dpj5ZFzuVSjYMw86tQg22MtZ0Khwljw0Nlc91DR0YU3Do2T3NvwgUDLlpv8s?=
 =?us-ascii?Q?75vNn4jSQl83OMiVUFiO7Y4VcJe7r2p67nBRExEbuwreeB6ISgGxcNTUOVM9?=
 =?us-ascii?Q?5ImPWNSqOnJoUX1WKNhvhVfjuTK3u+wvyqeZ22qjw9jIEOtts8nJhrcmOR1D?=
 =?us-ascii?Q?d5KOx+qTprdaLnUr+PWbLJZ/BcP88E7lBAqK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4WSqsXPC1wesPa/llG9G8hK17tSq/6tQkKIU6o1TY8tCaRZ1LNr6dZDC5/B5?=
 =?us-ascii?Q?9f0pEl/ax9bDJIzGpaGqN/a+lYdhnwtus4tzmHSjoXvu3Ow8zRHKET+4qJjf?=
 =?us-ascii?Q?2W6x/WaxJQEw21ssNLKp7YH+GXg041da9ZuVAzXDRC1weBWEU5CiB6jG7KtN?=
 =?us-ascii?Q?CjjsHvEPofO8AMl1mss/rKoKQeND99TroprFGoSDpVJ2R/AK78U8JPhlQg7T?=
 =?us-ascii?Q?lixp3Z27FXbp36pUALfjdZk6RsPqDM6fw3pjtKAlHr6nS/LJleWhpVeFqir7?=
 =?us-ascii?Q?PZ6QXXUSzZHWNuYtnZr20rYDnVYp2ZiqSFn3roBktKW6amYol7BSHdw/IeNW?=
 =?us-ascii?Q?0k3vdDOOy68JFiU5dsT8XBmAZAyK4l7n3f6jpM3/1OjoADLlAow6E+TMTARF?=
 =?us-ascii?Q?wG6vBLMQ/ug0cv+yYCz6Pb/2is2rIEZs4xL53rRBx2Men8JQ+wz2nB7AnCpA?=
 =?us-ascii?Q?KQNv4xcLpJ0TOEhXc70oMTx5bO93VWd/Qh/7lqDFp1H8L5+x5LSLSR1tZUht?=
 =?us-ascii?Q?gVcrL8it4Eug/7DJHQcVmBTPbrGoYe5DBiROiiIiTQmV/1yA8R+BOQ/SRrqN?=
 =?us-ascii?Q?5YYM0CPY1ZkhD1cxxSJygRpsgsv1lh92azPb8TCEeLfLO65JQtEKVIlqGYfI?=
 =?us-ascii?Q?wgguBV4wZWIyUfQaOTzi2E636pkF+O/d2I5bhl6sXJymW+273OYRq+MYNUoK?=
 =?us-ascii?Q?8zMCHzV5yK161ak+QHfHSJLI0BrswzLp3Oi8XYqZY5RkmflqJ2dfNlYD+J01?=
 =?us-ascii?Q?IzOvjBwjgGd4/lVThGFx9DhGKhGj4v7VWUp/rUSnUf3kggFirN4lVJtkW0M6?=
 =?us-ascii?Q?6gMBc2juWxrubPrGZAh4ZR2MW8zIzZ9Ncn1hqnDzImju6pqQDHcC4i9yvIpF?=
 =?us-ascii?Q?p7d4Jl4/bIMlj+OkFAN9F+Z61DJy8hOBkizWlE/oZL34ZTnO6gQh9I8Xoaxu?=
 =?us-ascii?Q?l9H60DqyV2FQMWWSylRimUqjtSap8x4nnZXzrS0So1czRah+cmi8/n36eX2w?=
 =?us-ascii?Q?UAc+8HzSJQ5XMcDCXpgBBlQFeqIzPf3miDdxrXitMp8TpfsRSKSCfyt6g8ou?=
 =?us-ascii?Q?bSOuWFmOFTO44oWcjWjPTmlsM1X0J0k+jBvOMw9q7lDJXKEpKEKS4Z7NlQLw?=
 =?us-ascii?Q?3cPmOAiBL/pRinrvH2rBvg2Oy+pXsSemK4+ukxY/gEANXRSBpK/9bITfyiSB?=
 =?us-ascii?Q?rW9Wb+ArZzZPQSfCpJEYdbw98yuYL1Fy1NB+1qdCrLhI5998HlUBQgl1dGjF?=
 =?us-ascii?Q?uLoBsbFTS3TsWL9DXH+FqUKJZQD5pYq8IOW84y+8YM/rAlKscZxERStniE4K?=
 =?us-ascii?Q?j2tFTMAmgYKoJmalstBZ7o67cC0uBwq2dh0HVfcIssFZvSxK74YBhsFDxUFt?=
 =?us-ascii?Q?aFQiT8US/SPlwY5DyKrlmrb2b8qY+UioIR4sx4Ker53RPgtDFUujBM61/W19?=
 =?us-ascii?Q?CmiL7wgIUj8MKoqlxkrayHe8VNyDzFnsIi6HzEYPFINnDKacKfLVVxJUowh0?=
 =?us-ascii?Q?yDRHBTUamGdJ4DTqVmLNA4k+iKa4Omb+az1NH9fzmt6tPiU6QlXn/9MLiDZZ?=
 =?us-ascii?Q?6dRbDt1MBVobyYnsMsmS77nulN7aCADZvpN7SuVJ5D6dAGo8/3l1ZdTE6ZIp?=
 =?us-ascii?Q?OQTALh+KB8ggtbPdK8ApvEXKlUZIdeNsHQk4re1VjZVyZU3ufVN7u05vLtlx?=
 =?us-ascii?Q?7qXIcp9n3uW+tVBMVFSLHd6yEAocHS+jAnmerqln9kFJNNBtvRIMmVymHPYA?=
 =?us-ascii?Q?uNri2eXRbzfQNtXLCpZpqEZEBjw76mE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9805f29-fcba-4dd1-c49e-08de7012a291
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 23:57:27.4604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMC52Hz1t01HiKzVj2AIESDRZbZKJSPz8EghO40s7T85hFtJO5Vdp8SLElLaLxUAhV4psbXZjKG0cR2x4sjwCt1pTlkhXQ9+A56tnBmhhtQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4657
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

On Thu, Feb 19, 2026 at 10:01:53AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe3p_lpg: Add Wa_14026781792
> URL   : https://patchwork.freedesktop.org/series/161812/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857_FULL -> xe-pw-161812v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-161812v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-161812v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-161812v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html

Machine never resumed from suspend.  Not related to this patch.

> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
>     - shard-lnl:          NOTRUN -> [SKIP][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][4] +4 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

Both of these are a matter of a display modifier not supported on the
platform.  Not related to this patch.

> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/718

> 
>   * igt@xe_exec_system_allocator@twice-large-mmap-free:
>     - shard-bmg:          NOTRUN -> [ABORT][7]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-1/igt@xe_exec_system_allocator@twice-large-mmap-free.html

Seen on other recent series as well.  Not related to this patch.

> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-bmg:          [PASS][8] -> [FAIL][9] +1 other test fail
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-8/igt@xe_live_ktest@xe_bo.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@xe_live_ktest@xe_bo.html

Collateral damage; device already wedged from a previous test.

> 
>   
> #### Warnings ####
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-bmg:          [SKIP][10] ([Intel XE#2229]) -> [FAIL][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

Same as above; device already wedged.


No regressions caused by this patch.  Applied to drm-xe-next.  Thanks
for the patch.


Matt


> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-161812v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-bmg:          [PASS][12] -> [INCOMPLETE][13] ([Intel XE#6819] / [Intel XE#6891] / [Intel XE#6904])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#3279])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-3:
>     - shard-bmg:          [PASS][15] -> [INCOMPLETE][16] ([Intel XE#6819])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-3.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2327]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-9/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#3658])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7059])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1407])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +9 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2328])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#607])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1428])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#610])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1124]) +4 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#2191])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-2/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#367]) +2 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1512])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-4/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [PASS][31] -> [INCOMPLETE][32] ([Intel XE#7084])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#3432]) +2 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2887]) +9 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2887]) +4 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_chamelium_color@ctm-max:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#306]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-5/igt@kms_chamelium_color@ctm-max.html
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2325]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-5/igt@kms_chamelium_color@ctm-max.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-fast:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#373]) +2 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2252]) +9 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-bmg:          NOTRUN -> [FAIL][41] ([Intel XE#1178] / [Intel XE#3304]) +3 other tests fail
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-3/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@dp-mst-type-0-hdcp14:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6974]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-1:
>     - shard-bmg:          NOTRUN -> [FAIL][43] ([Intel XE#3304])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-5/igt@kms_content_protection@lic-type-0@pipe-a-dp-1.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#3278])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-3/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-bmg:          NOTRUN -> [FAIL][45] ([Intel XE#6707]) +1 other test fail
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-10/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1424]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2320]) +2 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][48] -> [DMESG-WARN][49] ([Intel XE#5354])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#309]) +1 other test skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#323])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2286]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#1508])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#4210])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#4354])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-1/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#4294])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2244])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-9/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#703])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-2/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_flip@2x-plain-flip-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1421]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-1/igt@kms_flip@2x-plain-flip-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
>     - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#301])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#7178]) +4 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#7178]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1397] / [Intel XE#1745])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1397])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#7179])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#651]) +3 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#7061])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#4141]) +14 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#6312])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2311]) +22 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#7061]) +6 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#656]) +14 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2350])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-10/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2313]) +32 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_joiner@basic-force-big-joiner:
>     - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#7086]) +1 other test skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-3/igt@kms_joiner@basic-force-big-joiner.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2393])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-10/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#6886]) +3 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#6886]) +9 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2938])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#870])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-5/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#3309])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-4/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#6693]) +1 other test skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1439] / [Intel XE#3141])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#1406] / [Intel XE#1489]) +8 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1406] / [Intel XE#2893] / [Intel XE#4608])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1406] / [Intel XE#4608]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1406] / [Intel XE#2893])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-4/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#1406] / [Intel XE#2387])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-psr2-no-drrs@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1406] / [Intel XE#4609])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-7/igt@kms_psr@fbc-psr2-no-drrs@edp-1.html
> 
>   * igt@kms_psr@pr-primary-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1406]) +3 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-6/igt@kms_psr@pr-primary-blt.html
> 
>   * igt@kms_psr@psr2-primary-page-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +11 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-10/igt@kms_psr@psr2-primary-page-flip.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#1406] / [Intel XE#2414])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>     - shard-bmg:          [PASS][97] -> [DMESG-FAIL][98] ([Intel XE#7129])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-7/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#3414] / [Intel XE#3904]) +3 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1435]) +1 other test skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-3/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_sharpness_filter@filter-toggle:
>     - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#6503])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-6/igt@kms_sharpness_filter@filter-toggle.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#1499]) +2 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@xe_compute@eu-busy-10s:
>     - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#6599])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-4/igt@xe_compute@eu-busy-10s.html
> 
>   * igt@xe_eudebug@basic-vm-bind-discovery:
>     - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#4837])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-discovery.html
> 
>   * igt@xe_eudebug@multigpu-basic-client:
>     - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#4837]) +8 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-10/igt@xe_eudebug@multigpu-basic-client.html
> 
>   * igt@xe_eudebug_online@breakpoint-not-in-debug-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#4837] / [Intel XE#6665]) +4 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-3/igt@xe_eudebug_online@breakpoint-not-in-debug-mode.html
> 
>   * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
>     - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-6/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
> 
>   * igt@xe_eudebug_online@pagefault-one-of-many:
>     - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#6665])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-4/igt@xe_eudebug_online@pagefault-one-of-many.html
>     - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#6665])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-3/igt@xe_eudebug_online@pagefault-one-of-many.html
> 
>   * igt@xe_eudebug_online@pagefault-read-stress:
>     - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#6665] / [Intel XE#6681])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-9/igt@xe_eudebug_online@pagefault-read-stress.html
> 
>   * igt@xe_eudebug_sriov@deny-sriov:
>     - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#4518])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-6/igt@xe_eudebug_sriov@deny-sriov.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [PASS][112] -> [INCOMPLETE][113] ([Intel XE#6321])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-mixed-threads-large-multi-vm:
>     - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#688]) +4 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-6/igt@xe_evict@evict-mixed-threads-large-multi-vm.html
> 
>   * igt@xe_evict@evict-small-external-multi-queue:
>     - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#7140])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-9/igt@xe_evict@evict-small-external-multi-queue.html
> 
>   * igt@xe_exec_balancer@many-execqueues-virtual-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#6703]) +12 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@xe_exec_balancer@many-execqueues-virtual-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
>     - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1392]) +2 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>     - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2322]) +6 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-9/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
> 
>   * igt@xe_exec_basic@no-exec-userptr-invalidate-race@vcs0:
>     - shard-bmg:          [PASS][119] -> [DMESG-WARN][120] ([Intel XE#6652]) +7 other tests dmesg-warn
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-6/igt@xe_exec_basic@no-exec-userptr-invalidate-race@vcs0.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@xe_exec_basic@no-exec-userptr-invalidate-race@vcs0.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch:
>     - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#7136]) +4 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-7/igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#7136]) +14 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html
> 
>   * igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#6874]) +31 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html
> 
>   * igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-basic-smem:
>     - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#6874]) +11 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-5/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-basic-smem.html
> 
>   * igt@xe_exec_system_allocator@many-stride-new-prefetch:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][125] ([Intel XE#7098])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-9/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
> 
>   * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
>     - shard-bmg:          [PASS][126] -> [SKIP][127] ([Intel XE#6703]) +54 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@twice-large-malloc-multi-fault:
>     - shard-bmg:          [PASS][128] -> [DMESG-FAIL][129] ([Intel XE#5213] / [Intel XE#5545] / [Intel XE#6652])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-5/igt@xe_exec_system_allocator@twice-large-malloc-multi-fault.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@xe_exec_system_allocator@twice-large-malloc-multi-fault.html
> 
>   * igt@xe_exec_threads@threads-many-queues:
>     - shard-lnl:          NOTRUN -> [FAIL][130] ([Intel XE#7166])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-1/igt@xe_exec_threads@threads-many-queues.html
>     - shard-bmg:          NOTRUN -> [FAIL][131] ([Intel XE#7166])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-7/igt@xe_exec_threads@threads-many-queues.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#7138]) +12 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#7138]) +3 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-6/igt@xe_exec_threads@threads-multi-queue-rebind.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#2833])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-7/igt@xe_live_ktest@xe_eudebug.html
> 
>   * igt@xe_module_load@load:
>     - shard-bmg:          ([PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158]) -> ([PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [SKIP][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184]) ([Intel XE#2457])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-5/igt@xe_module_load@load.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-5/igt@xe_module_load@load.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-6/igt@xe_module_load@load.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-4/igt@xe_module_load@load.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-8/igt@xe_module_load@load.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-7/igt@xe_module_load@load.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-3/igt@xe_module_load@load.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-3/igt@xe_module_load@load.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-9/igt@xe_module_load@load.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-9/igt@xe_module_load@load.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-7/igt@xe_module_load@load.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_module_load@load.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-4/igt@xe_module_load@load.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-3/igt@xe_module_load@load.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-4/igt@xe_module_load@load.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-1/igt@xe_module_load@load.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-1/igt@xe_module_load@load.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-7/igt@xe_module_load@load.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_module_load@load.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-10/igt@xe_module_load@load.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-10/igt@xe_module_load@load.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_module_load@load.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-6/igt@xe_module_load@load.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-8/igt@xe_module_load@load.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-6/igt@xe_module_load@load.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-1/igt@xe_module_load@load.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-4/igt@xe_module_load@load.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-9/igt@xe_module_load@load.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-9/igt@xe_module_load@load.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-9/igt@xe_module_load@load.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-6/igt@xe_module_load@load.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-4/igt@xe_module_load@load.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@xe_module_load@load.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-1/igt@xe_module_load@load.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-3/igt@xe_module_load@load.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-5/igt@xe_module_load@load.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-5/igt@xe_module_load@load.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-10/igt@xe_module_load@load.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@xe_module_load@load.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-7/igt@xe_module_load@load.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-6/igt@xe_module_load@load.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@xe_module_load@load.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-10/igt@xe_module_load@load.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-7/igt@xe_module_load@load.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-1/igt@xe_module_load@load.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-6/igt@xe_module_load@load.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-10/igt@xe_module_load@load.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-8/igt@xe_module_load@load.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-8/igt@xe_module_load@load.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-8/igt@xe_module_load@load.html
> 
>   * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][185] ([Intel XE#6964]) +1 other test skip
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-9/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html
> 
>   * igt@xe_pmu@all-fn-engine-activity-load:
>     - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#4650])
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-3/igt@xe_pmu@all-fn-engine-activity-load.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#4733]) +2 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-10/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-lnl:          NOTRUN -> [SKIP][188] ([Intel XE#944])
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-7/igt@xe_query@multigpu-query-hwconfig.html
> 
>   * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>     - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#944]) +1 other test skip
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
> 
>   * igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled:
>     - shard-lnl:          NOTRUN -> [SKIP][190] ([Intel XE#7174])
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-5/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled.html
> 
>   * igt@xe_sriov_flr@flr-twice:
>     - shard-bmg:          [PASS][191] -> [FAIL][192] ([Intel XE#6569])
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-9/igt@xe_sriov_flr@flr-twice.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@xe_sriov_flr@flr-twice.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
>     - shard-lnl:          [FAIL][193] ([Intel XE#5993]) -> [PASS][194] +3 other tests pass
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
>     - shard-lnl:          [FAIL][195] ([Intel XE#6054]) -> [PASS][196] +3 other tests pass
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-bmg:          [SKIP][197] ([Intel XE#367]) -> [PASS][198]
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [FAIL][199] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][200]
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
>     - shard-bmg:          [INCOMPLETE][201] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][202] +1 other test pass
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-1/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-bmg:          [SKIP][203] -> [PASS][204]
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-4/igt@kms_hdmi_inject@inject-audio.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-8/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault:
>     - shard-bmg:          [FAIL][205] ([Intel XE#5625]) -> [PASS][206]
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-9/igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:
>     - shard-bmg:          [ABORT][207] -> [PASS][208]
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>     - shard-bmg:          [SKIP][209] ([Intel XE#1124]) -> [SKIP][210] ([Intel XE#6703])
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
>     - shard-bmg:          [SKIP][211] ([Intel XE#2887]) -> [SKIP][212] ([Intel XE#6703]) +1 other test skip
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
>     - shard-bmg:          [SKIP][213] ([Intel XE#2252]) -> [SKIP][214] ([Intel XE#6703]) +1 other test skip
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@lic-type-0-hdcp14:
>     - shard-bmg:          [FAIL][215] ([Intel XE#3304]) -> [SKIP][216] ([Intel XE#6703])
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-8/igt@kms_content_protection@lic-type-0-hdcp14.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@kms_content_protection@lic-type-0-hdcp14.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-bmg:          [SKIP][217] ([Intel XE#2244]) -> [SKIP][218] ([Intel XE#6703])
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][219] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][220] ([Intel XE#301])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
>     - shard-bmg:          [SKIP][221] ([Intel XE#2311]) -> [SKIP][222] ([Intel XE#6703]) +4 other tests skip
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][223] ([Intel XE#4141]) -> [SKIP][224] ([Intel XE#6703]) +1 other test skip
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
>     - shard-bmg:          [SKIP][225] ([Intel XE#7061]) -> [SKIP][226] ([Intel XE#6703])
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
>     - shard-bmg:          [SKIP][227] ([Intel XE#2313]) -> [SKIP][228] ([Intel XE#6703]) +3 other tests skip
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-bmg:          [SKIP][229] ([Intel XE#6901]) -> [SKIP][230] ([Intel XE#6703])
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-9/igt@kms_joiner@basic-big-joiner.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-bmg:          [SKIP][231] ([Intel XE#6911]) -> [SKIP][232] ([Intel XE#6703])
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
>     - shard-bmg:          [SKIP][233] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][234] ([Intel XE#1406] / [Intel XE#6703]) +1 other test skip
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][235] ([Intel XE#2509]) -> [SKIP][236] ([Intel XE#2426])
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_eudebug_online@pagefault-write:
>     - shard-bmg:          [SKIP][237] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][238] ([Intel XE#6703])
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-4/igt@xe_eudebug_online@pagefault-write.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@xe_eudebug_online@pagefault-write.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:
>     - shard-bmg:          [SKIP][239] ([Intel XE#2322]) -> [SKIP][240] ([Intel XE#6703])
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch:
>     - shard-bmg:          [SKIP][241] ([Intel XE#7136]) -> [SKIP][242] ([Intel XE#6703]) +2 other tests skip
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html
> 
>   * igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate:
>     - shard-bmg:          [SKIP][243] ([Intel XE#6874]) -> [SKIP][244] ([Intel XE#6703]) +3 other tests skip
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857/shard-bmg-4/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>   [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
>   [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
>   [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
>   [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>   [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
>   [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
>   [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
>   [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
>   [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
>   [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6891]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6891
>   [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
>   [Intel XE#6904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6904
>   [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
>   [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
>   [Intel XE#7129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7129
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
>   [Intel XE#7166]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7166
>   [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8760 -> IGT_8761
>   * Linux: xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857 -> xe-pw-161812v1
> 
>   IGT_8760: 8760
>   IGT_8761: 8761
>   xe-4574-e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857: e1032fc6a7b99e9b2c4c97829d1fb0dde9d61857
>   xe-pw-161812v1: 161812v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161812v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
