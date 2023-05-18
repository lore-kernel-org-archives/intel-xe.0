Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109BBC77B73
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 22:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA33E10E56E;
	Thu, 18 May 2023 22:39:58 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B2010E56E
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 22:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684449596; x=1715985596;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5MkU8Ukmrfin9LOjWX9LNt2fsURjmZ8B2E9g9/89f6Q=;
 b=ndy8lSRj2j4KQC86Gw9uGa6KddYDU8wo7o2DPttuI7zgtAXVyNrJi/5Y
 YrFdbafZRvkR8xgybX41AjgKgRLisvJlU0QeVCM5SkfeT8TJ1YC9mNsBp
 tcYb39snLj9yNHYO+pfkRbLiD6x8A14Sz8XfsPJ1/j01Uly8TjeQQbd3R
 sMAeSHwJ0c6Rus4h/wVlcX7zez4DILnMba6/Gixu0pGlw5BIBlHJ+/upE
 /ATyvftubFwaaM2RRRa8d3r12vF0W5hD6qc+73kJK9wH/UsQbnXdCpUfd
 1AuKLejo25auhjM7tgr5XGYtSWCGdGSCLBCVJ3N2bObiBn00oTq5lO4yr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="336799683"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="336799683"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 15:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="702292512"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="702292512"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 18 May 2023 15:39:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 15:39:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 15:39:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 15:39:49 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 15:39:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrBIx+v3VbKNNOx7joXGFbP7n5D5167ODzc11K4070pGJABbLv0LvvI+fweujDlstOLa1fUQFEzjGZFW+y0IXXH2+vZMNZasm2qw5qzBHZcdrjn05DIm9Ex0rDo/uBRIRLgeCEVApHwa3G8Qqie5rg4KfvaX+wbsbFbUSXDIcxymkH21jkchUE7Sg1d6Wq89hEYqkmYl3uOjL2bTCEX1CthTmT7PADYDn3vT1Hv/KH6a5Bq6vSFfE13cfZhGY26Kxd85/abuwjuhYmdIy12IdRz0az2RMbrpyjI9gm/uRRfgtZkgODy1GupcpTcZH4k3Yog3uipk3AvUUEKznmygfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfRnv0TCNPbq6VPjzfDYOG+Kivgjudlbk/r4xdfEhmk=;
 b=OdB72LvBcqcL/18Y7niEPm+ir/cOOtCubmrfZ3AxTYhPM0oCQBtm5UkAa5abM4gE7a5sekX7XWj9cPSzt55Q9+n1Rigmwe/Ys14bksFPeBzhrp1UOU8UX8g5IJ/SLFnmFSpfz5puXAcjZ/mqfA2kkagjVCjlw6USeWwLoTc+gnGPe2MLM5MhJxo0SDwXyjQU1XtmfE0wKTrSu6L96NzTVipiCijR+BYeNrErdrdjUGo3mgaJcQUtDThUF+wk6ePU9A8v6cQ7U6fFusE7quiDbjeM2KGX85eSG6vhpYFdae2lGiwXJV+n+A/Dvdr5xglUIN3Us1bs/Wy0tM00gunK5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB5801.namprd11.prod.outlook.com (2603:10b6:806:23d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Thu, 18 May
 2023 22:39:41 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 22:39:40 +0000
Date: Thu, 18 May 2023 15:39:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230518223937.GX6250@mdroper-desk1.amr.corp.intel.com>
References: <20230518212446.3570168-1-lucas.demarchi@intel.com>
 <20230518212446.3570168-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230518212446.3570168-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::17) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB5801:EE_
X-MS-Office365-Filtering-Correlation-Id: bd0d1aaf-318c-4829-20c1-08db57f0c41c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T5Dt2vqTA7HSfSJA6KWouC78jbJkm+BISc7AtCj7Oo+4ob+tnYIYQc3HUvGvMQbW8dzOEb3SxZzdKc5oWk621q2O6m4f3sz+XYoBO0n+a+sw5LBC4gwgiMpU1dU4dalHhOzM5cXMFH7szUPX2dRaXAfGXDvkAjpIyEoPzmoE/r6m8TED3e+p21eYjUB3sQi9upR4JvwqD/ZHdQs6CGpOtH+YOrOrFaBnuovQ3mu4jWUukl5yJMvVrlDei08XffmdkQL8qkd/rg/in8c2ALCmtdyAevVlBEs0C3mMdNAmjkNEKmSgseQEGCxHRT9oIyGcJfqsmFe0lANTW0hJjcDmzildV5LliGq/posjhLqzn3lUujsrjyXglnynyEB0YuhfeDPqSt/tHfkUk9MGJfujTkDx0Qv61gESVReygXmPdrz77GXsrSi9QvchhMhkDayuoT4WY67SA6UtSvI0r2ybcOaUZjikXLInU39t1Kkb1kvn6mh4sDbhLH52NlRwXdO02fad6XlzpxBgcoSGcrm527i8o2y9Qx1m6psNlgwSt5k9daVC2aQOAPdTtdKXaN8O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(346002)(39860400002)(376002)(396003)(451199021)(33656002)(316002)(6512007)(2906002)(66946007)(6506007)(86362001)(66556008)(186003)(66476007)(26005)(1076003)(6636002)(5660300002)(4326008)(8936002)(8676002)(6862004)(6666004)(6486002)(82960400001)(478600001)(38100700002)(83380400001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Oxd5SGHwEXh/Tsp62w/3TC5iHyXnUrkhnKWbfPzZ91TrFoGmrEmyeJNrgsZC?=
 =?us-ascii?Q?X/eUNGVWH8bWBQBTAhn5ku5bLuGiH/n1yzmQgHDsvJZKfXmJqsfZyFQ1kn0w?=
 =?us-ascii?Q?PTxeuJx+MHuhZY+lEi2nUFrNSD4WlHAGozIS8Syrg+Y64JobBj5V0IcZ62aW?=
 =?us-ascii?Q?+K6KACpYHf2pWN6P3lWSIHixhvCaU+n+UW1RfAFgAfOEzp1z6aE0l0c4FaTq?=
 =?us-ascii?Q?mboWeXC84ilucZrZT9GiHDodW+UAyGbpu293qRl1J11aIm50JLBUE+CJxa2V?=
 =?us-ascii?Q?vAxexIeRpKlSHGM6z6Bho3WYcmnFr3Z0GrpF99+kk7sq0fz3hEJXln2hq0GM?=
 =?us-ascii?Q?BykCRsCCx338ac6fUj2EAeD7YsZNj0OuUYtoIQj34bs1kSVO569XlwKkHNPh?=
 =?us-ascii?Q?lIhw/KRERZnRRGDt6SVvruzSVgeXKfuupnDnqc0Pv3SwAURY5dd3iQzodTYX?=
 =?us-ascii?Q?tsqryg0hDRR8QvABz967Tnevs/n8NJlFXMFw0+xCU8j0Ou83gThubQx7txuI?=
 =?us-ascii?Q?JAKL+5DChXnLSsDs7qxjlT7rKUhYjMd8cfS2ERLSZq1vSxyniUUNZBSIliKg?=
 =?us-ascii?Q?pfdGI68mrWE4TI5XZoPRaDWdl0kEAvpYTSWA/j1ksXlXtofN96kvucFhFc5I?=
 =?us-ascii?Q?a/xwXplft2O9bAR2tOFFBmnqtQRtG1inq32N3xebsmD7nw2MXXpZVD2f0gNX?=
 =?us-ascii?Q?CmYWeU9JwZcJnAZyIzAixX3Sy4y+8km2yxqHegY6n9UrbM82q9wA6QmVFZt1?=
 =?us-ascii?Q?8pJoa+ubK4mWGYAJvVBP6FFFBcxa1nazHnyq47CgSB230qdRSpR/S41jZa/9?=
 =?us-ascii?Q?/VnTentv4V9UtrpjzFsu6SCvc8p6v/pEpAshGwXKbRvsPZouSsFAt4leuvg6?=
 =?us-ascii?Q?0yTbLov+NC3SCkLK44I34ELKu4A+ceW61/3Z8UPBXZQ1idlK+XRoFhm6Ovb2?=
 =?us-ascii?Q?HsecOV3nne3WnzaLNhDlYgsYBAytaM59WoGVNUMJDH/ep96onguFqNBwvrPg?=
 =?us-ascii?Q?+UrxEVQF3a+GYRy39lTampoyYXgoh/wJIV4Bm4hU/IB/zS5CmHWiSM7rJGEF?=
 =?us-ascii?Q?tIy0LaoOpDoeqKfjDqEkAbq1nRDdh2eSZarU59C+ugGefwEWw5p3umDx+dzv?=
 =?us-ascii?Q?CacZCRPpUumJY7C35qkQ3LoCO6+c5e9Eqi2NRf/Mwoc3w0sVMRw/FStflWJZ?=
 =?us-ascii?Q?JGmiQg7ML0KKAQ3Pc/WvvMn8LxT4FiUaDtHSDMUFJWI9xxUYQdhu3tW9b3z7?=
 =?us-ascii?Q?S5VnQBIuW2PQKBAizcP2JGLk2znH9z2RpfUcFDjwOzjzEdt4Pu1fm1gduFuI?=
 =?us-ascii?Q?dcRDn7TYajadRHJeXgNNR5G9c+YzgJhy2TMIRYw1Y24iZZZCngCDwsyUB+s+?=
 =?us-ascii?Q?4/NV0EV17ZagjsjnRsktyOM0uvRaqmmVu84/PrY2W5+QBwHgPDMETTL0EI/5?=
 =?us-ascii?Q?ISANMuHsTQ3fGCtiLN9XTJjmMVzqUwLpb4Mfie0DW1Zuw8/4XG9LiXH8Rpm8?=
 =?us-ascii?Q?XDRuvrfZQgEyWKFcM0oay2LY3VB2EBKG516FHFc8ROIe2FexRo5TfD+Ij9Fj?=
 =?us-ascii?Q?YKCCIfkpZ9lzj0y1OJDx55lo0OFjzFKxtI+sBz+pfG254JQrFxLUMdr4jO1/?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0d1aaf-318c-4829-20c1-08db57f0c41c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 22:39:39.9532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3H8lIDd9vttnlTfexjNWBAk2IMVHVBTXvsCJt566QrvZnZj3LpA0F93DG8jXv8yOv8TWICV/k0Qg9n+vptfVkVWdArSpCMsFAPN3SPk/v3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5801
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] fixup! drm/xe/rtp: Improve magic macros
 for RTP tables
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

On Thu, May 18, 2023 at 02:24:45PM -0700, Lucas De Marchi wrote:
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_rtp.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 8bc946694bfc..29fb4eaaba44 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -262,7 +262,6 @@ struct xe_reg_sr;
>  
>  /**
>   * XE_RTP_ENTRY_FLAG - Helper to add multiple flags to a struct xe_rtp_entry
> - * @f1_: Last part of a ``XE_RTP_ENTRY_FLAG_*``
>   * @...: Additional flags, defined like @f1_

"...defined like @f1_" no longer makes sense either.  Same for the other
two below.


Matt

>   *
>   * Helper to automatically add a ``XE_RTP_ENTRY_FLAG_`` prefix to @f1_ so it can
> @@ -285,7 +284,6 @@ struct xe_reg_sr;
>  
>  /**
>   * XE_RTP_ACTION_FLAG - Helper to add multiple flags to a struct xe_rtp_action
> - * @f1_: Last part of a ``XE_RTP_ENTRY_*``
>   * @...: Additional flags, defined like @f1_
>   *
>   * Helper to automatically add a ``XE_RTP_ACTION_FLAG_`` prefix to @f1_ so it
> @@ -308,7 +306,6 @@ struct xe_reg_sr;
>  
>  /**
>   * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry entry
> - * @r1: Last part of XE_RTP_MATCH_*
>   * @...: Additional rules, defined like @r1
>   *
>   * At least one rule is needed and up to 4 are supported. Multiple rules are
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
