Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8641C282C6
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 19:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B76D10ED2A;
	Fri, 28 Feb 2025 19:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D4SCrmRd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CD410E33E
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 19:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740770534; x=1772306534;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P6ht22FsQXAvaze+mgEZ4RqqliiMrcjdvyu2T2WyXP0=;
 b=D4SCrmRdUbm0JzRdkZWlY5Eq8LzxT1VfvcZIgdfKstNzmqWhdiSc4HJp
 IZg9Gkvwk7t8cmC2enkunOebV3/l7Y+gqN+kIhzbfAbSl6lBHuMgy1jqt
 krV8ypsUac25tbtQWzTpZVonKTKFZMtlmlLw4IsN9kAliGcrEvhq/C4N7
 31uZDkCZkgKjQpPvIeyvkdZYY8rnrLsnrRv0taOFJxWbum8EUJxUM8gFn
 Gf5ZPHNiXGuMT+UeXJQ9S3B7dd+9CSbKE6TLwj2cX7qf8jW5szjsMmkzx
 ApxO2wSm37wuz05nx9tym9IPQ92MbwPoqEgTJJO3Thb/tPXiAZyvP0EwG g==;
X-CSE-ConnectionGUID: 1z1J8cIYTSSKj8mCRLdgvg==
X-CSE-MsgGUID: 9P1wItSdR5qZjJrSkDRZ/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41957680"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="41957680"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 11:22:08 -0800
X-CSE-ConnectionGUID: xPgqFu/ZT1OhCGpxemo84Q==
X-CSE-MsgGUID: g09UbhDaSs6YW6mWCd+Eig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="117443098"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 11:22:08 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 28 Feb 2025 11:22:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 28 Feb 2025 11:22:07 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 11:22:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SW2CU1MmJXjiL3eBECO7LVlJ9jEWjYxlzSQxtxJApk3HVJDyQkFtOR2HwZ/8NwusI6aTcpIaVfqzonNuI2c/k+qcl1fWayUf54DO/2Ec1I7uEJ7A81y+jtBxoa+go+mUitofkdEZe69mOzminHC78aHppmSHcT7/hb1jKazI3l0r7apUX7XGUbbcVW7G/HIkrHTuSdPojbcWhQNi4zP0LTVhem6tLw//XqPyqMep9Ju14EVPG4lCwk8JWmoCKElNsyHqqHZQqeJ/dRTWabEDCZ3WNvAE3zTmwy6WGhXzqmMlRZdYNBOCqsMuf0C3rg4/Wc9FRDqV69unIS9ptlxk8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yEFHWgrdrChRSS90rkTaqDAt3i5nlmH3vYa+Xntgd4=;
 b=y9wsoc/VsAC9DP7MdxZuYgNLEgkoOKhrCypyE+DUQbc1IznwZCc9H1cen2we5js4WNIcbvmNOWAYDDznJU7EZ67+lcKiEcBo6Rxwh6/2G1KHs9dmOh6vWgUwShKRRcrGCLyED4eq42S3na3fKcYcgbLIq5MZMMuxp6OnnfyIlT+aX2xw6sYlrIFDlaidJMEF8G+NtscKtTcRKlrkdIoiqXBU/P+ePRvfH8XfS3QvR9GyouxbpJCV6yNRpDsF6IpDEQxV+CUxrfXuWR3feFS6xZlbwGNGlnM+vpHz811erQe0jG3q8fIp0+zT/3dgBetHqx9WyDKr6Jf9OCfXtF4tlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by MN2PR11MB4645.namprd11.prod.outlook.com (2603:10b6:208:269::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 19:22:00 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 19:21:59 +0000
Date: Fri, 28 Feb 2025 14:21:56 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 06/12] drm/xe: Use fb cached min alignment
Message-ID: <Z8IM1J0THAWvE9YW@intel.com>
References: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
 <20250221101736.78986-7-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250221101736.78986-7-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:303:b7::12) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|MN2PR11MB4645:EE_
X-MS-Office365-Filtering-Correlation-Id: 48485549-9904-4ab6-d9c2-08dd582d2c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z8xr2utQSfkf6+kNR2vzhHl3PiWf2vIvU1CaU2WexUCDKDv/2UDLFLB0im+s?=
 =?us-ascii?Q?xrTuwLN8vIFL1kUR16c8W1ZXxyMermIoxQJCBiy2GBpreAIe09q32YzmBnwh?=
 =?us-ascii?Q?DqmcY8rWcWSQ+ecVv1h+NBBt1hRkkYK6rm2cpTVcju+mjn1r9MUhH3ABJjlT?=
 =?us-ascii?Q?aJ7WldnU8q55si0/DUOO5Je6RnrKHI+hvQq59uDvTrkmj9U6lzcosCjkAvDD?=
 =?us-ascii?Q?GWzTgUgI3z/DbcDgS/rfNy1Ojqb0tSjz2IJi13ogUYiXGEK/cpTfEGJ9NyQr?=
 =?us-ascii?Q?XRhK6a6WueXig14aGCNSzEMRifkwX8R53WEs1gPNzQ1Bif/VXPsLUximUlpY?=
 =?us-ascii?Q?De9rhVIX8FaXcC10gtRAp/WEjFp2O3IevmJwEB1kASHt56SQKeanMX6g54Q0?=
 =?us-ascii?Q?NJqQSsYQhub3okYh0Udy/BoAbJn3QuJU0P55ryPzW2NHfxp+HcJtofzZQHf5?=
 =?us-ascii?Q?ho7hPKlflVeAdOI/e05vJDk/b3QghNM1BeKVKPXfvkS0Z4hvvH+zfTkp2qvA?=
 =?us-ascii?Q?QLSZIJT+Q9A70roIXwfjsD3r4tcGBl9uGPcr8aopv3XvqNTHuaOtWrrA381c?=
 =?us-ascii?Q?5XtccetLR/HpyydjxPIZ7FFVMcP6/6QOUg1knx+RppnPpB7gbGww9nMdzfxG?=
 =?us-ascii?Q?qBWEsnqj1Fy1wIyUiTjl+fkiMWrpk7g5qAuLR59hpba1lJpX+mreKP4rANIm?=
 =?us-ascii?Q?2TLJI1Enf1HsHPMwKfzCGBgx3KIaA51vkTzufyemJ9QBMY6KO8v21cr7Mph1?=
 =?us-ascii?Q?c9BD48NxnVp827kB4xxzYQl1uoc1WNQqtzxHXsgSW1DPELhTOUNckjRgQuxc?=
 =?us-ascii?Q?e+0Sz9Po93XblSq0EbB04Xb96DUPeje5zdsNT9eR2C/0ZLQsP5VUB8Hh4TLJ?=
 =?us-ascii?Q?/2fLqHa1xtHTQjV448bSdg/ZHG+UdQwx/aXqQ7SyIVBLgf+ZM4g4auacjVwx?=
 =?us-ascii?Q?bDU03veqJ1r/yDiwXk1NPRUxOz5RRtbvSne3TBT7wLUM3grjY1H7c31RBo2e?=
 =?us-ascii?Q?XiIUzlu2dK/XKn75QZoGMzKtz+uIddjrXDqV1FBb36tECZmv0AgVTVmE2eQp?=
 =?us-ascii?Q?GnY/pYKn5k7q25g95bwl78nzbqtSCk8XSt3ZRFajVSCSzLiSj2gMU4L+nq2U?=
 =?us-ascii?Q?YvfO22pW6fAaSdHeq3ftRQbkM233NLnU54YGMUA/lwFJqtcc9DI+2YumSZLB?=
 =?us-ascii?Q?E8Xp0qkO+rwsntjf8ixyjSelZ31df2+ARfMie+sMX7haDzEQWjOS480tsBux?=
 =?us-ascii?Q?BIo2qpyIlPhfzPbJN3XOfwiFB1QNDyJTJm5aqSQL7pJBE50+FNI+5uJGYhAK?=
 =?us-ascii?Q?bL7O+yFgVrMy1cKG1CNP0ormWEyaFg0+ABOX2tdk2vXHBVHiN1hHJEMslNg4?=
 =?us-ascii?Q?Z1fqVUYl8JZ0BY7iW+kX4St2/dnF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G2v9kevA9oMfIx+2WKhqW6IsB0D5JUvUI3voZW5weO+9oYBFAJikQvtHcZpX?=
 =?us-ascii?Q?yn0lRq3B29ib3qrrhK5bqPubGP98J6JV5Gw6B8bKfMtknADIRVWspvqdZ8Xh?=
 =?us-ascii?Q?evCu6m0QWetE1b0+biG7hU+JJT5a5BVOQtPfLQWgG5z9+101W/pxVc2HBf9E?=
 =?us-ascii?Q?dOlQBJkcd7TjvCni+NpWq0LG0mSs4XrIKFtJFd8nhdQ9JTNqRzg6yvdvXAwb?=
 =?us-ascii?Q?BfGi7mnPMriprqZYiUn0TXdbMZZFGs8RI5HxykV6eB3ySSR47mDVJaeMjJw0?=
 =?us-ascii?Q?Ekr+YEI6duv8WK2JDrLUmcuuAZH1ZGokYbRswOD7QTqkt+AgUX8fcK2Wcm4n?=
 =?us-ascii?Q?I9M1Rl21LM0v3RExuNYB/M4gvJMkeZEnlfHAugOh31I1CTK9mLpbyQoZz6Hk?=
 =?us-ascii?Q?aqyp9wZhDS0UAOQiikRdhWdIj1VYonFrwSLXwlUdKGMEiheISA3TDgQIp91g?=
 =?us-ascii?Q?U0P2OG+LedJdh1Lf6dp2fBUUpSR9YVTZ9+6vQIFD2IJLGrEDIuGOYSnkEFrl?=
 =?us-ascii?Q?0zO06EdUZTbk6oLCCDCF9fepQcbB454mpFtUVNLg6YfhHp1W6hlf+cJmXlrx?=
 =?us-ascii?Q?j2eftzLaVjogsS7J3omn7Z0aeqqHV5Gup7BxtDIvIFoXMV3Ha0ZVls/ccdqp?=
 =?us-ascii?Q?Bfz5V3/M/JTRnWH2Cg514PuC1PVE7lFRGggXcXKyq6RkSmxSUzo6/dVdIBHQ?=
 =?us-ascii?Q?gigWKPz9fXLAljr5YSL+K3e4+RFKUMfWbPpNkdtDMpXPRjRLPtPckE17zaNq?=
 =?us-ascii?Q?C6ameebDlG2giuBFFgyFnn2pw552ojHgQtwAMK7ne1k7DsaQNPPt67RUUhgq?=
 =?us-ascii?Q?YLuOQg3T7mPJhKXXWT9baiQxQ9nb/sbOpvqUuBAtGQOANHyJE+oooFcPpKTT?=
 =?us-ascii?Q?yJe85BH27OWexK/WGis8tCTiGVCfWBuq1IcMIUOmYOz9ydsps3z4sGZU0DZR?=
 =?us-ascii?Q?tEJwxwnkDnsqxFUPUU8LGyGTJhlDQABhI+qUnT+hSi+6suMPiGXDiq9MwXeX?=
 =?us-ascii?Q?j3jOF1/pN0u8zYbhzhQ0AU6NdjvrQKndbIb7yDJnT33wRDwrqi/dhinyw331?=
 =?us-ascii?Q?6hid7RkHn9fv9jtIUmVllgMsVSILo3qLcrUOp3Q9OYMCX279ZuQfv+G1+i5X?=
 =?us-ascii?Q?SeiE+iOII9wzk2kg5DkeTr1xj2Y9jlh3ePDK+ypjBl1j5knGzE7ruYO852l1?=
 =?us-ascii?Q?UOyTXeulwqVriAr2AkDhqgLFOlZ/dzoSLa447GKVB/reBzR2Zuiajk1ZXiZ/?=
 =?us-ascii?Q?Jb8VT23oN0jpgw7GrN8hEPk4o1gMHFgZCMGg000iBsMDvdY/wvbQcCQdIitY?=
 =?us-ascii?Q?8vMWe6gXXv7bDgAoaa+ltLrjdORRuvk3ej7MWZ4ljEaCqI0MdvJfsgit9CeP?=
 =?us-ascii?Q?+rrnv4DkIqYLqp3fFTc4VX/ZgQn8Z4QvhkKEWxsfnklfOytIG1+Z4eTS1Yny?=
 =?us-ascii?Q?rWlX+mbWLmTzNH9wDZd4YLvhCoiluaSRHRic498qhpO220EUi4fWN+kWxRhs?=
 =?us-ascii?Q?Ve46SEJQkpHkyxfonalwwJ/dUS3NiE+qObMcw8Q1dQjmk86a6s3lOtgS/QJq?=
 =?us-ascii?Q?xvCNH4KqigyKXA2hzHY7gpBVfcWiWe2Jjcq3fecd2ZMKe2ZKAQQF9MAbjzLx?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48485549-9904-4ab6-d9c2-08dd582d2c42
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 19:21:59.8142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hF4J7M/HpGPkGG1Lir5zEDPqJJml/0lnfbmZmffrIq9F+IXtaiHLbD9KSFI22QCVsj3qn2mq13L73WeX64kZNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4645
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

On Fri, Feb 21, 2025 at 10:17:25AM +0000, Tvrtko Ursulin wrote:
> Instead of just looking at the first plane use the fb cached overall
> minimum alignment.
> 
> This aligns with how the i915 version of intel_plane_pin_fb works.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Cc: Maarten Lankhort <maarten.lankhorst@linux.intel.com>

since this one has potential to impact the fastboot work that Maarten
recently fixed...

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 3df51cd4a86b..496257a60009 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -416,12 +416,9 @@ int intel_plane_pin_fb(struct intel_plane_state *new_plane_state,
>  		       const struct intel_plane_state *old_plane_state)
>  {
>  	struct drm_framebuffer *fb = new_plane_state->hw.fb;
> -	struct drm_gem_object *obj = intel_fb_bo(fb);
> -	struct xe_bo *bo = gem_to_xe_bo(obj);
> -	struct i915_vma *vma;
>  	struct intel_framebuffer *intel_fb = to_intel_framebuffer(fb);
> -	struct intel_plane *plane = to_intel_plane(new_plane_state->uapi.plane);
> -	unsigned int alignment = plane->min_alignment(plane, fb, 0);
> +	struct xe_bo *bo = gem_to_xe_bo(intel_fb_bo(fb));
> +	struct i915_vma *vma;
>  
>  	if (reuse_vma(new_plane_state, old_plane_state))
>  		return 0;
> @@ -429,8 +426,8 @@ int intel_plane_pin_fb(struct intel_plane_state *new_plane_state,
>  	/* We reject creating !SCANOUT fb's, so this is weird.. */
>  	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_SCANOUT));
>  
> -	vma = __xe_pin_fb_vma(intel_fb, &new_plane_state->view.gtt, alignment);
> -
> +	vma = __xe_pin_fb_vma(intel_fb, &new_plane_state->view.gtt,
> +			      intel_fb->min_alignment);
>  	if (IS_ERR(vma))
>  		return PTR_ERR(vma);
>  
> -- 
> 2.48.0
> 
