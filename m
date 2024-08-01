Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A426C3DA7F
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 01:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59BC10E878;
	Thu,  1 Aug 2024 01:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rowz6i+6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8613C10E870
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 01:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722475422; x=1754011422;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4bT4+tsiO5YnNAXBoBbbwNpjV70RGZhlxyimo7rSVcE=;
 b=Rowz6i+6BHIRW4IZO8cHuYlBUGrcydZtYyHOO1BnNwxd+YdqSv0fp/7n
 A8JUSfDQmJIC8hIvpPHQKw9q16kuRUUy3OlK76MkWr3q4Oy6vMHKUA4eJ
 1gxq5NgsF32aEN5jPcaAAcK1QXJ6m+NolBgq1+KU3LAsIMxF7LBm/zE74
 WOmu0DBfWVXbfCINV+Ezu3eYMFHdaqr2816MTVuJMAtAq6SxS6dtDNgxQ
 iO9uFcUIqOe2duALkOrnH56otnkIsN7WcMtgepc0GBakkTVUOFEE5TXEQ
 bfXUQ2jwfU4PnMlGYOkdqOqSmdh9yzK/p1UYPO6G+WFP0z7aT76n2zYYl Q==;
X-CSE-ConnectionGUID: DbvjZgs+TMGek+SQqcfjjA==
X-CSE-MsgGUID: IGK1vl83QYGuH+dPAS6nCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="30975886"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="30975886"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 18:23:42 -0700
X-CSE-ConnectionGUID: 4w/PQbNzTd6lKASUWxi3yw==
X-CSE-MsgGUID: j7XU6Vs6QeefsV0XHKCnyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="85479059"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 18:23:41 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 18:23:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 18:23:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 18:23:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXGPm4ai5zjA6ieCxmtQFT4h6rwIM0ZdKpJWGH3y+1zl8Kribwjqby7vcl1rLEGQPOcDioCM7h/bA76+6Vn3pYw++77Nb8gqSkmbZItnz66rT7tj4NxLjzkGDQKI70XYihk0wEQ8pVaFTK29AzGJwdkJTB5kmVgp3fixFKtmtgYSXbkMZ1dUB8UvQVm0X1YvKfXDnrjK0yZK4KQ1ohsBFlk5dgvsjtrvopdHqAQwMXBKJzg4fTfodgn1fvGm2nkPy+byy5AzXndIJpz1xX5tYb1tv0WTfFoHjbTnsWdcYwJG59bi8llllruOtUabglwOFDF4b4mSYUXtrYSC7BDB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWuzVwi7K6uorQJhCP5YnTGMb+4uyK1yK1pxCevqO4g=;
 b=KZ9zsX3dJ95lBeaNuwoVstOuRWcA3W8Zk4y5aqRSNVZlEqmO0tJQ/jnOY8jYnzmjZJsLe0b3uvm1HALKcKWfwlm0sTaJYqbD96nke2d111anb7dmwPNeEzYSvteNvB+tAWJeN2t55kRdUmrMKhgPjuPR4sLRff8tkujFmFDdVjYW4q5b3hRxcIX0CvI/PWxlhQXH3OZEkijffGr5g6pKwRiTVy5mQQ0J59rPTQAKa8tBjRo0ULW5K3VlGzSbw2z87Me75PHM6Ahf8VFZHUEfE7hf6DmfDexeMjAZct9CkOu/KLKM/VfVH2O+4rK4jzuOxVdfhP+6lyIwzPRRe5NICA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB7474.namprd11.prod.outlook.com (2603:10b6:a03:4ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 01:23:16 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 01:23:16 +0000
Date: Wed, 31 Jul 2024 18:22:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Pallavi Mishra <pallavi.mishra@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/xe2: Enable Priority Mem Read (rev8)
Message-ID: <20240801012253.GH2685051@mdroper-desk1.amr.corp.intel.com>
References: <20240731195622.1868401-1-pallavi.mishra@intel.com>
 <172247147591.470559.17160924210116690466@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172247147591.470559.17160924210116690466@2413ebb6fbb6>
X-ClientProxiedBy: BY5PR17CA0041.namprd17.prod.outlook.com
 (2603:10b6:a03:167::18) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e83e88-08b7-4f45-89b2-08dcb1c8846a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OIzzWCMghM0tLc7uiziPTO0FwYLG+OwDLlSl1pbKzUpe6QuKhcmVDGK9Cem0?=
 =?us-ascii?Q?yEqfc6DxgVBCMkuhLDnAU6Vqzz0+DQX/sX/GyUzSV+ClbI2Kgvx5sIoRQsnI?=
 =?us-ascii?Q?S9PiUuC6ThBp4J8Eo8RO+2dT7Ug+rU4wN4057VdD2On/H+5jwtJNhuPOMt2L?=
 =?us-ascii?Q?9IWe/R1ZU3d3YIi5oSd00QP/gMdhifh6k2lCD+O5UdCS+RNHBh3IziR8KQEq?=
 =?us-ascii?Q?NHxN8u/4ab6JCoXm+6+V9Qd5LzrpHAlf3vXvQ8NR05GbA/SDzd/LZ5WsQSh0?=
 =?us-ascii?Q?MR5ccsSyORvw4ySgK1hwckyEUunY1gDaghx2mQqaOEeOY7gU08t+pYwnlzKD?=
 =?us-ascii?Q?9u5B9fMoeGuVUUJ0w226IjzZo8A4Y9cX+cqC6qn/mVbMin2LHK/HF8/kuxuj?=
 =?us-ascii?Q?ItJpqBXoUtDhMZMFBSdFmm26cDz8nJ6D13ZyhPjREXzcNHkKGjtJPthGVeN9?=
 =?us-ascii?Q?rFIS2hINA6UnYfV921/DXNam7C3iYDbE2HJr/ntZqMOiqvr2QtQCiTgDzVti?=
 =?us-ascii?Q?i91cj/w+pXHWtboXXRe1p2iPoKPM+Ex3Xkh3wR2MN8+A0cN1WFWBFCR/YaIf?=
 =?us-ascii?Q?DOq1CsTukZNNMgYQG8+wF1w0tn5XkWLzeXDopmtO1P1R2Lpa9DXRnrSu7l1G?=
 =?us-ascii?Q?jjtEZemhbxTQcX3f3/+vMkY8YrACx8jgsDWzrwPk53cuePv/HTMYIRtIy2AO?=
 =?us-ascii?Q?1DOxb2grP+/ETSEDJscStSEZddT2aRc7fmhtQAkQ9o1qTbkM2XCX/2pA6t5y?=
 =?us-ascii?Q?d+y3STixen13aJyx3UYPI4NSxqBRi8o4iEePoOgZZaXUf7Wrz1MySGddxLKA?=
 =?us-ascii?Q?P6TvrGT24BXfiHg246Aw78wia5qgW31BGo65rkCZSE4yAJ61vrZ4Osq1y/JZ?=
 =?us-ascii?Q?cM3YSs4egzciwJMNn7NkmxjRuma2fNefbi26A3hfv4WWKwSMjB7gZCociQPc?=
 =?us-ascii?Q?m8whcwoxizRAZZ0maOhcb8ukijntssqJ5qg9CYcfOi0O2NawgOA0pDxEcdqq?=
 =?us-ascii?Q?nCEAjLjfFSH3YqqBSYLc15tn/3I+B9ZPd583GpLOvsS6eHQww3mYFaXP/1bh?=
 =?us-ascii?Q?EcfoX04GNc6qTKB4+cDBO7CSVy5KKQOBLlNOQvEL6K8CH/nQ8sJkOFi17OXJ?=
 =?us-ascii?Q?cjBCDiUUQhqM2sfTOy0hWfBZ1DTdAF0xKMWyoRb0cxgIWt8Fd2Y56gKYLQ0K?=
 =?us-ascii?Q?ua2e6aOX0v3+rn09eMoPiIPXCIMD3rznKrcPR3/u8Ka5wEpkG0djNg5ixqHW?=
 =?us-ascii?Q?f5kmEEyUKAPpMAmxneJd9oJuOI0fUZhhLpLuYLPSODptI8Q+XPBxZnBgXDix?=
 =?us-ascii?Q?mj8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EoRMIqMl67CHh4fN3kqtZljxigMH7ofhUctMY7akmvJyVp6SEQ5jhk25UrlT?=
 =?us-ascii?Q?10MKZzwfA9lXHKNuuq9ErlrTc3FpQ0gOw+oDDJ6Pondk2VHOZkrPkJwJUvce?=
 =?us-ascii?Q?AY0glVmiEaBo5QHjkTHjC1/B9X43qWdv6n/MTeYl9qGxCx0EHgxzEX9IvzZ6?=
 =?us-ascii?Q?FLItmML5gtqt7oyVn4qN52PI15GI75pLxQEz/pA8kg1Zcu3/IPwfn4vQmcHK?=
 =?us-ascii?Q?SFroe6LExbp3YJy4uiSx8evH52GF4lg8oHOIlEz4kHkSUhiTQbq0dD9DBHA3?=
 =?us-ascii?Q?V+6YntLxAl5XIqF5gIeL+rYga3o+jCYB1Yz1JX/UWLLZWNKyVdeYgMx89ARm?=
 =?us-ascii?Q?AfiDYabLy281xnFcXhAXa1gAYnHgVzGf/4JhJtvi81ceUaN2sA8jSloIyXt/?=
 =?us-ascii?Q?vbb2elSTdGU2Jqdap+ZzBbN25m9h2PbH+AKDikVAHDM9ghxFZAsOtCZYiAZP?=
 =?us-ascii?Q?zdoBn5vCIy+ZV83ziujPaibc0pzHh22bXyfe55Ij4g6LoofCok7kY5BbC1Cw?=
 =?us-ascii?Q?HLIA7Dmo/RIE7IJGBZbFce8kjNbbo7S1NhL0mqQQGb3vAmuMk0AjVYwgQyFX?=
 =?us-ascii?Q?NAwTrgNi/yc4LMM3EKEijDw15BlRmbW4Shr4Ow5ypLuAQeOGS7JZloxjlwRM?=
 =?us-ascii?Q?YzjXuOOSCctWDgjLgoqFHHZ0nfguFLdX04iGa6gQypASUuFwKIHTwbob+mNy?=
 =?us-ascii?Q?uJjaPGNZ+dWURSOnmxXl5lP7Hi8aJ/y3Lp7i8BA6nsfSoWR/KnoqDx1U7jrz?=
 =?us-ascii?Q?UdTgCAZafBXKWXsNBScEq98cx1TTlqEFgkeqERf6NetN+na45LGCDXrKslzM?=
 =?us-ascii?Q?KB2MnxO0EkAFlj6EGGf29Dc5riIEI79AwehpZdkW34qDBmQKKxY506nxm+A4?=
 =?us-ascii?Q?HGwcMX7Brm4zCY4VvHMtCReS4g+SWYLaGF4zN8zgguvssR8FRKNlOKaGolO5?=
 =?us-ascii?Q?CQdkXakXt5EasDBY5Lb9TClcXyRqqBAVRd5nBHAT6KHEvuZl3GAA35e9KlRN?=
 =?us-ascii?Q?lQc6olrEw941oYd397Q1q+mdODKLbhCjq8O/QcOVW4rOB05LOMNPoGJlPamd?=
 =?us-ascii?Q?lmVYmee0qVfzD3+bh07hqFzoCOU5l5zCIYolFz4JP5eeoCG3ESGB7a+VNHHM?=
 =?us-ascii?Q?dH+FXGI8bYnHvGdTepdlR1AKjZ3ki4u5JphYSp1DG4HGzWIZuyGZ+vNxmhiW?=
 =?us-ascii?Q?YmVlwy+HzSDN++epsS/XO7I4cHzNRgjQ3oFWp2HNNZf4UAVi8ZbGjzob9xto?=
 =?us-ascii?Q?b/Gj89kGlR51yjge2PYI8An7rNlpIkEeWZG1vVvYqT3k5eDaP9lClYtdufPb?=
 =?us-ascii?Q?lyA73qw/sx2EH7HfjTQ0Gas0B9yqrqMW4nokgFXgxqw7Yv31r1s2hYfYnGg7?=
 =?us-ascii?Q?DBWjTQZ6LQH4/Poujq2M5DPk6JZUeDLgGPVA9hYu2V3oUrLYDpYbq1ImrpmC?=
 =?us-ascii?Q?a89cvgeX58G8e6vxfuVhatXFdOXNtIinRuakT2wt60v4pFSI2uhacoifnes/?=
 =?us-ascii?Q?lIcvTHGDJ49qFshVKGKc2Cv1rG90qgWpUW9TIltNvl9nVHYHq488Wobj1yzt?=
 =?us-ascii?Q?l2Xh1dKqYmXGfV+0UnO8cN8q+OxSLt2nR4ypYI9pktwotOuXyXWMd3WE2Lwo?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e83e88-08b7-4f45-89b2-08dcb1c8846a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 01:23:16.2479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEEVBPoh0281cHfbOep28EO97MWhTeQKASNpOEQQBtmkIwTLRBNQWdCNHfgSrTNOiGQ5sTqIiMZoP7JD2ZM1A+yWSazvWuS4IeFacL6hI7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7474
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

On Thu, Aug 01, 2024 at 12:17:55AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe2: Enable Priority Mem Read (rev8)
> URL   : https://patchwork.freedesktop.org/series/134038/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1698-caaefe49619299337b0fdc73a2379043d8684825_full -> xe-pw-134038v8_full
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with xe-pw-134038v8_full need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-134038v8_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-134038v8_full:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>     - shard-dg2-set2:     [SKIP][1] ([Intel XE#1201]) -> [SKIP][2] +16 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

These skips are happening regularly since the move to 6.11-rc1:
   https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2423

Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-134038v8_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#1426]) +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-all-transition:
>     - shard-dg2-set2:     [PASS][5] -> [INCOMPLETE][6] ([Intel XE#1195]) +1 other test incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_atomic_transition@plane-all-transition.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-434/igt@kms_atomic_transition@plane-all-transition.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#2191])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][8] ([Intel XE#1195])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#651])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
> 
>   * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
>     - shard-lnl:          [PASS][10] -> [DMESG-WARN][11] ([Intel XE#324])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [PASS][12] -> [FAIL][13] ([Intel XE#771] / [Intel XE#899])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html
>     - shard-dg2-set2:     [PASS][14] -> [FAIL][15] ([Intel XE#771] / [Intel XE#899])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][16] -> [FAIL][17] ([Intel XE#899])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
>     - shard-adlp:         [PASS][18] -> [FAIL][19] ([Intel XE#899])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][20] ([Intel XE#1050])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-435/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-adlp:         [PASS][21] -> [FAIL][22] ([Intel XE#2262])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-6/igt@xe_gt_freq@freq_fixed_exec.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html
> 
>   * igt@xe_gt_freq@freq_range_exec:
>     - shard-adlp:         [PASS][23] -> [FAIL][24] ([Intel XE#2203])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@xe_gt_freq@freq_range_exec.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-adlp-2/igt@xe_gt_freq@freq_range_exec.html
> 
>   * igt@xe_pm@s2idle-multiple-execs:
>     - shard-lnl:          [PASS][25] -> [FAIL][26] ([Intel XE#1924] / [Intel XE#2028])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-2/igt@xe_pm@s2idle-multiple-execs.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-lnl-1/igt@xe_pm@s2idle-multiple-execs.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-adlp:         [PASS][27] -> [ABORT][28] ([Intel XE#1794])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@xe_pm@s4-vm-bind-prefetch.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
>     - shard-lnl:          [FAIL][29] ([Intel XE#1701]) -> [PASS][30] +1 other test pass
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-lnl:          [FAIL][31] ([Intel XE#1659]) -> [PASS][32]
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@a-edp1:
>     - shard-lnl:          [FAIL][33] ([Intel XE#886]) -> [PASS][34] +1 other test pass
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
> 
>   * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
>     - shard-lnl:          [DMESG-WARN][35] ([Intel XE#324]) -> [PASS][36]
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
> 
>   * igt@kms_psr@psr2-suspend:
>     - shard-lnl:          [FAIL][37] ([Intel XE#2028]) -> [PASS][38] +1 other test pass
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@kms_psr@psr2-suspend.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-lnl-7/igt@kms_psr@psr2-suspend.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-lnl:          [FAIL][39] -> [PASS][40] +1 other test pass
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-8/igt@kms_vrr@flipline.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-lnl-6/igt@kms_vrr@flipline.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [INCOMPLETE][41] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#402]) -> [PASS][42]
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [FAIL][43] ([Intel XE#1000]) -> [PASS][44]
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_gt_freq@freq_range_exec:
>     - shard-dg2-set2:     [FAIL][45] ([Intel XE#2203]) -> [PASS][46]
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-434/igt@xe_gt_freq@freq_range_exec.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-466/igt@xe_gt_freq@freq_range_exec.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2-set2:     [SKIP][47] ([Intel XE#873]) -> [SKIP][48] ([Intel XE#1201] / [Intel XE#873])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][49] ([Intel XE#316]) -> [SKIP][50] ([Intel XE#1201] / [Intel XE#316]) +5 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-433/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][51] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][52] ([Intel XE#316]) +4 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][53] ([Intel XE#324]) -> [FAIL][54] ([Intel XE#1231])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][55] ([Intel XE#1242]) -> [DMESG-FAIL][56] ([Intel XE#324])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [DMESG-WARN][57] ([Intel XE#324]) -> [FAIL][58] ([Intel XE#1231])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][59] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][60] ([Intel XE#607])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][61] ([Intel XE#1124]) -> [SKIP][62] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-dg2-set2:     [SKIP][63] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][64] ([Intel XE#1124]) +7 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-dg2-set2:     [SKIP][65] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][66] ([Intel XE#346])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][67] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][68] ([Intel XE#367]) +2 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][69] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][70] ([Intel XE#2191])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][71] ([Intel XE#2191]) -> [SKIP][72] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][73] ([Intel XE#367]) -> [SKIP][74] ([Intel XE#1201] / [Intel XE#367])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
>     - shard-dg2-set2:     [SKIP][75] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][76] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][77] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][78] ([Intel XE#787]) +76 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][79] ([Intel XE#787]) -> [SKIP][80] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][81] ([Intel XE#1252]) -> [SKIP][82] ([Intel XE#1201] / [Intel XE#1252])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][83] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][84] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg2-set2:     [SKIP][85] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][86] ([Intel XE#306]) +2 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_chamelium_color@ctm-0-50.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-dg2-set2:     [SKIP][87] ([Intel XE#306]) -> [SKIP][88] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - shard-dg2-set2:     [SKIP][89] ([Intel XE#373]) -> [SKIP][90] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-read.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-dg2-set2:     [SKIP][91] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][92] ([Intel XE#373]) +7 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2-set2:     [SKIP][93] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][94] ([Intel XE#307])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-1.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2-set2:     [SKIP][95] ([Intel XE#308]) -> [SKIP][96] ([Intel XE#1201] / [Intel XE#308])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2-set2:     [SKIP][97] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][98] ([Intel XE#308]) +1 other test skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2-set2:     [SKIP][99] ([Intel XE#323]) -> [SKIP][100] ([Intel XE#1201] / [Intel XE#323])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [SKIP][101] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][102] ([Intel XE#323])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2-set2:     [SKIP][103] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][104] ([Intel XE#776])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2-set2:     [SKIP][105] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][106] ([Intel XE#701])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_feature_discovery@chamelium.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][107] ([Intel XE#455]) -> [SKIP][108] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][109] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][110] ([Intel XE#651]) +25 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     [SKIP][111] ([Intel XE#651]) -> [SKIP][112] ([Intel XE#1201] / [Intel XE#651]) +20 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-dg2-set2:     [SKIP][113] ([Intel XE#658]) -> [SKIP][114] ([Intel XE#1201] / [Intel XE#658])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][115] ([Intel XE#653]) -> [SKIP][116] ([Intel XE#1201] / [Intel XE#653]) +23 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][117] ([Intel XE#1201] / [Intel XE#2351]) -> [SKIP][118] ([Intel XE#2351]) +4 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2-set2:     [SKIP][119] ([Intel XE#1158]) -> [SKIP][120] ([Intel XE#1158] / [Intel XE#1201])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-suspend:
>     - shard-dg2-set2:     [SKIP][121] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][122] ([Intel XE#653]) +22 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-suspend.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-suspend.html
> 
>   * igt@kms_lease@invalid-create-leases:
>     - shard-dg2-set2:     [SKIP][123] ([Intel XE#1201] / [i915#2575]) -> [SKIP][124] ([i915#2575]) +13 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_lease@invalid-create-leases.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_lease@invalid-create-leases.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>     - shard-dg2-set2:     [SKIP][125] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][126] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][127] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][128] ([Intel XE#498]) +2 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-dg2-set2:     [SKIP][129] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][130] ([Intel XE#870])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-dg2-set2:     [SKIP][131] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][132] ([Intel XE#908])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][134] ([Intel XE#1489]) +3 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>     - shard-dg2-set2:     [SKIP][135] ([Intel XE#1489]) -> [SKIP][136] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-dg2-set2:     [SKIP][137] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][138] ([Intel XE#1122])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg2-set2:     [SKIP][139] ([Intel XE#1122]) -> [SKIP][140] ([Intel XE#1122] / [Intel XE#1201])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-pr-dpms:
>     - shard-dg2-set2:     [SKIP][141] ([Intel XE#929]) -> [SKIP][142] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-435/igt@kms_psr@fbc-pr-dpms.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][143] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][144] ([Intel XE#929]) +12 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][145] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][146] ([Intel XE#1127]) +1 other test skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     [SKIP][147] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][148] ([Intel XE#327]) +2 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][150] ([Intel XE#455]) +14 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@kms_vrr@flipline.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@kms_vrr@flipline.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-dg2-set2:     [SKIP][151] ([Intel XE#756]) -> [SKIP][152] ([Intel XE#1201] / [Intel XE#756])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
>     - shard-dg2-set2:     [SKIP][153] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][154] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][155] ([Intel XE#1123]) -> [SKIP][156] ([Intel XE#1123] / [Intel XE#1201])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][157] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][158] ([Intel XE#1123]) +2 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_exec_basic@no-exec-bindexecqueue-userptr:
>     - shard-dg2-set2:     [SKIP][159] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][160] ([Intel XE#1130]) +16 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@xe_exec_basic@no-exec-bindexecqueue-userptr.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@xe_exec_basic@no-exec-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
>     - shard-dg2-set2:     [SKIP][161] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][162] ([Intel XE#288]) +20 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-prefetch:
>     - shard-dg2-set2:     [SKIP][163] ([Intel XE#288]) -> [SKIP][164] ([Intel XE#1201] / [Intel XE#288]) +19 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>     - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][166] ([Intel XE#2360]) +1 other test skip
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     [SKIP][167] ([Intel XE#255]) -> [SKIP][168] ([Intel XE#1201] / [Intel XE#255])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-433/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][170] ([Intel XE#560])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_media_fill@media-fill.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-dg2-set2:     [SKIP][171] ([Intel XE#378]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#378])
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_module_load@force-load.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-435/igt@xe_module_load@force-load.html
> 
>   * igt@xe_oa@invalid-remove-userspace-config:
>     - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][174] ([Intel XE#2419]) +6 other tests skip
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_oa@invalid-remove-userspace-config.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@xe_oa@invalid-remove-userspace-config.html
> 
>   * igt@xe_oa@polling-small-buf:
>     - shard-dg2-set2:     [SKIP][175] ([Intel XE#2419]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#2419]) +4 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_oa@polling-small-buf.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-435/igt@xe_oa@polling-small-buf.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-dg2-set2:     [SKIP][177] ([Intel XE#979]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#979])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][180] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@d3cold-mocs:
>     - shard-dg2-set2:     [SKIP][181] ([Intel XE#2284]) -> [SKIP][182] ([Intel XE#1201] / [Intel XE#2284])
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-434/igt@xe_pm@d3cold-mocs.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-lnl:          [FAIL][183] ([Intel XE#1924] / [Intel XE#2028]) -> [FAIL][184] ([Intel XE#1924])
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-lnl-1/igt@xe_pm@s2idle-basic-exec.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-lnl-1/igt@xe_pm@s2idle-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-config:
>     - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][186] ([Intel XE#944]) +3 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-433/igt@xe_query@multigpu-query-config.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-432/igt@xe_query@multigpu-query-config.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-dg2-set2:     [SKIP][187] ([Intel XE#944]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1698-caaefe49619299337b0fdc73a2379043d8684825/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/shard-dg2-434/igt@xe_query@multigpu-query-gt-list.html
> 
>   
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
>   [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2203
>   [Intel XE#2262]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1698-caaefe49619299337b0fdc73a2379043d8684825 -> xe-pw-134038v8
> 
>   IGT_7948: 7948
>   xe-1698-caaefe49619299337b0fdc73a2379043d8684825: caaefe49619299337b0fdc73a2379043d8684825
>   xe-pw-134038v8: 134038v8
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134038v8/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
