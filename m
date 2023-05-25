Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DDCC7EE2D
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 23:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA4910E788;
	Thu, 25 May 2023 23:34:29 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEA210E788
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 23:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685057667; x=1716593667;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZdymFUcN2GXAfoYcVA8QRfhr0KXsC5C+lyidsLFaqyk=;
 b=BjMNuGuUE+ziPtPt02jk0dDZH5Kwswg3+CeKsseMVT/HDwMNG+ZyLU2D
 hfsIlgS5KIF27JZCu0Uvmxbt1/vVEJxQyWYU6b9usE+53JkDWUlcOLny2
 AE2yOWSVKNvVQH72KriVHPBmRz8aJed/tRXCGXldWSRkxALdAmPu5bLA9
 I5K32oQz+4JubsWH7LvPMUvfj2sofs2Uc8uLbpinmqsjzQPlcOOGdXe2P
 7IZBVVMqeheeCSf5jr9N08sRdpcRlJQLX2eCLERAuVnG/mD2iAGGV1SQj
 OcNYZ/ub97/kKi0hBrBlkfIi7G25oiKsov1bSUkSe92n1qvCNayBonN7h g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334405345"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="334405345"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 16:34:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="708187497"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="708187497"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 25 May 2023 16:34:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:34:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 16:34:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 16:34:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLK9JmxhYKPfEGs/Q30CfPkd4sfJBj1gSIuQOr8FIruJM6BiMUUBbvAQobgQVvhZtuBIISlKNeRkfzS3VjAgUVmt7tAEQpPeLXya4xl88KbxuGmmS7kgjY2yzemBuYnK42hWw4Xv93p0krcvNQ6xEJSyJV6B5sdIG+XMg+WNQkgGjjiloThw5eTp3gyAD7kmNrq/LlUa8iP3CMFywMgpBYJLbjxWjVlW3DMIMhnrZ0LtJab0Ny7aVoDxVd5rOnZt++6xhIyrYh0uF8g0ei+9zI0/qWlv49C8oZ2Cygnhx+E1yPsup849V61rFi0N14GME2TZehrtGLBc6BwHJuuHtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Bz8fv1tV/eAXJuqdHgH0cay34N95ffAVzGzW8bEvew=;
 b=aHH4i6Uo/o7Jl0gI8p6yw/HxnSIuI1dADl1w9pfmLBgHDYaupeS+XPzyhw9bNSz3MWEBYX/dJwt1pjy5v+sdMGf9BGa1zppwtyYUOB/0lEVmulJas895ykng5q9pf346owlovBZZYGAhtiP+iWS+XB2TKfudEcuewhhwy9Z/L0iYw++nKllWfAvDrEJetYL8g1kXYTJSh5yhdNTRIbbmUAXjGkihrQzi8gjJiUWs4KHlPtZzNXMvL23Tz5TP9az82qUl6qGBgQnMfs9Xz7iD9KBIz4lvRmri8q+Pi9US5U6TFOoYO/E8RihuGaZYyzie3zBCoT+JuaCyBCXdsYssPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Thu, 25 May
 2023 23:34:22 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 23:34:22 +0000
Date: Thu, 25 May 2023 16:34:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230525233419.GH10045@mdroper-desk1.amr.corp.intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
 <20230525213407.3907094-21-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230525213407.3907094-21-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a551f3-e56c-4468-f40e-08db5d789172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YbvbW543zKJj5HQkOi0nrSKSBTn8F47PlZbZnv5URR2vayFo1ZZLowr++dKhnEMXAJvUjGz2kdRmpJrZaCB7B1DY7GMN/I5DTkDgLIXCM/+yjDn34cvT3qEFb+YdbdltE///L8srSYNi22WwT52OtIsVapmLnSlri3gZiC5qThmoXQqBXhqcZyX2lUJ/9tasFCAYLmbI+pmgeVAYDstsfjNLSEWeaHOvHgit25aNE0R9MVZ7YjXkvqXoVUBLAedPUOXVqq9k/kgBWiYlU5MF8TO+dCaH6QufCLCr+OOzvr0HY0F6vfUaTSwUTqXoyK38jV9QbxdU4C9LueSr2IJeuA9AOhRAwjBHBoh9kYcun2RLblZE7T0H+xbni/KawaegVfr66d3AFM/ALvAMUEmAn9qAaAD+jbqlzSIK10PDVm/kjALAPxQBBpFGpigDOYjB8rgzwuzogtkMhBpZGDb1cpJ68NEm/E05LwkHArcfMB1tVzptDSgXy0TJvfPXXQMKHt1hosPmkGvSf/yfok8Axcq3Nr4abDJkN9dVL4nNrCdKyZKw6whk1zu+7OKPsbYP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199021)(41300700001)(316002)(26005)(1076003)(6506007)(6666004)(6512007)(6486002)(82960400001)(8676002)(6862004)(5660300002)(8936002)(38100700002)(86362001)(478600001)(83380400001)(2906002)(186003)(33656002)(66946007)(6636002)(4326008)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Pyp9vUo69wsB7lPlPFfgP/Ar+CmOSnDaP/gce8WPaxW9Z4pDV7PQOg87zFE?=
 =?us-ascii?Q?trUwB//lCJ4dw1q5ZJ12xPSJ1vEAplzh/jhB+hW8g3D6nhUuzPAjeoEl5ei5?=
 =?us-ascii?Q?qD565k6w9KnUKFJo6X1gZrY3lKMmiKjSaxjoHVVOjNNivp65j6OlJtGk3yQl?=
 =?us-ascii?Q?s26kCPmG2ausCPVJifplVUlhEtXbRCcEKTOI1LMvkvX04sEv3t57jo3uv4hy?=
 =?us-ascii?Q?CxXoyIFh7JIycD0FrZmbd+ToLHcfr5dm7BIq3WD2K7skQnTjqNnnyKAgLDcX?=
 =?us-ascii?Q?9FJFXMwpBZYOdHU6GuUQY5RXQubrsWxJ+jXEfve+SenK9dgtq6KHaU16GTvX?=
 =?us-ascii?Q?WXn4mpqhZ2YbZx6QTZqfp13R4eHlcO2F4EC7Z+ztxVqYB09lpJQXIfS35+mN?=
 =?us-ascii?Q?v8BfGvSsJSFV78dBX5jN41Ru2nQqHYuthugMhc2ouIlUTzIui6gYykhV11n/?=
 =?us-ascii?Q?YjfoRqHFmBkQcqFKdXeFMEpzZ9mX1QhjyRm9XXaxu4AlZozIM3XxSlXqzRHu?=
 =?us-ascii?Q?UP5ftvvVn78B48wJI+9Dq1Gi0wij5WbqFQ+afgb1xNAXOaw8E5KRFCLF2JLH?=
 =?us-ascii?Q?VUpp5BH7HCOO5uBnHKb/QulSHOXFLKu/hEX075QvRU6VR/smsopDuY/S/6fM?=
 =?us-ascii?Q?ehp2Pu+s+cbbhhiRJh1cpJI+mQYgQf+wXv/q2c3/ipy8btPR/2kx6CGJLuCS?=
 =?us-ascii?Q?3SNPB9q1vlQ4vOvqqtCmrJWwMzShFQAUFAfKMOBTZHp6IFGRKdVODrjk/EOl?=
 =?us-ascii?Q?yyK+S56lgrSpkCKOnljBtB95AjN097Zh1scEzIFzgX++geC9uKAA3fOlt3CP?=
 =?us-ascii?Q?B5sGEt18iVyb3tfxVjLASS0FAHuXBqwOQWDctZ+laA1t1kQJTZL1FmxyjTyE?=
 =?us-ascii?Q?M+1ZIAaiC0g16m2XYLUYcZzNpLwbXXrmu2HgKJ6g+mksdzdWq8ZYAAXonGLU?=
 =?us-ascii?Q?wE+2Q6h8fdHRfFo/uPtrypcby+iJe+C1138CjTqGnhUtfqvi6u4tTuOX1hE0?=
 =?us-ascii?Q?JEDV1e1HnFYQRzjl+yjU5JeKCk+lhs7neo9uOamCHf7aznQjKGp5rc7IfL80?=
 =?us-ascii?Q?RbqqR2GR3N7Dr7OGE8rUtFqvXMSx41QuPJ9vj3CT6g0OioERpNaFSB3HFqFK?=
 =?us-ascii?Q?WFDu8uyX9VtSALz9BeLasFcIbAF/+eRNx9e5DL1l/oSwrvTvIAmQeLD1tvHz?=
 =?us-ascii?Q?hdZTHN9tulVe/mDG5oZvTkN5AbCtDxA2gTKYd5aI+2+j4WEljfO6NFfhKSP5?=
 =?us-ascii?Q?JG/mCncuKez75PcV/vrSjo1Pa4P+q2uWEqFJmxj8LJlKTfCqKXszZmnt+bj2?=
 =?us-ascii?Q?c1OlwFkKZ5nRLn8VgTeagImGuYZ0KPyQIPNyyPDsNXC4yiUOO3tsxvZEHYS2?=
 =?us-ascii?Q?5sAWk7aMG3uw5KVh+pU8xHbgssbOsz7Risu1geh/BxCbevRxEiQLextdr7UU?=
 =?us-ascii?Q?5RPA+jPxXlBkibAJG4eGU6WVLchHwlrNXSMGZsP0Po5tAyhEs8PDrRIUu6+0?=
 =?us-ascii?Q?ta0lAIk2ZY1cxFbt8V2uzCmFjru64A7iwu7JcVA+yJMR/qidWiQYoBEQtkSc?=
 =?us-ascii?Q?tpANJGq8y4kCUOXjtfXEaqe9xCGBrcK1U+bN4DXkhWOZtDMWOV+aw7afVYPv?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a551f3-e56c-4468-f40e-08db5d789172
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 23:34:22.3468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94nWFpaeZmrlD94FuvK/7QUMGk1lZwNmBAhwTv9ZV62/nEtolqtk1GOz94n5UWaYXdf5pXFL56njzBBcMsDZhGg2nmE3FaCryuixln0LyrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 20/21] drm/xe/rtp: Also check gt type
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

On Thu, May 25, 2023 at 02:34:06PM -0700, Lucas De Marchi wrote:
> When running rules on MTL and beyond that have media as a standalone GT,
> the rule should only match if the gt passed as parameter match the
> version/range/stepping that the rule is checking. This allows
> workarounds affecting only the media GT to be applied only on that GT
> and vice-versa.
> 
> For platforms before MTL, the GT will not be of media type, even if it
> includes media engines. Make sure to cover that case by checking if the
> platforma has standalone media.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_rtp.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index ebcfb04c391a..43a86358efb6 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -23,6 +23,11 @@
>   * the values to the registers that have matching rules.
>   */
>  
> +static bool has_samedia(const struct xe_device *xe)
> +{
> +	return xe->info.media_verx100 >= 1300;

This could also be

        return MEDIA_VER(xe) > 13;

to reduce the number of places in the code that need to be changed if we
shuffle around the internal structures in the future.

Up to you whether you want to change it.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +}
> +
>  static bool rule_matches(const struct xe_device *xe,
>  			 struct xe_gt *gt,
>  			 struct xe_hw_engine *hwe,
> @@ -43,26 +48,32 @@ static bool rule_matches(const struct xe_device *xe,
>  				xe->info.subplatform == r->subplatform;
>  			break;
>  		case XE_RTP_MATCH_GRAPHICS_VERSION:
> -			match = xe->info.graphics_verx100 == r->ver_start;
> +			match = xe->info.graphics_verx100 == r->ver_start &&
> +				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
>  			break;
>  		case XE_RTP_MATCH_GRAPHICS_VERSION_RANGE:
>  			match = xe->info.graphics_verx100 >= r->ver_start &&
> -				xe->info.graphics_verx100 <= r->ver_end;
> +				xe->info.graphics_verx100 <= r->ver_end &&
> +				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
>  			break;
>  		case XE_RTP_MATCH_GRAPHICS_STEP:
>  			match = xe->info.step.graphics >= r->step_start &&
> -				xe->info.step.graphics < r->step_end;
> +				xe->info.step.graphics < r->step_end &&
> +				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
>  			break;
>  		case XE_RTP_MATCH_MEDIA_VERSION:
> -			match = xe->info.media_verx100 == r->ver_start;
> +			match = xe->info.media_verx100 == r->ver_start &&
> +				(!has_samedia(xe) || xe_gt_is_media_type(gt));
>  			break;
>  		case XE_RTP_MATCH_MEDIA_VERSION_RANGE:
>  			match = xe->info.media_verx100 >= r->ver_start &&
> -				xe->info.media_verx100 <= r->ver_end;
> +				xe->info.media_verx100 <= r->ver_end &&
> +				(!has_samedia(xe) || xe_gt_is_media_type(gt));
>  			break;
>  		case XE_RTP_MATCH_MEDIA_STEP:
>  			match = xe->info.step.media >= r->step_start &&
> -				xe->info.step.media < r->step_end;
> +				xe->info.step.media < r->step_end &&
> +				(!has_samedia(xe) || xe_gt_is_media_type(gt));
>  			break;
>  		case XE_RTP_MATCH_INTEGRATED:
>  			match = !xe->info.is_dgfx;
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
