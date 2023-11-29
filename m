Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E11EC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 18:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A21710E206;
	Wed, 29 Nov 2023 18:21:04 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Wed, 29 Nov 2023 18:21:02 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECE510E206
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 18:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701282063; x=1732818063;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kNN+LNY3pQXM5qo2o1fe1Oj7Vnvdy0hr9VUzGZZGIX0=;
 b=aNlhT4mzwVQxgML1Cdt+GoUA/J677XLbgCJ5A7iyeO/UBxIqC8XXVVPa
 8ycKc2U7nnA2k5RKK7zbxTZuZRdQfxUt5dDjkKz5fEJvvuUUtwXIowwoY
 dOSYG8CAyHl7tiQFqtigg84tzHB+baB8BNjmLiiomXTkUVtnYuDu6cGhm
 CUD4eVzet48M8SqmhL/TYWMNwMQKv0OnO+IMleEZXGm46eCFCh43sf8cv
 l+sjFJX2TKc25vIZfkq4Z1FNwXzIG0OJ0AGWpRrFe4reRBYIobNez5T+K
 FepPzNdmyq5jabWfC1PPzIesrJwWIKnUVy4YnYfH4T7F8ragkSNpqoSLj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="189191"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="189191"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 10:13:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="772765677"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="772765677"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 10:13:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 10:13:54 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 10:13:54 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 10:13:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dr7RAKzb+98ryUP4MAY7g+NZwT1iL7sc5mpfumnW2TnpaqX/OXDgxSNbpWlnO9Saaqdk10fEaUWYhLlZ81S8uRqfTaVSwbNYYWKcmRaN3dtR5sZyti5a6dN05DT12Jh6EIeFB60B0mlHpFGvjOe4oAgIaEb6Uf7hgviW2oWkK/W+NYiLpKXWyrRXWqQu8vcmBcDEhznZofgAoS00FvBtHCyUCETl3J9GD0krmOCjx7Ggg1Saft+FSJAXzyEQQLTiNEgstQy5BGyFeEcrZpcpSti/CEjSiuPROt/VXklOT3lFfitm8MnNC3aqkv38JnDz9VpKq+Zru9kqOtCKJnfObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHKwsIq+f7ENATlnOAB3+ZgVyBzNztY4A06JjD9mgkM=;
 b=l3OsGNrPbuFXKtDXeqiTe+GMmE1KzsF+B/Hy54kykzpx3/Fb+/1OWWpsYtDHUIU31unPIZOXHqP/pHn2y3c8zCmyrZ7fn7MA3ooPE9BAwMQuw1hED22P04cEmIwPfGEk8OOND9mOgTriw+hkcLvWvWSNqwpMqumzppQUv193/u8XMVT+pKnn9o+fEYXiCn4TNVFJNH6PPMqRE7iGI33AX2B+IUXa4huztcHxeQ6p5yM9Ns3fhGPYYjnlxzgz2lG83al2V7OIv8cnnURaHYjOh394a1tgsBApyOMuPasgj23PN1tStaciLADFDdj2Ak9IrB7NTyfmPt6SqSXtePeU2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 18:13:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 18:13:52 +0000
Date: Wed, 29 Nov 2023 11:12:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Message-ID: <ZWcckBAbpB+lZrsG@DUT025-TGLU.fm.intel.com>
References: <20231128213634.3633-1-brian.welty@intel.com>
 <20231128213634.3633-2-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231128213634.3633-2-brian.welty@intel.com>
X-ClientProxiedBy: SJ2PR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:a03:505::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB7014:EE_
X-MS-Office365-Filtering-Correlation-Id: cda5b097-1039-4bdc-4752-08dbf106f11a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M2kAn51ifLIhP/OHdBXYY1fxOm/lYlYtmOicJ0wdclksksIieUAf4WcztiWxVUknJ5iUjdKKbKPTy8dbmk7rJ/arN8qskPSiW3zbDKCqojWsK8w+KK0dXMEv6nt6erhGJ+ZOuMfAuxng3A1f4c2/fFgf+Sfhk2CjnxhJG/WGP0SNFWfklslYkFfY6NnmZzemMsOMpkscwBJSe9fd1FzG6cv5WD0sEe6bYGuGnQcqbzVMfXtWUGnY08BYOCwVb2P0TggWs+BY8XVDaAKUsIX8nXGXNo9GC1YrzFvhEL1QuDVVLSh4JWpSu1KvyqpUA9uqCAWkHg4DVypz6a6QDQZ+gNLSq9AOFwKSv31itPJ/um6Y+rZNKleTFcs4Ol3hDFWIc3NUt/MTx7xqsGJyMbB5En5wGEklME+Ppi0Xdg0elmgJYdo8FI44rJngfy7VP0wlt0vXMTIvqEMYFetcFjH+QXyvm139SPPlExLzLvfKGVxUeYwvXvBmJjUh20hHQXab25dtSMttJR4BbXGXB2v6bjFIciFOsCSX0cDi+9UmwnqWMtEAeDrJMU0/2KtzRsgRsmmsuS3KTvhzy3TTHf6ZkEzuq9XUQhDB5Ryxe6n+alM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(376002)(136003)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(38100700002)(26005)(86362001)(6636002)(316002)(66946007)(66556008)(66476007)(15650500001)(2906002)(83380400001)(44832011)(6506007)(6666004)(6512007)(6486002)(8936002)(478600001)(8676002)(4326008)(6862004)(82960400001)(41300700001)(5660300002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w3VWI/7z+qdzGhAc7h30oH/3MZpydRHcJ2LtOBMfFoGA7jOEhbyyMUXqmlOy?=
 =?us-ascii?Q?CA+IlnRgf6+K8ZKf4ve8kvwgVqN2grrU7s2UFpoDcJvj/Xk0yUyBpUTnJGaN?=
 =?us-ascii?Q?B8YRSCvepCv7gbXCUwprbW0MpXsiAmhtDQS4bCG+iIsA9sksRdaa/WvcoZO9?=
 =?us-ascii?Q?vHDxUneGyFAeCMNM8kW5bfWzXvS2E+kZgZDOZyEgDS+3tTZ+vZ+Y+DpIBFuq?=
 =?us-ascii?Q?pfXEPlVa+wcwXLWdBSeF5m2NQ7IfIslyCjqaDziwVyNDz0wLjQEGhTDxxiAC?=
 =?us-ascii?Q?El9ZXTqjz1vhr+la68Mkko0mjYrIGLZqUeHAYfzpvZsBm/2qawra9QxjwCoc?=
 =?us-ascii?Q?vaFmahtD4Uet1XatHvq2k72eAkANH2lbn6NwIwH+N5Ir0E1HL+tX8i1OErb0?=
 =?us-ascii?Q?aei6ldW27ok/KTVi3PWVSTcPyu8vnReCmlRNQtTcFys6dx5x7bDxhbm/e3aD?=
 =?us-ascii?Q?aBZCn/7s06ert0H5NhFpCJNPlQnObRTfY/yGJnckdc2/pbk0hIOj9BSaHzec?=
 =?us-ascii?Q?cN5bcHg81JlJYyiFns0baJsel2bukNSkQs6YKhSLMGkBgFYHYGvkWoCfVLuc?=
 =?us-ascii?Q?o0fpR0tK8YhLxkIF9gIsgSSoC+3p7BC55zaaviaDY+zgNxFvHsrKWnkzT6dN?=
 =?us-ascii?Q?xTJaYdp/dCVAx5UZN9vk71MPoegRvHQyz5f8EyToPUzRJxCUqGlej8kO8ZIs?=
 =?us-ascii?Q?DMpoUCIberG+PN2tEfe09QWyIlKbxCduOypslSuGV41SiCnQY71anb0Y4COq?=
 =?us-ascii?Q?5l/VeFXtiiLFB2cN831TtF+vq2Feqf7tGtUJWqch4y0e08T5S5ltIXlwhu2d?=
 =?us-ascii?Q?JSna3AendcTVMJtF8+eTxgOsD7GufDI/5c/7SW32c4tuwjCvwvhMQtqZUQM3?=
 =?us-ascii?Q?CjpaeZrqkInIz3pNIyF1QMF0ANaQBfZX/w7CLy+v5stP3FHIsJXM6gX1kGCu?=
 =?us-ascii?Q?bDaSYfO0QSSpEj7hA9sB73TG2qXhc9GwxxgLV2y9kJLd3HFfsKmnw2WklpI1?=
 =?us-ascii?Q?XPITzew3jJ4jZvJf3o3FchbzVcA60myzCyI9/VST/C4ehQtYM3oehFkvzuOk?=
 =?us-ascii?Q?jfi5MfQxYynmBTsqcmeB31B7Ge7m88IVkE9QSXMRX5ezgbbVzxj8hlvsXpkm?=
 =?us-ascii?Q?/Fo92CqpuWTEMdpZMaAwHYhLRwEQ+4fpEsAfl8srLjYoUQT3uxTgBE/xYKTL?=
 =?us-ascii?Q?26hXC3qLUA5GBqD+UnmbCFwBL9lSNo4zkvDkwgg0UmE7/FSxDKfMaG4ma2vQ?=
 =?us-ascii?Q?kHCWTDi3s3K+2f9NL4ouVRFcOof7Nb2m+jHpRewGSpEOUceWK3EcNNrmCZkz?=
 =?us-ascii?Q?MeQzJ+7gBi8DYvUgZyzDJ127yp1F7bKwElryehyHGghuV2Sr5DKBZv1Mfske?=
 =?us-ascii?Q?SHFKSBvwxrVekTuXJn7kHaVuxVJkp4mLkyz1rKZnVYif87/NOK/os6LldJTS?=
 =?us-ascii?Q?mGoWJ+rDD5yigertmxeO8tgnl/CWLjAU9kgbCeq32jey2DBOD9WsXGEvUlBS?=
 =?us-ascii?Q?iMdJSojvxDeKFW8tDzOkL1hbRv+O+K00wZKUWKI1f2kgS+saXYnK6IRn/hRr?=
 =?us-ascii?Q?CcasaCURIH7tphJqC9SVABkNszXL+IsbJPSmV4Kvp7QS6TYyO73W26NImtZM?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cda5b097-1039-4bdc-4752-08dbf106f11a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 18:13:52.1166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsxSt8LLIkHAK1daHpPLEhHbUz3+0ULl7H8XDQ3Vp+9nAHoZY8drsP2+CSj9HNQkLqrORUkp7jgME3IJaXwV0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7014
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/xe2: Update LNL platform to
 support device page faults
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

On Tue, Nov 28, 2023 at 01:36:33PM -0800, Brian Welty wrote:
> LNL is first integrated platform to support device pagefaults.

Nit rather than mention LNL here maybe just say support faults on
integrated platforms.

Other than that, LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> As we have no VRAM, changes needed to support LNL are:
> - device pagefault handler should not attempt to migrate into VRAM
> - update xe_migrate_prepare_vm() to use the usm batch buffer even
>   for servicing device page faults on integrated platforms
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 2 +-
>  drivers/gpu/drm/xe/xe_migrate.c      | 7 +++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 03c1ab0ab0ca..959ea50c04db 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -105,7 +105,7 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>  	if (err)
>  		return err;
>  
> -	if (atomic) {
> +	if (atomic && IS_DGFX(vm->xe)) {
>  		if (xe_vma_is_userptr(vma)) {
>  			err = -EACCES;
>  			return err;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 80a130beca61..e8b567708ac0 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -215,10 +215,13 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	}
>  
>  	if (!IS_DGFX(xe)) {
> -		xe_tile_assert(tile, !xe->info.supports_usm);
> -
>  		/* Write out batch too */
>  		m->batch_base_ofs = NUM_PT_SLOTS * XE_PAGE_SIZE;
> +		if (xe->info.supports_usm) {
> +			batch = tile->primary_gt->usm.bb_pool->bo;
> +			m->usm_batch_base_ofs = m->batch_base_ofs;
> +		}
> +
>  		for (i = 0; i < batch->size;
>  		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
>  		     XE_PAGE_SIZE) {
> -- 
> 2.38.0
> 
