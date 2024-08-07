Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEE5C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 23:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789F910E60E;
	Wed,  7 Aug 2024 23:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HU0rY1aw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D23E10E60E
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 23:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723075028; x=1754611028;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6UX+k/Qrb7B9vpQX7QKaeVt7g/Paez/Qo+UXbbL8GmU=;
 b=HU0rY1awZAxaZbvYPF0WV16QkVVNA9lXzQwKRiBkrVpywcUA6im1kqyi
 rAbaKtEWrQSHc9V2y9o282CWr+pZHYb0HQRyQzW/Kvzk8ndF7H+bwX2Uu
 9QSQD6TYKXXyPQz/snZ483uA27O771DYNXlxMWSJ8UgDNOHWfT5WTo26l
 rAU18cR4esX+cr4ta8t3vPmVlXiBjlLiS9DCDM2PeN72TRwVeYrBkGfH9
 fyY1GGdLPceKdojKqirHY+8M99nc2rIFX0VJeIuWl04ja2lgW1lcFdZ+r
 5p2h7FQ5LPqOoEtT/DEXwHWapycdszL7Uwx2igV9NZpG5J/T/DnBI03hQ Q==;
X-CSE-ConnectionGUID: HI5rnn4XQhS4gKifK7E1DA==
X-CSE-MsgGUID: 51mNjFTVSS68iiKkbn04iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21147255"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="21147255"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 16:57:06 -0700
X-CSE-ConnectionGUID: CbqLMoosQraYB8Oc2gByCg==
X-CSE-MsgGUID: ZP2WRIwyTLGt/5A5DoxE0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="61966132"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 16:57:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 16:57:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 16:57:02 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 16:57:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ug/69g5fJDcOWk2ABAuZmGJcYNUmgec4hlb1zVBUuVpsXR5YTAiythvrR4q9Ek+IlFq8nS8+NOPeLLewUfmxsV0+qvTTqmPIOG1tTfCTXHMoD5dyMVamJAC1ojKD+Zoxum6UgmACGNSaHv7W4DrTDl6MT2jSYwda9DukA+9aAltrkRCethkEL4PtcOhSa9h3RwcS1nzzlBIXsWkYypSgPYAaDjDOrE4ScrbWRFU/EJ5if2GkFGKSWVTSYfNAJVPO+5Xsxs6T8RL2aaFa6gs9w3g1EOZ0m+ME0HjjRXog3hVF/yzINcplKiaTYvAGjXX4dSzJptMBVr2V8UIm/wl3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLNHJiQM59QOEaUOGb8wrQ4wUkFiV4l/lUEOZdm874E=;
 b=Z+DzQxamjLdu41asTS0uGqhicltCfQjSNiSg8+sCPO3i7lZJiR5ZTwEJUhwRWH+zgKgNtVPSeUMJ2sRPFJRW1WbTdBL0jeo5FTWFWKTSU/WgokI2pDzdw7NQe0+LqZlz76SrpaQLFqLEpSKUgQmZi+m0E3zcODeNYC2SyKFk+1nFY5Caw8815yaposItScmGAmWTAvxZXewctR1mBZi1E4f8N4XMFtgNTcdbMSt+TmtRq2UzGjS0QstVZkNffQuFCwwPNNlfc7XvD7CPmpZzSgYwXWU+e1nRQKreUVo/+P0K4GArFR4/OasuxdutpK90tXNYsTAWO/Uzw6idx9EVfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB8418.namprd11.prod.outlook.com (2603:10b6:208:487::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Wed, 7 Aug
 2024 23:57:00 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 23:56:35 +0000
Date: Wed, 7 Aug 2024 16:56:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: fix WA 14018094691
Message-ID: <20240807235633.GD5774@mdroper-desk1.amr.corp.intel.com>
References: <20240807235333.1370915-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240807235333.1370915-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR05CA0083.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::24) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e7f2690-c7df-4bfa-e9ca-08dcb73c91fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zco1/62+5cZ4Vc/JkE3ODPDTdHyz9WsuYovA3i1DT9x3b5YEEh0Ocy5XZtIn?=
 =?us-ascii?Q?3wUVQARwcnMn9BMuic9L9rwpRJUWHpM6V8aZb6lL03GmnbDbhRfbjEIYk/a2?=
 =?us-ascii?Q?u44DzKENvCmZP5NIkVWOpSNFDbKZwuS/7w7BE/yG2jfAzUqDExpLtNBg4P6A?=
 =?us-ascii?Q?o9DhXqTSRob/oSk2jt9qApxblsIB9bqax2jUFo6btRNymDGgcHFAjxyA9DzP?=
 =?us-ascii?Q?KiA+KcKXlW6C2ehrlAfkA9rcE33DJDptNsCUryrbkfwBhELb/VNQ2p7jtMjY?=
 =?us-ascii?Q?h4sBfAUmEZ7oRTIU//M39INrf3qXMa/71cnhy7cIpbifHJl/WIlh61o8ckbg?=
 =?us-ascii?Q?6YfFSjgsOmXuA3lKW2Fn1Adur5aHSDtXcs48wnuBp6eEn9LAxOAkV9odyA8l?=
 =?us-ascii?Q?Cw7QZ3FAvu885VEuCxy/h6QXqahOFCNKNQ9numC26qWfL7i7fLxIAQ6ZLmiE?=
 =?us-ascii?Q?Ch5C7ZL3RCmTUUCa3FvEg96Bx1rovW+ozvLC3X0F1h15hxB37gy2dEr0F9Of?=
 =?us-ascii?Q?mdKBCq/qGMnW/7x0SW46boLqOKFwbGiEHNLkBWfxEnOO0O7k5mP+rZk/KD+T?=
 =?us-ascii?Q?zb+zz6c82vbtDNWBNgZcQvG+fJID5zhxNn8otNYwx2w72ZzxG/Id1iT/ISIV?=
 =?us-ascii?Q?zF84JZvWLqtEXQwWZ5Qwg6Evx+Id+Zfx4vDF4lJ/UVq2IpJ+wrji20F8h5tf?=
 =?us-ascii?Q?Bn3/f125BnbiAEik0Tc12aDeAnAtBNsnx8YtAIvyD64ehxuRwxE1diFHMEEl?=
 =?us-ascii?Q?D22mDy26C0CGWbU/dZCj0UnlcdXztKv8aiK8Ck/YaGKB7qLPP6mHKRcRzKxw?=
 =?us-ascii?Q?p1fSszoq/0mlVOgF6R5TkUGBJSc6yPWQ1acT1knftrNQ+hjSEiBkNNu6Z4sL?=
 =?us-ascii?Q?os4NNmsqPyQsuZXGvzdCXqP+xXkgaWCQDCdBbr33QJnrLWn6gvpteXCU8xnX?=
 =?us-ascii?Q?+iQSEde2iZ25KEKtySLQZg311rITMNdEHHxrsaE/Z5qAdyh98d4Myy3Dyd8N?=
 =?us-ascii?Q?OG5aQcKueZtbiW9SIiiTFDQv7FEXjnSwTjcavFnwAwFrfMY5l4iUXlmPwcSe?=
 =?us-ascii?Q?x17VXQjuqYCg5ea0HtQILC46sxosQz6s2iJOOF1lCQUAY1r3Eqv/qcPr2Vwp?=
 =?us-ascii?Q?0dX+PBWuoYDZcOEX9x/iuuG5dFKcuVX+VCEuuYBemAViNN+bAk7ZOD9f2Cuk?=
 =?us-ascii?Q?IX84PSIcFvIG9L0JT+VhMHFBozFunjvVFfGSDmmdTh4iPRUvkUyEA5Cc1D4Z?=
 =?us-ascii?Q?t5hGcK6QNLbOM4dXNRp+yawz8KKG6172l6vnUEy5GHOFbVwLfD40sKEEVRUa?=
 =?us-ascii?Q?wGHuUa1HwXyo9cGRiMBf6H9UqaH39oyhq1wgEsUU9GPn2g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a5TWWt2SEJ6YfEdW14hzW1cw8Xh3klQAnZF73q9p+bz3VXVG9CUdEEnxsW4S?=
 =?us-ascii?Q?bLLyKC/Sy8S94nfxIgdfx3hydDtyqzdxH9Ks3fJXjK1w5prM5jbl5lhtuAdo?=
 =?us-ascii?Q?OStI7OmfCL+YxelvQToxsq97CVdwS3BudcD04CpDD3BxhLdCp65h0okS4Nkq?=
 =?us-ascii?Q?eCJjdDEqGtmwjP6orMyisc5gQoMinszRS9OOeUpwGxso7EaK4rQwHAngTPO7?=
 =?us-ascii?Q?Ma9f59+Rq9KOBm3XQaSSZCBjbbmIjaudjyBYSOcBFltcmIQpzv8QtNaFvPcR?=
 =?us-ascii?Q?m2A+GvLNrsQuRGAgT1aPlmFzu96l8mVXCy8F7xGbq+6zlt/S55YDrFT7YOlO?=
 =?us-ascii?Q?USYP3VvA876oSLt88zjAbZ5/i8FYdPhbNkx5V/tg7oCAzCJIkG/U8jGsGDqv?=
 =?us-ascii?Q?KukFIroXxcEMlxcA//ij45s2H/+FXVQBWFVHCokypBrf1Qh5w/KfxsflyLkj?=
 =?us-ascii?Q?LH/U0FS3RzhAV0axTOAG+OZx/Y8E+PpFuunWt4a+fwYeH+inwTz2eYNFlVSv?=
 =?us-ascii?Q?BymPCP5BKv5oUOcBuLixIEKkmToli3965nSw2PEAVBU4vIRUfVPgXOgY+9Y+?=
 =?us-ascii?Q?R8xG1tmBg7/haeJeebn33gOp/6DAgp1ORLxwKMD98GNDNo55tnRZfehvMxfB?=
 =?us-ascii?Q?F4Oknt/12NutNpDlUrWMZwflIy8pILqRIoWs/ITrlEPPip7UyAyxBJaJ5tQr?=
 =?us-ascii?Q?kqH1Y7eI7K8gaxlctVATDeDaCOiLnOim6fuS4lYZM5rWSQglFtwE7X0g/yDY?=
 =?us-ascii?Q?lKDf/eUt9PJKyP2OCai/k4IK5d6KiDrdOosBg8SpUBYhSWaTkkEm+68SqNUB?=
 =?us-ascii?Q?bYgpTrXvbKFPCUSIj1FtYAj9FmFz8mOhuN36oswyqDMehdB6tpiUNDRW373k?=
 =?us-ascii?Q?xcSXZ2VPZJoVtlVTe4MMmQf3OJ/oPPDV8b7WaFAxHanZkrcjPQvQdCjvajbp?=
 =?us-ascii?Q?BX7qbFBQTcpSppQ7gQSgqfk1qofZeyzfKSTFm/9aNYJ3RhH1C1V22PQYoXZ2?=
 =?us-ascii?Q?+jJITIYyN+WEzz4lvO8PPLRf3SDteOH2hhqDLdKqztNajm0KgHB4gf24E0O1?=
 =?us-ascii?Q?jo98elRNRGpoRAdeZ1uecjy3xFmB6cqrRrmEpaWfgAxxJuFnOVV7MY7Nuz9W?=
 =?us-ascii?Q?puISgcdisu3oHZdKvZPwB5Vaztz0F0LVn4/VyDJpzE2pRHMTtku14E87lG7S?=
 =?us-ascii?Q?jSewFnLhDDaz96V258gfs/aoWaGkJjSKm3tGgs0hkAxOjqSGpAxR4eQPiDQ6?=
 =?us-ascii?Q?RH5XDEZOCLzPt3YB9qjvQNhXgaJ7JWZ7S13W3rxOMtXHcCqXULuocsYWVg/l?=
 =?us-ascii?Q?zRbHGZSBJAQk4F2v/x6gITOv2+xkUYmWoNKj9kptqabA8p6Gh3fYufnCpQZn?=
 =?us-ascii?Q?tkx42hRhBDeOTLcgCYxPH2BzIt0Rz8Rvk6uEhGZ0AevOmfEyWS2YIkIjwT48?=
 =?us-ascii?Q?3a3Yyi3b9R5A749HBztT6Tn8ElIGnuaOpahHLaZm0bXqdYe5zt9HsEBxpN/u?=
 =?us-ascii?Q?QRdVPjGq1g5V9Z3BRL++CX5wNPiJUG2LDZJXso0eV7uU0lAG1ad9jcp5GZYY?=
 =?us-ascii?Q?WTr8P53MKzXghy+PoejvAHSnl2pMM5IGIpZzSp+0H8nFB9/l1YScgzIbFr8B?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7f2690-c7df-4bfa-e9ca-08dcb73c91fc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 23:56:35.6133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MB26tbrqV7qJ1VkWzFN/gnn4yMQbP2p9m42ur3tazV9tynIr/kCfrcg3jAOkDiopF3ufhGb6H3/YgeY5v2ZDKWv9iBjBDS+IwtT8Vlw98N4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8418
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

On Wed, Aug 07, 2024 at 04:53:32PM -0700, Daniele Ceraolo Spurio wrote:
> This WA is applied while initializing the media GT, but it a primary
> GT WA (because it modifies a register on the primary GT), so the XE_WA
> macro is returning false even when the WA should be applied.
> Fix this by using the primary GT in the macro.
> 
> Note that this WA only applies to PXP and we don't yet support that in
> Xe, so there are no negative effects to this bug, which is why we didn't
> see any errors in testing.
> 
> v2: use the primary GT in the macro instead of marking the WA as
> platform-wide (Lucas, Matt).
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gsc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index f8239a13fa2b..77ce44e845c5 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -260,7 +260,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	int ret;
>  
> -	if (XE_WA(gt, 14018094691)) {
> +	if (XE_WA(tile->primary_gt, 14018094691)) {
>  		ret = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
>  
>  		/*
> @@ -278,7 +278,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
>  
>  	ret = gsc_upload(gsc);
>  
> -	if (XE_WA(gt, 14018094691))
> +	if (XE_WA(tile->primary_gt, 14018094691))
>  		xe_force_wake_put(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
>  
>  	if (ret)
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
