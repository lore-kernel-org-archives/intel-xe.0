Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF53CCD196
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 18:07:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E13710E235;
	Tue, 14 Oct 2025 18:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KWNEXEv5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA0110E235
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 18:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760465232; x=1792001232;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5ry05mOpnxMMP9RTVtiFdUd2tgCtGLqOox2TGsuRHGk=;
 b=KWNEXEv5kyubFPLWBsOI/G7XhCRCgpIAzUkZFvWApCF6eKUsq4Ihuv2W
 gHkUSGnR0/nMT/YQh6d90G0iWxOzfHzQLyJiD+NkmbEs9Ui/uPsQ29DRX
 Nacsxnpjkx+KSALMPefUH53hXLeIrF+GI8VuKcJZYs2LxhWUSwnPtFCt0
 X3OhD0eHsetVSv1oNLiKWE0EdUxx8SaTLsi0NiU7ytngTqwOkxGyqyJ15
 lv10EOQngorFNi5GmpREdElJaKJX7Ad1zDZtlf2JclwbSp06nio72/mDr
 W8feEYE2BB3C8Wpy7gmmEEY/HdEE7B30qb1eBZoOFgu/4I+BnFYLxIz9m A==;
X-CSE-ConnectionGUID: lsSXI1h1RW6+f3vj4LJujQ==
X-CSE-MsgGUID: 06jvlhNzRFuvIgq9h4MrJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73234384"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="73234384"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 11:07:12 -0700
X-CSE-ConnectionGUID: Pun5KhfRSum+cj4wtJtfRg==
X-CSE-MsgGUID: jwEFGCHOS46f25ssy3N1nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="181501219"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 11:07:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 11:07:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 11:07:10 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 11:07:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiTk7hlrn8RevUobvim+6K34wbRC2m3CSH278SZgJWOivYYMcfQAh9j3UXZjr6AyaEJ/wHqHEHyGC1sV+JqKJ742Bo2Fgevpctu7jHw/en8e1yos2CU+/x1JWpgSGMHYBBHRwjZ9ROIsw9lcol5UWUBU6lb96YJksvWA7wX6XBnDbAG01uQf4OCMFtEVYN8CaxvB7mSoIZwGdHLc/kHKntYr3RYMpJitFnGIqaOkqlP47l/9aZtAuwWlIXmLKNjCyv0xYtRtW43lkoCfXxo1T+fEWL7XEe3ZqdtCMjdiZoflEMbG8ms8Up+VWaJQL8QOGeRJpJ61+OXyMMxLWqw4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUPXAnYJp7cBsl441HCCSzcXRj8R36+piejkyXzeZ+4=;
 b=vDrdH67VgHenRglj6YNGHTynhahKnLVN8LtoxtDSoY9slQl1rAsHeZp1ANxZ1SAcc2bx/ftNASITsAs8Hi6ArS2MFxc+aRQB1bhfuKijwBcUz+Hoc3SaA0n83WsdrgRWmO0bA/0/NTB906lG9cSS0/g1tCW+mdHJhz1OGpon9kpuR6vUVmN81h61erpB5qPpvVhUfIeJMpZ89gdrEzUePRHXBZ0HG5ZoQc68s4IZMJ8Xz9kCTxqnGmUeoV8cBaw3GVbBw+jlb/TM3MhxDFqVX73OjXWY5woMVrOqQbRqQ9c5PGzTzuStNQdXKcklPz6AWFzkp1NCCui6dzYAGlg3Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB8395.namprd11.prod.outlook.com (2603:10b6:806:38c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 14 Oct
 2025 18:07:08 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 18:07:07 +0000
Date: Tue, 14 Oct 2025 11:07:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, S A Muqthyar Ahmed
 <syed.abdul.muqthyar.ahmed@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 20/23] drm/xe/xe3p_xpc: Add support for compute walker
 for non-MSIx
Message-ID: <20251014180705.GY5409@mdroper-desk1.amr.corp.intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-20-bfb74f038215@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251013-xe3p-v1-20-bfb74f038215@intel.com>
X-ClientProxiedBy: BYAPR21CA0002.namprd21.prod.outlook.com
 (2603:10b6:a03:114::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB8395:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4f974d-3589-4def-f65d-08de0b4c7cfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zv47gz2w0Y4KJy/A5pqa/dg/N1MKfT6M0OUJA//B0H+Wv/n5dSrApPvJqNah?=
 =?us-ascii?Q?EzvlvJDN9fjjEZ0U2NftoRzI9H5ufGHi/z1fu+wHlHjRPlVwOaloLm+KLmLC?=
 =?us-ascii?Q?ljxaW5LyTLVrHmHo4sTUXEvXjHAlw6oaZQ8BRGI5CAwhBevF79uK3hByIovX?=
 =?us-ascii?Q?ihEpqJXOt9IScTsl5/5MZ5cXtDK8m/DJYCONQ/oHiwzMbUyyJoKeuAfc9peh?=
 =?us-ascii?Q?pBvnhQxeVlEEhQImZ8Xj6Xj60R+NfaFvKZ7S1tbR2eEskPACtdCEEi87aHYm?=
 =?us-ascii?Q?lKe22u2swK2h76F7ExhkbJskUr12t/wmLBf5xBjAiHaJPEbXd2OhcuXPSOLE?=
 =?us-ascii?Q?6QsQWQzqlUuCc2m0Xe0PH9y+RCp3z1ii8snmW9YhMj//PczY/0TgY9Q3yuz/?=
 =?us-ascii?Q?kmfEw778iCxxbpibJq5AE6Fy9BZsrT7iwKxSCqSn4EKCdMVpn9xhJA6Sk8+Z?=
 =?us-ascii?Q?bSqQj1vSEzC4MI44eIaDRgdRbe/50dVczsvvCN/pcVKXcQNL8rLfMRuF1DSN?=
 =?us-ascii?Q?7OidDQDBISs6soDEcQ29uxcbZ1PEG4KMCD5Q0ZXZ4lC3/8QiH9CqbUEtbqUd?=
 =?us-ascii?Q?3sCNGtuA2glC3LUYaDYB+6uH7wHjBRNKYz1N81eruqzXN/c0a6zafErG/ujl?=
 =?us-ascii?Q?052QHh6yI3flKzhohHLuCSVwGBbRntGLzBarBEMzn+4b8WaOZY8GLBW1wRnz?=
 =?us-ascii?Q?RSR1e7Gzb/FIa8ZonWDE/llnZHCqsCfo0RRV4c3WZA+EViESK9n+MiAvc/ST?=
 =?us-ascii?Q?5SDfrEmgfgwkFsqAGD3Ilr35Rred5lrt9J5nLx5JyQZfOIoOxv5yk0+fin8M?=
 =?us-ascii?Q?I/NM3GQ/bxUQOrxYkpobwPzfBgD5SO4muaMDYNiwtKkVEjHDy8l1NHVZSv2C?=
 =?us-ascii?Q?5tN0w+zWbToK/UtD8vXCY7eBCmMBB3sBGxfjGrykOW1FXS6aG2WpR1rzD74a?=
 =?us-ascii?Q?hZRtyH4YgsToTMmYFq8Thi1E3GQ4Uwg8Ooezu0W4SuQPqKCD/ccNl5My00Df?=
 =?us-ascii?Q?yvlhw2gmHaYEBOpBGE4KJOjkMn1++atIGFA6oOfWPvo5LeWPfjRui1pc4UBt?=
 =?us-ascii?Q?POy+0dZtW94R6xnsAggII5lKT4cB8m0XLWq0b08jMUJgvqbp7izAj54bbXe7?=
 =?us-ascii?Q?HQ8m4I0/sI3pQO95MLFMbf67rqgkli0hi6m6x2zZVO3InMyffcP//ygwDjlw?=
 =?us-ascii?Q?akCmcVeTPEL/cHD09uvRmeyKliYm8xNN73cR/LhAL4xUmt29QaNLXqylbxxS?=
 =?us-ascii?Q?J9jOxhmX0mbdCaMnXcrp6b4AVvwrdxRSR1CbIlrxPK80t6rxslofyEr3bHoV?=
 =?us-ascii?Q?jdSn6oGNjG2nstoiSn757sdWKKZs5nA5z66bgDR69NQXQy5ps71NHpPcoBxY?=
 =?us-ascii?Q?Iyl+daNzuoQV1J734Tvo5KdAWQpWaReucSs8OV20hU9lohSoUqtKhO5GgvGw?=
 =?us-ascii?Q?H0ovUk/DEdnJRQXKHvblmjzRp75LmYtX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h8taTXpvGtrtYTXDPUv29EYe24QYcMAGvWkRJEfa9AHwt+ibVHoR+NbwuAs3?=
 =?us-ascii?Q?8e1NqeLClBzu6c4YlmBE+lk3lARdRKSobpYKsHzPbo3IQDWkCxENhCR9jde1?=
 =?us-ascii?Q?XHfDLSDDoB5bwzuhlpEwlI6G/OaVlpkwVBw0vGXjrVZMjRj0h2O6BZzLDutb?=
 =?us-ascii?Q?Llz5AzPg2bW6BsAUL+2jam3KMfZk8yWQyqrpBO6ZsEQlFxLUD2qefOet/9qS?=
 =?us-ascii?Q?GJdaLxsS7P7FWUfltSCvEnD6Vbh+IvSQwZs447wemG/G4Ua9jYQK+yZDmP9R?=
 =?us-ascii?Q?VOZYfgOWJKMSVqFd+z+2QPZSAz48xLBsB0SmH0nVKtT8gltr8prSQ4ceKfSg?=
 =?us-ascii?Q?yyRbDbkb9FuYOtKnRfppAAmRGm1jvzWFUAjjvb/IIjfNoc32P2ptMzkyTjz/?=
 =?us-ascii?Q?bSnN78aeaExuAVkZ6UwpBa0Mu3OUl2ZDRM+e0qIZwMjexgxxlw0cTr6ApIWp?=
 =?us-ascii?Q?nZgoByxU2gyaMWHF4MmCjJpURfqMvCEIHPBrI6NYy10/6I8yoZP36k7ZKe4I?=
 =?us-ascii?Q?rsbxtCzY/UGc6vNJQyJctqdJmL1mlAPYN9iV7d4jF0T39QIU5EgsJ0X9yQoV?=
 =?us-ascii?Q?Vn6WOl36oIt+gNPjB7Igxv8N3xWh86l3alt0xdFQVXYe4gGa0m7pLaZ7Y7YU?=
 =?us-ascii?Q?GkzRwtL8lrG68gZqQBvJb1jPi3AVR01/HBPRHmyGukFHevIH5ireXgsNfbAJ?=
 =?us-ascii?Q?SkORCyypAfi1wH15EBeSxYp1K62ot+8MEQYmYfMeo3xOvMu7NcVfyb+Tl/6f?=
 =?us-ascii?Q?eYQ4upRQtxjSvY7UNsHqEVjeLEfW+uwSmK9PzByol3ibMdVchCjoMsyyL+7F?=
 =?us-ascii?Q?VM+2z98IIFxMCM9tS2DE688T4WK6bqbF/pCRKVnTx3Smrl30XQvXozotTvMl?=
 =?us-ascii?Q?dwCu/lBFDu5S2eQDQh0SqO/R3yXKbEF1L9Mg9e8UY8xLVJhDI92px0RtEfou?=
 =?us-ascii?Q?LVKQ9P5D5ufkWnjUfQiCWg45BES5dx8BkpnWUWkAc/cH/+t2c+D5d4hGvoQ7?=
 =?us-ascii?Q?o5KZIn3lIzl1JPlPL7SbpAhpJqJAJJQPZy460jqHKwT07kQjRDqF42Z5acFL?=
 =?us-ascii?Q?BVtb3xXopRocsfTvgThi1CrPLe8SNf4DYpDwI54C2fEHn3A8/bq+EKiTZlTZ?=
 =?us-ascii?Q?OABp9vlwqXzyPHe40DxjNVcOdh5i335HQQ9v1cie/oALprM8qKIspKME8CfD?=
 =?us-ascii?Q?ki6IcdPCqNFAd6L24Q5sIdGmvTyIKLa5ugKW1QfDOlSjMHrJ8vhTRTArbKpj?=
 =?us-ascii?Q?41LyWH7AdbeHRQPHrX3yjo0HrBS5r3X4shitJ7K7scAS4OAm6XUR/LpGapR7?=
 =?us-ascii?Q?l6+mUpI8iMqrLtSEmuMyleNUzdzfhFwIPeA3dPZ/3/WnpIYRBvEytCxDdGms?=
 =?us-ascii?Q?GBaRuNkbIv+17yO3AmbkzL1b4e+FDMPRu3cj5pqHqt0sAVE04qeuiW6lZUcg?=
 =?us-ascii?Q?k372nXNDo9RqJ24JzhGCcnsX2DtWeh2tlGtFuwT51uaNDtm07QGq4B8CQLzx?=
 =?us-ascii?Q?PqJc+n0o/xX56KfMUjG0la+tR+yAZKFINJlYc+gu9oIILXPFr+rsB1STRjV7?=
 =?us-ascii?Q?4mWwQ532AJMH9Fv0R58Hwrt//6uHVBmF3QzK7xHP81Onfqo1hDDQH9sPqvqM?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4f974d-3589-4def-f65d-08de0b4c7cfa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 18:07:07.7332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfasbVQ2rXmiUy06BZLNLam0HfeweMh1AZ6Ru5JlyDMjpmP23J7XUbHXIICWAZ7i8JQGeGrQU1SN16/GZihMwlRzpBjE4RgstkcNmTGE9Zk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8395
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

On Mon, Oct 13, 2025 at 08:24:52PM -0700, Lucas De Marchi wrote:
> From: S A Muqthyar Ahmed <syed.abdul.muqthyar.ahmed@intel.com>
> 
> Current implementation of compute walker has dependency on GPU/SW Stack
> which requires SW/UMD to wait for event from KMD to indicate
> PIPE_CONTROL interrup was done. This created latency on SW stack.
> 
> This feature adds support to generate completion interrupt from GPGPU
> walker which does not support MSIx and avoid software using Pipe control
> drain/idle latency.
> 
> Suggested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: S A Muqthyar Ahmed <syed.abdul.muqthyar.ahmed@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_irq_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_irq.c           | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> index 7c2a3a1401424..9c46b5fb81412 100644
> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> @@ -82,6 +82,7 @@
>  #define   GSC_ER_COMPLETE			REG_BIT(5)
>  #define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
>  #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
> +#define   GT_COMPUTE_WALKER_INTERRUPT		REG_BIT(2)
>  #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>  
>  /* irqs for OTHER_KCR_INSTANCE */
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index af519414a4297..e01b158895342 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -150,6 +150,10 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>  	if (xe_device_uc_enabled(xe)) {
>  		irqs = GT_RENDER_USER_INTERRUPT |
>  			GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
> +
> +		/* Enable Compute Walker Interrupt for non-MSIX platforms */
> +		if (GRAPHICS_VERx100(xe) >= 3511 && !xe_device_has_msix(xe))
> +			irqs |= GT_COMPUTE_WALKER_INTERRUPT;

This bit only exists in the compute engine interrupt vector (bspec
62346) and render engine interrupt vector (bspec 62353).  It does not
exist in the blitter (62345), vcs (62354), vecs (62355), or gsc (63341),
which makes sense because none of those engines can run compute walkers.
Should we be making sure we only try to unmask and enable this interrupt
on supported engine types?


Matt

>  	} else {
>  		irqs = GT_RENDER_USER_INTERRUPT |
>  		       GT_CS_MASTER_ERROR_INTERRUPT |
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
