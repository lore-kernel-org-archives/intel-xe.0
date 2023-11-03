Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A95C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 23:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E29B10E0A4;
	Fri,  3 Nov 2023 23:35:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7250110E0A4
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 23:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699054544; x=1730590544;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CmXlG5WoPmIyI1N2oKzwGTNGFAj3igyOjCKNezCDhCI=;
 b=ZR/Dyw+2fG/I/RBJ7cKAB9aUHfFXJpNYcK8ebvtPOibPAaZFyG1LfDrQ
 BVAgYkh9Aiu6rhRFHlL5aUtI8RvaBU9VLu06RPlypNzVJyT8MZUeV4jRA
 mwVwG2lyk5WNlIiM9uGLqABLvyq/+d2TVjWJd4qL052lSG43vx5UE3/yQ
 fuqUW78RxEyB3Ep+/TGbaTqo3XaS2oGKuF3zDCKXfkZJjOABDl/pqlCPt
 eIejLOvTEvFfedvxvVEfHUiu9OJ5KSec7hATvn0wjsspdPgJhmt+oqBRS
 Wtq263i6Kq+O0bfZSbjjR2ls+5RT3V6L1oQM5Eg4/v+9Ksy0Ic8zZ6O/W g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="420156556"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="420156556"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 16:35:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="3067329"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2023 16:35:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 16:35:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 3 Nov 2023 16:35:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 3 Nov 2023 16:35:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0Z826BqilMU5B0rQu2/YyPFdkEhpDrLQA6WBIDzOVL0LU0Pojucq7y/3g2bQqz/MTU8PXvAmnjb3yAR3O0itU4UEU9Q6Fxrb0s7YiknBMyqD9v506XwW+Z5sXscKJg5utvcSJQ0/LQjdLBs+GUgaamy2R0AVr2J5CMrIVPGsmCu8rgFcWhMcYFUfNAlUflzlv8GfJUc+vTbFP/ZZxRJTXjbNk0vEccZ30qkFwgkxWNkVJ27UtGklxCRtSTNqphEzZq6LjOBAoAK/czMAXAYzmgCiqfdOkekRIINMj58ZTyxWn8pVDHHU89K7YFKqVQG1CmHYSFpWTP84K4R7xTiag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8MH75NgM5L4h3fykme7hKssuTv9O4gc5b7K1EZWd88=;
 b=X1QkEhZQewHhh37zF/HzAZBxQ0A3DCmZV6jrgDdDlm3AJt9P2ngx4Gxo1QHN+uyG8HTR2+WC/5vhSmFBQmbBc0OIopUxdS68AsQajdGimvcxZSXUZYZtA70LSdFI1vy/iowwzuxn1TWmNdbaVJDv7tUgIJYr29psQIzm0f6fKEfxeZKdTc3I5h06EIraPbKSU5ub0fA4ioAeECpAVqhhSgimtyJ6ufL5ldCmkItCRgLSIVAnnh6sfPbboh66l7H1Saf9zjmmLAUnrPZgvdmRO7Qj7o51/xFlapde6cwhZBrNOgMIzRfarrNl1Re9yWCVi5CqjcDv7Z5dNW15+0fZ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MN2PR11MB4679.namprd11.prod.outlook.com (2603:10b6:208:26b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 23:35:35 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62%4]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 23:35:35 +0000
Date: Fri, 3 Nov 2023 16:35:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <20231103233532.GR1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
 <20231103143456.7-14-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231103143456.7-14-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:a03:338::21) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MN2PR11MB4679:EE_
X-MS-Office365-Filtering-Correlation-Id: 891c7c0b-c8dc-49ec-5322-08dbdcc59377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RhdxIUHnkNM8JrDm165rp5e74BG9MunyfmIaMUgO3Cbg3aVrVBeACp9Vak9bx386Fl3LW1LKpAmhNbWFmwHPU1c12937G9K4nW62YEFfn1aJGzjyEQZsaxxUUuuZzgbLqYExNTV4gtt3/sXiP6xugkCF9iDycCdFlkFl9tjVbGq0d0icHeK6LJQGR0Z3rZspGriyl639c1DjoYn1bzr6U4uow1YuIGVL2mu+o+EOJiYdQhadC4dI+xTN3Lt/XZqjozP9lwYTzp0IlT8rSaRt4WzAGz8vxG0rHHhjNMOrzXys2rjqTsbtzhJ5IpdZv9hpX6y3hZ56Ah4lzZbBghTj2obH5HMaTweTKwVF+sKiyS5AJIqTyG0djYABQdD2ZUKE8o3DRgHM6quLX9+ZBG00MmqKviGzcbCKtv2BRkcDsRtsHpC9paSkoydLcp903sw+aHV+pzYlCtGWi+pjzRJwzAI8fWLWUcDpMiugIwBnNzc/pD2AKFgjH5RFrO4XSnPmGllu2Yte5kybzYeBK3Cb7TmL1qBroyFjhS1cSc8pSEqbnXg+jgf6fOMd5KXoSY0d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(39860400002)(396003)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(5660300002)(33656002)(41300700001)(6862004)(4326008)(8936002)(8676002)(2906002)(86362001)(83380400001)(82960400001)(38100700002)(1076003)(26005)(107886003)(478600001)(66556008)(54906003)(66946007)(66476007)(6636002)(316002)(6512007)(6506007)(6666004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tlFctaV91SV3tRgAco4RrwHLgwH/lAqNJeqmsnFerB8Vwld6TqjeGAVKkW?=
 =?iso-8859-1?Q?ezppQ02LtQRWgMgpCkTf0al+tiYmqONnC6W5ivKOIiNNwT+XXp0R563JNu?=
 =?iso-8859-1?Q?lByqg1dvVuafP7bJLVas+t0A7cr0UpR4ECCqXqGvqyyEDEX+G2vhBsGIKU?=
 =?iso-8859-1?Q?li95Uh0jvrFU3i3off+jycJHhzEDVlt0Mr0OrL6qxq7Suf/j7JC3jX9Q5n?=
 =?iso-8859-1?Q?7sT+A7BcQmHm6voovdLL8G+jxWcUObtuNHnW2IZLAr2B99nDQF1hOsDGWU?=
 =?iso-8859-1?Q?tc4B92eUzKXBZkchBHBDF0GKij9Cu1GpnkO3v3iURRGsndMauW/zkZgFQx?=
 =?iso-8859-1?Q?6PBbSnDY2g8IxIS8U4YHhrpqo6qSCR6yg/6pLutbrfZT9mK09FdlB3G4YG?=
 =?iso-8859-1?Q?L/qCSgDVCmxrgZz3i0tmRh1To0TFkd4jtbQnx9XcnjHf6htYhwZI5JxXVj?=
 =?iso-8859-1?Q?db8LoYAuDcSQgtwoFHHTCUg40f8wi1bDvhPoJvmZe4VJEUo4qlxQRKjGoM?=
 =?iso-8859-1?Q?kYEzzYfU8QpOEb+zbFlMLjvOngQMtBd7XWWvasO5sP0uk+A5WKWLBwnKv6?=
 =?iso-8859-1?Q?0yDb27TTZj+ahTtwPbbtPAbvTR2p6Q1jO8173iuOev5JaZYw3U9cu6YX2M?=
 =?iso-8859-1?Q?RiDW3DmgtSquVapO75P+0zn9n7OimwsIh/jGODIct6XY8ufS536VFGg5me?=
 =?iso-8859-1?Q?IAKsQWRlVutp3xB1EX+SaTUlCXRrk6emeARBltrNum0PuxxWoTJ1hAml1B?=
 =?iso-8859-1?Q?nW5606qJtW/6vJIxIn+ZPxyKt22aksGobB8AFi6s7s6rP4pgx7U9gS0HyX?=
 =?iso-8859-1?Q?JAO9FEhE3GW4Kty/K+d//H3IHcT6TTKJvcLHybHHguRgrO6a9n7dipGYJU?=
 =?iso-8859-1?Q?IPRXLmZJP+XMEyLzDFqm7516UwkFBWXv8pq+NQ++1BlQe43pw/4MwpJ1nY?=
 =?iso-8859-1?Q?ArvuDXooWcWjSiCnNjAOyiqIjUtv8M0MZGnWh4r0PKAnTZKFNUq7L+SlZR?=
 =?iso-8859-1?Q?YgL7nMvlaLAsnhnpKtFi9kziEYtyv3y59Tc719jUgtW3Y/jFMmIMzYylUD?=
 =?iso-8859-1?Q?nvAKwpqhetrH002L8SrQ0C49l9XA6qcvkc3Uzz7g9nPO1ZLswt7yKtAies?=
 =?iso-8859-1?Q?xrSQSON4SVjuGngGv6xUueWlBrrkuzwDiYTJq8ZzUNVFklxKIUW2kkykcH?=
 =?iso-8859-1?Q?fmRVlqZGThFjtcPVXczlIwK1J2vh65QLR2nRnPY3bLnep4XiNz/GsJNBc0?=
 =?iso-8859-1?Q?nXBuPdRDw9FdG7I9bWObuqa+vZUuO95QVH0oSyjIOUBLb3ERQI0rke8tbX?=
 =?iso-8859-1?Q?5gQ5KVKeafJqTtwhGj3fqEQqvICn/78IIgdG7Oapwgvp0ajQbJPIjtL+33?=
 =?iso-8859-1?Q?Xt1YBJ2zL0HQQkXwoBFrf/L2/jBg7VPyAaeHrXdfnRhCJQoMeKbG0jIHSR?=
 =?iso-8859-1?Q?bKEaYpaToR9aQGVi3QddzQVFdBRkyJiEabYFaoFpe4YJ/iyF6Yt+lrykur?=
 =?iso-8859-1?Q?HZQji0sYR/xkHLhUWuYKcT90KeHnWdSBAnl3DqzKlJRfarNoVS/GTK9jJK?=
 =?iso-8859-1?Q?K6eOGD/KrT3/Ibmy8cSg75iUGmu57CU3eImzjWdffdSxGiQ/gJ4eKiScw9?=
 =?iso-8859-1?Q?zNvv2le9OFzoXQRitFQXzhYm7sxSnNm8hga2aq96lAuWGeGjoONxFtxg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 891c7c0b-c8dc-49ec-5322-08dbdcc59377
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 23:35:34.5115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qw3s5BwUaP1FrT0p3pLsjEWA0ot4aJwByZNFpOjK07UOkIBROxcWbKotZTGRlbc8WPDdXUHXyqqUZvBYvKbK95Np7pjmASJeK+KfvTFwzVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4679
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 13/50] drm/xe/uapi: Remove GT_TYPE_REMOTE
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
Cc: Carl Zhang <carl.zhang@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Nov 03, 2023 at 02:34:19PM +0000, Francois Dugast wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> With the split between tile and gt, this is currently unused.
> Also it is bringing confusion because main vs remote would be
> more a concept of the tile itself and not about GT.
> 
> So, the MAIN one is the traditional GT used for every operation
> in older platforms, and for render/graphics and compute on platforms
> that contains the stand-alone Media GT.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Carl Zhang <carl.zhang@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Assuming the UMDs are prepared for the change to MEDIA's value (2 -> 1),
looks good to me.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_query.c | 2 --
>  include/uapi/drm/xe_drm.h     | 5 ++---
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 3eef4160074e..34b4082edec5 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -375,8 +375,6 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
>  	for_each_gt(gt, xe, id) {
>  		if (xe_gt_is_media_type(gt))
>  			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MEDIA;
> -		else if (gt_to_tile(gt)->id > 0)
> -			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_REMOTE;
>  		else
>  			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MAIN;
>  		gt_list->gt_list[id].gt_id = gt->info.id;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 05714068c637..1473dd29aa3f 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -376,9 +376,8 @@ struct drm_xe_query_config {
>   */
>  struct drm_xe_query_gt {
>  #define DRM_XE_QUERY_GT_TYPE_MAIN		0
> -#define DRM_XE_QUERY_GT_TYPE_REMOTE		1
> -#define DRM_XE_QUERY_GT_TYPE_MEDIA		2
> -	/** @type: GT type: Main, Remote, or Media */
> +#define DRM_XE_QUERY_GT_TYPE_MEDIA		1
> +	/** @type: GT type: Main or Media */
>  	__u16 type;
>  	/** @gt_id: Unique ID of this GT within the PCI Device */
>  	__u16 gt_id;
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
