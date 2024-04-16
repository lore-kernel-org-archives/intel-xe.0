Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB86C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 13:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB113112CBB;
	Tue, 16 Apr 2024 13:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dzRYtqsV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090AC112CBA
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 13:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713274977; x=1744810977;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WbdmD0IXG3XUevqogUzXTUMqs+OfqrE07zBjcVAwUWY=;
 b=dzRYtqsVtzlZLdwf+qYklo9vFa8USBTwok0yen0ZDJHEV5rhpdS5nJP9
 hxrqj2Yvzcp6ixIvqL1SDstF1Kv8Buv/7Y1qZZtVnvwEEflTBVEcQGeNb
 VaAp1keBrt4hh3/UkYPzQ1StKMdYZhcU0/A2e0DmwoBaeod7/3aJksF/Q
 ybukviCUyMf3BmACJ3wHlT2ZerhpBQU3c55gL9y9/Yw+c+kNEtS9Aiq1m
 DdGp5wcPZNlAzqKuwbUlk0kDOLqFcbt2BuuXY9IRfoYFTFZLOIMDJTg+V
 Y7IGRwrlyf+szXwEh/MBf10mMANuaxViboNxwpnRaFvKsf8UjNuq7wIqm Q==;
X-CSE-ConnectionGUID: 0/GQxz9HRxOp83p68A6guA==
X-CSE-MsgGUID: YMsyT5juSeWmxHkNYid/pw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8574027"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8574027"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:42:56 -0700
X-CSE-ConnectionGUID: /M6Jq78SRnmZJnZzlBrI0Q==
X-CSE-MsgGUID: d4C8jvMVRXGpuT0nlZQQ0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26680484"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 06:42:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 06:42:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 06:42:47 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 06:42:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8qNvgqbKB+UIaRHi55IKvup/q1gOPwZ/YdBgVeavH/kkYzNE5C1oAjClEF58C4wVi8IpWq0mDPqcKQnyWIZCQi68cHsY9KpZktmJa3YoTl94NujJlNs4XFZIHLpUHfReTZWAvRfcuKAvOnuWQWdYxJWifcGSaqkAdFEAJfM9fcg3LhKmdUQrteHAvffwTFtfMer//D0FueVbIsoq7/0ordfkmEkHcgxYSWnuo2QND1u6eMFHGyfYNIX6JHE40eOA6/IRfVAkrSIyX9jMrJjBx3FQ0OEa18xZnr2Uh8HJ3ALtOSFVa2Kp81yT0DOCmBSVVpZ7eA3QvoVyYCnztECmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHSJiI/yd0XRaHN/sjeR4fYgj7mS3Yzfp7h4qvtrjUs=;
 b=etdAx+JKdhW0v7c8xzkAdE54epsZrniU9ql+pf/Dh6vGGT0SOS/RN8PSHp4egBph8GGO7ru9djITQLGF5NEy1KkNYKSzi5Pg62RMbWf++m7Dfp4yzjfJmaQ+xj2C9y8QXdFmMQFqybFbZOAQ3Twwh6BQKmuOQdqOqDrDOflx+BgfZNRGArTZ9p+Rr3ZQ92k/qIShH+kMYcJ6Fvt6B38qbV7JXIye0kVefeFBf8d3EPThh0eFglVkkSOWhXBE1S5PF2nQFGlOKeaJ83/4d25BF7TBePgGJrrlZtzb6nGiXMGKWs6ul/6bbldo1T9QeWiEKnmb2+4b91CJY69zSAhqOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4d3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Tue, 16 Apr
 2024 13:42:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 13:42:42 +0000
Date: Tue, 16 Apr 2024 08:42:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH 2/7] drm/xe: Add helper to capture context runtime
Message-ID: <5yckw2zkfkdzlv6gjx77tmrtfpqrxe7yoywtgvbdzslnamyfha@lrfctmrwcqn5>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
 <20240416030454.3739862-3-lucas.demarchi@intel.com>
 <Zh4L9YhWnN5_CEKP@bvivekan-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zh4L9YhWnN5_CEKP@bvivekan-mobl2>
X-ClientProxiedBy: SJ0PR05CA0135.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7648:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e29a213-a28a-43c2-f082-08dc5e1b1723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GiTZBbIQ9eYFAxuL1a3iMG4ObdYAaVC9z5ozasUDBKH8IIzT4/dHZAyOGdy3GROw0xOxDdy5T7F36psr2hoHxRdV2Drv1fGQ3ux3HcYQ9kH0oK1gf64nuc1kujysJuPyKLYKcpgXZqew6G/PHGOR6c7mNmxJOqAZhGIG2wUwat5AtVrEFE8YOfldhBXHvisMxPUAmPgnwgUA4gWk5KZmR4N5tLUkphdB5bNheaa0KJlp40qNY4pkyXARD1OSU54uHbhn/3SswyOrc23c6JOO5qtSzuDKx4GSmHYOJ6Nhywy2JXJ06h4WW1YwXhGJuKfnJsxnK7qzKQZ45U7dMV9Ks1q4LdjMxMQUYQ/iqyFIovk3c7aWD8OqxFuchI+VBMQHyfiNcmSIHLzpyBWpFK+qM+oxOnMGks7vdYQcHcuqdARVPdycfNcfMSUePhlY2Fl0NH2mHs+ucU7rKoEsIK4vDBwzv7OkHx82wRh+ZuI2fLkfIc4EN1tW4cvlbV50GyHZrsjSSmHn4xbs3IKgxTU+++w3PeB/eSeURqSXjcNvg00Uaz0t0gk5HV/HXLz3z1q4qdCpNlj85IBueTL83EbXdATi15JMrPHAdPW4cu+hXL7INszhXcqtxZPyr2k9HhB5b6B8WhBFBV0MS70MItCdwWQ161VDsNtPxk/Dz9z3h84=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bMAd+zj69j263Vv7VmzMtJUswhHthXfH5RM9pZpwLeYWZlwAu+OwUfJPa7ZG?=
 =?us-ascii?Q?smrTZIjC7LkSyZXBiPHV3d8tzfpPYywLQ2HMqrpiwaYK+0KGrUO+IY7FSvhv?=
 =?us-ascii?Q?CzhKl3pg3esemLoEEotq6t/9slXdim13+BpsuZdYiIlcM0BtLM6IwZJJYNit?=
 =?us-ascii?Q?EfBaGPcA90gB0ZfbBEwBVJdfft1tROgsgtloOWAzGz05M6uEDW/SBHXJpnZz?=
 =?us-ascii?Q?BTsRHeu/I2uroBO9JQAfh1r5OoKlZ8M5HDxPr0dxlnyYGeiO4V6KK1muCuuj?=
 =?us-ascii?Q?HcoBRKlXmuQr4UlQVMx2ap5y0BfKAKLhuYkXGaRZ2M2/t1o/fz/e6UPe40Va?=
 =?us-ascii?Q?oZ0wYeZZe2S9a4xRzVa/5O4C8fdxFr6JRrrLpY2rNL+jkzIDOc5m6Vxvi3jM?=
 =?us-ascii?Q?rGA8L/pcJVjlOQmI7yp80AZ4q1gi6gngpQwW1waZaEPtNODqurr7xcKLDAg1?=
 =?us-ascii?Q?8d1nHZ3cVNPOJP6zIrWcV42RA8Qd1galjKErePFltuHjLMwN5VYsLLc00vCH?=
 =?us-ascii?Q?0VNxZkjY50mZVa4rOQIUklVoezpHIYOu5euhdM/mDatoUHgQoK0az1F0N5AE?=
 =?us-ascii?Q?KXmiDQ99EAnxKFlljuGZRvWIgfN86RfwdkHaFlLdQBWl5Q/Lj4MpdKpbUJQy?=
 =?us-ascii?Q?DRrwtVjEGwQ2ewoEVCkUHKOI1HI9ttwe6wjOLXT49ZJjYmFVMjMbvO80DEny?=
 =?us-ascii?Q?8ABrBtZ+pOEohmn9uSMgy/5UCNSIpp//Hn2QoSalxmsGA/G1JZBGVRmSkr8Z?=
 =?us-ascii?Q?u+mju++5MQWTQdAIBeSg/+ecba1lJ2zG7AT3KqogWdv4Spqapr35x5B9MRAu?=
 =?us-ascii?Q?C4VCIHYiL9aAhvUBWl3E+QbeApe1ulVfYYeD4C+fIKtjipnI4NiHRscQdpMa?=
 =?us-ascii?Q?rfgozaC0l1vutQ5xLAAT8WOrWYUJAGoxhw7cdOBBli6Rzf80MAX9mG4rx9R4?=
 =?us-ascii?Q?/f47L2KysaAZDFiftY68UtN87oUeHJQwg1yelaJJHkIR3lStf6wX/P2WfTV5?=
 =?us-ascii?Q?Mi+dzk9M0lNn1hwsYuEuShNwJKodkdyMvEdQcPLTKOj4pOdaZWcnMicORLB6?=
 =?us-ascii?Q?A5XglM3JYQA0ltY8r+GcPEabinlOsOv+RMldJdvATx4W+C4F2cGXJCb61eVr?=
 =?us-ascii?Q?vFYb+s0OAfEz95Rq6yRCHW36QZ+tygjT8fTWM+HVwGo8yjzyV6NOHS4/agRd?=
 =?us-ascii?Q?nfrmDwpBFtoxTjmXtXWLzZpBC2DOlEFfFh9nGaju9qku2b3ijTIj9IvYuAgP?=
 =?us-ascii?Q?8aw7vabiTO9/Ruk6SB8wgVUQ93BcceVq18AueZWQ0r8R9Dm24t0y/UdKfH+V?=
 =?us-ascii?Q?VmL9Y9VVf2MT8sXH5TLDae3bdufC1I2/nVwNp6r/Y6RK0Wz5+GX/3OYeLaSa?=
 =?us-ascii?Q?+HfKkFw83ZdRqqYVYgLBrm2ZRoTpeD/UHZgSPOTMW2QQOGTSE/Ydi0InTBq/?=
 =?us-ascii?Q?CZWn1lm9AzQDf5Oc0l+DJ3Fu5o8eADNzoZT3/FGurL1Y1IYGRf3WsG1o+tZt?=
 =?us-ascii?Q?X4JciW2k5zTQa4lXPSG876Qq6sFoRTXJKFuD0Y6UqgjDfSs/y7SyNUA2vKf7?=
 =?us-ascii?Q?dqJa2+NUHknNYN684cpuW1D+tWIOcQY4El+g7UvuGEDqe3GNvV6Spto/NinL?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e29a213-a28a-43c2-f082-08dc5e1b1723
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 13:42:42.6691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xmuZfS4DYx0Y/axAcUgeKw8YVgmVBNBKunDclPq24ULnhB/2XX2Xl2auoTgSo6ienaUXmQkvzWI7DeUpVfEZz3rTigS8Cbt7iPt1tjhUlvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7648
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

On Tue, Apr 16, 2024 at 10:56:13AM +0530, Vivekanandan, Balasubramani wrote:
>On 15.04.2024 20:04, Lucas De Marchi wrote:
>> From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>
>> Add a helper to update the runtime of an exec_queue accumulate it at 2
>> places:
>>
>> 1. when the exec_queue is destroyed
>> 2. when the sched job is completed
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++
>>  drivers/gpu/drm/xe/xe_exec_queue.c   | 37 ++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
>>  drivers/gpu/drm/xe/xe_sched_job.c    |  2 ++
>>  4 files changed, 49 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 60ced5f90c2b..f6632b4d8399 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -553,6 +553,15 @@ struct xe_file {
>>  		struct mutex lock;
>>  	} exec_queue;
>>
>> +	/**
>> +	 * @runtime: hw engine class runtime in ticks for this drm client
>> +	 *
>> +	 * Only stats from xe_exec_queue->lrc[0] are accumulated. For multi-lrc
>> +	 * case, since all jobs run in parallel on the engines, only the stats
>> +	 * from lrc[0] are sufficient.
>> +	 */
>> +	u64 runtime[XE_ENGINE_CLASS_MAX];
>> +
>>  	/** @client: drm client */
>>  	struct xe_drm_client *client;
>>  };
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 71bd52dfebcf..c752d292fd33 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -214,6 +214,8 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>>  {
>>  	int i;
>>
>> +	xe_exec_queue_update_runtime(q);
>> +
>>  	for (i = 0; i < q->width; ++i)
>>  		xe_lrc_finish(q->lrc + i);
>>  	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
>> @@ -769,6 +771,41 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>>  		q->lrc[0].fence_ctx.next_seqno - 1;
>>  }
>>
>> +/**
>> + * xe_exec_queue_update_runtime() - Update runtime for this exec queue from hw
>> + * @q: The exec queue
>> + *
>> + * Update the timestamp saved by HW for this exec queue and save runtime
>> + * calculated by using the delta from last update. On multi-lrc case, only the
>> + * first is considered.
>> + */
>> +void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
>> +{
>> +	struct xe_file *xef;
>> +	struct xe_lrc *lrc;
>> +	u32 old_ts, new_ts;
>> +
>> +	/*
>> +	 * Jobs that are run during driver load may use an exec_queue, but are
>> +	 * not associated with a user xe file, so avoid accumulating busyness
>> +	 * for kernel specific work.
>> +	 */
>> +	if (!q->vm || !q->vm->xef)
>> +		return;
>> +
>> +	xef = q->vm->xef;
>> +	lrc = &q->lrc[0];
>> +
>> +	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
>> +
>> +	/*
>> +	 * Special case the very first timestamp: we don't want the
>> +	 * initial delta to be a huge value
>> +	 */
>> +	if (old_ts)
>> +		xef->runtime[q->class] += new_ts - old_ts;
>What is the need for accumulating the delta instead of using the
>absolute timestamp read from CTX_TIMESTAMP?
>This would break if xe_lrc_update_timestamp() is called from some
>additional places in future. The delta would be incorrect.

can you clarify the breakage?

- CTX_TIMESTAMP is per context (or exec_queue if you want to use the sw
   name)
- Reported runtime is per client.
- any update to xef->runtime[] should only ever be done by
   xe_lrc_update_timestamp()

Anytime xe_lrc_update_timestamp() is called, it updates the timestamp,
saves the new one in the lrc, and updates the delta in the xef. The
value in xef is the **runtime** for all the exec_queues created by that
client, per engine class.

Note that we already call it from multiple places with this patch
series:

1. when the exec_queue is destroyed
2. when the sched job is completed
3. when userspace queries the runtime

... so I don't think I understood what would break.

Lucas De Marchi
