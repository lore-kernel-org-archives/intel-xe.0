Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A7FCDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 19:23:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D419D10E605;
	Fri, 13 Oct 2023 19:23:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E9210E605
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 19:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697224998; x=1728760998;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4GuD87gZa5yb4ziAdxsDu2nxBc9mhLj6Cm3DygeOtqI=;
 b=Q0PwFL8lzsiI2b3pOLivygHGXPBTIiwsN4GK9rt2XxAJpu2g4UzujCPf
 52w3uaOreWLOikwnmBm6DMWyniOz36rqhB8tBjIvsMXFYUG5lu6NCjk30
 lQq5dQB2y7e74ZVfqnXc6A7gm3tWrCy2lJyrozGv2nJhBIq5A7bLcMT6A
 MSdyDIvc1zF+ZZXykhD/caesWPDzAMuXglcVi7Nkc/b7CAkqUMNFPvsyy
 6NM7m+jRwrj4mUpuAu2Ju+6+dSS/xQmKoAoQbrinRsDrgTPuzsVP61e2R
 S031vfj7n5dI0qWBA4+iguW7juJDqCbasgLygPqjqqDTWOrIlogiXuiA/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="385086253"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="385086253"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 12:23:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="789969234"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="789969234"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 12:23:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 12:23:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 12:23:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 12:23:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpDCs+ELnvoxK+NiXmEOQ/4RaO0jEo5p/N7FsIJrAoQhN9v1QzeLa7fsJJ7uVd+8H27jrNdHxYydAAuzTbjybbE7e+LePzbkeaDaNyscAq4c1nf5LdkDcKRrGnFEuPpCCpzD+OLy+rAMdhok1lDYPAQhfiFC0wf4Wz+9xDZD4iloG7pcNVucDCIZomKrTz5ZqhxZG4WZUOiBSB9f3jMnX5yVG1aOGb20/814wnmNe6e9L7iOzEvlWRQ6uRoCJn7CCqKeoH62+UYqP0xSpqtg0BE4ePSJIcx9yRgRHNeyJ0rb4IKIZddzOhAUDpdMFuESKc4T8lP1O7EFNuQG8BmEdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7OTMZcrbh1bDT40GQrNk31JkKofWhCDxDeHdnSr8MA=;
 b=BrUC63s1OHfHlE/jIymbVG9hnhaHFN9zbkZpYyX4YrCupag0EDjOWV5AuBBRZg8zbpJAnuRWWnsXa9cRW32rUcCrK+GGypM+cZHXSEsZwkIIvlNDwJnmk0ujZKn94bkhYGuySH7+uBkSe+r6rHSJDkjr3mw3E45dCKwYl0trhYrb1YMr+SMfTxqDv3pfXVJbzJdYX9SyZoEq2BnUOvmrX8KJf8/TBd5iWJJMjaT6uLvzeCs9QOfHAnMGxPYG2z9WeSI8iU/P1HS490c4TdgPMvG4Ew88z6rvOBYA9rTsVn7t2c+vNiurpZHYzzb8w91atj5o+nWPeL2r7nBqSv2Itg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7547.namprd11.prod.outlook.com (2603:10b6:a03:4cd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 19:23:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 19:23:01 +0000
Date: Fri, 13 Oct 2023 19:21:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <maarten.lankhorst@linux.intel.com>
Message-ID: <ZSmYyklINGOJ4RO2@DUT025-TGLU.fm.intel.com>
References: <20231013152142.52869-1-maarten.lankhorst@linux.intel.com>
 <20231013152142.52869-4-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231013152142.52869-4-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: BY5PR13CA0036.namprd13.prod.outlook.com
 (2603:10b6:a03:180::49) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7547:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a3a3179-11b6-4426-f287-08dbcc21d084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XSHEq3JviwX6qQVujVY4K5Isvi9SBRQYNmxpJp7Av27F3s2eIAMIu07KV32nC9Zc/V/jqUeQ6X3neXEZFqbTZZUrgMBDXz5T5vX5maI6SwFcaCrj1a0UlFGAw+AIhA45wzhFP92QgNwdwWxmQSwgJPIyEFc2m1xzl0n/muq75dfr+rTxFSuQTkI99m8NWgqCIIwCv0K96qiF0mWZl9XS68PDlgSJDRNXlKLqrQFqIK6zGCDesj7+WIv6nh5Yl7i3tEJhp0mUKQX6WkL1MY2aAG0K0JRhB+aGkfzi7gd27J8/aDclOw+IWD7dTGzjsvws3c23Jsweq2XWzTOc0vr+lSdZt+qo1uap5nL/f2qcLS4zpm0959NzmPBQGD6sXHHJkluvqmL2dufsDBhLu1ZqQLu8+SG4Fh+j7sqKvakd+1Wjt4jQfd6W3KFtmUPWo1dYMx06VmHpaZNbebM5Bju3o0cQExuEABWwi6DNnOMlrrJAybXtoa39fbwOvDEfT07YEbq9VoLSdoVOqAit/AqrXdZheoyh+Z7gH/8qGfm9wDlqjseCPmgireSTtBeGOKab
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(478600001)(6486002)(66946007)(66556008)(6916009)(6666004)(66476007)(6506007)(82960400001)(83380400001)(6512007)(26005)(316002)(5660300002)(44832011)(86362001)(38100700002)(4326008)(8936002)(41300700001)(2906002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Eq86Ru01x9NA9z/LMPsTQFc4LxdQn7PelyFZZfkTdBuh0rncGFBfrEGqCZQr?=
 =?us-ascii?Q?OOHT27qv850+3HgQ1elDL5FSJoBEA0ynAyMGctIZtD3ojTmR0h+pK8lKB+kX?=
 =?us-ascii?Q?TQbYimfOzZ0iMILfjZ6jOGVlq/5eApiXKnpxwCrSvpHY8ACvmVUX7JxsKdsL?=
 =?us-ascii?Q?WHMasgXTmGzfKCNRmUuLu/UOuMo+gzEbRJ2njB/lT7X6LRxuNMHqgR//QWPn?=
 =?us-ascii?Q?AAS3yKw1YQ0LYUs3dF2UPt2kAW8hIaKyFyJkndScj6fne5HLDg65NEZmjQ9f?=
 =?us-ascii?Q?SHb78bc8+0lRnJnqcIxy2aeCfmM/8vOnBtxDUyoEQ26e56kka2fCtun7K1Mo?=
 =?us-ascii?Q?EeQVcEKR/Fk2rMZoLZWaJiTbNgFY5X2mU/eCpGW00aKeLndkmSDYeC0GMzf/?=
 =?us-ascii?Q?aSAZVmYZCBu5Cjm9moUlWVFD4l1OsNr5nZk5iaJuaPPrbhT9SfTXm6b6uLM5?=
 =?us-ascii?Q?peYlMwTDR+vVABDGXJ/ty5RaqGA7FK/k6TbuO4FdhSC3lOPdnm/uiJ3J330I?=
 =?us-ascii?Q?QijW/0ujfTxKIzYTs3O3FoS3iyqbn3toSPefqWD6cVNzKRhtMWN7hdlTgqi2?=
 =?us-ascii?Q?ZIgnjD0NJs+bh+JeSLMMjFTxc2l6Tzrm4+0XkqQDWKqjwGNt0O9h57FjxRBi?=
 =?us-ascii?Q?EY7sacQidhxeey74dWrkISkojujNhf+uGGAJGCYElL83QDd5wk3zApf53SuQ?=
 =?us-ascii?Q?s5aE8JEJkZteLiTMbnCd432z+N73L2l8WzryZVQUyizQ3v/FBAI98+Z76Itx?=
 =?us-ascii?Q?GnMhnk6P1rLWbjMNrJf8BWSnBUZn7nrMnA/hrKklSJTCarsnASxqK+7nJrKa?=
 =?us-ascii?Q?M7EdEwx8m0JWoNWzwLOP3nhwELlnBRMPzW4zJyeJ3QlTXRPUKOlXXVTgasI6?=
 =?us-ascii?Q?OiCOkFc/Af+ZFyspKGeSHlJbUk+RLxH5v8NCfOoSNGrQPL6XwhY7JmerLS+N?=
 =?us-ascii?Q?d+t32cPQ4H9XIWe1F0qPHEOPGSb7U8HxOvSx93qSD/G/pHwNAH96Wy6oHrvz?=
 =?us-ascii?Q?tZEYoJA3zzDH9KQXI+d0CHBXpUH3gEGaFHF7Ntn+HbQWxIDVypGgsEZUAB11?=
 =?us-ascii?Q?+L6n9YnHcT2hed1HOdarh1SwnlmOlwUm797n8lQBlgRE8irVey/dGnZKClHd?=
 =?us-ascii?Q?uXtQf+ofHDG465VU0gTk9nhmBgJW1oxYIgJukEDPrD7mIZnswpbS1mfXeG60?=
 =?us-ascii?Q?MBmI17V0YTyLPZvoQOhRzFGWkD7txALgvrrfRRtygUvLK7ZFp7Hqvikq7AY2?=
 =?us-ascii?Q?ZdIL3LU/jx8GBe9CqDD2BRKEgKR2cAOlVrX3bXooL+UAIy4x7tYaGCXc2H4F?=
 =?us-ascii?Q?Xj8pfs6GgXm5GTcw66Hz9enyBu+iBOjbu28bx80aMdKfYpQo85YU2kkSwkOY?=
 =?us-ascii?Q?amwFKWTcJPX8gaqJQpuIakyNTvX3HqF3T08ubxrTTsCIiMmESGokb6Rdh2yl?=
 =?us-ascii?Q?L6vjkFwG2yRnBCk3fKXr6Ada9OOHo8NAFEjid3AGQf6tQ+epDp3WGa4dSzOo?=
 =?us-ascii?Q?76iwvQZ0lj9oAsMsWHWLqwY7b4z0NYkKJEgzBZBaIwqUwCmIfStjAf7XAjoA?=
 =?us-ascii?Q?GXJ2S25Of4cYEuqH8nq9ZuoNUG+xSPEl2HJ+BsbntQ5wwP9z0OZQjbLY2F2e?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3a3179-11b6-4426-f287-08dbcc21d084
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 19:23:00.8792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08UhYV2DksBQdS6lGvs0w6skYyLeSHqNmkk3rql6tRnwkYczxKYk7KmoZaCpKCNvJo2MoDPrJ9Q3O9nF5navng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7547
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe: Add vm snapshot mutex for easily
 taking a vm snapshot during devcoredump
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
Cc: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Oct 13, 2023 at 05:21:41PM +0200, maarten.lankhorst@linux.intel.com wrote:
> From: Maarten Lankhorst <dev@lankhorst.se>
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 7 +++++++
>  drivers/gpu/drm/xe/xe_vm_types.h | 5 +++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index da006249147e..544d998293d3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1163,7 +1163,9 @@ static int xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
>  	xe_assert(vm->xe, xe_vma_vm(vma) == vm);
>  	lockdep_assert_held(&vm->lock);
>  
> +	mutex_lock(&vm->snap_mutex);

I can't say I'm a fan of adding a new lock. Can you explain why this is
needed? e.g. Why does the exisiting &vm->lock not work? We have lockdep
annotations in both xe_vm_insert_vma & xe_vm_remove_vma that vm->lock is
held. As is, the capture should be able to take vm->lock in write mode
and this is safe.

Side note the annotations should probably be in write mode for
xe_vm_insert_vma & xe_vm_remove_vma and the capture should be able to
take this in read mode. We should double check on this.

Matt 

>  	err = drm_gpuva_insert(&vm->gpuvm, &vma->gpuva);
> +	mutex_unlock(&vm->snap_mutex);
>  	XE_WARN_ON(err);	/* Shouldn't be possible */
>  
>  	return err;
> @@ -1174,7 +1176,9 @@ static void xe_vm_remove_vma(struct xe_vm *vm, struct xe_vma *vma)
>  	xe_assert(vm->xe, xe_vma_vm(vma) == vm);
>  	lockdep_assert_held(&vm->lock);
>  
> +	mutex_lock(&vm->snap_mutex);
>  	drm_gpuva_remove(&vma->gpuva);
> +	mutex_unlock(&vm->snap_mutex);
>  	if (vm->usm.last_fault_vma == vma)
>  		vm->usm.last_fault_vma = NULL;
>  }
> @@ -1343,6 +1347,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  	vm->flags = flags;
>  
>  	init_rwsem(&vm->lock);
> +	mutex_init(&vm->snap_mutex);
>  
>  	INIT_LIST_HEAD(&vm->rebind_list);
>  
> @@ -1486,6 +1491,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  	dma_resv_unlock(&vm->resv);
>  	drm_gpuvm_destroy(&vm->gpuvm);
>  err_put:
> +	mutex_destroy(&vm->snap_mutex);
>  	dma_resv_fini(&vm->resv);
>  	for_each_tile(tile, xe, id)
>  		xe_range_fence_tree_fini(&vm->rftree[id]);
> @@ -1625,6 +1631,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	up_write(&vm->lock);
>  
>  	drm_gpuvm_destroy(&vm->gpuvm);
> +	mutex_destroy(&vm->snap_mutex);
>  
>  	mutex_lock(&xe->usm.lock);
>  	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 825f8127741e..bf5017b631a5 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -183,6 +183,11 @@ struct xe_vm {
>  	 * VM
>  	 */
>  	struct rw_semaphore lock;
> +	/**
> +	 * @snap_mutex: Mutex used to guard insertions and removals from gpuva,
> +	 * so we can take a snapshot safely from devcoredump.
> +	 */
> +	struct mutex snap_mutex;
>  
>  	/**
>  	 * @rebind_list: list of VMAs that need rebinding, and if they are
> -- 
> 2.40.1
> 
