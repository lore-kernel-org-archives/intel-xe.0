Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42819CD13DA
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 19:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F10610F423;
	Thu, 30 Apr 2026 19:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJXvw+Bi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4B310F423
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 19:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777576958; x=1809112958;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LLKcfGL0ZNVOPsMMjEYtM9sfuMPoqluv4aI6UY0YvY4=;
 b=TJXvw+Bi/VvQKt1jCQiwB23lg7k5KHBO6On0xDgmcjU86u3tfSijBPio
 W1hm6Vm9hFAqGZP69Xd2SFtcMs+W6yvAyLKbefRcQo8IL5vcRpOEVyNXu
 BdZX9UUvJXqtMyLVbOA9mi3uI+d3vtfBYHVFuy+wo9BZ9oZAS2sF8ga/K
 medhpW1ceyx1j/8K4g9SPPV2qXOLSXDdAc/9Kui1P9Gwb88UezUWKmR6s
 95sBCsLPBEYX9LpWffg7F6c5cRCtUsaaC7W2HehPt0uS5mDKkMjmtgBxe
 wk37DDMhDV+rZSCET9LmMu9SvmRxnUpnE4uzu0ThxfO0PekA3SlsK8rGX w==;
X-CSE-ConnectionGUID: BzU3ugYyRfe77KelE1KzBQ==
X-CSE-MsgGUID: ZaEzBRRSTLeUgSlyc4emQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82395156"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="82395156"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 12:22:38 -0700
X-CSE-ConnectionGUID: eQKnyu63R8qJnPX+cmOJdA==
X-CSE-MsgGUID: d0cRdHRUTYObV8aNARPl1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="234564200"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 12:22:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 12:22:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 12:22:37 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 12:22:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IH10QTdL5c9LOkVOMZXnVpvCIDmPJmDTeZVvHV0qXC199NFEgEiyKDGRK24hNN+Wl3Jm4tT78ZhAmauXetBPFSCKIYGnvC4bGHPfQBZFydMQ6aPf6omqYGxuQU0XznF3KnqIuKX6W7YYO18SHLQQRJdAItPDMRT0YKUOzYIzcwyC6NM6Tlx6uHGpPITLRsOZoX4U0g/Qnd77fNsSm+C7J6OY63a3N7qiNKjpMW/3XJIV2gzsUiDSfqM5h75LOA+Eu7ZYc3dgEGxz4VRXkh8nxAAE3jd5Y37Guexz+LRlfirm2b9ZFKCPuAz8L5wIDJ3ZNYRv02RcXZN4Gm0+KNfrGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejxatgAyF6KK7YiJGLStnIhai0mKmPmZuwCD6s49cAA=;
 b=nN489L+hLeHsZEvMwYPb+5n1MbjmmDXgBosHZCktyppWPw7o2kYPORnu+bKO/Ec3BG/RFYdo9FZRK7MnJ8uhGXMGw8QMsEJQ2Dvt1mIUqhlSrdZlSImQf+bjE7svoCibjKB/kxKP3gMDXYZMQgmAtS0PI6UzUHYJHwgzn9T1vZZjij0xFi9vtY5xcWhcXmMpBPsuZlTk4h35Hft2M4G9+SrVSGjdL0Q5QP5rNQgEr9OI35Bx32lCpJDynmshP2FDdta5jr9hCK1aADFtzqAhebGQXd1RQz/Jwsc0+24mLLzkRtyynW6haiWf0Gr4oMYJTVk1+GARjxRylP9aolbiSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH0PR11MB4984.namprd11.prod.outlook.com (2603:10b6:510:34::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 19:22:33 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 19:22:33 +0000
Date: Thu, 30 Apr 2026 12:22:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <simona.vetter@ffwll.ch>,
 <christian.koenig@amd.com>, <thomas.hellstrom@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <gustavo.sousa@intel.com>,
 <jan.maslak@intel.com>, <dominik.karol.piatkowski@intel.com>,
 <rodrigo.vivi@intel.com>, <andrzej.hajda@intel.com>,
 <matthew.auld@intel.com>, <maciej.patelczyk@intel.com>,
 <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH 24/24] drm/xe/eudebug: Disable SVM in Xe for Eudebug
Message-ID: <afOr9Bo6hv1aa+xT@gsse-cloud1.jf.intel.com>
References: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
 <20260430105121.712843-25-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260430105121.712843-25-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0154.namprd05.prod.outlook.com
 (2603:10b6:a03:339::9) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH0PR11MB4984:EE_
X-MS-Office365-Filtering-Correlation-Id: 803bee48-daf6-4c9c-23e2-08dea6edd418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: KG/BRcotIbBl2CiAJD6BNmRoPpnnFYgPpG/lLGZC+jSTWsdlRJ7WdRj4ipW9TSclZJaNcb/QZUTQZe6TLkQ2WB3LnXpShNYzwMAsRxAmb3SL53JjOfc/AdVVdFMYLBtQRSZkab6953kUYRUzIlQHf2Q0/6onfK3mUx4QM7Vh+mQgKoz3vKMIogpU/xGMahD5z+ZPNRmaO+cvLJS+lj2eUXHFriKC1EMGzWiDF6X6ZIr13r5pCOqzOyFT2QLKblKWVtRCs16/upeqhXGJanH2VVne1dKQ90YbWngk7kBRE2BZpLNxB6naaOzsn4uyarpk8v/D2LvkxRr74GxMuj4ohjoTc8FZHIENSecuTEcI7qSY3X3GhP0BBDQBTk4INKUuVW4DJaq+MprRkAbNeZRREM2glvTcTIuYYW6HKdxnCTpUp/OJBfUftoQDT6t2HYv034IR76VtP9ta8fHkEI2HVnRvfaihAvn/xDYNT8EFVeZ2rOU+xqUb4gfRMO/D3a5EnAyPzZRjESjL2f8jmw+HSNpsP235nCi+/8yGusUxfsD7bwjtJKc0QvgukncanVfsZOxQ09P0H0tkEEwnfCoxS8QPaPt1Wp2yB6uNRjArabpqH0Dha8tj0f8TUNoh62csd7nBR8SgVPK21W9poomWexwaANfJ1+Yw/+NfCBlvmy1E6OfNDJQRBiuoSd8AmTUL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iGkigGeHxxinXzIvNK542KEMDmA/rit6lmERYD9ss5lHuYQFqhYUugoNBd7g?=
 =?us-ascii?Q?c9k8hHXRTot1c4DMnq1ywsfTcLC9qnC0KVsMmk1R7dBPOaeGbkO2UHsjYGSm?=
 =?us-ascii?Q?7lMNpNWU/p6TzeXq0H1eYX9vFLBE4HIK2Zl5Jdus/74FRDqgfaY2tCk701dm?=
 =?us-ascii?Q?pgJkFCFPgssJKUR9s8sbHY2cfMeYPjMe9XELvvau7Va+RoEth28b3WrJ4NVi?=
 =?us-ascii?Q?CjPLongh5ktK+952HOxSbqnNVz4jZbXSxF20zN3h6TKtFebint3bspT5JvuW?=
 =?us-ascii?Q?WHN9qnzLC2r5yGAn71FyGzFGah6uy2j0rtap6yywN2awFFcysFM3xnRp7d4H?=
 =?us-ascii?Q?sn/xG0nLqYYRV2VvN+ePaEJX+C54J20B0qUrqsWzor/9UaJLtHOR5Lv9saiW?=
 =?us-ascii?Q?gDFlaTP/Lhz1tm5KMVtiNsKNIbJ2XBZCt7NvmZWgzk2y6d3DtgxIOZomJytd?=
 =?us-ascii?Q?B/Ze6NtBut7dS1NIeFtrBqiHqMTOG/ps7o4YbDFMtfWcEoNZ6hVhbC7yb/Dm?=
 =?us-ascii?Q?EMriwlUFKC7yzNb91zeOI5GFEN5NXgrJl1B1+WXMba1GntwEUtbVQX2R07jl?=
 =?us-ascii?Q?S0vpSGr+V/Ypd6O9xu3tJgRpIpwx1OIhxpUFUQX/ngImPd5iBH77LvP6TA9b?=
 =?us-ascii?Q?5Zt2RCn77Ka+ZD2HYx3FbJiBPhNwVHmyCP67XZSh/MYga90CYceeHKN4cC69?=
 =?us-ascii?Q?YY05NVOkh+834HH5s9tBWHufOKGb2nCUucrovQ3YJ0NQJI9f/MbmwFMPK2jV?=
 =?us-ascii?Q?dYtFo0DsgyosAzd+Ym+uQPYueDBXJ4dwC6LqfqITxiIGv36b/3GJ/6JGf6r7?=
 =?us-ascii?Q?ucLdeDubs/8F7gA85LBGIBqwcwa7b+mcbeNc4UNAF/ljdqhJTiFvMU/UqsxP?=
 =?us-ascii?Q?oiJPqtJAaC108QGViN447V9jT96as7ImIAAWDbAewKJaQv4aMEfRUHjRIo54?=
 =?us-ascii?Q?PdMrsAJVOAbfexw3FmjE1HO8Z0gh2vU9xAztolTvs1IC8d18L88qmZ8v7Mwo?=
 =?us-ascii?Q?HV3YKr3dRwT/mPBGfWhyWcGCpc19pui7JcSrJHvFnfAZoReKtqSuXoz3whVC?=
 =?us-ascii?Q?pmGnQVPwuVFk5I0O7ZW20CJEzclIF76MwENYpIgfXJLZntbtja0v5+JGGnZc?=
 =?us-ascii?Q?yI8Jy++2dZF8gqSI+cHHm6cv3GIWjgS1RF887KF+6eexrIBRuGSJw4u138nq?=
 =?us-ascii?Q?JvIuDRNoEJgqnvE3NBaVyj2QxE/gq7bMX1rYzPl/KbLrxwElbuInC0Sc1jsR?=
 =?us-ascii?Q?V8qzLglKTjd1a+k86n5UrJ8s18MCX7NTtatGWFU62jWCHvP09n0wNiVxxLLs?=
 =?us-ascii?Q?dP5dZo/oAYmzKuqPaJcA8DVOhszveBf2y9jMKXoWsiPNvN005bokymmU39MY?=
 =?us-ascii?Q?oUrS48VBrOJaBZtZq6ep3d3zIoCzfr/KCM+em/Ms+Qempkge7MBTtUXe3j0a?=
 =?us-ascii?Q?/K8twXauYPs0g9p/es+Adq9KPp3Opt8dA3aydzbSv79/ndo9UBSUt62QDXyt?=
 =?us-ascii?Q?EPvT1ToEKohwrcaj8imNbcMJhB8g57C/Cg5nQyBhnWHz41Ur5GNj6nL/JOEr?=
 =?us-ascii?Q?U+sF3a5lTX4Lq8LGraoByRqRHdcyG9iJcLH6iNdjTOxZjrYwznl5NMCg9vj7?=
 =?us-ascii?Q?XhXZD1NRsk0KLKJubi2QUJJ2VGqSKz1USlga9be/O8Fwbgwj1vxzg6MR3tHp?=
 =?us-ascii?Q?TeUxLFjZ2lU+pWQFCxKfZT4R4S3k3vT7FVp3/0e9tfbsThCgQv2bhw2Ym7Wn?=
 =?us-ascii?Q?vulvUTOT0vrfKypC4Rl5TxBGtVIVJKo=3D?=
X-Exchange-RoutingPolicyChecked: KMUjEfEVNuaIwr7PtqFUjrEc1//ZGeaWdKre5hACO3F20R4xSBz0sNZy7qMiREN+MuacSeLv5xU3zSqnNTB3cNq/7BQ2GmwTDGTC8BHQEPoeMS+G3vg/C5Zqk15uNoGCpwifoYrVTXf/BSZeeU0d9N5bPvg8BslEAyi3FtArabsydomtgHA+n02h3X4REfp2iiuiiVVdKk/URmTGScV38EB6kLEvGcKFXI4V820ocwV5NG0a4fGOXlOwUXqdua9NHhbYw+iJ5CLHbCGsGKKFJy1FfylhBwzsH8QrgtQLJBKjZ7Ce+qXeGDiZkVYI6MJqk5iM1uCZFtaEhShlIwV1vg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 803bee48-daf6-4c9c-23e2-08dea6edd418
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 19:22:33.1347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SUGH4GfluhdiXMd+sSIxrjrQalbGinUenz6C7Z3p9YER+18p0qPSV+ry5bHD/ssdZDGaNH8R0SzjjRUYzuM6Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4984
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

On Thu, Apr 30, 2026 at 01:51:20PM +0300, Mika Kuoppala wrote:
> From: Maciej Patelczyk <maciej.patelczyk@intel.com>
> 
> Missing SVM pagefault intergration. Temporary exclude SVM in Xe until
> there is SVM support in EU Debugger.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 78d4673665b4..542198a60ed9 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -81,7 +81,7 @@ config DRM_XE_GPUSVM
>  	depends on DRM_XE
>  	depends on !UML
>  	depends on ZONE_DEVICE
> -	default y
> +	default n

If EU debugger and SVM are mutual exclusive, you will need to do the
inverse of this - default DRM_XE_EUDEBUG to false. I don't think a new
feature can turn off an existing one.

Perhaps this will be non-issue by the time of merging though as the SVM
interaction will be fixed.

Matt

>  	select DEVICE_PRIVATE
>  	select DRM_GPUSVM
>  	help
> @@ -132,6 +132,7 @@ config DRM_XE_FORCE_PROBE
>  config DRM_XE_EUDEBUG
>  	bool "Enable gdb debugger support (eudebug)"
>  	depends on DRM_XE
> +	depends on !DRM_XE_GPUSVM
>  	default y
>  	help
>  	  Choose this option if you want to add support for debugger (gdb) to
> @@ -139,6 +140,9 @@ config DRM_XE_EUDEBUG
>  	  With debugger support, Xe will provide interface for a debugger to
>  	  process to track, inspect and modify resources.
>  
> +comment "Gdb debugger support (eudebug) disabled for CPU to GPU address mirroring"
> +	depends on DRM_XE_GPUSVM
> +
>  menu "drm/Xe Debugging"
>  depends on DRM_XE
>  depends on EXPERT
> -- 
> 2.43.0
> 
