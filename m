Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954FDCD6E49
	for <intel-xe@archiver.kernel.org>; Sat, 30 May 2026 00:20:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34302112631;
	Sat, 30 May 2026 00:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RdaM5m3y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E7B112631
 for <intel-xe@lists.freedesktop.org>; Sat, 30 May 2026 00:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780100434; x=1811636434;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UYyDL5LridK6CGulKl5wh66RvTDhGwNtHxfk8ubZBZA=;
 b=RdaM5m3yUQmi+3l+ylci4H0/pVlMqQ6DTrYNOXRYKM7n31zCltoIZAKa
 5S8yVIbqpXc6qeGH1MSSEeO2K8GzsqL3wkQplXBQPs30kCW0AvCSH3yQm
 SC9hsyh1g3cWd0pzjySDxik1OZM++ElzGKe0Qtheo6XXUum0HgMPkePXQ
 DnmoDapdlgyAuYdzfZCRrNqi9COIQe1nxK8lzH56pmd/yzhmjXXBjUYbg
 hi+uGGLeDSJAYxbzUuiiq0IDjhM4ncW8OOrja7J2dalxB0FDuFHlRu5yF
 i8SCl/0ywusZvNCzgn1XDJ4oqd86wtcauoMeG+orrJp3GTaKpGlVoOelE g==;
X-CSE-ConnectionGUID: 5ou1tA3+So2xu0YmSguqqA==
X-CSE-MsgGUID: LxC/xV3vSiyFr1ch9g6Ltw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="91265759"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; d="scan'208";a="91265759"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 17:20:34 -0700
X-CSE-ConnectionGUID: PA+Ap43DQFimrSDBVumNmg==
X-CSE-MsgGUID: NkoZJL8yTa2iC8uJkf9i0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; d="scan'208";a="242861830"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 17:20:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 17:20:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 29 May 2026 17:20:32 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 29 May 2026 17:20:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYxTysJtHie8GqAYQq2hKBIhLl/IvZLEJsVpaTODxQ1dkH6KKZ98yFK95JUi/L8h5fmFqv8xfu1upsTneO6bbUa3yy/ecMU7RPFIw0F7IYBlSmV7RuTViDb1rU9TeYrnJTlPhHSNXvX+2sNoxy4Otz21hS2JR2JFXVr7ZdptuO8NKuQeU1yl8rPkhEeqO4y0HNYxJdvCH+4VIK3NScGwumIw2CXj8FyF+8Xk/uygBWg8Y/+5hr7N71RLhS+DNfuATO5EESC8ycBJca4J/oyHCtbEwhQT29D6faYGaRubTEPwEmf+jfcsu5pWJ8O4EWBZSvHEFWjm1bHAG7saJBM+FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ge9+r6tRCfzrQTjUobPQIr9m7E9wLRz1MYfRM+UYhiM=;
 b=Fs4dtxo3mu11HJTl43TqbCAMj8EW+01J2pOZzDRZ8a3DZAKndWYRnEt7zfSq8TrQApY9WGlX8qyihRnjw2j+HHZSrUCggX2KmRVwmLEhuozApbyy8PqlLdbjDmsDb7ru1QAwvPuogLw7aeGUsUgLBkh9jCo53lfcqWo+Xa0hKQYee1o+8sZH+3xKiWRJ/INl71VJtRXY6MvgB0YYe6bfAcx8rhC8eAa4zIAy5+ineu2DZsMueQMpn3APndcFTLsYuA/K5eIj5yy2c8CBAjHDikK/X0nx6ryWh4QUndMApyQFCao4QVauHRozPwbbsev18Rz+BrlYqpcQ7I18NF8yTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by CH3PR11MB8363.namprd11.prod.outlook.com (2603:10b6:610:177::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Sat, 30 May
 2026 00:20:30 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 00:20:30 +0000
Date: Fri, 29 May 2026 20:20:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pcode: Don't ignore drmm_mutex_init failure
Message-ID: <ahotSpaaIBPWKksi@intel.com>
References: <20260529195956.25349-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260529195956.25349-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0176.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::31) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|CH3PR11MB8363:EE_
X-MS-Office365-Filtering-Correlation-Id: a10f02fb-30ea-4f86-b2c6-08debde14170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|11063799006|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: +MRqVemYB2kWCmRkE0Np+pjZUBZ2dvroFyMlG5dhn19j2vrQMqD2YcNu/U9G7HSe0/ncBABCUmkb6HVN2/4xZlcNVEFHtW+gL+aScSMJGem8B11xm75ijZet07V1yQgh4J5jThNYh0t+JlAlsmCQf6ZiPr6j2pHqg/FBieSApf9ThAip7aicTjnpIcl1gJ/DM2c1zFzmtWylPgFA3gaMY+7VpbNHBvtqryOWs4Kw9aifPu1jmf49ZlOfMrTfNFEwvicl70FVZfzSwer3sTwxr5KlyhES+HBlChN09jaFb4ClpJVfHeebEigCzzwjqpPnX9POcSzllK0iF1gzvOF7T+vLCgFP6DsRL4STLg7js25Uk59p4NV280ObpCAThdavlGhnhQ4b15cZNU9OOVb8hD0zW2amL9R87/RdcEFR6BB7JUqBWP0a4gyMdkdjINr3dSlfQDA6pEV0GAkSIqEOfHDnEmXgTkP6ePg/34zCGUSNrkpxk+xgduw3XExsk+cAMRxT2DH6RxjAK80oInf3Oy0FAU6rloh3AZtci4gG/c57E3f9x7OW8yev1Bl/GD7QpVhNkMHOqPw/YhXn8pJeilH/Ef0QEPQwSwKUHXqQtGcnuwX0lXTaow4UU1OIJwzbYGFN0FUy+VDQ/+DsOeuTO8tnRotakwyJGnN5wAzb3yF3lHkmNGad1ipJPsQ7B6Cs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yf452kliUtmDFYEkhAAqfHklwgYjyOBv45Ec9ZhJP+fNNEvTPJZuYQsFIdug?=
 =?us-ascii?Q?XEEg7YhqBii3Ug1P9tohz0s+anJG3NFkXPFX9IvsMoo7xkv8+5mnItBBIEc5?=
 =?us-ascii?Q?44sS7VEQ68JDN2GR+1Y6h2j8xVruJ9P6oKyImtNbLMe0BvrevJRGRxapUh0S?=
 =?us-ascii?Q?qjtyBHtth1VwXu2Ov2b7rG+bV8AfxzdCZRqLGJMEg+1RUjG+Z+CYO0bHyQoU?=
 =?us-ascii?Q?RfugW0nWhLquQ1jdftLdkQ7t/zy+Q0O01hSUne2UottxlqwEqqsBGbJIereg?=
 =?us-ascii?Q?K4cmZOL/PDPIdHrOFubwvl58FkNMVZVTnr9C+eU5/gcio8z/BaHrRJCsi61L?=
 =?us-ascii?Q?XXitPEUCS48KlWlu+oKtnrwgC8PNTd/Xzu5ZLD33dTacNn0wnBGCP6HK0ibu?=
 =?us-ascii?Q?HDc9hGs5yLa8NIv40/KxwPiqNXtk5N2Ch1dVkhvpga1SSrU0i1RlkPczLF5O?=
 =?us-ascii?Q?Zzop690VEXELY1BqYySfdQURCOHJPAp9k4LMgilzyGdcotQ3oBG4VUgrBXQN?=
 =?us-ascii?Q?H80pjFA/iHDMJwMH3qn5t2kkHzcnAwE5WfyQ/8VvbLlWngoB12wLZg+JcuUc?=
 =?us-ascii?Q?Piei8Rx1zA21QszJanRY6KjXrXxZ2nPSpfyfWbfww/k3G+qPtNQluJ63Ezb5?=
 =?us-ascii?Q?Nc2zcbpPosdXGv/bmKCdqOEHbz3CYZWLM4Z1E+8dVTGR47gJ0I9BA4SYHgFI?=
 =?us-ascii?Q?CLT/jRVR9mXxyV/BVGiqPVH92B+R+xOuDSIxtNeYxuS4LYkkINllBCYYrQsE?=
 =?us-ascii?Q?7MIVC2T3M/hBPMuPA5WN8UNpsKoVLJj5CQfxEXfL5fo/m5tgOLaJqvYJsolO?=
 =?us-ascii?Q?jvDYtTDAWf7fshDaQHk0dugTn6MHu3Q0gc+QichtdZ+WRVZT4kgfeb9ZizU+?=
 =?us-ascii?Q?Hhii8MFYSU68PtOxUI1M3F15reHUQxBT/SavKNjrE+eAr7QwLuBV6yKU9QXs?=
 =?us-ascii?Q?LNZUoozFgbLN26DiQJmZWIamWKnp8WZ4IpBIdBnynm690Q+2hmBscnoWUerW?=
 =?us-ascii?Q?SBONUwpucAlGmQWeaplpzxMd6Rdw7fZ4KcbRDrEszHLsQDBnfBWOl7QDV9eq?=
 =?us-ascii?Q?D4/5CPfQrwJG0zEBHz9T0UDGl+CwXoMOb2agOV6W3vMeB0P2RPusvkN5VwD5?=
 =?us-ascii?Q?iOMFNCzKg7wEiMImQ+ttcjyJHFM3WuM/8SLGiDAmkJ/UrSkAPaJkLsE31k+i?=
 =?us-ascii?Q?d4EX40IcQFVCT/o2eQH5xj+M9SGlUh2AY+r4mZF0IDbTeSc8Gd6nDzFWC6wp?=
 =?us-ascii?Q?VkLz1PTPXTYS4CzerctuPWOVIFbz4ykopw5/0+/Q3Aaed9ESDEQGCz4hYfTu?=
 =?us-ascii?Q?7EOanvdnG/KSkfZW40PANw4P9cghsVI8A0gLml22TE6tczKwhqnBX3bA3CBI?=
 =?us-ascii?Q?xak3YMkU/j88D4acjpiYrd7Fq+7vztqxBdZtCD1iwA5W2zdKS/T2gtvusLBl?=
 =?us-ascii?Q?YCG2I6nAqEyvUSUOIcruflFJLhkfsBWd9RWIrTUVMaRlA9U7SUa32CnrRmZa?=
 =?us-ascii?Q?8DmINrZvXgv0Rs8w2MsILciehWENhgXnku6ZTFhxyW3toXEKcqn8EKAdsfVB?=
 =?us-ascii?Q?mQfQPUP2aQDBuNYxrYWx8bCmOrUdhce4AUkBA9Zhcdsz0oI8TSakvNKeHlBS?=
 =?us-ascii?Q?A+RqxqJqSOXZVz/fFcSrEfc5SY0fL+VqPVp4YRSGMAoNdC1YgioHqHajn78+?=
 =?us-ascii?Q?lwHf0ZLVrxhAVnbVdPu5X7ZHRSm8SJfLB3Qho8j+4rUaDYnlny1FjCAFeCPH?=
 =?us-ascii?Q?+5KLmMOveA=3D=3D?=
X-Exchange-RoutingPolicyChecked: UGnI7q6U/Z9Ryff8ndG0FovXf1X1p05oi0GaFGC1yyeYF5h8hP+fmuiRK1kLT33x7uL8J3ewNhMIEpn3Sch0ORfLtin9e7KXWQt4N0nnUTFsqHCGzngaVz1o19sFhjNJXt39Y0m7jegWDgfiiix5cdtZD6gKG2eCtIXH8ET909fOswfGppXi/ZXyLb/qOVonkWqaMS9Kyb910E0u6nOSqeEwLyOIqi7C1X7Pi8Fycazo1Rvd5aOagusgewHEqWXx51SpJ3bBq48hLnYX4loMUBw8ICIretEBtCLYQ7s7+nSn0NH4SzweWVubcbaw7C/gpIqrZFlDhA5ii+1Kfo8rTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a10f02fb-30ea-4f86-b2c6-08debde14170
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 00:20:30.3940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRQ/2FVqZZ7v5g56eesusjOeGO2IHswFV8vMwQoPLQbhQ6fVl33u1HT1vTQcC5TTYIPAhf8ySB6xC2xdLEOYqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8363
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

On Fri, May 29, 2026 at 09:59:56PM +0200, Michal Wajdeczko wrote:
> The drm_device-managed mutex_init might fail and return an error.
> Add proper error handling. While around, update the function name
> to clearly indicate this is an early software-only initialization.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pcode.c | 8 +++++---
>  drivers/gpu/drm/xe/xe_pcode.h | 2 +-
>  drivers/gpu/drm/xe/xe_tile.c  | 4 +++-
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index dc66d0c7ee06..866986694d9c 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -323,15 +323,17 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
>  }
>  
>  /**
> - * xe_pcode_init: initialize components of PCODE
> + * xe_pcode_init_early() - Initialize components of PCODE
>   * @tile: tile instance
>   *
>   * This function initializes the xe_pcode component.
>   * To be called once only during probe.
> + *
> + * Return: 0 on success or a negative error code on failure.
>   */
> -void xe_pcode_init(struct xe_tile *tile)
> +int xe_pcode_init_early(struct xe_tile *tile)
>  {
> -	drmm_mutex_init(&tile_to_xe(tile)->drm, &tile->pcode.lock);
> +	return drmm_mutex_init(&tile_to_xe(tile)->drm, &tile->pcode.lock);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
> index 490e4f269607..18260c29e620 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.h
> +++ b/drivers/gpu/drm/xe/xe_pcode.h
> @@ -12,7 +12,7 @@ struct drm_device;
>  struct xe_device;
>  struct xe_tile;
>  
> -void xe_pcode_init(struct xe_tile *tile);
> +int xe_pcode_init_early(struct xe_tile *tile);
>  int xe_pcode_probe_early(struct xe_device *xe);
>  int xe_pcode_ready(struct xe_device *xe, bool locked);
>  int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index c465aae7883c..74d925a337b7 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -157,7 +157,9 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
>  	if (err)
>  		return err;
>  
> -	xe_pcode_init(tile);
> +	err = xe_pcode_init_early(tile);
> +	if (err)
> +		return err;
>  
>  	return 0;
>  }
> -- 
> 2.47.1
> 
