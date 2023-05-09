Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E745C7EE22
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 22:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122EB10E407;
	Tue,  9 May 2023 22:10:38 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98FE10E407
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 22:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683670236; x=1715206236;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vg0vvNz4Q4htszvj3w0/PMRsYz4nxoaqGstl0NW6mcs=;
 b=SelnVLrGOIb0uAd6Lmw+uwDRUgF85uS/J4Xw8gZT0Jsf5Yidt2KspFVt
 s1HyJ88dO1FS7DueVcWFEkb3118tAt/CdolLmYFBb9Obo9xZu6YNf5egq
 e/O7KGED9iOxg9GTj9QxHQqknv08+ZRhmJB/kY/zOeDdqTpNAz0Z7ujBh
 zh6sLjUI8li1tkw0PC3sE3cx2a5lmU5zzvqpd89oCQbdI9heO72zP6s12
 gZs2dwYRJxJS6I1BRluJ3ikubrK6hj91UW0hS/50yv/h/DjAAWttMcWSX
 0JL24z+j0lsxlIoSC1iY03KZ1WEJrEuHxPjErJ50QAEs9NlpW8yX6anjL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="348897666"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="348897666"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 15:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="873348385"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="873348385"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 09 May 2023 15:10:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 15:10:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 15:10:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 15:10:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 15:10:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHXM2AfgFjIKo/vK4nOIJU+wtklAWPsSqpwlZs1G0cynIfpRFQKEezPuKzyJoWK0JRcvCNkYyZYS/KAt7TNbnxRJu/XQoaWitr7kGyDntPdY6/r/4fOgdSbyOIgT03lCY+CwvYKJic31ftpQkFYSrEGiE5OKXLyp8ZVjU6BItYs1v1MynTsMlUz8X+EqWflOT5YAuhG6hKsMTrOLYdibLhmevYMWb6FgADO1sG4kG2NAZML1TA9ruW01WU+3zfRuJ2w8RJ6Ei7OOMm4/bnTSVJ+5V0ibh0FPcWr5FYd0XcuB56Kkc9B3fWlztok7kgGyOkqCGNsrapUpae9UHKHEiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdA8HdouigPcA3lItKo8EQahad9HzAvK5QYFPQsFV/o=;
 b=NqrTa1OIOA4KOhO8p5OSgK5PgvTEVS+CLr/gITOxDO9zg5nmh9XD0brjZt9fv6zNnTip2lthm4CG5s2OakqreDQfYEe35hJoQRQkvyy1HRRQm5AYLafQgDdJJjKmUazsKzlt8hMx1cwWk5vwm2EDkgw2l4XhGa1v1IUr5f+qeWS2Hw5E4l/TT/gq7Nx/633eJI8QfC3GWK77biR/hMULKpYW6oO2Ie/zD332j75qBNgdUdRnk/0OdtgNqOHLgWj6aqwMW13+Opunf+6D9igQExkORfWk7BcdRDtz4LoyLZaNirJ+hCLH9oSi2ULF9fUWHlVVgv9Zp3A7OcFItOZ5Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH0PR11MB8166.namprd11.prod.outlook.com (2603:10b6:610:182::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 22:10:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 22:10:32 +0000
Date: Tue, 9 May 2023 22:09:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZFrEtWAm5jZwcH0t@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-9-matthew.brost@intel.com>
 <ZFlsAMZ7Zfwf97K/@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZFlsAMZ7Zfwf97K/@intel.com>
X-ClientProxiedBy: BYAPR11CA0047.namprd11.prod.outlook.com
 (2603:10b6:a03:80::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH0PR11MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: 6233b2b3-d5a6-45da-5f4e-08db50da34cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z3SCjyQZJ/frOUyd8R4nBUYuHyLmDjOAp1s26RS7XASBfrK2dAFHP1vo0Q3j4aLg4jXet2MKJIEAEM/2XoT4/DqCZMel+a2QUJqQJ5rxme5C+rEfNXbVoILF+N3cL7jyE/pDUvVZjuufQD2uSfI8mjJH9qm6MmOyxXp1UF34sISYD34dPh6HCAxu6beCkAXT98ZU3GG2arhv1oDkw2PdXXdp7w4rADInzei3ctRc4Si/QC805BozaWCrELYRZI7ayaGkqdTOLNM4IOrFuzcqDRfguiQyntUP5NV5GjyFezhM1UUZLa0miTy1NMmHr/cF9sMaBNsDfrD9zKHy//YXECvBqAUKlrqmKgGDLMHl9ZLW5V9uk3lRqgyD7UpL3I7lc8lDxkuoC4+BGnXQjHLgTKfs8+rzwfi7k2UbPDJez4Z8CWUhJ+SDSK3/7xzFmT5CZeczhu4sSTkEnubtMrziH+XPZXD9mOvnioiMiWxNQLFLf7JLaeTiIwxOGloVF2eobUfD1yZAAdBwN2fXitRtd1J/B9jQXZpF4wwwpdtu0rXztx8qSijZPcrcUI9eVQxk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199021)(4326008)(478600001)(66946007)(66476007)(66556008)(6666004)(6486002)(6636002)(316002)(86362001)(83380400001)(6506007)(6512007)(26005)(2906002)(8936002)(6862004)(5660300002)(44832011)(41300700001)(8676002)(82960400001)(186003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NXJqPGffgcGD6h6aEQ93M8Eep8k+hRAM2iqCie+lXfxHqxv7N7M+qGBMhE89?=
 =?us-ascii?Q?2HT6Ji/dMCls8vXkX9upqsb86FrOLvaQfIaMbyX+RWHruVhCf/xqNr9PwIvH?=
 =?us-ascii?Q?5f+Z3clV08IdkdhF1M93kbr1e0+PYDARlWh5yT9L/m+xKNC2R3uMr4P+7A7s?=
 =?us-ascii?Q?Py/doaoZ7tT2gqQPOCn7IJMcVdy3x/NhXgVkuC2hR6d+Hh5TP67DioxfWZDv?=
 =?us-ascii?Q?T9a4zSUEB5x8xXkJIk6/mm/4mZyuwa9TMD+alS/KjgOSpiZMYl61VdwS9448?=
 =?us-ascii?Q?boXEjQ96PYTkTHtX1WgEd5oRRtwHoY8X9EWCa952i12FAv9zqS9Q9dzUJckC?=
 =?us-ascii?Q?lgOcCzJhIDrpt4KcTyX78k8GY/jRJYavBpbQSeDFUcyfccI/sLHNd+XjMJuu?=
 =?us-ascii?Q?85tX5J1FIg9W+EKy8iJhvjLLTLXl51R6d2b9vPWHiIxg5APoHSK/2APmJPVZ?=
 =?us-ascii?Q?ZByfV6i8oWmuuxicQI6qvc9ZfkKUSlZRqXs2ZOLhvqk2ziTPRixRurfWjMS6?=
 =?us-ascii?Q?9cZOl9iu+T08EPB2zIvtyTirR+ys9SjMzA0HGFP/X5LlcAcyHFtmI8srIiAe?=
 =?us-ascii?Q?wzK61sHeF8F2dbSSLgsm8IFZpXDobc+9E2bS3DePNcPk4Jmpd83MdOaMGL4E?=
 =?us-ascii?Q?9YcT+CnYlxKrKSjzCG8zimJdW+NiRqOOC98f2Ab9uPgeWcNnWEhgG2mH2bpZ?=
 =?us-ascii?Q?7N0SzfduUCcTJU/GwZYKDQOz6NNM+kG/PgyzTPrMpNfiqP8GkQSGrC0KPRHp?=
 =?us-ascii?Q?jrHO2sFe7ISzd+ONhq3gU2ENDRx95TdQv8CXjBP8AzBzu48BaLkL2EhRRceZ?=
 =?us-ascii?Q?IYI5qWPdsEN4XKeD73L5KSfehSoQkyXy8WqiexXpSQNPGKlBlQ0NpZnCUqeX?=
 =?us-ascii?Q?/Y/dA+YeG5JoS2fhspWJ4+T72r7Aijrx1IDyFiQWiUiUaUIyg3FGmf/jkveX?=
 =?us-ascii?Q?cGpHlcSW3ucwddXGytJCGxR4iwi1IGJEu3T7TR5Q38pExT8ZEvVhZ9pj7DqY?=
 =?us-ascii?Q?MNpHhdJS0/NYiC+LkgsIVtj15wweR6miyh7DrV/JegYH/G9/7gKTmmaRxrJE?=
 =?us-ascii?Q?EY9O038sWvDA5el1Xn7Sg7V2/b2/q8FZaSBkzaAV76f1bby2r3Z8rrPHvF12?=
 =?us-ascii?Q?hw6JNurrY5ko5vBrgauJf6UkjU32iOVDbOZ1ZKZluMG+fakoBg4i0zvm4UnW?=
 =?us-ascii?Q?wJARF7j8R92Lno8usES+8YUYVYc5kVM8mxHH6/2Emz8DDfu0OIzIUHi+HMp0?=
 =?us-ascii?Q?rhM+sKCu93BZGKB3dWwFqXIKUkxwyKDDxPpL7hS5Ppwzfpjd1kfe0qZ0a7Rd?=
 =?us-ascii?Q?dcwsNMBuE5MjZ/B+AGDxGbn3tnPpnFjnBTtOFkRI5Xgj7V14xXxHJ1mSpot1?=
 =?us-ascii?Q?7+Xze8BV0TuQWtH3FnbsTYdVcyVzJN74ttcY/O+WDTSrYZIkPIlOavcjc3nT?=
 =?us-ascii?Q?4RMouiWsaL3JWXAXOl+WmtWzl3fzFnOhCgMGrRX7WQzVDx/tFcrait720+k6?=
 =?us-ascii?Q?oPtgeM2tYgNCMzQQvEVNhSOxlh0bodj0qHpl9FCufGrr1UbJ0KKaUtSqAk8g?=
 =?us-ascii?Q?UmmJgbHqBhFTJfiU9z+sLtENSTK0o9Akl91AXhrB42ysW8D2fbwKOb+sAUEc?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6233b2b3-d5a6-45da-5f4e-08db50da34cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 22:10:32.3432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gA2R25yfEBk2k2wCXPDOlcmbCuaTx4mLdufsYTNifHrVFX8J7TDE7oHh3uJnac7PjAO33fJdZHBPF0krfDLQyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8166
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 08/31] drm/xe: VM LRU bulk move
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

On Mon, May 08, 2023 at 05:39:12PM -0400, Rodrigo Vivi wrote:
> On Mon, May 01, 2023 at 05:17:04PM -0700, Matthew Brost wrote:
> > Use the TTM LRU bulk move for BOs tied to a VM. Update the bulk moves
> > LRU position on every exec.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c       | 32 ++++++++++++++++++++++++++++----
> >  drivers/gpu/drm/xe/xe_bo.h       |  4 ++--
> >  drivers/gpu/drm/xe/xe_dma_buf.c  |  2 +-
> >  drivers/gpu/drm/xe/xe_exec.c     |  6 ++++++
> >  drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
> >  5 files changed, 40 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 3ab404e33fae..da99ee53e7d7 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -985,6 +985,23 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
> >  	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
> >  }
> >  
> > +static void xe_gem_object_close(struct drm_gem_object *obj,
> > +				struct drm_file *file_priv)
> > +{
> > +	struct xe_bo *bo = gem_to_xe_bo(obj);
> > +
> > +	if (bo->vm && !xe_vm_no_dma_fences(bo->vm)) {
> > +		struct ww_acquire_ctx ww;
> > +
> > +		XE_BUG_ON(!xe_bo_is_user(bo));
> 
> We need to really stop using BUG_ON and move towards the usage of more WARNs.
> 

If that is the direction, sure I'll change this but personally I BUG_ON
for things that should be impossible with a correct KMD.

Matt 

> But the rest of the patch looks good to me... I just believe it would be
> good to get Thomas' review here.
> 
> > +
> > +		xe_bo_lock(bo, &ww, 0, false);
> > +		ttm_bo_set_bulk_move(&bo->ttm, NULL);
> > +		xe_bo_unlock(bo, &ww);
> > +	}
> > +}
> > +
> > +
> >  static bool should_migrate_to_system(struct xe_bo *bo)
> >  {
> >  	struct xe_device *xe = xe_bo_device(bo);
> > @@ -1040,6 +1057,7 @@ static const struct vm_operations_struct xe_gem_vm_ops = {
> >  
> >  static const struct drm_gem_object_funcs xe_gem_object_funcs = {
> >  	.free = xe_gem_object_free,
> > +	.close = xe_gem_object_close,
> >  	.mmap = drm_gem_ttm_mmap,
> >  	.export = xe_gem_prime_export,
> >  	.vm_ops = &xe_gem_vm_ops,
> > @@ -1081,8 +1099,8 @@ void xe_bo_free(struct xe_bo *bo)
> >  
> >  struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> >  				    struct xe_gt *gt, struct dma_resv *resv,
> > -				    size_t size, enum ttm_bo_type type,
> > -				    u32 flags)
> > +				    struct ttm_lru_bulk_move *bulk, size_t size,
> > +				    enum ttm_bo_type type, u32 flags)
> >  {
> >  	struct ttm_operation_ctx ctx = {
> >  		.interruptible = true,
> > @@ -1149,7 +1167,10 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> >  		return ERR_PTR(err);
> >  
> >  	bo->created = true;
> > -	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> > +	if (bulk)
> > +		ttm_bo_set_bulk_move(&bo->ttm, bulk);
> > +	else
> > +		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> >  
> >  	return bo;
> >  }
> > @@ -1219,7 +1240,10 @@ xe_bo_create_locked_range(struct xe_device *xe,
> >  		}
> >  	}
> >  
> > -	bo = __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL, size,
> > +	bo = __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL,
> > +				   vm && !xe_vm_no_dma_fences(vm) &&
> > +				   flags & XE_BO_CREATE_USER_BIT ?
> > +				   &vm->lru_bulk_move : NULL, size,
> >  				   type, flags);
> >  	if (IS_ERR(bo))
> >  		return bo;
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index 8354d05ccdf3..25457b3c757b 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -81,8 +81,8 @@ void xe_bo_free(struct xe_bo *bo);
> >  
> >  struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> >  				    struct xe_gt *gt, struct dma_resv *resv,
> > -				    size_t size, enum ttm_bo_type type,
> > -				    u32 flags);
> > +				    struct ttm_lru_bulk_move *bulk, size_t size,
> > +				    enum ttm_bo_type type, u32 flags);
> >  struct xe_bo *
> >  xe_bo_create_locked_range(struct xe_device *xe,
> >  			  struct xe_gt *gt, struct xe_vm *vm,
> > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> > index 9b252cc782b7..975dee1f770f 100644
> > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > @@ -199,7 +199,7 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
> >  	int ret;
> >  
> >  	dma_resv_lock(resv, NULL);
> > -	bo = __xe_bo_create_locked(xe, storage, NULL, resv, dma_buf->size,
> > +	bo = __xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
> >  				   ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
> >  	if (IS_ERR(bo)) {
> >  		ret = PTR_ERR(bo);
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index 44ea9bcd0066..21a9c2fddf86 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -374,6 +374,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  	xe_sched_job_push(job);
> >  	xe_vm_reactivate_rebind(vm);
> >  
> > +	if (!err && !xe_vm_no_dma_fences(vm)) {
> > +		spin_lock(&xe->ttm.lru_lock);
> > +		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> > +		spin_unlock(&xe->ttm.lru_lock);
> > +	}
> > +
> >  err_repin:
> >  	if (!xe_vm_no_dma_fences(vm))
> >  		up_read(&vm->userptr.notifier_lock);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index fada7896867f..d3e99f22510d 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -164,6 +164,9 @@ struct xe_vm {
> >  	/** Protects @rebind_list and the page-table structures */
> >  	struct dma_resv resv;
> >  
> > +	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
> > +	struct ttm_lru_bulk_move lru_bulk_move;
> > +
> >  	u64 size;
> >  	struct rb_root vmas;
> >  
> > -- 
> > 2.34.1
> > 
