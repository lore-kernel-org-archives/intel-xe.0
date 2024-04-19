Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2109C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 14:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF6B10E0C2;
	Fri, 19 Apr 2024 14:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STaNtCEI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D22010E0C2
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 14:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713536642; x=1745072642;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6+k40eHvwgV59MNOEbeXeMnsR4mwhhsEnKa/U4Gauj8=;
 b=STaNtCEIYSXWgJkWiuKOGlIw8jbau4eBHAIlswNB/lbFo5eEXdXr54tZ
 yWQJ0UJTvjah10yV39TGdJa6+3iFkBVXZKhsB7bnTkLaP1eGPYDCvRixT
 aKZvfgCkbc2r4tFliVYJ8qbkcZmGtPqsy/7TkUR/sDUBoBoyZoHq+igLm
 Tj0SxyJAeXO7cyQWiVXnZ99pltLSZe8F1MVuepHoOBpIoif9+Hub2wDMY
 gukHV1HHXvIvPAMe9iJFFgFxTm2C8z+qnzCRjfEc2jrT2ePh7nV8U7FiE
 Kzu98xhPt6RrYuxM8EH5Im3s+iAb45L9xHLcWMG343EgdYqhAjMX2x6Ur Q==;
X-CSE-ConnectionGUID: korLFHwkQnW7LmmpSDWU5w==
X-CSE-MsgGUID: /re2DUJ3QCGg+jja4E4FRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9000756"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9000756"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:24:02 -0700
X-CSE-ConnectionGUID: kCAzlYJwQ/iGWWtDVWLjjg==
X-CSE-MsgGUID: 4o/W+oXjTRGSZTn+Fz1caQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23848785"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 07:24:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 07:23:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 07:23:52 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 07:23:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNNP9TK4h6E/es3JYPL9OLsj24z/wXAx416beC33IWIKn1wGyOUxdso2p1JG1kROO9jTvA2bTDyuJXto4hrAnRdEun3eBZ925Im/EmAlyq16+lvTlo6FbWWW9a+85ITuJb3ygf5NaEI9SC7hhOlDyVOfXAg2Qh44ihFokGgn8urxU4UEdxgY53OROq0RrOE/oHgCj4ybIzJ2n7Df2fINUEeVu9iaozj4T+LBj2BiKrIrPLV2J0GiJyKpdnLeuEYbYociHXvmyKJrw74YAlN5kWVaPefdcsnYUI48tce+OB2d1NZPrXjlTrhnqZ40mQB0L3G6EdUL+cRxKEGKDurpmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKxHr2ule+fHtSFmYVtQt1eMLSvV3qpfEfVLVs9dY7I=;
 b=A0QJvnzbPhGpFu7u96WHI+oQ8Xt5QLtWvVcybCsudmTMozJCTB7j9iKPRMPFRXPi6eaHyV7UzumVg3N/kb7Zn0aJ2l2B012Iv6drbBXJCyhweuA3vqmrcC3028jz/TNEFed68LTfuLk5fmQWKxlWghP/8DweR1EJ68T/yKqimQJbmq7qG12JVBdzWboUDr+DEISVyzWfmHyveWCLQyrOpdcudSXoQUtYZJES1eXckrXYkOKycGB3hTfqSFjUL5Gt1AClya4gGIEs1C80T5LsdLcu2Y5mO0N/r1PhzJqc0oIal6NrawsvfB3wPT8qrGXHhkQh7rzs1nCLwIPLXSGy4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB5805.namprd11.prod.outlook.com (2603:10b6:510:14a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Fri, 19 Apr
 2024 14:23:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7519.010; Fri, 19 Apr 2024
 14:23:49 +0000
Date: Fri, 19 Apr 2024 07:23:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Define all possible engines in media IP
 descriptors
Message-ID: <20240419142347.GA5615@mdroper-desk1.amr.corp.intel.com>
References: <20240417152621.3357990-2-matthew.d.roper@intel.com>
 <vwpy2sr62wcnwkjslreseee37kpi47msw5l4mbvos7dxuavnqa@cohkzrvkkddv>
 <44845ee2-79bf-4641-ad73-ffb88a23ce0c@intel.com>
 <83d66294-c089-467b-a65c-e90314613caa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83d66294-c089-467b-a65c-e90314613caa@intel.com>
X-ClientProxiedBy: BY3PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: f37ab5dd-4e9c-48f4-8b08-08dc607c54fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /2lp2QOUl7pNXaHHMiKKijEOQLk1ylxLpC95orCMzr+wgUFNlsDBKc5K/Aw60Uxby4i0SG1SdhTdNW6GRnk9JkdxvTT3kxeBkUeMyVhxwgoBVhHtMURFlUrQb0FzA+lUcF7HkzcJ9MDPYhAyjkyc2kH0KeaZC8HF8OAgo86y5W1DqVDj5XvM/xz4DitY41LOUcWZ6WK+dwEr4jakhKOtm6k/Y3izR4BcXB82Bvg1Lhgsk5StwIJy7fV1cEPA4Pc/lQt+BH1d1px/HzNLF9MXlzz9iLa3YVgFD1lO+gooS4SLfylj7bAO3BVoRzv4LaEP4WPxBp5nw4ttltFU7nqIHLObSo43GahpS2sAp685RnzY3mo8vvjxHqjslbsTD+A3l35lGG1Byg3THDRWPP6S+Z1D4vXcQ/iB7LGHvseyoKj4a71QA9PSA6R6asGbu9JLR3PIpLBCoDGu1hj+Jl9OuvWBGjp+RGDJgn4v0CWQ0EEIUoQzGSciDbuB3065rTUeDdlNm4AvlbMR0xzwry9s+yayZ21WIPJEloHLzuBZmD8doarpat9iARXuy3ZrD6OoIp32RtvRisnO0TYT/46NYeQvNsgUfTEj5UAPhwiBvbaL4sOCXznrThQnZLqq1DmmxVqQG8LpEnbQOseSRiW8g9AcPPcMYSMLfC4EWDGKWo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?R4hWYJQtKoQTlmXU0AtD+VD6wubnMeEkl3UhnXHISdkXjWLs4LDkRec6j0?=
 =?iso-8859-1?Q?eaqkiNPCGMEhmDoZYGrKrr1t6M0oR/oTFzB9WNqertLIhFW25YT8ZWyF95?=
 =?iso-8859-1?Q?b18K2eI0yDFUdmXDJRy4dxfRnGR8foz60r225BnStwmb6g/cGVsux4UepC?=
 =?iso-8859-1?Q?u7rQ3OvfsSd/33Ojl5wl9K+KR4yFLhcyYY9d1utLYWTxjDBtjbMef/4q+D?=
 =?iso-8859-1?Q?GOQSlcWQGBD7EpvvIgZPnp12VCFLyDDDBED7y53QO0eHv265Kiu+6D5N/u?=
 =?iso-8859-1?Q?pFt6YiVW7BxAWcRSAaQVOcQtXjpWjFvqMcggvVp8191NKeCs2FnbtMxHu/?=
 =?iso-8859-1?Q?xr58zlY5v9DEEE7uINsQnS/1VXwtIth0khbxb38/RP0Pu2w3AGlnIJ8T53?=
 =?iso-8859-1?Q?AywLhc1wXnn9nQsmdr2fYF2rVthIMNNjY3rZsyPCb8NN0OI2mceQFJ/xH9?=
 =?iso-8859-1?Q?CFT2GNuSO6LBDOpl08EwFkHlsbvUtzmB2eQv0Yrl7rGC/B4WnNWMjD9W1t?=
 =?iso-8859-1?Q?s3T0KNnmyvVGJQENOxatQBZiuwGzhcQO4gDQpzVE5B8QVqoSQjj52OBCCt?=
 =?iso-8859-1?Q?7TABJEtk6Ebw0YeO2bgzAds12iRs6VXFYEPE++rB0vo0IWS0Jg2nlvraUa?=
 =?iso-8859-1?Q?hSYF/h8Q27Oh+0O9vcazQAo5Qns+txatI9qaWwngvHxKlNnvaqZZTVfqVF?=
 =?iso-8859-1?Q?/igQQFUGzYhTKE+MTOsOlk5oIb7tKXEt+MRLuaULdpHgMZ5LHtMrlC0VVc?=
 =?iso-8859-1?Q?/mtZuMhFpAb7WlNYQlwSjG5m+oGOnynNSSb7Wm8zwWrlDr0CVM7VSp3YxO?=
 =?iso-8859-1?Q?u2WJpo+qM/9eSdzxxrRkVkJ/7EImSCthV9L1Kzl5lamNK/9Sw9pYUKRBUa?=
 =?iso-8859-1?Q?nLq8/5E/25udRGXtE1iK/SnNdPdtcxpC/DjVgox3gFiUor1SvSuzcgztCz?=
 =?iso-8859-1?Q?Q88dbvVvLTzgVD6lV8igJUGrU9Ckhq+FroXdizZ2rvqM/IIZzuL48IPppr?=
 =?iso-8859-1?Q?zALE9GB4MJgIMURZgIiprgL1pbm3Gfni2jP34mHMi5qtGFS8q73ijsnkkR?=
 =?iso-8859-1?Q?Ir/FzM+aIFVnynFg4detyGZN5Hbh5XcYr1V782eVPwwenZ0N6T1Ptmhn7m?=
 =?iso-8859-1?Q?QZL6is7tNR7XESHVmzTpsmflsjINoO5l7wHhJoqAd+rqtXN+ldEk/z5Lbq?=
 =?iso-8859-1?Q?KKdSrGd9HwWGJrFZT6wVAPzCP+pO0TKDOCRFcqU5sbRU6s4y8AtET6w7VE?=
 =?iso-8859-1?Q?GSbhkiCg8Tp14QGzEVueS5ucZQRqlvBUL7R+G58Lk/GrMNTp2DHm0ZIGOz?=
 =?iso-8859-1?Q?DBvsyoV2ALA7q8DiqZbmMb0GlkvJ9lg40R0RFw5Z13nkQdeBcNC8tbhfj2?=
 =?iso-8859-1?Q?vNPFxRllWRUeqEQ5wbVoiNcT5k9sLdSbdoiqoB4AdE8J4VW6QnQd6i6KSU?=
 =?iso-8859-1?Q?/oIPOE4tBSYNaJV4vIlm0OxljMRQrhFIm7xF3rQWibk/jluzjmuxkxElKQ?=
 =?iso-8859-1?Q?4Fz1s18lOLCHjcU6F3bIvf1xIcf+8KadbB4u9l5MostaVcdnBaacNYLqj0?=
 =?iso-8859-1?Q?QStaKcU5sfCIeM/HeYhp8GaUjDBUadzmlRNRIEDO1xPQwJrmBuRhTdFwRF?=
 =?iso-8859-1?Q?seL9YkS1Amu8WH4H5aXyJnwkYPtpWVFyQ/ZdTDNj3LmmaUVhWl37qnQA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f37ab5dd-4e9c-48f4-8b08-08dc607c54fc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 14:23:49.9271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uutS1+mmTXk3Q3HnNHueeQ2q1h/rHveSCp4q3w+WY6Z6P7cVWXzgOzIqfZbZG3o347GsdRvneAFAF5BnPgz0nDg7foXi14jpwBMcZ3NQ1zQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5805
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

On Thu, Apr 18, 2024 at 09:48:37AM +0530, Chauhan, Shekhar wrote:
> 
> On 4/18/2024 09:46, Chauhan, Shekhar wrote:
> > 
> > On 4/17/2024 23:48, Lucas De Marchi wrote:
> > > On Wed, Apr 17, 2024 at 08:26:22AM GMT, Matt Roper wrote:
> > > > Rather than trying to identify exactly which engines are available on
> > > > each platform in the IP descriptor, just include the list of all media
> > > > engines that the IP could theoretically support (i.e., 8 VCS + 4 VECS).
> > > > We still rely on the media fuse registers to tell us which specific
> > > > engine instances are actually present on a given platform, so there
> > > > shouldn't be any functional change.  This will help prevent mistakes
> > > > with engine numbering (for example ambiguity about whether the 2nd VCS
> > > > engine on a platform with exactly two engines is numbered "VCS1" or
> > > > "VCS2") and will also future-proof the code a bit more in case new SKUs
> > > > or platform refreshes extend the engine list in the future.
> > > > 
> > > > Note that the media fuse register technically has an 8-bit field for
> > > > VECS engine presence starting on Xe2.  However there's still no MMIO
> > > > register range reserved for VE engines above VECS3, so VE0-VE3 is still
> > > > consider the "maximum" VE engine mask that the driver can support for
> > > > now.
> > > > 
> > > > Bspec: 52614, 52615, 62567
> > > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > 
> > > I remember we tried something similar for BCS and had to revert. However
> > > for media it seems we have fuses available on all platforms, so should
> > > be better handled by the current code.
> > > 
> > > Assuming CI is happy,
> > > 
> > > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > 
> > > Lucas De Marchi
> > > 
> > > > ---
> > > > drivers/gpu/drm/xe/xe_pci.c | 16 +++++++++-------
> > > > 1 file changed, 9 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > index 3b30353dbc09..0d21306f8995 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > @@ -185,8 +185,8 @@ static const struct xe_media_desc media_xem = {
> > > >     .rel = 0,
> > > > 
> > > >     .hw_engine_mask =
> > > > -        BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
> > > > -        BIT(XE_HW_ENGINE_VECS0),
> > > > +        GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
> > > > +        GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
> > > > };
> > > > 
> > > > static const struct xe_media_desc media_xehpm = {
> > > > @@ -195,21 +195,23 @@ static const struct xe_media_desc media_xehpm = {
> > > >     .rel = 55,
> > > > 
> > > >     .hw_engine_mask =
> > > > -        BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
> > > > -        BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VECS1),
> > > > +        GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
> > > > +        GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0),
> > > > };
> > > > 
> > > > static const struct xe_media_desc media_xelpmp = {
> > > >     .name = "Xe_LPM+",
> > > >     .hw_engine_mask =
> > > > -        BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
> > > > -        BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_GSCCS0)
> > > > +        GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
> > > > +        GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
> > > > +        BIT(XE_HW_ENGINE_GSCCS0)
> > > > };
> > > > 
> > > > static const struct xe_media_desc media_xe2 = {
> > > >     .name = "Xe2_LPM / Xe2_HPM",
> > > >     .hw_engine_mask =
> > > > -        BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0), /*
> > > > TODO: GSC0 */
> > > > +        GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
> > > > +        GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0), /*
> > > > TODO: GSC0 */
> > Are we correct in excluding the 4 new additions that are part of a new
> > HSD, stated in BSpec 62567?
> Correction: Not new, rather, different*

That's what I meant by the second paragraph of the commit message.  The
fuse register has 8 bits for VECS today, but it would be a problem if
something like VECS6 were to show up without us having defined the
engine itself in engine_infos[] with details about interrupt bits, MMIO
base offsets, etc.  So whenever we finally get a platform in the future
that defines all those various details about VECS5-8, we'll add them to
the mask here at the same time we provide the rest of the engine
definition details.


Matt

> > > > };
> > > > 
> > > > static const struct xe_device_desc tgl_desc = {
> > > > -- 
> > > > 2.44.0
> > > > 
> -- 
> -shekhar
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
