Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31561C7EE30
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 21:17:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62E710E913;
	Thu, 26 Jun 2025 21:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpYGZDHF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F7B10E913
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 21:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750972645; x=1782508645;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zMJM+vvBCnl4oPVcP6iOPsYkOq4+/1ir0o2No21YAY4=;
 b=hpYGZDHFPjhsMwQxQ64cPBZ++7YHsNfjeHRNvuzsGcJi8dRI3wMUVHgZ
 M59OcvHreTvo8ZwTeYgV8eAm2mlTXN/fRgaf8EcJMA01TLNSt9gYz9GxI
 8KKb7rxewfsioHo57fqU4eewm9+udLwXuzbjzDkxnZn89oUgI5Cvp3+Ol
 Hf2/Zcy9HaahAP1OCRH0yFo/heK2S/syosahGE8bp0s8I7iocH3cZ79ga
 beGkBS+SYe+aZ0UYWWMyQ5CsTaHt+2gaFtQwoeHKVqmfUvjUsqiEW/cTZ
 kTfz4Qw5izAt+8g9CCZdbR3Ri3TJAgN0jt4rkcZYwcznOcOMMXpkTldBq A==;
X-CSE-ConnectionGUID: I4Gk3zXpTEK2cwMs3Li4OA==
X-CSE-MsgGUID: TTNK3izBT6mwABg06gJ9GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="63540413"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="63540413"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 14:17:23 -0700
X-CSE-ConnectionGUID: 8Gk9nmLsTtGPGOikvFWoYQ==
X-CSE-MsgGUID: 1ehBjLHvQAKdvtTDAu/9yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="156656507"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 14:17:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 14:17:22 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 14:17:22 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.66)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 14:17:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=re0+IWcGRVVApeAIW/q7IvGSDufZ0y1I9+WFg/iRgJh2TNh1nXCU9jS7FT4Ad1E+r0+xkfRXeF/cRVzzmNpyCVhox2UL6DklddEOwbUnEi4EzU8vUwIc2zrOe6gk0ekm6MRoAPk5TEDRSigjiwKRbpD6tH6FDRbZHumJC/ggNWmG2r8sG9EgzSiVehQ1oRWQltaEYCpi0E05/It0iqxPDqX+fScRF+r4EzYAhwjbGRtDP1c3OcLKy7GrMlQV1gWTH9maW5VBIwUQ74YxzM0WqudJQGX1JEKruqUQbnaH4w20Z87g+CswrtobCsxcAIrpkNMsgdG6N3y2rak8k5rBZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xo7PvgtyVuM9tCB0R7HAVnx72ssl6eeHkibn90RWRis=;
 b=sRzLhpuKftEzZeND3i1uu0oY49FduiWaCbvXGZA3rkm3ylqw5la7v2wOaO8B0vI19lCcCHZk6my9rvf3sPMx/enjg/tdfJYz+BdFob8fEW1GUBB8HBFbeRnZA+25c8W46nbmwxqGwl6qOdcsssBeGA3Mcm7muTKF0c67OnnZGJBV6PxTJGEzk1HD9Yq0DWM3gffhyMCJjiGWP/KL1w61lARfHI3avrax+HDafj2pUUYYC9PZGzdt8sjbn1CfpfipakvFFiVfF4iWps6PewsWECfonnfYXhCngHVcbwUIn4Cs50vPGVyHRBnaLIUqQRhghVOf+3nWeKCWXkpj91bx8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6697.namprd11.prod.outlook.com (2603:10b6:510:1ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 21:17:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 26 Jun 2025
 21:17:02 +0000
Date: Thu, 26 Jun 2025 16:16:57 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Yao, Jia" <jia.yao@intel.com>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Nguyen, Brian3" <brian3.nguyen@intel.com>, 
 "Zuo, Alex" <alex.zuo@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "Patelczyk, Maciej" <maciej.patelczyk@intel.com>
Subject: Re: [PATCH v2] drm/xe: Fix out-of-bounds field write in
 MI_STORE_DATA_IMM
Message-ID: <pd75v3ytcxr3h4tnallo6fr4yka62dj6r4yk3xbio6m5ypm62t@dumhlqpjx4ke>
References: <20250523150418.168362-1-jia.yao@intel.com>
 <20250527163050.287042-1-jia.yao@intel.com>
 <aDYDsozeWc+kpEfV@lstrano-desk.jf.intel.com>
 <DM4PR11MB5456F18EC221141CB3388FE6EA75A@DM4PR11MB5456.namprd11.prod.outlook.com>
 <PH8PR11MB80405061D209DFD27B39DE50F47AA@PH8PR11MB8040.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <PH8PR11MB80405061D209DFD27B39DE50F47AA@PH8PR11MB8040.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0376.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b58fdf-d57f-4736-077e-08ddb4f6cad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6aOCkmfsvqM6U1W8JYrsNJ/vkeoypK8WJ2Ct09/krgtntU06f/aYAzvQzpIU?=
 =?us-ascii?Q?/3mpAWePCNH13d6fY4y0iolLIpd+oY0a1F/WYEaSEpPNdPmcPe7uH2jT+j/e?=
 =?us-ascii?Q?WriO0R3Bl5aBUp9rp/5f1YN6DkIxHPJbmCLoN8C3/2/96XP+TydHysmBc6S9?=
 =?us-ascii?Q?l0M5VCY4zemhgLcKYj2pF4dbCd70k8RB/Y4siAYAqX3xxQQU/qwVRivF8AWv?=
 =?us-ascii?Q?l9KvvoW5d2I0/dKeWTt1JQjWUXzFImaZVNAzNR1v1xf8eQs6ZIEAjNDxxP3M?=
 =?us-ascii?Q?1V8EaT283xonmOlW/saFMJEmbvBCDe4qk119aTtnsFjzt9yzxySCaIzFJYul?=
 =?us-ascii?Q?89ESTLR91FxgYzd4g3KjoWy7gmofEqvxATXDl+8XvC0Fpv00GIf8317R08dt?=
 =?us-ascii?Q?uvgzk9Hty3JWpefHsHUGhyA5iogo9bmVNeg1G0r/qZZ1BLMzWLgW3pNj81Q6?=
 =?us-ascii?Q?uF/kDDLlp3NFHu85FZyGHT2BWxg11KeszixDrGeoCnBFZYCvjR9rUGK/gI/M?=
 =?us-ascii?Q?tuBI9w3RGMIYAObm2vdnjIJ7wuSbOt0GmllsJmIfWXY1HPhm3ntC06nY0Op+?=
 =?us-ascii?Q?oZDbciRrWothnI+1H2LyZDtEQlQF5TnMQaGdjY1QksiYfsIrdYaqCqJ4hkek?=
 =?us-ascii?Q?9m2xqNifbrAOTBN4lBFE5zb2utwIX3K5tHVLjaZyf7i2H0FE8tkK/uWcZuRw?=
 =?us-ascii?Q?E5g8kw+FytfiRENVNUjs4wudKUmYCrUhKZt8Ync5qeJw+gWWt3JGy6hMvVW+?=
 =?us-ascii?Q?jXXvpij0Qp4ht0soW3i/a7K2dkq2teeWsFIdiPbz07p923BZji/13mwqFVWo?=
 =?us-ascii?Q?9w9PdGRxMKXga/EpH3aoQd+01MBefh5+riwVdsQZmaNgt+p8QcgWMrutXm/B?=
 =?us-ascii?Q?FHBbn8gPctxQyhYuwGoRLYXBglq1u867SutGczmDSZH7XaXfbkgp8dO1sLIV?=
 =?us-ascii?Q?TQ+WqaBSXt9wE9+yXK0qmGtLOMBTnDwKRhgbvdwKMAOBkfJHODwX4130wIQY?=
 =?us-ascii?Q?htQCisKCnwiapKraC6Iug6EBJoFELqtz1MZ4Nzgz2zxdp1KopVO0eRDaw8qK?=
 =?us-ascii?Q?/j6m7JaIyO4oGJmAhcEr6n5gFV950252FIybTfj8N2oT/NAvPqSG3mt1g7EA?=
 =?us-ascii?Q?0kS/iYXJJ6dHQKvQXgZMukVPI3cmycCEIEI3u+A9YzTdlZ0mhnLFlL7B/qv0?=
 =?us-ascii?Q?bTwxNA/kWw7EVyZrP+Wx8JQpEiOEXhX3BQTbtGOQU8Vm06oC6XjU0xG1pyxS?=
 =?us-ascii?Q?J/wLR8bd6CGQ4QNlDxMbQ14xgWBCHszmqljfsy86EQux/2Au8Zn0ppFtRWwi?=
 =?us-ascii?Q?hd8VKMwBFdpqIC1NePPS0sAZ4GrbNoo67psG2rvpDS1YnsfyB59xrfzU3vk0?=
 =?us-ascii?Q?fQLMAiSoibPT2HH7ehHYb3koq/6k2ZBzAh5dMDOww8YNNWHw4A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XeGwE7mToS8kV/0TmTqQyNqEuovsPdvkSqufomTBoaRKwHCJTKhT+mBf18mc?=
 =?us-ascii?Q?6FDDvj/fpEtxJf5GW5ENZhADpQcg3VMFZpyHJJMmece+xuSahy/yKIywD+Sl?=
 =?us-ascii?Q?YEmzben/iPe4TL15UCinbdLBsKvVmICH6wrxZdy36goZjdypyyK/2NHrZEH9?=
 =?us-ascii?Q?dXsTslRz4L3If51T1kgtrQ3YIYE1HK9NHk7P2vFdFEy0SibmMQK3HHtnGR2n?=
 =?us-ascii?Q?EQu0d9lGUP8l2YM/3BFqeszKOdeudBITpH2x/X7/HxGeLIw2lDg3nyDBnSsx?=
 =?us-ascii?Q?aeLOWHsMYbstlWFpzM12bIXkzz/BHdAGwTzs5uWyAj4W11kq02MeT+YQhuUw?=
 =?us-ascii?Q?C3lg6WQ+C4NnWtUA+QE8E2QFwteZ+pr9j178V30hWJIIHrunSybyLVJf2tso?=
 =?us-ascii?Q?voZvZiMpZHWSap/bvmghn5bQP5fdUp5/euwJ50e4WY7ad7o628p9Chf94hKO?=
 =?us-ascii?Q?iwv/l0/VZGrLD918E5+G7VbllsZshw4UzRyyfjPwrQhUnUpEr6b5Sjad+QJK?=
 =?us-ascii?Q?E7VMtqmyp+e4ijPi2LMcdfcwFEr6S1e0eZxbYEgeGTUQ+ST9ea62EyT6mOgL?=
 =?us-ascii?Q?YvTQpOpbSW8m8QWucemsXfFrGp+M7mcgYLjAzKSP6PyHdodOAMpv5aQfw7md?=
 =?us-ascii?Q?hCOwVsE0RG3NVIQcL72l5bnZBYEtc2Ha+e7dPK/JPM3A8gkVA8Jmeyk3SFLi?=
 =?us-ascii?Q?aHmlpCSJbkLBPltfEH2a0Ro4xljcMl5d14pII6HEPCYM1LPJ37A02okaPq3T?=
 =?us-ascii?Q?2w3yKkuCkMMclhhHetqdEJQj7w4etUOzzfTsPoIyo5rp5xiysW65+9l1qkBU?=
 =?us-ascii?Q?O7pUYPQDEvtlr2+WclgPz/3pMebaIOP/PcsT1mosIhi+Akqy11mSF5cq45GO?=
 =?us-ascii?Q?ck8fJ4XnUMAbp/+kU/H8Lw0KzPxWiSWXnWH/qxAihh/7Anbtuz8ez9NdMFze?=
 =?us-ascii?Q?HBmkyBgHLocQd4msd4UcX5rfvSEIXd+cMEDvIU5gvKnl2ktxBYQWCoEjyteZ?=
 =?us-ascii?Q?7/x2BLi6BxIyA2xTxSTyxsYCUXFd7ztCasCVsXA9tnQy44EgLqeyTLm42Htr?=
 =?us-ascii?Q?k5nCZGS4iNtBLmCBIpwZ8/Ym/GUZHLBlLqK/QyQSw0Nzbwz+Ce+VBPF9pwTk?=
 =?us-ascii?Q?//+WeNWPnpbaU73pqHcW1ZmGpcT3UwbCxiLJqdVDGnSTJxhPU9BScX76g1Fm?=
 =?us-ascii?Q?5egd6gqNWBHU+5mXNHKXNZ7GvDsCiG0p3mQhYQrNnUB68MQpksk8wN+A85hO?=
 =?us-ascii?Q?ruNMLAM2xian3ffn1oDIeUKZBpevcGgt+1e5chymMQFYMT9rZHGWl3b9DxCD?=
 =?us-ascii?Q?2AjIasZoptBTf415aRJHFT5AifFYbZW2SM+r7igVH58MarKBspyDVw2CS1OS?=
 =?us-ascii?Q?VdARx7iMt2SyLtAxxSPrn7NMZXjuMo8RCZE2yI34eYlnZeHssMdoOUB3+yrj?=
 =?us-ascii?Q?olQ1qRvp2enuhMOQBxEXBjdJbM/ukL91DgnrlIxRrx6AOQgpvOHrDL21fAVw?=
 =?us-ascii?Q?tW2LlPJ6jwJzDq/2TWJSY26sLnTFx4yy+/COiLKLw4S/E+G2Lzy3dm83SVjO?=
 =?us-ascii?Q?iar41KpH9hyxm35xc+eWSMhUii5+PO+l1W7kRxCoHBe09Ji/qnTzjepvIaV7?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b58fdf-d57f-4736-077e-08ddb4f6cad1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 21:17:01.8886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWFYscmrdpiZdeDpLNnsoNDfueW+v0eaOb217NgjfhwF8LTaoDcJZWxKCuvX8OppL5jUj9a8QdQidPD1knYPNlcFqBr0WKISkZrkB1mpqYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6697
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

On Thu, Jun 26, 2025 at 05:08:22PM +0000, Yao, Jia wrote:
>Hi maintainers:
>
>Could you help merge it ?

Even after v3 there were still some s/0x1fe/MAX_PTE_PER_SDI/ as I
mentioned in my review.

CI results of v1 should still be valid. I amended the commit and pushed
to drm-xe-next.

[1/1] drm/xe: Fix out-of-bounds field write in MI_STORE_DATA_IMM
       commit: c038bdba98c9f6a36378044a9d4385531a194d3e

thanks,
Lucas De Marchi

>
>Thanks,
>Jia
>
>-----Original Message-----
>From: Lin, Shuicheng <shuicheng.lin@intel.com>
>Sent: Wednesday, June 11, 2025 2:18 AM
>To: Brost, Matthew <matthew.brost@intel.com>; Yao, Jia <jia.yao@intel.com>; intel-xe@lists.freedesktop.org
>Cc: Nguyen, Brian3 <brian3.nguyen@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Auld, Matthew <matthew.auld@intel.com>; Patelczyk, Maciej <maciej.patelczyk@intel.com>
>Subject: RE: [PATCH v2] drm/xe: Fix out-of-bounds field write in MI_STORE_DATA_IMM
>
>Hi maintainers:
>Just to avoid this patch be missed, could you please help review and merge it?
>Thanks.
>
>Best Regards
>Shuicheng
>
>On Wed, May 28, 2025 2:26 AM Brost, Matthew wrote:
>> On Tue, May 27, 2025 at 04:30:50PM +0000, Jia Yao wrote:
>> > According to Bspec, bits 0~9 of MI_STORE_DATA_IMM must not exceed 0x3FE.
>> > The macro MI_SDI_NUM_QW(x) evaluates to 2 * x + 1, which means the
>> > condition 2 * x + 1 <= 0x3FE must be satisfied. Therefore, the
>> > maximum valid value for x is 0x1FE, not 0x1FF.
>> >
>> > v2
>> >  - Replace 0x1fe with macro MAX_PTE_PER_SDI (Auld, Matthew &
>> > Patelczyk, Maciej)
>> >
>> > Bspec: 60246
>> >
>> > Fixes: 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM
>> > support")
>> > Cc: Matthew Brost <matthew.brost@intel.com>
>>
>> Thanks for the fix:
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>
>> > Cc: Brian3 Nguyen <brian3.nguyen@intel.com>
>> > Cc: Alex Zuo <alex.zuo@intel.com>
>> > Cc: Matthew Auld <matthew.auld@intel.com>
>> > Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
>> > Suggested-by: Shuicheng Lin <shuicheng.lin@intel.com>
>> > Signed-off-by: Jia Yao <jia.yao@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----
>> >  1 file changed, 4 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>> > b/drivers/gpu/drm/xe/xe_migrate.c index 8f8e9fdfb2a8..1ede50780a14
>> > 100644
>> > --- a/drivers/gpu/drm/xe/xe_migrate.c
>> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> > @@ -1555,13 +1555,13 @@ static u32 pte_update_cmd_size(u64 size)
>> >  	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
>> >  	/*
>> >  	 * MI_STORE_DATA_IMM command is used to update page table. Each
>> > -	 * instruction can update maximumly 0x1ff pte entries. To update
>> > -	 * n (n <= 0x1ff) pte entries, we need:
>> > +	 * instruction can update maximumly 0x1fe pte entries. To update
>> > +	 * n (n <= 0x1fe) pte entries, we need:
>> >  	 * 1 dword for the MI_STORE_DATA_IMM command header (opcode etc)
>> >  	 * 2 dword for the page table's physical location
>> >  	 * 2*n dword for value of pte to fill (each pte entry is 2 dwords)
>> >  	 */
>> > -	num_dword = (1 + 2) * DIV_U64_ROUND_UP(entries, 0x1ff);
>> > +	num_dword = (1 + 2) * DIV_U64_ROUND_UP(entries,
>> MAX_PTE_PER_SDI);
>> >  	num_dword += entries * 2;
>> >
>> >  	return num_dword;
>> > @@ -1577,7 +1577,7 @@ static void build_pt_update_batch_sram(struct
>> > xe_migrate *m,
>> >
>> >  	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>> >  	while (ptes) {
>> > -		u32 chunk = min(0x1ffU, ptes);
>> > +		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
>> >
>> >  		bb->cs[bb->len++] = MI_STORE_DATA_IMM |
>> MI_SDI_NUM_QW(chunk);
>> >  		bb->cs[bb->len++] = pt_offset;
>> > --
>> > 2.34.1
>> >
