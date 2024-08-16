Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D51C52D7D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 13:21:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F3910E6C3;
	Fri, 16 Aug 2024 13:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eK75Q7mZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B7810E6C3
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 13:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723814504; x=1755350504;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DKj78Avxh80WScSWvxSHckEFTFfT1A6KrrxmKdk+ozQ=;
 b=eK75Q7mZwPme/R30BkIW19TJLdWI9U8/8YX9tZolJB4wy4fFKYC3jO/i
 RAegZtPyMnOFighRtONGWmBAGBOEeOKZRySGjIvOKDKtFpdPzyYtvCO13
 pz0Pk43eG986Bshqs9iY7/NyPoiqGaO5d2jwN/tljdE3/gIGd+JQ8al+9
 vqcWMhSKKuZqYzawMP2wrd859mVKFodUygRdIlwo430GXN8YHE3DlKVvR
 GcqkuPh+OCCVkvG9OjvqK0SxTHljVjQVQi6XHpuhK7mVx+5g5/hLR+Bu7
 YM14f18W8QbZ6i6nj/V3m4Q/mirlG9q8lnbfGXy2lU1S+PFMhbzZRLyLP g==;
X-CSE-ConnectionGUID: a4tXbGrFRWWwVKkKHdJFwQ==
X-CSE-MsgGUID: 2I2ytynlS6yr7s9ZEmG01g==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33496261"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="33496261"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 06:21:42 -0700
X-CSE-ConnectionGUID: R3AdJHJSTyOX54HIb6hGqw==
X-CSE-MsgGUID: c5Wglm1+SrS8nCb0h9B5tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="63850846"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 06:21:41 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 06:21:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 06:21:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 06:21:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBUi7H1f27yd4YgbF5P7yAXfZVK7SDDaW8GobuXbLV33HWdl3wREn2nHccAWDsRBPcl0tgZKAaSIZcgssO9c6WTNs0qxjA0+ceN4XXxlCSGuO76QFXzpQ3gmRVlAZxEpKbXBDcjHLoVYcxkXArZjmxWqyC7CIJl1xqSuxiWCBhorlzDYUz3ZM/HwcbdWJeQwvnV6tU3zt0Jmnw4jyg/FX5FQxEGofV7Ow/NnYkjTdsQ47FGiFc9KG1frllEztlI3aKDoxaNfxjCEZuWlGJAOSv1A0pfdNXfs6vsBaU8LynVuWLxcEFK0rBGln7Zo01yvF5DrP+4ny0TZHsPmfevV/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNQ7OFA+g+WeeaFUUL9xguVfAzl9rmtNLUVm0rC3qx4=;
 b=wDwTAD27aIH6jeJk3ixHTSefrk1+mipfF6iguQFu70aUeKreTlFzt4zueTjR3ov/616hjJTaEIBt2SWQeF4L0V4HBrioUoTC5Q/bpn9l7tFccMxLgd6e5cHnLD6Y7VCWVP1mXsZvY7lCNLluIG543XBK8C9UQbqhQHuWNWCxI3XcvncWp9pQyxrkMmkIy6Jbsh9ph3elZQgvbh8Vp/GWN5TnROLKN+Yjy6kQFt9OMmTSKTwH9NMIrR6Y1R2lu9QxWHr3YxpPzo2mzwjiYt90lerleSnBvKfZ/ErT1/7lBRecRvmiybfYPQzhGKGk8l5dl/fX5JPwalR2e8udmbzYTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Fri, 16 Aug
 2024 13:21:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 13:21:37 +0000
Date: Fri, 16 Aug 2024 13:20:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Remove redundant param from xe_bo_create_user
Message-ID: <Zr9SI3Xmi/FMYk9u@DUT025-TGLU.fm.intel.com>
References: <20240816102248.25628-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240816102248.25628-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e092040-f6a6-4920-7074-08dcbdf65b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5qIaVRAbuzM1tsIeBw/L6JkOJ+OTgOk+wkz5/flHLw7ZxvpJEZ7vY1Wpix?=
 =?iso-8859-1?Q?j5VBxxX1BrrspgmQKG8EwF2RwHupXMFVXx0029c/6giFLBcxnXdh0gxVmt?=
 =?iso-8859-1?Q?qq47AiMd5dUW8sAjmqUbdemdDmfKt1FU19M1jID7WcBx2bFq60oOfvtWIG?=
 =?iso-8859-1?Q?uuLBfbBbTP3EjaSa8R0CSy8AvutGCCsuzVG2XGLlb9E7ePSwwGkB00IuRy?=
 =?iso-8859-1?Q?tkoEEoprtMveOwO4JFP+xKRVW53sfEU5X9YczUJUNFcMIjudktPz1amFAs?=
 =?iso-8859-1?Q?Ji3njWWJgykRB3UfZvqpOr/xZtyiTAyy9rfSSRI4Cz+MAaytGlNEKFgbSj?=
 =?iso-8859-1?Q?T6P3adETIYWsmqISXNOEq9TyRQ10Y4pYGXmjVr2shqW2JfTUmcKLRBOzl6?=
 =?iso-8859-1?Q?u1Wey21VsOXhG+AjB+003Bh5Be25Nqeyvuy3YhC5ijvrNb/DBAvT9F+JQz?=
 =?iso-8859-1?Q?jbfe5Kiy5HPA/q2kpufWTViLLkpTjGlj/ibcrVWlUiXH7p/opgOu8ZooXm?=
 =?iso-8859-1?Q?dFgdyf6RSCCXVc/4PNO6NWLWAgrtH6TGlvxAEaByYgZSv+J7J2Cm1WSmNy?=
 =?iso-8859-1?Q?Yis6SNqJ5gNhwcVhjZB/fe5JoddVNDUFw3QkaoGZqluvS1OCaDqqJo92Bg?=
 =?iso-8859-1?Q?u3qKwA1ETMjFhGdBdT2r4Pzk/9uJpoypdAqFIvFgJr+Tx4Euxi2Mh1GPG9?=
 =?iso-8859-1?Q?jJ74AfnPyba0pzBjgvxcxiFoVln51FWjKKr9tgm6Gy2Ko/ybrtOwQcNm8Y?=
 =?iso-8859-1?Q?Fz68fQ23EAM1CJtTKfWcruwgQ53KRz6MEnkZGCsjIncxV4DeeRrMkBoUku?=
 =?iso-8859-1?Q?PTD1HBi6xjO7Ag6rubyPKGBtBbNm96o5t7rzxI2QEoxGTrXbB5+oCz1rDs?=
 =?iso-8859-1?Q?dqwiobqXrOofNRUpZrxogRxhh7a2APJIvIl1NQ0mVpvg+fTlwuLAOVncHj?=
 =?iso-8859-1?Q?/WgK7cd8euAtjO4AgfDjjz5iShvtVIvImdbs4ZRbLAU6wWWgyaRMKhF3i+?=
 =?iso-8859-1?Q?MP6oqdBWAaJT0X0ZYfZr5gofkgLs6xKZv0zk6K2/hIxCFwfwL5Yvz1ZTty?=
 =?iso-8859-1?Q?N/PZNI3lU7fKrDiSGw5awQOCDqEjusDe+EOA0h9iyuIg1fTE6wgkmYL8un?=
 =?iso-8859-1?Q?koNlgCISA3pwtNPWQt/ya+G0maOTNC06aVuSeVN/q3a0eg4Y0IyKwErqVW?=
 =?iso-8859-1?Q?OxOPnkT2jUlw1c55w789BOkctFRXsjjUtst6jqk0/Ti8koad+NSqD3yHA8?=
 =?iso-8859-1?Q?f0XSB2hFaUQFDMRHAVGiaqUUCEzlFb8fndeH6KiAuAq4BWm94tdAxCylRI?=
 =?iso-8859-1?Q?/YloONXNq/bkekhn65Y0Opk///yyB3YR2fG6R3w+nc9ryOGk2UEnlvcNNA?=
 =?iso-8859-1?Q?RUkdeCa0QBCjS54olhTLDJmffBHJcmLw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?46LzUN5v/jaz7hceXJODsXBbuMzLhHWfnl/O1SExa3LvKjVSBvoipB1K4Z?=
 =?iso-8859-1?Q?xa4nIx/JenQajV4sHrtLv2uDYl3az8VWoJu5Q1VFUYkAtWqK75NX7fWMsH?=
 =?iso-8859-1?Q?PRjXJ0o+eDmlC4c7fu4VrfyHUzi/LDuQf2A3y8Kc5L4NY/WjA0EgovQvYH?=
 =?iso-8859-1?Q?p7wRFJxIuyHdpFLRMONTmgvJGHZH3iaO7/q4Q6by+zaJEkGUazVzydWhSH?=
 =?iso-8859-1?Q?qPN2d0B/7ia/d6dzZKbFmzHQfAPRp2YxxGHyVTBnq+QUaRkGCXCJM2UGHI?=
 =?iso-8859-1?Q?T8YXH0J0uFBKEjcZIwhrPr04U54AYNrlIIvBg/9NUMMlVgUUCrPT+/qAC7?=
 =?iso-8859-1?Q?fx2dcEPerpg9iufYKozaZj/ec2fAYix5cPW7Q5mFa4QaFHNPg6LvMf3MgQ?=
 =?iso-8859-1?Q?5E+oEMWm6T3S7SQ+DESEluO6kGsRXvUZIPQMtFYLnQaD2NE/vTjyPhZDRg?=
 =?iso-8859-1?Q?i3MWC7QQCH7LVnGyr5h9EYmW65WFXpLQy997jN/oOCByeGOq1AUG+SgV2Z?=
 =?iso-8859-1?Q?rs14PDhkOGA2RGETRVvhuc/aiHWLzBoI494Xjwy0hj7ubKT1lNuFd45QY7?=
 =?iso-8859-1?Q?iCXmSAmgRYZO7CEwT0tOo/jDwSoS84n3G2BFj1MdpfGOJZ+y5V0Z45gcUa?=
 =?iso-8859-1?Q?+HLH2/ewmuSm50Oy++hJdyG5K6wWUExebI5ZH21IURxDeo7Y6Cl3TwVm1j?=
 =?iso-8859-1?Q?RxjpzbzfzHMrsJjXpBPU13N1/UKkbucvmZGhBq2I9wPM0oUFu0dgFqi3Ql?=
 =?iso-8859-1?Q?JBJaAn3dV5LXKbPigvaEn1ZW49E1DUq54/XjNY2BH9oa2MBsvJSTQ9AIJX?=
 =?iso-8859-1?Q?ef1jHEFeDaK/xnUolbkdlrGwwyOYlXMFDKyOMWtL/Byp6i/8HRn7HXZX2y?=
 =?iso-8859-1?Q?mFYZWGVo0/wwrY03T56DBx+gvVXPAMvQgFkvKk66HZ8nO4rttz7kpDz3K5?=
 =?iso-8859-1?Q?jdBgZ2g6dAl0rTwJ2wHXyvEYDgkM6YeyI4X1VcZTDNrzqIWDFVP1+OJ1DW?=
 =?iso-8859-1?Q?0aBldcNTv8e8Px93i7YuWeFA/Ks3EiFoQRP/T1Z54ZZ2kH0qc61oCItv99?=
 =?iso-8859-1?Q?o1MDxfZKU1nXbmL4F80dNWWbHLNwPVbf5/C2Q/Scp/cCT36f0qZ0hqVRS8?=
 =?iso-8859-1?Q?o83x+PjKMx+eQUvHBWIl4IzOvBAeyStDM068Qsm6PtMk3kM+h+0JVdtkf9?=
 =?iso-8859-1?Q?6lFwPI1d1pm+W57+tl+lkojflleZI5LrwuhCAEyEy5zRg61X65XezhmNiI?=
 =?iso-8859-1?Q?ZOKRKdyNu55ca27/78srgO2T0xotOPnV8aQBVa4aK+WczS3IFNC2gVM7Ai?=
 =?iso-8859-1?Q?ycl2NEY3UmQ3/qWub/WdfpN6wum6XMzfed4pFKeEf6+YajBvV3GFGryVt0?=
 =?iso-8859-1?Q?l+iaiLiow7vZ9XDONabsUYq1bWK+MKkgT3S89R0/ixHKa4W5v/LCMysdxS?=
 =?iso-8859-1?Q?Y1eJbqA4izOPmj7CJYLPzOOL2NrGC4KUlNfZ6Nl2Kdl9FTjuAEz97FsUOK?=
 =?iso-8859-1?Q?kKCCuKBMuGt5k1kYRtKgjir8vNkZij5osGMCDPLSQFGWUHhzM1NBFgJ9KG?=
 =?iso-8859-1?Q?jeBoAzL2hSKGMk47aW3akM13Qsv+32Js+EJnibZ9cpnrq8IS5tpo9vOsCR?=
 =?iso-8859-1?Q?t3lC0uSSXJ8FZWzAveL8cUUMp17SNBU7UY5ezyos86mJpBoQf+nWPmyw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e092040-f6a6-4920-7074-08dcbdf65b97
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 13:21:37.7320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBB5r3S3YwsovS6ff/dN6X6bauhPeYp1eQYarsMQ1AHDmHdlh2bXLCQsusyEKu+7VtHCpm6psyQTyZRw6OeHIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6312
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

On Fri, Aug 16, 2024 at 12:22:48PM +0200, Nirmoy Das wrote:
> BO from xe_bo_create_user() will always be of type,
> ttm_bo_type_device. So remove that redundant parameter.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Nice cleanup.
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_bo.c      |  5 ++---
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c |  2 +-
>  drivers/gpu/drm/xe/tests/xe_migrate.c | 12 +++++++-----
>  drivers/gpu/drm/xe/xe_bo.c            |  6 ++----
>  drivers/gpu/drm/xe/xe_bo.h            |  1 -
>  5 files changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index df9fd907edd4..8dac069483e8 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -125,7 +125,7 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
>  		kunit_info(test, "Testing system memory\n");
>  
>  	bo = xe_bo_create_user(xe, NULL, NULL, SZ_1M, DRM_XE_GEM_CPU_CACHING_WC,
> -			       ttm_bo_type_device, bo_flags);
> +			       bo_flags);
>  	if (IS_ERR(bo)) {
>  		KUNIT_FAIL(test, "Failed to create bo.\n");
>  		return;
> @@ -206,7 +206,6 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
>  		xe_vm_lock(vm, false);
>  		bo = xe_bo_create_user(xe, NULL, vm, 0x10000,
>  				       DRM_XE_GEM_CPU_CACHING_WC,
> -				       ttm_bo_type_device,
>  				       bo_flags);
>  		xe_vm_unlock(vm);
>  		if (IS_ERR(bo)) {
> @@ -216,7 +215,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
>  
>  		external = xe_bo_create_user(xe, NULL, NULL, 0x10000,
>  					     DRM_XE_GEM_CPU_CACHING_WC,
> -					     ttm_bo_type_device, bo_flags);
> +					     bo_flags);
>  		if (IS_ERR(external)) {
>  			KUNIT_FAIL(test, "external bo create err=%pe\n", external);
>  			goto cleanup_bo;
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index c24c8509227e..13db6c0530b3 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -126,7 +126,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
>  
>  	kunit_info(test, "running %s\n", __func__);
>  	bo = xe_bo_create_user(xe, NULL, NULL, size, DRM_XE_GEM_CPU_CACHING_WC,
> -			       ttm_bo_type_device, params->mem_mask);
> +			       params->mem_mask);
>  	if (IS_ERR(bo)) {
>  		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
>  			   PTR_ERR(bo));
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 47ae9d0b8864..1a192a2a941b 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -641,7 +641,7 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
>  	long ret;
>  
>  	sys_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
> -				   DRM_XE_GEM_CPU_CACHING_WC, ttm_bo_type_device,
> +				   DRM_XE_GEM_CPU_CACHING_WC,
>  				   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS);
>  
>  	if (IS_ERR(sys_bo)) {
> @@ -664,8 +664,9 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
>  	}
>  	xe_bo_unlock(sys_bo);
>  
> -	ccs_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M, DRM_XE_GEM_CPU_CACHING_WC,
> -				   ttm_bo_type_device, bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
> +	ccs_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
> +				   DRM_XE_GEM_CPU_CACHING_WC,
> +				   bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
>  
>  	if (IS_ERR(ccs_bo)) {
>  		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
> @@ -687,8 +688,9 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
>  	}
>  	xe_bo_unlock(ccs_bo);
>  
> -	vram_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M, DRM_XE_GEM_CPU_CACHING_WC,
> -				    ttm_bo_type_device, bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
> +	vram_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
> +				    DRM_XE_GEM_CPU_CACHING_WC,
> +				    bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
>  	if (IS_ERR(vram_bo)) {
>  		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
>  			   PTR_ERR(vram_bo));
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 800119c8fc8d..ce8282e67e84 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1499,11 +1499,10 @@ struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
>  struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
>  				struct xe_vm *vm, size_t size,
>  				u16 cpu_caching,
> -				enum ttm_bo_type type,
>  				u32 flags)
>  {
>  	struct xe_bo *bo = __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
> -						 cpu_caching, type,
> +						 cpu_caching, ttm_bo_type_device,
>  						 flags | XE_BO_FLAG_USER);
>  	if (!IS_ERR(bo))
>  		xe_bo_unlock_vm_held(bo);
> @@ -2027,7 +2026,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  	}
>  
>  	bo = xe_bo_create_user(xe, NULL, vm, args->size, args->cpu_caching,
> -			       ttm_bo_type_device, bo_flags);
> +			       bo_flags);
>  
>  	if (vm)
>  		xe_vm_unlock(vm);
> @@ -2333,7 +2332,6 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>  
>  	bo = xe_bo_create_user(xe, NULL, NULL, args->size,
>  			       DRM_XE_GEM_CPU_CACHING_WC,
> -			       ttm_bo_type_device,
>  			       XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
>  			       XE_BO_FLAG_SCANOUT |
>  			       XE_BO_FLAG_NEEDS_CPU_ACCESS);
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 1c9dc8adaaa3..935a94279026 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -87,7 +87,6 @@ struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
>  struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
>  				struct xe_vm *vm, size_t size,
>  				u16 cpu_caching,
> -				enum ttm_bo_type type,
>  				u32 flags);
>  struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
>  				   struct xe_vm *vm, size_t size,
> -- 
> 2.42.0
> 
