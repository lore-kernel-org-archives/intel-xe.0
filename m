Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE28AC25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 20:52:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4850410F3AE;
	Thu, 23 May 2024 20:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTFCEGQc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB8910F3AE
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 20:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716497532; x=1748033532;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kCBmgPRrZ0gmhbXbixd6lkaXceFXrNzWdoQQzSgIf+8=;
 b=cTFCEGQc7bdXEwT/c0VDjREdDSaLP4OiBg9QoMTJ+oXQUWP+hCSEDS5U
 gDGcJlA/MiKrMGbI69IQdhX+iaSSMEkk/au+UROPzHP+vQs8InRSNBUHl
 3qH7KcGizr85Qu2a/TTHD000l+88jlyrtNypMYBzLQrrdpJgvlKHFNQFn
 vBtXABknyl8v82VIq5tm0C+KsVNABbqODgdrqcETmzm5M+OtHcK4kyXll
 M2/931oNjecWzPwmzYfOaCQAssQwCAKFrNit7qbrc4kqVPgkZMRzR+6/N
 8Jw3zKZl5Jv/HuSQz1iDLCMp+xY24b80j5anAyP6+TnpYwgjLfB6AT8+p Q==;
X-CSE-ConnectionGUID: gDF86zshRcGIy2q4S82s4w==
X-CSE-MsgGUID: OswEvZART2CZkqOMGK8xaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13027875"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="13027875"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 13:52:12 -0700
X-CSE-ConnectionGUID: nXWsJCiyR2ykvkn6cwTH4Q==
X-CSE-MsgGUID: riUpdXlPQe+9KjMevUe0tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33666297"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 13:52:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 13:52:11 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 13:52:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 13:52:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 13:52:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxAeWatN+xbExdfQZGX7c+1fne7dosyZ7lQ+eoLjNsfflV797HzLpPrvRJXBaVWRgcJvhTgyrmyqS/2ljJMxh5vsDEYJtVrY7vDN6V7H3TMOiF+b47d/FtygVdvxGIUYs8CcnCAcN4trdsimm1mG8IGVFLmoCo+ppxQhJsJh8a8W8Q0ySAvaxv9kbsDuvYwK10JGWkDloMcgA+vnYdo8y6w82xd4o2wlqjeCUiZK5bzgOQwpR6Gkik4/w/y3Ds9Uo0+SPUXI1TMc0LcDKExFWPLSQSaTXBHOVa06KhW4SqnIDxM4zKa4YzfOfvFxgFpTZV/vX5V3L3HAwd+nCqxOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdVGI0Kx6ycO4UI75w4un1RgXLOPZZJ66RXOnyMYajY=;
 b=RVvyt4xMdHplHhXBSNpkf1359Loty7Qk3COVPAjxl/v/eQ2qovVnjoQlLsVVVKA9NhaRSxZgRFSOEyo6fGr5jfYA+De5yn7Qwjf9/oSVJexyZv8SP9SfWTte2VmHBvRknKH0y386UgmGDSFiStr335yEereKwwcqxc61ataMOWiwh75R05J9MPoiA+g+XuJZcjMVE/BcklqRLocpjPKUbvQdmERLot+/H+BoR7T/sx+AY7CKzl+7koQlbBDfjvutpPOBlKjWthKBVeo59uNQaBKL69h7STbkA+dR966DAIjgpgznaSePDZ2v2xkhBDL8dtgYNNjDSYUCyg7KTNWYUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL1PR11MB5240.namprd11.prod.outlook.com (2603:10b6:208:30a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 20:52:09 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7587.028; Thu, 23 May 2024
 20:52:09 +0000
Date: Thu, 23 May 2024 13:52:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/6] drm/xe/vf: Obtain value of GMDID register from GuC
Message-ID: <20240523205206.GB4990@mdroper-desk1.amr.corp.intel.com>
References: <20240523192240.844-1-michal.wajdeczko@intel.com>
 <20240523192240.844-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240523192240.844-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR21CA0010.namprd21.prod.outlook.com
 (2603:10b6:a03:114::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL1PR11MB5240:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c8f1d23-6fa7-4583-9a5b-08dc7b6a365d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fXgs0ZnqCSSJ6TRybZg4sukjyX5QPjajiNmdUDW4wFo+jI+Fy1myZgXBnDuK?=
 =?us-ascii?Q?Px/b5l2NfD5f8e+K9jFufe+0huY/WhYDiT4c9smGKtX1vkliHPhobj/dhTVD?=
 =?us-ascii?Q?Z0vgdXEVmMjWIIoQ9I+ZI7gQJI8YR3M56QT+ARn4EydDXF0yGHR/6Zwk4vXz?=
 =?us-ascii?Q?6K77CpTNqRUnIpkO2oepFEFqDJ8ziJMQiyeT1pLAu9VPJBFe/nP8Cz+zVTk9?=
 =?us-ascii?Q?27JnJVrl9PEf6cNcsPt40N1W4/XgHi+3gLUMNg6FUdggCwLzqlOQz5rBxUVL?=
 =?us-ascii?Q?MaRTJHmRaCf35UL2683gUJdoJwFPKnTX4DbPI1cO3v/KdZKAF0igawI/3V3/?=
 =?us-ascii?Q?HhliG5Um+yyYIqedk4XHPcM7jcEOHGQoB75jMJE36WfBNlF60e+AZlr1Y1hS?=
 =?us-ascii?Q?0FvchW5w737CbFUmoXMyr0EItVCNj2jONpoQJ9hF0yqj6oLCf/XOwmCskHyz?=
 =?us-ascii?Q?QRAiuz56iNc3L6kPXNA4Io1o0gjvzybgpEsYUEJz+cTJI8Y2a9LWnnB9atYo?=
 =?us-ascii?Q?bTxk0M3i4tH8di3a+Wxezm+oQFetMgXGx04EQSbdX40X+XqLYC4ioSdwqVhc?=
 =?us-ascii?Q?AagAdrNGCeSZyDBQ/dwrbdcgX95qQ6N0/BZwTgA+gBp+Z3xycbywcIG0RM1H?=
 =?us-ascii?Q?F07NKcPTuOQDOtRefL9OhU2BXuQTt6YVnQHUOzrLXxauZ141wTo+hNogMqNq?=
 =?us-ascii?Q?nnUisuqBtWdSaWxs6d1OjPnsbxTww6wEN59LMcZTcAlzQah7loFlmDIjI8Lo?=
 =?us-ascii?Q?OoCbV14egSitFPa0FOR5T+sPCBCnI3g6F1XPgJIg2NJd2VQGsZgdh9jFum8i?=
 =?us-ascii?Q?DDWXG6iZDVOgPdxftg8TZt64ne3CwPdD0u9BR1sf8Am9wY90iMbbuXLob1T9?=
 =?us-ascii?Q?zegovckD2owKNPZcks/d4kXy+7pJcSzoOK5w2dR1sxcYwCfnj4E/oU8hCNDR?=
 =?us-ascii?Q?NVCyNJCr+kFP+WVfRVhn0Vg0Idf50FFRjZV6xbUhD4lOG7ZeW5OK17K3oYF+?=
 =?us-ascii?Q?/s4IIBpCuOG6GYlBHc36CHMaGG8r4Dw+3Zoj96vHngYUZ8N9+i3pW0XoTAqM?=
 =?us-ascii?Q?Cj0NBnK9uLpqVPgYL+ndi2mxCVQUNYW4NbQLMwZangZcF/btZq6/U6Qn0TD7?=
 =?us-ascii?Q?S6VattVNyZCYCUhOjMd+rWZ7GHA5J1Ob2fzYwkLzX+rdkXrIShVTo/cgHT2O?=
 =?us-ascii?Q?YV5imfPZ1pc7aiXGM3BoG9fVpXOU8JfiulgH/T+WajB6zAYk/ky1berkiNOt?=
 =?us-ascii?Q?U0gHuTjlTpGA0eRa0DpK5QgLQtjupGg/oDpkKc3C4w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lx4Zziq39TiblsPKdMn64ehe8hB7JHbsW3ZmUudpZ3wKk/4/BjUHuWv7BwpN?=
 =?us-ascii?Q?lZO4ycVak/EC6hjZaLOHvmvH3Zy2eZcoVGjfNvPOds2LX3iWe0bFYjLjZ2Ew?=
 =?us-ascii?Q?lHSTKCkYxen2aibU258JarhWz7FIUA5s8j1nfPxS4VFjaa+/zY3hBkHhtBis?=
 =?us-ascii?Q?5MAF9mBkj7i4g8E4L/MX0dTBVMSlT7YkMTT0WYFP+6TNS/ak3KHvYvg1HqQU?=
 =?us-ascii?Q?CE+LOifHGvy5kM6DCKxD9Tuz6J35+ToZDQSmew98k/8gU9N8mUi7YzxcZ021?=
 =?us-ascii?Q?Pw9W183fHhYWfT3++I6+Bl99XGdFCLESOidA6iB7R+5nQc4FHGYtl1kzZz9V?=
 =?us-ascii?Q?J/mUm5FA90kNa39pKV0hdt/2kvqexhS7dazDNBFKWIl+IF44fJdutthsOtsl?=
 =?us-ascii?Q?vC+y62T+lE8TmYUA16+LyW9iTNBlFNAmYwGFjt6D9NPWJ+O8xdAyAYtAVDyE?=
 =?us-ascii?Q?FxYE2fsZd9lgSbo445aT9EjxeWhbHxcx3kzJxczms3hWOcCCnkeubnEKLuOa?=
 =?us-ascii?Q?yAczUHjqiwm2U8Bb2b/5VCJVMYgE2zqch9ZoRzg0tDQ8ngHBENgHgJDYKRBr?=
 =?us-ascii?Q?eJuoNRYkMK0HwtCBSfRFlNlXbM6DSopq6X82cmBOtisClBGqoA6Uq1MCLpn2?=
 =?us-ascii?Q?Cu74+NgWsm/FitZgzKS8zstP7ZeemfRmLysYFAtjHoqg9gGIpAy/a4zKvEOZ?=
 =?us-ascii?Q?IrwjCOTjihUWoTN3M9Vavnd+B8vXeuNwEW2oA7FlZC8gq3SBBB7nzdZevQ4P?=
 =?us-ascii?Q?RRrUbARGWrX6EDeSdoN3zvcuuG2aTenjLW3V+TGV5f8Mu2NSMbjKS08oL51q?=
 =?us-ascii?Q?Us09t7DNs/x4BlQsrt924TeRy/4m6MjovqIOwmGxEukz/LOAIW2ZgwEZS4jz?=
 =?us-ascii?Q?9/0RPWS8IQSSBEcsZ1QOUHGU6kLd9hmVkjV6ZwF8UA3yv8Tr21rq2KGhILE4?=
 =?us-ascii?Q?kUER6+XgkpfQjxGpQY2PrMZQxv8nL6GCvX8w50t11TvH1iI+74qD2xQtgf+h?=
 =?us-ascii?Q?hfbR8kTZjkOuE488JrR6UuwzJKvvMybOMcdxDT/KGSEyiZ62sxk8A0BHIGI/?=
 =?us-ascii?Q?pM4aHDWhdQ0YnR0DnIuOsGJOJzmhqa5gmZnW0U6T/+gAlurD1wLbsLWe1yk9?=
 =?us-ascii?Q?ZnRd1uXOOFEil15goYP4DHQnsV2WMx32xahsWQy+4oxFB20VfEZBRj+hzuAG?=
 =?us-ascii?Q?xemOOeS+HlIEVIxoVcgqWJAmrtMIpYFR1lvekrdiLlDTasm7A5D+f2tNDrzo?=
 =?us-ascii?Q?EHbsYgEvvwkVIPq71eRO+/3TbM4xGwPK8Rk00ESaQBRX4py/ar47j3gtR5ic?=
 =?us-ascii?Q?oflrkzWmZ4oYA+A5dhQyYcJjy1kfKpRsECiEGIOGv7dFId9nuFZJUguPMTGZ?=
 =?us-ascii?Q?RqCfcHQa7Jc/e7WHOvSXml9xXAMGkZXfWHXBeSP9Z8MUbUqxX335opJ15E0S?=
 =?us-ascii?Q?mP6icvmeG3h2b3NrJRX6pscN6a2gFu0dov2ZCTPZM+K0m2U3HbpBQcJwi9oA?=
 =?us-ascii?Q?i5Qk68UzvrcAbszXuP/YqNH4lZxrl2kcKW8+hn+DlnU+3SADfAN322nEc1Zl?=
 =?us-ascii?Q?nQhBt+MRfpaoyuHqW0/1eu34BauaHB5ZTmVH8wKiwANzk31XupKOI1688Gak?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8f1d23-6fa7-4583-9a5b-08dc7b6a365d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 20:52:08.9692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5N4B8x+bkio+et+DxiLpVwavjTStGu8nWv/4dg+j5duPshyb5WdmxvwYsDiojj/MfQ8UqaEtBHo0xQOo8I01PZlc1z7Ru3vbxjczyLIoPzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5240
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

On Thu, May 23, 2024 at 09:22:37PM +0200, Michal Wajdeczko wrote:
> VFs don't have access to the GMDID register and must obtain it
> value using GuC VF ABI KLV query. Add function for doing that.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 29 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 237486a80fb5..5b8771f831f7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -284,6 +284,35 @@ static int guc_action_query_single_klv64(struct xe_guc *guc, u32 key, u64 *value
>  	return 0;
>  }
>  
> +/**
> + * xe_gt_sriov_vf_gmdid - Query GMDID over MMIO.
> + * @gt: the &xe_gt
> + *
> + * This function is for VF use only.
> + *
> + * Return: value of GMDID KLV on success or 0 on failure.
> + */
> +u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
> +{
> +	const char *type = xe_gt_is_media_type(gt) ? "media" : "graphics";
> +	struct xe_guc *guc = &gt->uc.guc;
> +	u32 value;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, gt->sriov.vf.guc_version.major > 1 || gt->sriov.vf.guc_version.minor >= 2);
> +
> +	err = guc_action_query_single_klv32(guc, GUC_KLV_GLOBAL_CFG_GMD_ID_KEY, &value);
> +	if (unlikely(err)) {
> +		xe_gt_sriov_err(gt, "Failed to obtain %s GMDID (%pe)\n",
> +				type, ERR_PTR(err));
> +		return 0;
> +	}
> +
> +	xe_gt_sriov_dbg(gt, "%s GMDID = %#x\n", type, value);
> +	return value;
> +}
> +
>  static int vf_get_ggtt_info(struct xe_gt *gt)
>  {
>  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index be69c1025320..0391ed72a570 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -17,6 +17,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>  
> +u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>  u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
