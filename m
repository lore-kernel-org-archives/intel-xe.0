Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A76CCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 23:33:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E3210E108;
	Wed, 15 Oct 2025 23:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gLZ5Jlkm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4B310E108
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 23:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760571194; x=1792107194;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nDJFnlauttky+gY2e7VwPOYQtkUgLhwiz07yfoinQoY=;
 b=gLZ5JlkmGPSPon8B+4EuWdpGFn+l4s2LUwNMI1Q4aXc9ThJWwkmRGSDc
 6+mrmixDXF1Guvlyd0HN6sjv/CKKUvNItC6BWy1yReF/MY0F3H0P844v8
 ds0/yXuHEvPeiii/Mn+2YxPuiSFQqZtsf4fwRZJVprc38AeiMDstz0sX+
 c85uJDvCrRklNrnoMpYu6MRP2OY32IXxG6sgtQHufA5cV7/dcEfXtkCA7
 nyZB+XkjXqolAOr3gbzXpLQWakksYE9Eml2Ysb2dg4nvwnLjeha5W6Xzv
 FWf9t6nu9R77bpGabTziN1MSJF2EsbrqbacbqeIa1SRqxPyeX1qU/tHa3 A==;
X-CSE-ConnectionGUID: VwmA6rm6QOCkm5MWmTZ6Tg==
X-CSE-MsgGUID: rGf9E7P2QfGAfMjtFTMD0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73035116"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="73035116"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 16:33:13 -0700
X-CSE-ConnectionGUID: KWR/UJiGQr2sW90Q+tOSYA==
X-CSE-MsgGUID: Sx6tOA6cSm6cEiAL5Crmkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="181441725"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 16:33:13 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 16:33:12 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 16:33:12 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 16:33:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvGwibzL4GjmEKlhJgGJtesx051EclF0I2iGYKkDf9qRCG+xPFjQCXMjRfwT8lKDP+w0JSq/wEmGziEVvd4ouCRJN0yU9RESPrvM11+HKSELYYgyLWQjOgQYn/vz0970jRExEn9z6Ius7v0teEevvTpfN3hZNrsJQd0sHCiQ6jk7ICn+GqObYoBKkP8ItjYElh7panhmqnwaoymFDvm+h5P18MGp1kRXsxD8ud6cVlryHfwlIn0qSc88ucFHs2TVeAyAxbbh/CPnglLkS26tu/a6hl0vp4KFoH3NbxbahB6SaFBG5KSoAEKNLhUcFbMLx4M3KcBXKNbXUDHxxOqBjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K769wAkwecI/MZ/kyKoVYcfA49CaL8NUMrty/YibTmA=;
 b=FL3po05uslKU8p9BTNx8tLlvHl5WORzpTfJO9tE/6DRVMRmTDGpWKgfZhF4BK1LJ2Qbbm8j/0AvKNlF/nNTyFYri0EjhUeJJYb9zfQYJ6Bk7HmhjOKquyBkk2TBD17pb8P1MeId8+ullHj4hMRZUDSYWu/Zsa1WSSCa2khbxPtjFNj3nYt+LGXmgC10eo+a54DkjeYS/GpE0g3wqz98YRv+tQdxDFuBqiOzYtrz0oy6IynaGrMB6mkSH6KMseN7H8KEjwGdjQa/XFtoFgmjCtVGhfia0qBNuNpyYIlfmj45XXLuuzzuVEOhA1LrEjVACZ6+zqWAMN8XN4rAchSsxlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6545.namprd11.prod.outlook.com (2603:10b6:510:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 23:33:04 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 23:33:04 +0000
Date: Wed, 15 Oct 2025 16:33:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Wang Xin <x.wang@intel.com>, "Niranjana
 Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v2 10/22] drm/xe/xe3p: Dump CSMQDEBUG register
Message-ID: <20251015233301.GI5409@mdroper-desk1.amr.corp.intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-10-b9189b3056a2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015-xe3p-v2-10-b9189b3056a2@intel.com>
X-ClientProxiedBy: BY5PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: deef5c88-55ec-4ab1-50fd-08de0c432ff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AxKTQhUVONxi27RYxNR55LSnKqb9GwKgQn2zpdnQQGEOfKfBvM2lqcmKQYyq?=
 =?us-ascii?Q?c199IPXgxRfwACEhipePORnQeclXf3A4SmVLVLub0+BlyodlGer/3R3aM/Tp?=
 =?us-ascii?Q?zRPqXD2ILXFymXZA/PALzwjfhwvjZ+IlIcfVN9P8yPsUtBO7ch3TvXB3Uegf?=
 =?us-ascii?Q?tx0F7f+t6+EPiCC3JDaLmfHTuLf+gTQFuljG7pbV1s2bN4yBS9NRSsrfuyzN?=
 =?us-ascii?Q?DwePUWIPbIQerL/W1fiB+cbJ0EMDGMVEPpBxYJEuF7/5TDn50eqKlIpXjUgK?=
 =?us-ascii?Q?/6M2L0yfklinLQJv+njmE0tpywW6Tlx7HS/1CVAJyCg0ILIJuHq5kGGQsL5o?=
 =?us-ascii?Q?ESkIHJAPOKi3jzlgfyYQvg5enzw0Me2vOl/MvSyBcaHIM6rihSnmf/LMAZqY?=
 =?us-ascii?Q?7S7om62ommKBN5ENVP6ERmrfhj2G5VbuYGo71y+MrdqODEyYBP9l0RL1hZJ5?=
 =?us-ascii?Q?SgOn+mfPcSd+SjL3lRVSvylxwCeHNdyap7PCJGtnTusEq8EdH2Tm+aY8rNX0?=
 =?us-ascii?Q?5mYn3knjsorK/kJ9VUDAHgoDRwHd6S7NX2mjv6aOYDIY82Ny43gkO2tC3rld?=
 =?us-ascii?Q?nxUga1ubCOIF1IVQ/xEy6zPeu1NMwYPVtlI8wu7QiZ1Ib1SuBCwZaCkKPQz/?=
 =?us-ascii?Q?BgXhByvtF9aFEegO6LIMQ6XdYk6mSvgtT66xuqPwDZismeSI0vc5YLMl6NTL?=
 =?us-ascii?Q?WyzLCMk96HdLfGBYU9VyFLtVxNl7XHAlX3unlywqtsNIiIpDby6qDO6d8MCJ?=
 =?us-ascii?Q?O4aeN+zJwQC0v3jUkvtURmvwPegTLSUxiWz2KM9sxTgOQURdtZyU6Q8ETmEV?=
 =?us-ascii?Q?c89qv01/2vjhkzqK8VIQGoLugbQaDF0YW3iOVogyMMaMXjiosLEmqA/uDXGU?=
 =?us-ascii?Q?AnsfOaXx+N+uDmSERhd1zWGUmMe5kz7WeaVL8D8I7W9jX8PwOV4vM/fc0KnZ?=
 =?us-ascii?Q?E7g2FUjt2N1uUhusChjkzMr4lKWzqsfrFe34PB0Y9vcgi0LFcYzCNPTalZ9N?=
 =?us-ascii?Q?j2TCOs7/Kpt9a+EvzwOmFBLfZs44cFSgPZSPDw6BDELJJv4n0EH8SvTXzdNl?=
 =?us-ascii?Q?fmYkN1w1fRw9bc52sKyLdJpCNG9p2DU90SPBfHOPMa/RHOjIe8PpljyuhH4n?=
 =?us-ascii?Q?GhW0o+PQxCDRoRh6R95r4oC7X88ajKh+MsS61zFBz8IF/n6OLg/db5YQrbBS?=
 =?us-ascii?Q?Fysa0mwNtIIRMeJnk2qxbjCKr5qTem6xu+OUvoC5v9KR11y35BFiMhJq6ENU?=
 =?us-ascii?Q?HUvDCVkXBaBhsFHAqiCzYzKr4DpPiqe0PlRgyba/RIa2njYUv8pQvxF5w1n4?=
 =?us-ascii?Q?+cfuP9KizmrP9+sRctajUq9NmSq95QF3oIGjbHn5OHmawmAnZS0eIUZAx6o+?=
 =?us-ascii?Q?3Jb8S+ERr7BScCruKrdTCLxVjp4Li7lEN/g4IgIlgrA7aw5kfVHkwsZ5HCyS?=
 =?us-ascii?Q?Ph0c6Nioo7L3MA7O1jvWJuxgRZt+SwCR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rN7F7BmK6TLmMoNJfqNiVv15LEquT5x2KjyQTfuVgTfx8dd8Ynz9WG7o1htN?=
 =?us-ascii?Q?mB911c9vltJTxyRHn3QRt4qyJYgX66UhyYLGZIe2Ya06ZwFbn1qxgSjt1TaV?=
 =?us-ascii?Q?e+vLO8F3GBZtJ5SOlciRAZ4IPTd0/JhKTf1e5ugITK8LCFHCFIimb3qzbB2T?=
 =?us-ascii?Q?DILs2sM4jO/6d9GKOotrckkOGRTEc8M5/7bZuaFDm1l3KKXXf/q1UKw3+YNu?=
 =?us-ascii?Q?FxAcvvXr8A0Yw6DC1dRhuluDn1N3xyt3/7YrXz5qufn0OspAQnFsphy1xAKj?=
 =?us-ascii?Q?HOAiKq/KkzTsDrGalr0+Db42yzrTDxY8NwUGSaJBgJo9yL4xYtbBeZxfB0+P?=
 =?us-ascii?Q?WNFBKu8zzAkXgvW1xYwmFRpzmuktzG0Z+1PfG4/aH9GhI7ZEA4hMMEGhLJ/b?=
 =?us-ascii?Q?eIR9NCcNqxEWPsWSkusVagmefwq0Ne/FC6gIEgev513eTMHeJn2MC+cJBtDL?=
 =?us-ascii?Q?IY4SoTvUmbML0Jd+0CQJh3Gz2xzZyoFqTvTD4B/S8shC7COcytMMSHn5j8Aw?=
 =?us-ascii?Q?nj1MwJyz2dS6gFfq1m7OWqmcSCRFME/007fGsYNJnwKl+Ln/l8FFWTwumZ1g?=
 =?us-ascii?Q?JebFU3m7T12PU6lSc6s7Ijah1LVccRJbnRZCx9qzeN7ybD0rnU+YQOrgW+Vi?=
 =?us-ascii?Q?QzHFuSZR4PcTa7ag3qAnwOf4R9se0rzfBibiETctSYwdngtNYcbvAFFV0ujl?=
 =?us-ascii?Q?rqcR08Gc3U5rwA5bGNl5LzJAjSGQx/zAS6/PTezGF0YCjPqXYaGZUgR/upfZ?=
 =?us-ascii?Q?T0Os0lgEqC4CvWmEYVulOf5P/yntOzuN/3X2h1ZQP8bojS5T6YmCdTF3CVa4?=
 =?us-ascii?Q?2a5nF48+1PDw3Dw/fidC6uJR/yrL4vKUnh8MbLkqzHBvGUIgfQsSah5ox9sP?=
 =?us-ascii?Q?lbDfZTrFxP5cnTfyGz9G9AngBsv5GsYVDupHIWTwsrp+CPHiPLEbQRVCJpwf?=
 =?us-ascii?Q?tI9S28r3fEjXLm3hed4vE3wFacA5RDjxg0jxfZO0/rVgGpYZHPAfqR5rWrFd?=
 =?us-ascii?Q?I6GKQWscvu7/yHMYDoMEb8a61H4vg1jxUsWh6lm+SrebFBFTtr0D1Hfj6+Xm?=
 =?us-ascii?Q?4XqMT5kQgZv2KD9El8B37FPIal+cKcDHvN+OhOSDD0bqUxz/qmXlC8l9wp/c?=
 =?us-ascii?Q?e6pEGw5Cisigt+zorUiAp7G2FYwfSF/sptndaNXKBUXO5ofP04LH/3C8cMzo?=
 =?us-ascii?Q?Hq0aCh7BmTulNE0TpSpzy6AcYaMcfSwTGO+zY4E75AKJ5dnmx8Rsgy+hOI50?=
 =?us-ascii?Q?v0itbx/fUcYBL5bH3hQdsPxvQ9hSzry90oagVEzcuWZE2+dSMyn6S89KRN3t?=
 =?us-ascii?Q?Uv4vXSkgZFEuhvc5pPM3snkkELDiQSNFHwOpYGYLFwjTdVk4tNxkGVvBgCyg?=
 =?us-ascii?Q?JWH61iWBWh+FW0w8HMhUjk4uPXILAFZPfJEgXKNQdywCFlXSo69Qdx+S1Fgy?=
 =?us-ascii?Q?WkoamDiD+2ROmh9dyNDfe8y3UcqHzbyH2O+lSpemZPXGeLzpxStoYAjHciGY?=
 =?us-ascii?Q?AlITCnnkRegGiVUfvcURozfqHKI9LFFpCBDBlh4FaqMztqXnD/uF028c4jTU?=
 =?us-ascii?Q?IVDrsLgw97f+NMhI3nFlMo0kzNhpGqOooMlAyOmQLRU2qEzV8Pm3HAfje+Q8?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: deef5c88-55ec-4ab1-50fd-08de0c432ff4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 23:33:04.1567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22+3BaQ5fg3VMBMR1s5jt7kABuarMpTKTW6I2BW0yRw9mEK5+LexLNLzkL68CID62hXQCZSbYmr14op+2FHXdmc1bFz3CXvMgUMaHhfMbLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6545
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

On Wed, Oct 15, 2025 at 03:06:25PM -0700, Lucas De Marchi wrote:
> From: Wang Xin <x.wang@intel.com>
> 
> The CSMQDEBUG is useful for the development of MQ feature. Start dumping
> the debug register.
> 
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Wang Xin <x.wang@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2:
>  - Extract CSMQDEBUG from other patch dumping multiple register (Matt
>    Roper)
>  - Simplify version check (Matt Roper)
>  - Do not dump CSMQDEBUG for engines that do not support MQ (Matt Roper)
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc_capture.c      | 48 +++++++++++++++++++++++++++++++-
>  2 files changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 3c05d85902c69..7b6ec0cf78c85 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -156,6 +156,8 @@
>  #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
>  #define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
>  
> +#define RING_CSMQDEBUG(base)			XE_REG((base) + 0x2b0)
> +
>  #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
>  
>  #define RING_TIMESTAMP_UDW(base)		XE_REG((base) + 0x358 + 4)
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 8d1bfa2cdb151..035b9b6c0df58 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -150,6 +150,9 @@ struct __guc_capture_parsed_output {
>  	{ SFC_DONE(2),			0,	0,	0,	0,	"SFC_DONE[2]"}, \
>  	{ SFC_DONE(3),			0,	0,	0,	0,	"SFC_DONE[3]"}
>  
> +#define XE3P_BASE_ENGINE_INSTANCE \
> +	{ RING_CSMQDEBUG(0),		REG_32BIT,	0,	0,	0,	"CSMQDEBUG"}
> +
>  /* XE_LP Global */
>  static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
>  	COMMON_XELP_BASE_GLOBAL,
> @@ -196,6 +199,32 @@ static const struct __guc_mmio_reg_descr xe_lp_gsc_inst_regs[] = {
>  	COMMON_BASE_ENGINE_INSTANCE,
>  };
>  
> +/* Render / Compute Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe3p_rc_inst_regs[] = {
> +	COMMON_BASE_ENGINE_INSTANCE,
> +	XE3P_BASE_ENGINE_INSTANCE,
> +};
> +
> +/* Media Decode/Encode Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe3p_vd_inst_regs[] = {
> +	COMMON_BASE_ENGINE_INSTANCE,
> +};

We can skip xe3p definitions for vd / ve / blt / gsc and just re-use the
existing definitions like xe_vd_inst_regs[] as we have on past
platforms.  We only need new platform-specific tables when we're adding
something new that's different from the previous platforms.


Matt

> +
> +/* Video Enhancement Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe3p_vec_inst_regs[] = {
> +	COMMON_BASE_ENGINE_INSTANCE,
> +};
> +
> +/* Blitter Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe3p_blt_inst_regs[] = {
> +	COMMON_BASE_ENGINE_INSTANCE,
> +};
> +
> +/* XE3P - GSC Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe3p_gsc_inst_regs[] = {
> +	COMMON_BASE_ENGINE_INSTANCE,
> +};
> +
>  /*
>   * Empty list to prevent warnings about unknown class/instance types
>   * as not all class/instance types have entries on all platforms.
> @@ -246,6 +275,21 @@ static const struct __guc_mmio_reg_descr_group xe_hpg_lists[] = {
>  	{}
>  };
>  
> + /* List of lists for Xe3p and beyond */
> +static const struct __guc_mmio_reg_descr_group xe3p_lists[] = {
> +	MAKE_REGLIST(xe_lp_global_regs, PF, GLOBAL, 0),
> +	MAKE_REGLIST(xe_hpg_rc_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
> +	MAKE_REGLIST(xe3p_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEO),
> +	MAKE_REGLIST(xe3p_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
> +	MAKE_REGLIST(xe_vec_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
> +	MAKE_REGLIST(xe3p_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
> +	MAKE_REGLIST(xe3p_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
> +	MAKE_REGLIST(xe3p_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
> +	{}
> +};
>  static const char * const capture_list_type_names[] = {
>  	"Global",
>  	"Class",
> @@ -293,7 +337,9 @@ guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
>  static const struct __guc_mmio_reg_descr_group *
>  guc_capture_get_device_reglist(struct xe_device *xe)
>  {
> -	if (GRAPHICS_VERx100(xe) >= 1255)
> +	if (GRAPHICS_VER(xe) >= 35)
> +		return xe3p_lists;
> +	else if (GRAPHICS_VERx100(xe) >= 1255)
>  		return xe_hpg_lists;
>  	else
>  		return xe_lp_lists;
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
