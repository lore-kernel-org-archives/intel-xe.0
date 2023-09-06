Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2780FEB8FA5
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 05:07:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2CD710E1C6;
	Wed,  6 Sep 2023 05:07:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C499E10E1D5
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 05:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693976841; x=1725512841;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KhZi1OG1bRUVhrKWr0lx+pm5ODSrZlRCLOyHxUJtMRc=;
 b=CAOzqD3wZ444vx+Vy3GJeS07nxPSp1Z8uG2MSrySkxRSbZSvtlKvMMpX
 XMTkBZ/KjuK1YlcYiWRXcFPXl8UxG1E+klQ8cCrFmqexGRDWNicHy7AEl
 /raVqqCN4QL6T7uYlF4KgFi+Ck9qpMfyUOWb6RZnftjAdAIRwXl4wCfrP
 jsrVQaqLlfIxhu5PoRcK8HhOJ65FOvKq0iyk07zEGG6i+vN/JFfOcTVSb
 aLF8NYkKRmgQATSyk8iDqCKCeglNX1n4uGB9SExAt32I1iU18vEM8UF2i
 A36M1VCK4NcYk4TymCbz3x89AEUxjNqXGUheMW2AIy99Y9mLHeTA/0ctz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="356459428"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="356459428"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 22:07:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="1072254582"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="1072254582"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2023 22:07:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 5 Sep 2023 22:07:00 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 5 Sep 2023 22:06:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 5 Sep 2023 22:06:59 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 22:06:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMUpGGbkY9eAyVS266rdT8rQGEImK7SaQ6BaNuXceOhKemtTwyWM2xveeZDFyIjWZOZ26yKFBwlfm9Kpd5Le3HrYlZjebjsvw40yJhELBKcLM+KSQx3PDbeLbhV0u3zOASTva+BqLqihiSgnMtPqZKtbnWZhs1i8dzSLDdyECQ6ZfaRC/Loee2WameQ6PBU52UDkTuKhK6UYI2QaXTUuOFFsN8OPv0jx4Sj7l1Yd5s7AAljQJze7SXwpxm4ES8lAi++RZAiCkCpD0fYVfn0kPSpJh2KrznVwYZ8FpX1O8qEMTaMtUT4CSVQrvHE4+byXRfRYnNCNF0hG1rS0xW17HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5eCJETDkGYG9KDXP40V0EahpfG38OG5zcophCEHFoE=;
 b=RLfWsxBjadGWPOcdV9zxL9acP819BEF+9PaYSnNq7Y51+CTbaSjivLGq4jaDHEr0V7gTEHgjjUHzYRGO+9PjsEMCcjhzMMp4cCo31wCn/R5bb+iCQ69HT9xe4xsWsmJhxLGVJad3mySm1PWoZrKWnUy3kFIoRECa8gGSaFfH0gDAl1doDI5TkEVSZdxgWF10wBmc93GxbWT30DR/KtLKbB6RMDIZB7F7YFPenVrlEV19BQx2+kvXJfyjHwgWQzVi1WhzoFn1+p/gIBUQ34l2J/6NCf5kIQCmAq2i8kAQISEgOqlBhyEzHLRqrQHrY22UJE4X35PA9FhTWAElp2745g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6824.namprd11.prod.outlook.com (2603:10b6:806:29e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 6 Sep
 2023 05:06:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 05:06:57 +0000
Date: Wed, 6 Sep 2023 05:05:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZPgIoc9lVNGdlFrT@DUT025-TGLU.fm.intel.com>
References: <20230901142629.4125-1-thomas.hellstrom@linux.intel.com>
 <20230901142629.4125-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230901142629.4125-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0154.namprd05.prod.outlook.com
 (2603:10b6:a03:339::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: d58c7bba-0244-4901-023d-08dbae9717d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IDPYwr5lT1sO6OcOpWPcHuLB4Dvf8DgttywtmiAjXJRI0D1Rh3WiwhdaqvSSdaFiotQY59DiKobHig6urLM+MaGBYkbxyohVWnKvugD53rTIoHlQ7h6cQChcRmQf5cpp1dYmtf04I0/5aLqXpynn9cWV6KAWyKslUHl9Cgld4BgHGWBzVlMyPXMphcUub1lAD4htiQ6RtPG3JeyPwgz2R/TDoCedWBya1o8GCBz2XUQzRtKu0mzRzNIzUVsuIL4faMGLetva0VuyAJYqiMAjBb/KAm6pnqGFX2oDKa2QF9f/KJRMXhYUJxLJ6u/xG7Nf2sf3a9gUisUxQQA0/cDrKZs4a4JeTkEU+ciIXXJ1EgMklss8Md2HEQ0rwBmWFm3hy0cJIvoErNxbH8HMcYZAROE9PaPQQVut5K0iPW9t0JRKsdgx/rq6+7ru7GWK3Ico7YXclwMAhvY+jLDpPKR+N6YC+uGE0EJMZWh26c2YYTh/upJ2OVYJmOIDKfaU3EKRBp7RKVCcjaygkCSra44odQUqqGPUvNWlXFo+LtNG8Q9IAt4jzADyDstX/81keuAa++g9eVf7B7iYnocs/q9V1bNzqrL8SbbBZV2DE6mIEsV0HdOeED7y0jAlRvgxVKJa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199024)(186009)(1800799009)(66946007)(6916009)(66476007)(2906002)(316002)(66556008)(82960400001)(30864003)(38100700002)(478600001)(86362001)(66574015)(8676002)(4326008)(8936002)(5660300002)(6486002)(6506007)(41300700001)(44832011)(26005)(6512007)(6666004)(83380400001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RYWNU67gfOIx5hSStbzCVJwPNLJjeMhFMKB05lph0Cx7hqq9gX5kWrE5TU?=
 =?iso-8859-1?Q?bzZaut0XMCZSZfLZtFyp8397wG/dfn9nH8h4cNuNHJphHPF3KLs6QSUPdd?=
 =?iso-8859-1?Q?tjN25Yv0Z5vr4087IB/asoUXqzH7vwVaSow1A9F3lGHmBEPVQJZ9Fj69Fw?=
 =?iso-8859-1?Q?klPiAkyG1iD63dsquaozghaJbPJlW2TRzDlo5nHLd5PuM3No39T8uhGgnk?=
 =?iso-8859-1?Q?Qf2eLzBLReSrv2UN2xQm0taQHRA6ZL9rlOaI4tQ4On/mehTfMf5JPzlBLj?=
 =?iso-8859-1?Q?GBf0weraDxAZdJFXJUv33d/skhuzqbKqbu4c1PTa7g0pQGyfCIjZfFCtB7?=
 =?iso-8859-1?Q?NrH2GVQTuRLBIkUjuhCCFocnzdfmeprpXZXpzBEPsDK3qWWeIBxUWKwjU5?=
 =?iso-8859-1?Q?B3ZFGFfe/FzuAXSPO2Qxd8FED98pwzLq+ln4ofu09Bcbr6KuR7BTpywCj8?=
 =?iso-8859-1?Q?6lmsZWvrU5Ir1WXPrl2bcggT3hcXWmwFUkTk8Q+Nf2K8sOnBiMYlQFmGBl?=
 =?iso-8859-1?Q?knyz9Rmk8HOBiMZWhPCqwoCYDaLJJZZyRRpf0fUhG/dD8pDpoOIQN6MTjt?=
 =?iso-8859-1?Q?+aGqPqwDFtAhnWTSowW1B+6qrvlohlyttBJMzDSYUlp9rFcr1rsaooYl5n?=
 =?iso-8859-1?Q?LuOawdFILysjUog6/TYWTGtyGZ1yMQGboPST8K7f+YiSXorktowujmRcpo?=
 =?iso-8859-1?Q?HX0vBkun6MqB3Ah2fvogfe8T15ZuS5KDlatROLg+tLUJdmiDNXRMXqQKm4?=
 =?iso-8859-1?Q?x0eHzziTuRe1G+A1Gq1C5XFf2DZUqGp7yBRzP98zsKI6kK7OCvkWkmHE43?=
 =?iso-8859-1?Q?L3GW/eFM3aUOQcXDo7yg5j8+DRZXYtbFB/PR9rOANYCD0rGpwF6TYPSI+0?=
 =?iso-8859-1?Q?+aaCty7D9KFglfuD1SLLDBotk03l2rJfQTbWpduiUqChotsX4YtomDESut?=
 =?iso-8859-1?Q?3GV+kqxtup+cR0NdtL0r3/6PO71KrZUNPKu2a0578yTA1FZJ9CAz1Ktbmj?=
 =?iso-8859-1?Q?VNsfqqpwq1moqO4AHcifTOSzkeCElVPEtYGpB3udRrlakZZeC3hRDMrftp?=
 =?iso-8859-1?Q?gVT0QrtGi1mwgv4eEIERY1q8/LSe+Cqudd7XYaZAeIfpFwGZp5QF/qqYfW?=
 =?iso-8859-1?Q?gzXKlJGGWGe831Ob8ZOhyqgUSZZMZXIx/xBUKH0UOd/AfUAqnPK+SETW94?=
 =?iso-8859-1?Q?29dviiAAXl27OJhAStmXkg/CLhkB6dj+7bAVyNMy5AwKEls6muNUtnSYSM?=
 =?iso-8859-1?Q?lLq2BZR0NF+1KhCY2DuLrBM6zy3llezWVxec4K4rxyW6wC4JON4x80tSzt?=
 =?iso-8859-1?Q?9PZ6zB75r4zwaglM5IJAembTMAYIm12KosqEcG56zAdd9jEDPo5GB8+hfz?=
 =?iso-8859-1?Q?apmqIISLfOGUEQaqmFxlPF6rJSDno62EU9QYqfQmcMr6jQ2yBLOLdXh59a?=
 =?iso-8859-1?Q?HEtk7+hfULpJIH/vFXeFJsBFarKrMGbI5GmVYOJQBzHAAkK2UhIo7+8Mct?=
 =?iso-8859-1?Q?Ce4j5CFuaWxzupGQbu9Rd88xyi1KrXkVVOQCReXhQzK1H/Jmd0rOOGP1Sq?=
 =?iso-8859-1?Q?5OQHO7GV3+N5Cp2a/BPPYWkQDiO88oPpFtdTtLUwjxRL3ocyrynvUMftd/?=
 =?iso-8859-1?Q?tLEJ8EJaJTpr/ULuMgiDYh7hJMo6nZWBHg4vsUX8jL+knBOc8s6d4RAw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d58c7bba-0244-4901-023d-08dbae9717d8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 05:06:57.2143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gz/Zwbkb2vADXW97qMeTj68b5AVUCTjczjcb4RFvJVIR/IWUuqf1S+R1qPDUzuJCnCUQ994hAe62QFGCkuIfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6824
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 1/6] drm/xe/bo: Simplify xe_bo_lock()
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

On Fri, Sep 01, 2023 at 04:26:24PM +0200, Thomas Hellström wrote:
> xe_bo_lock() was, although it only grabbed a single lock, unnecessarily
> using ttm_eu_reserve_buffers(). Simplify and document the interface.
> 
> v2:
> - Update also the xe_display subsystem.
> v4:
> - Reinstate a lost dma_resv_reserve_fences().
> - Improve on xe_bo_lock() documentation (Matthew Brost)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_display.c |  5 +--
>  drivers/gpu/drm/xe/tests/xe_bo.c             | 24 +++++------
>  drivers/gpu/drm/xe/xe_bo.c                   | 43 ++++++++++++--------
>  drivers/gpu/drm/xe/xe_bo.h                   |  5 +--
>  drivers/gpu/drm/xe/xe_bo_evict.c             | 19 ++++-----
>  drivers/gpu/drm/xe/xe_gt_pagefault.c         | 41 +++++++------------
>  drivers/gpu/drm/xe/xe_vm.c                   | 27 ++++++------
>  drivers/gpu/drm/xe/xe_vm_madvise.c           | 30 ++++++--------
>  8 files changed, 91 insertions(+), 103 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index d6b481f33b45..9df8081f78d9 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -6938,11 +6938,10 @@ static int i915_gem_object_read_from_page(struct xe_bo *bo,
>  	void *virtual;
>  	bool is_iomem;
>  	int ret;
> -	struct ww_acquire_ctx ww;
>  
>  	XE_WARN_ON(size != 8);
>  
> -	ret = xe_bo_lock(bo, &ww, 0, true);
> +	ret = xe_bo_lock(bo, true);
>  	if (ret)
>  		return ret;
>  
> @@ -6959,7 +6958,7 @@ static int i915_gem_object_read_from_page(struct xe_bo *bo,
>  
>  	ttm_bo_kunmap(&map);
>  out_unlock:
> -	xe_bo_unlock(bo, &ww);
> +	xe_bo_unlock(bo);
>  	return ret;
>  }
>  #endif
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index b32a9068d76c..31fd4f9b2d5b 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -203,9 +203,9 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>  			goto cleanup_bo;
>  		}
>  
> -		xe_bo_lock(external, &ww, 0, false);
> +		xe_bo_lock(external, false);
>  		err = xe_bo_pin_external(external);
> -		xe_bo_unlock(external, &ww);
> +		xe_bo_unlock(external);
>  		if (err) {
>  			KUNIT_FAIL(test, "external bo pin err=%pe\n",
>  				   ERR_PTR(err));
> @@ -268,9 +268,9 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>  					   ERR_PTR(err));
>  				goto cleanup_all;
>  			}
> -			xe_bo_lock(external, &ww, 0, false);
> +			xe_bo_lock(external, false);
>  			err = xe_bo_validate(external, NULL, false);
> -			xe_bo_unlock(external, &ww);
> +			xe_bo_unlock(external);
>  			if (err) {
>  				KUNIT_FAIL(test, "external bo valid err=%pe\n",
>  					   ERR_PTR(err));
> @@ -278,28 +278,28 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>  			}
>  		}
>  
> -		xe_bo_lock(external, &ww, 0, false);
> +		xe_bo_lock(external, false);
>  		xe_bo_unpin_external(external);
> -		xe_bo_unlock(external, &ww);
> +		xe_bo_unlock(external);
>  
>  		xe_bo_put(external);
>  
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, false);
>  		__xe_bo_unset_bulk_move(bo);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo);
>  		xe_bo_put(bo);
>  		continue;
>  
>  cleanup_all:
> -		xe_bo_lock(external, &ww, 0, false);
> +		xe_bo_lock(external, false);
>  		xe_bo_unpin_external(external);
> -		xe_bo_unlock(external, &ww);
> +		xe_bo_unlock(external);
>  cleanup_external:
>  		xe_bo_put(external);
>  cleanup_bo:
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, false);
>  		__xe_bo_unset_bulk_move(bo);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo);
>  		xe_bo_put(bo);
>  		break;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6a8a41dafe88..a3ddd6575793 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1079,13 +1079,11 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
>  
>  	if (bo->vm && !xe_vm_in_fault_mode(bo->vm)) {
> -		struct ww_acquire_ctx ww;
> -
>  		XE_WARN_ON(!xe_bo_is_user(bo));
>  
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, false);
>  		ttm_bo_set_bulk_move(&bo->ttm, NULL);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo);
>  	}
>  }
>  
> @@ -1863,26 +1861,37 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>  	return 0;
>  }
>  
> -int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
> -	       int num_resv, bool intr)
> +/**
> + * xe_bo_lock() - Lock the buffer object's dma_resv object
> + * @bo: The struct xe_bo whose lock is to be taken
> + * @intr: Whether to perform any wait interruptible
> + *
> + * Locks the buffer object's dma_resv object. If the buffer object is
> + * pointing to a shared dma_resv object, that shared lock is locked.
> + *
> + * Return: 0 on success, -EINTR if @intr is true and the wait for a
> + * contended lock was interrupted. If @intr is set to false, the
> + * function always returns 0.
> + */
> +int xe_bo_lock(struct xe_bo *bo, bool intr)
>  {
> -	struct ttm_validate_buffer tv_bo;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> +	if (intr)
> +		return dma_resv_lock_interruptible(bo->ttm.base.resv, NULL);
>  
> -	XE_WARN_ON(!ww);
> +	dma_resv_lock(bo->ttm.base.resv, NULL);
>  
> -	tv_bo.num_shared = num_resv;
> -	tv_bo.bo = &bo->ttm;
> -	list_add_tail(&tv_bo.head, &objs);
> -
> -	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> +	return 0;
>  }
>  
> -void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww)
> +/**
> + * xe_bo_unlock() - Unlock the buffer object's dma_resv object
> + * @bo: The struct xe_bo whose lock is to be released.
> + *
> + * Unlock a buffer object lock that was locked by xe_bo_lock().
> + */
> +void xe_bo_unlock(struct xe_bo *bo)
>  {
>  	dma_resv_unlock(bo->ttm.base.resv);
> -	ww_acquire_fini(ww);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 0823dda0f31b..a7b9e7084225 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -149,10 +149,9 @@ static inline void xe_bo_assert_held(struct xe_bo *bo)
>  		dma_resv_assert_held((bo)->ttm.base.resv);
>  }
>  
> -int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
> -	       int num_resv, bool intr);
> +int xe_bo_lock(struct xe_bo *bo, bool intr);
>  
> -void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww);
> +void xe_bo_unlock(struct xe_bo *bo);
>  
>  static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> index 0d5c3a208ab4..49c05ddea164 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -27,7 +27,6 @@
>  int xe_bo_evict_all(struct xe_device *xe)
>  {
>  	struct ttm_device *bdev = &xe->ttm;
> -	struct ww_acquire_ctx ww;
>  	struct xe_bo *bo;
>  	struct xe_tile *tile;
>  	struct list_head still_in_list;
> @@ -62,9 +61,9 @@ int xe_bo_evict_all(struct xe_device *xe)
>  		list_move_tail(&bo->pinned_link, &still_in_list);
>  		spin_unlock(&xe->pinned.lock);
>  
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, false);
>  		ret = xe_bo_evict_pinned(bo);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo);
>  		xe_bo_put(bo);
>  		if (ret) {
>  			spin_lock(&xe->pinned.lock);
> @@ -96,9 +95,9 @@ int xe_bo_evict_all(struct xe_device *xe)
>  		list_move_tail(&bo->pinned_link, &xe->pinned.evicted);
>  		spin_unlock(&xe->pinned.lock);
>  
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, false);
>  		ret = xe_bo_evict_pinned(bo);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo);
>  		xe_bo_put(bo);
>  		if (ret)
>  			return ret;
> @@ -123,7 +122,6 @@ int xe_bo_evict_all(struct xe_device *xe)
>   */
>  int xe_bo_restore_kernel(struct xe_device *xe)
>  {
> -	struct ww_acquire_ctx ww;
>  	struct xe_bo *bo;
>  	int ret;
>  
> @@ -140,9 +138,9 @@ int xe_bo_restore_kernel(struct xe_device *xe)
>  		list_move_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
>  		spin_unlock(&xe->pinned.lock);
>  
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, false);
>  		ret = xe_bo_restore_pinned(bo);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo);
>  		if (ret) {
>  			xe_bo_put(bo);
>  			return ret;
> @@ -184,7 +182,6 @@ int xe_bo_restore_kernel(struct xe_device *xe)
>   */
>  int xe_bo_restore_user(struct xe_device *xe)
>  {
> -	struct ww_acquire_ctx ww;
>  	struct xe_bo *bo;
>  	struct xe_tile *tile;
>  	struct list_head still_in_list;
> @@ -206,9 +203,9 @@ int xe_bo_restore_user(struct xe_device *xe)
>  		xe_bo_get(bo);
>  		spin_unlock(&xe->pinned.lock);
>  
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, false);
>  		ret = xe_bo_restore_pinned(bo);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo);
>  		xe_bo_put(bo);
>  		if (ret) {
>  			spin_lock(&xe->pinned.lock);
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index b6f781b3d9d7..73fc9389a663 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -171,20 +171,18 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  
>  	/* Lock VM and BOs dma-resv */
>  	bo = xe_vma_bo(vma);
> -	if (only_needs_bo_lock(bo)) {
> -		/* This path ensures the BO's LRU is updated */
> -		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
> -	} else {
> +	if (!only_needs_bo_lock(bo)) {
>  		tv_vm.num_shared = xe->info.tile_count;
>  		tv_vm.bo = xe_vm_ttm_bo(vm);
>  		list_add(&tv_vm.head, &objs);
> -		if (bo) {
> -			tv_bo.bo = &bo->ttm;
> -			tv_bo.num_shared = xe->info.tile_count;
> -			list_add(&tv_bo.head, &objs);
> -		}
> -		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
>  	}
> +	if (bo) {
> +		tv_bo.bo = &bo->ttm;
> +		tv_bo.num_shared = xe->info.tile_count;
> +		list_add(&tv_bo.head, &objs);
> +	}
> +
> +	ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
>  	if (ret)
>  		goto unlock_vm;
>  
> @@ -227,10 +225,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	vma->usm.tile_invalidated &= ~BIT(gt_to_tile(gt)->id);
>  
>  unlock_dma_resv:
> -	if (only_needs_bo_lock(bo))
> -		xe_bo_unlock(bo, &ww);
> -	else
> -		ttm_eu_backoff_reservation(&ww, &objs);
> +	ttm_eu_backoff_reservation(&ww, &objs);
>  unlock_vm:
>  	if (!ret)
>  		vm->usm.last_fault_vma = vma;
> @@ -534,28 +529,22 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>  
>  	/* Lock VM and BOs dma-resv */
>  	bo = xe_vma_bo(vma);
> -	if (only_needs_bo_lock(bo)) {
> -		/* This path ensures the BO's LRU is updated */
> -		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
> -	} else {
> +	if (!only_needs_bo_lock(bo)) {
>  		tv_vm.num_shared = xe->info.tile_count;
>  		tv_vm.bo = xe_vm_ttm_bo(vm);
>  		list_add(&tv_vm.head, &objs);
> -		tv_bo.bo = &bo->ttm;
> -		tv_bo.num_shared = xe->info.tile_count;
> -		list_add(&tv_bo.head, &objs);
> -		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
>  	}
> +	tv_bo.bo = &bo->ttm;
> +	tv_bo.num_shared = xe->info.tile_count;
> +	list_add(&tv_bo.head, &objs);
> +	ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
>  	if (ret)
>  		goto unlock_vm;
>  
>  	/* Migrate to VRAM, move should invalidate the VMA first */
>  	ret = xe_bo_migrate(bo, XE_PL_VRAM0 + tile->id);
>  
> -	if (only_needs_bo_lock(bo))
> -		xe_bo_unlock(bo, &ww);
> -	else
> -		ttm_eu_backoff_reservation(&ww, &objs);
> +	ttm_eu_backoff_reservation(&ww, &objs);
>  unlock_vm:
>  	up_read(&vm->lock);
>  	xe_vm_put(vm);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 9cbf2f63d641..8462f6321351 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -267,13 +267,16 @@ static void arm_preempt_fences(struct xe_vm *vm, struct list_head *list)
>  static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
>  {
>  	struct xe_exec_queue *q;
> -	struct ww_acquire_ctx ww;
>  	int err;
>  
> -	err = xe_bo_lock(bo, &ww, vm->preempt.num_exec_queues, true);
> +	err = xe_bo_lock(bo, true);
>  	if (err)
>  		return err;
>  
> +	err = dma_resv_reserve_fences(bo->ttm.base.resv, vm->preempt.num_exec_queues);
> +	if (err)
> +		goto out_unlock;
> +
>  	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link)
>  		if (q->compute.pfence) {
>  			dma_resv_add_fence(bo->ttm.base.resv,
> @@ -281,8 +284,9 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
>  					   DMA_RESV_USAGE_BOOKKEEP);
>  		}
>  
> -	xe_bo_unlock(bo, &ww);
> -	return 0;
> +out_unlock:
> +	xe_bo_unlock(bo);
> +	return err;
>  }
>  
>  /**
> @@ -1021,12 +1025,11 @@ bo_has_vm_references_locked(struct xe_bo *bo, struct xe_vm *vm,
>  static bool bo_has_vm_references(struct xe_bo *bo, struct xe_vm *vm,
>  				 struct xe_vma *ignore)
>  {
> -	struct ww_acquire_ctx ww;
>  	bool ret;
>  
> -	xe_bo_lock(bo, &ww, 0, false);
> +	xe_bo_lock(bo, false);
>  	ret = !!bo_has_vm_references_locked(bo, vm, ignore);
> -	xe_bo_unlock(bo, &ww);
> +	xe_bo_unlock(bo);
>  
>  	return ret;
>  }
> @@ -2267,7 +2270,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			 u32 operation, u8 tile_mask, u32 region)
>  {
>  	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
> -	struct ww_acquire_ctx ww;
>  	struct drm_gpuva_ops *ops;
>  	struct drm_gpuva_op *__op;
>  	struct xe_vma_op *op;
> @@ -2325,11 +2327,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  	case XE_VM_BIND_OP_UNMAP_ALL:
>  		XE_WARN_ON(!bo);
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, true);
>  		if (err)
>  			return ERR_PTR(err);
>  		ops = drm_gpuva_gem_unmap_ops_create(&vm->mgr, obj);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo);
>  		if (IS_ERR(ops))
>  			return ops;
>  
> @@ -2365,13 +2367,12 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  {
>  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
>  	struct xe_vma *vma;
> -	struct ww_acquire_ctx ww;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
>  	if (bo) {
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, true);
>  		if (err)
>  			return ERR_PTR(err);
>  	}
> @@ -2380,7 +2381,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  			    op->va.range - 1, read_only, is_null,
>  			    tile_mask);
>  	if (bo)
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo);
>  
>  	if (xe_vma_is_userptr(vma)) {
>  		err = xe_vma_userptr_pin_pages(vma);
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index c9bc59be5094..05081fa0fbed 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -28,16 +28,15 @@ static int madvise_preferred_mem_class(struct xe_device *xe, struct xe_vm *vm,
>  
>  	for (i = 0; i < num_vmas; ++i) {
>  		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
>  
>  		bo = xe_vma_bo(vmas[i]);
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, true);
>  		if (err)
>  			return err;
>  		bo->props.preferred_mem_class = value;
>  		xe_bo_placement_for_flags(xe, bo, bo->flags);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo);
>  	}
>  
>  	return 0;
> @@ -53,16 +52,15 @@ static int madvise_preferred_gt(struct xe_device *xe, struct xe_vm *vm,
>  
>  	for (i = 0; i < num_vmas; ++i) {
>  		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
>  
>  		bo = xe_vma_bo(vmas[i]);
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, true);
>  		if (err)
>  			return err;
>  		bo->props.preferred_gt = value;
>  		xe_bo_placement_for_flags(xe, bo, bo->flags);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo);
>  	}
>  
>  	return 0;
> @@ -89,17 +87,16 @@ static int madvise_preferred_mem_class_gt(struct xe_device *xe,
>  
>  	for (i = 0; i < num_vmas; ++i) {
>  		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
>  
>  		bo = xe_vma_bo(vmas[i]);
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, true);
>  		if (err)
>  			return err;
>  		bo->props.preferred_mem_class = mem_class;
>  		bo->props.preferred_gt = gt_id;
>  		xe_bo_placement_for_flags(xe, bo, bo->flags);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo);
>  	}
>  
>  	return 0;
> @@ -112,13 +109,12 @@ static int madvise_cpu_atomic(struct xe_device *xe, struct xe_vm *vm,
>  
>  	for (i = 0; i < num_vmas; ++i) {
>  		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
>  
>  		bo = xe_vma_bo(vmas[i]);
>  		if (XE_IOCTL_DBG(xe, !(bo->flags & XE_BO_CREATE_SYSTEM_BIT)))
>  			return -EINVAL;
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, true);
>  		if (err)
>  			return err;
>  		bo->props.cpu_atomic = !!value;
> @@ -130,7 +126,7 @@ static int madvise_cpu_atomic(struct xe_device *xe, struct xe_vm *vm,
>  		 */
>  		if (bo->props.cpu_atomic)
>  			ttm_bo_unmap_virtual(&bo->ttm);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo);
>  	}
>  
>  	return 0;
> @@ -143,18 +139,17 @@ static int madvise_device_atomic(struct xe_device *xe, struct xe_vm *vm,
>  
>  	for (i = 0; i < num_vmas; ++i) {
>  		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
>  
>  		bo = xe_vma_bo(vmas[i]);
>  		if (XE_IOCTL_DBG(xe, !(bo->flags & XE_BO_CREATE_VRAM0_BIT) &&
>  				 !(bo->flags & XE_BO_CREATE_VRAM1_BIT)))
>  			return -EINVAL;
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, true);
>  		if (err)
>  			return err;
>  		bo->props.device_atomic = !!value;
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo);
>  	}
>  
>  	return 0;
> @@ -174,16 +169,15 @@ static int madvise_priority(struct xe_device *xe, struct xe_vm *vm,
>  
>  	for (i = 0; i < num_vmas; ++i) {
>  		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
>  
>  		bo = xe_vma_bo(vmas[i]);
>  
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, true);
>  		if (err)
>  			return err;
>  		bo->ttm.priority = value;
>  		ttm_bo_move_to_lru_tail(&bo->ttm);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo);
>  	}
>  
>  	return 0;
> -- 
> 2.41.0
> 
