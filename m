Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D15C54ED1
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 21:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A67410E199;
	Fri, 23 May 2025 21:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lAmz18R6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B33C10E199
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 21:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748034145; x=1779570145;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=81xWnm06trF9YFYWxNyLqMSB+WXOeRp7f54pnUBRMsU=;
 b=lAmz18R6U9TFRbuliVvofvpk4CWTsEr7vFIAw6AsqwiWo8kHnsYPI/s4
 5oiuncWqtCH5/F90E2kIrr3r0wCvDA1bKp6ladVoPKEBtnJk1LRQZhYRo
 /H5oR8HWwg3C17l0NrF2mFfnuaISDOEBWvrU8ASuPL1Vzl6rZ2MMxdYXj
 jrAz57Y/ELe2Gid4UjsxEy5kJZ/VUgzB8v0vTPNvaD7aIlLDJbMfnOK4x
 Vh2/HpBOez3Kt/e/zimSl1VEHOwrzz+xyhXNtB5FI59tfQ0aPI1Ds0woz
 LjP94K1yVlZcqmgMUr1Oc6X6m/vFttv0kVTD7UFgwBt1/niAtAx/2JXcL Q==;
X-CSE-ConnectionGUID: HasyZq7lT2atYTyhojur9w==
X-CSE-MsgGUID: kEdrvsUcSJmhpsCqBFFHWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="67659080"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="67659080"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 14:02:24 -0700
X-CSE-ConnectionGUID: XLxSJ5EvTsalUr7jSHBL0A==
X-CSE-MsgGUID: IwMnRBddRJy1VlilzlaJIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="172258314"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 14:02:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 23 May 2025 14:02:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 23 May 2025 14:02:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.52)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 23 May 2025 14:02:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tn61t/V+z15Q2IlB+fW3I0wQyxmqTcVXN1ubUmc0C4KQLXM0HKjDyfhbyMP9jKaVj+MEsxCz0veYxUcxhC3JOKaSWp888clQuxW4ndGOWRoT0iXw75l+mxRGDGk0VTAn9R7iL0359AtaPuJmsP3uLfpou6BIsEO8GoP0s0PW/JNwFjoHgvsb3Nqv6VxtpawCp0I/TIXvpUmmX/XAMUHgTqbYsX0j2f07fZELzgbCSkSgLmRMv1UMSNEC5SfQdkgltlWIfj+LVVwjCYMfXmtAdC9vchvE3FbJn/AX7mv0QPQ0usthEh5vkwmuSA+7DE3gYH3mffmNGJFJ5oqhgGZhoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAbVZLOr1kGYSsl6SPb+fZ9p9Do7oja5hijYc5h5/Dk=;
 b=kcNdCrox6EHAUhQvSDRWv9bw+qe0IFVrdWgQ+SZO2KZNbuIx72/yEv6CbEwwS2Z9bqKEJqrQ0U8QMS5OoDbCscrb+P4LxPxyq2FEQEYInCQmlx1YgC1hQ7kLJ3K0KBe8etQTxqmu+hzpmJEfzbUgDmq7e9ZypP8czvCkyG0AaoTWSkDkVh85Jsx7dv4Br8mZ1iyLvyYxLSRgKQMzAkxSXMzgqqYZrcf6kNDJTmTuO6DhMKJ3SujrY1crGFtvXzQIYOVEA/9A6lswHpsXwU2A4V5749n76gQ5ezhiZXjIJbD/a7V96uIaukYPWHgPEz+LlBbou54ppX2Tvgi+bLa2wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB5059.namprd11.prod.outlook.com (2603:10b6:303:9a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 23 May
 2025 21:02:16 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 21:02:16 +0000
Date: Fri, 23 May 2025 14:02:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Stuart Summers
 <stuart.summers@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: Allow to disable engines
Message-ID: <20250523210211.GT5080@mdroper-desk1.amr.corp.intel.com>
References: <20250523-engine-mask-v3-0-11817dc6eb63@intel.com>
 <20250523-engine-mask-v3-2-11817dc6eb63@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250523-engine-mask-v3-2-11817dc6eb63@intel.com>
X-ClientProxiedBy: SJ0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB5059:EE_
X-MS-Office365-Filtering-Correlation-Id: 057211b6-ba84-4c14-a806-08dd9a3d1946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?96Y8SabUjhmK7FwUs/DbLf4QxuHo8xd4yPl8gpg8I+KM/NwBLZf0WzjMKNQa?=
 =?us-ascii?Q?LAc8R3vQqi1xEoBffI8zIOk7sRQjjZgWTOpxNDIcmtk3xmJJODCnwLnT6g+2?=
 =?us-ascii?Q?ctTsiDXdQndgBQcbMObJMrfxMn2QLtRx7XOezUx06i2zBiiJDJba9FvYVXLm?=
 =?us-ascii?Q?rTTvQKjVwfQm9P5I1r6Ts7Ni4LKmBJ+2jrMFAmaGcCEP9dxUPGUFp1xJpMMA?=
 =?us-ascii?Q?KUenP8HLdw9da7dRElD5DzMQ9VksLcMy+JSjQX3fhJk7rdR0RKVuTwvCGxB6?=
 =?us-ascii?Q?Ie4AJ5g1bxoeyMnHs2F0AvnDU31bHfWCOZsYJhzO93qS52UGqff1AwzcsSPc?=
 =?us-ascii?Q?/i6CYWkdRC1cprCUz7v7idQvsgivDJUo4WL7KyxoMMw+7tJ7MyI2fBlOuNvs?=
 =?us-ascii?Q?XU4xvc0m0T+cIpz3JaET+RvIz0KWksYhSuFx3g/DRrg8KtM3Am22/YX6Gew2?=
 =?us-ascii?Q?c7AGvwHO1Ll/q+lXZyfy9jzZmm23JUWfEx8P5iuLY0lTjOHmhPLC+lAq7c2E?=
 =?us-ascii?Q?FpLsonXCrEQ3pgXV82vKVpu7pDDItSwLU/gis8G+d6ipltJBaW2D1HoEgK4p?=
 =?us-ascii?Q?cTTBNUtZdBavjtj7NGHFe4QX/xtV6ADnS78ub6wzVVm9WgskvsXqDBca6VKq?=
 =?us-ascii?Q?vby8VsYg8BZcBLdVOecu1j8kWUPo/5eGuHy2Xa7VbmbOHE5HYUh/BkbYXYrd?=
 =?us-ascii?Q?MpZiN/vM1eBein8gdqMZRF3dORO+fYwLo4FbtQqyvvpc542TBOzhKgJPrbSP?=
 =?us-ascii?Q?YTTdnsQ1Cjfw1yXbd9KZJ6VvlMqVURCyWSjjKub8jdf/bv79OyBBTcB4z2lx?=
 =?us-ascii?Q?lR4u8Y3Fg2NadzjM2NmtgY9iTk6aTOlOj7uR0ZKQvgwPMbGvCJWhNCF+6EbV?=
 =?us-ascii?Q?5jrxMi6D0i4LeEuxLguZzZ6CJbyvajHBb4RI1oBvvDuhbeGN2eDcvFdKIFlc?=
 =?us-ascii?Q?JSzcMkGrllwj3jsiWUagsVpJmTI+/G66KXh7H8lUGMG7TlhAsrZcsdi6u9lJ?=
 =?us-ascii?Q?DHzxp+efqHvY1ngP9mkAZBEy9v6y5Jje8tYetxKp8QtoQmHGBG2kKwpdd41/?=
 =?us-ascii?Q?P3QGIAksBpL0U0/P0cGtQXGuQ8CxkssQWUt26pl9F0uIKYoHhiL1QaaPlVBC?=
 =?us-ascii?Q?goGrH/R0GzW+jZR6sNHezhyMU5V7mmAbxiTaVatdcWd8Q255qAOIKD9FmSda?=
 =?us-ascii?Q?M77nNqz9NrdkfOUWcikvdwMCR2u7rtOA4uYeTPW314fUncTjIEHluqLJfzRY?=
 =?us-ascii?Q?yHPa3rS1o+nw6wVaWiCikCgFqjhHpxFgJ1otPnmsc3riPy6BzH3th2NhtUXp?=
 =?us-ascii?Q?ESlO82TUU6rPgPqeg4m1dPtNQN3JJEqRbjLtxR2NbI9QLbkCxe46ttxkEqSb?=
 =?us-ascii?Q?b0fY0ldXY5BQJRfrZAZ1gvR7CW+mhHulGEg84E7ENogO55fzHs+90s9HrjfJ?=
 =?us-ascii?Q?90+QiqXwkgw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vnDTbHy/rdgVj3B0ypri6wNAqhtFoxiIRVOx5RNN96LKLmGHg0ozGtXI+5h/?=
 =?us-ascii?Q?TvUN0Ap/QgP33/7f1G+y1bQyt3n8zvhw3zDjtJJKfUkP7tf/LgpE8GGx+iKa?=
 =?us-ascii?Q?sM4phNYftHsep3B3Ern4fBjdGk9aJT/Pv6MXx5czONl0PNy3jxcHfMV8vubq?=
 =?us-ascii?Q?K2lZ5sTHJAmCvg5enVseQbNoplJu7xMx1ai5Me07HvfXhP1HhKy4YwoXlNUW?=
 =?us-ascii?Q?xk/7nXRihUctFIMYcUpmEvpwGPHmZ6WFTlUibuzWyNT+/riMyITX2SBpbIcb?=
 =?us-ascii?Q?PBR9fU/n18Te+lxuW949xB3F1Pb1DtTgzdCuoCsG9pYSVSGCg9bHSjcZDSQx?=
 =?us-ascii?Q?uliZ9DlHBD53b2PWxs3+mRTGnoR5B2lDkBBzRCby51g4RZoNxP9IRftzRSP5?=
 =?us-ascii?Q?IKB/WWQA7lVQ7XoWrK4U9AgcvGRQuAOKKxSOG7Dq1bg7bxhmArOJ2GN/khhM?=
 =?us-ascii?Q?N2YLFPpCV1gdsCknXgRD56oEAn2dlt7bfnlEKwM72eBvpHppsabAVsD6wiIe?=
 =?us-ascii?Q?xB2Vv//luIqzdWSUeZ+xAgg0nAhsbOKgr6Qy1d/7EgHyQv/K8+9xPIWsXhYd?=
 =?us-ascii?Q?FdfHBvV+lfgCa3r8uK4eynRcLsHQ7kPnbRRpXCCuNYrS3yQ0gymMkoxaonJZ?=
 =?us-ascii?Q?ETjmIhZmocbThpyZkTKIjCRx2dby/RbOu9ym/zZSxeDvpQ3yVe1Zzkl/W8lr?=
 =?us-ascii?Q?0l/HD5m+OGQ9vQXa4DJEkfNt1H6XpxcFo8QVVKHvWweBt5PRiYMIjM3fEkET?=
 =?us-ascii?Q?Kc+XzMtC4liaOZORcAkESU6iW3lU7+H1FP0wJGR5E5mIpeF98QgrR/1bxVjq?=
 =?us-ascii?Q?nnxoIXKeiaXSU/i/vWXFLUKg2GAcnPVz7I4Y02nW8rYrpIhmg6CEoBQBzAdA?=
 =?us-ascii?Q?uXpPavfdjKXTIjKhYMw8+BIR2eHvNb+ze9Tzan/AO8MMqKtsqOTAsLjMI5Ap?=
 =?us-ascii?Q?YdX2UHlh6hfXL+jJ0HZHJo0fbBbuMVzjqp9KfAUUdjknzUh1RyxPdccnNKWB?=
 =?us-ascii?Q?MwL3zeoigsqBu9cX075pW1FD46aOmV8ByMvXaLZLCf09cMKSK/gTRDLj8gSE?=
 =?us-ascii?Q?jcTJ68W6xOun5jUPYlwCtClRFOYjgORJZzZmMHlXE2QrCoWU8SweF5hstum9?=
 =?us-ascii?Q?i8IiQkyR/LrI//BlNGC7G1tpqkUm5C7PzAwC/g/93cFj6pRVavZ4MRQZj9eU?=
 =?us-ascii?Q?z+mdPqe8XbUvID6wSJCzTRNYuFUTG3bhJyfaZ7ReK/pAoUzIFv5n08e90jjX?=
 =?us-ascii?Q?xwj/1/MurnQtujfLJE0omxN/WXiuWuJ0CscpKujqwHSQRpIyTm5fa/Zbu7zE?=
 =?us-ascii?Q?7TsF73cZluJ9GfSaQ37O71RlgPimdVPj+lsNJAyDYdtrZCX4HrIPSLpaRugz?=
 =?us-ascii?Q?i2Q1H74oSTo6IaAtQiIhT2E21t/FaBaSBErROjEZnU69/hB5CGK/3WePg6+N?=
 =?us-ascii?Q?P7C2RQZ8JbG7bQD6zrGikdezkhokFH1Xn0OblfOXy+FgHaRGERfGTxj5q76A?=
 =?us-ascii?Q?SKnDeGODW/gQ3hp33l0AM+GMVSl61seloE87YJ2EmS9W7b3fe/tpRWHhA2FW?=
 =?us-ascii?Q?barg9Ywka7w7UxhX9thZVvbK541DJqI00yI8P5u5tBuEbiXJMNZIANSAvOs0?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 057211b6-ba84-4c14-a806-08dd9a3d1946
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 21:02:16.5364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Ih2rSgqZxh+r+7an3OPMDVL06nuqAuAwvlAutl3MLvuLhThrrGltcqYgMDPglWFhEfBudCbZ1Xuzuvjfl+vf7BPPr34EbmCsTVyRgXEjFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5059
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

On Fri, May 23, 2025 at 10:42:32AM -0700, Lucas De Marchi wrote:
> Sometimes it's useful to load the driver with a smaller set of engines
> to allow more targeted debugging, particularly on early enabling.
> 
> Besides checking what is fused off in hardware, add similar logic to
> disable engines in software. This will use configfs to allow users
> to set what engine to disable, so already add prepare for that. The
> exact configfs interface will be added later.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c  | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs.h  |  2 ++
>  drivers/gpu/drm/xe/xe_hw_engine.c | 20 ++++++++++++++++++++
>  3 files changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index cb9f175c89a1c..11ca36f194bfc 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -226,6 +226,21 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>  	config_item_put(&dev->group.cg_item);
>  }
>  
> +/**
> + * xe_configfs_get_engine_allowed - get engine allowed mask from configfs
> + * @pdev: pci device
> + *
> + * Find the configfs group that belongs to the pci device and return
> + * the mask of engines allowed to be used.
> + *
> + * Return: engine mask with allowed engines
> + */
> +u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev)

Nitpick:  should this be plural engine*s*_allowed?  Alternatively,
engine_mask_allowed, although the function name is starting to get a bit
long...

> +{
> +	/* dummy implementation */
> +	return U64_MAX;
> +}
> +
>  int __init xe_configfs_init(void)
>  {
>  	struct config_group *root = &xe_configfs.su_group;
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index ef6d231b3024b..050da4689d653 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -14,11 +14,13 @@ int xe_configfs_init(void);
>  void xe_configfs_exit(void);
>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>  void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
> +u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev);
>  #else
>  static inline int xe_configfs_init(void) { return 0; }
>  static inline void xe_configfs_exit(void) { }
>  static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
>  static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
> +static inline u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev) { return U64_MAX; }
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 93241fd0a4ba3..8e7f580db86d8 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -17,6 +17,7 @@
>  #include "regs/xe_irq_regs.h"
>  #include "xe_assert.h"
>  #include "xe_bo.h"
> +#include "xe_configfs.h"
>  #include "xe_device.h"
>  #include "xe_execlist.h"
>  #include "xe_force_wake.h"
> @@ -810,6 +811,24 @@ static void check_gsc_availability(struct xe_gt *gt)
>  	}
>  }
>  
> +static void check_sw_disable(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u64 sw_allowed = xe_configfs_get_engine_allowed(to_pci_dev(xe->drm.dev));
> +	enum xe_hw_engine_id id;
> +
> +	for (id = 0; id < XE_NUM_HW_ENGINES; ++id) {
> +		if (!(gt->info.engine_mask & BIT(id)))
> +			continue;
> +
> +		if (!(sw_allowed & BIT(id))) {
> +			gt->info.engine_mask &= ~BIT(id);
> +			drm_info(&xe->drm, "%s disabled via configfs\n",

We should probably use xe_gt_info() so that it's clear what these
messages apply to, especially on a multi-tile platform where the
different tiles may be fused differently and leave a different set of
remaining engines that could be potentially disabled by software.


Matt

> +				 engine_infos[id].name);
> +		}
> +	}
> +}
> +
>  int xe_hw_engines_init_early(struct xe_gt *gt)
>  {
>  	int i;
> @@ -818,6 +837,7 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>  	read_copy_fuses(gt);
>  	read_compute_fuses(gt);
>  	check_gsc_availability(gt);
> +	check_sw_disable(gt);
>  
>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>  	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
> 
> -- 
> 2.49.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
