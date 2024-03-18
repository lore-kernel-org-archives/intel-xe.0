Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F49C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 19:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0948510E5A1;
	Mon, 18 Mar 2024 19:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bJn4PSh7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3CB10F3E0
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 19:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710791885; x=1742327885;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ur2NDhxLh97uxMDjfFG43/d+gSJuqHcM2linoTqLRXg=;
 b=bJn4PSh7vWtZDN4jjMsgHP0HzF8UvxJShn//q73BeGTEURzPtKq6C1yn
 U3XGs4VXbrjNmb4e7A2BXF1O7+yh3e6kH8rsQCDi19ipqi/K6bsV4Z0hl
 VQt1npv0j9fwOMAuPAxIgbQB9ywz+jSsZi2nq7CBwSaYBLiIMZr31LoQY
 bVOrV3N3oU7W5WrUKeEHxOmPNHEX71tBA0cSOXb+72wg8p5xj5o3ff9CT
 0EirQ6TAXP4zQP6tgK8iLgVluJ9kDkU1597ovGYJBmXQazKdtkB8f843U
 8Vrrvdo76BuUZK+EFT8aXnkM0AwQ6aGz+qlzGUnmMCrT6YUy7uvc9WI82 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5508048"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5508048"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 12:58:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="44634489"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 12:58:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 12:58:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 12:58:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 12:58:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 12:58:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cP0RaO+5ojpLWXKpvdDxLj5FxTEp/unfSCOK5hgR9HOqKnXveS09Qa36q7r1sX3XAOEuJbwGfhMHOQTGZD+RrOUh84jxoi46rUCnP8wrT1iRoaueUFsWWJ/rYtiCKAyEOqPFAlwqeOGf3nGSq+c5OZwKdbPXrv1zSNN5at7zJhQR7RcA3z+J+IuVlO3USJvw8Jezbt1Ih5czAfFojkOOvJ0+5cOwHjUbpcmsl31DVbxO8CHM79PZ+9sEAKASSVJhOHY1awdhhiB66b6f2dU8eJl/GtWnkrVn8OmnIvznit6Ag5i3TqEIg/mYdvGddxjjnFXvSYinBr3velwWg+0JTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54NmqC7epiKS4r30FwQPyCnyOYloO6ye4GdBhy6WoTI=;
 b=RUnMLnKy9e1SoUZtNQC4/ID7vfxOxVPhIgEYOVyojEqg3ZxigJBZopQkOUK8uwQPyYibQvy1N0zz5QjtGQyh9A0DgFfRskLX8wa3DAzk/bXsjqPVJ8X+KsWIavF0Zr3gHPJ68X66niUoUUB9z6PNRJARr6nPLjrw5Ex5BNhFy2shkQmttoRQkmqywNb5jrNcgA0koRnKpEmzrxZhkrVMKgJAb5LxLKMM4xrWYEsvMWxpucN7U7GziLbm1Q40Ci5/o2wdQhHdZZPv6WUdFtvzA42rqHDKM2mYvY+X+HqYF8oaG0T9m50yvyKzkQ2tMFwa9N5jTlloyeQ1GeaK1J/GrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6067.namprd11.prod.outlook.com (2603:10b6:8:63::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Mon, 18 Mar
 2024 19:58:01 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 19:58:01 +0000
Date: Mon, 18 Mar 2024 12:57:58 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xelpg: Add Wa_14020495402
Message-ID: <20240318195758.GK2837363@mdroper-desk1.amr.corp.intel.com>
References: <20240318193706.389803-1-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240318193706.389803-1-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: SJ0PR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:a03:338::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6067:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LSqfCafm3nk376oPzPnOceRzN3As0eAr31V6SJ9b0pCsSNbF1l+RjOBaDa15WzknIJUpzyecIBKtj42C6BD5IW3cYej0GPzt3f5V5aCMCOoViN0eYaGCwNbLyembIWihaph66F/hY/IgVoyCD95XtNxAPVEw66xzFz5cmaVJ95ctSX+deoqODZt2YXHWAsAxHOTQ6j0vhZTjeTv6clBifqHpt8Iw88fDLQfueJLeE/3usH9vO1MaSOJ7SLSR4+JNOCKBPD1d64NzcEYsBvyncaNMHowP96nCl1kgdxBLX4EZMTOqeDiNFMruvSHO6X61i61Xn0izxkCHcUH1JQBq5LlnaDqveY5+jgly9bqaVCnuBc5YbdPZ0qJjFLxyV0VhOG7FnHgICWCjW8JTFfWjtsrRkE6BQFnqbwcxpmRsTgUDiGvl8txnMNm/XLX98OO7lCNAKI5tyIqqgNxoxbluf2ylO6aoPq1hufUIzetjv9qoyauSEUQe/B7zt/Xz/NrInTJ7xKmIHbZ+bQhg4yH1WeLVlidrDHEg4AvHFqv3oQWy8W6FoBX2r1KfJQNH8n3JQyLybuYBRIEr6fF09rZXmiMYuZI9ymC+AI9kjlcASOKrpze5RWRQblXdKoQnkRYztCsjihkLEOhQQ7pPgI7K8Ai6U20W9hOFifgq96zv9B4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s6qMLM3rKYXrzPtXSyB9/USEA4cqzeTC0FXULlF+XuiOO5PZkxbYrkFk2Y+x?=
 =?us-ascii?Q?KEan66j1u9ylng3W+yNsEY6o782GVLsD3paWUIzIOMGy+2sX8tc5N3iQIt19?=
 =?us-ascii?Q?ibbdYSisv9jLW06TxEChD/1LA9tZmICrJBtr82F9ggUgyDq3UMg7WuAve65W?=
 =?us-ascii?Q?WRej6DVTdgFvRSQ7n4CgYf4KPD5AlKJdfqCHmWrzxsVh26S3jXhqymZdOM93?=
 =?us-ascii?Q?lLvPcEPi5MamhE1Y6738MA0fty4SWsbqPovd7DouDYdooQe2dXZ2zlj/5mLT?=
 =?us-ascii?Q?80xD3bXpzS/K9vYd3QtcVO529tBW8zDf9CFGzjSCn5ApMrA/u2XusH31i77P?=
 =?us-ascii?Q?vnbEaAuJciiPnhOVTL1h0V/q4j7lCVSV708eQLwxmz25cmqTExPi9YcQEpTQ?=
 =?us-ascii?Q?rlIRdz8J/xnR7SgQidTrJlsAso1yermnSKxg0RvlzUNbvo68c87sh8PwoiY7?=
 =?us-ascii?Q?/gUA9lXXtipd/q7+RPrcBEYxs0yjT6lgDKT3uxlCBx9KRuv7Qkf1hXfCAsVH?=
 =?us-ascii?Q?FL0ZW7epJtGuxoV2Yi9vsUkjB8yeoox2rMT/k7Xfnk1BNW6ImtZ30PVBgVWq?=
 =?us-ascii?Q?DIQck+xEEaizNOfD9Ez/IRsxoZfEtUf35M1C8wD19w1MmOkToRco8TNkmbq4?=
 =?us-ascii?Q?OjEW9di/vFZp73Yq2vEFUn2EbGdmHRLkGZlezj5T5Wfv93IMSx61/oyAM3FI?=
 =?us-ascii?Q?CKs+/ot2xwk1WOkrX6powA8MtMMZcuCaDquDpJQjYbBb/dFAQxByvXT5OKH9?=
 =?us-ascii?Q?GRTn/SBzysG5xy4L8Y0FWeAzU2xLjnf8+M7zIgw3zZygD7Mll7zCGM4Yh5uS?=
 =?us-ascii?Q?15aVmicPSHsJVunCZ3kpvOF6IDJcTDxQ+cYGhyhfiZbirUdNUG6MkZecMZPD?=
 =?us-ascii?Q?zFaVybC87T9uGhGrl3c6UXmSSlMLepbrPG4Qa9WrhSJJ4BuwpDLj/8R7p2JV?=
 =?us-ascii?Q?B0ioysTgHuBO/GSzRC5j8dph/Ts5hj69vSbj707vgS/C31Rr+9O1EH6Wuqkb?=
 =?us-ascii?Q?wxz0gE+/Xh7+3lrhFZ5w0rDKf4zxA/lD2xSRcaBsCmzS6N40IbTJNAW/HPA9?=
 =?us-ascii?Q?f7z4SO8bqXn+7rnjVq+2yUezTiICNviMzzEVOvhamNlATbvZYLCcRX4jM9pC?=
 =?us-ascii?Q?K8z0V0DcGF3CQTX4hJl/K191ECgi+RCvwnV7Uk4raXm7sC0Eq6tzpv/D5ES5?=
 =?us-ascii?Q?OMSjywPS/NyRNz2ewEmSJDcmU+Z6wk8io4ZGT/Kn8f4BrYYBjYhYIZRRBxC7?=
 =?us-ascii?Q?OUfJWbWXBmQT2x+txyhnUKmr1KUHBFbNrjZoGlYblNm/jRV6n0LW8TVCKSKp?=
 =?us-ascii?Q?QelDxdjvvVhMUUKU04n1pAbB8HzMIPTsqXT5ppkp4O5gCqyv6fgz/BaaupcN?=
 =?us-ascii?Q?Z2hkx1rusXqpRnvBSGAdUhzhqg6hYEO39lRZy4lsj7cpikq/c/F2JI+8UxhN?=
 =?us-ascii?Q?tHEKQ4mLeGXXah8GX4S+G2PT6kgq9ywL8Xhue/JxR9d1YtKW1fdqfHXL6fD4?=
 =?us-ascii?Q?wnBDw9URP2RLGgomqAoegnQEcyj3z4DWMfWTp4j4DFMP77r4hOMYcJOicYO+?=
 =?us-ascii?Q?wvL/eJzmN6pVP5oq75nnPpcAqDtwO+TEVUhjvJgf92OyXDm17XiAV5Zj/lwg?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2f0ea4-965e-46e6-cbc7-08dc4785b71e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 19:58:00.9432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98qiBEtHb8xb6OR8KjcuKF7RY87BoV/7VwfsVlInkTze9tQUsDAcYCPcIUGR7b+4CUDmfyBMIduswkIeyGFB+sxO4+qqIn0+cNVck3W9oeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6067
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

On Mon, Mar 18, 2024 at 12:37:06PM -0700, Radhakrishna Sripada wrote:
> Disable clockgating for TDL SVHS fub.
> 
> Bspec: 46045
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 15ac2d284d48..acf7bbe8cc8d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -364,6 +364,7 @@
>  #define   DISABLE_EARLY_READ			REG_BIT(14)
>  #define   ENABLE_LARGE_GRF_MODE			REG_BIT(12)
>  #define   PUSH_CONST_DEREF_HOLD_DIS		REG_BIT(8)
> +#define   DISABLE_TDL_SVHS_GATING		REG_BIT(1)
>  #define   DISABLE_DOP_GATING			REG_BIT(0)
>  
>  #define RT_CTRL					XE_REG_MCR(0xe530)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 2460c570e628..6ab06f029aa9 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -396,6 +396,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(XEHP_HDC_CHICKEN0, DIS_ATOMIC_CHAINING_TYPED_WRITES,
>  			     XE_RTP_NOCHECK))
>  	},
> +	{ XE_RTP_NAME("14020495402"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271),

While this workaround is only finalized for 12.70 and 12.71 right now,
it looks like it's trending to be included for 12.74 as well.  You might
want to ping the hardware team to confirm whether this should be applied
to Xe_LPG+ as well.

Assuming we get confirmation on 12.74,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_TDL_SVHS_GATING))
> +	},
>  
>  	/* Xe2_LPG */
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
