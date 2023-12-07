Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8D5C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 00:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63E710E147;
	Thu,  7 Dec 2023 00:18:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EE610E141
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 00:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701908280; x=1733444280;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ek+Suye1rHWPTJ02cIQNXxB3ydokyxFCJhYRgJB1Lyc=;
 b=mhL9PBXOdy2hbgL4r4dk4+kqvjodwRXOPm9pkm1Y+QvpN0qa/eJSU51+
 LD+zkR4txJrd/POkjiPZAo8Gquw8FkJZbG7T40vzqTAh5KWktNOGAro8A
 1tNeP9QkDBB639LClSgtF7RpqYT7WIr8F7Ec8TKSxAL9XGJ2smk2DzuHn
 8Opip3MUgZNo64bCDl8ITDzuzvPJM0K1C9TaKp4sxu0FWTY6Jrj1fQyNE
 66bW9CVO+0Yz/kjIb1cW05fDBG4n9LUrZUsbLTHoIt5nhnVv+PDWhvR6Z
 aX18iOj9Ubfn9EQq36qHypXkITkxXSZRCBKDAsAbfRFqZGcPN9jMbg0SS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1020686"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1020686"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 16:18:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="862280911"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="862280911"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 16:17:59 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 16:17:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 16:17:58 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 16:17:58 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 16:17:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKRrHtyhqGUQkThWOy609KWSK6JObZnTG6271znGh7cX4RKl6Z8FJwVcrz29LRZhu0N9mpo2cCg+WGSM7947zxTJzejyTA7ENdJ1ZMpLCi9H8DTNluNNz4UGq/jKOv5pwaqpDDhNtbeE29ZKlvAGjt2gPRqsQJ6jWR/cSMt954LysCld8PJ5e4GkrdE1zykzSVcCGhht0kRcmAe6rnyw5zFivwWNi1pLRlNSdm1Ls9rxzRw2th9O0NEjrxycrO/movWxwMBChwi3mRvJbqqESZ3YuXyLIxhHcwu0p+k8x5p/wGz3Uv2oZL+mTbQqZSHxE+8j53j4xFeg3Bkgnj6GEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BH3KlbKn/BerbYD4toqcIipopmh6UnTA2NAmym2SiwI=;
 b=L8K7qmkHwW2oPYzDL4veD9XeclfoD37y5b6pcf1q0D8naK8t9qkQiX7QfRYu7Er3VaKCzeTNdhOEjnK/ZWJhgNZCNiouS0tiOo9jK0ESI+Cfq3WdFKLbv+c8fFB2fM4FCbS2beZCIY7Gox0d5VCiuQXpXmZaSPfOrfYgbKP3qheoLJYqe6xp+81bvKWnpVGHEW+HQkVtE6htQ0ISoNso72F7GXBxn6SMNUOaGLqBmmpzqEhk09LVTw5yl4ESqPhZEx8CnC6ZOlV0awhDsKF43MaYoUBUgmAr4iOeRtXMW0YnQAAJ+GhPwxK/4WkCDBISzCt/zI/vQnYY5DWhVB3Euw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL1PR11MB5954.namprd11.prod.outlook.com (2603:10b6:208:385::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 00:17:55 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 00:17:55 +0000
Date: Wed, 6 Dec 2023 16:17:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <20231207001753.GV1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
 <20231206043126.984049-8-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231206043126.984049-8-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY3PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:217::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL1PR11MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: e671fb00-e724-44eb-543f-08dbf6b9f5bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bnie0VcjApncjhu1Vo2a+FkJAckSWGoF9wM3DSigttaOYpL6LfOasB1Tx3APsJWL5rjzBsRIG4MbEobWx3ZUiQIkpfOsWCe4Bsk1hkE9POWwl1IFWR+MOTOETiq3KxyfIlNe0aK63vvlRMV8Xcmrduo+fiWx77Cfm0g1mh5xRa1BnuYabyvk097JtY6KzEYTClYBd2dSW9xuRkK1cp5jaIWzt/RVNbzXfc+FaN1yD7gfXP9sNisdbEPNFeAX+hFERn/nhoMFSTFOW0VLXxSQcIhnLdVY2fQqDhZojBHLxOmdIDmETvqGnI+8NrimL4S9M5BMBctm7oo2Sua9FpL0ZfNNHJmI7nK5+Ld8o0o3TnJn5byqlCehXQp6/4Fgcmkjts1oS4zDMrLMDM7W9zFhwx9JfvDhzcRb2ymL49DYEwlkC7Dp8CFbdrLz5Wr7pLzpnFJQW/OgVcpK9QRYUyWGjl2uvgXMVV2RRUrmD9PdIPEGu2IJyzaeDQBNm3J5bmlDKKjE8SGUiiRxan255dzBM2Unm7mPaxvXZV2l51gPimdoh3kEm2XwE9UI8ePtpFDu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(346002)(39860400002)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(6862004)(8936002)(38100700002)(5660300002)(86362001)(2906002)(316002)(41300700001)(4326008)(8676002)(478600001)(6486002)(26005)(1076003)(6512007)(33656002)(6506007)(66574015)(66476007)(66946007)(66556008)(6636002)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FVVrPYACZ1pP8m6P/A3V7goMJN63KDZrcA4LMj3JNJrI/zeO91hMUGUXeb?=
 =?iso-8859-1?Q?d2LkVlO6zBqtdk0PeBQvXp+YS70GPI4+tKYNgvKPf69EWWBfPg7w6uvdFW?=
 =?iso-8859-1?Q?nIIYM1Q69v4h+1lcxHrSN21yQ3ZbIdydyrs7tXzzz6TyE+w0x9d6iAD4SW?=
 =?iso-8859-1?Q?dnSx1K1atwvPCI9WB+k209v/GTHjUV1A9MGrEuexWHpiALZYROOGoInr24?=
 =?iso-8859-1?Q?l+IHvS1Nq3r0hvzb5n/l3ejyQPuPnuRzDlgIQfu793kE82XjvR+gZpzD3r?=
 =?iso-8859-1?Q?YKIyL3zSIL1ivW6rFAAya0ssB13lG86O92U3O+cglauAHz5foLE7LO2zgN?=
 =?iso-8859-1?Q?ZqCdDtJq9IhzHEKXtXvQbgUreUsRIqY/lUPtoTp7V5bH+xKmGqLDG1sCJH?=
 =?iso-8859-1?Q?PdQ6O+bBboSiTCuOUuBxACfAYYL0z6ULwGK6jgtYJqUDG7DOfrHw8hnUCu?=
 =?iso-8859-1?Q?xx+vo5m1BYz2ghwBWBdpIK250Za5twSnvlfVr7P+pA4ec4GIpCGPfqX40x?=
 =?iso-8859-1?Q?yxyPV5c9CunchgEZOC7uvJ5cj4DWkub30z7AoNddB1AQgG1mqe8ulK3AY4?=
 =?iso-8859-1?Q?RnYx0cRv5evcl8E/tEile1F7qg+FVXjw7+aadxqU+SyYNQtUcu3QcR23bE?=
 =?iso-8859-1?Q?g153OdnQckTa90Ytwq93CvJwlumomTCtLHEhvAFMTybWrwhPbeG67VhgmP?=
 =?iso-8859-1?Q?1JNCkcPGfGxs2h/fdv5zp6Rw+wSea0D+pOJNS1rtjYxz6gHlOLNPWk8qYb?=
 =?iso-8859-1?Q?TaPfb5KctKozlGcUh15LKdiiWBxQ43LTikIM4uYrc8ZCfTh09sMkreKmGc?=
 =?iso-8859-1?Q?9bHkZt6eQwMDpveZtQx7vqa2segXS1uZq8IIOTBpGDLme9kNQNWhB1/Vl9?=
 =?iso-8859-1?Q?Pmr7UA6ysjsLCWBdYb9ubzOWOkLvGFHUY49q6Geam38bV9698eLoXvCLa9?=
 =?iso-8859-1?Q?mdK3lFXYEN/fu9Lb555zWJgPahIlF2BeAgjvWq3XCITSPnbg4+Qmsn4seg?=
 =?iso-8859-1?Q?RvZXL5SLa3KKbhoFWIjsrqO3R+DfeVdMSQq/6sWsSu2leec5+Tm6OK12Dz?=
 =?iso-8859-1?Q?uzQq1zGrUq247nXqr0pzNMSRTf8KUHte84mk/AjjN2cfBm/UUvbB0RubXw?=
 =?iso-8859-1?Q?OOqT3G8Nh4oxPjgtaoekIzWuCx4BswlgOvjX10Sfmp1whVOYx3mHlHWWre?=
 =?iso-8859-1?Q?a3mc0BeLpxmaMVevQKr/B8ezeVV5zbLgNRHu0mYB/drkU7+zPOLpJCKt1e?=
 =?iso-8859-1?Q?4dO+whPF5hMbvBdDebkynSjuhQQmhU9sYEETolJykEVA+WLGux5NGkCNAp?=
 =?iso-8859-1?Q?YZel2kTCmu8XFn/R1ZFapQlsPq/Y/fGj6lSGHfyhM3Wf4pO2rxVGN/djoq?=
 =?iso-8859-1?Q?KBt6smKOSIM4V1Q4NdmxOgm0W8odMWKQaLB2/H79bTkJ2HrLt13Hg7pY8n?=
 =?iso-8859-1?Q?qS1U0eY0d8xbgouZp420sL3JJifO80/Knz8VjzUABcJiNDFE5SiOE6W6R1?=
 =?iso-8859-1?Q?UR1lN84XZdiksHMFua2Wmy+zg8+6upakaSVpFqCZtMS+JrOIHHVTdQAM9s?=
 =?iso-8859-1?Q?KVDW5+1lTJBrssid8GzArEOMtzDbNDwzZKwv4qEmIE9wRAetFTfDhNnsYN?=
 =?iso-8859-1?Q?/jyUUmG1mpq1zuSSb+5VhCyLEPCF9/zysZv7N6Rp3qQ6v/PgC9uYlYOw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e671fb00-e724-44eb-543f-08dbf6b9f5bb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 00:17:55.7161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SIFipOZ4wc2oBhkcYO2TyJvr8ophKhtpxap6O12PUnMBxpmFaaqZXGR0A4qMJwcceilYkYQ3LHMF3feIbByee2L/9mmYq+me+8e2dH4gEg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5954
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 7/9] drm/xe/xe2: Handle flat ccs move for
 igfx.
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

On Wed, Dec 06, 2023 at 10:01:24AM +0530, Himal Prasad Ghimiray wrote:
> - Clear flat ccs during user bo creation.
> - copy ccs meta data between flat ccs and bo during eviction and
> restore.
> - Add a bool field ccs_cleared in bo, true means ccs region of bo is
> already cleared.

What does a "ccs move" refer to in the context of an igpu that doesn't
have vram?


Matt

> 
> v2:
>  - Rebase.
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 25 ++++++++-----
>  drivers/gpu/drm/xe/xe_bo_types.h |  4 +++
>  drivers/gpu/drm/xe/xe_migrate.c  | 60 ++++++++++++++++++--------------
>  3 files changed, 53 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 81630838d769..e9b6c67b2523 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -647,10 +647,12 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	bool move_lacks_source;
>  	bool tt_has_data;
>  	bool needs_clear;
> +	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
> +				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
>  	int ret = 0;
> -
> -	/* Bo creation path, moving to system or TT. No clearing required. */
> -	if (!old_mem && ttm) {
> +	/* Bo creation path, moving to system or TT. */
> +	if (((old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT) ||
> +	     (!old_mem && ttm)) && !handle_system_ccs) {
>  		ttm_bo_move_null(ttm_bo, new_mem);
>  		return 0;
>  	}
> @@ -665,14 +667,13 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
>  			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
>  
> -	move_lacks_source = !mem_type_is_vram(old_mem_type) && !tt_has_data;
> +	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
> +						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
>  
>  	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
>  		(!ttm && ttm_bo->type == ttm_bo_type_device);
>  
> -	if ((move_lacks_source && !needs_clear) ||
> -	    (old_mem_type == XE_PL_SYSTEM &&
> -	     new_mem->mem_type == XE_PL_TT)) {
> +	if ((move_lacks_source && !needs_clear)) {
>  		ttm_bo_move_null(ttm_bo, new_mem);
>  		goto out;
>  	}
> @@ -703,8 +704,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  			ret = timeout;
>  			goto out;
>  		}
> -		ttm_bo_move_null(ttm_bo, new_mem);
> -		goto out;
> +
> +		if (!handle_system_ccs) {
> +			ttm_bo_move_null(ttm_bo, new_mem);
> +			goto out;
> +		}
>  	}
>  
>  	if (!move_lacks_source &&
> @@ -725,6 +729,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		migrate = mem_type_to_migrate(xe, new_mem->mem_type);
>  	else if (mem_type_is_vram(old_mem_type))
>  		migrate = mem_type_to_migrate(xe, old_mem_type);
> +	else
> +		migrate = xe->tiles[0].migrate;
>  
>  	xe_assert(xe, migrate);
>  
> @@ -1254,6 +1260,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  			return bo;
>  	}
>  
> +	bo->ccs_cleared = false;
>  	bo->tile = tile;
>  	bo->size = size;
>  	bo->flags = flags;
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index f71dbc518958..64c2249a4e40 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -79,6 +79,10 @@ struct xe_bo {
>  	struct llist_node freed;
>  	/** @created: Whether the bo has passed initial creation */
>  	bool created;
> +
> +	/** @ccs_cleared */
> +	bool ccs_cleared;
> +
>  	/**
>  	 * @cpu_caching: CPU caching mode. Currently only used for userspace
>  	 * objects.
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 1bfb249680f4..ae11701408a9 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -567,14 +567,14 @@ static u64 xe_migrate_batch_base(struct xe_migrate *m, bool usm)
>  
>  static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>  			       struct xe_bb *bb,
> -			       u64 src_ofs, bool src_is_vram,
> -			       u64 dst_ofs, bool dst_is_vram, u32 dst_size,
> +			       u64 src_ofs, bool src_is_indirect,
> +			       u64 dst_ofs, bool dst_is_indirect, u32 dst_size,
>  			       u64 ccs_ofs, bool copy_ccs)
>  {
>  	struct xe_gt *gt = m->tile->primary_gt;
>  	u32 flush_flags = 0;
>  
> -	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_vram) {
> +	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_indirect) {
>  		/*
>  		 * If the src is already in vram, then it should already
>  		 * have been cleared by us, or has been populated by the
> @@ -583,28 +583,24 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>  		 * Otherwise if the bo doesn't have any CCS metadata attached,
>  		 * we still need to clear it for security reasons.
>  		 */
> -		u64 ccs_src_ofs =  src_is_vram ? src_ofs : m->cleared_mem_ofs;
> +		u64 ccs_src_ofs =  src_is_indirect ? src_ofs : m->cleared_mem_ofs;
>  
>  		emit_copy_ccs(gt, bb,
>  			      dst_ofs, true,
> -			      ccs_src_ofs, src_is_vram, dst_size);
> +			      ccs_src_ofs, src_is_indirect, dst_size);
>  
>  		flush_flags = MI_FLUSH_DW_CCS;
>  	} else if (copy_ccs) {
> -		if (!src_is_vram)
> +		if (!src_is_indirect)
>  			src_ofs = ccs_ofs;
> -		else if (!dst_is_vram)
> +		else if (!dst_is_indirect)
>  			dst_ofs = ccs_ofs;
>  
> -		/*
> -		 * At the moment, we don't support copying CCS metadata from
> -		 * system to system.
> -		 */
> -		xe_gt_assert(gt, src_is_vram || dst_is_vram);
> +		xe_gt_assert(gt, src_is_indirect || dst_is_indirect);
>  
> -		emit_copy_ccs(gt, bb, dst_ofs, dst_is_vram, src_ofs,
> -			      src_is_vram, dst_size);
> -		if (dst_is_vram)
> +		emit_copy_ccs(gt, bb, dst_ofs, dst_is_indirect, src_ofs,
> +			      src_is_indirect, dst_size);
> +		if (dst_is_indirect)
>  			flush_flags = MI_FLUSH_DW_CCS;
>  	}
>  
> @@ -645,6 +641,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  	u64 src_L0, dst_L0;
>  	int pass = 0;
>  	int err;
> +	bool src_is_pltt = src->mem_type == XE_PL_TT;
> +	bool dst_is_pltt = dst->mem_type == XE_PL_TT;
>  	bool src_is_vram = mem_type_is_vram(src->mem_type);
>  	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
>  	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
> @@ -720,8 +718,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  		}
>  
>  		/* Add copy commands size here */
> -		batch_size += EMIT_COPY_DW +
> -			(xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0);
> +		batch_size += ((!src_is_vram && !dst_is_vram) ? 0 : EMIT_COPY_DW) +
> +			((xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0));
>  
>  		bb = xe_bb_new(gt, batch_size, usm);
>  		if (IS_ERR(bb)) {
> @@ -747,10 +745,13 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>  		update_idx = bb->len;
>  
> -		emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0,
> -			  XE_PAGE_SIZE);
> -		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_vram,
> -						  dst_L0_ofs, dst_is_vram,
> +		if (src_is_vram || dst_is_vram)
> +			emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0, XE_PAGE_SIZE);
> +
> +		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
> +						  IS_DGFX(xe) ? src_is_vram : src_is_pltt,
> +						  dst_L0_ofs,
> +						  IS_DGFX(xe) ? dst_is_vram : dst_is_pltt,
>  						  src_L0, ccs_ofs, copy_ccs);
>  
>  		mutex_lock(&m->job_mutex);
> @@ -923,6 +924,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  	bool clear_vram = mem_type_is_vram(dst->mem_type);
>  	struct xe_gt *gt = m->tile->primary_gt;
>  	struct xe_device *xe = gt_to_xe(gt);
> +	bool clear_system_ccs = (xe_bo_needs_ccs_pages(bo) && !IS_DGFX(xe)) ? true : false;
>  	struct dma_fence *fence = NULL;
>  	u64 size = bo->size;
>  	struct xe_res_cursor src_it;
> @@ -963,9 +965,10 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		batch_size = 2 +
>  			pte_update_size(m, clear_vram, src, &src_it,
>  					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
> -					emit_clear_cmd_len(gt), 0,
> +					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
>  					avail_pts);
> -		if (xe_device_has_flat_ccs(xe) && clear_vram)
> +
> +		if (xe_bo_needs_ccs_pages(bo))
>  			batch_size += EMIT_COPY_CCS_DW;
>  
>  		/* Clear commands */
> @@ -980,7 +983,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		}
>  
>  		size -= clear_L0;
> -
>  		/* Preemption is enabled again by the ring ops. */
>  		if (!clear_vram) {
>  			emit_pte(m, bb, clear_L0_pt, clear_vram, true, &src_it, clear_L0,
> @@ -991,9 +993,10 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>  		update_idx = bb->len;
>  
> -		emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE,
> -			   clear_vram);
> -		if (xe_device_has_flat_ccs(xe) && clear_vram) {
> +		if (!clear_system_ccs)
> +			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
> +
> +		if (xe_bo_needs_ccs_pages(bo)) {
>  			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
>  				      m->cleared_mem_ofs, false, clear_L0);
>  			flush_flags = MI_FLUSH_DW_CCS;
> @@ -1050,6 +1053,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		return ERR_PTR(err);
>  	}
>  
> +	if (clear_system_ccs)
> +		bo->ccs_cleared = true;
> +
>  	return fence;
>  }
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
