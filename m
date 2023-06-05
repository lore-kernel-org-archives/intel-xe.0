Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F180CC7EE2C
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jun 2023 02:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9112B10E0DE;
	Mon,  5 Jun 2023 02:28:48 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1987910E0DE
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 02:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685932126; x=1717468126;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4yuA9dWGHviuOeaLmaCmh7lpZtmiVFKE7j5J0fi1mC0=;
 b=g0d4qwNmEr0peTQfIw7sG6MyB1ZoICwqjAsdoLDqe3BOABYHnxIwR37q
 Y1fblufr4conC4jXh1CjTwuoLK45utzImm4jHFaPAcQhXhmi2OKQER9zB
 DuiXpMH3DZpOv51QH8pnnGvjGDdF2eT4mUk0bwfcpIwDhkMiTHQXsPgPd
 1q2NkyScJhEKhZ1rMXYodF2TAhoI4jnl0DFDMlQGNGdXEFLhZke3MrEIp
 1iaRfxVU2BFogScktXrZ+sMqXgkoAGRxxpIFkpr/zo+RkDcPGv09fTwwM
 W5uMi+xUzSHRgeFbWM+17ZCmnZCwNxvNrNJg7wSYxrMVeG9iz5Yqm9jDI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="355117848"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="355117848"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2023 19:28:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="658902069"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="658902069"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 04 Jun 2023 19:28:44 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 4 Jun 2023 19:28:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 4 Jun 2023 19:28:44 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 4 Jun 2023 19:28:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAYVOX2gqm6Ma5/Ej6/8ZcCl6JYg3J87qgVr1Yn7YtC96hMtCHBXNR8gTOdII1ewpnn9qzyv5FmS0cIXwFknzLTmX6P9ASzNqWI7v67TIBkWQ9v+e+qSV87VafsmSDIcVtU8f9RIeHt9rZ2WAhV/rk8nPFXXu5njQkYd1rJPYb8KPlr8TEU+UmjtomXJUVgFp/D1eZLN1LwAWZr993XBgJGVLQBRGHoEdDJY+bXeh4EX7CpYhXMARFbp1r0OBIzRZIi0kCDhVkswDdcBL/wPkkM44e7fwCTkmmIBAgC5Ft8ZqgM3rds8H4LVs9vCq5zhjviuiMHf72pPtLA0NIrpSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10q1DLDbCUWhT8QIBivkePZfHzlHDXf5WokXHRfgmDc=;
 b=OkUKyDFNMQzDZgXN6au8VypZJ1nIhFrH2d9w8uLexpfni91/hCj6htanwmcYZ1YIM53d/tIrNzUj03G//MnuJs2f6IHsklr5MlUBOZV4cIiU7ovVucU5SV7wZTivObt9x0IbaGfqLjuDdfClBI1P/pAJa62wBpsm2iOs0qOg4vPIDeSiIQGRR4vvgStRzxK18hGPKLqXp0SaWBuMCDZgpZszIivTBGQqUAk5bvdLyM505gI3hiTQMg7AaFLLs8RzaTdbdW6z5ZMLpdd2S4VFLgAa3iOXXo3jPeaXaZEcqLpoqCAfxSySzkBxUFN69MBh85+Kc7Jp4KbpTejvN/5vQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DS7PR11MB7807.namprd11.prod.outlook.com (2603:10b6:8:e3::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.32; Mon, 5 Jun 2023 02:28:37 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 02:28:36 +0000
Message-ID: <19dc9d13-334f-3758-1759-651b372d5d0c@intel.com>
Date: Sun, 4 Jun 2023 19:28:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.1
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230531065952.2463488-1-riana.tauro@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20230531065952.2463488-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0091.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::32) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|DS7PR11MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ebad255-2a7a-499f-84a3-08db656c908e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CDN3W3x27L1g219KFC5DrXAskT9vMwbJLH094Mc6cUtjwyLf5G5SH0bCfDvrLoKQBWRlb/Gb1SOqTIyj6G9HjoTD0+8Dx7WUqK95AkYEPxujPMvYTOvyGUa7NwYf6YiP2i90f5sfkXlL249u06wwLLo4ppvXH89wASZSaN3HHa2+UdCEeMXBgYR2oswLJBlsQ+2kMupcN+YlrpXsdUVJ3C9vbyNddV3p6PC/eOATf2dlEuFWcK1hLP1sqaWR9cN+LumHf+2GSC5uFzgD5BD+Ehr8BSNkgCd2d3IrwEPUGmLgnP05tpxSke3HW1+BM4QXYE2tmTcMBfqCm8lxnSROagbQFKRCGzHN6quu5LAKiEs/uiftyEDPudL8i/MLmj7dy8pcamOhfd0qk6eLUfzn2uEG7RSn7HB5THVn1BMru7LWc1p059SuEw6ZeWIn01R4xDehFwvDlY8CaQDhI6kkMUqe2C/H8A4dsURk92jLjclegWmB2n8DzB84cmRZJzT8ZaqtxK4549Qq3ub32s/plKrtL+mDMC8P1xyL79HQTbIwazRZeXkE0oEzH4kN3aO5ONen4Y+i2oOFwfWCfOg5HVzgSY/ZGnW9fgBkJvdCQaqspcsXgHIz0+rFx9oRQORvrljdo7vDgfxhI6IE/Cm6gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199021)(26005)(107886003)(38100700002)(2616005)(41300700001)(6506007)(6666004)(83380400001)(6512007)(186003)(31686004)(53546011)(6486002)(478600001)(4326008)(66476007)(66556008)(82960400001)(66946007)(316002)(8936002)(8676002)(5660300002)(2906002)(31696002)(86362001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG9IcTd3K2JpdlpGSU96a0lrb0VaQS9PZGFrZjh3WUx0NDhkdS9LaFpIWktD?=
 =?utf-8?B?R29tS3M5aXc5c1QzL0YzRjl1WTlvQTBVdDZGQXpaYndDVURpMEZDaVduNERP?=
 =?utf-8?B?RmNJbHRlVEl1c25UUUJCNmszRmNDUVppbmdla0MrTmllZkJaQWJBWVlaR1Zo?=
 =?utf-8?B?VnFLWkNld0tjNHRzMTRsdlJOM3lXSitnOVZjM2p4WGpwNXhVdHNGMyt4NDdW?=
 =?utf-8?B?OHhSVGR3eitWdVZocG5KMXFUcEJBSXgvREZDZ29DdEFQTTNFYkxtdGdYWlFh?=
 =?utf-8?B?UTdvbEYvVmQrbVIrbHcxdGZzOVQ4R3d6Q3hoQjAwN0VMbEx2OUY0RUZqL2Y2?=
 =?utf-8?B?ZmY3ZXBRT2ROZkhEY1lBbXFRVE9wNkdJdEJtYm9odU5odVluTHYyVkV2ZTNw?=
 =?utf-8?B?eDdYcVQzVy9MelpOMmNiZ2JVWStKS3pBRG1Jb0lLTWpYSUhlRGlxNFZVTGJN?=
 =?utf-8?B?YTVkRklZZHVhM0wwVVd6SEp2Wk11RTZtQmtTVHBTN1RHUVJaVGtXN2hTTkZQ?=
 =?utf-8?B?dXhuYXhkd1RTQ0lZVGt0K2JXc29paTlGS0RZem4wM0FRS3gyYXoyOUxUOGk0?=
 =?utf-8?B?VzExQmphaXB3OHBtWXM0RjZWMUEzeUxidzFlMHVIaVJkak9SaW9zeDhvN3RI?=
 =?utf-8?B?V3M0VXFOT09oM3Jha05QeFJ0WElIVmZjNkVSRHdZWEpEWTlTL3FwTXRrWURo?=
 =?utf-8?B?RkxVd3p1cVlBM3ozcHhxd1BTNVF0Q0FyeUVjczRYdGpRMWY4N0pwelljZlhR?=
 =?utf-8?B?NmR5cHIwQkR5Qno1a2h2NWZLZkVPLzJJVGlJUThHa3ViYndOR0hPNTBLZVZR?=
 =?utf-8?B?aU4rYnoyaXc1YkpQOEhGMk5KdDRhYUl1QlNvS1BhdHJQSVdMY0laQ29aY3pz?=
 =?utf-8?B?ZW1jWXMzRVNDYThPeC9WaXFObHIxLzl1WldCR3BXQjNCZWM1L0crNENoT0Qx?=
 =?utf-8?B?bFlJTmIxL0N0YUcrWmlLS2MrSXZiQ0RFK1pFOHdRSlhXR0o2eC9IdFVmLzI0?=
 =?utf-8?B?enYxeTVnUmtzWWZpU1REM0h2b2F2TmlzKzJMbW9nM2lhVDlZcmdkSzU2SHBY?=
 =?utf-8?B?aXZwS2RNNWxZNTBmaHYzTnI1S2orbXExanJXbUVyYnMvM3EyZUwzZWdQSTFR?=
 =?utf-8?B?ZlpHTGVJR29FOWpBdUJYelBJdlkvcGcwNDBIVGlMelNTenVqekJqYmdzK3Vz?=
 =?utf-8?B?NmM0Uit4dFZISlZEWnBJK0NsT2szNXRFVHZlSXozbzFIS2tWaHJaVW9kcjhw?=
 =?utf-8?B?eGJSMmNpS1FzTCtwY1JWTTZackRueFZmUy9RZ1VPNFpZUDZUSWlac3VoNm1y?=
 =?utf-8?B?dkxsRnoxNG1KTHMrSlhUaEtxUlVhMVBVTHNjY3JIbi9vYVYwQjJWYzFVNVE5?=
 =?utf-8?B?ZEsweXdIRmxRTUh1Q1pkaE5qUE1wRGpZYnlNc1A2K0plR3JScFNaT0MwdXVs?=
 =?utf-8?B?aFJGSXowNjBsMERkUkEzQkZmcUZwcENGU3pSeGpEKzZBWHAvcitCMzBHNWJi?=
 =?utf-8?B?a3hSNU44cTZrQ25IdEpHeE9KQndad2xmZlU3NGVNeDNEUFErRzNiWGVBRk5V?=
 =?utf-8?B?WnN0ZWtDUXZiOUlmdFNHQjk1VFdOUWY0KytCL1hON0Rwa3dxMzZhWXNKc3lP?=
 =?utf-8?B?bitPV1RmR3FydWxxZ3V4ZjVqaFZpazB0VEt5YlZvWnVFc1lSaHFQRnBiakxj?=
 =?utf-8?B?UnFJMmRYa2h2dk04NjBWTWxCdmJ6d2ZSSzdUMXduc3ZsNkx6VHRsa24rSm9X?=
 =?utf-8?B?Q0h1QmhxM2VzUDJWWW1OUGxRN2pBMW9BSGprMEd5dmU1ZUd6ZHFNL0pBb016?=
 =?utf-8?B?S1paZUV5SEhzMkJaM1NSaHFnZUE4d0lQUy9WS0s4K3hjWTFMMFl2VjZjaCtW?=
 =?utf-8?B?KzY3dlVtdjVnU01IZFdZanF5RU4vZ3V0d3RBNFE0L0FnTzkzNjFVWEJwUXJj?=
 =?utf-8?B?WnR0VEhiSWhpL2orWWJrWllKOS9pYzdpWTdIaG5ZU0x2clE3bnc0SjI0eWdh?=
 =?utf-8?B?RjZQZVBZOWc2Z0tkYjc5RU0vbjd6Z1I2ekg5WXhPSHgyVnVRdVhEWVI5eGs3?=
 =?utf-8?B?dU1iMGwvNkdKRHVLaHJoZnlkTUVJVWpTZ21hRXRCdW1HT0RXYzlqM3o4cUNO?=
 =?utf-8?B?bTJjZzdXVlZMNzcrZm5HaEFsYkVDL01qSkVXbEhkcTE2d3dyajU2dWNCcUJM?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ebad255-2a7a-499f-84a3-08db656c908e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 02:28:36.1825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VwV9qf+EC48t2nWvqSbA1qC8vCnIzqxzsykUOU0Df5FoklBjxRtpD/JFzgHr9zGaEd66XQ8jQxi+ITWOK6r3u1gUydE9IBIfB7V4+8AMyoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7807
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Do not disable rc6 in s2idle
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


On 5/30/2023 11:59 PM, Riana Tauro wrote:
> Currently rc6 is disabled for all suspend paths but it
> should be disabled only for S3+.

Hi Riana,

    Is this a requirement documented somewhere? If so, can we add a link 
to that?

>
> add a function to check the target suspend state and disable
> rc6 for suspend states above s2idle
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c     |  4 ++++
>   drivers/gpu/drm/xe/xe_guc.c    |  5 +++++
>   drivers/gpu/drm/xe/xe_guc.h    |  1 +
>   drivers/gpu/drm/xe/xe_guc_pc.c | 12 ++++++------
>   drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
>   drivers/gpu/drm/xe/xe_pm.c     | 14 ++++++++++++++
>   drivers/gpu/drm/xe/xe_pm.h     |  2 ++
>   drivers/gpu/drm/xe/xe_uc.c     |  5 +++++
>   drivers/gpu/drm/xe/xe_uc.h     |  1 +
>   9 files changed, 39 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 18eda5b1377f..75c24d794436 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -32,6 +32,7 @@
>   #include "xe_migrate.h"
>   #include "xe_mmio.h"
>   #include "xe_pat.h"
> +#include "xe_pm.h"
>   #include "xe_mocs.h"
>   #include "xe_reg_sr.h"
>   #include "xe_ring_ops.h"
> @@ -613,6 +614,7 @@ static int gt_reset(struct xe_gt *gt)
>   	if (err)
>   		goto err_msg;
>   
> +	xe_uc_gucrc_disable(&gt->uc);
>   	xe_uc_stop_prepare(&gt->uc);
>   	xe_gt_pagefault_reset(gt);
>   	xe_gt_tlb_invalidation_reset(gt);
> @@ -671,6 +673,8 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>   	xe_device_mem_access_get(gt_to_xe(gt));
>   	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>   
> +	if (xe_pm_suspend_target() > PM_SUSPEND_TO_IDLE)
> +		xe_uc_gucrc_disable(&gt->uc);
>   	xe_uc_stop_prepare(&gt->uc);
>   
>   	xe_device_mem_access_put(gt_to_xe(gt));
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index ecc843d91f62..b40a84ed6c0b 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -777,6 +777,11 @@ void xe_guc_reset_wait(struct xe_guc *guc)
>   	xe_guc_submit_reset_wait(guc);
>   }
>   
> +void xe_guc_gucrc_disable(struct xe_guc *guc)
> +{
> +	XE_WARN_ON(xe_guc_pc_gucrc_disable(&guc->pc));
> +}
> +
>   void xe_guc_stop_prepare(struct xe_guc *guc)
>   {
>   	XE_WARN_ON(xe_guc_pc_stop(&guc->pc));
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 74a74051f354..29449f456df4 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -35,6 +35,7 @@ void xe_guc_reset_wait(struct xe_guc *guc);
>   void xe_guc_stop_prepare(struct xe_guc *guc);
>   int xe_guc_stop(struct xe_guc *guc);
>   int xe_guc_start(struct xe_guc *guc);
> +void xe_guc_gucrc_disable(struct xe_guc *guc);
>   
>   static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index e799faa1c6b8..de4c7b5e8658 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -730,7 +730,11 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>   	return ret;
>   }
>   
> -static int pc_gucrc_disable(struct xe_guc_pc *pc)
> +/**
> + * xe_guc_pc_gucrc_disable - disable gucrc
> + * @pc: Xe_GuC_PC instance
> + */
> +int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>   {
>   	struct xe_gt *gt = pc_to_gt(pc);
>   	int ret;
> @@ -827,7 +831,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   		goto out;
>   
>   	if (xe->info.platform == XE_PVC) {
> -		pc_gucrc_disable(pc);
> +		xe_guc_pc_gucrc_disable(pc);
>   		ret = 0;
>   		goto out;
>   	}
> @@ -850,10 +854,6 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>   
>   	xe_device_mem_access_get(pc_to_xe(pc));
>   
> -	ret = pc_gucrc_disable(pc);

shouldn't we replace this with xe_guc_pc_gucrc_disable() ?

Thanks,

Vinay.

> -	if (ret)
> -		goto out;
> -
>   	mutex_lock(&pc->freq_lock);
>   	pc->freq_ready = false;
>   	mutex_unlock(&pc->freq_lock);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index da29e4934868..797cda7ede6e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -11,5 +11,6 @@
>   int xe_guc_pc_init(struct xe_guc_pc *pc);
>   int xe_guc_pc_start(struct xe_guc_pc *pc);
>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
> +int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>   
>   #endif /* _XE_GUC_PC_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index b7b57f10ba25..fd91463c23a6 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -199,6 +199,20 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	return 0;
>   }
>   
> +/**
> + * xe_pm_suspend_target - gets the current suspend target
> + *
> + * Return: suspend target if config_suspend is enabled, s2idle otherwise
> + */
> +suspend_state_t xe_pm_suspend_target(void)
> +{
> +#if IS_ENABLED(CONFIG_SUSPEND)
> +	return pm_suspend_target_state;
> +#else
> +	return PM_SUSPEND_TO_IDLE;
> +#endif
> +}
> +
>   int xe_pm_runtime_get(struct xe_device *xe)
>   {
>   	return pm_runtime_get_sync(xe->drm.dev);
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 6a885585f653..17087a69140f 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -7,6 +7,7 @@
>   #define _XE_PM_H_
>   
>   #include <linux/pm_runtime.h>
> +#include <linux/suspend.h>
>   
>   struct xe_device;
>   
> @@ -22,4 +23,5 @@ int xe_pm_runtime_put(struct xe_device *xe);
>   bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
>   int xe_pm_runtime_get_if_active(struct xe_device *xe);
>   
> +suspend_state_t xe_pm_suspend_target(void);
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 70eabf567156..67c0e10f9f6d 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -176,6 +176,11 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
>   	return xe_guc_reset_prepare(&uc->guc);
>   }
>   
> +void xe_uc_gucrc_disable(struct xe_uc *uc)
> +{
> +	xe_guc_gucrc_disable(&uc->guc);
> +}
> +
>   void xe_uc_stop_prepare(struct xe_uc *uc)
>   {
>   	xe_guc_stop_prepare(&uc->guc);
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index d6efc9ef00d3..b1c56c462d48 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -14,6 +14,7 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>   int xe_uc_init_hw(struct xe_uc *uc);
>   int xe_uc_reset_prepare(struct xe_uc *uc);
>   void xe_uc_stop_prepare(struct xe_uc *uc);
> +void xe_uc_gucrc_disable(struct xe_uc *uc);
>   int xe_uc_stop(struct xe_uc *uc);
>   int xe_uc_start(struct xe_uc *uc);
>   int xe_uc_suspend(struct xe_uc *uc);
