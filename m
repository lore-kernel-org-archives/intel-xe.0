Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F36EC01A4
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 09:01:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7319310E3D6;
	Mon, 23 Mar 2026 09:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTYxeFdd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080D710E3D6
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 09:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774256495; x=1805792495;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FC+wvZxjgDRnJ2EqXG4lTrjnu2w9hL5634+rotUFteE=;
 b=YTYxeFddSdUcOm2gYGztSJZfy66EtKPSycAXOUH9hUrz+6PkSZLSzK5i
 6KtxBBaIZXr6E+aky5PXeWvqtei/opXXJBhQsgP8gHOwMW034+a/zHXBE
 mDZDRyKE+tvTq6uiu5eBAFk+GGvPZKhIPWZlnhP/qRh8897b+hcHlx4AM
 BasRGD5A8odP9EVp+T3L6q150HCm9eAed0hARrX1Fe1DGe5KiZEKhCYTa
 zi7+YRlRyutlkYzQ9C2k+Jr31y6x17Ifx9eiFCADP3cEAphLha5qiW73L
 Kn3LueaXqp/0THsNZSXoADrPgq/QWYrpgihlFe3b7emxg9l0VZBb6+iVR g==;
X-CSE-ConnectionGUID: U86acI9rSCWZjGBrVlT31Q==
X-CSE-MsgGUID: 4gqECN+cQd6u6KzH/c/zzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75315847"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="75315847"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:01:35 -0700
X-CSE-ConnectionGUID: 3XJytbsgQ82rvp1lb07Ubg==
X-CSE-MsgGUID: t8TAwYRyQOip3l15zA8ALA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="228043995"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:01:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 02:01:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 02:01:33 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.17)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 02:01:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TbJLbhz5K9Od36FgrLfTb0TZzSHX6PgXduoQo1BvElNM9/IEdJsDeEndAwYAhCXeplwELY+zFnBAXwrUT0PFIfSsDecufn2fdBA7Ls6bUoEs8RvjuGMEtvvIZVcv41hP6Vc1vG8DSaHhEh/d2fRB7hcwqF7oPM7dHNzpeFgQo7eMtyqfE4TNAsPbOppSuQ8eqAZXZjB7BpZmTBrxBQikr/cnyYEOcVgcktUd0VTsgfr4y6AdogJ3aMtEb/nqlG/00Qb+eMb5f1hDltud2BK+/Quuz9uXC7lIvJb15sXWXftzkQ/64+QXvgIp5PyXMZf4G1ctRe00O07rLGZ86C6SVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5czAGPlXWafeosEgPHV3zGikpsd/2+R80bOyRJX6WaI=;
 b=AWZg5JuEHH8FJDHGv4J9wFHgB4n6np2rndsWVkAvn34T1wrHIR1Ny8qfqdxI9vQvsEN2JpPbkyTVtuRtICow00M07zs4JGd1ptwHCOzpr3ApPlVBi9EgfHVXnMoSYr0zTfsvzE/SnWHgsM2cD5xB2prE4+t3CeYud7yp2676ga7ab7f+ELPOenJZC/2bnaEZbOopNMEOGuO/4OW2UdPKYAvfR4B77SQMOhDAY5jtq6aFmSz8uL7cMrtf9lTKulMe1pTFF5nEgNxw/42YxFC9TymLFksJVQ+v+ewM1nekePF+4yumtyvuFEZBWJQiIhoZy5EsRNk+eHUEU3IRJT6vMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13)
 by SA2PR11MB4860.namprd11.prod.outlook.com (2603:10b6:806:11b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 09:01:29 +0000
Received: from DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac]) by DM4PR11MB8132.namprd11.prod.outlook.com
 ([fe80::22f3:a01e:fb45:57ac%3]) with mapi id 15.20.9745.012; Mon, 23 Mar 2026
 09:01:28 +0000
Date: Mon, 23 Mar 2026 10:01:25 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/vf: Improve getting clean NULL context
Message-ID: <acEA8JxXmhy4ASpF@nostramo>
References: <20260303201354.17948-1-michal.wajdeczko@intel.com>
 <20260303201354.17948-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303201354.17948-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BE1P281CA0344.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7d::26) To DM4PR11MB8132.namprd11.prod.outlook.com
 (2603:10b6:8:17e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8132:EE_|SA2PR11MB4860:EE_
X-MS-Office365-Filtering-Correlation-Id: ba8e46b9-90a3-42c2-7873-08de88bac510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: SRw6pADpj1EURdWpOyg6QWcXtmMu4d/4qG3/p53VV6d+8tsxY1zIiP3CNFNuQY4tlN4DItdXs29DxXcpseQiyTIdOCbinvXi0/lILbDGGjLXYqlhKfMBAFTFbfxVQvmWr9BOwy3otxRibyZTFdm4ebnC51Uij0DzDX9Jy4qSX9X2JNCWy+B/umoFB4Q/WEqwqnKlLeS0u3qwa010mhS0WEeA9WcmUotRd5Sqeimc8+K4vO/9nusWESVzM5WNRUVGtOe9NGW2PTirvuTFQMTGd2gxk7mTWK4M+8mwyKGpA4HMSukmRHa1UAoTh5/g6i32bItzAfkx4MY41ftKtFDDidDH3W7uqDoYgzZSrAfV98nRKmbGr2w+SYioy84qUHBN4MbF6tYMu0gaPCvaAzsW6bZuVJdn0aH+HC0yUzT5Qo3rUm8G4HY7uN23sX//scjzm/8Rb2KMF1Lf1wlNo+o5bygMIIzZs8u71U/2MnSZ25sXLQoNgfVNk9VG3NBuJmsYDWDbal7Y1kIQYFg/ZdBrKoPUv7NXCpjh3Z6zAmI/BTFKyU+YAQWWCjknro4C6UpNQV1gu6a9QAmxK8OWUOEZfxTW3YZ7BtGntWAn8Ys5b9uYy29wZhE/q3S8W67PPvQB8ekOb0553tC1jEYVH2moI5d3+C11XUGu+6aHmYNg6or2S7O2BWD93qz3xxDtydRFVGnMLV2F3T5NENPCvHYX4oX5BZ21cljRxvlIRH0vj18=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWZ1SjJjQnVhSnJTSXFpT1o2MHQvNzRjMC9RSGN5cThjSEQvWUkvNlBIMXlu?=
 =?utf-8?B?OGhCajk3azFvS1o3WHFaK01EYUplVlBVV1VxdE9ja09oVmRUck9JdVlESUtZ?=
 =?utf-8?B?TngzQUdEUXNFVXYrZXVJMlRJQkMvcWdkOEFVdjVZU0syNEZHOXZLNlBZOGZ4?=
 =?utf-8?B?V093RU5JMWkrc1VjOEQxK1hHZUR1SW5qUVNIWjFVeC9kdURpY2ZxVGdEeUNz?=
 =?utf-8?B?YVpwbngrQ2ZaZStscnIwWDRWZGd0Z3U5U2t0QVhKRmxrRVJQZTBjMk9na3Ir?=
 =?utf-8?B?eVduQUhtbFhnT280aW5NblA4TEV5ekJwVzA5UmRxWS9zR3d4NDhvekRsUDQ1?=
 =?utf-8?B?MTg3bmREa0FSZjI5NitaQ3pFRkhISFoveFRBSGpLbS9Lb3l0SmUwR002ZHEx?=
 =?utf-8?B?Y1dWbXI1cEVnd1Z4NklkaVRITFJqSmF6WG5xaHp5SVZSRm9hNmJYWWUyRkxT?=
 =?utf-8?B?N2tQN2hHeC9PeU5JdVQ1clEvbjRONjNOcTBCRzNCVHZaTHNPaDdlcjdveWRy?=
 =?utf-8?B?eklpclVoYmZVUUdTc3BNcmdrVlg2eWtHdWkzQTFXTTRtZ0wydUVHTVFtL2lT?=
 =?utf-8?B?OEZkWEZDdEx0Z1NJRTJjd2l3dmY5Tzd0YnVJWjd1dWROYlNINWZQRjkvaHBo?=
 =?utf-8?B?TEFJZ1p2QkFqT3Bvb1BsMkZENWVOTlF3dXlhVE1sN0k1VkZUa2VQWHV5cXor?=
 =?utf-8?B?blBtbXF5N3h6bm9lWTJpNjQ4U0x6eTZBLzJycWh5a0Q2NnFoQVkweWd2OFY2?=
 =?utf-8?B?MTZBLzEwWVI1WU9zQ1gxNy81RzFUYnBqNitDRXRQak1rUEFxWnE5Y05SVUcw?=
 =?utf-8?B?Vys5d1pWK2RZck8xNC9NZkV3YUpDUTFUbjBKdE1aRldVSjlvOFFUVGQvN3RB?=
 =?utf-8?B?UW83em83RlFlK3FDcVBsL1pBTmV0OEVpS3NNVXZ4WXFsSFpNeGpZZXBVQTA1?=
 =?utf-8?B?RHRTZHM4UEExejlFT2Ixa0pYQm1PQlJhVy80YkFMU0xTb0RwL2tlS3laUnA2?=
 =?utf-8?B?YXJsTHMzQkVaTDFPenZiQWVwNWc1ZTZQN2xVdGt5RWQ4RVdQaW95dlo4cDg4?=
 =?utf-8?B?dHR3TzNhN0tVU1E5eU95WDFFQ3ptZ0N6dy9HVE5xL3FDMHUwTGl1bjJGRk5O?=
 =?utf-8?B?aEhGUTNCOFdCNW1uMzkwTFJLbUJCcjArMEhCZzE1ZmhmbFQycElYYUVyOHVw?=
 =?utf-8?B?TGJwcVRhUm5NdWROcTlBRVY4TUxSclNUMHZKZ2pVckM5a1JHWHZPREYzamFv?=
 =?utf-8?B?YjF5VG1XbTBnbngrYVJNN09MSWVDQXJxK3VHWGE2bVZHUUgwVDJYTnBTYWFq?=
 =?utf-8?B?dVdnaG45S2c4cy9RSmNZNjF1TEhlRWswQVA0ZDRhVmwwMElXV056U3BJa3Zm?=
 =?utf-8?B?czhBTGwxQUN0TnRjTUlxMTFVQjFBQ1hGS0doVXg5ZmtxUTlDSDlGZ3ZqNE1h?=
 =?utf-8?B?R3pCd2svVVpYNGRQcG9JUGFqd3ZnUmt4NGhad2k2Q3c3L1FQRHFnZklidW83?=
 =?utf-8?B?ZjFyMzdlR3dBYWJ4REZ3U0tCUHpDT3RiOFlZTGVma2x2emVNanloVUFEVFFV?=
 =?utf-8?B?Wnl6OEppc0Znc3RHWFY5Zk92ZnA5SWd5UlU4eHR0cWkxNGtCeU9EVnZEQUFn?=
 =?utf-8?B?ZkJyR3J3dHhmRDROdFUvZG1oTFgvU1dBczVsRFBtZVpTRjB5VUIzcVN3M2Yy?=
 =?utf-8?B?cGpFTHR6NWtqWVpnS1pLc1p5NlhmbGIrOHVYMWdRb3c2T0hFVDhpN2hjdHNV?=
 =?utf-8?B?R1VtemNtaHF4SGJuNEx0cVlYNElFblRlVGRMUitKR3BkTE91ZFpQZVZHbDlu?=
 =?utf-8?B?UEZIY0VwNEFlc09KaHRZMVdYalJvVVB1bWRTUjFSQVEwdEg5NEdrSElvaHRE?=
 =?utf-8?B?WENnT2c2Wm5oNmNrbWR4UHlnaXUxMi9hdDdBdDV2dmVIdXkyeUltc3ByVDI3?=
 =?utf-8?B?VkJqc2ZTeWtFZEh4ME96azg3QjNCekJoVWx1SzZhd1plNUUzVDFySG52VXBU?=
 =?utf-8?B?V2N0a3plM2JLVnRFdW1qazBENmdNRk0rQ1l4ZmRBTC9DRjJsTXJTMTFUMVVQ?=
 =?utf-8?B?QmsyTzE4Q2RBbWdwYTNyaDYxNzlGRjhIdnNkM1R2TFNRMEtXYVE4MmE0NmdZ?=
 =?utf-8?B?QVliN29yYjRWS1l6YmFHdk5Gamo0L2xXMExMdXlhNUxQWWp6YlZ6ZFd4Yk5p?=
 =?utf-8?B?bDZaQ2xOY3diK0ptMVA2L3VkQ2dvTFY1aDBoSmR5T3g1WmFEVTVaWVdMSGw1?=
 =?utf-8?B?REtZaUpOMi9lTHhPb25pZWZRYzRjdkh6c3JwaHhENCs3cjZsZUt1cGlYV1U1?=
 =?utf-8?B?ZW5uVEJvRURFcWY1VW9EYlFkOEhVZ2NQT0lnMGJWRDZ5cW51dDE0OGQ0N2Vv?=
 =?utf-8?Q?uGf1jNzChoi1lSBQ=3D?=
X-Exchange-RoutingPolicyChecked: tfkxgJxqK1PNPvvvwQF6Lx0vvxyVJKQxVfBPYdNa54CwGPDDHHcsI7itaw/W/6h6buEOSpp0SyyZMo/2tAE65m3yqEvxGozDhLdLmRq6LZqYn4zoRjmRiqap8komuYqwx8H4rzv2HR/2+LaEswuyiNDF4zQtg4R/s+w5ut1+xh/h1IpI0UJrhoGN+NKlnZQnsWeeHyzR2G33JUva6XnFVVRr80obb1zNoif9YgHSeIk4FhntjKkOdADnNuscoJLXw9/jAKZlHKZDTMenk3sxezDDrIcSJy9TwDPg0+R+RBmi/fQ+mGQY+QhFfSYndlRYDqOkFRQPOH9CO1/dEcombQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8e46b9-90a3-42c2-7873-08de88bac510
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 09:01:28.6940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3vB+ga+QCQG4dRRLHv1fa10gehktkAx30ZrDbzRQ7rdzXMZd/6z5RDcvp0YwXCChyZ1s+c9ycP51oBVbY14Id/574a0ejeYWGyZjs7sWCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4860
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

On Tue, Mar 03, 2026 at 09:13:54PM +0100, Michal Wajdeczko wrote:
> There is a small risk that when fetching a NULL context image the
> VF may get a tweaked context image prepared by another VF that was
> previously running on the engine before the GuC scheduler switched
> the VFs.
> 
> To avoid that risk, without forcing GuC scheduler to trigger costly
> engine reset on every VF switch, use a watchdog mechanism that when
> configured with impossible condition, triggers an interrupt, which
> GuC will handle by doing an engine reset. Also adjust job size to
> account for additional dwords with watchdog setup.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  drivers/gpu/drm/xe/xe_gt.c              |  9 ++++--
>  drivers/gpu/drm/xe/xe_ring_ops.c        | 37 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ring_ops_types.h  |  2 +-
>  drivers/gpu/drm/xe/xe_sched_job_types.h |  2 ++
>  4 files changed, 46 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index b455af1e6072..cf639729a22d 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -169,7 +169,7 @@ static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
>  static void gt_reset_worker(struct work_struct *w);
>  
>  static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
> -			 long timeout_jiffies)
> +			 long timeout_jiffies, bool force_reset)
>  {
>  	struct xe_sched_job *job;
>  	struct dma_fence *fence;
> @@ -179,6 +179,8 @@ static int emit_job_sync(struct xe_exec_queue *q, struct xe_bb *bb,
>  	if (IS_ERR(job))
>  		return PTR_ERR(job);
>  
> +	job->ring_ops_force_reset = force_reset;
> +
>  	xe_sched_job_arm(job);
>  	fence = dma_fence_get(&job->drm.s_fence->finished);
>  	xe_sched_job_push(job);
> @@ -202,7 +204,7 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  	if (IS_ERR(bb))
>  		return PTR_ERR(bb);
>  
> -	ret = emit_job_sync(q, bb, HZ);
> +	ret = emit_job_sync(q, bb, HZ, false);
>  	xe_bb_free(bb, NULL);
>  
>  	return ret;
> @@ -367,7 +369,8 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
>  
>  	bb->len = cs - bb->cs;
>  
> -	ret = emit_job_sync(q, bb, HZ);
> +	/* only VFs need to trigger reset to get a clean NULL context */
> +	ret = emit_job_sync(q, bb, HZ, IS_SRIOV_VF(gt_to_xe(gt)));
>  
>  	xe_bb_free(bb, NULL);
>  
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 53d420d72164..bce7d93ce3a3 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -256,6 +256,32 @@ static int emit_copy_timestamp(struct xe_device *xe, struct xe_lrc *lrc,
>  	return i;
>  }
>  
> +static int emit_fake_watchdog(struct xe_lrc *lrc, u32 *dw, int i)
> +{
> +	/*
> +	 * Setup a watchdog with impossible condition to always trigger an
> +	 * hardware interrupt that would force the GuC to reset the engine.
> +	 */
> +
> +	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) | MI_LRI_LRM_CS_MMIO;
> +	dw[i++] = PR_CTR_THRSH(0).addr;
> +	dw[i++] = 2; /* small threshold */
> +	dw[i++] = PR_CTR_CTRL(0).addr;
> +	dw[i++] = CTR_LOGIC_OP(START);
> +
> +	dw[i++] = MI_SEMAPHORE_WAIT | MI_SEMW_GGTT | MI_SEMW_POLL | MI_SEMW_COMPARE(SAD_EQ_SDD);
> +	dw[i++] = 0xdead; /* this should never be seen */
> +	dw[i++] = lower_32_bits(xe_lrc_ggtt_addr(lrc));
> +	dw[i++] = upper_32_bits(xe_lrc_ggtt_addr(lrc));
> +	dw[i++] = 0; /* unused token */
> +
> +	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_LRM_CS_MMIO;
> +	dw[i++] = PR_CTR_CTRL(0).addr;
> +	dw[i++] = CTR_LOGIC_OP(STOP);
> +
> +	return i;
> +}
> +
>  /* for engines that don't require any special HW handling (no EUs, no aux inval, etc) */
>  static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
>  				    u64 batch_addr, u32 *head, u32 seqno)
> @@ -266,6 +292,9 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
>  
>  	*head = lrc->ring.tail;
>  
> +	if (job->ring_ops_force_reset)
> +		i = emit_fake_watchdog(lrc, dw, i);
> +
>  	i = emit_copy_timestamp(gt_to_xe(gt), lrc, dw, i);
>  
>  	if (job->ring_ops_flush_tlb) {
> @@ -324,6 +353,9 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  
>  	*head = lrc->ring.tail;
>  
> +	if (job->ring_ops_force_reset)
> +		i = emit_fake_watchdog(lrc, dw, i);
> +
>  	i = emit_copy_timestamp(xe, lrc, dw, i);
>  
>  	dw[i++] = preparser_disable(true);
> @@ -381,6 +413,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  
>  	*head = lrc->ring.tail;
>  
> +	if (job->ring_ops_force_reset)
> +		i = emit_fake_watchdog(lrc, dw, i);
> +
>  	i = emit_copy_timestamp(xe, lrc, dw, i);
>  
>  	dw[i++] = preparser_disable(true);
> @@ -433,6 +468,8 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>  
>  	*head = lrc->ring.tail;
>  
> +	xe_gt_assert(gt, !job->ring_ops_force_reset);
> +
>  	i = emit_copy_timestamp(xe, lrc, dw, i);
>  
>  	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> index d7e3e150a9a5..a42a465ac438 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> +++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> @@ -8,7 +8,7 @@
>  
>  struct xe_sched_job;
>  
> -#define MAX_JOB_SIZE_DW 58
> +#define MAX_JOB_SIZE_DW 72
>  #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index 13c2970e81a8..0490b1247a6e 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -63,6 +63,8 @@ struct xe_sched_job {
>  	u64 sample_timestamp;
>  	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
>  	bool ring_ops_flush_tlb;
> +	/** @ring_ops_force_reset: The ring ops need to trigger a reset before payload. */
> +	bool ring_ops_force_reset;
>  	/** @ggtt: mapped in ggtt. */
>  	bool ggtt;
>  	/** @restore_replay: job being replayed for restore */
> -- 
> 2.47.1
> 
