Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E20FC83F2F
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 17:12:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E185610E0EF;
	Thu, 31 Aug 2023 17:12:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A472B10E0EF
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 17:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693501930; x=1725037930;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vazyjZSIWFnfemogZPcEx2nRYQDYci4imGYY1jgxs+E=;
 b=hCGywsdWwqGhBElFHUOsnYCGgQJBKIhzJNOkjBrBpqnFKuNyBx4GS7EA
 4fFyInpM0hr1n88gFCsn4ntjvTTS95qJWMQz2rZKiS+qNdw8UoGV9k2DE
 CjVLRCUkabm0xE9Yf2wCF5Dxh3IZhsKIUFX7giJcymYckBNqoqMxDy0Iv
 STwsED7jYEWvhMhfN8RW+o0clSrJNVhZ8NejwqfyRhR34dECEbIm80FSx
 OswKi6GURiLq6WsRl2wRhDjX6cvgYubxl+hxlZLS7zRSVzO2wBYcL/baZ
 MZoq0i0MsDo0XqaOCJqIokD+ZIzQ6O9sBUP3zGmj7LBNP01GJUhMk0XxE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="356322243"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="356322243"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 10:11:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070388661"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="1070388661"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 10:11:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 10:11:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 10:11:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 10:11:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 10:11:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1AWcWUYArzBAEyFEUpJvdQ8LhebjKImm0JPUv0U/xN0SbtcWem/kpHlvBIoMCujiTQmItvEjN1mFS+ajgYpr9YR2Fxp8LysDD99SOQzipOxOvO49cJ0KaStB24ORGkOfGH9noi3kuqUNsC5Q++A4XoRELFdLKUp4X1uFja2w4nc+JzybnGagCHoiPwlg6cofyaN90s6WdHeQqYxLkBVgkHMMXYBfB9h2PMv2kULq/N/PsMdYcapvnAXGYGjcnfr7MhL9M6RYvuN0t7bma1g9wFwOO0s5ESiTRfNSdVIHh+0tqB3pauc+i9V6RdvQuvFNUSsQwVDkj5ZWQilkQX/eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTcE8nVgwx9Sw6MO9/k/oCGalWg0MmJych8TdGOqq0U=;
 b=fxNGrKmThmnQRERnIrmLeIubqx7wAlu5WfMzWuA1VKeoLego/xfAsr3aVacqIOc+4poEU5ZyaIDXE19QvESlRQbljutZCGFHmryT/07GTd8eCdIfN1ZvnPy9SU79x4iyfBb7cVq4Ej1HrE11akUDgfM5YbvxM/0fIldqHssn6raAXMcNjGrNR86y4j/ga2iv6BKUt0HmOH978bKVDlHtYE8hyxQ8d/zvmW+1vTo6as+DAPrdeWrFeb+BxPBBz3tMXoqzhSDlQk1XSlJl5vvxB1PGTwOTYbU5GomHwcEJgu3f0R7WMrpfyX3F0L0A8pD3xuibmIEDzXlPlsvcVODTBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4636.namprd11.prod.outlook.com (2603:10b6:303:5a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 17:11:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.022; Thu, 31 Aug 2023
 17:11:35 +0000
Date: Thu, 31 Aug 2023 17:10:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZPDJiLBGL+qEK/Hy@DUT025-TGLU.fm.intel.com>
References: <20230831092937.2197-1-thomas.hellstrom@linux.intel.com>
 <20230831092937.2197-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230831092937.2197-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0117.namprd05.prod.outlook.com
 (2603:10b6:a03:334::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4636:EE_
X-MS-Office365-Filtering-Correlation-Id: 45a56dc7-da2c-412a-c210-08dbaa4554c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 19dnfp7kGvlMjoUkqgYhwbgWeacnqXRSWGemj1bEDOZEieBNWaXBWDuj3AmzrGOyTIGpgeT3Nzzts03oWa3by6ZxhGF6BddFw4xea7l7nBavCdo2CCmXzwBLlpPcetm/RoqJrf/upiA5oz12JtCkbNJ6RWSsOGMmV6qkPJTdgLWRk9Of8ZI+9B2BhANQsrmKOhu/5SeiVRCJzG7WQ1pr3XbytBNZH5Bjcb6SkDsTzZW4/flJAZokYXQzfU3nrBqQaH0v0NxGNF5ZzEWrF3zzhZJwwMp3MtR0H3bXK84/i+3dHRpj9bW2WdotZQn91myie6Fm+N8xqFOAmxlR3Cv0bTtqM1YuNUKTppdT6ZuPA7zMmfXt/W0gLtE++bTa+mtalVnCDC7AsFly8EKwebeoPoBPzhW6CBcBqloS9fjqUycwY4DjLdGPZlwGFzIWV9zyhacBjdcL8EIloD5Wey1ov9bDIwyE6GnQ5BKLwSOzOZHoqHO9zB66fKcZIp1dA15/oZ/0nRveIQ26MO8lk4YL5cUg5QBzrJhVDXq8ONFl63E574U60O393Fv6up70y/aR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199024)(1800799009)(186009)(41300700001)(8936002)(8676002)(4326008)(5660300002)(44832011)(6486002)(6506007)(6512007)(6666004)(66574015)(83380400001)(26005)(82960400001)(66946007)(66476007)(66556008)(316002)(6916009)(2906002)(86362001)(478600001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?U/YobbR6/L3ufQxIVhJ21wrQQepiPWMWENrskkz4hM9yDoT4OROhSXy0vY?=
 =?iso-8859-1?Q?/d+OuwhNqTb+bDPKbWR9+hg/2iFKc8TNubmwaf+blHuNuiU2GtFKfQnbKg?=
 =?iso-8859-1?Q?hgNcf5zHXXt0gdgX0HgEpiKIWRJjCAwaqFjn2+UX1c3ZOJxRW4k1sGKogl?=
 =?iso-8859-1?Q?qORyTmNvLDDL7oTfczEumo+KqHyZ9sayzdsMjq8S0YHHFw6nE1J4kgtlFy?=
 =?iso-8859-1?Q?pNyv16s6Tx2tQcvHHEUTpq3xbBmTxGm0SS5PtwyoK+bdxJl23I8ao69W0g?=
 =?iso-8859-1?Q?7z3eQQ5/YRZBjfjLH4i1Y6PIQv6w2h1yOPAHvFmecYVVzEbGhkkPj4nfNE?=
 =?iso-8859-1?Q?hxJCZNNw2aQrZ4J+ScFmKv6YXHQQTVQJZ8MhxFD8dhwNeKdVIwdY5SJorr?=
 =?iso-8859-1?Q?Oe9/NxsUqbQHq38R4qVFCzAxMcKl2L4zJFDMTLsnuhOlOmDbWjmnXUG6uq?=
 =?iso-8859-1?Q?CCx0vNZ4sD8QgSCWpuTwbALhwVatgVfiwvx62HkfwwHM7HGBxdU646t21v?=
 =?iso-8859-1?Q?z0Q6N/4cfNQLH8VViuv01n1c+5A6n34/Bue33fsxHpSIGtVXaE2CsavO3z?=
 =?iso-8859-1?Q?zikQaeLepUuuVwLVgtt61Ct/WXRNDx6TzRvPDyLH8zn8m+yCTNSzg7LLGg?=
 =?iso-8859-1?Q?u7ZJQuc18WbQ0Vq24XLl4Y7fR6fNpYdQUm0nt/UKAF5n5qMJtBG6WHce3Y?=
 =?iso-8859-1?Q?VdTw+Sx69zEngIrzB9+cby39SWz4hSyFQt4MmwAIXXKgpI60Pc0GKeW0Rm?=
 =?iso-8859-1?Q?bFcJEwsBzPmuNzIkGMsnEP3TD/QtT0/yzZxrPQgFEGlH2uYLG/LXlSV7OO?=
 =?iso-8859-1?Q?FJSuEGW5Al8xQK4frdr8Grcdr86gREpkL4/iekeiudO16wDhj8rWbzfknR?=
 =?iso-8859-1?Q?8roFdA5iwmPx1FuqEOfBO4g7KlJr/6E0z4MW3h0w73Mu9F9m1mtsyScCd6?=
 =?iso-8859-1?Q?o5reHyapKxBILe654sk5FcOhv55IlvcJd4lqMCsE9txJHuLh+7Wq502RPA?=
 =?iso-8859-1?Q?2ysqDcaOxmF2ahcRJuGBnv38qZsBOZIj8kOXJCWBdPlo8tRZfFh3RbhuIv?=
 =?iso-8859-1?Q?07KWV+XYUr8gNJvd4cwxnJqLo0Z3OcKnBepNrWueq2W0qyfVIho+t/4089?=
 =?iso-8859-1?Q?UNBZkTzMawS3SPONxBRQzotJ4HaffBwHRqKu8RB5DvAvFjA22l4+rYI7Im?=
 =?iso-8859-1?Q?xFaA4aF1ccptCu++y3jRtjS3+Vr6Ll0HZkLh6N5AzUcFADJRdHQBRplKk0?=
 =?iso-8859-1?Q?iSFGnvJqoFZTGhvFE3ucHrHUzwoQEM33sIXJxUtNhU8x6oamdDbb53/FWl?=
 =?iso-8859-1?Q?Y/0bveMg0DsnAs94xTULlf1nX3qmnqZvAMDosUtjiW+vBHH8IKg4+oYkCm?=
 =?iso-8859-1?Q?aPksoPJu1mgJco5dQtmHo8/0fMDuvefHnTWwVzC2gLt+0ceEgF9/pfgMRK?=
 =?iso-8859-1?Q?Emi/epiTMWU1e3ZxVHevHKs3OD1RXWpWYAEovommq3969wHoI3sOYH01zz?=
 =?iso-8859-1?Q?pIfo07nENWWIGwMejKg9hGJI9Tlrotttf6uhTfmRdyGj9GdN+RDGbDUz8d?=
 =?iso-8859-1?Q?hywXvu0RV7m1Fb1ZZpCjWywadcAfAeoepL3/rPO/Ue9zam/hTB6clQ7CHD?=
 =?iso-8859-1?Q?RIFJzk5who3+0x8qEpG3EY3qE1nxsOHPG2ARmGhIxuEpRn/aWn0Ue/sA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a56dc7-da2c-412a-c210-08dbaa4554c4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 17:11:35.7015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aYdkGayOiOCYPGG8lSrs2NlKSZDl59VB6tJGk0Jo/aCdLs/NE+1O7buCRVAM1iCOek6Gmvu7vB4zma3eGIjMAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4636
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 3/6] drm/xe/bo: Remove the
 lock_no_vm()/unlock_no_vm() interface
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Aug 31, 2023 at 11:29:34AM +0200, Thomas Hellström wrote:
> Apart from asserts, it's essentially the same as
> xe_bo_lock()/xe_bo_unlock(), and the usage intentions of this interface
> was unclear. Remove it.
> 
> v2:
> - Update the xe_display subsystem as well.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_fb.c |  4 ++--
>  drivers/gpu/drm/xe/tests/xe_bo.c        |  2 +-
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c   |  4 ++--
>  drivers/gpu/drm/xe/tests/xe_migrate.c   |  2 +-
>  drivers/gpu/drm/xe/xe_bo.h              | 23 ++---------------------
>  drivers/gpu/drm/xe/xe_dma_buf.c         |  5 +++--
>  drivers/gpu/drm/xe/xe_lrc.c             | 10 ++--------
>  7 files changed, 13 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index e0bac4cf3f4b..f5a96b94cfba 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -1892,9 +1892,9 @@ static void intel_user_framebuffer_destroy_vm(struct drm_framebuffer *fb)
>  		struct xe_bo *bo = intel_fb_obj(fb);
>  
>  		/* Unpin our kernel fb first */
> -		xe_bo_lock_no_vm(bo, NULL);
> +		xe_bo_lock(bo, false);
>  		xe_bo_unpin(bo);
> -		xe_bo_unlock_no_vm(bo);
> +		xe_bo_unlock(bo);
>  	}
>  	xe_bo_put(intel_fb_obj(fb));
>  #endif
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index c6025404042d..acc5ad01baaf 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -143,7 +143,7 @@ static void ccs_test_run_gt(struct xe_device *xe, struct xe_gt *gt,
>  	ret = ccs_test_migrate(gt, bo, true, 0ULL, 0ULL, test);
>  
>  out_unlock:
> -	xe_bo_unlock_no_vm(bo);
> +	xe_bo_unlock(bo);
>  	xe_bo_put(bo);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index 513a3b3362e9..1c3f4bc72b99 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -148,14 +148,14 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
>  			int err;
>  
>  			/* Is everything where we expect it to be? */
> -			xe_bo_lock_no_vm(import_bo, NULL);
> +			xe_bo_lock(import_bo, false);
>  			err = xe_bo_validate(import_bo, NULL, false);
>  			if (err && err != -EINTR && err != -ERESTARTSYS)
>  				KUNIT_FAIL(test,
>  					   "xe_bo_validate() failed with err=%d\n", err);
>  
>  			check_residency(test, bo, import_bo, dmabuf);
> -			xe_bo_unlock_no_vm(import_bo);
> +			xe_bo_unlock(import_bo);
>  		}
>  		drm_gem_object_put(import);
>  	} else if (PTR_ERR(import) != -EOPNOTSUPP) {
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 8bb081086ca2..f58cd1da1a34 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -183,7 +183,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
>  
>  	xe_bo_vunmap(sysmem);
>  out_unlock:
> -	xe_bo_unlock_no_vm(sysmem);
> +	xe_bo_unlock(sysmem);
>  	xe_bo_put(sysmem);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index a7b9e7084225..9097bcc13209 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -164,25 +164,6 @@ static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
>  	}
>  }
>  
> -static inline void xe_bo_lock_no_vm(struct xe_bo *bo,
> -				    struct ww_acquire_ctx *ctx)
> -{
> -	if (bo) {
> -		XE_WARN_ON(bo->vm || (bo->ttm.type != ttm_bo_type_sg &&
> -				      bo->ttm.base.resv != &bo->ttm.base._resv));
> -		dma_resv_lock(bo->ttm.base.resv, ctx);
> -	}
> -}
> -
> -static inline void xe_bo_unlock_no_vm(struct xe_bo *bo)
> -{
> -	if (bo) {
> -		XE_WARN_ON(bo->vm || (bo->ttm.type != ttm_bo_type_sg &&
> -				      bo->ttm.base.resv != &bo->ttm.base._resv));
> -		dma_resv_unlock(bo->ttm.base.resv);
> -	}
> -}
> -
>  int xe_bo_pin_external(struct xe_bo *bo);
>  int xe_bo_pin(struct xe_bo *bo);
>  void xe_bo_unpin_external(struct xe_bo *bo);
> @@ -197,9 +178,9 @@ static inline bool xe_bo_is_pinned(struct xe_bo *bo)
>  static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>  {
>  	if (likely(bo)) {
> -		xe_bo_lock_no_vm(bo, NULL);
> +		xe_bo_lock(bo, false);
>  		xe_bo_unpin(bo);
> -		xe_bo_unlock_no_vm(bo);
> +		xe_bo_unlock(bo);
>  
>  		xe_bo_put(bo);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 975dee1f770f..09343b8b3e96 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -153,9 +153,10 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>  	if (!reads)
>  		return 0;
>  
> -	xe_bo_lock_no_vm(bo, NULL);
> +	/* Can we do interruptible lock here? */
> +	xe_bo_lock(bo, false);
>  	(void)xe_bo_migrate(bo, XE_PL_TT);
> -	xe_bo_unlock_no_vm(bo);
> +	xe_bo_unlock(bo);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 434fbb364b4b..6f899b6a4877 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -790,15 +790,9 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  void xe_lrc_finish(struct xe_lrc *lrc)
>  {
>  	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
> -	if (lrc->bo->vm)
> -		xe_vm_lock(lrc->bo->vm, false);
> -	else
> -		xe_bo_lock_no_vm(lrc->bo, NULL);
> +	xe_bo_lock(lrc->bo, false);
>  	xe_bo_unpin(lrc->bo);
> -	if (lrc->bo->vm)
> -		xe_vm_unlock(lrc->bo->vm);
> -	else
> -		xe_bo_unlock_no_vm(lrc->bo);
> +	xe_bo_unlock(lrc->bo);
>  	xe_bo_put(lrc->bo);
>  }
>  
> -- 
> 2.41.0
> 
