Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A72C47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 23:01:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74997112144;
	Wed, 27 Mar 2024 23:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GKmbitSc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5812112144
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 23:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711580496; x=1743116496;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RL/WEgCUIX7LvkAFScodAMX2qmAeh/wZNjpMGLiG92c=;
 b=GKmbitSciRWSFNsSPH1WbLfyF1vfzTDnpoqzhIWbEfPOR64h1a/LSNIC
 3N1xeNy75VuaX3UBs6oXA2QlE6igGdyMFcyk7gOL84xqZt9Bb9wyo89uJ
 LPIzXg0i1uFK+XZXLxG+p4XAWykMFQhpINvZ7ZCqjSwD9QjSsDaP8lFKo
 z7jdPXXkZ8s63aNObKXwKQKSMs+8qgaNTtnGmUiBksJNUgfpYuqqClSas
 wmB2+2EycTOjhyn+rtjl+XSUoQW+Q19UII0bD68ZkWYyG9CVPtvDaGt+M
 fZYUMyWF5AXuwB+IZSbDHRbjPNMsn3lSRaO+GPQZyDj0vJLVzRBnoEemg w==;
X-CSE-ConnectionGUID: DfH0mgUUSrGWZ743zomHHQ==
X-CSE-MsgGUID: RTxB06fZQG+DaQCmeatLJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6541943"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6541943"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 16:01:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="16849819"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 16:01:35 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 16:01:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 16:01:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 16:01:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igOofnd5RGhCez7XUfMY3Z17KC8LBkR7wNii0hJBOOaCQZ5f7P7BKIAnBVc0vpUy3oqIXoxGT8W5/ph2C65XMxlFs45F6eRHcPAnbxTM+uurDi6F6zOMAxMs8XwhG4oClsWlItaG/9+NVOOY48xvxoddOprHb3htfrH3pyGJXpN+lXaQ+b8mpCpJo5LDQ4TUqPQqDAbv3b4sn4150bV+f6xAeVFCrqlX8rcnNXL9Bt6E7wpPKK8nZV91+sLrkjeJq8tWoyqoaShm4Rwa6Rj4WxMf93p0K5J6Tviqgh0Qj1LvXscByyCPB123dmD+j/dmLeF+o65S1TXyppyHKOcGUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cr1URQn0aZfnHvq3Qpi8USVv+U5SlVXYyms0WkJwGjc=;
 b=nusO1U31czgshqTKSDQOOMQUeCEIVBtBEB/TIAIPVeY3TUb28SYz8AEwfvGdh7hKT/4CRMDDKLIM7ScPv5LhkVjbin51pdvQrySTqB+vf0gmsl46Sb0Gk56xYe21AlLNMkriSkaehBjZGsdjv+nkAq7ymfwD2CU767VGvxFflG5YmPnkghEx9/2aNI4GQwtBXI02FgVBkh8JEF9v5nUmqbUM8R842Ks23JP515A1+Nayo3H/vG4Odf7mpy0s683PNQPxyVkunUuwpFbV9b9iBQpSVC34yWY+/dQlDBmV82aRBSeiCUcHY9LNo8gJopZWn42n6vlip5m4w6JyuY3kQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB8588.namprd11.prod.outlook.com (2603:10b6:a03:56c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 27 Mar
 2024 23:01:30 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Wed, 27 Mar 2024
 23:01:30 +0000
Date: Wed, 27 Mar 2024 16:01:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/vf: Add proper detection of the SR-IOV VF mode
Message-ID: <20240327230127.GE1332995@mdroper-desk1.amr.corp.intel.com>
References: <20240327182740.407-1-michal.wajdeczko@intel.com>
 <20240327182740.407-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240327182740.407-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:40::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: bc043ef9-b306-484e-429f-08dc4eb1d6d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zByTAUo7GRcqnAv4z2LL6oCH1eIqwHY0ypJ2rkh/jwiksJIka+d1drlthQ+3E+p3FR0f2/wQk+GheMag8Wek8fC81zrkoxcWiWULu8VHayvbhlKirJ3bKpVysEKc+7mJ9Go+2CYKyDFhzSDNMikUjceh6oacrCAC53hkBviciaV6qO9ALXglrzGJ7pmudDKcHGHmGF/Sz7ys8BtUbev2Ib1QamfsQw96kbgTJMvd/TjN+LM3yqCTiHf9qTfT3FkfrmeOvWIOKkmEEf6MaQVFsXidvCL1aX7YyhFcz+GJU/jRIHW610RzeMfDW/2aLkKUVbS7o0IPmxzx8uQFamNWlaGusRattCRWPRBDKH2DGJL80xt1IxNXejow2xW5yg5DWPxW2zO7O8b5mSUXJnY1VcuJDYtNFhl9/O47ElM6Xlh1v0ssUG1cUikkPSSiL9Roy0yk4aKV49bx4Jd5tlyFQtifx5j8XyFPFZAdR6qSDIk6d3ZY0ST6X0wkzqVWhqloTQSRt8tiKZMPiMKF8kfcMxj5UU5FsADpicxRqReKDCaTnpu1i3R41+OVNKuYEYoSQrC61mqbqK/NEoEbT2NqXUUCa6En9dXgFD2h8sIUMhflucovGojNED1OdCmab+NR4f0B3lrpm5egspP8ACplLAsb+fuCZwl9ftMmeYRFq3M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ed6Z7sjrPYAxsCfbOjhG1xyPFeR5z2K2ag0exaIhP6KqHPzwyTkgTnwT5QHr?=
 =?us-ascii?Q?idOCKOrMhb1ylSIhKB+lrAnlhFP0HP9s21VyHuq+u6m9lh0QCTrUkjvgEcXD?=
 =?us-ascii?Q?4i3PgmGuFV7U7Sarz+VKoLdm6Guw+HynUp9h0LLgHAFHHaDbuiuN7Pa9/ukq?=
 =?us-ascii?Q?Poqhu2/NNTMNphdkQw3hSkvOWypLfwF32gXnhUq36NNeSQiyv5l06efsk5Ap?=
 =?us-ascii?Q?moo4iRp4YCUtNvKrTNO74yuzFExzgsMVOVW/DCyKeEO0S5uXFda9OJlrhBcH?=
 =?us-ascii?Q?X/ILxT1j5xk5Ee3NSt6s38DzFJgf9AO+CoYMQVOv8EJzsLjtLR9uy6fLrrDI?=
 =?us-ascii?Q?uLvIgPKSqMAENIfT/9GtORPCsJ/oKeZvFGx5mO1t3dq+b+wN5XK4sEaZA8mn?=
 =?us-ascii?Q?9Vqn9ls/d5IXWG7HaarP7di4R8R1J6WtMqch1DPv5Te8jdek5iaeLiI8Y/7f?=
 =?us-ascii?Q?acbWN00oJIpIGl/zdFPzFk1n3/dXZz5+eHH6eGbyqOcJjWHIH4Vhvkr6llan?=
 =?us-ascii?Q?LLQsWfAkNn7hT4FQS5QOYMeEe6vWuKnqElOkeYgWPaYlZx5LJld8JNvsntnf?=
 =?us-ascii?Q?+cbDb28fvmhOMeRaUppugnsLYo8AtbxUqLIz2O/ap3LYNMG/KQuWUpl1yv2N?=
 =?us-ascii?Q?cDvYEf+JiquNnDeZSYXQTDPDzuEoZlrussT89wrW0l0LEuwjOBsIN7lOdMDz?=
 =?us-ascii?Q?avUIR3GSD2vKZ5GKi4eqNIEBrV0A/7QVLO+nMsRlu8sJYIEHKsvkogI13BxH?=
 =?us-ascii?Q?k9oAkLc2gtOBNWJ+/FD+UxlTUohGl2NAHKAoM3DekEPhJjl6TiZ5QJF7NsOs?=
 =?us-ascii?Q?uENWwhc1kWEVRfygwfMm+ClPbshAllQy/eoLfG4QUhjfuqdHK0NfBjGcJIhR?=
 =?us-ascii?Q?AuslyaPbhYIFqy5CG2CSUzmFz91b0vixeXJLVCkV1g52hcJiLY2zXykbsUOx?=
 =?us-ascii?Q?oap6ExUOHR2apAEdILxbxKBQ5kn5bmXTWzTU9THoCGoeRah89AauUX80+jDQ?=
 =?us-ascii?Q?PEpZysuCCpEdJLZiyceazaOoawN0tNKt+oiF3EeBT5vgBfd+B/DPOq6uc39l?=
 =?us-ascii?Q?A4DDhFtYidtgV5w/Up4GvbNsk3i0onldmrlw0KMO2ludXgvqwG4rxXPdheCk?=
 =?us-ascii?Q?zeN4pLodSEg5L9kCo5879lmHWU2RhrihtzmoEWQpG2I9YSo6hD5hjtr6fc5+?=
 =?us-ascii?Q?ZinaFK4IuSm19WM6VaTH6RqSxdilBzOH3NXtSrwUPJ2TM1SFehG4L/ufR+QS?=
 =?us-ascii?Q?ywgbapH4rkWgLnf+dRF3ptmAAvg1v7P0LqDky/xWjmcM+TJvxSSoYRSc20/J?=
 =?us-ascii?Q?KmbLKJ9z0s/xjoBkQQi2BK5Pmd2IvmwJg06o35XuHm18DSAkOaV3PrtH4YhF?=
 =?us-ascii?Q?Oym9kvhG1dEg0WRbygveflYgmnpucAr0f7RqyGTSt9Rb3R0qo34/MbP55tbu?=
 =?us-ascii?Q?kcJ6+XUHIjVP/Ehj44fIQtw0fWEfVelECghKuGoU0x6Lpsbreatw8U3Zr9Xf?=
 =?us-ascii?Q?ito3zJF5dc1/x7bMmE7NsBnqRDBflyuJGXrNPA3oxPn2RxurDJxS1HP332qF?=
 =?us-ascii?Q?UDLSHdZd83NwO6TqtkskWBxyqc+qzm6myjiWR+C+lr+nyFEqKQqYDSv10vMt?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc043ef9-b306-484e-429f-08dc4eb1d6d7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 23:01:30.1305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYOPUdsq6syYVdEXl3WEVpwpROb4hjJvowiBolzA/KRsWm4pzZCZpQi0RuyCZiVtLSVW0lIPZtjZdx2Z/lyWZXbj8f9zLZmBAyQhIw4uV30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8588
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

On Wed, Mar 27, 2024 at 07:27:40PM +0100, Michal Wajdeczko wrote:
> SR-IOV VF mode detection is based on testing VF capability bit on
> the register that is accessible from both the PF and enabled VFs.
> 
> Bspec: 49904, 53227
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_sriov_regs.h |  3 +++
>  drivers/gpu/drm/xe/xe_sriov.c           | 17 +++++++++++++++--
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_sriov_regs.h b/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
> index 58a4e0fad1e1..617ddb84b7fa 100644
> --- a/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_sriov_regs.h
> @@ -14,4 +14,7 @@
>  #define   LMEM_EN			REG_BIT(31)
>  #define   LMTT_DIR_PTR			REG_GENMASK(30, 0) /* in multiples of 64KB */
>  
> +#define VF_CAP_REG			XE_REG(0x1901f8, XE_REG_OPTION_VF)
> +#define   VF_CAP			REG_BIT(0)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index 2bcef998c8a9..3e103edf7174 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -5,7 +5,11 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_sriov_regs.h"
> +
>  #include "xe_assert.h"
> +#include "xe_device.h"
> +#include "xe_mmio.h"
>  #include "xe_sriov.h"
>  
>  /**
> @@ -28,6 +32,13 @@ const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode)
>  	}
>  }
>  
> +static bool test_is_vf(struct xe_device *xe)
> +{
> +	u32 value = xe_mmio_read32(xe_root_mmio_gt(xe), VF_CAP_REG);
> +
> +	return value & VF_CAP;
> +}
> +
>  /**
>   * xe_sriov_probe_early - Probe a SR-IOV mode.
>   * @xe: the &xe_device to probe mode on
> @@ -44,8 +55,10 @@ void xe_sriov_probe_early(struct xe_device *xe)
>  	enum xe_sriov_mode mode = XE_SRIOV_MODE_NONE;
>  	bool has_sriov = xe->info.has_sriov;
>  
> -	/* TODO: replace with proper mode detection */
> -	xe_assert(xe, !has_sriov);
> +	if (has_sriov) {
> +		if (test_is_vf(xe))

Seems like we could && these conditions together and avoid the nested
if's.  But up to you; either way,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +			mode = XE_SRIOV_MODE_VF;
> +	}
>  
>  	xe_assert(xe, !xe->sriov.__mode);
>  	xe->sriov.__mode = mode;
> -- 
> 2.43.0
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
