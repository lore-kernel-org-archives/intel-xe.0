Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4386BC47071
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 18:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F6310E65C;
	Thu, 16 Nov 2023 18:32:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C7510E65C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 18:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700159535; x=1731695535;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a2W+4pmVNYN3ZkBciXAnDXt65Gg2D/i/VkFOTmeqpDY=;
 b=lVqDnForP9Sh/KNwsaQlz/yLnUF5kH0mr+S3Ch+aMED4Q70fgZDivnNR
 KtlimYsv438ro3IpDg9vOdssUQHR01JH8FfNRUiWYO1m5Gop21LN3veNM
 WZpe/aFLdj5A/P+1eW6ntmnG8rVO3A08EO6thaZw5IWoJBrYsEWErBl6b
 6rluGoDlOlUd/olcTZHyFVMDpej1UEcrAaTaHKdbG46Oock25jnPpoa5d
 yhC0o0bl9GZPb7TQKAF22j3tQhCZovmoXUwVpk9EXwBpmxPsBnKnKGy9g
 Ay6NoMpwKTSGkWAwbO7WKmal9lmqQYARRCrlfsFWxV62iRBaF5T2taabI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="457648200"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="457648200"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 10:32:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="835820811"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="835820811"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 10:32:13 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 10:32:13 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 10:32:13 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 10:32:13 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 10:32:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkYMK2u/Cbe+9tAv7vPs4sb1j6nnWvcRzHivfY4f9iuhWLsFEkNF90rUFSK5eLNCd55vBL1yP7ixpJ6UzKGWv/au60TFniSWqK72x6nV9YSM+KOPvfTCnibEmhbR9SIRT2O8xDyu1OYuICp8grJtxDhsrjhaF8xkhuyGW5tlBcg1n0XdklLuY05Y7gC0p2lAM0+SdwjMI2SVTz+pIGnJlsBWRgq+3kFjuKxQCJzWnVTD7ewNEcjcm5apAxU+pm5KGUVsXb/5Nr3MRo6vjAoQoAjqluFOGv0lUvYZykgUosNae4m6vE9ouPM6f1N8r0fvGxZKkuuBa78v65YC1astjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzMUlkme7CM6gP+3I4ummwU5zlkF6cdvqJdTrYxfyqk=;
 b=CtwL76Xbn1+OLmrNptv+neSBp9f/zMx2d+dhYQ0ANeHb0uR6pCaTRFTD1Iqcl47V/+J+TQeuKig6qJJqyNqABfsD0rf6ICqD7LkII0wCsDbeKYOmjy0q/fkp8pfyddXrF6J1I7cgVBBg4Gx7Pp8odLYBAf/WD7oHbMhanAG2wyn0rYqyB233hFe4ZLZGHZCTHe0MC9TP5ygnqIYcfn/KVgmewU0ufMxmD8iZb/7rLuEPqOosXNQNWjfkD9ZrUp/QN24wVh1J2Qy63WttDHj+uJ5USJ944ZamDPRu1p9moRW3fa/11MiVYri2exhMea81H8vpAa8ainbHm7Bh7NBZ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB5171.namprd11.prod.outlook.com (2603:10b6:303:94::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Thu, 16 Nov
 2023 18:32:09 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 18:32:09 +0000
Date: Thu, 16 Nov 2023 10:32:07 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <20231116183207.GX5757@mdroper-desk1.amr.corp.intel.com>
References: <20231116130321.3388111-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231116130321.3388111-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b394a92-9755-4969-bff3-08dbe6d257fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hrQOqfCk/7FMVagVVv0Ndpk5j5d6OZGoPJqtq4xlMK/H3LOh+wtr8JhayPA8Qyr5EkKuBfr5Fp5bZFvnDXu26XwRrBYzlnppgHw0MvKwiMaa3yIZturSupVAXuMRyPFdAnru9zcJUrTcV+chCj8vTVyFDbDTpPsLzlN3i4ps93MNvOnRFNby8T/ksjEkwztp870sJyuHuWIsZMusPDjun6UFjLbuMY3u7PYhSzia5WVU3MgYrj0mxX2tZfeZeVM7FEmZwjsk1a+zCK/CIEsSTBTienQbr+WPcpDnetDP+AxkslG7lwJyoAQzOn4hXnOYFdLM3C4kvJ39S2q/9dOPggGVsT8MSgNzTXw9Q6RcuOlCQCy31ICCxqDCxgNxxKrd3yoUnY3jHw65HmxGYSPqrQlRFaM04Id8ZLBRfMTEV2CEJMmblht4Jo4uhn7QhnUHNjQXBQQMOsUEFxhZCEKMMBO1mEAvjPiFM3yO9muiABLIKjMqLArFXViClVMzY5NdarwW7qE8hypaqX84mJGSGvJM8ed6HJvJFBkT5zsc2GF1KzjM86Y+UVjU/4V7bKQp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(39860400002)(366004)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(6506007)(4326008)(6636002)(316002)(6862004)(1076003)(5660300002)(38100700002)(83380400001)(86362001)(6486002)(2906002)(6512007)(26005)(66556008)(66946007)(8676002)(66476007)(33656002)(478600001)(8936002)(82960400001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3iG2sqLedqU5T7+BCWlMa1DfLMOrpeQGd0DjsEOX0RbuaXg+KygJARO11Opm?=
 =?us-ascii?Q?h2qqy6gkmMtJX39lcCPlPxdWIU4VMguFE6k3ny9QNLLeVMOjXz8D3GADMqyo?=
 =?us-ascii?Q?b/JgdMkNM6tPANyRN/hQzrs26jK69c37n+uBKaFL1rMi0jCiR3JUoiWo+q+0?=
 =?us-ascii?Q?8h4lKBGHXzse0JdLSWWexfTly3HixZ+Ngwfv2tqBHkm83gRjKi7CpEYdQZUB?=
 =?us-ascii?Q?u8Go/fetElIfGH5LLxCOgdwXB0kH/+bCQJBRd3Aqpf4kJ8pnwzxqW0rY6dKV?=
 =?us-ascii?Q?s3hYy9zCYTSMqTlfuWYNZtI6yz3rGksxy6q6sUbVIgCMbx4hYFt8yeIa4Q/k?=
 =?us-ascii?Q?xh1UZb4/VM23whlzFA67C7pr59aI/lbLlF7IXiKooVIxUWbN7egX07iiEfLF?=
 =?us-ascii?Q?HCQPmwT9FxznwhNM0q78/aBkRNBfOWvWTeHvj/tu+FN42lnGk2WbRxHtnWzj?=
 =?us-ascii?Q?xU05807vZN8/veej2Beuj7gPM93eP3TbDGNxn0gl+MBJfexOPDuQAilvF+v7?=
 =?us-ascii?Q?q8J+n+nhWpK5lfTSFdg9HxRYhQmQUVDOHES8ZZ+pNp6v3osmL3oO9jtyz6n7?=
 =?us-ascii?Q?KKeVWMH7LIJeQWSd3MEs5k85uwbB4zc9ZX8/VmIh5nXDIeWWr/c3YQMcBeH/?=
 =?us-ascii?Q?AY2qtufCPK7EgBOo95yxUkPMFw58tzhse17CXBLwPSBQpme0UIbjH6cOy4+i?=
 =?us-ascii?Q?updS24r6evLrmlrDISRKd4hAnR1kh0EyQZKLXdn24MnayyvH3CD571JUwAPL?=
 =?us-ascii?Q?M7X3eswcqcvcxA8y5+sQtBpHdxCzNs8bqA7BVbvuKgFhrfz6p4s9ZTOmu2Tz?=
 =?us-ascii?Q?H2Tzid9q1eWN4BLZqOIkrsGRHgyj6T0LOZfZ39KzQrAmPXD8CAWQDZCzjEN8?=
 =?us-ascii?Q?lzNDLkhNOz//L9FTkHICOc4wdDO7WAAhtauxfgzpb/znQwh9r/I4x265fyf2?=
 =?us-ascii?Q?gwfwSDqkvWre1QuXFBt9JApDlQXvFEHFh0vseryKhFEDMd4FI6bUz9Bgaaft?=
 =?us-ascii?Q?JkybQ+CoxdyixBeEExr5WL66zj5DFw54xdNkxv9Nmf8xTc04nX3tP/PiUpfn?=
 =?us-ascii?Q?kK9SlrQmF2aLPKM3/45DZDe2scgGhcUCAHPjtZS4VUYscloGPCJWpX1MjSia?=
 =?us-ascii?Q?bbm52eCoJqu5BBzRW2Jf9DkrA/+5VXrwxcIZ67VVvdTbLj6r+sc9bYy1YZvT?=
 =?us-ascii?Q?4vyfQO+n7j9oO+HKOcCtsWMuY/gz4kvv2thY3c9tDyvAJFgWwpTIIzeX+FRN?=
 =?us-ascii?Q?W2ixbdrBMt1S6yAcwoHJEgZUr0rSj6kGQkgm9dIEyBUmubV/YlqJr7cH5p1w?=
 =?us-ascii?Q?Ufw+L4PYkNGQkq148ESpqSQZL0L4GSNdYbhmCy8XQo6L0ozt8rbM14whlIhN?=
 =?us-ascii?Q?KLPKGGmZt1VTwbACp8CpMyelOBx8U9HYZZXsQOKobKt6qIqYbA/AMvKTKxIp?=
 =?us-ascii?Q?v20TmXwRunRzAyCEjiXMrMQskWWhpLjHEu1w0raKQt/5SnJ+RjQQGFsmQZ4S?=
 =?us-ascii?Q?EZv27CkGtmZdYUsWb3E8BDm0G6x2/aXhm/JxR3us8jJY27+hM4f2tGdNMH9s?=
 =?us-ascii?Q?duOSiHZLMgtWsDVNQSBChZuRrkRYuUy/FZDl86QngToyh+sJapc3o3c+tyi/?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b394a92-9755-4969-bff3-08dbe6d257fd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 18:32:09.8449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RKLT9jIf1T3/2imhpHIEeNZOZ9sO4+4/pZzm2qyw+w3EW4IVLx2fn83yWOIdau6D8fJ54NcKyz4ephxlnNMdt491C7IGrwUmPiKZHL2lTLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5171
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V2] drm/xe/xe2: Add workaround 14019449301
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

On Thu, Nov 16, 2023 at 06:33:21PM +0530, Tejas Upadhyay wrote:
> This workaround applies to Xe2_LPM
> 
> V2(MattR):
>   - Change name of register
>   - Loop for all engines
>   - Driver permanent WA, applies to all steps
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_wa.c               | 8 ++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index b57dec17eb2d..ff6b0207c78e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -121,4 +121,7 @@
>  #define VDBOX_CGCTL3F1C(base)			XE_REG((base) + 0x3f1c)
>  #define   MFXPIPE_CLKGATE_DIS			REG_BIT(3)
>  
> +#define VDBOX_CGCTL3F08				XE_REG(0x3f08)

This is misleading; there's no such register at offset 0x3F08.  0x3F08
is a relative offset from a given engine's base (e.g., for the vd
engines it will be located at 0x1cf308, 0x1c7f08, 0x1df308, etc.).
So this should be defined as a parameterized macro that takes the
engine's base offset as a parameter and adds it to the 0x3f08.

Then when you use it in the gt_was[] table below, you'll just pass 0 as
the base since the FOREACH_ENGINE flag takes care of providing the
various engine bases.

Also note that this register should also be slightly higher in this
header since registers are supposed to be sorted by offset.

> +#define CG3DDISHRS_CLKGATE_DIS			REG_BIT(5)

This line is missing two extra spaces after the 'define;' you should
make the style match the rest of the register bit definitions.

> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index d03e6674519f..aff92a7efa07 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -259,6 +259,14 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(XELPMP_SQCNT1, ENFORCE_RAR))
>  	},
>  
> +	/* Xe2_LPM */

For consistency with how things were handled on Xe1, you might want to
place the block of Xe2_LPM media workarounds after the block of Xe2_LPG
graphics workarounds.


Matt

> +
> +	{ XE_RTP_NAME("14019449301"),
> +	  XE_RTP_RULES(MEDIA_VERSION(2000), ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08, CG3DDISHRS_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +
>  	/* Xe2_LPG */
>  
>  	{ XE_RTP_NAME("16020975621"),
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
