Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D470C624D3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 18:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B42810E15B;
	Fri,  4 Sep 2026 18:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ErpLXTvX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDBA10E15B
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 18:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788544835; x=1820080835;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=drqNtumynd7tMY2nQQ4OHBvUxSJVyKi6KeOL8LvV07w=;
 b=ErpLXTvX8g6LAIZH6Ys/AySfCKCivOuOhVYckPpfWGdHXNCC6J2ePOw1
 0GkOPkwqYCdO5rcQgj74waG8LjSAYRu1c84XT+BHuXnGbX9q40rIs4Jn0
 pKnv47pY+8z0A+rms+JUX8cYgAlBy4rTdXJeNL60yDNDz4a5wcYw4q895
 GD+m2+chUoWgsy/ZIGfxaDSjeIlxTjyMZ9bHHbNIUm8MDmDgV0r4q3ioE
 ap3Rd5NZZ+pFaE8TjqQrQvRfxh3CNx+36RqzHPyH8e0NUzKxvW1cmoIhc
 lWiI6gNxZBbakZyF8YwvDqRu84hlCX5nA8jJu/Z29Xa2JA0/ONa7p056/ Q==;
X-CSE-ConnectionGUID: FMfZ8Os6SD+EeJk6nqqSGw==
X-CSE-MsgGUID: z4OMjx4XT62SK8g3XNc/iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="91562752"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="91562752"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:00:35 -0700
X-CSE-ConnectionGUID: HHtVgWVgQwOmO8YIbd198w==
X-CSE-MsgGUID: La0XQ+/OTPK+LkaF+d7vAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="270631445"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 11:00:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 11:00:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 11:00:34 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.27) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 11:00:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ugsh+xFWk3YqjfECjDJncVeqTTMgvDKx4ukswbeWDKw690kMSwEQ7YQXA63rFkRJKsgu4RtTn2hNEffbNiYHiGJ5+CrdqHArudk9GAI3LEt3/5hoIN+0xvWmRQChGYt9XL5OgFbClkCudS9d9gWC4cdvowaGs4xMuksFIhEaV8rEuwZ7/2uUdR6bTkRdTUispDj5qbOSoqnUZfQNhyj8B45WHzpdUk2F8/GAAHVNrRg2D6T/gYy7o+ovqS9wNCPSAUvk16D9E9MD2A1arVCIP60IqphtahtnG1ay4QZHsmeHYwCkfGXgHRFEXHKRhuCAmelnAwgGwOXAVKcB6IIEAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oReE0VhdxpuYhq90cuuiZIhXI+RmFXJO6bYuIJcmINM=;
 b=L6IklthVyjSu3lF8LxcWXiabJ6SterRxamPbHlxtbSrsQd8PE+Aib+JXy80z1Y1GBx9R7FLt1SivVTI6gDHnrj8obbn0WIL0MIhjgVr1b70pQ2AYuHbSsICLqii8HDvQXQwG8iNhsVmwL+8PFhHCzrGnWHmDUOvRkWyAIhrEvwLTW0Rsbl1aTF39Nil6D/PYyxRalMu3XE+GOsZfPD02W1Xug23FTsHi7NzJBW5T+WqbmRCGDZjySEtOZ84mi/7Ns96iualIhtFEnQM+4xr5i4J4YjBBknyrx7pRa30QSqZz6T2Gs7JMhHS6v6Ajsa0My5QfObXkvQn6ZUEAJ9rFrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PPF8627DB357.namprd11.prod.outlook.com
 (2603:10b6:20f:fc04::c9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 18:00:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 18:00:32 +0000
Date: Fri, 4 Sep 2026 11:00:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <szymon.markiewicz@intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3] drm/xe: Guard page-fault worker with runtime PM check
Message-ID: <apsHPQlxIPVf/qBW@gsse-cloud1.jf.intel.com>
References: <20260903062709.3831387-2-varun.gupta@intel.com>
 <20260904091656.374036-2-varun.gupta@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904091656.374036-2-varun.gupta@intel.com>
X-ClientProxiedBy: MW4PR04CA0329.namprd04.prod.outlook.com
 (2603:10b6:303:82::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PPF8627DB357:EE_
X-MS-Office365-Filtering-Correlation-Id: b7eed3d9-bb40-40b8-ed74-08df0aae699f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Hgt+y9lTBfSfnRkyiUTSoXp8oAPdiE2cbvzNJ3ETtpe7Nccfl56yWaSfK3zgn27l8u2S1CEloifHJmeNvcFEKl+eKCvzslrvIXRwXCnqJsdX9UmClmuE2nSEZ3mgaMqmFrPr3boSZB4ghh42jF8AeyiMmPDlMt23Cpkcyx31Nfqax4QZqaD4rPJ4LS2z52GQeecWslTbtln32CjbYbJmXzzGPXMQkkgzlkeLqmsT+VyzSbse9VVzY+i8C/1lzOcn8ipfATc8+vnmrKLJw+8xLMV2+NAvTYg+UGowiYmyFEVbKbq3FyODUV9qAn1NzsjzZyh7b0vpV6EN6ynH/I3Z7/44ILpni/RR9XsiI0gmsSeEjNiTwxttm+FgrssRhpj/1etPceUUtdx+pITPDtMA73nOqm6ivPE2ULLiB+oMV5+jk/BudNRwAwZbu21Jxa9rooDH8HMtyObNn7eTAzOoKWD2OT0vE9DZzdJL79FgZKOxP6Sd6x1DIvUHhLad0AyKGb21D1TqCHkt7bLnIIU5BlPnkEYcJ2RVMe9AfHE+pRY+WR0OPeLaK78Tr7iqIfX0YT6L3gN8SBIUZDXuVHK7gVwNPI6daHTe84VcrkhDWt3n6is6+cn42zaGTF73akfe5EW6F+KqRZ1zRAxxzsKCm5aOHcQATMaeMpWlEzE9ObQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+Bo771++6DRf8WuFoKzluXtbJMLnvIdw+OXwclCZXtW9YhkyXUgeRSOI4D?=
 =?iso-8859-1?Q?cVq9aCrZn1g2WCETgi4CUVlk0ncd870ARE85jAYdu7fG9WKkG8S570xBaC?=
 =?iso-8859-1?Q?iz75FcvqrULkQMrYHgvqUTbNVGwsFDNaGVvL7mZx97IrpDwBn9N9Zwe3Xj?=
 =?iso-8859-1?Q?lsbkBXs2k0IvpmJ0UPEsJyqe47fD+r2DLOEBy1MJusG/kx0zLQ7xWZrI5D?=
 =?iso-8859-1?Q?vSEX4e59DOBJF+iaosCUE3JNGMe0iuNXEk+ysU7d6kT8OAalf6eHv4RoiV?=
 =?iso-8859-1?Q?vxU66f74ionuvS00ilHf2jVvnaS8oPFn9nAIOMVxH35uSuuyIqnNOzUljM?=
 =?iso-8859-1?Q?F8mr0ugvz3Sa4nDt52qA4+g8n4XHUTweyMrem/ahfDSLxKIrZMV/eF26b+?=
 =?iso-8859-1?Q?b0sViuolelv9Lft46V3Iv7v5RwXHIG5elhpc4brx6ZfQUUk/MHnmwe2O6s?=
 =?iso-8859-1?Q?k0uvGBuR7aYmSHpWrddqFeFZhfopaDLuk9LyMFNtkPUw6nMfua/+G2d/26?=
 =?iso-8859-1?Q?N/nmfsuzBV/n56Q11fbI08O4p8+TeV1aUT/YpU/hE+ij14r7BSDkGEGcN8?=
 =?iso-8859-1?Q?cc7cidijNrvnwCgwdJQL1hhvmS0gozwD1XBx4QN8q2c+dwf3KiR8rkybLg?=
 =?iso-8859-1?Q?v18jjE+Q73HzHywtS39BM8teFh04VO7yaD2/kAN570BUdcb+5z/WzG5MP5?=
 =?iso-8859-1?Q?VKeCc3gjNr7EKWiEDIUWWvpkSLMfBHlEUsHWJCAeLDhaTfKBYBceywls8N?=
 =?iso-8859-1?Q?FIL8iNWfVHKwv6RVs2U9RbyIkRAOAwjSb961B1tz6OfOnfUvo/ZCzskbbO?=
 =?iso-8859-1?Q?M1MdrBF5evKvw9fNpgtHR4DsA9FnvzEBt3xwh6xH61Fx+4iU9VaeINq/Oz?=
 =?iso-8859-1?Q?dlgNrwpI9mYUVxSO06etimvrK9A11HoD2daEtU2x4YUsm6eQ9N9pn2O7hx?=
 =?iso-8859-1?Q?ZMRhTPidNsQgQgkwocyz1US5Fi1UekG/IsYF8tdiKxz4xtuu7LzIhk8TWh?=
 =?iso-8859-1?Q?DgndQaFoxr+y8kIQLG46WDn3LbNb3l3JO+WEWDBqJlfvCy3ymMcVBfReaS?=
 =?iso-8859-1?Q?gy3ZRcwqflDZ7p0MzWM3DE3YwUZG8KYqpVqvCB9P+3fWld5KvGxyWqTOfT?=
 =?iso-8859-1?Q?DJjy0cv/azxuOq68RUhbEQjFdHJOC2XAx//67HpejOKbOYF+ri+izeL2+T?=
 =?iso-8859-1?Q?lFpDMsP1aFtA30maTzEKb/7kvvzkbJ9KPILnJSktMj9EFr+pva8nujVnZs?=
 =?iso-8859-1?Q?dtFer74ieFgrKy8LNURYmSMOOY3pyVq+fdX6zIofaDmi4ufZwhUdo/34G4?=
 =?iso-8859-1?Q?IYEdjNs2wXActdOOwD6vmZSt3Uwoffl2FnZHDPLAG7uwk3lJDVqf3iyquv?=
 =?iso-8859-1?Q?O1d0Orv6tZyzXGA+E00hDjcg2YXvOf0JOAfh00w9XLv6Gkq4uNOYaLDo81?=
 =?iso-8859-1?Q?PY1WL5/Us1xm7RULMBJOef7WGRPtHyBj2vv5u8sy0nfyxN7hyyO5FnFIkm?=
 =?iso-8859-1?Q?SZQUc1jnP/+75RpTsXQloqrMLsf9Cnnoo00tKDwVb1b/Kce7frwhxvyHxN?=
 =?iso-8859-1?Q?qoSNy21gp8d7i7JqQErancHB+m6cNxfvrLSjfgoTiED59lgOsGAP0Bnijx?=
 =?iso-8859-1?Q?SSMW1WFXyizIyfwVNEq/o4CkjJlwXJ0Lfwqrl4pY04Ds3Kq36JnGk0P1hf?=
 =?iso-8859-1?Q?TDkLQBHvUgIYkTUfDEY4fVMGKkmM464POchKeq+M1not7jWA8869pWrU+H?=
 =?iso-8859-1?Q?M+RtmQjvM8PRTwqA6J1J75tbie2t37igdCiXeLlVdaIj+C+e3tCFVT224P?=
 =?iso-8859-1?Q?aR1B8U1iVpua23rPDfI/3o7Wf47RvSU=3D?=
X-Exchange-RoutingPolicyChecked: PUxEby14P3P27/HpjYwMQbW8c+IcKAteQSv1VSVnJTLMxETJq08UnpiLVZEuJNuLPViprFGL3PCf6p5uE3+mxHBrYxV/f/AIwSPyRVgYniXYD8d6Po5BHgeWrEpO5mdoC1kFXc2VvfRHILQwjJELm0gD3f41uqMVsKOZUtxRxrO2sSWA+4x5025hZXKx964c9UGJQegVLw69HFVAHtZJ6NmvprXelvjiz9XRGFWtY0ttCrUfTcury5mW9omabjT3pfFkd8M9VSicyzAG2gUZe6tIpDpCINEocEpxGXdVPms8akrCwiATH+BTm7YRXrtT60gtsIJ7yYEp37o9Edf2tw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b7eed3d9-bb40-40b8-ed74-08df0aae699f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 18:00:32.3840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H454Nr1DF2Klx5aRwUd1ua26IYh8W9ZBPVqm3TAT+Wd6kGg1G+f3+MFAMdqW+4WYHR9iKyOCOPxXiBg3QqayVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPF8627DB357
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

On Fri, Sep 04, 2026 at 02:46:57PM +0530, Varun Gupta wrote:
> During VM teardown, the VM's runtime PM reference is dropped
> asynchronously, allowing the device to autosuspend while stale page
> faults belonging to the now-dead VM are still queued. When the
> page-fault worker later tries to ack one of these, it calls into
> guc_ct_send_locked() on an already-suspended device, tripping:
> 
>   Assertion `!xe_pm_runtime_suspended(xe)` failed!
>   WARNING at xe_device.c:1267 xe_device_assert_mem_access+0x11c/0x140 [xe]
> 
> A live VM/exec queue always holds a PM reference while it has
> outstanding work, so if the device is suspended at ack time, the
> owning context is already gone and the fault is stale.
> 
> Take a runtime PM reference across the entire pagefault
> queue worker to safely deliver acks for torn-down VMs.
> 
> v3:
>  - Move PM ref to the generic xe_pagefault_queue_work using
>    guard(xe_pm_runtime)(xe) instead of tracking it in the GuC
>    backend(Matt Brost).
> 
> v2:
>  - Hold PM ref across the entire batch (begin/end) instead of per-ack.
>    This prevents the device from autosuspending mid-batch, which would
>    leave write_only acks written but the end flush skipped, and skip
>    counter++, desyncing the cadence check.(Himal)
>  - Add a comment explaining stale faults.(Himal)
> 
> Fixes: f289f7807119 ("drm/xe: Add xe_guc_pagefault layer")
> Reported-by: Szymon Markiewicz <szymon.markiewicz@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 2e415995f067..3e8e8f7f5f40 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -17,6 +17,7 @@
>  #include "xe_log.h"
>  #include "xe_pagefault.h"
>  #include "xe_pagefault_types.h"
> +#include "xe_pm.h"
>  #include "xe_svm.h"
>  #include "xe_trace_bo.h"
>  #include "xe_vm.h"
> @@ -604,6 +605,13 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  	u64 cache_start = XE_PAGEFAULT_CACHE_START_INVALID, cache_end = 0;
>  	u32 cache_asid = 0;
>  
> +	/*
> +	 * A live VM holds a PM reference, but a torn-down VM does not.
> +	 * Guard the entire worker loop to safely drain stale faults and
> +	 * prevent autosuspends from desyncing batched CT flushes.
> +	 */
> +	guard(xe_pm_runtime)(xe);
> +
>  #define USM_QUEUE_MAX_RUNTIME_MS      20
>  	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
>  
> -- 
> 2.43.0
> 
