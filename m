Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794CACA6002
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 18:20:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2505110E664;
	Wed,  7 Oct 2026 18:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AMtdQibQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D17310E664
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 18:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791397231; x=1822933231;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8LKIf6d3rhsGTifsZ6zTCrJgezZEGdHi3bvhOWxnsPo=;
 b=AMtdQibQCPsKse6JsOPgOeB4YoA8rZiF7swo9WTigHdEt7mdzncp1TUc
 YskxnjgyZN/9nC4E5oZEN2t0ShOm+szQ+y4CF0GahlsKpIMFQLs1RMUeF
 xpPnb76AWWnUtT+NSdbQr3wZSap06gkF6d76gUHItkPTIrAl7ZfPFacv8
 TipEvGaeM6mcUGvRoS5tFIhxhnrI7XecEz+zmFDM87y5I3NFbjEoEP6Dr
 ImTYNIhatRSNfmKTTJXLI87A/RFhStpNvCIlkItZjAFJ2YkWNQrKGLqWB
 VlZa+Ne/W2+QI0UNPo9HU95sO4reIczZZmJT+k0aoJuxfD4azJMEhLTTB Q==;
X-CSE-ConnectionGUID: uakK7eh3SV27CM+3Lz2gGg==
X-CSE-MsgGUID: BLUWjFeAQ9yXuP+4EzjuqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="173036"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="173036"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 11:20:31 -0700
X-CSE-ConnectionGUID: xRQIK3HnQVqRue68qnsp7g==
X-CSE-MsgGUID: f93PhErQTjC6udr+mGGJLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="1597269"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 11:20:30 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 11:20:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 11:20:29 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 11:20:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYCsfci26E4Hdkjw6kpwfqB/UAP0NbrhcU7bmbE/p6sPNmvKV2OZ9nU3boFqW3pfc6VEHKGJ+ThT8A9+ioZT1bjsZ5KXAWaqY9e3tWr9tsL4ZMPkmN0QZDx8zFpL3gI0i+0j+1t/2pj/pSZWgNFPywaNX2UJiu6NzyNDMM3H51ZSYY2EFPKPdLe2/HG7xmd0bwoBCmKZjvEGlaGcExSEDLitrfdkzGvsrmpRlHTFc+o3c89UMhYZsDKFc/ZNef0qAo3wWxtqw5rvQeDIGzkoDJJVlA3R8o4hivjU2b+A1Qe8sBg6D3FYAsEU5lYJhBXHx/Hn/6ZmSc2gKlkF1OyjRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iP6WRzZEXZRh1YQc3MJG4lqEhkk6cDvqjpaAvFBUH+A=;
 b=Vx30z50Gf+oivb6OeAQWk1nZM94jeZAXeHofIg0YWbtdCkwPnRKbqOR6X85o2meHi4hrwYuMGmuwmTRaPR72nODzMbZOvp7jBNJEmVLiUshVwSr0LFM/q/pT3SN1l77vezTVVnTNsMybbEV/LQIM2ySudzyeGLPvbnghVYv7zo6vB+29tEbU/JvMRGgwwRdX2T5zbLC0ilJaAkQw1vE/3m7x5bIvLXWv83G4LzDRk1FuVOcNPcqvRQ6tnvLvQYJe6RR20S6qicoPN4Dls0Fv1f6otDWINyoGyI1Lbz4nVIlLTpBTdF4CSP6Or4vJP6Niz1f1FpiJAIf9l2fwO5kjZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by SJ0PR11MB5006.namprd11.prod.outlook.com (2603:10b6:a03:2db::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 18:20:24 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0451.026; Wed, 7 Oct 2026
 18:20:24 +0000
Date: Wed, 7 Oct 2026 14:20:10 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v8 09/15] drm/xe/hwmon: use CRI-specific package and VRAM
 temperature registers
Message-ID: <asaNWnCxlwgEFkCe@intel.com>
References: <20261006033534.3583967-1-karthik.poosa@intel.com>
 <20261006033534.3583967-10-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261006033534.3583967-10-karthik.poosa@intel.com>
X-ClientProxiedBy: SI3PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:295::7) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|SJ0PR11MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: b360ecd5-17f4-4d85-dadf-08df249fa6e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: RiSi4IK07eQsnBmlItcnlPAQZcADt4lqMK6sdMgMbtQyehzyQxbZQwDeAlrQp0OeP/dC7M9hmPqZWXlyhXBJrfNzEhpveVjmRLE2gP8X9aMk45Zk2c8vaUpSqkmQN+DIG0GHzudjyqxnX2AwpTy2SsGsqaz5tjfBOzOWAqb7Pa8X2/QI4MSBnE7d7eJ4/gVH6NhtXmrWSWxiUdRysykm6SVghjiOhhJdIp6GsCap4qca3NHNT602Ae/jogpWh0mM9qCPHfnwdYIkcncuwr468RHAdPgrhg4m873dDLudHEZdx0wXpd+v9SskMBZwc4d5T1YdjJlqT+JPUSugeOJfhXoq97+zh34TGbBn+r/jSkjypRaEcvIfga+QjAXq0UYBOeSnXUN1Zsbn5SbcVSUl2mQ5ASYDZIUx1IV1ju7NdZy/cbr96yWXTgjWuVczYFN3u3SWC+8wI1bDpounYWDSuxftqoYYow3BWnNgezuz/KCg+duzCBAwZlp6flmxliC85bqJD51oNTmopY7nWFcjzBcGQQMJMiRv7M8ZbczVr/Mwzbpw2wEjiFORoBx8hDxBp/u/IasK9KX5sqeBoHuQ6lpIWTpJOViuzQNklzpKaugVFqsuLRHICan2gCtj0ObvNNNZk5BFc26Y04fKKcy6jTPWo3K7UgfdbAkqoTHCzh4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4BkN4kdQOSMaZDSOw0UbqVhA7jnqKtbZJv02iJsmz9R4O7WvtYWtqP91oGTF?=
 =?us-ascii?Q?JGsKN3fjVWL5b9PUBgOHv+xbi8wbWy2Kl11OZAwTWeJmCHSokSPHIDqrjL7j?=
 =?us-ascii?Q?b34TVR2Uk/vqeUTl7dfd9AhPNX6sYVJqzCX9iuBXKcPnlw+z50XmmkKE8tzQ?=
 =?us-ascii?Q?EiF3tDpZ5j2GL36MzkUvUuYUzwbQBoO6+W3oQsy5ttoMDWFjg5/bSOu8NR1A?=
 =?us-ascii?Q?S+iOJwU0q1vH4LD3Pe1x2IlI7gd2NhhCbpExok/sinL5x007eOdZQsRnljjw?=
 =?us-ascii?Q?VjPCxaBEfGBdKp3ZHpGjVQwsjFOl1FaVER2bYastV6/tlMT62BKRapiWRnGr?=
 =?us-ascii?Q?vzlPvbDoXYmYsgm4mx5yF1fBCHnxFzq0laKRszhtVkURc7srp49g0QXvr1ur?=
 =?us-ascii?Q?wCEjGVFg5boJT017rHbezYGWTtJY9wWY3Fg3EchuOcJkhVsPmZNU+Gc1nAMl?=
 =?us-ascii?Q?daZnOf5kc1cFiKybsxr+gw83CxNONKqG4q5o4+6pokKOM+VA+izxUzyVyRAd?=
 =?us-ascii?Q?RIZI1T0W8W1TqSuAxzk9hrX1h8itt4TEzk4F0TnH4F5ZyjEigejKXhnFN5v5?=
 =?us-ascii?Q?R/5pR5sxLC73rxhazTPpoy3vJcnRVwFTwv72kzaK9F4BUJOQlyWzC18Cn4Xh?=
 =?us-ascii?Q?qyhhc6KutxJlohHyfy4x5GsSLS4CBQBoutp9Y5ZX6WmBGUZ1P6+7dm4MGkYr?=
 =?us-ascii?Q?5Q5SmjFtDZgsl0qefwtPRnjRtUgNbZiBZxK4K/G4nUZou9pkcqRce6hkbHtB?=
 =?us-ascii?Q?zK2Og1a4STJhoccYhDy9MsSodj1IN0KjnMCjUV027+WNQmyEwbWU83lQNfb9?=
 =?us-ascii?Q?rAPVZvRpjOvULP3OPa0R8olBWTUNRbdf+8vWodrEqWJSi85c/VRYwwZTlIs2?=
 =?us-ascii?Q?TOtV2cI/mGi8CX3V7fBzkl5GwubCeu98O9XIJ3hlAdZqaYCQEMaVUs+7j9Vj?=
 =?us-ascii?Q?FuSvpmcqxmsc2125fRB5e2uVvtS92ae4f59SR8x7JYzLswIxCQPRIg4DaPR7?=
 =?us-ascii?Q?/NHaZQIiMjoNGrBxvMxrPAtXH3+qCSlWwK9wDFCttldut8/8UEkXlhLE4SeN?=
 =?us-ascii?Q?9/ZoWWIR9s+Ytq5skaU4emkITJwP6tcKMrDoCefNhtRA1lQM5QRl7VtpWJ6y?=
 =?us-ascii?Q?3qm/UtXRNNwzLsyutGb5a9f/92GttaNvP0TbTRcxboNQZ9lbumUCobySru3I?=
 =?us-ascii?Q?sYG65ZvZ9ZPFB0GvI2Th8dixOz7FSxU9YSuTK1yXO3wJZKA/FIoAKLcyT6si?=
 =?us-ascii?Q?DFnVJkXfq79DtcM8TquGRmP9u2oonWF3uxJ6w342RN27Y3CAz+HnSPS0fyVV?=
 =?us-ascii?Q?ufsBo6Na99WVi2P/G1/1KeDm0YMUgxUnF61xHZRnt0WZDAaz+TcidekKarER?=
 =?us-ascii?Q?77Pg7rLcTdB3e6kBNYKqofo0CfX8cRdq6IuyfWnHbnNWft1TpPf7KkjcG/m8?=
 =?us-ascii?Q?j8TwvQsxnmvQy9dqTlMePW3awfqgMgXyqHm7edpPz1lLo1m2Xxs/A6ylTv0p?=
 =?us-ascii?Q?VFU7F3utCXek894rv6XNTbXHvISOregKQKjwcTD6Ky88hDYUawI91ENIipT8?=
 =?us-ascii?Q?FWC5L4hJZYKFw2rAve95A4WKPQm2rT4C8s68hiu8+fEIx57p1i/8OWj69UF3?=
 =?us-ascii?Q?fKzVPnsc5hUV6O+4JqzhRyTzD4+5VPFPixe0pI3vATdnVTtQE/39T1neGylN?=
 =?us-ascii?Q?I0ts1KDucpFt8A+yVNVkpBOxX2pmhPfhUvMmBAgg6K/JhtoCUL8tcWd7inAQ?=
 =?us-ascii?Q?zDne/Iy/zhFzKGRyNfXG8Es59DBp+uc=3D?=
X-Exchange-RoutingPolicyChecked: 1NCk+hIXdLr1Fa/7yHPwokBxKMO4otj6Sye1ha4MyY6YbtozwJaIvayZuW6RbN5rJVOSWccZgOu0WUWDlmDbyRHRR7tNI3ivUlWsygTqtyFqs9b1bIy2ScKqNNEPwc+UILbmxUMsJikX22A9l5az87FKVma6p9fw3dPEfEb2m7plczI4VtXlwPAsMZLtF04Sk4e8C7blBYNRXKS5iLpqjDfwBwoI5VCBChX0pFiQtH18ZerEyWTIiRv9x+IlZBPGG7Xe6JLWIY5asZ/p+ge9hCZ/l9lec4uoQv8popOrENaIeBrl0IRbUc4f+evcHLee/xUY8JEsG6n4SJXw6QwoXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b360ecd5-17f4-4d85-dadf-08df249fa6e9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 18:20:23.8024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9/PWZ6wvFmuuAr7BkKU7E89cwbxsapnTgFsx6nNvTZuD8krr+yYT4VOz4dgdgXsPOHfE4MwBrd7+NRfxfgryg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5006
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

On Tue, Oct 06, 2026 at 09:05:28AM +0530, Karthik Poosa wrote:
> Crescent Island uses different MMIO offsets for package and VRAM
> temperature than Battlemage. Add CRI-specific register definitions
> and select them in xe_hwmon_get_reg() for REG_TEMP handling.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_pcode_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_hwmon.c           | 9 ++++++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> index c63b409d7a82..a969661f0c95 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -28,6 +28,9 @@
>  #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>  
>  #define CRI_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> +#define CRI_PACKAGE_TEMPERATURE			XE_REG(0x138344)
> +#define CRI_VRAM_TEMPERATURE			XE_REG(0x138348)
>  #define CRI_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
> +#define CRI_VRAM_TEMPERATURE_N(n)		XE_REG(0x138a00 + ((n) * (sizeof(u32))))
>  
>  #endif /* _XE_PCODE_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index b8682eb233e4..bafa175f8457 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -276,7 +276,14 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>  
>  	switch (hwmon_reg) {
>  	case REG_TEMP:
> -		if (xe->info.platform == XE_BATTLEMAGE || xe->info.platform == XE_CRESCENTISLAND) {
> +		if (xe->info.platform == XE_CRESCENTISLAND) {
> +			if (channel == CHANNEL_PKG)
> +				return CRI_PACKAGE_TEMPERATURE;
> +			else if (channel == CHANNEL_VRAM)
> +				return CRI_VRAM_TEMPERATURE;
> +			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> +				return CRI_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
> +		} else if (xe->info.platform == XE_BATTLEMAGE) {
>  			if (channel == CHANNEL_PKG)
>  				return BMG_PACKAGE_TEMPERATURE;
>  			else if (channel == CHANNEL_VRAM)
> -- 
> 2.25.1
> 
