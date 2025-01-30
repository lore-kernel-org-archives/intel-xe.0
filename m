Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EEEC0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 18:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82ADC88647;
	Thu, 30 Jan 2025 18:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JYBfIyYt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7242810E038
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 18:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738262257; x=1769798257;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9w7xcL5iCtUYKqJTg01MuHXUeWnAoyk1acxFJLGGjFg=;
 b=JYBfIyYtoPvIDoVHzEXKMsIMAp4eIiDi8DNIWgM8XZtCrQwnE59/dsRQ
 mHfZkDNFVfV9Wcij09L6eujGWNbuvG2VQdzCLD1KF+7q3AGupU/c0YuSp
 xW/nggrZXbUYp89q88RQ8vOP0/MjqHbsUNzhADZ+LwqOdG7qaBCir/mrP
 pRyzFFBrogomd92vq5C+VOQ1VJEkPEc+H5lYbpNXgPdQa9OkqKWb316PU
 pndxpmTYhYztKSVqlljhOcXKWWpMId5WU3oFClXa78kMAqo5vAegIOKvd
 WwnYw3u9y7vgKiFnfDxvVQocQFR4wWn8UAtMOU0TDBgR5bRH4B5AvLtwx g==;
X-CSE-ConnectionGUID: j52bHNx5Tyyw6NcAyNYnSQ==
X-CSE-MsgGUID: u60ESHHjTQSupzB1QQtdWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="61294854"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="61294854"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 10:37:35 -0800
X-CSE-ConnectionGUID: bHGQXv+tT1CTC68dNYdjaA==
X-CSE-MsgGUID: LrpGBUKmSW2wl2+nSiICJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="140300941"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 10:37:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 10:37:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 10:37:33 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 10:37:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQ0Axw5Edf4cYXeVeEswtqyToC2iy2Yj0XpXWxEVp1aj+Dl+pM5C8J3dZHbtzwSthVr7forrkoUol/aRVluyKIKBJr9Sx97z7knPOjcebzetz67rimIDDf8BOqbK508DNKh8ArfgFhxQH0KPo4Bo4C8UgTjS+kLSGfKyR7Ca6wNYSSFkvvLa9rbmm9wCoEt1E2QipdsanNDqVdvmQQNw4OLH6Gj6uJCe8Repe0d15lwJBQJUpIY5snvb5zTuTnvl3dizlIVDF+/rR3/nSeTVAmKK3kbkShGU1DAbcd67yauAgmTWOg/9V8uLT3CWuK7tyDysv/+5PnqTWyJOlkTTmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OygAkrGXCFkjh6PuWQyUBDOpAK728aWiAvefMgxN0i0=;
 b=Eg6ORsvKRBd7sGBdJymSyPpgcg9AsP2yE9iS04A+/OvJl3b+5eDvKxJwxNx7Isml5pdkIWqa5LCwGj2fb5NNleIuykQvjQph3RsXr0pQlpY6Ap9LZnYerrdKYYu3sjJ5btoGyYvczyIT3pBc1sEbKD0waHiEGD4y7cA3hgpVvy+s+UAI2UB0Cdx85y3jY1Uet3ITfxqaF5niRVL30shECbsv9zsJpbgtS82yqQZ2qF/JqRtp089YXsQpRMTeLTqNaZsBCR3SJ9TcOIlw0fbYCbrTcZLQYkqiQIr/HeYHJ3mcNtBbINtQvJt09PA3pnFVpsEbyZPC0VmkG65UcXC7Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB6899.namprd11.prod.outlook.com (2603:10b6:806:2a7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Thu, 30 Jan
 2025 18:37:31 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 18:37:30 +0000
Date: Thu, 30 Jan 2025 12:37:26 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Aradhya Bhatia <aradhya.bhatia@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, Intel XE List
 <intel-xe@lists.freedesktop.org>, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 2/2] drm/xe/oa: Refactor WAs to use XE_WA() macro
Message-ID: <wqzga7qmtodsazw3yrxewzfh25dqcl3sx7m7kfgxqf4hazdudn@jg4sk7eyvafd>
References: <20250130055939.282988-1-aradhya.bhatia@intel.com>
 <20250130055939.282988-3-aradhya.bhatia@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250130055939.282988-3-aradhya.bhatia@intel.com>
X-ClientProxiedBy: MW4P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::29) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: fe22f34b-83a0-49ea-865d-08dd415d276f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dx7CqA7PZe9AJdoZ5oED7VVPILmTFaLfTuEi6DMGYuVQcU3gikChCUtyU9+r?=
 =?us-ascii?Q?ZCljJzgNiMJ9U1WHpsEa1a3AzN0Cdre2V3RXoJl8o1scimguxYmLB+74Rndq?=
 =?us-ascii?Q?CghOxPFetyPksAm9/haRsFMw28MVJ2HlZ+l0tfNXmEfU1397ZUZfNpFC7K/Y?=
 =?us-ascii?Q?l7ZBn2JFc8wNGEPiYbfQhO54EW9TjOYAB1M2AQFeZlXq+qqQI7/DEAjaoGK2?=
 =?us-ascii?Q?2aDS83B5VBCDvdz5ozbUyaFU4GaWkrbSqO9g1bxpnLtvIj74xaHtK1RFFOQU?=
 =?us-ascii?Q?kDKEYjPTTq05X6Quh9i2bN4F8Az8aUa4UwyDjmwGJo0VPp8/26TsfQR4Lcvw?=
 =?us-ascii?Q?HhT/bkJdyG6db+of7d0VUGFGw79lwwx48MFGl4Yu2WSOGSSDS0ottqTpO5Nr?=
 =?us-ascii?Q?rHfD7w5lq7J+4wxlXSGtO45g9tJNh9xz6ylGfEOQJXOR70q/oOHeyzA06BRy?=
 =?us-ascii?Q?PvoFu7vkOkIsjlgbl9YIdO706dXTsPuyUhqhawlSFUnIgu6zvdjxt7iS/PsI?=
 =?us-ascii?Q?PYcFo7CiieHjSSFMoA1lWUr4J7vb3gYqNLwTIQwSfXBQiRAWlVyOc3INDe43?=
 =?us-ascii?Q?fkJyTAO0l2H51cxyYokFLLYaORGfBsoeVpCw8ZzcmEUBzyhPhDInAgWm4nxh?=
 =?us-ascii?Q?+ImyDwzJx5VxIPyHopoMaN+XiVWDfRGFSJzJ33w/Tmzc3DZOFeKyzlfdSKyK?=
 =?us-ascii?Q?M36CAjcyO+XQYI0okZYShf3VS1Yi8s8Rd3uBiC+IMbxdLDO5pzWrxKwaFnIL?=
 =?us-ascii?Q?Hk9JbWfNkbE8/qn+J3JcQ2jhTajzYWZ/9ofFCbQgKCck+VQESioDA0YGzAYC?=
 =?us-ascii?Q?C+O9mnMkPWWNlOGHdMiTQkMErokjZC6rrx8K8EP6HBAFL4hHSg234EXifcHm?=
 =?us-ascii?Q?VBNk0rHo8s8YujD3S8HohODrmchP8Jv7+iTgh7JK1l38xx9g+aB8umozHir5?=
 =?us-ascii?Q?2+fq8KaQV1z4EllSMoXqEIlAdc6TdC7sInFDRpf50Kkow1nrwoLcBx9aLMba?=
 =?us-ascii?Q?4imbyAkEjbMCc5lQ0H+Z9F13y9V1jRKy2u4dI3Fj/dtRD79slyFitLGs2Ujj?=
 =?us-ascii?Q?IaCrPF1FLyyWbdKX+OPo6y460gKbdqQINlVn13TsWzYW7KWwOQF6mYDlgszG?=
 =?us-ascii?Q?n87z2J07Hz8LN7HTiOA4TcMvMurqj7u3dxdRFDJQFKPiBuPG1g9s52/8Wo6G?=
 =?us-ascii?Q?blYOm/8xpB3zOneyljPQdvh7t0CtGI9kp7YKk94CZ4OUonu+FQ/wuQDEm43B?=
 =?us-ascii?Q?3HS3AIXe930F2osXc5FnInQK5T8yTzbhwUuzgpvEikTwC1EEUo4rTCtyw225?=
 =?us-ascii?Q?EsqvSeNCUAxKso2MLuMPmef+TE8r7ra2PGT+VMwtZikMNTjtF8YrEnkyGSvn?=
 =?us-ascii?Q?FkiIoeJHjBZsGhLX0yPo6zm2d3Jm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QvLQdBMo1ZcKV4Fif0KZO7tt9PvKbyVYMOxYIZQ2gKbxcl2e7anoppQO65uM?=
 =?us-ascii?Q?uclr981GQqe22DnBW+DyyFIX5Ygxb4yIc6FzA9rCh4rO3drhaPBsnR5kN7PM?=
 =?us-ascii?Q?2bLToLMvTSezVS9STNtBodMAcKIDVFG1BsMjFP0cMtgi+0Sg8SKdc41jTCsu?=
 =?us-ascii?Q?SnKCPXUiFFdfE7JHyGjOVXlWsVdKIIYic6pF5mP5SfLCAyyfshji2tLm8Fde?=
 =?us-ascii?Q?7ijsqbPcw8eeU/IJz50oL1WmDH7UO43Zyr0HCMlOBDIA5ld0Yh2c6KlhPyzf?=
 =?us-ascii?Q?R2786IpZEWUOlv4JJWi/oYwTmjs+229uiAF6ZL5ulkCZIA+c7FOeeDw22XHA?=
 =?us-ascii?Q?zF+Ioo+M6BrsUhlxrumRsbqmxE/+JexGNIcD5KxFbRgCs2CAfCA8sUNVbSRY?=
 =?us-ascii?Q?mpOTg31ZgrOnmIZfmn+wLGZeMlRhG45S7XWV27WwV9UH4r7bfQwakxy/Borj?=
 =?us-ascii?Q?OoYNhkvJrzTpe82jEBxsfn8TwxrNWb2XOwC75yQW9sot4dLnVQwq9p/BPDTv?=
 =?us-ascii?Q?G+rDrxkrV9wx1VzCqpKGE0v2eyxMFYjFvDNf6H44v28MaCQRTmPKg5ShYJAL?=
 =?us-ascii?Q?HsjNKSes5J7BRaKv2H52/o2l+W6sudWrOfTjh9ij7zfpfEOzSO7bDvLv75dF?=
 =?us-ascii?Q?XxeXuA/kPgQ7xWf9eXWkOkqdcUo6MsXMtDuivoKohXIs7DgE8KPao7WnBtly?=
 =?us-ascii?Q?fB2aKahfv3fYCIyRHG93SbTlW9SL6YJW8SNxk/me48u589DfxPe5gMDKd5SW?=
 =?us-ascii?Q?43IUoDrOSkS8/uUE/myswR9HRNN/n56RuXZyW7fPkG6OT+VfAlHWiJ+b73Lg?=
 =?us-ascii?Q?EsJnfhNri3TDZW1yG61tTtCP8VnIzKjfkN2dfGBgemDABBWe+Fs92CdZsWcr?=
 =?us-ascii?Q?MFFV+L87FhwoZ3w+ZTtBfAqd577ubpJ+LYE6N4UIzWjAJNj1pva8jHkR3z1L?=
 =?us-ascii?Q?FAKqu+ZmI3n09MdX4scKovoi8e1ha/LAP4BkxjyzCzYDBdn5+dpYDbKzwAXz?=
 =?us-ascii?Q?Agt1fEZStAFZlMDlMWGcObR6yhfyT2YZ9AeeIw+6eF7VnyUGp9SLsfS5DkfK?=
 =?us-ascii?Q?7ALXs0oML9AnxFhW8ZWULPpzZSCzAkVMGCiWqGjwlJf2xNG+7LvFy9A0qLjP?=
 =?us-ascii?Q?Dp2Q68vm13C0xuVj4IJVynxWVwKVYy6RQ0+8ohqXKDDE7wi9iMDgHr/C6nHb?=
 =?us-ascii?Q?AGfBQy6xuEnWwP6NSyDIUumPvSf8oPFuaHJNYaSIi81BbfaYTqM8mzO3MNC4?=
 =?us-ascii?Q?BMvljVFFSjwNSU/6pA9P/iqNCySbQn9bB5Og8Hf9kFcuHcFqT17zXE8vnhkf?=
 =?us-ascii?Q?TubmZZTe68Np/zKIulhgGV4imV5ctrBO26+EPhhfTayMxCPwekRWAoeJrAvU?=
 =?us-ascii?Q?2X8IkuyXl78XsmuASaOQY3z7EtjmbCb65AeZFgmLPC6v9LWeSngTh2k1OYf5?=
 =?us-ascii?Q?aboPrGWLqPoLbxQ/NUVyQHxTDiae4h2wZ73zyhDFjhr9ZvaACI1fh9DydoAa?=
 =?us-ascii?Q?OAX9GR/SdwPXMrZCrYz05NvmxgpYITRIGPTFY6ikJpZ/e8KAsF7FKg8r3ksd?=
 =?us-ascii?Q?3AZrm5QpIG4lXCTKkeCJ0FPOnBRAEsx9pk6gTWc/4IYj4byFIKUJm1cWVcpP?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe22f34b-83a0-49ea-865d-08dd415d276f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 18:37:30.9030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXDJX9SbBVP5R4KOYP0XR9lLVGe/9skKUtdGQi7UdUCIkW2WS09sihUxMaJNzHntbZttJWoYlI+nH59JGlT6b6v5v7+Axjdb1x/MMNRp+q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6899
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

On Thu, Jan 30, 2025 at 05:59:39AM +0000, Aradhya Bhatia wrote:
>Refactor Wa_18013179988, Wa_14015568240, Wa_1508761755, and
>Wa_1509372804, to use the proper workaround-check implementation for
>out-of-band workarounds, XE_WA(), and drop the use of the platform
>based WA selection.
>
>Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c         | 30 +++++++++---------------------
> drivers/gpu/drm/xe/xe_wa_oob.rules |  5 +++++
> 2 files changed, 14 insertions(+), 21 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index fa873f3d0a9d..5050bc7c7555 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -12,6 +12,8 @@
> #include <drm/drm_managed.h>
> #include <uapi/drm/xe_drm.h>
>
>+#include <generated/xe_wa_oob.h>
>+
> #include "abi/guc_actions_slpc_abi.h"
> #include "instructions/xe_mi_commands.h"
> #include "regs/xe_engine_regs.h"
>@@ -35,6 +37,7 @@
> #include "xe_sched_job.h"
> #include "xe_sriov.h"
> #include "xe_sync.h"
>+#include "xe_wa.h"
>
> #define DEFAULT_POLL_FREQUENCY_HZ 200
> #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
>@@ -811,11 +814,8 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
> 	struct xe_mmio *mmio = &stream->gt->mmio;
> 	u32 sqcnt1;
>
>-	/*
>-	 * Wa_1508761755:xehpsdv, dg2
>-	 * Enable thread stall DOP gating and EU DOP gating.
>-	 */
>-	if (stream->oa->xe->info.platform == XE_DG2) {
>+	/* Enable thread stall DOP gating and EU DOP gating. */
>+	if (XE_WA(stream->gt, 1508761755)) {
> 		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN,
> 					  _MASKED_BIT_DISABLE(STALL_DOP_GATING_DISABLE));
> 		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN2,
>@@ -1064,11 +1064,10 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
> 	int ret;
>
> 	/*
>-	 * Wa_1508761755:xehpsdv, dg2
> 	 * EU NOA signals behave incorrectly if EU clock gating is enabled.
> 	 * Disable thread stall DOP gating and EU DOP gating.
> 	 */
>-	if (stream->oa->xe->info.platform == XE_DG2) {
>+	if (XE_WA(stream->gt, 1508761755)) {
> 		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN,
> 					  _MASKED_BIT_ENABLE(STALL_DOP_GATING_DISABLE));
> 		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN2,
>@@ -1719,12 +1718,10 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> 	}
>
> 	/*
>-	 * Wa_1509372804:pvc
>-	 *
> 	 * GuC reset of engines causes OA to lose configuration
> 	 * state. Prevent this by overriding GUCRC mode.
> 	 */
>-	if (stream->oa->xe->info.platform == XE_PVC) {
>+	if (XE_WA(stream->gt, 1509372804)) {
> 		ret = xe_guc_pc_override_gucrc_mode(&gt->uc.guc.pc,
> 						    SLPC_GUCRC_MODE_GUCRC_NO_RC6);
> 		if (ret)
>@@ -1856,23 +1853,14 @@ u32 xe_oa_timestamp_frequency(struct xe_gt *gt)
> {
> 	u32 reg, shift;
>
>-	/*
>-	 * Wa_18013179988:dg2
>-	 * Wa_14015568240:pvc
>-	 * Wa_14015846243:mtl
>-	 */
>-	switch (gt_to_xe(gt)->info.platform) {
>-	case XE_DG2:
>-	case XE_PVC:
>-	case XE_METEORLAKE:
>+	if (XE_WA(gt, 18013179988) || XE_WA(gt, 14015568240)) {
> 		xe_pm_runtime_get(gt_to_xe(gt));
> 		reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
> 		xe_pm_runtime_put(gt_to_xe(gt));
>
> 		shift = REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
> 		return gt->info.reference_clock << (3 - shift);

one change in behavior here that is good to note: For MTL, previously
we'd do this to both GTs. Now this will only apply to the graphics gt,
and media GT will be skipped. According to the wa db, this is the
correct behavior, so lgtm. Ashutosh, is there any bug reported for OA in
mtl wrt timestamp frequency?

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>-
>-	default:
>+	} else {
> 		return gt->info.reference_clock;
> 	}
> }
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>index ea72bcc02e1e..1dd02a231926 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -47,3 +47,8 @@ no_media_l3	MEDIA_VERSION(3000)
> 		MEDIA_VERSION(1300)
> 14016712196	GRAPHICS_VERSION(1255)
> 		GRAPHICS_VERSION_RANGE(1270, 1274)
>+14015568240	GRAPHICS_VERSION_RANGE(1255, 1260)
>+18013179988	GRAPHICS_VERSION(1255)
>+		GRAPHICS_VERSION_RANGE(1270, 1274)
>+1508761755	GRAPHICS_VERSION(1255)
>+		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
>-- 
>2.45.2
>
