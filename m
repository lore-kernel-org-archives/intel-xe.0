Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E2CC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 20:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E9110E06E;
	Mon, 13 Nov 2023 20:00:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90C310E28B
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 20:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699905603; x=1731441603;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cjlrLxeAyDUsD0UKuNJnfzr9uAaxYIzt+w4e1CYGVy0=;
 b=GyArnztOM4/NCpm36jytMEFs8N3wbxa60ehw/pVX9V7QyOtYmaKwjDAg
 LmlQT8uSD27Kn0IKZB8OiT8gX+5w2X5/BdnVnA8x0QXavVKUKX92QG7V1
 dzVTwmHanIWwMR4XR70q7pUFm6fnC3kw48vm9uOEGR31QuqwjRP6etvWe
 st23zyTrlhIQYeA2xnDZG/qh7u9UegjPxeKPt4cJ4yKJY8CfgcyIw+fmS
 uXRcmF9GHamLQdY62Iqh4oWmlW8+t+L71iBgWTm01Xi5GL+mcnvFSrmjo
 sxkf/ecIQo1F5NvUoSqESYeHQxo/b/D1ZFoV2LzgFxoUHlL++W2tHr0ix Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="9146020"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="9146020"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 12:00:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="12195525"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 12:00:02 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 12:00:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 12:00:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 12:00:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=keqQySe0Gfe+Apa6sCLjrSFt787peWcTVufQaHMutJ638J5aB+qgrK6Ununwge6Lw2j7yagkPZg361ObpDz8ehcXEbJlIWjUArVSAdBeIeCkKD2ldZQJUcfE60kNmyu+XtEZ3NnaIwepbxlc3ER8hMRpzYU0pWGNGzAAOLg2OQh7jP4RdVbLIvRZZ1v6A1CXFURbjI4N/ujJHscNQ+kHn0lWFAwKYIhhUgsDGAuEVPcLLK6ef+9nDlWO4BlGlNlKw7qeNZEvuFtZH/CI0cpcseeH8/FoN9ddXpVT6g5cbVg4iGb7mHZ6iiPlCBPJGtLg4edQIIk4bFezCZoAQLdg2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8q9RzMm/A6i0Fh2yd6Az1F2pT3eC0unPrGIqREC4GE=;
 b=eKwpOS67eJMvi+CEbc+n4OkwoXsqlDPaPeT5lgLVH3mHrA0e8GACnl0VWQo/CHOorweakTUb6fbz+sg/F3Y6LpCU/3/vERBAdQEVXEUWDq9/aVPWaq+YWfaoIK2bypnTqZHjTGpV+QUQhfTlg4bGpwyOm2tlqoRgHP7rBynuiq+ihrwXu72kWqew3qzZpoZ7wCwCWBV/cts+0YCqpUetHh23XLuS/B/A+gEZobQL6KMTEWjvQEj3jsSQkOFxiDkopDhoUId8dBX73juogdLHzP/KeG0N7H1XwtDUnCsDAOIeclRKM97OuOoKB59BLWNmZwdWy00mYPqy1ISXdfosAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM4PR11MB5486.namprd11.prod.outlook.com (2603:10b6:5:39e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 19:59:59 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 19:59:59 +0000
Message-ID: <0a3d8812-fb91-4e4d-b3f6-ae4af119cab6@intel.com>
Date: Mon, 13 Nov 2023 11:59:57 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-10-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231027222928.1981633-10-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0110.namprd04.prod.outlook.com
 (2603:10b6:303:83::25) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM4PR11MB5486:EE_
X-MS-Office365-Filtering-Correlation-Id: 393b7efd-b16b-4ba1-e69c-08dbe4831dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g5NhEQHO7PfL3043DlO+jsdfNTJDB64zZdOrK48TYEvn7q/sjplsSZeLrODOsngjbwMNCeLS+wociiHjb+ylta4hfb1fLNjcVLmhPqeR+MGAmIFL052DovM18zqJfwu29KKMUiCn6tsGM0ASEQKtaEDGMCfrQyuP9/84iNp7aIHZCCl4eQ/pkEQM6F3pmZG2l0lvScKIb3fqmiqsSINCnqFJD9JZ9z2aVAYS9KGrv3W+XQKTZVsn6ZwZSNUi3aYTjUWTeK10ojBdxdSFSOlEvsjhg6U/bOhGKA7GpNewRHqUKWnsbTkZaJXZkuLQW7STE49nSjJ5ka4wubKf4944qEhA4lRk90Vn2B5NWAP4ppmZUiTreIrzGLtrLV/vBy9Vm5Ot12Ei7wUNUd7381UChYVphmibIm9c3p7wTzHHNPhSb7Lc7f23w5DGF3x4MwreoLSaLqxM6tQe7Hp+0DH4p/9j2bN6GROnPUTxw7LXovqZ/yGMJJ9xyv24+AiaC5aXhQOMOczntM/sDPVESRq8wxSs1HHrat1Zq3tFad+yUeltCSBfAZ0NiS/P0RUnNrLldnBI8hqYxpjV7ZYKWLuFvvJkRGkVWoyUo7/3Ag+DrNvBCdCQ1I3LaFM44vChiUO5HHL8O5SU4GQB2wfmkOmgyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(136003)(376002)(346002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(31686004)(26005)(66946007)(66556008)(66476007)(38100700002)(31696002)(86362001)(36756003)(82960400001)(83380400001)(6512007)(2616005)(6506007)(53546011)(2906002)(478600001)(316002)(6486002)(5660300002)(8676002)(8936002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2xHRmpvSVJBa0xFSGQ5U2RHN0t3djBYaTBicnVZNGJMSjJYSjlCNzB1L0J4?=
 =?utf-8?B?VHpPaE14WXRDMWRxOUpZQTA5bXB5c1ZnZmQ4b1F2eGZBcVZVT3QvWG5iUkor?=
 =?utf-8?B?dVNueCtoSm81Y2ZFZmpmVGxNVTFHSVNuWHhTSjVHek9KU2drWllEbDF0NlNO?=
 =?utf-8?B?ZU9ONjB3WjVGNy9TVVA0UElwTW9sYkxJa3FDb21BZnNrVStIKy9XTVdzVmFh?=
 =?utf-8?B?UjZkcGF0NTFRRDMxak5uWCt3YzlUWmFvZzc2NDZhOXF5ZmpGUWhjaGhIRlJZ?=
 =?utf-8?B?YTdQbDhwYmJCN2krR1RLbURpS3A5NGlPeXI4SkFwZ2Q4ai80dDlRdTN1Lzgr?=
 =?utf-8?B?Y21MZ1hqbE1ObXpQSWNwWXh5R3FtNHlkaWtxUUNSMHJtRHBJSk9FazYyUm05?=
 =?utf-8?B?WTkvRE43L3E4ZzhOUW9ic2l6UFd3MVdETlNMRWc3emlaRHZ3Q3NVQ1ZPQTdy?=
 =?utf-8?B?bWo2dHdlVUp5TEVJTzB5cC84NklQQXFGeldaSit4N2lZZHRLRXE2L0J6ZGdE?=
 =?utf-8?B?Y004SXAvUnp0d3VnaGgwaWZCQTU5K1EwVHZMNE1HTnhINmZMMXlUdEdKWXB6?=
 =?utf-8?B?aEpFQSt4TmorUU55V1E0RHpwNTkrUEU0MmU4clY1RU1FS25JU0pXck0ranhG?=
 =?utf-8?B?RmdYYVZyTmZYWDBLUm1qSlJXRnV4aVNGTXB0bnpNK2tBbVdkWnZXV2lEQ2xC?=
 =?utf-8?B?bDMxdmV5Z0g2UmJyV3RwMW5tUy9KTHlQM2xDb0I5bjZmS294ZjRKcHBkaFNj?=
 =?utf-8?B?R0hMVVpWVXFMM2l1VnpjeUI2bUw5czdodnBDU3IxNWIyYndjZm5NeEozQmxC?=
 =?utf-8?B?bzlpdDdOWlcxQnQyOTRFaE56QXR5c0RHcE1XdVNwWERxNnRnVXhuZVJiSGs4?=
 =?utf-8?B?WHd4TXdBR0UvdXFGL2lxU0U2aGk0aEs4UWI0d0JNT1pzQWxjekNUQkpNdktv?=
 =?utf-8?B?eXVXalVOcHV1SmxTM29tOE5XcGJOcTNhK0MvWVB6R0xjNXNqZTVQN0xETEJa?=
 =?utf-8?B?MWQxaTc3L3h4aXlIQUpKelVhTUU5SXBvUzBlQmZmY2t0c1MyMHVNRzFWVzN3?=
 =?utf-8?B?S3Mrc2hOcm0xVzZvaUFoTkRVSVM5bkFHT0lGODRSZjVQam02QmZmeWtWUWRk?=
 =?utf-8?B?alFUczNUbXNMZTBMN1NvUkkzVm91NjJlY1c4ZUlmM3VucGhDenkwYXBCc2Er?=
 =?utf-8?B?WjFaL1BxSVplWUJvQW4xSDhZNmxoSmIzVzVJOWUxUEFNRUtZeThQT1QxOExi?=
 =?utf-8?B?WEYzSXY3N1JVWFNIMEpVS1pRRGNJOVNYMm5Dc3FkTTU0ZWxJenY4Z0xPNytK?=
 =?utf-8?B?UkJDdkdpbEl5TDdEbFNmdkpQcmE1cjdvL2YxVWc4ZnJzTll0WUJlZU5UcWc4?=
 =?utf-8?B?SVZ3d0c2UzhoVWc5Q1huaU9LZmw1THpHcVlXbng3ck85OVFZT09ZeTVQT3Vs?=
 =?utf-8?B?Ukx5VWxMaEtvWEpKMzNHYzRjbXNRN1VuWDNVU0p6MGxiVkJYZTNtT09ORGxF?=
 =?utf-8?B?UGNxbE5mTnJVOEx4L2VORGVJOVFXR01RQW9ER1dhbk5MVkJMMzdmaHFya0x4?=
 =?utf-8?B?UDVUa0owYlVTZVczYmovU2JwMCtEL0FRQktLMkdTdjIvdXN3NFpvanNZK2Fm?=
 =?utf-8?B?WjR2bGp4OXlWTGp3SEhjdEdweWhUbUxKSVBxZXI5SXN2RVc5VmRQVmlDekFY?=
 =?utf-8?B?bGRicWp5Qy9PajV6SFVOSUpBMzF3enQ0SFphVGQ2UkNQbWd6VXN5bEdRbGVQ?=
 =?utf-8?B?cnNkdExmVVBtNCtzY3JBWEhwTjlTV3UycXl1bnBiRXpoSjRPNXdqcEpKVkhi?=
 =?utf-8?B?dVh5OE5XY3FuYmRSYlRYcmU5Ukw3MHh0bklXbEdZOFY2ZDE0eEFMSk1wVlVy?=
 =?utf-8?B?cldOMlBtY3VHbG9ZOHFUcmEyQmJ4RkhFa3hBbkJRcjFTRGQ3SENYd2N3UUU4?=
 =?utf-8?B?QzRXdklzTzRYaVptZXI3Y1Y5NGNtdGJDSG83TFBML3o4d0Nmbjd3RklDZHNl?=
 =?utf-8?B?dldpM2trVG13ZkF0Um5LUEZtQ1JrWi9oYmZPbUlpSWRCUHJMTFd4UkVqMWRH?=
 =?utf-8?B?UEZzOVFQRDI2UmUrMkhIdnNiZm02dExyL3k4UlFib0RLckVNVCt1cVdwSVVi?=
 =?utf-8?B?eW81RlhDWFdhNU1ycEluaEJaQzRKQTZ3eGNOanRod1ZjZW1kbHNuOFJyajNh?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 393b7efd-b16b-4ba1-e69c-08dbe4831dcb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 19:59:59.6895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VqqHAC4L05SGqWDSC8c3UOE363wZZHZECduMONpexTp+iqp7oe3gJfUS/kTU7yrrC4x01uciNz01gG3kwuCHT5V7zWbATjDzPqwgsit6Qho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5486
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 09/12] drm/xe/gsc: Add an interface for GSC
 packet submissions
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

On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
> Communication with the GSC FW is done via input/output buffers, whose
> addresses are provided via a GSCCS command. The buffers contain a
> generic header and a client-specific packet (e.g. PXP, HDCP); the
> clients don't care about the header format and/or the GSCCS command in
> the batch, they only care about their client-specific header. This patch
> therefore introduces helpers that allow the callers to automatically
> fill in the input header, submit the GSCCS job and decode the output
> header, to make it so that the caller only needs to worry about their
> client-specific input and output messages.
>
> NOTE: this patch by itself only adds the interface so it does nothing,
> I've kept it separate for review but the plan is to squash it with the
> follow up patch before merge, so that the interface and the user are
> introduced at the same time.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   .../gpu/drm/xe/abi/gsc_command_header_abi.h   |  46 +++++
>   .../gpu/drm/xe/instructions/xe_gsc_commands.h |   2 +
>   drivers/gpu/drm/xe/xe_gsc_submit.c            | 170 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gsc_submit.h            |  30 ++++
>   5 files changed, 249 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
>   create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.c
>   create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 4a442dcf4d79..876c122ad63c 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -58,6 +58,7 @@ xe-y += xe_bb.o \
>   	xe_force_wake.o \
>   	xe_ggtt.o \
>   	xe_gsc.o \
> +	xe_gsc_submit.o \
>   	xe_gt.o \
>   	xe_gt_clock.o \
>   	xe_gt_debugfs.o \
> diff --git a/drivers/gpu/drm/xe/abi/gsc_command_header_abi.h b/drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
> new file mode 100644
> index 000000000000..a4c2646803b5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _ABI_GSC_COMMAND_HEADER_ABI_H
> +#define _ABI_GSC_COMMAND_HEADER_ABI_H
> +
> +#include <linux/types.h>
> +
> +struct intel_gsc_mtl_header {
Is this all really MTL platform specific? Or is it GSC version specific?

Given that the reset of the driver is moving to be IP version based 
instead of platform name based, it seems like this should also be based 
in some kind of version rather than platform name. Or are the GSC 
versions all just relative to the platform anyway?

Apart from that, it all looks good to me.

John.

