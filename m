Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FCFC27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 18:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D445310E49A;
	Mon, 17 Jun 2024 18:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2jLjfEV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AA310E49A
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 18:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718648443; x=1750184443;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d+8bqI5BpjlrQ633dHyDlU8mn5o+ZYOxGL2GT2c0H5Q=;
 b=I2jLjfEVJF2rLCyYKXjiy89V9WY9s53yFF77Az9WVYjOqDEc6w0xmT+0
 Pk5Y92LfBDPTjkBxwpsi8XrxYuP1d+m+6U4akZlIVbTmuZUbLuSsaEKZD
 YT/2m2ByMaEe0Y1ALPssEUa4tpAj85ajFWqdYHeqRkGezglYx0k3HPXeX
 vlTpJ1HxkVeX4cZyb8w/PNCpPwQH7kLJLSiRWSRTtrVT+dxlRRGrzHxuF
 ZzxCUUxj+5VHgwTx89uod0txx5F0ExuVUCRI6WY4ESGHYn7uyTs3R0L4r
 SQ/QDpN4CZruVuTI5a39O7jjFrkCsnfqM9tKPyPMZQCnONoHkj+UFLmE3 g==;
X-CSE-ConnectionGUID: 5jEs1BkTQDyMSOPrdOmM9Q==
X-CSE-MsgGUID: Qn/8My9kTbqD4XYWVa/PiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19346393"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="19346393"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:20:42 -0700
X-CSE-ConnectionGUID: XTbT0mJTRbWAQQHXZkAVHw==
X-CSE-MsgGUID: c5SwHC/hQpWygnRDGA+l2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="41210447"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 11:20:42 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 11:20:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 11:20:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 11:20:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 11:20:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjvp8E1aHeJU3CXJy8UnCLFKZOb75r7zkScEw02ZuChsWNFrypLU0XCpyhuW7sOdqh1EIPrnbCCLu8lSBHEqMvWgisBECfaJkegxOFi4hr76M+uJV72KSH2w2kfap6WsuQ1Fm0DLZbQ0QOoGmAZGTxCow6cmyNV6JTplyHy+orHDdpnT5eygOQXbsA7l0hKEn7cEts5jUsWZn9yF1BByVVMzCmZ6zEocY3FDvXBgmt9zpC0zDUw8ieOuohtrDoSPUOmWCbTFad0g0+NdSc8R5eF44Bs49/zXMtEpBRLCbW1lpzSM6oEcP1bCbEy4qTf4O6M+Bs9A39E8XDp/1vZ1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xocDJQrXBsPWyBGdR8vV2CwpMIZ/zMkqYw5PHwIa7AE=;
 b=TxHIhb1+3CQp53ayhYy1cEnizIoTJKiDLBKLduqfRmg2ZGz2BgBPJNAox8MMsskOz372D/S6KbtAVNYIF8LGBp1el/Ecw2Pbdxg4llKOH7F24QX0tNhjkHri5iSYXQ0HYpooRgRxhpoIah/5JTL2egD1brrAH/yoHOLI1hEKcSbsXyHnJ1AF0zOAc7x3epAGlup9Th4btu6z00PoMxEqlRaR4vzfCH2SqkZhP9j05AXiG/iDzx16SqTVhj9rUsFfLqLvlrz0tIJUuEj51TFAMUluaHSe64KqPGWin5RUQq2JiU9PYcjNjV4JBHNse9ZqQYKN8T25zlu/aJtBs3HFDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Mon, 17 Jun 2024 18:20:39 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 18:20:39 +0000
Date: Mon, 17 Jun 2024 14:20:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/xe/guc: Request max GT freq during resume
Message-ID: <ZnB-b0UqkVJRLtZ1@intel.com>
References: <20240617081051.3340442-1-vinay.belgaumkar@intel.com>
 <20240617081051.3340442-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240617081051.3340442-3-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BYAPR06CA0057.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::34) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e240b8-8453-4708-44ee-08dc8efa30e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HF+jTrGYYVb2DQwfAGxiao/8we0PqpZEq1eqJ2cZiycNnGcgMFiFzRzQ1gbZ?=
 =?us-ascii?Q?TJePwV+pUESzwcNZFnAa0RmY12ODI58DEu6Zii+72a5dEUAdAiA5sZ6xCALt?=
 =?us-ascii?Q?a8GDym0HZGz1Tx4gHzpPcPKX/iCmkN6FrU2ytpkKeZTgfnzyW0bMPeJXxw0y?=
 =?us-ascii?Q?poWT5DWeDCnJ13j4moXPVqbP2VI325vfrjzECxQdQ3quuAH95Nea/bsnYEBU?=
 =?us-ascii?Q?O1osDc/n8AIsOEcR7uhboHP6cRucWBI5iw0Pp2oGtLZqHHBrrw7XFQRCCVRX?=
 =?us-ascii?Q?uQeOkofYEczJWg8YCDlpe08ja2xTcdKCHa4Q1wZWBOlOjjZacFS76C3D9sw+?=
 =?us-ascii?Q?1FFE7ZH4SMwu1cRMd2wzWoakNDJuTIIwIjz6E7cOC9hKlFLtNj2CKsSXV7D7?=
 =?us-ascii?Q?zPtsmLUaHXdCeQiFEv4Rpe+E2hSldFJmxqLX1B/99W1UCKkT43597HeS3rX9?=
 =?us-ascii?Q?Fiy9TS4s2IdL68PFhSEoI/nhAj5+Yg/7ll2GCoJ6TSIp6pNXj1gW059z9gqW?=
 =?us-ascii?Q?nDJtdIVNy2lkR0abVS2WhhDSvsDEzjWP3DuVADMUPeXedbiUNZ+TTMTV/XFt?=
 =?us-ascii?Q?0MZV6KtGywfGE5XSZchzqlDZT1zEmLZyrSJQK/jixzO8mJdQZtzK88eB8FDT?=
 =?us-ascii?Q?7ffMr5J9PudRgwoxQy88rC7zn3qt8Bw806tz8d6iS7g6fYJhCFLrtjnrt4E7?=
 =?us-ascii?Q?ex1tpjIP/w0tsTM4kUl1VfljXASf/eDdxbqbHUQGfkocpv1aj4jgwf+dilim?=
 =?us-ascii?Q?bnmxQKGuPSP/9rF9gJY1aNjCjs3Cm/plj2dryOnCBek2mI5hGthlRaJALj7T?=
 =?us-ascii?Q?vRvwLnfESmfIa30vIK1Kw4r9LFDp7DU9kwfqWggPPDrDI4ayAPc80e3jKj6h?=
 =?us-ascii?Q?C1145rK+GGBrjTdAyP3m7/XX2EMWDXBFwr2CkSGDf+jcd2zncx5KO4ghAD9c?=
 =?us-ascii?Q?YWvtjwpOHiUq+2fAJX5jhhQP7+d3Y5PoDvPqIPtzkrxEdzvw1uIG5IuPCTyO?=
 =?us-ascii?Q?oyc1IkL2K/E/ifrD2KnB0/cpoNzDjDUdYbZAnPpo+CYIm4IIAEw86RpgiH9k?=
 =?us-ascii?Q?6iXz2MZ+kJstJ353MUkVa6Tu5qvUhbEbBWmemVJhzVqMOvC1KL3nM/8o6e7W?=
 =?us-ascii?Q?nL8n1ILcfRVMDSxTXcu+7nvfCiv4jMFbG+Jk6/O9KONIgNfW32iR1cCv25kf?=
 =?us-ascii?Q?cr4xgXOV65cuvuo/hXVh/0Iu90ldih/hZxIJI4NtbrpyaYweDzsQqV52kO6U?=
 =?us-ascii?Q?VF3ZF7NQcEYD1WvQMoyQGXbcnXYwXeR8Pm5CxyTE7+J481SWbpc97KPQZ43D?=
 =?us-ascii?Q?YHrE2vQeBMKPj+Hu8DcHbiQ2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dlo5Slb+e3CvbzjHB61ONftCC5F+NJLgsU6mw6huWJj7rj8/IniRMSNYS4MX?=
 =?us-ascii?Q?YA34guIfnPMzZQ3Z3ZKtUkusrlU1jPVoT6KT5dAEYMFVGsH8lPjJpEiWMRCs?=
 =?us-ascii?Q?kxMMj9LPMjtp96MFZ+ZF/ki3Jh8i6v7sCVgUPIdXWFpa4gFVcyfTHOJdQvhb?=
 =?us-ascii?Q?i8dR4WzIlA345IcXEXn7uD0DUJWb2sSltei/ZwA/Ln3eljhSKVee9O+ugzEg?=
 =?us-ascii?Q?lcCrHEkXV5RAIVZ5koBPKW2kVHa6iwxw6f11IUGWEAKar696ReBe2T70T0/r?=
 =?us-ascii?Q?uh62gMMik7Bcb/MtwEYzfRwOK9Sb0YS/XlJuj3tFaBP9iHu0PpJI00mEnbOm?=
 =?us-ascii?Q?a9MNdDZXq2M4WZbRc/WVxU5ekLP5b7XqR5hAvPqgnT4VjaAwVTCSKaA8S9Pm?=
 =?us-ascii?Q?/s9SvmdXye/u3NbBVBUgWQGeLT8++iD9MOYDn6449m9g1CzXpMICl+4Txr1I?=
 =?us-ascii?Q?ea7XuanuqYJ7rgNi5NzyjjjijSHYuStHphdpPCdXoTzOBjJqqYgyZ8oYzSwT?=
 =?us-ascii?Q?fb9paan3nZeKAsXNOZAQ6fy35VN/UE9DP6l077eSOlKXxa6KyMq2sqzEZ5z3?=
 =?us-ascii?Q?xF0wigVdwfNED5TliDUGFKY1AD5nx5pswl78RcA/WB+tf8nv0II91JUrWhPx?=
 =?us-ascii?Q?q1ZhcQcDYspMMmG6i4HUY/L3BDCHQFWfxPZqRqn9JqWrNHTwpz1/+2m9blxP?=
 =?us-ascii?Q?l5K04rtFesCEhws7bCWFDOf4yTgyr57IknzblkJsYlY02xqeHLmlrc8qgQrH?=
 =?us-ascii?Q?pdUEo/OGKp9u3uRe8S2ItmfkIh6ZFn24/tRXGckBzPmVUojf3Ddp8vUcSAIt?=
 =?us-ascii?Q?/Z9PdOKWAWfbWi//2niAVPawjLan9j0NNFVd4IXM8W0hKftk0hAWZkRgY9Lh?=
 =?us-ascii?Q?DX0vmZF94qEBGYQKm1z0Ks8TXJk3fRnIg/bDE1d8clVx/kc08VMyWado6kQB?=
 =?us-ascii?Q?7z8ntedj+DUf1puj2c4zRpK1VON2qBrs2vhFJbXiRctNz+raJvA3G/l2A2vN?=
 =?us-ascii?Q?H9MpeKXrJR4W7unwnVOAg9KLfjdj1rOmYohOJjsRu+Y+/HMmy6EHAOr+ABno?=
 =?us-ascii?Q?zcFv+Ng6pBTss5ejV02zCJ6JKCYmAvf7nIAnlhhqr/qYDR4JicoGNP/K+i8b?=
 =?us-ascii?Q?myf0C6W18TS1F62r+4f+xNMwabk2qBO9fKyu4dG07gLonEs7IOMTbW6iQAjC?=
 =?us-ascii?Q?gR5qOPw1QAU1uqL1UeY2OVhz6+wnJQiaoM0bOYDgdDOkvxlppanktvswtdV9?=
 =?us-ascii?Q?IHQC5GBtfgkFu7mwsKM99cKt1WR2wQGVUfDPemdCvFpdliShLSifQ5VJik6B?=
 =?us-ascii?Q?MuOlEj70wzrWix3AoJ3zaGhUsXE2+sOHzD+8CtU3EC8yfeoX6Wa9O/pe5a8m?=
 =?us-ascii?Q?mxQYbaFbTR29GyuSI3Acq0FmbpP5GURZkZ90LfSLfwLjIRqhDA0S+nvMhl39?=
 =?us-ascii?Q?yGHjVqwvlohd2geb92OA33RysFav3dPB67H4CiDP/91+DW68eciY+MB4PcLn?=
 =?us-ascii?Q?auK4UMqb1j6GZPorFtC9RATq/CySt0iB33YUCblV6+unlmaShCHxkPvxsEhK?=
 =?us-ascii?Q?51cI5M4hX4fjL7A5Wkdsuk7SSqZ/d9+O+9DYNiwI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e240b8-8453-4708-44ee-08dc8efa30e7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 18:20:39.5417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7UmOH3U4Z2vdH8V2t9831PB9RlKXEFHXZQxK/v4ZjylOzlwVvOKwd6267DxENw0p7BGJp6kxHIhTJmzkmNlDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
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

On Mon, Jun 17, 2024 at 01:10:51AM -0700, Vinay Belgaumkar wrote:
> We already request max freq in the load path, moving it
> to __xe_guc_upload will ensure this speeds up GuC load in
> the resume path as well.
> 
> v2: Rename xe_guc_pc_init_early since we now call it per
> GuC load (Michal W)
> 
> v3: Keep pc_init_early() and init RPx values there (Rodrigo)

thanks

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c    |  4 +++-
>  drivers/gpu/drm/xe/xe_guc_pc.c | 15 +++++++++++++--
>  drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
>  3 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 0e1a5674ef13..178a0fe59107 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -699,6 +699,9 @@ static int __xe_guc_upload(struct xe_guc *guc)
>  {
>  	int ret;
>  
> +	/* Raise GT freq to speed up HuC/GuC load */
> +	xe_guc_pc_raise_unslice(&guc->pc);
> +
>  	guc_write_params(guc);
>  	guc_prepare_xfer(guc);
>  
> @@ -784,7 +787,6 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
>  
>  	xe_guc_ads_populate_minimal(&guc->ads);
>  
> -	/* Raise GT freq to speed up HuC/GuC load */
>  	xe_guc_pc_init_early(&guc->pc);
>  
>  	ret = __xe_guc_upload(guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index d9194328b495..1775183662a4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -688,17 +688,28 @@ static u32 pc_max_freq_cap(struct xe_guc_pc *pc)
>  }
>  
>  /**
> - * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
> + * xe_guc_pc_raise_unslice - Initialize RPx values and request a higher GT
>   * frequency to allow faster GuC load times
>   * @pc: Xe_GuC_PC instance
>   */
> +void xe_guc_pc_raise_unslice(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +
> +	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> +	pc_set_cur_freq(pc, pc_max_freq_cap(pc));
> +}
> +
> +/**
> + * xe_guc_pc_init_early - Initialize RPx values
> + * @pc: Xe_GuC_PC instance
> + */
>  void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt = pc_to_gt(pc);
>  
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  	pc_init_fused_rp_values(pc);
> -	pc_set_cur_freq(pc, pc_max_freq_cap(pc));
>  }
>  
>  static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 7ba875c3613b..3b4103f59b19 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -31,5 +31,6 @@ u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>  void xe_guc_pc_init_early(struct xe_guc_pc *pc);
>  int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
> +void xe_guc_pc_raise_unslice(struct xe_guc_pc *pc);
>  
>  #endif /* _XE_GUC_PC_H_ */
> -- 
> 2.38.1
> 
