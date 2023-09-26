Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B465CE7F144
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 23:14:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA1F10E44B;
	Tue, 26 Sep 2023 23:14:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5160D10E44B
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 23:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695770046; x=1727306046;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZQRGqHYPTZQcwoKY+YumZ8pA85KxEkJgsZDeiEkX6rQ=;
 b=miEy44gTu5dyaNCvEIHIJg576TwfgPxSmtfqasg6c4uc+zEXshE5SaFd
 buP6YRSgZb8TezcGlXhhb0BQ7nKvPdQvurynpcod8bUKzwrPeMDNOe+Xw
 +dSBoqAtGmgxQ+LYnuoNeAvLVP4QGlItCE730tfXgkLntm4zW2XB5mnXz
 QxWOlzLGKtPdt2XcHA9ccdu7zwJ3xNnbvPKDV+R5KjCBImaRrzSDVCsHH
 ybSLNJbyA7v0krGZMMtbUUKAKk1Rb914/QZ4xGdp00mv321UOBR4uEEUq
 UyJ4Li/SWMqa1JPaz9eM1/QImRV07loR1i5VHrf9RDR7UAwAdb6KL3v/P Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="381585660"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="381585660"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 16:14:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="922592725"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="922592725"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 16:14:00 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 16:14:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 16:14:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 16:13:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M18bejMgHz/FH5QsTtTluymsl3Aiizntw5JWAYCE/WolI7Q8RKXK4NWiXVof44WEHxxugHnkdQGaxSDbVNLoCUC42m3yln0x9tD83/MyMG6of2e9sTbbneSCPLw6R5epgHsep8kLuefRQ9jKwlBQOngq8eV5HdoAgKMUxOUxjOWgCA9EMuZ6YqgTBxUiSwZgR99YjOC5j3RMbSYEJ08LzeeALVEgwh3ECfF9UqM5XrxAuqSGkqKiPBCtuw9XCwOZgXZqsrk0mhuXx1+SelOjASo2wGu+Z0ZUsW7QjO4SXEMKpguw/FBQ4A+DBttPZ18kJ+zFVeSpHNL+deoGhh/W5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGk91rCbLieCMxQdjTRZNTiXODC00Innc5Z9MqxG7tI=;
 b=cX/MJs0gViINAZFQdMLKpFrvXaU5zU9WKvpbKmW1MSqGbq4IGFr2TFznaYyuG89m0dKnN472VzLoxQtZ9+0RSeu8KRQnWw7AGv4UTRf5cjZy28QGYUkqDy53mpO4rdJvi9qgZfhW/YlsVnZ6A+pMaDE6cAL48VZq7opQc5liWeunpAkAsBubI5dil2yVl0sRYSXbFw0nKN+7uw7+Jsd5P2s4Z5Zw8BQHc8J5ucUR+hCtFDnGcMbWeMgqOpAHaMPiKU8DI5QL7nbA02lAqFmG3yjSHHHEYr9Q4BGGKdzAcy/V2JgB81tdXg02rPv/o3IzGeKdF2yEZSYLK34wCQrSoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS7PR11MB6077.namprd11.prod.outlook.com (2603:10b6:8:87::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.34; Tue, 26 Sep 2023 23:13:56 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 26 Sep 2023
 23:13:56 +0000
Date: Tue, 26 Sep 2023 16:13:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230926231353.GU2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230926223631.2807873-1-lucas.demarchi@intel.com>
 <20230926223631.2807873-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230926223631.2807873-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR11CA0064.namprd11.prod.outlook.com
 (2603:10b6:a03:80::41) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS7PR11MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: 735dfff9-be67-4b82-d2fa-08dbbee6420c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z3SL3Qhut7+3nP26KhTfeD8Qn625Kger0EDhjkNEO4bms4s5XRyNFYDDtaZwKIJ6vjTYdyYpdKljoOAGEiYz3UNxHSfcoXZ+OaqbDunNMqHnLVnSsKQbu5iuE5Fiib2xeHng0fNXGkmjffrxr1XuwTKusWDRa6eGyiXG2wA0JNAlDElH/a1St8HCEGLe+I+DfvoE3prGYPFVTgxmELnYAD6uiWq3xoyKG84OoLEvdZVF8n20Aag56Y17OgT+CZwDFTjdGPVR0H9syKJr2v1F8FM42exEenE25Nl3zvhX5f+T/X1UNWWYr5NlKZQEwoLiZLDszJ8+c5gsJT0Cvu/zPmevV15YZO2D/8TRXgCUHhQgNie8yhxND3OJYMIUdvjDhpC0ti1mjugPrUZazH7jHxF9dS5oE+pVadYm8QUCrYPGZa9nqTkP8zbtqVKweuYRSPjh7UAnVh0lw1YzTH+E3JQFktOQYmrJgVPlq/vIBujiq25CedZWnLtXhimjfbHJgC0WqUEnXNXYKRMeZCBUWx3JR7wazjgV5G1YsYEfQrECqjTVhoP+Ar9TByHl+8mZ1cqJOpa3aWyQuxsChRrQdamC3sW7lTKmUFj+DhH9Mcc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(451199024)(1800799009)(186009)(316002)(83380400001)(6862004)(4326008)(30864003)(1076003)(54906003)(6486002)(6506007)(6666004)(33656002)(26005)(107886003)(6512007)(41300700001)(5660300002)(2906002)(66476007)(6636002)(66946007)(66556008)(478600001)(8936002)(86362001)(8676002)(38100700002)(82960400001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bimrhxkpi/QJi1wdZSFwRL7N++qOCvOHM1WQAbS7c0q+np7jstsJoWwpwjdp?=
 =?us-ascii?Q?5h5EAiWXsJt3D4AufTi9MV7NwgG7XYZYmQLmi+ahLF2sNbWSmQstqVWW6BWZ?=
 =?us-ascii?Q?C9UEtxswAOtkL8qhqTddZcs1hpyX1Qc1DQMf68io7pxFRV5vXgo2ftrurl/n?=
 =?us-ascii?Q?Pt2Z02NwncL+07Frs5OReXnzsqIgCXL7WRdV1Ir/9vULGrvFhN027Qig7fZZ?=
 =?us-ascii?Q?37ix057ZN3Zi0YgCbn+omlcSxdSl4wK53uJl11anoCszajJp6sXTjcbqnzeg?=
 =?us-ascii?Q?tzp+g7fc10iMaSrK3qjnsh2DWZI+mdVC8OmCNPdPhyRJzeVdDdKnMspHS55V?=
 =?us-ascii?Q?+UjD2+ColKCshfzqcuX9GWLjgi/BIUaKQZK2jOzOxHuBiok9M8xxs8oFAAY5?=
 =?us-ascii?Q?ioOsS3ngJ/nZsocceZA1QFJSKRRlf8EtPp1lwqZ30Fgx6OiJsPOdX8yEU1xa?=
 =?us-ascii?Q?ZXV9Vp0I+JDFciqnoV5MiEGl2IPL/wb5FagmgWOEEuV7JK09xFLDbn65xnro?=
 =?us-ascii?Q?MyIBd1u8CGQIWRrHWlCug8yS3I7g8jFUA+CASZ1aa5vwJ/bl/bYH6FkHFNuI?=
 =?us-ascii?Q?tQfrAgY5aPvgC18+yUY84dGL6JivM7mYxKxCemYyJg/Wb/oYSJIplHV55COq?=
 =?us-ascii?Q?PS9HtQS5Ko4IeAkFEpMFD6e+aNC2aC2n4tPX3rShpgEtFYZeu74WoszR1HQI?=
 =?us-ascii?Q?04IWpOUpyRy+7o/AY/4rywtYRlYeZIcL4bJRlZ4laLIb+8vxeYIv+JuvdJ0I?=
 =?us-ascii?Q?qbLByt1fkUEo7ECbgHFT4mncOcW8KnPe+Ux1BcmoQDprc+xU7iktlyNO+DHd?=
 =?us-ascii?Q?NKRB9bEuIZiuXr0meeVTUknya8vmIcu58kHrMyaZKZlZbV4zMUFFwL3k/+rf?=
 =?us-ascii?Q?Dr8sqRv6vq6Omvh2ORNcCmCEG1UaapqfQLZ+CIXdqMVM6jh1OAhdZknTKbur?=
 =?us-ascii?Q?BDUcwmRXueJF7boorFfJc/Jb0Fn7uUlC0Y4qsR8NF7wezSNd34z2zoGCJZJL?=
 =?us-ascii?Q?jOGP2qQIB4ph+WreqtQyeA2QOXxWvFaQoVaO6MdCv3SUZ30vxANI732Tk2+I?=
 =?us-ascii?Q?M9j2lawnxthn292BsKGeqHzYbzO57+KosAqQ6Zpta8ck6pcQkWAsbPAMawKz?=
 =?us-ascii?Q?5C1eiELOOnV9GYG+TnbyovsvfXqrknmQwJvC2I3HRFJaC/GWLVWiI2xRLFL+?=
 =?us-ascii?Q?8n6z0qIjX5yJTqFYDyLjTiGPS77n2Cw/zAOOEhjCpjEL0YDFVvhbkDDDX9pI?=
 =?us-ascii?Q?H9N/Y10bljGqe1LqO7ZwVzK1EDw3YD5omSCJduab3/V8EpCMO/S9GCKy8bfF?=
 =?us-ascii?Q?gl/53HZfkvxFmvgFzHDpx9g/jHiX97lJG/NHvjiR8eQa6NeLjSC7iQGMuzMG?=
 =?us-ascii?Q?NF5HUiCcXURu7VKas1olczs3Su9zXo9S5Wcln+K5YbTsQprf7dGaperztoTi?=
 =?us-ascii?Q?FEGtuX2JCEvJGTBAStNTQMKV3kISvHASTfVKcvJW7LNvYvqsO3D2BnWET0o+?=
 =?us-ascii?Q?Q5gb/fhpMNeQeuriUd0G9gcF+/B7b5ktGQKFL0UuW+w+ag3c3e3F0tsqqNWr?=
 =?us-ascii?Q?7KBllg9+hTuEpDEMPvKuTj9KpLtbVpuLzHVQ2ZGBNCyAhUkPFkh2c7dswmAm?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 735dfff9-be67-4b82-d2fa-08dbbee6420c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 23:13:56.4071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rkTZldR2qk7EhFQrNihzXfkKOJSiMv5pHdmUiNlzBQYj83pPyqbSA53f67aD4nUT/OSBZtYHpagoYWSUV3VptmnXR4vLQlU07WjeVK6Df90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6077
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/11] drm/xe: Use vfunc for pte/pde ppgtt
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

On Tue, Sep 26, 2023 at 03:36:23PM -0700, Lucas De Marchi wrote:
> Move the function to encode pte/pde to be vfuncs inside struct xe_vm.
> This will allow to easily extend to platforms that don't have a
> compatible encoding.
> 
> v2: Fix kunit build

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

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
> index f58cd1da1a34..6906ff9d9c31 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -301,7 +301,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>  	/* First part of the test, are we updating our pagetable bo with a new entry? */
>  	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
>  		  0xdeaddeadbeefbeef);
> -	expected = xe_pte_encode(pt, 0, XE_CACHE_WB, 0);
> +	expected = m->q->vm->pt_ops->pte_encode_bo(pt, 0, XE_CACHE_WB, 0);
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
