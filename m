Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C9AC0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 16:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A07E10E4A0;
	Wed, 26 Jul 2023 16:58:52 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3571310E4A0
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 16:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690390729; x=1721926729;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1F+JPu0I3UJ+O7JMkPCAEYVDhRBvysr/WzrgRkbQmfE=;
 b=KqGq66xOacnTzuOCKcZm2kK2Hb3DVsIgKAORO+vtZ//zYv4b49Njbktq
 xzYJtWTuM6ysODIyb4q+d+1NUaH8AEIRF3Pkczz2qOYiRj7ann29SvDiI
 iSfsN7x61yZLeNAmCFHJvp8J6m7CL3kVo+CCqmF9n1mGMCoNCZwjV+9nc
 Lelkm6AIcUmGSKz/HR5Pl9H/YbPE/DIS9G3nyNoWsiFZKpBN85ORymTHl
 7+kJLqo7u2pAgIhAyhxODOAHhGBr2K67lMfDX/9ky/zM5cUoVhUS5be7B
 VI6V/KpJsI5MFRhrkYXXqAo4NJ5E2HMggnb8Gz8HUEulMGl1lO7w5c1Z5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="365532354"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="365532354"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:58:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="756303155"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="756303155"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 26 Jul 2023 09:58:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 09:58:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 09:58:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 09:58:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nB+5Lz4rk+LeVVtOUrdVOoLgw8dGxcoNWErGWSbmKxFD0QYXyyH9mQZ89NFORxCv47vm8ZYQI+skHAhvYKewDHUWe35/FAFjVn1R/OhFUXs3oYXpUbsMo6tOBlDlFzUDnNMF6N4C6asIQpqbgNS12jX09R3SwGECCcUQjGNpGt41iFPb8tbye30T/sMy3+dkAnizhKKKL5y2FZqkLKVyvXmXl+ntBw3rQfwIkz0JObGcOyeZ7nrEQZ53pqZTS1/EnrrjkfI4A8mybUJIasn6uCHdrnrvoqSqDzcwXA+FTxdZ+eAwFE1XSuyQ0DR2roN6M81JSmQ4y6l48116hdmxbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w93JSYI+VHjz2Y6fwHDt7JOdn2HDxonQzgrcm1aNugk=;
 b=TMQHM5z+LWQq9wlVf3qbljBN97W4gBJghnkY1cd7t6dA/1Yg5SF0OsXV7wj1RlQuPthZzmDGdfDvGwlSy52atg02W6aO67+h/1pQD9ztFhqtxzAtx37EAQFyfS7y/5IrfNAlT9ej5Yg1tS4FJHpzJnqp+WgfrAKagcjlC8lK4TF0arzUFmZ8EJneH+9hGdaUB57VeqrZzEj2FyUa62FU1AQkJm/3jlmGddiiDyyXwM1k/FC+3fVRUEvm7vJKIraWVXvGXFzAU0kVrtX1j4jhp777L3qner/5mKJz/aLDmF6AxX3QrS4oTMyAYETKnTM4639MEgrHnXxTH8miDLW0Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB7244.namprd11.prod.outlook.com (2603:10b6:930:97::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29; Wed, 26 Jul 2023 16:58:45 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 16:58:45 +0000
Date: Wed, 26 Jul 2023 09:58:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230726165842.GP138014@mdroper-desk1.amr.corp.intel.com>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
 <20230726160708.3967790-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726160708.3967790-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::23) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: d389b026-a5de-42e2-937f-08db8df992bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U7QWKC4JRmLMm0DQtscECcE9q6qSICgxeijarMgKbqdpu0IDKdnxYFcif9pmyO5GsV3DO2dqTNguVRdfVSbyZEpC/0BzJsONbINd9C8HQecc9KlwcdwWuaLwjEU351I2Jnv7Y2wEyA9sTQLHd9ivwCOcC3O9Z1iu2uYYasdKAsLmJ6xFMAdW5wp3Hzp5aBRkyfgc41Idku4x00lp5GmBIwMC76Y5yi2qbq+KAWz6wLSePcxtcKg4siBd2gBHMcEm21gVjoXdAvyHjpQGpTRc3Cleox9qGlavLVEfGcYRbSsdag8gAw1kn69g61ijjqASOkpjDCsMSMfErCkxrUt1TfCvI9gtfOzLKVfGq+8I9RcScvFCD2EOuKHHB6rodIA7mURmsZsEhZcwgWoGo2w5O4l6FIoyPDH9JzTcgf0HIuOjKgJxbXnp0QSuubPMas7+ehxfuh/rgw6/1NO8BJ+hWyvB3GWPHazWAJK0URrDNOylUFY0WQh761W6/4vpk6XZGyjwdlMxDxwU5UqLOEvPTbYvjndMlr5++4RtfQuuBn0q5N6a2blzyxF4L8V31+iR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199021)(83380400001)(6506007)(1076003)(6862004)(33656002)(8936002)(26005)(186003)(8676002)(5660300002)(86362001)(6512007)(41300700001)(6666004)(82960400001)(478600001)(2906002)(6486002)(54906003)(38100700002)(316002)(4744005)(6636002)(66556008)(66946007)(4326008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DzuwETv37tCOH4AlrxlFO9MDR5A0/WAug//5NkjKbBR9H6DXJ1TyRCrT1W6B?=
 =?us-ascii?Q?L9s7i/2BA7mSE8Poo3Nl2AvqYA+C9bVk4e1bDTQqPHbtFRlUjOaf6CfocLiC?=
 =?us-ascii?Q?ps1dgDLaSkbzNkprNtTkJH12IJ7glpIi04jwB8g6HabmBHZEz2ESJghycuQg?=
 =?us-ascii?Q?iqEtJlW+v9YO8jtRjQoamUpgJEDPBRcKSDY06kh5AkiFEx+cyxiLJYWsP0i/?=
 =?us-ascii?Q?1myPSgdT/ykfGm8edQrdZxsOayC0mPE+5UW/BOOF7YMTCmBO4npMbTa5myQd?=
 =?us-ascii?Q?fPXuWsGo2clcuj3XLXwYUhLNBd0rJjn/RSOtc3KQ2nBk16ujRYgzwNihbhzU?=
 =?us-ascii?Q?KElG89JUkF6QIvIZGZcDk/S9eYb+0NR64ClBVGBhfpKz/5QAu3iatF4qsI7W?=
 =?us-ascii?Q?zSe6qUVyI3n5QwrC/3DTxwh06JROa8rbzPpr8lWzCcc5/2qBQfIeIyb+cbjv?=
 =?us-ascii?Q?ibK+4yBMTcQyaXcIUw5omRHIrxzzeOVriDkF0yNEDUskF2xsUtzBXV0/lqVp?=
 =?us-ascii?Q?CRi9BVcLn0zJWtQ8Z/bXR8q1rFhB99b9vZgvXIUrspRRQjwpt9/J7JIgjSQ0?=
 =?us-ascii?Q?irqCsa/YHAThxeUWDu4ZdFZZptUYsoMrMK8fwUi7mPkdAC88xCEry2IrnpI+?=
 =?us-ascii?Q?2IK8OmbsTl10wn6CSlEbRKlhReJIUq8SZOU1CELTWNIUrrTC+A66fAb2xyxy?=
 =?us-ascii?Q?YAIpS29Xd8VcxjxCUfy2mAYdyBM7rTFoPC2jAdee4dbaZ20BC89gbNig+zyv?=
 =?us-ascii?Q?1j5Nc6Ztz8PUxHle9tbEyhK+lUFEQpcDda40632BCiCjLu5Q1IhjBQpMXsJ/?=
 =?us-ascii?Q?UL82crLSB2zUa6gs5by3D6Z4aZ2ccL1iNQMSMikcETgz2I9+tvP1Uwwd3FS4?=
 =?us-ascii?Q?WKYhVnvxneSJnoR52yOVIe8H64dqAks2s5emCDOEaFDloOIgzxs9PNCcrJUq?=
 =?us-ascii?Q?+pbu8bTjQgyZ1+vCuXUy4hzCIed3JlTWnr99nzzgPN8myjsunhIsJhSbH9Sr?=
 =?us-ascii?Q?RCZI8W61242XLAQXCjTH6LmT2GEFyraiF3ZC0m6BMzgUzngSDraeLJFBpM2g?=
 =?us-ascii?Q?ydDrJiJW/ubQzq8MAe/gHMxRLhraMTavqmCx3+5o01nSitU4aNwpXm74+rtC?=
 =?us-ascii?Q?A8Cyvgz06GVuXdeP1GjyiR3jOPmXr8WVMaiJ+7YPbk1pG7zOQhPvKqVj3afW?=
 =?us-ascii?Q?6CQZcbJjy5FhBSsbSKsjIKSW4NCIdMGDXLQh32dOvPomyYHoYPjmX9NHrWsA?=
 =?us-ascii?Q?YOEGHgJoi4Zosv/YiFJEksaT4t73e2SGwbhcGnLI/29/m5/3lZjgFGmbWB5j?=
 =?us-ascii?Q?59jFqQX7jjrej3E+HQDeyvOFOwB4eZhN1x52IIcD+S2mSAS74Wl5u0+/SItk?=
 =?us-ascii?Q?cmqz1qTjEw3LbiO3fid4Q75WIJlmxlyp7wZky8cM+52XTHNK3IgpJyIZejjI?=
 =?us-ascii?Q?eaeh00qRuWTfqZ2XmUW82qsPq0MPqStuM1wcn1zeUUTvV9GNgpU+f+cQApjJ?=
 =?us-ascii?Q?Zv9qHKvsWoRpjgfEOOCbkJVHq0iePL2T7fH1Ds77QNRk31vFb6IoMERkEno1?=
 =?us-ascii?Q?nl87NYsavNgcGfl9hKenHkcjTH5YqJkuyak8EvPheKFTXCLP8/BRYLqUZ6/o?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d389b026-a5de-42e2-937f-08db8df992bd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 16:58:45.3072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQ3tcN/mds2CQIAo9gbrS5JN/z/xjjuT+/6NpeZSNFW//OYZRyIwPKVIQyH7LDvkZgEIM5H/yqUZHwBqgCf4Ns3+89jWgIG+v/Z+GEtjYaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7244
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 07/10] fixup! drm/xe/display: Implement
 display support
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

On Wed, Jul 26, 2023 at 09:07:05AM -0700, Lucas De Marchi wrote:
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_plane_initial.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index 6695908024d9..ccf83c12b545 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -70,9 +70,9 @@ initial_plane_bo(struct xe_device *xe,
>  		gte += base / XE_PAGE_SIZE;
>  
>  		pte = ioread64(gte);
> -		if (!(pte & XE_GGTT_PTE_LM)) {
> +		if (!(pte & XE_GGTT_PTE_DM)) {
>  			drm_err(&xe->drm,
> -				"Initial plane programming missing PTE_LM bit\n");
> +				"Initial plane programming missing DM bit\n");
>  			return NULL;
>  		}
>  
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
