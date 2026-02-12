Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59506EE3685
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 13:56:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BF110E265;
	Thu, 12 Feb 2026 13:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5JXsUo+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5C510E265
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 13:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770904561; x=1802440561;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5hM2avapVJaSC6jh6LwHQcawxPsfxnnVfe0BoE1yuNQ=;
 b=H5JXsUo+Nb60ba7HZKOq6u5SqqkNeP1dq1SGohgZvKUbpK4Tqph7n3Gx
 kmsP5CV6K1nFdU0IW9SYTpm/3lm+qIMRcVrXgFXcz3bLMIiWkrjM5yxGO
 +YCBnfYUa6blQ+pBRDwDhdWWYMizxHYfhNf68571lxB/Mb3SCIQwQz2dn
 AYz3TVxsh1LworYCJ/xaJZwW6u2IlF8gj9HyBVHZQoFHr3xYir8dijX82
 Gb2CORfj8ncXiA0eQjkUqnWGANAkVU+EbX/SY6su7M1j2wNJJXXWTfdO0
 j/++inhQyVfo37+IQbNZ3V3dU7yZ2hN4O04ENXmU9F1ME65WELyrNFBxd A==;
X-CSE-ConnectionGUID: x+wonGKQRliSt4Q6aOYa0A==
X-CSE-MsgGUID: VFSeHQfXQYek0cX/0yOZpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="83442989"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="83442989"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 05:56:00 -0800
X-CSE-ConnectionGUID: QEIiazcJRLW64IA7/8zWJA==
X-CSE-MsgGUID: xsnvYAzuRhGeQX3oxOd5dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="216761841"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 05:55:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 05:55:54 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 05:55:54 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 05:55:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDExZzuGGif2UayEcnncsHu/NNWJMgJb8grTOY+JYEfcoSDGSJUNm8wCECvHU28YAYhBDLoeRit0hKPQb7PqdGZnXj6MZQNMX7y+IXvNOArXaj1p12+FYY+3kRX6qa84FfoGoGSBSDDbg1Lkw2dvbG8780t2AqAhtXpUajnuAgv+u9YtemKognNevM6TJ+9dBCEkWL5rCFwIlqrfrtOKweN1ul7Q8QoqVdtHX6fs0twvzth9VwaiMWQHArV9MzrrXZ944Rk6dsPFPbqMig4DdQWcLHEbiFEP2gAVKhQeDqtUyx+S9Y6VLbKlrOMAScVFv/EyiocRN4kJrg39p41YFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrW908PqfSyI4sRnqUcB7RY+yLTZyQDX7EMUvBU/GWk=;
 b=Vgt/MU0ZnfrXr4zZ2zPMPg0r+7u62/dTKVk4Lc/D0ta1/vFR/7JluA8bA8GMMmJGqaeZpjfV6y28nDYDlAcU/t4Rq0Xl4j/HrBeQh2u/mcXsu522LNtgvhWL30fQm/dGvK7Hs0v+bd5UXaeNoRxVaDtCpbNHXSpfuSUIT20pHizc/7A4dF9q8ThBxv5NJkLI4On/BVca9YLYCYKhRE+NHpwB86tQA6Xr3bfty42BzaOqYuXVoSNwu2Mp/CubgX1TrHjxMC5AWfNE8feMePLH5bcwop/f43bPke02+/rp1duj8lGOyvDpxTHEqg+dLmGta5keYx+GpOGgw3r4mrQXfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB8504.namprd11.prod.outlook.com (2603:10b6:510:2fe::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Thu, 12 Feb
 2026 13:55:46 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 13:55:46 +0000
Date: Thu, 12 Feb 2026 08:55:41 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <lukasz.laguna@intel.com>
Subject: Re: [PATCH v1] drm/xe: Update xe_device_declare_wedged() error log
Message-ID: <aY3b3cjjr-HDhgeE@intel.com>
References: <20260205113424.1629204-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260205113424.1629204-1-raag.jadav@intel.com>
X-ClientProxiedBy: SJ2PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:a03:505::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB8504:EE_
X-MS-Office365-Filtering-Correlation-Id: b989e970-3d9a-4e9f-bb80-08de6a3e6bad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8bGe58FjmLuoqO/zKu1E35cSbz4Efxle1szC63EEoLEZ6LWWKWP5rduJ5LDa?=
 =?us-ascii?Q?Nqmgz6tQ4RFvm0xepqM1efJSupUrzZemDXnhicSVa+ccrJ37Sqa4ERDk2i89?=
 =?us-ascii?Q?0/zcxWglBFEV7ujH9fSJnPhwIyD02b7dHHzqwqXqpqL9rviqU+T/S+deXO59?=
 =?us-ascii?Q?d0Fsgm8tGd4tMs/ATG6zLMuD7J+7a+p1qeMOenvloIk4MwP6CM3nc33/DGLa?=
 =?us-ascii?Q?zxkG6+DxIaU/MGighmums+t8yVWN1p5s5o+DItF5DGhhmlYLQb168olOenZh?=
 =?us-ascii?Q?7hsl1ZCMInDke0m9om0HOf7YI+vz7IxEG3NQg6YOUehZvKrfYFuJuc23r7v9?=
 =?us-ascii?Q?lJILDbYh97dbc1y3UUhLKGvcVrQ55l4kZ/PQ7CAW8XreMsRlz3EvhL+SvBXL?=
 =?us-ascii?Q?UqWigfglAEEHBzEZdTCPh9NHG0Gusn2o5uTHzvNZLbXgNZjH9eWzjLXq+ji2?=
 =?us-ascii?Q?VE6JT4ss9/tQgGS666LtRtnfFV2S7Vt1DWUue5HXXt3MTDhw1b/pW0Td8H5L?=
 =?us-ascii?Q?ZjjpWM36iBk36zt6mTqipk0Dz+C+XkOUOaAzQPYavW5TpoowHWy0f78V6t0Y?=
 =?us-ascii?Q?vVG9FSO9j3fUrNyjoQprZUEmQ7UtluHaIK5Gb3cpwAjvnfXkp/wmFyqJV1qz?=
 =?us-ascii?Q?y0xu6QAPnH5FLEOazRwmbpQ3vvyTeanKbs+WP6Q0SFuaOs8b7klBmA3/Y1bQ?=
 =?us-ascii?Q?7Q+mbeVQyEzaq+ud0wRDZcS0Ok6aIibQrWAx6G5lWQGQ+X/pLu2VaiJDg1b3?=
 =?us-ascii?Q?JDfTSDFEfEMAYbgIQNeaFv5o7gLC1vloSk3/JiIZcJe48ozqRDZuE+EIteGE?=
 =?us-ascii?Q?ovxIoB6nQ+9WquWJb36+6X7jl+WPtdfshxEbB3Aviqjft3MIjdydSxLinspQ?=
 =?us-ascii?Q?ePjMQTvD5AelQRK9Bnq/2lytLRpWXmyG2AmJvXFw742Kgpv5AoUNpJHmvSsN?=
 =?us-ascii?Q?0cqZiLfTnncOjzVbuxvkZugZW6aXymwM1qSWBJWm2NOlj2RYvP3+ng1czJbu?=
 =?us-ascii?Q?n6P0YazWgoLVcLbEk5g7WfLNc7wey7euP4Sy65J733DFasWEFvaCHBoyP8C9?=
 =?us-ascii?Q?LPykX/9rpG8cAQ/eING7nRKvFjtwyDZbmO1zlbbXFjlwNsf9RgtWT0iyPhm2?=
 =?us-ascii?Q?1lEA3NhY4tSXqLa3/WQ7epBnM+cwTHeVzw5kKIwvXPPLX9zd8f3kcJ7HNuYx?=
 =?us-ascii?Q?UE26JW7H5qVYAj/4DDLLSycZQx/ACW3u9msXTDg8qOfHg3slsAeH/XrzABiV?=
 =?us-ascii?Q?976Df0CCZ2HhGirQNQmw+p1GLmSxuZrgBTj6nj8Y2vcmHEc1tST7GVeqWD9u?=
 =?us-ascii?Q?u53ZvqvyplvNG+mZ9IdrtSKUXSSbGTzXyUKtYd93ruAhOfWCVArOK7ZO5Dll?=
 =?us-ascii?Q?rwBLnfZoWdLg9mn06apm7Bhi6jXeU50+nuoZAH/0IvNy8u7dRzk34sIOJzac?=
 =?us-ascii?Q?YSWTytMo943/Rzf73RPuTdnsHNvDamtnzZVdx14i8D3w6hJkjVKkmNL2Q097?=
 =?us-ascii?Q?gjYyQXIoAR8IjSw/rjTyHXYiD7XN7v7JVcEG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ukkDQhmFUpUJfh1xfzpz4GW3+HPnlFFdWoBX3Gm+n3Q8E+WtRjyEgAsqWCSt?=
 =?us-ascii?Q?VRSXft3fF78UCyFaQeLl5wW6xWAMakGrplA8Y1b2lUpU3JBPZ3Bb+Accx9NQ?=
 =?us-ascii?Q?vTwXOxQUDpquLgF7nPyfp2sUuJGejn0g2QitSAyMP/jDBkQ/63rhrvuOn/71?=
 =?us-ascii?Q?uO8DYukjEIVhdZQjn7YvuzliDwpsBYFAvrrVGpBdMbD7RAeVg1DpiYmHS8nZ?=
 =?us-ascii?Q?0ANt0Wx6xwXcJsewQ6gxD3r4htBp3XPOJ9UdMQq/UDnzga8FSLR8OPYHVMIh?=
 =?us-ascii?Q?/HbFnEdjtgedMdS0rLriK38Jyruj2zKa63cjHSj0wcfGQtQI7bYFeqxHpZbD?=
 =?us-ascii?Q?sm+QczTxseJx5Vx3ihdu/JTFdeyuDQCT8j2b8LouIMfpdx8UY/jPANjo8usZ?=
 =?us-ascii?Q?fSEBOMdClynU0aQjF+twcWfsMfIbxbSMI+E6Xjw5fRoV72Kymkr6sBk6k+lS?=
 =?us-ascii?Q?jkd6Qv3hyg6gc0z6tWthAtBb7GjnYHJXiCdlown4fLFlReGMD81IGF2bxOfV?=
 =?us-ascii?Q?BxcTG/Rvw0/qOh33rU0zc/RjJlIL6+LzYgFmzpZm46yaaelw7637Gav4CH19?=
 =?us-ascii?Q?csND16f9aKPYUpC5Mf9mxKXeBYCryyQ242vzYS6joOktg6CSaKf1w5mbQme7?=
 =?us-ascii?Q?UO6giC555qTT2GFeLhHK4H0MqWIp8b16fkuBhyvrwcW62WKF1rWiPk8MLcsp?=
 =?us-ascii?Q?Tp8PTNx0vpxQYkdCSVaG/qmpUjjBDqjLxuC2OPj/y/iyKida0TNAsAnNjhfy?=
 =?us-ascii?Q?mLO+JjO+2KKOzXZ1RPDbmkAW5wtdH92+E0g+53qGRzYtksUPQlJ7jc5+UEY2?=
 =?us-ascii?Q?nFvSWIIyux7hPGDFwv0M+U23ek3IC/uhj9x/wFkDFNRKuzeisQui5I1EsWdx?=
 =?us-ascii?Q?gOdzs/S8DDx+2U9wSRbrtC3VKamHtd1vvRX6B5k3JYE5XGsoWj4Jyg7eLIEU?=
 =?us-ascii?Q?uap26FRjdF2wUzj2qbt5ImUhsVtFPZO3/7Zwypb6z0kiYjoyGqPWieWmyjrj?=
 =?us-ascii?Q?DqGmaw8LsvrZOAtenu0zsZGV69XoZc+bHGHFoxy5FjH/pd6SYkMBnEIUBy4a?=
 =?us-ascii?Q?ZZWqIr3sBv7jn+g+rHO7HihvD0YhTMga0Xg08KPO+r+oChnRzFJ8c0BLQpNb?=
 =?us-ascii?Q?A35/YXqhrklsRaDIf0+SufhA+5+c90AD+/DO0PxbXI219ig4XCuUliIJs2qp?=
 =?us-ascii?Q?EneG/Nll/1t7mIp0hw2vwVWUOZ/CT3oXNkCb+ZDnVifCt4UUSZ5mi9mNpfxF?=
 =?us-ascii?Q?Lr1pfN2Hcm864dXb5BGQzUoikZmCWp0puSFaGDq2lvP+n0bQzLnEdmxSE4TS?=
 =?us-ascii?Q?FRI5xTo2O+4Pp3LyfYUAUmPaNDgO3hiGlkaD/xccmxYrNuUmrJWXcAGQjDnK?=
 =?us-ascii?Q?ur4LCtvKrUET5gaObeRYhDOap/vQf3RxjUVmQPsou2fTa/SYXyOa4Gp2nzBO?=
 =?us-ascii?Q?kq0H+raWr/WqMYu+lMkZT155HyTSGKmcPQ8VJLIo2BfAX6BklzZApa04NBAl?=
 =?us-ascii?Q?xFB5fwyBC3gijrblSLRqACUTl3cVoRiqzIZBhuoVotmWEs/E0H0ffXNE6h4m?=
 =?us-ascii?Q?8Aa2ueCyAXuBUFv6NOBp9FIFBWbvDMe/QTWh3onAH3s6e1B1OSNmg55ozk7M?=
 =?us-ascii?Q?KPtKWu66C43iqLUZejsZUc9MmPjq/WtdBXUwUlYN0Z6BvnausEwfJZWcR9PN?=
 =?us-ascii?Q?mCQCI1TBR8CRaW+fQ3DpBE9gBfq3UrarTM0rQy0LPU634lVg30Sf1PqHJEm6?=
 =?us-ascii?Q?LVT0oWGIRQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b989e970-3d9a-4e9f-bb80-08de6a3e6bad
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 13:55:46.3343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hNs11hnX4qzAlqB3/UYlZX620zDHzAumwEVslXc0Le1lcSDVCrTY02goUtzp0G2O7sHp+5EGm31UBPAdUgr3jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8504
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

On Thu, Feb 05, 2026 at 05:04:24PM +0530, Raag Jadav wrote:
> Since the introduction of DRM wedged event, there are now a few different
> procedures to recover the device depending on selected recovery method.
> Update the error log to reflect this and point the user to correct
> documentation for it.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushing this right now to drm-xe-next...

> ---
>  drivers/gpu/drm/xe/xe_device.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 815f0b0c9dfd..e59555896471 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1317,7 +1317,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  		xe->needs_flr_on_fini = true;
>  		drm_err(&xe->drm,
>  			"CRITICAL: Xe has declared device %s as wedged.\n"
> -			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
> +			"IOCTLs and executions are blocked.\n"
> +			"For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
>  			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>  			dev_name(xe->drm.dev));
>  	}
> -- 
> 2.43.0
> 
