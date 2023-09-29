Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D005E728C4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 15:59:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B89010E13E;
	Fri, 29 Sep 2023 15:59:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8CF10E13E
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 15:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696003143; x=1727539143;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vtmDZY3sqOn7o6KKvKchoEHB060fmIB8aFq//w470jw=;
 b=GoAfXbMnv1vML2MJSQ8Z7AOUR6qvC1pfHm/kRujQiycUH4x8b9wthZO6
 A2e9Mtt5S/foqM+HfzSc3/nxYasStbRCASEIIVoI3ZB7s3USW/oyQzraO
 Fr1i39vrEoQZFeJnA/C1X4hpipEgM9jIueFlvq/zVvkKmgpLkwSrUkyHF
 K//p0ONhGctwW5BSALg30AlTSMbB9uEEWxfzGv2wHglwUXQ9B5xdEeYQM
 V0Gs+GeGAlMbHDuqA23Rwarkfe1FnYR7feish7eXE19SbCfkoya+HwpZj
 xW4KMgAVXrUi4PMTIGA487u+bpCdrAl814HoyArG8O4xkBgl6rNrDV71P Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="468613289"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="468613289"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 08:59:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="893459024"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="893459024"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 08:57:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 08:58:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 08:58:56 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 08:58:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8WriMb3KHvmtKa1eFTwYw15TxaL8/jnXKd30iUTkNi13P2rkP2xfmNJgZxi5dPnV2nl+rqcMUnq2K1wvDbnRZzSmzbGHQ1QOqjpO+7+kUykPUPJ43BjvjpPlBmm+akJHmN78QdGcGj35JVOhuk8WpF3Nz3L9Iu6dVJE7/nOGhmB2axAEQBKFXQIOB6h+LChWgTDS97qdbDRrFni2vkxTI8jUYvC3Xta2M7E78CIcuQDMJUmNaXHd9PkDC94wr8Ox3nwHNqzdnwtTNJL6s6C78cZSngFeX68J0v6RNu8CXQxFCk1la8fRY5wVZApJi1XkFQa4XjUfGiKP+mqeUqTpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSDkPCXRPOYfkEfEM0Pe7mpsZkHGywv/vNXCUmexqe0=;
 b=dwfrKo6lG4A651t86CHENY7qtDqinqF3d8vSJJrEPd4qMX8d1H004yC+I+6+cAfsT04D1nWgB5Yf4j+VcvPkXI6RCGeB23cgCGk2kJrwNluZhjayENhYcLXBqo3NcwQgwwjFkMZivTiBCnmZMwHPGgmWzGOEedq2GPho9Wpl3/Rl2CYyBy7EXpgb9KKAYSepETW1MZC8pcCRPYcfmtitj7MCMPAFmzT5Zls0k2zd/53A3+bmgNjYHsF1l25/H3KBQt/qJi0JcjIOrfgMkK791QB8CoG9Q9yClmJSS4+yOE0NLgszBNjmqgwPCT2f5RoRhsbXEeDJznQmlND0jbCJEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB4791.namprd11.prod.outlook.com (2603:10b6:510:43::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.21; Fri, 29 Sep 2023 15:58:54 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 15:58:54 +0000
Date: Fri, 29 Sep 2023 08:58:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230929155851.GG233750@mdroper-desk1.amr.corp.intel.com>
References: <20230929044351.3145468-1-lucas.demarchi@intel.com>
 <20230929044351.3145468-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230929044351.3145468-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0170.namprd05.prod.outlook.com
 (2603:10b6:a03:339::25) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB4791:EE_
X-MS-Office365-Filtering-Correlation-Id: bcb7cecc-95fc-4a95-42fa-08dbc104fb58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 85wxV1QMXrwjhuc/wtgqgFjjSITGr3g65fGYTnuzgUvCve50Nc7AjNrOKiSu/sFc2TNTIuDwRGCfLwEgsq1kTMDfMpyByqNr97E7C3ab9Rg1alXWtJDyk/aP3BR/7VpgbkYk9pLdePTK7vXM08HlC10EHY2fmq8ZqOcGpblq+FUdEwEGYAxulvulZ5PYbGxc067XN9bO1UCni59WYounHpEChIXZrxUnopMr6ryRdjcz5hk/vi9lKavIZTXdG/sCbrt2TWP1pZwB2yl4zVpSSKh40DzBeO2TY4D6OAN5V+4ZBaburBRwfrPHQ1EbkLuEDIQD8Zi9tSe657tF6ZsjGDVpQrWhec3JXY2JA215I7WKgpMRaozCmCZM0JllPFfllv0t77+oMvt91y4nuZLbSFxwFKj/j1wGSX5p9UCb7W/+sc2v6C0bt8Ggv05e4nIGJfFecwo1n9U3DOalGvt1ilAYwzyHn/uxAGtLfcpRSlpuTmR0bWTXnEKJ1pOGKiunMuR5Wja/KjSb0hjbbcRii9FZfRn+bszbxVEudtRRelcR8Y6+ah8x8+uILapf4G/1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(4326008)(8936002)(6486002)(316002)(6636002)(1076003)(6512007)(478600001)(41300700001)(26005)(107886003)(6666004)(66556008)(8676002)(6862004)(6506007)(66476007)(83380400001)(5660300002)(66946007)(2906002)(82960400001)(33656002)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jgWPPmzsPOE75/CHMnN7M2n3oHFBMHEAtsZCpu5EC7YQvudMHBSjkVM3S6+y?=
 =?us-ascii?Q?14QrZWhW6367QK+FPZbGcBaywReaglminvicnCglUelI0BP463CcjKowYYng?=
 =?us-ascii?Q?28WeHiKtzTLTvsHFhFXelz6M+JYgouzg33cVbzAEvi325bkc2KxRuABBFO2G?=
 =?us-ascii?Q?jzy7F7dsiLSCYJ/pPk2O8u6ku73rhUQDZZ4RC49FJkAOO+DzcQL4DXJmUfYZ?=
 =?us-ascii?Q?kNphg5VrgYnetoSbDvX6wQ37l0CD+EYCjChrYjnLM1CO9UCLw2e2C8eQ9wfN?=
 =?us-ascii?Q?ccrb3SaneKjO2xn9aRslqfdm6GaulKsyC0gB1Vraw8rj6/zDGIxRMRZmT6q/?=
 =?us-ascii?Q?Ye/X07WC0Lw9P+HTQchwJu2bouslBPSACTxSzeZnIpbdfqySYuXBhyPBVO+3?=
 =?us-ascii?Q?c0bMgIfzMnSy+MT9nbGUZ3lAWeKGDEoz/rxceqBxtIXcycGi51eCdsYW1wMn?=
 =?us-ascii?Q?Qp3VT4ZVdRUdVOB9hrvNBQ6XkDVXSB/KwM0Nt9OO21g2/uePcxOy6/mmmmrs?=
 =?us-ascii?Q?WJLXXeQ4aZaU6ZFM1+gjPp87CmBLcT9rpSP8BUIZ4oUK2fvviTGHM+G84Uvz?=
 =?us-ascii?Q?k64kz2jjsmKInLWXwgZt3m49ihsMvuRw9dzyxtu731oVE26bWzF1auN2VAUa?=
 =?us-ascii?Q?f2bR1O7LT+aBgCQqsDtSbgJnK4v9+WOK7rcRZupmFlp2hRg4GdBnKVT9GPEr?=
 =?us-ascii?Q?Ce/8cr8gWhEAAPjIQMNvtlLKoNFg1zNUqudwAALKMBvwSTBBzOxXmLP+s5sf?=
 =?us-ascii?Q?2TZR49JKrSaAnpnfzRBhXY6tne5+oJmIprpcsUUHyOeuabTgXrkkD1+W4zGw?=
 =?us-ascii?Q?hdm+lBJ5A/BR10m3KhdvUb07hXhasK7F2Nak4Unm7tsZvb+HvSjCHcvfT0ja?=
 =?us-ascii?Q?mh24NOgqwtvKtluWx7CESXPgHPt7YkIq/0o6j1WK6T8UdOcQGveUqe/q6ZA5?=
 =?us-ascii?Q?6kIflCI5NweRRVEuXyAazL6RSlOIx2jDqaMMNTua5tz8DiBt85dbJSDf+dNg?=
 =?us-ascii?Q?rLk7NM332HbBRbK+DYu4iiqD8gszjP2VKZw6jntzxqtLmIjJBz0y0Y9BqG3s?=
 =?us-ascii?Q?ra9/+BlMId5Ubd973p4m+HPCWECdZYnp+SUnlnY7tLcL48a8bo6T5gY/mbZR?=
 =?us-ascii?Q?QJX4rMod9UNmYr4FkoTmWPDp3G5mwNZHYSa+YI0lZLDGFkWStkKJcxmIOSVu?=
 =?us-ascii?Q?4M79GvOCH5g3eFfJ+IXLl48kAY4zpsmy0pBYpx5BCmV4+UBB93c0231ZFk8v?=
 =?us-ascii?Q?rcvuzbtbaOKojfcdnCzyNnVg4Kkc+o21FAKcE/epPztdelCLLywL9ZIAJ+fy?=
 =?us-ascii?Q?UTVS7BzyZUh3uW/79HIn3vOTfsh5j8n30WG6qto48KinRoMQ69twmjPFtOmc?=
 =?us-ascii?Q?VMiFPKLhShjitVv+uCXdjFjsYC5WnMfWEiz9o1d36WYH7I7bffEPAi8zeTTd?=
 =?us-ascii?Q?CYO8lc6MbkcsMbHQ1N+6ej14XcDl/7hPpwpciAiADKPJWYjVQcWxfQA1UqMn?=
 =?us-ascii?Q?R32x/uVMUkNJLA5MTAV8YuEJGw1ubRb+HdAjlQoYCoYo69RWICGiYtJaOaLq?=
 =?us-ascii?Q?Ea3p7wFzNdWFDVI/F4qfzPGKxzZWf8ptxxRfpSgFCBg3DpkClXSDGsTljF7/?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb7cecc-95fc-4a95-42fa-08dbc104fb58
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 15:58:54.6659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lCyqu+OOEJ4+oeGcCwIJfp3G8KnQKCw27VXMZ9KvhznRoD4j9gv3us7Nc2I8VK7fzH9MzRzY9NH+V0bRYyWcMQHGel8Q2O2ye59imjLsUdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4791
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe: Rename MEM_SET instruction
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 28, 2023 at 09:43:49PM -0700, Lucas De Marchi wrote:
> From: Haridhar Kalvala <haridhar.kalvala@intel.com>
> 
> PVC_MS_* doesn't reflect the real name of the instruction. Rename
> it to follow the nmae used in the bspec.

s/nmae/name/

otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 6 +++---
>  drivers/gpu/drm/xe/xe_migrate.c           | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> index 1ee8d46d92d9..1fdf2e4f1c9f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> @@ -60,10 +60,10 @@
>  
>  #define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
>  #define   PVC_MEM_SET_CMD_LEN_DW	7
> -#define   PVC_MS_MATRIX			REG_BIT(17)
> -#define   PVC_MS_DATA_FIELD		GENMASK(31, 24)
> +#define   PVC_MEM_SET_MATRIX		REG_BIT(17)
> +#define   PVC_MEM_SET_DATA_FIELD	GENMASK(31, 24)
>  /* Bspec lists field as [6:0], but index alone is from [6:1] */
> -#define   PVC_MS_MOCS_INDEX_MASK	GENMASK(6, 1)
> +#define   PVC_MEM_SET_MOCS_INDEX_MASK	GENMASK(6, 1)
>  
>  #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 1d1e4076b29d..2e6ce2daf414 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -809,13 +809,13 @@ static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs
>  	u32 mocs = gt->mocs.uc_index;
>  	u32 len = PVC_MEM_SET_CMD_LEN_DW;
>  
> -	*cs++ = PVC_MEM_SET_CMD | PVC_MS_MATRIX | (len - 2);
> +	*cs++ = PVC_MEM_SET_CMD | PVC_MEM_SET_MATRIX | (len - 2);
>  	*cs++ = pitch - 1;
>  	*cs++ = (size / pitch) - 1;
>  	*cs++ = pitch - 1;
>  	*cs++ = lower_32_bits(src_ofs);
>  	*cs++ = upper_32_bits(src_ofs);
> -	*cs++ = FIELD_PREP(PVC_MS_MOCS_INDEX_MASK, mocs);
> +	*cs++ = FIELD_PREP(PVC_MEM_SET_MOCS_INDEX_MASK, mocs);
>  
>  	xe_gt_assert(gt, cs - bb->cs == len + bb->len);
>  
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
