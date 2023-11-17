Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C49C072A2
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 18:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D29E10E090;
	Fri, 17 Nov 2023 18:19:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D3010E090
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 18:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700245183; x=1731781183;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EW3vr5nb9KtxQHlA4Nj83nU10d1TQSh4X87mIsohMCg=;
 b=mjZHPS2k0JQ/K8uwp6dcDo9MDc7pIC4oOCZZX0mqNpZDFU2poeTar2u3
 XVIqQHSc1f2WiSfBM1hA+mHcCOCrBp2DPuDyDmxhGPQcfYNs6lh/uEHgc
 l1eterjmcZCp9lDpIC70X3PtFwyXE0K0etwnBEbtgKR3zZ6fSmBBSjNcP
 DD1xOdkUSuLvBd5eCuWqIbG868zvOaH5O6L0jq4dBqtN1wtnYvqdC2npx
 dDx6e3SEOvgjwe66g0pBI9aJ07NO7TDcr+q0LNUYt/j9KxEpfVzUz0Mzq
 ot8u84F0QDESuiGjAK+tu4ta1z5ajC2QRwZC0gNiAb/kOZzv/aSkpUzgt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="4491293"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="4491293"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 10:19:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="856409665"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="856409665"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 10:19:39 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 10:19:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 10:19:33 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 10:19:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7qz9mi4u3k2dtRyz3vV/ae9i2Yx/C7Xnl2GdBcgPtdqMCectzGH6zSxgqPQvFM0O2w7Xf+f0RF3pQWtBfR4KtJDk9fWx8z2FhFmvR5qZYc+UtnInUZBuMre0CfFIgF3dT0c2ZmTbhWCkdXQ+KHAVddZEqh+oGFHuz6QzR7/SPcFctC+eQafx90SGJbj+B9D6FDw/lwMo92hwdXnFh8acuaTHPqD1dukNfiwiJxt+6/U9wghvixyifLwYJY0xUmvXEU9z/bS9x/CQFEE4aTEP/ezsE00CIsR1hS6Spp/8ELARZqZYvxt0MrgP/2PnG831jfKE1QzrHJ11LBAk9Uweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1p0AGCchUHS+Io7laILfzqe/GBAVuASet0bJtE2VvA=;
 b=C8jKUaMW1vWuuf4f60WlS8E7tlVvSe0phQDG2gFWBk2NCmpkNLeqMgQpr3OE1vYy4CEZ1vM8knUQ4rlQ2XM6UxHWiblIVvogPpCldfvrl5reG9ed5hxUjZYdq/wP2cen1qrEVUZlAAbEkBc55IcnaaWNPfsAk2qLIIrlMDmd4o7NHPDSI+QIYYrrTq4joan8vlKMbvx9KMQQtJunXr5VR0ZFzauS8+kxtChMyPGoLiDPemPdEkkIBNPk5GMVA8yg08b+pFdkZ9xUlu5XRP25Il2ygMm+8tlf+HjwXWrwUIB9zc6kafvIjvuYkTVrVjhzzC+KXn4hLQ4WVvbC/Z2Xug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB4861.namprd11.prod.outlook.com (2603:10b6:a03:2ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Fri, 17 Nov
 2023 18:19:31 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 18:19:31 +0000
Date: Fri, 17 Nov 2023 10:19:28 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231117181928.GX1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231117174049.527192-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231117174049.527192-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR02CA0032.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::45) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB4861:EE_
X-MS-Office365-Filtering-Correlation-Id: f4f3d3ad-26cb-4bf0-44c6-08dbe799be24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PPvIxE+HQrocgLF+nkRjQn7pSfImsaNuIx/TTf/hdcAdX0vhNnkpmAW/1sWYwiHxrjllnTg2wORzh9nd7cNU7Op39S3A9wtwDV2xT+LWRmuUDRaTyQ4RJ9XxtzRD9FC+ZvVsQEyHCZ7xNvDCJGbBwvoX0wq1Q1s6SPDmD8WPCqCnsiKm0niYJ5TEi0A9MVwQv1z5oFdRbqSB7WwRQO2yLafwxxh2byAxIHhS/wtUhWi4CN41/48kzPQX/SJBPjxFkM7rFwyBhn/gqtkwp91D4PAr0SDFdiX9GyEhWG6q7eZsRwoR/Bf6EF1Da7bwmVnUzzyOqNpKP/1woxwUgMk7lEb8LkALd/8Qtk3EW3tkofl3HKib5Q8M0FhOgjt2aMoowUafNut/wSYHKi3kNyDGNNJrch4lAf7zHCba7R9vYBeApKWtshAvTRWcP5fQwaYc3ztV+n5fv0FcU9aYNl2WKi44rRR0vieGOgzlGrFIOws9O/Buq1hVxJqPsU8n6DF+PjUQmIXlLMXDRfG2j/Xz6LHgE0hdvylrjf2Cr2uoq7F8KQJr7Hg9iApu4YYfZYYd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(41300700001)(6512007)(6862004)(83380400001)(4326008)(8936002)(1076003)(8676002)(6666004)(26005)(2906002)(478600001)(6486002)(38100700002)(5660300002)(6506007)(82960400001)(316002)(66946007)(66556008)(6636002)(66476007)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1gR7GYroRlh2kJf69t7605deDUP/6+p8ugMZeWA1G8iBZyf650Pws6w6fHC2?=
 =?us-ascii?Q?6CNCcwkQNeuc+j10omOzLN6dPhCN5Kq6RA6TDgaawWpr0qZMooiYub/3Xx/k?=
 =?us-ascii?Q?raUCUADh/5WHptJBh8NJheqbbEuJCql1UEYfswmjb24+GMpJw90hT1cxEEwv?=
 =?us-ascii?Q?Dm1FoO1NtotXtdmhBFiZP0ZsW4Puj9Bq3C+NcZcz0KOBwDIs8mG7xnLm7X87?=
 =?us-ascii?Q?6a2dJKIHXA9hnOek+o9+pCh3D/GZUCZJqXYg6ILqCMq5eI1oHQ4KZCL+vfB7?=
 =?us-ascii?Q?Xk2IH1ktsYlLiEPxHFl4Y5/U4X8PD61NtjGQNqC1cdXAbxvajbUo/vYd29Gj?=
 =?us-ascii?Q?X2nETIsUA6bApDZjbIZHCNkmDi/L9j7F6As4/yAoJzTGuYX4FkH7stJHpKzn?=
 =?us-ascii?Q?WNzHstnqtE0UwtfeNaEns/ilsbRh//q1OON/PFjh24XMIJUWKvhtAWFQk/l8?=
 =?us-ascii?Q?5ivSsn0w7jANbYTN9oSz+O5xhbqPoBrUxn2XFSdawsVOrfuTYR9AObfW0hpD?=
 =?us-ascii?Q?h4tVExhX96Dmv1nki/RGF//W+akot9ilvShtW12x4mrPlMRFz3v2FV4aSSX9?=
 =?us-ascii?Q?8HZ+wGmt5VjEV8wvCThkAJpLseYT7VSTXmc6/2UXZeurhJLUAYQx87spLYxv?=
 =?us-ascii?Q?b21DHyD3S/8vxFDYp6CW9wYDMoqPp5XyzfdJU5LBV9kctPz1X7MwRo527/v4?=
 =?us-ascii?Q?Y9r6ZWPcRgkJEHf3QNiGYinSGSgTzrO3b6J87+Zoh9e0U+sq0QApPVd90rAX?=
 =?us-ascii?Q?S6fYN7+Wx9Wg2TNzECU7pX5PkViVzo+xyPaH5uom0HU8/hdsl9zbj59kOmg+?=
 =?us-ascii?Q?AtDyhtCuS5CfDBl3i5a/c6gBBJLchTsjz9eXJtRNu+SusNEhhjpl3CWZImgw?=
 =?us-ascii?Q?1y3OMf9kweVnN74wFbgctHqYAyBvW5cJpenSDtANhGOjwrZuu2Ms9y1r1kyf?=
 =?us-ascii?Q?wineiX4Mm0l11fWJnn9RFi3AOg/gKNTlNVcZev/IxK7vH6VjOxpRoSgskTP9?=
 =?us-ascii?Q?swH7gytI0uWdhvlBMj8r+QvXHf19joKvzQmS99OLEnVBc6po1+eGutw/k79v?=
 =?us-ascii?Q?C3c9tpyubq0MFL+oOPqLUT/qf7UOs7bKD6LhyBW0YyrIaKdmjjOXUZZWUVyg?=
 =?us-ascii?Q?7cDitnq0kJW+UCYOlO+7BCTWWobZK36EK9E3O08tnSXVQ8eWkaGqAGxxPqhz?=
 =?us-ascii?Q?zg3Nwin3RyZiiI3M47KWfTKud+HyS5SN4Zwq36iaG6s9WTj7Z/A35LqVpLb+?=
 =?us-ascii?Q?BrwOKXhsLn37u3FhgbEGkpkpfPROfa/iT5dGF0MqbOz3cjuTQmShEYN9mS/M?=
 =?us-ascii?Q?kTatL4GYQMhDcWb190VLVtR9BZ6e809ZkT3OTQDO/QEIZoub56V6yXbeqxUA?=
 =?us-ascii?Q?pn3j8MeiK6r70jZjRvhyU/79YcxfWEkqqcONAvtXRzF2EXKJTR0uToXbMgm5?=
 =?us-ascii?Q?DVjFsqji5M7CdAxb0jpWW4u6wUwEAbyPP+yQOv2yyxEXxgXXi5RpTtmElSEh?=
 =?us-ascii?Q?F8zR05Pq03nfF+5Xf6UQkivDn4Fdv2fQKXtRi18Aa1HosGm6hyDV8/mIQpUl?=
 =?us-ascii?Q?Db/g8ZjVBfRJ17jDDehDW2Ucdm1n1m0EaNgcR8Chf4LlO74GxJ53iP0t7EuL?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f3d3ad-26cb-4bf0-44c6-08dbe799be24
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 18:19:31.0565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Aa9TZA+zSzmWCrvtmO0N5VkD2N8n23eNBD5FXkWhtgwDE0vpgl4NUka5lPpCy5/PSQUc7MPrdZa1Wq9R3Bk2KB5jSLN+kFVe0bMTXWm+rQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4861
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Fold GEN11_MOCS_ENTRIES into
 gen12_mocs_desc
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

On Fri, Nov 17, 2023 at 09:40:47AM -0800, Lucas De Marchi wrote:
> GEN11_MOCS_ENTRIES datest back from importing the table from the i915

Typo in "dates."  Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> module. The macro was used so the it could be maintained in a single
> place and platforms would just override with additional entries.
> 
> With the platforms supported by xe, each of them is just defining
> individual tables without re-using this define. Move it inside
> gen12_mocs_desc that is the only user.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 228 +++++++++++++++++------------------
>  1 file changed, 112 insertions(+), 116 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 46e999257862..a072fbccc693 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -149,123 +149,87 @@ struct xe_mocs_info {
>   *       For TGL/RKL, all the unspecified MOCS indexes are mapped to L3 UC.
>   */
>  
> -#define GEN11_MOCS_ENTRIES \
> -	/* Entries 0 and 1 are defined per-platform */ \
> -	/* Base - L3 + LLC */ \
> -	MOCS_ENTRY(2, \
> -		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
> -		L3_3_WB), \
> -	/* Base - Uncached */ \
> -	MOCS_ENTRY(3, \
> -		LE_1_UC | LE_TC_1_LLC, \
> -		L3_1_UC), \
> -	/* Base - L3 */ \
> -	MOCS_ENTRY(4, \
> -		LE_1_UC | LE_TC_1_LLC, \
> -		L3_3_WB), \
> -	/* Base - LLC */ \
> -	MOCS_ENTRY(5, \
> -		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
> -		L3_1_UC), \
> -	/* Age 0 - LLC */ \
> -	MOCS_ENTRY(6, \
> -		LE_3_WB | LE_TC_1_LLC | LE_LRUM(1), \
> -		L3_1_UC), \
> -	/* Age 0 - L3 + LLC */ \
> -	MOCS_ENTRY(7, \
> -		LE_3_WB | LE_TC_1_LLC | LE_LRUM(1), \
> -		L3_3_WB), \
> -	/* Age: Don't Chg. - LLC */ \
> -	MOCS_ENTRY(8, \
> -		LE_3_WB | LE_TC_1_LLC | LE_LRUM(2), \
> -		L3_1_UC), \
> -	/* Age: Don't Chg. - L3 + LLC */ \
> -	MOCS_ENTRY(9, \
> -		LE_3_WB | LE_TC_1_LLC | LE_LRUM(2), \
> -		L3_3_WB), \
> -	/* No AOM - LLC */ \
> -	MOCS_ENTRY(10, \
> -		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_AOM(1), \
> -		L3_1_UC), \
> -	/* No AOM - L3 + LLC */ \
> -	MOCS_ENTRY(11, \
> -		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_AOM(1), \
> -		L3_3_WB), \
> -	/* No AOM; Age 0 - LLC */ \
> -	MOCS_ENTRY(12, \
> -		LE_3_WB | LE_TC_1_LLC | LE_LRUM(1) | LE_AOM(1), \
> -		L3_1_UC), \
> -	/* No AOM; Age 0 - L3 + LLC */ \
> -	MOCS_ENTRY(13, \
> -		LE_3_WB | LE_TC_1_LLC | LE_LRUM(1) | LE_AOM(1), \
> -		L3_3_WB), \
> -	/* No AOM; Age:DC - LLC */ \
> -	MOCS_ENTRY(14, \
> -		LE_3_WB | LE_TC_1_LLC | LE_LRUM(2) | LE_AOM(1), \
> -		L3_1_UC), \
> -	/* No AOM; Age:DC - L3 + LLC */ \
> -	MOCS_ENTRY(15, \
> -		LE_3_WB | LE_TC_1_LLC | LE_LRUM(2) | LE_AOM(1), \
> -		L3_3_WB), \
> -	/* Self-Snoop - L3 + LLC */ \
> -	MOCS_ENTRY(18, \
> -		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SSE(3), \
> -		L3_3_WB), \
> -	/* Skip Caching - L3 + LLC(12.5%) */ \
> -	MOCS_ENTRY(19, \
> -		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(7), \
> -		L3_3_WB), \
> -	/* Skip Caching - L3 + LLC(25%) */ \
> -	MOCS_ENTRY(20, \
> -		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(3), \
> -		L3_3_WB), \
> -	/* Skip Caching - L3 + LLC(50%) */ \
> -	MOCS_ENTRY(21, \
> -		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(1), \
> -		L3_3_WB), \
> -	/* Skip Caching - L3 + LLC(75%) */ \
> -	MOCS_ENTRY(22, \
> -		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_RSC(1) | LE_SCC(3), \
> -		L3_3_WB), \
> -	/* Skip Caching - L3 + LLC(87.5%) */ \
> -	MOCS_ENTRY(23, \
> -		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_RSC(1) | LE_SCC(7), \
> -		L3_3_WB), \
> -	/* HW Reserved - SW program but never use */ \
> -	MOCS_ENTRY(62, \
> -		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
> -		L3_1_UC), \
> -	/* HW Reserved - SW program but never use */ \
> -	MOCS_ENTRY(63, \
> -		LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
> -		L3_1_UC)
> -
> -static const struct xe_mocs_entry dg1_mocs_desc[] = {
> -	/* UC */
> -	MOCS_ENTRY(1, 0, L3_1_UC),
> -	/* WB - L3 */
> -	MOCS_ENTRY(5, 0, L3_3_WB),
> -	/* WB - L3 50% */
> -	MOCS_ENTRY(6, 0, L3_ESC(1) | L3_SCC(1) | L3_3_WB),
> -	/* WB - L3 25% */
> -	MOCS_ENTRY(7, 0, L3_ESC(1) | L3_SCC(3) | L3_3_WB),
> -	/* WB - L3 12.5% */
> -	MOCS_ENTRY(8, 0, L3_ESC(1) | L3_SCC(7) | L3_3_WB),
> -
> -	/* HDC:L1 + L3 */
> -	MOCS_ENTRY(48, 0, L3_3_WB),
> -	/* HDC:L1 */
> -	MOCS_ENTRY(49, 0, L3_1_UC),
> -
> -	/* HW Reserved */
> -	MOCS_ENTRY(60, 0, L3_1_UC),
> -	MOCS_ENTRY(61, 0, L3_1_UC),
> -	MOCS_ENTRY(62, 0, L3_1_UC),
> -	MOCS_ENTRY(63, 0, L3_1_UC),
> -};
> -
>  static const struct xe_mocs_entry gen12_mocs_desc[] = {
> -	GEN11_MOCS_ENTRIES,
> +	/* Base - L3 + LLC */
> +	MOCS_ENTRY(2,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
> +		   L3_3_WB),
> +	/* Base - Uncached */
> +	MOCS_ENTRY(3,
> +		   LE_1_UC | LE_TC_1_LLC,
> +		   L3_1_UC),
> +	/* Base - L3 */
> +	MOCS_ENTRY(4,
> +		   LE_1_UC | LE_TC_1_LLC,
> +		   L3_3_WB),
> +	/* Base - LLC */
> +	MOCS_ENTRY(5,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
> +		   L3_1_UC),
> +	/* Age 0 - LLC */
> +	MOCS_ENTRY(6,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(1),
> +		   L3_1_UC),
> +	/* Age 0 - L3 + LLC */
> +	MOCS_ENTRY(7,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(1),
> +		   L3_3_WB),
> +	/* Age: Don't Chg. - LLC */
> +	MOCS_ENTRY(8,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2),
> +		   L3_1_UC),
> +	/* Age: Don't Chg. - L3 + LLC */
> +	MOCS_ENTRY(9,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2),
> +		   L3_3_WB),
> +	/* No AOM - LLC */
> +	MOCS_ENTRY(10,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_AOM(1),
> +		   L3_1_UC),
> +	/* No AOM - L3 + LLC */
> +	MOCS_ENTRY(11,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_AOM(1),
> +		   L3_3_WB),
> +	/* No AOM; Age 0 - LLC */
> +	MOCS_ENTRY(12,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(1) | LE_AOM(1),
> +		   L3_1_UC),
> +	/* No AOM; Age 0 - L3 + LLC */
> +	MOCS_ENTRY(13,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(1) | LE_AOM(1),
> +		   L3_3_WB),
> +	/* No AOM; Age:DC - LLC */
> +	MOCS_ENTRY(14,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2) | LE_AOM(1),
> +		   L3_1_UC),
> +	/* No AOM; Age:DC - L3 + LLC */
> +	MOCS_ENTRY(15,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2) | LE_AOM(1),
> +		   L3_3_WB),
> +	/* Self-Snoop - L3 + LLC */
> +	MOCS_ENTRY(18,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SSE(3),
> +		   L3_3_WB),
> +	/* Skip Caching - L3 + LLC(12.5%) */
> +	MOCS_ENTRY(19,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(7),
> +		   L3_3_WB),
> +	/* Skip Caching - L3 + LLC(25%) */
> +	MOCS_ENTRY(20,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(3),
> +		   L3_3_WB),
> +	/* Skip Caching - L3 + LLC(50%) */
> +	MOCS_ENTRY(21,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(1),
> +		   L3_3_WB),
> +	/* Skip Caching - L3 + LLC(75%) */
> +	MOCS_ENTRY(22,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_RSC(1) | LE_SCC(3),
> +		   L3_3_WB),
> +	/* Skip Caching - L3 + LLC(87.5%) */
> +	MOCS_ENTRY(23,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_RSC(1) | LE_SCC(7),
> +		   L3_3_WB),
>  	/* Implicitly enable L1 - HDC:L1 + L3 + LLC */
>  	MOCS_ENTRY(48,
>  		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
> @@ -290,6 +254,38 @@ static const struct xe_mocs_entry gen12_mocs_desc[] = {
>  	MOCS_ENTRY(61,
>  		   LE_1_UC | LE_TC_1_LLC,
>  		   L3_3_WB),
> +	/* HW Reserved - SW program but never use */
> +	MOCS_ENTRY(62,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
> +		   L3_1_UC),
> +	/* HW Reserved - SW program but never use */
> +	MOCS_ENTRY(63,
> +		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3),
> +		   L3_1_UC)
> +};
> +
> +static const struct xe_mocs_entry dg1_mocs_desc[] = {
> +	/* UC */
> +	MOCS_ENTRY(1, 0, L3_1_UC),
> +	/* WB - L3 */
> +	MOCS_ENTRY(5, 0, L3_3_WB),
> +	/* WB - L3 50% */
> +	MOCS_ENTRY(6, 0, L3_ESC(1) | L3_SCC(1) | L3_3_WB),
> +	/* WB - L3 25% */
> +	MOCS_ENTRY(7, 0, L3_ESC(1) | L3_SCC(3) | L3_3_WB),
> +	/* WB - L3 12.5% */
> +	MOCS_ENTRY(8, 0, L3_ESC(1) | L3_SCC(7) | L3_3_WB),
> +
> +	/* HDC:L1 + L3 */
> +	MOCS_ENTRY(48, 0, L3_3_WB),
> +	/* HDC:L1 */
> +	MOCS_ENTRY(49, 0, L3_1_UC),
> +
> +	/* HW Reserved */
> +	MOCS_ENTRY(60, 0, L3_1_UC),
> +	MOCS_ENTRY(61, 0, L3_1_UC),
> +	MOCS_ENTRY(62, 0, L3_1_UC),
> +	MOCS_ENTRY(63, 0, L3_1_UC),
>  };
>  
>  static const struct xe_mocs_entry dg2_mocs_desc[] = {
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
