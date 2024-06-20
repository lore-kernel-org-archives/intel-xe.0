Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D2DC27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 17:29:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC64810EB84;
	Thu, 20 Jun 2024 17:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JSrO7Mub";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADBF10EB84
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 17:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718904539; x=1750440539;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AVoURejiu7JoelWXfz4GHeTnAh69diCVbPmTfEVx5bY=;
 b=JSrO7MubrjmzvhbXzRCJUBQRbCINfNhxwQQfpSJgn7brklFSyUmkx2D+
 kdxVkIla1GWRB0xDQ8C2tVyv/eCLWwhT5gPka2bDYKzjTJWWqbpW6SUpx
 KFHnS3ta8YIZTbyYaGvNUC/wAlPVZMn+twkozrSfHdLgrEZaomeZCKLFU
 WTbX8Oy37mpIWTWysFZ06l520goJuMzdqlc8Ef276aojZeeBOKCgfYOAl
 hrKNKaPSypP03nakxQXakxwJbaA3hjyE3u1Iyk/NkA2SCy++PkNQT/x2T
 Mm4kl1qZWUc+oQX8QTBzO7qFy63KVBUSABaarql3IkyX7B44OPKCWw2rR Q==;
X-CSE-ConnectionGUID: uWgXV27YRpuJDPaKp48sjQ==
X-CSE-MsgGUID: yQWl9piiQ8aGGbLYV9nm4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15738403"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="15738403"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 10:28:52 -0700
X-CSE-ConnectionGUID: BsPsES2IQ0CuoxAs+NZXGA==
X-CSE-MsgGUID: BX74u1tETH+YBDuOC3c+cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="73042369"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 10:28:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 10:28:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 10:28:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 10:28:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJcjfjS2StLFW6zwEysyZJAUVOUgrx8xlZg6YBGWWssZyLSD0cTNByQLGaDXeDLh2s5WRyDwud+uKwfSEGMZA4jsJ/xVGvPDyy5isW4YWfq9RkVOhOn4wNgXcdhI8D8T4DGjKJMqWMFEHWY2bxXMVIbc38IhOoCQco59AkVlA7kj9uQ+YipokdX3yJcHQFDrwyZ3Mj3iiYIsD23W2DQNoqrUONbB3PxBARv84GyMOMawqLooxtpx2p3cEifSQ2VTZFN5BOZJ57KlzNC7BiHH9HJtnNapTDoLeSTFUwW69Vp6sUIkCsdpW29aMVaxzSaVDFEzNaVZMtvqJxQoO8zyWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ag3HJUzFXme9Rl2uVh7rAUPYaz/5ZRGLIUdeJhAgeWQ=;
 b=ksCdU7W4A2K83ev1n2UC98fRDrGvjfATFpPTXFaO7yZMLwcwfhu1B4kPuC3eBiEWj/x6GHNFVcb9mUz4r4BT/Of4pX92Q3Z9ddMFnGRV+2nrbU4SOA7hVQ4OeMx/8//498Nd3bajLWo3mbIoOSHa5sWOpGz5j4baqn5nJv1kfIqYf/Ay/nvOKE2jj0B35sz6r7c9xR+Ui1cv2h9vhGMgqYVoDyU9r2fxF7/RtWCgM2JY+yypnex0B+PPCOexpoSRQKKT7pdNWnbDzHwAROrkDg2vZEksPYjNYCbmPJz+u+gqQsTXjFqhMdeaLN8IE9xVGL8+8xdvjQ9ZggFgmOvURA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB7062.namprd11.prod.outlook.com (2603:10b6:806:2b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Thu, 20 Jun
 2024 17:28:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7677.030; Thu, 20 Jun 2024
 17:28:49 +0000
Date: Thu, 20 Jun 2024 10:28:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 03/17] drm/xe/oa/uapi: Add OA data formats
Message-ID: <20240620172846.GM2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240527014333.603914-1-ashutosh.dixit@intel.com>
 <20240527014333.603914-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240527014333.603914-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR08CA0022.namprd08.prod.outlook.com
 (2603:10b6:a03:100::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB7062:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c33e1e6-9bdb-4028-6521-08dc914e726c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?uSbvsSGe/aCl1eG/FVT00Qh62/ObPV4v40tH0tAWzmfTbty/k45/oqnkI2?=
 =?iso-8859-1?Q?psJxmr8PJP9xu5PnBmEcYCeKrwJ4QmiCIufBPZWjEUfGlCaWeiUg0kEheI?=
 =?iso-8859-1?Q?Mj927qDruHk3hz5KlQxV1n5WlXLKGnmVt0+dlpgLKlwk8ujqH0NUSEhit/?=
 =?iso-8859-1?Q?PcUWzy3rlhTptfjKclBuUFhYF2i7oIe8QzoinpYgTjeGQKrfK6DQdewJqW?=
 =?iso-8859-1?Q?qm4faiLc2YJTKm5qbE3en5KnGlghRhqjUJ7wWyN2cqI+NcUihXgS1/NYtA?=
 =?iso-8859-1?Q?7hnrQreojzlCgg72b0tNCITMIo6Fp+/KlMJao8wM+amSUmqvwMGMr7gLid?=
 =?iso-8859-1?Q?k0eMe9vD4Tk40aB0I72a9d5Fl/KIpf/noUiyX2ubgdOwEcjyQKOZrcZ3Ab?=
 =?iso-8859-1?Q?e7tWW/bczOOzqxtQStO1mR/NJH79fb4Pso8Wm954kP1JIj1z9PywswUHZQ?=
 =?iso-8859-1?Q?I1/gpNhSMH09JycrjK5Y8D6T4kG6LgOMfaXM1CkTIvRwD/Eb7ZSUtgKFJm?=
 =?iso-8859-1?Q?ZnpjbPTRELIuoHzIPH1V740IFrJA/HxSt0E6t6hOKEJuqM7TQwY8kqy2ma?=
 =?iso-8859-1?Q?8igU/oVhF+7zEOVdEGyqhw07qzBb+nm6ft6qoWr1bzBX9aMPgHv+zDsZv3?=
 =?iso-8859-1?Q?qMttoYP18L6xGtriLJj+ZZJUAL0RH59TyaI9HuF5HoAx6k6gQ9KF93b0pc?=
 =?iso-8859-1?Q?M7tMGKLQfZUD3rcfhhISowESNjcuCvvbVPWHugVmuUbDPTtDQZwqni1MP3?=
 =?iso-8859-1?Q?m31CIUkmGejljRqjvFMZX7ez6boRj9WSeI9AI5h1o0g5W8Zruw6RLFdWkR?=
 =?iso-8859-1?Q?zORPF0F9POHXnqD+wjdcKO/mf9uTRpZMOHraGr6qA9NUDNlNdnGn9u91S5?=
 =?iso-8859-1?Q?rhee//VC81bum2xfwKaPHVat2uBf0RmM1+u9jmgCNowFwN5pVMYDe/d209?=
 =?iso-8859-1?Q?aIEo3lE+tkYh4q+HNQ/T+oM3yRA5NFYMNTS2zfKZRwY7GHzl50CfZXQ5/0?=
 =?iso-8859-1?Q?AkDW0EO+vi4AW+qBOlqXodqUGRLJhe4FAwjUz4GndMrEtMeKxvmakLckPv?=
 =?iso-8859-1?Q?5wuBMwHl5AwZK7GiJLuFUGcDhKShFHLyARr2Obc6fzpIgZQlsL77UXc4SR?=
 =?iso-8859-1?Q?v+RA4LRpJIrQpiTkDCfWyM0SSgoq0TbKILCRUfrk9l0ri6Gm84p3LZeuWW?=
 =?iso-8859-1?Q?dbmoqJ5OY1h0liF3IA3weFczENSkUAaZBhQaHV6fHXmztka3IZj52z9BQu?=
 =?iso-8859-1?Q?djz1UpSCgL3Y56teUQOXQ1LKcZSIiP/5aEgepxiw4djffdIc3QO/OzB7Gq?=
 =?iso-8859-1?Q?/AL2B57rwou4syvv2B76xchCQ6qyj41zOLCtGFjElqu1WCeAlSwm7+jcUh?=
 =?iso-8859-1?Q?3AihgZgIWe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8rBUkQvd2hPbTDy5Si84622clrYJjOos2qNCkJmM+enME9iKXmjACvPcrG?=
 =?iso-8859-1?Q?EWJBCQpuSNRorRHTx3Mrb9319F6rO7VuvVlnQDAJ9uxG64JDlSf4g4rucl?=
 =?iso-8859-1?Q?7UhWejUrHb2vJHsYBbgyc7AXUMPPM+k/xvLLZfO1nwXLq4KJOhljkMa8R1?=
 =?iso-8859-1?Q?NM9O3pTXSvBudKg9Q1q1lDFrosSWKgZjo6Gcb9su1wWSUEn2kAh2c4Qwv2?=
 =?iso-8859-1?Q?HaWDVGFanloN3MOCukuNbhgmISE1DhnoVJ4BdBd06DPl9KsJYA5/a4tTvb?=
 =?iso-8859-1?Q?1l2RjzA+3hGBpyDcH/34fYCj2l1PpPzMTfXgNkfBYmsnlkGdCVPgUkxLPV?=
 =?iso-8859-1?Q?OfGFkBxe0DmYjMaMf/YmU+Y/Jx5ey89Oc6VcLYSlARTX62T+p9DA/gchMe?=
 =?iso-8859-1?Q?kDIdVW4IgU7l/dEu15ozHTlX+Ic+cGuMkdGo2jrdBEXjbOAdxu85bqe+hp?=
 =?iso-8859-1?Q?jQh7sbe3o0SmeZVxLDmDldk6jPG2jCCs5ZagoDdiWZorB93f+t0T5i79n8?=
 =?iso-8859-1?Q?W1G5vm0RLycPzfwpozLRkhLSnShLBNHy1R4yaFB+bA+ewSNgAjJxBQVbMy?=
 =?iso-8859-1?Q?ACAf6SyFP56/cEcgqtRlHhhW2XuL+nqp/Phk2AeDH9STUXKZ84TJB22j5y?=
 =?iso-8859-1?Q?O0+/Dp1b1RKNqj38ciB4yMysei/WowEB/OoVe5OlTs8Fjgc1uJ7l7eBWCN?=
 =?iso-8859-1?Q?61ve9KBYxp87uVv/dv2gYhAInlsuhKLuJHjSot5G6O0OZ7eSGVrvUZRGop?=
 =?iso-8859-1?Q?mg7ADlMyu6dGvwP3etwE68JQtfrpvrZAbL2/p3aa1RmS/nTlpyKOot+ubp?=
 =?iso-8859-1?Q?ducyG+kBjLOz+YEQCo8jchiucfXmjAYcq25O3zgiX+WILlHDMNRIXO6GRh?=
 =?iso-8859-1?Q?j+fPRn9k+jmAbtrKF5k6NwYGsmcC82kTLC6N4wKPbHSlXS5vWKhnzK+7kS?=
 =?iso-8859-1?Q?dA0KdVSpYOPYEnTFHx3NuTE5PdAutUZC/uCDlJjHbG8U3Dly3R9/JaEEEL?=
 =?iso-8859-1?Q?bomjT6HsGhIMVgP+RNbIUpG74bf0ZEt+Z4nBm8lqI2T1eATaqyw5+jrBtm?=
 =?iso-8859-1?Q?vrWScbg8ysLzuBDoJn6jTdo7yTPEgPcudQ2Fx9szZHHBGboya7nUhxrDW7?=
 =?iso-8859-1?Q?YHXlcZ7WDgdyNqrZ0giWcOXf0aUnlUQBMRyrNXCqXuFN6I+INXmeQChcCN?=
 =?iso-8859-1?Q?tpcJvPsGkFle00sAimOt3CvqKx3dmFoT/eiAuYryxymdGrLA/imPdMwhSN?=
 =?iso-8859-1?Q?kb9+pc2GceJiGjdzPmKa4lXtiOgEVmCVT6BBB+Ru9JOY0clRxCbOb4ht7/?=
 =?iso-8859-1?Q?h/WOGqqmzbbxhl1xhK0kimHBg0lZZlXargOVf71wE8NMVkL/4XMt+wjlHw?=
 =?iso-8859-1?Q?XylSHN5Pj71XEwcFJ8Xk5LjmjR9JvuHM1VL2X0cGGbnzxJDAl78Iq/HInx?=
 =?iso-8859-1?Q?BqUXAy2gPqFvYb7XddhVhTKHn2IaB0aF2MyRf30XHVfJSt6xyjw1nYYeVR?=
 =?iso-8859-1?Q?sD3IAIhIfp7vr4xhc6mUllRj+n/jpuWRI1EPnwd4vUUEjZjVw0cfRuqvX1?=
 =?iso-8859-1?Q?brNUqvKqxoaS8l0WawNLXpqFEitXUjy9nmuZxgHbuBWojbplDiQEcB7rBu?=
 =?iso-8859-1?Q?StsHFGuah4YBt6b5ba3J6TCeNihXigUR7DdqG/bmxtFxl1uBy5Jwg3SA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c33e1e6-9bdb-4028-6521-08dc914e726c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 17:28:49.4625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/PfIb/ptBBZBD39nKyYnPICHp+6p5y98akjnLYWAIxNj592S1JLY/GEqq+OYCb4t4iPdYLO8AGkG3fBPsK/5q410Tc2Go2mRU6aXan5OWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7062
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

On Sun, May 26, 2024 at 06:43:19PM -0700, Ashutosh Dixit wrote:
> Add and initialize supported OA data formats for various platforms
> (including Xe2). User can request OA data in any supported format.
> 
> Bspec: 52198, 60942, 61101
> 
> v2: Start 'xe_oa_format_name' enum from 0 (Umesh)
>     Fix error rewind with OA (Umesh)
> v3: Use graphics versions rather than absolute platform names
> 
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |   1 +
>  drivers/gpu/drm/xe/xe_device.c       |  13 +++-
>  drivers/gpu/drm/xe/xe_device_types.h |   4 ++
>  drivers/gpu/drm/xe/xe_module.c       |   1 +
>  drivers/gpu/drm/xe/xe_oa.c           | 101 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_oa.h           |  16 +++++
>  drivers/gpu/drm/xe/xe_oa_types.h     |  76 ++++++++++++++++++++
>  include/uapi/drm/xe_drm.h            |  10 +++
>  8 files changed, 221 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_oa.c
>  create mode 100644 drivers/gpu/drm/xe/xe_oa.h
>  create mode 100644 drivers/gpu/drm/xe/xe_oa_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index dd220439fe87..79f45ffc003e 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -115,6 +115,7 @@ xe-y += xe_bb.o \
>  	xe_mmio.o \
>  	xe_mocs.o \
>  	xe_module.o \
> +	xe_oa.o \
>  	xe_pat.o \
>  	xe_pci.o \
>  	xe_pcode.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 50cb8723f54a..d677c20980e1 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -39,6 +39,7 @@
>  #include "xe_memirq.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> +#include "xe_oa.h"
>  #include "xe_pat.h"
>  #include "xe_pcode.h"
>  #include "xe_perf.h"
> @@ -636,10 +637,14 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_heci_gsc_init(xe);
>  
> -	err = xe_display_init(xe);
> +	err = xe_oa_init(xe);
>  	if (err)
>  		goto err_irq_shutdown;
>  
> +	err = xe_display_init(xe);
> +	if (err)
> +		goto err_oa_fini;
> +
>  	err = drm_dev_register(&xe->drm, 0);
>  	if (err)
>  		goto err_fini_display;

I didn't really look at this series earlier, but it seems odd to me that
we're sticking a bunch of OA code at the device level.  Isn't OA a
GT-specific concept?  As far as I know, there's no observability
functionality in the soci/sgunit/display.


Matt



> @@ -654,6 +659,10 @@ int xe_device_probe(struct xe_device *xe)
>  
>  err_fini_display:
>  	xe_display_driver_remove(xe);
> +
> +err_oa_fini:
> +	xe_oa_fini(xe);
> +
>  err_irq_shutdown:
>  	xe_irq_shutdown(xe);
>  err:
> @@ -675,6 +684,8 @@ void xe_device_remove(struct xe_device *xe)
>  
>  	xe_display_fini(xe);
>  
> +	xe_oa_fini(xe);
> +
>  	xe_heci_gsc_fini(xe);
>  
>  	xe_irq_shutdown(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 03bedc33b21a..9099aed495c4 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -17,6 +17,7 @@
>  #include "xe_gt_types.h"
>  #include "xe_lmtt_types.h"
>  #include "xe_memirq_types.h"
> +#include "xe_oa.h"
>  #include "xe_platform_types.h"
>  #include "xe_pt_types.h"
>  #include "xe_sriov_types.h"
> @@ -457,6 +458,9 @@ struct xe_device {
>  	/** @heci_gsc: graphics security controller */
>  	struct xe_heci_gsc heci_gsc;
>  
> +	/** @oa: oa perf counter subsystem */
> +	struct xe_oa oa;
> +
>  	/** @needs_flr_on_fini: requests function-reset on fini */
>  	bool needs_flr_on_fini;
>  
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 893858a2eea0..4e9f31f11920 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -10,6 +10,7 @@
>  
>  #include "xe_drv.h"
>  #include "xe_hw_fence.h"
> +#include "xe_oa.h"
>  #include "xe_pci.h"
>  #include "xe_perf.h"
>  #include "xe_sched_job.h"
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> new file mode 100644
> index 000000000000..3349e645cb72
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -0,0 +1,101 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/xe_drm.h>
> +
> +#include "xe_assert.h"
> +#include "xe_device.h"
> +#include "xe_macros.h"
> +#include "xe_oa.h"
> +
> +#define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
> +
> +static const struct xe_oa_format oa_formats[] = {
> +	[XE_OA_FORMAT_C4_B8]			= { 7, 64,  DRM_FMT(OAG) },
> +	[XE_OA_FORMAT_A12]			= { 0, 64,  DRM_FMT(OAG) },
> +	[XE_OA_FORMAT_A12_B8_C8]		= { 2, 128, DRM_FMT(OAG) },
> +	[XE_OA_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256, DRM_FMT(OAG) },
> +	[XE_OAR_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256, DRM_FMT(OAR) },
> +	[XE_OA_FORMAT_A24u40_A14u32_B8_C8]	= { 5, 256, DRM_FMT(OAG) },
> +	[XE_OAC_FORMAT_A24u64_B8_C8]		= { 1, 320, DRM_FMT(OAC), HDR_64_BIT },
> +	[XE_OAC_FORMAT_A22u32_R2u32_B8_C8]	= { 2, 192, DRM_FMT(OAC), HDR_64_BIT },
> +	[XE_OAM_FORMAT_MPEC8u64_B8_C8]		= { 1, 192, DRM_FMT(OAM_MPEC), HDR_64_BIT },
> +	[XE_OAM_FORMAT_MPEC8u32_B8_C8]		= { 2, 128, DRM_FMT(OAM_MPEC), HDR_64_BIT },
> +	[XE_OA_FORMAT_PEC64u64]			= { 1, 576, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
> +	[XE_OA_FORMAT_PEC64u64_B8_C8]		= { 1, 640, DRM_FMT(PEC), HDR_64_BIT, 1, 1 },
> +	[XE_OA_FORMAT_PEC64u32]			= { 1, 320, DRM_FMT(PEC), HDR_64_BIT },
> +	[XE_OA_FORMAT_PEC32u64_G1]		= { 5, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
> +	[XE_OA_FORMAT_PEC32u32_G1]		= { 5, 192, DRM_FMT(PEC), HDR_64_BIT },
> +	[XE_OA_FORMAT_PEC32u64_G2]		= { 6, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
> +	[XE_OA_FORMAT_PEC32u32_G2]		= { 6, 192, DRM_FMT(PEC), HDR_64_BIT },
> +	[XE_OA_FORMAT_PEC36u64_G1_32_G2_4]	= { 3, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
> +	[XE_OA_FORMAT_PEC36u64_G1_4_G2_32]	= { 4, 320, DRM_FMT(PEC), HDR_64_BIT, 1, 0 },
> +};
> +
> +static void oa_format_add(struct xe_oa *oa, enum xe_oa_format_name format)
> +{
> +	__set_bit(format, oa->format_mask);
> +}
> +
> +static void xe_oa_init_supported_formats(struct xe_oa *oa)
> +{
> +	if (GRAPHICS_VER(oa->xe) >= 20) {
> +		/* Xe2+ */
> +		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u64_B8_C8);
> +		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u32_B8_C8);
> +		oa_format_add(oa, XE_OA_FORMAT_PEC64u64);
> +		oa_format_add(oa, XE_OA_FORMAT_PEC64u64_B8_C8);
> +		oa_format_add(oa, XE_OA_FORMAT_PEC64u32);
> +		oa_format_add(oa, XE_OA_FORMAT_PEC32u64_G1);
> +		oa_format_add(oa, XE_OA_FORMAT_PEC32u32_G1);
> +		oa_format_add(oa, XE_OA_FORMAT_PEC32u64_G2);
> +		oa_format_add(oa, XE_OA_FORMAT_PEC32u32_G2);
> +		oa_format_add(oa, XE_OA_FORMAT_PEC36u64_G1_32_G2_4);
> +		oa_format_add(oa, XE_OA_FORMAT_PEC36u64_G1_4_G2_32);
> +	} else if (GRAPHICS_VERx100(oa->xe) >= 1270) {
> +		/* XE_METEORLAKE */
> +		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
> +		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
> +		oa_format_add(oa, XE_OAC_FORMAT_A24u64_B8_C8);
> +		oa_format_add(oa, XE_OAC_FORMAT_A22u32_R2u32_B8_C8);
> +		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u64_B8_C8);
> +		oa_format_add(oa, XE_OAM_FORMAT_MPEC8u32_B8_C8);
> +	} else if (GRAPHICS_VERx100(oa->xe) >= 1255) {
> +		/* XE_DG2, XE_PVC */
> +		oa_format_add(oa, XE_OAR_FORMAT_A32u40_A4u32_B8_C8);
> +		oa_format_add(oa, XE_OA_FORMAT_A24u40_A14u32_B8_C8);
> +		oa_format_add(oa, XE_OAC_FORMAT_A24u64_B8_C8);
> +		oa_format_add(oa, XE_OAC_FORMAT_A22u32_R2u32_B8_C8);
> +	} else {
> +		/* Gen12+ */
> +		xe_assert(oa->xe, GRAPHICS_VER(oa->xe) >= 12);
> +		oa_format_add(oa, XE_OA_FORMAT_A12);
> +		oa_format_add(oa, XE_OA_FORMAT_A12_B8_C8);
> +		oa_format_add(oa, XE_OA_FORMAT_A32u40_A4u32_B8_C8);
> +		oa_format_add(oa, XE_OA_FORMAT_C4_B8);
> +	}
> +}
> +
> +int xe_oa_init(struct xe_device *xe)
> +{
> +	struct xe_oa *oa = &xe->oa;
> +
> +	/* Support OA only with GuC submission and Gen12+ */
> +	if (XE_WARN_ON(!xe_device_uc_enabled(xe)) || XE_WARN_ON(GRAPHICS_VER(xe) < 12))
> +		return 0;
> +
> +	oa->xe = xe;
> +	oa->oa_formats = oa_formats;
> +
> +	xe_oa_init_supported_formats(oa);
> +	return 0;
> +}
> +
> +void xe_oa_fini(struct xe_device *xe)
> +{
> +	struct xe_oa *oa = &xe->oa;
> +
> +	oa->xe = NULL;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
> new file mode 100644
> index 000000000000..a2f301e2be57
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_oa.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_OA_H_
> +#define _XE_OA_H_
> +
> +#include "xe_oa_types.h"
> +
> +struct xe_device;
> +
> +int xe_oa_init(struct xe_device *xe);
> +void xe_oa_fini(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> new file mode 100644
> index 000000000000..1e339090c90d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_OA_TYPES_H_
> +#define _XE_OA_TYPES_H_
> +
> +#include <linux/math.h>
> +#include <linux/types.h>
> +
> +enum xe_oa_report_header {
> +	HDR_32_BIT = 0,
> +	HDR_64_BIT,
> +};
> +
> +enum xe_oa_format_name {
> +	XE_OA_FORMAT_C4_B8,
> +
> +	/* Gen8+ */
> +	XE_OA_FORMAT_A12,
> +	XE_OA_FORMAT_A12_B8_C8,
> +	XE_OA_FORMAT_A32u40_A4u32_B8_C8,
> +
> +	/* DG2 */
> +	XE_OAR_FORMAT_A32u40_A4u32_B8_C8,
> +	XE_OA_FORMAT_A24u40_A14u32_B8_C8,
> +
> +	/* DG2/MTL OAC */
> +	XE_OAC_FORMAT_A24u64_B8_C8,
> +	XE_OAC_FORMAT_A22u32_R2u32_B8_C8,
> +
> +	/* MTL OAM */
> +	XE_OAM_FORMAT_MPEC8u64_B8_C8,
> +	XE_OAM_FORMAT_MPEC8u32_B8_C8,
> +
> +	/* Xe2+ */
> +	XE_OA_FORMAT_PEC64u64,
> +	XE_OA_FORMAT_PEC64u64_B8_C8,
> +	XE_OA_FORMAT_PEC64u32,
> +	XE_OA_FORMAT_PEC32u64_G1,
> +	XE_OA_FORMAT_PEC32u32_G1,
> +	XE_OA_FORMAT_PEC32u64_G2,
> +	XE_OA_FORMAT_PEC32u32_G2,
> +	XE_OA_FORMAT_PEC36u64_G1_32_G2_4,
> +	XE_OA_FORMAT_PEC36u64_G1_4_G2_32,
> +
> +	XE_OA_FORMAT_MAX,
> +};
> +
> +/** struct xe_oa_format - Format fields for supported OA formats */
> +struct xe_oa_format {
> +	u32 counter_select;
> +	int size;
> +	int type;
> +	enum xe_oa_report_header header;
> +	u16 counter_size;
> +	u16 bc_report;
> +};
> +
> +/**
> + * struct xe_oa - OA device level information
> + */
> +struct xe_oa {
> +	/** @xe: back pointer to xe device */
> +	struct xe_device *xe;
> +
> +	/** @oa_formats: tracks all OA formats across platforms */
> +	const struct xe_oa_format *oa_formats;
> +
> +#define FORMAT_MASK_SIZE DIV_ROUND_UP(XE_OA_FORMAT_MAX - 1, BITS_PER_LONG)
> +
> +	/** @format_mask: tracks valid OA formats for a platform */
> +	unsigned long format_mask[FORMAT_MASK_SIZE];
> +};
> +#endif
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 03df64600aa0..bb87bf0c96f9 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1433,6 +1433,16 @@ enum drm_xe_perf_ioctls {
>  	DRM_XE_PERF_IOCTL_INFO = _IO('i', 0x4),
>  };
>  
> +/** enum drm_xe_oa_format_type - OA format types */
> +enum drm_xe_oa_format_type {
> +	DRM_XE_OA_FMT_TYPE_OAG,
> +	DRM_XE_OA_FMT_TYPE_OAR,
> +	DRM_XE_OA_FMT_TYPE_OAM,
> +	DRM_XE_OA_FMT_TYPE_OAC,
> +	DRM_XE_OA_FMT_TYPE_OAM_MPEC,
> +	DRM_XE_OA_FMT_TYPE_PEC,
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
