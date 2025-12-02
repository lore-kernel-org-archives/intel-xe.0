Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31B7CFD2F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 15:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 281A610E09B;
	Tue,  2 Dec 2025 15:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="du0SSMdu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B260B10E09B
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 15:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764689549; x=1796225549;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/ZMwb9DkqU9VBk+hvCqIjhGNvo71HBXwJSZjbXJHqXQ=;
 b=du0SSMdubdzXcK5b3kceuovJQ/3BlF1k1RKxhu07Opi8/SnqIdhOx33W
 Zp4QzBbwwqxB9vGAzIA7ddOuK+ZoVLrrIe2YRLGZlNv+DQaU75R5ZMyCx
 8W6SYHndEfh8uJ8VT+z2+ZfW7sNzThnP4KforNUpTzng7SNGF97Xh1sFo
 LQpr82cbll7LsG/dIjMdP5sQV1IAwpjy9WtbuIOtEmVLvMx1jzc4dSZVU
 SEetCwclpi7vlPA1AF3H24TJsOfWuMxCZq0lMVMDdtsdnjzrk7deoe2Vw
 tqrdjt3AYe8UWjEGDhUHSobn9MRLBEqBp2dPZAG7ePIOHD92q1shekKnG A==;
X-CSE-ConnectionGUID: 6OAEsEyFQEymoR5jMraZIw==
X-CSE-MsgGUID: oqh+CL9jTZCRFop7yxK6tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77285400"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="77285400"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:32:29 -0800
X-CSE-ConnectionGUID: Uw78ZavSTVinE5o+TidMHw==
X-CSE-MsgGUID: /32Sz1W5QHW6MrnJVBEu7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="194833920"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:32:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 07:32:27 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 07:32:27 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.35)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 07:32:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1xx56RjEQwpxFvIwRY3MmKiKRXev90pWksBvO/xLYX6tsvQDOpwAfcakV6x5SJ4/zJXXBMkBKsp0TFRAiKPv4QeoMHQmsMX7W5oRqzBjzD60sRJ7FIJnpd7usyvl4QqK4te79wnkY7ZJ6SoLDGZJMVkWCVRe7Zdo1TGdekPXq+vd2R7dyLGs04OKaCIl4Q6apdL4GCpzu25yx38378H/3AHQRTpJSTALlDHjGIsz9QSksWQ/dhl8AE50Ge3RVN2xpPhLjp8wsIznc5JQGcW2y5YJmy6+aZSYm85BmbQ8waV4z/4onypXO+vCsbjgB+RN24ijnkUrKx1U7nE7NhoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47tdfpsE91nXF31eJIvT4yZlGbpE1JHd0ucnK874Dbs=;
 b=RuIx4GCk0g8qMyomV3k+WTbY9OBRw3aIVHm/4GpnO+skHnLV9A8ujYfTpXohuqYAQHpZFOFI1QSwgHLqnfGYIUBv1wVGFln+8SfsqX8heFyNWTvCjh5v85tT/5WM9g1DTv3qlgSti8k8TPJMdecZK+GHTWY/mgGetlLlvDpoIcBmzthNPU2pCeNGXiFG/444RbidklFbB1qmAQTHIgmsxr+Oow8vxh5JK9BjjQot/sTq7nDHFGUqXEKgvGnQpTuYR5Co7tjPmrPoB9QpoTVe9YPnFIgxVNcFR0zeTnLfJyg1iVBtyPVuxSvDQ5mQWmVW8tUwqNdi4bZxHPBWcTK1+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 15:32:25 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 15:32:25 +0000
Date: Tue, 2 Dec 2025 07:32:22 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Raag Jadav <raag.jadav@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 drm/xe/gt: Use scope-based forcewake (rev2)
Message-ID: <20251202153222.GI4065316@mdroper-desk1.amr.corp.intel.com>
References: <20251128082212.294592-1-raag.jadav@intel.com>
 <176462027430.46175.3357751512890680444@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176462027430.46175.3357751512890680444@a3b018990fe9>
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 19c4d3d0-a495-4e76-3b1b-08de31b7fe46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eaeGPAKE5jUYNXsJHoEErxqZURk8pQD+k5erzJ64y8v9oTJF2qm6e+KSH0XD?=
 =?us-ascii?Q?4t0IOAqopqjNeDHiwKtUngt7+2krXBOnhg7NS1Le/zCgHs9rOrxFMmJUDsSm?=
 =?us-ascii?Q?fibVzE/ONHnVFNUGn9yhLaLObJuZk60KrgRp40DEnN6J8wnfxbJrS9C3g6et?=
 =?us-ascii?Q?+5aX0D08Y8ReMm5k+JqkRzDayhNBnCGqCb4BUaTJdL2Qv5SgSuptZxZDou52?=
 =?us-ascii?Q?9edt/Z6L6cTxYCCMjVLhvvC8d26pG7mqzjyR0Z/J7XoaTaigomH9awIkgvFy?=
 =?us-ascii?Q?A4i/yjCFfU7cPd3ZlyZNIgyxHLvX63s371y1ifBSNDuzYR+QEe17aP0ma3Mi?=
 =?us-ascii?Q?mr0atEelY5FGqT5NiEytT1Kc2D3P9RctbbMNvB0UqLcNA427aNOZpuydsUdo?=
 =?us-ascii?Q?Za38P+dxhXXuDa0Wo1VIue8Xro6soNe5cx6fMvQ2iRxtB98ZlXU+MrpLoOk7?=
 =?us-ascii?Q?hm134AXLHClbwIkheIU2uTZY8UFOwQ9P/anwA+ksOr1eW+tWxYS3cuI1UlKe?=
 =?us-ascii?Q?9J0Wauvc0cbdZyAwgfX8R3YPTFHivlF7oObTnYhdt+TVLmzyXBIfMPFUYAW4?=
 =?us-ascii?Q?Q9exLbOV7zjqJsUXm4YxoxpfmkeyRUoUWa41BKZ4SCnhIbNJtjasafcnYBGy?=
 =?us-ascii?Q?JYZhhJA3y+jXpd13lY+cewvcrZTmde+3gO+WQ40mDef+RnfYo7+t8APp1/RT?=
 =?us-ascii?Q?pT5VltHdpQXaOmQSjD+P+0nh5FgmZzUZwH+Qxz+g3ra4UToCxVVArBxSybPf?=
 =?us-ascii?Q?dESpaltmSa3TNUx1TkmynXui46lB9T3PWHzVWO4M1UjXK8F1RiEsZWB0OaxX?=
 =?us-ascii?Q?ERP5HXw5Lmw3jAN3EhKrktgVcUfn0SBVgPnisTkACVKtan76elp/qtDTlwMZ?=
 =?us-ascii?Q?0BTGDNhOSkqGhxh0CuW2BackEcPBrHdB0bt5IwR94W8/BL605IUlWHJ4IjlO?=
 =?us-ascii?Q?vxr2nEG/PT6lGHzbBMbp2j1RviWt1Ruf/XFz0uRqXherp4ye7hG42/L2hDQ/?=
 =?us-ascii?Q?8ODtFNLBCiMFO+7NS+0Cyi4rbK7hbqhylDNudxt0uHnHPRVacJbtczAG38q3?=
 =?us-ascii?Q?BRvzuD5sDSIqkUsmt5fkjgiqLWfmn4y5vA03zOIdIb3BwgpicIdO/yH11voO?=
 =?us-ascii?Q?2OjisJ1C6cikiY5d6mt9RH89FtM0GdCNxTyChOUnIEQf/inCINXBrAmycTJx?=
 =?us-ascii?Q?9zEK+qeBQkOMhpd/JsvDGmzSo/iHVOhLwCHZ2yYJ//1QMdr/kqefp5K+Tc9d?=
 =?us-ascii?Q?/bAfxNh8Ur2QBiDEAUl+V5aJA3WFfISgWEcz8bArF3sd5HiCCidCKgdBUkm7?=
 =?us-ascii?Q?rMWC7qSQ/CbABe0HwxozSD79BfVlssZpB4CWiLYWAjM5VkGeZ2JTRaT1J/0H?=
 =?us-ascii?Q?ieqUdGH0SD+fcUOzKmpER5mpPPIrBrgv3pz0/cr+hRUDbd7dNg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TQ0hs6rOZPEPtREeH7EfeXUTRHp/tvc2/vBrdB6LqQrDJlnX18gp/RQlICEJ?=
 =?us-ascii?Q?IKLeMUdr5fD8ZJM6R1BdC70zhVrLUcf+WBfxMgiTnExM7Msi5Nr+hurzhww5?=
 =?us-ascii?Q?5LoEk2p1anxqQUsT27ioTNBu2f3vE82Yn5wYjWNB1026s0zNCX6cMwLpjeHD?=
 =?us-ascii?Q?+rFyRE1M/XjpeuGKo3ZBIEAt+o2c0gGi8Y52AjQMNYgdGN4RIIaa0oCDuY0D?=
 =?us-ascii?Q?3qssRTnnrao8D3UZG7NuPwnGyyrBQ+gzMB495iDspzhTaz0lglJmYAxCa3qx?=
 =?us-ascii?Q?0TuSAULxiniCbd1IfMzyXRkY4owRLe8HvvoEwKnwMNofU5mnd9z+XRPonrfF?=
 =?us-ascii?Q?ALrljnhyTF7qIQw7KV5D8f2tFI/62oymub0b7KdFVIIDXsM3wI3nZ7vJsEPB?=
 =?us-ascii?Q?mECgJI7O43983NP0ve5VHZPXqEfBi8ZGCgQe3sbwgvi4yvlR52DE1jhO9DdO?=
 =?us-ascii?Q?mwURnEzfux2OgCYuG9stvuOxRdIQD9aWlRxnymSKrzrEg/agRIFF5j+CqO6Q?=
 =?us-ascii?Q?I8xkDDuCNGY7TdWXFvxbivhF9ed5wa9vnlg7a2FExT5dehBLN1MCDev30rbx?=
 =?us-ascii?Q?Yd4YPBM15Fg+WELH3SYJTQ9obLrzAff7tp7zxn8ucXFAaPQXfP5OEFgaFDZL?=
 =?us-ascii?Q?OP+T8kn+E4BMo670OMKbdR4vn4T76W+AlY7C1L1UZzeZop1832LJlV8N7sHA?=
 =?us-ascii?Q?6RoEXLX0XbBkoruBytI/G5QvbWcx8cSsfK6R2jeHnYXlacYId2wUzOJ4g0Ma?=
 =?us-ascii?Q?YHW/l31ANoOg2C0hcCUGbAQMxAXSKJnAgQ1dgxh/b03zR6/R0QLn91PxPqyt?=
 =?us-ascii?Q?xWUl/xNJx2TadyZ0nNf4ik9e9h3sDQ927n6mHYSDpMIJQfwk/NdSrvKRPKC6?=
 =?us-ascii?Q?ywIm+atP3KPJlZglGyAA8uNvTW/T/sef6fXZrRRHwP2SSXeDTUifDO+bVAfv?=
 =?us-ascii?Q?YjLzp8LkBsDX5A2WNFngMlkquNjAODjMFWJTq/fnfzUCZ5RHsbPHKkMAd8vA?=
 =?us-ascii?Q?Gr8H29mAbdA61kDlj/voijNBIgk+5L7ZAPeQEf6hxje3bk+a8Vu0DYMx7XNC?=
 =?us-ascii?Q?OV/7X1rFWST5WuLCzNoRuaGWe+I5z37vSiS7+0xw9e9SL4VyHhD9STwheGKI?=
 =?us-ascii?Q?Wrunb1uJBGeFQ1VJDh/dN7FSl7if9DQ1fYIvTlBjxpNRFfZV/YDGG9oWtaq3?=
 =?us-ascii?Q?TWHbDT82wWOqxpweHDh6vivqkwg9JaBIayrdbMJKJ1gr2q5vkPJ0RORXHeDk?=
 =?us-ascii?Q?VC5NqCMiE1fuWPxLmASSurZx/X4236J1f6D8YFnzIgRZ/wG36yrDokWX1BfD?=
 =?us-ascii?Q?KIRR30OOVmaOEXGsT7o9g1kClcVw6m9q4tbnTUXkaq3Kh2mQhzfTwJ7GZHA7?=
 =?us-ascii?Q?AzEy6oUWszQSBBnAa4/AaijEcaJKH9aexQ+vOL21bxyzoS1rYTrcyIdCA63u?=
 =?us-ascii?Q?eYZFnbTRTZLkYXzDPCzxRlkl8c2mKG+RfVqUZZw1OK0dl0Hx10UJURkCmdzw?=
 =?us-ascii?Q?Rb989rIoo8XOqbnn85MNR1lDrr5TkYAYy/K/B+jDrqQjH79eUa1LAx5867By?=
 =?us-ascii?Q?r5o8rRBw2VoIDkmUbtrNuZfQOHrQvVg7T/tRYTrqoavutkqJfhTOGtBbHUOk?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c4d3d0-a495-4e76-3b1b-08de31b7fe46
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 15:32:24.9849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSUxjSEECD27dsXS8ATBs6/6jzz2yuRvIQQTnphTk6/np3tq3yXhbrEx4pMuSmJSJIya9Yndi/XyP80YB1XZZmglLDjCSRuLZRR3PrZd+IU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7838
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

On Mon, Dec 01, 2025 at 08:17:54PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/gt: Use scope-based forcewake (rev2)
> URL   : https://patchwork.freedesktop.org/series/158197/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4175-9cf4ded7ab47c43e2b0e3a561957b99c47f6b32b_BAT -> xe-pw-158197v2_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-158197v2_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-158197v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (12 -> 12)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-158197v2_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_queue_property@invalid-property:

These failures are due to commit 1026c1a73a96 ("drm/xe: Implement
DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE"); not related to this patch.

Applied to drm-xe-next.  Thanks for the patch.


Matt


>     - bat-ptl-2:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4175-9cf4ded7ab47c43e2b0e3a561957b99c47f6b32b/bat-ptl-2/igt@xe_exec_queue_property@invalid-property.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158197v2/bat-ptl-2/igt@xe_exec_queue_property@invalid-property.html
>     - bat-dg2-oem2:       [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4175-9cf4ded7ab47c43e2b0e3a561957b99c47f6b32b/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158197v2/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html
>     - bat-atsm-2:         [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4175-9cf4ded7ab47c43e2b0e3a561957b99c47f6b32b/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158197v2/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html
>     - bat-adlp-vm:        [PASS][7] -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4175-9cf4ded7ab47c43e2b0e3a561957b99c47f6b32b/bat-adlp-vm/igt@xe_exec_queue_property@invalid-property.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158197v2/bat-adlp-vm/igt@xe_exec_queue_property@invalid-property.html
>     - bat-ptl-1:          [PASS][9] -> [FAIL][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4175-9cf4ded7ab47c43e2b0e3a561957b99c47f6b32b/bat-ptl-1/igt@xe_exec_queue_property@invalid-property.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158197v2/bat-ptl-1/igt@xe_exec_queue_property@invalid-property.html
>     - bat-lnl-1:          [PASS][11] -> [FAIL][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4175-9cf4ded7ab47c43e2b0e3a561957b99c47f6b32b/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158197v2/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html
>     - bat-ptl-vm:         [PASS][13] -> [FAIL][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4175-9cf4ded7ab47c43e2b0e3a561957b99c47f6b32b/bat-ptl-vm/igt@xe_exec_queue_property@invalid-property.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158197v2/bat-ptl-vm/igt@xe_exec_queue_property@invalid-property.html
>     - bat-bmg-2:          [PASS][15] -> [FAIL][16]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4175-9cf4ded7ab47c43e2b0e3a561957b99c47f6b32b/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158197v2/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html
>     - bat-adlp-7:         [PASS][17] -> [FAIL][18]
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4175-9cf4ded7ab47c43e2b0e3a561957b99c47f6b32b/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158197v2/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html
>     - bat-bmg-1:          [PASS][19] -> [FAIL][20]
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4175-9cf4ded7ab47c43e2b0e3a561957b99c47f6b32b/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158197v2/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html
>     - bat-lnl-2:          [PASS][21] -> [FAIL][22]
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4175-9cf4ded7ab47c43e2b0e3a561957b99c47f6b32b/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158197v2/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-158197v2_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@xe_waitfence@reltime:
>     - bat-dg2-oem2:       [FAIL][23] ([Intel XE#6520]) -> [PASS][24]
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4175-9cf4ded7ab47c43e2b0e3a561957b99c47f6b32b/bat-dg2-oem2/igt@xe_waitfence@reltime.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158197v2/bat-dg2-oem2/igt@xe_waitfence@reltime.html
> 
>   
>   [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4175-9cf4ded7ab47c43e2b0e3a561957b99c47f6b32b -> xe-pw-158197v2
> 
>   IGT_8647: 8647
>   xe-4175-9cf4ded7ab47c43e2b0e3a561957b99c47f6b32b: 9cf4ded7ab47c43e2b0e3a561957b99c47f6b32b
>   xe-pw-158197v2: 158197v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158197v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
