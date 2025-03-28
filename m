Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A524AC28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 17:40:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C655010EA66;
	Fri, 28 Mar 2025 17:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMm8Wiz6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B08A10EA66
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 17:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743183648; x=1774719648;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aVcneNXMlTqFyRLOxi3uSk4VRL3KO4QkthvAh4etpFc=;
 b=eMm8Wiz6E6osKAHfFzJ2pl0VcJrCUKiV1zhlTmh7lgTZ64SDNrUn15Qk
 mS++dQVnXsoCHQgwoHjG9FVaXb5v91kWRgFdO9k+Xfnh3zT3OrD8B4oby
 iZoxYgEHHRbiJlrbjGltE7v+U2apu7cHUs3CXJrctGDOjmGRRZknrzXiE
 eyKX43E0K6wSfnmIqFh4gwIpuU75QXBJ7CUfsM+8EPAdXQy5z40GMSUWh
 EJg426dILBh5zeYdjHwZXrjyvG1OIImI19x54gwL8eHkB3nA5ZXNdr75h
 W0b5lh86BmtSba2x1PJ72J44fufDe9BgV8aU2kPWSIiEcpC4Fx9fONftV A==;
X-CSE-ConnectionGUID: B5tAGWOXThW3Fo/EE1Gyfg==
X-CSE-MsgGUID: lXoX2MxNRjqAPbEyM/AfCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55201403"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="55201403"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 10:40:47 -0700
X-CSE-ConnectionGUID: PLRw76PUSGijpSrVrVgr7Q==
X-CSE-MsgGUID: BpJvsov/QO+7CY6dNYQXTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="162736075"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 10:35:35 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 28 Mar 2025 10:35:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 28 Mar 2025 10:35:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 10:35:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTVUE5DH0U8xA4V2P9R/iWgmQGe8pUQ0+rSBnORhbMFJzFmMu0Qvyl02HM1X7ZvJWFv5OJfGhdJq66W6BROnoW30B9fGwfz7XY6nAF1AAgP1tSsi/JFblM2qm7AnLjLiRvScJLMFO6Jh7PL3K+1X6ptVxq70BZlq/V7uZlE+qhEUWelH/sSQh/gVHc6cVwAXuk/AkwFFfpEiWe28JdFQr/p7T8GOBftZC+uaIO7o9YSstR+VlzLxZZ3h9yR+Io8GrtdHSE81nhNIoupzHB0W18uV1nUqVSsnrKrxM/C0dyBydEEO0Msg5HxCXGeOxq3CC7PrPtS8lrfg5pT7Wxxlwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWLN9V1Es/onawUlih1uKsbU2dnYuutLKb92fEKnME8=;
 b=FuXUoUGmok6VCJQDJRnwjm9iOWO6nMa/fNhD3Cv2P3UyXDNJGjja4PVyauDv32CXlO9O6nZ4VjV2dEZAdAmiR5QSQr1sGIERdb9amJAVVR9YzlcspibOOKHEEbhHE4kDZ/E6Qb3PhkN0Rn7EhFmu9msZOE4DT3GCVqw2GvKgYXQtAcCQViBN5SDSB5UIwjgodx+qgWbKxVfjCtGNTjlSH9AbhHJQxBVJbrgoXyeRC5yRzZHoTgRzf8nBVaSvbhP7hKWVeAi7zp/HA/XQ0aRehuWm6QbSXlSo99lX8YfD646c3GRqGXzcaJUCtXkGWUpO0WZdo72Y2vUtd7yn4PM0Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 17:35:32 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:35:32 +0000
Date: Fri, 28 Mar 2025 10:35:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Make PPHWSP size explicit in xe_gt_lrc_size()
Message-ID: <20250328173529.GP3175483@mdroper-desk1.amr.corp.intel.com>
References: <20250328-explicit-pphwsp-size-in-xe_gt_lrc_size-v1-1-ceb9ce7c8bc1@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250328-explicit-pphwsp-size-in-xe_gt_lrc_size-v1-1-ceb9ce7c8bc1@intel.com>
X-ClientProxiedBy: BY3PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: ce6794d8-6694-4bb0-9b8c-08dd6e1ef0a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f0fUfAqny/VjDxDhB9CpCz+bEsp3RaoeHtFQTsV3ImHe+qtNRfWaY45jc1hj?=
 =?us-ascii?Q?PEJIZc/Rr49TOPDjoLzV5kY2nOlT6Zmg6TVXZRrV+StgQKcxOXZRgM7t1t6H?=
 =?us-ascii?Q?KJMjGQ+HzK7H93vzanb2aodaPeR5CUMiyg5G3J3jI2OAbj1l8YYeV4wpCMo7?=
 =?us-ascii?Q?RF+YgZ9ktI2UXXHojfjpd+ld5Agc9th4/mI7v2RsJSFsRW6sMhvkm9dU99cQ?=
 =?us-ascii?Q?K3Zcmap5JfKQOd1Wf3Md91f9PLQHUPvvI7RQv88iLdIdE7yg7O2fm+/qo5yf?=
 =?us-ascii?Q?d1gABIh3TujyAnDGDkUK3mG31MC7W+PbKU0qRY75BoHIKHhHDYM4cIUfQTbf?=
 =?us-ascii?Q?GTmt9KcOXzY7nK7kmsHyGTbh4SPhIX2eLWn5AKsksAEX2Exw2XpenO5dSt0i?=
 =?us-ascii?Q?8Fo6g3woBPf9Dma8z7eyCeTYIVHGPDnZpATEWun4KsaJv57JfALcJlXuWAx7?=
 =?us-ascii?Q?rngtCZD4IuayX5/1gVJOiCt60ENUkuz9CcEtoaTD8eeKlbh9di5+FHYDQH63?=
 =?us-ascii?Q?Sg618/zKO9JkMhoaJ700wtwssRxXcCHKzXfJ65p3nRm5PGOkP8u2WjKXqPzt?=
 =?us-ascii?Q?WS772rPbBOr5sJKb5IeHo6ktFf/DX2pRBxAx2rYZgfpYG0YT9jF0h7hyzxie?=
 =?us-ascii?Q?/AmuoPxL1fk5j8DcaOlfDY52vMyFJGs/5FcvzsXr7boFcUYLxiJcNrDj1rNX?=
 =?us-ascii?Q?8e9mgJf1fMvdFWgRKeKF8tf3IykMFyw/GJUGQRbn8n77M9hDcXgkEN+tNCRV?=
 =?us-ascii?Q?vFnL7DB1JfRahfUHa4R9D7NfIvbPiOmmE0HWmefIwgzHkW+m725aikZrf5cZ?=
 =?us-ascii?Q?ezMRDIC4B5KUdUfFSpCVlSTEhk9ZPaDquw1IjNgzl1/kkpq/ZP497mD7fXxb?=
 =?us-ascii?Q?L4Pjs0LBWaIkeFwKT54yjc8QitAe3e9Hj/tUGrAOJPwQZmI9vYNbKEquilAF?=
 =?us-ascii?Q?FDkeyhyLmXUUQjhk2wTTkJt4pzYyTVuksh2rFXR2bk3lCkeJOOQTkVOXq6Yn?=
 =?us-ascii?Q?KMUEWZSXXBg9gc5H5PTcOnHM0fp2PKi1LhRt5tWWHKiISJJG4C1WgnsG0F2A?=
 =?us-ascii?Q?PoIdlydEC5wkrmrr8xnPhZjRpOTuXuSZHZXZ5e/JKpdil7vgei2Q5CjTRjLG?=
 =?us-ascii?Q?cwqOReVt7e2pQhwqKBSLD6RiVJ29XGK0lory3Wz39Va51VkN1Y3zN/O9XgSX?=
 =?us-ascii?Q?dvGBHcAxtvFVZTLuSdBfTBQ4fJnkS906J2hRbGoFIetdaO8EP23q5xGHl0T6?=
 =?us-ascii?Q?Hb4C+iz6eOGcZrDepQ8FkG8VVhTPVCm/hPgW66f0fDdfLxILHVsa4Pm6OgpG?=
 =?us-ascii?Q?ZFQ5fJ50/e77qOaJzDPePxacO0BW7GxVmf6d4nJP5CPtD3lS5ebwHYNXLbba?=
 =?us-ascii?Q?hQf0hQ5pzFf20YVLPZBUi/Yp2sqE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bAvPw7RIkPbh+WPs5E+dIgChOPzKa1Y5PzceXHZfGw8KT10wmwgilxrXxx2z?=
 =?us-ascii?Q?X/g3SyoB0HSyOV0C8zOJ8+iijK4HKAB/ydVoADysy1/LW70jgboR6MbFVIri?=
 =?us-ascii?Q?3pwbui1BT1r4zTW+VmsTT0aTDP0yrmF9m3VDt6H5YmXXaO34qOQQlUwUCkKS?=
 =?us-ascii?Q?wiE0RBC5IZXydiSQfitvM7TKW2Do1+mwuTvop4ikIqzon2IPphTWwJf903tw?=
 =?us-ascii?Q?Mv4kH/nHjR71rLeLubHrWBE5io9eLVxixuw2OvX2inLu7vTnNREQUi4R41wZ?=
 =?us-ascii?Q?32Fm1KSbR2wuJl1CzLTTlOeNCUlrDx4je8AgzgPcTYG1QjBtvJ25vnuXLDB9?=
 =?us-ascii?Q?atvykaIP0Qw8q8tUY0MFlnwosRYJDsmX98ZhDv1PzQf2ND7tmdP+gzsXSW1x?=
 =?us-ascii?Q?hHBqTrMKlEMbm0KZWFMX/4fIAZ39XbSj0JW+kTDLArtNhlgnfZBByh2RcJRd?=
 =?us-ascii?Q?5rIlKfgCmap4hI7XesC4acobdtJ1G8m26uYxc9+R91RJbW3q+/PvLmctROfa?=
 =?us-ascii?Q?wrebbIsEnXSdq6v8XVW6x8pYfRNw30oEYnoH3SGyZi4kObRQRgZMESeXCS3I?=
 =?us-ascii?Q?bVOk2y9L/BUHM409dSVTGsM3MnclcHCusSczDM2aQQ6+8CvgUBkAkfCxNyMN?=
 =?us-ascii?Q?um/FDxNO4uluyMmn0IADVOu5wjdy7Beacamiro4trUaMgJi1mHSf04Nx1Ev0?=
 =?us-ascii?Q?e28jOOiS32j6Ae6qg+Uhd84NzieKm1ugSNGP9Fid+ZbPImCr9DDIroqmxWK/?=
 =?us-ascii?Q?bP7A+Mrkv1i88PLrf3CuABb8CHLVqwP44ddJpXk36E1RlRJcXZSF8fFueYgZ?=
 =?us-ascii?Q?jRzFSEsd2PtwXHz9fyI0gc8AvuS5FAAUJYliONHGDxFvXrlg2yLIwbWdaBvW?=
 =?us-ascii?Q?biYYwA0tRIeaW7kGqeOMpMXrvY+jk5GVe5p2VrS4QbfGWUwP8p3CS6TabFLo?=
 =?us-ascii?Q?hsMuIM59q8gZS9qvU3O5x+bdPeVD1DkZ+7RKWGQMbuNx5XXlzDHfKuiMCiNI?=
 =?us-ascii?Q?qZH2bhQIsIij7sA6MEnX0VufKHv6chOdadGm2U2jEgOp6Tq2LQU5sKjCB7Aq?=
 =?us-ascii?Q?n+seswUvFCj3kIibZwEqMKLbLuqqr6SsLCqxksOdmEB8nueojdHdvf6nb4lQ?=
 =?us-ascii?Q?BlNkcGpoqyMG0Nd/VT6nnfvGmXSsobtWGTRQa4z9iDy+58CELotq3mG65oV6?=
 =?us-ascii?Q?8EChcrwQZppTTRGnM4FkmlznJxdnHGWgT6iUGc8Ks1uPeNaZWr69altbl/8T?=
 =?us-ascii?Q?5vAFaxHobhfUF1vklcmYtoQkGs7UH5tf8cm48FdSSDABSSxHfAfCGpyaQO0C?=
 =?us-ascii?Q?74CZEcQSKHUyUi/RQ0BfdalesHclvsWl7GyRi8sPlJ9A19uxIWsDZZLpbq2D?=
 =?us-ascii?Q?ELGpCxY6vBO1oeFh9oDC9v8R7+E2VDKQvfDSRjb67ULwo0r+OGoP+XuhxdDk?=
 =?us-ascii?Q?B2CbHkE/BgnaCxbMAg8r04JpeedZmhmEW1X5cocFRyUFHOAJGajN70eDtNuI?=
 =?us-ascii?Q?ecXJ6hRpqrkQuc/Kc47JNxK/3063vnAD0aBzVZcQb4erTyAorq3vwHa3YEE3?=
 =?us-ascii?Q?mKriPjtFOHhR/nALQGgKDpcgWVgAUpoKabHG1NiEzSnwjA51Lk3fSpcqoMfA?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6794d8-6694-4bb0-9b8c-08dd6e1ef0a7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:35:32.3886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JRYvQuJKQtuU2aSsRgLTmyhcNhyL+t7LhN92oHDd3JWyyvZ2XB1eyN3B7zqdOHTVP9HkPO/8O8Nq+edvVGiH3i3DLgudU44gwbjhiNtu8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8019
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

On Fri, Mar 28, 2025 at 01:50:50PM -0300, Gustavo Sousa wrote:
> The context of each engine starts with a 4k scratch memory space for the

Nitpick:  I know the bspec uses the term "scratch" in its informal
description of what the hardware status page is, but I'd avoid using it
here since the driver uses the term "scratch" for a different, specific
purpose.

Aside from that,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> "Per-process HW status page" (PPHWSP). In xe_gt_lrc_size(), we have been
> implicitly accounting for that page in the switch statement on the
> engine class.
> 
> Since the PPHWSP is common to all engines, let's extract that into it's
> own assignment. That makes the context structure more explicit in the
> code and aligns better with the descriptions in Bspec.
> 
> Another advantage of keeping it separate is that now the sizes used in
> the switch statement match the sizes we calculate engine-specific
> context images, which have their own Bspec pages.
> 
> Bspec: 67296, 60159, 45554
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 81def179266443a58ee237b5bb2c30eea066ec7a..2639a3dfc9f7b3f420acbaf2c54c40efeb7bf354 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -37,6 +37,7 @@
>  #define LRC_ENGINE_CLASS			GENMASK_ULL(63, 61)
>  #define LRC_ENGINE_INSTANCE			GENMASK_ULL(53, 48)
>  
> +#define LRC_PPHWSP_SIZE				SZ_4K
>  #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
>  
>  static struct xe_device *
> @@ -50,19 +51,22 @@ size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	size_t size;
>  
> +	/* Per-process HW status page (PPHWSP) */
> +	size = LRC_PPHWSP_SIZE;
> +
> +	/* Engine context image */
>  	switch (class) {
>  	case XE_ENGINE_CLASS_RENDER:
>  		if (GRAPHICS_VER(xe) >= 20)
> -			size = 4 * SZ_4K;
> +			size += 3 * SZ_4K;
>  		else
> -			size = 14 * SZ_4K;
> +			size += 13 * SZ_4K;
>  		break;
>  	case XE_ENGINE_CLASS_COMPUTE:
> -		/* 14 pages since graphics_ver == 11 */
>  		if (GRAPHICS_VER(xe) >= 20)
> -			size = 3 * SZ_4K;
> +			size += 2 * SZ_4K;
>  		else
> -			size = 14 * SZ_4K;
> +			size += 13 * SZ_4K;
>  		break;
>  	default:
>  		WARN(1, "Unknown engine class: %d", class);
> @@ -71,7 +75,7 @@ size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
>  	case XE_ENGINE_CLASS_VIDEO_DECODE:
>  	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
>  	case XE_ENGINE_CLASS_OTHER:
> -		size = 2 * SZ_4K;
> +		size += 1 * SZ_4K;
>  	}
>  
>  	/* Add indirect ring state page */
> @@ -650,7 +654,6 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
>  #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
>  #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
>  #define LRC_PARALLEL_PPHWSP_OFFSET 2048
> -#define LRC_PPHWSP_SIZE SZ_4K
>  
>  u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
>  {
> 
> ---
> base-commit: 4cac9bb1b5db81d533be95f97dd30c03a8733871
> change-id: 20250328-explicit-pphwsp-size-in-xe_gt_lrc_size-d9aa323430d8
> 
> Best regards,
> -- 
> Gustavo Sousa <gustavo.sousa@intel.com>
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
