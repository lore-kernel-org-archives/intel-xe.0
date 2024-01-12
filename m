Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B3FC4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 21:10:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3045B10E0CF;
	Fri, 12 Jan 2024 21:10:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4869310E0CF
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 21:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705093850; x=1736629850;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EMsaOdqgP9g3lXAtD5mlNwrilL2jca68ZH2weCcaaKo=;
 b=et29GMsUYckTwiOpEZodD0vjI8nyOL/TZoFGJeKdH7jvUqB1waDJlVkg
 UF4P93ZyI1Ln63+Q8dlmUodTiZgGoIgE1U7Ks6TWQBQNkRH424ovEhvAS
 DSroT6aamHjx6GtTeqX7+USM/QWkbBkG2wgjhzyQxonPw7Nn+OhN27f2K
 89aayso8sykrIDqM/27Dt2SsIBxLOWOoanc62mIjpDr5CT8L8pE/QfczN
 Er9t3jDlmpcDlAfyt4qb6LUaJyCaxYLiaKzj2yPbJQYPqDizRWGOq6pkg
 MGg7QD261RMtwNKMkqp3yVVtjL7Icun0r6M7pfUojyuKGIr0AijsBiJqb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6644494"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="6644494"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 13:10:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="902088880"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="902088880"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 13:10:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 13:10:44 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 13:10:44 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 13:10:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cc1+9RK9WUCBuZOKx8R4G/a/b9ONsIzUdroNUoy7IpOhuVY8O+mlIUl2W6VthaDGSHg0+iPmsqHTMMKUPtg6A0R1bjQhT+zTtxmLKWySOP7znuCSx2Nvik0A5tfsmdZ0glUXQCsYXt/DjuKKf0PKt8HZiczkrci8g/TueQl+WQ/C5oPDtvhgbxrGz0arAJnJPQqyfhwgDrg1ENKiA4ZXKrZxWwcoaOMkEez7wof5DgjCZeF2L1Xd0RzJ3mC901FoNs5yPeBiwkNrJs5sPH9Zy+YqI9GDSXBOYSYIwpGgkxaSMbIL6YvkK7H9AW5JNrDVxD6ynJoO1f/PguJylRhaQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5oNhgFlOEsHElD2EvJ925IvNhktLkoMOsemzvEV+IY=;
 b=EGaAiWp2bPqjC4R2Pth7xeo/HQqJLxnQL8USNZIwD3DiHcDFZAlwFbnaGnHHSCoqruXYal4BQpjxwr8A29inZanNnrD6mggrwYBMEZb2XyxCWfGLC1UFsHVNKV+5dui7fGCFaIJcNbvnm8H8sOIZb9pHuv5dj4W5a+CKqXf/Qgb55z5x/EIwOTNyne46WGkMiW9U5H/u/fp7ulky9xzp1EyYfdJLOsJZLOKXdecFfxzNIreAvmzhuN0ED1vy/n1VgsCTjSt46HCMpPKcEUr4z6D5YZavMVvBeZV6C2pHXKXX4kF56yBV75IBua3fGgFoD/W5+jJ50JApZLw/WmgyJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4929.namprd11.prod.outlook.com (2603:10b6:303:6d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 21:10:41 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7159.020; Fri, 12 Jan 2024
 21:10:41 +0000
Date: Fri, 12 Jan 2024 16:10:37 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Initialize freq_lock even with skip_guc_pc
Message-ID: <ZaGqzR8RXWbWolfg@intel.com>
References: <20240112182949.181403-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240112182949.181403-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0142.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4929:EE_
X-MS-Office365-Filtering-Correlation-Id: 7664e87d-c586-4d7d-3d2d-08dc13b2eed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 81QS5VAjXb5yIeQRhs1r8q9l4MBUATx/M7UZVpDPrz+x6h838Gn5Pt3RJ5fH0eU18sOTzTYWWHpowhU7BYolMWHo8NlwSXeeQy2exJOl3fhLeZbTdxUmzWIv3xodmJdNhRN3xkEWUCo9ZDLu2nRpTnp5PIQ5wy+cPuGObomPziyQgg4XwSes+heKjdUe06uHS8ehTkGLEQbYWs56AbBqVRZlHLAg2LZLE7EHddtD3/nM6y3CkvuMcDx6pM+DQit2YBfvJBQC9UrS1BeQwv6QXzdI2kIVQrB4rmuvS1ZMUm1gzRYdIKub3f0PQpDE94fHDhL+3qRSeO0fW3zRr1PXF6PEaI6NykMixk5a7FW8XtCjKsz3t+8XfzILA/EAnFSxFfzEs5UTu3ArsGorGww2wIDnX0mwZQCAlVz0o9JVYSvoJyV7c9nQ0RBYE9XewmbtW254qIHPHUt5DcJqXAGDn9X7Sa28arRCEYVVIfuOkl9H+2vxFChQlP3flY49GOB0nXk7Eu+nL0GkZ1wLx1RAKNTUdI5BH+sudwZSBQOL6g3uOQXIVhYZplKP2J8PCFIW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(39860400002)(396003)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(5660300002)(26005)(6506007)(2616005)(107886003)(38100700002)(6512007)(6862004)(8936002)(4326008)(44832011)(478600001)(6666004)(66556008)(6486002)(8676002)(6636002)(66946007)(2906002)(37006003)(66476007)(41300700001)(36756003)(86362001)(316002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U2Oyp+Dec2VVy6Fbb9Hdcz6TQ8bDAFlGgWm2hswkQlrBklM3H1MXC0vQf6yn?=
 =?us-ascii?Q?kUvU4KmTTqTOIWD4g1VWOa9iGdDwWB4cpfw7GGXHRzqx1PL6Bpz96WmSNy27?=
 =?us-ascii?Q?DF2WWEtQgelNUE7+QaZI2zsYJyrvaxTPcLW4I+ny9RxL10XNuopDj14ZiOuQ?=
 =?us-ascii?Q?9vnAqqQD1vRpLbUqLfK9/IF8v4WFLF1OunJz5e0kSF6/sR9b8tqfwjVfFJWn?=
 =?us-ascii?Q?sshUdvoMkRp88PpgdRMdFznwC3CakQbFhTBvEG+4nKf4Ip+gdH8DrVTT3bt7?=
 =?us-ascii?Q?/s0KsLJQbg0uDvWTn0ImxrjE1XZxFqN6wX1G13YjMOA2IWToOBrEeDjU/pts?=
 =?us-ascii?Q?1dNkNAjRkAnWxlT2hhGRXLEAL65Nzzci2w5b/aSXfIvvgQ/OgJHtKi+UReSS?=
 =?us-ascii?Q?pylxcZz+fRMnWniiaa4gfzhLkCzqdZmBu+zcPAct9Q+C72OSJFa+75tWxU0V?=
 =?us-ascii?Q?dfRcFBtth1wTUsqc7qA5rkIfUp3f2t6mb2VvkZ4jydiUMDRr3562W6mwp0AM?=
 =?us-ascii?Q?tL8un7V6Kh4ytawxZYJHXgFX7CrFC1unQ7+/R47hneS+BQxD5b90+tUztIPG?=
 =?us-ascii?Q?naUrZdo2ezx/vXVNLkLuW0Iu3FQQu/plQoTem0RNLT4+5b/dkcKSb6kUejLB?=
 =?us-ascii?Q?1Zw5OOTpyhXaAWVc/DPJ/1+lh+0gzhdTZccQp0WdmsHOE9XH2DU4og3tSDTJ?=
 =?us-ascii?Q?l+KDgI8xc0BSezHZv8LB5M28mq0HfMpTYSyML6StpG2fc1PMSyAady5OhEiB?=
 =?us-ascii?Q?icMelgEwac/trWVXXG1TtyILlOPxVpJWT6lm39G8oEhQNlFbXwag7nMfDVSq?=
 =?us-ascii?Q?Y0eWQAo3ZCyTXLWmku9HKcUWKoJOcmt1ttKbU2EjfspAoc/bdoU5pwfXnTfR?=
 =?us-ascii?Q?nXkiesXC3UpJLlXIuVU2vDmEAZjz1bDM4TpS9FwJvCMdbOFxeRe+y4qZpg2p?=
 =?us-ascii?Q?xi9E846wKUpR0rbSO1mjgqwL9NTamw/cxKaZXv/ynRbfZMx/S4lbKQkVGyyp?=
 =?us-ascii?Q?F+Hk9BiQ0VCUveT/gcpmAwquhvqImMiZex785fGeE/tYO2xwLXzZYGASYAuy?=
 =?us-ascii?Q?p/LvtIxc/PneeAd20Ma05vBb3/JonifcqtpLbiXMGpHmZRRbDwktLTbXEkO1?=
 =?us-ascii?Q?KFXhgvzytIoHDwnXgNBNK9tUkOAmwAK0lOiZlIy0N5na3nwUE1C6xZZQMdvW?=
 =?us-ascii?Q?FzPc4Ams76feskDb4qiANniDFoNut6l3SG69UPkifd4dtSsq3DkNUfSrrP8B?=
 =?us-ascii?Q?CWoBjrfPc2zSDiP9XZaBm21cDr4zajgyxH4br/WvPR0KuM7Ou9HDPdtTWXzo?=
 =?us-ascii?Q?nMcmQSSyMyFP0TrZqhAKRbAk+qMOAuGWRXfZkLAyNN7MkDuQjb2bPNN6hDPR?=
 =?us-ascii?Q?6YyBAIhBlYKU4slNhVIpsoclL/XzSMmVtZMBD/K8Fh5vJ4Y9bHOC/xyiuwqh?=
 =?us-ascii?Q?IWv0S3pq/hBfhQoiozWf1q29ZMVo1NowAW4lMr/OzK0SihL1aY2mOIxIEHsn?=
 =?us-ascii?Q?WFJy6qMTc98kpIwdgOvLYGakMd2pl+ss5Z7nHwRodaNraUymUD+u0tjztGXx?=
 =?us-ascii?Q?pM/aZrtVOjJTD3EKOzMDwwME9SCp6ERL76GBs+5Q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7664e87d-c586-4d7d-3d2d-08dc13b2eed3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 21:10:41.3947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWJrRgg5kJH/w+Xj+6iJyYXu6cUc72+qc5EtK/OvOXaxl0vi/7gF0+LGoK3RUuHs5VK+zH//Cp1/H24bDAJp6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4929
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

On Fri, Jan 12, 2024 at 10:29:50AM -0800, Matt Roper wrote:
> gucpc isn't initialized when skip_guc_pc is used, but some of the sysfs
> frequency entries still try to grab the uninitialized frequency mutex
> before realizing that they need to bail out.  Tweak the init/fini code
> flows so that the mutex is always initialized properly.

hmmm... good catch.
But I honestly don't believe we should be calling/running any function
that is trying to get the freq_lock. If guc pc is skip, why would we try
to communicate with guc to get or set the freq?

The shared buffers are not set and all. We need a deeper decoupling here.
Vinay?

> 
> Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index f71085228cb3..67ce24fae79d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -964,11 +964,12 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
>  
>  	if (xe->info.skip_guc_pc) {
>  		xe_gt_idle_disable_c6(pc_to_gt(pc));
> -		return;
> +		goto out;
>  	}
>  
>  	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
> +out:
>  	mutex_destroy(&pc->freq_lock);
>  }
>  
> @@ -984,11 +985,11 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>  	struct xe_bo *bo;
>  	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
>  
> -	if (xe->info.skip_guc_pc)
> -		return 0;
> -
>  	mutex_init(&pc->freq_lock);
>  
> +	if (xe->info.skip_guc_pc)
> +		return 0;
> +
>  	bo = xe_managed_bo_create_pin_map(xe, tile, size,
>  					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>  					  XE_BO_CREATE_GGTT_BIT);
> -- 
> 2.43.0
> 
