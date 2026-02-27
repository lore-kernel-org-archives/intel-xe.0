Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4034FEFB6E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 17:41:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C5F10EBD8;
	Fri, 27 Feb 2026 17:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nyWS2dpA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272F510EBD8
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 17:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772214090; x=1803750090;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JtCxv+WiCo+hxPNwemdbdgDCBxa7P8R6xu1K3ambLJI=;
 b=nyWS2dpA9Oz+WartQrn1bjo0TgqiaQtDDlk83KECodWizKOCEnLFKCs6
 uXJxhWk5WVOPAI4890yw45PHyDz5UnTZ3Bvsuq+CHqsuRc/wbDiBYdfQ9
 MIyYi/0/Zb3CrVwSyvUWgivrQPYfzG4b1m44MqaYc2VcduW4YwNsE+PQq
 boQbyDRaEzStqALhFdMFCKRrQ8RJTdZylz57PicCpAaffOtZ87tDpSrp3
 EqMPX48QkcPCrjgBOXRW9EXKyp6tIgLnQmymifB3Vl/OiaEm4tuYe6ttG
 L6ljXAN8aLxPvdcELPB4ecMPaQykoAV9L4lGX5w1rLkLeAtOqKoLpsuhu A==;
X-CSE-ConnectionGUID: HizvtTUlR7O3clFt67NJRw==
X-CSE-MsgGUID: XNbqoyQ3QnK+1tvEyNFuYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="84767536"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="84767536"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:41:29 -0800
X-CSE-ConnectionGUID: Ktb2KDhCTe6duTY2epl4ZQ==
X-CSE-MsgGUID: hpvt0yuGQ8Cr9IFF7hBcnw==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:41:28 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 09:41:27 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 09:41:27 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 09:41:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIM3bbFx4MI0Fd2voaQRMqAVguJjbUrYp+7TdDwlMj1ANpbXDQUblvELlbeS7ELJVtxlVqWK6/6IHLjaK4EOtBxEtkVhqaPCoWUL7FCyYdeYynNdLny6vXlwwoH1++3c0ui67Rj1s71g1ks1WMH+BLkHzxivK7/7TET1kEEfttk5PgduME6xXZXiZEB7BazsMmnM4DEwRfEtN/Lpg7vYIEch4RSvDtB3WduE/XHnxA1qLxxKvOCPpUSEaKgPZsG+FQk1v8Tbc4NhtlemSWfOawUNsxY9BrsI5i79+ti66XCGx1OgJEHDikKn/IOIPGGxCvWLkoH9/uP6kRb4nd4RLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OoFelc70GdQxnLUq95nUvK/ZGNY56F6kXTRLJ1/7JHE=;
 b=AQD7xF7lIi+fQPo+L1ca8D9uwxZLAE/2C6R7L95bcBJQDtrmoeAeVwBgogEc9Pbpjm97QtH5oYSKwSA6TJdqhyjbmKi/Py2wLaFxjALB5oM6YFrajtmmIbD+alcb6kcAQgbMDcor+EcO7aJCsaKs+Zrx+YisMLCT4JxT0kz8UUiYu3Qo2+QEP8JKwXy0p+imronCcEG6aOILdDe0r8WLGKnCIslJn/L+ZLGKWx+36iePePsc6LSJKodo9mDWpJWD0VIyHJPbT9aNEeTtL+UKskE5sOKrndmXiDQU3b9r+CmukUtgGOOEffNJb2BKF5XVrNuv40vozN9eT4AFxIW6RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6533.namprd11.prod.outlook.com (2603:10b6:930:43::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 17:41:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 17:41:25 +0000
Date: Fri, 27 Feb 2026 09:41:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Fix race between exec queue kill and VM cleanup
 on file close
Message-ID: <aaHXQv+Tzj/mNCCu@lstrano-desk.jf.intel.com>
References: <20260227064354.531306-1-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260227064354.531306-1-x.wang@intel.com>
X-ClientProxiedBy: BY3PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: 02fd0143-6121-4041-13f6-08de76276db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: T21d9hBjFMTzKIFLtMpZieJkz3LKTBfKX2r5GaadKAovs6wXsIXr9zcKmsiUZQjfeylg7UK1YtpodZK+9pAXUzW99FLqCb1hTOlmhh4Ni5BzRFSU0WTGNE341S8wjfOjOPH9+QBpp8EG0dNensWuBuo5GB1uknswm7Y2jj6nmhB53+vgL9JbHmcTuLP7tBE1OF4zJ2OIhv5PhLHDeuu504oGJMaYDuHz2trmkU7BnJwCDwS+V7vnjl+0kRWR1SjZ4viaAWIcylVyf5AA1cDQ8j7doUO7yTlgYNYJBGj9UCQisMUADwL+sAo9bIvROZvQmoY5eJ6uZE+yY97o7UiJ8d/PYGuxLbk1j+uv1pcHAciWmk9xatfMZM8Gonf/xyf7Uz2HCK3DiSI1Yvkx0fuucibpE42Bvee4VHSdpes5L+uVugB1daCcr8DjFWURq6i1BjUFf9WINj92IsrsT2El5XdvPIsrIoWbK7hy4iJIGYvW/6EUPMSiIHibR+vHfw2o/LpdQTEWqf23RmMhG6VNz+tK6Qa8K9quHga3QeIBPVJmzjsTpYPrC1yr7iIw4bvbY/+i61luxGS1W3S90lwN+st37nzEnXGNIP0wRmv93eaMx0+tiPVyoEKsORYnIWAEEvyuQTQpyvdpcKwO+UrCXjiFUqrAcba/Fy+wHbN6ODUs1MgOn1yktVeKmZZd+kfVA5MlhAcVrrHMvI3JQAGFvetVReDfYAa1lwSk+qr0F6Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gZIgZEARPBO9ii3HBQs5iK7Z5Vty42wEkPqL+oLQ0DGw/1QhJ4U/hN4ioBM1?=
 =?us-ascii?Q?8wpbuip6cfJAQDl3cv9FNgder87bjo9l7mn9e5lV2g7QuLacLX9H7I9Btjvx?=
 =?us-ascii?Q?lIC0Eyo4Bbg4BhCYdSkSmFzHsV5rKi6tkrLqXp+TstYRJgXvM4+gGQwWATam?=
 =?us-ascii?Q?H+Y4q3/7a8cUQ7gjMxK/pdqkCmJrroavLFyOLqW6wfzkpvdLKGZ/6ElufMY3?=
 =?us-ascii?Q?lPnFV9RsRLIKm8deg/hV+iaX7RI4UnYMDTSBC5d6eMe24laUSG2bFuUnSUE1?=
 =?us-ascii?Q?oYSvKslQGBD7lyalEHbQGj/EWNhPqMdhPuxvAC+DnaEElxFwyh3eu+yfRlEX?=
 =?us-ascii?Q?2/SWZsx2xQScHVdNOhJIWlfgVe3GII4qAuR1YYco4k37BdPgrN1H+MQlnS55?=
 =?us-ascii?Q?LB/7bhr+WIbFq6wNH44P4RX1z3D6jazJRlS7LhTOojVaFgakjQUs110gehz6?=
 =?us-ascii?Q?CVrGG8zV5i5Br45HrHbNBW5KG0vQBag5wkUmHELbxjJpk2bEEiCmz/CB3Dwi?=
 =?us-ascii?Q?Y2ySY04kr/yjJSDFgUwXog4XAN1lD0dauX8GrSI5qtKQAUOj7vY3erQ+4uhq?=
 =?us-ascii?Q?rUWWXjDxUdWbjg1acurlTTdOnPjlKwjBPg2Hp0eaZ0Y3QjlFX1p9TP6IktAy?=
 =?us-ascii?Q?lgNjOM6DYtS0lBiRq7B5j7IV7K2bKjQ+tN2W/UXr7wMIXUMz6CNJ/wqbxg8P?=
 =?us-ascii?Q?bSnPayygPuV78XkGyNYMSfw3CFCnrMe0mlSjgiWyzeYPveVQm7XBaJ6QzqDE?=
 =?us-ascii?Q?I5yJQa8JrG7sc5Vq9Z0i9zb31wC72ZcX2kIDVLWnk4kmfxHSaaSe6AvqA3fe?=
 =?us-ascii?Q?onjbL6lTNyjtEuI9LpL9i6UOIv7Um+KZN7bXQzNGU3V2LGVaLigUXUB3UhH7?=
 =?us-ascii?Q?wBD58+TJi5Hxccb1yYeXy+DvgudmljjXnUoVygoq5iKhRYi+Ze3DJHyPSQOq?=
 =?us-ascii?Q?/g0BxHLfE11Owo0G7vI/Cbj9/htmm3SG2AbEJ/p4lzjulcSebfOw6eAE/bIr?=
 =?us-ascii?Q?K5o3pPYiVRFxKnAb6vS4cSRRimCdoVSngsFIwDbGTk0N/awuXMiE/z9aqhd6?=
 =?us-ascii?Q?xoQ27KiM9lVW4/6hf3F1YI2HLPn4ATsmq+qeoXtDO5vwDoQjprg/ZDNMQCMF?=
 =?us-ascii?Q?wgeZQUeZGhZdtPoVpoK7L5zUVzgYro+ZJAddisD4iITN85TJ6pOpK93PGe7X?=
 =?us-ascii?Q?/wyteBZHfATZI0RxjZoDHIvXwLNlmKHU4CKP7ZSAjiEaJXhCz7lV2YJgO0xm?=
 =?us-ascii?Q?p7i5XR+xWFgkip7YRmyZHv+qbOeAhoe1j1Aitm+AjlPRswo+QNHWB+YJScBm?=
 =?us-ascii?Q?9fT/yEsqU+Frjx2HEavEzJE1X4PPnk/4V+URtfXEnEpZqGKxEVIRS9T7Ruvt?=
 =?us-ascii?Q?e0Y6s/giNs8vGwYALVzrTSyKafkwIDVX7d76145jvPInvwLrRVmub+Vt5T64?=
 =?us-ascii?Q?aLCmnzhDqxYQcLxrmbw+Y6+nZKKMPYG1n62OLOEo0INrJraaguLgckrE/puV?=
 =?us-ascii?Q?bCuPK7quUTmdd7GeACFjS7r1SyYkZ3IKW5yCwL1yysnxWnIjxWlnWBhL+dTw?=
 =?us-ascii?Q?aN2SxbWd+nL6kg26Pimq+PF4r+RMw4YOAf7wlHy//FoJJJPrNxsfC2jSUC4C?=
 =?us-ascii?Q?UrvlAIMJCSPXyx+uKEwORAcEKuO5gRHa4ur6YxDrLfcU1BmmDn5sKN/NR/5C?=
 =?us-ascii?Q?xCbZXXiYz9OzXxDquASD9ctNQ9ZRjc8K7Eji5A1nCvKJweCKsrngkhIT+e+t?=
 =?us-ascii?Q?xWl/JzAwd4hWoq4S1ay3wW2wo2zrwVU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02fd0143-6121-4041-13f6-08de76276db7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 17:41:25.1645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aK2Fmo4BHZINgn21OgHSu5SmFqZpc/nNZV45m6GopVhxaZlAFCYGxMoRGKPEpMYfa39Med33FHKWZvAjLMBsCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6533
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

On Thu, Feb 26, 2026 at 10:43:54PM -0800, Xin Wang wrote:
> During process exit, exec queues are killed asynchronously via GuC
> firmware. If VM page tables are released while the GuC is still
> processing the disable sequence, hardware can access freed memory
> causing CAT errors.
> 

Yes, I think that is fine though. The hardware can gracefully handle
IOMMU CAT errors, all this does is create a bit spam on dmesg if a user
does somethine like ctrl-c.

We still have memory protection via xe_vm_close_and_put that prevents a
GPU from corrupting memory it no longer owns after the FD closes.

Why are you thinking is a required fix?

> Fix this by reordering xe_file_close() to ensure hardware has stopped
> before releasing resources:
> 

This will cause a user ctrl-c to wait on the hardware to respond will
may be a decent amount of time which doesn't seem ideal.

> 1. Kill all exec queues (existing logic, unchanged)
> 2. Flush per-GT workqueues (ordered_wq, g2h_wq) to drain in-flight
>    GuC messages
> 3. Wait for GuC to confirm all queues are disabled via G2H feedback,
>    using wait_event_timeout on guc->ct.wq with a 5s timeout
> 4. Release queue references only after hardware confirms idle
> 5. Close and release VMs (page table teardown) last
> 
> The wait includes bail-out conditions for GuC stopped state (GT reset)
> and VF recovery, consistent with all other wait_event_timeout patterns
> in xe_guc_submit.c.
> 
> Add xe_guc_exec_queue_is_idle() to check whether a queue has been
> confirmed idle by the GuC scheduler.
> 
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c     | 67 +++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_guc_submit.c | 54 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h |  1 +
>  3 files changed, 121 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 3462645ca13c..e15ce3c64914 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -41,6 +41,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
> +#include "xe_guc_submit.h"
>  #include "xe_guc_pc.h"
>  #include "xe_hw_engine_group.h"
>  #include "xe_hwmon.h"
> @@ -160,13 +161,29 @@ void xe_file_put(struct xe_file *xef)
>  	kref_put(&xef->refcount, xe_file_destroy);
>  }
>  
> +static bool xe_file_is_idle(struct xe_file *xef, struct xe_gt *gt)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long idx;
> +
> +	xa_for_each(&xef->exec_queue.xa, idx, q) {
> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +		if (q->gt == gt && !xe_guc_exec_queue_is_idle(primary))

If decide to implement this xe_guc_exec_queue_is_idle would need to be
replaced with a vfunc that hooks into the GuC backend rather than
calling into the GuC backend directly.

> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>  static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
>  	struct xe_file *xef = file->driver_priv;
>  	struct xe_vm *vm;
>  	struct xe_exec_queue *q;
> +	struct xe_gt *gt;
>  	unsigned long idx;
> +	u8 id;
>  
>  	guard(xe_pm_runtime)(xe);
>  
> @@ -175,13 +192,61 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  	 * when FD is closing as IOCTLs presumably can't be modifying the
>  	 * xarray. Taking exec_queue.lock here causes undue dependency on
>  	 * vm->lock taken during xe_exec_queue_kill().
> +	 *
> +	 * Kill all exec queues first to stop hardware execution.
> +	 * This must be done before releasing VM and page tables to avoid
> +	 * hardware memory access errors (CAT errors) during process exit.
>  	 */
>  	xa_for_each(&xef->exec_queue.xa, idx, q) {
>  		if (q->vm && q->hwe->hw_engine_group)
>  			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>  		xe_exec_queue_kill(q);
> -		xe_exec_queue_put(q);
>  	}
> +
> +	/*
> +	 * Flush per-GT workqueues to drain in-flight GuC messages triggered
> +	 * by the exec queue kills above. ordered_wq handles scheduler jobs
> +	 * (H2G), and g2h_wq processes the GuC responses we're about to
> +	 * wait for.
> +	 */
> +	for_each_gt(gt, xe, id) {
> +		if (gt->ordered_wq)
> +			flush_workqueue(gt->ordered_wq);
> +		if (gt->uc.guc.ct.g2h_wq)
> +			flush_workqueue(gt->uc.guc.ct.g2h_wq);
> +	}

Likewise if we implement this the layer here would need to be cleaned
up.

Matt

> +
> +	/*
> +	 * Wait for GuC to confirm all queues are disabled. This prevents
> +	 * hardware from accessing page tables after VM cleanup.
> +	 *
> +	 * Bail out early if GuC is stopped (GT reset) or VF recovery is
> +	 * pending, as G2H confirmations cannot arrive in those states.
> +	 */
> +	smp_rmb();
> +	for_each_gt(gt, xe, id) {
> +		struct xe_guc *guc = &gt->uc.guc;
> +		long timeout = 5 * HZ;
> +		long ret;
> +
> +		ret = wait_event_timeout(guc->ct.wq,
> +					 xe_file_is_idle(xef, gt) ||
> +					 xe_guc_read_stopped(guc) ||
> +					 xe_gt_recovery_pending(gt),
> +					 timeout);
> +
> +		if (!ret && !xe_guc_read_stopped(guc) &&
> +		    !xe_gt_recovery_pending(gt))
> +			drm_warn(&xe->drm,
> +				 "Timeout waiting for queue cleanup on GT%u, CAT errors may follow\n",
> +				 id);
> +	}
> +
> +	/* Now that hardware is stopped, release the queue references */
> +	xa_for_each(&xef->exec_queue.xa, idx, q)
> +		xe_exec_queue_put(q);
> +
> +	/* Finally, close and release the VMs (clearing page tables) */
>  	xa_for_each(&xef->vm.xa, idx, vm)
>  		xe_vm_close_and_put(vm);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index ca7aa4f358d0..9d81f76bfd54 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2792,6 +2792,60 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
>  	return q;
>  }
>  
> +/**
> + * xe_guc_exec_queue_is_idle() - Check if the exec queue is truly idle on GuC
> + * @q: The exec_queue
> + *
> + * Return: True if the exec queue is no longer running on hardware, false otherwise.
> + *
> + */
> +bool xe_guc_exec_queue_is_idle(struct xe_exec_queue *q)
> +{
> +	struct xe_guc *guc = &q->gt->uc.guc;
> +	uint32_t state;
> +
> +	if (!xe_uc_fw_is_running(&guc->fw))
> +		return true;
> +
> +	state = atomic_read(&q->guc->state);
> +
> +	/*
> +	 * If queue was never enabled, it never submitted work to GuC, so
> +	 * hardware never accessed it. Safe to consider idle immediately
> +	 * without waiting for GuC cleanup, even if we later kill the queue.
> +	 */
> +	if (!(state & EXEC_QUEUE_STATE_ENABLED) &&
> +	    !(state & EXEC_QUEUE_STATE_PENDING_ENABLE))
> +		return true;
> +
> +	/*
> +	 * Queue marked for destruction during file close, or suspended (not
> +	 * executing on hardware). In both cases, the VM has been detached from
> +	 * this queue, so we can safely consider it idle. Pending GuC cleanup
> +	 * messages won't cause access issues.
> +	 */
> +	if ((state & EXEC_QUEUE_STATE_DESTROYED) || (state & EXEC_QUEUE_STATE_SUSPENDED))
> +		return true;
> +
> +	/*
> +	 * Killed queue can be idle only if no transitions are pending.
> +	 * The queue could have been killed while enable or disable was in
> +	 * progress, so we must wait for those pending transitions to complete.
> +	 */
> +	if (state & EXEC_QUEUE_STATE_KILLED)
> +		return !(state & (EXEC_QUEUE_STATE_PENDING_DISABLE |
> +			          EXEC_QUEUE_STATE_PENDING_ENABLE));
> +
> +	/*
> +	 * Queue in transitional state (pending disable but not killed).
> +	 * In the file-close path, all queues are killed above, so this return
> +	 * is not reached during normal file close. However, it's defensive
> +	 * programming: if any non-file-close caller checks is_idle without
> +	 * killing first, we correctly wait for pending_disable to clear.
> +	*/
> +	return !(state & EXEC_QUEUE_STATE_PENDING_DISABLE);
> +}
> +
>  static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>  {
>  	u32 action[] = {
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index b3839a90c142..9fa65366edcb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -55,5 +55,6 @@ void xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type);
>  bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc);
>  
>  int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
> +bool xe_guc_exec_queue_is_idle(struct xe_exec_queue *q);
>  
>  #endif
> -- 
> 2.43.0
> 
