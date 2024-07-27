Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185DEC3DA4A
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 05:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C387C10E0CC;
	Sat, 27 Jul 2024 05:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="csv4oUGR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6957C10E0CC
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jul 2024 05:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722059404; x=1753595404;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=akGmhumYrCPmMrUyvUnjFO6VAvoiEqs5nuWgQOuxprE=;
 b=csv4oUGRjFGPpnK3MF2dLWVDdasUdkTdZBjmttwss9TaZpl7G90XCwQP
 T5pZBQeNAbuiaY2RR/gKiYB3eo+lUdIluW2S77LXsnI0ePjKM0ejN0VVY
 Z6S01OQxOY0VLaWqlJ0LX8mGY93mkhEjwLBPWiZPBRvFc30fbyKckVIxM
 E9nK4a9W7PsDg1Rm3ONmQQTlEEYNB7+Kgb0L4VcLML1uzurAFDg5v7eeg
 cjH7hGV7KvyvqrzFV6it6FMa3Ew1Byi/Xko8B84mpA7wgBmzFG9Tx6hQR
 /0S4nZ09jPcAz2YYBFp0U18Q2lBpKgkRiPQm1U1bqty/5WklUTGfClKSj A==;
X-CSE-ConnectionGUID: fjd9QEpwSMmP0VKyW/o3Ng==
X-CSE-MsgGUID: Mo4h+R5gSSiIT+EUaow2cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="22771893"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="22771893"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 22:50:03 -0700
X-CSE-ConnectionGUID: CLrT+9FXQyexmU4Xuag5Dw==
X-CSE-MsgGUID: uNEntps2RdGH6+cL7AL3+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="53530632"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 22:50:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 22:50:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 22:50:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 22:50:02 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 22:50:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjOLp+RObT91HRIy6P8glKPDY/xhjYUjpVW3ZBPxXN9Wi+wnYY7ncV5L5HUxRuyKD1XmXYVFmrILJj6IkWbx+wTw1Zzj97wIx69epfgp+4yW9GFhmuqb4JsMelHClvAYzw29s2e/4befzmYQIkYn/ANTU/cJJRhxeAZMHCdtKg0VGNU+hb2bAm9p9vBVqNym4AXvcb9/uAn9Eg8rOe6iKbZw0kVeFKCNt3x0UunogS1Ei8KwJRhkK/0S/MiLTwtkuyV5w0jj32UC2pM2jtUrpVEHkthdXZYzU5vnJekBmAY09lLTKv85wyIGh30dxlXKQPd6elb45I3xt7I0KwGKgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VP204Xv4ncj2yR4PlrJJiEn9Po0b4TBI5ecSwrSTlTM=;
 b=TMRKV4px2JO4y6n1Fym6bLBRcWWM/+nLl6ZP4jKlCtdFCFTCcF40Gm62KBUng/f4xW6ruFCiol7H/0Xo21L2lR7td2pOtPWnVj4PA5uzIC+xHbsqxoPst9gt6i4Ssq/M9+Ah++ZUI5ZOFqVr0y0PwvlODNVrHy29Bo02AoVO10jG+D3qFILkSzrpyE9YWzXiOzCLBrjfkyahKoNSoyhLeJvfBIezYd+0oRBmQkKhGnoD6VoVeNbV+0u4qE+kXCLNKGghaDcR1OYS7beovmpybN3YMJ3JAlDyEvH1oeIVP3WXZuSfkWnfC6bJ6X4JHc1uoESKVfl7crqNYv9ClXAwVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6066.namprd11.prod.outlook.com (2603:10b6:8:62::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Sat, 27 Jul
 2024 05:49:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Sat, 27 Jul 2024
 05:49:59 +0000
Date: Sat, 27 Jul 2024 05:49:08 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>
Subject: Re: [PATCH 02/21] drm/xe: Move and export xe_hw_engine lookup.
Message-ID: <ZqSKVHYSczTG87tl@DUT025-TGLU.fm.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-3-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240726140818.54304-3-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6066:EE_
X-MS-Office365-Filtering-Correlation-Id: 150729c6-91fe-42af-6285-08dcadfff381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oNBHPFg4pC8KOnTuzFI1DhjG99zFbkItcjKztFQyabarjAFUciNcm2FnMfKx?=
 =?us-ascii?Q?+HP9km3XeVl1OVKluiJYCASRNQafVCUSDz9WljHaOf4qMLrbA0RSX6xdUa1t?=
 =?us-ascii?Q?d1/+Nosr1JFsYAM4NJBtwBbBZyXR40AMoOEhuDPP5ak6nx1Nt6n8OXizHTOC?=
 =?us-ascii?Q?wS7rVMWurI5EYAN+o8q2riPqxCeRlXSdrnPQLkmvV7ipyGHmOBxxt4XozPrN?=
 =?us-ascii?Q?RU/eQTO2gqbo8jPo4ScHIgz++xntRGH4L9MmJ8y7OqWKEdNztq5WxvZ1vxia?=
 =?us-ascii?Q?MNgDgJdp5vqQ+B3O41h480kHh5qy8GcbMHDwdqAFZSKgF5nO1TvqwNwE6zUC?=
 =?us-ascii?Q?Zvu/arEhsekWTcqd01KyOIzjPiZlIaMpM40iIXjLMpWPmXzSBbibRgMnmajT?=
 =?us-ascii?Q?Y9Yu5MAAj0KhMKBDBQxCoDa2Kjxof2AimmxND8a00lPB/yHcbjC6QDFveEbH?=
 =?us-ascii?Q?abrrZ5UXo6QWkMiDJnCr2uVNCawJWng7ERzMHrecfRDBfP3sYPL6Jzvwc4S6?=
 =?us-ascii?Q?0H3WhGa7qxp01owBJW8ixtSM92jQRsR67BInmYjxcgAdfybsiMD7e5kYTE7Z?=
 =?us-ascii?Q?5poUxFQ+Pt/m44yFn6mwpkDIvPfuTb7LXVklgsQKuo92jbS1EhZFVh1/Jw9D?=
 =?us-ascii?Q?LnqIUvofMg+C1CSRRedPvfBwVfyMnq1+yMkxAlKEHA0TqS0AIaMISk2pb2Oo?=
 =?us-ascii?Q?A6jPFzUBOFGlpRda7SYw1nb+SxPzYUUSjAejemCd/q5jd6OUbGVMx/KH98Aj?=
 =?us-ascii?Q?MyPGkDo2FVwWfQutHMq5nRBnGNk0pF7tiqLfQoc0sLq79fPv/JYPCaJLCdKv?=
 =?us-ascii?Q?+Fk/F3aEA/AAW34EVBdoeBWdZcOYDuoJmw4NeKq6e1Hjb5diNh66MDHwM3v1?=
 =?us-ascii?Q?IHiBk1ZIumCMGtPE5UCr4KQblmFAxN1PDDCDu6OIDoiCmaPINvRyC/hjVXKT?=
 =?us-ascii?Q?xw2mZc4Pl2MscshbTuGp2tfZMPJbbiMMAc9lzQJmXOVjUjjO0eErK570rfM/?=
 =?us-ascii?Q?dM0sJarYTjyZP3EE2G23+rp/Tv0Xnk4dYnXMkj2YLig3ma7Yl7HV0OC5iIsP?=
 =?us-ascii?Q?BLgYML/fTXqsOTZGY5esxmXe86WO3IA30uwMvlfGaLSiZW/nJAFvaV421V5L?=
 =?us-ascii?Q?3sCTTcj9B1zdGOs7bsM0W1ju8Ffj0PVRF47+KEjU7gh7x1qxjUTHk28Wmv5y?=
 =?us-ascii?Q?VP+KBcYgSKmA3GBYf/8/rfqPeJrl+5cpN8TghrEg+IquyBVqhBEbPc1v64dl?=
 =?us-ascii?Q?FROVQ21RWF0z2VGdIp5AkwLH3uEy6qY34OJ/GqXLkxcED7WQthvK7723zEnm?=
 =?us-ascii?Q?OK92zbJjcjNI7buin3uJFmkqZTfn1gOv/z4PGRU0Ziqisw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KOUc/NbP68pcqXe3TGtspKsyUC8zjJbi7Zy376yjEs99qfF4qorU9b94K/Tl?=
 =?us-ascii?Q?7+vhB7WQWtjzWh3gjqibCF7c98Ov3fxmG+aDb7FLg2HA0052r82jvsLPPefs?=
 =?us-ascii?Q?zSQ7mRhE5/oFI2ILpOJWhKjhUItEAJUSJroejRf6bc1bhABsvWL5sYQBChCZ?=
 =?us-ascii?Q?ZerFfsnaRZJ6vao/3mlPPWuAxbHZ9uQj1IfVKLfAJaI89hjQ1lHl9SNSRRw1?=
 =?us-ascii?Q?qJ3+8jeDXVobNRRbLqbkiLy7dxp/nfdDTy15ovFtWpoaotJQhP5BHDh0lu2P?=
 =?us-ascii?Q?En2jg8ShQnjtseJG5CeeHYrZNCXet3aX0ssixDXhAeunmnLyHvCdi98GpLbt?=
 =?us-ascii?Q?HGbVohDVIvzvKzAfKMOsjARdHscrnKDSDdGt60sf3kH6K41OKQNcYAyGs2ov?=
 =?us-ascii?Q?75Ah3E5T47qLEyJ8kCCriaXr8FBNf30QLRaBOxJwggkog5XcfgVNVmce4+nq?=
 =?us-ascii?Q?n/UVmbe/ZwzzGjiZICv0EWRreIB/K06OjbIM0QW+zSxtVPQnnrWX5DF7aREd?=
 =?us-ascii?Q?GtSnypfu34J/+WF5Fj80IJJePILbkY6Z63IuOlsVVAKhe+b47GxeB9FtKiSy?=
 =?us-ascii?Q?DuA7faEkxwkll0j/yzbo9dzFCSoertKhfCM5jQOEPCHFrL6k816ZWg4q7qAp?=
 =?us-ascii?Q?G+1+7ByG6TOC7VJUQw8wWwWV1tN/F0OguAGw0Ql5k6z9K4gwzNKrXcbAn0Pw?=
 =?us-ascii?Q?WfO2K6tTuwJoLrOdbAsu26olIzePd12pbi8ElD9bpSL/oABA6BmhyzQES7q8?=
 =?us-ascii?Q?pA60OS6ToeB2FIobZ4EAldaA1bLpntC4S0YWx49C7FRmRCPvS1kWb2JrniLl?=
 =?us-ascii?Q?5k81bdFrniI5jvqED+LieSkRCU3Ca1C9LH2wYiyub6WIYtEVO/wCuOG6S+sw?=
 =?us-ascii?Q?uY53XYNCFhLrA45ySRuZNddK9TnjaPF/OmU+Z/QPE2P0JIggHc3LPHbSugN+?=
 =?us-ascii?Q?kEGf4GauIxLvBwOAZj2buWxaioQ332f5585f99+Uq6IEFSHYbvAfZAZYaelB?=
 =?us-ascii?Q?2JART+K04Ai5T3KWWbMhGzmANmH7KPtanp/hj7Uizo9eCcY2ruiokTqkck1i?=
 =?us-ascii?Q?SMsqjm/8jD5Vj/iob4t78y+bGFdlxpFrZ0w6P8l6YzS047plAryYDqlRemFk?=
 =?us-ascii?Q?WMAcmOeddQf61vbfzFRXQ5p7r5E4HhUjkZ+eb5Vium1Ae+fNKxQkv2oynJEq?=
 =?us-ascii?Q?Z6dULDesL0cH/RYkMYMfXxD2AQZm3KnYqUttPwj9XIbnE1jolzcBBu1ZNLAa?=
 =?us-ascii?Q?19KHYi7Rm1gXn7oEHUi2nDFPaNuWDPoKBx3VoIGIORXEdKHfvJ+8G15VmgND?=
 =?us-ascii?Q?ELrV9Hvj4FnyJRWqdSLR9wPP+aN4YYWNwiV07gmjHAn15k0VFFLU/AeE5Ewf?=
 =?us-ascii?Q?eQ6yemIC8WO5R7Dva4GP9mQKgfavq/W1M/VwNkWG0kFBqL7FzGUK2NcwV8Of?=
 =?us-ascii?Q?s0LOTqE+qMEtqKsW8aiNX5Ad/i2umX4lANh83hEwtzXpdyqxZEClwD+ChnC7?=
 =?us-ascii?Q?+RnaQPqwRJgmW1xCxsNkOYDBUDPuctomIEGDOOXB09H6KdLGMRt2xNUPA4aY?=
 =?us-ascii?Q?cJMvlpTDYDrYnQFoG4qTG0G0jVaPcEqPPoggaMeAvOHh56n1hoR/AfqUB2Ss?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 150729c6-91fe-42af-6285-08dcadfff381
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2024 05:49:59.4276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DBvISJdJTYtLFuTYCouy0nRMqIVyXBE/4IEb8IY4tP7phd3zTYaljPAxN3Itg0pc3xzbUWF1EN25b7oqo8Hxfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6066
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

On Fri, Jul 26, 2024 at 05:07:59PM +0300, Mika Kuoppala wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> Move and export xe_hw_engine lookup. This is in preparation
> to use this in eudebug code where we want to find active
> engine.
> 
> v2: s/tile/gt due to uapi changes (Mika)
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Feel free to send this independently, immediately with:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 37 ++++--------------------------
>  drivers/gpu/drm/xe/xe_hw_engine.c  | 31 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine.h  |  6 +++++
>  3 files changed, 41 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 69867a7b7c77..956dc15b432a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -413,34 +413,6 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>  	return 0;
>  }
>  
> -static const enum xe_engine_class user_to_xe_engine_class[] = {
> -	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
> -	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
> -	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
> -	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
> -	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
> -};
> -
> -static struct xe_hw_engine *
> -find_hw_engine(struct xe_device *xe,
> -	       struct drm_xe_engine_class_instance eci)
> -{
> -	u32 idx;
> -
> -	if (eci.engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
> -		return NULL;
> -
> -	if (eci.gt_id >= xe->info.gt_count)
> -		return NULL;
> -
> -	idx = array_index_nospec(eci.engine_class,
> -				 ARRAY_SIZE(user_to_xe_engine_class));
> -
> -	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
> -			       user_to_xe_engine_class[idx],
> -			       eci.engine_instance, true);
> -}
> -
>  static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
>  					struct drm_xe_engine_class_instance *eci,
>  					u16 width, u16 num_placements)
> @@ -462,8 +434,7 @@ static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
>  		if (xe_hw_engine_is_reserved(hwe))
>  			continue;
>  
> -		if (hwe->class ==
> -		    user_to_xe_engine_class[DRM_XE_ENGINE_CLASS_COPY])
> +		if (hwe->class == XE_ENGINE_CLASS_COPY)
>  			logical_mask |= BIT(hwe->logical_instance);
>  	}
>  
> @@ -492,7 +463,7 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
>  
>  			n = j * width + i;
>  
> -			hwe = find_hw_engine(xe, eci[n]);
> +			hwe = xe_hw_engine_lookup(xe, eci[n]);
>  			if (XE_IOCTL_DBG(xe, !hwe))
>  				return 0;
>  
> @@ -571,7 +542,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			if (XE_IOCTL_DBG(xe, !logical_mask))
>  				return -EINVAL;
>  
> -			hwe = find_hw_engine(xe, eci[0]);
> +			hwe = xe_hw_engine_lookup(xe, eci[0]);
>  			if (XE_IOCTL_DBG(xe, !hwe))
>  				return -EINVAL;
>  
> @@ -608,7 +579,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		if (XE_IOCTL_DBG(xe, !logical_mask))
>  			return -EINVAL;
>  
> -		hwe = find_hw_engine(xe, eci[0]);
> +		hwe = xe_hw_engine_lookup(xe, eci[0]);
>  		if (XE_IOCTL_DBG(xe, !hwe))
>  			return -EINVAL;
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index b8c0cfbf8b49..20c4fdf40790 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -5,7 +5,10 @@
>  
>  #include "xe_hw_engine.h"
>  
> +#include <linux/nospec.h>
> +
>  #include <drm/drm_managed.h>
> +#include <drm/xe_drm.h>
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> @@ -1134,3 +1137,31 @@ enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe)
>  {
>  	return engine_infos[hwe->engine_id].domain;
>  }
> +
> +static const enum xe_engine_class user_to_xe_engine_class[] = {
> +	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
> +	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
> +	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
> +	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
> +	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
> +};
> +
> +struct xe_hw_engine *
> +xe_hw_engine_lookup(struct xe_device *xe,
> +		    struct drm_xe_engine_class_instance eci)
> +{
> +	unsigned int idx;
> +
> +	if (eci.engine_class > ARRAY_SIZE(user_to_xe_engine_class))
> +		return NULL;
> +
> +	if (eci.gt_id >= xe->info.gt_count)
> +		return NULL;
> +
> +	idx = array_index_nospec(eci.engine_class,
> +				 ARRAY_SIZE(user_to_xe_engine_class));
> +
> +	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
> +			       user_to_xe_engine_class[idx],
> +			       eci.engine_instance, true);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 08c3a9df7154..0383aa7d8e89 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -9,6 +9,8 @@
>  #include "xe_hw_engine_types.h"
>  
>  struct drm_printer;
> +struct drm_xe_engine_class_instance;
> +struct xe_device;
>  
>  #ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>  #define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> @@ -67,6 +69,10 @@ void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val
>  
>  u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg);
>  
> +struct xe_hw_engine *
> +xe_hw_engine_lookup(struct xe_device *xe,
> +		    struct drm_xe_engine_class_instance eci);
> +
>  static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>  {
>  	return hwe->name;
> -- 
> 2.34.1
> 
