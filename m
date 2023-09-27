Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42708E82CC9
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 19:44:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC6A10E5A3;
	Wed, 27 Sep 2023 19:44:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9995510E5A3
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 19:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695843890; x=1727379890;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nnjyJj6xUYZfVngqN4pM/hRQ5je65DrUZp3Rk41NCKM=;
 b=hxGnk3/xEf1GmwVoP5PBqgdGFDIN7g9389gdiiEVrdzHv2yeZWPDFHau
 HIOaNLjtxcdqQ79CydRDqAKN1HQFD1YvLRUXK7mCLimDWhxxxGOw3xRfn
 ZGO/yUpS0zya8Lf9TPqpyEHc7Bk2bi64gv66IPDAdLcQvEeI3a2Ql59I5
 sMRh1JX9RiGZYle/JQyReDh71JAxClyVuZ/d9jnISLy7WrZxQX/29UnLe
 XA9CEeLhaIlHOAoAsu0AH9Gbu8HprGTCvlZyERtg5fp40SKzhm4MxjAh9
 XzrVjuPSBEWCE2h2GJxTdOuq0cKSHQXOf4N0VU+OuWHieh5oEJIfyGnM8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448404865"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="448404865"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 12:44:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="699006961"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="699006961"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 12:44:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 12:44:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 12:44:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 12:44:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRCVhw9+uj25ZqtjfHmhZgqu57+oPEFNQiyZJY8Z8bMVrYtkBD54gpfyHpDF8ji3tu0Sif9QUzvKzhkZt17ocfpXPJ0599T5LIwGbeOtLMn8nKbPSpOgafYL2kAwdlgzDPbGXAmfhLwMUQE8BZxSvk0HErW8hP2p0+XlHvq/i95lBu3N4+8+9qXW7BtJ0CopiTRx4pT7DQ91LNbHgAX7L1XzC4H4mTNjBIGYn/KCmcL5/xS7b8N/AC/KSFo+DgSlq8i4WuXbDVda+fIoQ6Bp01j0ehSymDojvO250XASoql8sp6V9JIPZ5er7p0eeRBYRaNnIhqySQbdkZzMYlDJyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QgaUrdoeMF5xbTuRGbK84jIjlVNlMxQ0r9W/LEiRT8=;
 b=fGu36HZ1JYKWVIoU+zSTzZCBe15bHbVd06LlCrfE1s0MmzVb2HXrujWdhAdJLtu7FsAMoSvtIoHA6nsRxEuzoGcXWelkp3QCs0/rAP2c3YlUlC81s6YUeDrZaA7SU2DB1AcNswn8fFNEtciJdKxVrHrtF+3r5gDMhPtlXdqNYglMKiVkLeUSSOgm/AoxqBTOSsHcCQyiYloaXSRYdhhg7JGRXmCpzdD2KxzPZxr7ztFdxuH2fCkbZo97rLQct6Rb9aL3dDwtOXtKEr9xJfjbAWZpfhVc+TrU7AbSVvDi3kD8AraS8XQUTYDCwJyXHuk4O5/FwovX3xPxTI0pfOR3Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB7552.namprd11.prod.outlook.com (2603:10b6:510:26a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 19:44:46 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Wed, 27 Sep 2023
 19:44:45 +0000
Date: Wed, 27 Sep 2023 12:44:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230927194442.GC2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230927193902.2849159-1-lucas.demarchi@intel.com>
 <20230927193902.2849159-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230927193902.2849159-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0290.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::25) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f24642-ee23-4bd8-0493-08dbbf92335e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RHCt3U2wzr+IaWbjBmVy4BV7OIqAh/M3/XXCWVA7W4N8ZylDY3B6r6kjCyn5ngNicadfwHTFTAh5ag0cVtXYyo97mC3YeRYehpXX5RqRtXIiaP/nTLJcHLAzk6QAxVGZ2xs2vjltNtgfhS8DSJfSQ2fS3hkpRuDlsgaIEVBMzaNhaVA8DUsHzw4LvKeUwUCkxbL5eS/MCOwvLeP2Kt6svL04zl/07WHpPh6pDts9bHtMWPJEGU7wlZuZ4tY12zsymcJ6MRW95ie2n+zgMZ1WSoZTTFN9DVQ5c0pBqvssD2VSm41aUGO+tbzjhKnKJYdfKvmgEHfM+arKxJWFuh4Tm2T/OmdCTY4jFPbPECezOp6aJ8oqAt9HsxvmIO+4qLi26z4vmaFTYhQX99br2SvhZtpaKOC0kDuYoYP3dUY/R/CsvTQhPiUzwASmRzeBdX4iOlFKcp+2iTu1ZTgUr3SXsWya9TOyw5ZtJhYrUE4XQFvYU7OTDMr+Xmz9RbTzy91do9OhkvFC69Ymw1T5Rt1Af+SW5j3kWHPIRNp1q5j6fLZOSVcdaJkkep80NmJlDCvU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(376002)(396003)(366004)(230922051799003)(1800799009)(186009)(451199024)(83380400001)(6666004)(38100700002)(82960400001)(478600001)(1076003)(26005)(6512007)(6486002)(6506007)(33656002)(86362001)(2906002)(6862004)(5660300002)(4326008)(107886003)(8936002)(8676002)(66946007)(66556008)(66476007)(54906003)(316002)(6636002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zp5P5S3+1cFzARcIcv+GWzbGKxkL/shNk5qTwEuLA33gxOSphE8gHYqwMSxu?=
 =?us-ascii?Q?bFI9edAkPfwBe8gAm9YRA/VKnNEd7hMQ8217awKM8Dvk3Tft4GLIo7lEK2WW?=
 =?us-ascii?Q?5G1V7/i/YCvTyeCUPc8Yd2PS7irpjL1T2PY/dHCxvHDsipj7KcnnfP0Swaef?=
 =?us-ascii?Q?PjyuY4+F+t4Vf2oVTs//hqjaO8UKzo1y5ej4EfadKu56Sh00XqkBp9aOW5Lb?=
 =?us-ascii?Q?8+cV7//Ht0vfcwhFxW7hLCQLFg4wzAFG3PYMCBaZNLmGyFKbHJRfPjeuoAMO?=
 =?us-ascii?Q?cvQ+zgtWZChkHROhTdvGydhtUzacFRJwvnTVj48jvkGUIsvRsIXOCuexQSvz?=
 =?us-ascii?Q?GixcneB+A7r+4E9hIRu6ZZMxWqnFsevU2nLGVcW5JylT5W2ozqIMBYe2ygv1?=
 =?us-ascii?Q?9GjR8iaAU8uxFt+1Bh0duP+7w28gWT3ZiEGNDxvTqm1o+j3SFbeX3IR+Ui3r?=
 =?us-ascii?Q?mx0nQEKy9uZYryl4Bubd3htI1kN1PTAhFqocMaM2H9br4omvnJZu7Jlh+bLO?=
 =?us-ascii?Q?iOX9F3o5TLbJR/FOg4EfMLblU0BaO8IX6Ig9l+W7N72JhE8RAyaXMkqAjnmv?=
 =?us-ascii?Q?cT1jEyUQZkRxgyIDoBEv4AydORto4x64Wclmk0ewM/H8/6xSisS3i3cwwWQx?=
 =?us-ascii?Q?ZAWyqNqfWfSe4bGCdlLA7d9INFrrot7B8H036GCrYP+FjkOagf4wHbczeHxN?=
 =?us-ascii?Q?nnyhDobT/90lTuuxEQMsylPRwOtVjpsEi3ofnBdnWvccoed6KJpaXzgYoZlm?=
 =?us-ascii?Q?pl1kDnUooDjaDoaRlB7/3V9UKie4aDDTGZhl0Ggxd7PhgsNw0MEg3kWMD5s3?=
 =?us-ascii?Q?A1h/SGFHk8FXmkoBySchjVTYdB+u52OvR2VjGsGhGRm8xdOyoLTYRyDcjn8R?=
 =?us-ascii?Q?fvPJnxFfAJ78Sh0YAp2iCECYwz+2/meGdmy/7bUZdprXfTQSUZ2JditLDMph?=
 =?us-ascii?Q?febgVKCtqGPe2P5SkJfrTDL7S6AhtMBScJF/hRH/gLpyc20TgaX6xXeHz2HQ?=
 =?us-ascii?Q?5nqrAvA0+bp3+buTYKkrYww12NW8Xh7QwaW2WpjnNKbvLLpTYpJ5yfTc/yNw?=
 =?us-ascii?Q?TW5d8Y0Wscc9gXe7Gix66Auw/3PutZCpQnfSQ2hBBOM7SiSbhEkEKdSHtcsH?=
 =?us-ascii?Q?idPqDDaWP/L0UWNYFqs/zgwWlxWeBRjONEWbmDLdiTpsOXqS5ZkhUZcPnmW2?=
 =?us-ascii?Q?keG25Oz+Wffm8VK6s/Ej7sziKiqQosFvsCu6ryEShQAXh+VajuzwL2rgbfhN?=
 =?us-ascii?Q?ZE1Uzcevzu/KwcgDYpGhyrt8VOnr1FEgh3/fC+2RoLzBCX2lEXLELOsy/8t8?=
 =?us-ascii?Q?bbWIOAqL6WeKmjaaskjYoWfAZgYr2NqV3/zztVbmCC/RnxAV47ChtF5gu/hf?=
 =?us-ascii?Q?kJ5CSnfAhrRbiQ2cutzwnImUy2vWjq9fzyaNYesyMBth9Spp5JWuaA9LzVf+?=
 =?us-ascii?Q?9Xr0tGS3PC+AS77YRcsHIQWFMbe12lVXezDu4vz5Cg9Yv26bcSBHHJ1nhIqA?=
 =?us-ascii?Q?tkQ3OQMxBaO4Po8+HDbGcAbIJe2MHDj+OFhoFURn3D59Noen5V9HNRc2/n3Z?=
 =?us-ascii?Q?MuPSLASpWYoYoN1U3kBdCwifCp4jmrGMtuA+UzpOQgNA4fydu+mgFqB9biJm?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f24642-ee23-4bd8-0493-08dbbf92335e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 19:44:45.7759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zv++8pwcCGuPTe+rsoza3V1N1lhbiKSuaaxckmEm8LaK5lbQQFHQD5w8M24LPqmJ14sqqIYEe5FkKs5Sm8QGhgVhnnUgLG80azCg6LWMTzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7552
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 06/11] drm/xe/dg2: Fix using wrong PAT
 table
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Sep 27, 2023 at 12:38:57PM -0700, Lucas De Marchi wrote:
> DG2 should use the MCR variant to program the PAT registers, like PVC,
> but shouldn't use the same table as PVC.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pat.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 28f401c500d8..a4bebdedbbd9 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -108,10 +108,18 @@ void xe_pat_init_early(struct xe_device *xe)
>  		xe->pat.ops = &mtl_pat_ops;
>  		xe->pat.table = mtl_pat_table;
>  		xe->pat.n_entries = ARRAY_SIZE(mtl_pat_table);
> -	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
> +	} else if (xe->info.platform == XE_PVC) {
>  		xe->pat.ops = &dg2_pat_ops;
>  		xe->pat.table = pvc_pat_table;
>  		xe->pat.n_entries = ARRAY_SIZE(pvc_pat_table);
> +	} else if (xe->info.platform == XE_DG2) {
> +		/*
> +		 * Table is the same as previous platforms, but programming
> +		 * method has changed.
> +		 */
> +		xe->pat.ops = &dg2_pat_ops;
> +		xe->pat.table = tgl_pat_table;
> +		xe->pat.n_entries = ARRAY_SIZE(tgl_pat_table);
>  	} else if (GRAPHICS_VERx100(xe) <= 1210) {
>  		xe->pat.ops = &tgl_pat_ops;
>  		xe->pat.table = tgl_pat_table;
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
