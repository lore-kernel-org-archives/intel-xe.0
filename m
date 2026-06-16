Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA6CCD98E4
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 19:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D0110EACB;
	Tue, 16 Jun 2026 19:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IUIwIQdd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C6E10EACB
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 19:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781639917; x=1813175917;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iSGsZPNbP65AdQIQuI8kDwHaqEIJZNQTF6g8mVP+Mm4=;
 b=IUIwIQddHf/+KJOe4Q6kk1SQIBDiOlkBAb9vZOqNp6NpBi/4xYgnTVzC
 8Zmwm4H+rKTFqknSIEPF/sjGd2KVme+ZEAqevNBRKQUnTziEo83MRzSpl
 ASsSigiCJYnvQSzBNt5T3/QXhjXZ1FoIHERBNiGgysFxCFWc1oIXaWZ9y
 ttXMCBRWm2zr3fuNWm3QP0qJ0omMYltCxHteT6KGxC1izpBFHWE5q5xkw
 TrpOYOzzNlfJlEWBJvC5gDh00MRk8kiI0RAJOGGbviBfi4084czjq6FQL
 O5PWhfrfqeMkfKbf/6aTZKmXtNST3udlhcKcjA8ati4V8k5PjJdglkUVJ A==;
X-CSE-ConnectionGUID: ngk2IaRaQMWlxPXTwvTDIw==
X-CSE-MsgGUID: QZTRl4bzSOSajl4voWsVcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="105100222"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="105100222"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:58:37 -0700
X-CSE-ConnectionGUID: QQvBFi9IR8GfxjoBe6cS6g==
X-CSE-MsgGUID: 3+3iIKq/SiWzV3f0o7J8PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="252969710"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:58:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 12:58:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 12:58:35 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 12:58:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2MdAG+ezsIKQB6Hpc/b3H2tvPcAPnkVkY27HhusihqpBe5LFI7qxgN4fyH2FZxmVqzqVVUTO/7wwSVDJoKKugHNOYxqMMPrNIhwEVT5cgjh7pXHiEEKI4zuDgRoAm91UYt1IVZ8TpI2xkGk/RTXkmnofMhuwZpybLOzkOwL3eIPK8RiOKHcY//evpwcp+pcj0FPVoGPHFVZF2R8qDLOFWMcsBxeFOwH5ZTB+KCoOsuw4lNreVgAdm3Q3sUs2ZN7nnSCaegRfxSsb1HUlU4EQLfaQFhxUNP10dNMcYIl31Tv6wvqMLHY0ibsxQKPx+bYBLxF27Zn07JOn/0I3/hc0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oafjJvogGi7fGcoQKTDhI65AKxJDVeHpH04C/3Z5ubk=;
 b=xihnUkaTsz3N6FK4jm0u7MN6noTSLD6yh4h+51ctBspmzuo/77sBmgvlkrScirL2QMQFNW8U1GVHtRpk5akV5cKBRC5168Lf82cKJ0C1Ny1zuoI3Kpxi6Qnm2UYk8sNJLXJ5KKJzxE7FXQfEpMTs6VocZxfGiABYYGNfQdPt6YqMgFUaiUBN8IHdT5tWgeJmde4/2DumaNflsNIotxeC6e3TIQJ1BEt7NaR8oFBuUmHx1vfa524P2hr1jgDF0GRwBES/SwqKuYSu9G07B8clf4Pr+5brdva78QtWxlB2iBLU2fQBqUI/1GhR9MU0u5XSvmagmDQmxmQgPC39vaWsQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8284.namprd11.prod.outlook.com (2603:10b6:806:268::21)
 by PH8PR11MB8288.namprd11.prod.outlook.com (2603:10b6:510:1c8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 19:58:32 +0000
Received: from SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65]) by SN7PR11MB8284.namprd11.prod.outlook.com
 ([fe80::65e5:898b:2231:bf65%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 19:58:32 +0000
Date: Tue, 16 Jun 2026 12:58:19 -0700
From: Violet Monti <violet.monti@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/9] drm/xe/tests: Set non-GMDID graphics step in
 xe_pci_fake_device_init()
Message-ID: <ajGq29A1oTCy36nn@vmonti-desk>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
 <20260609-xe-probe-info-v1-6-21e83e188e60@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260609-xe-probe-info-v1-6-21e83e188e60@intel.com>
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To SN7PR11MB8284.namprd11.prod.outlook.com
 (2603:10b6:806:268::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8284:EE_|PH8PR11MB8288:EE_
X-MS-Office365-Filtering-Correlation-Id: 25aacf40-9f61-44b9-6543-08decbe1a4ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|11063799006|22082099003|56012099006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: e0t6pKzYhydZCTR7y4YbLF7ELvGz4BljR3A63+7PD4wrNctrt09HVLWeIG37evKHO8eg3o90R/lFdAE+s4l2G2+66NQO/23uavuO5SEUpfVOIKz//nxWVNI87k1hw4x2FlmsEvPvGyqje8B2eQGLBlCEW0e5E/KtISwGMoRvyofQCzIRTYGLLJ3Onigji8tZOSn6wls3rtP6V6jhsQRINawS2HRY9LW9ZQA4LRx1yuWlKwvM0glgqf7GoEUYvOJqbCEyl9BNW6/y3cY8bbC6aXzj90P6cPcnjlChvfFC+PLLrjM0op7hBEYrSnY4jf0y1wtvsWdrwc3sYUGn+mU9ztSfpNY3vUJuF+ekOelwRLAs73A2MPhVGgzQLxLT/UlcotLQ7m5ZA3Fw/jtg8nLo8kyS3p4g7ZHTT/P49E0E/IgUz+t51gKS3pa+vtrYzLir+7UoWqeHXItedOFM8egsWDuJDVqMeICJogh23QCAVTTibyKZeQmhucJVVzMU2HLNn844rFTi4VaHVnjTBiKXQfgKDrSECIoUqeZ3LVUuHLwbgitQNOzAT5jg6bX56CSeqmQA+4pijeV0RpsK/jEI8bcc11i9Dr7SRe2Qp12O3RCaKmoIxevxXjRFkKe7rUyecje5vWFptZqFWg68ZSpV4cANiCAwPRV8cHwcQnbmG+jkLYDN9/fZpu/0LAlifzej
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8284.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(22082099003)(56012099006)(4143699003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9I0Gww29k2lgC6WJi3h2xj6rlZE4//zDPXWdzAcLKgnIMCxFPBfAagDDEbtM?=
 =?us-ascii?Q?LSV0a/UtGQ8eQ+FN3doM0V/QWSD5osMRwmtNwNflpSg5PVRURLntuxZXaCpC?=
 =?us-ascii?Q?KRVRQJtFxJVdixS9fvkDkpW49w1TL8dT+RrsB6qf1OkPJckNcibFPKSdlRKS?=
 =?us-ascii?Q?54z/0powptQ+pLly/JTX2O3kvciSwec+1h079Boa0XIhFOUa/prNdBPuekmA?=
 =?us-ascii?Q?5YeHj3CHFidTUFwjVjKNtmkwRi7cRXKUQDijj8zILfIqB6LkX5m8p7wVKOmP?=
 =?us-ascii?Q?/E5Tr454UFdlNZ7tC58vL6NlC20FhKQg45W/ERXqtlHcJwf7G7HGmVD5cHmS?=
 =?us-ascii?Q?dFYDa7XP0p2ZSkJPDanegSrzvi1mJTyEtIlLmf4oyO/XdVJXjTJdCGf7Ld6P?=
 =?us-ascii?Q?d1euQWJg186xSHAlQMqukSj2cTdEFTmjoo0riKYUHRZkYDOUkdu0hPyol1Ic?=
 =?us-ascii?Q?smorfg4Th9Nxx0otLWQwqLVtd/4cONnm8TkDsRLT+zhjAmgU8xdb+WK+MJA/?=
 =?us-ascii?Q?PmRtRkyIm9tPcghtouRspv/oiLwKY+PqWbZlDljMZynzR3qZmSBBvBlVlJhQ?=
 =?us-ascii?Q?lDgEZ30TEuFwFBnVG2N66ifiDQPGOvJb5j47zUc1ykwhXd+KVS06AntvTRuX?=
 =?us-ascii?Q?IsheKASvgUvqvquGRP/f+EJ43/DAaTERBBL+jneQiAbFFtxSypTJdbNQigPE?=
 =?us-ascii?Q?WUXBOeXP3ONfZlBAgnA7iFJuyRZ53MRSoUt9k0gga2AG96ouZq1nR1HmYLcE?=
 =?us-ascii?Q?MqKymwAlEKv4Jr73eifINpfaKNlNxrEh6o0P7yRixeqE1SDqoLOPm0+N/yPE?=
 =?us-ascii?Q?bltdW3QELyKmycrYeuWOR/mDng6HwOrzsRatwp6ZPAI7LxdBHsLIzrRari6e?=
 =?us-ascii?Q?MTzzCb8wbfABxkqYUWOq8YNiUej3kUTDfCk1iqTTC+2L+TDzFdAJlMmrrxJB?=
 =?us-ascii?Q?3oHF2vlunLyI6KPs1lPHCl9Dc9UEVK3aN2U9f5jmmMW2ta1prFJLjL9aKPIH?=
 =?us-ascii?Q?+vZcdChi4fg/6udE7pfgQ6WoT91ENdcS33MQ1yzuHTskmRb6018VAnjnQuff?=
 =?us-ascii?Q?BwI2RQiSZEpNDupOfKYv2I1c88KVRNdH2FTJnFWWfJ01bSD0e2hlm2s3kRi3?=
 =?us-ascii?Q?duELlfM6RWb0PkKjGpVGd6aoZWjmbOLUWVoogI4otUti4u1GO2Rh+CGCWn89?=
 =?us-ascii?Q?P05e4lUw8SNb9/S6sr3o1GlP6HxCqkvgSREbVmyBDIxxaap7DREJR/2IH5r2?=
 =?us-ascii?Q?bSjVhSdazK0FyhzBiKFGDh4M8E9SOD5zcmrbpIkFViRrklOhvm1GpqCgWpPH?=
 =?us-ascii?Q?4o+gY0EKGEKzhPMzAZiupObY2JK78j7TJK4NhaOs+yMA4m+JeazxrMNA8+L/?=
 =?us-ascii?Q?m0P69l+C1V0QexVJ1NuKi0tINmhMF5ZbPeTOpQIyx/HrsXb0Fgs5xccBfWkG?=
 =?us-ascii?Q?E347WzDVAVk6d+KnQ0fL+Z8BI+/oGJXXtbITjvd63xRfKtSxC7jf+ftr05gR?=
 =?us-ascii?Q?rScQwm1H2a37b6MX0jxfSMJoTx0zrjGOGSpA1S62CQmM2DZbSrAjx8qCVm0l?=
 =?us-ascii?Q?ZhP5ygmcK23yS68LUKcU1iPOCWrecNELHA0s0w7270dmzXR53kbGE8PA/985?=
 =?us-ascii?Q?0Rsey9zDwuVh6vqDnp4WUc6nzQjOtd22yZ1B9IofNbxgNbV7fhZLKx2gcwPu?=
 =?us-ascii?Q?4L3JvacWM0xyBa1ID6pLI08KHw8m9Zx0zr7sNaA5dsStPs7SwW+DnFWYLWt5?=
 =?us-ascii?Q?H5AJdHYEag=3D=3D?=
X-Exchange-RoutingPolicyChecked: ayveQ1Jc+gZ2Q9mN8SX2HUjtqtZIq/31LsVjEAtJEREp2Ii2ksd0aPq8jW3Wnp5KgrVabkRUYy/LyPWLgzWgu9xIyjzNmVFZ8SLB2W89Z5sIoaMtxek9ouCBjVFEfZNtHivoHQeR4ISHSIx6QiddXryO0OD7EVaFQedi91oCGWjewEXcZbKqzsPoU1Jt9ibOQKXTkap+WztffLNZvLVSpSUTZQRqwYWoiKsryFHPbd4ask6kKq8iq1zYyKIamTddC7MJQ7vATlceDuflQOYVKFX7l654g4YXfc+rLefvwhDrLNXdkVGoBXfgpLuADc30ko4tBUNAhTOX2FpL5REbjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 25aacf40-9f61-44b9-6543-08decbe1a4ac
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8284.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 19:58:32.5600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9B7tpYPyZv0tzsPB/42/4acOFMwVWteA3T/JSLgfmSvh3LoKipIbflucjiZP85wzg3u9coo7OuysgWQMb1Hflw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8288
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

On Tue, Jun 09, 2026 at 05:17:38PM -0300, Gustavo Sousa wrote:
> Currently the logic to set the graphics step for non-GMDID-based
> platforms in kunit testing is defined in xe_wa_test_init().  That
> logic should rather belong to the helper xe_pci_fake_device_init(), so
> move it there.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Violet Monti <violet.monti@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c     | 3 +++
>  drivers/gpu/drm/xe/tests/xe_wa_test.c | 3 ---
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index 1baf3cd0d381..a665d5dbc472 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -388,6 +388,9 @@ int xe_pci_fake_device_init(struct xe_device *xe)
>  	xe_info_init_early(xe, desc, subplatform_desc, &probed_info);
>  	xe_info_init(xe, desc, &probed_info);
>  
> +	if (data && !data->graphics_verx100)
> +		xe->info.step = data->step;
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_device_init);
> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> index ff0e2502b39f..21601e9df353 100644
> --- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> @@ -43,9 +43,6 @@ static int xe_wa_test_init(struct kunit *test)
>  		xe_gt_mmio_init(gt);
>  	}
>  
> -	if (!param->graphics_verx100)
> -		xe->info.step = param->step;
> -
>  	/* TODO: init hw engines for engine/LRC WAs */
>  	xe->drm.dev = dev;
>  	test->priv = xe;
> 
> -- 
> 2.53.0
> 

-- 
--
Violet Monti
