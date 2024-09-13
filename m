Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F85FC6181
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 20:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0E38876A;
	Fri, 13 Sep 2024 20:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AOnoibi/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B39E8876A
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 20:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726260229; x=1757796229;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a1efqWwYZ1HBKBAiaC3we9fr61HsJq08b5+M2lfn6/A=;
 b=AOnoibi/KuVyxoVIif1a9ZWqWAiLbSkQ84HIG/brjr02nuX6kO7Qq7nr
 WmsBeE/R5DsmXk/scaOrrfj9eYXYNYuRaK1gjr/ytbEORG1qgKCUPVKKH
 9eKioUKqBRDQsUCNPBrBuKNO/p9ucdeJtjozomLBTciTsTj2DF3o7uGkN
 Qxuape4yZLvXwoD+Gp19e9nESu7BOZ0kUjjG3cvy8HFWzj/QxWScBz3Gd
 mVSElV3WLJpRc1RkULBUS8OCqbHl+A1c1UhiY5ggHj3CJ8QS596Sl09Gy
 +jCbPbRD53CcwZNGlGPE/3ImlAqAmqzIRXBThwrO5cImWvghY+nT4X1KD Q==;
X-CSE-ConnectionGUID: 53Sv7pFYTfmcwnR3PeixEQ==
X-CSE-MsgGUID: Vb2odOokQ4GMN4PLLWHN0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="28921387"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="28921387"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 13:43:49 -0700
X-CSE-ConnectionGUID: T88j+yqMRQmsgJXY9NtQlQ==
X-CSE-MsgGUID: f7LwMqhPR4WYr1WRN117sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="68052171"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 13:43:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 13:43:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 13:43:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 13:43:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F1vSpA0KqA6H0XWyjNjO6j50CC+50COIZJF4GacTPIZa6RFZVeocOBuKeHJT3T7Z5l25lGv5zwcnVvcnAPMXiFoITCu/g5p/KmeErfQgAYwGqbiTwWOdmCXYz7wITSHPVtRHvxbI95F3R2GpMswm6qN5WaGEXntwTrbFjCfKez7dobBU8fIC3qGGMzOIeSPdcARmQLhOAIFKsjRVwmi2J+NaLvUNDlfXUtbBpyEDG2ljsQVPMbL0oH3s67SvhQ5Tkqd8O3gQ1gOgF4crLgN+CTlZVH5E05s5q2LtAuvRI8f7fBlCJLvV+hZTRzdbBqD6Sa3g4oYovrs+mWFtLIac6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItY4a0uX9T9bRGswLWThJS94BSuSnjUI8ObPcYyjY3E=;
 b=iz4/feKVefiNNDDKIl1yG7coD1ZRFSy5Tn2qGqrjDEQaNXnCzjoJC4UjRn9lLT9f+SOLYVS1H4dND3HTlI9HtLX/y4W0vScgeSAh8vPssiVRzBqQ8JJTD1oACXvQyw2lZ8xbtu6SOlfJ+LPR7hmozNRgZWXk2joehRj71worFdSCvKpwz56CcdMLtzw3Lxk9+9yqe7ur8tRQ7m89YqWsQUxqN7PHLzmrM+SaU/ZtgN6KvQcq1aVnGcaRx2ZuBZaU7CixqhXDoAEX1fNC0KsSkzZk1dDzClNeeWMWM7ynsAcwkibjmNICqK9tmnJ6CFniOBzxLopZlINdu3fl5iw9hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 DS0PR11MB8069.namprd11.prod.outlook.com (2603:10b6:8:12c::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.20; Fri, 13 Sep 2024 20:43:45 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%7]) with mapi id 15.20.7939.022; Fri, 13 Sep 2024
 20:43:45 +0000
Date: Fri, 13 Sep 2024 16:43:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ilia Levi <illevi@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <ilia.levi@intel.com>,
 <michal.wajdeczko@intel.com>, <jonathan.cavitt@intel.com>,
 <niranjana.vishwanathapura@intel.com>, <koby.elbaz@intel.com>,
 <yaron.avizrat@intel.com>
Subject: Re: [PATCH v4 3/3] drm/xe: memirq handler changes
Message-ID: <ZuSj7wqeJ7RcBzuZ@intel.com>
References: <20240912085438.737015-1-illevi@habana.ai>
 <20240912085438.737015-4-illevi@habana.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240912085438.737015-4-illevi@habana.ai>
X-ClientProxiedBy: MW2PR16CA0029.namprd16.prod.outlook.com (2603:10b6:907::42)
 To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|DS0PR11MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: f552a775-6b7d-456d-56db-08dcd434ba55
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gfxtsp7sAAXc9V3v6dLaR+MgBhAAYlhudE+TZ5qS+Yuhf1PbT4elHhtlMw0N?=
 =?us-ascii?Q?ovzSe/42aL1LVagkaBLcScKBo31l5DmiYUAxC9LutTbO7x6TOz7CCIfREBgW?=
 =?us-ascii?Q?0JAjJ9AGgzAucNzytIMZNsULw6AnOOsVH2XaeoX72nsvCdk1sULCUp3JbKTY?=
 =?us-ascii?Q?mJKGyF4MG9ycosoQm0pznUSLLZeH+o/RR/Rc7Rt/ezGatHVneKMpkZeLVgA2?=
 =?us-ascii?Q?44qFucO7edxO/FNfBW0+EPMZ3fJzNDxy2pryLw99TwDxPBzphEcX6CAO9pfn?=
 =?us-ascii?Q?FFwIRreB+fXyPEGOXYNA6qpXwx2qa2CXzRscYF4FKRKLDoN5ZUmbkLzcomiJ?=
 =?us-ascii?Q?xLpwKoNx00EOyVGNUyOFce94IxIkMagyhIWrPQJkKKOaNcihTZUCNJ1ZTj8q?=
 =?us-ascii?Q?syyUhavb/Yw4bhFvjyMKHHJYdU0xX1zyVDWfC86D8Sfhs2kU/0i2XQM0rNg5?=
 =?us-ascii?Q?4uPPz8eapxaXmdQjQfXMeAWQB11ZpCXhXT6ZDc2zz4NC6/d02YjpU0buNHBN?=
 =?us-ascii?Q?21TP744aP8aKABC311F418Lq2xPQsAPJHXnbmiUMIkxanrwKJZbapLJdxi/7?=
 =?us-ascii?Q?J3wb/WZOrbyTu/pRQWItrYMXsR/+PBkiQtzCo/xcSgqVj3ZmhJ2OawBs/Jrn?=
 =?us-ascii?Q?ns+CkTDpmO1V3sDhzXN3MFFT7E1WEi2UQtPZfmFGC3TDDzY/uNoWIpBpd+5v?=
 =?us-ascii?Q?F8Pa9un01TJLtVKnWxEMAQU1F4rzbEumFABb5pa72h/V0lVp2M+IAoCwcrqT?=
 =?us-ascii?Q?CKLvAos0RQcVrcj5ib9jSE0KlGhrPz7GA4sDkyEhhpJlX40SA4fmr7JKDjq3?=
 =?us-ascii?Q?fq6RDneDsELdCA0Ga1o8+q0lRb9NDXg4d/9NNUlh2Pq1VV13wAgyZK2pCDDl?=
 =?us-ascii?Q?htutOdRsX8SHiUFEzvxpFNfH1lPtPvhGOnoYsYI2b0aMOebGsLeYrDIkcHce?=
 =?us-ascii?Q?r5hsFIIjlhxhHbIuGcIAYK99Gw4Sir8PXrVPn7QFJX9H3seQ0YhS2tXrLyR3?=
 =?us-ascii?Q?iuDkyN5Y+srg+QRN8yUXvsWqC6Qw9H8y6i6oSoKaxXBHODJo20+rTQmxwTIk?=
 =?us-ascii?Q?gVs91+vsEetg0gulYRTWc++uc6J9uc7sXntJG50kLAXJvpGDLuaSSCzVcSl+?=
 =?us-ascii?Q?7e6sT7kluvWtPrKP8lM+gFMoltnAYfmp1zUBjL0ywpsnQxNqTzGDzArKj8M5?=
 =?us-ascii?Q?VWsFkE5LDHihGan0vQYE9+20R8CCVf6xQHZUm4lVskRIissjQKf7r1xVswmH?=
 =?us-ascii?Q?WeJKKbg9d+QSA7tuYPAm6BOM5ouqdofz0gaeKYWRX3ZXuhO0nBYarAS2Denp?=
 =?us-ascii?Q?dAcRf3sX4+4/oQZNUlclRGXAHGLp8BPqamIpa5qwrhGp3A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zs+9WlGKIAChj5QiiDfzUoj8BKc0wQNP50C7w45s9K3erRBhXSGLNESJOJtX?=
 =?us-ascii?Q?6mVR5nhEyTtlCtt0booX/xec6V1V0unXZAVD8YJap+KEuX3MCBiO1A8SoUge?=
 =?us-ascii?Q?RkN7qv6V2ecCekJ9xr0s0x/4wC5rUEqIb2t0AvXxx4kD3BUKnVXKwAHBELIj?=
 =?us-ascii?Q?+S3/RYZYRcdc/oeeRB3Cw83GIWC8f/V+/j5EoXVmcdLGy56SCyveLq/+TvAi?=
 =?us-ascii?Q?xAksUSSoBrkvPhvwJw7998icVY3ZYuHt+VgNqD8HSrh6SskEZZHpJhXWFZnr?=
 =?us-ascii?Q?C21JzE/hWmD9U24xdRWkTqRPlE8r3wv/XlgxwDyfWuRFn8J2IrFLwWBZGk9q?=
 =?us-ascii?Q?OH+hw1JA67XzyM9lUapwb8SdgSahIf60Sof124Eqiz8CxhfZzwuOGBAm5hRD?=
 =?us-ascii?Q?QIgSZEgR9bDmEFR7PEvfPqqvqjrW9v4/U6a/qzmCdKUfw+YkVaGGHyC6dpXa?=
 =?us-ascii?Q?TB46dOHJIYpNGzBhqNxgBfqipqK/HcP9cLPCNOIYhgmbEiyQ8mzTorLER+ad?=
 =?us-ascii?Q?i2Le66osxhhtLre199tsdc/Ue472doap9dp5aT7G/6gMSdhmZdPmq6NNrPmF?=
 =?us-ascii?Q?lPJnVTQpqjzG3JUnVaLJvRp6t7yJYyCC7Y2YWGPhYGBooKNYlMQp7DXGsO6U?=
 =?us-ascii?Q?GncRNfHzWzQ/NZjSGnza/cueKutjSmHl6DaUuJYy5W2mHja2y6fHSQRy0ziG?=
 =?us-ascii?Q?83+13qEbY19+GR+bqWueFgWIePwFc5+mwelFTe/eQBeL+d2bBOfFh/7zimaM?=
 =?us-ascii?Q?ppdI6bYzZ1fz6v+nCV9Quip/AHJysgFDhWD9ohd0gEeEnRTsKPStjdmidiIP?=
 =?us-ascii?Q?Pt5PuUPSAFJEOInxVx723rHKAHXiPldpQ3poT31kQMiQGEMLsWa1XwLbYvbn?=
 =?us-ascii?Q?2T+P29rVMtOzW4k0/qhZ49Ph3fZz27zxebJvwfVwMtO50VGXNuQV7BRfq7pp?=
 =?us-ascii?Q?+2Rg8cExYuugS54h7ICiocDsdN73lpSoHWhqtrnjOUjP5JZ0pt4TEDWjquXN?=
 =?us-ascii?Q?MHxTET4bqtkQjd3cM6791qLr0oof7ba+OnVBnTOSwml8mg/Guht8rX46s7ao?=
 =?us-ascii?Q?GalCSDhAs+rvlRC5tUbyisqRnlVFH5MR/gJaGr1XhKShspwbnQVexNFnwW9Y?=
 =?us-ascii?Q?jlVJ17tAJwv7hUQ3/H5w6LE18uJDWCKCP4zh5ImdwirHExdBAlOSIKpS14Uy?=
 =?us-ascii?Q?ReJeHBae/qUyPGvVibzkTHG6P7fgs3DpzcCjg+eQTJNuAUdXT8y+gbc+2F/u?=
 =?us-ascii?Q?KlfCoFjWuOiDqy9NG6SBDrRKJGi0xPKcQBlqhxTJendBRb+TeUdk1Em49bDq?=
 =?us-ascii?Q?KkIaS1TETHzniJV88GYnzvmriuV0+D49TslFfFWkfZtfCyuNANrqTJNfG5yq?=
 =?us-ascii?Q?Iyx+tOuVU16D76eF59gmznlY3PdI9+8UeAubjphZCCLRAEx76CpK1j+XzIJg?=
 =?us-ascii?Q?gIZ4tkhmZeT1G8iTLY+0DVijsYeRUneZqktI3lRTEr4dvY671wd5ebZC77Ea?=
 =?us-ascii?Q?U3blMYuuEwHyWIp84Uftvrrp6JsasTLAB8+a6XHI884gFAkwuUDurSMc3yYf?=
 =?us-ascii?Q?Qc3JgG2Q9VjuT54FGPNHJPWIGYgn/ltlvO82cK4XPsmwwBL+FSdfVJAq4PAB?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f552a775-6b7d-456d-56db-08dcd434ba55
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 20:43:45.6964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a74/4gJ+2nCqToOImQ1pMDl3g+hydWYnX6kmbwEEYkoG7/GyJKjmkqj1RfviBxt/eVz/DIDYBvEQHVrG1rqmRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8069
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

On Thu, Sep 12, 2024 at 11:54:38AM +0300, Ilia Levi wrote:
> From: Ilia Levi <ilia.levi@intel.com>
> 
> This patch exposes an interrupt processing handler for a single hw engine.
> This handler also caters for the MSI-X mode, where the hardware engines
> report interrupt source and status to the offset of engine instance zero.
> Refactored code to use this handler from the VF use-case as well.
> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Although they are all reviewed here, I'd like to get
Michal's ack to get this in please.

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 19 ++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_memirq.c    | 31 ++++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_memirq.h    |  1 +
>  3 files changed, 43 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index a7abc4b67e67..5e82ebb8eb58 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -460,6 +460,20 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  	xe_rtp_process_to_sr(&ctx, engine_entries, &hwe->reg_sr);
>  }
>  
> +static const struct engine_info *find_engine_info(enum xe_engine_class class, int instance)
> +{
> +	const struct engine_info *info;
> +	enum xe_hw_engine_id id;
> +
> +	for (id = 0; id < XE_NUM_HW_ENGINES; ++id) {
> +		info = &engine_infos[id];
> +		if (info->class == class && info->instance == instance)
> +			return info;
> +	}
> +
> +	return NULL;
> +}
> +
>  static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  				 enum xe_hw_engine_id id)
>  {
> @@ -479,7 +493,10 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	hwe->class = info->class;
>  	hwe->instance = info->instance;
>  	hwe->mmio_base = info->mmio_base;
> -	hwe->irq_offset = info->irq_offset;
> +	/* For MSI-X, hw engines report to offset of engine instance zero */
> +	hwe->irq_offset = xe_device_has_msix(gt_to_xe(gt)) ?
> +		find_engine_info(info->class, 0)->irq_offset :
> +		info->irq_offset;
>  	hwe->domain = info->domain;
>  	hwe->name = info->name;
>  	hwe->fence_irq = &gt->fence_irq[info->class];
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index c590dc0dd9f1..f78240b05631 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -404,6 +404,28 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
>  		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
>  }
>  
> +/**
> + * xe_memirq_hwe_handler - Check and process interrupts for a specific HW engine.
> + * @memirq: the &xe_memirq
> + * @hwe: the hw engine to process
> + *
> + * This function reads and dispatches `Memory Based Interrupts` for the provided HW engine.
> + */
> +void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
> +{
> +	u16 offset = hwe->irq_offset;
> +	u16 instance = hw_reports_to_instance_zero(memirq) ? hwe->instance : 0;
> +	struct iosys_map src_offset = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
> +							    XE_MEMIRQ_SOURCE_OFFSET(instance));
> +
> +	if (memirq_received(memirq, &src_offset, offset, "SRC")) {
> +		struct iosys_map status_offset =
> +			IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
> +					      XE_MEMIRQ_STATUS_OFFSET(instance) + offset * SZ_16);
> +		memirq_dispatch_engine(memirq, &status_offset, hwe);
> +	}
> +}
> +
>  /**
>   * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
>   * @memirq: the &xe_memirq
> @@ -431,13 +453,8 @@ void xe_memirq_handler(struct xe_memirq *memirq)
>  		if (gt->tile != tile)
>  			continue;
>  
> -		for_each_hw_engine(hwe, gt, id) {
> -			if (memirq_received(memirq, &memirq->source, hwe->irq_offset, "SRC")) {
> -				map = IOSYS_MAP_INIT_OFFSET(&memirq->status,
> -							    hwe->irq_offset * SZ_16);
> -				memirq_dispatch_engine(memirq, &map, hwe);
> -			}
> -		}
> +		for_each_hw_engine(hwe, gt, id)
> +			xe_memirq_hwe_handler(memirq, hwe);
>  	}
>  
>  	/* GuC and media GuC (if present) must be checked separately */
> diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
> index 15efae2a7a55..06130650e9d6 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.h
> +++ b/drivers/gpu/drm/xe/xe_memirq.h
> @@ -20,6 +20,7 @@ u32 xe_memirq_enable_ptr(struct xe_memirq *memirq);
>  
>  void xe_memirq_reset(struct xe_memirq *memirq);
>  void xe_memirq_postinstall(struct xe_memirq *memirq);
> +void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe);
>  void xe_memirq_handler(struct xe_memirq *memirq);
>  
>  int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
> -- 
> 2.43.2
> 
