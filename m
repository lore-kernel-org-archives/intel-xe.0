Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33623EF8FE5
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 13:50:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64EC10EA1C;
	Wed,  4 Mar 2026 13:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FwvV0+sV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AF810EA1C
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 13:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772632248; x=1804168248;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zl/5sQ1F2E6222IQSL3rw9o3VAYUUF4SvKw0bZ4fHXQ=;
 b=FwvV0+sV7Ke3ypK9afkEnvOm7dCbd6Ts3A3354FyRuWk75ybeYA8nnpg
 pXSbyNDtijQjv8fuG/DU9Ymei8wR8GfkUdzNc5axv4MUgMTQY+6XFhFD6
 e1cX3c6cttD68naiRU3/RH2qzY0RH6vpXdKI33Ok15UCWvkxYxJkvqHMF
 SzU2vINeq9bARBg6QGM5Lo0MpOKVsxDVNR8RV69QIt8zI8wrHuYzYQhXd
 Z9myOc98+ntG9Wklja0LjvAjw/Z8Uy5ED6VcdX1oKoJPW2+GAmMUmba89
 5Np4UYHsgv74oe+NYaQ4yS0Ko0Lr4lATn9HXm82KNutMDl7RPny4Xqk6k Q==;
X-CSE-ConnectionGUID: UjoiwATWRNS3VygxH7IHKw==
X-CSE-MsgGUID: e7DoUrvSR6yn8Gyk/92fpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84026789"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="84026789"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:50:48 -0800
X-CSE-ConnectionGUID: qW5VzCsnTISCpX40kx8ZHA==
X-CSE-MsgGUID: ZFTnrfuQQ/OlLrlosYbmcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="216192368"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:50:48 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 05:50:47 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 05:50:47 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 05:50:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQYfPCsvkcVPdcgdNkzoTt0kT+Y1CshFWl7erdrJUyn/rjB/kq0eMNzPWLACRxOe8ns9RzyK9NZZeyBt81p+d6w9TF+4DJlcP8cw6YadMGr6lRSaur2RA458swPNpCMBM+dMrRZT715D3r85bdgRfE+2fPb4oTEKHldJw0X4shO4/VTlwo6Oi5n8KIJAWTQ3rFICns/v5LipHF2hhvLWITgG4VHK3ACJrP7lG33uKAhwAP3SVfTkebyjdmpwZJBDAaJMCFFApTeA0ED76Hh3rP3agPuKZ2JSUtbIc78e8GZLNK0IyqeoiMKhqRxNHv739NXksG0PGehsmY0s4ETT4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCZUDVq47vJAt6ppZ/w3J3b7qTfxoevEqXyjpZRPA4g=;
 b=bM2Q2HJOEsjoqifZJs2v1AMk0xutqL5UZjd8zLVpGf9Gs3J1hFzd850wa/8+Q3y+XefiI5D8jLQLUtETh3b639gSXamW85R+SfYTcw88NvBPPP7Ud5nOJfy4bmvJuhsyBn90Ykuq5fDOairHaM6zjmqI3UEyTSb4roC0MGoHdLqhHQIkOhJVP0aMXvUiIi22cqMqh5kxhcg/acr8/8ahGYOzLFHsO1jK3UNesW9znScjMZW8qe9M3z8eMJ+7bi/3Z+tlIxFEgdvHiZcqt7z2GmLrw33AbQf61rcdgbdi7y9emH/vB6CcBhAgFyYfm+nzMBQ7I5+L+qqndAxvmjBgug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB5142.namprd11.prod.outlook.com (2603:10b6:510:39::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 13:50:46 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 13:50:46 +0000
Date: Wed, 4 Mar 2026 08:50:42 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v18 1/9] drm/xe: Rename XE_BO_FLAG_SCANOUT to
 XE_BO_FLAG_FORCE_WC
Message-ID: <aag4sgi4vjYh6xUR@intel.com>
References: <20260304130314.6084-1-tvrtko.ursulin@igalia.com>
 <20260304130314.6084-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260304130314.6084-2-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0172.namprd03.prod.outlook.com
 (2603:10b6:a03:338::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: 67b15838-d212-4760-65e0-08de79f508f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: YtD6grPO58EHrNz5ToWsTaQQCJg/p3xn4KObAXzEIso/XA5P+erLdjH8FWY8HmTiIxqqZPgcfWMpOwbjo/rnVG9VNxkx2blhjpTAcPr3FnNNpPGFbla9vAgOL27PoutP/u6awwW98osK7WIb9WH/0kolt3inE3wMcc4q6aPT8oH6eLYASD4eGOvnUW/udrefen79Avg7IELJv3/gqou+RQGlE9X+lemwud9i0MyC2QxpF9opEJtooTilKBaviB2VwE6rJR7GcbF6f4bpdG79mrziS+fq89fqVjP0BfFjtCBeBN0fyYGEr3JvaVukJTnxTfIVNicxYg5nTQhTQBf3Lakff50xu5ScTZXgQAYsJNiuWw4ZJO6o+WtJllnZBhgY53xDXprligEB/Wuu7QV7lTe4pXWJcOMdn+m28BQ/vew5UvgtWZwYDLvWUcp3sAa5bMPzLasSup0ZWiryfFRf9DBrL9chwCi5Oep7tlSFoPLX4mus6cuw22xdQSYPvGVce23q8mSgM+lymNUzTKnGZiZvdidAZImyCKv0E1+xseHCbBe2E7MbNuAuZV0m/HithPLD9ewQoHaYJf71zIJahiHb61rIZ61JNZ1gSTRKXcYnmqRyubWMpijv649pwHWOUbaYsYkNOq/mClS42f5p6vXIHH9sLYIg8Hg5L+1Q3ldgodPOX6tX6tKlmD0H+8FNIAQzpodysmWEQObF4wLJhvwSIfiy2Is8u4m22QEtpyY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CLdudzUTWDVt7qSDesPyUBJw/RfHT4ou6gT5bn241hBrimUAZ+XIarxA1AYe?=
 =?us-ascii?Q?sZeabUJ1+tvvCotnxiRvH9qu8SrjL01pRIAsz/TVnlmpnpd1bn92hIamzfG4?=
 =?us-ascii?Q?u81wFSbBq8nyAVS3d5KASRttK8P2Dv2dNgP3LMscz8F1UvOWzFU5r2Gwm7wd?=
 =?us-ascii?Q?par3oLm7p31yKVfiEJ6YiCua+k3rJXrWyJ2jtpHu6sXFi2SGZz/8md/IAbZE?=
 =?us-ascii?Q?Zl3+mq8Y50jHZv1BQ66UTMdUtqmYuiMewXq0aGaq35MPzGMa58sTCVyqD2yv?=
 =?us-ascii?Q?j/MsqLYcxlsuFtElP9+mfFT5X2ezmYV94S6HAoHaKCE2NIcZ0TXQznjC4xSt?=
 =?us-ascii?Q?Gox2yXLv2olFOdlY8N7N7HzS/qwBiMGSqO11uWLTV3N791P6QNnlznSpCc1h?=
 =?us-ascii?Q?qE8XFYPJ10gzJzYp+/R0MutHz+5HxbTUzTPeITGLTYOrfcmNbm4H4VyVZiR6?=
 =?us-ascii?Q?beDiNZUB7fo/aJPLNDz/f11xdAnbBcsOgHEhOS2mBu/Rz8XxJ156lTXCxDwV?=
 =?us-ascii?Q?FT5XDigquPvTUwdrKzTPq+2f+plHRcFF60G4gfY/KUszRLxhwX41UojzbhBb?=
 =?us-ascii?Q?ncpzYHLQn64+7TCB5Hk+Ed+prOGl3xxZOlVZQDbUKyH4gER6QyfYJFkq+pET?=
 =?us-ascii?Q?XoM430VzoPgXM18smpTJr0eBifIwUQX+9qBptSY8hr5hNvK2YI/Jss20CMjM?=
 =?us-ascii?Q?B+iGq+jrGxa2neDFFC26unFyXIjtPEjFvPB9wf/70e+sijGti8+wyA6EVRDJ?=
 =?us-ascii?Q?ZnxSEiLUmK+dlIYcM2ERsg8jxRtOXAkRdWnuMlTNOKCwNk2jetKBgi01Amnp?=
 =?us-ascii?Q?1vZS/yHyWhYgtzu1Y9IDUyqA76Kgwf+zs13y1ogvw5U28ttGwDJAtdxfVMv9?=
 =?us-ascii?Q?XXmBLTYBjURiBqO/a1sMJN/C4IsHQZRZ73//pcXvKz4HFhOkpi+6VXIj8ufJ?=
 =?us-ascii?Q?IIyW4ztyb01BaFQtZ2cMH2/y36ycmewNvIFZYfMfbbG3f5rny6awxe1BvaBl?=
 =?us-ascii?Q?luJ/2r/0yQwxhxuNNHfIupzqlZuSC9q0sRqOg7Yt9cWxdhc16OD5XYSyWTs2?=
 =?us-ascii?Q?2TjYmNJkBr59ZZqtb2OT0KXPV3bDeflvIBCBXgb/1oHw1JqEndH26n007GFM?=
 =?us-ascii?Q?H2GG4hIf76gLdhH1fGWG/b1TYS2k1/O8vM9YvvMaqNGaj95VAClQg8k80zXx?=
 =?us-ascii?Q?eThFAohfWeKStxc8HVUvKBW01pmkv8iSyv/yqwnr4IeBczXbqUQ2dE2yBchd?=
 =?us-ascii?Q?PEBGEZRarw7GnVQugAaQ5/lpizb32sj7T4JkBdYCbroeQ2UJsPoibhn4pXzJ?=
 =?us-ascii?Q?5pj7VydyHu12RQeKR6GjXYgsmTcpPiBM63kRLa+/opj+Hi276dx+aa34HVgp?=
 =?us-ascii?Q?HwRzR6N5BKRaZh8Y7xX0HHz+3UrpeKxjc2TOmXmXjl4h/thMwEdWSzzN0boS?=
 =?us-ascii?Q?7fl1k0uwgndv+2Y/QI4LVWjvEDRXUI5FXRH3yujbGSD3OGbtTzFcilczsyI+?=
 =?us-ascii?Q?Zq5WnjZaWn4Pf09ND1f2r1506+mSjWbKaXYWBBTwgsKyY1ZJks9yCpCRGY0l?=
 =?us-ascii?Q?eh+0io4ehSW8ddAyx/CkCRo5Y9WK5j71aAdyU7aLbiU95eKX41CONdu0NCb+?=
 =?us-ascii?Q?0tMJN7hZjz7IZ/CB6bAkoceGD3m8D1Mj6v+4U9uw/eVYCEoPUL8YhqDRxqyr?=
 =?us-ascii?Q?sYFdqbUy928nDr7H/yTNhLLC5U9bPMTcVTIODu49cUYOLRbkdzHqPWXuxpX7?=
 =?us-ascii?Q?lXf9squWqw=3D=3D?=
X-Exchange-RoutingPolicyChecked: qMaSuY4E8PrkFUYtJCLlcvhyxQbo+FxTeBj6Au9vibAQ1PhS7Ay+U7tlktUzgMA5OsI3txS2OPXgjNpyEflf3/B426RGzW65Xv+QKsS1faVAffrMnfc7gLyqfk2pWe0kcAYmJMlLdlLsJ65oqx1XJ5g+kmop5jaxz+Qmwpqd2/r/7wru+KEBz05OWfH1IozHp1ntUXkzZ/LEpuTXM26mFrPJYvwELECI0Fn6mmcQTOpBYcHTFwy+nxRmz2WI7s74EK/uvMGD9tBkH7I0r0zNy9pdPb7zDoBEqmN6cIpuMqy4g0QJiVUtsfejM2MP8Iu0ZAlgpebhUec3meB6b2t3dQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b15838-d212-4760-65e0-08de79f508f8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 13:50:45.9769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T1KR6nbO2NxFq6lK2S0TaPuS8HUDYs8LElR0FAdjtGPMy7PUi8SEHFyzzf5Ksbn5iyiK5DW50WTRixGoKkfz8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
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

On Wed, Mar 04, 2026 at 01:03:06PM +0000, Tvrtko Ursulin wrote:
> Rename XE_BO_FLAG_SCANOUT to XE_BO_FLAG_FORCE_WC so that the usage of the
> flag can legitimately be expanded to more than just the actual frame-
> buffer objects.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/intel_fb_bo.c      |  6 +++---
>  drivers/gpu/drm/xe/display/intel_fbdev_fb.c   | 12 ++++++++----
>  drivers/gpu/drm/xe/display/xe_dsb_buffer.c    |  4 +++-
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        |  2 +-
>  drivers/gpu/drm/xe/display/xe_initial_plane.c |  2 +-
>  drivers/gpu/drm/xe/xe_bo.c                    | 16 +++++++++++-----
>  drivers/gpu/drm/xe/xe_bo.h                    |  2 +-
>  7 files changed, 28 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c b/drivers/gpu/drm/xe/display/intel_fb_bo.c
> index db8b1a27b4de..d2e72dc5abd9 100644
> --- a/drivers/gpu/drm/xe/display/intel_fb_bo.c
> +++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
> @@ -45,9 +45,9 @@ int intel_fb_bo_framebuffer_init(struct drm_gem_object *obj,
>  	if (ret)
>  		goto err;
>  
> -	if (!(bo->flags & XE_BO_FLAG_SCANOUT)) {
> +	if (!(bo->flags & XE_BO_FLAG_FORCE_WC)) {
>  		/*
> -		 * XE_BO_FLAG_SCANOUT should ideally be set at creation, or is
> +		 * XE_BO_FLAG_FORCE_WC should ideally be set at creation, or is
>  		 * automatically set when creating FB. We cannot change caching
>  		 * mode when the bo is VM_BINDed, so we can only set
>  		 * coherency with display when unbound.
> @@ -57,7 +57,7 @@ int intel_fb_bo_framebuffer_init(struct drm_gem_object *obj,
>  			ret = -EINVAL;
>  			goto err;
>  		}
> -		bo->flags |= XE_BO_FLAG_SCANOUT;
> +		bo->flags |= XE_BO_FLAG_FORCE_WC;
>  	}
>  	ttm_bo_unreserve(&bo->ttm);
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> index 87af5646c938..d7030e4d814c 100644
> --- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> +++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> @@ -56,9 +56,11 @@ struct drm_gem_object *intel_fbdev_fb_bo_create(struct drm_device *drm, int size
>  	if (intel_fbdev_fb_prefer_stolen(drm, size)) {
>  		obj = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe),
>  						size,
> -						ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
> +						ttm_bo_type_kernel,
> +						XE_BO_FLAG_FORCE_WC |
>  						XE_BO_FLAG_STOLEN |
> -						XE_BO_FLAG_GGTT, false);
> +						XE_BO_FLAG_GGTT,
> +						false);
>  		if (!IS_ERR(obj))
>  			drm_info(&xe->drm, "Allocated fbdev into stolen\n");
>  		else
> @@ -69,9 +71,11 @@ struct drm_gem_object *intel_fbdev_fb_bo_create(struct drm_device *drm, int size
>  
>  	if (IS_ERR(obj)) {
>  		obj = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe), size,
> -						ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
> +						ttm_bo_type_kernel,
> +						XE_BO_FLAG_FORCE_WC |
>  						XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
> -						XE_BO_FLAG_GGTT, false);
> +						XE_BO_FLAG_GGTT,
> +						false);
>  	}
>  
>  	if (IS_ERR(obj)) {
> diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> index 1c67a950c6ad..a7158c73a14c 100644
> --- a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> +++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> @@ -54,7 +54,9 @@ static struct intel_dsb_buffer *xe_dsb_buffer_create(struct drm_device *drm, siz
>  					PAGE_ALIGN(size),
>  					ttm_bo_type_kernel,
>  					XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
> -					XE_BO_FLAG_SCANOUT | XE_BO_FLAG_GGTT, false);
> +					XE_BO_FLAG_FORCE_WC |
> +					XE_BO_FLAG_GGTT,
> +					false);
>  	if (IS_ERR(obj)) {
>  		ret = PTR_ERR(obj);
>  		goto err_pin_map;
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index dbbc61032b7f..d4a9eb550cae 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -429,7 +429,7 @@ int intel_plane_pin_fb(struct intel_plane_state *new_plane_state,
>  		return 0;
>  
>  	/* We reject creating !SCANOUT fb's, so this is weird.. */
> -	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_SCANOUT));
> +	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_FORCE_WC));
>  
>  	vma = __xe_pin_fb_vma(intel_fb, &new_plane_state->view.gtt, alignment);
>  
> diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> index 65cc0b0c934b..8bcae552dddc 100644
> --- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
> +++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
> @@ -48,7 +48,7 @@ initial_plane_bo(struct xe_device *xe,
>  	if (plane_config->size == 0)
>  		return NULL;
>  
> -	flags = XE_BO_FLAG_SCANOUT | XE_BO_FLAG_GGTT;
> +	flags = XE_BO_FLAG_FORCE_WC | XE_BO_FLAG_GGTT;
>  
>  	base = round_down(plane_config->base, page_size);
>  	if (IS_DGFX(xe)) {
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8ff193600443..fe560b0a980a 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -515,7 +515,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>  		 * For Xe_LPG and beyond up to NVL-P (excluding), PPGTT PTE
>  		 * lookups are also non-coherent and require a CPU:WC mapping.
>  		 */
> -		if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
> +		if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_FORCE_WC) ||
>  		     (!xe->info.has_cached_pt && bo->flags & XE_BO_FLAG_PAGETABLE))
>  			caching = ttm_write_combined;
>  	}
> @@ -3196,8 +3196,14 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  	if (args->flags & DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING)
>  		bo_flags |= XE_BO_FLAG_DEFER_BACKING;
>  
> +	/*
> +	 * Display scanout is always non-coherent with the CPU cache.
> +	 *
> +	 * For Xe_LPG and beyond up to NVL-P (excluding), PPGTT PTE
> +	 * lookups are also non-coherent and require a CPU:WC mapping.
> +	 */

I believe this comment should be now removed from the other place.
But it doesn't hurt if you decide to keep in both places.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


>  	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
> -		bo_flags |= XE_BO_FLAG_SCANOUT;
> +		bo_flags |= XE_BO_FLAG_FORCE_WC;
>  
>  	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION) {
>  		if (XE_IOCTL_DBG(xe, GRAPHICS_VER(xe) < 20))
> @@ -3209,7 +3215,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  
>  	/* CCS formats need physical placement at a 64K alignment in VRAM. */
>  	if ((bo_flags & XE_BO_FLAG_VRAM_MASK) &&
> -	    (bo_flags & XE_BO_FLAG_SCANOUT) &&
> +	    (args->flags & XE_BO_FLAG_FORCE_WC) &&
>  	    !(xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) &&
>  	    IS_ALIGNED(args->size, SZ_64K))
>  		bo_flags |= XE_BO_FLAG_NEEDS_64K;
> @@ -3229,7 +3235,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  			 args->cpu_caching != DRM_XE_GEM_CPU_CACHING_WC))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, bo_flags & XE_BO_FLAG_SCANOUT &&
> +	if (XE_IOCTL_DBG(xe, bo_flags & XE_BO_FLAG_FORCE_WC &&
>  			 args->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB))
>  		return -EINVAL;
>  
> @@ -3642,7 +3648,7 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>  	bo = xe_bo_create_user(xe, NULL, args->size,
>  			       DRM_XE_GEM_CPU_CACHING_WC,
>  			       XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
> -			       XE_BO_FLAG_SCANOUT |
> +			       XE_BO_FLAG_FORCE_WC |
>  			       XE_BO_FLAG_NEEDS_CPU_ACCESS, NULL);
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index c914ab719f20..af9a6669c872 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -35,7 +35,7 @@
>  #define XE_BO_FLAG_PINNED		BIT(7)
>  #define XE_BO_FLAG_NO_RESV_EVICT	BIT(8)
>  #define XE_BO_FLAG_DEFER_BACKING	BIT(9)
> -#define XE_BO_FLAG_SCANOUT		BIT(10)
> +#define XE_BO_FLAG_FORCE_WC		BIT(10)
>  #define XE_BO_FLAG_FIXED_PLACEMENT	BIT(11)
>  #define XE_BO_FLAG_PAGETABLE		BIT(12)
>  #define XE_BO_FLAG_NEEDS_CPU_ACCESS	BIT(13)
> -- 
> 2.52.0
> 
