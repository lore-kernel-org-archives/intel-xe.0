Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005F2C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 12:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87A610F13F;
	Tue,  7 May 2024 12:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VpT3FkwQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F3D10F13F
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 12:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715085053; x=1746621053;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/bhD5cayN7Op3oiZMOtRJtK16k3wJ0mWLUyFIyMaWLM=;
 b=VpT3FkwQxFSHGXJHQdX/zoVzGOm/K3wQ5WUfNJmpT0DwGdfiDLjCTWbm
 3wdrFCiz+BFsHzMMoShcEMAJupufg559wG8HEVdjp8BxLpplxIQD58t6r
 VU927RcC3xfWclz7JfgTr9U9j1GGhyMvSNRVx5JNzBrx8I0Pw75U/w5h1
 ekBG4Woz4Ja6l/b40awM0SeZyoHMYakn67FQf0AFpSaEXm8aU6f8ORQF/
 bOFn3+vNIua4FBO9W9D0fGXOEDbTcMUxL/AW6kR0/YmeNro0Yp25FIJW2
 1aB1jJMeCGVW8g2oyDNsSVXpAcFr5XVAgwQ2/NwocumnYAlc0P3QBcaTm g==;
X-CSE-ConnectionGUID: E6c94lJnTSSE176vjGX/fw==
X-CSE-MsgGUID: tGR3CXx0SbOnbp8nSzdECg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="11091431"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="11091431"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 05:30:52 -0700
X-CSE-ConnectionGUID: 0gSUEerwT5Sfr/t5A2dbKA==
X-CSE-MsgGUID: QeBMLicQQ3iFoX4Sd26YEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="65949644"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 05:30:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 05:30:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 05:30:51 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 05:30:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4oXfizzkqGMcsmtn9mGNnNrueJ6ZnrUZZkrdM5QedtA3iEMlDNnpNIV03YWx85hFpHdujsIBpvFr7IW5csj4sXlvKqGa6VXDtJjB4sclDuBfDUwHacg0p8x1AOixbi2waIbmf2hMBzIB1Dhs9qZD1E3z8XHCEzj9so5E12ag7Z4NNJvXJGjH/vY/M8yMUdSdvgIAcVauhx7CqNLGgro/v9PxWAgSIZjoWC6C4+NMPL9u/63I/bqd+wwPf4/0eGpoVy0se7UZoSyA8FopiRIQENiCl6VTZkM2zuE3Bog2SHnMRj5D+suj0qB+GMBM/l5hAEzZbJ1KKrk1kcff0EnXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEt4Z3HsZjVEAHM/rymkUAnjWMGIgQluG5jqatGGn0Y=;
 b=mRLLclUtcgxM6lRjANNvdjFb8J+oLhT2abdWTGd+yCMbBB689elWVw/HYMPnFBv4tv53Zn2QPQ2UxBKVti+od3btQMSJ35FMhHp+FAlQLDB1jlUROjeCte4Is0BxiRY5lRqta1/7ujC9jbCZFi5egOd6N6n+tgIp0zKrSh0XEJj0E0yLRTs6rCJjuD/jQff/TDdBZLvT/4MYmroUZTB+ZnzfLP5C6UZs7EUgd7V31+6yATx+7WLpTrr4OEBXNvD1MOpNwQ6ckrbjGYpv4Iuna/IrCq8Jdhp7q/1/ylDa0kgJ3mCGE2yzV9TfNwAoB98lwW3GzJbvpfFm8rjyXmi5sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SJ0PR11MB4848.namprd11.prod.outlook.com (2603:10b6:a03:2af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 12:30:49 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 12:30:49 +0000
Date: Tue, 7 May 2024 08:30:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe: Don't rely on xe_assert.h to be included
 elsewhere
Message-ID: <Zjoe9YvsEs7FbyB4@intel.com>
References: <20240507110959.2747-1-michal.wajdeczko@intel.com>
 <20240507110959.2747-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240507110959.2747-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR04CA0032.namprd04.prod.outlook.com
 (2603:10b6:a03:40::45) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|SJ0PR11MB4848:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad9285f-eff6-4596-3f48-08dc6e918699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BHVaia0zDIspM/R3kZP0Gv+mgTsADhGnsW74JcmcePNu6xRb38YHaBIHcjTl?=
 =?us-ascii?Q?S7kHC3V3dZ+ApRVdX9zKbskBsVqt9GxiMz013IF2eV97hj5KHnb9SPomzjXC?=
 =?us-ascii?Q?uC4U0s/Mun6tGrfsNKRDB9jEAa44AzfHq8rFfp98JPTse/rJ0ZW+NEAA67Xj?=
 =?us-ascii?Q?/zJn9sx/WDBcbqRWLx3ZTUAWWOLqLFqpzq0Z2AYGNm/bi85tiRLzrDwy//IB?=
 =?us-ascii?Q?1bajxgyPy/MEB3yVZv6dkpCGXwtKWZdpPx6VLLDKYE0LTMVmH6g+fgvnrm5Y?=
 =?us-ascii?Q?4kjLKgII+DD2PwpVMB0gM3VKwlBMeqIelh4uWANTbPfxukrN2t5cYSobMVGU?=
 =?us-ascii?Q?jqHDFEjhf6oHLayHmaVnl6U/9XNlLym3E8RUaEmzRplqoRkQjDaLqCGvia6F?=
 =?us-ascii?Q?lna1YVz+mqbjsZqYqyB33rmKBHT4FHgE6QzhOsZh/nzSzU8EIAhUuH9i8dsb?=
 =?us-ascii?Q?Vus7XzZjRJgt9dze5NMEeu0HwE56PH4D1Ij6N1VErbQVYMU7dv0s/aOmSc81?=
 =?us-ascii?Q?m4W7m6t2l2gAuDK42Yxblp6wH48xDKChiCyk77NmlCMRrcKLYSFqKSIkRtkF?=
 =?us-ascii?Q?2dxkW6rFBCnhDRIzieN3rTxdFUcfZph5EuQCFjDrlh8Tj9xo5Bf/Eb9H2Wwu?=
 =?us-ascii?Q?6Kub4z882Qor80VQdaWzcKFq6lznl7P6rGj2zi9Aph7yTkkWytwgL3vZCXqa?=
 =?us-ascii?Q?eKoG7auwqjkL8J82fw0EJrpF0e5UPumTSUEkj0vbKKFyXG9cDWbdu3RDOSAK?=
 =?us-ascii?Q?yw4QO4UO4HQC89HufvSjiHds4G3JlKNhaTDQfquYXbY7Sw8I8wLM3l8FCqO4?=
 =?us-ascii?Q?C7HCdDtL53QbEqN+lCslH3PFeUq6UWlA5tRG7C6gUFZ4ZgVANFOpmv4G3j8M?=
 =?us-ascii?Q?PiLd5dLPI9CE/ANK10R8vna+L9o8rInQs5rnRUS8bl9tRgsFpUhn//COma5B?=
 =?us-ascii?Q?ePV/nLS0ALh5o7ot7AJGQKyW4aRAWo1TK3dIC4Nn/mnEes3G1Ad2fo/456mw?=
 =?us-ascii?Q?/XbKUX/AJnvgQ7UMIw2o6sgw7V8bxzdzJeHYQRQ2dZTRtxev+xA4GpQi5gjW?=
 =?us-ascii?Q?lojNc3jgoN5W9ODVubxKhmkXuCMRqdAIKevtBE8WtECZMT97yZ9NrVTqgniG?=
 =?us-ascii?Q?+/YgvIZQm3jQhyF47EZccc+lsMk+r+riFkpEJ5KzijR+wCzkbNAZyvwVs5Z9?=
 =?us-ascii?Q?ZRqc0C1SMSqGkZwOUGH7COEK7NlbOgKX0sS6k1DSf8Ry553eoYAyKQATHmeL?=
 =?us-ascii?Q?6RrtvGam0IcgBDDHxu2GrXjbxRRADqZxbntI7mVJzg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FQvCHBzf/yrxImMFxNYqGHpOk2LHOn2kfY2ceqak3/RZN0KHSYnHSMhjyJ4a?=
 =?us-ascii?Q?rVQJ7NmhSTeKGTKo1OOsvFzLFYQJOF1z+GP0aw8gdoJx+44epms6YWZSnH2e?=
 =?us-ascii?Q?7npRZIuRt5AEpQv56R7wXgtKrs9SlkJwxNmy/GvcsCCW4uJgwGMvHpKL3aGi?=
 =?us-ascii?Q?nXV2lPwyd7vKNzYX/0Gkl/CxOGaV5zqlQMRoLWlCN9YCoiNmJe3EhN/OAVaa?=
 =?us-ascii?Q?KBRKJWn1NV26LJ1Ut/zhlWKIG5WSggKxbV6hXY2jx+U5068srfD8g6vEKHIe?=
 =?us-ascii?Q?OP9GIYRADguZZ8UI25CGKCTQpIgSLy0b7xHasOf/nE7eUNBhzyI5KNhSlqfh?=
 =?us-ascii?Q?Hx/GwGMvbwba3I5YRJ++xC5LtBOnNYFOoN6tKiR+Gf2AEOuqVW73+HnVZATv?=
 =?us-ascii?Q?f9Jvg8yRSP4Bl6m8Ml6VU3WyMay501MQtmIe4yIGzYYEPsLAECsjzKW1JffS?=
 =?us-ascii?Q?S0VauDf07giFw4qDbnnamWwviFEjdp5RUBvrxHMSyOEn9XR56e6/uWpDXGYh?=
 =?us-ascii?Q?628azrxQOfYvKZKYZ8S66GgVjLhJ0z8UHsocmg8GbGvCDGOGM66ids6ObCbw?=
 =?us-ascii?Q?yA6r/FtBDzuT65xRnvyHhJyXJzZ+761Zs8k98rAwQfWJu/1esZJw5ByUvl8k?=
 =?us-ascii?Q?UyXMbuM8Rzp998z9c+Uezf8aYAvO2ucyBJl2V399AVleq3p0X4+X6a2fafWP?=
 =?us-ascii?Q?o+z3P7MDZhJu+Z9AvG7bw8Nen/u/GvK1jfJqgPGVMX+8TvJuIyjZLnC7HcWk?=
 =?us-ascii?Q?ADutaNx0SYhVsN8ATwoFao9agTet9VRsppPfe48wAFTr3lRyCDWSzuqdYyCN?=
 =?us-ascii?Q?F8nz1UvxnAkR2mWXiueuuN0ezHGDSQ9uS0M4rKTZQkhXDc2M0rBQYELqLx1j?=
 =?us-ascii?Q?I9L4D/ODymUACIdMiWR0CUKJb4mnpfQvrYthacVecXGVgVgtlOf3+736ZWFI?=
 =?us-ascii?Q?UAyEZojOBxlVc1Lkpbak9DJV15g9iiWKkVoDBBdQPuIHndl3KPxUK2lQBz/f?=
 =?us-ascii?Q?FKkIE2s+Zv5VG7CUhDTYwsk3N60VZ7UKv/EO26sm8ArUOsfn8OAyTbUNJEJf?=
 =?us-ascii?Q?GnsZ5mWh2OAxCjm1R97feDNmvUo695GCs5r1LUwjBLcbctW7KR5ISW+PTNDL?=
 =?us-ascii?Q?dp1Bak9wD2RsFFcxbiPU3aS1Gl6mWbzSmxIoCj+v7Ef/Tts7qKvx5hV9ks9m?=
 =?us-ascii?Q?iRtSjd1Z+MTmY+YUWYuSO5TbefRFArV2fsjHegafVF5w7dS6gxqwyNbnyJyN?=
 =?us-ascii?Q?lplSU2VzKSujqrPJRlBB+ZHTxZ1mhdnbRfHm978H3SpyvlZXVRqUklIJ6B/J?=
 =?us-ascii?Q?6NqqC/4+criiNZOOQ9UFMKu3NJL1T0MlG4V8FUs1xw6MAn5s0oyBS02ZeWUu?=
 =?us-ascii?Q?kip+inT2CLs0qCnQXdIdYQ+Y0ETaav17eSM9fH2ejpF235tdxSrG+wInpGjz?=
 =?us-ascii?Q?D0lGQWhDgAmrGMB0qSGkbsG1wyN+dFtp2VIR8kI2kaeKgjhbGW5hIODIT8dn?=
 =?us-ascii?Q?0TMC7tiCcYiITp7LL2OoYoMVlY4F2tAesx9tPTqU1rnez71J6izr4cevHs8k?=
 =?us-ascii?Q?UxsuZPwFSzfFyFLtuJXAakMsRwdsCpKbDSQs7yxj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad9285f-eff6-4596-3f48-08dc6e918699
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 12:30:49.0770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIsN7NZ6O+v1U1jBh73hy3n78m5OE8gOWoFeXoq73teQkS9mrePl7NKjYePVYgjMafcnwuaCwmJoFxEqtBuI3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4848
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

On Tue, May 07, 2024 at 01:09:57PM +0200, Michal Wajdeczko wrote:
> While xe_assert.h is now included and used by the xe_force_wake.h,
> we want to stop include xe_force_wake.h from xe_device.h as it's
> not needed there.  Explicitly include xe_assert.h where needed.

I had recently bumped into one of these, last week...
Thanks for fixing it.
That's the problem of includes inside .h...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bb.c         | 1 +
>  drivers/gpu/drm/xe/xe_gsc_submit.c | 1 +
>  drivers/gpu/drm/xe/xe_gt_clock.c   | 1 +
>  drivers/gpu/drm/xe/xe_uc.c         | 1 +
>  drivers/gpu/drm/xe/xe_vm.h         | 1 +
>  5 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 541361caff3b..37e056fde95d 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -7,6 +7,7 @@
>  
>  #include "instructions/xe_mi_commands.h"
>  #include "regs/xe_gpu_commands.h"
> +#include "xe_assert.h"
>  #include "xe_device.h"
>  #include "xe_exec_queue_types.h"
>  #include "xe_gt.h"
> diff --git a/drivers/gpu/drm/xe/xe_gsc_submit.c b/drivers/gpu/drm/xe/xe_gsc_submit.c
> index d34d03248843..9ede483d37ef 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_gsc_submit.c
> @@ -8,6 +8,7 @@
>  #include <linux/poison.h>
>  
>  #include "abi/gsc_command_header_abi.h"
> +#include "xe_assert.h"
>  #include "xe_bb.h"
>  #include "xe_exec_queue.h"
>  #include "xe_gt_printk.h"
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index c7bca20f6b65..9ff2061133df 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -7,6 +7,7 @@
>  
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
> +#include "xe_assert.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_macros.h"
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 0f6cfe06e635..45035e38388b 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_uc.h"
>  
> +#include "xe_assert.h"
>  #include "xe_device.h"
>  #include "xe_gsc.h"
>  #include "xe_gsc_proxy.h"
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 204a4ff63f88..3ac9021f970e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_VM_H_
>  #define _XE_VM_H_
>  
> +#include "xe_assert.h"
>  #include "xe_bo_types.h"
>  #include "xe_macros.h"
>  #include "xe_map.h"
> -- 
> 2.43.0
> 
