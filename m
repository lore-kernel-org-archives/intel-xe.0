Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65405C54798
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 17:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D9310E108;
	Tue, 27 Feb 2024 17:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMCGu2hX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815E910E153
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 17:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709055353; x=1740591353;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=U+kZvDfW0Vt1XNUnX8UT2/gDa1mebZPMDP/ttvVbbXQ=;
 b=GMCGu2hXsLNhpUfB5uu0lxS0H9Eiue7mefvc9Qm5HF8e2GAMfb/2vF5D
 5xSJ7JnZEjU7x5YpaMJJtQHQ3a7fk28DSAxcfvkG/oEoL8dj4QON5EESZ
 opjfsyy2bGXl7BYCFXcNELdo8vKN7wUVd7jzCcpXChRt3+yEKoy3BdoN3
 nl6MPPuOF9E6zpI62XZpWiP808UUT3HPifiRU/3B2xNDeA3QyqXjQimME
 8Knqk6ioLyaTQWDljGHJLzSWZp4/7xHf256KCtkVnQbnUfDuKdiBi4uup
 vVEeTA6AVLS0OYhBOY3hXQJ827v34wCa8OKQWxDr7QTG6jAjY0cZJLb7D g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3272610"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="3272610"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 09:35:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="11716825"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2024 09:35:51 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 09:35:50 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 09:35:50 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 09:35:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhaMyoOCvXmswuKp7xk1lwB/s1dPu8jJtf+HS2pR3K7xm+JNkYpwfk5tFvaM3LxJbKK4kq1fn2WCzJUdssKQOMsctd8drwrvEqER55lo3yw5fkLiGEyJtlw7Cw0h8zYPVflHUEKcKaPl81gMXOz8V3DN+/cpJzNVP1Bsf8DJWSiQtVi0HIu9LcSJ+FoX8WkpKjav41nt17UkegHiYN9Js6GFwACHUGjJji4zm2xepQpN2Q7BC4kJd+o9PR2xsdntv/2OHV5KcYkN+Irhcx0HPCeBCS1EAvCrd1VGx8nXzTXuDjM2XZWoaQ8MOpN3WpQrZ8UvnVYVuYeLtWWOklhg9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vArO+5rafN+QkIVNixph012Tb4FNrV9PqhmiqaySDVc=;
 b=LjFRqEsaM01WLfuIGeTDUqv9TPGrnRcWHAGtPkPysyCH7mm0Zsnb60McMOKmt121Cg9xpKUdsN8pqV+A4tuAgPfS4nkpj68TYHejVy69n6ddmfBvRHphchuD2M0Rw89bU7ln28/JyfnGoGIMiIosv9G5mAOVxuoJomEeoZshCRIiaCsRYdpMuvxIP6JTgILj35hHVMsNGVwmV+iZqQORbavoHcH1Cjtejsa25X7FoVjJQ0gtHcsz0bTsV0dgDz5wreYn09w7NZ14wqXxD9ViJu7yHFun8NDx8QWPx3JJSPBjyyBsIjLy9x8BnbFcKWHu8ZJSsb77w36OFj6URW+J6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7278.namprd11.prod.outlook.com (2603:10b6:8:10a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Tue, 27 Feb
 2024 17:35:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7339.022; Tue, 27 Feb 2024
 17:35:26 +0000
Date: Tue, 27 Feb 2024 17:35:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 1/3] drm/xe/bo: Forward the decision to evict local
 objects during validation
Message-ID: <Zd4ddz2ZGL0eURI/@DUT025-TGLU.fm.intel.com>
References: <20240226164455.10179-1-thomas.hellstrom@linux.intel.com>
 <20240226164455.10179-2-thomas.hellstrom@linux.intel.com>
 <Zd0ET4wyT5MAOYWn@DUT025-TGLU.fm.intel.com>
 <56502b0edac0c63ac7ec3963be3b473aa659a585.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56502b0edac0c63ac7ec3963be3b473aa659a585.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0089.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 43cc133b-ec04-4d6c-5d49-08dc37ba7bb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MEpD9ku6IE8jLcrMZu8Y0t7ji7cbOP/NA3AGl5Z21dYvYEyu+Wd066IRJNS/QCxyKyAGEX1wDywm1zUDWuQW06KgPIzXNrlARn9ZCwXxNL9DqKH0lWMXuesbc3HYOhFc8SWiLWW5ounvyAKprmJ4r5V8ITUTQ3nHkTOJckIVnJzElg+eKGyLGQ2cVdw+kyDSsB7AC4ICre4G8pe2tKJancmGz+Vsbgxn21VfF6NVq4eD/z9N5f114LLodcSTfYVTbtYi+cNI1jtb1MNty7Sfn5zoFqWUuFheCkkJ98U1gj6kbcyTTTBfX4hRLsHK8oSTZDINM0W6Zl5sxJT8CwWrXsGiYGiUtd8xkUmR4s32Nt1OvrM7YTvEyipzZDHqPT1uiraLTXQOpFbqq3xNpRPtdqbxyjjFG76VmLqf9Btcqva6xcDuo/f4anasrfA0zvktJZImqJhx3qDi9+tKicxkYu8x65q53ORjQVtmPWRGc8ldPL2+TIFiQ+AgqEERdNX+ySZPloRgReNDWf6mcbGcv4PmPL4yXUGrxuLR1rn/f5NsTB3gFj7lZh5DFcusntZiyyjdKOe4sZIkQf06I5kNRAoeCa/FZ4h9h/BPJyhbeDlfEaEMHXztNtOgO0rezxnDWdU8QiN8b5to8zZia5beIKxRWKcI9HGt9QNDZCjirlU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?v6TPq0CELR5z/SyPEtw6ArQARlbDAzqCo6+Pn2ko1kL7lvaI0ZEYCEK9Yr?=
 =?iso-8859-1?Q?iK2TVSpDQg598SgkajHL4A7d+nZ9GymEC5jtWNMI/ErfVMtmCY8AhV7Mvo?=
 =?iso-8859-1?Q?3bOpOuaYtw6V7Gw9/yA9aW2kwS8g6MbqqvUxEaoJnhzPmaqtMWIMVleZy0?=
 =?iso-8859-1?Q?y6KQU3j9125MAqYb7G0v3XAr5iwDGJ6UFXOmHYK+kQd3sZakplhqTRlts6?=
 =?iso-8859-1?Q?NZHXvlkf7cUlHj1s19e35og/8HWvMXVuN1uM6SJOpc8hRbYIavwUhkNpTM?=
 =?iso-8859-1?Q?5ZaMobSFa/8D+rO5YevftrbABI4DgdzqlPdj1YCylFyEH9jsAwFRtq4uOZ?=
 =?iso-8859-1?Q?sSUlAGTQ4hYDc2FTB/aZp3sBuI0Uj8Mx6lCxLrVMHS36BQwOKZGXZes0tc?=
 =?iso-8859-1?Q?85Mif+/LU22h7ISyAKmha3akpRy+WpP0xlOiY+h/LIKQ2fwWO9PIyaZnQN?=
 =?iso-8859-1?Q?3Zu8LYgaaQ5rIq0/8dZjlMjC5FrBHqiWNUTtkkij3k95UvBmK1RwosRwqS?=
 =?iso-8859-1?Q?iIU0AElrYJ/94sqQxnaHPuOrwDAuzMo79mYWPSIHUrAMzoffKzuJ2b1K7l?=
 =?iso-8859-1?Q?V7nA8mUwA3xZL2yyMSaWHGq0czcnmiznvTf/6BPSwbh6U8zUeA6N35k7xR?=
 =?iso-8859-1?Q?mZoG3HAQuGNO62bl7mwOb2fTpKVxDDfAUwY2jSEIs5vCrdwv6i2xKlMMFv?=
 =?iso-8859-1?Q?0BQ9tleUle1f5g43S/IN17vlehod4ITsUZF/z/NWxws4isWO1+J22buehn?=
 =?iso-8859-1?Q?PNqTtg7imz9z6EfNj8oHjzRtgyKqKBcEuPqpSInE0S1jgPMP4x4SJmrQDx?=
 =?iso-8859-1?Q?CqRHzA5rg1+U5zr4rWv2Z9x00B4U76Ymq/MLw9U6P6VkyTbUaLxqn6FNz0?=
 =?iso-8859-1?Q?saBDCmZYunbgBuOu2GJl44FOfq6lH7t1r/yz8V0lo3sxMNk4xMXJ7S0TZ4?=
 =?iso-8859-1?Q?01lRD/1dSKiXOSuDZkMUCCbLNLUfhuPuW6BlNd2fYUucjT8+1pxTg0qOep?=
 =?iso-8859-1?Q?3n48RqGop35W4ROs5YuP2e7QXiVyqc1NFWNAW9LPOy5MjzrHCE4TOaSnCa?=
 =?iso-8859-1?Q?g8Q7R7X4Fn+Zr6fs5MTBL1OZ+0PY9tScFaSlKD2aY9O0YWhBVZ9R1b1oAD?=
 =?iso-8859-1?Q?DCJcgrwqVld47bw3kVHrg9r/ivISaMYI0pCXtq2bOmBR8Bq+xbI8zHS6Iw?=
 =?iso-8859-1?Q?vMR2V7dKGKkE+qHmwOqrU2qOKBezfVcCfWm1gR95mxwLD/2z/xAhU05Hqc?=
 =?iso-8859-1?Q?KFdowPkQDCwuie4o+QtRMOPRszxt7NAgHBiNqEb9sWqI99N+AHOp9Ymwaj?=
 =?iso-8859-1?Q?Rk3J3vS5MbaCoDKLMJoLjcOwhukq+6CviUhbzri3FdfV2qX36VlgoMxqxe?=
 =?iso-8859-1?Q?+LL2WJpqco2e66PE90S9I1uzdsDFN7f2pvZ3BaIbhv7mVSCvhV+6yI8sLF?=
 =?iso-8859-1?Q?M6q6rLpd1XiFGrtSbemJXHbrYOgnDg0V4QfkREnnENGP3ysBfjWKMB5+kW?=
 =?iso-8859-1?Q?w604Wf43DuDsu/kUNPPOxCs+otcTFEL+NN8q2H1x52YJPu89ZFmPfhyt4H?=
 =?iso-8859-1?Q?3HzvVF9CdL1w3Q9hFDEq8gMYb9bntSZkl0XEGB901meaMaEEE+0YrvpLMg?=
 =?iso-8859-1?Q?p68waPORcGFWu+RKMB2lhqrbmm/VaIBSaCd5q5z+kCOkCR16eI3psH5w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43cc133b-ec04-4d6c-5d49-08dc37ba7bb7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 17:35:26.0050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fIyyPLR9Mb3WyFRkUPbmd4SFO7JHcjEwNgEcqhcScCvAYfBlcYKlZ2pG7joTKZNhC3FdfndWT/l9FtIeuPYk2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7278
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

On Tue, Feb 27, 2024 at 12:52:14PM +0100, Thomas Hellström wrote:
> On Mon, 2024-02-26 at 21:36 +0000, Matthew Brost wrote:
> > On Mon, Feb 26, 2024 at 05:44:53PM +0100, Thomas Hellström wrote:
> > > Currently we refuse evicting the VM's local objects. However that
> > > is necessary for some objects. Most notably completely unbound
> > > objects.
> > > Forward this decision to be per-object based in the TTM
> > > eviction_valuable() callback.
> > > 
> > > Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external-
> > > and evicted objects")
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: Oded Gabbay <ogabbay@kernel.org>
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_bo.c       | 17 ++++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_exec.c     |  2 ++
> > >  drivers/gpu/drm/xe/xe_vm.c       |  8 ++++++--
> > >  drivers/gpu/drm/xe/xe_vm_types.h | 10 ++++++++++
> > >  4 files changed, 34 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index 76dfaf1cd200..143d93632253 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1049,6 +1049,21 @@ static void
> > > xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
> > >  	}
> > >  }
> > >  
> > > +static bool xe_bo_eviction_valuable(struct ttm_buffer_object
> > > *ttm_bo,
> > > +				    const struct ttm_place *place)
> > > +{
> > > +	if (xe_bo_is_xe_bo(ttm_bo)) {
> > > +		struct xe_bo *xe_bo = ttm_to_xe_bo(ttm_bo);
> > > +		struct xe_vm *vm = xe_bo->vm;
> > > +
> > > +		if (vm && !drm_gpuvm_is_extobj(&vm->gpuvm,
> > > &ttm_bo->base) &&
> > 
> > Is this not redundant - if xe_bo->vm is set then it not an external
> > BO?
> 
> It's to exclude the case where the resv is individualized as part of
> destruction. Then drm_gpuvm_is_extobj() should return true.
> 

Makes sense.

> > 
> > > +		    vm->is_validating)
> > > +			return false;
> > > +	}
> > > +
> > > +	return ttm_bo_eviction_valuable(ttm_bo, place);
> > > +}
> > > +
> > >  const struct ttm_device_funcs xe_ttm_funcs = {
> > >  	.ttm_tt_create = xe_ttm_tt_create,
> > >  	.ttm_tt_populate = xe_ttm_tt_populate,
> > > @@ -1059,7 +1074,7 @@ const struct ttm_device_funcs xe_ttm_funcs =
> > > {
> > >  	.io_mem_reserve = xe_ttm_io_mem_reserve,
> > >  	.io_mem_pfn = xe_ttm_io_mem_pfn,
> > >  	.release_notify = xe_ttm_bo_release_notify,
> > > -	.eviction_valuable = ttm_bo_eviction_valuable,
> > > +	.eviction_valuable = xe_bo_eviction_valuable,
> > >  	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
> > >  };
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > > b/drivers/gpu/drm/xe/xe_exec.c
> > > index 952496c6260d..e8eb09993485 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > @@ -102,7 +102,9 @@ static int xe_exec_fn(struct drm_gpuvm_exec
> > > *vm_exec)
> > >  	int num_fences;
> > >  	int ret;
> > >  
> > > +	vm->is_validating = true;
> > >  	ret = drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
> > > +	vm->is_validating = false;
> > 
> > Can't say I love this coding pattern but you address this in the
> > kernel
> > doc for is_validating. Agree with updating TTM to avoid this.
> 
> Yeah.
> 
> > 
> > Also this is kinda racey too - e.g. 2 VMs could set vm->is_validating
> > at
> > the same time. We really want to check if BO being evicted VM's
> > matches
> > the VM we are trying to validate in the current context, right?
> 
> It's not racy AFAICT. Since it's protected by the vm resv, and only
> ever set under the vm->resv. Any reader holding the vm->resv can thus
> rely on its value.
> 
> > 
> > With that - maybe we try to update TTM in this series too?
> 
> I'd be good to have the completely unbound case fixed with 6.8 so
> that's why this got a bit rushed.
>

Ok, don't want to hold up the patch and it is documented.
 
> > 
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > b/drivers/gpu/drm/xe/xe_vm.c
> > > index e3bde897f6e8..07b0cda12d52 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -474,7 +474,7 @@ static int xe_gpuvm_validate(struct
> > > drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
> > >  		list_move_tail(&gpuva_to_vma(gpuva)-
> > > >combined_links.rebind,
> > >  			       &vm->rebind_list);
> > >  
> > > -	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false);
> > > +	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, true);
> > 
> > I think we likely can flip the last argument to true in a few other
> > places too. Or maybe even drop the argument and either always set to
> > true or true if not an ext obj?
> 
> Yeah we should indeed be able to set it elsewhere. The weird case is
> when allocating page-table bos, because then we could accidently evict
> the bo the page-tables are intended to point to, and we'd have to rerun
> the validation again after binding. I'll see if I can get that going in
> a not to complicated way.
>

Again don't want to hold up this patch and this can be done in a follow up.

With of this:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

 
> /Thomas
> 
> 
> > 
> > Matt
> > 
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > @@ -515,7 +515,11 @@ static int xe_preempt_work_begin(struct
> > > drm_exec *exec, struct xe_vm *vm,
> > >  	if (err)
> > >  		return err;
> > >  
> > > -	return drm_gpuvm_validate(&vm->gpuvm, exec);
> > > +	vm->is_validating = true;
> > > +	err = drm_gpuvm_validate(&vm->gpuvm, exec);
> > > +	vm->is_validating = false;
> > > +
> > > +	return err;
> > >  }
> > >  
> > >  static void preempt_rebind_work_func(struct work_struct *w)
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 7d4f810f9c04..76c49fba9cd3 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -286,6 +286,16 @@ struct xe_vm {
> > >  
> > >  	/** @batch_invalidate_tlb: Always invalidate TLB before
> > > batch start */
> > >  	bool batch_invalidate_tlb;
> > > +
> > > +	/**
> > > +	 * @is_validaing: Whether we are validating the vm's local
> > > objects.
> > > +	 * This field is protected by the vm's resv. Note that
> > > this
> > > +	 * is needed only since TTM doesn't forward the
> > > ttm_operation_ctx to the
> > > +	 * eviction_valuable() callback, so if / when that is in
> > > place, this
> > > +	 * should be removed.
> > > +	 */
> > > +	bool is_validating;
> > > +
> > >  	/** @xef: XE file handle for tracking this VM's drm client
> > > */
> > >  	struct xe_file *xef;
> > >  };
> > > -- 
> > > 2.43.0
> > > 
> 
