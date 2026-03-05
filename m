Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E80F47CB9
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 19:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2E610EC63;
	Thu,  5 Mar 2026 19:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U7i8UFGR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F1910EC63
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 19:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772738397; x=1804274397;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VK8U2w27UXVz28M7+1Y8GylK4T3ylotSLN6HqraswBw=;
 b=U7i8UFGRJHIcIipptrms7rE7FTvD2YKbtDXN0P4T60EMiNyPl1399uEp
 fmfw8134XjKYo4uLdGZLTmuv4ZIeWLleDViwsGcBN/UavkuUtGp2U8ToL
 1JurwGwSjg6e/Yb5QAnhWCEvaylMt7tn+ye0w/dHmNIcUfm98qdIa3jPy
 G173w8Vji80YdsdowlrujvVVxV5AE3Tf9Kda+FUcckyrtdidBMRbUxOfg
 c8XloJVwMzXV4LUNuHBzdJXYRCqqiujLqyUl4l4SXzXnCVv7zHsshgo/I
 ouPJYXPmFuEXkt5ZrG72sbAZGH6CfdSlhL5rxw1M4/wXzE/1cKNLFToRF Q==;
X-CSE-ConnectionGUID: xa+qU11GQhaBchOowU5rAg==
X-CSE-MsgGUID: O2Gd3w+VQCyI5I1C7HXCnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77685160"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="77685160"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 11:19:55 -0800
X-CSE-ConnectionGUID: x790N236SqqD8+R3a4nEvA==
X-CSE-MsgGUID: mA1EpuCJSou/asLrVonZ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="223474743"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 11:19:55 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 11:19:54 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 11:19:54 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 11:19:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lz+aBH1WMlO/oOSmNIJx51tvyH/wNuEyayHn6t7M4g5ERHXClyUvwLb/kCb2rplQq6QWqyG51PgAr9EKPbZuU/Ngx1ZpZkmTbwgCFinPP0Y8DD0Jg5kPKYLDcMIRMoDZJe0xt1kkU+FHnF3A4vT6/RJlzINaBnnJWtnmoE82+LKcSTbtcyjWPpILigPbPplAdonfvUi2BmgfdML2FVyiqRZrzAnUG+4F64Nj5xLPDQjw177180D1G2viLY5mj80RTthu2mn6MmLEv9rY9HVasOZk8vp8T18qhqOe6XQjm10hBV2f3JO7pmKEgt1qKNkR+MpzfwJE0iXyQRvTlqjTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iFuwm8tN7ERNkI0GtrI8ix9sS34NvV1FXt23M0mIj0=;
 b=zHhim35s4xvT3ZU7Gi7cyS94nQquoqO1yuszBgXJhrK3MZQqJ9vNo21XZqmgI6m759qgP7BgYKZnNovDTtnoT5Q1Du10Jtk5lnPQ45OtmtsCtnuYXVJdux1DvFlicqxj4baNeUmshQAkdkb40IF28Om7xwllo6N4BjETnyrKXzsAwCucF6IJl8kX/B7/D9UQ8EY7KUf7DojpI++mJqB7p/j2c0VA0kES4zKQr+Kum+UzhwNw9MwH5v5NGZq5gSZh1DEMoauObc+5zGtvA6n0rGeHV04x05GtPqHhFfCXpWgbRkRGptm/YNJ+seoSgHTeb/34X4P/XGgJjGsqxd4yEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH3PPF5D8CD6E8B.namprd11.prod.outlook.com (2603:10b6:518:1::d25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 19:19:51 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 19:19:51 +0000
Date: Thu, 5 Mar 2026 14:19:43 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [v5] drm/xe: Allow per queue programming of
 COMMON_SLICE_CHICKEN3 bit13
Message-ID: <aanXT8gDwVQOXt2I@intel.com>
References: <20260304075529.1250065-1-lionel.g.landwerlin@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304075529.1250065-1-lionel.g.landwerlin@intel.com>
X-ClientProxiedBy: RI1P284CA0134.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:10:158::10) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH3PPF5D8CD6E8B:EE_
X-MS-Office365-Filtering-Correlation-Id: a586ab13-330c-4ec4-8fdf-08de7aec2cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: hPMvaZsRDxjCY+DB+JsXqJo1ZYk2Vx5VY+tEpnPyAxnFw0iF5c2B5vnd2mTZaOjZz2FXNMItXVVRVeNSSGkVtAqvupnGLYJb1RVtpKpAY26wX+EGuFzbLsZL+DFagqPtiHNzaNbaNYOFt061F2t5lzrWIip8BP1F0A6EF122DPX4BeyT+/nTSvRmWoxyOfcoUhVAhPCguQy+XuLgOHhc+CQQjIP6V7cWM/jsKi7wvdZHmJ/COaZshCTBOBggjgS9Kw5cOZcH2mVLsJT2v0szs9e1bCtYcNW3uMlME8nIQowxqAeKiiH6B1vC4Gka5aC/zbks+SaQnTVLaUs85YL6KGON6i0lcYTMMoQkenscdNqIFjI9WqqczVjlgXs4nwUbw0NLF6cJFMcVPcvkRHoAyX1NOiMCFUz/S35bpAVaFysTduXhr3UPEE/Kyv+HAD4NGpOk5vhxPFN0Goa+mwX4/1/KRVtc05/p7PX3Os3DhHigagqRHWtTqga67XgsZIoIsT7yGjgFS+XjQ8pu5Imiqmb9u3OCEIYvgAwZEwqEZ7K3f7+V+lNyOd61FKuQ/1Vey+wxQF4+R0cxxF7J79JuL0MRHjYfN7SGNxNLLTak7GeiDDT8Av3aev2RyASOVrTDMNCokWFbF+ywxwjQFfR3ZOK89PyXtymp/Pleug62qtyslnPZlJcx8jRKXVB+n9SseR5DMrU83RLFonkSQ3fuT/udYD0WcE6qiEtjUZpg/io=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUxCL2RhSmdBWjV2TlpEbjNSdjBtQlZCK2kwbFFJclp5UlFjNUM3R0hDVzZS?=
 =?utf-8?B?by9MV2o1VHlkWWc1Z3EyVUZ3N0ZIVVk2dEdIQ05BSVBDWFhLcXg1NHpHRk9V?=
 =?utf-8?B?QnUxSnlDNEt1NmdsZ2ZrVEg2SmQ1R1VZMUtmalZDd1htNkl3eDJEMFJGNHAy?=
 =?utf-8?B?MkFkT3ZHZGZuNU50SXEwNVIxdVZaa2E3WVQxanA3SzYwcmRJMUVTd2NVVEVI?=
 =?utf-8?B?SzBDK1BjUWZJS1RaTlJLMFU0SXlMY0ZNQVlWTGp3M0pCT2tLZWtFVEZ4MXU3?=
 =?utf-8?B?ZUxGL0NNQTMyUFEycU1WMDJnM2tyZUlvK1NqL3lSTHljYm1nNHR2ekg2cG1p?=
 =?utf-8?B?anNjcjdXblpDdmlqRFAwc0YxMmt6ZzVvR3J4UVJDYmVLYUVwVXhNOEx5TTQ4?=
 =?utf-8?B?RjB5SlhzN3JRMEsyYVAzbzl3NUkzOHFkZzU1dFJ4QzVvOUFBdGtuQkg2QmxC?=
 =?utf-8?B?QmZSS2loczZ6b3hDNS9rMkJzeTRGUGx1UjZjNXhTNk1HTE91ZXZCbmxzZ3ZI?=
 =?utf-8?B?NmpiZHJIS201WUltbFNIdSt3VXdQTDFHd09xSUVOczZIZ0xNNWFsQlpRZGZF?=
 =?utf-8?B?S0lWQ2N6KzBJK0ZKa2xmYmpKZWNUL1NIMnBLZkF2NGZDV3hjTU1xanI4aWU1?=
 =?utf-8?B?UkFNWVJDTzZxRWZNUDI0VFdrUjZOR002bXZJT3VGekdzVVJxVVptMzlydlBM?=
 =?utf-8?B?eW9JNG1PZHRtdGZ0KzJGK2VKNEEyNnVud0UyazB6Y1ZNRGJuT3dxWHJEeFZT?=
 =?utf-8?B?WVpTVXl2VlZOak9LZkFxWTE2ZmZySm9JTk13cmMrN0lxWkY3ZUowYzhobHU2?=
 =?utf-8?B?NXpYdzlmeW9iVWZyTFFIT25XNE9XUFV2TWFEb3V2a1NTT1FxTkJQdzhub01m?=
 =?utf-8?B?eGY3V1ZmN2dXbW5zMGFDb25acFU2WU84TWJENzlHcENNczR2MHlvMG4wdlJy?=
 =?utf-8?B?NXluay9pVWkvRGN2SEN0ZUtEVTZmOERJNUgyUDVSVEpDTzJOeXk1K0tHMU9h?=
 =?utf-8?B?ZnN0K0wwWTgxSVVLRkxxeGxPREI0R0IyZ2JRdzUzc1NyRHVXaFRHREt5RDRh?=
 =?utf-8?B?UTB5a1ZuQXREQjhXRXlmYUNoTFlLN2RabzlDT0FtUFVsL0VsNVpFV0ZJYlQw?=
 =?utf-8?B?YnZiSEZwQjdKR2t4UXdYVXh0YzlrTElJUTNudWR1WHM4MlZpc3h6SVVubmdG?=
 =?utf-8?B?bnJkUjhSODFyRDF1amVFamNFQUJMNFY1Zm5jaDNRRnJ1bnEzZmtZZUVrUENj?=
 =?utf-8?B?S0RyNmVZR2Z5UWN0Snk2cmpLMFVpUHhLSDlQdGV3ZXY1OE03WGhHUDREcnNF?=
 =?utf-8?B?bTFnU2trZ3dzdXB5bDVSRCtpd1pNNDY1Zkc0R1FOYUxsc3YwYmc4MjRXazA5?=
 =?utf-8?B?b3lwekIzSFMxTzZYdVA0L2ZlNnFsN2pPTXh5cms1V2NWMHU0ZTI1UEF5aDhU?=
 =?utf-8?B?UFBGb1JHMU1BQldOdmJtRHo4RXpFMUhuNzdPTTU4NHdraTQvdFZscWlsYkVD?=
 =?utf-8?B?Mnlkb0lMTzMwT0FDZzVDbVI1YzNKWjNYT0J2TCt0VCtEK0FaVXhTRVFXYzll?=
 =?utf-8?B?ZGNITUMwd0FzRFlORDllL0NPMXNUUjF5MkQyWFNTOElpaGJCSXlDbmpWUlVC?=
 =?utf-8?B?ZGpvYUgzaVRGZUl0NWU2RHFNY3o5K1RES0ZQVHp0cURGbzV4a0JWWGxYeXUv?=
 =?utf-8?B?ZUxaSHlFRFU3WW94emhQcEFoRzlGV0pJSE41MFhOYWJpVCtMMmNQSFBIVll6?=
 =?utf-8?B?Vk1OdS81bVk1cVRJbEpkMzA5U2hQdkxQTGFySzMwY2VobG5ybDZEejRrUkNI?=
 =?utf-8?B?bkhlVmU0TDhIclBHdjJxbXZBZk02S3JPTEJza1JUalgwY2E2TFRablgwK00z?=
 =?utf-8?B?M3R5Z1B0RXRtK0diUHFXK3ZHc3VPSVNmUjg4Q3dKTzRSOFAzR29GbG50Tkd4?=
 =?utf-8?B?a2tTRXJmalFrdCtER2lJMEFlM1czaU9PM1NHUEIzbmtsWUt3dGhnV3JRMHpo?=
 =?utf-8?B?bVV2YzFSanZNbVE1SXpqRnRoNElKSFVXWHZjS212T3E2azBpR0s3WkJRb3Z5?=
 =?utf-8?B?WmpOQTVYWFRaUWlhUDV4Tyt0ZXduMlk5dW5td0Y2Wi90MXFjOVhiMzZTWkpj?=
 =?utf-8?B?eHJlcTBPZktKdlNqbFM3RTArT0pKdDVvREpYSW1rM3JOSm5IbVUrRklQWEZZ?=
 =?utf-8?B?NHRhZ1gzankvUmVGbllKdkZMVEJPblBxeGhISEgydVQ0VjJtczBQS1M4bk5Z?=
 =?utf-8?B?QWRJZEVmdGhrMmJpR2FhTEdFWC8vSWxpVFpEMXYyVE9FcDNzUDRpeDBuNk9m?=
 =?utf-8?B?SU5LTytCWFo1aVYwblhlcy95NFZGMnRGSVRNV25OenQ3VEswNUVuUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a586ab13-330c-4ec4-8fdf-08de7aec2cbb
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:19:51.7788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ct9xV9A0xzMQqcZU+azkj6aQRV9l7xAKAttyJ8DMZGbUsUXzEtb/Uy4bm8pDe7KRPcPZ31ZqhIimz2O4YcKuwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5D8CD6E8B
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

On Wed, Mar 04, 2026 at 09:55:27AM +0200, Lionel Landwerlin wrote:
> Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
> ("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access"), except
> that instead of putting the register on the allowlist for UMD to
> program, the KMD is doing the programming at context initialization
> based on a queue creation flag.
> 
> This is a recommended tuning setting for both gen12 and Xe_HP
> platforms.
> 
> If a render queue is created with
> DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX, COMMON_SLICE_CHICKEN3 will
> be programmed at initialization to enable the render color cache to
> key with BTP+BTI (binding table pool + binding table entry) instead of
> just BTI (binding table entry). This enables the UMD to avoid emitting
> render-target-cache-flush + stall-at-pixel-scoreboard every time a
> binding table entry pointing to a render target is changed.
> 
> v2: Use xe_lrc_write_ring()
> 
> v3: Update xe_query.c to report availability
> 
> v4: Rename defines to add DISABLE_
> 
> v5: update commit message
> 
> Bspec: 73993, 73994, 72161, 31870, 68331
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>


Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

could you please share the Mesa gitlab PR using this?

Thanks,
Rodrigo.

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  1 +
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 19 ++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_lrc.c              |  9 +++++++++
>  drivers/gpu/drm/xe/xe_lrc.h              |  1 +
>  drivers/gpu/drm/xe/xe_query.c            |  2 ++
>  include/uapi/drm/xe_drm.h                |  8 ++++++++
>  7 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 66ddad767ad44..aa6dd6885fbee 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -180,6 +180,7 @@
>  
>  #define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
>  #define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED)
> +#define   DISABLE_STATE_CACHE_PERF_FIX			REG_BIT(13)
>  #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
>  #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE		REG_BIT(12)
>  #define   BLEND_EMB_FIX_DISABLE_IN_RCC			REG_BIT(11)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 2d0e73a6a6eee..546f920ba8af8 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -353,6 +353,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>  	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
>  		flags |= XE_LRC_CREATE_USER_CTX;
>  
> +	if (q->flags & EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX)
> +		flags |= XE_LRC_DISABLE_STATE_CACHE_PERF_FIX;
> +
>  	err = q->ops->init(q);
>  	if (err)
>  		return err;
> @@ -910,6 +913,17 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
>  	return q->ops->set_multi_queue_priority(q, value);
>  }
>  
> +static int exec_queue_set_state_cache_perf_fix(struct xe_device *xe, struct xe_exec_queue *q,
> +					       u64 value)
> +{
> +	if (XE_IOCTL_DBG(xe, q->class != XE_ENGINE_CLASS_RENDER))
> +		return -EOPNOTSUPP;
> +
> +	q->flags |= value != 0 ? EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX : 0;
> +
> +	return 0;
> +}
> +
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  					     struct xe_exec_queue *q,
>  					     u64 value);
> @@ -922,6 +936,8 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
>  							exec_queue_set_multi_queue_priority,
> +	[DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX] =
> +							exec_queue_set_state_cache_perf_fix,
>  };
>  
>  int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
> @@ -1006,7 +1022,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE &&
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY &&
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX))
>  		return -EINVAL;
>  
>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index a1f3938f4173b..8ce78e0b1d502 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -134,6 +134,8 @@ struct xe_exec_queue {
>  #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
>  /* for migration (kernel copy, clear, bind) jobs */
>  #define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
> +/* for programming COMMON_SLICE_CHICKEN3 on first submission */
> +#define EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX	BIT(7)
>  
>  	/**
>  	 * @flags: flags for this exec queue, should statically setup aside from ban
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index fcdbd403fa3c6..73a503d88217e 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -14,6 +14,7 @@
>  #include "instructions/xe_gfxpipe_commands.h"
>  #include "instructions/xe_gfx_state_commands.h"
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "regs/xe_lrc_layout.h"
>  #include "xe_bb.h"
>  #include "xe_bo.h"
> @@ -1446,6 +1447,7 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct iosys_map map;
>  	u32 arb_enable;
> +	u32 state_cache_perf_fix[3];
>  	int err;
>  
>  	/*
> @@ -1546,6 +1548,13 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
>  	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
>  	xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
>  
> +	if (init_flags & XE_LRC_DISABLE_STATE_CACHE_PERF_FIX) {
> +		state_cache_perf_fix[0] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
> +		state_cache_perf_fix[1] = COMMON_SLICE_CHICKEN3.addr;
> +		state_cache_perf_fix[2] = _MASKED_BIT_ENABLE(DISABLE_STATE_CACHE_PERF_FIX);
> +		xe_lrc_write_ring(lrc, state_cache_perf_fix, sizeof(state_cache_perf_fix));
> +	}
> +
>  	map = __xe_lrc_seqno_map(lrc);
>  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 48f7c26cf1298..e7c975f9e2d97 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -49,6 +49,7 @@ struct xe_lrc_snapshot {
>  #define XE_LRC_CREATE_RUNALONE		BIT(0)
>  #define XE_LRC_CREATE_PXP		BIT(1)
>  #define XE_LRC_CREATE_USER_CTX		BIT(2)
> +#define XE_LRC_DISABLE_STATE_CACHE_PERF_FIX	BIT(3)
>  
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>  			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 34db266b723fa..4852fdcb4b959 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -340,6 +340,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
>  	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> +	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> +		DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX;
>  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index ef2565048bdf1..df1dc6b9cbc8c 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -406,6 +406,9 @@ struct drm_xe_query_mem_regions {
>   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT - Flag is set if the
>   *      device supports the userspace hint %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION.
>   *      This is exposed only on Xe2+.
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX - Flag is set
> + *      if a queue can be creaed with
> + *      %DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX
>   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>   *    required by this device, typically SZ_4K or SZ_64K
>   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> @@ -425,6 +428,7 @@ struct drm_xe_query_config {
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX	(1 << 4)
>  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> @@ -1285,6 +1289,9 @@ struct drm_xe_vm_bind {
>   *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
>   *    priority within the multi-queue group. Current valid priority values are 0–2
>   *    (default is 1), with higher values indicating higher priority.
> + *  - %DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX - Set the queue to
> + *    enable render color cache keying on BTP+BTI instead of just BTI
> + *    (only valid for render queues).
>   *
>   * The example below shows how to use @drm_xe_exec_queue_create to create
>   * a simple exec_queue (no parallel submission) of class
> @@ -1329,6 +1336,7 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
>  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
> +#define   DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX	6
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -- 
> 2.43.0
> 
