Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19112F531DD
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 22:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF8810E550;
	Mon, 13 Apr 2026 22:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aI6L+2Ph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476AF10E550
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 22:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776120028; x=1807656028;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IvbPbWEpu2/HQjyl7Ho+R1rsejtdoWiPMUo2kQ5FFoo=;
 b=aI6L+2PhxExM37IYN5f55hhHeIm2EBWuWT6IAatXGlrCBYjlxNHjncQf
 XhyCB74xeUOdJXJv5AiKLP+1D7IR8/bhxPjoRuSFO3I3XRRdyioJO8ah0
 bc7wFWRIjyKkpiR3AjWFJ1Jib9LDWcOXiGI72nwzyCl/KDP57s+akf+Qi
 jwNiFtSwWh5BvA4NBLiIacz6BAc8m/ySc8UAnNMbMcTI8ap2vnFnvEToo
 t01lWF+Vg2yaF0EOO0UrrMHHhQKG9PMv2IUvyyUDqC9jl6Vo+7nBYEvP0
 m+O28gbv0aNC6322PkKtNN6p7sfdkhYmFqwG4OdxtsHTp/a9wBVKQe9OF A==;
X-CSE-ConnectionGUID: geLyL2a+QFq/kYJgzD+RRw==
X-CSE-MsgGUID: /D2RdqZ7QM6MqlzevyO8VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80952541"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="80952541"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 15:40:28 -0700
X-CSE-ConnectionGUID: Verz/xFNTGqEqmZtQnYcIQ==
X-CSE-MsgGUID: tfeOB7y5QoOCO9y3CiyFQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="223417018"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 15:40:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 15:40:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 15:40:27 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 15:40:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhz5NbSkScx6a6RgG0e8CdgEglplO2R3zgKzPoV6rukudg3opPZQdrRxiWEsuR1thsSTVi/vDOTff6KoMjgZF0aq+WkO7gENfHNVovGTDDCj6XVBe+gzEVT8raJMGal8Jw/DPXGpPbKiKYa0HoZt0ukEdHIhHefGeQun1CSl/uqVarKPoImLooOgzzOt0sHV+DxNxStIHYkdnljBITZZkPIyySCh42SHkP28KdlMc3VpqU1w7ssUST3FqQz2Qn6T2+e1RRmpf06TM5i7VQGN7tJ8UpnpMnQ7wJhoEXmTsC9qLOh87jUsDY3wWAhK+iNUFBujuij9dMMXO+7wJHezvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXeQJn6SJ6gL2FnvWz0v0cjCVu+xBuRUp7EuJhtdyx0=;
 b=OlLLmFK0tYbTlKskMsX8QFB4tjV2JqsWtraO9AKUOsfTav0d1NL/W32t8umQBJvCu18w8sCMAzVDu1i4NjPDICxSyj3i8StvneezKVwmxU3JdD1r9PonA2AMpl7U/Mwyx1W0hMKmOFav6AwbXnt47RuMfdPt4u9l6ESzAskQKggJJ53lAMiCFgK8qCig0i0j2pER8j2gKV9LstNjw0u5KxftlvzB4LhbX+59rRYbmNqezlgXt3IbRK8+90u6pabNSWFWYmKjuT6EFF+Pn2VFIxNz9rdnCnyN9AcIp7DRgasEFOumSHL+YmjK27NQ6p+OcMbeHUTiDv+9qrefB9KEDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CY5PR11MB6509.namprd11.prod.outlook.com (2603:10b6:930:43::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 22:40:24 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9769.018; Mon, 13 Apr 2026
 22:40:24 +0000
Date: Mon, 13 Apr 2026 15:40:20 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH 3/5] drm/xe/multi_queue: Capture queue run times for
 active queues
Message-ID: <ad1w1FSRzxCR7WcU@nvishwa1-desk>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
 <20260409203714.1887402-10-umesh.nerlige.ramappa@intel.com>
 <ad1ptHyrfIg4Y96J@nvishwa1-desk>
 <ad1r/WSO+81BDWl0@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ad1r/WSO+81BDWl0@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: SJ0PR13CA0067.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::12) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CY5PR11MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: b18c174a-2971-4983-8d28-08de99ada6db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: A7528M5ND/lm2SSnRHcNi65val3H4zwLimlb+CCkPXofixYuGx2ZmYFVDS8bSOuK98zPMnlrf2OyQdFLN9uMgNrrWmcftKjzPv0avrwIbSu7O84o7bLWeLsfB4pg4eYBGAlxCdUPrXB0XpuIqaFIynn3AQT+8GBybTm/U5N++ltXQzI3+GkWYv4fngbfbBZWagWjLUetChdQCDYctTzdHevAMi/YjzAfuQLQWqkhN8j6hK63i2uGQk/Zejvuh+Bwsd44X6eRnJrTvNkrcT2DNmkCY0bSFQsvKcm0BEGMzfCMIbOdoB8zD+GosGUXj/Lpe3aoaxkt3fbnEvF1V/RAIjqXYYUKJYyQzf4JcA0LwMSKjNBs00Jl4/0myxSGbGI70VunNuCMgmEV5g2Jyq+WteOUMzkr2qb4llB4A64kZlzXdwQqLze2ouiXhVFZ2AtKrTM/NcZyMCBPEROpELCbSHwvl28XaMNvfFQA4soW8NUGQ2bzRuEZZIj2PPARe5mvOoM5n2i2WtwOtieO8sY2e9mTnbOKzvzrjG9tPTKFJf3kfDG3sE9lJpBFLqRm486TIGN6jEtME7jS1VgPUBa35ZQUkQu4+ouhwIyutBNi8wYEKU9cZtpekXSUtfe5n6LScL9lN6hn+BLbM6FZRe2qA35Svub2zdtML52IFSf+KzjSC2DXd6EzwTTn/93wvoHC/x5SOK9WIAr8U1Dk7YRJaY27JHYmWVL0FH6j4nnR+ZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GXih1RWHc0caEyenVWkNbi5MV0Wa5PZr+Tlzc+a3FADd+C5vDdmZ349ILjQw?=
 =?us-ascii?Q?dzNY2Z+QUzrqniOQm5ooT7SBEfLbjet8YBJuV6ALQMDI4Y5ziRKadPH5xo6L?=
 =?us-ascii?Q?109JEf/m9ikD8lT0pUhsqG9XFCJHXAkuGBZy/Aa+/FV1+HsveBpq54AbqxOW?=
 =?us-ascii?Q?aG9PnT67miFrVoQvLHgmQkxkMYbWsmOViMh6FnX99NPH4IrOXQaKeE+k55MT?=
 =?us-ascii?Q?0QtTW64dU2QXoDkaVRSbSPuf8EXG+6dMbq7K1UNRjd1jL+MaFNIrUxpYu3Zs?=
 =?us-ascii?Q?2F1ZzUiH+Szn7tthDde4nrHQe+UfTi46u5K1KRfUWG3duC1LiM0BHUaleay3?=
 =?us-ascii?Q?e618bVSXN71QZ3wn99Ziw+puHhA7VOLlAFyO0DKclIZeyf79anVxotFWFPVg?=
 =?us-ascii?Q?EvKBdYNXYFBXXKaGe8FiEtvXuveM5KMCI+MF8g4pSSSwMe2wN1SqcQrCZxMl?=
 =?us-ascii?Q?XjZcjqC1fLW4pGnvCxYgKzdn8djNW9YnuI/vxM/Ho4o1bWvwZZIYjqIlV/Z9?=
 =?us-ascii?Q?UFq9opKVZYIFHnXd7pSnSmDkak4DynXNOm8iEuX0Pl8h0eRlr8SAc9k/Zlt1?=
 =?us-ascii?Q?o/8w86QMRo8Xl0RYsm2voN0M7MovJuzi3Nb6zWuYFZTrMQ9kRrux5Y1HrpMF?=
 =?us-ascii?Q?nWaOMQ5+xtXPb8pxhfTvF+SSSRPi0TlHDCqnSDO2us2R+G1On/tSoDdCJfmS?=
 =?us-ascii?Q?kAFuQYzfw5WabxokZjF+pDYbsBdi/95E5BkuyVWRv6cYDGv/cViu99H+Knkx?=
 =?us-ascii?Q?YJPyyty/B37E8QMBeXL9Q2gQc2SuUyjKBTao76kXjyWEuR8FT0Z8Mkha+8kK?=
 =?us-ascii?Q?cze1y0RS/kb+hdxhIfYTRTpxnWGaEDlKT+heidxyyTIzWS1XxkioA7yNfjQu?=
 =?us-ascii?Q?cQD/CT1/qoiBCWdl+WSp3ND7WQO2Q/+ine4O43QcNNAzL6maVzZ5NzGxhvCj?=
 =?us-ascii?Q?I11i3zBIdRlM1J5Itk2akVXrxhOq+8FHV/MwdtF9CU1/yMaso4kShOJvafS0?=
 =?us-ascii?Q?8tP1vQBBZGT8/XCw6aY1ZHkXBpj3Ppph+pVXd9J1M0LqrwJlIHlYEERScSoG?=
 =?us-ascii?Q?9RzjgPQlUmt0Cc+5WAPTgrZibMtIeRs/UOtrFok+uzmdPOJUBlyYUMfBrOkJ?=
 =?us-ascii?Q?65d5Mcpi7e2F183aLJZlFiNYAxjrtfuMxJGDBS004OkydoazRZ+ehZRHQ+r8?=
 =?us-ascii?Q?n12KDOCPMWu/UoWZt64bD/ep5sjQcQTun6jdIlVhmpiQsZX0xUDDZUf8EYMo?=
 =?us-ascii?Q?9Uc9m+B7YBc/KhJmcXmp8CW/kZbEkGRAsdmEy1XZFQn4wjXBjF8PRjebfzZl?=
 =?us-ascii?Q?TMztr87xmcWDPnH8bjnZkrHquDL9yEYurQwQOqxsWaEsTgkd6jkrWzs8UAL0?=
 =?us-ascii?Q?jCp5O9VIfRo1aoLyX6AZdIbfvLb/bPezSUOSsRiuS1DKDWmxaU0IxwTVWTOM?=
 =?us-ascii?Q?HC7UpCT+68QOWIw/wfUFrfJQ1dzgTcV4BZKh38+8KjVkZfQbfpbx/shAymL0?=
 =?us-ascii?Q?eBET1rLFP60Hqhlmjt43j5mnqonNGmyCyC8mykPBEDUQqAtHIUjj6+Na30V1?=
 =?us-ascii?Q?U2xz6kgpBQ7gmDlHDBJGVMMGf7ERloeDa70jJGq7/CwUddxFszPKGYHjHmAI?=
 =?us-ascii?Q?kPxI81GhCslJTW4iv8KTPlbFFk5WvSH/1hcxCLFj05EGOjddx/QWatj96v5e?=
 =?us-ascii?Q?jFyW9MT0c8qbO/aGYPA14NyzmYN0+/bck/uU8XG5VOAvcbGPRsadJQQ/reWv?=
 =?us-ascii?Q?IEOvDoxQwuLgknpMZPsPxX7xo7wgOU+ifZriiTZbGtLWwBCGC2PV?=
X-Exchange-RoutingPolicyChecked: k7AaaRmSl0A3TLb3L7bp57nGlX61uwROb6DHhkYZFA+lUhOuH7acMdel5pVPFpvve+OSu0PR9CnaApn2MGrSkPUus6kdzSDzfGbzXhTtwL5jhVuT+mpa2a2hXosQNC7g8wRu8SRojQyu8QH0755Shgb0fItsb91ryoxAh2R55yUUnNV9vDYuJqkJhm1lPjc4/vjZmci23nnEK0Kbf0qVm37ulZASayyaNBXENoUuFuldrOrGrW0j+CaFJaoEs1UY3N0ZR1XWjnWi542CIWaCchbr4M0JT2myZq+r4UKHS8p3jxweMp5taTYFveyLjSx08mGGPKdJBa1YCUx2gr+QBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b18c174a-2971-4983-8d28-08de99ada6db
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 22:40:24.2288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvX8005LS708rm4aCRZ0RrjqWuKt5ynVq7bSWtBt8A+eBTRt8R3Cb4o6Xe/YIJztAnvU9COEY2Eb48roj5IsPutL6iPmz5pSSnCTTazTjvGdh6A3AnqPDMRkgrIjbLv6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6509
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

On Mon, Apr 13, 2026 at 03:19:41PM -0700, Umesh Nerlige Ramappa wrote:
>On Mon, Apr 13, 2026 at 03:09:56PM -0700, Niranjana Vishwanathapura wrote:
>>On Thu, Apr 09, 2026 at 01:37:18PM -0700, Umesh Nerlige Ramappa wrote:
>>>If a queue is currently active on the CS, query the QUEUE TIMESTAMP
>>>register to get an up to date value of the runtime. To do so, ensure
>>>that the primary queue is active and then check if the secondary queue
>>>is executing on the CS.
>>>
>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

<snip>

>>>diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
>>>index d525cbee1e34..988d360143dc 100644
>>>--- a/drivers/gpu/drm/xe/xe_trace_lrc.h
>>>+++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
>>>@@ -12,6 +12,7 @@
>>>#include <linux/tracepoint.h>
>>>#include <linux/types.h>
>>>
>>>+#include "xe_exec_queue_types.h"
>>>#include "xe_gt_types.h"
>>>#include "xe_lrc.h"
>>>#include "xe_lrc_types.h"
>>>@@ -42,6 +43,32 @@ TRACE_EVENT(xe_lrc_update_timestamp,
>>>		      __get_str(device_id))
>>>);
>>>
>>>+TRACE_EVENT(xe_lrc_update_queue_timestamp,
>>>+	    TP_PROTO(struct xe_lrc *lrc, uint64_t old),
>>>+	    TP_ARGS(lrc, old),
>>>+	    TP_STRUCT__entry(
>>>+		     __field(struct xe_lrc *, lrc)
>>>+		     __field(u8, pos)
>>>+		     __field(u64, old)
>>>+		     __field(u64, new)
>>>+		     __string(name, lrc->fence_ctx.name)
>>>+		     __string(device_id, __dev_name_lrc(lrc))
>>>+	    ),
>>>+
>>>+	    TP_fast_assign(
>>>+		   __entry->lrc	= lrc;
>>>+		   __entry->pos = lrc->multi_queue.pos;
>>>+		   __entry->old = old;
>>>+		   __entry->new = lrc->queue_timestamp;
>>>+		   __assign_str(name);
>>>+		   __assign_str(device_id);
>>>+		   ),
>>>+	    TP_printk("lrc=:%p pos=%d lrc->name=%s old=%llu new=%llu device_id:%s",
>>>+		      __entry->lrc, __entry->pos, __get_str(name),
>>>+		      __entry->old, __entry->new,
>>>+		      __get_str(device_id))
>>>+);
>>
>>Hmm...I am not sure how to map this lrc trace message to the queue trace message
>>(which queue it belongs to).
>>We have a trace_xe_exec_queue_create_multi_queue() event, but unfortuanately that
>>is logged before lrc is created. So, can't add lrc there to match. Not sure if we
>>really need mapping. Also, not sure if position here helps us in any way for
>>debugging. May be we can drop this new trace event now (and use regular one) and
>>if required we can add this new one later?
>
>The trace does help especially debug the drm_fdinfo side of things. 
>The position also helps indicate that this belongs to multi-queue and 
>uses a different logic/register for calculations.
>

I mean, position itself doesn't add much value, but yah, multi-queue or not
will help. I would suggest printing primary_lrc that way we know it is a
multi-queue and we know which group it belong to.

>Do you think we can add the position field to 
>trace_xe_exec_queue_create_multi_queue()?
>
>That should help correlate the queue to lrc if needed.
>

As there can be multiple multi-queue groups, position doesn't help here.

It would have been good to match queue trace event and lrc trace event,
but I see even currently, there is no way. So, we are not breaking things
here.

Niranjana

>Thanks,
>Umesh
>
>>
>>Niranjana
>>
>>>+
>>>#endif
>>>
>>>/* This part must be outside protection */
>>>-- 
>>>2.43.0
>>>
