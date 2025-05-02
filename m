Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428DBC3ABAC
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 16:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044F310E94A;
	Fri,  2 May 2025 16:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VibRIh1f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8ABE10E96B
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 16:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746204833; x=1777740833;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5Pjt3Up1/ECUPU2JuuLzzQc/CKuDibbGaW1Buu7jnHg=;
 b=VibRIh1f9NV291QI/SqTemt/5eDyFFTuiCHNdzTVl/MJEiTFQDz0ntKj
 3T0lX5I+htRGkES9doMb9eVS0+u97yyMWTYx52V9+bZPXUzQzhTMgNcLI
 xWJdznDNDzJ2cfVL89EXl5eMpUpKW2gA4XA4nX/ZUfP/Ooo60KiSINGdN
 7hDCewDmj0fY5BMTVMKtysvAeA0hFMVryUKsmgIXxQBvLjsIoKW946Kso
 RvVQ9dK1xtpA+VNNk49A0f9spWmGgTgzGbmxjdp7tvOVByCxLl8zY755E
 ++L+Zu9bpx7mCeHCprxSNEy4CD4uAZua+A2kd1nwoGCjp24vD083/dTHe A==;
X-CSE-ConnectionGUID: OvP4BOQoT9iwvKBTWFhgnw==
X-CSE-MsgGUID: cbSkJlgwTNeyu+7ht5uatw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47903687"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="47903687"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 09:53:53 -0700
X-CSE-ConnectionGUID: s0SQ4AVsRIWh0SOSJiZIlA==
X-CSE-MsgGUID: XuI53w4wSWeQrn+ax1jwWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="139468569"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 09:53:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 2 May 2025 09:53:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 2 May 2025 09:53:38 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 2 May 2025 09:53:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y93Cqfn8xgeW1i0H5PRYsoyodkBH41/28PqJfuI7bUVHQNGVEhnaOycz8CPKAcU2YnS9IwU8vlg3A00Wx5MW6CSkAy/NVuc9HosJWtJR1TONU9YzLQyfvFpzaVSumPFQN3/21BS/Tc2kAc1WDqfLqCu08tknlOuK0LxktsF9L07WbZCcpKcewYahs4nbgyF6kY5SsucbgctakZYTWglTjvat3XZ4AhNPkh2sNU5tj8XRHhUniB485guQnwntPOFHTtz7KdUBJaSd2UedcCqGViIaIpkcmwfD7KrxLu1d045cM990MhuWIKGHNfFXtPkyQlHCcvYLriUiA4WTmBoWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJEazKOeUp8tQFEiL//1pPtCN5k2zLplzteqgqhfg58=;
 b=IcB1Z4S52zbnbbegtMYX/Ia550lp0616HpKraXPcZVw0pRoskKKcAHBiVXXKEdMDrKnmF1T5VV4vbjEE2yWDhFhc3ITnkZMjFR7qxxi5wDZloYK9xqeyIhgrY6+jNSQEr4YltRXxVlwcTIdcYfUOwZzLs88I/nWzKAPpEmIbjvkZWeoITCU3uPTyMmU1GzH6sQ38r8wphefMPT4aCzBFbU6TlLYj6wTTvCyczeGLXyAZwBz69zPjFk7pYqJkuolW0wjDrfSVcjO8vdXrNlsvzal2nBt3/NPtl/j6gbAxyErBQdA6v0UW8oDg2pDkhaa5iBFph0Nfg08pN84+xcwZKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4926.namprd11.prod.outlook.com (2603:10b6:a03:2d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 2 May
 2025 16:53:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Fri, 2 May 2025
 16:53:33 +0000
Date: Fri, 2 May 2025 09:54:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] drm/xe: Simplify migration kunit tests
Message-ID: <aBT44fo2vZ0f8uGG@lstrano-desk.jf.intel.com>
References: <20250502093514.510621-1-dev@lankhorst.se>
 <20250502093514.510621-2-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250502093514.510621-2-dev@lankhorst.se>
X-ClientProxiedBy: SJ0PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4926:EE_
X-MS-Office365-Filtering-Correlation-Id: b55f826e-2e04-45e6-bff5-08dd8999dfe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qazWgfAVTofg6WZVjfO2XIBmUnCtaK47wkjXtmN6LHxCvcvKbzkgaqpumOEU?=
 =?us-ascii?Q?yzle1F0YX89bua/emwCRvsjPm3Kx5flRPP/SOILwJdB9rvAPuaJOJKh2Qi8N?=
 =?us-ascii?Q?6YGyPktPHdxlzqRuWH215z47lc70lqthhaQmCcKb5zawp2dKHkPE6oQDGM5n?=
 =?us-ascii?Q?fT56Hc0XegbVevvVPA34HJnmgo4WAqz/x6ryFN+KSTqiJ3tcuTToHHwTQUAn?=
 =?us-ascii?Q?b0BdAjfH7IlfZvXu8fF9ed78OIQDMCHsOqhdy3RoHVYPhtebaMgb7qQ/t4XZ?=
 =?us-ascii?Q?GRu44CKu5SRAtso/OUvzgx91OJBqaAFLpndt1oMs4VzthEq3Ct+l2RIrYpGl?=
 =?us-ascii?Q?tlb755yhL+Xz+BNNEhSECKcWwKPkcTz/GJAENe52Ib+DEj95YPkHMTwM2ISr?=
 =?us-ascii?Q?ybZQm1OTzpf1ue92JT3VGaLJagjQMBLHIWx5AaC6OmQPTV1EHUct8w68IB2j?=
 =?us-ascii?Q?QX64+9Sz8rXlIKTUNfUUOPUwx9VTIM+39a8v62OwjgZFC3UqjNhAaqNtUept?=
 =?us-ascii?Q?0otA03b+H1zDkVdItrgE7c3e5Jp1/KZrSyp0vI/ARvVST06fwxRu5QmIQ6pn?=
 =?us-ascii?Q?IGHSOlxGxhTmARcSDemwGtnbo7U1S0FwuuzZn6U9AdpgQfrXAtyzIfVcrKYx?=
 =?us-ascii?Q?BO2cn25llZ3sAPlUZT7DZXJpj9Q6u1tJtW3kfb7p5HToUqdmfxfu10Lfe3T3?=
 =?us-ascii?Q?+cSgX5CUaIC9VN6FWgsCP8Gx06wC7miOduBfEOVq2k4wOhg/ELVdVa5ju13q?=
 =?us-ascii?Q?NKOzu+QdiGukOgM+Wi1uqCp8H6Hz7ZLaQx0GWblcdYqYX9bzxsMkbAt5l0TR?=
 =?us-ascii?Q?dEMAau7I3bdWu4ISOwor+tlLaDHtQzi4l3wSM88GEUbOZxwt41MfnxbpXNNJ?=
 =?us-ascii?Q?jr0gUrPiEsXyGvogXPbkeUBV/ibBUC+D0zl5EtcnPtTRnI8e56lvmL9+QPWu?=
 =?us-ascii?Q?JIaOqZWJk4cK3KiSQSJ5z3FP10Pg50n7DkLaHCS/BRh43jmsnxm6D4xtin4r?=
 =?us-ascii?Q?f44qE895URNLd7WbNVk8Nz09M5CqmeKZw4SjMwr3WdieLPzj/0MNRil3JSIN?=
 =?us-ascii?Q?pTiGKDSeMjGmD04uiw3Axan2EJzufmjvdZ3wh7DF5C5ghgp+i1JFg+6krLjD?=
 =?us-ascii?Q?RrY0r+IziXLRwL7bKOrs+rdDif0OnH65Cfi3agVQxjjPlNS4vI/prcP8PsIp?=
 =?us-ascii?Q?wdkvZxEDGoMujq3QlAQs1vQIWc5DdGzomMOXoW0TMKIMNfyH41QRHvrggkMl?=
 =?us-ascii?Q?zNCUkNaj/CwlwhFgNklU+7Sqr4l9LoIkGIfVEWl2pHxOlShOacmWf/vq50Yf?=
 =?us-ascii?Q?/q8GbOE8cCZ4j2JkEpHjw/bFrH3NMCoob11ZlD3NRPGMzAKNvMibBvnJP8/l?=
 =?us-ascii?Q?KQpn37JD1J+Vm2y8SLnhlpXlFuLXRMQ+yXlHQrpQ2llgOTKcQ5i1aLkswpLM?=
 =?us-ascii?Q?y1B9uuik1zU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HE5FgANPMJUbZAuDn1f8Xp5F+RqOD5nV5LV9v91dsNNA/TrjXhmv83TEeAqg?=
 =?us-ascii?Q?YxPIRg1tBJkHj2iU/19iBdm7V01W5r4Cv3ufzCIFoZtWSfgjQ7Ygxj+EH5pG?=
 =?us-ascii?Q?lqCIRJr/sjIhrRWhOpQ8dL++c4aqY45x61oZ7YSzCqoOVRAsS3BykHqQkO8s?=
 =?us-ascii?Q?gFxsAI+r95uGj0zhanvoayBorlNoFnN7U3BXk7d8S5/gAboUrRLCDozSuTw7?=
 =?us-ascii?Q?oKElKwA9TnCdnt5QMvbutADl1x+uDIY5dIowFJremwoYCvQ5mi9av+B2tWcz?=
 =?us-ascii?Q?RBTzMwiv6t3sBJ/4hweot1AcLpTeMD51e8SVQoE5v6Gr+fwkSYjoA+XI9vMm?=
 =?us-ascii?Q?BmAlBYhqZHcqLiwiHrQhMZUHfaEVMHkYzTX/vfrRe28PNCEpeVuFZow/XsNy?=
 =?us-ascii?Q?Caz4io75ArTRyaSJuDCCVMsJ5ET9RmQvOG1NByddfFS4DMaZQFQetp5jY3HX?=
 =?us-ascii?Q?wJFfXhILUV4/UofmptQCugKTWBPah09gqbBx1WODleeuKULsqb+Dp+n1aOyl?=
 =?us-ascii?Q?nkfYKxmW3RkL5xUzX3/Eipzp8VGI+MTtHjWsU/cV3OGblZIxc+chIwHH9JDk?=
 =?us-ascii?Q?ONn6Za7Rfp0cFAG/QAGsmHRPMySxYIJn7me5WH0UeFqzUAxkk1rJnmOnaJQ+?=
 =?us-ascii?Q?fSDuQHB6BPFf1lRAY0qTpjKDQxa52DAf0A1RZY9snSBkthXBL2JY+ldc7OCG?=
 =?us-ascii?Q?SLwP0wyxzJv7Dvv/NPkHEFDx+p6c/qraB/TWKPC2I9OfUe6SbMErTUqImZZC?=
 =?us-ascii?Q?I6WqLhDKzGxfoNsFIC+KGfbjm7tn7PJ+mL4AyJbYXg8odqZEUIIX1uQkxfED?=
 =?us-ascii?Q?2wju16txhscMOhfjzjPAdJN79f5RPpaUM7qStPaPsBQ26RS8n8afZLOf0n9F?=
 =?us-ascii?Q?dlG3PfkR2kTTPGAdKkis7VkAlV8KE6bgnJNiggfi/JBw6orl5nJyn92mBe7K?=
 =?us-ascii?Q?8cC4eB5xRC3/x9klyRC6wgU+u1yrYiPPI6OcIXxNMZ73jr6yqRMKheNq0I1u?=
 =?us-ascii?Q?eC58IYa8MAxkQe8DxjU3pe7FyJ6J8OwFCCUSkxSHKxG8muceDajdVSFz4Mlh?=
 =?us-ascii?Q?PPTUxleSf7k9+OPrIwHEB8OoyBnOGWOTQkfSVU+HgjTiy3NuQ5C7FLC70Hve?=
 =?us-ascii?Q?iP6bFc4CkPloh8uWfCNo+N9Gi8/vfiXRcM9Qs21/3j0cKUi8htcEO80UlSqz?=
 =?us-ascii?Q?5qw57jnHhxVVJ8/qhRLbUw41SuENJ3tKVZJ10eGj18HprrASfOyUcLywlifH?=
 =?us-ascii?Q?OOqmYVWBgp34NJzhgVXtq7q+4dhvvC+Bb5SoiDS2ssVefVlyKwvJ6GstZv+r?=
 =?us-ascii?Q?Eds3zKzxwneMCsK5D8YZg6FflRBAzl5wjBuWAlBjaqa3GP3eUWobYKnSEpT+?=
 =?us-ascii?Q?sQnX0LriFKl57Me3a71lddLclLZe47QvlQJ9objGwgklcn+KqYsYHooL06lh?=
 =?us-ascii?Q?hqdUz2eB+Jg44PGKKqpabfBAcSlIWy4kIGp1eMdi6nQQrWaJI8vhqfXQr5rL?=
 =?us-ascii?Q?HsXh9x6XMCF0eMTRGuRJ032pC6u3Da+jpAb4UO0rwcZ3HGwM2VRaR69TyACP?=
 =?us-ascii?Q?v4yvoyrX2lBe8sZ0MGNbdwDhI5uuwlTQipW/QgBLGAjPI5l/0Le1qMmAHKcV?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b55f826e-2e04-45e6-bff5-08dd8999dfe7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 16:53:33.8490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQP8N22HE3anQydbefcQW7+x/T/7PYo9EqomlleZNV84vKakuIpnYXuZWP0WImzfNJ6mt8KMCMRqjLpkNly0tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4926
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

On Fri, May 02, 2025 at 11:35:10AM +0200, Maarten Lankhorst wrote:
> Create a macro for creating a pinned user bo, similar to

s/macro/function/

> xe_bo_create_pin_map,
> and use the same destructor, xe_bo_unpin_map_no_vm to destroy.
> 
> This reduces the amount of churn in the tests, and makes
> it easier to read and add more.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_migrate.c | 174 +++++++++++---------------
>  1 file changed, 72 insertions(+), 102 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 4a65e3103f77b..12a3318b1a5d5 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -333,9 +333,9 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>  	xe_bo_vunmap(m->pt_bo);
>  }
>  
> -static int migrate_test_run_device(struct xe_device *xe)
> +static void xe_migrate_sanity_kunit(struct kunit *test)
>  {
> -	struct kunit *test = kunit_get_current_test();
> +	struct xe_device *xe = test->priv;
>  	struct xe_tile *tile;
>  	int id;
>  
> @@ -351,15 +351,6 @@ static int migrate_test_run_device(struct xe_device *xe)
>  	}
>  
>  	xe_pm_runtime_put(xe);
> -
> -	return 0;
> -}
> -
> -static void xe_migrate_sanity_kunit(struct kunit *test)
> -{
> -	struct xe_device *xe = test->priv;
> -
> -	migrate_test_run_device(xe);
>  }
>  
>  static struct dma_fence *blt_copy(struct xe_tile *tile,
> @@ -511,7 +502,7 @@ static void test_migrate(struct xe_device *xe, struct xe_tile *tile,
>  	kunit_info(test, "Evict vram buffer object\n");
>  	ret = xe_bo_evict(vram_bo);
>  	if (ret) {
> -		KUNIT_FAIL(test, "Failed to evict bo.\n");
> +		KUNIT_FAIL(test, "Failed to evict bo: %pe.\n", ERR_PTR(ret));
>  		return;
>  	}
>  
> @@ -631,124 +622,112 @@ static void test_clear(struct xe_device *xe, struct xe_tile *tile,
>  	dma_fence_put(fence);
>  }
>  
> -static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
> -				       struct kunit *test)
> +static struct xe_bo *migratable_bo_create_pin_map(struct kunit *test, struct xe_device *xe, struct xe_vm *vm, u64 size, u32 caching, u32 flags)
>  {
> -	struct xe_bo *sys_bo, *vram_bo = NULL, *ccs_bo = NULL;
> -	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
> -	long ret;
> -
> -	sys_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
> -				   DRM_XE_GEM_CPU_CACHING_WC,
> -				   XE_BO_FLAG_SYSTEM |
> -				   XE_BO_FLAG_NEEDS_CPU_ACCESS |
> -				   XE_BO_FLAG_PINNED);
> +	struct xe_bo *bo = xe_bo_create_user(xe, NULL, vm, size, caching, flags | XE_BO_FLAG_PINNED);
> +	int ret;
>  
> -	if (IS_ERR(sys_bo)) {
> -		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
> -			   PTR_ERR(sys_bo));
> -		return;
> +	if (IS_ERR(bo)) {
> +		KUNIT_FAIL(test, "xe_bo_create_user(%x) failed with err=%ld\n",
> +			   flags, PTR_ERR(bo));
> +		return bo;
>  	}
>  
> -	xe_bo_lock(sys_bo, false);
> -	ret = xe_bo_validate(sys_bo, NULL, false);
> -	if (ret) {
> -		KUNIT_FAIL(test, "Failed to validate system bo for: %li\n", ret);
> -		goto free_sysbo;
> -	}
> +	if (!vm)
> +		xe_bo_lock(bo, false);
>  
> -	ret = xe_bo_vmap(sys_bo);
> +	ret = xe_bo_validate(bo, NULL, false);
>  	if (ret) {
> -		KUNIT_FAIL(test, "Failed to vmap system bo: %li\n", ret);
> -		goto free_sysbo;
> +		KUNIT_FAIL(test, "Failed to validate bo(%x) for: %i\n", flags, ret);
> +		goto out_unlock;
>  	}
> -	xe_bo_unlock(sys_bo);
>  
> -	ccs_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
> -				   DRM_XE_GEM_CPU_CACHING_WC,
> -				   bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> -				   XE_BO_FLAG_PINNED);
> +	ttm_bo_pin(&bo->ttm);
>  
> -	if (IS_ERR(ccs_bo)) {
> -		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
> -			   PTR_ERR(ccs_bo));
> -		return;
> -	}
> -
> -	xe_bo_lock(ccs_bo, false);
> -	ret = xe_bo_validate(ccs_bo, NULL, false);
> +	if (flags & XE_BO_FLAG_NEEDS_CPU_ACCESS)
> +		ret = xe_bo_vmap(bo);
>  	if (ret) {
> -		KUNIT_FAIL(test, "Failed to validate system bo for: %li\n", ret);
> -		goto free_ccsbo;
> +		KUNIT_FAIL(test, "Failed to vmap bo(%x): %i\n", flags, ret);
> +		ttm_bo_unpin(&bo->ttm);
>  	}
>  
> -	ret = xe_bo_vmap(ccs_bo);
> +out_unlock:
> +	if (!vm)
> +		xe_bo_unlock(bo);
>  	if (ret) {
> -		KUNIT_FAIL(test, "Failed to vmap system bo: %li\n", ret);
> -		goto free_ccsbo;
> +		xe_bo_put(bo);
> +		bo = ERR_PTR(ret);
>  	}
> -	xe_bo_unlock(ccs_bo);
> +	return bo;
> +}
> +
> +static void bo_unpin_map_user(struct xe_bo *bo)
> +{
> +	if (!bo->vm)
> +		xe_bo_lock(bo, false);
> +	ttm_bo_set_bulk_move(&bo->ttm, NULL);
> +	ttm_bo_unpin(&bo->ttm);
> +	if (!bo->vm)
> +		xe_bo_unlock(bo);
> +	xe_bo_put(bo);
> +}
>  
> -	vram_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
> -				    DRM_XE_GEM_CPU_CACHING_WC,
> -				    bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> -				    XE_BO_FLAG_PINNED);
> -	if (IS_ERR(vram_bo)) {
> -		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
> -			   PTR_ERR(vram_bo));
> +static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
> +				       struct kunit *test)
> +{
> +	struct xe_bo *sys_bo, *vram_bo = NULL, *ccs_bo = NULL;
> +	unsigned int bo_flags =
> +		XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_NEEDS_CPU_ACCESS;
> +
> +	sys_bo = migratable_bo_create_pin_map(test, xe, NULL, SZ_4M,
> +					      DRM_XE_GEM_CPU_CACHING_WC,
> +					      XE_BO_FLAG_SYSTEM |
> +					      XE_BO_FLAG_NEEDS_CPU_ACCESS);
> +	if (IS_ERR(sys_bo))
>  		return;
> -	}
>  
> -	xe_bo_lock(vram_bo, false);
> -	ret = xe_bo_validate(vram_bo, NULL, false);
> -	if (ret) {
> -		KUNIT_FAIL(test, "Failed to validate vram bo for: %li\n", ret);
> -		goto free_vrambo;
> -	}
> +	ccs_bo = migratable_bo_create_pin_map(test, xe, NULL, SZ_4M,
> +					      DRM_XE_GEM_CPU_CACHING_WC,
> +					      bo_flags);
> +	if (IS_ERR(ccs_bo))
> +		goto free_sysbo;
>  
> -	ret = xe_bo_vmap(vram_bo);
> -	if (ret) {
> -		KUNIT_FAIL(test, "Failed to vmap vram bo: %li\n", ret);
> -		goto free_vrambo;
> -	}
> +	vram_bo = migratable_bo_create_pin_map(test, xe, NULL, SZ_4M,
> +					       DRM_XE_GEM_CPU_CACHING_WC,
> +					       bo_flags);
> +	if (IS_ERR(vram_bo))
> +		goto free_ccsbo;
>  
> +	xe_bo_lock(vram_bo, false);
>  	test_clear(xe, tile, sys_bo, vram_bo, test);
> -	test_migrate(xe, tile, sys_bo, vram_bo, ccs_bo, test);
> -	xe_bo_unlock(vram_bo);
>  
> -	xe_bo_lock(vram_bo, false);
> -	xe_bo_vunmap(vram_bo);
> +	/* For migration test needs to be unpinned */
> +	ttm_bo_unpin(&vram_bo->ttm);
> +	test_migrate(xe, tile, sys_bo, vram_bo, ccs_bo, test);
> +	ttm_bo_pin(&vram_bo->ttm);
>  	xe_bo_unlock(vram_bo);
>  
> -	xe_bo_lock(ccs_bo, false);
> -	xe_bo_vunmap(ccs_bo);
> -	xe_bo_unlock(ccs_bo);
> -
> -	xe_bo_lock(sys_bo, false);
> -	xe_bo_vunmap(sys_bo);
> -	xe_bo_unlock(sys_bo);
> -free_vrambo:
> -	xe_bo_put(vram_bo);
> +	bo_unpin_map_user(vram_bo);
>  free_ccsbo:
> -	xe_bo_put(ccs_bo);
> +	bo_unpin_map_user(ccs_bo);
>  free_sysbo:
> -	xe_bo_put(sys_bo);
> +	bo_unpin_map_user(sys_bo);
>  }
>  
> -static int validate_ccs_test_run_device(struct xe_device *xe)
> +static void xe_validate_ccs_kunit(struct kunit *test)
>  {
> -	struct kunit *test = kunit_get_current_test();
> +	struct xe_device *xe = test->priv;
>  	struct xe_tile *tile;
>  	int id;
>  
>  	if (!xe_device_has_flat_ccs(xe)) {
>  		kunit_skip(test, "non-flat-ccs device\n");
> -		return 0;
> +		return;
>  	}
>  
>  	if (!(GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe))) {
>  		kunit_skip(test, "non-xe2 discrete device\n");
> -		return 0;
> +		return;
>  	}
>  
>  	xe_pm_runtime_get(xe);
> @@ -757,15 +736,6 @@ static int validate_ccs_test_run_device(struct xe_device *xe)
>  		validate_ccs_test_run_tile(xe, tile, test);
>  
>  	xe_pm_runtime_put(xe);
> -
> -	return 0;
> -}
> -
> -static void xe_validate_ccs_kunit(struct kunit *test)
> -{
> -	struct xe_device *xe = test->priv;
> -
> -	validate_ccs_test_run_device(xe);
>  }
>  
>  static struct kunit_case xe_migrate_tests[] = {
> -- 
> 2.45.2
> 
