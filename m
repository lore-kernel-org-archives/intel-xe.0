Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44D8C282C6
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 19:26:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A063310E33E;
	Fri, 28 Feb 2025 19:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZszMlBh4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA09E10E33E
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 19:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740770786; x=1772306786;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=55KdRNvhJ2QzCsPuhehp5Oy4UbqNrdimQ5OhyZNQDy8=;
 b=ZszMlBh4IVcqX+5fe28yQKdfFE8o4qJ7yeuqEE+9/uFya6KNmHtCmVyE
 wm8T8QY1AwfHRHVVpCyD7+ug4Ecrp7afpnX5k6lRfD9Vkwd8/sNH5vFTH
 a+qjkH3vuK3QcqWs9+jJsFfezxl9keju68wkjIztW0ve28jrduJXQmC4f
 u9L9wcXDU3bvbBRm5rwRFsLp1ojLBClxm+vSA157PcnMlEV/tYFYmqoQu
 xieaS1Gm5ZxojlI8UqQtGt4vG4Vdi26407s6AWvnc5tM/ps7TaNuRC+zy
 bH2RAcpMLoSToVzQbRaNjj+M+Atkmc6BvkaQyTDFKxaopZy4n6hrXWr7g g==;
X-CSE-ConnectionGUID: r7bxF0a3SS+wypkj7a0TMw==
X-CSE-MsgGUID: ZIxff1fYTBK4vGFOqm81ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="64172141"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="64172141"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 11:26:23 -0800
X-CSE-ConnectionGUID: nHHr4GoCTxyaoZZH8DGTFA==
X-CSE-MsgGUID: gBVpWAJ4Q2eDJxKvJJwOwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="117917630"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 11:26:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Feb 2025 11:26:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 11:26:21 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 11:26:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+xu1epRlLSjBn3zf2mPqq4bVWYu7htQ39zZewSnS+ii1QGk8UVjBfAOfq2jN5SNIuM0uvDL1PSEHeliOtr9wbPANyIdIA6tPkgkfB+pmuys2FxtKbj7GQ3Qqv9ksTwEl2mL4XxdtLSpGSs83NBlGye180rBC8Iyw1Dcfe4G32ZPUdRxMaxHI6KqZnm1Z2AGOJFat/J+CuWprDJQ10/S5Jz1qLpf4mQTtyGdQgxKxDne6FOVVo6uhv5tpeDtnEHg3aBTjh2J3IGNHIFKSgKg3Lr6EUku2zf11TPUpFJ5dPWIQpzBd+Fe8CKObUu15XpDTyG1UuzWtSx6oK7vIUZXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DltpG/wn/LLmYtWhCQj4Eo1PE4lrcLEG14bMJexzwo=;
 b=ruD4e0pMNT3/OpZOKcSJceGfN7tYscC5kk1QMFUpSPIQuQKrLYn+MfKqrC/UXF+W0UGw9gPc/0Mjr8ZJqJ6zUXGy+uxC2nv5CNJ0OmNzzFDgVy0gfKtoOK4wcogDFlJivaMnMrP1LJD2Kz4bzcyotyqFF/XVb62mN6a7bj8raFHlViYcYLj5b1Qcz8rr0OmiHp4v35R2WeDHSfF9nnxQBcMnYmbPF7q02VZNI2KyzhRbBssVb+ZVsCiLPUd7+UaqFV6HwG5U0XbyjgKJhc2a8BVLJpNE/h7ahSiqXU6NvrXAZ8BDkwlW+wNLwxSmLOLSC+e1rZxdDRhtcRg81CDt2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by IA1PR11MB8864.namprd11.prod.outlook.com (2603:10b6:208:597::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 19:25:51 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 19:25:51 +0000
Date: Fri, 28 Feb 2025 14:25:48 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 07/12] drm/xe: Reduce DPT table alignment as in i915
Message-ID: <Z8INvLjsBh-0zWnk@intel.com>
References: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
 <20250221101736.78986-8-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250221101736.78986-8-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR03CA0344.namprd03.prod.outlook.com
 (2603:10b6:303:dc::19) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|IA1PR11MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa44f53-d3cd-46a7-ef91-08dd582db652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5nN9VADHmzsgXN7tBJ7QGO8C0o+Q3lm5GE1iggcFM/ecqYNwS1U6qX0nre?=
 =?iso-8859-1?Q?PVTjznzgz56RQWEWshvfbIGz2VnKLdrYfgf7IKfEnXdV12QVU6CRSNxt38?=
 =?iso-8859-1?Q?lvo4tDbCRUXvlOO059xvcXngTqyxg724RZGsQE+xSbICAHF18svRkE54vI?=
 =?iso-8859-1?Q?Ed2MnDzi8V3w17g9Q/r/LwqCtvus8CVTabD+cGjwMrBh+ncW4h/WptCXP7?=
 =?iso-8859-1?Q?2nvPuq7JEdeWrWtMncchemp51Hqu+rJp/dSxTI3KZ/a955xTapWRyHHVzO?=
 =?iso-8859-1?Q?y3vRIELJ4ZHxBbae0luQFNsFsbVaCrW9KQoF51fqz9de5U8tDMh2cvvZwy?=
 =?iso-8859-1?Q?uKWBSY7oZUBRR4gFyLm0FuwthX2MbpqDm4TcRJXFDHajfGCnAHNf8NDrUl?=
 =?iso-8859-1?Q?kUw5tKPQghTEfFjFsLl5ehO2VVd7ZXRbM53bMnCLEVMvphkN56+CTodCgX?=
 =?iso-8859-1?Q?hmR/N5P2jT02e7ErMggpjjY6U50YvxlDQTbwkz5eVxt9ibKVJjXx0v3Ey8?=
 =?iso-8859-1?Q?RuFaklnQw9Wj0cjmHLdnC0wNR+GsLrdS9uwpTe3VUNUDRR+TXW3SXqStvv?=
 =?iso-8859-1?Q?trTIzWoAB9oWFXdYtWQhvv5dPsqYj0kudneLjYEUe2rqq8FuUSN/cwbNNJ?=
 =?iso-8859-1?Q?jxQGtgwPlWDHESsUy6jw/QXSv+XXcTMwPDRvBeF26K0LQ6rlmNbI3Yqq3B?=
 =?iso-8859-1?Q?tg6vLKEkxTwOdd/Ui4oC0TsRsV5ZWBu6bYOkgO89W2gE2IIHXZiPhq6Wch?=
 =?iso-8859-1?Q?l0Fw/IdCJctu44mn1bnMc22gdJBWZgpO8YADFRRiezw/R3P9VsYiJSjakw?=
 =?iso-8859-1?Q?QR/P/hr72zTEzkGFUZGtlHACZX3XWiTepXfFyQKWJ7n13J1OKc1bPxr5tm?=
 =?iso-8859-1?Q?VonuSi3gV6RAOsCPN6GVcjA3s++jLB7vIwy/RNmdMS/j8hyf0WUoMZzytY?=
 =?iso-8859-1?Q?V9p/z5OJYMsfikmglW1qCszsKIvnAfr/FE/+JZFlp6N6r2dIU28kO14YF3?=
 =?iso-8859-1?Q?2s6hOirNolFWbi9ct+AleLd4Lxg5l2Xen5KtqznZXNX5UNcv9qUj6f4As+?=
 =?iso-8859-1?Q?g8JfhOYbYiJCYWs5bR8Xt43ctkRqMZmhnXZShgUKCpGQVvcGr9CVNq8brJ?=
 =?iso-8859-1?Q?hxP33QP/p6T7mv+/NB/3h7b2Nea7K43s5vdxO1MhbbMs0ssSLkMgaDZi0/?=
 =?iso-8859-1?Q?0eIYKTOHp+cl9dDzMBM13TcWNLgW8Jc5ySeMTVrC0YXk/1p190NcmnXQda?=
 =?iso-8859-1?Q?O1nNB94j2LJeKp92IDoDUSRYUm8nN6BCcnghddKhm/NSujJbbOfBqoT9XU?=
 =?iso-8859-1?Q?OEOk7d6t5u/mIVdBORtBCTWpru8U+mc9/qWS+5+uMGs4ieTLEcPOh3y5Hj?=
 =?iso-8859-1?Q?eSKNMz2WNw4QyZCpnHCpEygHPv2Rvunr+9xIxRl9GxQNBIQqkNaQQml7j5?=
 =?iso-8859-1?Q?MI72XyMzTnMw0bLO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dQiVUWL9HmqKF/wxGhkIsuDxAZaIb+qouIUjvFbLYmOpsc6Giy4oRh4wAS?=
 =?iso-8859-1?Q?zu5vJbPP8qWXiqrzgHh5tGdOyq1H3p7YPufWeIkxEsui+KCsq9QTvMynEb?=
 =?iso-8859-1?Q?N5LFxUAzGgzhpg2AYFXEeYvQ9uA4PUE4EE+HjVtWUzmAz5ItMKGVxBjyVO?=
 =?iso-8859-1?Q?FWQfJi0ojUZ6uvSQVzlMpcgOABB4JXcDkIkgi42Cn84F0N2tydvfDJUIXv?=
 =?iso-8859-1?Q?h63CL3PdzsSwW0mNovbnvP928ekOoVJm64yzH1bd04XuBDmb7Yo4YIw66Z?=
 =?iso-8859-1?Q?efvzXQ0kcXoqBIVkKQ1iyUxCPc05Snj2YYMzRA0ZKSXM5HAZW0Ot29vkQf?=
 =?iso-8859-1?Q?HBXCTE5dhACKxBt0aKYMBTjSuO32rrrZctWl4eR0+L59DXQNIlW0pQl1/3?=
 =?iso-8859-1?Q?yr2N8vnqGX3GBOjB0KjoYVu2xELoAXAdAT3+mNeFu57tGvc94m2060N5/6?=
 =?iso-8859-1?Q?JlhrIZvBeLqkv3T4QQ90wR1teqWZEN18Wnvdd3jIdZ+QeUSzyGJqmkd0P+?=
 =?iso-8859-1?Q?ya5068bX/yylMdNjDaWrgkj4tFm4MhY5zpWe/oS0Y5Olok+mOGhNxRNJaD?=
 =?iso-8859-1?Q?qLkAb/dnJDR0KBEVJe7M0P4eQ8MSHE/g0/EnoUNT0pZbCliRKQvqabe051?=
 =?iso-8859-1?Q?R6pFgdZlRC1qLdzGptaFE1C2gTjLRp2L3+Ilp1tDSsw/cpNPyKf7GcgES6?=
 =?iso-8859-1?Q?YRzATHldoTwz4GMBgSgeqQ26mWqxaSRzMq9JszVwqJHTuM/VfAm+af4WBs?=
 =?iso-8859-1?Q?J+RKydX8CMwoI3mslUCWAOL/WKkvAZENyuolUoyLvQMvffXBsKjptBfUer?=
 =?iso-8859-1?Q?0kN6rF5jNzZT47tREwele4So8KupROne1nS3W0R1RiXgwjXo2goZzhxxvu?=
 =?iso-8859-1?Q?oszFHePPHXFknNFB0euXz+cCRhEO4cL9rMeMKxLRgRxcOYmYvcN69H/8i9?=
 =?iso-8859-1?Q?cORPVwNhteDC2IdIYUrT8TZ6MoCm4nzl+7jIsmRh3RwaNOuA0Bknb6wce8?=
 =?iso-8859-1?Q?qzEC1oDxtl2W7yZzoOHUjUr66/cu+6PspdQMm/yPCjbSEPl219uO89zQ2q?=
 =?iso-8859-1?Q?97ehWvnJ5gz4YJopG5w+ggR1Tp62uoFUX79t5ojbZYlU5tvgLndK7i+ES/?=
 =?iso-8859-1?Q?Kwn5vSf+HFj0bLzvzAcB1zC5jnauP75e0R4cdkup+LWF2jrrYk0c6rTq5L?=
 =?iso-8859-1?Q?Y68KWwnXPysE4M9l1dAZXXMZ5ZnSiLNnW4SSK6mONpcaisbbi/LLDv2yfT?=
 =?iso-8859-1?Q?w21yrceMK5jgy+B3eVrDMIdJYXUtobYAE/Ux3zP342orBwqVRsNq0uATCX?=
 =?iso-8859-1?Q?By9tcoIH2WIfveMUH2cqXcXGisf5XIWNur2ZIAQstvGppX09kA25ULV5BS?=
 =?iso-8859-1?Q?INIAqHettlSmZF6KHopvVspjwonXl2tAPuKzzLqkuM6dCEmgCQAWYcViD6?=
 =?iso-8859-1?Q?Vf/4fQkvF3gPieU0LdYTyeljzRSAKusEs1HiHoG6oQr4+UZvutLyRxwCDR?=
 =?iso-8859-1?Q?MVOjp7o6dgdvI7U8o7Hxnt0JiQSL2ZXWfl5vh1y9M4rMYD9MOmOCGKUgVU?=
 =?iso-8859-1?Q?m8iLd41CcWI36aDgXOkDCf1Wtef5yk+HqeU+IIrnCs77WdqYKZlTqi5Lvv?=
 =?iso-8859-1?Q?z5SVuLR32eGpeYOhrei08D08LgLyI7HktrL1ztBj5STPyWtUwZ+rPLWA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa44f53-d3cd-46a7-ef91-08dd582db652
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 19:25:51.4076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QxmHGy9qLNjWmjQ04QSriyBd1gNU9x1CzzNeEqLNzbF8BISQkB4/RXelOD1Q1Z7W1JqYBPS8XMwU4PihiBO0hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8864
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

On Fri, Feb 21, 2025 at 10:17:26AM +0000, Tvrtko Ursulin wrote:
> There is some magic going on with DPT alignment values which are
> multiplied by 512, and then for specifically pinning the DPT table
> scaled back down.

This does follow same pattern as i915's intel_plane_pin_fb()
and it looks like it would deserve some refactor to make this
512 magic less magical and more clear.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>

But I believe Ville has a better view on this, so it is better
to double check.

> 
> Make xe do it in the same way as i915.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 496257a60009..6c85e03dfd79 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -326,7 +326,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  
>  	vma->bo = bo;
>  	if (intel_fb_uses_dpt(&fb->base))
> -		ret = __xe_pin_fb_vma_dpt(fb, view, vma, alignment);
> +		ret = __xe_pin_fb_vma_dpt(fb, view, vma, alignment / 512);
>  	else
>  		ret = __xe_pin_fb_vma_ggtt(fb, view, vma,  alignment);
>  	if (ret)
> -- 
> 2.48.0
> 
