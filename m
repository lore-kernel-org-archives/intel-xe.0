Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C80C54E67
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 09:08:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC87210EA16;
	Thu, 28 Mar 2024 09:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqlKtuHW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9930B10EA16
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 09:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711616892; x=1743152892;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IQkVre91+K7JU6YXR4c08O4Q1tEH+dIRQfC8rQyaE8c=;
 b=eqlKtuHWfzUI1BammrLgjwI7CSZU5iQpEUcKHioCB2CVFzBo5miMjloU
 zkN2RGXCDipnOlmqxWgUGGcn+iINk3qFXE5AR5umoQFKUZy6q204LoX9W
 o5Rf11uQ7/Oig0+MpZhhlWMIQrmEJgrQCxUVOSHNPo2q8rvMdG4NRMvSG
 DGzppuCgs89Lb1sGn7siQrnfYnc/D8cPaNfhEwQzTZoUB6NkEtWzyG7Su
 pSZY275y8TVivEvBn+J/D3L2hjeWU+wl2djYwbi0IraxpiAz89bDLrCuc
 6rYZxGZ9ruVNnxRvcSNV/a0Q8mOfh3v8IuuVnHy+7rj96OTtqMhqmQI1j w==;
X-CSE-ConnectionGUID: hEHVaE1aSy+QVPrLI9ZIXA==
X-CSE-MsgGUID: AZIUlrK9TFKjKkQuRBTiaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="29237396"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="29237396"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:08:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="16599177"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 02:08:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 02:08:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 02:08:10 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 02:08:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJe2rlxwdB+vfzupl37ECtCIqFchRsPlPRiHJ6Gqu2wUSQk89TtfmrLl30haN3Rcoipi4+sjOGQi1rIlIKoV2VEB2W9imgX+kcGmshg3V+3qgcnYMgglJ18Smem77Eswn6tqkdiwSZp2KoRuAJe/sXH3RsDiut08XuZb7OuDr5fWHXh7aZ/9F8pD9QGc+9QbKGC7G4mcHK3uL2+vTlxGWu8hDlsYA895GxbzuYz2E5bOQoS7Dwfombh8h8M/dVLG2zebEVVQY9KmLRJGlfjRxlD/bD+9hpy34WBVRIePpgG7Xj9V7pvf6SO9yAelGRy2B0feM83AduWJu7bgoEy5Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+rnWs8H3zeE3p+YW9V6LDtxjgDGdsZyn5H+u3TOmtQ=;
 b=iAPEMyZ0YdO2ImNMsjDaPI5iay1WFBO9SyqNUWgUYspo7yQS1eO8+T5bRWgPfjLt0WVpDLl8VX8nkK+1rOFeaOns2zHTsFzLaaOAYtpgaAGF4sZMl2jbmTiz9EHaf/IOKBy/qtMkXiO4GLs3m6SI1Rpmt7Tp0bG1t5JIRKlNjMDsrcURTy7OUur/RmTNFKGBw18B2hZdSbbg/2rBXCWV1Ao+7U+cxgD2hJ2le9v2AB4ubu62oyQDagRJYJJHR9DOCVPq/syVJE6bh9iHOGQradTu6e8sq9GHl4qE8XBl5EHW1P5PoPs5BjwVmOk9oEjq75yxhWiHs3K2r76ZsqhGfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA0PR11MB8336.namprd11.prod.outlook.com (2603:10b6:208:490::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 09:08:07 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7%7]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 09:08:07 +0000
Date: Thu, 28 Mar 2024 10:08:04 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/pf: Add minimal support for VF_STATE_NOTIFY
 events
Message-ID: <20240328090804.ce5hxmpajq42ibo4@intel.com>
References: <20240326191518.363-1-michal.wajdeczko@intel.com>
 <20240326191518.363-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240326191518.363-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI1P293CA0028.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::20) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA0PR11MB8336:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dab5c7d-182a-4f3a-cc5a-08dc4f069535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XXWxWPnWpSXukRBSMJE3AVIW5idhznskVMCMbkGYfgv5mjmMK20C4F/PU0DW+sW0AULT2du1/NrT9YzSPM/BpYlSoe+CtGbIUksxVXrb9KaGwj+1OLDvts+d86HfFEz43SJZM+9nsdN6vdCeaI/tMps9tk0Q6HUIOuZ4ceRQRtSALhQaT6z6Lr9VFPFKU59Me25jbUBk772YY7OGQ6KHBKY8iWJtZ4tfdMUFL5UI0YO4mVnhTpVLrL0wBpM06tSAzCFMUv4M4jhiNFPNy774101PzVveI6BRDziy10lEZjQJxt5sjQRVHsGEcw1lMIOGmVSn1cU9jt5y4PQIfG8rHsHTNXzMNjGNnAVlwQx0DtJ9BTVb0qaeShzOXTODQ23+3gYYkm2mnG1JLmAg8bDlGHU37ZQvcL/89KUvI1kScedcqdq4FM2/zFc4YkBwMTVnEqyiL6kVvoXe/tlC0Lot7W2auYM2waG3vSLaJAIrE7IMU2tn56xvNL5wKDVmmAOMatWOSe6zGsKSjklegSF5D0dZGQ7b7ZcTrLPZ01gwDbYNH5h4rh+4Jj1wm7tajtYDCtLoHNmW++CsY4kZ1JOvcfHhviXsBg4FOd8TnCf/qYa28pCcDnf3gokv42W20yELgUyvqV/tre4nfsUULB0gtaUaT+EEUVSDp7F2rn+4qf0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW92ZjRyZ0VRWTdPbWNZN2QxR2NkeEJZamtiWHg2d0JCNFFOUnAzd2lHa3E0?=
 =?utf-8?B?VzFTdnV3Z0hTRkJMQ2ZmTk4vZnZGNUwraGVRNmtxRzNzTUxOeFlzM3hPVi9q?=
 =?utf-8?B?YVgwVEZwSEhFU1lvSXRzVmJvZ3BQUG9rU1BsOHJwRndUWlYvVy8wTXdNRU5U?=
 =?utf-8?B?czRXcFc5a3drR3c1aERHU3laemVOUXg1dllndmt5cm8wY0xQRzhhamliUG55?=
 =?utf-8?B?Q3crdkFSTnhLT2tZNUxCcXJVc3pYQi8yOExWMStlNDJUUlExQTR5Ty9lNGE5?=
 =?utf-8?B?UmJtc1B3cXJsaXFIc1pjZnpCUW92Q0hhWkJGSm54ZzlwT2Y4Y2FmZVJJNHkx?=
 =?utf-8?B?bFdHN3JBK0pENTQ1S1V0a3I1bkpMd081aDRWdG02R01UR2xKRWlkTFptdHZp?=
 =?utf-8?B?Ny9QbnpsVHAzZlNvR1ZUSzYyWjlaQzNsc2pHaWxsc0VEZ0xYeTZCMFBFYXFx?=
 =?utf-8?B?NlMzcnMyNWRwYXhTSnkxdTNNT0ZsY2xmV25jbFNld3d1ejEycTZ1NmRmeW5y?=
 =?utf-8?B?SUVJbkNGL20xWVZ2SmVpWjNvbGpELzNnVEova3RzNGNBM0xCcFJCRHIvdFlm?=
 =?utf-8?B?dWJwQUc5U3dXcFdiMUYwWkhVZTQxZmtqeEh1TzgxcEFQYm8waTVJek5rVjBS?=
 =?utf-8?B?QWVNT0dHZmVYc2F6Q2RtbXFEY1p1UjNRZS81L0ZBV0pTQ1pIbEpzT3IrOEs0?=
 =?utf-8?B?SWN4cWNjS1hxMFpqWXpCdzFBQmlocUtjNkpiYm4rVnpaVEx5enUwTFAxRno2?=
 =?utf-8?B?V3RpMTVsVFV2WFRaMTZKc3p2eU94ZVBCVytlay9aV01Dam03Vzc2cnI5aW9D?=
 =?utf-8?B?TkRyRjNHM3hFenpFZnhWUitNWksxcHo1YkY2T0hXYy9xdHlZZTJhQ1NrV1dk?=
 =?utf-8?B?YjYxTmRLOWpxVWRiUnloSVBRRU92akhDcEJLUExzaVJOV0FpaDZaOUptTjd4?=
 =?utf-8?B?NmhtRmVncTRib3NRQkhwcVA3b2ZOcWdkQmVvczY5WnVNb2hWa01iekNiRkZE?=
 =?utf-8?B?OS9mU0FTcW95aEFJLzBYTjhJNWl4SXI1V2pqOXRlbEpQWmFVdHJsSHhOaDRR?=
 =?utf-8?B?eEc0NWdCY29oVHBYallXWXh0YkhiZDNFZU5HdGZySXZXbWJ4S0xxdm5vamVo?=
 =?utf-8?B?cmM4WWsreTYzUERYTThaZExCSVlxTlJHUTZ5YnA4TFE3RUtROUhtdG1YSmVi?=
 =?utf-8?B?RmdaWW5zNjVXNlpGazNDeHB1SGNncitaZmE3UVJVald6TkFwNWF1USszc0tu?=
 =?utf-8?B?THp6VXZsQzA5cUs1VE01bFh2M1dKUFZQaGRSYjU4S3FiRkp1ZzR1cDZWZVdT?=
 =?utf-8?B?bHd4cGVxdzVsZHJvK3lZREZ0QThHZ2tXcHMyREcwdEtLcEZVYktnYWQvWFJr?=
 =?utf-8?B?cjJPUlA1R0p2VjJXNHprYkNIRzhtTnZyeWpmR3daWHFHUmZMTXp6SmcrUDg0?=
 =?utf-8?B?TjdiZWhkeGozUUpOQk5SdG1veFpkR2xxd3Y3ekpOLzRmbVUxTGFXcFdGaWRQ?=
 =?utf-8?B?TSt0SmpvZG92UjlCZHVpc3lFb1IvZjdhYkZKRW8zbW1mSjlyYjNldVp1a2lY?=
 =?utf-8?B?Q0Y4RHRzUVAyeDhpaFM5MFY0RDlrdXN0Y1AwZm9tTW8rNWp6bVJCMTJ0K00z?=
 =?utf-8?B?a2tjMThhZlowY2tOaWRZeGxlM1BUWmJDOUlldVUxSmxJWHRFd1pZVnNxVWdq?=
 =?utf-8?B?cjFYSW53V2Y1RUNmOW16VmtTTVhYanc1U0k2VTIzbEU3NWlHNTNZL1VqNm02?=
 =?utf-8?B?cFp1MEFhVGcwTzFQQjY5VXVEckVlaWtFYnhtOXdrK3ZWbVFnK3hRZCs3YUg0?=
 =?utf-8?B?VTBnUmMrUU5rTjkwdXNnV3Z1NW56ek0vRDkvSXhLTXl0K09ieTQybU9YVE1w?=
 =?utf-8?B?NzlpNVhmOVJhb0s1Y0EzcGs1ZDFPWkk0K2hqWUEzWkEwcjdQWkl2NUd6T0hE?=
 =?utf-8?B?OGxNVWtuQ2M5TXF5cjRXQWFiT29HUk9NVlhDRUQ5Um4wYzZaVzZnMFNrYlI5?=
 =?utf-8?B?ck1TeEVpSXJtZEVMSXNYVDVybDFIY3VKVmRFRWttM2V1SVdNRlFMZXhoMlAz?=
 =?utf-8?B?Q2F3TTdqQmNqUlZwN2JqWVFPR0F5WVVhTHBPNU1OV2Z3UjNvTUg2OThJYlc5?=
 =?utf-8?B?ekZ6emNWYkc4WFp2a3N1WldxT1c3Qm1xeHRacXJMMjgweGpsOW4rTm5yR0VM?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dab5c7d-182a-4f3a-cc5a-08dc4f069535
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 09:08:07.3505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKncYaxiOr0b1bU/xJmtB16jvtlpL9PhETUQRoTh6g7HFGV0WvIk6Y30cmnuZb76bka+BI2akiqDIhK6mKSNECvD/t28Dr2kCjAtUQO13QY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8336
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2024-mar-26 20:15:18 +0100]:
> GuC will use VF_STATE_NOTIFY events to notify the PF about changes
> of the VF state, in particular when a VF FLR was requested.  Add
> very minimal support for such events to avoid reporting errors due
> to unexpected G2H. We will improve handling of these messages later.
> 
> While around also add few basic functions to control the VF state
> (pause, resume, stop) as we will also exercise them soon.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                 |   1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 257 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h |  27 ++
>  drivers/gpu/drm/xe/xe_guc_ct.c              |   5 +
>  4 files changed, 290 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 3c3e67885559..25f352b3de15 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -155,6 +155,7 @@ xe-y += \
>  	xe_sriov.o
>  
>  xe-$(CONFIG_PCI_IOV) += \
> +	xe_gt_sriov_pf_control.o \
>  	xe_lmtt.o \
>  	xe_lmtt_2l.o \
>  	xe_lmtt_ml.o
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> new file mode 100644
> index 000000000000..40b8f881fe04
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -0,0 +1,257 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#include "abi/guc_actions_sriov_abi.h"
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_sriov_pf_control.h"
> +#include "xe_gt_sriov_printk.h"
> +#include "xe_guc_ct.h"
> +#include "xe_sriov.h"
> +
> +static const char *control_cmd_to_string(u32 cmd)
> +{
> +	switch (cmd) {
> +	case GUC_PF_TRIGGER_VF_PAUSE:
> +		return "PAUSE";
> +	case GUC_PF_TRIGGER_VF_RESUME:
> +		return "RESUME";
> +	case GUC_PF_TRIGGER_VF_STOP:
> +		return "STOP";
> +	case GUC_PF_TRIGGER_VF_FLR_START:
> +		return "FLR_START";
> +	case GUC_PF_TRIGGER_VF_FLR_FINISH:
> +		return "FLR_FINISH";
> +	default:
> +		return "<unknown>";
> +	}
> +}
> +
> +static int guc_action_vf_control_cmd(struct xe_guc *guc, u32 vfid, u32 cmd)
> +{
> +	u32 request[PF2GUC_VF_CONTROL_REQUEST_MSG_LEN] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_PF2GUC_VF_CONTROL),
> +		FIELD_PREP(PF2GUC_VF_CONTROL_REQUEST_MSG_1_VFID, vfid),
> +		FIELD_PREP(PF2GUC_VF_CONTROL_REQUEST_MSG_2_COMMAND, cmd),
> +	};
> +	int ret;
> +
> +	/* XXX those two commands are now sent from the G2H handler */
> +	if (cmd == GUC_PF_TRIGGER_VF_FLR_START || cmd == GUC_PF_TRIGGER_VF_FLR_FINISH)
> +		return xe_guc_ct_send_g2h_handler(&guc->ct, request, ARRAY_SIZE(request));
> +
> +	ret = xe_guc_ct_send_block(&guc->ct, request, ARRAY_SIZE(request));
> +	return ret > 0 ? -EPROTO : ret;
> +}
> +
> +static int pf_send_vf_control_cmd(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	int err;
> +
> +	xe_gt_assert(gt, vfid != PFID);
> +
> +	err = guc_action_vf_control_cmd(&gt->uc.guc, vfid, cmd);
> +	if (unlikely(err))
> +		xe_gt_sriov_err(gt, "VF%u control command %s failed (%pe)\n",
> +				vfid, control_cmd_to_string(cmd), ERR_PTR(err));
> +	return err;
> +}
> +
> +static int pf_send_vf_pause(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_send_vf_control_cmd(gt, vfid, GUC_PF_TRIGGER_VF_PAUSE);
> +}
> +
> +static int pf_send_vf_resume(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_send_vf_control_cmd(gt, vfid, GUC_PF_TRIGGER_VF_RESUME);
> +}
> +
> +static int pf_send_vf_stop(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_send_vf_control_cmd(gt, vfid, GUC_PF_TRIGGER_VF_STOP);
> +}
> +
> +static int pf_send_vf_flr_start(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_send_vf_control_cmd(gt, vfid, GUC_PF_TRIGGER_VF_FLR_START);
> +}
> +
> +static int pf_send_vf_flr_finish(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_send_vf_control_cmd(gt, vfid, GUC_PF_TRIGGER_VF_FLR_FINISH);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_pause_vf - Pause a VF.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_send_vf_pause(gt, vfid);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_resume_vf - Resume a VF.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_send_vf_resume(gt, vfid);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_stop_vf - Stop a VF.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_send_vf_stop(gt, vfid);
> +}
> +
> +/**
> + * DOC: The VF FLR Flow with GuC
> + *
> + *          PF                        GUC             PCI
> + * ========================================================
> + *          |                          |               |
> + * (1)      |                         [ ] <----- FLR --|
> + *          |                         [ ]              :
> + * (2)     [ ] <-------- NOTIFY FLR --[ ]
> + *         [ ]                         |
> + * (3)     [ ]                         |
> + *         [ ]                         |
> + *         [ ]-- START FLR ---------> [ ]
> + *          |                         [ ]
> + * (4)      |                         [ ]
> + *          |                         [ ]
> + *         [ ] <--------- FLR DONE -- [ ]
> + *         [ ]                         |
> + * (5)     [ ]                         |
> + *         [ ]                         |
> + *         [ ]-- FINISH FLR --------> [ ]
> + *          |                          |
> + *
> + * Step 1: PCI HW generates interrupt to the GuC about VF FLR
> + * Step 2: GuC FW sends G2H notification to the PF about VF FLR
> + * Step 2a: on some platforms G2H is only received from root GuC
> + * Step 3: PF sends H2G request to the GuC to start VF FLR sequence
> + * Step 3a: on some platforms PF must send H2G to all other GuCs
> + * Step 4: GuC FW performs VF FLR cleanups and notifies the PF when done
> + * Step 5: PF performs VF FLR cleanups and notifies the GuC FW when finished
> + */
> +
> +static bool needs_dispatch_flr(struct xe_device *xe)
> +{
> +	return xe->info.platform == XE_PVC;
> +}
> +
> +static void pf_handle_vf_flr(struct xe_gt *gt, u32 vfid)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_gt *gtit;
> +	unsigned int gtid;
> +
> +	xe_gt_sriov_info(gt, "VF%u FLR\n", vfid);
> +
> +	if (needs_dispatch_flr(xe)) {
> +		for_each_gt(gtit, xe, gtid)
> +			pf_send_vf_flr_start(gtit, vfid);
> +	} else {
> +		pf_send_vf_flr_start(gt, vfid);
> +	}
> +}
> +
> +static void pf_handle_vf_flr_done(struct xe_gt *gt, u32 vfid)
> +{
> +	pf_send_vf_flr_finish(gt, vfid);
> +}
> +
> +static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
> +{
> +	switch (eventid) {
> +	case GUC_PF_NOTIFY_VF_FLR:
> +		pf_handle_vf_flr(gt, vfid);
> +		break;
> +	case GUC_PF_NOTIFY_VF_FLR_DONE:
> +		pf_handle_vf_flr_done(gt, vfid);
> +		break;
> +	case GUC_PF_NOTIFY_VF_PAUSE_DONE:
> +		break;
> +	case GUC_PF_NOTIFY_VF_FIXUP_DONE:
> +		break;
> +	default:
> +		return -ENOPKG;
> +	}
> +	return 0;
> +}
> +
> +static int pf_handle_pf_event(struct xe_gt *gt, u32 eventid)
> +{
> +	switch (eventid) {
> +	case GUC_PF_NOTIFY_VF_ENABLE:
> +		xe_gt_sriov_dbg_verbose(gt, "VFs %s/%s\n",
> +					str_enabled_disabled(true),
> +					str_enabled_disabled(false));
> +		break;
> +	default:
> +		return -ENOPKG;
> +	}
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_process_guc2pf - Handle VF state notification from GuC.
> + * @gt: the &xe_gt
> + * @msg: the G2H message
> + * @len: the length of the G2H message
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32 len)
> +{
> +	u32 vfid;
> +	u32 eventid;
> +
> +	xe_gt_assert(gt, len);
> +	xe_gt_assert(gt, FIELD_GET(GUC_HXG_MSG_0_ORIGIN, msg[0]) == GUC_HXG_ORIGIN_GUC);
> +	xe_gt_assert(gt, FIELD_GET(GUC_HXG_MSG_0_TYPE, msg[0]) == GUC_HXG_TYPE_EVENT);
> +	xe_gt_assert(gt, FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, msg[0]) ==
> +		     GUC_ACTION_GUC2PF_VF_STATE_NOTIFY);
> +
> +	if (unlikely(!xe_device_is_sriov_pf(gt_to_xe(gt))))
> +		return -EPROTO;
> +
> +	if (unlikely(FIELD_GET(GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_0_MBZ, msg[0])))
> +		return -EPFNOSUPPORT;
> +
> +	if (unlikely(len != GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_LEN))
> +		return -EPROTO;
> +
> +	vfid = FIELD_GET(GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_1_VFID, msg[1]);
> +	eventid = FIELD_GET(GUC2PF_VF_STATE_NOTIFY_EVENT_MSG_2_EVENT, msg[2]);
> +
> +	return vfid ? pf_handle_vf_event(gt, vfid, eventid) : pf_handle_pf_event(gt, eventid);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> new file mode 100644
> index 000000000000..850a3e37661f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_SRIOV_PF_CONTROL_H_
> +#define _XE_GT_SRIOV_PF_CONTROL_H_
> +
> +#include <linux/errno.h>
> +#include <linux/types.h>
> +
> +struct xe_gt;
> +
> +int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
> +
> +#ifdef CONFIG_PCI_IOV
> +int xe_gt_sriov_pf_control_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32 len);
> +#else
> +static inline int xe_gt_sriov_pf_control_process_guc2pf(struct xe_gt *gt, const u32 *msg, u32 len)
> +{
> +	return -EPROTO;
> +}
> +#endif
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 1d930a8eeeca..f4890e9a1e93 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -21,6 +21,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_pagefault.h"
>  #include "xe_gt_printk.h"
> +#include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_guc.h"
>  #include "xe_guc_relay.h"
> @@ -1008,6 +1009,7 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_guc *guc = ct_to_guc(ct);
> +	struct xe_gt *gt = ct_to_gt(ct);
>  	u32 hxg_len = msg_len_to_hxg_len(len);
>  	u32 *hxg = msg_to_hxg(msg);
>  	u32 action, adj_len;
> @@ -1063,6 +1065,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	case XE_GUC_ACTION_GUC2VF_RELAY_FROM_PF:
>  		ret = xe_guc_relay_process_guc2vf(&guc->relay, payload, adj_len);
>  		break;
> +	case GUC_ACTION_GUC2PF_VF_STATE_NOTIFY:
> +		ret = xe_gt_sriov_pf_control_process_guc2pf(gt, hxg, hxg_len);
> +		break;
>  	default:
>  		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
>  	}

It seems to me that everything is ok:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
