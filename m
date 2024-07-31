Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F7CC3DA64
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 20:22:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC4A10E4A7;
	Wed, 31 Jul 2024 20:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5rNQSyj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5C810E4A7
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 20:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722457337; x=1753993337;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PxmkHVW/LCGwIz+HKkxhKrmkp6Vaz6hO77LZcJOuCCk=;
 b=L5rNQSyjoD5aSOtrg0lStwRXUwXQEdLzlhTUHufP+evT0B1zn+UEhwwD
 CLPGRDUpcB5+yQ1lBiX66UUNz//tYIGsS+1g0o9dgvBsQE2YQ6sGqL5mg
 09jrK1GD4/dACFdJUIVfthb1GAqeJgQ50YT6L89oScncSA7s916ZYzGXR
 FE3HPcH58NtIaNJ+GVtFEgG+lDcjAKftOB9O/23ZPo7xL9XGp8N1Vj7zT
 FfbIZ2aL9aT1A9h4nHpUOzM8XunZ+vvpzFqRP60q+cpLKRnCxfatVVDz4
 B1qhT6I4r6d+aN3VoARWj3VuSs6LQzZJFBn/RiWeJoE3aV/ZBIYP7S+vR g==;
X-CSE-ConnectionGUID: lu5E3GQwSfGQ4nK9xbLG4w==
X-CSE-MsgGUID: Rket/s+kSh+RtuV8yGF9Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20312562"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="20312562"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 13:22:16 -0700
X-CSE-ConnectionGUID: nMdtQO+7Q+i3kHR/CPCVtw==
X-CSE-MsgGUID: Z8CYS4QrRGWW2FRIf9beyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59589633"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 13:22:17 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 13:22:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 13:22:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 13:22:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vc44wt9fCEDAcwf6Ysk10R0ZO9vp+Bv7kIK2qnGJiAnYlAMsGGXORk4/QaiLTg5MYPLzEhrD4y/jWM9g//BD42GUuyVppamIU/wyxCReQALlsoeGVt1TNIvtztHoCMwx0UHrgYWm81ocUr87vfY2d1Q0rtJMrUboRUBFUmKV9qaWDHNPhhGtJVjQZv/U3XjO7ss/bvH5vVUgJfz2CQqkTda3fEeBajBCKHSEdquI8F0ul2GdwyXZQKAjHJ4Ew8On4xhAKieAgT6f/GHXkvAisWkwo9HcIopOYnFODnnL9Zce0Sdf75RqUgZyXUeX0ne5U1Yy9ski7wt09N2CDNmmqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0mSITwqk6g9AOzw+bxlu7drIBLlqwHQoPRVGa6kJMw=;
 b=JO0cK5j4pmqxDPdfBHhoCdMgDx5vDo9oY+odwV+kQTPBeDUXHbhUv/kma5mY7fb2CM0sROabtzpmFfh/wB6xSxxkVDYH1ayty9zhMvvmelWYtREilElHT90b8H7QadLd7TaN5mlfRZWCSJERqUaYgc00W72U6JywiIPBNE0hgvYY+nBQZtUEOwg+1H5E1LwAmYG+s5TLqGSC6T2Yw3CrGHKEFvvbNnPPiitkNuOr8aFMC0sC2DTGFF7LYpdj7sj0AjvKxlq53MHCSKzzIAEOMRHZQGKUstQs9bklg8sZv6kpN4y4iqgcF2EZ9Vfexm1ZbiEn868f2NN+6LEfvNfcXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB6515.namprd11.prod.outlook.com (2603:10b6:208:3a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 31 Jul
 2024 20:22:14 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 20:22:13 +0000
Date: Wed, 31 Jul 2024 13:21:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Write all slices if its mcr register
Message-ID: <20240731202148.GJ2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240731093152.51424-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240731093152.51424-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0067.namprd03.prod.outlook.com
 (2603:10b6:a03:331::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c160367-d604-4279-6cfe-08dcb19e6b35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dSu6fx5efKb22YPQm4Rmmf3Mo45EsTRIcDWnFGluEalIxYkqvyikbiOMALxo?=
 =?us-ascii?Q?/NyGQGWTSfieQUTjunn6mpy72At6MRsVToNEp3EeGp31E3DGNlEVfgMIHx9E?=
 =?us-ascii?Q?aLWbiE7MeY0ILh0DFPFnfio7GHLj2ilMBVrPRNXQD5sHnnR9NjgaNRz1IP7F?=
 =?us-ascii?Q?25R8uUj7BJiUr8apwMwj94Q5F1fzWmHn6DyGPxvX0czwLu8x19/YOVB6nHcW?=
 =?us-ascii?Q?U/6UOBeWwBkvt+fLwZb0PomXF2kHwLlWvulH3y/qiYglDiVBcQKIsNqOSCsC?=
 =?us-ascii?Q?d+Nv+nLVLUnxZfhM33uMLom79R5FaHZ/MzpFH5/T7dtGOXxmpWQF3BcNpxXq?=
 =?us-ascii?Q?fatT3Udg/8VNVnoOPShi6rXjheS74DOD1NKxbISHa2dp/DNgqYDPfr6AI3Cv?=
 =?us-ascii?Q?GSnrwtTurd50PDtEhg+sHCaewyt23DVKiBuQJlqXj8rMz/7Z2MzmuwCMNdPK?=
 =?us-ascii?Q?GadQ+XLyY2BtsiiloQPQZio0gTZzyXBXTzXgKkpctJPVexcpTvgRbJzmne7M?=
 =?us-ascii?Q?fh1fC2vVbt16mEz6BhQpeX5j7XRc/eRwCOsg9mTHg+4MRIiO9mAHL7d1pv2V?=
 =?us-ascii?Q?cfyX9wTXX4NSK/0WuX260v/fhUwNmUn6/jpdd8fcMns1hTm7+3nnT2QcI/C1?=
 =?us-ascii?Q?i7BdW4lsqzXsKa8p4PmwKJ/jrkB9WR3KPLHvAxOvDLJPKpP57VCZhCpZyHAk?=
 =?us-ascii?Q?kwG5qYwjVBvyxI29pLKnDOG//A+mTFdEkfbnd3mil3wClQecBwBUKqeKCZSh?=
 =?us-ascii?Q?rzyxlSrezjLbGtiCq+0KSjCKtxhB+qLvUOOII76DT/hs450jV5c536bp7Dxg?=
 =?us-ascii?Q?49eZsLsNbQ1p/TXjc3ILOgIqnaLdrIJsI+3IPGiQ9FGsU4ZP6sqQZ/gfbopb?=
 =?us-ascii?Q?9rLJNRfqQ7hTSrttZ19KC7N+QuzVHmDqkeo1e5y48gLPvcH5X2WRbqE5mg+w?=
 =?us-ascii?Q?GUlHnXeLVhTBYWr+9cP2HihelI1eh06RlgZRk3ZrJWY4oPKDMxHAyWXSUTpY?=
 =?us-ascii?Q?PjP3k4EBmAI4YVX7lsdAzWak1cEkhIGQIeG2+DJ60+0Ad8TFNAyBg8wsWBG7?=
 =?us-ascii?Q?gJ9cTi6ldabQ8ye+rvvCW7sXluK+jrcIhGH7TMC1uLLeH8Qh38KTNMMYMtQQ?=
 =?us-ascii?Q?+R17LI27FeU9ystGZK6r2u9yJzOqcDcBPmpM89Jl+HJH3MjIfvOqIB+6pN/j?=
 =?us-ascii?Q?GOhKbGFLhq/Wsma0gvYobOt1R1Vf+T1AktSJ7nOPOwxLIfUAsRWcV/R2Tl2S?=
 =?us-ascii?Q?SOIUI7Dn6x/0ydPvvJDKUsntS7W6wPg0XNri17NFGJGNjOv+LZEzwsU3LLEF?=
 =?us-ascii?Q?wUJX9c/C3q1nGVrivnj2rxGHIbvBTazeNcc5aUFSyRw8dQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IrteMMV2riw20ZvLktnDf4S7rrJ4waP2JraXsJnKfckbqRZ6IJNhtXuUOTey?=
 =?us-ascii?Q?bXp7vsXIAmMuF2zYltr6ci502ToTF97vRKz7SlBEFY8g6xmAwXfdLolmKGWs?=
 =?us-ascii?Q?x1UrfqJL9ifgEqVwPWL+ngJzBOrHV5iQEai88Sjzk8vDru5yNnpJCusBd/iK?=
 =?us-ascii?Q?9bWXp1XWgSDlECbk/YO2SmQNf8XyA3RD8lFVbAkNeLxNk4GV00b1R87jxW/S?=
 =?us-ascii?Q?ihfbn7Bn7u/ZzcMPOP0VYB0a9OjtB7zBCM2LWfdeO2ywe9WZ/hyYv9j1bG5A?=
 =?us-ascii?Q?LRnjH8JnRy9j6Hwpwoel7xD7bxVSSjLK/37cciB13S7/e4C5/z/xNfUvDR2J?=
 =?us-ascii?Q?ViPm3fXVYimvlKVcmTvQy19IaPIJ2PcCEwp13eQBbC7BqPfGEBEMuhCryWY1?=
 =?us-ascii?Q?QgIWKy8yPzhmkZq5Di4fFfPCvGxgtrKJFdu9zyXDpF4zfjZrkt0OL6caAfk0?=
 =?us-ascii?Q?OJX45HNzO788YT1lcFsQiHyq/u/0GCFvvgAdhBfCT0WKBo5ygAQRqJ05NsB4?=
 =?us-ascii?Q?b0QYFmeXN/Kg1F1UW+QoqROoFPDVGmEfzCh1fgyxH6KH3eQpkkB4AB1vc5Ao?=
 =?us-ascii?Q?Cr6RtQ6iMbC/pCCrwtaJmD/I+rvKcZ1tq7GmYYBoIPNtO4x7cW38VmPqzXXX?=
 =?us-ascii?Q?iQEUhgBHH9LYWqsLzebfFtVjEZ0/dLm3xDD0fngNyFR8g8tZ1UwRdu/ezjpq?=
 =?us-ascii?Q?/92VvhriKbpjAWPLKF1g6QfJENvim8Eeu8p/ITXQlxwNop/dOhaIcQIpOVBm?=
 =?us-ascii?Q?BfOI339zgk8djWlWejIlz9oDCXmjVjWmdCSe+Eytufhl0ZDo/kxINheN2/+T?=
 =?us-ascii?Q?uJHiBFrMXXGJOySAVav6wWbM2zefVlkWMb0EImpJBf/WOilSHGsT3ohatXIr?=
 =?us-ascii?Q?NanKDVE5UyZZ+95EZsJ42hXGG6p0CcKITMtw+ZnxV/R/xjlEDasNT9RkK3H1?=
 =?us-ascii?Q?5ynivD+44eklB4jfO0aBlrV+hRk4Ik0xmO7YSiBIMhjSW3lY/qGnHKW3Mzzk?=
 =?us-ascii?Q?PqGsvWY8cuS/1SvdO+a2Bo2Lk+EVkkI1ZQ4/fUFMH6+YRpy3yufRT7CcvCTS?=
 =?us-ascii?Q?GP057XYch9NYe0bI88K+FqKxXtEvbQyrP3qo79cVCHT/mDb/IxZ6XtVShADO?=
 =?us-ascii?Q?EWIGQE5TNIB2DmAlUxCkfqc43eTEVJqulJv0gfMxPJVwztg/zQAvZQboW7O3?=
 =?us-ascii?Q?0+Obhcl0KU5+ElJqQGxaw7jcgZA/76eH0SKEmfS6VpOB41U/v59uUK0Jfdsb?=
 =?us-ascii?Q?rck/sNCr3a2yBo20b+YcVb+wqYzt+RNX0Sy3UjwYTh8Kyko/72zHBZEEZVl+?=
 =?us-ascii?Q?AMaLUesZRzQLo8iGebpPa+Xnt0zsTqaEeWlq7fyqv4GwetXXzkdaADPqbvQq?=
 =?us-ascii?Q?BMJUsnbCUQ6XEXuEmkp8vFABOw3YnTb9zoXcseYV/g2kNb3soCuFKP/fSA3z?=
 =?us-ascii?Q?kgV8wRY4akZtTtb6NQxpSS8YnBlAsxbObvQ1iNJraI8QiwV0+CcfA/lRHQTC?=
 =?us-ascii?Q?nZE+12E2WBXc1elzuOxgBxqOttRV/RBSVrwlWmQJKnL0ZUbaYO6QrC6KyTFj?=
 =?us-ascii?Q?5MyHMLPaEMNDr6spma7sUF0EwfMx88Y45DvhgpM9fXmR4cCu+ac8kqZ+bRKs?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c160367-d604-4279-6cfe-08dcb19e6b35
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 20:22:13.4283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBfC+4zTZ9xVgeEqQP2DuNfff9dE6LMoyGqFXGhWlW9mJ4PS+6tyk5rHzHU5+6rYSb9KNSXCFlm1E0H1UaVJBAoMzuTXc8z8Eru34ia1zxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6515
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

On Wed, Jul 31, 2024 at 03:01:52PM +0530, Tejas Upadhyay wrote:
> Register GAMREQSTRM_CTRL should be considered mcr register
> which should write to all slices as per documentation.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Bspec: 71185
Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
>  drivers/gpu/drm/xe/xe_gt.c           | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 3b87f95f9ecf..b131e3171899 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -80,7 +80,7 @@
>  #define   LE_CACHEABILITY_MASK			REG_GENMASK(1, 0)
>  #define   LE_CACHEABILITY(value)		REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
>  
> -#define XE2_GAMREQSTRM_CTRL			XE_REG(0x4194)
> +#define XE2_GAMREQSTRM_CTRL			XE_REG_MCR(0x4194)
>  #define   CG_DIS_CNTLBUS			REG_BIT(6)
>  
>  #define CCS_AUX_INV				XE_REG(0x4208)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 58895ed22f6e..c6296dc8897f 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -110,9 +110,9 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
>  
>  	if (!xe_gt_is_media_type(gt)) {
>  		xe_mmio_write32(gt, SCRATCH1LPFC, EN_L3_RW_CCS_CACHE_FLUSH);
> -		reg = xe_mmio_read32(gt, XE2_GAMREQSTRM_CTRL);
> +		reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
>  		reg |= CG_DIS_CNTLBUS;
> -		xe_mmio_write32(gt, XE2_GAMREQSTRM_CTRL, reg);
> +		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
>  	}
>  
>  	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0x3);
> @@ -134,9 +134,9 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
>  	if (WARN_ON(err))
>  		return;
>  
> -	reg = xe_mmio_read32(gt, XE2_GAMREQSTRM_CTRL);
> +	reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
>  	reg &= ~CG_DIS_CNTLBUS;
> -	xe_mmio_write32(gt, XE2_GAMREQSTRM_CTRL, reg);
> +	xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
>  
>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  }
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
