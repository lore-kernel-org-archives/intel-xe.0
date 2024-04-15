Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2073C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 14:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7AD11260D;
	Mon, 15 Apr 2024 14:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JgYsaReX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D1A11260D
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713191405; x=1744727405;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aX+7+sGA25mOeGjSGGluukGAQVqJTcX5DSTdAXdsSXA=;
 b=JgYsaReXpnRpgAxXgVOxkZIdjqrYvJt4geTIVWh6APUufMC9aY4wk2zp
 Uw7FUfDsRmvHOZoaqpUIuOq+/wyWCh/zn/mSEvJckR3ZNvGzzmuexhPAm
 cUsbD7C9BksHieQD2kr7fQEp1iTlG24ulWs4H2rCppSo7Q6iCDDfpqao/
 Trhj1jKI22Op7BTsrN9oOPONS32eJCksWxsZVZCrAZMc5ayy9mjhNiI7L
 Y1vpGiqiLP1Wkr6TR3fvDuPe1HmECD0WJ5Kvbv6t1Fj5/hyMDrx8tGEmf
 eqEh5/zyJ5HSeGAxoGYEhyBxETnW2AfpS6rdcaSJTn8jtUNefx1Av2HlS A==;
X-CSE-ConnectionGUID: B6mVdX5+TPalxoYYtGnkYQ==
X-CSE-MsgGUID: A1CJ31B+S2CGORkimAPjrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8442337"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8442337"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 07:30:04 -0700
X-CSE-ConnectionGUID: +YhJDAjaThW84J2YohExIw==
X-CSE-MsgGUID: u9LKYNukTJiFspNSUlGQ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="26722100"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 07:30:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 07:30:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 07:30:03 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 07:30:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iN3bSsuQbt91CUGN3MRD6vS/6UyQlKrvWSdXcPvdaIPncPSXivmJqoPMB7TKwpv5pUKsMAu5aRiTjUl1yUVxrjvdgCjP5YA4TA/UxWUuGeZ7tcQ6nb1TpU9789fncOUNXORCkJBO7os3u4e4PFza2E8Mzn6Fp+5GkKMbMVnR+jvl5jFaRTOt3JViuQklBesc2Hu6Xf7hq+mn5dpBeI5bG8ooVJox8Gnqm3a1ofsq1unHNEsaFjCltCHg/56kiOG1DmukPH3WUfPQ9LYcJ7/oXjelPIOOABh5lh0mGkvuaFHgJnb9xnBT7f1KHz6vveE5A+/mltzkccORpbdhSdMnBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmcq4KKwMxtNqRmZVV5eNWFtFv7/P3hO1m6i9TcvPpE=;
 b=jWwp3DqGDuYTQ495UdMNUWl6QdEx9ydzX+O+kp1CqhtJ8r1GjRsIcM1eLPff4+TdPKjl5JhMSeZRyZLOv8kaqnSk3lF+azYBx63Vjnxl3cFZ91z59TVtok6bLMgfss6pB6pNkLit27ECH4SPW4pzpb2ZmbCKW+4LexCobEeqWOLqCELgeTE9a8WJ6cRLZAImexdEqquDrSJ3M99RkF/nRtYYo1M+7Evoie+CrXSvObcgBF/89uXaukPbcLd+GLOfJ32w7asZjRZh/2CkOsOETMYkvYG2AY+mS57zw8kHDhUBXl1eTxt1g0RuO9ZpnUxz4F2qE9evCUCv7YBCxz6HHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB7439.namprd11.prod.outlook.com (2603:10b6:806:343::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 14:30:00 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 14:30:00 +0000
Date: Mon, 15 Apr 2024 16:29:57 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/6] drm/xe/pf: Add support to configure SR-IOV VFs
Message-ID: <20240415142957.2tmcl7n6xyovbnia@intel.com>
References: <20240414190137.1243-1-michal.wajdeczko@intel.com>
 <20240414190137.1243-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240414190137.1243-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: PR1P264CA0007.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: b54fe55f-703f-4f84-ce6e-08dc5d5887cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rFUCYzaViVqJEIYHygJiZ2h9FtUg8yFfxODAK540+rGCL6UBPpeWjMiehRHwwLDh4riSiiIlUhscDivgWKDbIzB6nFLD+lvpy3Bn9Z8AHhijLnR1Dl55893DsLyqWLB+n4n9HRIA6irWIAy099nxf1JNu+FPqtkTPjjXWS0fCeFcvuTv9OJ3VJpuxkzNrfb8iq9qqsbIk+ZT2d+7u4esOp7Ji3/oXgnkT/efne8Pg5KhrvPlPRJMpzc69f+Q7B3FiC/mNJLTw26jOcsO4tIWZsU1kJxoisqIcbbrtxCJGm9JnT79a/GxDsvDBbL9r+W06nkRKPiZ7eb+f1zzRycv61t4Kj9KdKV2K5yrPAOJddDF/L+yJ1hCeUmxPgXTrdTgqyzckloP8zKnjpcskeSMSFWzIZn2wwvz7aIfr5H7xASka1z0bgopP4AITkupQppHuTNj22UkBXZFdPne2kCapjH0Jla+fDQECiyQ1meudonkTyn6tse6Gz0S8wJy2BIrx7xTioyLujUCax0jkX7VAZ5JWaC4De2Jj9Gdn56Ge1vKCAv9Qd3sEyhQd/jBjE60X+2AYY37UxSYE9q0TdG1VADPVuyu5nJGzt65k4kz04oQuA/rIVzEUNCMw3w58VS+phhcGfg7PpfBXdpEH+2bwZhxdiqIjt0lRmwLWkf9Dvc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0dLZCtMSGN2V1ROWHVwcEp2M2FEaGR3VGE2MXVUZ1o2eDAyVXdnelRUaXBa?=
 =?utf-8?B?VGpyeG44ekxWOTZmSXp2QW9VazVtd1hCREtvTkp3TjJGbGpFNHFxaHlCR2RC?=
 =?utf-8?B?UzVaVzNjcTdwM2FLc29yMXRsS2FycUJCbVRGWitvMGdLdmxaWlpVa3RaOTNh?=
 =?utf-8?B?cngvTTdzU1Q2bjNLRENWZmRad2VsOGc4UkYwV0JvWmVNbWlOeGxUSXk1T1hV?=
 =?utf-8?B?QmpZeFQrUmFXckFPY0JOQllrTkkvdTZ6eHUrTXoweXJ2SjlJM0gwZ2NvLzFT?=
 =?utf-8?B?YStoL2tvMFp1WUl4OWNHeXFTeUxONDdVZERFSDFoOVVjNTJuWnRVdVA2T2dt?=
 =?utf-8?B?MXdBMlZEclRkek0xU0k5UUlBVWZlczY3V0tNNXZlNkZXbEwxQXNOMDVIR3VT?=
 =?utf-8?B?TEcvR2twWldpek4yT1lMRTZ1VGlCdisvb2FPd3FxZTJ6dGpYWGl0K0xTUmxD?=
 =?utf-8?B?NzQ3N3JJWlVJb1htUGU1dTZldWdDYlhGNkVib2ZFTkgwWjczYU1YbkR5SkhT?=
 =?utf-8?B?SWN5b08xOVFZamVwWXdCNUtHcGQyb3hOZ2VRVkVoK3E0NGQrR0lhZXgyeEYr?=
 =?utf-8?B?TDZPLzFzVS9JN1RBRTRsVFVveXVTbWt4cW8wMzZRU1h6cTMxUWJDajJOVnYx?=
 =?utf-8?B?NDBCWDRsV1FnOXRjR0dZTUpiVUtONkU1ZkRRS1BiQmVpY2RJK3B5cGxOYXZE?=
 =?utf-8?B?ZEljRWdrZ2k3SzA3MEF3VWY2YkZWSnk3bUFVNXhtekxHTVVnN2NYVUJGMHRa?=
 =?utf-8?B?RTRCWlRFcW1GRUJITjBkZVNjZGVBRHpSMWJ6Sy8yNDdReGdyTm5RcWpXVElF?=
 =?utf-8?B?bmZuN0pLZXM3T1Axa0VXOXplWW11YU1IS1RyYzg4Q0F3RDd5Y092RS9GVTRB?=
 =?utf-8?B?aTRrZGZVQkppaUNiT2tPa1VQSTBkRmhraVg5ZnlpZUduSTFHeXczMU1vdXV5?=
 =?utf-8?B?SlR2cjNYMEg1ZVlhc0RncTduQlBEaGNUcytIQWpmUWY0Ulkzc1RIdDlFK0t6?=
 =?utf-8?B?TmJwcnNnR1pqLzZYbkZad0RiWUJMS3hLRm1aeEZSSmdRTmRWZzR6c3lERkg5?=
 =?utf-8?B?WnRtY1B3UGxhYXhWWmFsRkVpVG9oTWQwQ0VsNUJNTiswbVhMeEdHaEhhZTZ5?=
 =?utf-8?B?ZjJsRHdHL1I5NkQ3OXl5ekFaRHpPeDFMbzlWcWUxQ2ZVTWxCekF2b21SYS9q?=
 =?utf-8?B?cU5ZeVc2TFU2ODVFOEkrWitZc2M3bWR1emJvSFc2Sjh6ZHZ5YkZDa2xLY2Vo?=
 =?utf-8?B?S2x4MmF1RkdIa05CTlFTWDIyZUplTlVMZjIwNFdKMUE2dWdzQ3hsd3VlMlVT?=
 =?utf-8?B?VXRhTXNZeDh1TEpiL2dsUHNZZzUzUCt4MEgveG1YRFlta2dPcGRLWFN3dFp3?=
 =?utf-8?B?SWNaK2xuT29VcVBUbG9CUk15UDdlQUUxUFQvTnZiYjZNOHFaUWpsYkt0WGJ1?=
 =?utf-8?B?M2lFNzZseUl0ck1hdFl5MjJjZUpDR25vY3htT3UrazhzREhUZFRkTzJDSVlE?=
 =?utf-8?B?K0NhY0ZzdXM0MlFCS2FvRlk1SU8rWjU3NkxIL0pySXZXUU5ONjNmdEYxSXVX?=
 =?utf-8?B?c1FjY1p5NUZ3N1VjRnFMSkZYY0RlYUQzdlJqbm9pRGlzTkJMdGRzVXg4UjYv?=
 =?utf-8?B?OFQ1TUNZZUNxajcxUGhTT0hHa2FnVms3bjZJNUYxN1A2U21RNUZjbndMUU14?=
 =?utf-8?B?SERuRE15blI3WUV1cXZ4ZStrc05lTk1ZNGYvSlY4bzN4cWRjV0tteUxKZUhu?=
 =?utf-8?B?U2hvRUdOSThrdE80dFlQUEltQ09wL0NIZXdDU09ya0c4b3Vvb1M4WksyVmt0?=
 =?utf-8?B?K2JsUGl3em9GMmZhVG8rQTZYU1BQVG8yU0NaYkltZXdBYWsveUlzNVBKbWUy?=
 =?utf-8?B?R2ZQOWVKcnErcVoxM0htMkhlMGlDNUduZlpQQTZoY2sxVnBoMWRPcXJXRHg3?=
 =?utf-8?B?Y3VPcjNTc2pmcGg0Uk9Ld2YzaTIzRUlVaksvU2h0Ylp2dmljSFJ2WlNqNU5Z?=
 =?utf-8?B?bk5ScERCek5hbjZodW92SE5SeTRhT2ZMakRkd3laaGlBbVNNNk8xeVo5OWJ0?=
 =?utf-8?B?T1BCTEtOeDl0MDdzT3grSnBKQTg1VFIrYUpHZzVOV0swSWtSSGQ5Z3hpbDdm?=
 =?utf-8?B?ZnMwT3ZWZUpFdDZFb0JoMjFsVUdCZ0FyY1dmNjQ1MnVxbmswMkEwUmI4M08r?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b54fe55f-703f-4f84-ce6e-08dc5d5887cd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 14:29:59.9905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pEGQWbf8yAock/Uzqd93aZEGzjF8JTFDJ4klm7BoH9orxkDX5m/TNj+46W8jYtOD1DdiVFdCCnW7flbuDIiJy05He9az9jEWV16cZFh65zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7439
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2024-kwi-14 21:01:37 +0200]:
> To run correctly, each Virtual Function must be proviosioned with
> some chunk of shared hardware or firmware resources (like GGTT,
> device memory, GuC doorbell IDs, GuC context IDs) and scheduling
> parameters (execution quantum or preemtion timeout).
> 
> All resources assigned to VFs must be excluded from the PF driver
> use and may require some additional preparation steps (like setup
> of the LMTT or update of the GGTT PTE). Those provisioning details
> must be then sent to the GuC firmware as most of those details
> will be shared later with the VF drivers during their boot.
> 
> Add basic functions to provision VFs with all hardware resources
> or scheduling parameters. We will use them shortly in upcoming
> patches either in manual provisioning over debugfs, exposed to the
> advanced users, or automatic provisioning done by PF driver during
> VFs enabling.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                   |    1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 1960 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |   56 +
>  .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |   54 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |    6 +-
>  5 files changed, 2076 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index daa5865a2773..18c650439716 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -161,6 +161,7 @@ xe-y += \
>  
>  xe-$(CONFIG_PCI_IOV) += \
>  	xe_gt_sriov_pf.o \
> +	xe_gt_sriov_pf_config.o \
>  	xe_gt_sriov_pf_control.o \
>  	xe_gt_sriov_pf_policy.o \
>  	xe_lmtt.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> new file mode 100644
> index 000000000000..a05c7ba59f99
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -0,0 +1,1960 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#include <linux/string_choices.h>
> +#include <linux/wordpart.h>
> +
> +#include "abi/guc_actions_sriov_abi.h"
> +#include "abi/guc_klvs_abi.h"
> +
> +#include "regs/xe_guc_regs.h"
> +
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +#include "xe_ggtt.h"
> +#include "xe_gt.h"
> +#include "xe_gt_sriov_pf_config.h"
> +#include "xe_gt_sriov_pf_helpers.h"
> +#include "xe_gt_sriov_pf_policy.h"
> +#include "xe_gt_sriov_printk.h"
> +#include "xe_guc.h"
> +#include "xe_guc_ct.h"
> +#include "xe_guc_db_mgr.h"
> +#include "xe_guc_fwif.h"
> +#include "xe_guc_id_mgr.h"
> +#include "xe_guc_klv_helpers.h"
> +#include "xe_guc_submit.h"
> +#include "xe_lmtt.h"
> +#include "xe_map.h"
> +#include "xe_sriov.h"
> +#include "xe_ttm_vram_mgr.h"
> +#include "xe_wopcm.h"
> +
> +/*
> + * Return: number of KLVs that were successfully parsed and saved,
> + *         negative error code on failure.
> + */
> +static int guc_action_update_vf_cfg(struct xe_guc *guc, u32 vfid,
> +				    u64 addr, u32 size)
> +{
> +	u32 request[] = {
> +		GUC_ACTION_PF2GUC_UPDATE_VF_CFG,
> +		vfid,
> +		lower_32_bits(addr),
> +		upper_32_bits(addr),
> +		size,
> +	};
> +
> +	return xe_guc_ct_send_block(&guc->ct, request, ARRAY_SIZE(request));
> +}
> +
> +/*
> + * Return: 0 on success, negative error code on failure.
> + */
> +static int pf_send_vf_cfg_reset(struct xe_gt *gt, u32 vfid)
> +{
> +	struct xe_guc *guc = &gt->uc.guc;
> +	int ret;
> +
> +	ret = guc_action_update_vf_cfg(guc, vfid, 0, 0);
> +
> +	return ret <= 0 ? ret : -EPROTO;
> +}
> +
> +/*
> + * Return: number of KLVs that were successfully parsed and saved,
> + *         negative error code on failure.
> + */
> +static int pf_send_vf_cfg_klvs(struct xe_gt *gt, u32 vfid, const u32 *klvs, u32 num_dwords)
> +{
> +	const u32 bytes = num_dwords * sizeof(u32);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_guc *guc = &gt->uc.guc;
> +	struct xe_bo *bo;
> +	int ret;
> +
> +	bo = xe_bo_create_pin_map(xe, tile, NULL,
> +				  ALIGN(bytes, PAGE_SIZE),
> +				  ttm_bo_type_kernel,
> +				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +				  XE_BO_FLAG_GGTT |
> +				  XE_BO_FLAG_GGTT_INVALIDATE);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	xe_map_memcpy_to(xe, &bo->vmap, 0, klvs, bytes);
> +
> +	ret = guc_action_update_vf_cfg(guc, vfid, xe_bo_ggtt_addr(bo), num_dwords);
> +
> +	xe_bo_unpin_map_no_vm(bo);
> +
> +	return ret;
> +}
> +
> +/*
> + * Return: 0 on success, -ENOKEY if some KLVs were not updated, -EPROTO if reply was malformed,
> + *         negative error code on failure.
> + */
> +static int pf_push_vf_cfg_klvs(struct xe_gt *gt, unsigned int vfid, u32 num_klvs,
> +			       const u32 *klvs, u32 num_dwords)
> +{
> +	int ret;
> +
> +	xe_gt_assert(gt, num_klvs == xe_guc_klv_count(klvs, num_dwords));
> +
> +	ret = pf_send_vf_cfg_klvs(gt, vfid, klvs, num_dwords);
> +
> +	if (ret != num_klvs) {
> +		int err = ret < 0 ? ret : ret < num_klvs ? -ENOKEY : -EPROTO;
> +		struct drm_printer p = xe_gt_info_printer(gt);
> +		char name[8];
> +
> +		xe_gt_sriov_notice(gt, "Failed to push %s %u config KLV%s (%pe)\n",
> +				   xe_sriov_function_name(vfid, name, sizeof(name)),
> +				   num_klvs, str_plural(num_klvs), ERR_PTR(err));
> +		xe_guc_klv_print(klvs, num_dwords, &p);
> +		return err;
> +	}
> +
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
> +		struct drm_printer p = xe_gt_info_printer(gt);
> +
> +		xe_guc_klv_print(klvs, num_dwords, &p);
> +	}
> +
> +	return 0;
> +}
> +
> +static int pf_push_vf_cfg_u32(struct xe_gt *gt, unsigned int vfid, u16 key, u32 value)
> +{
> +	u32 klv[] = {
> +		FIELD_PREP(GUC_KLV_0_KEY, key) | FIELD_PREP(GUC_KLV_0_LEN, 1),
> +		value,
> +	};
> +
> +	return pf_push_vf_cfg_klvs(gt, vfid, 1, klv, ARRAY_SIZE(klv));
> +}
> +
> +static int pf_push_vf_cfg_u64(struct xe_gt *gt, unsigned int vfid, u16 key, u64 value)
> +{
> +	u32 klv[] = {
> +		FIELD_PREP(GUC_KLV_0_KEY, key) | FIELD_PREP(GUC_KLV_0_LEN, 2),
> +		lower_32_bits(value),
> +		upper_32_bits(value),
> +	};
> +
> +	return pf_push_vf_cfg_klvs(gt, vfid, 1, klv, ARRAY_SIZE(klv));
> +}
> +
> +static int pf_push_vf_cfg_ggtt(struct xe_gt *gt, unsigned int vfid, u64 start, u64 size)
> +{
> +	u32 klvs[] = {
> +		PREP_GUC_KLV_TAG(VF_CFG_GGTT_START),
> +		lower_32_bits(start),
> +		upper_32_bits(start),
> +		PREP_GUC_KLV_TAG(VF_CFG_GGTT_SIZE),
> +		lower_32_bits(size),
> +		upper_32_bits(size),
> +	};
> +
> +	return pf_push_vf_cfg_klvs(gt, vfid, 2, klvs, ARRAY_SIZE(klvs));
> +}
> +
> +static int pf_push_vf_cfg_ctxs(struct xe_gt *gt, unsigned int vfid, u32 begin, u32 num)
> +{
> +	u32 klvs[] = {
> +		PREP_GUC_KLV_TAG(VF_CFG_BEGIN_CONTEXT_ID),
> +		begin,
> +		PREP_GUC_KLV_TAG(VF_CFG_NUM_CONTEXTS),
> +		num,
> +	};
> +
> +	return pf_push_vf_cfg_klvs(gt, vfid, 2, klvs, ARRAY_SIZE(klvs));
> +}
> +
> +static int pf_push_vf_cfg_dbs(struct xe_gt *gt, unsigned int vfid, u32 begin, u32 num)
> +{
> +	u32 klvs[] = {
> +		PREP_GUC_KLV_TAG(VF_CFG_BEGIN_DOORBELL_ID),
> +		begin,
> +		PREP_GUC_KLV_TAG(VF_CFG_NUM_DOORBELLS),
> +		num,
> +	};
> +
> +	return pf_push_vf_cfg_klvs(gt, vfid, 2, klvs, ARRAY_SIZE(klvs));
> +}
> +
> +static int pf_push_vf_cfg_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 exec_quantum)
> +{
> +	return pf_push_vf_cfg_u32(gt, vfid, GUC_KLV_VF_CFG_EXEC_QUANTUM_KEY, exec_quantum);
> +}
> +
> +static int pf_push_vf_cfg_preempt_timeout(struct xe_gt *gt, unsigned int vfid, u32 preempt_timeout)
> +{
> +	return pf_push_vf_cfg_u32(gt, vfid, GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY, preempt_timeout);
> +}
> +
> +static int pf_push_vf_cfg_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
> +{
> +	return pf_push_vf_cfg_u64(gt, vfid, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, size);
> +}
> +
> +static struct xe_gt_sriov_config *pf_pick_vf_config(struct xe_gt *gt, unsigned int vfid)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return &gt->sriov.pf.vfs[vfid].config;
> +}
> +
> +/* Return: number of configuration dwords written */
> +static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config)
> +{
> +	u32 n = 0;
> +
> +	if (drm_mm_node_allocated(&config->ggtt_region)) {
> +		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_START);
> +		cfg[n++] = lower_32_bits(config->ggtt_region.start);
> +		cfg[n++] = upper_32_bits(config->ggtt_region.start);
> +
> +		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_SIZE);
> +		cfg[n++] = lower_32_bits(config->ggtt_region.size);
> +		cfg[n++] = upper_32_bits(config->ggtt_region.size);
> +	}
> +
> +	return n;
> +}
> +
> +/* Return: number of configuration dwords written */
> +static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config)
> +{
> +	u32 n = 0;
> +
> +	n += encode_config_ggtt(cfg, config);
> +
> +	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_BEGIN_CONTEXT_ID);
> +	cfg[n++] = config->begin_ctx;
> +
> +	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_NUM_CONTEXTS);
> +	cfg[n++] = config->num_ctxs;
> +
> +	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_BEGIN_DOORBELL_ID);
> +	cfg[n++] = config->begin_db;
> +
> +	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_NUM_DOORBELLS);
> +	cfg[n++] = config->num_dbs;
> +
> +	if (config->lmem_obj) {
> +		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_LMEM_SIZE);
> +		cfg[n++] = lower_32_bits(config->lmem_obj->size);
> +		cfg[n++] = upper_32_bits(config->lmem_obj->size);
> +	}
> +
> +	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_EXEC_QUANTUM);
> +	cfg[n++] = config->exec_quantum;
> +
> +	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
> +	cfg[n++] = config->preempt_timeout;
> +
> +	return n;
> +}
> +
> +static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +	u32 max_cfg_dwords = SZ_4K / sizeof(u32);
> +	u32 num_dwords;
> +	int num_klvs;
> +	u32 *cfg;
> +	int err;
> +
> +	cfg = kcalloc(max_cfg_dwords, sizeof(u32), GFP_KERNEL);
> +	if (!cfg)
> +		return -ENOMEM;
> +
> +	num_dwords = encode_config(cfg, config);
> +	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
> +

NIT: I would add some commentary as to why in the case of media GT we do GGTT provisioning
with values from primary GT.
At first glance, it looks like we are adding KLV twice for GGTT - at least I caught myself
doing that.

> +	if (xe_gt_is_media_type(gt)) {
> +		struct xe_gt *primary = gt->tile->primary_gt;
> +		struct xe_gt_sriov_config *other = &primary->sriov.pf.vfs[vfid].config;
> +
> +		num_dwords += encode_config_ggtt(cfg + num_dwords, other);
> +	}
> +	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
> +
> +	num_klvs = xe_guc_klv_count(cfg, num_dwords);
> +	err = pf_push_vf_cfg_klvs(gt, vfid, num_klvs, cfg, num_dwords);
> +
> +	kfree(cfg);
> +	return err;
> +}
> +
> +static u64 pf_get_ggtt_alignment(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	return IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
> +}
> +
> +static u64 pf_get_min_spare_ggtt(struct xe_gt *gt)
> +{
> +	/* XXX: preliminary */
> +	return IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ?
> +		pf_get_ggtt_alignment(gt) : SZ_64M;
> +}
> +
> +static u64 pf_get_spare_ggtt(struct xe_gt *gt)
> +{
> +	u64 spare;
> +
> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	spare = gt->sriov.pf.spare.ggtt_size;
> +	spare = max_t(u64, spare, pf_get_min_spare_ggtt(gt));
> +
> +	return spare;
> +}
> +
> +static int pf_set_spare_ggtt(struct xe_gt *gt, u64 size)
> +{
> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	if (size && size < pf_get_min_spare_ggtt(gt))
> +		return -EINVAL;
> +
> +	size = round_up(size, pf_get_ggtt_alignment(gt));
> +	gt->sriov.pf.spare.ggtt_size = size;
> +
> +	return 0;
> +}
> +
> +static int pf_distribute_config_ggtt(struct xe_tile *tile, unsigned int vfid, u64 start, u64 size)
> +{
> +	int err, err2 = 0;
> +
> +	err = pf_push_vf_cfg_ggtt(tile->primary_gt, vfid, start, size);
> +
> +	if (tile->media_gt && !err)
> +		err2 = pf_push_vf_cfg_ggtt(tile->media_gt, vfid, start, size);
> +
> +	return err ?: err2;
> +}
> +
> +static void pf_release_ggtt(struct xe_tile *tile, struct drm_mm_node *node)
> +{
> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
> +
> +	if (drm_mm_node_allocated(node)) {
> +		/*
> +		 * explicit GGTT PTE assignment to the PF using xe_ggtt_assign()
> +		 * is redundant, as PTE will be implicitly re-assigned to PF by
> +		 * the xe_ggtt_clear() called by below xe_ggtt_remove_node().
> +		 */
> +		xe_ggtt_remove_node(ggtt, node, false);
> +	}
> +}
> +
> +static void pf_release_vf_config_ggtt(struct xe_gt *gt, struct xe_gt_sriov_config *config)
> +{
> +	pf_release_ggtt(gt_to_tile(gt), &config->ggtt_region);
> +}
> +
> +static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +	struct drm_mm_node *node = &config->ggtt_region;
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
> +	u64 alignment = pf_get_ggtt_alignment(gt);
> +	int err;
> +
> +	xe_gt_assert(gt, vfid);
> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	size = round_up(size, alignment);
> +
> +	if (drm_mm_node_allocated(node)) {
> +		err = pf_distribute_config_ggtt(tile, vfid, 0, 0);
> +		if (unlikely(err))
> +			return err;
> +
> +		pf_release_ggtt(tile, node);
> +	}
> +	xe_gt_assert(gt, !drm_mm_node_allocated(node));
> +
> +	if (!size)
> +		return 0;
> +
> +	err = xe_ggtt_insert_special_node(ggtt, node, size, alignment);
> +	if (unlikely(err))
> +		return err;
> +
> +	xe_ggtt_assign(ggtt, node, vfid);
> +	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
> +				vfid, node->start, node->start + node->size - 1);
> +
> +	err = pf_distribute_config_ggtt(gt->tile, vfid, node->start, node->size);
> +	if (unlikely(err))
> +		return err;
> +
> +	return 0;
> +}
> +
> +static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +	struct drm_mm_node *node = &config->ggtt_region;
> +
> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +	return drm_mm_node_allocated(node) ? node->size : 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_get_ggtt - Query size of GGTT address space of the VF.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function can only be called on PF.
> + *
> + * Return: size of the VF's assigned (or PF's spare) GGTT address space.
> + */
> +u64 xe_gt_sriov_pf_config_get_ggtt(struct xe_gt *gt, unsigned int vfid)
> +{
> +	u64 size;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	if (vfid)
> +		size = pf_get_vf_config_ggtt(gt_to_tile(gt)->primary_gt, vfid);
> +	else
> +		size = pf_get_spare_ggtt(gt_to_tile(gt)->primary_gt);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return size;
> +}
> +
> +static int pf_config_set_u64_done(struct xe_gt *gt, unsigned int vfid, u64 value,
> +				  u64 actual, const char *what, int err)
> +{
> +	char size[10];
> +	char name[8];
> +
> +	xe_sriov_function_name(vfid, name, sizeof(name));
> +
> +	if (unlikely(err)) {
> +		string_get_size(value, 1, STRING_UNITS_2, size, sizeof(size));
> +		xe_gt_sriov_notice(gt, "Failed to provision %s with %llu (%s) %s (%pe)\n",
> +				   name, value, size, what, ERR_PTR(err));
> +		string_get_size(actual, 1, STRING_UNITS_2, size, sizeof(size));
> +		xe_gt_sriov_info(gt, "%s provisioning remains at %llu (%s) %s\n",
> +				 name, actual, size, what);
> +		return err;
> +	}
> +
> +	/* the actual value may have changed during provisioning */
> +	string_get_size(actual, 1, STRING_UNITS_2, size, sizeof(size));
> +	xe_gt_sriov_info(gt, "%s provisioned with %llu (%s) %s\n",
> +			 name, actual, size, what);
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_set_ggtt - Provision VF with GGTT space.
> + * @gt: the &xe_gt (can't be media)
> + * @vfid: the VF identifier
> + * @size: requested GGTT size
> + *
> + * If &vfid represents PF, then function will change PF's spare GGTT config.
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
> +{
> +	int err;
> +
> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	if (vfid)
> +		err = pf_provision_vf_ggtt(gt, vfid, size);
> +	else
> +		err = pf_set_spare_ggtt(gt, size);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_config_set_u64_done(gt, vfid, size,
> +				      xe_gt_sriov_pf_config_get_ggtt(gt, vfid),
> +				      vfid ? "GGTT" : "spare GGTT", err);
> +}
> +
> +static int pf_config_bulk_set_u64_done(struct xe_gt *gt, unsigned int first, unsigned int num_vfs,
> +				       u64 value, u64 (*get)(struct xe_gt*, unsigned int),
> +				       const char *what, unsigned int last, int err)
> +{
> +	char size[10];
> +
> +	xe_gt_assert(gt, first);
> +	xe_gt_assert(gt, num_vfs);
> +	xe_gt_assert(gt, first <= last);
> +
> +	if (num_vfs == 1)
> +		return pf_config_set_u64_done(gt, first, value, get(gt, first), what, err);
> +
> +	if (unlikely(err)) {
> +		xe_gt_sriov_notice(gt, "Failed to bulk provision VF%u..VF%u with %s\n",
> +				   first, first + num_vfs - 1, what);
> +		if (last > first)
> +			pf_config_bulk_set_u64_done(gt, first, last - first, value,
> +						    get, what, last, 0);
> +		return pf_config_set_u64_done(gt, last, value, get(gt, last), what, err);
> +	}
> +
> +	/* pick actual value from first VF - bulk provisioning shall be equal across all VFs */
> +	value = get(gt, first);
> +	string_get_size(value, 1, STRING_UNITS_2, size, sizeof(size));
> +	xe_gt_sriov_info(gt, "VF%u..VF%u provisioned with %llu (%s) %s\n",
> +			 first, first + num_vfs - 1, value, size, what);
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_bulk_set_ggtt - Provision many VFs with GGTT.
> + * @gt: the &xe_gt (can't be media)
> + * @vfid: starting VF identifier (can't be 0)
> + * @num_vfs: number of VFs to provision
> + * @size: requested GGTT size
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_bulk_set_ggtt(struct xe_gt *gt, unsigned int vfid,
> +					unsigned int num_vfs, u64 size)
> +{
> +	unsigned int n;
> +	int err = 0;
> +
> +	xe_gt_assert(gt, vfid);
> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +

NIT: Maybe you should add an assert here to check if vfid + num_vfs <= total_vfs

> +	if (!num_vfs)
> +		return 0;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	for (n = vfid; n < vfid + num_vfs; n++) {
> +		err = pf_provision_vf_ggtt(gt, n, size);
> +		if (err)
> +			break;
> +	}
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_config_bulk_set_u64_done(gt, vfid, num_vfs, size,
> +					   xe_gt_sriov_pf_config_get_ggtt,
> +					   "GGTT", n, err);
> +}
> +
> +/* Return: size of the largest continuous GGTT region */
> +static u64 pf_get_max_ggtt(struct xe_gt *gt)
> +{
> +	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
> +	const struct drm_mm *mm = &ggtt->mm;
> +	const struct drm_mm_node *entry;
> +	u64 alignment = pf_get_ggtt_alignment(gt);
> +	u64 spare = pf_get_spare_ggtt(gt);
> +	u64 hole_min_start = xe_wopcm_size(gt_to_xe(gt));
> +	u64 hole_start, hole_end, hole_size;
> +	u64 max_hole = 0;
> +
> +	mutex_lock(&ggtt->lock);
> +
> +	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
> +		hole_start = max(hole_start, hole_min_start);
> +		hole_start = ALIGN(hole_start, alignment);
> +		hole_end = ALIGN_DOWN(hole_end, alignment);
> +		if (hole_start >= hole_end)
> +			continue;
> +		hole_size = hole_end - hole_start;
> +		xe_gt_sriov_dbg_verbose(gt, "HOLE start %llx size %lluK\n",
> +					hole_start, hole_size / SZ_1K);
> +		spare -= min3(spare, hole_size, max_hole);
> +		max_hole = max(max_hole, hole_size);
> +	}
> +
> +	mutex_unlock(&ggtt->lock);
> +
> +	xe_gt_sriov_dbg_verbose(gt, "HOLE max %lluK reserved %lluK\n",
> +				max_hole / SZ_1K, spare / SZ_1K);
> +	return max_hole > spare ? max_hole - spare : 0;
> +}
> +
> +static u64 pf_estimate_fair_ggtt(struct xe_gt *gt, unsigned int num_vfs)
> +{
> +	u64 available = pf_get_max_ggtt(gt);
> +	u64 alignment = pf_get_ggtt_alignment(gt);
> +	u64 fair;
> +
> +	fair = div_u64(available, num_vfs);
> +	fair = ALIGN_DOWN(fair, alignment);
> +	xe_gt_sriov_dbg_verbose(gt, "GGTT available(%lluK) fair(%u x %lluK)\n",
> +				available / SZ_1K, num_vfs, fair / SZ_1K);
> +	return fair;
> +}
NIT: This is not the most optimal solution in any case.
Perhaps it is worth noting here in the comment that it is a conscious decision

> +
> +/**
> + * xe_gt_sriov_pf_config_set_fair_ggtt - Provision many VFs with fair GGTT.
> + * @gt: the &xe_gt (can't be media)
> + * @vfid: starting VF identifier (can't be 0)
> + * @num_vfs: number of VFs to provision
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt,
> +					unsigned int vfid, unsigned int num_vfs)

NIT: In my opinion strangely divided into a new line these parameters


> +{
> +	u64 fair;
> +
> +	xe_gt_assert(gt, vfid);
> +	xe_gt_assert(gt, num_vfs);
> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	fair = pf_estimate_fair_ggtt(gt, num_vfs);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	if (!fair)
> +		return -ENOSPC;
> +
> +	return xe_gt_sriov_pf_config_bulk_set_ggtt(gt, vfid, num_vfs, fair);
> +}
> +
> +static u32 pf_get_min_spare_ctxs(struct xe_gt *gt)
> +{
> +	/* XXX: preliminary */
> +	return IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ?
> +		hweight64(gt->info.engine_mask) : SZ_256;
> +}
> +
> +static u32 pf_get_spare_ctxs(struct xe_gt *gt)
> +{
> +	u32 spare;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	spare = gt->sriov.pf.spare.num_ctxs;
> +	spare = max_t(u32, spare, pf_get_min_spare_ctxs(gt));
> +
> +	return spare;
> +}
> +
> +static int pf_set_spare_ctxs(struct xe_gt *gt, u32 spare)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	if (spare > GUC_ID_MAX)
> +		return -EINVAL;
> +
> +	if (spare && spare < pf_get_min_spare_ctxs(gt))
> +		return -EINVAL;
> +
> +	gt->sriov.pf.spare.num_ctxs = spare;
> +
> +	return 0;
> +}
> +
> +/* Return: start ID or negative error code on failure */
> +static int pf_reserve_ctxs(struct xe_gt *gt, u32 num)
> +{
> +	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
> +	unsigned int spare = pf_get_spare_ctxs(gt);
> +
> +	return xe_guc_id_mgr_reserve(idm, num, spare);
> +}
> +
> +static void pf_release_ctxs(struct xe_gt *gt, u32 start, u32 num)
> +{
> +	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
> +
> +	if (num)
> +		xe_guc_id_mgr_release(idm, start, num);
> +}
> +
> +static void pf_release_config_ctxs(struct xe_gt *gt, struct xe_gt_sriov_config *config)
> +{
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	pf_release_ctxs(gt, config->begin_ctx, config->num_ctxs);
> +	config->begin_ctx = 0;
> +	config->num_ctxs = 0;
> +}
> +
> +static int pf_provision_vf_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_ctxs)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +	int ret;
> +
> +	xe_gt_assert(gt, vfid);
> +
> +	if (num_ctxs > GUC_ID_MAX)
> +		return -EINVAL;
> +
> +	if (config->num_ctxs) {
> +		ret = pf_push_vf_cfg_ctxs(gt, vfid, 0, 0);
> +		if (unlikely(ret))
> +			return ret;
> +
> +		pf_release_config_ctxs(gt, config);
> +	}
> +
> +	if (!num_ctxs)
> +		return 0;
> +
> +	ret = pf_reserve_ctxs(gt, num_ctxs);
> +	if (unlikely(ret < 0))
> +		return ret;
> +
> +	config->begin_ctx = ret;
> +	config->num_ctxs = num_ctxs;
> +
> +	ret = pf_push_vf_cfg_ctxs(gt, vfid, config->begin_ctx, config->num_ctxs);
> +	if (unlikely(ret)) {
> +		pf_release_config_ctxs(gt, config);
> +		return ret;
> +	}
> +
> +	xe_gt_sriov_dbg_verbose(gt, "VF%u contexts %u-%u\n",
> +				vfid, config->begin_ctx, config->begin_ctx + config->num_ctxs - 1);
> +	return 0;
> +}
> +
> +static u32 pf_get_vf_config_ctxs(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +
> +	return config->num_ctxs;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_get_ctxs - Get VF's GuC contexts IDs quota.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function can only be called on PF.
> + * If &vfid represents a PF then number of PF's spare GuC context IDs is returned.
> + *
> + * Return: VF's quota (or PF's spare).
> + */
> +u32 xe_gt_sriov_pf_config_get_ctxs(struct xe_gt *gt, unsigned int vfid)
> +{
> +	u32 num_ctxs;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	if (vfid)
> +		num_ctxs = pf_get_vf_config_ctxs(gt, vfid);
> +	else
> +		num_ctxs = pf_get_spare_ctxs(gt);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return num_ctxs;
> +}
> +
> +static const char *no_unit(u32 unused)
> +{
> +	return "";
> +}
> +
> +static const char *spare_unit(u32 unused)
> +{
> +	return " spare";
> +}
> +
> +static int pf_config_set_u32_done(struct xe_gt *gt, unsigned int vfid, u32 value, u32 actual,
> +				  const char *what, const char *(*unit)(u32), int err)
> +{
> +	char name[8];
> +
> +	xe_sriov_function_name(vfid, name, sizeof(name));
> +
> +	if (unlikely(err)) {
> +		xe_gt_sriov_notice(gt, "Failed to provision %s with %u%s %s (%pe)\n",
> +				   name, value, unit(value), what, ERR_PTR(err));
> +		xe_gt_sriov_info(gt, "%s provisioning remains at %u%s %s\n",
> +				 name, actual, unit(actual), what);
> +		return err;
> +	}
> +
> +	/* the actual value may have changed during provisioning */
> +	xe_gt_sriov_info(gt, "%s provisioned with %u%s %s\n",
> +			 name, actual, unit(actual), what);
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_set_ctxs - Configure GuC contexts IDs quota for the VF.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @num_ctxs: requested number of GuC contexts IDs (0 to release)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_ctxs)
> +{
> +	int err;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	if (vfid)
> +		err = pf_provision_vf_ctxs(gt, vfid, num_ctxs);
> +	else
> +		err = pf_set_spare_ctxs(gt, num_ctxs);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_config_set_u32_done(gt, vfid, num_ctxs,
> +				      xe_gt_sriov_pf_config_get_ctxs(gt, vfid),
> +				      "GuC context IDs", vfid ? no_unit : spare_unit, err);
> +}
> +
> +static int pf_config_bulk_set_u32_done(struct xe_gt *gt, unsigned int first, unsigned int num_vfs,
> +				       u32 value, u32 (*get)(struct xe_gt*, unsigned int),
> +				       const char *what, const char *(*unit)(u32),
> +				       unsigned int last, int err)
> +{
> +	xe_gt_assert(gt, first);
> +	xe_gt_assert(gt, num_vfs);
> +	xe_gt_assert(gt, first <= last);
> +
> +	if (num_vfs == 1)
> +		return pf_config_set_u32_done(gt, first, value, get(gt, first), what, unit, err);
> +
> +	if (unlikely(err)) {
> +		xe_gt_sriov_notice(gt, "Failed to bulk provision VF%u..VF%u with %s\n",
> +				   first, first + num_vfs - 1, what);
> +		if (last > first)
> +			pf_config_bulk_set_u32_done(gt, first, last - first, value,
> +						    get, what, unit, last, 0);
> +		return pf_config_set_u32_done(gt, last, value, get(gt, last), what, unit, err);
> +	}
> +
> +	/* pick actual value from first VF - bulk provisioning shall be equal across all VFs */
> +	value = get(gt, first);
> +	xe_gt_sriov_info(gt, "VF%u..VF%u provisioned with %u%s %s\n",
> +			 first, first + num_vfs - 1, value, unit(value), what);
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_bulk_set_ctxs - Provision many VFs with GuC context IDs.
> + * @gt: the &xe_gt
> + * @vfid: starting VF identifier
> + * @num_vfs: number of VFs to provision
> + * @num_ctxs: requested number of GuC contexts IDs (0 to release)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_gt *gt, unsigned int vfid,
> +					unsigned int num_vfs, u32 num_ctxs)
> +{
> +	unsigned int n;
> +	int err = 0;
> +
> +	xe_gt_assert(gt, vfid);
> +
> +	if (!num_vfs)
> +		return 0;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	for (n = vfid; n < vfid + num_vfs; n++) {
> +		err = pf_provision_vf_ctxs(gt, n, num_ctxs);
> +		if (err)
> +			break;
> +	}
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_config_bulk_set_u32_done(gt, vfid, num_vfs, num_ctxs,
> +					   xe_gt_sriov_pf_config_get_ctxs,
> +					   "GuC context IDs", no_unit, n, err);
> +}
> +
> +static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
> +{
> +	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
> +	u32 spare = pf_get_spare_ctxs(gt);
> +	u32 fair = (idm->total - spare) / num_vfs;
> +	int ret;
> +
> +	for (; fair; --fair) {
> +		ret = xe_guc_id_mgr_reserve(idm, fair * num_vfs, spare);
> +		if (ret < 0)
> +			continue;
> +		xe_guc_id_mgr_release(idm, ret, fair * num_vfs);
> +		break;
> +	}
> +
> +	xe_gt_sriov_dbg_verbose(gt, "contexts fair(%u x %u)\n", num_vfs, fair);
> +	return fair;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_set_fair_ctxs - Provision many VFs with fair GuC context IDs.
> + * @gt: the &xe_gt
> + * @vfid: starting VF identifier (can't be 0)
> + * @num_vfs: number of VFs to provision (can't be 0)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_fair_ctxs(struct xe_gt *gt,
> +					unsigned int vfid, unsigned int num_vfs)
> +{
> +	u32 fair;
> +
> +	xe_gt_assert(gt, vfid);
> +	xe_gt_assert(gt, num_vfs);
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	fair = pf_estimate_fair_ctxs(gt, num_vfs);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	if (!fair)
> +		return -ENOSPC;
> +
> +	return xe_gt_sriov_pf_config_bulk_set_ctxs(gt, vfid, num_vfs, fair);
> +}
> +
> +static u32 pf_get_min_spare_dbs(struct xe_gt *gt)
> +{
> +	/* XXX: preliminary, we don't use doorbells yet! */
> +	return IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 1 : 0;
> +}
> +
> +static u32 pf_get_spare_dbs(struct xe_gt *gt)
> +{
> +	u32 spare;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	spare = gt->sriov.pf.spare.num_dbs;
> +	spare = max_t(u32, spare, pf_get_min_spare_dbs(gt));
> +
> +	return spare;
> +}
> +
> +static int pf_set_spare_dbs(struct xe_gt *gt, u32 spare)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	if (spare > GUC_NUM_DOORBELLS)
> +		return -EINVAL;
> +
> +	if (spare && spare < pf_get_min_spare_dbs(gt))
> +		return -EINVAL;
> +
> +	gt->sriov.pf.spare.num_dbs = spare;
> +	return 0;
> +}
> +
> +/* Return: start ID or negative error code on failure */
> +static int pf_reserve_dbs(struct xe_gt *gt, u32 num)
> +{
> +	struct xe_guc_db_mgr *dbm = &gt->uc.guc.dbm;
> +	unsigned int spare = pf_get_spare_dbs(gt);
> +
> +	return xe_guc_db_mgr_reserve_range(dbm, num, spare);
> +}
> +
> +static void pf_release_dbs(struct xe_gt *gt, u32 start, u32 num)
> +{
> +	struct xe_guc_db_mgr *dbm = &gt->uc.guc.dbm;
> +
> +	if (num)
> +		xe_guc_db_mgr_release_range(dbm, start, num);
> +}
> +
> +static void pf_release_config_dbs(struct xe_gt *gt, struct xe_gt_sriov_config *config)
> +{
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	pf_release_dbs(gt, config->begin_db, config->num_dbs);
> +	config->begin_db = 0;
> +	config->num_dbs = 0;
> +}
> +
> +static int pf_provision_vf_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_dbs)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +	int ret;
> +
> +	xe_gt_assert(gt, vfid);
> +
> +	if (num_dbs > GUC_NUM_DOORBELLS)
> +		return -EINVAL;
> +
> +	if (config->num_dbs) {
> +		ret = pf_push_vf_cfg_dbs(gt, vfid, 0, 0);
> +		if (unlikely(ret))
> +			return ret;
> +
> +		pf_release_config_dbs(gt, config);
> +	}
> +
> +	if (!num_dbs)
> +		return 0;
> +
> +	ret = pf_reserve_dbs(gt, num_dbs);
> +	if (unlikely(ret < 0))
> +		return ret;
> +
> +	config->begin_db = ret;
> +	config->num_dbs = num_dbs;
> +
> +	ret = pf_push_vf_cfg_dbs(gt, vfid, config->begin_db, config->num_dbs);
> +	if (unlikely(ret)) {
> +		pf_release_config_dbs(gt, config);
> +		return ret;
> +	}
> +
> +	xe_gt_sriov_dbg_verbose(gt, "VF%u doorbells %u-%u\n",
> +				vfid, config->begin_db, config->begin_db + config->num_dbs - 1);
> +	return 0;
> +}
> +
> +static u32 pf_get_vf_config_dbs(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +
> +	return config->num_dbs;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_get_dbs - Get VF's GuC doorbells IDs quota.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function can only be called on PF.
> + * If &vfid represents a PF then number of PF's spare GuC doorbells IDs is returned.
> + *
> + * Return: VF's quota (or PF's spare).
> + */
> +u32 xe_gt_sriov_pf_config_get_dbs(struct xe_gt *gt, unsigned int vfid)
> +{
> +	u32 num_dbs;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	if (vfid)
> +		num_dbs = pf_get_vf_config_dbs(gt, vfid);
> +	else
> +		num_dbs = pf_get_spare_dbs(gt);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return num_dbs;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_set_dbs - Configure GuC doorbells IDs quota for the VF.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @num_dbs: requested number of GuC doorbells IDs (0 to release)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_dbs)
> +{
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	if (vfid)
> +		err = pf_provision_vf_dbs(gt, vfid, num_dbs);
> +	else
> +		err = pf_set_spare_dbs(gt, num_dbs);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_config_set_u32_done(gt, vfid, num_dbs,
> +				      xe_gt_sriov_pf_config_get_dbs(gt, vfid),
> +				      "GuC doorbell IDs", vfid ? no_unit : spare_unit, err);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_bulk_set_dbs - Provision many VFs with GuC context IDs.
> + * @gt: the &xe_gt
> + * @vfid: starting VF identifier (can't be 0)
> + * @num_vfs: number of VFs to provision
> + * @num_dbs: requested number of GuC doorbell IDs (0 to release)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid,
> +				       unsigned int num_vfs, u32 num_dbs)
> +{
> +	unsigned int n;
> +	int err = 0;
> +
> +	xe_gt_assert(gt, vfid);
> +
> +	if (!num_vfs)
> +		return 0;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	for (n = vfid; n < vfid + num_vfs; n++) {
> +		err = pf_provision_vf_dbs(gt, n, num_dbs);
> +		if (err)
> +			break;
> +	}
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_config_bulk_set_u32_done(gt, vfid, num_vfs, num_dbs,
> +					   xe_gt_sriov_pf_config_get_dbs,
> +					   "GuC doorbell IDs", no_unit, n, err);
> +}
> +
> +static u32 pf_estimate_fair_dbs(struct xe_gt *gt, unsigned int num_vfs)
> +{
> +	struct xe_guc_db_mgr *dbm = &gt->uc.guc.dbm;
> +	u32 spare = pf_get_spare_dbs(gt);
> +	u32 fair = (GUC_NUM_DOORBELLS - spare) / num_vfs;
> +	int ret;
> +
> +	for (; fair; --fair) {
> +		ret = xe_guc_db_mgr_reserve_range(dbm, fair * num_vfs, spare);
> +		if (ret < 0)
> +			continue;
> +		xe_guc_db_mgr_release_range(dbm, ret, fair * num_vfs);
> +		break;
> +	}
> +
> +	xe_gt_sriov_dbg_verbose(gt, "doorbells fair(%u x %u)\n", num_vfs, fair);
> +	return fair;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_set_fair_dbs - Provision many VFs with fair GuC doorbell  IDs.
> + * @gt: the &xe_gt
> + * @vfid: starting VF identifier (can't be 0)
> + * @num_vfs: number of VFs to provision (can't be 0)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt,
> +				       unsigned int vfid, unsigned int num_vfs)
> +{
> +	u32 fair;
> +
> +	xe_gt_assert(gt, vfid);
> +	xe_gt_assert(gt, num_vfs);
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	fair = pf_estimate_fair_dbs(gt, num_vfs);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	if (!fair)
> +		return -ENOSPC;
> +
> +	return xe_gt_sriov_pf_config_bulk_set_dbs(gt, vfid, num_vfs, fair);
> +}
> +
> +static u64 pf_get_lmem_alignment(struct xe_gt *gt)
> +{
> +	/* this might be platform dependent */
> +	return SZ_2M;
> +}
> +
> +static u64 pf_get_min_spare_lmem(struct xe_gt *gt)
> +{
> +	/* this might be platform dependent */
> +	return SZ_128M; /* XXX: preliminary */
> +}
> +
> +static u64 pf_get_spare_lmem(struct xe_gt *gt)
> +{
> +	u64 spare;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	spare = gt->sriov.pf.spare.lmem_size;
> +	spare = max_t(u64, spare, pf_get_min_spare_lmem(gt));
> +
> +	return spare;
> +}
> +
> +static int pf_set_spare_lmem(struct xe_gt *gt, u64 size)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	if (size && size < pf_get_min_spare_lmem(gt))
> +		return -EINVAL;
> +
> +	gt->sriov.pf.spare.lmem_size = size;
> +	return 0;
> +}
> +
> +static u64 pf_get_vf_config_lmem(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +	struct xe_bo *bo;
> +
> +	bo = config->lmem_obj;
> +	return bo ? bo->size : 0;
> +}
> +
> +static int pf_distribute_config_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_tile *tile;
> +	unsigned int tid;
> +	int err;
> +
> +	for_each_tile(tile, xe, tid) {
> +		if (tile->primary_gt == gt) {
> +			err = pf_push_vf_cfg_lmem(gt, vfid, size);
> +		} else {
> +			u64 lmem = pf_get_vf_config_lmem(tile->primary_gt, vfid);
> +
> +			if (!lmem)
> +				continue;
> +			err = pf_push_vf_cfg_lmem(gt, vfid, lmem);
> +		}
> +		if (unlikely(err))
> +			return err;
> +	}
> +	return 0;
> +}
> +
> +static void pf_force_lmtt_invalidate(struct xe_device *xe)
> +{
> +	/* TODO */
> +}
> +
> +static void pf_reset_vf_lmtt(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_lmtt *lmtt;
> +	struct xe_tile *tile;
> +	unsigned int tid;
> +
> +	for_each_tile(tile, xe, tid) {
> +		lmtt = &tile->sriov.pf.lmtt;
> +		xe_lmtt_drop_pages(lmtt, vfid);
> +	}
> +}
> +
> +static int pf_update_vf_lmtt(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_config *config;
> +	struct xe_tile *tile;
> +	struct xe_lmtt *lmtt;
> +	struct xe_bo *bo;
> +	struct xe_gt *gt;
> +	u64 total, offset;
> +	unsigned int gtid;
> +	unsigned int tid;
> +	int err;
> +
> +	total = 0;
> +	for_each_tile(tile, xe, tid)
> +		total += pf_get_vf_config_lmem(tile->primary_gt, vfid);
> +
> +	for_each_tile(tile, xe, tid) {
> +		lmtt = &tile->sriov.pf.lmtt;
> +
> +		xe_lmtt_drop_pages(lmtt, vfid);
> +		if (!total)
> +			continue;
> +
> +		err  = xe_lmtt_prepare_pages(lmtt, vfid, total);
> +		if (err)
> +			goto fail;
> +
> +		offset = 0;
> +		for_each_gt(gt, xe, gtid) {
> +			if (xe_gt_is_media_type(gt))
> +				continue;
> +
> +			config = pf_pick_vf_config(gt, vfid);
> +			bo = config->lmem_obj;
> +			if (!bo)
> +				continue;
> +
> +			err = xe_lmtt_populate_pages(lmtt, vfid, bo, offset);
> +			if (err)
> +				goto fail;
> +			offset += bo->size;
> +		}
> +	}
> +
> +	pf_force_lmtt_invalidate(xe);
> +	return 0;
> +
> +fail:
> +	for_each_tile(tile, xe, tid) {
> +		lmtt = &tile->sriov.pf.lmtt;
> +		xe_lmtt_drop_pages(lmtt, vfid);
> +	}
> +	return err;
> +}
> +
> +static void pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_config *config)
> +{
> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	if (config->lmem_obj) {
> +		xe_bo_unpin_map_no_vm(config->lmem_obj);
> +		config->lmem_obj = NULL;
> +	}
> +}
> +
> +static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_bo *bo;
> +	int err;
> +
> +	xe_gt_assert(gt, vfid);
> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +
> +	size = round_up(size, pf_get_lmem_alignment(gt));
> +
> +	if (config->lmem_obj) {
> +		err = pf_distribute_config_lmem(gt, vfid, 0);
> +		if (unlikely(err))
> +			return err;
> +
> +		pf_reset_vf_lmtt(xe, vfid);
> +		pf_release_vf_config_lmem(gt, config);
> +	}
> +	xe_gt_assert(gt, !config->lmem_obj);
> +
> +	if (!size)
> +		return 0;
> +
> +	xe_gt_assert(gt, pf_get_lmem_alignment(gt) == SZ_2M);
> +	bo = xe_bo_create_pin_map(xe, tile, NULL,
> +				  ALIGN(size, PAGE_SIZE),
> +				  ttm_bo_type_kernel,
> +				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +				  XE_BO_FLAG_PINNED);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	config->lmem_obj = bo;
> +
> +	err = pf_update_vf_lmtt(xe, vfid);
> +	if (unlikely(err))
> +		goto release;
> +
> +	err = pf_push_vf_cfg_lmem(gt, vfid, bo->size);
> +	if (unlikely(err))
> +		goto reset_lmtt;
> +
> +	xe_gt_sriov_dbg_verbose(gt, "VF%u LMEM %zu (%zuM)\n",
> +				vfid, bo->size, bo->size / SZ_1M);
> +	return 0;
> +
> +reset_lmtt:
> +	pf_reset_vf_lmtt(xe, vfid);
> +release:
> +	pf_release_vf_config_lmem(gt, config);
> +	return err;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_get_lmem - Get VF's LMEM quota.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function can only be called on PF.
> + *
> + * Return: VF's (or PF's spare) LMEM quota.
> + */
> +u64 xe_gt_sriov_pf_config_get_lmem(struct xe_gt *gt, unsigned int vfid)
> +{
> +	u64 size;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	if (vfid)
> +		size = pf_get_vf_config_lmem(gt, vfid);
> +	else
> +		size = pf_get_spare_lmem(gt);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return size;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_set_lmem - Provision VF with LMEM.
> + * @gt: the &xe_gt (can't be media)
> + * @vfid: the VF identifier
> + * @size: requested LMEM size
> + *
> + * This function can only be called on PF.
> + */
> +int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
> +{
> +	int err;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	if (vfid)
> +		err = pf_provision_vf_lmem(gt, vfid, size);
> +	else
> +		err = pf_set_spare_lmem(gt, size);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_config_set_u64_done(gt, vfid, size,
> +				      xe_gt_sriov_pf_config_get_lmem(gt, vfid),
> +				      vfid ? "LMEM" : "spare LMEM", err);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_bulk_set_lmem - Provision many VFs with LMEM.
> + * @gt: the &xe_gt (can't be media)
> + * @vfid: starting VF identifier (can't be 0)
> + * @num_vfs: number of VFs to provision
> + * @size: requested LMEM size
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid,
> +					unsigned int num_vfs, u64 size)
> +{
> +	unsigned int n;
> +	int err = 0;
> +
> +	xe_gt_assert(gt, vfid);
> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +
> +	if (!num_vfs)
> +		return 0;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	for (n = vfid; n < vfid + num_vfs; n++) {
> +		err = pf_provision_vf_lmem(gt, n, size);
> +		if (err)
> +			break;
> +	}
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_config_bulk_set_u64_done(gt, vfid, num_vfs, size,
> +					   xe_gt_sriov_pf_config_get_lmem,
> +					   "LMEM", n, err);
> +}
> +
> +static u64 pf_query_free_lmem(struct xe_gt *gt)
> +{
> +	struct xe_tile *tile = gt->tile;
> +
> +	return xe_ttm_vram_get_avail(&tile->mem.vram_mgr->manager);
> +}
> +
> +static u64 pf_query_max_lmem(struct xe_gt *gt)
> +{
> +	u64 alignment = pf_get_lmem_alignment(gt);
> +	u64 spare = pf_get_spare_lmem(gt);
> +	u64 free = pf_query_free_lmem(gt);
> +	u64 avail;
> +
> +	/* XXX: need to account for 2MB blocks only */
> +	avail = free > spare ? free - spare : 0;
> +	avail = round_down(avail, alignment);
> +
> +	return avail;
> +}
> +
> +#ifdef CONFIG_DRM_XE_DEBUG_SRIOV
> +#define MAX_FAIR_LMEM	SZ_128M	/* XXX: make it small for the driver bringup */
> +#else
> +#define MAX_FAIR_LMEM	SZ_2G	/* XXX: known issue with allocating BO over 2GiB */
> +#endif
> +
> +static u64 pf_estimate_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
> +{
> +	u64 available = pf_query_max_lmem(gt);
> +	u64 alignment = pf_get_lmem_alignment(gt);
> +	u64 fair;
> +
> +	fair = div_u64(available, num_vfs);
> +	fair = ALIGN_DOWN(fair, alignment);
> +#ifdef MAX_FAIR_LMEM
> +	fair = min_t(u64, MAX_FAIR_LMEM, fair);
> +#endif
> +	xe_gt_sriov_dbg_verbose(gt, "LMEM available(%lluM) fair(%u x %lluM)\n",
> +				available / SZ_1M, num_vfs, fair / SZ_1M);
> +	return fair;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_set_fair_lmem - Provision many VFs with fair LMEM.
> + * @gt: the &xe_gt (can't be media)
> + * @vfid: starting VF identifier (can't be 0)
> + * @num_vfs: number of VFs to provision (can't be 0)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt,
> +					unsigned int vfid, unsigned int num_vfs)
> +{
> +	u64 fair;
> +
> +	xe_gt_assert(gt, vfid);
> +	xe_gt_assert(gt, num_vfs);
> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +
> +	if (!IS_DGFX(gt_to_xe(gt)))
> +		return 0;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	fair = pf_estimate_fair_lmem(gt, num_vfs);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	if (!fair)
> +		return -ENOSPC;
> +
> +	return xe_gt_sriov_pf_config_bulk_set_lmem(gt, vfid, num_vfs, fair);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_set_fair - Provision many VFs with fair resources.
> + * @gt: the &xe_gt
> + * @vfid: starting VF identifier (can't be 0)
> + * @num_vfs: number of VFs to provision (can't be 0)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs)
> +{
> +	int result = 0;
> +	int err;
> +
> +	xe_gt_assert(gt, vfid);
> +	xe_gt_assert(gt, num_vfs);
> +
> +	if (!xe_gt_is_media_type(gt)) {
> +		err = xe_gt_sriov_pf_config_set_fair_ggtt(gt, vfid, num_vfs);
> +		result = result ?: err;
> +		err = xe_gt_sriov_pf_config_set_fair_lmem(gt, vfid, num_vfs);
> +		result = result ?: err;
> +	}
> +	err = xe_gt_sriov_pf_config_set_fair_ctxs(gt, vfid, num_vfs);
> +	result = result ?: err;
> +	err = xe_gt_sriov_pf_config_set_fair_dbs(gt, vfid, num_vfs);
> +	result = result ?: err;
> +
> +	return result;
> +}
> +
> +static const char *exec_quantum_unit(u32 exec_quantum)
> +{
> +	return exec_quantum ? "ms" : "(inifinity)";

typo

> +}
> +
> +static int pf_provision_exec_quantum(struct xe_gt *gt, unsigned int vfid,
> +				     u32 exec_quantum)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +	int err;
> +
> +	err = pf_push_vf_cfg_exec_quantum(gt, vfid, exec_quantum);
> +	if (unlikely(err))
> +		return err;
> +
> +	config->exec_quantum = exec_quantum;
> +	return 0;
> +}
> +
> +static int pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +
> +	return config->exec_quantum;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_set_exec_quantum - Configure execution quantum for the VF.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @exec_quantum: requested execution quantum in milliseconds (0 is infinity)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid,
> +					   u32 exec_quantum)
> +{
> +	int err;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	err = pf_provision_exec_quantum(gt, vfid, exec_quantum);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_config_set_u32_done(gt, vfid, exec_quantum,
> +				      xe_gt_sriov_pf_config_get_exec_quantum(gt, vfid),
> +				      "execution quantum", exec_quantum_unit, err);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_get_exec_quantum - Get VF's execution quantum.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function can only be called on PF.
> + *
> + * Return: VF's (or PF's) execution quantum in milliseconds.
> + */
> +u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
> +{
> +	u32 exec_quantum;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	exec_quantum = pf_get_exec_quantum(gt, vfid);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return exec_quantum;
> +}
> +
> +static const char *preempt_timeout_unit(u32 preempt_timeout)
> +{
> +	return preempt_timeout ? "us" : "(inifinity)";

typo


> +}
> +
> +static int pf_provision_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
> +					u32 preempt_timeout)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +	int err;
> +
> +	err = pf_push_vf_cfg_preempt_timeout(gt, vfid, preempt_timeout);
> +	if (unlikely(err))
> +		return err;
> +
> +	config->preempt_timeout = preempt_timeout;
> +
> +	return 0;
> +}
> +
> +static int pf_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +
> +	return config->preempt_timeout;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_set_preempt_timeout - Configure preemption timeout for the VF.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @preempt_timeout: requested preemption timeout in microseconds (0 is infinity)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
> +					      u32 preempt_timeout)
> +{
> +	int err;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	err = pf_provision_preempt_timeout(gt, vfid, preempt_timeout);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return pf_config_set_u32_done(gt, vfid, preempt_timeout,
> +				      xe_gt_sriov_pf_config_get_preempt_timeout(gt, vfid),
> +				      "preemption timeout", preempt_timeout_unit, err);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_get_preempt_timeout - Get VF's preemption timeout.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function can only be called on PF.
> + *
> + * Return: VF's (or PF's) preemption timeout in microseconds.
> + */
> +u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
> +{
> +	u32 preempt_timeout;
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	preempt_timeout = pf_get_preempt_timeout(gt, vfid);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return preempt_timeout;
> +}
> +
> +static void pf_reset_config_sched(struct xe_gt *gt, struct xe_gt_sriov_config *config)
> +{
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	config->exec_quantum = 0;
> +	config->preempt_timeout = 0;
> +}
> +
> +static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> +
> +	if (!xe_gt_is_media_type(gt)) {
> +		pf_release_vf_config_ggtt(gt, config);
> +		pf_release_vf_config_lmem(gt, config);
> +	}
> +	pf_release_config_ctxs(gt, config);
> +	pf_release_config_dbs(gt, config);
> +	pf_reset_config_sched(gt, config);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_release - Release and reset VF configuration.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier (can't be PF)
> + * @force: force configuration release
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force)
> +{
> +	int err;
> +
> +	xe_gt_assert(gt, vfid);
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	err = pf_send_vf_cfg_reset(gt, vfid);
> +	if (!err || force)
> +		pf_release_vf_config(gt, vfid);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	if (unlikely(err)) {
> +		xe_gt_sriov_notice(gt, "VF%u unprovisioning failed with error (%pe)%s\n",
> +				   vfid, ERR_PTR(err),
> +				   force ? " but all resources were released anyway!" : "");
> +	}
> +
> +	return force ? 0 : err;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_push - Reprovision VF's configuration.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier (can't be PF)
> + * @refresh: explicit refresh
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_push(struct xe_gt *gt, unsigned int vfid, bool refresh)
> +{
> +	int err = 0;
> +
> +	xe_gt_assert(gt, vfid);
> +
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	if (refresh)
> +		err = pf_send_vf_cfg_reset(gt, vfid);
> +	if (!err)
> +		err = pf_push_full_vf_config(gt, vfid);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	if (unlikely(err)) {
> +		xe_gt_sriov_notice(gt, "Failed to %s VF%u configuration (%pe)\n",
> +				   refresh ? "refresh" : "push", vfid, ERR_PTR(err));
> +	}
> +
> +	return err;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_print_ggtt - Print GGTT configurations.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * Print GGTT configuration data for all VFs.
> + * VFs without provisioned GGTT are ignored.
> + *
> + * This function can only be called on PF.
> + */
> +int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(gt_to_xe(gt));
> +	const struct xe_gt_sriov_config *config;
> +	char buf[10];
> +
> +	for (n = 1; n <= total_vfs; n++) {
> +		config = &gt->sriov.pf.vfs[n].config;
> +		if (!drm_mm_node_allocated(&config->ggtt_region))
> +			continue;
> +
> +		string_get_size(config->ggtt_region.size, 1, STRING_UNITS_2, buf, sizeof(buf));
> +		drm_printf(p, "VF%u:\t%#0llx-%#llx\t(%s)\n",
> +			   n, config->ggtt_region.start,
> +			   config->ggtt_region.start + config->ggtt_region.size - 1, buf);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_print_ctxs - Print GuC context IDs configurations.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * Print GuC context ID allocations across all VFs.
> + * VFs without GuC context IDs are skipped.
> + *
> + * This function can only be called on PF.
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_print_ctxs(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(gt_to_xe(gt));
> +	const struct xe_gt_sriov_config *config;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	for (n = 1; n <= total_vfs; n++) {
> +		config = &gt->sriov.pf.vfs[n].config;
> +		if (!config->num_ctxs)
> +			continue;
> +
> +		drm_printf(p, "VF%u:\t%u-%u\t(%u)\n",
> +			   n,
> +			   config->begin_ctx,
> +			   config->begin_ctx + config->num_ctxs - 1,
> +			   config->num_ctxs);
> +	}
> +
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_print_dbs - Print GuC doorbell ID configurations.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * Print GuC doorbell IDs allocations across all VFs.
> + * VFs without GuC doorbell IDs are skipped.
> + *
> + * This function can only be called on PF.
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_print_dbs(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(gt_to_xe(gt));
> +	const struct xe_gt_sriov_config *config;
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	for (n = 1; n <= total_vfs; n++) {
> +		config = &gt->sriov.pf.vfs[n].config;
> +		if (!config->num_dbs)
> +			continue;
> +
> +		drm_printf(p, "VF%u:\t%u-%u\t(%u)\n",
> +			   n,
> +			   config->begin_db,
> +			   config->begin_db + config->num_dbs - 1,
> +			   config->num_dbs);
> +	}
> +
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_config_print_available_ggtt - Print available GGTT ranges.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * Print GGTT ranges that are available for the provisioning.
> + *
> + * This function can only be called on PF.
> + */
> +int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
> +	const struct drm_mm *mm = &ggtt->mm;
> +	const struct drm_mm_node *entry;
> +	u64 alignment = pf_get_ggtt_alignment(gt);
> +	u64 spare = pf_get_spare_ggtt(gt);
> +	u64 hole_min_start = xe_wopcm_size(gt_to_xe(gt));
> +	u64 hole_start, hole_end, hole_size;
> +	u64 avail, total = 0;
> +	char buf[10];
> +
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	mutex_lock(&ggtt->lock);
> +
> +	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
> +		hole_start = max(hole_start, hole_min_start);
> +		hole_start = ALIGN(hole_start, alignment);
> +		hole_end = ALIGN_DOWN(hole_end, alignment);
> +		if (hole_start >= hole_end)
> +			continue;
> +		hole_size = hole_end - hole_start;
> +		total += hole_size;
> +
> +		string_get_size(hole_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> +		drm_printf(p, "range:\t%#llx-%#llx\t(%s)\n",
> +			   hole_start, hole_end - 1, buf);
> +	}
> +
> +	mutex_unlock(&ggtt->lock);
> +
> +	string_get_size(total, 1, STRING_UNITS_2, buf, sizeof(buf));
> +	drm_printf(p, "total:\t%llu\t(%s)\n", total, buf);
> +
> +	string_get_size(spare, 1, STRING_UNITS_2, buf, sizeof(buf));
> +	drm_printf(p, "spare:\t%llu\t(%s)\n", spare, buf);
> +
> +	avail = total > spare ? total - spare : 0;
> +
> +	string_get_size(avail, 1, STRING_UNITS_2, buf, sizeof(buf));
> +	drm_printf(p, "avail:\t%llu\t(%s)\n", avail, buf);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> new file mode 100644
> index 000000000000..5e6b36f00b5b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_SRIOV_PF_CONFIG_H_
> +#define _XE_GT_SRIOV_PF_CONFIG_H_
> +
> +#include <linux/types.h>
> +
> +struct drm_printer;
> +struct xe_gt;
> +
> +u64 xe_gt_sriov_pf_config_get_ggtt(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_config_set_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size);
> +int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt,
> +					unsigned int vfid, unsigned int num_vfs);
> +int xe_gt_sriov_pf_config_bulk_set_ggtt(struct xe_gt *gt,
> +					unsigned int vfid, unsigned int num_vfs, u64 size);
> +
> +u32 xe_gt_sriov_pf_config_get_ctxs(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_config_set_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_ctxs);
> +int xe_gt_sriov_pf_config_set_fair_ctxs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
> +int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
> +					u32 num_ctxs);
> +
> +u32 xe_gt_sriov_pf_config_get_dbs(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_dbs);
> +int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
> +int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
> +				       u32 num_dbs);
> +
> +u64 xe_gt_sriov_pf_config_get_lmem(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size);
> +int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
> +int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
> +					u64 size);
> +
> +u32 xe_gt_sriov_pf_config_get_exec_quantum(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_config_set_exec_quantum(struct xe_gt *gt, unsigned int vfid, u32 exec_quantum);
> +
> +u32 xe_gt_sriov_pf_config_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_config_set_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
> +					      u32 preempt_timeout);
> +
> +int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
> +int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool force);
> +int xe_gt_sriov_pf_config_push(struct xe_gt *gt, unsigned int vfid, bool refresh);
> +
> +int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p);
> +int xe_gt_sriov_pf_config_print_ctxs(struct xe_gt *gt, struct drm_printer *p);
> +int xe_gt_sriov_pf_config_print_dbs(struct xe_gt *gt, struct drm_printer *p);
> +
> +int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_printer *p);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
> new file mode 100644
> index 000000000000..d3745c355957
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_SRIOV_PF_CONFIG_TYPES_H_
> +#define _XE_GT_SRIOV_PF_CONFIG_TYPES_H_
> +
> +#include <drm/drm_mm.h>
> +
> +struct xe_bo;
> +
> +/**
> + * struct xe_gt_sriov_config - GT level per-VF configuration data.
> + *
> + * Used by the PF driver to maintain per-VF provisioning data.
> + */
> +struct xe_gt_sriov_config {
> +	/** @ggtt_region: GGTT region assigned to the VF. */
> +	struct drm_mm_node ggtt_region;
> +	/** @lmem_obj: LMEM allocation for use by the VF. */
> +	struct xe_bo *lmem_obj;
> +	/** @num_ctxs: number of GuC contexts IDs.  */
> +	u16 num_ctxs;
> +	/** @begin_ctx: start index of GuC context ID range. */
> +	u16 begin_ctx;
> +	/** @num_dbs: number of GuC doorbells IDs. */
> +	u16 num_dbs;
> +	/** @begin_db: start index of GuC doorbell ID range. */
> +	u16 begin_db;
> +	/** @exec_quantum: execution-quantum in milliseconds. */
> +	u32 exec_quantum;
> +	/** @preempt_timeout: preemption timeout in microseconds. */
> +	u32 preempt_timeout;
> +};
> +
> +/**
> + * struct xe_gt_sriov_spare_config - GT-level PF spare configuration data.
> + *
> + * Used by the PF driver to maintain it's own reserved (spare) provisioning
> + * data that is not applicable to be tracked in struct xe_gt_sriov_config.
> + */
> +struct xe_gt_sriov_spare_config {
> +	/** @ggtt_size: GGTT size. */
> +	u64 ggtt_size;
> +	/** @lmem_size: LMEM size. */
> +	u64 lmem_size;
> +	/** @num_ctxs: number of GuC submission contexts. */
> +	u16 num_ctxs;
> +	/** @num_dbs: number of GuC doorbells. */
> +	u16 num_dbs;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> index 223f280ef748..faf9ee8266ce 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> @@ -8,22 +8,26 @@
>  
>  #include <linux/types.h>
>  
> +#include "xe_gt_sriov_pf_config_types.h"
>  #include "xe_gt_sriov_pf_policy_types.h"
>  
>  /**
>   * struct xe_gt_sriov_metadata - GT level per-VF metadata.
>   */
>  struct xe_gt_sriov_metadata {
> -	/* XXX: VF metadata will go here */
> +	/** @config: per-VF provisioning data. */
> +	struct xe_gt_sriov_config config;
>  };
>  
>  /**
>   * struct xe_gt_sriov_pf - GT level PF virtualization data.
>   * @policy: policy data.
> + * @spare: PF-only provisioning configuration.
>   * @vfs: metadata for all VFs.
>   */
>  struct xe_gt_sriov_pf {
>  	struct xe_gt_sriov_pf_policy policy;
> +	struct xe_gt_sriov_spare_config spare;
>  	struct xe_gt_sriov_metadata *vfs;
>  };

Several NITs, 2 typo (in the same word).
But the functionality seems to be ok.
After the necessary fixes (I mean mainly typo, but also pls consider my comments):

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>



>  
> -- 
> 2.43.0
> 

-- 
