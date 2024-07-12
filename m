Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FB0C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 23:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABB710E14A;
	Fri, 12 Jul 2024 23:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FhQH2uZ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F7210E14A
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 23:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720827997; x=1752363997;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sQHEo07pTkLZyeSbC6hnMZbu38hav8gC658V+Mheotk=;
 b=FhQH2uZ3Xg3gLTOnZU+U3tXUsCpGw/v05mf9/aromxjzNjl8XWMI+Juq
 jdzWfWF/D3ebvhxveKwOnjAPTzvCBf/zTx4X7Y3kaheyyXn3CTFL2H6Gl
 L6N/nXgoOgQer4naKO7qa12HeL3hr1SdBwruZI3sSpcgMo+/KU0/Pm7eH
 HTZ3NbAcqqzafBbNGR3OYEoay24ojuMW6Oz5ljoxiARgwaYbhMmLJ1rA0
 x1NTWU7F7q7jgmNZAfPxGVH9NFwO6auRFZb2//uVUh6BwBx3xHuRu+wnn
 ybCm3aFGv6fBSKzfjSJuEQAzdEP6SiD55CoPSNi7RNgpjfpE++zi6Mxht A==;
X-CSE-ConnectionGUID: JGWhJChwQsGIQ2olfZ+7Ew==
X-CSE-MsgGUID: V8gu1A+SST6bIDtyEQtMSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="29435635"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="29435635"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 16:46:37 -0700
X-CSE-ConnectionGUID: TnveHJrhTVi7eOYM0r0k5w==
X-CSE-MsgGUID: zI5lN+1sQCKgMrt85SYcXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="49004927"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 16:46:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 16:46:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 16:46:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 16:46:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 16:46:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6+dGFQkphv1QadW2xYlQ6Zbd8P1YJWatauv3ndwXNqZwtGduRM/CWjaW12AyvCPje4jvyyQvqNvcqMGiHfIB+UgjV3o9LY8vi3B6gavxpZAmlQrp8SY/yxhrDVQHpI7+/gX0TPqRLNA2BbucQQoq3rFX/KGn7rPetDcGlkaqDesDy5mb8g5vuvh+Rwq1ad3YpyoqvT6mwMsTLd5jf6BakWt/QZ2ofollOEfXFOA8W7iLQWclRZ0k67ViVOibuYfeCpWLtnNfgifCVR7Ro3wWzRtBLjzro3RVuNJ+wURc+fL+wEpTYJSP2q5JbQYeU7Op95fGc/mRqrZM2n2sdvaMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CO0xa29zsS6zdFwy6+NhcmW7mLHA3SHt33jEO7Mlg7w=;
 b=i1Fm5jnIngGvTqQHzHM9uOPkRPKAgYBWyvrsnReVn6+ne2+wQISpN+RGAiE85aKP5zT5shPan5wyPie8gKAnmGt+f/NaDzLEzqPteF/pGgqF+gdyAoHjmxyl1upRkKwDYAElL+Mvs0w4mL/eP+2AXC16SjX7SV2n72tz0vfICwkmZGM3e4mqKRDScb+i9Aq8L69B+4OmVy33CH2wnlBEE5GTpJPlfuqsuREk8MYiPRMi7FZRerZ3kTtYS0vT9yqa1uM7v4ZEzWhk0we4BJ355TLrWxLDIWf9MGrSVSUUxMxBvgH8y0bHIvptBIBTkdtDTdj3ESeTzS+jTJ6vPtZP4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN0PR11MB5987.namprd11.prod.outlook.com (2603:10b6:208:372::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 23:46:32 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7741.033; Fri, 12 Jul 2024
 23:46:31 +0000
Date: Fri, 12 Jul 2024 16:46:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH V5] drm/xe/xe2: Add Wa_15015404425
Message-ID: <20240712234628.GJ2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240709155606.2998941-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240709155606.2998941-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0162.namprd03.prod.outlook.com
 (2603:10b6:a03:338::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN0PR11MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ada50c4-0fd8-4098-5a4e-08dca2ccdb1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gLcnYuUYBW14FsxsAEYQIdSKFJPF9O+OyilnoXp4yn35PCVYuCbEgA6QF0rS?=
 =?us-ascii?Q?NAuKV1e3Ig9Qa5tRP7Jpt7+9PUZlk4Eqo0T39s7ONchiyjG1KgSaNhIovh7I?=
 =?us-ascii?Q?BQC5CrZeBroLxoV/7aEeHbtbfGokN/PxHTx1iQ1wvbQrI+atZhrE9yj/zyEr?=
 =?us-ascii?Q?0d46S/HpmIB7vvA2TDCxG4a2JFn76Xv5jjHPB1wt4KaSeCqukyuFhrZQmR5H?=
 =?us-ascii?Q?HEacSt8JEKWPEDxDpT3KhASAq/aNpIo3hjudjyNVEszcc+f/+2JKMXEuWa8O?=
 =?us-ascii?Q?t0BpjxBKIiqNIFlPbzw9D9qK+E2egQdY8oU9D4w6RG30rWWH8G02noWOncUX?=
 =?us-ascii?Q?8ZsFwIUO+4WEJ7QA4MngOBZLGO92bEolgS8QRp5sZI8hRLBknkGxRFAy/Vh0?=
 =?us-ascii?Q?a6Z6GPv1DPGXwwIRkqmBl3ZgfAjUMJl/fPPzFlDXENS338/S8pru8Jpyu0rk?=
 =?us-ascii?Q?a3kJ05KYeK0g6zhcTlxU6HbFHzi4Hfr+SAh90BRJNU1KCcpWMieRtdXy8zZt?=
 =?us-ascii?Q?WIdENo8Q40rhqkeBY6TlpGblLSp3kHNWzohcK4JxKeVp9wbZxJi4A9tGeJ7m?=
 =?us-ascii?Q?UYbcWszh74ZErgLpBg1938KGy6gZ7MTxdiKrGTq6C7AQM9n9N4aNPha4JKIO?=
 =?us-ascii?Q?zqJrM8IbG3HUZKobTSiGPnSjDmniC/mu3I0qZ+uoeL8bHPbzzBqO9DYRymQD?=
 =?us-ascii?Q?6wFTKdE/x1OKV2ZAWYuvWm12vY6D3O0KcHI7NKM/OxWA0w7MSaa63kOPdOfa?=
 =?us-ascii?Q?mHC0Wlyxi8qPxuXwUn3s5GoX8/9ozXtqjaV9gjNuSJWlQxWbR1/jn+XiflJv?=
 =?us-ascii?Q?AkYDM4uZ4CVuEQMcX/E6UY/eCIKlj3luBBNYnX/Uh9PIIE3zNLEcF2JRKDlD?=
 =?us-ascii?Q?b82MmPCdmKYAnXshT1ZgArSqRNYnHzdKc05vuRJmq9rl4JTyeFtedat9R+mw?=
 =?us-ascii?Q?94JYIPtNBq3uxOyONKnGg63dG4ZtTca797XYZ6Av4FAZPND2iRLPXmy3rIvf?=
 =?us-ascii?Q?RcM/wde1JWZge4g7VJJ02v38tNjHakKErnHFAwJK5xufW3BsL+oiCmkiKT3r?=
 =?us-ascii?Q?0mHLdYtelNBKqUzSyPHPs5p5ChaC/tJH9m87DqMZPG6Dp/GrUQHercTikIPm?=
 =?us-ascii?Q?H7JG2wS0IR5XtfjRTFDVFv1zwyguCgn2uFtuXhoQqesrw9os1mL20EAYAKzc?=
 =?us-ascii?Q?2qxY85OMZyMra4/Hd6qgaaTy2Don8UoKvk66Vrh0X6sf/OH62nBuArtO3TtX?=
 =?us-ascii?Q?Fi9gGAH5uih7CANIAN0IaYQZR3DGob7q32/rv1uTooxMOXfOjwIf+5jSSP0X?=
 =?us-ascii?Q?Co9wUPZJS2rsGZk1W2ZScCHyZeeieqhJJGFZNGsQCTDflA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uOVVyzaJ8NcpVrHwfB0MLraeib6fcMOe+moBHPBIbYkUCrl48mXjC7xZ0FSv?=
 =?us-ascii?Q?ieRnLrzgoeR5c7/cdSGwKm+aokgHOu7X92qq7/Saa1/eQ7t2fGiyTllv1N4C?=
 =?us-ascii?Q?MxUX11WSVXn+LHcfFAh55uyVlYaPUjSOcwBRVydQZU7j6dun4tvBi4aCeLRJ?=
 =?us-ascii?Q?FZRZjXmYnVXmvZxXD7SebLSU5fc6qYWwBxYus1BmU8ZWu7Vpd7p4I1bT3Hm2?=
 =?us-ascii?Q?bEepMKbU1yCXWEvWyhrQt+nOg4ot7lokhzPnaURnZnj2TWFSlv7hlACVsQ5B?=
 =?us-ascii?Q?wCLPU1RaTUU2GpOU1wjs+PtMROQegusuGrlR57od59Bl26zc4AvKXfpCJZ9z?=
 =?us-ascii?Q?DISVKonwf895U6QCjrWAKLJ4Ak+Se93XG1zXnGBud/ivnyLqz7eMrufWrgYQ?=
 =?us-ascii?Q?X2cS1FulRIAQwuHtyyo/Fr4VdH4rDSZSzyQalhB7Ra9SzlCVY865GV7RfmWF?=
 =?us-ascii?Q?2NrFZvnSOMJkcwN5rjIlhwEARyTT2RI7vEjsyUXNVSya+Pvkq4TzH+d53Fgl?=
 =?us-ascii?Q?aBsug7iOJJ5f28EUo5TfK2nfJs2JUUWMztAWPgAuarD+jWI2NAPSg1ud5hw2?=
 =?us-ascii?Q?U3fe5fZf+w9reyI5INy0cICAGZg3R5ci2RLrnBhvsoaynTOzinpk8hQUhHEf?=
 =?us-ascii?Q?fuWaiS+vku2ybBBRpaDH/YdsIM7ZYr/sT9DFgVV4UayOt4xrNImcvDZJo6lB?=
 =?us-ascii?Q?EnS6Ag42cGaN/5rmTl42MqRpuy6TCLsiaYuP4Bju+RMUSkV43yLwWqPgpcIT?=
 =?us-ascii?Q?+VDQiSN4ij9Ue3bi7O8feYUvfVDXSTWOwo7jiV+AbOcsZTtZ2DJiF5w9+v4Y?=
 =?us-ascii?Q?Xlwdu+4aeZO//hm3w78dsLfFxwNm7CACu0bMrOUunwLkHMxRyyR3N+M2fJJt?=
 =?us-ascii?Q?c4EOB2pGs+Pl684djTuBiav5vyGUx3JyEC4faXffitfadOTbHjBRaqpPJJp1?=
 =?us-ascii?Q?iEn9buLo0uey1FOj7AgTHvUniqXSBE4fWDn6VkA6xo05KBec332MKfpcW8P7?=
 =?us-ascii?Q?B7h5MEPjzPbzKic6B5nyr0aabecbzCVO+1b5gxy5bwTvKqK0HQjW+p1UZ2OC?=
 =?us-ascii?Q?Zv7N4Ykwz3vw7fkveMYat7NpOQvfQwHWrveJzDEevyLznYoOVXBRTzt4AoV8?=
 =?us-ascii?Q?Y6xXlD6m0qI2UnVsA1kMp+Voyku0jtL+DSMZKiuq2BT46Urxaj0RAEGsh4NN?=
 =?us-ascii?Q?BEZMO3/8BVlDU1LwPuXLjEM4tvkYoeyLoWfml+VkJBhzHZcjb2CEqKwSMg9k?=
 =?us-ascii?Q?XgswB0GdJk20jNcUPd0Em4zljf32WtHBzS8OgqOVpSrlHvRWwgAhA9P5fuBg?=
 =?us-ascii?Q?KZwY0Un1tUXfr8z6Mptdw+JUTSoRyHGTEHnZS4YYN6gIB24sOd7wYIE4ILKh?=
 =?us-ascii?Q?ZTWwBYkMmb98aPoEWiVQ8IcFosl76GBYmwRlLO8hu8hOH/LpTgH/Y85LABFs?=
 =?us-ascii?Q?6dQ5gf7h4BpLCDTLY1QTeMURm/OFSPp14oSXCcqFfDY0W7B0xoU8P2TZj29+?=
 =?us-ascii?Q?Ui35e2H5bGMJCHFLz3HFPDh8OZUGWzCEzXno5erMb2HF6nrshtm6BA3milzw?=
 =?us-ascii?Q?KnvQHjgbbZVD6pab0m9wRhnIPcy4u74T4HizigNDruez6Lm2hFQ1eyll1X6D?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ada50c4-0fd8-4098-5a4e-08dca2ccdb1e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 23:46:31.4170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wUl+TFpGHWv/BPhro9giBgUycMPlA1W38ER0fUMZuTOe3rKOhpS8+ttoIIvB7cELdr9K+YIeLnnA72WPL7CE/ccY9VeAeTUWbj0c1rMThew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5987
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

On Tue, Jul 09, 2024 at 09:26:06PM +0530, Tejas Upadhyay wrote:
> Wa_15015404425 asks us to perform four "dummy" writes to a
> non-existent register offset before every real register read.
> Although the specific offset of the writes doesn't directly
> matter, the workaround suggests offset 0x130030 as a good target
> so that these writes will be easy to recognize and filter out in
> debugging traces.
> 
> V5(MattR):
>   - Avoid negating an equality comparison
> V4(MattR):
>   - Use writel and remove xe_reg usage
> V3(MattR):
>   - Define dummy reg local to function
>   - Avoid tracing dummy writes
>   - Update commit message
> V2:
>   - Add WA to 8/16/32bit reads also - MattR
>   - Corrected dummy reg address - MattR
>   - Use for loop to avoid mental pause - JaniN
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Applied to drm-xe-next.  Thanks for the patch.


Matt

> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index f92faad4b96d..cf622d07e190 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -121,12 +121,29 @@ int xe_mmio_init(struct xe_device *xe)
>  	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
>  }
>  
> +static void mmio_flush_pending_writes(struct xe_gt *gt)
> +{
> +#define DUMMY_REG_OFFSET	0x130030
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	int i;
> +
> +	if (tile->xe->info.platform != XE_LUNARLAKE)
> +		return;
> +
> +	/* 4 dummy writes */
> +	for (i = 0; i < 4; i++)
> +		writel(0, tile->mmio.regs + DUMMY_REG_OFFSET);
> +}
> +
>  u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  	u8 val;
>  
> +	/* Wa_15015404425 */
> +	mmio_flush_pending_writes(gt);
> +
>  	val = readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>  	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>  
> @@ -139,6 +156,9 @@ u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  	u16 val;
>  
> +	/* Wa_15015404425 */
> +	mmio_flush_pending_writes(gt);
> +
>  	val = readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>  	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>  
> @@ -160,6 +180,9 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  	u32 val;
>  
> +	/* Wa_15015404425 */
> +	mmio_flush_pending_writes(gt);
> +
>  	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
>  		val = xe_gt_sriov_vf_read32(gt, reg);
>  	else
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
