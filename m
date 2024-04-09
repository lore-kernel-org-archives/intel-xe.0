Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3B6CD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 17:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1963D10E923;
	Tue,  9 Apr 2024 17:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZkWP4P6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAE410E2FC
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 17:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712684914; x=1744220914;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4IrLVwWknuCPGfbGPSmfSKKaAmyh4fqC4h6nyOIN1J4=;
 b=OZkWP4P6KAyEisn1ql7liR9FjkOTtVIHn3Vg6Us8BXIl+qQaftR4GyHO
 /GTkJTnBi89fhgExuCkShZ6+GYNEy2lspePb1wUeStwHXyYI9VjQdK9pH
 AjONA/qQlH+UOSasxZa5Bz2GSVdiA1rPq8Y6T0RS8mdrSdahIK9aBdhlG
 yVbvfNwgILqxOKD8Q47k08fwhnGwnRGvr7href30b6pdXJECs0qROp9Ag
 DwCJ51Q1HsgrZwlcJYjucUsHT9CA2U90WqEZtSre7XC93FRMiqyawZBu+
 wkSeYJqFv+JjDBpJsyjtp1PqHgs9zVsyFLEfrrZjALywvCWJiKbbs+pFl Q==;
X-CSE-ConnectionGUID: 8kU1XhBxQNmK2wE57gQ+8w==
X-CSE-MsgGUID: 19XHdtriSLi3b97i7iWvRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18580328"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18580328"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 10:48:34 -0700
X-CSE-ConnectionGUID: adjSXyyMTMWlnkJfB+oANQ==
X-CSE-MsgGUID: d2WJAA9iQWOdJfiKPtVqeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="57748809"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 10:48:34 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 10:48:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 10:48:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 10:48:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVNvJkXF8xWPwJ5nwXZXZ9pJ9p9fFhh/HhP1vPvn7XzvZHCO2hTKoAZV3Lny8Oy1LSn3SdlZE98gaFvcpWVqWlk2/NwhoxwhpVZzs6rCIMaytmZy171a8Pptbetv5AYDO8o0CaSohJyjT4QpZNjhFoHM7bCW9Cg8ce/IYMHl2HzdqzSs6+9YYCWT2Z3Oe/8u1OLCHd1AO6v8w5nC72+JEeyDaR0glDa56WpSVK3CAAGNV5z82at9t2ao418c+mrQY/z34AhLrCRQHGmbfdiS2iEADhrRQbiQogiHOKO4/IHGPBIdRLQj6GigW8KNd+Uypvul8u/ZscUnZlRaW7U2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Id+MQ8dPCNpybwMUhH7wqhwO9ufxAvL6viIQndojKBw=;
 b=OVMQsq+xj4nTiSnh26lt/oxu+pYxOqTq3h7+NHxMoXiMiO3kVnVxtCRWI7Uj/XJErXuY9S548DnpTpfi7ATVhlzl8QzY+F0vx+QlYxuJ1EvUxG/gc7M3mJY4VYd11T95OhMPoCR+o2bVYUsdTxYxkOpGNu11zaXlAHg65+ddpGQTTfLR/c6OiVVjbMc9oLHBPYcM1vfKiMxxLrga/I1C3ApixyoDlHhV/U/JxQoJKXPnvVaEn+xTISrs+Aw+RDH2Znj/nCjO7SvdAdWZzYfIVBqblaBwEAD8vNwSPKCSrVZ0hHxQhbxqJvWQ4o2po51P/rt9FT01OwCBJH5lZ8w6fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4847.namprd11.prod.outlook.com (2603:10b6:a03:2d9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 9 Apr
 2024 17:48:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 17:48:31 +0000
Date: Tue, 9 Apr 2024 13:48:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe: Add SR-IOV info attribute to debugfs
Message-ID: <ZhV_a3_WMbT_oNT4@intel.com>
References: <20240404154431.583-1-michal.wajdeczko@intel.com>
 <20240404154431.583-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240404154431.583-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR16CA0033.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::46) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4847:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vz4aA+xKr1meXvVmpET38hQJv9moVl8/wDTgwnOqPvnufzv2UBD1YhGAjAKm/fhZwzJJpbt2wxfzMutD2k1Sheku6g9LoN9n6Nfek3qTvIY42PkawsV1BQ3ncbJyGjJ2309ev8gNq6MF0KcuFa7C0yg1pC25F12UtwrTtJ3hUG4MF3gBoZK6fBWtlUQ79bBkm34rPc1xB3qmDYQeq5Z6uefJCRgChYG6xIuJCQcgHAw2z75WtUsqhV/auWg45+W0+h0D2KBgjFRm8CRlEVwT4xCSupwk8puFyvhasHHC3ZEAMmrRelGLMkYV3i5pS7qdsLVdoP9Z8gluXQBdosKLk+n5qblxIRX4xWJoEUlDJFOwHDVorvn10eBioirYOAE+rpzdudTrvxx0QgmpBtwAXW3IrOn0AZ412eunbKxEiOMyCmWD8MT7+TUrEGS5QBmlx/HwqHk01g9ETNPOXr2vOR1ZKbYB8fxl3HbItQjM6Hdo42nAPnMA/thehXH/rzUo6vXpf3vTxF2M1pFt4yLtZQSOkrbWH5JhCUtFlrmj+z6xYl2mNRf0Znb4TD809eqWCbMAGsndn9+TrHPX8rud7saKgEvFGCQ2umJNvqNtTlNXtICOJKjdTsYNCgvu85BBPkO5mDGB+IPTH+8bMK8B0qBVZHwNtwQhTu71JVXLuBM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YMTnthQMGX5NearaVOQvMTrdqj7BhsYW2avdjOId/AAzLdsmUJwTJqfJGtDf?=
 =?us-ascii?Q?9ALdIF3NCOTUp2QahO1KkQQZCKR/+S0dgVZI7D8BgR8K/HgCPxA7RNgMzwh2?=
 =?us-ascii?Q?VfTLgtu+RzMGwGKjjkdB75nH0SpfTxtzXlKea8mA9ZMvBMfr9vuuA5HrKnK8?=
 =?us-ascii?Q?8enina++98kr/4h8jsCSyHQbcvxuIq+JYKbk3HPW/jneYv6J/yYXSRYdfBQu?=
 =?us-ascii?Q?ZT0GZGt0/v0/DOO/U+zJIhslJcFZ7CQyMw/Gwfjo0nM8x2cKGJW/mFp9/jGb?=
 =?us-ascii?Q?4iNX8eKUqpu1XEuKjfyP6xIHV2LoeWidkJ06LrK5iYbOn8YQIN5qa9dZWwXX?=
 =?us-ascii?Q?48n+Pjpx6TGDbd8Vlxx5TT3tuZVJR1BSqgdvduCZaC8vx5NroEZ3crzr3FfJ?=
 =?us-ascii?Q?NjzztBARH7WmC5DVqpR16YmYZKevs/+XnOiduSbVFmuZ3B8TXANqfvgpl6Oi?=
 =?us-ascii?Q?m2X33lxv5vwE9hec2qsLtKfTFW45z2B8kPSS2qkWz7OZ0CFrsp5WUANv//ZK?=
 =?us-ascii?Q?JAVxlFln7nE86Mp2STbg6CT8kF/J3LrZbZusAhb+QvlyI85VX3J6pfF4ie+v?=
 =?us-ascii?Q?IxnWnN83fU1ksQBlRNuN6UIBm8PAURzb9XiA7ZJvrG4eQposZ1xgh/k9PQse?=
 =?us-ascii?Q?P/YVTGi1bTGEBss6XsKqyG8SBxSA81Syiid4mD1NANWINsxsce7vki98ARZm?=
 =?us-ascii?Q?gJW7ITO9zdgI3H8i8+yRgOlbysyqpmLG/Pj+tzrjD1zkYebYjwttTQiCwuhB?=
 =?us-ascii?Q?ACy/h90mfYHVUliZR0g92VlqQ7ZhdOWSE1IW5YG7kG4/xv008za5DA8QqXFY?=
 =?us-ascii?Q?SZwtT3UBPOrmcnYfDJ+sLqvZ7P+PEKQ8AfKrT5ZMYrbfwjBrw1ZE2qZ3zCFA?=
 =?us-ascii?Q?Q6VRHSAPKvCzI3BeKX/it4NmIKQFdih2/9dEM8AWLOrSN29HdvYSdp6IQPkf?=
 =?us-ascii?Q?iGj6YNt3xAkpmud7pdKOJo7Y9ky28YHbOfjm7JeCdYKmD/a5vpJTCGbRPwqD?=
 =?us-ascii?Q?tKvSI+DqoJsqBbNHpZ0MGfoEFISNP0flVpPL+VQvE0kaOommy8LnMe+2Lv3C?=
 =?us-ascii?Q?shk76ZgMJdkpzJ/nQPqhfn+pM+ZKv8NO/nYJ3Df1OLxh3W/PEnf4PFL6O9hG?=
 =?us-ascii?Q?h8UpUNccBIrh+JMc+iPuGIyh6iRKr0bSZcjvd8STY2N3zbMjgcpJ0s18CENU?=
 =?us-ascii?Q?dD1ZNLvbv7wOC9XsoLZm6mf60l6bJj7BCxKWOW/EGr20vKU/OuDNrLNQB97f?=
 =?us-ascii?Q?EzRs7j/WjqEatvDI+yMLTsqzzB255gMeYrwGPaMdBlzJcuIM35pm/FDFb5Z0?=
 =?us-ascii?Q?f/zR8SFg29e6y5fhL1Q4OPWMkiCQ1owQtVZAFiX38+12UNRK/3BJLeRujULt?=
 =?us-ascii?Q?fJwkI03PRmkAoojt+5+RZB2l5k2FMhjb3o6YOQ+94WSbjsDWlNH3ma4Va0zY?=
 =?us-ascii?Q?oYPCYTC/Dx+Py///T7psaBF6RqB2wnJw6IlE780OA7s6+ZFDjRDcqJZfAWmo?=
 =?us-ascii?Q?GO9N/jgu9tkfXC/gvWokTTQuWMY/bffZyuY0gBAVX0/DpNVC41o5C25+fx4C?=
 =?us-ascii?Q?Dltz8qV5rIWbrLCtkjyZ65fev9ULQFXBccdJP/RP5O3XZqAwYxMBgimc2/wp?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0072120a-c715-4375-bef2-08dc58bd4521
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 17:48:31.3719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XgGWUh6mu/GhzTF/cHerovltpGymXkziMoVx2sX1j4Udss4peNXue//Ny1Afy+pdLwUBDlwGMz9VIA8rBXJVyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
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

On Thu, Apr 04, 2024 at 05:44:31PM +0200, Michal Wajdeczko wrote:
> As SR-IOV support varies between platforms and the driver can run
> in different SR-IOV modes, add debugfs file with these details.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_sriov.c   | 14 ++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov.h   |  3 +++
>  3 files changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 8abdf3c17e1d..13e13f22ccff 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -13,6 +13,7 @@
>  #include "xe_device.h"
>  #include "xe_gt_debugfs.h"
>  #include "xe_pm.h"
> +#include "xe_sriov.h"
>  #include "xe_step.h"
>  
>  #ifdef CONFIG_DRM_XE_DEBUG
> @@ -70,8 +71,18 @@ static int info(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static int sriov_info(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe = node_to_xe(m->private);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	xe_sriov_print_info(xe, &p);
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] = {
>  	{"info", info, 0},
> +	{ .name = "sriov_info", .show = sriov_info, },
>  };
>  
>  static int forcewake_open(struct inode *inode, struct file *file)
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index 94fa98d8206e..d324f131e3da 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -101,3 +101,17 @@ int xe_sriov_init(struct xe_device *xe)
>  
>  	return drmm_add_action_or_reset(&xe->drm, fini_sriov, xe);
>  }
> +
> +/**
> + * xe_sriov_print_info - Print basic SR-IOV information.
> + * @xe: the &xe_device to print info from
> + * @p: the &drm_printer
> + *
> + * Print SR-IOV related information into provided DRM printer.
> + */
> +void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p)
> +{
> +	drm_printf(p, "supported: %s\n", str_yes_no(xe_device_has_sriov(xe)));
> +	drm_printf(p, "enabled: %s\n", str_yes_no(IS_SRIOV(xe)));
> +	drm_printf(p, "mode: %s\n", xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 9e3f58874e98..f9dec84d77e3 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -10,9 +10,12 @@
>  #include "xe_device_types.h"
>  #include "xe_sriov_types.h"
>  
> +struct drm_printer;
> +
>  const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode);
>  
>  void xe_sriov_probe_early(struct xe_device *xe);
> +void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
>  int xe_sriov_init(struct xe_device *xe);
>  
>  static inline enum xe_sriov_mode xe_device_sriov_mode(struct xe_device *xe)
> -- 
> 2.43.0
> 
