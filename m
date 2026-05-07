Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA4BCD343F
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 17:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF19C10F817;
	Thu,  7 May 2026 17:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkQcCBEu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BCC10F817
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 17:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778174339; x=1809710339;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m9c4PMTmOEkNNRrMT6HlfzuL+vwYIvev93xTAlPeS6w=;
 b=NkQcCBEu2wv55uQEKeeaW81klDkbg9LDSHREhL5YQiM2vWEy7ppZHKaL
 atsL3Iat51K+KvNO3tWt7NZtFUQVyJ8MTLEMSVL7KpB272l1XcqLRqTaR
 x05+w2bMrLgp+S9pgw7u6NVY6H9bJoawTYmusaf3keON5ItoCH2oMRHFz
 qu/XMM4FL0e/VFaKflsxDAmLofpF0gCXI3gs9HpIp9xf1ngG2H1BdQfhS
 B++pn3DMQlKR7uDzDpUDEi6dYW2Dxc39mOxQubgUk8/Ze7nuJoLjz022M
 EO+p3oWLaXVYsOnUyvqgVZ4g10PxlS6tL/2FWsQ2uwOKkOGNPjwX1wXQL w==;
X-CSE-ConnectionGUID: dWkChOwiTmmSfrfedkorGA==
X-CSE-MsgGUID: aWHiAGv0TTm0BUptBbLjSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="89829537"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="89829537"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 10:18:59 -0700
X-CSE-ConnectionGUID: 5Ji5xkNrR8KNrI7f5onxig==
X-CSE-MsgGUID: C22KsAU6SvOzi1CwIxGMIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="241502615"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 10:18:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 10:18:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 10:18:58 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 10:18:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMM0DMOqNrv04pfg1OF7gPjalsEMFzGqrKPf9m+WHd/ZmS6KoEgUdnGOigJV7UhmMY/9PpuJM/XBI7/aO828KkNrTOwDE0o8KAyccpjHiW25qSpnzera8eO/spl/tUm2BQdkuAYCgV9/yhFupxUygTmr1v+I7WtN6cOE53KmCmiQuwWAA9aGJdyKX5c1CZzq9yY2Wk51Qfqv5P32o+vwTNxD1ayX1cg66rLOjhEqEXl2VFhNxiQHqPga0jqb+AalOsOBN79dZ0peDMvOtVMYo1IcQY5+WrWi7fnDr/AtF0Rjx23SX1fXGaPlYzA83QIFCbA0EdpoALlWby0uW/BuIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdQOUJ6MwN5nZT9OZrSQ78GbowqFB747Ew4y7boQBXw=;
 b=i5WarS9/+tjJx3FgY6qpIF8EgHki98jKoohnPuOgxQCJsT7MoGmxd5UJQPkBd5MkrC6rQVJ4CreTlsmJrdfcaBWV8c45w6IZGjBs2DSXz7mBPk6hK+kwtaAy3SSsN1qBlJrrWDm7kHpp8a/IFIm9E3Y8wZAc0V5REVTmfHSgBNJixGn0zJ+7nMhzUga0FwPpKXh+A+HxPDleDpYujTU+kUonAuOK6DP8o0DTDRulvgD3OXoafJW1Rh2AoHwxg1jCMiPMP3n3u30SkHblhpBB/IvoifwbPdAJrdmTSAoKa9h5RQwQUrOrREVmOQ75frRb6w7EnzckDFaUWbmuEcl33A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV8PR11MB8745.namprd11.prod.outlook.com (2603:10b6:408:204::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 17:18:53 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 17:18:50 +0000
Date: Thu, 7 May 2026 10:18:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe: Refactor emit_clear_link_copy
Message-ID: <20260507171846.GN2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260507064229.397673-5-balasubramani.vivekanandan@intel.com>
 <20260507064229.397673-7-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260507064229.397673-7-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR03CA0156.namprd03.prod.outlook.com
 (2603:10b6:a03:338::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV8PR11MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 25fdf1c4-c1ab-471e-1286-08deac5cb44a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info: dOvDaBf5o1EJsM2cdNDgxWBKnzLsnopPf/VO6RlProKAMTwLOHUWdNtv6Cs9x52bQC8Jc0umVaKZm53rVSN+H89oDOFfEp0i/xL1efE4M4UW5PKCMng6fDU6uTcrSLSNJPa9QJGsvhaIw5iLjlIHRndW0w4N+2W1tmuEbO/bTU2+xTNtwgc7aoEIB58Q51ScbC+vkZvKeex0U+jj0y7HaxIjtqgUpaIGtP40dRpW3n6+IsMTo8NFa6DgrdObTPh3VgbOXkbtiWcv59jRSK/urceQdhVEc+wMa1a6TUYmZZm8ZEVoQiSNoli1DY4p6BWpNNwUA0bjJcvlvT11t20CQ0++AOK9KtjzR8QcHxVuPClqCuVMw6/ZpCRh8uiqtWKp9drzZ4r6Gf4h5pvm335UQFMQAYFIBIjV0zpuC+Opim1xAzQ7zaIdtkyXLKSp6RnChrHMD/NqPYQi7Eso5rb3l113q/9Y3hVZyx+av8w3fU5MWeatQDOyQLvhwdOhIgKIlGDlkbZeSEV49Kl8Mre0iRuOG3MZh3yNrdVQlPTD+i0oyyruwgIn/rNRZ45acAoHNFsw8skSTMb1VgSRtgJi0jLVSwdwiCJSv/d8i4q1YAXmaA15WIfpExCwvOjab2doqizBbDWva0vLBu9srbgLxR5x1yo2Ycl1ZAak0WszhVrsTBa/LzvChqLCeI0Kv6QY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pwmOyuMp13nj5pqXpPY6q1J1RCY20gee4GTRlNChpjZocU8RHx+K+yK8uv/+?=
 =?us-ascii?Q?xVDQCzEkjvMrlZkUR7UTGeltMV/PsSZOYw1AVexPoySzD7zyKzTLiW943m5Y?=
 =?us-ascii?Q?np9yeEOcby1F3YPAOjD1OxYyP/NLFN0M+CxQDLJYYNm1LGABnzG2xcZopZUR?=
 =?us-ascii?Q?7hAvIKYfpUIRV8/qutbwCHpE2AanteT8ujI3U25gdtpP5WgWpLWnydc+OAxT?=
 =?us-ascii?Q?YY3pfdWX/d4sFcgc5BWx+HhNqSkylKilet+vQlsfh2z2fE6GjpZe+NdkZN7y?=
 =?us-ascii?Q?WfWavGPleMxRF9A/e6v1EkyFtvEL3A3Gt4F3DsbM/zszCFDfyx+GB99fxXjL?=
 =?us-ascii?Q?fOPGNFmXtQnXZAXkoDzq3V9jIRUtyjRX1i1GZCpbLN6JV/sEyHR5oYTPo0Js?=
 =?us-ascii?Q?qY0FOszfJPnhOKHY+u9D15JGwVB7Uu27e3C7tQk2B9haWfQEUZqJVH/JXtHm?=
 =?us-ascii?Q?DcaPd03kjFOBPxoc/VTibCg/8RJlRKDS4ZJWm+UkFKD9Vfk+oE6LR0abKZ0T?=
 =?us-ascii?Q?2NI09jVFZkU3EYxWHSFpIRahOR29d/aB29kPjJjYXBvrhr1OgHSFpR31cAd9?=
 =?us-ascii?Q?rwcQmbzCWLW1zneSuEUHajn+S/ugFBtzylbVcxtWDef6r9tGwG23VYtMwa18?=
 =?us-ascii?Q?R6chI2aOZFXc+ETKA6yrl6UvbmnK8DESgWtZ8Fj7pWIaqI3k2jwpmxooVa4P?=
 =?us-ascii?Q?VKZ4gMiNEyGSHtJjsV0f087/4MfuJDfThU6CJwS544MtnWtdVV8i4/rTSTz0?=
 =?us-ascii?Q?W8qoPOiyX3Oo/kYrMAR7dmEx/1e7MwM35VVLHRaArensb03k9lSiuRGUdJIy?=
 =?us-ascii?Q?wqjUVNkfXP2mHA0A/HJDIMYZ7nc/E8Rx+XeuqJoIgg1No3pnK+Zr2vA2MSpM?=
 =?us-ascii?Q?W/qEdItt1sZUzIwndRuu0Ha6cOiB3n7vVJyKBUk4247qEKWa0BXqChB7o7F5?=
 =?us-ascii?Q?ps5MztJtP/Y5Cl6vaA7kNfMVRqlMC5/4kWNa/mrqDu/bNq8rG+5GE032x0tc?=
 =?us-ascii?Q?7UYCklJnqdH5FP8fizMcAFsjeJDtnrlEaqmVryIJ1Q/l18HYII7iBjT8xScT?=
 =?us-ascii?Q?m/xzz8rm+u7hhHyUqHzBP+mGy0NSfmAmlgStt3uvuOqs6bApwvkAfN73aVcA?=
 =?us-ascii?Q?fsDX5yii0sTgQEaD2UN7k94xOb6rNQWauxq/tsJioiU6vQI3i7ndfI/vCXU1?=
 =?us-ascii?Q?pOz3cdampAdFU+IrOpUhub4HurMbYvKoSYT6DyniefnglZ2s2kufDPXl2HG5?=
 =?us-ascii?Q?oKoIXcHMLK+WhSwR4Py3frxIchR1HEw6VK+7fX4uiiGh8XSln4FjoJo6xGrH?=
 =?us-ascii?Q?CpOfTpJN+ZyIuHg0dS4Ej5SxB8SyJE9q2SfPJMhzNhAGVx/UKYwNFaU5VspS?=
 =?us-ascii?Q?j5DO1g41i4XYJe0qYOc+YKBB4DBNbANOj6YRnzEJjyhKS6F4TkxvhGADNaXF?=
 =?us-ascii?Q?eGtsHciRy82/4np4b34qNnWPVoCqdqOPVlb2Ad/RH63Wp4XEWDs9tbmfQXT3?=
 =?us-ascii?Q?nzeVb5YhDPVCO6N/Txwf9Gkr7mYGppxZbwPSwlBDhUTpia8z8pjoKh3yJ215?=
 =?us-ascii?Q?4w02YeTmaW1jADpshHwai1L0/Mul+6a80JXwjA7dcg3TMrpuQ8PgVYJjE4V3?=
 =?us-ascii?Q?KLg3IGKVknEAmMtcspJbZZDCkK8pWz+K4z8dyFGRL4qZ4MdA/ScXsG7Ndms1?=
 =?us-ascii?Q?UHwERQUu0AhREpOa0W5oFxvn/XeellFtXujlzbog4qgs9EvjZ0+WNm3gDv0/?=
 =?us-ascii?Q?yQHnS9eGsOSm9cuYxbSFoNBklWoY9sQ=3D?=
X-Exchange-RoutingPolicyChecked: ibkuDQnt3WnlXMyMOcYY+/wWhMU82aDXv13+w3DEDBYmLIi+addWDccOMNu1xmvDfUhfYMAzw2US1ZLjPeLR5lDb/l/UcbH8+nlWYGj1/0bs6ujTjatfdPUVt8OJ/Zmkk714Esk3ArmXalS1nKK9kBlpB/Gneac0FQ91IBaZ6gKQhTG7iStGmoKepLniYDUtZBVNGgssYZuYczW8l+u+SGFwur5uhSXR+iqu+vXnaq+yhdFETuu4SmK12nofMFW4a2LAhE/5q54wgtzhS274IOC1QbqacAJ+gg7aYU2WuhU91FuQSnpg+UEA0iFWr/IJOhfQbK6i6km36fs5BAMvtA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 25fdf1c4-c1ab-471e-1286-08deac5cb44a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 17:18:50.0701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJTHPGn8STy/MZ5pCiqqQk0DwAqrWq1B956sSYQ6JsTwh2H/qvEw+1CnTTiiS/yO3Zr3ong4vPDTMSM5yXepOayCGFUejGARlQEzBTKqQqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8745
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

On Thu, May 07, 2026 at 12:12:32PM +0530, Balasubramani Vivekanandan wrote:
> Implement a function to return the length of the MEM_SET instruction.
> This is to prepare for future platforms where the length of MEM_SET
> instruction is expected to change.

Same suggestion as on the previous patch; it's probably best if we just
remove the #define if the value is going to vary in the future since
that will help ensure people use the platform-aware function everywhere
in the future.


Matt

> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index e4afe011f246..dfcbab38c222 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1386,12 +1386,17 @@ struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_off
>  	return fence;
>  }
>  
> +static u32 blt_mem_set_cmd_len(struct xe_device *xe)
> +{
> +	return PVC_MEM_SET_CMD_LEN_DW;
> +}
> +
>  static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  				 u32 size, u32 pitch)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 *cs = bb->cs + bb->len;
> -	u32 len = PVC_MEM_SET_CMD_LEN_DW;
> +	u32 len = blt_mem_set_cmd_len(xe);
>  
>  	*cs++ = PVC_MEM_SET_CMD | PVC_MEM_SET_MATRIX | (len - 2);
>  	*cs++ = pitch - 1;
> @@ -1475,7 +1480,7 @@ static u32 emit_clear_cmd_len(struct xe_gt *gt)
>  	struct xe_device *xe = gt_to_xe(gt);
>  
>  	if (has_service_copy_support(gt))
> -		return PVC_MEM_SET_CMD_LEN_DW;
> +		return blt_mem_set_cmd_len(xe);
>  	else
>  		return blt_fast_color_cmd_len(xe);
>  }
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
