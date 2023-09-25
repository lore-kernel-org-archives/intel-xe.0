Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA64BCE79A7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 22:47:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8615210E082;
	Mon, 25 Sep 2023 22:47:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD3710E082
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 22:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695682028; x=1727218028;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QwIkK4LpfVJXnx/oIotvel4/2QW9UTu8/Dud0sz++ak=;
 b=IjfJfi/V3mK7rDTWa3D7yLs5oKq4ijxtfalvVXpYcER98UNlWc+pwNUG
 KxfWi5ovsR00s+EWrhBX2Wg8yvjwGFlK31hWFvFKhMxboO4NJGNWie3yS
 Fk7ezI19inCzTmjFb2ugF5ms+sKkF5KYusVPW5ZOL75IZCYTW8IfBEtNU
 jVMNRML1BPtesjnBgrkktag+tf2rE6QD+wl799p/ejgO42+R/FLb2BTg9
 dr/GR7Err6P4Nh/rznxc6VZeRX26wbnfo9npvMiowyIvXgDYifd+ZOYGG
 /l4eAdjjK4RGGcHfwDZMlQ7JsBP9jzzVkTQ2OT2KOCc6nlJYNygcV90Tk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412343548"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="412343548"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 15:46:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="698240450"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="698240450"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 15:46:52 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 15:46:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 15:46:51 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 15:46:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5jDwH0vMIk0WOd6+YXFwnmLPipv3Yc/JPoUB3D+aZHkm5vGYUv56OZEYf6yTv5/gBOCeZn/6jwRTEAjnJPCH8PFsWsIAue/r2aeNPYlr5P++yL2GBKI4kOBRREz9otZIFrgv3MPeAnfaMwUCU7z38r4BNqfYh9FNqyuMt5est92QkbbFMlIeLEQuHZ8YtJYs3mn96PzmteCrLweTnhMYFvmLBRQKA50a5NxAjjpFs5Q+hZHRki41jIzy5lPY2IUmpPaHn0ujIjzGQKIiVnqL3DHI5aNptYzKe/drZrM0KM//lMIQA9xejxcMfTXatZ9RV7LVFzIHuMYXqPk4HZ0Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1oLzFURXl57K5VWnJV+YiohNgvJLaCXTUDt+pb83pE=;
 b=dLCQ6iQ1BUHOqcdqFHVPQD0YKnkKAqsTmF/5AwIlNf+7rgjDRovX87SyN3JVlOBdUIoib1gVBJeNZ2lu7PPPCewDzumoqlCrUCQCdvZaMEtrwulXFrXJADY8HFPuSq5Q3Kq8WBHUfPvmQgpq5O2X8VxrQd0Y4ksKwvESdNVR5BM4XQgwnPSgpriBhu/2QqwSsGIdn5H0N47osJjw6X9bATOVsdJr8E8z0Chm8RYLCtBDqtlq3fWbRU3sjNb2ErAahP6k7W8hBkK1hqdQmlIeuDvPaKZC0qsT5etegXjKmFulhDmXHJvBiGZlrbqFHVHOoKhDY40pBPycFSk8uI4TIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB8658.namprd11.prod.outlook.com (2603:10b6:610:1c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 25 Sep
 2023 22:46:49 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Mon, 25 Sep 2023
 22:46:49 +0000
Date: Mon, 25 Sep 2023 15:46:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230925224645.GZ2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230925221049.2681491-1-lucas.demarchi@intel.com>
 <20230925221049.2681491-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230925221049.2681491-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0157.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::12) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa90610-aee9-4ef4-ee1f-08dbbe194d75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iXQqw+3y2AbAOTa0GuDV8ixh1BbMz5e6Ca0ojN7VycXyW3ADc5hdH7wsxQiVGCKSNNEtTg+4+rhDPh5g7Sbew64FUk6Qfs+7zdAklktfA4o+UOSkVV9QCzbTnFNqTXVfeiU0X4bpvviDSJP1xZ1IF/l5qLlaV0NfoclYybg/2lbjFWIWEpPx2NRP1yziMvSArET7/1/Z4fQ/E1sqBsFe2Od+ho5sZEJ8HwnVG33dgDrif7NhNgXSljkbmEQax5gidvvxDGrWX8PSIsYgYxe0JwTasCz9j0kDFBatcKrPodCijv3D4hufc5tsQbyaeco8P/1cwrHxwWeKKOjnPOz+M2sr61tWeditgbUSRfpTc9U7ElhoDdKNSdB2PEhTCQ1ki2d3qvaQbP6/Jjit6+pvPSESd8oFfL4cGwJ+BTXoKP7+T/ct6VkXfM9S6CG7aTWfmp4JpwAqpF7iwJXbf/wrack1RfDXeUb5t+bbI1Gq9kgRiKl/TQEnfa+jypIWxwsHy8yBayI4q8KWGzv15DOrPVmfgqSrktd4RHTkIShTy7QLhyilGDq9Wuq8n3zbcYlwqutmPG11xY2xUVfuH1kL5SM2Xc+nriqom6Ty1otcbnk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(346002)(366004)(396003)(230922051799003)(186009)(1800799009)(451199024)(4326008)(5660300002)(8676002)(6862004)(66476007)(30864003)(41300700001)(6506007)(8936002)(6666004)(6636002)(316002)(66946007)(2906002)(6486002)(66556008)(1076003)(26005)(107886003)(83380400001)(6512007)(82960400001)(478600001)(38100700002)(86362001)(33656002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jCo8Iu0XzYovdkS2I6IUThn62yqCWZbsi3AxCbIo86NyIv21iFtH+hUlZGoE?=
 =?us-ascii?Q?9bH15kGzw/pZsIhcs3WxwFqZxTqHlRXdr64YvZOszmCKiY4z1SFDRDPQtuNR?=
 =?us-ascii?Q?maLiDVi+ZMn56ptsBJXNMjmIpZQG//BdtgG23mLurnb4pKxY9WzBnXBHwZip?=
 =?us-ascii?Q?sSjT3ddtBAR8GPdak+UpJ22u6hbZkFe97uh+7boXpbz510eJx4grbjmblo3/?=
 =?us-ascii?Q?vuBOkftgctDwroR+k1vdEohZ0fQMfcvGVEFoEe46/EOxDmcw57RKzzoFp4/D?=
 =?us-ascii?Q?6KIhV0V/wXRy7FbLzFrTo6eyJB87v3aJc8CWrC65DPUrF7Na+2lDmQAJH2Jx?=
 =?us-ascii?Q?RgWqsazb5oEaEzPIsKYvrvrk1rthZcp1ZRQTslnFAKvOkQc/ValmiTRUosHJ?=
 =?us-ascii?Q?2SNLMa/oEePIZrf20gyFenPGESqWa7Xt4Z/GgtzoypJXblMAvbkqiGQjrwg0?=
 =?us-ascii?Q?WB4lxpJO49erwhZbpUNmi5q10dqmHaGw6uoLSUZOJ54E2MX16myrxSCi337o?=
 =?us-ascii?Q?PJc82gIVd9bJO9w1IRJm4lsHev4GQeP0USmYReZALKswbbHyfEKv48PhUTWZ?=
 =?us-ascii?Q?oGPS6PFobgHH9NFfvCMXoZiU0J+wYdVYf701MZalZI3Wzmz6Lojku1rXD6K/?=
 =?us-ascii?Q?HyJ2d6nv0e42O5L0brtq8GOxrXAL4GEkcz1bP5b4T9MbhTGjKrYGDHNIh/tF?=
 =?us-ascii?Q?KqkhNLvh+IOzYDCUA0kjFSVnfgo6dnxVo+sIZPCjBbdEyZH27+It1yjms405?=
 =?us-ascii?Q?wR9V2PgB88/rZ1NmswmuqYCEyXRtoMOM0zYgiIxM4lpLhM3hnOp5PuvSwXMX?=
 =?us-ascii?Q?5uyNytOID8IbWGUer3/EgLvFoFdk/MnzAbZUOEOWC1rnaCeHtK7yv5Azrzjq?=
 =?us-ascii?Q?yADO+Qb+zikFMJs9cXDw0E0NMZgz+yHR+HYXshpX8aw/LB86nvS0xmMkOi4X?=
 =?us-ascii?Q?4n5fiD338XLjYeO2VFJc7opbN65u1vOTq/DiILuGyDo1k0FDAqHLbsnrOkz1?=
 =?us-ascii?Q?PkXLfOPWGMbC44PdwMThsG7zL3ou9UJDowfqqv1Dnea0kdMSIBNFTc2GweVA?=
 =?us-ascii?Q?+jJYRKctG8J2dDjSJLnhtyysJi1sON1zfBIX3B2vgUQ7xah0dDe0pnzteRU5?=
 =?us-ascii?Q?11I4lis3aopswBiWnWN3VO8JpJVrOpvS0jR7XvJIcYBA+1FQlhlRIIlnG5yz?=
 =?us-ascii?Q?S3KrwEOI9ief4ShJ45u+c/r1w/hM24JeJdSov7OZ/m2SWBW6fxSsy30EK5vP?=
 =?us-ascii?Q?8ppEBZ8pLqHjMfRwgfQdSceChYlYZeHB5en27y8K/Ns7kUVwkHV7LK4JXSKW?=
 =?us-ascii?Q?CIWqhNAlwNMfKYsKz3D2AFXvtdo+7s7qplGn6gSCF+ANxvSy2vhnw6iKUDmj?=
 =?us-ascii?Q?oNu3EHFh86j6A1sifXN6iQmRd7IFXZqAqoD3zFXP+L21mW33JxSSbHyU7/Hd?=
 =?us-ascii?Q?fv+48IgaMuIf7r/VQ5Y4SmuJfzyJXPuH1EFbbgge1Xzxc6UVG0lpFD9QK3BN?=
 =?us-ascii?Q?Gx47JjN/3QicRAsa6n5b4cwyiScednE3gDVXkoias13AVxzrXPQOIePTIOdf?=
 =?us-ascii?Q?SFXAmYL4zljudjw8BXYyHEM1b8RSAXF7Ff0KE8EhXVfNBwDmdjoEYhJHffZ8?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa90610-aee9-4ef4-ee1f-08dbbe194d75
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 22:46:48.7605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dhekvZ3ogGqAc/1CY3V76V0P1BxfK2cRpjBBAZYlL12/IiLuVP0yYG4Wf4qbQSeJN23GR4d0bPIHMt4Kvgls8ClBe6nk1en/C6R73MThuUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8658
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/9] drm/xe: Use vfunc for pte/pde ppgtt
 encoding
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 25, 2023 at 03:10:43PM -0700, Lucas De Marchi wrote:
> Move the function to encode pte/pde to be vfuncs inside struct xe_vm.
> This will allow to easily extend to platforms that don't have a
> compatible encoding.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_migrate.c |   2 +-
>  drivers/gpu/drm/xe/xe_migrate.c       |  18 ++--
>  drivers/gpu/drm/xe/xe_pt.c            | 125 +++-----------------------
>  drivers/gpu/drm/xe/xe_pt.h            |   6 --
>  drivers/gpu/drm/xe/xe_pt_types.h      |  14 +++
>  drivers/gpu/drm/xe/xe_vm.c            |  93 ++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_vm_types.h      |   2 +
>  7 files changed, 128 insertions(+), 132 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index f58cd1da1a34..ffb79e0b4981 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -301,7 +301,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>  	/* First part of the test, are we updating our pagetable bo with a new entry? */
>  	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
>  		  0xdeaddeadbeefbeef);
> -	expected = xe_pte_encode(pt, 0, XE_CACHE_WB, 0);
> +	expected = m->q->vm->pte_encode(pt, 0, XE_CACHE_WB, 0);

Shouldn't this be pt_ops->pte_encode_bo?


Matt

>  	if (m->q->vm->flags & XE_VM_FLAG_64K)
>  		expected |= XE_PTE_PS64;
>  	if (xe_bo_is_vram(pt))
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 9438f609d18b..aa0396330903 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -189,14 +189,15 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  		return ret;
>  	}
>  
> -	entry = xe_pde_encode(bo, bo->size - XE_PAGE_SIZE, XE_CACHE_WB);
> +	entry = vm->pt_ops->pde_encode_bo(bo, bo->size - XE_PAGE_SIZE, XE_CACHE_WB);
>  	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
>  
>  	map_ofs = (num_entries - num_level) * XE_PAGE_SIZE;
>  
>  	/* Map the entire BO in our level 0 pt */
>  	for (i = 0, level = 0; i < num_entries; level++) {
> -		entry = xe_pte_encode(bo, i * XE_PAGE_SIZE, XE_CACHE_WB, 0);
> +		entry = vm->pt_ops->pte_encode_bo(bo, i * XE_PAGE_SIZE,
> +						  XE_CACHE_WB, 0);
>  
>  		xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64, entry);
>  
> @@ -214,7 +215,8 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  		for (i = 0; i < batch->size;
>  		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
>  		     XE_PAGE_SIZE) {
> -			entry = xe_pte_encode(batch, i, XE_CACHE_WB, 0);
> +			entry = vm->pt_ops->pte_encode_bo(batch, i,
> +							  XE_CACHE_WB, 0);
>  
>  			xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64,
>  				  entry);
> @@ -238,16 +240,16 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  		if (vm->flags & XE_VM_FLAG_64K && level == 1)
>  			flags = XE_PDE_64K;
>  
> -		entry = xe_pde_encode(bo, map_ofs + (level - 1) *
> -					XE_PAGE_SIZE, XE_CACHE_WB);
> +		entry = vm->pt_ops->pde_encode_bo(bo, map_ofs + (level - 1) *
> +						  XE_PAGE_SIZE, XE_CACHE_WB);
>  		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level, u64,
>  			  entry | flags);
>  	}
>  
>  	/* Write PDE's that point to our BO. */
>  	for (i = 0; i < num_entries - num_level; i++) {
> -		entry = xe_pde_encode(bo, i * XE_PAGE_SIZE,
> -				      XE_CACHE_WB);
> +		entry = vm->pt_ops->pde_encode_bo(bo, i * XE_PAGE_SIZE,
> +						  XE_CACHE_WB);
>  
>  		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE +
>  			  (i + 1) * 8, u64, entry);
> @@ -1255,7 +1257,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  
>  			xe_tile_assert(tile, pt_bo->size == SZ_4K);
>  
> -			addr = xe_pte_encode(pt_bo, 0, XE_CACHE_WB, 0);
> +			addr = vm->pt_ops->pte_encode_bo(pt_bo, 0, XE_CACHE_WB, 0);
>  			bb->cs[bb->len++] = lower_32_bits(addr);
>  			bb->cs[bb->len++] = upper_32_bits(addr);
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 0b8a45609e83..4d4c6a4c305e 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -47,109 +47,6 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
>  	return container_of(pt_dir->dir.entries[index], struct xe_pt, base);
>  }
>  
> -static u64 pde_encode_cache(enum xe_cache_level cache)
> -{
> -	/* FIXME: I don't think the PPAT handling is correct for MTL */
> -
> -	if (cache != XE_CACHE_NONE)
> -		return PPAT_CACHED_PDE;
> -
> -	return PPAT_UNCACHED;
> -}
> -
> -static u64 pte_encode_cache(enum xe_cache_level cache)
> -{
> -	/* FIXME: I don't think the PPAT handling is correct for MTL */
> -	switch (cache) {
> -	case XE_CACHE_NONE:
> -		return PPAT_UNCACHED;
> -	case XE_CACHE_WT:
> -		return PPAT_DISPLAY_ELLC;
> -	default:
> -		return PPAT_CACHED;
> -	}
> -}
> -
> -static u64 pte_encode_ps(u32 pt_level)
> -{
> -	/* XXX: Does hw support 1 GiB pages? */
> -	XE_WARN_ON(pt_level > 2);
> -
> -	if (pt_level == 1)
> -		return XE_PDE_PS_2M;
> -	else if (pt_level == 2)
> -		return XE_PDPE_PS_1G;
> -
> -	return 0;
> -}
> -
> -/**
> - * xe_pde_encode() - Encode a page-table directory entry pointing to
> - * another page-table.
> - * @bo: The page-table bo of the page-table to point to.
> - * @bo_offset: Offset in the page-table bo to point to.
> - * @cache: The cache level indicating the caching of @bo.
> - *
> - * TODO: Rename.
> - *
> - * Return: An encoded page directory entry. No errors.
> - */
> -u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> -		  const enum xe_cache_level cache)
> -{
> -	u64 pde;
> -
> -	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> -	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
> -	pde |= pde_encode_cache(cache);
> -
> -	return pde;
> -}
> -
> -/**
> - * xe_pte_encode() - Encode a page-table entry pointing to memory.
> - * @bo: The BO representing the memory to point to.
> - * @bo_offset: The offset into @bo.
> - * @cache: The cache level indicating
> - * @pt_level: The page-table level of the page-table into which the entry
> - * is to be inserted.
> - *
> - * Return: An encoded page-table entry. No errors.
> - */
> -u64 xe_pte_encode(struct xe_bo *bo, u64 bo_offset, enum xe_cache_level cache,
> -		  u32 pt_level)
> -{
> -	u64 pte;
> -
> -	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> -	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> -	pte |= pte_encode_cache(cache);
> -	pte |= pte_encode_ps(pt_level);
> -
> -	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
> -		pte |= XE_PPGTT_PTE_DM;
> -
> -	return pte;
> -}
> -
> -/* Like xe_pte_encode(), but with a vma and a partially-encoded pte */
> -static u64 __vma_pte_encode(u64 pte, struct xe_vma *vma,
> -			    enum xe_cache_level cache, u32 pt_level)
> -{
> -	pte |= XE_PAGE_PRESENT;
> -
> -	if (likely(!xe_vma_read_only(vma)))
> -		pte |= XE_PAGE_RW;
> -
> -	pte |= pte_encode_cache(cache);
> -	pte |= pte_encode_ps(pt_level);
> -
> -	if (unlikely(xe_vma_is_null(vma)))
> -		pte |= XE_PTE_NULL;
> -
> -	return pte;
> -}
> -
>  static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>  			     unsigned int level)
>  {
> @@ -158,15 +55,11 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>  	if (!vm->scratch_bo[id])
>  		return 0;
>  
> -	if (level == 0) {
> -		u64 empty = xe_pte_encode(vm->scratch_bo[id], 0,
> -					  XE_CACHE_WB, 0);
> +	if (level > 0)
> +		return vm->pt_ops->pde_encode_bo(vm->scratch_pt[id][level - 1]->bo,
> +						 0, XE_CACHE_WB);
>  
> -		return empty;
> -	} else {
> -		return xe_pde_encode(vm->scratch_pt[id][level - 1]->bo, 0,
> -				     XE_CACHE_WB);
> -	}
> +	return vm->pt_ops->pte_encode_bo(vm->scratch_bo[id], 0, XE_CACHE_WB, 0);
>  }
>  
>  /**
> @@ -618,6 +511,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  	struct xe_pt_stage_bind_walk *xe_walk =
>  		container_of(walk, typeof(*xe_walk), base);
>  	struct xe_pt *xe_parent = container_of(parent, typeof(*xe_parent), base);
> +	struct xe_vm *vm = xe_walk->vm;
>  	struct xe_pt *xe_child;
>  	bool covers;
>  	int ret = 0;
> @@ -630,9 +524,9 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  
>  		XE_WARN_ON(xe_walk->va_curs_start != addr);
>  
> -		pte = __vma_pte_encode(is_null ? 0 :
> -				       xe_res_dma(curs) + xe_walk->dma_offset,
> -				       xe_walk->vma, xe_walk->cache, level);
> +		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> +						 xe_res_dma(curs) + xe_walk->dma_offset,
> +						 xe_walk->vma, xe_walk->cache, level);
>  		pte |= xe_walk->default_pte;
>  
>  		/*
> @@ -697,7 +591,8 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  			xe_child->is_compact = true;
>  		}
>  
> -		pte = xe_pde_encode(xe_child->bo, 0, xe_walk->cache) | flags;
> +		pte = vm->pt_ops->pde_encode_bo(xe_child->bo, 0,
> +						xe_walk->cache) | flags;
>  		ret = xe_pt_insert_entry(xe_walk, xe_parent, offset, xe_child,
>  					 pte);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> index 01be7ab08f87..d5460e58dbbf 100644
> --- a/drivers/gpu/drm/xe/xe_pt.h
> +++ b/drivers/gpu/drm/xe/xe_pt.h
> @@ -45,10 +45,4 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
>  
>  bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
>  
> -u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> -		  const enum xe_cache_level level);
> -
> -u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
> -		  u32 pt_level);
> -
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> index 2ed64c0a4485..c58f6926fabf 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -6,8 +6,13 @@
>  #ifndef _XE_PT_TYPES_H_
>  #define _XE_PT_TYPES_H_
>  
> +#include <linux/types.h>
> +
>  #include "xe_pt_walk.h"
>  
> +struct xe_bo;
> +struct xe_vma;
> +
>  enum xe_cache_level {
>  	XE_CACHE_NONE,
>  	XE_CACHE_WT,
> @@ -29,6 +34,15 @@ struct xe_pt {
>  #endif
>  };
>  
> +struct xe_pt_ops {
> +	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset,
> +			     enum xe_cache_level cache, u32 pt_level);
> +	u64 (*pte_encode_vma)(u64 pte, struct xe_vma *vma,
> +			      enum xe_cache_level cache, u32 pt_level);
> +	u64 (*pde_encode_bo)(struct xe_bo *bo, u64 bo_offset,
> +			     const enum xe_cache_level cache);
> +};
> +
>  struct xe_pt_entry {
>  	struct xe_pt *pt;
>  	u64 pte;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 861d050871bb..2e1b4d46d9ea 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1191,6 +1191,93 @@ static struct drm_gpuva_fn_ops gpuva_ops = {
>  	.op_alloc = xe_vm_op_alloc,
>  };
>  
> +static u64 pde_encode_cache(enum xe_cache_level cache)
> +{
> +	/* FIXME: I don't think the PPAT handling is correct for MTL */
> +
> +	if (cache != XE_CACHE_NONE)
> +		return PPAT_CACHED_PDE;
> +
> +	return PPAT_UNCACHED;
> +}
> +
> +static u64 pte_encode_cache(enum xe_cache_level cache)
> +{
> +	/* FIXME: I don't think the PPAT handling is correct for MTL */
> +	switch (cache) {
> +	case XE_CACHE_NONE:
> +		return PPAT_UNCACHED;
> +	case XE_CACHE_WT:
> +		return PPAT_DISPLAY_ELLC;
> +	default:
> +		return PPAT_CACHED;
> +	}
> +}
> +
> +static u64 pte_encode_ps(u32 pt_level)
> +{
> +	/* XXX: Does hw support 1 GiB pages? */
> +	XE_WARN_ON(pt_level > 2);
> +
> +	if (pt_level == 1)
> +		return XE_PDE_PS_2M;
> +	else if (pt_level == 2)
> +		return XE_PDPE_PS_1G;
> +
> +	return 0;
> +}
> +
> +static u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset,
> +			      const enum xe_cache_level cache)
> +{
> +	u64 pde;
> +
> +	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> +	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
> +	pde |= pde_encode_cache(cache);
> +
> +	return pde;
> +}
> +
> +static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> +			      enum xe_cache_level cache, u32 pt_level)
> +{
> +	u64 pte;
> +
> +	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> +	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> +	pte |= pte_encode_cache(cache);
> +	pte |= pte_encode_ps(pt_level);
> +
> +	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
> +		pte |= XE_PPGTT_PTE_DM;
> +
> +	return pte;
> +}
> +
> +static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
> +			       enum xe_cache_level cache, u32 pt_level)
> +{
> +	pte |= XE_PAGE_PRESENT;
> +
> +	if (likely(!xe_vma_read_only(vma)))
> +		pte |= XE_PAGE_RW;
> +
> +	pte |= pte_encode_cache(cache);
> +	pte |= pte_encode_ps(pt_level);
> +
> +	if (unlikely(xe_vma_is_null(vma)))
> +		pte |= XE_PTE_NULL;
> +
> +	return pte;
> +}
> +
> +static const struct xe_pt_ops xelp_pt_ops = {
> +	.pte_encode_bo = xelp_pte_encode_bo,
> +	.pte_encode_vma = xelp_pte_encode_vma,
> +	.pde_encode_bo = xelp_pde_encode_bo,
> +};
> +
>  static void xe_vma_op_work_func(struct work_struct *w);
>  static void vm_destroy_work_func(struct work_struct *w);
>  
> @@ -1239,6 +1326,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  
>  	INIT_LIST_HEAD(&vm->extobj.list);
>  
> +	vm->pt_ops = &xelp_pt_ops;
> +
>  	if (!(flags & XE_VM_FLAG_MIGRATION))
>  		xe_device_mem_access_get(xe);
>  
> @@ -1574,8 +1663,8 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
>  
>  u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
>  {
> -	return xe_pde_encode(vm->pt_root[tile->id]->bo, 0,
> -			     XE_CACHE_WB);
> +	return vm->pt_ops->pde_encode_bo(vm->pt_root[tile->id]->bo, 0,
> +					 XE_CACHE_WB);
>  }
>  
>  static struct dma_fence *
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index af2ba4acf1f9..1c5553b842d7 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -249,6 +249,8 @@ struct xe_vm {
>  		bool munmap_rebind_inflight;
>  	} async_ops;
>  
> +	const struct xe_pt_ops *pt_ops;
> +
>  	/** @userptr: user pointer state */
>  	struct {
>  		/**
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
