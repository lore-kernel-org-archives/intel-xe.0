Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C24FF886F
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 03:50:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9AA10E08B;
	Thu, 30 Apr 2026 03:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLA1U7i6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C978910E08B
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 03:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777521029; x=1809057029;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=danTO7hXft0YN2dvmsxNZrbRe20yZ1Bu+H+ndLgoFDM=;
 b=bLA1U7i6Ng2AcgraDht8WuvIw/bS+G8+3epDCh1ie1pobQowELdQJBDj
 zcHmfmtIjW+PiOybq8Riojr646AgMB0rIy6trC0+vd/eWbbla/5jFNR8m
 qJReJqQU1256fMy1S6PUrAzcX1hUIgCOyQFwoAvMBTb0U3zR8yJm2pimc
 CmuubBDD/0ghWqpAvUsuKMMiBcNKNsJeFFeRwOJHsywuM4888iB+SivVA
 cmv2PKuXkHUlGLGfa8Mp1o1kPWsnoMP4WlubrwRpl+zke95HQ+YtTdgEW
 qF5tVVPhijt413Vj+AJNHNXq5Vb/iGCZz37llSLCDSx5D8S+5M82Vt2b/ Q==;
X-CSE-ConnectionGUID: qvUNFMP2SfShlfI/sGxWcg==
X-CSE-MsgGUID: 9rMDLEo1TD619nmAxSF7zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78381252"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="78381252"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 20:50:28 -0700
X-CSE-ConnectionGUID: tCszWDFLRKS+gps6BgzkTQ==
X-CSE-MsgGUID: hUqqb5EgRIeAVvk595H+1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233617336"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 20:50:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 20:50:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 20:50:27 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 20:50:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRuuR0DGWmIaUJ0mJ4pUR6zRwabtT+r4jbTMXnq18q7nJY1GuRaspcZpQlDhfDKVQRP5P7wNhQs3cfNWZSU/z1r53iBbGlYcheYV6vVJEndulrzpyJzUWvINWN99kfXM9mklnktR22+U/wNQY5pbTcp0PoXUHFS4xq5yIMTtNRD+TSjPrutXMEajuG9gtVeUHCm7NKFe3B4nxXEA+46F62Y0dL4dAmqPqXoeJAC5tZpZxEUyTHt+zeNsgPY7PTogFnOfnaSoxuILWM6DC6yceJMROd1o9/JPfIX2dBqxsiP72BYRC7+m1YZ/KMV53FGNhgCGekiVdQaZAA57QsW9jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMLxd6V0Vg98LLFGS+oAgkQobdbCMbfZGMoZLyPWyVw=;
 b=Ly0rvWD96oOWIESi0erPMBekgS5OOdcEJzLnUvEZZxVXdBo70FH1GDsP/hzfOsXYKzbhFKc2Pk88N9ewN9umdXy0SNd5+APM1I9R1hluPvO+JFbSxQNpLMGxUunQtl/azt8PwFlTDa677Ym554VExbIQuEns2rUjaqp5bCPtK0qBCSshRTaUAq/WCCDIiZVU3qAjpW3SYALC4qA0zuT4o+29HzpWw9FvFR0idJG/P95k1eLeVAafgOe8jC1TkcRaKdFtg7/fJKrwy4HxDvlmJx3EwW61Q2cwfyMdEtuF736RWj1Kt0g4qwCrtHH9jvmb0m9wHp9IdkbWyGABE0b00A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7006.namprd11.prod.outlook.com (2603:10b6:303:22f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 03:50:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 03:50:24 +0000
Date: Wed, 29 Apr 2026 20:50:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH V7 1/9] drm/xe: Link VRAM object with gpu buddy
Message-ID: <afLRfnHix3GiqD+Y@gsse-cloud1.jf.intel.com>
References: <20260413131623.2891528-11-tejas.upadhyay@intel.com>
 <20260413131623.2891528-12-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260413131623.2891528-12-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: 51705793-e788-4faf-87f7-08dea66b9c45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: i07/7nuQZVYHMHOXUEojvUgS54RkyWIyQLgW7VwFidxLfNCkhRWLnRbnKYtFxylS0nPVqX0bVjFBjh2tCkL0y0qkdY8j+iOQinN+YGb9xOBGCzupF5fMKijBRypuns8HOvZezpupzGl1CXd+bpPfN9mbHJcuU24vlBDUuy67Tm6FlbaAnByIK3cXztvvuyKBgS7nJD6pibZWeY74Kffe/czf3wYh6N/DICML7/66FPmsjxoHjItuWyjU5ubBekKBes/W3WORUCetbYjxRJXE4aiQvLfdsz4PXuIW+q6mXy+yvUIebHlMjIkhVljoCFns24f2IxaWywXLNvrIIciwKpM6w+w6xxORCEz+L226LYWjlkwavYMTfARwkhYNfeI6ShlDSLzsIRJMxLbxJf2DBgAPCNMHtCp9lvIrYlEragyhMBOCeXWv8BH0bMOQsuWauMbD0JPGrKfB+ktby5jmwpu2ZdZZIrnAt/8LEgwLK+4VhWXngVaImC+BzZRQcfn8GFN/J8ndEr9gIglqToT4x9ak4G2Rba9z+epT//xaJ4U030Dm0J4EqAfHFLKq0Li6ZmANcbjy3BH2Ry4XX1V3U7QiAf0mbU+I3wwUkgFvL3vJHdqWd785teIaYePRI2zZvRXsu7rFu0GHcCYlwJ3VYPD0Zu5myySBCutMNzt7Tt9EMOL6XXJQ27cP78tg2mp1RuNAht4b4VD0j+Ncgb+KnNoj29PLKBXeLHnbpFRXKpc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cjLVvcuq7KI92i3QQIuvlKQsYbIZzWpV2G2mM04dpFg29A7/A5s+ifUlJ2sd?=
 =?us-ascii?Q?mxj13ffuC01thYtJgy/w17MnsXvCeenawzugX4FvAkNELS5W705HfTFpUVCX?=
 =?us-ascii?Q?52JDsq/d/NVBWVWFH/eh2LSE75LYG44lt2hG2xjcN3jHsFx9A3KuprL7ME9z?=
 =?us-ascii?Q?9iQRjzKUGHBD8Q2QIPSlTv0I/anoBjd9AI7YnBESJQvvG0mPqR1fZXFM92c/?=
 =?us-ascii?Q?scrSIFXMynJkaW2RTqjDWoSTB74u3i6lwwaPRZAd5MWZ7ipAwsSOh8/3hUli?=
 =?us-ascii?Q?AHBSuw88X9OmEY8YXLd0J9OqOhvo0wm0BdytVtVBeqfwPqZYlQ1YhABQ1LF/?=
 =?us-ascii?Q?Tm1c1RJzhZRjAVPk9vdd3U2LMUWfg8McGxq0oBDlmBeJYv2zc9cG0UarRkaN?=
 =?us-ascii?Q?HF+1q8IuY3riQIiyUCQ65ibWjhyT/S037OuhDk9T11BrM+LsCEHDX42NcfNn?=
 =?us-ascii?Q?x6gdxeZsOdZbjK/0Or7cG1q3ZEsMJhMcYUCL4Xixq6hGIK21Z8uBqmK4OApQ?=
 =?us-ascii?Q?LvbOXAJc4v4vMEV7iDNli5JEm/WHz5EPlWU24AdUIY3XqjyKfcMQyp+GlGzs?=
 =?us-ascii?Q?dt4sO0kNYD2fYeHVHwkNRM4soawMw3ajvnX9DoUU1GuhfLh/rzJ87coLm2/y?=
 =?us-ascii?Q?3PeuWKCKOAacc+mqLyggL+qvcaVlJH3JrKBB/azQreCzNNV5ez74vodd5tln?=
 =?us-ascii?Q?okpzSRN3iQ4pL02GEQPOtWdhB3tvh+Ke3/8l2C9+x/v48dFNwPmJjNPevjkj?=
 =?us-ascii?Q?+J79n9ZPff1nWxyVer68DjjJB/SpH4mlPEp5tRweMk4yuCa7qzterH/f/khU?=
 =?us-ascii?Q?CuflfFHvQlSXbG6hVTaVdScWfdmn3b9vK2RFCVa3uAIjEbo/vkyZlbitikcV?=
 =?us-ascii?Q?6EJPDda2M5o4V+pJgVK7+CgsmyShV1hwdhh0S1auU/JDfpQCJpX3Kt4cRRtu?=
 =?us-ascii?Q?Xjxgmej++SL4/cRbBJfKV9J/1MDyOgMZKGjeIHx1rgIm71yBWA7MDc49j3VJ?=
 =?us-ascii?Q?tIvDH96IcRUTlKkpyyF16szq9iI0g6bp7c7oLOgETASHRzSvuOrjXkv90S2n?=
 =?us-ascii?Q?d0i3fs+lXTXTq/8o01l2Q+RHDYerFt/jmvD2z+JHX8is8I2hb2vAcoVUKm5F?=
 =?us-ascii?Q?czrBuMdVmMGak6TgnK4y9sN7mIKjz/7I6H32qO5jHXdRzgJyi6Nh6jJqWXxm?=
 =?us-ascii?Q?0pjMtAmVhB5IW9SdZs5zEtxc5lCsz+cyQ9sNHMKE+Cecqw4J8WlR86MMw8GI?=
 =?us-ascii?Q?s1hr3Bws/lzOa3Z4aBWQ0DF5ZPn2BiYxIAXEASI+zV5Qu2g/2VqWAZmYX92P?=
 =?us-ascii?Q?zMkmRwLkcBDFYGH2Y5xX8lq34jjLW49JZillvMfm9HYKhZP4H9gQv8RY/kzi?=
 =?us-ascii?Q?vnKdHmg93eiKr7QCrNUKqV+qxd0P6lBhn0UpDAZke1kZV9xKIJx68J7IDJ1g?=
 =?us-ascii?Q?paP/DQYG7G7N+wX943DaFM+KPsq+h97ARKLyymJoXCMRKANpmpUHdZdYLRRz?=
 =?us-ascii?Q?R1LiGag+sanvwcS4dhXKsAmzxrCNZzVIYgM2AolRROkQ0o674MqZiJHXTfd1?=
 =?us-ascii?Q?ODWVrgk9ra4BXV18MF5YJ+KWFBajNCAyZGt221GLHc1LXFRRMI5kCk0j3QzO?=
 =?us-ascii?Q?Xl8Of3UUOFyW7heDGmr5Yl/MU1Bi4trFqP4gYMOijGxXdOapJ7vggXv69I/1?=
 =?us-ascii?Q?FWPHmIhttfnCqhprShOSwQQFY6njq5LJyZc6rbsZfEArPm77s6Ip7ARKS/dR?=
 =?us-ascii?Q?okx0PMptQkYm5CAbboKFXp4h5QNlXjY=3D?=
X-Exchange-RoutingPolicyChecked: tEumT2SqgMBxqSXoUFUrldULyAEPizbJpVCCwMDib5Q88+GKJK34MN+BA1T1Bq3+Aahr36hjJhcBslRuSdGBOZf2aL/bQXeXXHMaFyy7swfv7ap+rI9Hj+bUPwMEnVbXeW2gNZm+b0PUCx3XxQ0LjNTPoYLAa78VGdWyci8rDIMecAY9Rml/JYzAM08NhVvAT4VuBmBduUFdxrAqOddGukmP08j3Q0w5/vFFOJ7kSzSiBjqZBgLyOh8h4G2TkNlCnebLOYw7XmI6cBzJuKVRDeh4u0bPWvAwEow1KoNdAIsF4o6Io5jHl8VnLiWU+IpEfAZYxqqls+er7Hps/fV54w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 51705793-e788-4faf-87f7-08dea66b9c45
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 03:50:24.8413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1DQUH3M9WO7D/ARG+Or4dK5BOiu3yS8zZT4iWPNUJdWaQsmFglWd+gwQ4vjRnhZgb99TywQjyNZ8DshzBTptA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7006
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

On Mon, Apr 13, 2026 at 06:46:22PM +0530, Tejas Upadhyay wrote:
> Setup to link TTM buffer object inside gpu buddy. This functionality
> is critical for supporting the memory page offline feature on CRI,
> where identified faulty pages must be traced back to their
> originating buffer for safe removal.
> 
> V2(MattB): Clear block->private in xe_ttm_vram_mgr_del as well
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 5fd0d5506a7e..01a9b92772f8 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -54,6 +54,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>  	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
>  	struct xe_ttm_vram_mgr_resource *vres;
>  	struct gpu_buddy *mm = &mgr->mm;
> +	struct gpu_buddy_block *block;
>  	u64 size, min_page_size;
>  	unsigned long lpfn;
>  	int err;
> @@ -138,6 +139,8 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>  	}
>  
>  	mgr->visible_avail -= vres->used_visible_size;
> +	list_for_each_entry(block, &vres->blocks, link)
> +		block->private = tbo;
>  	mutex_unlock(&mgr->lock);
>  
>  	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
> @@ -176,8 +179,11 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
>  		to_xe_ttm_vram_mgr_resource(res);
>  	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
>  	struct gpu_buddy *mm = &mgr->mm;
> +	struct gpu_buddy_block *block;
>  
>  	mutex_lock(&mgr->lock);
> +	list_for_each_entry(block, &vres->blocks, link)
> +		block->private = NULL;
>  	gpu_buddy_free_list(mm, &vres->blocks, 0);
>  	mgr->visible_avail += vres->used_visible_size;
>  	mutex_unlock(&mgr->lock);
> -- 
> 2.52.0
> 
