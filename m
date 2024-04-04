Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00779CD1292
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 21:23:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B49E10E714;
	Thu,  4 Apr 2024 21:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L8PaxiQ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62E310E714
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 21:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712265786; x=1743801786;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4qEl13QPQPAnSF53YsTF+LmqRaw9TrUN+bYXjwyCqLo=;
 b=L8PaxiQ5VKYamzU2/WHbN2LOTL1qyWnnMbrJsa/I5DY59qa461ouuUpi
 qj5ri0kQRfob0exh1ahL3tQse58CKMfYp0blLoVVbtAkNb6IyFdV9crsI
 1adxnx7z7YN3l4/avUp9vhx7Dx7ERmKGCKXPX7giXi3Q/oWEWqyh9DhtC
 hgrbBKhlqZRa3TGnuNdqHXW2r/OT7IPB8rQJhhU3ximHj8HbYk7qvvcRF
 Xro8UOmcWM+ABPlHo2QgouJlsCkuQgqMB3iidunDIPUQEaZjQmHi/L7VE
 149bCdDEtclYxDWwlykYjMFZqzuSqR3r4AbujEYgHGAx6izpdZjIIsqFy w==;
X-CSE-ConnectionGUID: QaBWnP1kSB+cbdC4MBBNFw==
X-CSE-MsgGUID: TPCpjXKNRHGEWiJux8n3rA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="8158678"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="8158678"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 14:23:05 -0700
X-CSE-ConnectionGUID: ooSfifttQJKcIk0uvPBmXw==
X-CSE-MsgGUID: eT40GYVfSN+y/SNTk5aMJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="23608984"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 14:23:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 14:23:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 14:23:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 14:23:04 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 14:22:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msZx57TdTCfoLYwQS3/077zaKMn1OqooZvgvyxt+eQWlsosa+fBTNoTP2+2L7axsvXG2KFjeVxxnnM7u4MFKbnRojHTFN2evqu5pRJPwFl2/uogsUXEDzjWLwStj9uj52eVTSETxne3dg88zQlI4qZ+759GBC02mZeDvey/z6dOff+z80eVT6ScEjxYiGZDvTrtLJFfCfodL0YOnvPLlFlr5Hg6tKYrReasETt4b8a9Imxfb5tLMRMR45rdvvEdE+ax1JI5+46wZK8mG0rFOtnguc2e58u/eLDsapmQE6lfw8MzPQ/IIpPeJHTEDiPtzLraX3sMy0majJ2NcPWCCRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7IkDYwPFQVuRiMLcgW1CnXNt9Qck9mwVmnAJTGvaZnc=;
 b=Ty55qDBa842FVeJDjK7Xe/bBybhinZD13q3oJUjUUDodqrlK7PaqFPumvLh+tbox5iCYpRzBq1Dhr6V6k9tZ35IswhyqSkRZBAuJA2i/IonNfU3eAWDGraPUkqda7fmwSvg+Vn01kJt7/8IaCzWTxL0dkgOHGvVwIuxnIyrfwsxG5cPwTdO061YwddmC6Fr7TZ40Qya5WyczuBX0NKemqnGL7tlFt9G1Eui5UGdfLri/zAZMxy1oJHxVSP1PBAH7lgEaDVDNQGrLWzxoI8FSGILkR+sAlQpbV2Q7xfRsOmz5xA4pl0Pkzzz7CyoSHy8EICwSKh7eZRHH2Lw1658mlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB5207.namprd11.prod.outlook.com (2603:10b6:510:32::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 4 Apr
 2024 21:22:20 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 21:22:19 +0000
Date: Thu, 4 Apr 2024 14:22:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe2: Add workaround 18034896535
Message-ID: <20240404212217.GV6571@mdroper-desk1.amr.corp.intel.com>
References: <20240404034331.139854-1-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240404034331.139854-1-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: SJ0PR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB5207:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YY/itskIvml23EYA+zgBrw793IHop+G7KD/cRimS0bS4TNj/NKsyoFjjy4lqg6nouVbfK/mNUCkWO5kqauY+iZcEzjMAgFF/nhgTNruG6sz4a9M0/HmzYFWxjJ8O4AL/Ec1cvXzljsB13RDOx8yxMSMEI3HE2dg7dgU7WaaO+rimCZLi+xotMPTa7dQF4dwsYxfR8U9wMl/rvykatYerXz9xShBM7njhR0o658kWNswshTlgkcg0iRhYOOhs0PdbgxqQftceBeVLGQ1yf8mcnKXChhQXLFBLhpXvOXQ4KkzSqpKBy28i2CLfDcQg4OvmRKZZp3b+u0q1EaQ5P21DciNLrkoaMI+DvB7BQbC70Acz3lqOT4m3Tn6CoD2KrHtYhcY18oZTuOOTvdxQA4lPq/pshXb4F86gBItvzNbEy0SgxIx0IZsDtpFYFDkXpP58QaaqlIft6zVFQGWs/v5ZDsFsiJ+7vv05enqgRGblAlUYakT5gtnRQ0lygqZuAB8SXDtNE8vTQI79QqsEw7bCkJ+QJtnEtHa5LfYu7+uALmh+cS/48u4jpe95/yQVIEMRr+XIMAew1MVIxOd0FRFoMzqd9+xzW2adIrfQXZO95hGzHDfq564OdEEqB5gY0CGHnFRVo8WGXNezDnHZD8wIxpe0vM1+uU//0qjhqcxh+6M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tP+OJh3ocgV/BXaXzdS60/Xrg34y0EMOUV9+/5rkHKgiscINXP7jUQg7Z3HG?=
 =?us-ascii?Q?K0Ay9mGO9vyd05dSQrlikdRrRYKxsM6cVPQkaqdsrmWhDH5jlVlUMVAxGm4M?=
 =?us-ascii?Q?CRevIe6AxIrU/OCscxqhm9qNdhs7r7Q1rW8swCIt7jb6wDsSebqFfNAPVF95?=
 =?us-ascii?Q?KNDgUpZDcVZFZC+En7jrBX8o6E/pItu8ce89ssX0upKE2K/u+9i1LBmEwKIw?=
 =?us-ascii?Q?JaQsmS2lJT3JvAT7Tdi5XL1TCqBlDMs+DLs5Ni2HS2hWbnFXRWdUatpGHkAT?=
 =?us-ascii?Q?cZdb+uoz62wdmNYlCvfcpMvW9Z2K1iO6WUO+7S8jhGvCQbxco5PZYKcu44nj?=
 =?us-ascii?Q?9LlfYfd0TF2tRy6ombG3LQBb/IewbbpLUQYnQAIm6PoXhhfMJ2k0dmL/K0Sh?=
 =?us-ascii?Q?2+aOW5VOGS2gCiAsWYCCapArCf3+MdOdqGvxpOnXh0D3MMM6MAQn68fIzBjD?=
 =?us-ascii?Q?M28Teae+TxhegWPo1gfVrn7gHzsUykpMvVpDPP3XeL3G3/wlCg5QCMjnasFO?=
 =?us-ascii?Q?nsdImdEifer8TI0lTZMbFSpxrSvs5CSp+uaoVDBX2H3ODAt6JcogYtx5fC0Q?=
 =?us-ascii?Q?YCszjHMdPN7j/P1JT2dCmUkTd6u2kZg3qaQy8QzLB/NHJvLWLM8sKQLPxXu6?=
 =?us-ascii?Q?XJimyJVEZAJMVH3yb/GrFywH54wfTUwBLeCAPVzztdtAfc1GfTtRc373+j9K?=
 =?us-ascii?Q?IzDPjZ1dUzG+32mCYmCKbt9877OapSUKbcpZaxWHdsjFdW+mWSyv1Qx71XqF?=
 =?us-ascii?Q?PQYdzUlAQ5WxAsrWCD7KvoNRQtN3yk/gDSwOaxU/DIQRqSKG7QHZttn0I7qU?=
 =?us-ascii?Q?X1D/jPt/6flxKTtXDNHS1LRWFZWY8HyhBs1fScQX95kjF89NacWBt+WBrv1s?=
 =?us-ascii?Q?1JktBujIlA9Tp/15fEdzSR43DLt+b9f9YdGdLeMrZIljDVLiSF8hbghCo2VE?=
 =?us-ascii?Q?cTJQ2cm5Seec/9we3d/qMz+HEQKSSLjowijNC8V+17+knsh/OiBvkJjFeI9b?=
 =?us-ascii?Q?rrh22byUNGjS9HiUQmybL/0hmbACzTKDZ9D2WWenT6E9AkclAjqm3yUr+0VC?=
 =?us-ascii?Q?NvQSTS5AD2L8lTMRH4Nq7nqtNohPg+3rc1P8nIO+w8gyaJGvxD1MgWi694t7?=
 =?us-ascii?Q?kVk9eQGZPsb1e6VS6hFyhgQjD1ZUQDRp/3eQAyyIcCxk68LzP7jfhPT4UiNV?=
 =?us-ascii?Q?QssUJCoVaXUh+iZnQqkGDu94HrXRwsCSsT478vZx0QkL+HQSpoWqegbk5qhB?=
 =?us-ascii?Q?LyFzAuZ3MtwPXbT72kr7jj5baaXatiY67vih2zkE27P9hxD1f9/vipVT/9XD?=
 =?us-ascii?Q?ldLCSIVRwOq3wsNSKZ1peUNKiwa/Y8WGLcNyfHi7uqAJYnYhZfK5/VGqxoT1?=
 =?us-ascii?Q?pDIImpIQ1azs3EbQfBZnBN2iE81eDQxtbzGTqB8CJvTNfbFzGncQm+dHwmZ/?=
 =?us-ascii?Q?TlJnIiSLLgp0pzXiKf0F+t0WVJpf2H9loEbpOh0TBp3y/odThPiYu6LfL6B5?=
 =?us-ascii?Q?qjN9vV7HICDFSB8U3QSX7exV7wR5TG0Jz8MtBwkiqHgO/YUXHaK2pQ4jDSII?=
 =?us-ascii?Q?5Rfgz+5GFt8TnGZRBgFZ9oze+MFZGhEFDb3TNqF5uiYeZ4rKJrk7z4h1Q+cp?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7d35d1-07ee-4808-1de6-08dc54ed4f6e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 21:22:19.7979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNGFN0zMYNym7Dc7RZa0IgxUKoCer+aJM4Vg2VPEk6Gmz3BESvIceNdZZpY7A2ViIXS1Oy+akuQRoe9objia4zVGT6QjdxASqYydD7dV2KI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5207
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

On Thu, Apr 04, 2024 at 09:13:31AM +0530, Bommu Krishnaiah wrote:
> Add 18034896535 as driver permanent workaround.
> 
> v2: 18034896535 and 16021540221 are two independent workarounds
> that just happen to have the same implementation, hence keeping it.
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

BTW, it looks like this workaround is also needed for Xe2_HPG too.
+Bala so he can capture the version 20.01 version of this workaround as
part of the Battlemage series.


Matt

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 74b33a3845f2..55d6eda65aec 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -428,6 +428,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>  	},
> +	{ XE_RTP_NAME("18034896535"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
> +	},
>  	{ XE_RTP_NAME("14019322943"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
