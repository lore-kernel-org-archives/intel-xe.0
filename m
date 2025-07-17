Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C080C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 19:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10AE410E893;
	Thu, 17 Jul 2025 19:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FLM7sxbd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2D410E893
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 19:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752781795; x=1784317795;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=os5RhhdGPlOS3hKQPawNFgZVx+CAaZsyg4Jcln/hyZI=;
 b=FLM7sxbdjYHqj5T/FXDpxoMhGwDy4eusN0WTI+zWf8IPceb9K3qLu0cD
 fS+nMiOW+iHdSlOZkWOuCa3dWS1R4v1rxjhdQ8sFjHkbBoL4FgcMUwis6
 3rhrMU5QTtDNDp+XQImeCW9iu+8lKTu8fdcXQ41jmmSE+nfRbqZt7Z+1P
 m4bYK14zLSvjjs8buzLEMAkR1Oq+EKs+NnuiuiLw9P/HLZcMdzpGeOHJG
 x3pX9XpD4VI0E7MXsoNpSL1zF2ie6PCQso1Ae7+oqVXhXsIrLwFSJx4iR
 D0N6ML5g0eqmpVQi+78pNXeTohdws+BSvngmg79+SviYawVPeAd/lCyZr A==;
X-CSE-ConnectionGUID: KOVLIglHRo6cIlK7IifADA==
X-CSE-MsgGUID: 5PxqAyRVSZ+9cNoUWizYdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54286839"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="54286839"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 12:49:49 -0700
X-CSE-ConnectionGUID: LhLHwr2vRFiJBjZXS70LYA==
X-CSE-MsgGUID: +2VfHungTfS13i1EuWgBIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="163515416"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 12:49:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 12:49:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 12:49:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.43)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 12:49:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+GcXB9lAEc+tleHDpOswOdLPwHf9JA9GtZpJvRH0Xaz1qP9lZeF7SEBI3CEMl1LGc9WjiX9j7ehTafOk6Ake83y44k05EChhm1uUMFLJ5O/kjKLO+ouHooDfswp7L9qLHJTt43/ifB1I9RGcEnTsDYIDUP5YFPuBcjNQYeH4dy1IlBusU0SsWiOzQy4vlpVNdwSZii+dNF/Dz009ynjrfITTlirpPenCIpjvrTCibglTBnocZMqly+vzJd8fxcitAKCW3016sYaK1TXQe0ytokE6hR+Ln0rCN50H3A0Pya4TONQbKgeXtrmotdCmyD/6pk8efdITDWVi8clx7A+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jo3DAjRZ9XcqyCsfHuTs0HDWN8On6V0ec7nLyVsTAU=;
 b=eKOJpvo0CMxU+1zW4Bj+WyW0OVxODShDlFRjofRZzzcxcq67YsIMf+VQaN9Uocyp329v7CFjop4kQVemhDoSntulVdI2pcOsD2trtQUePAwUv9jxU5wsmHZW9VIhqj3nF9TzNrsqHNOCAekK8yiJ00KVhckWgTCeILwqFCYcy6NW3A2B/ZPWcWXfyGweNBDoDZ29QIIjqVLFiApAiQQ6MIimEnvYiJkIS1I/i55Dh93j4wy84SQEIMAOO7Go5Sqhe1dRlCvVTIcifHBfNTaY0YsziloArD8wU/1jNAg4KfT2ofvCmxS774OZjPCPacD8wqVpN3ZLaiip8SxsTiKHjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6930.namprd11.prod.outlook.com (2603:10b6:510:205::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 17 Jul
 2025 19:49:35 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 19:49:35 +0000
Date: Thu, 17 Jul 2025 15:49:32 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe/vf: Don't register I2C devices if VF
Message-ID: <aHlTzHHzxlW-YUU6@intel.com>
References: <20250717155420.25298-1-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250717155420.25298-1-lukasz.laguna@intel.com>
X-ClientProxiedBy: SJ0PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: 4112c15d-6a9a-4612-c42c-08ddc56b0e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Lxpm5mXAt9uCPsetHggIQpzw+XOfNPPhO2aE0pYdajWHKoZQob4UMqgDWWo6?=
 =?us-ascii?Q?9y9jJuZg6rJ/3DUDKAnlws7pyW/8mJ3Eyw8ghIqZEJeKoGpN5cNxzmMYF3rq?=
 =?us-ascii?Q?3s+PN2jGR0ghAYhtfo85tIwS+ml2hp+WRUXWLk+ePSaYq9ziG+YadKoMCAbR?=
 =?us-ascii?Q?XlEHwBSTIJi+s6nslK/DRoVsHxMBTHnZYFbBaVa22RgZH5F1x73TB1y6WFWB?=
 =?us-ascii?Q?Yz2ARw5ozXNa1qNxGa9IOmeKV4dxxWNUbEi3pznPzI77Eh2MUIARbhOUqxDd?=
 =?us-ascii?Q?N17Ji32uQq2S4ODZp1XKwbKvmjG/h+/5bUn8T6FcHrlAmGNtao6E2JSIuhBD?=
 =?us-ascii?Q?73gR3wuP6RiQ8d0FRhPS8cZ2iLhVYRBTL1AVDiMrt2k2vi+KqiLWwjpqqX+E?=
 =?us-ascii?Q?t+Tz0H2Bu4GZB+GwVrGcJaiVAbyo+WqWE3xjngRj1L/jn0bzoRL7eKHUMbG6?=
 =?us-ascii?Q?Ej3Pw7yooySXWwFpP/t9y90u0Ia2V4CkypBdlZR+30VDzzBn7B6bMtdr+nEC?=
 =?us-ascii?Q?CZpwlcmRro7661h034yzM06uy0L39q1f7j4M9MiLf/k6Z+AF6decE3VDVhZz?=
 =?us-ascii?Q?VM+kPy7ii3B9DnsOzW4kbDKJdc7XXa14amtFj3iHi1BO6WaM5oJyXrelxnUs?=
 =?us-ascii?Q?0DB3VnG1BCal6ZHidid+4volGurqcA/6M1yXe6FVXS3kkhWBC5I8QXoefBB+?=
 =?us-ascii?Q?y+jNL568UAyCz0TUa5z/shCTmgxIA3vaB0w/JlyeT6goHCjmD5wKm05/Eb2Y?=
 =?us-ascii?Q?kPocLdCSbQH92y90UrcgCGp+USypNNS83B/rYGJp/bc+UkLlruLvUFHwOWgV?=
 =?us-ascii?Q?7m47LnQFZsKOIHjedAZwuvpuxhH1GOGHBE7U8wuTN3k1VRMYiIgLLgC+jZQ1?=
 =?us-ascii?Q?6eDfS4Wc5npXl6KHuPuFlrXPlnLSQYK++KBKLD5ZXA7A25jZwr16G+FydMIW?=
 =?us-ascii?Q?+1WAfrBIlhjguHhYEhyK82sgRmrxms9T4g9lj7x1PabtLVwiDqstR8obIMXa?=
 =?us-ascii?Q?QKyavL9qHT8/biwHGUYZMf7JiwsrofFvxzLVYpzxfxZ2wTk1aou05/84eaBD?=
 =?us-ascii?Q?0QgqxzADNbzWLGBDyaESBr2sU1gTGFiN7fnA0DPyiu+CAdTiKs5aNfYivJaR?=
 =?us-ascii?Q?ivmw/0cCrPmXH3gQ5ZCdCT9X7aHXKBUhLb/sqJM1iYP7GBVBAtBOU2L1A+cl?=
 =?us-ascii?Q?/GLKhATx9LhzEhoHGUTjPF9OVmLHt4Bm+dJsIbEwWwS30kmFvAzBkwyFrfxZ?=
 =?us-ascii?Q?XgCgZLYcbFnGgN2eodRMvERJl1m2RIORMLr0xbYG//5S7Xm9qamD1NCjyQ13?=
 =?us-ascii?Q?QzxVih/7VzakUFtGS2UKIYRsW844PUCHnVWjTDOfOqyGwtXGph01JQSBMOUk?=
 =?us-ascii?Q?lODIxDxKNjLvOM8EML+8ZikK5jyIq4SAHMJTvUVcFDtEqP0ehYNaIn5zlHqr?=
 =?us-ascii?Q?ENej3XKdCh8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DEWZOOObqo8ldvaGRs/XXDOBXa9srKaAfvx+Rqlt23SyyB8bjrljlcUfvSq9?=
 =?us-ascii?Q?rE5cjDLQel2tqwrzae8fvMVpo2dbfx8cFxBKqhrt8foruborvdzqcVW5QPGa?=
 =?us-ascii?Q?T9FD86P3PDvPxZ1f903eGXBZXtxye7pq0ZdAmn5A3QGlOgqgRdkIbWlklRGI?=
 =?us-ascii?Q?5y4n6LKC6WvoOcL5HyL+6YHQ0wgd0zZLDUx2pO++bSaF3kB6RtPUtgg5fucb?=
 =?us-ascii?Q?qI6hGsgHWEUkKzOl/rcEnz9BRI8+hjlph7VLhCtCjfsqfRkw0YMAtFuEL5aP?=
 =?us-ascii?Q?X9Oy8coplJpguoZxqksY3+/MkQoBfsR8U0McAqpQbLwMwR505tzgRX2oKhQC?=
 =?us-ascii?Q?QWkdd3w2wa6MeNqwA5NFh2vYSJ8lqteOVAkqKFTk72DbEGBD87KBNYM2Uu0H?=
 =?us-ascii?Q?WjtLfyS2mnfhFoJ/OCxmVPoxC7jtDbZXp62OcEYAoI2EW8XVOBPwGu+/cj6f?=
 =?us-ascii?Q?hp3X0wo/bjf+38fNVJsE1NEVANMRgHQfGJ6Uucl1qaeIiMVESJ/mehWE5H5P?=
 =?us-ascii?Q?n6Y8aFr02upmoAjAqi/sW+NPojqwl3P0vMdEjQf9ziRw2Wevq2NGP8z/zZbj?=
 =?us-ascii?Q?QSM0pu3+Bbsxmaee4Ur65AubMopgBw4B87JkcJXKCrcCnRra91jg0xoWRcHx?=
 =?us-ascii?Q?7cJpAFQST87YEICusi9cZOjRFxAiGeA5PT5c0GmKlD63gWzY3BgsbMcjt46n?=
 =?us-ascii?Q?b2ryMDJ0TXHHK0daVrftlPBWVHUSkQs0229485UYxzp7hgmlfZMcaaZJrQUd?=
 =?us-ascii?Q?4N0uPwaVyXDuIoBllkZloqxpTxRjUcrqJzN5QPEKzB9T3hxrYWHsO5hzZTqF?=
 =?us-ascii?Q?fJe02CXgZkT/ahZ2dSfqztKefjmjqpp9djrlfRLig0oz77nUtivgViCcQzWn?=
 =?us-ascii?Q?5+8xKP2OqepOXVtjp2za20DFttM+2uklX2Ge/0HrZQBrO2tRr8GLIwDix90k?=
 =?us-ascii?Q?Yv3PIymWglOwjl/1xsS/ycKZ5xQuleshQitxYVB4Z3EbEQdCZE2lPjLO9Q2m?=
 =?us-ascii?Q?wAtYVM+kh58+TTR3NgHtT2kO3J9GpdcpDmpuE1s7KKefph0nJVjqosq2yoH6?=
 =?us-ascii?Q?0CM5VfpULSCNyGks+2oBHHWZOC9UEUJxiVjfr1XMw5kpyZVvMILCQbNxdASL?=
 =?us-ascii?Q?Qx3l+4GyzW637wHBdo7dxxLSzf7GXS7PGDvjr/JV2Gw7R5CgMZ8Xl3e2zsTG?=
 =?us-ascii?Q?qV2l5EITalqRU1m2OMeZru0Kx6D3P68SHiNojtH+Hj4ybNp5VfwohZOHaghz?=
 =?us-ascii?Q?w+wYz5sCEMvSqPfb3/+X7Ycvat1zZRlIXnfK3L4duvvhd966gvxwqP9mEsOk?=
 =?us-ascii?Q?+2F1k7tFuQ5R197mVejDqdCCSP9SozL4uQnIKOtImCNrLtlwutkKQrrJizrO?=
 =?us-ascii?Q?zvcCMN0P5KgtMubP+L2LGB6+t0637dKwhkMh1ctIXaEbnvHBu0EOoc/BwTrt?=
 =?us-ascii?Q?7gahCgBdTrGjtVlbUBtZcl3tvR9/dSCfQMFNZL51/OGr3F6InB+W+MPIhOIk?=
 =?us-ascii?Q?/ytYDCs8eGBv9YW+5vWK80g6cU7TCHTzBJVUWflAP6tGloMyuBTOHLDg2chH?=
 =?us-ascii?Q?q81FT/Mx7iWzT1c1+zmCL42l6oWeu0sk3hrCo1Dj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4112c15d-6a9a-4612-c42c-08ddc56b0e92
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 19:49:35.5471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H851LMsd4NvIzFOiEx2Hl6tGghEbBTcKEmaQZFMWOaM7rmEpeklidBuMqe/s/5qnijgriVQc/4yPeYcCWwEfQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6930
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

On Thu, Jul 17, 2025 at 05:54:20PM +0200, Lukasz Laguna wrote:
> VF drivers can't access I2C devices, so skip their registration when
> running as VF.
> 

Fixes: f0e53aadd702 ("drm/xe: Support for I2C attached MCUs")
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushing soon, thanks for the patch.

> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_i2c.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index 1f19718db559..bc7dc2099470 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -283,6 +283,9 @@ int xe_i2c_probe(struct xe_device *xe)
>  	if (xe->info.platform != XE_BATTLEMAGE)
>  		return 0;
>  
> +	if (IS_SRIOV_VF(xe))
> +		return 0;
> +
>  	xe_i2c_read_endpoint(xe_root_tile_mmio(xe), &ep);
>  	if (ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
>  		return 0;
> -- 
> 2.40.0
> 
