Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A175EB8FA5
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 05:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057DC10E1C6;
	Wed,  6 Sep 2023 05:10:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7163610E1C6
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 05:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693977035; x=1725513035;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bAizoj7hErtjpkYk/wGxIhUq/QY7MeRzLIy16LZKlgs=;
 b=WFGrUQ/b+IHxIaVyNCWMcuRpdj9Z9DAG9dAQ7vzdWUYtF/UCyHoBg8D9
 YDM2s7Fzm+QC2yy3UKnIfDfGyJBydGw4Z4wwgJTpIgSeCPYH73CtD0Qmm
 /2ZqvpAq6AlxfsXb0md7jH2vqWkiq/xr4MKowa2E6HT3C/tluw9xWX0Cz
 uX1hg8LjvNP/aY0aqu47yvbk4+P53MimOFq6znMMJXcGb84epqfy8CAbW
 dbVt2w4ISrDDY8K7/O54kjNzMNVMJGruJXn1XZT/libKiK0THTl0BMYAJ
 J7GeSl8YXl+jWBNGAkYCs777vMp4ML8xUtnz8GwuNq48IUoZNFAPCn9Dw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="443368808"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="443368808"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 22:10:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="806874023"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="806874023"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2023 22:10:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 5 Sep 2023 22:10:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 22:10:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 22:10:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 22:10:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tsmpt8Gb8cKKUsNsZCyQ+GJbXs/or/OfuUgo2FazKSqOYDOgkGJeXmadlF/PFl3lFcMpCNNoUJeIkCgVf/O/fkTKCYBIUMqBnVHduYYB3g4ZVww0neFa6TKb0V876cOXhnQ39h/N/4NxTWCrjLakKw30/cBtIqLz/xDzE1A4jTTsBAYw6gY89Xtb2JBL2hxwFJih3tpPRAMlXBxmKy6xOUNCbY699bbWFWKmhMZU0ISTJEbjSasRX0+NX7x1Fu6h68nPjqES/ybtx4QnHSJ7DltjimpC8xYMJbfX1805FVZuqva/4kqikg/040iQ65nSJjSE312bK/ca0OdTeIpJPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWrnwainGFCoXBKerH2tiGmDVT3b6s5I7Zeu6/T87bE=;
 b=LeTamS9ajYNWNr20HuGuUamuSvvhkYBslo3GvFkngeEglaWkrZkWk7fUfyOx5Fvt7iTVDAaEQf+4A/ZUSgm0eAWbpaQGBixcWnVEm7SAgBy3re4eqSDYA0vEB6HI37/Z1p11JJHWMwenhaXwuEmsmOJPcxdEyEex50L+XyAHpjTZAE56g+QGHCZdVxxeDc2l7HjBZbY5Wb9GATwPKoI0wip15FafJSq+AaSbTmIvXmH8FG+xhNsbORi6I94JWAeeXmq5IKBc6PaQRLBv4PMdpfbpZg7ylxGtp0oOqmvXUeqiUgi8/CCZQwXp3m4eFJYC/lm3K94gOMGRgfqnGA6WAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 05:10:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 05:10:30 +0000
Date: Wed, 6 Sep 2023 05:09:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZPgJd8AFmJZIfupz@DUT025-TGLU.fm.intel.com>
References: <20230901142629.4125-1-thomas.hellstrom@linux.intel.com>
 <20230901142629.4125-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230901142629.4125-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:a03:180::37) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: 3998b7b8-58ec-4858-4809-08dbae97975d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qdYbYG1o+RZSteF6iGi3KvSeasSO8aocQKOSBqCPfOy+xR24sjkH15l96pwqVOQ0IhhYjKHmMjebbFSkK4cVXgbr9RYbanIfS9GKfxWNrTkG+NNmWtYEQcSzgUCUk1eQW16gZprx3hL3riDdyEhxGa16+IT/8F2EfYOl3wiJrBmOf4OZQLmu3OYR48p8q6H/gcb3UsVNcDA5j7+4WVPMc6yPWgu8ExL9g2C+YQKd3zsoRlV8q6mnatiihRbgms5ATQefzu1zJG/GjGmSRDUsttPpiPWIrcLIZho2gwIl8TGIvEuizcN7DnNsPIxaiTqrqQffZb0qqBfWQNxFyDYTEINR+ZhQOGGqhgir7kwXjelUS9dFicHQd5PviErAtoQBhOLboZThyDtxa6yuneNqcJZd6+qCDok3nTZWaWClZWRb5KGWOKQbhI6iumE+Ka0BVp/buugKqA/QqfweMPX5N4H7DoYLtjZzgowW2sNNp2hjlBrhpVJLzY4AOQ33vL0VfF+FZ1b3qG//xvtW4CQmJsuO8Qb4iDWwKlzHcYEH/Ob4iIUIpJGhM1G1KsB2Yhk/92EIFpPBtR3Ch7zmNM7mMrHqU2/0Bn/4ecPHJNNqwfg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(1800799009)(186009)(451199024)(83380400001)(38100700002)(30864003)(82960400001)(66574015)(2906002)(66476007)(66556008)(316002)(6512007)(41300700001)(6916009)(86362001)(66946007)(6486002)(6506007)(6666004)(478600001)(8676002)(8936002)(5660300002)(44832011)(4326008)(26005)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CeeCypQ6hhZciNyYZcBkATmL3vMN++s5aGpXyJKH1Siph3ZXqf5nux9cNa?=
 =?iso-8859-1?Q?iiO3ToJXoRakZLtJ9RdjZfF+szj2CjdB4kQQEPrdtgnH5VLeXTiVsyrAcu?=
 =?iso-8859-1?Q?9WFNXTSl/TrL8SrqFYSkfUY+9A5AqpOkLzocovPFqjJhLSRmv2qndbzKd1?=
 =?iso-8859-1?Q?iCWfFSaiw1IQJKO4+PhIjjDwbA59kDB7K1s6j5X3cql/09vAjl+y7K8z5k?=
 =?iso-8859-1?Q?oa+XhGfM6qBrIW3iAqu+935+54cPsYwBoEQo6ObKr42DVM/MptAnYFLY2w?=
 =?iso-8859-1?Q?s9JGPBfNdVcDYnJU/BcMIK892OFIG0X1KfTobNmfk7S/5wmhAcjRCnNsNV?=
 =?iso-8859-1?Q?gVRRnHbj79pG1qLIfW1JRo+hLUj1krL4O+G5TAHTotMUzYDucN671K7mvF?=
 =?iso-8859-1?Q?4XKad+AIOpDm8LIYScyKbRSV0eEbLNHnRJPkjcV0y87oKC7Fy63aSc22d6?=
 =?iso-8859-1?Q?17TXgI2BPJ+lZOP0ARpUGpW7rthApqVxZR20rdJSv/tWzdsxGTkmBNV6Ps?=
 =?iso-8859-1?Q?HAKMyNY4NJaaKw5ayCN4vFQktWaMgPzIAsCqLo0u1zf1oWVim6ySjepj3M?=
 =?iso-8859-1?Q?4UY2Xt4VrWahP6FSWNzwSEl9MJyqInoaKN+tnkOGb7DeXxlAZri/nCMf5R?=
 =?iso-8859-1?Q?VUGXVyDTV2zqf9tKXn+xxYgwsQJ9HYDWIPBXtZW2r495OrIDPuePRBJSip?=
 =?iso-8859-1?Q?4OhhHfV6aIGhGACHXCtwrUGlSu+8drQc6+4lO3RTiu8ltMv6iIw+8UDIZa?=
 =?iso-8859-1?Q?fAySMbuOZvaZXU05IlC8ohPTT1NnX0W6L0Xs7TRjMhkBgmF2xNhQSrq5rr?=
 =?iso-8859-1?Q?tjmIZeW8vBclsWm9+uXQQ8Xx4eiV6T37ZVl4T7Wag9xJUY63M/VUq3AgeX?=
 =?iso-8859-1?Q?QSh06OEJGUw5TCYT4ED8VLr5D3RQaLrQlHG73jfJZoObr9uHTCBU5riD1V?=
 =?iso-8859-1?Q?59Pv11N6BrB9CZLBlx3A+3/WE6C3m3jwyUmGgaxEx72XtXeZghpg2HFjoQ?=
 =?iso-8859-1?Q?WTY0GalFFPcS9oSfpXz2zMF1bW3AHwmhNiTIP/Kj2G8KBmvyA1nbAugWkJ?=
 =?iso-8859-1?Q?a9nP0uY2PJmDFwT3hysyZ/uSQxEEtDOv9DIL2wmgh0Vd4Sx6bxlvUoK5mG?=
 =?iso-8859-1?Q?6xqUBB2JJbCXt1S4466K23iX+RE51q/owzy+8Q8DhrUSKI3T3xMleX9/Sr?=
 =?iso-8859-1?Q?1erEZCCSG9nnY8ix7TtScad8Lr7DhB/08EGxY0nSxbOZ7faU0wMvmeG78k?=
 =?iso-8859-1?Q?mRAyc1ukU254PeAls29qCJzDaSARDPlJ7WbBp/ej8L4Y7VsIVn0fHj3OVt?=
 =?iso-8859-1?Q?vLavsWUac1uQWlqDdPPb+sIm0C6IUcsmVgUMZlYgh5jIH0Xa/yP2RY8Kyy?=
 =?iso-8859-1?Q?kKZl8GtVdN1p//qZNU4r/p1EagpeHxlaGResQwCqf73JnvpijhAfvdqIuW?=
 =?iso-8859-1?Q?IvdhgRqcjivRxXUxbgDI2clbbJySDBTpadTiNpum8V4lnsHvtrvs1AFFMs?=
 =?iso-8859-1?Q?vfQL0ABRA41KwQ5GhuRnOCXcRS2gSfme9Zjg4kmugiOtZnY+q7V+ZDdwUG?=
 =?iso-8859-1?Q?EaMhEsylnTtGuf7Fc9QX0QYpIer+F0GUeJOrWL1IRjUg4TFQHl6bi10n66?=
 =?iso-8859-1?Q?yfMy0kjzWaQREItMUn3pVlg0GTKHe/mSCRJQlMPDchrt02OoR9FsD2sw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3998b7b8-58ec-4858-4809-08dbae97975d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 05:10:30.7773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NdXSlAOJFrYNAvpz/sJM6Fg8DviXjpLrLjQVN4xnu9vtFXhSpfXjuDvkCZhbPR6s9Z+5NtkD+it6v604KAMicw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6897
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 2/6] drm/xe/vm: Simplify and document
 xe_vm_lock()
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

On Fri, Sep 01, 2023 at 04:26:25PM +0200, Thomas Hellström wrote:
> The xe_vm_lock() function was unnecessarily using ttm_eu_reserve_buffers().
> Simplify and document the interface.
> 
> v4:
> - Improve on xe_vm_lock() documentation (Matthew Brost)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_bo.c      |  9 +++--
>  drivers/gpu/drm/xe/tests/xe_migrate.c |  5 ++-
>  drivers/gpu/drm/xe/xe_bo.c            |  5 ++-
>  drivers/gpu/drm/xe/xe_exec_queue.c    |  5 ++-
>  drivers/gpu/drm/xe/xe_lrc.c           |  6 ++--
>  drivers/gpu/drm/xe/xe_migrate.c       | 10 +++---
>  drivers/gpu/drm/xe/xe_vm.c            | 51 +++++++++++++--------------
>  drivers/gpu/drm/xe/xe_vm.h            |  5 ++-
>  8 files changed, 43 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 31fd4f9b2d5b..c6025404042d 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -180,17 +180,16 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>  	unsigned int bo_flags = XE_BO_CREATE_USER_BIT |
>  		XE_BO_CREATE_VRAM_IF_DGFX(gt_to_tile(gt));
>  	struct xe_vm *vm = xe_migrate_get_vm(xe_device_get_root_tile(xe)->migrate);
> -	struct ww_acquire_ctx ww;
>  	int err, i;
>  
>  	kunit_info(test, "Testing device %s gt id %u vram id %u\n",
>  		   dev_name(xe->drm.dev), gt->info.id, gt_to_tile(gt)->id);
>  
>  	for (i = 0; i < 2; ++i) {
> -		xe_vm_lock(vm, &ww, 0, false);
> +		xe_vm_lock(vm, false);
>  		bo = xe_bo_create(xe, NULL, vm, 0x10000, ttm_bo_type_device,
>  				  bo_flags);
> -		xe_vm_unlock(vm, &ww);
> +		xe_vm_unlock(vm);
>  		if (IS_ERR(bo)) {
>  			KUNIT_FAIL(test, "bo create err=%pe\n", bo);
>  			break;
> @@ -259,9 +258,9 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>  
>  		if (i) {
>  			down_read(&vm->lock);
> -			xe_vm_lock(vm, &ww, 0, false);
> +			xe_vm_lock(vm, false);
>  			err = xe_bo_validate(bo, bo->vm, false);
> -			xe_vm_unlock(vm, &ww);
> +			xe_vm_unlock(vm);
>  			up_read(&vm->lock);
>  			if (err) {
>  				KUNIT_FAIL(test, "bo valid err=%pe\n",
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 5c8d5e78d9bc..8bb081086ca2 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -396,14 +396,13 @@ static int migrate_test_run_device(struct xe_device *xe)
>  
>  	for_each_tile(tile, xe, id) {
>  		struct xe_migrate *m = tile->migrate;
> -		struct ww_acquire_ctx ww;
>  
>  		kunit_info(test, "Testing tile id %d.\n", id);
> -		xe_vm_lock(m->q->vm, &ww, 0, true);
> +		xe_vm_lock(m->q->vm, true);
>  		xe_device_mem_access_get(xe);
>  		xe_migrate_sanity_test(m, test);
>  		xe_device_mem_access_put(xe);
> -		xe_vm_unlock(m->q->vm, &ww);
> +		xe_vm_unlock(m->q->vm);
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index a3ddd6575793..25fdc04627ca 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1749,7 +1749,6 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  	struct xe_device *xe = to_xe_device(dev);
>  	struct xe_file *xef = to_xe_file(file);
>  	struct drm_xe_gem_create *args = data;
> -	struct ww_acquire_ctx ww;
>  	struct xe_vm *vm = NULL;
>  	struct xe_bo *bo;
>  	unsigned int bo_flags = XE_BO_CREATE_USER_BIT;
> @@ -1802,7 +1801,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  		vm = xe_vm_lookup(xef, args->vm_id);
>  		if (XE_IOCTL_DBG(xe, !vm))
>  			return -ENOENT;
> -		err = xe_vm_lock(vm, &ww, 0, true);
> +		err = xe_vm_lock(vm, true);
>  		if (err) {
>  			xe_vm_put(vm);
>  			return err;
> @@ -1830,7 +1829,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  	xe_bo_put(bo);
>  out_vm:
>  	if (vm) {
> -		xe_vm_unlock(vm, &ww);
> +		xe_vm_unlock(vm);
>  		xe_vm_put(vm);
>  	}
>  	return err;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index e44d71c679cc..6725157d8c1d 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -111,18 +111,17 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
>  					   u32 logical_mask, u16 width,
>  					   struct xe_hw_engine *hwe, u32 flags)
>  {
> -	struct ww_acquire_ctx ww;
>  	struct xe_exec_queue *q;
>  	int err;
>  
>  	if (vm) {
> -		err = xe_vm_lock(vm, &ww, 0, true);
> +		err = xe_vm_lock(vm, true);
>  		if (err)
>  			return ERR_PTR(err);
>  	}
>  	q = __xe_exec_queue_create(xe, vm, logical_mask, width, hwe, flags);
>  	if (vm)
> -		xe_vm_unlock(vm, &ww);
> +		xe_vm_unlock(vm);
>  
>  	return q;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 2b4219c38359..434fbb364b4b 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -789,16 +789,14 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  
>  void xe_lrc_finish(struct xe_lrc *lrc)
>  {
> -	struct ww_acquire_ctx ww;
> -
>  	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
>  	if (lrc->bo->vm)
> -		xe_vm_lock(lrc->bo->vm, &ww, 0, false);
> +		xe_vm_lock(lrc->bo->vm, false);
>  	else
>  		xe_bo_lock_no_vm(lrc->bo, NULL);
>  	xe_bo_unpin(lrc->bo);
>  	if (lrc->bo->vm)
> -		xe_vm_unlock(lrc->bo->vm, &ww);
> +		xe_vm_unlock(lrc->bo->vm);
>  	else
>  		xe_bo_unlock_no_vm(lrc->bo);
>  	xe_bo_put(lrc->bo);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index a782ea282cb6..ee8bc5f3ba3d 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -88,13 +88,12 @@ struct xe_exec_queue *xe_tile_migrate_engine(struct xe_tile *tile)
>  static void xe_migrate_fini(struct drm_device *dev, void *arg)
>  {
>  	struct xe_migrate *m = arg;
> -	struct ww_acquire_ctx ww;
>  
> -	xe_vm_lock(m->q->vm, &ww, 0, false);
> +	xe_vm_lock(m->q->vm, false);
>  	xe_bo_unpin(m->pt_bo);
>  	if (m->cleared_bo)
>  		xe_bo_unpin(m->cleared_bo);
> -	xe_vm_unlock(m->q->vm, &ww);
> +	xe_vm_unlock(m->q->vm);
>  
>  	dma_fence_put(m->fence);
>  	if (m->cleared_bo)
> @@ -338,7 +337,6 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  	struct xe_gt *primary_gt = tile->primary_gt;
>  	struct xe_migrate *m;
>  	struct xe_vm *vm;
> -	struct ww_acquire_ctx ww;
>  	int err;
>  
>  	m = drmm_kzalloc(&xe->drm, sizeof(*m), GFP_KERNEL);
> @@ -353,9 +351,9 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  	if (IS_ERR(vm))
>  		return ERR_CAST(vm);
>  
> -	xe_vm_lock(vm, &ww, 0, false);
> +	xe_vm_lock(vm, false);
>  	err = xe_migrate_prepare_vm(tile, m, vm);
> -	xe_vm_unlock(vm, &ww);
> +	xe_vm_unlock(vm);
>  	if (err) {
>  		xe_vm_close_and_put(vm);
>  		return ERR_PTR(err);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 8462f6321351..c84f0fb56e39 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -523,18 +523,17 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>  
>  static void xe_vm_kill(struct xe_vm *vm)
>  {
> -	struct ww_acquire_ctx ww;
>  	struct xe_exec_queue *q;
>  
>  	lockdep_assert_held(&vm->lock);
>  
> -	xe_vm_lock(vm, &ww, 0, false);
> +	xe_vm_lock(vm, false);
>  	vm->flags |= XE_VM_FLAG_BANNED;
>  	trace_xe_vm_kill(vm);
>  
>  	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link)
>  		q->ops->kill(q);
> -	xe_vm_unlock(vm, &ww);
> +	xe_vm_unlock(vm);
>  
>  	/* TODO: Inform user the VM is banned */
>  }
> @@ -1412,7 +1411,6 @@ static void xe_vm_close(struct xe_vm *vm)
>  void xe_vm_close_and_put(struct xe_vm *vm)
>  {
>  	LIST_HEAD(contested);
> -	struct ww_acquire_ctx ww;
>  	struct xe_device *xe = vm->xe;
>  	struct xe_tile *tile;
>  	struct xe_vma *vma, *next_vma;
> @@ -1435,7 +1433,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	}
>  
>  	down_write(&vm->lock);
> -	xe_vm_lock(vm, &ww, 0, false);
> +	xe_vm_lock(vm, false);
>  	drm_gpuva_for_each_va_safe(gpuva, next, &vm->mgr) {
>  		vma = gpuva_to_vma(gpuva);
>  
> @@ -1476,7 +1474,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  					      NULL);
>  		}
>  	}
> -	xe_vm_unlock(vm, &ww);
> +	xe_vm_unlock(vm);
>  
>  	/*
>  	 * VM is now dead, cannot re-add nodes to vm->vmas if it's NULL
> @@ -1514,7 +1512,6 @@ static void vm_destroy_work_func(struct work_struct *w)
>  {
>  	struct xe_vm *vm =
>  		container_of(w, struct xe_vm, destroy_work);
> -	struct ww_acquire_ctx ww;
>  	struct xe_device *xe = vm->xe;
>  	struct xe_tile *tile;
>  	u8 id;
> @@ -1539,14 +1536,14 @@ static void vm_destroy_work_func(struct work_struct *w)
>  	 * is needed for xe_vm_lock to work. If we remove that dependency this
>  	 * can be moved to xe_vm_close_and_put.
>  	 */
> -	xe_vm_lock(vm, &ww, 0, false);
> +	xe_vm_lock(vm, false);
>  	for_each_tile(tile, xe, id) {
>  		if (vm->pt_root[id]) {
>  			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
>  			vm->pt_root[id] = NULL;
>  		}
>  	}
> -	xe_vm_unlock(vm, &ww);
> +	xe_vm_unlock(vm);
>  
>  	trace_xe_vm_free(vm);
>  	dma_fence_put(vm->rebind_fence);
> @@ -3422,30 +3419,32 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	return err == -ENODATA ? 0 : err;
>  }
>  
> -/*
> - * XXX: Using the TTM wrappers for now, likely can call into dma-resv code
> - * directly to optimize. Also this likely should be an inline function.
> +/**
> + * xe_vm_lock() - Lock the vm's dma_resv object
> + * @vm: The struct xe_vm whose lock is to be locked
> + * @intr: Whether to perform any wait interruptible
> + *
> + * Return: 0 on success, -EINTR if @intr is true and the wait for a
> + * contended lock was interrupted. If @intr is false, the function
> + * always returns 0.
>   */
> -int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> -	       int num_resv, bool intr)
> +int xe_vm_lock(struct xe_vm *vm, bool intr)
>  {
> -	struct ttm_validate_buffer tv_vm;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> -
> -	XE_WARN_ON(!ww);
> -
> -	tv_vm.num_shared = num_resv;
> -	tv_vm.bo = xe_vm_ttm_bo(vm);
> -	list_add_tail(&tv_vm.head, &objs);
> +	if (intr)
> +		return dma_resv_lock_interruptible(&vm->resv, NULL);
>  
> -	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> +	return dma_resv_lock(&vm->resv, NULL);
>  }
>  
> -void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
> +/**
> + * xe_vm_unlock() - Unlock the vm's dma_resv object
> + * @vm: The struct xe_vm whose lock is to be released.
> + *
> + * Unlock a buffer object lock that was locked by xe_vm_lock().
> + */
> +void xe_vm_unlock(struct xe_vm *vm)
>  {
>  	dma_resv_unlock(&vm->resv);
> -	ww_acquire_fini(ww);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 6de6e3edb24a..d7d8fd7bd8da 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -39,10 +39,9 @@ static inline void xe_vm_put(struct xe_vm *vm)
>  	kref_put(&vm->refcount, xe_vm_free);
>  }
>  
> -int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> -	       int num_resv, bool intr);
> +int xe_vm_lock(struct xe_vm *vm, bool intr);
>  
> -void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww);
> +void xe_vm_unlock(struct xe_vm *vm);
>  
>  static inline bool xe_vm_is_closed(struct xe_vm *vm)
>  {
> -- 
> 2.41.0
> 
