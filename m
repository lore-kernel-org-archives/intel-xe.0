Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3A6CCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 22:41:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C84910E4FA;
	Mon,  3 Nov 2025 22:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QO5aUrRo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7A410E4FC
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 22:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762209703; x=1793745703;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PzJq0PPaXyfPTC4oPJYDrRwXS711072ZrEOpUZVfS+w=;
 b=QO5aUrRotmoBuoBYo+z9d98h4QITOSdmWtIW7xFBgUZzQ42B3Pwq2ZyM
 PQiA4vNU2rGIHi911NUg/BRbiLvKUAZzOULG19jaW95DnTLNfsw9LfRQE
 GdfeEpneUIq93mABrEY35ltz6KZFJdTiZCoYRkW+uJir4OHv7+rHqaJsw
 bmDjN5+Bd7nduWbuANA63t0T5vjML1mdDvrQA5PCSjhJdNOiwkjbSxKI+
 bb+6xI+KvJoUP5VJkCxLID7vSb7SmSam22XrkWZATna029F9+sRAtvkqS
 2FDeDYZNvrsMNjIAua+IYdgl9NWAKtyJ07vafsxvfjfmhQdoGlL0vU6qQ Q==;
X-CSE-ConnectionGUID: MoM9WO35SMy1TUHx2qdwvg==
X-CSE-MsgGUID: nMqAyoc6RUS0vhhOOCiPpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81925730"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="81925730"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:41:43 -0800
X-CSE-ConnectionGUID: TgU0v+ZcQoSdY9VG05jt/w==
X-CSE-MsgGUID: tKaPTjNfS4G6iDZBfWX4vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="186667614"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:41:42 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 14:41:42 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 14:41:42 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.25)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 14:41:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7I2TAuYcz3MMOxHf2fZPy/03BU6o/kX9XivQzDr9Hdvb3bY84zdoiEV3JJmkNLDT4RknTrubdwWhGjkv7lkzTc7/UpbnnBjJmDN0DLCFtcSVp/+2vJkSy58ShpL7jm/B5Tu9gduy5NY2rbNJ/UdgxsTSxQgZ5/d3aY4RMW2DAlTRhJkOkat4baiso6MS6ltbMdDUscjS5L+rMP6jElYfsjufeFRo/2LLYaKa2agv6n/HZwAsbWR5Orb2Hmse1ozYTGDKfZtWlzVulGKNVZUor+vy41s+5QCs2l4sfCWTQg5ZCG/a7EpPttpLVdomxOpQJC1FCmttDY3fvXsCGzYzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzfYtzQuKmzOescwYwrBU1FEkuzXne+wlTGcdmMYTIc=;
 b=xvg1T63GSwHZRw0pOU1S3gJ6z9BnfYjrfDB4YUgGpfW7yRjGIemu2hQQitRomKkALFYxcQPNymq0DVogKq0vGpbxlzIhuPlJNLsaCj9fIJCLeEN3fOVddTQEYnwuLYTF7GVx4PKOscMUfS2tJqC5JXOjb7YajSbHgh9I7Jka8Xmo2zYMF5/vfhVyXM84ZhguSwzc7vN4XbfJgaNu3ZinL3Zl5z0EIwLpQMFAO/gl34eF3Ijieywa/ETe8pHTJWYpxAz8NJiEPwCsaN9uKMJsKj7h9Rq5w+7V8IZ+/+sYJufbaNq4RIbm2hoCGLvQp0MtdRIs7gL7ueMH4zW+UpMVNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 22:41:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 22:41:40 +0000
Date: Mon, 3 Nov 2025 14:41:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 05/16] drm/xe/multi_queue: Handle invalid exec queue
 property setting
Message-ID: <aQkvoWL0XWHy6kTI@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-6-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251031182936.1882062-6-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ2PR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:a03:505::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c061ac2-fe14-47a5-34bc-08de1b2a2770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LrSgikdZefsMXVhIQuuVR1yYIkyrEN8+hcWZzGfp4nsBhuUb3vgl8ZdmBQOB?=
 =?us-ascii?Q?K5f9CYR6mvPo3CU9hK7jtnV8KI5PnTi/29TXGtIIWqhw2L+eBNWCBvcr66+P?=
 =?us-ascii?Q?PFDIExauX0bnXBFMSk/wFwQur7PWvjxD5BH8SvlcOpTHzyVNmq5PYdm+2J7v?=
 =?us-ascii?Q?riUXHYff1gHF+pf5BNJeSE8+2cvtsOfCgfuTOYZSwwQewJPMqtaLIOj/Kzqg?=
 =?us-ascii?Q?PDQucSPBp0JGuh0YgV+2U6ySa1iPnGxv+BHEZ9m9fIrM8x0pzvikj9zM8yEK?=
 =?us-ascii?Q?Gaevc2rQLCILTRaSR0uWd9inskCOCJ8a6k+42sYncW7nkrCc85gJaa/3G7v/?=
 =?us-ascii?Q?rx9TX1IRf8AdZfqLXeDfENOttEixN2ZfvfOtTz/jyhfNEyEQ7EnZ1w332L6v?=
 =?us-ascii?Q?FRta90XILMm3SGw9+puUfWqf98qt84r1PZo9iEIrQta1W+bmhSfoSdGHZzj6?=
 =?us-ascii?Q?yIaJRebg0abY3q8C2oM4vZO36lpy6+JbYo8KB8e2stcUokjJbi4G9VfeFKDW?=
 =?us-ascii?Q?qLnNf2KLTmFTPW2cqF/W/GYp3gm9Opc9+DSnDGKmH8Jn+1ewRawyjiaCdTCo?=
 =?us-ascii?Q?dTFyvw4FVNwyYR5FWwvoz2BU3f/3EfmhoobHRulyxBsWDwk7XcxP2VSAZQrq?=
 =?us-ascii?Q?g7X+41y9e5VR6DUsWdPEhPKgGT1cdvpk4wwhB0IbjAo5gjrBdcfdpN7Fpr4v?=
 =?us-ascii?Q?GO9UIW4NeJLdlJNh0UEai15nFkxmXzE7SoiX7XC1XwF3NaqkKrnRvwNBVy22?=
 =?us-ascii?Q?sNLMSxLDZtb0kwmwTkMUwvngOl7vWVV3g5m82WRyvCD0GJaA0bIgpg1wN3h7?=
 =?us-ascii?Q?oQOB3hE7ZdEWzP0erJAERBITlGJU3kkB503ORz5t4Aywlwhvr7ip5nta61jL?=
 =?us-ascii?Q?KrVUVWxQWym58OB0G5IKxdBiTYQJ6xZDthZX5PhgInOnTjsxdt7mW1gjzQn1?=
 =?us-ascii?Q?jX3ilwPoSjhIVvVbJ0nl2qa8rOyFWy9c/0eL4B6HIAwPWVgauqR1/MFEoztr?=
 =?us-ascii?Q?sMrcQ5gq9x/nR1NIXiHZL7TyKcESk08TTviJYfB6qRp7OiN6nHRls0wqDHYo?=
 =?us-ascii?Q?o12nZLnvFmxDgXCI6ysUAbf1vp8NIoDR/cIZHWGsPlmdjEYK9ZHH112gBCpL?=
 =?us-ascii?Q?Q8DAwTR16jnnGypW/ErB9YbkMW3YapHrAdAKArGP/whuuETwUHuS/WcfJHpf?=
 =?us-ascii?Q?mZBYhij3rsOegGRZBqg0fbtNQl4IVYY8ZO0jl7cgsdVNiBIoa3+8mxODxmZD?=
 =?us-ascii?Q?Uu+hueV0wMtUG2S7cDiUF7jAsRe4nDNWmLNFu0+pD1BsYk/3JMvRP955rrqa?=
 =?us-ascii?Q?ZIbe2YQeWFFTv6qomOkrXeJfUHYoLnsmsYHmj00e3MSNht4yEf3Spfqp1Erp?=
 =?us-ascii?Q?ZOS4BVj3sQtHaPgo7gOUdVfRdCxwV4bN/mn1JS9bR2a6eNcELQjkD6jNEnoC?=
 =?us-ascii?Q?WcqTyKEtpxlqTosG0/NqrdryhnUURK62?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FLPmJXZ8ytAw1PQ45HEdlk9BqQfJBFDZC7e1xAPIVBnkTugFtWIFy59qynk8?=
 =?us-ascii?Q?kA3lliuq/Y4vzaHbNCmq8qlGGQCY8rW00Ber2OSYJKltakV5ubwVxdC7qPMP?=
 =?us-ascii?Q?2XweAqvGJ8829OvfcCL+Lq8K4Ou0GPNrEp6yOcz0KR56EcA5noBUlQffnW7y?=
 =?us-ascii?Q?BjGtqIInHFds1YHwYsi+PxK0T/dWQToLhe4I+TRePsqWWM2BVaR330zfvS1X?=
 =?us-ascii?Q?dRjKNqnh8ibgNn5clB55qNkeS6Q+5w0+3PIkcmCmLEPsIn/3okD/aIf8KTyA?=
 =?us-ascii?Q?pUU6AfZW/YXar9HO91HvZ47vXAUgHRIuoxv6nQkVdC33DKKMrjD12ecOoBN4?=
 =?us-ascii?Q?UiMjFdLBS0A1ixLNZSe/RwRALrbZL/Ie8zk9TWD6RauDeomvvByOYs4/F+Ap?=
 =?us-ascii?Q?wXxLvT88dyQ/ZH67c26/d+NlA/aHP3nPHvjOr7gg4OSyO9uHFKYXIPwMbTts?=
 =?us-ascii?Q?7vdYnjRkJHqez/2nDnfMc7/JJbJ1ReIw3XC1aGbVn5i/lBq/XMD9qpfXpiVy?=
 =?us-ascii?Q?lR12nseMAkNzOybH4oT+d2HaH6Em+1iBVFKOut7T0JZc35uMzcEYVq2emgHI?=
 =?us-ascii?Q?V9e//cKRhGxGZEl8qkzWcX/zcGhvSfmIaCmGLarzeNpM5g8fIfdsE2VE5rR+?=
 =?us-ascii?Q?7AZe5HKEXWXqcJfCuj3OeLQsv38/TDKnvZGzFJUc7F4EtZClzr1zn8zyP7Pn?=
 =?us-ascii?Q?4I811mPgI1lG0PRvln4MmcjC6bgbQhmWeL6uI/fLh0eV6Rv8/syqsHLC3Z+b?=
 =?us-ascii?Q?tvh/KNc3+MS3vB6jd084MWAjrDvs+O0RwCwP8m9pkblrzmgTv6VYPG0ainO+?=
 =?us-ascii?Q?vpZd7xldQpvxSVSq3kjJAbld4PKeGknz9ojUz2+isCNBdRuIPLoVKLffovNu?=
 =?us-ascii?Q?FC82uf3+lrbhfiyu3wGXju68DM3HokuNj4j9oS2TfGzzNfGljwakxZAo79Hu?=
 =?us-ascii?Q?h+vLr278pLKKYy6bNG0IX+d9odGlngHQDk150ELOMPZMIy5YpuZ6yoVSvbhA?=
 =?us-ascii?Q?OAAhTqZOTOFrcYKh97mMmOQTBxHEPdw8U4TrcWBUC6Zo0TPyKnXH26jtW07T?=
 =?us-ascii?Q?NBdk4/JgUpucCYGlu/JCT/yCIVDwOv0Y5xwc6MswhRbblhERzzfm0CN0BqP7?=
 =?us-ascii?Q?8Amv2cjOFc9Y1sOQIQOZ6v+YnIEUIO/wU7o1d0V6/K/153TktzC5pkji6evX?=
 =?us-ascii?Q?VSrVFnP1bvByyo7ekQWlbIyKo/Gnd1D51LloYvx9gGW3SqWaWZiTWMZLN+Ps?=
 =?us-ascii?Q?AZFSUiQMGos3s/dS8sMH8TR+9k1uPYf3By/pTduAVeFItvFtlZAko5nBkLfc?=
 =?us-ascii?Q?NVQebg0EJQsOJ9G+2C40Vc5AqHw+xoZ1Z3Agop0cp0RyXFi+JgEWTYZt5bJQ?=
 =?us-ascii?Q?N3J3zJE1/1YSGfYJUcsutR8YjuCkAsJI9meEW7JgtrOyCV0H65jgC+NxmsG3?=
 =?us-ascii?Q?jN2NSsrt55rq6VumA5mVS33AoG1cG0JN1gLbJ3ED4d5GJy/H1xctnCPIPyHW?=
 =?us-ascii?Q?mnJIDWPQUjqpGKMP38ynVMxinTl3DV402P1Zbcg11pfM0wGZ6PkWC8YlJPnR?=
 =?us-ascii?Q?KRwLGYeVOVpHCF5y/83W9wYjEkBFDcVn8yqxIDJpG77pzi6TTC8EZjscmxmt?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c061ac2-fe14-47a5-34bc-08de1b2a2770
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 22:41:39.9921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/OZbFPZgEccvNEyjeruJ0iLYIun7k2lsz8jq19pN1aB4wqxUvDfqKP/oea4iXlsVmmlm3A2ovmNHl52bH5ipA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8344
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

On Fri, Oct 31, 2025 at 11:29:25AM -0700, Niranjana Vishwanathapura wrote:
> Only MULTI_QUEUE_PRIORITY property is valid for secondary queues of a
> multi queue group. MULTI_QUEUE_PRIORITY only applies to multi queue group
> queues. Detect invalid user queue property setting and return error.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 66 ++++++++++++++++++++++++++----
>  1 file changed, 57 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 0da256428916..78b3a0e2ddd3 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -61,7 +61,7 @@ enum xe_exec_queue_sched_prop {
>  };
>  
>  static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
> -				      u64 extensions, int ext_number);
> +				      u64 extensions);
>  
>  static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
>  {
> @@ -206,7 +206,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  		 * may set q->usm, must come before xe_lrc_create(),
>  		 * may overwrite q->sched_props, must come before q->ops->init()
>  		 */
> -		err = exec_queue_user_extensions(xe, q, extensions, 0);
> +		err = exec_queue_user_extensions(xe, q, extensions);
>  		if (err) {
>  			__xe_exec_queue_free(q);
>  			return ERR_PTR(err);
> @@ -747,9 +747,35 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  							exec_queue_set_multi_queue_priority,
>  };
>  
> +static int exec_queue_user_ext_check(struct xe_exec_queue *q, u64 properties)
> +{
> +	u64 secondary_queue_valid_props = BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP) |
> +				  BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY);
> +
> +	/*
> +	 * Only MULTI_QUEUE_PRIORITY property is valid for secondary queues of a
> +	 * multi-queue group.
> +	 */
> +	if (xe_exec_queue_is_multi_queue_secondary(q) &&
> +	    properties & ~secondary_queue_valid_props)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int exec_queue_user_ext_check_final(struct xe_exec_queue *q, u64 properties)
> +{
> +	/* MULTI_QUEUE_PRIORITY only applies to multi-queue group queues */
> +	if ((properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY)) &&
> +	    !(properties & BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP)))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  					    struct xe_exec_queue *q,
> -					    u64 extension)
> +					    u64 extension, u64 *properties)
>  {
>  	u64 __user *address = u64_to_user_ptr(extension);
>  	struct drm_xe_ext_set_property ext;
> @@ -774,20 +800,25 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  	if (!exec_queue_set_property_funcs[idx])
>  		return -EINVAL;
>  
> +	*properties |= BIT_ULL(idx);
> +	err = exec_queue_user_ext_check(q, *properties);
> +	if (XE_IOCTL_DBG(xe, err))
> +		return err;
> +
>  	return exec_queue_set_property_funcs[idx](xe, q, ext.value);
>  }
>  
>  typedef int (*xe_exec_queue_user_extension_fn)(struct xe_device *xe,
>  					       struct xe_exec_queue *q,
> -					       u64 extension);
> +					       u64 extension, u64 *properties);
>  
>  static const xe_exec_queue_user_extension_fn exec_queue_user_extension_funcs[] = {
>  	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = exec_queue_user_ext_set_property,
>  };
>  
>  #define MAX_USER_EXTENSIONS	16
> -static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
> -				      u64 extensions, int ext_number)
> +static int __exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
> +					u64 extensions, int ext_number, u64 *properties)
>  {
>  	u64 __user *address = u64_to_user_ptr(extensions);
>  	struct drm_xe_user_extension ext;
> @@ -808,13 +839,30 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>  
>  	idx = array_index_nospec(ext.name,
>  				 ARRAY_SIZE(exec_queue_user_extension_funcs));
> -	err = exec_queue_user_extension_funcs[idx](xe, q, extensions);
> +	err = exec_queue_user_extension_funcs[idx](xe, q, extensions, properties);
>  	if (XE_IOCTL_DBG(xe, err))
>  		return err;
>  
>  	if (ext.next_extension)
> -		return exec_queue_user_extensions(xe, q, ext.next_extension,
> -						  ++ext_number);
> +		return __exec_queue_user_extensions(xe, q, ext.next_extension,
> +						    ++ext_number, properties);
> +
> +	return 0;
> +}
> +
> +static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
> +				      u64 extensions)
> +{
> +	u64 properties = 0;
> +	int err;
> +
> +	err = __exec_queue_user_extensions(xe, q, extensions, 0, &properties);
> +	if (XE_IOCTL_DBG(xe, err))
> +		return err;
> +
> +	err = exec_queue_user_ext_check_final(q, properties);
> +	if (XE_IOCTL_DBG(xe, err))
> +		return err;
>  
>  	if (xe_exec_queue_is_multi_queue_primary(q)) {
>  		err = xe_exec_queue_group_init(xe, q);
> -- 
> 2.43.0
> 
