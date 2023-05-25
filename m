Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB22BC7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 23:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF0610E008;
	Thu, 25 May 2023 23:19:28 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CDE10E008
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 23:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685056766; x=1716592766;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=urtOtSPqpwjDnqNNlV6k02hYOjGn3+mkkELgg+YzBZ4=;
 b=c7lwxI5QHFV1GanYubTFxPOM3tcPgTm+gN7MjW5NLmNNtlU+lXxnJtGw
 hDSXisZa2pxRNpELsqGuqpRRXhkeITx1peol/HXC+64iLdbAoxhInqN6i
 lOiB8e+Y3aZuKBWNqUHTo1+rRCShnFV6HsWOPjqruL6Uyc95Nyae1q2G8
 RcvgCMt2coNoxWo8mU0cxUbnCy4aHKPpdvpoMvjAd6uFKzBYrmrzo4YVi
 Ph0K4zRJN0NCtXlqMLG6UJcA37LnCdJ2FfLRQlTUU79R6joe6lpLj1RhJ
 JNEEalIjlkG6UrdARGj1/YTjBGuErLQj2oaOCMSg66CESRlcYohrnanSK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="352895153"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="352895153"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 16:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="879317977"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="879317977"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 25 May 2023 16:19:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:19:17 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:19:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 16:19:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 16:19:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vu2fWct9DiDxbDpb6myahwIA1xej8ZgfCbyYg+Gre6VLDYCU95Wt3PyNI4i2WoY0T2G4HCFfTj7tfOForumqegoCi9r9A7+lySRV0X0kjsQDZmY73DH+ibT5iq7Ta8s9AYXLYceLvCnzJMHcRvJH2lwU5JuxpP+1PhmlmrwNRh54u33vc4O7zdItNaTh5X75zMoL9uEz+POptIugUXQUlEho4iw2XAmxprfbUXbrWY5E6tjLPk4NvqezqsvBHFfs+b4AaEXVngwqex361KG5KXEqMumUV9EP1C3vB/Vl82rnFlVNFWMItK9dph+A3jGrJgD+IkCZLo9M3yCSQA5noQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQvAL698LRB69sUEExXZ+xTLlsuTC2I/+3vig6wAcgM=;
 b=LysDqhVDgTzIWO1VZJNczR9HcLZQzSZOLM2VzQABPRbPjrXhb//ewiSfHUuZBsa4IhEUtQAGg1E+IIpmL2WmQjHTJWZUrUVIbYCQUNrZygYfQz0YkKN9U862BZPBF6m7CpZuAwPkIp/Qlln45ulhDRK28ggcwovYSEPZVFODixxUC50QfQJgsrJ3IxDwYOYwzMNhl2lRzT8tP7/bVFTmZyDn3ykpc5QWDWIQSdWmUWMj2m2eu8Cwg5O6PJC8yJF3GRYTMuB//ngVJZDFZQwKicm8NjfoQwGRz+wNu7aD8KLwbzNQh7AARZT4DBXjG3m4AYH83V7mPb6q6BypaoHJtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 23:19:14 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 23:19:14 +0000
Date: Thu, 25 May 2023 16:19:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230525231911.GD10045@mdroper-desk1.amr.corp.intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
 <20230525213407.3907094-17-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230525213407.3907094-17-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0251.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::16) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: ff32f955-776d-40d9-35d9-08db5d76745a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ylOBJC8SJg14Sz6jOSAVatPPqlZaGMkzRG72EMkC5tzyM4gG3ST0aBRR7mtu/JoaD6YRxDl1jAXNf4KGTXpDCkg/1XJanOShvk1eUaMJTeiEZ7uDqZlIBAPqlEc010kla3kAAAESoOkdiKofsvGQ8qOT6ZSMwBs6q0toqSqhHSNnK7JpSVe0yogrrzJhFl3gQZwmu0iXJhuQntAR9oVAcr0BQINxT25VrXJJyfsdxiw+u94tkPxctxn5Bvgh0YnqMe9RXI46GkHouhIapwulTu49QexiErWS2lITNJYMagYdaGtJ78U1QTPOYQ/CkZSYzhvv1e6rqSXFXeh+Voxg+pWWyPwF7Jp440fq4PsRpeDytZVJINzLIY4U2Xk1p67eiODeEIf+AE8vL61sOKJ66u6AxDTZI0xyx1ZdVEEXo7hR+HUb+uzqemLJwZf5Qt484YP57s2xHak9NdAiQ71+Hw6usp0JPN2HrUknVdUbfteCmVwI1Nju8gzaoEoJWbNmNJFrj5wS/AUKaA6kUOMQbOnAsRjHLck+nO5n7LIbApkarOVOprxFAJv8aWoKb7j3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199021)(82960400001)(33656002)(186003)(6512007)(26005)(1076003)(38100700002)(6506007)(2906002)(316002)(6666004)(41300700001)(6486002)(478600001)(86362001)(66946007)(6636002)(66556008)(4326008)(66476007)(6862004)(8676002)(5660300002)(83380400001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2RpK9dp990GFLxlw4wltfWXiIa7QRDGyra8kC6p21Zaw9fQIxI8IE57IanVO?=
 =?us-ascii?Q?50aQiYkn+/HZtsVKw+czh6xieNEbUf2VD77xbsXRdZBafnoL46/8TUUqB0PD?=
 =?us-ascii?Q?RcVtTliDz4xJ4u1hga9Fpkb7VIu8i8JEv7DXu+cWFWNI3scWSifAFgv9mnlu?=
 =?us-ascii?Q?vSfN1vJVUp34khI9RgUqr6C0IYYlwcKsazCi9+tkMcf1oNOgRRz0A3e818B9?=
 =?us-ascii?Q?IHytZg13MQgSuehGhhPATjfRc7fRk5s/GQEBfp+wy0yIPf1P+iG2YHNpdVgW?=
 =?us-ascii?Q?jw4+5VYbc4wOlh04m3BizxPnHFUXEvGTuiwLzI023HP+pJX/J0do+vBVog5w?=
 =?us-ascii?Q?+mYapg0Aqa1doTryVlEzMYyZTU9vT0PiSz9QuIjLzwpcpErF8RjwoNVixq2E?=
 =?us-ascii?Q?uMYma3dtGvFDkEUxkSIFGMKCZziMNI00zyEZJLemOtWl6QnX5hP6N3bbFjss?=
 =?us-ascii?Q?O1WH+MiPSO0ObYPCbjIHYvXkR4Ax/7WZNED9f02ihBHzS1t7AWw21bdAWfAo?=
 =?us-ascii?Q?8DmWvPUr1zqvmlaNT9d4fbyOZJVHfF/ZNBnmwC76+FN6tr273IBqMNoxORRI?=
 =?us-ascii?Q?QVq6wpGlBw/I1PjGaCh4xxXCNafvdWqU9cVobeDBckOh88ceXlWZFcqhYpJV?=
 =?us-ascii?Q?itMCZGAde90pTmFJ+UnCYpoLJBl72XUgH3zkZYauwu5BG+TV0a9HAlSvJlhI?=
 =?us-ascii?Q?+HZ1Vzp1sce74JopLhBK34VxQsjE+J25g/sOo2T5+gqMzmvspLmbuaI71QAA?=
 =?us-ascii?Q?5X78NwgLv3jOakP5oNs79OUNF3KmjGUMR+AS62KWP2PrmTWMIa9ldKlw8s3I?=
 =?us-ascii?Q?ovaQiKQEWGKiw2eXBs/GdViAdHITrex1/5p9ugXf9pA2ivGxZD/QSn2wm0LB?=
 =?us-ascii?Q?gydMK+M9a9muPUZQnDeWhh3eEj6LWRTQMLN0tc7mwtaIYpjOnGlEyQ7jylP4?=
 =?us-ascii?Q?ZT+85g0qo1IEqtWOKJlyLk9m+6awaDTEFjemtGUW4QPPzQwmNw0mZ048ZS6w?=
 =?us-ascii?Q?IQD3/Fzav0DJpZGuDj4ZDXJ93fQ87wfuiuylZlN6fCYbtpPtDWrRd3DUef0V?=
 =?us-ascii?Q?550Gbu412ZhB/qzpLlbMeQo8YJo6v/FbKxxr4l+6s+mtTOs+noYC5uDUp2Oh?=
 =?us-ascii?Q?LVmLgYu09uYEMhtsNmVU83HRPS7G3RuE9WEn3V0T1xDKop24JMV9JrMa/r//?=
 =?us-ascii?Q?fjcxzNVuSoHUuBsWk/8ye2bHzgsnHeSFw9/xfkHf2lWVDBOTKyIM0Y0rI8gy?=
 =?us-ascii?Q?OJiWTgSxs6Osl04BY7FABuY21Ekdn26HASDLszhCUpNyOhqElTXlwaPSgPeL?=
 =?us-ascii?Q?x3YfbfzZdtcpWFtCNLwee0uLDx3M6BK0abaHgEeYlRz1vdTyvTrkcQQwNdTq?=
 =?us-ascii?Q?j3DtfJt9rBVDN77SGk3c2RKsjjiNH0DXiuDtRQlpd3b6HSWFy3qlIwTdgNlv?=
 =?us-ascii?Q?Ie/RPK0HBuB6QGZG/PyqMPAOwEKVY4hb9kZYDxVatmcgUpw5VYjSflNP8swe?=
 =?us-ascii?Q?Z0PzIKyYQnuDOi11jPdksuAXwakKiTGAdx/3mddVXI2YK5x35rEqVmVfwKhe?=
 =?us-ascii?Q?sjoD9wbAVPK9V8wQ7h8SPf4taa4Cgk7RJhMO7tPS0kr4MXQ3URwT3C66XhVq?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff32f955-776d-40d9-35d9-08db5d76745a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 23:19:14.4419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbt6awRfbqG1ix95Q+fJHFSUjYSmFXTJ5q0hUFEIeiapJQ4qw35rtTcUIlwnlOAOHcF+ZVNVgyqpZAjw6MCEYIomlyevm0+5sYIoWqtShJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6396
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 16/21] drm/xe/guc: Port Wa_16011777198 to
 xe_wa
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

On Thu, May 25, 2023 at 02:34:02PM -0700, Lucas De Marchi wrote:
> Port Wa_16011777198 to xe_wa so it's reported as active.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c        | 5 +----
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 54aaf6e6b577..5eccc4b67381 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -158,10 +158,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	if (GRAPHICS_VERx100(xe) < 1270)
>  		flags |= GUC_WA_PRE_PARSER;
>  
> -	/* Wa_16011777198 */
> -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
> -	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
> -				STEP_B0))
> +	if (XE_WA(gt, 16011777198))
>  		flags |= GUC_WA_RCS_RESET_BEFORE_RC6;
>  
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 77ac4a4a3296..3d4304b7111e 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -2,3 +2,5 @@
>  16011759253	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)
>  22011391025	PLATFORM(DG2)
>  14012197797	PLATFORM(DG2), GRAPHICS_STEP(A0, B0)
> +16011777198	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
> +		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0)
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
