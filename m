Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414B7C25B74
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 15:45:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0223010E24C;
	Mon, 13 May 2024 15:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zyrm4o5Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E2910E05D
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 15:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715615111; x=1747151111;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RhF5VOJy/5XSIsQQB7akk71LtgJPdMI/cVY6VbfymFE=;
 b=Zyrm4o5Q0cLFeSiBtOttI+bcNV3Yb8v3X8gbsnu97XHIHJ/xc7TMjTCB
 C6St0wCaPKrFFeX6K+X4zzQ6BJwfSw6ZNfnC3ZGVnOcVGWpGRdRR7vR/i
 LQ48HzIT5OkmfD9n411j8tKNh7HijTcuV3PyD3Okgf1QeapoetC99U12l
 CKLb+ZzjmYWwxVg6KL0uujPm8La5B+Adsrqz0k6+W6J1ZXBWQfbgfh7uc
 oBSfDfePjzwYVZpgNCE/VjLndxy0ctswfB6UCz3m4voLD0A8O/2MIWGeM
 ui67ulZDC+cR2MxXu3cijYgLrtpv+jheXDtV6Lg1DQkYaFwcCN/X4IZHz Q==;
X-CSE-ConnectionGUID: IBXVzmFLTY+wiTp9ziFWBQ==
X-CSE-MsgGUID: sAjBlfdhRcW7uYdAgq83xA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="34069851"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="34069851"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 08:45:11 -0700
X-CSE-ConnectionGUID: tqu9RDZeRyaBK/QPW67bvA==
X-CSE-MsgGUID: av4n4c/+Qx+utK1LVdfyXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30493789"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 08:45:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 08:45:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 08:45:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 08:45:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 08:45:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkvbXMFlBFLYPn1PWiejid8qj7ZaO25iaLP1bQ4j1CK2AJypX6pNlOS4ZZHCwJaufM2K8IblM1RZULxNZOQ+wpZrAaG5LyfuUwt4FSqAxtJUZgcrH/QLIc9adloB9FGLlko3DJsu+tdV/msQvLkdmX5VGK9arI/Xu7mDc1MXVZqbOPHltf5TaiFnIcEo1m9GHmREtGuT6gGzzLcZeK012paBnXZo2T2URxcPxjrwyfoxBgJFAJSk1fPD1pfMFuaQ0i4n53gBrUC/yuHqABSJrmmqYMalZT3gQdzrpzeg3xi8UVg/rvzFg0du4RjojgaxyZsKkcXDCFbn6HZniacwDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pNuRhuA5Ysyk2ht3/4joU6+yYg8vgoSZCPvBH68uTE=;
 b=mtg//i3/jb4rowgv2yNzhZATNDxmSRpL2GaWiDxd9ycF6FhGWeWV8XVBULJXVCxYKqYWaazvkU4Oxnz1CcedWhW4le/n4noLowTSLmcIbkeKJezK8DoEZeTe0V/Iw4l6Ga0ONE+AK3tJ4rrhui4bhM+XJlshSB94N/u/Szc9SXJ11aZxQ3zNhPEDIWAqr8Hq6w6zKDG8EmPZyVu/XN32psVjPAeq+dJnujNpS78/4hcohbaffJt7L+qK8nfX5xns1rZ5LhHogB4e1b20aiikLK4cG08i7gfcqu804bzxbUJmUJINWiTICAT8SvxAuNzG/6D3FVpU2oy7hDaRfXy1Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 15:45:08 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 15:45:08 +0000
Date: Mon, 13 May 2024 11:45:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/xe: Fix xe_reg_sr.h
Message-ID: <ZkI1gHQNUktkLmz1@intel.com>
References: <20240513084218.2084-1-michal.wajdeczko@intel.com>
 <20240513084218.2084-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240513084218.2084-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0199.namprd04.prod.outlook.com
 (2603:10b6:303:86::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 034f207a-4618-40c0-aaa9-08dc7363aad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CRI40nEROF44eF2rgpnVv0rbAPQQgmbqoUUdg893kpWWL849hHjIQEh4c6J/?=
 =?us-ascii?Q?mkYcJqE0UwEHcbEWbtrJfZw3A+buMqmVCJra6ZFvSd/22R90q0StQObha9Pt?=
 =?us-ascii?Q?QM7ht3joQ09o+VQQ6hoBN6Mk+SgmJZsyPko9aAordrAszOfBej0lo0mjwKK/?=
 =?us-ascii?Q?r/RVajssRHz/G9Jl541AtUMoyK+PSEvM8jnd1mx+FYLqTTCZI/Ix5/oGfhlb?=
 =?us-ascii?Q?Y04V8GefL9EnNMBdL2Oyi3cq9MRFcgexXu1e2I6EuEixLxuQTiCnCOv8K2Xv?=
 =?us-ascii?Q?fRp9MISbdlVkz/uO7Mlmtv7vG6jpcR/jpJXRJzCO+g5LcsXR9yOEmj69ryjL?=
 =?us-ascii?Q?07nk5sCgPWCGNidjL3c6aQ5Dt+RnqHb6Al93C3EpLoh2+3Ru9objo6M+NNGV?=
 =?us-ascii?Q?OL4zBOibp/BXauxl5JhW/anwB29IJHK75W1UITSizwxLhHgUjPeI6uKLXDnD?=
 =?us-ascii?Q?UYDQpismiTCZvyWL/LfLJlujvPycSWDcDAu9qSex34xhTUEo4/+74TC0lT3I?=
 =?us-ascii?Q?wHSGd+uDheKmbhOlnS2mPokp/QEHhDLmvZjHjH8lS6xMm1MfKOEeiAAHtPSR?=
 =?us-ascii?Q?N3CjMXeMRyYl7gl6BMFLGe2WQSpYf20idVpCjKrQimoOmIC0hKEoeC0mnKYB?=
 =?us-ascii?Q?0qIRpwOaBSKf2aIUzqutd6NLFyXZuncXDbbaR+OxU6U0Oqr0PdJTMPc0aSsx?=
 =?us-ascii?Q?0fjv9No4BYSZB9DgxKPTtkgIXRSDlzSk6NF1hC5SwWwZpda7HUw192Vndz/w?=
 =?us-ascii?Q?KJ7Qmcy5lULU9aj4jvq/KSEQuG414cWSyJLDVRGFQnFxGWVDynVKfTFV9RhD?=
 =?us-ascii?Q?2L5cHaM5eXgeotzGp8R78eAlCeO/XeeKgeuyz4YZ5lRI279XUFMwfQv8jHAE?=
 =?us-ascii?Q?4vzLVOkBR6X1Ylldq77YRC2uYe1SXLjbWr2UfGMzf+g++FV588Wp8Sj/2Hry?=
 =?us-ascii?Q?tp/ddYY/d6O+0v7/wco7fnk48Va3AaiM4+S989IYhtxA342oO64s6xEK2gJS?=
 =?us-ascii?Q?scmbeUvmA9as3Ix33e4ZaPZOW6kzoVUCSIMx3ksxaxY8vLuEeRz6o0ZX2/lj?=
 =?us-ascii?Q?8hmg34/RUesJaBiOM8W623M4+irgDz7Ax5wB9Vkeu+6JPvHXbkB67z4G2l7y?=
 =?us-ascii?Q?/G2Ct5crsrXPClD+AUumRtjOZIL/KAbvN+VssOw96quqFRQLbx2v9rGIjyTj?=
 =?us-ascii?Q?k7bWfaiEkFexb9m8ESsPSzrbzgJ+mV/U1L7BAw0N5aY1YzNw9I0RMcHxU/3P?=
 =?us-ascii?Q?bvj6JwX+muQ4Yimx86KqhPO9MFGNq30nBfEz4+cqnQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nv5cqG7T92PszS5uk3HY24p5PIx+LGa8BTn7wRr2p8sbX+BLj5/rGBG23zKJ?=
 =?us-ascii?Q?W8ihEoNO9JB7Z43n5x293l2O28kfD27mtdOnvCHFsDPXhuEPRANCJDBPaCxS?=
 =?us-ascii?Q?j0wKcMGhJKK8sMEIIGTAbbJyaUidew1TTM7E/8zuDWljA0LwJXwQaN9C2/1o?=
 =?us-ascii?Q?IxGjbZ66GV6fe1aidx43IwLnvYGGJcQeWj/oCbsaWh1cokNYxiL3COU8QF5j?=
 =?us-ascii?Q?XqC9t0XgvWkTEUubjffg/C+HiuTOGWdMYalUkhyVpFquvltk0AY2jjMal5+H?=
 =?us-ascii?Q?sKkUgsPfbYYLa7xsMvBHQFc5OpJlCf8sLhENOwiOyveQg7w/MtnpLqLvDA73?=
 =?us-ascii?Q?fcC+uZQ5PDAIm5c4aUknDeAWvNA4L7UxXa4hfgfaqV0zBznInspECf6hFGem?=
 =?us-ascii?Q?rK+WFtWJJMHIWNBX9GfecmhxOOCud3Gyj63IfvGGfwbHx1XUeD4r1An7O33W?=
 =?us-ascii?Q?oq29yPefUCgtAcpxYFtDPBjFyfqYPnhuoV1kSZgntERUUp/glfy0dHV+ooR2?=
 =?us-ascii?Q?izb85707G5Uh/YkJuTu2gcgkoYafQT8sOn4ZFS3KURJ2BNbKra4ClvzzNU1l?=
 =?us-ascii?Q?H1/Mz/FU3c4ed93ZtWNXaxoOpBr0/N+lFyvGtSWTszMPRZ81gqOConRSirNB?=
 =?us-ascii?Q?LYY1VPIGyWYBvwJQ87kAp4CIGovA95ot2ymC+CeXqSf7eFrww0I4H64LMBc7?=
 =?us-ascii?Q?lpaxSgXT4R0lqJOch5xqDB1GJ2fEfOmlV1xejQTzLJdu6GnLo5fxDrK+Ynqr?=
 =?us-ascii?Q?k/JQb6d3fkxVvovUG5d4vljDb76ydn5mTd7Mm7+Uq21bsXRP+uAislbF4Fe9?=
 =?us-ascii?Q?asKk2L06kp1CguEaY8YgIJOx8K8E1dFvIGj2cbntuPcYLVbDHKfTQPndhG3z?=
 =?us-ascii?Q?0QEcxIP+YbCAUk50TCPhkwMiF22KrDTsNtq5BaF6knxPtUnl51IjflZ8ADBh?=
 =?us-ascii?Q?jom3U2bio3q5B8ofak8ziAib4rTjuE8CMKZfRL3LwBb9v9VXl8GOqLsVM23K?=
 =?us-ascii?Q?C21tseN40hnDG+M5G9bDh7WpNKTlXka3CJ128fCGl4RkjhslcvwoGE3evL0v?=
 =?us-ascii?Q?x6MXGevMMmkuRN1OOeH8pcH6C3eRr6E48S0Yw+jxFfrVT2LhhgsiR5ebqCHY?=
 =?us-ascii?Q?079+cuwc0o93dmJpaVUt8xiCzkXZKO2MOEUsiJJh72k8bVaFVxJqRJ5P+Pga?=
 =?us-ascii?Q?wWHe9b65jkfdpU7VbQCT5LqCX1dgigFAoK/1CfTJkuObB9BuS8+bjE3z5nPa?=
 =?us-ascii?Q?u/SB3ZNDWBeK6Y3fi0l7kl32OVu8F/jbmMTQwRTg5uo4/Kh48vIP2iJGTAwS?=
 =?us-ascii?Q?DJEgVwerwd6tRBiitz+tNcmaHxJP0b8/csVUQXH+jtA8UWflLJXBIocn7nSR?=
 =?us-ascii?Q?xVvwY17+jDhp3AkYbAONnNYuRRqtZ30gslsn4JQScH5aQr+JJmcqQ1AedHpr?=
 =?us-ascii?Q?iEdWwfHr63O4NyBWXINf6qPXlR0MuYkc/LjfVn+7tZFoBkkB9D7B5BIdW6zO?=
 =?us-ascii?Q?HPklK/pbWJJyImr548OPLMO2noG9Ze7PiQ1DbHCpW9F5zZDktnjkWmv+QBTi?=
 =?us-ascii?Q?XI7WhexBFYphGKTTEqSoXPvsjgfMb6BwyqRscTID?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 034f207a-4618-40c0-aaa9-08dc7363aad5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 15:45:08.6536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xAxvNcG1xpKSOY8+ssY0A1qk3dWIHapRU1ae+/k1aQuK0zs7OQELGhFgVly14WDzOHrO/XIGrKLKcey033zPHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6053
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

On Mon, May 13, 2024 at 10:42:18AM +0200, Michal Wajdeczko wrote:
> Prefer forward declarations over #include xe_reg_sr_types.h

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_sr.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
> index e3197c33afe2..51fbba423e27 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.h
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.h
> @@ -6,8 +6,6 @@
>  #ifndef _XE_REG_SR_
>  #define _XE_REG_SR_
>  
> -#include "xe_reg_sr_types.h"
> -
>  /*
>   * Reg save/restore bookkeeping
>   */
> @@ -15,6 +13,8 @@
>  struct xe_device;
>  struct xe_gt;
>  struct xe_hw_engine;
> +struct xe_reg_sr;
> +struct xe_reg_sr_entry;
>  struct drm_printer;
>  
>  int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe);
> -- 
> 2.43.0
> 
