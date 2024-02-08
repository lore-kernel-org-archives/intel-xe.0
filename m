Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05B8C4828F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 21:40:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3CC10EE94;
	Thu,  8 Feb 2024 21:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AWwNxEF2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBB910EE97
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 21:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707428404; x=1738964404;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=V5RjrhiKZ4VW4Cz5KyHKdEnT/q0GBZvmafOeAhLJGqU=;
 b=AWwNxEF26vnzdnY9bVh0dIGXwEPDf6PfF+gXf0FB/wiwafco7IshjHg4
 gISqSIaG0dC2SOTuaV+rIKk9OHA8UMBZBbdRVpmx4k4+ohWtC8M1PbxtG
 BtO0ZhDOBZ/67iaXhsqpISaD7RibnKdDj6ZEB9HSQXxpIS1Rhw4XW/lgu
 1O0h/8sHGT6lFlF4tk3OpZZl+Fn/6XmTYtUnfCsbINnC23c7QjYAVqBC0
 4tLRsKaZ3BDUeAm9zYQoCp2VikXSJmObDJH76GGGmVa0MLUMEmLl8YFQu
 zCdm1H2jKHSL0nWcJEOcbHJRaqGCqgdUr7+ZkojWv1YOw8MjRR78dTxdD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1207971"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208,217";a="1207971"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 13:40:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208,217";a="39207809"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 13:40:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 13:40:02 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 13:40:02 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 13:40:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWTG2G3piFFWU5fs55eDmwCSe9WUTJt6ZvvuxwVkSREKvq9ftRNRycVQiPhfG6wuKc4GGLShkzmVjkpn+GiFHKr9MMZ+U5OqO+83bxN+XquLpxSc80SyWaLfAmZVHJjo0dtb5SjpqkI+pIFiVOrLfdtiSsUCN3fgb6dZhcAKtoUjELtrSiyAZorOppOxilTzZY5AXRfRYicYEw+gERV3gFXk1vedhpIdHGxOv/JEtni7UyVBARB+YiiYjZbKgZ56Wpqt/UfucFyHia12azSFRgRczmVKaOYshZGR8lx41tzqbatbIHNRpSJDjnj8qt+JwQsYzcueXbvfOJ/Cx2N5jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2gMmcEY4GoO/vOSTfwDrfhl+BxbzNTkv5iuhQk/DQ8=;
 b=iLQyQ7UI5cgz6qFwA707hBGZGKyqouRfWlb6zFciBPOgu04YoCGgLFsOBvxePh1QDy4BQpuaXXmWcar+Dra8whHN8eeiFBXM8QBgAlRbrVZG3r04EsbsL9z7dBneAiUyv9/VJdVV5/R8PdxUayFTcCfFzRAdVFObIgFCWYwQRVtfG8HN1U1vESCZTsODhGZcp/hevj/aY9pVNSF9eZfU4TfzMb+BipU959Hx4SM2VbgVGygAL1nMw05hbyM6GOi7X21RpIkljNlLKvajRhWtmNEK8JQHz7vXOU/CobqgKxNS6AXtt+MUSPHkLaytGuiYnF/xihGZXwIYtS9M2He0kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Thu, 8 Feb
 2024 21:39:59 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::85a8:9b9b:5e2f:9431]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::85a8:9b9b:5e2f:9431%4]) with mapi id 15.20.7249.035; Thu, 8 Feb 2024
 21:39:59 +0000
Content-Type: multipart/alternative;
 boundary="------------Lklo6QW55IyM9GWylivruITq"
Message-ID: <1c3fef48-f59b-440a-bfb7-275fb5f5d57d@intel.com>
Date: Thu, 8 Feb 2024 23:40:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/16] drm/xe/oa/uapi: Define and parse OA stream
 properties
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240208054916.3788133-1-ashutosh.dixit@intel.com>
 <20240208054916.3788133-7-ashutosh.dixit@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20240208054916.3788133-7-ashutosh.dixit@intel.com>
X-ClientProxiedBy: FR5P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::20) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|DS0PR11MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd6bef1-503e-4a7c-f0db-08dc28ee7fc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0+MSJXUPlT7pG1UsWbCmQavSVLSlNG60mMb1nmTRwNpR+P+pbAV8djydT4u8hF4CKiTDVUSDgHrSDMpl6AOmiC/byRMi0hjlUtJ6jEFrDDqxD08V/80G6tq5vCTLJR5jRCuXEGD/k4vUAQFRY63eUZ9nvj6F1VDvavyeEJWzBmQoQDNS9LXH7/H1Zb7I4HLkcR1aGQX8IXznZckm+SKfSpEMGkKBgK+sjXdlxnOyoptI1d6QTliUYKzysyHrDY5D010lou7/bqlL9DS+Bd8RuaRpJu9e5k3M5F1/C0Gj/BkuIIxvZfzwpE1k+tjaohadpmkx0n1B22r3H0d9T3JCluTSvc6Yi8nC2rlYkXI+iHK6CWO6WiSDBzXjlBUcer8jV6ANVGTR69Kq7qxPbvVUBAy/SsRsKMYe/N3i0wvgn6JxgVmJ/5aO18+Ek/TobJIW8xg3EF+thEWtANTl1ZqBqDhnA1MPkVeYpV1Xayx6HAiP7EGgeHUTIcyJkr9jfN+0LYi/xQA1EndqHxWpvCk9YSRJ40RgY48avD44ljSD4CeY6DvLS+uDDrMAp2nlX85E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(39860400002)(366004)(376002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(83380400001)(31686004)(38100700002)(82960400001)(2906002)(41300700001)(316002)(66476007)(66946007)(26005)(66556008)(30864003)(4326008)(8676002)(8936002)(86362001)(31696002)(33964004)(2616005)(36756003)(6512007)(6666004)(6506007)(53546011)(5660300002)(107886003)(478600001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K095aEZCV2lpYU04dEhCWEJhUWFITzI4MG9XZUFXTXRLckdnd2NJcCs2RC91?=
 =?utf-8?B?TllMMzNhNWVYb0M2MWN6anJZTllOa25MOUF6SjhhdFVnOWkxc0s3L3YwNEs4?=
 =?utf-8?B?eGdXenluNGhxaXluVWVpaEtlaE9Uc3BHMTIyZ2w5dzJrVFd5aWs0MThvd3cy?=
 =?utf-8?B?eFN6UlE1eWhUL1JVQ1BSM2Q2aTRUQlVuY1Nja0Y4QXN1OElDWjZ1c1VWajA3?=
 =?utf-8?B?b05Fc1JjZlhIcENYTXgwTUhiL2dKK2lPOTZVUW1HYk8zMUs5UWpuRDBpTnlm?=
 =?utf-8?B?cm95TUdCNW9lNmVnSmFEZnMxYXcyZnc1M0RGQ0lFbWc1UTF2T0VzamZ0TG83?=
 =?utf-8?B?U0hsTzhpdlVwYXdQenhWYTQxZmt5QnZUbGpvQmhwYTJEKzFsVlNVaGlwRTZM?=
 =?utf-8?B?eFE4VHYySjVyNWpyeklGYkZxbTdoL1RoSmo2b3BvaEpuZTZFZkVyYjExb1hH?=
 =?utf-8?B?bDdqN1lGcS9QTUhXMUlyWTVNYmpQM2h3UVVNS1BDZnUwQ0IyS3JCSGptY2o2?=
 =?utf-8?B?cW0zNGFMU3lIUk53L1dNN1k0UVUrT3NmWC8zeFQvN0pqUzFGZmJQanhpRHNh?=
 =?utf-8?B?VUdjR3N4NmF4TXY2L3VwUWx4Mi91Ym8yOG9Mb3RsUnBYUm1FbStoK2luKzN2?=
 =?utf-8?B?RnNZbW5mS1krK09nclVnZ1czMi9yOVZFRnhDOHhibjlMRUJKS0tXbkxvRjVM?=
 =?utf-8?B?U1cxTWxEdi9QTGtRUERqUUtDenp5ZUI4YlhwRzNtbjhrVzNPek9rMWZYc0pN?=
 =?utf-8?B?V2FPT2hjK3JvZGVvbWZ1blVwSEZEdy9Xc01maldFaUUvS2o1MlFIUVpiSk9p?=
 =?utf-8?B?U2ZhbTR4ZGdsSkZDekFkcjhOMFZBR0tuRHBjcUY3U01iS1BReHdvSEpLS1pD?=
 =?utf-8?B?bVdnUkxNcGEreW44UWpuK0NQVDc5R2FPRzNqM3RuUzdVdUh5QTJ1MVNZNGdO?=
 =?utf-8?B?b2N6SDh3N0xrV0FHaDlZMVIvVTMwa2RRMUxKemRXRDhnRG13YWFhOHMyTDE4?=
 =?utf-8?B?Yi9mcUE0bVFicS9aVFhkV2lKdEVKUG9TajgwaUxLZG5SYXBLR2V5TmlhUkIy?=
 =?utf-8?B?Q3VjQ05XbzlIWlY5WU9nWGNHeUdKVWRlaGJxUmY5VGJESzRxQnQ3Ym5kdXlZ?=
 =?utf-8?B?M0lmaE5tRmY5Sk01UlhiQmpxVXJPeTREaXJyUzMyNU44SVIrZFFpWXJlYU5o?=
 =?utf-8?B?T29leHlVRkF3azdTOTZncEsxejRQcmcyVTQ5Y3BWWmFjdEE2c3B0RG4vMU9T?=
 =?utf-8?B?ZklPMUdrb1k5MGZSM0plaDNUU0FMNHFvSzdDeU90SElROWlYVWNIemRPaFFZ?=
 =?utf-8?B?VHZtd2xiajBCS1NwOEtQNDF3NkYzdjh6NXcydWR3cjAvK21kR1JaM0M1OElz?=
 =?utf-8?B?YzNCT2dBa08vdTRzbzZCV2xWSEFWWGxBc1lzWXFHck16Wm1HQVdNdTQ0dmNp?=
 =?utf-8?B?ZzdFdTdJdDZSaDlpcjRQQkpiZnNDODU2SlFkcnIvVi8zRVI2a3E3Z0J3aWwr?=
 =?utf-8?B?ZHdFclZTMmpWVFBTQThEd0VGZFp6Z3FMb3A5c29DdmtvMkRnMEg5ZWwzSFJH?=
 =?utf-8?B?R3U4b2ppV1IrV2dqZ1BtajFwTzhmQkhsNldsMkp4dUFIN294MWN5RW5yZ3g5?=
 =?utf-8?B?YUJFc1UwWUNMeXRqL2JJbkkyVEFUZ2JqdklMenlQWmJ0eGxDY3JqQnZQVlpw?=
 =?utf-8?B?UVZiOFFTNFZwR3BhRFgxbTVNNjN2enlodGtNYWlpb0NVQmRJT0JGRy9QOXMz?=
 =?utf-8?B?RkpRWEg0RTRZeUdMNGZDU1VQUWxaYzk3eVYxSEEvbHNDeWMraFlzQm0yUml5?=
 =?utf-8?B?OWJ5d2FWMlVoMUV4MS9XZTFhUlQwV25ia21qN0dKNXU2VFJDWmZYNmFHc0kz?=
 =?utf-8?B?TFdGQy9aaEVYdXdlaFc3SEFhM2xFOHBNL1lZbXRVTWc4dnJVT1ZXZ2ZmNzdj?=
 =?utf-8?B?WDFWWUZvbUFtY1RZbHhhZDNGcG9GT3dsNGxDT3lNUmJkb2hhVVQ0a29qZ20y?=
 =?utf-8?B?YVJuV0JiQXluRFpKUjZObWpFK2gvaE56SU1MNDRza3p6UFppdy9ka1R6NEor?=
 =?utf-8?B?Y0lXNnV5MlNDUnRYMGFhSCs4TlB3UVdHZHNPNldDNWVvOGxueHRhL3hMMXZ3?=
 =?utf-8?B?bnFKREJIaWp3VUlNVzhNQ1NlUTFpQjBCYzIyRit3ZWMvVnNpOFpxK0syVys0?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd6bef1-503e-4a7c-f0db-08dc28ee7fc0
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 21:39:59.2143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgSS+v0G3BXZrex3dcK66My1TK6ecQ+u+D/gizcRp+zAnAldX8bD3K4q1jVgZZFKO9v062TCcuQegCxwTyPPK1/zBGm6bryX/+332JqJetY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7997
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

--------------Lklo6QW55IyM9GWylivruITq
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 08/02/2024 07:49, Ashutosh Dixit wrote:
> Properties for OA streams are specified by user space, when the stream is
> opened, as a chain of drm_xe_ext_set_property struct's. Parse and validate
> these stream properties.
>
> v2: Remove struct drm_xe_oa_open_param (Harish Chegondi)
>      Drop DRM_XE_OA_PROPERTY_POLL_OA_PERIOD_US (Umesh)
>      Eliminate comparison with xe_oa_max_sample_rate (Umesh)
>      Drop 'struct drm_xe_oa_record_header' (Umesh)
>
> Reviewed-by: Umesh Nerlige Ramappa<umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Ashutosh Dixit<ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_oa.c   | 344 +++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_oa.h   |   6 +
>   drivers/gpu/drm/xe/xe_perf.c |   2 +
>   include/uapi/drm/xe_drm.h    |  70 +++++++
>   4 files changed, 422 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index a62f71244ec15..915dd71454c7c 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -3,10 +3,14 @@
>    * Copyright © 2023 Intel Corporation
>    */
>   
> +#include <linux/nospec.h>
> +
>   #include <drm/xe_drm.h>
>   
> +#include "regs/xe_gt_regs.h"
>   #include "regs/xe_oa_regs.h"
>   #include "xe_device.h"
> +#include "xe_exec_queue.h"
>   #include "xe_gt.h"
>   #include "xe_mmio.h"
>   #include "xe_oa.h"
> @@ -36,6 +40,19 @@ struct xe_oa_config {
>   	struct rcu_head rcu;
>   };
>   
> +struct xe_oa_open_param {
> +	u32 oa_unit_id;
> +	bool sample;
> +	u32 metric_set;
> +	enum xe_oa_format_name oa_format;
> +	int period_exponent;
> +	bool disabled;
> +	int exec_queue_id;
> +	int engine_instance;
> +	struct xe_exec_queue *exec_q;
> +	struct xe_hw_engine *hwe;
> +};
> +
>   #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
>   
>   static const struct xe_oa_format oa_formats[] = {
> @@ -78,6 +95,333 @@ static void xe_oa_config_put(struct xe_oa_config *oa_config)
>   	kref_put(&oa_config->ref, xe_oa_config_release);
>   }
>   
> +/*
> + * OA timestamp frequency = CS timestamp frequency in most platforms. On some
> + * platforms OA unit ignores the CTC_SHIFT and the 2 timestamps differ. In such
> + * cases, return the adjusted CS timestamp frequency to the user.
> + */
> +u32 xe_oa_timestamp_frequency(struct xe_gt *gt)
> +{
> +	u32 reg, shift;
> +
> +	/*
> +	 * Wa_18013179988:dg2
> +	 * Wa_14015568240:pvc
> +	 * Wa_14015846243:mtl
> +	 */
> +	switch (gt_to_xe(gt)->info.platform) {
> +	case XE_DG2:
> +	case XE_PVC:
> +	case XE_METEORLAKE:
> +		xe_device_mem_access_get(gt_to_xe(gt));
> +		reg = xe_mmio_read32(gt, RPM_CONFIG0);
> +		xe_device_mem_access_put(gt_to_xe(gt));
> +
> +		shift = REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
> +		return gt->info.reference_clock << (3 - shift);
> +
> +	default:
> +		return gt->info.reference_clock;
> +	}
> +}
> +
> +static u64 oa_exponent_to_ns(struct xe_gt *gt, int exponent)
> +{
> +	u64 nom = (2ULL << exponent) * NSEC_PER_SEC;
> +	u32 den = xe_oa_timestamp_frequency(gt);
> +
> +	return div_u64(nom + den - 1, den);
> +}
> +
> +static bool engine_supports_oa_format(const struct xe_hw_engine *hwe, int type)
> +{
> +	switch (hwe->oa_unit->type) {
> +	case DRM_XE_OA_UNIT_TYPE_OAG:
> +		return type == DRM_XE_OA_FMT_TYPE_OAG || type == DRM_XE_OA_FMT_TYPE_OAR ||
> +			type == DRM_XE_OA_FMT_TYPE_OAC || type == DRM_XE_OA_FMT_TYPE_PEC;
> +	case DRM_XE_OA_UNIT_TYPE_OAM:
> +		return type == DRM_XE_OA_FMT_TYPE_OAM || type == DRM_XE_OA_FMT_TYPE_OAM_MPEC;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static int decode_oa_format(struct xe_oa *oa, u64 fmt, enum xe_oa_format_name *name)
> +{
> +	u32 counter_size = FIELD_GET(DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE, fmt);
> +	u32 counter_sel = FIELD_GET(DRM_XE_OA_FORMAT_MASK_COUNTER_SEL, fmt);
> +	u32 bc_report = FIELD_GET(DRM_XE_OA_FORMAT_MASK_BC_REPORT, fmt);
> +	u32 type = FIELD_GET(DRM_XE_OA_FORMAT_MASK_FMT_TYPE, fmt);
> +	int idx;
> +
> +	for_each_set_bit(idx, oa->format_mask, XE_OA_FORMAT_MAX) {
> +		const struct xe_oa_format *f = &oa->oa_formats[idx];
> +
> +		if (counter_size == f->counter_size && bc_report == f->bc_report &&
> +		    type == f->type && counter_sel == f->counter_select) {
> +			*name = idx;
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +u16 xe_oa_unit_id(struct xe_hw_engine *hwe)
> +{
> +	return hwe->oa_unit && hwe->oa_unit->num_engines ?
> +		hwe->oa_unit->oa_unit_id : U16_MAX;
> +}
> +
> +static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_param *param)
> +{
> +	struct xe_gt *gt;
> +	int i, ret = 0;
> +
> +	if (param->exec_q) {
> +		/* When we have an exec_q, get hwe from the exec_q */
> +		param->hwe = xe_gt_hw_engine(param->exec_q->gt, param->exec_q->class,
> +					     param->engine_instance, true);
> +	} else {
> +		struct xe_hw_engine *hwe;
> +		enum xe_hw_engine_id id;
> +
> +		/* Else just get the first hwe attached to the oa unit */
> +		for_each_gt(gt, oa->xe, i) {
> +			for_each_hw_engine(hwe, gt, id) {
> +				if (xe_oa_unit_id(hwe) == param->oa_unit_id) {
> +					param->hwe = hwe;
> +					goto out;
> +				}
> +			}
> +		}
> +	}
> +out:
> +	if (!param->hwe || xe_oa_unit_id(param->hwe) != param->oa_unit_id) {
> +		drm_dbg(&oa->xe->drm, "Unable to find hwe (%d, %d) for OA unit ID %d\n",
> +			param->exec_q ? param->exec_q->class : -1,
> +			param->engine_instance, param->oa_unit_id);
> +		ret = -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static int xe_oa_set_prop_oa_unit_id(struct xe_oa *oa, u64 value,
> +				     struct xe_oa_open_param *param)
> +{
> +	if (value >= oa->oa_unit_ids) {
> +		drm_dbg(&oa->xe->drm, "OA unit ID out of range %lld\n", value);
> +		return -EINVAL;
> +	}
> +	param->oa_unit_id = value;
> +	return 0;
> +}
> +
> +static int xe_oa_set_prop_sample_oa(struct xe_oa *oa, u64 value,
> +				    struct xe_oa_open_param *param)
> +{
> +	param->sample = value;
> +	return 0;
> +}
> +
> +static int xe_oa_set_prop_metric_set(struct xe_oa *oa, u64 value,
> +				     struct xe_oa_open_param *param)
> +{
> +	param->metric_set = value;
> +	return 0;
> +}
> +
> +static int xe_oa_set_prop_oa_format(struct xe_oa *oa, u64 value,
> +				    struct xe_oa_open_param *param)
> +{
> +	int ret = decode_oa_format(oa, value, &param->oa_format);
> +
> +	if (ret) {
> +		drm_dbg(&oa->xe->drm, "Unsupported OA report format %#llx\n", value);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static int xe_oa_set_prop_oa_exponent(struct xe_oa *oa, u64 value,
> +				      struct xe_oa_open_param *param)
> +{
> +#define OA_EXPONENT_MAX 31
> +
> +	if (value > OA_EXPONENT_MAX) {
> +		drm_dbg(&oa->xe->drm, "OA timer exponent too high (> %u)\n", OA_EXPONENT_MAX);
> +		return -EINVAL;
> +	}
> +	param->period_exponent = value;
> +	return 0;
> +}
> +
> +static int xe_oa_set_prop_disabled(struct xe_oa *oa, u64 value,
> +				   struct xe_oa_open_param *param)
> +{
> +	param->disabled = value;
> +	return 0;
> +}
> +
> +static int xe_oa_set_prop_exec_queue_id(struct xe_oa *oa, u64 value,
> +					struct xe_oa_open_param *param)
> +{
> +	param->exec_queue_id = value;
> +	return 0;
> +}
> +
> +static int xe_oa_set_prop_engine_instance(struct xe_oa *oa, u64 value,
> +					  struct xe_oa_open_param *param)
> +{
> +	param->engine_instance = value;
> +	return 0;
> +}
> +
> +typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
> +				     struct xe_oa_open_param *param);
> +static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
> +	[DRM_XE_OA_PROPERTY_OA_UNIT_ID] = xe_oa_set_prop_oa_unit_id,
> +	[DRM_XE_OA_PROPERTY_SAMPLE_OA] = xe_oa_set_prop_sample_oa,
> +	[DRM_XE_OA_PROPERTY_OA_METRIC_SET] = xe_oa_set_prop_metric_set,
> +	[DRM_XE_OA_PROPERTY_OA_FORMAT] = xe_oa_set_prop_oa_format,
> +	[DRM_XE_OA_PROPERTY_OA_EXPONENT] = xe_oa_set_prop_oa_exponent,
> +	[DRM_XE_OA_PROPERTY_OA_DISABLED] = xe_oa_set_prop_disabled,
> +	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] = xe_oa_set_prop_exec_queue_id,
> +	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] = xe_oa_set_prop_engine_instance,
> +};
> +
> +static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
> +				       struct xe_oa_open_param *param)
> +{
> +	u64 __user *address = u64_to_user_ptr(extension);
> +	struct drm_xe_ext_set_property ext;
> +	int err;
> +	u32 idx;
> +
> +	err = __copy_from_user(&ext, address, sizeof(ext));
> +	if (XE_IOCTL_DBG(oa->xe, err))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(oa->xe, ext.property >= ARRAY_SIZE(xe_oa_set_property_funcs)) ||
> +	    XE_IOCTL_DBG(oa->xe, ext.pad))
> +		return -EINVAL;
> +
> +	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_oa_set_property_funcs));
> +	return xe_oa_set_property_funcs[idx](oa, ext.value, param);
> +}
> +
> +typedef int (*xe_oa_user_extension_fn)(struct xe_oa *oa, u64 extension,
> +				       struct xe_oa_open_param *param);
> +static const xe_oa_user_extension_fn xe_oa_user_extension_funcs[] = {
> +	[DRM_XE_OA_EXTENSION_SET_PROPERTY] = xe_oa_user_ext_set_property,
> +};
> +
> +static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number,
> +				 struct xe_oa_open_param *param)
> +{
> +	u64 __user *address = u64_to_user_ptr(extension);
> +	struct drm_xe_user_extension ext;
> +	int err;
> +	u32 idx;
> +
> +	if (XE_IOCTL_DBG(oa->xe, ext_number >= DRM_XE_OA_PROPERTY_MAX))
> +		return -E2BIG;
> +
> +	err = __copy_from_user(&ext, address, sizeof(ext));
> +	if (XE_IOCTL_DBG(oa->xe, err))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(oa->xe, ext.pad) ||
> +	    XE_IOCTL_DBG(oa->xe, ext.name >= ARRAY_SIZE(xe_oa_user_extension_funcs)))
> +		return -EINVAL;
> +
> +	idx = array_index_nospec(ext.name, ARRAY_SIZE(xe_oa_user_extension_funcs));
> +	err = xe_oa_user_extension_funcs[idx](oa, extension, param);
> +	if (XE_IOCTL_DBG(oa->xe, err))
> +		return err;
> +
> +	if (ext.next_extension)
> +		return xe_oa_user_extensions(oa, ext.next_extension, ++ext_number, param);
> +
> +	return 0;
> +}
> +
> +int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct xe_oa *oa = &to_xe_device(dev)->oa;
> +	struct xe_file *xef = to_xe_file(file);
> +	struct xe_oa_open_param param = {};
> +	const struct xe_oa_format *f;
> +	bool privileged_op = true;
> +	int ret;
> +
> +	if (!oa->xe) {
> +		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = xe_oa_user_extensions(oa, (u64)data, 0, &param);
> +	if (ret)
> +		return ret;
> +
> +	if (param.exec_queue_id > 0) {
> +		param.exec_q = xe_exec_queue_lookup(xef, param.exec_queue_id);
> +		if (XE_IOCTL_DBG(oa->xe, !param.exec_q))
> +			return -ENOENT;
> +	}
> +
> +	/*
> +	 * Query based sampling (using MI_REPORT_PERF_COUNT) with OAR/OAC,
> +	 * without global stream access, can be an unprivileged operation
> +	 */
> +	if (param.exec_q && !param.sample)
> +		privileged_op = false;
> +
> +	if (privileged_op && xe_perf_stream_paranoid && !perfmon_capable()) {
> +		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe perf stream\n");
> +		ret = -EACCES;
> +		goto err_exec_q;
> +	}
> +
> +	if (!param.exec_q && !param.sample) {
> +		drm_dbg(&oa->xe->drm, "Only OA report sampling supported\n");
> +		ret = -EINVAL;
> +		goto err_exec_q;
> +	}
> +
> +	ret = xe_oa_assign_hwe(oa, &param);
> +	if (ret)
> +		goto err_exec_q;
> +
> +	f = &oa->oa_formats[param.oa_format];
> +	if (!param.oa_format || !f->size ||
> +	    !engine_supports_oa_format(param.hwe, f->type)) {
> +		drm_dbg(&oa->xe->drm, "Invalid OA format %d type %d size %d for class %d\n",
> +			param.oa_format, f->type, f->size, param.hwe->class);
> +		ret = -EINVAL;
> +		goto err_exec_q;
> +	}
> +
> +	if (param.period_exponent > 0) {
> +		u64 oa_period, oa_freq_hz;
> +
> +		/* Requesting samples from OAG buffer is a privileged operation */
> +		if (!param.sample) {
> +			drm_dbg(&oa->xe->drm, "OA_EXPONENT specified without SAMPLE_OA\n");
> +			ret = -EINVAL;
> +			goto err_exec_q;
> +		}
> +		oa_period = oa_exponent_to_ns(param.hwe->gt, param.period_exponent);
> +		oa_freq_hz = div64_u64(NSEC_PER_SEC, oa_period);
> +		drm_dbg(&oa->xe->drm, "Using periodic sampling freq %lld Hz\n", oa_freq_hz);
> +	}
> +err_exec_q:
> +	if (ret < 0 && param.exec_q)
> +		xe_exec_queue_put(param.exec_q);
> +	return ret;
> +}
> +
>   static bool xe_oa_is_valid_flex_addr(struct xe_oa *oa, u32 addr)
>   {
>   	static const struct xe_reg flex_eu_regs[] = {
> diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
> index 4a4e3b2b70fcd..6308aa1829bd7 100644
> --- a/drivers/gpu/drm/xe/xe_oa.h
> +++ b/drivers/gpu/drm/xe/xe_oa.h
> @@ -11,14 +11,20 @@
>   struct drm_device;
>   struct drm_file;
>   struct xe_device;
> +struct xe_gt;
> +struct xe_hw_engine;
>   
>   int xe_oa_init(struct xe_device *xe);
>   void xe_oa_fini(struct xe_device *xe);
>   void xe_oa_register(struct xe_device *xe);
>   void xe_oa_unregister(struct xe_device *xe);
> +int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
> +			    struct drm_file *file);
>   int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
>   			   struct drm_file *file);
>   int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
>   			      struct drm_file *file);
> +u32 xe_oa_timestamp_frequency(struct xe_gt *gt);
> +u16 xe_oa_unit_id(struct xe_hw_engine *hwe);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
> index 2aee4c7989486..2c0615481b7df 100644
> --- a/drivers/gpu/drm/xe/xe_perf.c
> +++ b/drivers/gpu/drm/xe/xe_perf.c
> @@ -16,6 +16,8 @@ static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_perf_param *arg,
>   		       struct drm_file *file)
>   {
>   	switch (arg->perf_op) {
> +	case DRM_XE_PERF_OP_STREAM_OPEN:
> +		return xe_oa_stream_open_ioctl(dev, (void *)arg->param, file);
>   	case DRM_XE_PERF_OP_ADD_CONFIG:
>   		return xe_oa_add_config_ioctl(dev, (void *)arg->param, file);
>   	case DRM_XE_PERF_OP_REMOVE_CONFIG:
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 0632ebf209c35..502302f3c2c73 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1421,6 +1421,76 @@ enum drm_xe_oa_format_type {
>   	DRM_XE_OA_FMT_TYPE_PEC,
>   };
>   
> +/**
> + * enum drm_xe_oa_property_id - OA stream property id's
> + *
> + * Stream params are specified as a chain of @drm_xe_ext_set_property
> + * struct's, with @property values from enum @drm_xe_oa_property_id and
> + * @drm_xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY.
> + * @param field in struct @drm_xe_perf_param points to the first
> + * @drm_xe_ext_set_property struct.
> + */
> +enum drm_xe_oa_property_id {
> +#define DRM_XE_OA_EXTENSION_SET_PROPERTY	0
> +	/**
> +	 * @DRM_XE_OA_PROPERTY_OA_UNIT_ID: ID of the OA unit on which to open
> +	 * the OA stream, see @oa_unit_id in 'struct
> +	 * drm_xe_query_oa_units'. Defaults to 0 if not provided.
> +	 */
> +	DRM_XE_OA_PROPERTY_OA_UNIT_ID = 1,
> +
> +	/**
> +	 * @DRM_XE_OA_PROPERTY_SAMPLE_OA: A value of 1 requests inclusion of raw
> +	 * OA unit reports or stream samples in a global buffer attached to an
> +	 * OA unit.
> +	 */
> +	DRM_XE_OA_PROPERTY_SAMPLE_OA,
> +
> +	/**
> +	 * @DRM_XE_OA_PROPERTY_OA_METRIC_SET: OA metrics defining contents of OA
> +	 * reports, previously added via @DRM_XE_PERF_OP_ADD_CONFIG.
> +	 */
> +	DRM_XE_OA_PROPERTY_OA_METRIC_SET,
> +
> +	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: Perf counter report format */
> +	DRM_XE_OA_PROPERTY_OA_FORMAT,
> +	/**
> +	 * OA_FORMAT's are specified the same way as in Bspec, in terms of
> +	 * the following quantities: a. enum @drm_xe_oa_format_type
> +	 * b. Counter select c. Counter size and d. BC report
> +	 */
> +#define DRM_XE_OA_FORMAT_MASK_FMT_TYPE		(0xff << 0)
> +#define DRM_XE_OA_FORMAT_MASK_COUNTER_SEL	(0xff << 8)
> +#define DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE	(0xff << 16)
> +#define DRM_XE_OA_FORMAT_MASK_BC_REPORT		(0xff << 24)


People outside of Intel don't have access to the BSpec.

And since there is no page number either, it would just be easier for 
everybody to say :

      "Refer to the oa_formats array in drivers/gpu/drm/xe/xe_oa.c"


-Lionel


> +
> +	/**
> +	 * @DRM_XE_OA_PROPERTY_OA_EXPONENT: Requests periodic OA unit sampling
> +	 * with sampling frequency proportional to 2^(period_exponent + 1)
> +	 */
> +	DRM_XE_OA_PROPERTY_OA_EXPONENT,
> +
> +	/**
> +	 * @DRM_XE_OA_PROPERTY_OA_DISABLED: A value of 1 will open the OA
> +	 * stream in a DISABLED state (see @DRM_XE_PERF_IOCTL_ENABLE).
> +	 */
> +	DRM_XE_OA_PROPERTY_OA_DISABLED,
> +
> +	/**
> +	 * @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID: Open the stream for a specific
> +	 * @exec_queue_id. Perf queries can be executed on this exec queue.
> +	 */
> +	DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID,
> +
> +	/**
> +	 * @DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE: Optional engine instance to
> +	 * pass along with @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will default to 0.
> +	 */
> +	DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
> +
> +	DRM_XE_OA_PROPERTY_MAX /* non-ABI */
> +};
> +
>   /**
>    * struct drm_xe_oa_config - OA metric configuration
>    *


--------------Lklo6QW55IyM9GWylivruITq
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 08/02/2024 07:49, Ashutosh Dixit
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240208054916.3788133-7-ashutosh.dixit@intel.com">
      <pre class="moz-quote-pre" wrap="">Properties for OA streams are specified by user space, when the stream is
opened, as a chain of drm_xe_ext_set_property struct's. Parse and validate
these stream properties.

v2: Remove struct drm_xe_oa_open_param (Harish Chegondi)
    Drop DRM_XE_OA_PROPERTY_POLL_OA_PERIOD_US (Umesh)
    Eliminate comparison with xe_oa_max_sample_rate (Umesh)
    Drop 'struct drm_xe_oa_record_header' (Umesh)

Reviewed-by: Umesh Nerlige Ramappa <a class="moz-txt-link-rfc2396E" href="mailto:umesh.nerlige.ramappa@intel.com">&lt;umesh.nerlige.ramappa@intel.com&gt;</a>
Signed-off-by: Ashutosh Dixit <a class="moz-txt-link-rfc2396E" href="mailto:ashutosh.dixit@intel.com">&lt;ashutosh.dixit@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_oa.c   | 344 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_oa.h   |   6 +
 drivers/gpu/drm/xe/xe_perf.c |   2 +
 include/uapi/drm/xe_drm.h    |  70 +++++++
 4 files changed, 422 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a62f71244ec15..915dd71454c7c 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -3,10 +3,14 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include &lt;linux/nospec.h&gt;
+
 #include &lt;drm/xe_drm.h&gt;
 
+#include &quot;regs/xe_gt_regs.h&quot;
 #include &quot;regs/xe_oa_regs.h&quot;
 #include &quot;xe_device.h&quot;
+#include &quot;xe_exec_queue.h&quot;
 #include &quot;xe_gt.h&quot;
 #include &quot;xe_mmio.h&quot;
 #include &quot;xe_oa.h&quot;
@@ -36,6 +40,19 @@ struct xe_oa_config {
 	struct rcu_head rcu;
 };
 
+struct xe_oa_open_param {
+	u32 oa_unit_id;
+	bool sample;
+	u32 metric_set;
+	enum xe_oa_format_name oa_format;
+	int period_exponent;
+	bool disabled;
+	int exec_queue_id;
+	int engine_instance;
+	struct xe_exec_queue *exec_q;
+	struct xe_hw_engine *hwe;
+};
+
 #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
 
 static const struct xe_oa_format oa_formats[] = {
@@ -78,6 +95,333 @@ static void xe_oa_config_put(struct xe_oa_config *oa_config)
 	kref_put(&amp;oa_config-&gt;ref, xe_oa_config_release);
 }
 
+/*
+ * OA timestamp frequency = CS timestamp frequency in most platforms. On some
+ * platforms OA unit ignores the CTC_SHIFT and the 2 timestamps differ. In such
+ * cases, return the adjusted CS timestamp frequency to the user.
+ */
+u32 xe_oa_timestamp_frequency(struct xe_gt *gt)
+{
+	u32 reg, shift;
+
+	/*
+	 * Wa_18013179988:dg2
+	 * Wa_14015568240:pvc
+	 * Wa_14015846243:mtl
+	 */
+	switch (gt_to_xe(gt)-&gt;info.platform) {
+	case XE_DG2:
+	case XE_PVC:
+	case XE_METEORLAKE:
+		xe_device_mem_access_get(gt_to_xe(gt));
+		reg = xe_mmio_read32(gt, RPM_CONFIG0);
+		xe_device_mem_access_put(gt_to_xe(gt));
+
+		shift = REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
+		return gt-&gt;info.reference_clock &lt;&lt; (3 - shift);
+
+	default:
+		return gt-&gt;info.reference_clock;
+	}
+}
+
+static u64 oa_exponent_to_ns(struct xe_gt *gt, int exponent)
+{
+	u64 nom = (2ULL &lt;&lt; exponent) * NSEC_PER_SEC;
+	u32 den = xe_oa_timestamp_frequency(gt);
+
+	return div_u64(nom + den - 1, den);
+}
+
+static bool engine_supports_oa_format(const struct xe_hw_engine *hwe, int type)
+{
+	switch (hwe-&gt;oa_unit-&gt;type) {
+	case DRM_XE_OA_UNIT_TYPE_OAG:
+		return type == DRM_XE_OA_FMT_TYPE_OAG || type == DRM_XE_OA_FMT_TYPE_OAR ||
+			type == DRM_XE_OA_FMT_TYPE_OAC || type == DRM_XE_OA_FMT_TYPE_PEC;
+	case DRM_XE_OA_UNIT_TYPE_OAM:
+		return type == DRM_XE_OA_FMT_TYPE_OAM || type == DRM_XE_OA_FMT_TYPE_OAM_MPEC;
+	default:
+		return false;
+	}
+}
+
+static int decode_oa_format(struct xe_oa *oa, u64 fmt, enum xe_oa_format_name *name)
+{
+	u32 counter_size = FIELD_GET(DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE, fmt);
+	u32 counter_sel = FIELD_GET(DRM_XE_OA_FORMAT_MASK_COUNTER_SEL, fmt);
+	u32 bc_report = FIELD_GET(DRM_XE_OA_FORMAT_MASK_BC_REPORT, fmt);
+	u32 type = FIELD_GET(DRM_XE_OA_FORMAT_MASK_FMT_TYPE, fmt);
+	int idx;
+
+	for_each_set_bit(idx, oa-&gt;format_mask, XE_OA_FORMAT_MAX) {
+		const struct xe_oa_format *f = &amp;oa-&gt;oa_formats[idx];
+
+		if (counter_size == f-&gt;counter_size &amp;&amp; bc_report == f-&gt;bc_report &amp;&amp;
+		    type == f-&gt;type &amp;&amp; counter_sel == f-&gt;counter_select) {
+			*name = idx;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+u16 xe_oa_unit_id(struct xe_hw_engine *hwe)
+{
+	return hwe-&gt;oa_unit &amp;&amp; hwe-&gt;oa_unit-&gt;num_engines ?
+		hwe-&gt;oa_unit-&gt;oa_unit_id : U16_MAX;
+}
+
+static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_param *param)
+{
+	struct xe_gt *gt;
+	int i, ret = 0;
+
+	if (param-&gt;exec_q) {
+		/* When we have an exec_q, get hwe from the exec_q */
+		param-&gt;hwe = xe_gt_hw_engine(param-&gt;exec_q-&gt;gt, param-&gt;exec_q-&gt;class,
+					     param-&gt;engine_instance, true);
+	} else {
+		struct xe_hw_engine *hwe;
+		enum xe_hw_engine_id id;
+
+		/* Else just get the first hwe attached to the oa unit */
+		for_each_gt(gt, oa-&gt;xe, i) {
+			for_each_hw_engine(hwe, gt, id) {
+				if (xe_oa_unit_id(hwe) == param-&gt;oa_unit_id) {
+					param-&gt;hwe = hwe;
+					goto out;
+				}
+			}
+		}
+	}
+out:
+	if (!param-&gt;hwe || xe_oa_unit_id(param-&gt;hwe) != param-&gt;oa_unit_id) {
+		drm_dbg(&amp;oa-&gt;xe-&gt;drm, &quot;Unable to find hwe (%d, %d) for OA unit ID %d\n&quot;,
+			param-&gt;exec_q ? param-&gt;exec_q-&gt;class : -1,
+			param-&gt;engine_instance, param-&gt;oa_unit_id);
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int xe_oa_set_prop_oa_unit_id(struct xe_oa *oa, u64 value,
+				     struct xe_oa_open_param *param)
+{
+	if (value &gt;= oa-&gt;oa_unit_ids) {
+		drm_dbg(&amp;oa-&gt;xe-&gt;drm, &quot;OA unit ID out of range %lld\n&quot;, value);
+		return -EINVAL;
+	}
+	param-&gt;oa_unit_id = value;
+	return 0;
+}
+
+static int xe_oa_set_prop_sample_oa(struct xe_oa *oa, u64 value,
+				    struct xe_oa_open_param *param)
+{
+	param-&gt;sample = value;
+	return 0;
+}
+
+static int xe_oa_set_prop_metric_set(struct xe_oa *oa, u64 value,
+				     struct xe_oa_open_param *param)
+{
+	param-&gt;metric_set = value;
+	return 0;
+}
+
+static int xe_oa_set_prop_oa_format(struct xe_oa *oa, u64 value,
+				    struct xe_oa_open_param *param)
+{
+	int ret = decode_oa_format(oa, value, &amp;param-&gt;oa_format);
+
+	if (ret) {
+		drm_dbg(&amp;oa-&gt;xe-&gt;drm, &quot;Unsupported OA report format %#llx\n&quot;, value);
+		return ret;
+	}
+	return 0;
+}
+
+static int xe_oa_set_prop_oa_exponent(struct xe_oa *oa, u64 value,
+				      struct xe_oa_open_param *param)
+{
+#define OA_EXPONENT_MAX 31
+
+	if (value &gt; OA_EXPONENT_MAX) {
+		drm_dbg(&amp;oa-&gt;xe-&gt;drm, &quot;OA timer exponent too high (&gt; %u)\n&quot;, OA_EXPONENT_MAX);
+		return -EINVAL;
+	}
+	param-&gt;period_exponent = value;
+	return 0;
+}
+
+static int xe_oa_set_prop_disabled(struct xe_oa *oa, u64 value,
+				   struct xe_oa_open_param *param)
+{
+	param-&gt;disabled = value;
+	return 0;
+}
+
+static int xe_oa_set_prop_exec_queue_id(struct xe_oa *oa, u64 value,
+					struct xe_oa_open_param *param)
+{
+	param-&gt;exec_queue_id = value;
+	return 0;
+}
+
+static int xe_oa_set_prop_engine_instance(struct xe_oa *oa, u64 value,
+					  struct xe_oa_open_param *param)
+{
+	param-&gt;engine_instance = value;
+	return 0;
+}
+
+typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
+				     struct xe_oa_open_param *param);
+static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
+	[DRM_XE_OA_PROPERTY_OA_UNIT_ID] = xe_oa_set_prop_oa_unit_id,
+	[DRM_XE_OA_PROPERTY_SAMPLE_OA] = xe_oa_set_prop_sample_oa,
+	[DRM_XE_OA_PROPERTY_OA_METRIC_SET] = xe_oa_set_prop_metric_set,
+	[DRM_XE_OA_PROPERTY_OA_FORMAT] = xe_oa_set_prop_oa_format,
+	[DRM_XE_OA_PROPERTY_OA_EXPONENT] = xe_oa_set_prop_oa_exponent,
+	[DRM_XE_OA_PROPERTY_OA_DISABLED] = xe_oa_set_prop_disabled,
+	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] = xe_oa_set_prop_exec_queue_id,
+	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] = xe_oa_set_prop_engine_instance,
+};
+
+static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
+				       struct xe_oa_open_param *param)
+{
+	u64 __user *address = u64_to_user_ptr(extension);
+	struct drm_xe_ext_set_property ext;
+	int err;
+	u32 idx;
+
+	err = __copy_from_user(&amp;ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(oa-&gt;xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(oa-&gt;xe, ext.property &gt;= ARRAY_SIZE(xe_oa_set_property_funcs)) ||
+	    XE_IOCTL_DBG(oa-&gt;xe, ext.pad))
+		return -EINVAL;
+
+	idx = array_index_nospec(ext.property, ARRAY_SIZE(xe_oa_set_property_funcs));
+	return xe_oa_set_property_funcs[idx](oa, ext.value, param);
+}
+
+typedef int (*xe_oa_user_extension_fn)(struct xe_oa *oa, u64 extension,
+				       struct xe_oa_open_param *param);
+static const xe_oa_user_extension_fn xe_oa_user_extension_funcs[] = {
+	[DRM_XE_OA_EXTENSION_SET_PROPERTY] = xe_oa_user_ext_set_property,
+};
+
+static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number,
+				 struct xe_oa_open_param *param)
+{
+	u64 __user *address = u64_to_user_ptr(extension);
+	struct drm_xe_user_extension ext;
+	int err;
+	u32 idx;
+
+	if (XE_IOCTL_DBG(oa-&gt;xe, ext_number &gt;= DRM_XE_OA_PROPERTY_MAX))
+		return -E2BIG;
+
+	err = __copy_from_user(&amp;ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(oa-&gt;xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(oa-&gt;xe, ext.pad) ||
+	    XE_IOCTL_DBG(oa-&gt;xe, ext.name &gt;= ARRAY_SIZE(xe_oa_user_extension_funcs)))
+		return -EINVAL;
+
+	idx = array_index_nospec(ext.name, ARRAY_SIZE(xe_oa_user_extension_funcs));
+	err = xe_oa_user_extension_funcs[idx](oa, extension, param);
+	if (XE_IOCTL_DBG(oa-&gt;xe, err))
+		return err;
+
+	if (ext.next_extension)
+		return xe_oa_user_extensions(oa, ext.next_extension, ++ext_number, param);
+
+	return 0;
+}
+
+int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct xe_oa *oa = &amp;to_xe_device(dev)-&gt;oa;
+	struct xe_file *xef = to_xe_file(file);
+	struct xe_oa_open_param param = {};
+	const struct xe_oa_format *f;
+	bool privileged_op = true;
+	int ret;
+
+	if (!oa-&gt;xe) {
+		drm_dbg(&amp;oa-&gt;xe-&gt;drm, &quot;xe oa interface not available for this system\n&quot;);
+		return -ENODEV;
+	}
+
+	ret = xe_oa_user_extensions(oa, (u64)data, 0, &amp;param);
+	if (ret)
+		return ret;
+
+	if (param.exec_queue_id &gt; 0) {
+		param.exec_q = xe_exec_queue_lookup(xef, param.exec_queue_id);
+		if (XE_IOCTL_DBG(oa-&gt;xe, !param.exec_q))
+			return -ENOENT;
+	}
+
+	/*
+	 * Query based sampling (using MI_REPORT_PERF_COUNT) with OAR/OAC,
+	 * without global stream access, can be an unprivileged operation
+	 */
+	if (param.exec_q &amp;&amp; !param.sample)
+		privileged_op = false;
+
+	if (privileged_op &amp;&amp; xe_perf_stream_paranoid &amp;&amp; !perfmon_capable()) {
+		drm_dbg(&amp;oa-&gt;xe-&gt;drm, &quot;Insufficient privileges to open xe perf stream\n&quot;);
+		ret = -EACCES;
+		goto err_exec_q;
+	}
+
+	if (!param.exec_q &amp;&amp; !param.sample) {
+		drm_dbg(&amp;oa-&gt;xe-&gt;drm, &quot;Only OA report sampling supported\n&quot;);
+		ret = -EINVAL;
+		goto err_exec_q;
+	}
+
+	ret = xe_oa_assign_hwe(oa, &amp;param);
+	if (ret)
+		goto err_exec_q;
+
+	f = &amp;oa-&gt;oa_formats[param.oa_format];
+	if (!param.oa_format || !f-&gt;size ||
+	    !engine_supports_oa_format(param.hwe, f-&gt;type)) {
+		drm_dbg(&amp;oa-&gt;xe-&gt;drm, &quot;Invalid OA format %d type %d size %d for class %d\n&quot;,
+			param.oa_format, f-&gt;type, f-&gt;size, param.hwe-&gt;class);
+		ret = -EINVAL;
+		goto err_exec_q;
+	}
+
+	if (param.period_exponent &gt; 0) {
+		u64 oa_period, oa_freq_hz;
+
+		/* Requesting samples from OAG buffer is a privileged operation */
+		if (!param.sample) {
+			drm_dbg(&amp;oa-&gt;xe-&gt;drm, &quot;OA_EXPONENT specified without SAMPLE_OA\n&quot;);
+			ret = -EINVAL;
+			goto err_exec_q;
+		}
+		oa_period = oa_exponent_to_ns(param.hwe-&gt;gt, param.period_exponent);
+		oa_freq_hz = div64_u64(NSEC_PER_SEC, oa_period);
+		drm_dbg(&amp;oa-&gt;xe-&gt;drm, &quot;Using periodic sampling freq %lld Hz\n&quot;, oa_freq_hz);
+	}
+err_exec_q:
+	if (ret &lt; 0 &amp;&amp; param.exec_q)
+		xe_exec_queue_put(param.exec_q);
+	return ret;
+}
+
 static bool xe_oa_is_valid_flex_addr(struct xe_oa *oa, u32 addr)
 {
 	static const struct xe_reg flex_eu_regs[] = {
diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
index 4a4e3b2b70fcd..6308aa1829bd7 100644
--- a/drivers/gpu/drm/xe/xe_oa.h
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -11,14 +11,20 @@
 struct drm_device;
 struct drm_file;
 struct xe_device;
+struct xe_gt;
+struct xe_hw_engine;
 
 int xe_oa_init(struct xe_device *xe);
 void xe_oa_fini(struct xe_device *xe);
 void xe_oa_register(struct xe_device *xe);
 void xe_oa_unregister(struct xe_device *xe);
+int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data,
+			    struct drm_file *file);
 int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
 			   struct drm_file *file);
 int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
 			      struct drm_file *file);
+u32 xe_oa_timestamp_frequency(struct xe_gt *gt);
+u16 xe_oa_unit_id(struct xe_hw_engine *hwe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
index 2aee4c7989486..2c0615481b7df 100644
--- a/drivers/gpu/drm/xe/xe_perf.c
+++ b/drivers/gpu/drm/xe/xe_perf.c
@@ -16,6 +16,8 @@ static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_perf_param *arg,
 		       struct drm_file *file)
 {
 	switch (arg-&gt;perf_op) {
+	case DRM_XE_PERF_OP_STREAM_OPEN:
+		return xe_oa_stream_open_ioctl(dev, (void *)arg-&gt;param, file);
 	case DRM_XE_PERF_OP_ADD_CONFIG:
 		return xe_oa_add_config_ioctl(dev, (void *)arg-&gt;param, file);
 	case DRM_XE_PERF_OP_REMOVE_CONFIG:
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 0632ebf209c35..502302f3c2c73 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1421,6 +1421,76 @@ enum drm_xe_oa_format_type {
 	DRM_XE_OA_FMT_TYPE_PEC,
 };
 
+/**
+ * enum drm_xe_oa_property_id - OA stream property id's
+ *
+ * Stream params are specified as a chain of @drm_xe_ext_set_property
+ * struct's, with @property values from enum @drm_xe_oa_property_id and
+ * @drm_xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY.
+ * @param field in struct @drm_xe_perf_param points to the first
+ * @drm_xe_ext_set_property struct.
+ */
+enum drm_xe_oa_property_id {
+#define DRM_XE_OA_EXTENSION_SET_PROPERTY	0
+	/**
+	 * @DRM_XE_OA_PROPERTY_OA_UNIT_ID: ID of the OA unit on which to open
+	 * the OA stream, see @oa_unit_id in 'struct
+	 * drm_xe_query_oa_units'. Defaults to 0 if not provided.
+	 */
+	DRM_XE_OA_PROPERTY_OA_UNIT_ID = 1,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_SAMPLE_OA: A value of 1 requests inclusion of raw
+	 * OA unit reports or stream samples in a global buffer attached to an
+	 * OA unit.
+	 */
+	DRM_XE_OA_PROPERTY_SAMPLE_OA,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_OA_METRIC_SET: OA metrics defining contents of OA
+	 * reports, previously added via @DRM_XE_PERF_OP_ADD_CONFIG.
+	 */
+	DRM_XE_OA_PROPERTY_OA_METRIC_SET,
+
+	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: Perf counter report format */
+	DRM_XE_OA_PROPERTY_OA_FORMAT,
+	/**
+	 * OA_FORMAT's are specified the same way as in Bspec, in terms of
+	 * the following quantities: a. enum @drm_xe_oa_format_type
+	 * b. Counter select c. Counter size and d. BC report
+	 */
+#define DRM_XE_OA_FORMAT_MASK_FMT_TYPE		(0xff &lt;&lt; 0)
+#define DRM_XE_OA_FORMAT_MASK_COUNTER_SEL	(0xff &lt;&lt; 8)
+#define DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE	(0xff &lt;&lt; 16)
+#define DRM_XE_OA_FORMAT_MASK_BC_REPORT		(0xff &lt;&lt; 24)</pre>
    </blockquote>
    <p><br>
    </p>
    <p>People outside of Intel don't have access to the BSpec.</p>
    <p>And since there is no page number either, it would just be easier
      for everybody to say :</p>
    <p>&nbsp; &nbsp;&nbsp; &quot;Refer to the <span style="white-space: pre-wrap">oa_formats array in drivers/gpu/drm/xe/xe_oa.c&quot;</span></p>
    <p><br>
    </p>
    <p>-Lionel<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20240208054916.3788133-7-ashutosh.dixit@intel.com">
      <pre class="moz-quote-pre" wrap="">
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_OA_EXPONENT: Requests periodic OA unit sampling
+	 * with sampling frequency proportional to 2^(period_exponent + 1)
+	 */
+	DRM_XE_OA_PROPERTY_OA_EXPONENT,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_OA_DISABLED: A value of 1 will open the OA
+	 * stream in a DISABLED state (see @DRM_XE_PERF_IOCTL_ENABLE).
+	 */
+	DRM_XE_OA_PROPERTY_OA_DISABLED,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID: Open the stream for a specific
+	 * @exec_queue_id. Perf queries can be executed on this exec queue.
+	 */
+	DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID,
+
+	/**
+	 * @DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE: Optional engine instance to
+	 * pass along with @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will default to 0.
+	 */
+	DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
+
+	DRM_XE_OA_PROPERTY_MAX /* non-ABI */
+};
+
 /**
  * struct drm_xe_oa_config - OA metric configuration
  *
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------Lklo6QW55IyM9GWylivruITq--
