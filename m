Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7496EC5475B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 16:33:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3505710EF0F;
	Mon, 11 Mar 2024 16:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKWh7aN3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB011112745
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 16:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710174818; x=1741710818;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=48lemWRERvF2b4jAVbmkMjGRW7NQv/zQTFJtl8UPwvM=;
 b=oKWh7aN3LGzBppbpY5tAyFeNsW9TLwarDfaUYbXOV5WyBw7/I6NMA8tv
 pQEOzEDDA2FidwandKDBuDnPIxkLNPNXQVQ8GrpohnAT3u0vzkthPpgks
 T2kKAQs8uhBg9o8uc5W0bVoiQJc9MWnH0YnBU98GtEDL7hc4WYcxqufxn
 qHWbB+ZPP85jg8HLvcVCItkW8L8VZJOuAL1KQK/W3J4ioSdoOGGWS+tvt
 NIabS9J1eUM3YjPkvjD32akauAlfwDW3UKtU3SviIj0AfcpgvlXXj4Tii
 jDEmYActMSvAQ4XWJ3KGwFOlsLFtf53ZROY4nHQmaHuFsIxIQkWej+e1y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="7795539"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="7795539"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 09:33:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="42141320"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 09:33:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 09:33:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 09:33:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 09:33:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 09:33:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mEgPfZXeISnxHHi4c8tGhEuDDDjHmsHiUJXookrDXrr55DnhWtNFXtL9vWTB+8xJmuEkFZsvGOH3zeMl9uUwUwbwII9xaJ6vfuRhy4qxqz7JLjovfIX7KqA0UpUCMfim97Iy7Uksm6sylZF0W61dcHfjHDlebeXkZRH/YBsKRlWBJjlVJ2gPSTJ4EzBCxXhbL3qoC0APL3x5neSYo+tlrwVL2fM+8QZ+09m2BKG7WYtIMXcnrWhzErhcZS3X6RG1ZsnMDAzw7/y3U/JDLRIBVyWfE/dwrGCN5sD0qaWzCZyx/9RJRDvT/djMKhErOZw/C8qtB2WlrJeAKBZuAeBMHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BX5vcCryMDSd2jcVdQE1ESPhdcbEIcEbPoF/JiszMN4=;
 b=FujMh3PVO5CGAkBfinPbmv4IxmSBA9v6HjKKMGZQHaV+2meRbraAXQGp5J1YctVqygpveJXVDcN+fbvXSFHU7UwJLpU6H61OV929CjwaLlBR91j2Czn1O+LieiK37dUtnXHfTKrc+FqYiHUNZlPhrdHM9PMIZaKRoYoeYuQIJVokWwUsGOfH+pZ+hsdXQTCJ0+U14AYIApBLWaaUoP9Uxx00lvb1aaSE4Hc12yE7GfQf1jlPCSFNENif/pt/zX2pcHCpdzK6z5h3PUzA4l/qqceCaQReRpZhNLgFzW+L3P+fi9+9+teNVfw0RWRel0Yz8U1T1ey0DFVqj6W4nVmTGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6660.namprd11.prod.outlook.com (2603:10b6:510:1c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Mon, 11 Mar
 2024 16:33:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 16:33:32 +0000
Date: Mon, 11 Mar 2024 12:33:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Remove unused xe_bo->props struct
Message-ID: <Ze8yWTmHYScFSpax@intel.com>
References: <20240311151159.10036-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240311151159.10036-1-nirmoy.das@intel.com>
X-ClientProxiedBy: SJ0PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: 68138bf5-4c00-4977-c98a-08dc41e8fd89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2LELu2wa5i6KcYEubVdoEWnCRBFzLiDCZFnzHnrNlHAe/8ElZIO+1jHWT0uzRBHTPvn205ND0Sm06Tphh46OF5KoSvs/eaNkRQKPnq5dt2oHrOxoUJ+MJ608k+n1SBBteMN4qtW9UBavvKj3igFSByjg6xr6IVBGTq3/jOQyLEIjC6E6QwSWzltANRShUsFGZeOKF1iFJevy7Pm1KpnQRri/4VoBQoD63V/augaIMMTdhDgpRzq/tcv2M53xwPWYEH+RDL4MR7h/fLIqLqsAkylHGNbWgr2MKIbEvVTsvUx+mntUULG/938IqccetM2HB53uu9THWq1SIWB2wFOiPcrG/FZJFJZ/lWWMgMT7ZG5CkRvzHQmpiY/aeF3BTBiTHgYrm3w6RGZzb3XxOo5Ypr/0VmCqrEl3drHLLycE/q53GMcrJlrTfRPvcaQK5cJUt14amyuOfqxybEgvF6yL5WbQeuBptXFuUIdOgiYoWjhO9nXCn6gaYmgcuZj8wX+TO3sop586SWMsrJ3kn6+n1CHIQG3Oafj0O69V9JxEQzkuGFHwRIZNCu+srHEXkGhAIlPd6H8fczD99hGYZlR3N8BNX0Rg3cf0+D4MTyuXjwEi0iS1W5ZAVaBoTqbh4RNhSmV1ym7vOwOnyIa8L9hLYGKI/B4Art5B8LVTA5fp3dU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5fk7q7PzoOzKzGV5OR+O9+g2HVRzzrWquJwOriFimqmHaVrZt/Niv5heGQ?=
 =?iso-8859-1?Q?O6vr6vsy+G/n+eLfjUcHpAuAVDv9WSUendRUxLoReNePsaCT8b25woZxuu?=
 =?iso-8859-1?Q?Q2JEX0Bxm34vhoWjKItywlyJhU+crBJUKo+QCoxfQWCRF8LO2QjOw02gcc?=
 =?iso-8859-1?Q?L8TLR2mgZUHFUP/U8Dzj7XssswqBJbsRbbBa32Tnd4kUinJfu3U7wex0ks?=
 =?iso-8859-1?Q?d+PcLdfYIcxuzTT8tfoWlv1zujutRqA1lTfY0AhVSifVXszpIsxl9G3JXC?=
 =?iso-8859-1?Q?drFZqVVGZAMwoLKC4z21EyqWBLDPQCq7xaYhEWu7Z3A9Mpx/Kh4JZsd1bp?=
 =?iso-8859-1?Q?9kA6rMwrrnC2ydLnLxwdtiOYvLdxFCNnpAfX/8s8vPA9MLK83aHWlVANd6?=
 =?iso-8859-1?Q?YmkN/oiN4wDheQRJAiMs0T2yvpObhh/SDaK3jWGOm1fVDKVQankC96m3Dn?=
 =?iso-8859-1?Q?NdNJyy/VmaM+b6PAMSatNO15ZDPn9dvMrdk1e2kE1s/eTmVfi6a+kpcDjj?=
 =?iso-8859-1?Q?LBxHBC971vPKCM+l4XM8a7el2grXvp8kK3k1LcwwX9Ld7Awb2r2o4LN8hI?=
 =?iso-8859-1?Q?2sZ+BudTnn0BcLqE4B43gR/w3xaPGja+QrEoUeBel/f+fO1Ec8Fr1VvVTp?=
 =?iso-8859-1?Q?iDbYsnaIeWV0/29Lbn15nVMBOF8C3dwgxSy1gk3tM2OH14YuZCt93MN4er?=
 =?iso-8859-1?Q?Kx5aNT0YaH2NvF4OECxIwPa2GAHVp2rXzQngswAN/D9+eVLjtPKi2VpLCh?=
 =?iso-8859-1?Q?WuIYzqZ/PfYudcoNNIWm6GG6igiL/dxWRtxMbpM3vaTk5kbWZsA42+LoGq?=
 =?iso-8859-1?Q?Lcskcbj/4Yy8BwLj31jHOy0PEjbe7deFgTe5mcB4bMY3gZNzkItmWT8PlA?=
 =?iso-8859-1?Q?xTpqOLKW3KChzLnfC8Y84cyqEZcbTLd9P0+W/Z9FfnGsVhMyiZD0Ro1pjt?=
 =?iso-8859-1?Q?0dpewS/KI2lpKw5idxBTCYz1BSE2URdabNNEZ9ZilVgNpLvN6sGVRWYoob?=
 =?iso-8859-1?Q?AGdu9eL6tgSQixi0NUrcgbB9YvJoenu9tRiv+6U3nuSyMdUrY/jZ/SLXDp?=
 =?iso-8859-1?Q?leMXSl2cC8CwUG+wKTw9zY6xMc7Clrtl2FV8Cnd0kSsqH+CzxdrwDL0JSU?=
 =?iso-8859-1?Q?imHlrkyFDQQhCyTTnOVFzk/Sso+w47XSraEIv4x7seMK0xjxYmncCkkcws?=
 =?iso-8859-1?Q?uyfL9bzxYC7QXP3rxywNiuVwTI9C32Ogigt4Yt5dOIh7yCgAusdm2WiHa8?=
 =?iso-8859-1?Q?6mOBTX9Xg0gfPnFSSEALsRWGq10YL1LW1zoBwA3L50oPtWt5Vkf92eyeyd?=
 =?iso-8859-1?Q?AAJ1bCDQOJ9eQtkD5ehwGzECp6XWYk0LHBRhwZjpLLyya/QBIyOID283zL?=
 =?iso-8859-1?Q?dmwQld32gjU8QMqvng9mhXr0FMn01Kr/4meAW5z68sFEBfhMkzwiY1p3bO?=
 =?iso-8859-1?Q?89h4yqhILHYIum8UWgVKAI3w6Qc35ZiLppUadiqHSCJX4Qx2NFm73qkGZZ?=
 =?iso-8859-1?Q?SmtHHTVF5hbXLHUPxApGlukpXr8ghtqknMGvbWOxQbgBgcwqNVLEhfqXDU?=
 =?iso-8859-1?Q?ObDXRPB/xTMlBjtc7Vy60YEylBQfqjlMHITD+gl5RQqcCtCsZghNsKtd4K?=
 =?iso-8859-1?Q?XVMxMUzjmYddpbW/TRt32zmwh3gKZfiqbrJiL/hN5v+VX4WoDG+0DZYg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68138bf5-4c00-4977-c98a-08dc41e8fd89
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 16:33:32.3895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4w9tbEIbEEjsBATDnjUg9B2SSCGKQFLrZvYrpM21YGeTMnaXBWau54pe0i/ISJtZRuGIgBbkGZA7X6vlREfPgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6660
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

On Mon, Mar 11, 2024 at 04:11:59PM +0100, Nirmoy Das wrote:
> Property struct is not being used so remove it and related dead code.
> 
> Fixes: ddfa2d6a846a ("drm/xe/uapi: Kill VM_MADVISE IOCTL")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 59 +++++---------------------------
>  drivers/gpu/drm/xe/xe_bo_types.h | 19 ----------
>  2 files changed, 9 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index b89ac6db68a1..d7e0deb1b869 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -144,9 +144,6 @@ static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
>  			.mem_type = XE_PL_TT,
>  		};
>  		*c += 1;
> -
> -		if (bo->props.preferred_mem_type == XE_BO_PROPS_INVALID)
> -			bo->props.preferred_mem_type = XE_PL_TT;
>  	}
>  }
>  
> @@ -181,25 +178,15 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
>  	}
>  	places[*c] = place;
>  	*c += 1;
> -
> -	if (bo->props.preferred_mem_type == XE_BO_PROPS_INVALID)
> -		bo->props.preferred_mem_type = mem_type;
>  }
>  
>  static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
>  			 u32 bo_flags, u32 *c)
>  {
> -	if (bo->props.preferred_gt == XE_GT1) {
> -		if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
> -			add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
> -		if (bo_flags & XE_BO_CREATE_VRAM0_BIT)
> -			add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM0, c);
> -	} else {
> -		if (bo_flags & XE_BO_CREATE_VRAM0_BIT)
> -			add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM0, c);
> -		if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
> -			add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
> -	}
> +	if (bo_flags & XE_BO_CREATE_VRAM0_BIT)
> +		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM0, c);
> +	if (bo_flags & XE_BO_CREATE_VRAM1_BIT)
> +		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
>  }
>  
>  static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
> @@ -223,17 +210,8 @@ static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
>  {
>  	u32 c = 0;
>  
> -	bo->props.preferred_mem_type = XE_BO_PROPS_INVALID;
> -
> -	/* The order of placements should indicate preferred location */
> -
> -	if (bo->props.preferred_mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM) {
> -		try_add_system(xe, bo, bo_flags, &c);
> -		try_add_vram(xe, bo, bo_flags, &c);
> -	} else {
> -		try_add_vram(xe, bo, bo_flags, &c);
> -		try_add_system(xe, bo, bo_flags, &c);
> -	}
> +	try_add_vram(xe, bo, bo_flags, &c);
> +	try_add_system(xe, bo, bo_flags, &c);
>  	try_add_stolen(xe, bo, bo_flags, &c);
>  
>  	if (!c)
> @@ -1118,13 +1096,6 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
>  	}
>  }
>  
> -static bool should_migrate_to_system(struct xe_bo *bo)
> -{
> -	struct xe_device *xe = xe_bo_device(bo);
> -
> -	return xe_device_in_fault_mode(xe) && bo->props.cpu_atomic;
> -}
> -
>  static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  {
>  	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
> @@ -1133,7 +1104,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  	struct xe_bo *bo = ttm_to_xe_bo(tbo);
>  	bool needs_rpm = bo->flags & XE_BO_CREATE_VRAM_MASK;
>  	vm_fault_t ret;
> -	int idx, r = 0;
> +	int idx;
>  
>  	if (needs_rpm)
>  		xe_device_mem_access_get(xe);
> @@ -1145,17 +1116,8 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  	if (drm_dev_enter(ddev, &idx)) {
>  		trace_xe_bo_cpu_fault(bo);
>  
> -		if (should_migrate_to_system(bo)) {
> -			r = xe_bo_migrate(bo, XE_PL_TT);
> -			if (r == -EBUSY || r == -ERESTARTSYS || r == -EINTR)
> -				ret = VM_FAULT_NOPAGE;
> -			else if (r)
> -				ret = VM_FAULT_SIGBUS;
> -		}
> -		if (!ret)
> -			ret = ttm_bo_vm_fault_reserved(vmf,
> -						       vmf->vma->vm_page_prot,
> -						       TTM_BO_VM_NUM_PREFAULT);
> +		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> +					       TTM_BO_VM_NUM_PREFAULT);
>  		drm_dev_exit(idx);
>  	} else {
>  		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
> @@ -1283,9 +1245,6 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  	bo->flags = flags;
>  	bo->cpu_caching = cpu_caching;
>  	bo->ttm.base.funcs = &xe_gem_object_funcs;
> -	bo->props.preferred_mem_class = XE_BO_PROPS_INVALID;
> -	bo->props.preferred_gt = XE_BO_PROPS_INVALID;
> -	bo->props.preferred_mem_type = XE_BO_PROPS_INVALID;
>  	bo->ttm.priority = XE_BO_PRIORITY_NORMAL;
>  	INIT_LIST_HEAD(&bo->pinned_link);
>  #ifdef CONFIG_PROC_FS
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 14ef13b7b421..86422e113d39 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -56,25 +56,6 @@ struct xe_bo {
>  	 */
>  	struct list_head client_link;
>  #endif
> -	/** @props: BO user controlled properties */
> -	struct {
> -		/** @preferred_mem: preferred memory class for this BO */
> -		s16 preferred_mem_class;
> -		/** @prefered_gt: preferred GT for this BO */
> -		s16 preferred_gt;
> -		/** @preferred_mem_type: preferred memory type */
> -		s32 preferred_mem_type;
> -		/**
> -		 * @cpu_atomic: the CPU expects to do atomics operations to
> -		 * this BO
> -		 */
> -		bool cpu_atomic;
> -		/**
> -		 * @device_atomic: the device expects to do atomics operations
> -		 * to this BO
> -		 */
> -		bool device_atomic;
> -	} props;
>  	/** @freed: List node for delayed put. */
>  	struct llist_node freed;
>  	/** @created: Whether the bo has passed initial creation */
> -- 
> 2.42.0
> 
