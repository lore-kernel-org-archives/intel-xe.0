Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BECCD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 19:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9238910E275;
	Mon, 11 May 2026 19:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VTIHM0Et";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EB410E551
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 19:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778527810; x=1810063810;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gJIoMBojUqvsDLmUvLwbaCX3v/OhRfPBO6REm9JGqiY=;
 b=VTIHM0EtgzohaI8gkw24Kt+MJIaFbUADprEF+cG/FJSNdvXjCXm0N3QZ
 /JIOGFYcs8YK0GRLjZppouvQZn5dTfA/rvZGVQ4wINJX4YmorJLHlMxle
 M/QNq47G3JlqAoejxG5ZzNrXlqt81Y7Qb1uF6L5U7AIxbsP6invpXAw1L
 jedaRZZ1aP+j0VSgtBDGYniaxzizymGAs3K3HBSCZ5BByMaNYIaU54TCH
 1li/mAbG0EcA8C0sv63mGcXr4DJ+MULq32aA2lbgI3MffHMpjbFPTmFM4
 NAnQtCiP+ol+IzRZagh1mnzbTWR9mGHioTHDEt7vpnkxtEeBFUGqxMvYw Q==;
X-CSE-ConnectionGUID: QPqcSmejQoa7rojHvCBCyw==
X-CSE-MsgGUID: pybVG0odQHaRHPNujqD6SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78458808"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="78458808"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 12:30:10 -0700
X-CSE-ConnectionGUID: ykuoOm0YQm2KqZYe9HOeug==
X-CSE-MsgGUID: T5koCdGdSvmbUO3RZnCbxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="237772618"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 12:30:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 12:30:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 12:30:09 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 12:30:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtlgTEynhmE96uh2UjXajo60+A5AMskVCIHOLL9UrFSKoZ3yI2fPZtQccYLSB2xr62dzSoDNt0omSsCbd6RuoAu8OrY7XC4P5By6/U4w0JUfyzRoYZg+FJF3FJGzGgzHdiqip1SrAt/rL0DWdeJvJcXbbpzRDUjPckGzZe7wV6rk/+u1L/H285uf30P/6sOpa7Dti2MMBrcvD13D4ooJdPit20oApzmbvpg0chR0UOgpS9rb7dXxZ8MkVpGroRKjLi5ghWcgzekNHvikhP2HL2s6uxRrSIAiw9NP5JzwYBWGZjU/Vb35y5s3SANxS9OseXvP0s4h6PEh1mxkqcgkrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXTkVMckOy1bElqPeH78vHeUIcOrEfwCPhxLnSpicWA=;
 b=g4wk8yJWX1xj4RJ1zas+w/yngro4wTKPrdWU6lGbFZvke0JvZfAL+ShFXLy0btxRBhNNeZNFFkpzQ16HSAIh5RWSXdvZV1dvKKHxZuUAGNUqrIepao2GO6KnSFYpyYYMwqMG+0EuCO4eZAwQmms/EpRox+0AmVr235wxuePike/ExM8jTzekUo21UlvI5LLpJf7CTxtiQRMAtml/vJLEudm9Okog4ripuuv1Vxb9GvahQdW/wUOKymET8t6y+zFJm8AKWAatqYMP0woWNuvjZf2+rq3/idLGPME9kLWdB9YrKb6m1qQRl+IgErbcTnIs678C12bfCVhLvySMSC7VFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SAWPR11MB9733.namprd11.prod.outlook.com (2603:10b6:806:4ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 19:30:07 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 19:30:07 +0000
Date: Mon, 11 May 2026 12:30:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] drm/xe: Refactor emit_clear_main_copy
Message-ID: <20260511193005.GT2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260511123746.616662-5-balasubramani.vivekanandan@intel.com>
 <20260511123746.616662-6-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260511123746.616662-6-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SAWPR11MB9733:EE_
X-MS-Office365-Filtering-Correlation-Id: bd83c0e6-bd12-4070-2401-08deaf93b555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|11063799003|56012099003|18002099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info: JG4i/Div+7qkJ7nqurmm2lAEwYmETu4+7p++aVSvCr66ZojOdT6gKKq8yt9ImZtXJ/Sq2UZLDRJct2j5WLSA5R4CVFyuu4fjljTwa55pOdnIYMw70urOEso7D+Zfghp5xapw5pFeguzXCFXCiix7MCvJFmjmsxMZXh9GIPT+/Htk17YB57UC4W2xPoBTlW/O+lOEwsO72aqS5CpAGcQmWAdypoH1MT4IRPkavxK3W2jabcm33LgChvZEedGYpACrQm9WW5id7mQDHXOIwZPHj2lspOitxsujnWvl6pdlvqvVqdsuIGcpxKsvXao6j2njo1RQqzRIscw8Lobd1Tv4EjlKhjYyn77vUGBRmz78hV82Ps6oMeT0NaDwoYGc8D8crgBwTFgr21ZXtqvVKxKCQKJ4uyr/kOvrblF19wWnMWfFASwxKcUmaS9J2fxFXoS7JepBzicmVagv3sXufoc7PbP3dx/YXKlXD76/OjbIP70XuWpxkLWM7iBdGbtLmCP5QsTu7Vf2NMC22MYu3nmURVTHydDoLjo9RFM/fLMaGliBZE26FpftSDfntgiLE0RkRY7m3dw7ZS92bTDuCpI0pYXpsk3MkOI42BQwmow6PgkSALGbNmil2DKExUJQ5cnB2nWXkBA0vRVQkuv6ex3QFwyQ+Ustt7/lfqFiywJTTFvKf0RZOWf2AkvkwbvgoFAv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(11063799003)(56012099003)(18002099003)(22082099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4rJSqEe4SySPgLyywCbUQiGtqqQ44/ZCum5e0r0XZeSLFF2oRT6pqkEwSxIw?=
 =?us-ascii?Q?dkTytZ/x+9wy79njQsLJQsxJOoouWDIMp+cstv9MVeTutfUx/7Ec/9UJvlZV?=
 =?us-ascii?Q?OkDzU/8mzCceAlI7wLGexxAVvXPwBRmXPiPeo33C9cRB5UKSyJsRLRxCKabh?=
 =?us-ascii?Q?BzqHS3wYYM0oEPiZFqL5jrk5TqsMur0K2eyMLPMaWBC0dm5GFfq246e0rmCW?=
 =?us-ascii?Q?8cjNIueW2NQnde0L4fKjfKRBc75v5J3hFrdP7sPHR9/A+ET0XTH5JVGj1BHM?=
 =?us-ascii?Q?b59hkgPJ5oHiKwqK8zaCDooDZ3iogQ8SGzDOsbmgasUUWAuF/eI6NfE8GQHG?=
 =?us-ascii?Q?C5fumeC5KYhW1yaFb6rbqIb+yM08bFOlSD7jLuOzlRBCTPGv/YFW8Gq3V1gZ?=
 =?us-ascii?Q?N07GcEa+HEOmJhMTbEdic4tng7vR+QvRodPK13/N9UzVzpESgl3aFiCrxL4r?=
 =?us-ascii?Q?OTS1vGOalCqPKuu20G0/gHX/UKUsq7Kj/GVkDvxBgdm/HY9WfNp2yjAm+2nB?=
 =?us-ascii?Q?KjsrRvkHUMZFhZ271ItccLWjtXuLX1OgTtNDUfQEbITUOWg0jsVGHEGl+ZbF?=
 =?us-ascii?Q?lYlH0S75HmwQpb23huI7oU3IY99dwAm8B52GHsESpc9/JAtpmxdFfPk/GOyi?=
 =?us-ascii?Q?k8PiHqw1EBJMBvvmMrfWTIw8CbL25fB5EeVf7q4ZMZsX9gufGjcQRrsRtTDs?=
 =?us-ascii?Q?VNAmvqMk+8W3FWH6/tMZUGWlR3gkou3tl89lqQM2Q+5zeMVAWfQir/E6DGuZ?=
 =?us-ascii?Q?bm/42riC/lmyNAJJ7uEQBbDhudlaw1zis3dePIjqzpk7e5qgDrZCpy8+ISCK?=
 =?us-ascii?Q?Zo+jS5p0V8Eoin7NJKB4sXwS+eE3diz4Wa3LnP3Cubs9zNRsPBEdQRJtAVM6?=
 =?us-ascii?Q?Z1NzmhuvM7ZiPHGSCJdgWsxieKosbLZUckqPCV9uLuXhOTLjAS4EXZMe8F5U?=
 =?us-ascii?Q?UUyaSE/2rXpz5jZzp4ZtdARf49HYaVs+MkX4dcmyzDQotpD4ZlKF6afEqO+7?=
 =?us-ascii?Q?iQIgRQsqbD00sUrD7FFsdNpfJ6fPLGfLqKYJdKA+Vxr/t2onytiqyaGk1HME?=
 =?us-ascii?Q?HSzKg4SglAk3V08XFemChNRRpJDxitsdJxXuHlg/XOJ7NKZMax5qu5PMbOq3?=
 =?us-ascii?Q?MDfQV3wmLKAS8C2P+LTOPOAczGgE2tt59xhyU6EHmGRzVF5rGyrl/erMx6pn?=
 =?us-ascii?Q?CeCNGt06dR0S55RKeQYMKkffdaVVcSAkmqqC3vELafFzHTkH8KPeJBuAQiaW?=
 =?us-ascii?Q?MRUXQXs/BhgOA7bCCK+qblAjfXeslVB7dtBtd3AB0Me2u17ApGo7Syc8b2g3?=
 =?us-ascii?Q?Tx3+bbT0ws7Gze3si6ioxfu94nfzBFavmPVOid+T+q2blteEAHXPvA6PuEx+?=
 =?us-ascii?Q?FhDNA+BEcrBwubnw9i4yE6/Sf8BISvu7PhNLL4G/7TVzBPiN+6gIE/+EjbI2?=
 =?us-ascii?Q?dRxuTXxGQMg3Vgd/+9mzrB1/HCsQ1OI6K7+Rnj24L/haiHWes0u3T4bjwGka?=
 =?us-ascii?Q?K9fGuPDrFb1R9tfbTANsY4DM9mNSjyNdUGdUghD8qfcAd+ZjJmpA+PvzGkzm?=
 =?us-ascii?Q?B6ckAoBxYCyPrnmJ8TjgghHhlzuZerTlIj9+7UY+3Jb1efF63JKxk1zmF3Iy?=
 =?us-ascii?Q?3BPZK9pN6V8aC7fNn9V+zXy/dg0iatk3eoaRr1lhs9EI3ZsxAeKmSwWBJnhE?=
 =?us-ascii?Q?J2oafa9VI4Rbz/BXJW7i70oRFDt0r6rLKPHm7s89fLvDn9ir1Qp7p6Yh/yRT?=
 =?us-ascii?Q?fxrpfNWEYoKhshVj21oMpTLAoz9nb2w=3D?=
X-Exchange-RoutingPolicyChecked: ggfMwjq+97/qZzlWVDGA5pmgjQtlpXM7R/3VkcIIgXY6vlJvCFEgcfeaJBjLpi9n9q4vhO5q65cc7RSFmIZN7n/JL8ygSwDx55k6bkdLJeMgYhLQE6V4ZEDU+AclYY+dAdBvboRlVNEadSky+eS1DrrIzC2vz0CRXazCHZLsKhFt3Me6JE2HVqDUr5AD30VCJDqcialoCjMag8PJT1qIgiU0XheVw9vBR7IXr+1wNsz+1fWvj5gC9vYPXHkC0hHcgm9qUvOBFDtSEuF2JgBzYpXtj0Q7F4Sd/evg4+TsisqjCEemc2fAmHvmuGzl0dk05dBbA5/YTIVTfJTwWKpzAg==
X-MS-Exchange-CrossTenant-Network-Message-Id: bd83c0e6-bd12-4070-2401-08deaf93b555
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 19:30:07.2305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUUAcELxofeRFM09ATDe13N3TK9sdcqHAh/bJcJRh6me4cXPJRQjexEUxxwLRyugvceZWyTAQPtAfAk0n/XtCwEaZxhG4+HFZCPFCRs7Dso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9733
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

On Mon, May 11, 2026 at 06:07:48PM +0530, Balasubramani Vivekanandan wrote:
> Implement a function which returns the length of XY_FAST_COLOR_BLT
> instruction instead of hardcoding it inside the emit_clear_main_copy.
> In future platforms, the length of this instruction is expected to
> change and this patch helps in preparing for it.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  .../gpu/drm/xe/instructions/xe_gpu_commands.h    |  1 -
>  drivers/gpu/drm/xe/xe_migrate.c                  | 16 ++++++++++++----
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> index 885fcf211e6d..4546c8f10516 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> @@ -20,7 +20,6 @@
>  
>  #define XY_FAST_COLOR_BLT_CMD		(2 << 29 | 0x44 << 22)
>  #define   XY_FAST_COLOR_BLT_DEPTH_32	(2 << 19)
> -#define   XY_FAST_COLOR_BLT_DW		16
>  #define   XY_FAST_COLOR_BLT_MOCS_MASK	GENMASK(27, 22)
>  #define   XE2_XY_FAST_COLOR_BLT_MOCS_INDEX_MASK	GENMASK(27, 24)
>  #define   XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT 31
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index f3c2ef269ba8..6ffd50050e3e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1484,15 +1484,21 @@ static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs
>  	bb->len += len;
>  }
>  
> +static u32 blt_fast_color_cmd_len(struct xe_device *xe)
> +{
> +	if (GRAPHICS_VERx100(xe) >= 1250)
> +		return 16;
> +	else
> +		return 11;
> +}
> +
>  static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
>  				 u64 src_ofs, u32 size, u32 pitch, bool is_vram)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 *cs = bb->cs + bb->len;
> -	u32 len = XY_FAST_COLOR_BLT_DW;
> +	u32 len = blt_fast_color_cmd_len(xe);
>  
> -	if (GRAPHICS_VERx100(xe) < 1250)
> -		len = 11;
>  
>  	*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
>  		(len - 2);
> @@ -1527,10 +1533,12 @@ static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
>  
>  static u32 emit_clear_cmd_len(struct xe_gt *gt)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
> +
>  	if (gt->info.has_xe2_blt_instructions)
>  		return PVC_MEM_SET_CMD_LEN_DW;
>  	else
> -		return XY_FAST_COLOR_BLT_DW;
> +		return blt_fast_color_cmd_len(xe);
>  }
>  
>  static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
