Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67008C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 18:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A0010E2FC;
	Fri, 28 Jun 2024 18:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGQtoeWM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9B210ED0A
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 18:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719600717; x=1751136717;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=auEzj6WXZX3VxtSuGDMtT1x8btRyi5aZhxOpZBF7QLQ=;
 b=bGQtoeWMSbnep41B+toZBbVPdL7cBMe3X/bKIz9AZHH1Gw/s8T6BqdZ7
 8B/IEe3nnITzKFmhftippnEDh99n6LNiUV/rPb2v/31cJs2PjcNc7Cfe2
 7negE0BU3sOrkG+UpKRCC1ZRsgyaMqzItuMVR/ntHZkOtzGGlEk/wTGyS
 g+Z1lnskK3GYvCkLZUksX1f+mrVTpuXVEzAVo6r44ifYNYvBt61QpZP2g
 zsnORiYepcUDRSFGer0j60NENKnQ+NfQu6bdELT4nZoK98/cFY1ytRfSc
 RAQsOhxXHi13dgZEOT95BYADt4+viE00IH5rlkNKlJLxreq/rVNpBKVOU A==;
X-CSE-ConnectionGUID: K0mBnmYwRLqzGX41qDljXw==
X-CSE-MsgGUID: ETGJgSngQcqSDlrYGfbW1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16470771"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="16470771"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 11:51:57 -0700
X-CSE-ConnectionGUID: WZ99SGlkSvuok8HZDlzbTA==
X-CSE-MsgGUID: PNT4a/QhQ4Gf0gPyC6aSxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="49717979"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 11:51:56 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 11:51:56 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 11:51:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 11:51:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WS5ZJImly6tXu6OUIQHjT+xfe1ADbdmID0kLr+h5nt3LBTfeBlM3pWVd6M/tpm/z0ly5/5eCGEx08oqxkb49/at5gAdCb1Gh6rwSCAVv+q0oypIHfNmrXAmj7G3H4oydz68JHz9ov0n+2Zxj8B2morH/SNPdk1++4C3oDA9Sw2X3k1KzBM86tPQtT6XcQfRTF1O73I96mC4yEkFbYA2XyrzygLnFVG1E9CLYA46S7FRfBa0PrbtIFgGtfPwVP0sLWLhduowPx5cgjZ6djKUroacrhE8GvMOQ2JL0T1ObSV1g110UFCaQfB1xXNEyOBb+BKVRPyGJaAgeR9mKY5G26Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZmavKwQHU98jiQ0GqKkMzSevYrQ+3px1zkBcj/TFfs=;
 b=dtyMgiZ0MtuqDxyzajLcj3Gtpq7XyY1AI/znomhNLQwHHcFMsa0KUzUZg9OfenMULed7tYXwv+mknjhf3yNCfu9RIA45RuuU+C3tYJ363YcHy2o9rftSHcQxGWxFT3eRHzLkqtaq1Za8shmX5RJEZ02GetqCbhCz2gen+neGwGdjv+nTUddNUPBXg2QTl2WjxhFf04TNu9JSKyzqzBqdze+iXWseCl4oNm99nn2LOxSN7xE8mAVTkgIqxMp8zUHllnGoFZZhyVhOfSCbaOG41W/re+NCvnrY3nhYa1qz9nMl8XXvez+FRgNiQuApugOM6bVadDGFYdIrr3ePv66CTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS7PR11MB7808.namprd11.prod.outlook.com (2603:10b6:8:ee::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.36; Fri, 28 Jun 2024 18:51:49 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 18:51:49 +0000
Date: Fri, 28 Jun 2024 14:51:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI] HAX: Try SR-IOV on ADLP/ATSM
Message-ID: <Zn8GQZo5Qh8oHvIn@intel.com>
References: <20240624120203.1169-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240624120203.1169-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR11CA0100.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::41) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS7PR11MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: a56b55c3-d05f-4a87-7055-08dc97a35db2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JVI3aYjfQkFQw4a+gpil3YtKWxFhrwEtZpKZ8GwCAXy73fRTBQMuWH2mNKY0?=
 =?us-ascii?Q?cB5UFzb0upzmcR1+rwRiJrlVUr2iC6d5zBy7E3+hzXZngwTJag6n56YUf4nd?=
 =?us-ascii?Q?BOR27OWHUaqaEOzXjqI8RCJOG5J77gtdw6/YiefTzntoAbxT89wK3BakAxCT?=
 =?us-ascii?Q?zGUZ1AsphsQoGz8qIdlw83jm3xFlr1yG1Ojn4jdDXHN9wRrRmHnPKib00ZHp?=
 =?us-ascii?Q?VYa52JPQmkpe3+m2mHcgFD4hK7QVW6RKnDZJeUg6ANwz5aMG2COGgUn7tNR2?=
 =?us-ascii?Q?gvTEepu2CW3mtWXJyu78GZcM2qW8EoSHWU5pYBXRLwwcEP+6r434TkUqeKbb?=
 =?us-ascii?Q?dI9csqtR4YIXOKf6gOzLRLxqe7yNTIxyzDcO02iutE39q/l88ZtWj2xo5k/f?=
 =?us-ascii?Q?WwIXygq/OxdEwF1Fop1sHMv6373OqNK0mphYke+LfN09p1L9aYP80BhftWT+?=
 =?us-ascii?Q?0X0RKIAyogh+fOAYZbIsmQG0do83AXPeRYy0VJRU+AjswgNEpcuuNyPz9H1H?=
 =?us-ascii?Q?mB7WOjXOAMQTuj+0he39yMdtk1NW509t+jDsgxCCOEa9shZeH5+CW1oVJkex?=
 =?us-ascii?Q?jUSNN9N+B9nnBgO1x1XOY7hjzYY0IafY3iWozYKvkpHlruWj2Ov+kEuQ40td?=
 =?us-ascii?Q?qazg7nPXbBEbrPfSTdiQ1zHXfp+NMkA89nbROoLART7JQhh5ns3SE5KbTva3?=
 =?us-ascii?Q?8DxnA9W9bPJ+L7pFPr2wO+VORBSxvCGILen8hTMcO+yx1F+gBti+Cmp6BIfX?=
 =?us-ascii?Q?X2w9IiWmXyS79gv+j1dJXbMxlReVu1r8/O6XEbjB5P+0BALGEZl1keziKehv?=
 =?us-ascii?Q?uE7GvJa5BSIZ2wogRMGPdQXC36Hv1PYSGHzk5cyUPTpWxG3WHzy2uAjTOdQx?=
 =?us-ascii?Q?iJ0AAopGV7VrEDPVyjdiRjBj/ptroLA9WljfDe8qaOja63Nu6xBejAVjmBxV?=
 =?us-ascii?Q?bFR+gqDNj0Q/L5Uzg3iIA/2CSOQnloZ05DUCtEf/QI1yh5fvNhOlNZQaMQ3g?=
 =?us-ascii?Q?Xz3EL3Iu9GuLaV0GL5Gv8l8Wmn5EzTJDGooCOhlRDiy7K3UtkTQkfdv2qLR1?=
 =?us-ascii?Q?+owHNKz+eeAAxjiNHnE9434MTwsVGe5BtTkgxTQNKORaVeLl7KLiPoaImqNa?=
 =?us-ascii?Q?Q6+F3IYfZox7lSGDlwy8P7BaUhpFrGPTVJZKSRBr7Id/7Lv/5TJlItQyVV7q?=
 =?us-ascii?Q?++grmMwGZXs0UTGOjzv0yDuJw7zfIHEuZT2go7ZhyK5k0IVfrhhrmJX6sSkR?=
 =?us-ascii?Q?hX1p/cxl1is0agsdh6CNZJSIdE/k24PEi0Rzb5x9IeHJP0asvYHhOp6bSdRl?=
 =?us-ascii?Q?ngrh2+lwNXAhKmwiBPLTKjJW/wjgMW1vV8rv3MrBKei6LA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c9jJV2WMQzjRGpkdiU1Q3FgB9T+O+LA+jJK7h2iKXw0B9C5yEWPRj4HaD1Jj?=
 =?us-ascii?Q?iJsTnSeQDO51wpUoxj+ngvnd71HHGW2q7skCP5nWl1NcC9Yh/KGQ8k+IkTBa?=
 =?us-ascii?Q?OqD2G1Untmv5XIjIHw/IbWWehuTOih6324t2iCuT9h5VSWb88e6dVbv6ILFc?=
 =?us-ascii?Q?nR6AzsmJFAJA4HVEgQna7w8JNE2rjfbCGvzRJ6nPEmPQjmXotXHD0HCCKzK3?=
 =?us-ascii?Q?H0krSBY2JFOsKdk/70Ysr/l7srKpKnN5LDEMyoLJbmLnQR3Tu4ltHq/1lSXU?=
 =?us-ascii?Q?k2yvRcpcl59BMJrG7WFbqUj7aIB4TMm7ECmRXE/oibmFZ6UqwzVeCqRwJosJ?=
 =?us-ascii?Q?MjZXxfHU8PSTxRHAJVyOcm6FYJcPPcUlkmlL3cZ5tUGgSFLYn6LjvoZkkcJ8?=
 =?us-ascii?Q?EWw35bTWoZD5jyc2T4MNEQu2jm7CppXu1dZQqU89F5lnmcfbo+GotouC3lCe?=
 =?us-ascii?Q?bU3N/HNHH4c1cmrWPnrB4pcE9R+8+H0tCq14oUq/cbljatfPOnTWtpYD7l+3?=
 =?us-ascii?Q?28R1Rf7Zi3+MdvSAUBcG2Prby6pwNauryZMwCMp6FxYk33kDkrL44GObz9hR?=
 =?us-ascii?Q?NQqHZP8nDFLQTXGE1QDmgNk24aBnmbF54Wtm23/OxFK+7BNbuZgq42NYAzvH?=
 =?us-ascii?Q?lbN0Q1MeSv83WUWxOFQ5ESKj1IHiMBVHk2IL3z+MDLSifnCVxn0DZVrWDYXQ?=
 =?us-ascii?Q?sK52De2JAUni1ey/aZ+YkbrCL4VqbpB+VEWgxY6o0lH3aIiCk1c+Hp98p+9K?=
 =?us-ascii?Q?Ar08EqqihZ3EU3WxdB85u1WXpILgpETkYMeoyEQo/SiwY/X+SPFhkYT7Dzz9?=
 =?us-ascii?Q?iGTiBdv7GD9c0gaoe9+sfvcB0RCLvEe7gF4JyYlrRJ1L+T1se05usPhgSwbc?=
 =?us-ascii?Q?/yn+qUweZQdq6a33Iy2dQodNF11pGJ1Li29NEdz9T8w5FjFE/ZejgHR4lbzx?=
 =?us-ascii?Q?whLvIHR17Ug2uHU3dlL1GeZ7KCUAo1oDamhzCZECF38mHP1naQqxZ6TzQP4m?=
 =?us-ascii?Q?nnAR1NTq4nIlqGEwo+2TV6TqwoXCs70fMMJ3RzN9qVjz6qOTDhl0YLm88ZK5?=
 =?us-ascii?Q?JRQp+diMB5IJd+nuJX/0v2llnIfDQfDGSihzcBIDREL/UWRy/AG7/XaFPB5c?=
 =?us-ascii?Q?BTmveOj4db5amB7IHQfoviSkigtmywJoZvGmfFPK6N43WVDGpyZcWKLk7OMm?=
 =?us-ascii?Q?G3PSXhiJATEmikfSDtxDG23QiJPYq1DHTVURl7dE54V5CeBt0AHtA/GXQTS9?=
 =?us-ascii?Q?IF8jrcIYQkiqAm2dNVfzMp1xwHCh7tkqhrqoq3m1zVLlnLAQzjGguNa8FZlv?=
 =?us-ascii?Q?8QQutXhTePql046lJyMwFCcGRFiHgtfyClnGp0w6RPvoDGDL/Dc6SYfYmAQz?=
 =?us-ascii?Q?qxv11FRZr4iFztIzXQGBMcQMF+Fy9Ux0U6MWmw+nYLXjuKUqCmkMldGeo+MK?=
 =?us-ascii?Q?iuwqrz8t4zeXeB2qSnwNlaUStpbRo9fFJztgUyNcUqA2PYCQ89IrSfwyD6hD?=
 =?us-ascii?Q?Tzja0ZtFQzV7fG3IbX2fA1Hxf3v/8s4iBwNNx+y4jwna2ZkL29/vdFVIqxU7?=
 =?us-ascii?Q?6ih/nqZoQ/hKFksC9JPa6FDtFoC4iKzSdpEgHXDL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a56b55c3-d05f-4a87-7055-08dc97a35db2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 18:51:48.9702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGh76awPBj2hqg5JhFGl/F6HuE71d0FVmjAGwNNZXjYtC1r2x/cSSKbmHOtYfYy4tlKWxu6Zd8bF+nUrGNfLOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7808
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

On Mon, Jun 24, 2024 at 02:02:03PM +0200, Michal Wajdeczko wrote:
> This is for CI only. DO NOT REVIEW. DO NOT MERGE.

how are these tests looking like at this moment?
I'm wondering if it is already time to add this patch to topic/xe-for-CI

Thomas? Lucas? thoughts?

> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_module.c | 1 +
>  drivers/gpu/drm/xe/xe_pci.c    | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 893858a2eea0..c0cf3b8ad815 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -18,6 +18,7 @@ struct xe_modparam xe_modparam = {
>  	.enable_display = true,
>  	.guc_log_level = 5,
>  	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
> +	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
>  	.wedged_mode = 1,
>  	/* the rest are 0 by default */
>  };
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ebff5ea79b1d..488a444b7b5c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -261,6 +261,7 @@ static const struct xe_device_desc adl_p_desc = {
>  		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
>  		{},
>  	},
> +	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>  };
>  
>  static const struct xe_device_desc adl_n_desc = {
> @@ -307,6 +308,7 @@ static const struct xe_device_desc ats_m_desc = {
>  
>  	DG2_FEATURES,
>  	.has_display = false,
> +	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>  };
>  
>  static const struct xe_device_desc dg2_desc = {
> -- 
> 2.43.0
> 
