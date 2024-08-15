Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC55C52D7C
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 13:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8951C10E027;
	Thu, 15 Aug 2024 13:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFgeAras";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31AF110E027
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723728688; x=1755264688;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YuCOKqvYeHJP8tKIvF8BpIcS5ZrmboCrPU39lbOW1Og=;
 b=JFgeArasNz7JlxA1TV/3oSi6IuhoOjZ/8WEX3sY5laliYfDBk78/HYhB
 jN7Gh/QPWPXKOdQzd7M8rRss4gMMOUY/5UMD575Wd8Ii2uhcfgTr93/AJ
 GYkTS5cLdRNdvs0hqKHE7f9MgZX+YGD94bnWnzwQ68M5H9Nlge7NUUMWV
 uFYFK5XTi9iQG4yb0G7eqYch8QdMR1/ntFKn7tEh5oOGFTo0txHBaexUv
 NUbzhmOHyaZzlNOxTlpHmXGz/fuUD/V5q1e71kV/TATFjv/hku2GYv0Vq
 ChWMxiQ4QqzF4PXsgZRjuBYLob7UJRlv/x4itdqLqU/nEY22VjpIAhjU6 g==;
X-CSE-ConnectionGUID: 6s5Os8IcQxiScAp7fGKP0w==
X-CSE-MsgGUID: 2v66M8iWTp6b/EZ5uWmYEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="32653712"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="32653712"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 06:31:26 -0700
X-CSE-ConnectionGUID: 9ttEMb4gSru7uYd2mM9KKw==
X-CSE-MsgGUID: LoLQk8+NTpqAmSfD+W2pgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="59627517"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 06:31:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 06:31:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 06:31:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 06:31:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 06:31:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwNa8y3y+B8AeAg/S6i826fN9IOHptDxZLYAqHgvr6z0MysDKOujtlLQhOt5+ABykGr/KVwkPKddw17TZI2RV9A98Ty7QvSssyClez1DLIQZiY0CUjnJRSGe/lFJlEFhdP3dDgTG4mu1iZGCqLcJjx8YS+e3G+4PDrCCw5i9vC8ULQNGG/tN/oGAF1WOpFAnQimfwVFwXpGZQ/BSDNpAuRQjcpAu3MicF+0WzcDl6nXxvvulkBQ/bLUzLhxsBV4MUKR3zaClruDjUI4otHBbkK/9bnitc5K41oHyK+AYzSYNDSeLqo9hBrBKqLjVCp8yyJ6zxltCakFsdOHN4NKH4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCO0vP0gzhFtXpKq2WBZ3k26wgun1e+AD12o9V3mq8g=;
 b=SP8f+lDdAVz1toSUmCHxRKIzel+ViQ7RyY6Ud0pC9mcPYIyvCL+Uy/BiFdPdewD98ZnQRFa1J02DCxt8iBjZsdN6jfr2YHeTi7P82RB5hgWKO/rWjraMBzr29RaoZ1Bh2GRxCou9M5bWNAv8FjYH4558ATbANmkgTpQp18z0zP6vIAwZFK+w/m09Fsxfn5AC8VTUjJLhVtplzcewe90thwBUWDz2aILnDHSjh8E5ahgsa8qDwA+yYhYmflipJpzCvaUa0Nbe29AIJBBKpRDB/Qgc7guCsJV1VHIq0Pa0r2GnH2jvSRirTy/rSjqUwBk2DR/tOY6/QjX3xSldr1ZUfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Thu, 15 Aug
 2024 13:31:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 13:31:19 +0000
Date: Thu, 15 Aug 2024 08:31:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v4] drm/xe: Add driver load error injection
Message-ID: <mwu5sjdsvawxsh6dsnbwbruqmxqfo5iz34k66bwo3pe26ozfom@dcvsabjndldi>
References: <20240814192322.604388-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240814192322.604388-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: b46b2c7f-94ab-4312-1dd1-08dcbd2e8c01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KSWwnDAqZETsOV0MQ6zrn3FnvBO29GEyv46KkrdD2QFQB5c9bxdVh9IxWZU4?=
 =?us-ascii?Q?UIvOZkqUKgDSc9tGdyThmn9dfHo58RufVtPChNV3ceg6BL6zk7ZQBwNMavx2?=
 =?us-ascii?Q?CJCyz/RQAh3cbeIaApEEzJTOqsIbNxHj9itJTsw1xq7n1/oCduXXaQ9+LiB+?=
 =?us-ascii?Q?+3VlGob5G8qVsqDxNCAHnc6x+mHhHw/5FIBA24iiMe0gY8mbSQyNlaHf9KCZ?=
 =?us-ascii?Q?uzziqFpSnVv+yYdkHEk1pE68bRyqjBaK8FYiZ3zdDUe2nPnCoSb/96oGxiQe?=
 =?us-ascii?Q?05/+Opt72pvC1HZwxci1Y7U40VGbidnIf+TqUVdLmHy0tKuo7FZ/clOEGmKY?=
 =?us-ascii?Q?y2S47IReeyglSGkF15Lr1OWFBDJlReGCLxWsvAOCXyvR9+itafunUOeKpBIJ?=
 =?us-ascii?Q?qdR+FNOtTkYpsqVP5ICzQP1fl8Sv6m0jd74/Ua0EDl8Wh1xSqzKfzsrIl5Id?=
 =?us-ascii?Q?cvIwqHhH02SUCFsN22g2e4c5LJsD/VXWbzOQHqOauYCsAqR+o3Xp5NuueX2U?=
 =?us-ascii?Q?hTj9/ffqmtAiinTzU0e7bJD2YtsAdbdqqMnEw9ChPd+k4fJ/dNpt2lyPzlmy?=
 =?us-ascii?Q?HIBrRnssXrazkmGHhoqED9cz588MW4skOOAT8M8zxSDJ68Il8cEKv170RUmZ?=
 =?us-ascii?Q?OhSAamo6RYEmPkW2qPIEypM5ZUIAvgOtVqIhRqD3przoZnlqAtmTrZlEC6Ia?=
 =?us-ascii?Q?BEXUI0E6eBYCJX4+tYrb4BBdHyZl4egeFPVwnuzDys2+V7KogN1mwmnHK9+U?=
 =?us-ascii?Q?mbYRhy8WNI9/ba5IQOufX7KdhuDaONdF1ZuKjneZz679BjT9X7ZVqVLuO/du?=
 =?us-ascii?Q?E9TKDC1CAvr4jLRakx0WGVoOLtQIT0q8hQ9TLGEvco+WqVdIRNy0Kq1QKGfC?=
 =?us-ascii?Q?ZvOBi/mesr2RTRkoTQmMZegj74HsXrmhmi5q1Rnec0YL9Pke9E7fMDqW6O/b?=
 =?us-ascii?Q?7W1Iy8SAc9fiCpxF6otpWotRjncoehtxznAzYuUCbgDnBAH8Xvl5AEKZTsQi?=
 =?us-ascii?Q?BF+R5a+D6vzp0SryX/pgYlz1VSysDFKwHtOV1Epm36c+4WJVc9XqZRYMAZG1?=
 =?us-ascii?Q?tbc5tN0yXaU8H1Ou/Duh6x0XVKJPZCrIeP6GVfcNkROseKM58gl09zbkRYbe?=
 =?us-ascii?Q?9TUETpPJumS3YyfDztENbr2RR2ZGWg7HubiXMs1uqjzsq2FzgKYFrC0kl8fy?=
 =?us-ascii?Q?OPGFm0Pc6qP67qr3nPPPGGPpX9VRQreIYmLiQtRB0xB9olA9MUwOqYLfc4Tc?=
 =?us-ascii?Q?xwGbB2L9zVC5XdPATse4xtPsjVbR46liKtf8mm4ZXY237ebsg1MmPCH1oodR?=
 =?us-ascii?Q?6N8lkSi9xnX44MNsbUw9afvv97XmYfa/rw11uoKdk+ySpEfNSnijF0l7WzRJ?=
 =?us-ascii?Q?ySRShR8JLrPZ57FONbCS9LwOXtGFBoZfoavJeaNbZQhRsPz5fQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IeFpZdweQvL1udus/v1/ZapIgJp/zDMcEjR8IyT663ddx2IH2EkOf4eXetJv?=
 =?us-ascii?Q?Jgt/dv5abeoqAruknmc8kXJRWDrkLlxFcyseqnGB+V5qfv1Nn8g9vtRfP//5?=
 =?us-ascii?Q?CLKXGepE6M27ohG6QXO3UcQtGu1QYCDG9//Fv4E2DHT2HAeZrqjIFH1nCSJP?=
 =?us-ascii?Q?7ZiqR3podrlh/oKF50uqYZRkqQ4vlBGwKaiBC325F6FOb6/TIXoRs8kK7jxU?=
 =?us-ascii?Q?afx9vtDvKzRZR2z+Z8l0qcZRXPHN0Cqiwd3EcaRkg9QQmH7TYduD6mwocffH?=
 =?us-ascii?Q?+1kWBU+56/jE53CDyBvfp94yOLqETL0GFbrQCPb8k51HQPN1vY9GpyQFHFys?=
 =?us-ascii?Q?fU8W00t+hX63LAu4Bcx71p3Eu46MP6WD3FNI1l0psXVBtMa1mQjgN0xuxgPF?=
 =?us-ascii?Q?K/2F+jhxXjtZV6ktegnsLfnJcloS4NFQBOzVNxk8SU1JCUQBeOCsLyWdF+7F?=
 =?us-ascii?Q?HlYoGZ6fglLmTRZIAYfO5zezyNF4cR7+kdCtgbEbOt3/0gX86W8IaJB/SIAW?=
 =?us-ascii?Q?AxX5othP6i5zDL8KSR5U4Wpu7cdmiXgmxirHkQKETvObtqV7J8h49+YXDU+V?=
 =?us-ascii?Q?ZsdJqTs29/Bz5H5M/syKFZKhHSkqHdR5fp+sr7UT5MIqknpnyUIblUKUSURw?=
 =?us-ascii?Q?DI4ztITDrb3y9o1zhN/tRjJosrZFiJy5NfmAsJ96oXH6nV8ZZ23icnvEVrsE?=
 =?us-ascii?Q?jcvPKTdUi4oaabczYk6yGEXntV+dho2W1hLpqXZO7Pe4VVizLp4rRCDfQmXh?=
 =?us-ascii?Q?f4PdT5/xS8czKF3XzEpE1FVLY3ak0jQJlMgJskRL18lrvz76FnqCU99zSkJM?=
 =?us-ascii?Q?pQ6NVPOrU61SxO4fpS6eFBzZqV3imZIsz4pESstLoMjsGpcURL07Vn68WTQr?=
 =?us-ascii?Q?CecWI97TP1P03TF1fj6S4bWW46mB52bR5gbbzh6lHQLnVuqS5jJaGyJ0cqUM?=
 =?us-ascii?Q?v9/2yJ0h751t1cZ8GIBnJt9dEHPQECOuonGQzPb35kqasiUBaizKHyO+hvcC?=
 =?us-ascii?Q?VBaxEgZrGVBovU5QRxwPlFW/IucQFlh9IZ0lgOLfx9IIW8WCu74+MsuJxIOq?=
 =?us-ascii?Q?9jACyndlnn1TkFEHaolFFUKhlB4fff5iCZX/hv3L+3jKCNoqNH+yf5u8E7Ic?=
 =?us-ascii?Q?SsJvmKX7Jcy/SXihajZcim7aCYBYEgX4gsqj3F+0WU7x9zys/8P7fAItifI3?=
 =?us-ascii?Q?AzGdtUuRvuuIqeZ5gb3WtuOdDYM17T6sHP2ShsoOUhv4vXSO7q3pJ7iyglIU?=
 =?us-ascii?Q?OoF+wWW8vV8qU8iE7Cvd3DiXk8Qqezkd7D8KYphkTVqHuf/ZtEUPaGB+yhUL?=
 =?us-ascii?Q?i9hoQAZhXgycnCJquLKJ8CqBO8K0yDI2JNbis5VCoi4QvmYmHb4H1zLBSwA+?=
 =?us-ascii?Q?BMNqt8d8NFfym6CoprUHKuiYzZTrjLkuLc/b1LIoTTRUs1IUAMlLLP7cKJgG?=
 =?us-ascii?Q?PUtTd4eMYjmcFu2UpKgGssnFRpQjEy2kQR7sFCAQSt5xpmedX8KTu7OvmKLF?=
 =?us-ascii?Q?+nTjd104kZM93K253oSXoKU8UyM2bfYHYs5YiNWBBIthEn1qZ8TtncCAKVNy?=
 =?us-ascii?Q?UbcGGNywqnWyw4H6F70XJxPoQcgc8SKGKG1uLbtpyCUbdgHf1dzjMx6MCzvK?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b46b2c7f-94ab-4312-1dd1-08dcbd2e8c01
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 13:31:19.7081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRbNCanWAWvJOSzWCOexvpGAiRzjGjIOmeSu60ZALNnEJW0y7kaczA7uR0aXrjnWQFmLH7cif8Avsrqh9NtP5eF0ZqfRv7oWieCQkRh98ZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6409
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

On Wed, Aug 14, 2024 at 09:23:22PM GMT, Francois Dugast wrote:
>Those new macros inject errors by overriding return codes. They must
>manually be called, typically by turning this pattern:
>
>    err = foo();
>    if (err)
>        return err;
>
>into:
>
>    err = foo();
>    err = xe_device_inject_driver_probe_error(xe, err);
>    if (err)
>        return err;
>
>When CONFIG_DRM_XE_DEBUG is not set, this has no effect.
>
>When CONFIG_DRM_XE_DEBUG is set, the error code at checkpoint X will
>be overridden when the module argument inject_driver_load_error is
>set to value X. By doing so, it is possible to test proper error
>handling and improve robustness for current and future code. A few
>injection points are added in this patch but more need to be added.
>One way to use this error injection at driver probe is:
>
>    for i in {1..200}; do echo "Run $i"; modprobe xe inject_driver_probe_error=$i; rmmod xe; done
>
>In the future this is expected to be replaced by the infrastructure
>provided by fault-inject.h
>
>v2: Fix style and build errors, modparam to 0 after probe, rename to
>    xe_device_inject_driver_probe_error, check type when compiled out,
>    add _return macro, move some uses to the beginning of the function
>v3: Rebase
>v4: Improve commit message and comments, keep if/return rather than
>    change the flow inside the macro (Lucas De Marchi)
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c       | 41 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_device.h       | 23 ++++++++++++++++
> drivers/gpu/drm/xe/xe_device_types.h |  5 ++++
> drivers/gpu/drm/xe/xe_gt.c           |  2 ++
> drivers/gpu/drm/xe/xe_gt_sriov_pf.c  |  2 ++
> drivers/gpu/drm/xe/xe_guc.c          |  2 ++
> drivers/gpu/drm/xe/xe_guc_ct.c       |  1 +
> drivers/gpu/drm/xe/xe_mmio.c         |  5 ++++
> drivers/gpu/drm/xe/xe_module.c       |  5 ++++
> drivers/gpu/drm/xe/xe_module.h       |  3 ++
> drivers/gpu/drm/xe/xe_pci.c          |  6 ++++
> drivers/gpu/drm/xe/xe_pm.c           |  5 ++++
> drivers/gpu/drm/xe/xe_sriov.c        |  6 ++++
> drivers/gpu/drm/xe/xe_tile.c         |  4 +++
> drivers/gpu/drm/xe/xe_uc.c           |  1 +
> drivers/gpu/drm/xe/xe_wa.c           |  5 ++++
> drivers/gpu/drm/xe/xe_wopcm.c        |  4 +++
> 17 files changed, 120 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 206328387150..a2ccdc4115ac 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -316,6 +316,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> 	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
> 			      xe->drm.anon_inode->i_mapping,
> 			      xe->drm.vma_offset_manager, false, false);
>+	err = xe_device_inject_driver_probe_error_override(xe, err);
> 	if (WARN_ON(err))
> 		goto err;
>
>@@ -474,6 +475,7 @@ static int xe_set_dma_info(struct xe_device *xe)
> 		goto mask_err;
>
> 	err = dma_set_coherent_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
>+	err = xe_device_inject_driver_probe_error_override(xe, err);
> 	if (err)
> 		goto mask_err;
>
>@@ -577,6 +579,7 @@ int xe_device_probe_early(struct xe_device *xe)
> 		return err;
>
> 	err = wait_for_lmem_ready(xe);
>+	err = xe_device_inject_driver_probe_error_override(xe, err);
> 	if (err)
> 		return err;
>
>@@ -745,6 +748,11 @@ int xe_device_probe(struct xe_device *xe)
> 	for_each_gt(gt, xe, id)
> 		xe_gt_sanitize_freq(gt);
>
>+#ifdef CONFIG_DRM_XE_DEBUG
>+	/* After probe finishes, stop checking for error injection */
>+	xe_modparam.inject_driver_probe_error = 0;
>+#endif
>+
> 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>
> err_fini_display:
>@@ -995,3 +1003,36 @@ void xe_device_declare_wedged(struct xe_device *xe)
> 	for_each_gt(gt, xe, id)
> 		xe_gt_declare_wedged(gt);
> }
>+
>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>+/**
>+ * __xe_device_inject_driver_probe_error - Inject an error during device probe
>+ * @xe: xe device instance
>+ * @err_injected: the error to inject
>+ * @err_real: the error returned by the actual function
>+ * @func: the name of the function where this is called from
>+ * @line: the line where this is called from
>+ *
>+ * This is not meant to be called directly, only through xe_device_inject_driver_probe_error.
>+ *
>+ * Return: err_real if != 0, err_injected otherwise
>+ */
>+int __xe_device_inject_driver_probe_error(struct xe_device *xe, int err_injected, int err_real,
>+					  const char *func, int line)
>+{
>+	if (err_real != 0)
>+		return err_real;
>+
>+	if (xe->inject_driver_probe_error >= xe_modparam.inject_driver_probe_error)
>+		return 0;
>+
>+	if (++xe->inject_driver_probe_error < xe_modparam.inject_driver_probe_error)
>+		return 0;
>+
>+	drm_info(&xe->drm, "Injecting failure %d at checkpoint %u [%s:%d]\n",
>+		 err_injected, xe->inject_driver_probe_error, func, line);
>+
>+	xe_modparam.inject_driver_probe_error = 0;
>+	return err_injected;
>+}
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index 2c96f1b2aafd..0d0187819e92 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -184,4 +184,27 @@ void xe_device_declare_wedged(struct xe_device *xe);
> struct xe_file *xe_file_get(struct xe_file *xef);
> void xe_file_put(struct xe_file *xef);
>
>+#define XE_DEVICE_INJECTED_ERR -ENODEV
>+#define xe_device_inject_driver_probe_error(__xe) \
>+	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, 0, __func__, __LINE__)
>+#define xe_device_inject_driver_probe_error_override(__xe, __err_real) \
>+	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, __err_real, __func__, \
>+					      __LINE__)
>+
>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>+
>+int __xe_device_inject_driver_probe_error(struct xe_device *xe,
>+					  int err_injected, int err_real,
>+					  const char *func, int line);
>+#else
>+
>+static inline int __xe_device_inject_driver_probe_error(struct xe_device *xe,
>+							int err_injected, int err_real,
>+							const char *func, int line)
>+{
>+	return 0;
>+}
>+
>+#endif
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 16a24eadd94b..5097376aec28 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -491,6 +491,11 @@ struct xe_device {
> 		int mode;
> 	} wedged;
>
>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>+	/** @inject_driver_probe_error: Counter used for error injection during probe */
>+	int inject_driver_probe_error;
>+#endif
>+
> #ifdef TEST_VM_OPS_ERROR
> 	/**
> 	 * @vm_inject_error_position: inject errors at different places in VM
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 58895ed22f6e..b90acc7eedba 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -378,6 +378,7 @@ int xe_gt_init_early(struct xe_gt *gt)
> 	xe_reg_sr_init(&gt->reg_sr, "GT", gt_to_xe(gt));
>
> 	err = xe_wa_init(gt);
>+	err = xe_device_inject_driver_probe_error_override(gt_to_xe(gt), err);
> 	if (err)
> 		return err;
>
>@@ -564,6 +565,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
> 		goto out_fw;
>
> 	err = xe_uc_init_hwconfig(&gt->uc);
>+	err = xe_device_inject_driver_probe_error_override(gt_to_xe(gt), err);
> 	if (err)
> 		goto out_fw;
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>index ef239440963c..09e1fe745ada 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>@@ -7,6 +7,7 @@
>
> #include "regs/xe_regs.h"
>
>+#include "xe_device.h"
> #include "xe_gt_sriov_pf.h"
> #include "xe_gt_sriov_pf_config.h"
> #include "xe_gt_sriov_pf_helpers.h"
>@@ -54,6 +55,7 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
> 		return err;
>
> 	err = xe_gt_sriov_pf_service_init(gt);
>+	err = xe_device_inject_driver_probe_error_override(gt_to_xe(gt), err);
> 	if (err)
> 		return err;
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index de0fe9e65746..74e598294f90 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -351,6 +351,7 @@ int xe_guc_init(struct xe_guc *guc)
> 		goto out;
>
> 	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
>+	ret = xe_device_inject_driver_probe_error_override(guc_to_xe(guc), ret);
> 	if (ret)
> 		goto out;
>
>@@ -408,6 +409,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> 		return ret;
>
> 	ret = xe_guc_pc_init(&guc->pc);
>+	ret = xe_device_inject_driver_probe_error_override(guc_to_xe(guc), ret);
> 	if (ret)
> 		return ret;
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>index beeeb120d1fc..ed715a252f6a 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>@@ -194,6 +194,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> 	ct->bo = bo;
>
> 	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
>+	err = xe_device_inject_driver_probe_error_override(xe, err);
> 	if (err)
> 		return err;
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index bdcc7282385c..af322f5c8159 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -136,6 +136,11 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
> {
> 	size_t tile_mmio_size = SZ_16M;
> 	size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
>+	int err;
>+
>+	err = xe_device_inject_driver_probe_error(xe);
>+	if (err)
>+		return err;
>
> 	mmio_multi_tile_setup(xe, tile_mmio_size);
> 	mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>index 923460119cec..806b6c1f8a7f 100644
>--- a/drivers/gpu/drm/xe/xe_module.c
>+++ b/drivers/gpu/drm/xe/xe_module.c
>@@ -53,6 +53,11 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
> MODULE_PARM_DESC(force_probe,
> 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>
>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)

see comment from Gustavo. I think this is a good place to paste part of
the commit message:

/*
  * The error code at checkpoint X will be overridden when the module
  * argument inject_driver_load_error is set to value X. By doing so, it is
  * possible to test proper error handling and improve robustness for
  * current and future code. One way to test multiple error injection
  * points:
  *
  * for i in {1..200}; do
  *     echo "Run $i"
  *     modprobe xe inject_driver_probe_error=$i;
  *     rmmod xe;
  * done
  */

>+module_param_named_unsafe(inject_driver_probe_error, xe_modparam.inject_driver_probe_error, int, 0600);
>+MODULE_PARM_DESC(inject_driver_probe_error, "Inject driver probe error");
>+#endif
>+
> #ifdef CONFIG_PCI_IOV
> module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
> MODULE_PARM_DESC(max_vfs,
>diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>index 161a5e6f717f..47cefaf8d79b 100644
>--- a/drivers/gpu/drm/xe/xe_module.h
>+++ b/drivers/gpu/drm/xe/xe_module.h
>@@ -20,6 +20,9 @@ struct xe_modparam {
> 	char *force_probe;
> #ifdef CONFIG_PCI_IOV
> 	unsigned int max_vfs;
>+#endif
>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>+	int inject_driver_probe_error;
> #endif
> 	int wedged_mode;
> };
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 3c34b032ebf4..bac07779d353 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -626,6 +626,7 @@ static int xe_info_init_early(struct xe_device *xe,
> 				 desc->has_display;
>
> 	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
>+	err = xe_device_inject_driver_probe_error_override(xe, err);
> 	if (err)
> 		return err;
>
>@@ -645,8 +646,13 @@ static int xe_info_init(struct xe_device *xe,
> 	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
> 	struct xe_tile *tile;
> 	struct xe_gt *gt;
>+	int err;
> 	u8 id;
>
>+	err = xe_device_inject_driver_probe_error(xe);
>+	if (err)
>+		return err;
>+
> 	/*
> 	 * If this platform supports GMD_ID, we'll detect the proper IP
> 	 * descriptor to use from hardware registers. desc->graphics will only
>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>index 9f3c14fd9f33..2de8383b745d 100644
>--- a/drivers/gpu/drm/xe/xe_pm.c
>+++ b/drivers/gpu/drm/xe/xe_pm.c
>@@ -228,6 +228,7 @@ int xe_pm_init_early(struct xe_device *xe)
> 		return err;
>
> 	err = drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
>+	err = xe_device_inject_driver_probe_error_override(xe, err);
> 	if (err)
> 		return err;
>
>@@ -246,6 +247,10 @@ int xe_pm_init(struct xe_device *xe)
> {
> 	int err;
>
>+	err = xe_device_inject_driver_probe_error(xe);
>+	if (err)
>+		return err;
>+
> 	/* For now suspend/resume is only allowed with GuC */
> 	if (!xe_device_uc_enabled(xe))
> 		return 0;
>diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
>index 5a1d65e4f19f..b19b06c72870 100644
>--- a/drivers/gpu/drm/xe/xe_sriov.c
>+++ b/drivers/gpu/drm/xe/xe_sriov.c
>@@ -102,9 +102,15 @@ static void fini_sriov(struct drm_device *drm, void *arg)
>  */
> int xe_sriov_init(struct xe_device *xe)
> {
>+	int err;
>+
> 	if (!IS_SRIOV(xe))
> 		return 0;
>
>+	err = xe_device_inject_driver_probe_error(xe);

there was no failing point here.


>+	if (err)
>+		return err;
>+
> 	if (IS_SRIOV_PF(xe)) {
> 		int err = xe_sriov_pf_init_early(xe);

inject one here, for PF


and one a few lines below.

	xe->sriov.wq = alloc_workqueue("xe-sriov-wq", 0, 0);
	err = xe_device_inject_driver_probe_error(xe);
	if (!xe->sriov.wq || err)
		return -ENOMEM;

>
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>index 15ea0a942f67..d70f1f61c096 100644
>--- a/drivers/gpu/drm/xe/xe_tile.c
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -124,6 +124,10 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> 	if (IS_ERR(tile->primary_gt))
> 		return PTR_ERR(tile->primary_gt);
>
>+	err = xe_device_inject_driver_probe_error(xe);
>+	if (err)
>+		return err;

I guess this is ok since xe_tile_alloc() only fails with -ENOMEM and it
uses drmm_zalloc(), which will get things free'd even if we inject an
error in a place that doesn't currently exist.

same thing for xe_gt_alloc() that only fails due to allocation failure.
It deserves a comment in this function though.



>+
> 	return 0;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>index 0d073a9987c2..0c40fbdf21ee 100644
>--- a/drivers/gpu/drm/xe/xe_uc.c
>+++ b/drivers/gpu/drm/xe/xe_uc.c
>@@ -59,6 +59,7 @@ int xe_uc_init(struct xe_uc *uc)
> 		return 0;
>
> 	ret = xe_wopcm_init(&uc->wopcm);
>+	ret = xe_device_inject_driver_probe_error_override(uc_to_xe(uc), ret);
> 	if (ret)
> 		goto err;
>
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 28b7f95b6c2f..156a77b27593 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -825,6 +825,7 @@ int xe_wa_init(struct xe_gt *gt)
> 	struct xe_device *xe = gt_to_xe(gt);
> 	size_t n_oob, n_lrc, n_engine, n_gt, total;
> 	unsigned long *p;
>+	int err;
>
> 	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
> 	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
>@@ -836,6 +837,10 @@ int xe_wa_init(struct xe_gt *gt)
> 	if (!p)
> 		return -ENOMEM;
>
>+	err = xe_device_inject_driver_probe_error(xe);
>+	if (err)
>+		return err;


this could be:

	p = drmm_kzalloc(&xe->drm, sizeof(*p) * total, GFP_KERNEL);
	err = xe_device_inject_driver_probe_error(xe);
	if (!p || err)
		return -ENOMEM;

to keep the same return point

>+
> 	gt->wa_active.gt = p;
> 	p += n_gt;
> 	gt->wa_active.engine = p;
>diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
>index d3a99157e523..c9be9d31d3ae 100644
>--- a/drivers/gpu/drm/xe/xe_wopcm.c
>+++ b/drivers/gpu/drm/xe/xe_wopcm.c
>@@ -263,6 +263,10 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
> 		return -E2BIG;
> 	}
>
>+	ret = xe_device_inject_driver_probe_error(xe);
>+	if (ret)
>+		return ret;

check:
	ret = xe_device_inject_driver_probe_error(xe, ret);
	if (__check_layout(xe, wopcm->size, guc_wopcm_base, guc_wopcm_size,
			   guc_fw_size, huc_fw_size) && !ret) {


I think now I covered all the current injection points. Feel free to
add:

// Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

in the next rev.

thanks
Lucas De Marchi

>+
> 	if (!locked)
> 		ret = __wopcm_init_regs(xe, gt, wopcm);
>
>-- 
>2.43.0
>
