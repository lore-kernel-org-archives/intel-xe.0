Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40176C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 08:10:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA8B10E263;
	Wed,  3 Jan 2024 08:10:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34CE10E25F
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704269401; x=1735805401;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QyDalGmaON5UFeNAXsKDXyUVt2M568b0OvtJQQmvxWo=;
 b=j+3SuLZvHhVKs4sKw/Q5NIyiCcMeha35s/oIrjVDMC1hV6KKCA6V+hXK
 aXohYXQviRG2F68iJEnfk6enPfgYDcSJHA2kp9kheviCj0MAULs3e3U/g
 WxDqaPWmAvxq+mURVGa8LNcsxAp6dpOGt3mwLala827p0F7uo/44D2dwL
 8pP/wZHnb3T7Eq3Mf322o1KoLDWm8uMh14Zm89pzT50hA6BHNcl70R/Cx
 CUmiDR1Jq26QUUXdi+b1ptvtm8TnQ0n4dBtg3wFLdPTY1jnUAFaKBSmJj
 eioJGZ/gMraFX9AUIi+GBs7A6GAI+KshE2ocqr38VCIB9cNoKUGLKt8De Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="400786174"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="400786174"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 00:07:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="923467977"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="923467977"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2024 00:07:45 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 00:07:44 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jan 2024 00:07:44 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Jan 2024 00:07:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjidmi/XT/y7acKhhYF8rMIIxqWQsQzNAwDg/QgO4pqaUZHlkSyfjdwMH9caZftQh2R5y9c4OfJxmi1vCYZbMuTgm6RXJ1KYy4cQWs4Buja8baYNEwOb+GAnCxh2Sz0Lzl7r7YPdzvuQt4s7zca0jfYlFnxoGcD74YZPAQnW39qQS1YIEN62a8I/Z6epsKLXNF5D8hmL/JQ6mqygc1xQ/1/8Sx7GO9122SJdWWgh0t4aJGJAXgY2+YfY9C2Q/nm0Dtq4f/SXAKYjaTruIIZDmCDlfXLjo+B/Y9E7B5qvF7lARHM8GP7dEiclbt5sCR+J/MeITnsUlBxYbcKZYkO5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEY1Xckm2ws5Zf6RSY8GDUht4vlQFSnE7Ra6xzD1SJs=;
 b=Bmm/WlZUbKzG06MDG+lNBpcvSGYie8zuEeB62IERmbf5suoLBoICLrHDVYCWVch1uI7Gt3l44xHHwW68PAZreA3pLSk4+XPB5a4ltx9w3u+OSk/m3Gy/rzIUA9mXHDxOYFmDlDslFLz29gJVGflf/5wdjNQqMhekXL7WeSm6otXcK9qO6pGhwTs+9L5q8Ypksx0rAFC4YRuiiLoq3ZTxaLoWtMz844fTH/ivkSiMwZdQFtu+65mkxJZ5KP2/zgiiYQCczpXBdkPHvrq0tFyGehxHuFAE/nzj2I88ekADnImR4ePKRyKc9vNyNm8gVTtRkEkdoTOibP62FyuIis9BNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8477.namprd11.prod.outlook.com (2603:10b6:510:30d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 08:07:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 08:07:37 +0000
Date: Wed, 3 Jan 2024 08:07:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Subject: Re: [PATCH 4/4] drm/xe: Finish refactoring of exec_queue_create
Message-ID: <ZZUVt8eBvfXls8oC@DUT025-TGLU.fm.intel.com>
References: <20240102211731.6720-1-brian.welty@intel.com>
 <20240102211731.6720-5-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240102211731.6720-5-brian.welty@intel.com>
X-ClientProxiedBy: BYAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: 293c8eea-ed6c-43ee-7354-08dc0c330c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /6HemoBMYHq/Q/j7rmD/2+HFUUwfGnuTLjBi/S1wlb3wK4saB5af+Q8E8GySHdF6fVdCozHMXGib8UwGpoblbJERL/+ehYC0ZfliIbF8GpC46Ao3CY5HpNu+5mE7NISn53+bKgv9Vh/rgL0jRYUZFs99rqLmm/hEkE6uxOD9zLrDY3nBoFNgmy85lAH+pkulVMMTXxbAf3z2vTn77sNYFUrfX6LqQY2sr1h4FdkFzwa9BLo+NxxvsZPk5BfENY+S5mQOQWdYMu1bzfJjO7AakXvzsuApoWF+ppXDTVwr9rVPboNy2yQotxA09OLp4ASrWeYKI+qu4p6OSQ7y00nNQCs7WrpMifNYpt0E9kYISVNjgwPKAsMLKfJytLIp8pCbJWGYpNOgh4SosrSd8GrTXr/qOXvkfv4+oXb9s8NIc/Bj0qbteJEcFs8hCNTDPXP1fidNxfcY9sXP69nKZ5gZ4/xQ53gBz2hDjbSF+reuZFFER6MSSRfTILAkA5XoOhFV1USdDaZpifeUwSNmjk0h31qJGcjWLSYjVWl2dExbb+lZ2rrPzGQlG5OVJqHg+qEX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(366004)(376002)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(26005)(82960400001)(66556008)(38100700002)(66946007)(83380400001)(66476007)(316002)(6636002)(478600001)(86362001)(6486002)(5660300002)(2906002)(44832011)(8676002)(8936002)(6862004)(4326008)(6506007)(6666004)(6512007)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3Qwoavbrrf9mK+sEgVmY6g4w53OjCGUa/i/TWJKgMEh2QlqaOt2TppQ++2tc?=
 =?us-ascii?Q?hYcu+DLXsPz8U7RqlXNs8k8Iye5GbLvKcQ91//rtz8yle57eFgjpgeWrQ9HM?=
 =?us-ascii?Q?QGRF0PV9jUwFinQrj9dmXbBvoqabNj5md7rLfTzviykGmp9SRb8Hy3wQD0Ct?=
 =?us-ascii?Q?GcuafCmb2xbW4NWnhqAQU7aCggPi3meMskPA/MmRVODETu394KoZT/ljZEqT?=
 =?us-ascii?Q?pzAkGSPi6o/13q0lSIYzaaFDErd1MhtQzbC2jsta1tXibHE2+3C8ZkPrMIfc?=
 =?us-ascii?Q?L1gBRgUAShqdwPUWXgnS6B8gunVl79793q62ri466TEH4dOGIqm1TH9f2MJg?=
 =?us-ascii?Q?9iIpEWn/U9u4Mbh+SmNc/KMtSUB0m3YC2hykrsduAJCf+TSijKKlHDkvRKcQ?=
 =?us-ascii?Q?NBSCJt8O48NEkC943UM7kuAe14XL8Kj7nddrM85Pw7/bs29AGF7jjvJEvjb5?=
 =?us-ascii?Q?Bef7AoL52zojbD3PJU+JWfkL+fN7C7qHcusCfm7NtLQZGf50g5aGnNCI+oBu?=
 =?us-ascii?Q?8cD9OvjeuG1Sp47ga76h/xzhUJ8wn7LHMfMm9eR66Gl/1W1yxCyeVwBRyQ+M?=
 =?us-ascii?Q?AZEXYHLmqvt2zL9t/P75dm9SYWDs78lJHCv7NZeUhXWs64iDRQotTJQY+Sox?=
 =?us-ascii?Q?rRTOfa6jqT9pXF1Jdl0y5jzpTELX1jFZwzECajDcdQZnYLyvYqzAda4zFrTf?=
 =?us-ascii?Q?bmNIajWCRn7sRMi63nWR4pJV6y6HSOxQTdqMsLyR4uxMdc2fOf6woOLpEi7o?=
 =?us-ascii?Q?ibQd6zmOcmBmgGvL1EaW3nfAgv+D+deNBOTWf941hxJUGaEodX9/Dm96pUb5?=
 =?us-ascii?Q?zaarIyeD2Pfy+K5iR5g59BE5GS37UWi5HVwMGACJX8qVqEe+HwuRxxZQOCmo?=
 =?us-ascii?Q?6PoMf8jw8RTOt5k8g/Zs7v3bfMdrS8C2VrJmxyKe02iYUnE+Jsax7ZnHu2OF?=
 =?us-ascii?Q?uGJUqaFuqPDRWqVZIaICVFqbVkumH8GsReXbuaVRmkA7ClskOXoe+Zl/yVmw?=
 =?us-ascii?Q?n8du4B02+P76VAHXjU5wXWNMfWLRFgMw0yj4NLijMbulueVTQjRasu2Z2EgK?=
 =?us-ascii?Q?/9WiNk+75DX7yE+8q7RqaOKZkPt6eqPFD8464hRH8QScod7chPOKHIKtc6j3?=
 =?us-ascii?Q?aNkohZLH18ZMlE8Ygvlmd0qBq5JHSCf1dTK3eLt190Qltg5ZMifpGXMtYYlt?=
 =?us-ascii?Q?IatOBlTQnVy1sLDIvO6iYACTOALd19+g3Db21o1kwgOcPyQQCM9OhYjQ85t/?=
 =?us-ascii?Q?r81I+92VND/Q5kXnlAFOnlqocxwRkp5Z5LJO9poTQgv+F+O7hGu6KyJ1iwm7?=
 =?us-ascii?Q?WCMoyuAXX6GrV+6vmEZvv5BLghPnAXhd27qHLsJz6Q0Dq1/XkR6TefTFPi8L?=
 =?us-ascii?Q?jlwWhPlxbXGZD5Y7ZoWkcXSdjxAj+17NF/gwv2R8Vd0KEknBOuWLlY+eLDoS?=
 =?us-ascii?Q?jOcQDWbJQTraVLEPMlTtqFSN0B+2lMp//RuQd3LndSGGmQd/+JHNXm3J+mGn?=
 =?us-ascii?Q?v+dUIu9d10my8ucrr+Jan29FdH74oOpqUnEHAIbgpxCZhP5TmN0UGr42LRdZ?=
 =?us-ascii?Q?V37klMNAeQ94TBFDDQcmzgkdIyCrCd2aQi1bNmr6NZgXvTMGtDJdQdu5+3q3?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 293c8eea-ed6c-43ee-7354-08dc0c330c3a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 08:07:36.9390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAT0J4OpcTbh4OtDKg80bHrQmZ5v6DfiCZUQ0AigzW/RhkLkh4GK4E8Zv/K4434nEJmSDFTKXbZcSedHbcHbxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8477
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 02, 2024 at 01:17:31PM -0800, Brian Welty wrote:
> Setting of exec_queue user extensions is moved from the end of the ioctl
> function earlier, into __xe_exec_queue_alloc().
> This fixes bug in that the USM attributes for access counters were being
> applied too late, and effectively were ignored.
> 
> However, in order to apply user extensions this early, we can no longer
> call q->ops functions.  Instead, make it more efficient. The user extension
> functions can simply update the q->sched_props values and they will be
> applied by the backend during q->ops->init().
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 74 ++++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_exec_queue.h |  3 +-
>  drivers/gpu/drm/xe/xe_gsc.c        |  2 +-
>  drivers/gpu/drm/xe/xe_gt.c         |  4 +-
>  drivers/gpu/drm/xe/xe_migrate.c    |  2 +-
>  5 files changed, 57 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 9891cddba71c..8a2d51b994cf 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -30,14 +30,18 @@ enum xe_exec_queue_sched_prop {
>  	XE_EXEC_QUEUE_SCHED_PROP_MAX = 3,
>  };
>  
> +static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
> +				      u64 extensions, int ext_number, bool create);
> +
>  static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  						   struct xe_vm *vm,
>  						   u32 logical_mask,
>  						   u16 width, struct xe_hw_engine *hwe,
> -						   u32 flags)
> +						   u32 flags, u64 extensions)
>  {
>  	struct xe_exec_queue *q;
>  	struct xe_gt *gt = hwe->gt;
> +	int err;
>  
>  	/* only kernel queues can be permanent */
>  	XE_WARN_ON((flags & EXEC_QUEUE_FLAG_PERMANENT) && !(flags & EXEC_QUEUE_FLAG_KERNEL));
> @@ -50,8 +54,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	q->flags = flags;
>  	q->hwe = hwe;
>  	q->gt = gt;
> -	if (vm)
> -		q->vm = xe_vm_get(vm);
>  	q->class = hwe->class;
>  	q->width = width;
>  	q->logical_mask = logical_mask;
> @@ -69,6 +71,21 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  				hwe->eclass->sched_props.job_timeout_ms;
>  	q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
>  
> +	if (extensions) {
> +		/*
> +		 * may set q->usm, must come before xe_lrc_init(),
> +		 * may overwrite q->sched_props, must come before q->ops->init()
> +		 */
> +		err = exec_queue_user_extensions(xe, q, extensions, 0, true);
> +		if (err) {
> +			kfree(q);
> +			return ERR_PTR(err);
> +		}
> +	}
> +
> +	if (vm)
> +		q->vm = xe_vm_get(vm);
> +
>  	if (xe_exec_queue_is_parallel(q)) {
>  		q->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
>  		q->parallel.composite_fence_seqno = XE_FENCE_INITIAL_SEQNO;
> @@ -124,12 +141,14 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>  
>  struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
>  					   u32 logical_mask, u16 width,
> -					   struct xe_hw_engine *hwe, u32 flags)
> +					   struct xe_hw_engine *hwe, u32 flags,
> +					   u64 extensions)
>  {
>  	struct xe_exec_queue *q;
>  	int err;
>  
> -	q = __xe_exec_queue_alloc(xe, vm, logical_mask, width, hwe, flags);
> +	q = __xe_exec_queue_alloc(xe, vm, logical_mask, width, hwe, flags,
> +				  extensions);
>  	if (IS_ERR(q))
>  		return q;
>  
> @@ -174,7 +193,7 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
>  	if (!logical_mask)
>  		return ERR_PTR(-ENODEV);
>  
> -	return xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0, flags);
> +	return xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0, flags, 0);
>  }
>  
>  void xe_exec_queue_destroy(struct kref *ref)
> @@ -258,7 +277,11 @@ static int exec_queue_set_priority(struct xe_device *xe, struct xe_exec_queue *q
>  	if (XE_IOCTL_DBG(xe, value > xe_exec_queue_device_get_max_priority(xe)))
>  		return -EPERM;
>  
> -	return q->ops->set_priority(q, value);
> +	if (!create)
> +		return q->ops->set_priority(q, value);
> +	q->sched_props.priority = value;
> +
> +	return 0;
>  }
>  
>  static bool xe_exec_queue_enforce_schedule_limit(void)
> @@ -325,7 +348,11 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
>  	    !xe_hw_engine_timeout_in_range(value, min, max))
>  		return -EINVAL;
>  
> -	return q->ops->set_timeslice(q, value);
> +	if (!create)
> +		return q->ops->set_timeslice(q, value);
> +	q->sched_props.timeslice_us = value;
> +
> +	return 0;
>  }
>  
>  static int exec_queue_set_preemption_timeout(struct xe_device *xe,
> @@ -341,7 +368,11 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
>  	    !xe_hw_engine_timeout_in_range(value, min, max))
>  		return -EINVAL;
>  
> -	return q->ops->set_preempt_timeout(q, value);
> +	if (!create)
> +		return q->ops->set_preempt_timeout(q, value);
> +	q->sched_props.preempt_timeout_us = value;
> +
> +	return 0;


Nit: I found this tricky to read with indentaions as is, how about:

	if (!create)
		return q->ops->set_preempt_timeout(q, value);

	q->sched_props.preempt_timeout_us = value;
	return 0;

Just my preference. Same for all other cases.

>  }
>  
>  static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue *q,
> @@ -376,7 +407,9 @@ static int exec_queue_set_job_timeout(struct xe_device *xe, struct xe_exec_queue
>  	    !xe_hw_engine_timeout_in_range(value, min, max))
>  		return -EINVAL;
>  
> -	return q->ops->set_job_timeout(q, value);
> +	q->sched_props.job_timeout_ms = value;

set_job_timeout vfunc can now be deleted, right?

Everything else LGTM.

Matt

> +
> +	return 0;
>  }
>  
>  static int exec_queue_set_acc_trigger(struct xe_device *xe, struct xe_exec_queue *q,
> @@ -651,6 +684,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
>  		for_each_gt(gt, xe, id) {
>  			struct xe_exec_queue *new;
> +			u32 flags;
>  
>  			if (xe_gt_is_media_type(gt))
>  				continue;
> @@ -669,14 +703,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			/* The migration vm doesn't hold rpm ref */
>  			xe_device_mem_access_get(xe);
>  
> +			flags = EXEC_QUEUE_FLAG_PERSISTENT | EXEC_QUEUE_FLAG_VM |
> +				(id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
> +
>  			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
>  			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
> -						   args->width, hwe,
> -						   EXEC_QUEUE_FLAG_PERSISTENT |
> -						   EXEC_QUEUE_FLAG_VM |
> -						   (id ?
> -						    EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD :
> -						    0));
> +						   args->width, hwe, flags,
> +						   args->extensions);
>  
>  			xe_device_mem_access_put(xe); /* now held by engine */
>  
> @@ -724,7 +757,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		q = xe_exec_queue_create(xe, vm, logical_mask,
>  					 args->width, hwe,
>  					 xe_vm_in_lr_mode(vm) ? 0 :
> -					 EXEC_QUEUE_FLAG_PERSISTENT);
> +					 EXEC_QUEUE_FLAG_PERSISTENT,
> +					 args->extensions);
>  		up_read(&vm->lock);
>  		xe_vm_put(vm);
>  		if (IS_ERR(q))
> @@ -740,12 +774,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		}
>  	}
>  
> -	if (args->extensions) {
> -		err = exec_queue_user_extensions(xe, q, args->extensions, 0, true);
> -		if (XE_IOCTL_DBG(xe, err))
> -			goto kill_exec_queue;
> -	}
> -
>  	q->persistent.xef = xef;
>  
>  	mutex_lock(&xef->exec_queue.lock);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index d959cc4a1a82..02ce8d204622 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -16,7 +16,8 @@ struct xe_file;
>  
>  struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
>  					   u32 logical_mask, u16 width,
> -					   struct xe_hw_engine *hw_engine, u32 flags);
> +					   struct xe_hw_engine *hw_engine, u32 flags,
> +					   u64 extensions);
>  struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe_gt *gt,
>  						 struct xe_vm *vm,
>  						 enum xe_engine_class class, u32 flags);
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index a8a895cf4b44..5b84fc9ab8ad 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -356,7 +356,7 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
>  	q = xe_exec_queue_create(xe, NULL,
>  				 BIT(hwe->logical_instance), 1, hwe,
>  				 EXEC_QUEUE_FLAG_KERNEL |
> -				 EXEC_QUEUE_FLAG_PERMANENT);
> +				 EXEC_QUEUE_FLAG_PERMANENT, 0);
>  	if (IS_ERR(q)) {
>  		xe_gt_err(gt, "Failed to create queue for GSC submission\n");
>  		err = PTR_ERR(q);
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3af2adec1295..0f2258dc4a00 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -235,7 +235,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  			return -ENOMEM;
>  
>  		q = xe_exec_queue_create(xe, NULL, BIT(hwe->logical_instance), 1,
> -					 hwe, EXEC_QUEUE_FLAG_KERNEL);
> +					 hwe, EXEC_QUEUE_FLAG_KERNEL, 0);
>  		if (IS_ERR(q)) {
>  			err = PTR_ERR(q);
>  			xe_gt_err(gt, "hwe %s: xe_exec_queue_create failed (%pe)\n",
> @@ -252,7 +252,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  		}
>  
>  		nop_q = xe_exec_queue_create(xe, NULL, BIT(hwe->logical_instance),
> -					     1, hwe, EXEC_QUEUE_FLAG_KERNEL);
> +					     1, hwe, EXEC_QUEUE_FLAG_KERNEL, 0);
>  		if (IS_ERR(nop_q)) {
>  			err = PTR_ERR(nop_q);
>  			xe_gt_err(gt, "hwe %s: nop xe_exec_queue_create failed (%pe)\n",
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 6567abcb3c6d..e1615717486a 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -344,7 +344,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  
>  		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
>  					    EXEC_QUEUE_FLAG_KERNEL |
> -					    EXEC_QUEUE_FLAG_PERMANENT);
> +					    EXEC_QUEUE_FLAG_PERMANENT, 0);
>  	} else {
>  		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
>  						  XE_ENGINE_CLASS_COPY,
> -- 
> 2.43.0
> 
