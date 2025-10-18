Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF7ACCD199
	for <intel-xe@archiver.kernel.org>; Sat, 18 Oct 2025 03:18:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D72B10E352;
	Sat, 18 Oct 2025 03:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dw2dHnur";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B2710E352
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Oct 2025 03:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760757493; x=1792293493;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OmeaRnzHieSJQnQMTgUWhwQqzHjlp/kXojs/vpC9fog=;
 b=dw2dHnurhpEr+ognYbLqNaV3imn6yBM9CqTZuSMyoJ20MQDPJC4NZrBR
 blxsLw/VaxWXevjCKrbd+hxuF1aOzkmnYKOtV1474hMoj3k+AXm1ZeoPf
 bkSquwEZEOqJvCc7PmK6OLuhUIjXfAeZpP8546GyU7IPKIzZretKFytIS
 1WApP3u/MuZd4PLzYCGOVU6xVVAGM9Qgeu9O+fnmmJ4NdeUG6LeOqqKVM
 FWJemSpUocwdEr50dzDjxNnaGX35BR/FKM+OwfacCWlARUT4jPGgosL+l
 ROGcpQ0LrhZj0UleR45tCRbbS0m5N+019hchj0u0Liq5IVQiKcOSAvrcf g==;
X-CSE-ConnectionGUID: o+2PGTkxR02lSGv77BCTWQ==
X-CSE-MsgGUID: 2Nf4ZCB+T5KPSoGoYjqqPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="74413903"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="74413903"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 20:18:12 -0700
X-CSE-ConnectionGUID: yKMM4qlEQKOmB4Hn7pgr2g==
X-CSE-MsgGUID: Wuh7Q8VrRk6mJ9V2U462Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="182432027"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 20:18:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 20:18:11 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 20:18:11 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 20:18:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjzZHT6Gxa/xncZKN6EKjkvnOOaOEvwQT4CDJu148FJbQ0SJnBUG2YoajUJ7KZ1lstxyBxfZH5beghzpJXp58J4RqnbRjDIa+FxpjpTaPDGw5z2vtR1OwCqsjbLxXh7+CF6UVINU/9CjyZ/aeE3oIE+xm2BT3CHAKFI4kvT5b1x1KIkXntSkl1xhEzcRDke9bie7CHLfifElbmQuRwoCEWGwwH0bf+LbsF6XenU+t3qmUAW+JYMzxb/8YS8j3Jxk4UPq7oJigBvXGoN0HM7P47N2Jzw7pKXPK/YxYFQK/togALVsayRmzKBaR0d3sCjjqV1BUh9eftj2YQDmzNYcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXGWZyLYLsMwbVq3uqmY4jiy8GQVydLzhto1/e1dw7U=;
 b=brDdwTlsCCvSz0q31d2K2OW8tECQil6TRKOzhpVx6VssppPPQ3E57e8Iao7bo6QEdkLd+N5v8Ivc8eqpdkHhjsM6fRP8BjpbR8Kvlld/Hozb9EMULjNOibfkqweO72iCvsz94dOgr0Ne+pT/dCvjoQ+peWoWHpBkbjfFiE+Pj9BK3vcI9G7UrAUzVFaYJ2XvLTGGELkHTA8qr7Xa8C73PQXL0eoOF55wnee33GPCuUtQGV2wapTWSO9MFI1+6/nw10kw//0kQeZg4BuUxKw8FomxZIu+e3AtSUW/i6k5YFR/WO/lC+EWLqgMKFIrY1n/SwKjZrvYSUOtJxBzfYa6Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA4PR11MB9057.namprd11.prod.outlook.com (2603:10b6:208:55d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Sat, 18 Oct
 2025 03:18:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9228.011; Sat, 18 Oct 2025
 03:18:07 +0000
Date: Fri, 17 Oct 2025 22:18:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Fei Yang <fei.yang@intel.com>
Subject: Re: [PATCH v3 15/24] drm/xe/xe3p_xpc: Add L3 bank mask
Message-ID: <ua3zln3gpxv66t2drvxjbkauenpjycjakr2jnhcv5ma2zjlwex@342zwuulyjt7>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
 <20251016-xe3p-v3-15-3dd173a3097a@intel.com>
 <20251017175155.GW1207432@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251017175155.GW1207432@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ2PR07CA0004.namprd07.prod.outlook.com
 (2603:10b6:a03:505::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA4PR11MB9057:EE_
X-MS-Office365-Filtering-Correlation-Id: 06118d9f-70fd-4fa4-482c-08de0df4f582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5k+UpIte9Sxbao+kAmrj6yDs1fX6topZT/df+qnSbtqa837+uDkWjhaYC60i?=
 =?us-ascii?Q?noGnXONGX5au6rUj2lLod8i4dBLGQNwgBWSfyJD1C10dqpuc53kIRwsm+Ka4?=
 =?us-ascii?Q?pptWoh4eShBimB+9+HiEpYvQfl0A1Ix0KYfs2DSGP/fa7ish2Bzba+ol8n0+?=
 =?us-ascii?Q?KXAjjEOEmxIiXwVRj21uKQnot4VJA7C96vRduLGy9er844vk+L9/7kAEJu5+?=
 =?us-ascii?Q?RM0A0cgSWYj4QNBN7PnHnQjzU0lp5QQ133hDOxWMZ6dE7f0bfuKV4AZr+6Lb?=
 =?us-ascii?Q?HNDGsrJQ4tXbZDNB/hfsUzcVBXsqyqm8DWl7U1KMvisZjHdxBYTho4LI/oNi?=
 =?us-ascii?Q?0ui4gMn086Bvwc+xR1BvEcw+tJuVEhPwHC1/2CagGzNVUi28d+RgINc9DJsy?=
 =?us-ascii?Q?YuXEIFImmSkg70n6gdssWcBEZTalRH/6HpYkv1AM7gKtl32za9Owtgi8Vw5q?=
 =?us-ascii?Q?G4LMDA5ydX3zGBVEgA9Ac1kSt2n2hAWGw5a6ypfg+hShIxQZvCrCqS583gSe?=
 =?us-ascii?Q?4LdpjhVvUjirbwQ8xgl6oJqyojaknuTrDcOW3g+sR5PItFde+bo9Gm8lLmZs?=
 =?us-ascii?Q?Wqe52XnOzx8VbU6RNrq80Tx4fNF0ggtmMfPw4Yj9HNMsXL48DkV5ssI++1wm?=
 =?us-ascii?Q?gElQezBGRG1vdOG7Y2nRsveEL5IM/MJYcYwek4+GSbRyqytTXeVIezzKpPjc?=
 =?us-ascii?Q?zhkAqYoetI3/NYhup9gutPbQnGDBs45yzz2hlX1IyFK3kMN3hwbKmIsrF7hb?=
 =?us-ascii?Q?+5m2ZJhoc7MzAgYiSKb2M1XkJ5B25S/lqrwbS/1b9Q5Cg7hvr6toWHPUvtcr?=
 =?us-ascii?Q?7uiwPYiDFeU0wFqlYLo1S2ZHot8wPN0wXh+FTTVpURb3Bw9mAolAB3ZjkInd?=
 =?us-ascii?Q?AtW2tIfiJaQ+JNlw+fRKkbJgNJicRcU1R+T99xLFRYWCUIaY600lX0LJf4Y/?=
 =?us-ascii?Q?zRPTAC4q9zVmFHk414N7UFkf66Ps/+hwPTsOB4yMSxHY6J+cY/PXXYxZMHjd?=
 =?us-ascii?Q?1MNx7TOReN/sNYpYAXbKDQbNem1mb53Uy4Jm5By/dVNzHjU5W2vVkf973vV2?=
 =?us-ascii?Q?rrUvDRKA9ofhWVGkNYAiHhnY2VTKfEoMNXxmKWXMPaBC9yhxFhNyRbQ+mL83?=
 =?us-ascii?Q?f2iaa7min8SxBviqFc5i2OKi51KWQS8EZZbWfn/p+RdJNCbcyXxJaSTP8cqU?=
 =?us-ascii?Q?0gfJx8/U7p0LmeW21MiqClZvuuyl7niD6Ry2Xab3l6FsCew8WUhuwY0xNh/x?=
 =?us-ascii?Q?7x6OzvnbRy5i7KEhY6XWl8M7DV5Me+4JyqOgt8rTh30A4HWcdiap99Dw3ZGy?=
 =?us-ascii?Q?GTWMdPIKWfJ7JXwiJ8wLFVjbSDnImy+Nn4m+4lotedWIh1nJNWle/n/DLQZv?=
 =?us-ascii?Q?xNh0w2BByuWjkQKlFPeoSI0uceCytaOPbiYvD2rw9rEsavecmz1WutNTLqo2?=
 =?us-ascii?Q?QDLf8iqGsHaToeBXwGsW0sM/HuKNkYLp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eDDlWgaKzK43eyjUydgZS8EFd97wWAMp833T1aPEOcCcouqsM+zyUCl/emkI?=
 =?us-ascii?Q?pt4Mjs+CyBDrjL1/kVR+CSZ6AYWL21rLN7oalZsseG+AaCrtTfFLEqzIQ3M2?=
 =?us-ascii?Q?bKaoeDZMp60pAFqz9jtj9/OsZYGv+D5+zK4dgf2rk+SpdQpfc56FLTPvDeh3?=
 =?us-ascii?Q?7h8kTpXyGkAODlds4AEjE56OEqZJYf8pQVJ2KjHD13Syb3IhlKr1e0kTrz0d?=
 =?us-ascii?Q?SbP3+kqtoa7U4xYu0azSjVaVrf0Ppkd50L/HiJpVO+BdzOFSCV8HIwY7j4cH?=
 =?us-ascii?Q?Vr2gETRNFGsJOeCUYH33lvoC1VP6dM2U7yjm6AaxZUjLTNBs08VnCsIORavN?=
 =?us-ascii?Q?3LG71ZPjD+Js9uAkT/Hn+O/aC4RrCuSe6oVcAGceMF3+jVprdjLa7BvvudHv?=
 =?us-ascii?Q?UM1BKqhMphXJ1/9+0q8cIRoLzNvDyFozSRyNdZwH0NL1A7tjK2nvG1294QXe?=
 =?us-ascii?Q?znIkvn1FcVKL4YpmM7U0+92DAI839G03oQFsUQ3GxiHanMi6SiXNJE2LsbtM?=
 =?us-ascii?Q?tIPriW/OAdu308H0f8pbYpC+OPhRgJBM0RzRhLpZke+H2WXp4N6LfSIIgH0m?=
 =?us-ascii?Q?BNwJaoynltZuJuAjtbTa58UvkSDfirfkXcjUNst9tFsrTNf1ol1I7yBrGtcv?=
 =?us-ascii?Q?3gdzuU+I3kZE7wwI/DWYlnSANc63lQxKcAPttt5sTm1krKZ9hIlsq0194OJG?=
 =?us-ascii?Q?qevvibvgreV6THcvET/kYeAqjIRtVB5gueF3MNqbk1M+R1Nj4V/QiTgzeUrv?=
 =?us-ascii?Q?Mrrj9W8sEsC+N4h1HIMhOQ44ZKBSZu9V3iGcLrZBxZD6Ca4Mn2JMu9nUsRPk?=
 =?us-ascii?Q?/UHwPG5PacdFOhvcbLJz9i0IHxwtxW4ZeltIuFmSR5Godz30D4iaLJRfkxvj?=
 =?us-ascii?Q?C2qpA4LHTwvGkQfN3qryQgTTOShIsCXDoe1ixnd0DyZ45uNo3I7aJdpSKjyN?=
 =?us-ascii?Q?NuEjlZN9RwPo+TTB0R2VygCaO74qG/a3+GZdrjWNQLWpHAArhhCutzda5jQQ?=
 =?us-ascii?Q?T+xNWNPAkcBzrhdCRl6ku+hY+N5A6dDAq0hnpmBD10a6JeASy0zUwwjtg+hJ?=
 =?us-ascii?Q?fsWAwkaqJttNeYcz8jz2ZITocYKDZIQDlwbpSFC+PBs+rxQlAaFar3dTRTnk?=
 =?us-ascii?Q?dVtSmhxNzDaYUDzDJGDi4+KdjL0LmLZI5kHN4mRDRxwTvtSwtd1nWaAY4KJ1?=
 =?us-ascii?Q?M8e3//TmiK2YgbOl1OoP1E3oj070hhtR2baVaPa7HtGrKJymc2n9zaGzFdcI?=
 =?us-ascii?Q?4KpOh/63XCXTZ24/DENCrg+Mogdx0lHeKNCcocgH9WYiEOdMxz7pwR5c8lEb?=
 =?us-ascii?Q?GO8xrkWIH9ZYzaMHac8zDRbDw3l1bpNL4s9N89MtN0rCvVEhcJ+aMgXvXr7m?=
 =?us-ascii?Q?TgpXWAc+LzaPeeqT5ylK6LrloEDX8w+9iNVZ6IlqPGDN/ndfOF4nwxYVwW8v?=
 =?us-ascii?Q?vsvdSDZ3MlO4xysSueBckhFn5pbS8g/nOELIZN14z3NxxmSSqEeWXvvT0ClD?=
 =?us-ascii?Q?uarXVPtJtr90tOlcESrBw3AJjzBf30ABVDMNdU+wI027QIc1ImMCmIXBJSZi?=
 =?us-ascii?Q?gKb4ojLXZH7iJXkiCj3s5FBHehwaTTlaLBpkIgkBulneu0qx35dISbpkm1Jp?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06118d9f-70fd-4fa4-482c-08de0df4f582
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2025 03:18:07.6609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KsLLUHFoJlL2P7iitTOrNn4u7cuabnPRIrA/3aAv9blND2ANaw3hXC7XFRCizCcm8VKCfiG9OfJKNv7bX0WR+Gh6GcWsWZlOqv4yWmHgdHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9057
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

On Fri, Oct 17, 2025 at 10:51:55AM -0700, Matt Roper wrote:
>On Thu, Oct 16, 2025 at 07:26:34PM -0700, Lucas De Marchi wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> Expose L3 bank mask through topology query interface.
>>
>> In Xe3p_XPC, MIRROR_L3BANK_ENABLE represents the full L3 bank mask (not
>> just a per-node mask), and each bit represents a single bank. With that
>> there's no extra complexity to calculate the L3 bank mask like there was
>> in previous platforms.
>>
>> Bspec: 73439
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>Actually, although this patch is correct, I don't think it needs to be
>specific to Xe3p_XPC / 35.11.  It should be equally correct (and more
>future-proof) to make it a general Xe3p patch:
>
>        if (GRAPHICS_VER(xe) >= 35)

changed, thanks.

Lucas De Marchi
