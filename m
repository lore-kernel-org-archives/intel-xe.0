Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDC4EE499C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 18:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751ED10E0A2;
	Wed, 11 Sep 2024 18:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAIEgCSS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2124610E0A2
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 18:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726077825; x=1757613825;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Oz5ES3J+baSzRyWpFHXHjEARHKd8qiItDdm5XvoWKbY=;
 b=iAIEgCSSjnULb7TGs8iGjhZwooG5PZ8Hq8ePdZsG1MDp4DhbK+JpogbT
 uUpAoCuKgMV/GhMR/qhdSXNCfg741y2Mv1tTg1qflaP+7q0oWEhKpY8Lq
 YxNE18dmCpSv4InWMIQWW2Yi5NvHiAbICOao2mupk4fL2KuJ0VryRgAKc
 G1zMsTk7VYarZIeNNnFFHZ4PTaj1/FqctGvvTxgLjC5bwUbxukkfQepNJ
 kJR1zXHgPfoFGyr2C4K2ujF/3+9wrieTjJsh2fuAp+QUDGvft5zU3v6nq
 6u5IJ7CiuC55xp4n76RclCi39slML9JMWvDV1stzbXlltJF9s2161Vgki g==;
X-CSE-ConnectionGUID: WpIzITOqTzGqflCXG7UQZw==
X-CSE-MsgGUID: J1+x5fF/QgyBmKVIz+56QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="35563437"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="35563437"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 11:03:45 -0700
X-CSE-ConnectionGUID: R7uNG5U0TOKge+m67JTq6Q==
X-CSE-MsgGUID: fTX0/eKPSUiWrljUnCaugw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="72041236"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 11:03:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 11:03:44 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 11:03:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 11:03:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 11:03:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H35CvBx3IdXTKVo8z1Dmo/+Qy8jl6iS1LynkWU2lulZxgDneNyE0LiBvGgQLjqwTW2SPpcWpnc8PoymiEYxI5o7ULjzKRN79R2yr0Ko7Dx1kceBrO9yh4ZR6MZFs8Hrzh0eHlCPvE1H3VzhzlLqJAe8M/phqMjzsAFVphlTeOH8XhnMRfcX+1diUalmf09JFXv3z6wGygZfeIOH0XlCqb5d+Xu3M91tzp5M32U0lz+v/sLofjZH7/Q9i9Nf7hqW6ROQe0wTGbXEEdOaKl7c2iMx65d36ZwTDtRcyzplaazvkVg5wrN8q3JDKkcLdsKVyA2LT79oJJ6Q+Dy/4zc8g3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OC3pI+lvoYiz0G1wTOiesbb1judPB7SS3qoIqvOIZaA=;
 b=kH7DnoMetiL453FlyOXRz6M16WdPn3lVAoPwCuZH1kP1UJ1ViEsD/g+BdC4TceaR4SBiexQcwcUAUo+v+TMcYaAY7T1Vx8yAgumS+oWoqTtWzsujn04Ndkl/RofFuuuG7k7k9kgfLB1TwUnaeJpTjHQQz5vazQEhOPho0icnGXFHtGeGQZXauW7tVavddMB2lMVf+9dLJqkpEf/qWMowvxSblnBT5rdfitu8H2YBNtVmn4KayjFovIxmMHDoTvB7jKGOKhWZiQ8LW6LXDkTCA5VGSQNDAX/+XaRgpj8YO7ZxoDcnvz6WwFJeaRJLTQrtl31eZ0SeaxkGW3cBP9Xk8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ1PR11MB6154.namprd11.prod.outlook.com (2603:10b6:a03:45f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.33; Wed, 11 Sep
 2024 18:03:39 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 18:03:36 +0000
Date: Wed, 11 Sep 2024 11:03:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH 4/9] drm/xe/xe3: Add initial set of workarounds
Message-ID: <20240911180333.GF5774@mdroper-desk1.amr.corp.intel.com>
References: <20240906215153.31210-1-matthew.s.atwood@intel.com>
 <20240906215153.31210-5-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240906215153.31210-5-matthew.s.atwood@intel.com>
X-ClientProxiedBy: CH0P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:ef::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ1PR11MB6154:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea57be1-031a-4749-b8bc-08dcd28c0e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vcvnbIiT15tRuiQ6DEV1VoM1QTEP7SjPSzn1dVPqbv7OtquiruM8lHugY33s?=
 =?us-ascii?Q?USKRF4D8z1h1JjfrGdswVrwXzyvne+IVy3DGyxB3BWfIN3cFaNocfVqof91C?=
 =?us-ascii?Q?i7DknVMv6B/m/F1B9CA/5zi1hwp/+8ACx3YHdUufcblJAce9NwDm4yo0WjE9?=
 =?us-ascii?Q?PQMeRkTqVCDsGVLfaHd9+4hhvHJizb4GiWYATPJAG4kfgXL19JbJbnCHsuB/?=
 =?us-ascii?Q?StNWutTwJjxMnL/gasJvcghKdzNSfvbxnwAtDPgcaISn/Prjua4aOXDTBnxc?=
 =?us-ascii?Q?Tef2mBjcTzvJZy9YEvoddrcEm9LQTgq5SnztOVuEf20eyxLE1c3aTs1Gqskn?=
 =?us-ascii?Q?fo7zmoDQ7Wc8VH6z2QK4x3JTkSZqxO7GSBtW93zYr5TJAnLjqMNzxxAEV4fY?=
 =?us-ascii?Q?9tVhj/TUfoozu0wBih9hdaYYyCwYD3h2llqbRMi1LNkQZbLEmkmBU/v4kw5u?=
 =?us-ascii?Q?uS/BlSttcg475OUIJZToUCkV0J2qomyhF4317IeS33dEj5V2um83c/cu3m6D?=
 =?us-ascii?Q?8f5WQTfGacyII9tH5CEpCxctyGqxOSQmXuCx5siJievpxMjqZLlHqpL/zCj+?=
 =?us-ascii?Q?+GhoULe9Oiz13SjOHqvIRBuURjbRaDQ8UB1l0Oo4u7GV0z5Xtoykv/b4xt0g?=
 =?us-ascii?Q?cU7fSNAOHiUirHsPaatoQB5+zoPvImAgaUqOQy+v/H92mX2Gl+u8JjnRdLKS?=
 =?us-ascii?Q?2xQVgXTMDwOKWlH9KpA6s+7F6rcO8Jes62soSsRPS4r7l/AA/9DY5vHsNtKn?=
 =?us-ascii?Q?C4fiKHjkXZpvJ13SKrxdgdQHXq//CE0tgVerVtr4wC+oNKg2NEFOgaAYaKwx?=
 =?us-ascii?Q?252VGu7p85AAUJm3VTLLbcXPQN6Vp4/iBZRgpWlNTC651IfHzRBc0W795Egi?=
 =?us-ascii?Q?9K3MWueELWvIZ/0dEqmjOJL0vPoJMogWnBWjE3LZqAJh+dCV5v4mNfxOtbAf?=
 =?us-ascii?Q?0gkad/Vnz73HIB3IbYGfttFIpANjZaRM7Uon07uMZDA8t/1aqZcj+1A97e0B?=
 =?us-ascii?Q?wsst+XNYYoTklYCx03aqYkuCvrG858XJVevpQ5TuhoSaF25MqrQH3uRnxVKT?=
 =?us-ascii?Q?X1+yLWxHnmvZjT+rKuWgJXfeWDdPB+yf6yAv/m0d7TS2rjPQ2lOlWHRz7vBs?=
 =?us-ascii?Q?MT2jnvLxL+zb+WN58kR7EWjm0kd0AevR7pvFinjldgAPRuHnorVNat+6pJ05?=
 =?us-ascii?Q?JDXe/owe7pdBlxhLraNljpAMoCccfDI5llhHHRlAPDd/EvYRAuD9gRGkth7j?=
 =?us-ascii?Q?Mh+A1NvvY0TZg2/tLYneVplUU97B14GEsUOzmdK4S7sIm6JwzpkRGf2+N3Cm?=
 =?us-ascii?Q?f8WgQFYeeWJwUgE8ikyVtkwB703SheBEDFtDWwpmCjPcJg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nR1U5ITSRqrSdgDjCPPckqDt1TSr0GxP4Zf+dUqmVeTTpLVzyVTe4xVV1wR5?=
 =?us-ascii?Q?zNAT+vnIMjjpuuJSDKRug5rh1dcE+AQlpMR81yCq2Voc7abcByyiijgK+Ec/?=
 =?us-ascii?Q?0SleAJsfIp4IRiU3s4l2twGtplY56+6suqaWrjR4haactugUd4PSeMbYeHUs?=
 =?us-ascii?Q?o9gZa4Ubw3e2OHpx75bbyb4fPlufgQ4SVuF+G/2zRpD0DUESc9D0O0uwz80U?=
 =?us-ascii?Q?g+rEHXUcS9Bw4ywpMjLQbZgLqUkXDnogEyDAKzXD989UsO0iHIJhM2K6I3Ym?=
 =?us-ascii?Q?HDispu9xhPyX6LV7PCLJ62rUHfmHU9KnQw49ar+9cp9Hkfl1D3tOlRNcD6Jz?=
 =?us-ascii?Q?nRRrHHP/5IXWPUbIBapB8rG6k/Ano2LLjFA2xF7XlIH4l2I0CZY6QMnV/kbq?=
 =?us-ascii?Q?J6hmLVMjLTTVTjMn9v6Xy9m7hCtq2BdRCIwe5iTj5CZ1AOkSYsKhtBDM9CBR?=
 =?us-ascii?Q?D5LNdmFUdGqa3YEc7K800Wgyr9yLpCr0OhjlYbuiex2rRSmNzN/mWXYM/7Yv?=
 =?us-ascii?Q?FIhKhEpQKUCjKWX07syZk/mTeBKc1AeBRUEYm6Q4k2N81fY2zp+D8JYPCDaH?=
 =?us-ascii?Q?ulv+fseQgPmFLxM/gnfLuNjAVJnQlWiAEa2VOh/7AiDfYOT9D52NELK980rJ?=
 =?us-ascii?Q?/mxPBo31zBPc8YttOL56SzOaTG7h+yKLU8KCwAyX6jQLtWbQ6cOUvoGVMawv?=
 =?us-ascii?Q?UT88wSC4+WSMGi8wTXBOUZ1Fq1xpwBNX/mTczxgBjC/FdEL2N0CLuRqfA723?=
 =?us-ascii?Q?N/crdrZXqS8kHF6WplPRfk55Cztj9V4C9iVurI4YKRi7uGVjXbWUxVQv3LRl?=
 =?us-ascii?Q?aMdVPK98GO8O9+tJ6+9ZwBrEjh8axKoNJRSUg6O+oHbf3Am+QAdElnD+/PBI?=
 =?us-ascii?Q?a/VOYNJ2PEqN7DjCX6jfAZ8O/5B46tJfVd2mbQ8oocwdcPrdk8aP0sGFO/MY?=
 =?us-ascii?Q?K1qDkdChjbk7rif37seI/HxalQPlfXQr4MbDi+IunqNeBLp3Sri4sNB9euRN?=
 =?us-ascii?Q?U6+kfz+QmAJ4TnnZuX8/kCVA1aBvg6/x+/VJfLrhfhK1zgqHfwSp2vrJ2231?=
 =?us-ascii?Q?DGhTVB3qA8nl9tcRzXFua1ANmzGkfvtGyJG8TA8jYSf0SeTv9n/O9t2hvCzX?=
 =?us-ascii?Q?pdiBNAT+bRRnvE/FIiarZnahUsfzl8BAmo4hf+DRQoLgdeJGBnUG2rkBE4A9?=
 =?us-ascii?Q?2IC7yujm7L90jwUj6XiFqERDxvHY2ywdOrlIEjfVg3ksS5g/reK5nQIGDBhn?=
 =?us-ascii?Q?NSLu0YvRWhoui3UbNjZfmxVedjm1vVeqkcGbcroczewwWfCpfA24p//2CgNB?=
 =?us-ascii?Q?BmcUhCH779CJIjwGP4/tnoLh6c7eXOgVuDm8i/DrwbQR6gkksMLP3AbaAu7d?=
 =?us-ascii?Q?i4T3l7z18xw8d+VeNUNmwxs8gAVl7uazaaMJaAG1Zbk4t7vsxWK09NerWTkN?=
 =?us-ascii?Q?AiuAzSjkRRslsA6K51RqgP7TDmYB0DcSwtplEn38kwJAsdoaFwVsU5akHHhl?=
 =?us-ascii?Q?jhDuD3lCqiZcNR2/0/EsWcdqVQqVer1iZQSim6KDgF8WM36Er9fo8vrC8lPN?=
 =?us-ascii?Q?0IzB5k0ioMkK/MfjNLKjMjLZpZAS1amTZCsduQtcg5bKFMgCf4u/tdDkGbcs?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea57be1-031a-4749-b8bc-08dcd28c0e68
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 18:03:36.1373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXR/m8yCMiJqcvG+U/4JxFn0+EfAt7h9iLJ/xbSJcGintonSO0D1/j277ytx4Khz9RYIQIue4h6QW08boYSjdhNhNKfHr4ipbjnDEe8cS14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6154
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

On Fri, Sep 06, 2024 at 02:51:48PM -0700, Matt Atwood wrote:
> From: Gustavo Sousa <gustavo.sousa@intel.com>
> 
> Implement the initial set of workarounds for Xe3 IPs.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  3 ++
>  drivers/gpu/drm/xe/xe_wa.c               | 46 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules       |  1 +
>  4 files changed, 51 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 81b71903675e..7c78496e6213 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -186,6 +186,7 @@
>  
>  #define VDBOX_CGCTL3F10(base)			XE_REG((base) + 0x3f10)
>  #define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
> +#define   RAMDFTUNIT_CLKGATE_DIS		REG_BIT(9)
>  
>  #define VDBOX_CGCTL3F18(base)			XE_REG((base) + 0x3f18)
>  #define   ALNUNIT_CLKGATE_DIS			REG_BIT(13)
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 8ed855b31e95..259221d2f217 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -286,6 +286,9 @@
>  #define   GAMTLBVEBOX0_CLKGATE_DIS		REG_BIT(16)
>  #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
>  
> +#define UNSLCGCTL9454				XE_REG(0x9454)
> +#define   LSCFE_CLKGATE_DIS			REG_BIT(4)
> +
>  #define XEHP_SLICE_UNIT_LEVEL_CLKGATE		XE_REG_MCR(0x94d4)
>  #define   L3_CR2X_CLKGATE_DIS			REG_BIT(17)
>  #define   L3_CLKGATE_DIS			REG_BIT(16)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 28b7f95b6c2f..d946b27ec4cd 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -251,6 +251,34 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
>  
> +	/* Xe3_LPG */
> +
> +	{ XE_RTP_NAME("14021871409"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)),
> +	  XE_RTP_ACTIONS(SET(UNSLCGCTL9454, LSCFE_CLKGATE_DIS))
> +	},
> +
> +	/* Xe3_LPM */
> +
> +	{ XE_RTP_NAME("16021867713"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3000),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +	{ XE_RTP_NAME("16021865536"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3000),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +	{ XE_RTP_NAME("14021486841"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3000), MEDIA_STEP(A0, B0),
> +		       ENGINE_CLASS(VIDEO_DECODE)),
> +	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), RAMDFTUNIT_CLKGATE_DIS)),
> +	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
> +	},
> +
>  	{}
>  };
>  
> @@ -567,6 +595,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  	},
>  
> +	/* Xe3_LPG */
> +
> +	{ XE_RTP_NAME("14021402888"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
> +	},
> +
>  	{}
>  };
>  
> @@ -734,6 +769,17 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  			     DIS_AUTOSTRIP))
>  	},
>  
> +	/* Xe3_LPG */
> +	{ XE_RTP_NAME("14021490052"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), ENGINE_CLASS(RENDER)),

This doesn't match what I see in the workaround database.  I only see
30.00 a-step as needing this workaround.

> +	  XE_RTP_ACTIONS(SET(FF_MODE,
> +			     DIS_MESH_PARTIAL_AUTOSTRIP |
> +			     DIS_MESH_AUTOSTRIP),
> +			 SET(VFLSKPD,
> +			     DIS_PARTIAL_AUTOSTRIP |
> +			     DIS_AUTOSTRIP))
> +	},
> +
>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 920ca5060146..1949f8f3d7c2 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -33,6 +33,7 @@
>  		GRAPHICS_VERSION(2004)
>  22019338487	MEDIA_VERSION(2000)
>  		GRAPHICS_VERSION(2001)
> +		MEDIA_VERSION(3000)

This one is also A-step only as far as I can see.


Matt

>  22019338487_display	PLATFORM(LUNARLAKE)
>  16023588340	GRAPHICS_VERSION(2001)
>  14019789679	GRAPHICS_VERSION(1255)
> -- 
> 2.44.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
