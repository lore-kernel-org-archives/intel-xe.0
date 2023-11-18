Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F19C072A2
	for <intel-xe@archiver.kernel.org>; Sat, 18 Nov 2023 00:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E3D10E037;
	Sat, 18 Nov 2023 00:15:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CC410E027
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Nov 2023 00:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700266514; x=1731802514;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=o9sbAT9Bqr8Pt25k1U8+itD6URYRp4lGdz1NyFATKj4=;
 b=j+Mgeb+xnc94sQ32GFlJ6nQtY84OeSFRqoovfxwy/B6M6g5muOVNAZin
 gNyv+MQM2/Hmpoz6lTRzNuAXn7iP+LhR/QnxtYdgGkaUlOaBcr6otoRax
 OYMckUARlgwTc65mr1curjjtHlt66D+0yU60NjcnZUzQ0CW3Ybrqfft9y
 l0fGYZEx0KJyPP4x4AUjnlOVhNXUAMpcdfHYQ8y0zgbyFNZ26cpPbTUtp
 MZBz1i4FTvljBCfT3ERzPl9C/k8PdhTltHfWb8k+bSwNqd9dHzeF4EhpY
 2TEXJhpNE552hZ8Rnzy6gnZBbGsfwTQyyJusVdMpht7WX/CN7O3jGFtSl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="376439379"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="376439379"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 16:15:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="742226903"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="742226903"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 16:15:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 16:15:12 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 16:15:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 16:15:12 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 16:15:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLTpz8UoiaMlCsGvLav8Y+0M3srYrVXZZuNiBMh29dtE9u5KcRWwQ/uiw7pR/EldDT1rke+3wPepUy/YiVamPNbVnXgNqfocM9qXsIaeqFX/rvd21aMpic71RkDblMOqyasbux57PiwbxozGOvqQ11GGbAmWTNNJHfsIHsy5FBmp2Tq++kUwMvx/U065FjbTn9oX8aCJrkZGliNTlt38W55FJaQu8AVnBNuPuKhsDepcqqADKlTZ7oO4rmM8jATjV+ZbhAlLNlHilsxVeg3dXhLe4z4OIGVO0Akgn6GdV/emWWtMM+tELcDau+a55m+t7VmeFpYTh1sDOJdGHQNaSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5vW+sHNMFU4tM68qs5bQZYXq95ugSGJuX7gxcheWMU=;
 b=euYs5QKCjNr/tl759nW7NsbzvFkLeyeGv/NVIMxZhbtI8ZGaR5M/FwpINX4lAo3CaL7tXd7CjWMfmwbnrWF9jCHBpWLOldIvJ+E+YB8ruB64jyevYINDQJW/QsPaEO07jz+CicGqfm7/Iw6uCqGqWRcydTX8Gx2SP3U7w4OMQyJo4z9T5L2tkDYQbEO8/tnuETiRFFIOn+UHHYZ2iJOmo1mi3R9ckk581KHoUy4vEZ2w68FYILWwBpc3wUhiCdN3eG0c9ZfchuCvrhUdEECQLWyJH5AIdFbAdy3iqZHEGkBtlBLpvdzS9m1wxYxSHqHhHtCH9oCc/JoolyHYJKk9FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by SA2PR11MB5179.namprd11.prod.outlook.com (2603:10b6:806:112::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Sat, 18 Nov
 2023 00:15:10 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::706b:7540:497b:14aa]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::706b:7540:497b:14aa%7]) with mapi id 15.20.7002.022; Sat, 18 Nov 2023
 00:15:10 +0000
Date: Fri, 17 Nov 2023 16:15:07 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231118001507.GD1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231117231411.631895-1-lucas.demarchi@intel.com>
 <20231117231411.631895-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231117231411.631895-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:a03:331::20) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|SA2PR11MB5179:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c1fbe21-f466-4e12-90ff-08dbe7cb6d2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G93bsGs+4sZBUmuR5GVl3PkfaAGgQPF6o28Vwom1pNLGA4am4Q4Ind5yLEdLbFoZY0G0YCThd6NsE8oHK0FpIHwG31RZKXGfFudKo6u5DBoN5docB0s15KMj2NYXGyLny9CiqAMH+4jU0RSCf8SRcDCqX6pLekxFRKg6dZsLDrCoa0zFdiRtW4eJV1YqWlChmdmlCL/L0btvO5rQMk2D4WjULiQANrXwo/eiJuxCe1H1TXoB2lmAPWALxmzudlj773hkHSA91D5edFazqneRry9KWmGy9TBJ7gMs4f6KJ7Gl/xFUIWgtaUTvR6cxow3I4QkSsKW04qsQdFBtES1CtXvmZDaMK9i1xbpwg9y+ZmrlxUeirNs1KZcpaE1KjABO8Nh6jZ3x5KdQP1fQSDFQlNDrn6gCnAOdWy+HkU2gJt/+psdcK0WLi1q80CYyFQeLnenxp9PPR8FLyjWL2DBNdTU1EmqeRb8nuygL1G1IEOP6Mlx7ygHhOh0kcy8GG63NkFLdr5DAIasrZKVsCPWj7l2QTnEkiN/zWBI7XRjGewNz5eP5ZN49x/v84Pjhliai
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6512007)(82960400001)(6862004)(1076003)(107886003)(26005)(6486002)(478600001)(66476007)(86362001)(4326008)(66556008)(8936002)(5660300002)(33656002)(8676002)(2906002)(41300700001)(6636002)(66946007)(316002)(6666004)(6506007)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W1B7VGfixaTtMp5WhG3OwlsV9pHNTzXdtdrAHsiClW6K/q5k/hh89cAn1lng?=
 =?us-ascii?Q?6H0VhCz3FxNiiT71YOIvTaM145BgdnnIgMtryv9WuLDls4y5Yeu7NxYJ7Hq5?=
 =?us-ascii?Q?tWQP3xXQgVkfhQgOAYpjZUcJTf2ailgkIxOJ0f0ZzOOrUksJ67gXSyW+MWZk?=
 =?us-ascii?Q?WIEoilGbypE77wWcNcfA4Zkg2VXQo39EaOLMkldX9WmFBaU83R+fvKOC4N1H?=
 =?us-ascii?Q?AgmAL1+2X40MMa2lag4k7rFzG8OJ5fNhXFylmYy0EYOnrb0nWU1LfB6eCqYd?=
 =?us-ascii?Q?lV8eaLTcoce2YVNsp7YX12vOjbSWIluYU55d1LJCPUUjOqueJjY5I4yQlwX5?=
 =?us-ascii?Q?14r/Hg6vDwYDYJOC8nq+Hqf0DXa3QVk1uvVvCg5rzGxyslJFmi5+4Uue/FrW?=
 =?us-ascii?Q?1DxbbAbmdQzsf5f5if5FxQC0Vn2YFByrUJbrf9ci/WYyMks/dM2IvkFvdVfA?=
 =?us-ascii?Q?aaSACdSyQFaREgxuDNunW1JzkNnI8+r4exCTvosAzSXrwHugoLjYMcvPf8L8?=
 =?us-ascii?Q?su8qKMwBN7OThfFmb5ljjbYiYr0QQdC+y0OLK3I/jZiGB9gkW+1RENAowQAY?=
 =?us-ascii?Q?GIGTLFYI8KvgeLKtZPCOhS16Uo9iSz/lNznowXW5N9PoGvWrEYxQXPMIwQRb?=
 =?us-ascii?Q?09XduUpi806+B9dKNjA9bhJF9dsnfLQUo1ch/acRmW1UR3d+EaA/3Ww+VdA0?=
 =?us-ascii?Q?HV4H72LlwhqXyrit/IwKgHs909ndz1tfUPsaJSvvshuILENQQM9rNkJnhwrV?=
 =?us-ascii?Q?H/0wHAa98izCGo6rzyeYwtqmQIXGtmFfyplZVp53yLobV2If+6RMbM9eti0y?=
 =?us-ascii?Q?0fsoXYRxRoAO5Da3r8zsceZx726000joeQISI+UQq1JJWIhavAmn8nMqCvFo?=
 =?us-ascii?Q?UaOLy+N/ooDxp0+Bd781rDsaSjNFge1QBydxA/+q007v/eVS3c2xrPTtUdMe?=
 =?us-ascii?Q?zsOrU02yKQ/YTszym8pipJnEaTGE4tNyXDWjucmP5hCHbVS+KWT02YBM2yGq?=
 =?us-ascii?Q?QReXfO9LrxE68QOErUno9MR+dhDK4GtXFAMCkXLdvQe3wdS8IXm1uvyEww48?=
 =?us-ascii?Q?+/A0Z28dxZS01vWjlUTj2J+R3zNsTP5HL9Rrmqeywfa3VxrZQ9Chn20SirhX?=
 =?us-ascii?Q?9b7PkaEZbTgr9nV27GPI+ymgeV/opGEuRZTUD8i4/Go78IwbMMIjME+Mrdbe?=
 =?us-ascii?Q?khvHqZvETLp22kSx2i9JUe9+/sVcZFS6a148pGgFIkCJdCwolrkAQkNNaTLu?=
 =?us-ascii?Q?J/J3cCkWaBBAm7bAVzsdARJXuKNX4QPHoa+8dKuhx9bqBXOsJ79QvcOKEXse?=
 =?us-ascii?Q?I9jCUZhc3gQH4aF3I5rkLVcSrGvQja3vcnBZp4z+J8p/3gQT+vHXn0khI98+?=
 =?us-ascii?Q?fEAPNpyfHosT2vGKmHexKiAXaFOAu+FqXuzfvyZs7+qQ9N2FIdJMwJYdZk0r?=
 =?us-ascii?Q?LJy/ndjzqqEgExmCWC1GJq9DD+2Nr0Ukbpm1Poa5WmJgsuYfD/ytEUz6cP33?=
 =?us-ascii?Q?Gxdy8gsMTbh4XYCZJKO/n0klGy4dKV6mPnSX35Y5BDD7mG8eU5yg8Hmp1Ook?=
 =?us-ascii?Q?APLZs6m9TgzvVqmVlC4o23SEbZqg0zEPuQ8x0Zuu3+8TrznGy7ibvKffQU+f?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1fbe21-f466-4e12-90ff-08dbe7cb6d2e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2023 00:15:10.0400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: akmvk3yrcIm0YGdmZDxmLPsFWhkrUVukmPG0mSXjQjuCIOP0h4MHeLKzctomXsSx9u6+QbNdFLFltkTise0+pqZpLlVsMJT3We9Hcrim6/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5179
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe/kunit: Move fake pci data to
 test-priv
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Nov 17, 2023 at 03:14:09PM -0800, Lucas De Marchi wrote:
> Instead of passing as parameter to xe_pci_fake_device_init(), use
> test->priv to pass parameters down the call stack. The main advantage is
> that then the data is readily available on other functions by using
> kunit_get_current_test().
> 
> This is a preparation to fix the initialization of fake devices when
> they were supposed to be using GMD_ID.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_pci.c      | 16 +++++++++-------
>  drivers/gpu/drm/xe/tests/xe_pci_test.h | 17 +++++------------
>  drivers/gpu/drm/xe/tests/xe_rtp_test.c |  4 +++-
>  drivers/gpu/drm/xe/tests/xe_wa_test.c  |  7 ++++++-
>  4 files changed, 23 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> index a40879da2fbe..d1bc029f7a13 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -7,6 +7,7 @@
>  
>  #include "tests/xe_test.h"
>  
> +#include <kunit/test-bug.h>
>  #include <kunit/test.h>
>  #include <kunit/visibility.h>
>  
> @@ -106,14 +107,15 @@ void xe_call_for_each_media_ip(xe_media_fn xe_fn)
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_media_ip);
>  
> -int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
> -			    enum xe_subplatform subplatform)
> +int xe_pci_fake_device_init(struct xe_device *xe)
>  {
> +	struct kunit *test = kunit_get_current_test();
> +	struct xe_pci_fake_data *data = test->priv;
>  	const struct pci_device_id *ent = pciidlist;
>  	const struct xe_device_desc *desc;
>  	const struct xe_subplatform_desc *subplatform_desc;
>  
> -	if (platform == XE_TEST_PLATFORM_ANY) {
> +	if (!data) {
>  		desc = (const void *)ent->driver_data;
>  		subplatform_desc = NULL;
>  		goto done;
> @@ -121,14 +123,14 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
>  
>  	for (ent = pciidlist; ent->device; ent++) {
>  		desc = (const void *)ent->driver_data;
> -		if (desc->platform == platform)
> +		if (desc->platform == data->platform)
>  			break;
>  	}
>  
>  	if (!ent->device)
>  		return -ENODEV;
>  
> -	if (subplatform == XE_TEST_SUBPLATFORM_ANY) {
> +	if (data->subplatform == XE_SUBPLATFORM_UNINITIALIZED) {

Is this case possible with any of our current tests?  It doesn't look
like it is.

Anyway,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  		subplatform_desc = desc->subplatforms;
>  		goto done;
>  	}
> @@ -136,10 +138,10 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
>  	for (subplatform_desc = desc->subplatforms;
>  	     subplatform_desc && subplatform_desc->subplatform;
>  	     subplatform_desc++)
> -		if (subplatform_desc->subplatform == subplatform)
> +		if (subplatform_desc->subplatform == data->subplatform)
>  			break;
>  
> -	if (subplatform != XE_SUBPLATFORM_NONE && !subplatform_desc)
> +	if (data->subplatform != XE_SUBPLATFORM_NONE && !subplatform_desc)
>  		return -ENODEV;
>  
>  done:
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> index cc0f1d141a4d..b4b3fb2df09c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
> @@ -12,13 +12,6 @@ struct xe_device;
>  struct xe_graphics_desc;
>  struct xe_media_desc;
>  
> -/*
> - * Some defines just for clarity: these mean the test doesn't care about what
> - * platform it will get since it doesn't depend on any platform-specific bits
> - */
> -#define XE_TEST_PLATFORM_ANY	XE_PLATFORM_UNINITIALIZED
> -#define XE_TEST_SUBPLATFORM_ANY	XE_SUBPLATFORM_UNINITIALIZED
> -
>  typedef int (*xe_device_fn)(struct xe_device *);
>  typedef void (*xe_graphics_fn)(const struct xe_graphics_desc *);
>  typedef void (*xe_media_fn)(const struct xe_media_desc *);
> @@ -27,11 +20,11 @@ int xe_call_for_each_device(xe_device_fn xe_fn);
>  void xe_call_for_each_graphics_ip(xe_graphics_fn xe_fn);
>  void xe_call_for_each_media_ip(xe_media_fn xe_fn);
>  
> -int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
> -			    enum xe_subplatform subplatform);
> +struct xe_pci_fake_data {
> +	enum xe_platform platform;
> +	enum xe_subplatform subplatform;
> +};
>  
> -#define xe_pci_fake_device_init_any(xe__)					\
> -	xe_pci_fake_device_init(xe__, XE_TEST_PLATFORM_ANY,			\
> -				XE_TEST_SUBPLATFORM_ANY)
> +int xe_pci_fake_device_init(struct xe_device *xe);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> index b2beba0019cd..5610051591e7 100644
> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> @@ -281,7 +281,9 @@ static int xe_rtp_test_init(struct kunit *test)
>  					       drm, DRIVER_GEM);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
>  
> -	ret = xe_pci_fake_device_init_any(xe);
> +	/* Initialize an empty device */
> +	test->priv = NULL;
> +	ret = xe_pci_fake_device_init(xe);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	xe->drm.dev = dev;
> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> index 6e1127b276ea..9185e520af58 100644
> --- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
> @@ -75,6 +75,10 @@ KUNIT_ARRAY_PARAM(platform, cases, platform_desc);
>  static int xe_wa_test_init(struct kunit *test)
>  {
>  	const struct platform_test_case *param = test->param_value;
> +	struct xe_pci_fake_data data = {
> +		.platform = param->platform,
> +		.subplatform = param->subplatform,
> +	};
>  	struct xe_device *xe;
>  	struct device *dev;
>  	int ret;
> @@ -87,7 +91,8 @@ static int xe_wa_test_init(struct kunit *test)
>  					       drm, DRIVER_GEM);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
>  
> -	ret = xe_pci_fake_device_init(xe, param->platform, param->subplatform);
> +	test->priv = &data;
> +	ret = xe_pci_fake_device_init(xe);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
>  	xe->info.step = param->step;
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
