Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05111606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 20:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M1MtHpF8;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=boRShZJ2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DA910EC86;
	Mon, 23 Nov 2026 20:25:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E6210EC86
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 20:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795465508; x=1827001508;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CMLKhm3MBmqlcv07mqtX+xv7N2Jw0Qb2V1gR+7N9+K0=;
 b=M1MtHpF87kmFFU8yMd7mDwCQ9z4MRRus4QxDXUiNiHJvQy4UtLKLfqym
 rQfL181Oz+oRgGfWuWHCYg3PrZludzAMWW2iF8ytfpGDc8Ar73spSYNjE
 5u/0nGWsZ4DRNN4EdQh9b6fvTPNY2bKfSdo3mnApUs8FGOITueMxOTSa7
 Wvw/AAYxA1CD9fx5aLW4h1kewQM9kO6ZI7s07vkyP5zb51c4kawLo7q0j
 2fJO8KWjLmLEmxtJ17OqtLR+FbccPHR9V1blvgNVXmj7VVqNlDEBvlw2H
 Ghivz+nQ0mzHFETW31vTjl4hF9tZVXFeXJeeS2fhK6eUw3lhWHhQGBQLM g==;
X-CSE-ConnectionGUID: IN3OJsh0R5aGLHMsTrKQ/A==
X-CSE-MsgGUID: qAfrvdbyRiCmmQv17HTVVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4137567"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4137567"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 12:25:07 -0800
X-CSE-ConnectionGUID: EfJoqJzuTG+SBJfdfJQNXQ==
X-CSE-MsgGUID: HP/XaD2sR0a6KuYD8Dtjqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="13177352"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 12:25:07 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 12:25:06 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 12:25:06 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 12:25:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jwen0Fi6xurAd2AvVKsSde1Z4Njh+yKzF1u1VbRVfvyxTkcirKSQW3dja7/qd7K9v15FxznQESBdOXJK05pKadv+fXfyWnELT7MaKNlIkF+LX0xZFFJ2JIa34l1y1QguoZWZScS7jzGwmV9bkZjufZW55jeGJQ0k0WRo+0jTT7rq1B9BeFKifAN/kPEz2M8KIBgXTcxpU5ejRpmla/qzwJaQTwRF21vzxyTSKtnE5w6LddJt6/sgCEWJIP2iRCWMvNtJdIeZPauquYRU/fqIfInnx6siUCvU8pyU22kSR3cT0jzQuETEl2JjAUuALGQfKjiZX648eq5xyNFlba+OHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAFvGiDc+VS9KXOJIQWSV/S6GrA3WVqNOhJIYnwwmIE=;
 b=OrUV+AwuO1Y5HOJdVXOc3Vy46mEnMMLcAH60AAujWbEV1lQc8wGPUDNckZxexePi01EmRvitN7shz6b4cligxwHVOruU3rMG6FCcUWEv8MLv0cPDMzljvyDQn3sE+LOes/jxUff7HbobpigzJxdyIlG2nhGTKuZaYPUB6eJsJt53Iu4rPH609pQ2VsQJIChYvgQraBWbuZpC1h8CRNBN23QL4ZsJRLlQImfS2PIaojw9jyPEeNK1er1SmhRYCxusSdQ0Qeuc+y1pu9D5T9/nx3e1jJ+55IcLG+a7dq5cnpsj7HSmi0PR2FsR7Op+NYTT7M9GRiqrOaNROHoR7Tj8Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAFvGiDc+VS9KXOJIQWSV/S6GrA3WVqNOhJIYnwwmIE=;
 b=boRShZJ2N66tbZ4pyqSIdTtLFf032Jpnaxj0gZ0ql0K9lB+Z2+rSHBPESWtriE4hgr0iB2hOuBBdzq1QPFoNMfSiJ7CMK0UrD0CRS0xPau2+qLmgwRzIQwPsW53Wl5Bevzi0TJsbSVgvmi63KX7zEB5zUBRC9oKRkkqUAwEEF+o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 SAWPR11MB9921.namprd11.prod.outlook.com (2603:10b6:806:54a::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.14; Mon, 23 Nov 2026 20:23:51 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 20:23:50 +0000
Date: Mon, 23 Nov 2026 15:23:46 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Skip OCODE late bind if already running
Message-ID: <awSg0v1GI4tw7h7I@intel.com>
References: <20261123183740.4002390-4-sk.anirban@intel.com>
 <20261123183740.4002390-5-sk.anirban@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123183740.4002390-5-sk.anirban@intel.com>
X-ClientProxiedBy: SJ2PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a03:505::7) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|SAWPR11MB9921:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f224a89-18e7-44af-8319-08df499fafa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|261026140227099003|261102123227099003|261026121527099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|4143699003|11063799006|56012099006|10067099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: vDcYw5PwQDJi8WV/Lue9BJ/JeIrC16bbmnly6F+F/gPV/8ISGK+RpBEufdKl+h+DgOvFqEg8FwqlA33kDfS2ttcgdz9jzMcF1HvMZe8bKIzXF4XIbZLX0l3YpcAYRb8oa6EJEvwWbw03XMvVgub3LM+MhHA8/wyPZMETeBaUGOxcNW7ENACyOXUbBZX2vHzfKxGKRPK6LcqcTmOgtd271BfTjau2fRFUq26gV+ZjtbBpfUN0hXUXqhPjbYgLbvf3Vr0uFwKpO11UxdbWIkScdL80GgjhATHAOvDnFR0Tx2UG+fWrnHri1s1gfbESeBFLQVRPnHWE3TSie3IdBZh01+JBB598UtIs+sSonaqm+GymbK5cPT7YpIq5qEq68+WEf8VptIuOjdz5ceYJaVeGqP1L17Lj9iXhQRlvetIEtCMv098tPoRwSc0h0VcC5McyNQI7V3GkvZQpjy4rSBNRdtkxZFr2kRIOpdLEIPE0btKFnSFyHvj+jGJOAohaTBpxYHTJfm50uX80cwKQCVKc/jj+x/HDAoB64ZkviVTR5/k0KxXXlvv9plo/Csm8I5yv+1ypCiZcdei9d3Nsy5JCua2dI6DGkDvbHeWEbxpzsAKtIth0Ek/mrg+qyHbf3hNuychaXwwZA2wmLCElIhIGavjuZAR3m66r5q0TugOsyGY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261026140227099003)(261102123227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(4143699003)(11063799006)(56012099006)(10067099003)(261009223027099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+ygvc6mWfjE0IeUU6Qzi+p8CXVjcW6YHXrxX6GTtEWPIVqCuVZ131aD84K2s?=
 =?us-ascii?Q?LoSJl2khV97Vf0iLitFEl4NLCpWLrBam7wDMA8H4hYNl9lPkK4VMT5AlCVJ7?=
 =?us-ascii?Q?28MU8DFUAgGJ0hJ9+NRmO3BLEj5HVJhQPRhAA5BNMbtpZjxLpXDIjIbO06aE?=
 =?us-ascii?Q?QN/MnnR0xAwAClEECvHN2ygXkLoXUp0p5tYeKefSVt7QxnT8VCzJeJFLvsZz?=
 =?us-ascii?Q?IPjWwgHEHOCcICfaXpCknmo2/qGYupOqwzcPBZWTQmKe90g4d3pRSIOIcfFK?=
 =?us-ascii?Q?03gUXKSbM6ABldWzjw45LFLnYd5uRMk0+a0rqrn75a/lhIbI/jIsMmVtfWBf?=
 =?us-ascii?Q?AQAf/Sfy1k0yWAeqhXEAvwQYogqRLY8FFdQ3JQRkKmQlf1DYK1nB+gzwdo4I?=
 =?us-ascii?Q?NcUyERY7vaNk8AqCwI70WT0YnY2BDDLbn8B4K7mlQESolKZDwWklrkah0beO?=
 =?us-ascii?Q?yOFB6y8+M3ovATWN5dojxPFCMnmQk1bpnLwMIpn0LW47ppDaPU2UaEWYGu2p?=
 =?us-ascii?Q?jWDuab5iRxUuYO3V2LmITPjff+Y19wPy8fd70uRgJKRK9vHYH2MXcLze4Ggq?=
 =?us-ascii?Q?38TA9Ij5JXxLfpKLaMbZh+qQHe9NHsuwYXVve0WijuInYAgm3QA6uXiBxPoh?=
 =?us-ascii?Q?8s60+D+YRfFr+3pt2XJMftyF/3fmS51tAM2F1GVe+DpXnp4Go2GX5TAkyPFf?=
 =?us-ascii?Q?DR8XCxq42Ht3qE3PtkBo5y5fvy5oPwPHJl1EvRCvja7kjrQZRpbEuAizB8Wj?=
 =?us-ascii?Q?i4WDt7ZnWR2LlUGYmVWKeP9mxKCM8/FWcsuQt3agB4peKBroiQ/keXibBeBS?=
 =?us-ascii?Q?S8jCDp80sGgIvKY9ZSoR3tvXZwYPDmqoe2G/8sUEE2cA+aV49kn6XJ40yXVp?=
 =?us-ascii?Q?We80P0uBlMXkuO8Nwsk/iG93LpB8nW8R/mqdXwbojoygrs7YdBpM0sJtMGzd?=
 =?us-ascii?Q?VPvgnnIdLwEOchqAap2OK0/lSoBVNTUEgnXzmkRRGUHHmrdRZbrr9hZ3ZRZt?=
 =?us-ascii?Q?CuaRL3m1dl16eyN95/anQkUKcXsSNV8AguDoiZSWDzFxfoxidMmUu4kTwkMU?=
 =?us-ascii?Q?cy9Hm48Kcc0FvpMX702irNIK5LCv5ar3kruCuzC4151TsVyyfZsiWoPuoIkr?=
 =?us-ascii?Q?AOU1dG5oTZ/wZb7H/TMfl2jYMhzLCu46nyHEQtOA2Rb5s81mUC0F2FO6a7NL?=
 =?us-ascii?Q?FnfW1oZUY96g0pGVna5TOIwMIGCW1EU5uyZb9YgxE49xx4PqGqq485j9lItd?=
 =?us-ascii?Q?2UfeQAkZt9Hlx0NGS15JY2nvGROj8PCSatmcXpfNcb04fPlv6R/xAlIfz/2L?=
 =?us-ascii?Q?nw5jd5aAR4ux7YGTEnRSzW4Jn9HSPQIqkVBVmUDnSpgZ6FLpgW2RLLWFn5xz?=
 =?us-ascii?Q?lTSgqefRk0cWKney3FNTAiZ16eqTb7iMAQyP/OV8i7aQpu4Xe8vNjw6C96CG?=
 =?us-ascii?Q?4gewLk4QeOAkX/10Kd/xq7yLNRTH9tuYkCioRyAB+BLYzr2narhVVGXCQ6e5?=
 =?us-ascii?Q?qQxUhHJpHhxyG9TQ9bNYORsLoBuRxGiowmEjxmBqhr6nKbPzB7X4YlreAItk?=
 =?us-ascii?Q?/8f+7GAvLVDOhTwJh0zZ2Tl8i+dzGAQMfWNwYP8frOzhW/py6KvGwvhSXwrh?=
 =?us-ascii?Q?1tsLdqTP22R/cOZ3KIet31iAJ1XZ5YGuytKhATJu2yVH8VFWxJqKPVzntRpn?=
 =?us-ascii?Q?gnFpRG8SBHNbK7NuOw5MzDaq/JgvEl21lNL4hlYKfvUs6iLYiC4lRQ3YH6wl?=
 =?us-ascii?Q?biC4EvltpA=3D=3D?=
X-Exchange-RoutingPolicyChecked: goQVeTfX3UzzRfbQf/nOSoZ9Aane9c4e4VH8tLkTAQXoCS2ANUaNxGwD2oes7slqwKQgZUQqWGgkevw54CHmX+Hi0VTOPHcq3xL+Oo0CfdUM0S9Blen2lUK23REX86kRO0Mqvs50qDme5tlbFZTWkxiZAs/7qYcLDR64iBV5vyvh8XfJXu1GeuwkLSrFPtxT+LMwKH+JNuCXrsBTONEy5BH38MzvhziSjiGR2HjK9ieDpjmv4fhDbx0P81x3rdtx7U/BDV/u/gG78XHlbY+H89qP6CFWPwYb9ixGaMUcrCwxjA/niBCMrt358nzAh+O4P41g7r43bt8rY9qYxv2BNw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f224a89-18e7-44af-8319-08df499fafa2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 20:23:50.7425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmJbVxDtViK0/tYzwKxLAlQXEmdslQXcpklDt+4AthEaBT7cj2LICKojKykKAf/JywXXsYC+XUx6Ym7TPkv8fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9921
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 12:07:42AM +0530, Sk Anirban wrote:
> Check OCODE readiness in the late bind worker and skip the upload
> at probe and resume when it is already initialized.

We are missing a why in this commit message. Perhaps something like:

OCODE stays running across driver reload and warm reset, but the
late-bind worker uploads it again at probe and resume regardless. The
firmware does not expect consecutive reloads, and the delay caused by
reloading a running OCODE leads to firmware issues.

Query OCODE readiness through SysCtrl in the late-bind worker and skip
the upload when it is already initialized. If the query fails or OCODE
is not ready, upload it as before.

A newer OCODE blob is not picked up until the next power cycle; this
will be addressed once firmware provides a reliable way to read the
running version.

then

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_late_bind_fw.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 355d7c841871..dfff1693bf1f 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -258,6 +258,13 @@ static void xe_late_bind_work(struct work_struct *work)
>  
>  	xe_device_assert_mem_access(xe);
>  
> +	/* TODO: Compare the running OCODE version at probe when available. */
> +	if (lbfw->type == INTEL_LB_TYPE_OCODE && xe_sysctrl_is_oobmsm_fw_ready(xe)) {
> +		drm_dbg(&xe->drm, "%s firmware already loaded, skipping\n",
> +			fw_id_to_name[lbfw->id]);
> +		goto out;
> +	}
> +
>  	/* we can queue this before the component is bound */
>  	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
>  		if (late_bind->component.ops)
> -- 
> 2.43.0
> 
