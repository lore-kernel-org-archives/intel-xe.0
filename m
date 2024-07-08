Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE4CC3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 17:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4168A10E0C2;
	Mon,  8 Jul 2024 17:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDd/kInp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2F810E3AF
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 17:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720458919; x=1751994919;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EatHoXavn7BGY400B4UywhEcfd3kpboqX6ON1YIxB1g=;
 b=aDd/kInpG5KXuKyK6kXbVKNY9hzk+LEMaGLlGSPR0osDWWlE04OWdIxg
 6D+kjl0/udtbn2Koo6v6c5rEFRjzZBGC5yA2DWthuMBDrZ9NMFJWlo3+o
 EuqDfjuVM+FzZyqSEIT8/NXOAgDcTXCqgc1mbFi89FVsK30GtnndKD0//
 1HWxuC6GTlxfjRgSvs8UW2mgSgfVzdgJOmj6s3pCIB4b8+vFyzIJmo5DG
 kt7pdXfgbkc8vqdAPhxi34l3dwhEm0cSNTR1VjhfxkCSt4HjoFBBqLaob
 Gk6vDaAbQD5YxPzvGkmPLx2DNJ/YyObVegKorJvXUSV/3SG6cYWpjXaT6 A==;
X-CSE-ConnectionGUID: 6gvacenETPiopPVzASprKg==
X-CSE-MsgGUID: u1N8ywwOSUGNXWV4ZfW7kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="35113429"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="35113429"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 10:15:18 -0700
X-CSE-ConnectionGUID: /tawYkOrSsGy4FNoz/RbOA==
X-CSE-MsgGUID: wxUVGZKIQzmTpkJKSe1uHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="52758442"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 10:15:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 10:15:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 10:15:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 10:15:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQyVnXfbo+nn9fNcKO4Ix3yvc1Rj7kvCjB/q1Xny3SfEKc9mq/PTAlPPD0mTh8vCg0miBPpqVLer8L+hoPACow4IbFlVLvPN571ukovz2zqqWCHu62r3/FQLHEnxtAg0a0rwgK6hnliX+0JeSrK5dg6J2HgNljq4QqobyyI1D1DCITSVROUDHv56j7keHqEkm+wd30WBmPIZWvV7RGKavRtU4Nlc2hKpYEL63+IU9hMYe4SMX3PxOscqmYwztfmJ0Ny6xDOjr0v+2V5TFFlQhjdQQ0zcIbQHPWmspkI5Pam78O46oZHiJMQFQzVWcfjGceb+aKkkZiPdMIwfc/xqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eA4dOzUjR+wNBYmN7IitgcwQZFojFSCTl8NcBmxKf+c=;
 b=UqC8hFd4JBLjwOEqljchfUtp/YiJ99bSwSItFP6kbso+iNVJ/HaXrfzwBaAvJSRUpwyT1jzmHs29mYGuP+SstH2PxYPq9rPDIgFldI8Fxsl34dF1r4PIlTIPeA6l45c3EfSRxC+27tsrLIrnP30vInAbB/sQ+b1Roxzj0/2JwXDYlCUvN1tn6AmZXPr2oEBHOmBssuYYSZrqBBoPt4eWyLIASZiWD+VVOkW8wERobXwOHKoIeUTPklrgMSWIGPDOo24uQZgH5+2dCTRbjdtw0V0zpA/Z/rt1peBfyUiFXBcEzT51UD+otnMCYRUQwj+Sbt1cGi3Fsq1c7bpbYW+uOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB8318.namprd11.prod.outlook.com (2603:10b6:806:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 17:15:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 17:15:14 +0000
Date: Mon, 8 Jul 2024 10:15:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH V3] drm/xe/xe2: Add Wa_15015404425
Message-ID: <20240708171512.GM2906448@mdroper-desk1.amr.corp.intel.com>
References: <20240705130324.2769481-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240705130324.2769481-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dc4296d-b4d7-440c-67d1-08dc9f71886b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dcRTwRTqUuo2EqaGltYr813cIiacPZExGKghsO9pcWUsPDlRw3FnNfxdHADl?=
 =?us-ascii?Q?dgOa8GkczVNdWDCi5q0B+75JBDpIOYNymc6jmZZNWKvDwsFU5zCTxf1y60dr?=
 =?us-ascii?Q?ztLAdf4Yza3Eg8c0kFRucn4iXBm4a7ul6IQObCxsoQPP2aD8oVuxKowoLABU?=
 =?us-ascii?Q?y5dOevnpi63uEo0dpKO2Wgqw875iH3bomkumLAHdptiXkMj/Scwvd1sOh4Lq?=
 =?us-ascii?Q?aDfEYdkZ/kZtYA/1/b+6kguvMj4qIIkDrIWxHGaj5cInfCGV8CUgCTCDQHKt?=
 =?us-ascii?Q?MMN0oOZG+Dr+e/3Jr/jyS3UC0g1Tvnm44BbFlgF96il4iW/S0aN6HfDMy3yw?=
 =?us-ascii?Q?kjlX/XKDuPJpR9+bIQXNeoxrRaxxDT5+J6EFy7UPv34AXHIZCruFzYxKm7XV?=
 =?us-ascii?Q?t7NLpAs3zI4c/UnWxRZuSaI24FtDNw2RILMlKUBIH1WDGlPSIufqvty3rFLO?=
 =?us-ascii?Q?cObSsbiV3mmMELvpVhmIPtV9Ymh9PqT+F9Dz8j0+Igu2ZwsKskxcNTZDrlYU?=
 =?us-ascii?Q?NvdHNRAVJ5/nkBFhagsHgzqyb2GPl12pnGkFzEMzuONt618fhDUK35OBOMEF?=
 =?us-ascii?Q?GLuOvserdFCF7m43LjuuUsBbJyKJaCMylUMT9vepjn/LKm/4kM8uWTXBOuZZ?=
 =?us-ascii?Q?0g78S9jyYdYYeMWIyjsnfJA/YHej9ArOSzZkCCQZ8An9d3FsAdOE/7pN47jz?=
 =?us-ascii?Q?BhVZSlLv+eG+y0aF57N3jw9fN/lPaYWofUm88OyldxEuM/vM741notCIRkhF?=
 =?us-ascii?Q?w3qAT1EOK/OdYXWBzbVGFOd4iP1y8xn0C4Hw1NN22Q/tb3aGrMeY/+VPkK6E?=
 =?us-ascii?Q?IGWRnJKx9hVM4+h/oFb2/wRX/iz7zyIdktPV4+YqicXYyf0FtcsRCOy+K22E?=
 =?us-ascii?Q?F4B3fcpawvCUrrVry/Kr3PQx9rdmZXu8osqjMb4eu5IK/lymfD5d+yTDPX9j?=
 =?us-ascii?Q?7XftOWCZVEFEE8Di8yJpiZXBbdnsyNWK3ztz5rKUVg9Lixk7EjnedN06f+w4?=
 =?us-ascii?Q?E+Fp8lMXOBfEsYMYEKKZMGrCPk0TyPB7T1tXz5b5Q8OAAHGdz3AxAR2+/xov?=
 =?us-ascii?Q?QeYUKWX/qzsnENb97sdEcHe3OvLNtinksIbJQhJwAkwRMZkRw3CzjrwpakZf?=
 =?us-ascii?Q?kBtOnA6FRREeLjRLtqSAWAGYLmt268L1+ivYIWd7N2JPAnaposOXbvjD4VqR?=
 =?us-ascii?Q?gN8s3nf4tNTsYot8hZp0bmSL2PHlOefECmp2OtB5qwMceC9gt39AZlaBFSIy?=
 =?us-ascii?Q?aKJnZKPxL74SRzHX6FtabNgGbdIuxxkDoeR3Hwjlf5mbunH8MVpmPQajhn1f?=
 =?us-ascii?Q?MFX96niC2X7rX6F+ldTZv3QxYWB6Cu4ER8QNbbwSw7HZ3w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9qZPwYwguWnIFQbFaESd0Mz37WqTz/P/cLpMw3dEjt6lZSCkRqi/ndeWiMdm?=
 =?us-ascii?Q?3MjIbm2Rcg0ZSM5mcOASq1nhcuJV7IofjrSqsg0pbjVPxwsF+Eu4U57X2dds?=
 =?us-ascii?Q?3IfJUS0tU025G1086gNNlpViv2cvQWN9ASOpbvl/LQ6CcLcVc6otJ/romMX1?=
 =?us-ascii?Q?d/ZcBC/9pxGp8kxDWNeZVc1U6Lxsd21jGwWfE49VnIt9bX20UDSuLB3WE5hU?=
 =?us-ascii?Q?FWLTKMVXeSrAJZwu2+8aCGB70u0pMImyMlgxdF2w/o5S5HPJC7xUAYzMtlJx?=
 =?us-ascii?Q?glzu3X+tQJ0hQXRTk5a77I+q1ZqwK8S6mOpMreHkyvTGYZq73OvuM2m2V7Kp?=
 =?us-ascii?Q?6yLVHCtMCFiX9Or9VVO7k29b696WOBTwOGLV9AKK95p1R8TFt842IJOHUesO?=
 =?us-ascii?Q?iE2pacOVCcpDxNy0tFhfStvofRb4JVNfYX7wdePv/vHzLI6LD63vxCyrx1ne?=
 =?us-ascii?Q?AZF5F8QRqP15Sma9u+S1K/Mmg3+Qh75r81woz73vwz4XFf6aJkrpsb5BhLGj?=
 =?us-ascii?Q?1ey2SvCz8YxKSsykB+Cor4/KLfAGWT+6rFUUuU6+dRr718IM9EO7FVuQiFKB?=
 =?us-ascii?Q?oQa+dm8fAVhdCAkERuDNxDkoI5J2p35tRInAzTnGp0tYEcs1Sgv1pTOP6aQ6?=
 =?us-ascii?Q?8o8as/bsxL60c89Ya1gKXk/uDwth41ivdaWgVNnnxfq4sKReQ/C+Gnroh+uI?=
 =?us-ascii?Q?oDQsH2hj+IyX4qWKbXvpqJPfHp3SDyJxtl6hCrqAEoWVsBj0ksCPN5MEtQVV?=
 =?us-ascii?Q?DvRiaUwyeWp5n8GPZGZDOU3y5mXtbVazgPeG6k46ZdQQq9kq6kkMBwJFLKRW?=
 =?us-ascii?Q?wcmEjZ6q3sOQAyn4e4GS1IN+rMVtPc+0/9AWRraV7X+EY3nuhD1CTl2ZCTP6?=
 =?us-ascii?Q?8a4Qj98a9ESypYlUpZhCY4HyLNSyxN9gpxbcl/M8dypRo20q9cWegZCWfgxw?=
 =?us-ascii?Q?q/UJ6oa7To7Ty+MNnSOPIpU7E+TMrYKkLkXjrmfCL6jlZRQrVSHdG4Jrx0F7?=
 =?us-ascii?Q?Z3A4toqzKAtmYeroW25hLh2N15inLG+P1FVwvf8Iz7n97/b5jVjXsOYrvZjv?=
 =?us-ascii?Q?D7puNYESFHsIvaxdjVCilaWsZSphMwVyLtxGiv+NDcjb8OZnRCH8y0lEau0D?=
 =?us-ascii?Q?BZ2KLV0nLxrCq+6zgHBJXsL6rePUODEjcJZmcCpXAX68in6bP5do52feqZm4?=
 =?us-ascii?Q?Q91M4mwWgG7p3QXP0fnIVGpjauLvGcoD2sB01xrhiIYg9l/Wo2KU0Pz8rud+?=
 =?us-ascii?Q?wweZulGePwwXnYfdAOUAfKcgrA+8bEy+V7XsdaWZ4KHLYHD3JoYWqGo6GL2W?=
 =?us-ascii?Q?bLjq3AvhW/vKIqXGppahEQdGAh63nKaLqbyj7sL4ksRJQAKaj9lM9NAbQGY0?=
 =?us-ascii?Q?WLMBHEqDV4RpoV+UhvUQ4wQie1N+V/Ztp0aztEl9GRhsJnmoLCW0oWb9MmRA?=
 =?us-ascii?Q?RMo6JUOJ7NbXasdsdJaL1TEU/nd0tlfDcl+thmuIM+25joAVOg8PpoDewjaC?=
 =?us-ascii?Q?009TnDb8w1poU4ciLIDh8VZmD6T8vj/lp7RBYg5293TFRlSDP618OZVxfQH4?=
 =?us-ascii?Q?2lY4P7NVN/LuSfdpU/Jv3Fe7TgkLQAcRmrauvnjQ0C8Yt/gajn2ZaVXHfVoN?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc4296d-b4d7-440c-67d1-08dc9f71886b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 17:15:14.9528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EefCvF339UQ5IJg3c9ypDohnPe8zQh/JEtFnt+VcfbpraDEow1edK9hTirr0iLX/oV4X5/VWkFClw3TlMhu7gidzNo3hqWdRALxZS8wL2Tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8318
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

On Fri, Jul 05, 2024 at 06:33:24PM +0530, Tejas Upadhyay wrote:
> Wa_15015404425 asks us to perform four "dummy" writes to a
> non-existent register offset before every real register read.
> Although the specific offset of the writes doesn't directly
> matter, the workaround suggests offset 0x130030 as a good target
> so that these writes will be easy to recognize and filter out in
> debugging traces.
> 
> V3(MattR):
>   - Define dummy reg local to function
>   - Avoid tracing dummy writes
>   - Update commit message
> V2:
>   - Add WA to 8/16/32bit reads also - MattR
>   - Corrected dummy reg address - MattR
>   - Use for loop to avoid mental pause - JaniN
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index f92faad4b96d..66bfa93a976d 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -121,12 +121,33 @@ int xe_mmio_init(struct xe_device *xe)
>  	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
>  }
>  
> +static void mmio_flush_pending_writes(struct xe_gt *gt)
> +{
> +#define DUMMY_REG	XE_REG(0x130030)
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_reg reg = DUMMY_REG;

Since we're doing writel()'s, there's no need to define an xe_reg
structure or use the XE_REG() initializer.  A simple

        #define DUMMY_REG_OFFSET  0x130030

would suffice.

> +	u32 addr;
> +	int i;
> +
> +	if (!(xe->info.platform == XE_LUNARLAKE))
> +		return;
> +
> +	addr = xe_mmio_adjusted_addr(gt, reg.addr);

We're intentionally writing to a specific, known address (and it isn't a
media GT offset), we don't want to perform any kind of adjustment.

> +	/* 4 dummy writes */
> +	for (i = 0; i < 4; i++)
> +		writel(0, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);

The ternary condition here is also unnecessary; we're accessing a
specific offset and know it isn't in the "mmio_ext" space.  All we
actually need here is:

        writel(0, tile->mmio.regs + DUMMY_REG_OFFSET);


Matt

> +}
> +
>  u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  	u8 val;
>  
> +	/* Wa_15015404425 */
> +	mmio_flush_pending_writes(gt);
> +
>  	val = readb((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>  	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>  
> @@ -139,6 +160,9 @@ u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  	u16 val;
>  
> +	/* Wa_15015404425 */
> +	mmio_flush_pending_writes(gt);
> +
>  	val = readw((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>  	trace_xe_reg_rw(gt, false, addr, val, sizeof(val));
>  
> @@ -160,6 +184,9 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  	u32 val;
>  
> +	/* Wa_15015404425 */
> +	mmio_flush_pending_writes(gt);
> +
>  	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
>  		val = xe_gt_sriov_vf_read32(gt, reg);
>  	else
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
