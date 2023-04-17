Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60832C77B73
	for <intel-xe@archiver.kernel.org>; Mon, 17 Apr 2023 00:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC22A10E0FF;
	Mon, 17 Apr 2023 00:24:25 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007E610E0FF
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Apr 2023 00:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681691063; x=1713227063;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tK/zdUHMRFWfyhHSpFrsm/qw6Put6MKz8B90BqwlH9g=;
 b=M8hDAh44wk3yvGic9LwECv69SsEBrVzPl8WkWhSL3PxhR3io+VxkGx/B
 1GyQMq4p1tAdS1s7BvhqL1zOeIUmzalpDHiPhMQjbzeq0IT8GVNMzqXoE
 Y8raxM33al+qYmCfj/Us7xoajLVQ68cDShzoAvU37I9ygmV6YYYo/WbjA
 VQFFh1azNrOoazcRBwViW86n/TPv6Q2PvsWGseQ+ZxYlo2l001gQ/EV+M
 eCrqXNjCLeMIrguj2Bs7hx1W12jauaflUTsleB5YpgAcV3JD0s3VOSCBN
 ajcDhAQl39SmtoR5PrvESfFlTmJvjuPZj8UsGdGwxAhOYT6IFrurTwFxj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="431064290"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="431064290"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2023 17:24:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="683976835"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; d="scan'208";a="683976835"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 16 Apr 2023 17:24:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 16 Apr 2023 17:24:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 16 Apr 2023 17:24:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 16 Apr 2023 17:24:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 16 Apr 2023 17:24:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NrVqy9JnZhfNYJQEyQc3/x26PsgZdshRjbj/qbVOQKETyNX9hkjm2q+jXByRBlgO4bJH2+Q2Utedw33qqap0a1A+GfWvapVhV1GbNK4fG25UEmS/WJvLQ7rM33c2DB/vd5YjFR9VDjZJ1Z/NZcz8B+CMqkvv5v/IVdXAL+v9Wn15772rovkcdHyC7T7/SDWY22m/kylSVu6jV6CWGXnGKeW+FnCMDRjaWs4YHh6FdzoyX/UUm/qfAG97o6SU3AUh6DOOWFvV4tIEOBvXuU5CNJ3kWV0jS6U5uK9nBkB5O7GMHYAK/c68i9u0jq7hWFlE7c6m3pneJQHSEArd8X5CRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K//ZpU466/1GZ+FUrOYXnSV+fe8jxgXqouvguLYPQac=;
 b=Y3pH7cxarF8gtaIIhZqd/r8YMQHR+oMeMvO8DhBUCJIeDrp+JeYWuM6K9QVHnlhK9zWA0Egb+L48SQCv9EIL1BhuHjgr+9kbh+2g5/fiSbR9Ib2+yYWtMUYhQ+lwfsW05lgsZYRJWGYgxP//RFFGubDvJA1ZYkWY+EKIpgEiX3UUWZBszInTWyOFFdUGQJcRqdNMnNlR55I3KSytvvcEjytxx6Xw8uvviQ8+ZDLdEo8nJHD02qdiOPKPdqOp4bU2+WaG8UJGYGtoXDMKD1rxwyaziZ8YbUC8oRau2R3Lq10eb/oIuyS8JJl+uxMu4uPTg3+4lyrzo+Wv78eM88/PMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7853.namprd11.prod.outlook.com (2603:10b6:208:3f7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 00:24:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 00:24:13 +0000
Date: Mon, 17 Apr 2023 00:24:03 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZDyRo0FT05EvN0g5@DUT025-TGLU.fm.intel.com>
References: <20230414102745.2848028-1-francois.dugast@intel.com>
 <20230414102745.2848028-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230414102745.2848028-2-francois.dugast@intel.com>
X-ClientProxiedBy: BY3PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:217::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: aea0c2bf-6e53-4c3a-4610-08db3eda11d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 45gNJiG44zbhB5kMoKi7AF3ZsfS+5ZPeRE6s4/KX8n6CKygwPOfKEh7CBi5diJDgZDB6a+ZvLSRjzvN3Rh5u7MkOwGvRhnwNlMvC7EbcaQxj81oktgPu+UGahXlmXfdgRP5oL29Ed32swpQFzz+lPIreeVay8+MiO2stehA0H3uQp9OYvPh+ddOyQSUTepkPD92n9WqzGcPdmeJCNvy01U7pVT70v29OBhr3PwejOUK2kA2fi3k6vRclTk9mPXG9N/JP0Rd0P0VkXGJVQULP+Flobvam3JniT52q3IAduYq8egdyWLrfbwgB3MFBzFVqkSez1mrBpOa/rlZarzXgRofpuhRu+U1n8nwNMSSz7E/of/2K8KwEMymRSMBu5bMhnN/eP2gz7P/ej3cxKs0x1umGCwKoe8UtLOtAgeQ0vvO8951Owupz1marHPAgScmufZQYO14RmoVb99ArkZ/C183COLJght/OVD8/REmgu/nznpAm6uBWhMfRNSpFpZYo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199021)(478600001)(6666004)(38100700002)(8936002)(6862004)(8676002)(316002)(41300700001)(82960400001)(6636002)(4326008)(66476007)(66946007)(66556008)(186003)(2906002)(30864003)(6512007)(6506007)(26005)(86362001)(83380400001)(5660300002)(966005)(6486002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tU6blP1KDujv4cbz+hwD6tvGF1meX9kQoUhlhtppSh0nvU36oHNjRT0WUf60?=
 =?us-ascii?Q?roIijPs8iDSEuG9D8GjgHYJF/JdCfZtqo1gVwfa1ajTH99q0Ja/LGY74MZQW?=
 =?us-ascii?Q?Bi+xbNNUyhtUjGk3XUxvKAekay4p4Y9dIafAq6arUqTrQ6nLQF2cIz92ZQYw?=
 =?us-ascii?Q?fiNLuiihwKDEhL+5ulPUhSaIxwIW9gw7KYcmRUJFwXjitkoknBsXo8E8MtJR?=
 =?us-ascii?Q?QUaA3VzfH900AS8VJM26xixMy9x25/VoLdM+eGvWZyiDyz/M3TtWBreUG2wY?=
 =?us-ascii?Q?AsgVzgQQQPFQQhkuQ/QLU9DK/IEc3OtdRKc8cFxd2WP2pHlxWfbDJ0VMgzPw?=
 =?us-ascii?Q?qvxwxxKGnYmBa1SWgwOd4nUO1HcDq3QyhDSZrvik1YYiF8fiBPpgUFYc5aFZ?=
 =?us-ascii?Q?bK0U5dTFb/SD9ExhtD2SEgDxEM0pkiP+YjsXC2n5w2yyfMcvsLt/dasRwfqr?=
 =?us-ascii?Q?vGlAvtZ2uc4I5e3lfUt1ZSgiCf2CGu4bWhBwxJY39rAWFDT04e40LYx/Knzd?=
 =?us-ascii?Q?wIr7iCfwdawbeIeoHud2fc7ekiLO7tFs7yH7sl7uFMKUIjOI3I8U0k3m4h5Q?=
 =?us-ascii?Q?8xlwoZPcgb74Jq+Qh41WYno1ku+8MTZ16kKlI+HjwuL04fHTGeCFQ3sEfva2?=
 =?us-ascii?Q?U2Dd2LvS+s3mX5GGL0d9jpIXXQP92x/oTr4tFxwBF1Uc6ghlox/BiycVnygd?=
 =?us-ascii?Q?xPfdFfgfm54WKAySanr5ZBTerJBrzoTOaeWcgETlcsfR3VXZxjSb+8488aVT?=
 =?us-ascii?Q?R5bzBhGvJ+F/19b8or6CrRux2d5C4HrReICIOHLQpTofzWJ4senoxeTCRdBC?=
 =?us-ascii?Q?GWuY9ng/uyHZTH7LnQuy7LfHLfvt7QkVY6wsfEYV0XxT/9Xs0dlgFRRpdTgx?=
 =?us-ascii?Q?i36ctvZmTM0iiu8J/Sfrx9ZQKDblLz9K1uX80wsxXB5iKmlpOXhU1XtT+B+e?=
 =?us-ascii?Q?sLvg7Cj855lvGbMG5Igh/1zkrRnfbTlXNZEoOhrZx/hu5KDBraZmEJSy36lM?=
 =?us-ascii?Q?Nlkc+OGVR38NB90PsflCFIfr4by97XIAJ+zsNK5b3WcviDhWEFxSNtSiTuGN?=
 =?us-ascii?Q?bn6urGevJEA+Wca0Sr8shlV27fDLu/GL7yXg9AbZzMy5+hUWor2wxGNaV5O+?=
 =?us-ascii?Q?oEA2Ct4ZQVuAqOlVZevUlzPkZGxkcfHyJMqzhnAogC9j1+lcWegIBcitBdEc?=
 =?us-ascii?Q?X03HgkzDMG5Eq1EDiBJ8sxbEippg5vmkfWiERDJNBInoLzYHfoqMgCXkO8Eq?=
 =?us-ascii?Q?9NkrjkU9l5vGdBucN/R28Bak0QRnol3DqihdptrWGdSUBuQ+w8zZiUmcImHw?=
 =?us-ascii?Q?kR3nLmtLti+KV0x8kUYEv7DapfNg0SMwSt+GWu4x3hXBv2bpFuF3pXY2tBHa?=
 =?us-ascii?Q?kO+isJ843Yu0/D5ejwLcz7Ssfc2qzo7ff08XQ2UecYBmJGOyXSg9sCSLmMDc?=
 =?us-ascii?Q?xjpIlylGAvdsuAmo1ZvmFQwIXJJkVCTlCetIsDy7IYc5Eo+oCKuxDhiE8k1n?=
 =?us-ascii?Q?Pwt5G0ohLa+L2BIC9WGkk6mpbOhMsLBP7KaD6J83xPY3UkSoDwV8Tm/Chs0I?=
 =?us-ascii?Q?Py/41G17Hdhgwkeg0aSNQ4jp5zh5u3mbLSthMjUuCJ2Fy5R8DTG8rxUDI4fo?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aea0c2bf-6e53-4c3a-4610-08db3eda11d8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 00:24:12.8467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rseckyoc3wl/5YjPYgylATmwOcCKr/DsSD9TTYXPvlChXDQZJpqfs81kWACDyfOgppqnIt6JE0xcXL5cNGnB0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7853
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 1/1] drm/xe: switch to using drm_exec
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

On Fri, Apr 14, 2023 at 12:27:45PM +0200, Francois Dugast wrote:
> Replace the use of ttm_execbuf_util helpers with the new drm_exec
> helpers. They are only used when locking multiple objects.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

I have a very similar version but it is based on GPUVA:
https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/339/diffs?commit_id=cccf1dc2227c22dc06045c5ce524e13b517d6874

We can work together on getting a version merged.

> ---
>  drivers/gpu/drm/xe/xe_bo.c           |  22 ++-
>  drivers/gpu/drm/xe/xe_bo_types.h     |   1 -
>  drivers/gpu/drm/xe/xe_exec.c         |  32 ++--
>  drivers/gpu/drm/xe/xe_gt_pagefault.c |  67 +++++----
>  drivers/gpu/drm/xe/xe_vm.c           | 217 +++++++++++----------------
>  drivers/gpu/drm/xe/xe_vm.h           |  19 +--
>  6 files changed, 159 insertions(+), 199 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 3ab404e33fae..ff707eadb96b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -8,6 +8,7 @@
>  #include <linux/dma-buf.h>
>  
>  #include <drm/drm_drv.h>
> +#include <drm/drm_exec.h>
>  #include <drm/drm_gem_ttm_helper.h>
>  #include <drm/ttm/ttm_device.h>
>  #include <drm/ttm/ttm_placement.h>
> @@ -1723,17 +1724,24 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
>  	       int num_resv, bool intr)
>  {
> -	struct ttm_validate_buffer tv_bo;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> +	struct dma_resv *obj;
> +	int ret;
>  
>  	XE_BUG_ON(!ww);
>  
> -	tv_bo.num_shared = num_resv;
> -	tv_bo.bo = &bo->ttm;;
> -	list_add_tail(&tv_bo.head, &objs);
> +	obj = bo->ttm.base.resv;
> +	ww_acquire_init(ww, &reservation_ww_class);
> +
> +	if (intr)
> +		ret = dma_resv_lock_interruptible(obj, ww);
> +	else
> +		ret = dma_resv_lock(obj, ww);
> +
> +	if (unlikely(ret))
> +		return ret;
>  
> -	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> +	num_resv = max(num_resv, 1);
> +	return dma_resv_reserve_fences(obj, num_resv);

Why not just use drm_exec here?

>  }
>  
>  void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww)
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 06de3330211d..2ba34a8c9b66 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -11,7 +11,6 @@
>  #include <drm/drm_mm.h>
>  #include <drm/ttm/ttm_bo.h>
>  #include <drm/ttm/ttm_device.h>
> -#include <drm/ttm/ttm_execbuf_util.h>
>  #include <drm/ttm/ttm_placement.h>
>  
>  struct xe_device;
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index ea869f2452ef..ff41fa828c1c 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -6,6 +6,7 @@
>  #include "xe_exec.h"
>  
>  #include <drm/drm_device.h>
> +#include <drm/drm_exec.h>
>  #include <drm/drm_file.h>
>  #include <drm/xe_drm.h>
>  
> @@ -91,21 +92,16 @@
>   *	Unlock all
>   */
>  
> -static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
> -			 struct ttm_validate_buffer tv_onstack[],
> -			 struct ttm_validate_buffer **tv,
> -			 struct list_head *objs)
> +static int xe_exec_begin(struct xe_engine *e, struct drm_exec *exec)
>  {
>  	struct xe_vm *vm = e->vm;
>  	struct xe_vma *vma;
> -	LIST_HEAD(dups);
>  	int err;
>  
> -	*tv = NULL;
>  	if (xe_vm_no_dma_fences(e->vm))
>  		return 0;
>  
> -	err = xe_vm_lock_dma_resv(vm, ww, tv_onstack, tv, objs, true, 1);
> +	err = xe_vm_lock_dma_resv(vm, exec, 1);
>  	if (err)
>  		return err;
>  
> @@ -120,8 +116,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
>  
>  		err = xe_bo_validate(vma->bo, vm, false);
>  		if (err) {
> -			xe_vm_unlock_dma_resv(vm, tv_onstack, *tv, ww, objs);
> -			*tv = NULL;
> +			xe_vm_unlock_dma_resv(vm);
>  			return err;
>  		}
>  	}
> @@ -129,14 +124,10 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
>  	return 0;
>  }
>  
> -static void xe_exec_end(struct xe_engine *e,
> -			struct ttm_validate_buffer *tv_onstack,
> -			struct ttm_validate_buffer *tv,
> -			struct ww_acquire_ctx *ww,
> -			struct list_head *objs)
> +static void xe_exec_end(struct xe_engine *e)
>  {
>  	if (!xe_vm_no_dma_fences(e->vm))
> -		xe_vm_unlock_dma_resv(e->vm, tv_onstack, tv, ww, objs);
> +		xe_vm_unlock_dma_resv(e->vm);
>  }
>  
>  int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> @@ -149,14 +140,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	struct xe_engine *engine;
>  	struct xe_sync_entry *syncs = NULL;
>  	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> -	struct ttm_validate_buffer *tv = NULL;
>  	u32 i, num_syncs = 0;
>  	struct xe_sched_job *job;
>  	struct dma_fence *rebind_fence;
>  	struct xe_vm *vm;
> -	struct ww_acquire_ctx ww;
> -	struct list_head objs;
> +	struct drm_exec exec;
>  	bool write_locked;
>  	int err = 0;
>  
> @@ -267,7 +255,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  			goto err_unlock_list;
>  	}
>  
> -	err = xe_exec_begin(engine, &ww, tv_onstack, &tv, &objs);
> +	drm_exec_init(&exec, true);
> +	err = xe_exec_begin(engine, &exec);

Move drm_exec_init to xe_exec_begin or xe_vm_lock_dma_resv?

>  	if (err)
>  		goto err_unlock_list;
>  
> @@ -373,8 +362,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	if (err)
>  		xe_sched_job_put(job);
>  err_engine_end:
> -	xe_exec_end(engine, tv_onstack, tv, &ww, &objs);
> +	xe_exec_end(engine);
>  err_unlock_list:
> +	drm_exec_fini(&exec);

Move to xe_exec_end / or better yet xe_vm_unlock_dma_resv.

>  	if (write_locked)
>  		up_write(&vm->lock);
>  	else
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 1677640e1075..ffa8119f88c5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -8,8 +8,8 @@
>  #include <linux/bitfield.h>
>  #include <linux/circ_buf.h>
>  
> +#include <drm/drm_exec.h>
>  #include <drm/drm_managed.h>
> -#include <drm/ttm/ttm_execbuf_util.h>
>  
>  #include "xe_bo.h"
>  #include "xe_gt.h"
> @@ -110,10 +110,8 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	struct xe_vm *vm;
>  	struct xe_vma *vma = NULL;
>  	struct xe_bo *bo;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> -	struct ttm_validate_buffer tv_bo, tv_vm;
>  	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	struct dma_fence *fence;
>  	bool write_locked;
>  	int ret = 0;
> @@ -174,19 +172,25 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	if (only_needs_bo_lock(bo)) {
>  		/* This path ensures the BO's LRU is updated */
>  		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
> +		if (ret)
> +			goto unlock_vm;
>  	} else {
> -		tv_vm.num_shared = xe->info.tile_count;
> -		tv_vm.bo = xe_vm_ttm_bo(vm);
> -		list_add(&tv_vm.head, &objs);
> -		if (bo) {
> -			tv_bo.bo = &bo->ttm;
> -			tv_bo.num_shared = xe->info.tile_count;
> -			list_add(&tv_bo.head, &objs);
> +		drm_exec_init(&exec, false);
> +		drm_exec_while_not_all_locked(&exec) {
> +			ret = drm_exec_prepare_obj(&exec, &xe_vm_ttm_bo(vm)->base,
> +						   xe->info.tile_count);
> +			drm_exec_continue_on_contention(&exec);
> +			if (ret)
> +				goto unlock_dma_resv;
> +			if (bo) {
> +				ret = drm_exec_prepare_obj(&exec, &bo->ttm.base,
> +							   xe->info.tile_count);
> +				drm_exec_continue_on_contention(&exec);
> +				if (ret)
> +					goto unlock_dma_resv;
> +			}
>  		}
> -		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
>  	}
> -	if (ret)
> -		goto unlock_vm;
>  
>  	if (atomic) {
>  		if (xe_vma_is_userptr(vma)) {
> @@ -230,7 +234,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	if (only_needs_bo_lock(bo))
>  		xe_bo_unlock(bo, &ww);
>  	else
> -		ttm_eu_backoff_reservation(&ww, &objs);
> +		drm_exec_fini(&exec);
>  unlock_vm:
>  	if (!ret)
>  		vm->usm.last_fault_vma = vma;
> @@ -501,10 +505,8 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>  	struct xe_vm *vm;
>  	struct xe_vma *vma;
>  	struct xe_bo *bo;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> -	struct ttm_validate_buffer tv_bo, tv_vm;
>  	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>  	int ret = 0;
>  
>  	/* We only support ACC_TRIGGER at the moment */
> @@ -540,25 +542,34 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>  	if (only_needs_bo_lock(bo)) {
>  		/* This path ensures the BO's LRU is updated */
>  		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
> +		if (ret)
> +			goto unlock_vm;
>  	} else {
> -		tv_vm.num_shared = xe->info.tile_count;
> -		tv_vm.bo = xe_vm_ttm_bo(vm);
> -		list_add(&tv_vm.head, &objs);
> -		tv_bo.bo = &bo->ttm;
> -		tv_bo.num_shared = xe->info.tile_count;
> -		list_add(&tv_bo.head, &objs);
> -		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> +		drm_exec_init(&exec, false);
> +		drm_exec_while_not_all_locked(&exec) {
> +			ret = drm_exec_prepare_obj(&exec, &xe_vm_ttm_bo(vm)->base,
> +						   xe->info.tile_count);
> +			drm_exec_continue_on_contention(&exec);
> +			if (ret)
> +				goto unlock_dma_resv;
> +			if (bo) {
> +				ret = drm_exec_prepare_obj(&exec, &bo->ttm.base,
> +							   xe->info.tile_count);
> +				drm_exec_continue_on_contention(&exec);
> +				if (ret)
> +					goto unlock_dma_resv;
> +			}
> +		}
>  	}
> -	if (ret)
> -		goto unlock_vm;
>  
>  	/* Migrate to VRAM, move should invalidate the VMA first */
>  	ret = xe_bo_migrate(bo, XE_PL_VRAM0 + gt->info.vram_id);
>  
> +unlock_dma_resv:
>  	if (only_needs_bo_lock(bo))
>  		xe_bo_unlock(bo, &ww);
>  	else
> -		ttm_eu_backoff_reservation(&ww, &objs);
> +		drm_exec_fini(&exec);
>  unlock_vm:
>  	up_read(&vm->lock);
>  	xe_vm_put(vm);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index bdf82d34eb66..be6fd30ca1ee 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -7,7 +7,7 @@
>  
>  #include <linux/dma-fence-array.h>
>  
> -#include <drm/ttm/ttm_execbuf_util.h>
> +#include <drm/drm_exec.h>
>  #include <drm/ttm/ttm_tt.h>
>  #include <drm/xe_drm.h>
>  #include <linux/kthread.h>
> @@ -317,11 +317,8 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
>  
>  int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
>  {
> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> -	struct ttm_validate_buffer *tv;
> -	struct ww_acquire_ctx ww;
> -	struct list_head objs;
>  	struct dma_fence *pfence;
> +	struct drm_exec exec;
>  	int err;
>  	bool wait;
>  
> @@ -329,7 +326,8 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
>  
>  	down_write(&vm->lock);
>  
> -	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs, true, 1);
> +	drm_exec_init(&exec, true);
> +	err = xe_vm_lock_dma_resv(vm, &exec, 1);
>  	if (err)
>  		goto out_unlock_outer;
>  
> @@ -363,8 +361,9 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
>  	up_read(&vm->userptr.notifier_lock);
>  
>  out_unlock:
> -	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
> +	xe_vm_unlock_dma_resv(vm);
>  out_unlock_outer:
> +	drm_exec_fini(&exec);
>  	up_write(&vm->lock);
>  
>  	return err;
> @@ -393,68 +392,41 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
>   * xe_vm_lock_dma_resv() - Lock the vm dma_resv object and the dma_resv
>   * objects of the vm's external buffer objects.
>   * @vm: The vm.
> - * @ww: Pointer to a struct ww_acquire_ctx locking context.
> - * @tv_onstack: Array size XE_ONSTACK_TV of storage for the struct
> - * ttm_validate_buffers used for locking.
> - * @tv: Pointer to a pointer that on output contains the actual storage used.
> - * @objs: List head for the buffer objects locked.
> - * @intr: Whether to lock interruptible.
> + * @exec: Pointer to a struct drm_exec execution context.
>   * @num_shared: Number of dma-fence slots to reserve in the locked objects.
>   *
>   * Locks the vm dma-resv objects and all the dma-resv objects of the
> - * buffer objects on the vm external object list. The TTM utilities require
> - * a list of struct ttm_validate_buffers pointing to the actual buffer
> - * objects to lock. Storage for those struct ttm_validate_buffers should
> - * be provided in @tv_onstack, and is typically reserved on the stack
> - * of the caller. If the size of @tv_onstack isn't sufficient, then
> - * storage will be allocated internally using kvmalloc().
> + * buffer objects on the vm external object list using helpers provided
> + * by drm_exec.
>   *
>   * The function performs deadlock handling internally, and after a
>   * successful return the ww locking transaction should be considered
>   * sealed.
>   *
> - * Return: 0 on success, Negative error code on error. In particular if
> - * @intr is set to true, -EINTR or -ERESTARTSYS may be returned. In case
> - * of error, any locking performed has been reverted.
> + * Return: 0 on success, Negative error code on error.
>   */
> -int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> -			struct ttm_validate_buffer *tv_onstack,
> -			struct ttm_validate_buffer **tv,
> -			struct list_head *objs,
> -			bool intr,
> +int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
>  			unsigned int num_shared)
>  {
> -	struct ttm_validate_buffer *tv_vm, *tv_bo;
>  	struct xe_vma *vma, *next;
> -	LIST_HEAD(dups);
> +	struct drm_gem_object *obj;
>  	int err;
>  
>  	lockdep_assert_held(&vm->lock);
>  
> -	if (vm->extobj.entries < XE_ONSTACK_TV) {
> -		tv_vm = tv_onstack;
> -	} else {
> -		tv_vm = kvmalloc_array(vm->extobj.entries + 1, sizeof(*tv_vm),
> -				       GFP_KERNEL);
> -		if (!tv_vm)
> -			return -ENOMEM;
> +	drm_exec_while_not_all_locked(exec) {
> +		err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base, num_shared);
> +		drm_exec_break_on_contention(exec);

drm_exec_continue_on_contention

> +		if (unlikely(err) && err != -EALREADY)
> +			goto error;
> +		list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
> +			obj = &vma->bo->ttm.base;
> +			err = drm_exec_prepare_obj(exec, obj, num_shared);
> +			drm_exec_break_on_contention(exec);
> +			if (unlikely(err) && err != -EALREADY)
> +				goto error;
> +		}
>  	}
> -	tv_bo = tv_vm + 1;
> -
> -	INIT_LIST_HEAD(objs);
> -	list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
> -		tv_bo->num_shared = num_shared;
> -		tv_bo->bo = &vma->bo->ttm;
> -
> -		list_add_tail(&tv_bo->head, objs);
> -		tv_bo++;
> -	}
> -	tv_vm->num_shared = num_shared;
> -	tv_vm->bo = xe_vm_ttm_bo(vm);
> -	list_add_tail(&tv_vm->head, objs);
> -	err = ttm_eu_reserve_buffers(ww, objs, intr, &dups);
> -	if (err)
> -		goto out_err;
>  
>  	spin_lock(&vm->notifier.list_lock);
>  	list_for_each_entry_safe(vma, next, &vm->notifier.rebind_list,
> @@ -466,14 +438,9 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>  			list_move_tail(&vma->rebind_link, &vm->rebind_list);
>  	}
>  	spin_unlock(&vm->notifier.list_lock);
> -
> -	*tv = tv_vm;
>  	return 0;
>  
> -out_err:
> -	if (tv_vm != tv_onstack)
> -		kvfree(tv_vm);
> -
> +error:
>  	return err;
>  }
>  
> @@ -481,19 +448,11 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>   * xe_vm_unlock_dma_resv() - Unlock reservation objects locked by
>   * xe_vm_lock_dma_resv()
>   * @vm: The vm.
> - * @tv_onstack: The @tv_onstack array given to xe_vm_lock_dma_resv().
> - * @tv: The value of *@tv given by xe_vm_lock_dma_resv().
> - * @ww: The ww_acquire_context used for locking.
> - * @objs: The list returned from xe_vm_lock_dma_resv().
>   *
>   * Unlocks the reservation objects and frees any memory allocated by
>   * xe_vm_lock_dma_resv().
>   */
> -void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> -			   struct ttm_validate_buffer *tv_onstack,
> -			   struct ttm_validate_buffer *tv,
> -			   struct ww_acquire_ctx *ww,
> -			   struct list_head *objs)
> +void xe_vm_unlock_dma_resv(struct xe_vm *vm)
>  {
>  	/*
>  	 * Nothing should've been able to enter the list while we were locked,
> @@ -502,21 +461,14 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>  	 * addition, and we shouldn't add ourselves.
>  	 */
>  	XE_WARN_ON(!list_empty(&vm->notifier.rebind_list));


Call drm_exec_fini(&exec) here? Also probably need a LRU update for TTM here too.

> -
> -	ttm_eu_backoff_reservation(ww, objs);
> -	if (tv && tv != tv_onstack)
> -		kvfree(tv);
>  }
>  
>  static void preempt_rebind_work_func(struct work_struct *w)
>  {
>  	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
>  	struct xe_vma *vma;
> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> -	struct ttm_validate_buffer *tv;
> -	struct ww_acquire_ctx ww;
> -	struct list_head objs;
>  	struct dma_fence *rebind_fence;
> +	struct drm_exec exec;
>  	unsigned int fence_count = 0;
>  	LIST_HEAD(preempt_fences);
>  	int err;
> @@ -556,8 +508,8 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  			goto out_unlock_outer;
>  	}
>  
> -	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs,
> -				  false, vm->preempt.num_engines);
> +	drm_exec_init(&exec, false);
> +	err = xe_vm_lock_dma_resv(vm, &exec, vm->preempt.num_engines);
>  	if (err)
>  		goto out_unlock_outer;
>  
> @@ -631,8 +583,9 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	up_read(&vm->userptr.notifier_lock);
>  
>  out_unlock:
> -	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
> +	xe_vm_unlock_dma_resv(vm);
>  out_unlock_outer:
> +	drm_exec_fini(&exec);
>  	if (err == -EAGAIN) {
>  		trace_xe_vm_rebind_worker_retry(vm);
>  		goto retry;
> @@ -979,27 +932,28 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  
>  static void xe_vma_destroy_unlocked(struct xe_vma *vma)
>  {
> -	struct ttm_validate_buffer tv[2];
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
> +	struct drm_gem_object *obj;
>  	struct xe_bo *bo = vma->bo;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
>  	int err;
>  
> -	memset(tv, 0, sizeof(tv));
> -	tv[0].bo = xe_vm_ttm_bo(vma->vm);
> -	list_add(&tv[0].head, &objs);
> -
> -	if (bo) {
> -		tv[1].bo = &xe_bo_get(bo)->ttm;
> -		list_add(&tv[1].head, &objs);
> +	if (bo)
> +		obj = &xe_bo_get(bo)->ttm.base;
> +	drm_exec_init(&exec, false);
> +	drm_exec_while_not_all_locked(&exec) {
> +		err = drm_exec_prepare_obj(&exec, &xe_vm_ttm_bo(vma->vm)->base, 1);
> +		drm_exec_continue_on_contention(&exec);
> +		XE_WARN_ON(err);
> +		if (obj) {
> +			err = drm_exec_prepare_obj(&exec, obj, 1);
> +			drm_exec_continue_on_contention(&exec);
> +			XE_WARN_ON(err);
> +		}

Helper lock function, don't open code these loops.

>  	}
> -	err = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> -	XE_WARN_ON(err);
>  
>  	xe_vma_destroy(vma, NULL);
>  
> -	ttm_eu_backoff_reservation(&ww, &objs);
> +	drm_exec_fini(&exec);
>  	if (bo)
>  		xe_bo_put(bo);
>  }
> @@ -2008,12 +1962,6 @@ struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
>  	return &vm->pt_root[idx]->bo->ttm;
>  }
>  
> -static void xe_vm_tv_populate(struct xe_vm *vm, struct ttm_validate_buffer *tv)
> -{
> -	tv->num_shared = 1;
> -	tv->bo = xe_vm_ttm_bo(vm);
> -}
> -
>  static bool is_map_op(u32 op)
>  {
>  	return VM_BIND_OP(op) == XE_VM_BIND_OP_MAP ||
> @@ -2032,11 +1980,9 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
>  			 struct xe_sync_entry *syncs, u32 num_syncs,
>  			 struct async_op_fence *afence)
>  {
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> -	struct ttm_validate_buffer tv_bo, tv_vm;
> -	struct ww_acquire_ctx ww;
>  	struct xe_bo *vbo;
> +	struct drm_exec exec;
> +	struct ttm_buffer_object *obj;
>  	int err, i;
>  
>  	lockdep_assert_held(&vm->lock);
> @@ -2053,8 +1999,6 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
>  		return 0;
>  	}
>  
> -	xe_vm_tv_populate(vm, &tv_vm);
> -	list_add_tail(&tv_vm.head, &objs);
>  	vbo = vma->bo;
>  	if (vbo) {
>  		/*
> @@ -2063,29 +2007,41 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
>  		 * take a reference here.
>  		 */
>  		xe_bo_get(vbo);
> -
> -		tv_bo.bo = &vbo->ttm;
> -		tv_bo.num_shared = 1;
> -		list_add(&tv_bo.head, &objs);
>  	}
> +	obj = xe_vm_ttm_bo(vm);
>  
>  again:
> -	err = ttm_eu_reserve_buffers(&ww, &objs, true, &dups);
> -	if (!err) {
> -		err = __vm_bind_ioctl(vm, vma, e, bo,
> -				      bind_op->op, bind_op->region, syncs,
> -				      num_syncs, afence);
> -		ttm_eu_backoff_reservation(&ww, &objs);
> -		if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
> -			lockdep_assert_held_write(&vm->lock);
> -			err = xe_vma_userptr_pin_pages(vma);
> -			if (!err)
> -				goto again;
> -		}
> +	drm_exec_init(&exec, true);
> +	drm_exec_while_not_all_locked(&exec) {
> +		if (vbo) {
> +			err = drm_exec_prepare_obj(&exec, &vbo->ttm.base, 1);
> +			drm_exec_continue_on_contention(&exec);
> +			if (unlikely(err))
> +				goto error;
> +		}
> +		err = drm_exec_prepare_obj(&exec, &obj->base, 1);
> +		drm_exec_break_on_contention(&exec);
> +		if (err && err != -EALREADY)
> +			goto error;
> +	}
> +	err = __vm_bind_ioctl(vm, vma, e, bo,
> +			      bind_op->op, bind_op->region, syncs,
> +			      num_syncs, afence);
> +	drm_exec_fini(&exec);

Same here, don't open code this.

Matt

> +	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
> +		lockdep_assert_held_write(&vm->lock);
> +		err = xe_vma_userptr_pin_pages(vma);
> +		if (!err)
> +			goto again;
>  	}
>  	xe_bo_put(vbo);
>  
>  	return err;
> +
> +error:
> +	drm_exec_fini(&exec);
> +	xe_bo_put(vbo);
> +	return err;
>  }
>  
>  struct async_op {
> @@ -3291,17 +3247,24 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>  	       int num_resv, bool intr)
>  {
> -	struct ttm_validate_buffer tv_vm;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> +	struct dma_resv *obj;
> +	int ret;
>  
>  	XE_BUG_ON(!ww);
>  
> -	tv_vm.num_shared = num_resv;
> -	tv_vm.bo = xe_vm_ttm_bo(vm);;
> -	list_add_tail(&tv_vm.head, &objs);
> +	obj = xe_vm_ttm_bo(vm)->base.resv;
> +	ww_acquire_init(ww, &reservation_ww_class);
> +
> +	if (intr)
> +		ret = dma_resv_lock_interruptible(obj, ww);
> +	else
> +		ret = dma_resv_lock(obj, ww);
> +
> +	if (unlikely(ret))
> +		return ret;
>  
> -	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> +	num_resv = max(num_resv, 1);
> +	return dma_resv_reserve_fences(obj, num_resv);
>  }
>  
>  void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 748dc16ebed9..3fdcef3793e5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_VM_H_
>  #define _XE_VM_H_
>  
> +#include <drm/drm_exec.h>
> +
>  #include "xe_macros.h"
>  #include "xe_map.h"
>  #include "xe_vm_types.h"
> @@ -124,23 +126,10 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma);
>  
>  int xe_vma_userptr_check_repin(struct xe_vma *vma);
>  
> -/*
> - * XE_ONSTACK_TV is used to size the tv_onstack array that is input
> - * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
> - */
> -#define XE_ONSTACK_TV 20
> -int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> -			struct ttm_validate_buffer *tv_onstack,
> -			struct ttm_validate_buffer **tv,
> -			struct list_head *objs,
> -			bool intr,
> +int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
>  			unsigned int num_shared);
>  
> -void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> -			   struct ttm_validate_buffer *tv_onstack,
> -			   struct ttm_validate_buffer *tv,
> -			   struct ww_acquire_ctx *ww,
> -			   struct list_head *objs);
> +void xe_vm_unlock_dma_resv(struct xe_vm *vm);
>  
>  void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
>  			     enum dma_resv_usage usage);
> -- 
> 2.25.1
> 
