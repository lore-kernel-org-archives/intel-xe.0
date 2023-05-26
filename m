Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3750C7EE2C
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 16:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D6C10E826;
	Fri, 26 May 2023 16:56:12 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDBCE10E826
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 16:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685120170; x=1716656170;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eM5Nd6QjgCfBGY4IM43pxOEHUmzwRFYPPxt/SKBQ7lc=;
 b=k7y5B/wPugxl+VmuM0feIba0yB5sk2GL+ukBPwG+k9+KRkTjsIITG1x9
 US/huK55PBaLd5U6w53jzSa8odvq/BCXJxTzKnmODK1FLv1qG1X59WDeL
 KYbynX0sxCtRgLgdxr91xhoFW14QKfuN36YBu+4eICE8PyOYyenDtej7L
 F0le/GUgDD7HXduFW83m0unG+GPtwkiEm2s84oyNNzmMU06vXIaetphhH
 Yd0YSV4SrIEf7QTGGYZ7CIPic8u5cCIv3r8loq+fboKWHna4tPRkLpIi+
 Uz44RL3ZwUqWJDwC5sFNVGfoDE4PrR0983QBgevUfWztzhC/dROjsFntD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="353090662"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="353090662"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="829559465"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="829559465"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 26 May 2023 09:56:10 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 09:56:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 09:56:09 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 26 May 2023 09:56:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIvEbLNcyi6HvkWF3CVmM9l/yLaY0Xq2YeZc7mYTGRmNfoxxXRY1NqRmYx+19yWSaNp7v9PdfbbmpM3yBNDPELSWuvGWpkvA7AcPOx0vnFGnaqALpMXb4hh8e1HY0g43UQwEaNC6clwu+OEcTSS8drFLVo+w1g/UI4klTiwcJjfhgjbPxV40kgPuRhJlpiajKYu0nRnyBOZ6aILmCvt+8pf7CcOJtrUM9iBzLL4gLaGmI1ss9pJUq3X0Il/B8FUNhFMlUvdqX7Mj/v4xg2KBGPXpzFVIXw03W/evN7NO8ajKRJ1DmOaMv1Bd/jvmTSDkdRm1Qd55qM8ghDfRCsYW2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGa1itOnch1B3pWy3aUTx/oulYrUhnr/cOLFAIpP8RQ=;
 b=OReovzX9xDv+Uplpy5w6beIQuan/GMksHys07wRQeE7rw3uZsMETIpAW65sf2uYJWo4UAdh447AHn5dRr8D5cqfTj8WUrvPXzMHEtgiUV8TKgg/iSezAnj8WZYnxf8fidY11hJT3odU068iotfJadAcL7mQ5Wg5eXlfjOnEjebgJQ8lz9mYMG8AR+8nUalWI5IjKxxoERZ2GuctUwHd2D2P0GPqBmttT7DXEiKW84Igws+LypWlazyPh1HMjP8FtzWfJsebjj3KKWBl96EMGxVIWN4aMp54KgFNs2SQrtiYaaIesd8eXoqSr8im8wE6tAgA/96Yyhg46drzj/TxaOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY5PR11MB6235.namprd11.prod.outlook.com (2603:10b6:930:24::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.16; Fri, 26 May 2023 16:56:07 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Fri, 26 May 2023
 16:56:06 +0000
Date: Fri, 26 May 2023 09:56:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230526165603.GD1217712@mdroper-desk1.amr.corp.intel.com>
References: <20230526164358.86393-1-lucas.demarchi@intel.com>
 <20230526164358.86393-19-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230526164358.86393-19-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR08CA0063.namprd08.prod.outlook.com
 (2603:10b6:a03:117::40) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY5PR11MB6235:EE_
X-MS-Office365-Filtering-Correlation-Id: ccccde5e-f7c0-40ac-4ffe-08db5e0a1913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 72+JQ/sj4aD2euyc6nweMOEt9wPgldGOpiycfXveHV0BiKm5c44NJMXc0O5RmfXJvd2mOuIZHe0uBcR9k0eepx++sqVoZhaf5Q74l5YPuzttD8d8p2YDcGHnZ7zyWdOtImlnOcqjvuTAutVdaMyxvuG9S5at6FGp369KMbNy8gfA7VtJdzRUj+0FAX6a69MOMD+LsBrKSYFSQ3Awwpo1W4PbT1cxQ4DR3GP+icqezUXaVyByOyDC7iY4U+lnxT5EPOm4HejRoY10sSIJq4UoGgx0z2RqkSlEg6fEZWmvFvrvAAcvuncUOUttXh1BfJNaH1QneOelIoRBkjkykO49A7e0JiZ7+44C2+gm8LMKpKm56GWTXj5zrjYljtA4YyHx6WkgojvCppYEsfBApOWBcRgpfiACtBSsvBr9BHN1JwSE4UNaRgO43nA7JJrw+Ss42ibez1OLU5vQtcRL5XenAInTB01ufIerSt3ChWKRyiFtHPnT2kOFwUFVh76nmeKCWQ2IUp7GNFYOX/Y1NPezsFwF0raccNxJNqmmv0HfXV0pQb7qvgE4OG6wrai0Cv34
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(376002)(346002)(396003)(366004)(451199021)(83380400001)(2906002)(33656002)(86362001)(82960400001)(38100700002)(186003)(6666004)(8936002)(316002)(8676002)(41300700001)(6862004)(5660300002)(478600001)(6486002)(4326008)(6636002)(1076003)(66556008)(26005)(66946007)(6506007)(66476007)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lew7RmII1RJWMQRTJEacTmTXkMGhFXbUmhP1Pbmyl1GzBGlSwL3qkvI4wbVx?=
 =?us-ascii?Q?aLj/B84BbxW7p1uFzLVTuqKGAH0RaVsOp+oWdqdSmebYDnO+DbxfIJFvnyjx?=
 =?us-ascii?Q?oxPEiZ9oLdCWw0RnP/oHNNz6D61jlQZXaQomSdvgEw2UVrM7kv/eQtjiApkA?=
 =?us-ascii?Q?d3kbYhD5/hrAwn5pHvc6ZHIAXbngJPYnJZvKxKbOdab3gTwQmvWqyA9IOJZc?=
 =?us-ascii?Q?gWCA2i6KBSK+es520rfT5m+cQhXDKCUhEx3WU0rtU7RFii6ejIXli7LbEVMS?=
 =?us-ascii?Q?pAxGhg2rvkOfytWJBkEJi19KTigWXirv5QmoEyYEdDhW2mAs2q5ott6AT5BI?=
 =?us-ascii?Q?5guAup7ZJidOdWOp+W5UnyDFq+HuDkdxwYaEg2BvGsd82NKZXKhwUVAmANV6?=
 =?us-ascii?Q?xrAUfZ3PqdCERnL9C1PxSm2NHD5EXcxsA9vX1dNjQsBUxs1OQquQpsd3qjTy?=
 =?us-ascii?Q?wHvh8vBdtTjVJZmSm+uCv6tSq/tSKT4WY4uGKwah+IEB6NSPyrJN1zeJTLVs?=
 =?us-ascii?Q?EXwLRTjWfMlH9qvy0bquUdxlEO/vl9gUAWfMaQGKN3kZuu2GI5L2vzJ7OzS5?=
 =?us-ascii?Q?ka87atbUBijbXU85fAzsLPUAzlMdsHsfY2rOLDq17BXJXEdq67cB850MGyh/?=
 =?us-ascii?Q?ukT9LYEPafWA2r2f/a0XtzQdaRAS8Bum3acKqhMjLmWV0lBUjHBnNZLvd02Z?=
 =?us-ascii?Q?YF8U7YVk4JOth2XL6h14hQhHx/pN2+3xO4h1wx4rGYmCXy0XMHuYJfkMuDpd?=
 =?us-ascii?Q?PklVzTSkzL3oDzYVxrq//tDInvlDf2QwF3CbmFZk30AYynrJg9qKWyG32UTK?=
 =?us-ascii?Q?itjFTu8kpiZFgUIOOI+93VWIZziQJIdIFezOWo3lMcmJ611d9KbQKPuFYyOY?=
 =?us-ascii?Q?nnhlCxxUKwh3iSXh4JE5mhV/JLK1AcsXr2J1nSf+7ZaJv0X5xA7tHQGCX/ns?=
 =?us-ascii?Q?GBuDArAtkwTVTNfRWhUiI4W6BDNOIbwb58agseTe7zUymQjPUGXfzcHyjfxY?=
 =?us-ascii?Q?qcV6qaLsoHS7AthMsQJVkdZhKa2jS0yfNQFfTvBoBZSTr3hSs80bwoSfOo6v?=
 =?us-ascii?Q?FBg7auA38U0h5Z13VYEzJ2qthEf/oHh7U4oP34Ia+XaZgaPKvSfg5KKRJ9wc?=
 =?us-ascii?Q?GmscfmcjfpMnwmteuQf+p3GE47Xxem9SCveYSmjIZZLa1nSGplbRYDbGs8XR?=
 =?us-ascii?Q?ORJFtpiZegXuTWhvX6C9S9uBizapDDwpm47l6dcCgwCbVIHdR9zFTxfknDKI?=
 =?us-ascii?Q?LfPh6eXvt2Soypo+1XuvPrcz2j1/UcxvQBeGq/urx1yPc7yIC5FPT/SWE47Y?=
 =?us-ascii?Q?rR+afG+p7CzRhNdJ6kgBc9BpIjjfjfgG/UaY1Z5FSWwWKCKpaCVKG8WHpq/D?=
 =?us-ascii?Q?s3jL/VWdDsx9QI0Dl+y8k5/fvfTvBNfGkd6c3dx0rPYsjkml9WERqNGK9pHR?=
 =?us-ascii?Q?U1kzR+N9DrIxIDRZxRAyKX/L+DBAVNBo9slgsV0ps9oya6jzMxkwAQcQIXb8?=
 =?us-ascii?Q?iwEUIWsJ9K2LEDQzmssaRsuR6PaT5aFyw9ATf2wCOJnicofypNNjwxQuQHbY?=
 =?us-ascii?Q?gpI+MBt80IE53k31RcpTc2PYHed277nHZvoZPof7gGMhjjHQCT3TisEJ6kN2?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccccde5e-f7c0-40ac-4ffe-08db5e0a1913
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 16:56:06.8769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcqaIT13tQwHdxw+qS3Yb5v/QOBrB11hUxOmpj1YvUBvhNNc0J5ZfCEgC5ha0N+DYZp7LIE6UhhHq5uVgG1dY137D3Uz8A6PZxPvcvX8tz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6235
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 18/21] drm/xe/guc: Port
 Wa_16015675438/Wa_18020744125 to xe_wa
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

On Fri, May 26, 2023 at 09:43:55AM -0700, Lucas De Marchi wrote:
> Wa_16015675438 and Wa_18020744125 apply to DG2 using the same action and
> conditions. Add both to the oob rules so they are both reported as
> active. Note that previously they were not checking by platform or IP
> version, hence making them not future-proof.  Those workarounds should
> only be active in PVC and DG2, besides the check for "no render engine".
> 
> v2: From current WA database, Wa_16015675438 applies to all DG2
>     subplatforms except G11. Migrate condition to use subplatform and
>     remove G11 from the match (Matt Roper)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c        | 4 ++--
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 4 ++++
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 1291f71348db..cc58a2092236 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -164,8 +164,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	if (XE_WA(gt, 22012727170) || XE_WA(gt, 22012727685))
>  		flags |= GUC_WA_CONTEXT_ISOLATION;
>  
> -	/* Wa_16015675438, Wa_18020744125 */
> -	if (!xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
> +	if ((XE_WA(gt, 16015675438) || XE_WA(gt, 18020744125)) &&
> +	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
>  		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
>  
>  	/* Wa_1509372804 */
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index ac3715e215f2..ae0de4d5d687 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -7,3 +7,7 @@
>  22012727170	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
>  		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, FOREVER)
>  22012727685	SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, FOREVER)
> +16015675438	PLATFORM(PVC)
> +		SUBPLATFORM(DG2, G10)
> +		SUBPLATFORM(DG2, G12)
> +18020744125	PLATFORM(PVC)
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
