Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00003F8D760
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 16:06:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F78D10E8D9;
	Thu, 16 Apr 2026 16:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFLna1N/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F73110E8D9
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 16:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776355572; x=1807891572;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5r2pBUvWuemZvAR9C8Ch/So6A3cv7Zk9PcAKa3vuXRg=;
 b=bFLna1N/siWa6PsCaMJQKYSK2cd43z3qdkftFoThxxv1b2Cz1BTouQq5
 MKzNoxC50VpJmCLd3Yuf/0cTzV3bpM9p4WRQTk9OqQMk+YiXnbUnB7eaF
 c4r9X5g79Rn3UMgcJ4WvA0IuJjaS2LJniaUK20Ic0EMs8Tru6HqqXLiIY
 Qdf9zS41Z0xGhTOe+7M5jgV3E23xm83jP7g8J8y/wjv3x2E0v3Or+CW0y
 xYNrcrH8j8OYHoBv6bAU/SlYROGguVetTS63BOICcW26ICXbgO1h7yxiH
 CxWtwka4AIQViVF5I9c2wrt06qjtj5bAV96dJujQwE2AstkMGpeAd5NQX A==;
X-CSE-ConnectionGUID: P0zf5B73TWWdV8x9X3pDMQ==
X-CSE-MsgGUID: LL+7cGxzSHumVTf4BO5Zhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="87981535"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="87981535"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 09:06:11 -0700
X-CSE-ConnectionGUID: 2KGucknsSfCAGeRO4gKIyg==
X-CSE-MsgGUID: Zx55Pr/hRVGhRJIjWvzsNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="228109623"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 09:06:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 09:06:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 09:06:10 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 09:06:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnVhvyZ3AunobwZnkuY0ALsvmQ5uEqkxcg1FaHi/nxAV28C5vQCOsa5gIzmD/D80x/SGYFsqpY3wJBJ+eafgJyxq6bISyLBh6Mz5k5+TJkN1nAjPypr4wB/vJ5a0pgCz7KDXvZHdmVSRVp2diE9JKZ4RSYVCgAN+Bmg8QoYPu/rzLpLIJR9x2cxHzgFI4kiBwDWWTeUfNOd815o/8mt06d4K4JYAVh5hrvLSyb4SIQSCiXopWo3GGM7vq+LnW1M7CveZtEdUSRzwdk49zR/pLCs/1NmNME5WoVrTHfzlr/xfVBzhWvzCDM5UVHoM4u+3YT+FxkFQIn6udz4o1y4l9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2MpZbvfxkQMeEg2zK2Bu5al1qRqvlGDLhxM2jNvaYs=;
 b=VIsH6CUfygK2o7yfxG8Sju+uJSuzjXkjmkDDW1XatnjdXOFTMnfg1ZbJHrVNVuu3Aw+J/irXeTV5bshcbZdu9/Azya8FUMAQSVN3VqT6ClXd7mqSNB15Nhxgiae8Vw69XW9vLdtfhE1yAGZKqoqXDP2WZ5r6PGmL3+xrDrdjX52bN/qiE2mlPm37wb4JwDx8kcbQ2HgvjeDUxgIbmxZ2gZkm7AaadVWNwUZtyEjJXH0Vno86FbWKZlzl4hY9qRbI2NzUUOpyk4Ikn6zJd5A2JAoHfrAdYbpdIdN6GNwwjT48ALxVvjfoIclDyt+Pq9I3H9JxZgWKyvtlPDYZtx92Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH3PPF5D8CD6E8B.namprd11.prod.outlook.com (2603:10b6:518:1::d25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.42; Thu, 16 Apr
 2026 16:06:06 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%5]) with mapi id 15.20.9818.023; Thu, 16 Apr 2026
 16:06:05 +0000
Date: Thu, 16 Apr 2026 18:06:00 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Fix VF's scheduling priority reporting
Message-ID: <20260416160600.lghjvz2avpgmxhse@intel.com>
References: <20260416131831.7302-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260416131831.7302-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1P191CA0014.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::14) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH3PPF5D8CD6E8B:EE_
X-MS-Office365-Filtering-Correlation-Id: 408ca496-8e4b-4d8d-6b77-08de9bd21043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: yj4qKuJyixiFpQkfXC2DGQoZ60Kz6v3yRgtjM/QAoQjYnl7Z0jqFXSUmqTMWeVRrRLPspZBSVDNV050MKIcBzZlycSRx8xEGXUL6tjUBhdwUB/tY+vtO7VqTeqsDDPpBfPl9x+G30kQZ8ziF1bmOE0yiP/QDQua8WmqLlW+oOAIiQME3B2IMmRQS0SrOjA1xIS9Prim4a2uiFsfx6BDBfyTPzawDeFq30rmjVcfoYmJ3iLCGzQ0hKj1Wk9EG0ap8c9XjEbBV8P1x4L1hbp1rBEtwZvHPTbRtYs3r27nXWI3+3U1BVrhW080/hxHtAE5Wz4SG48cbgDNTBU2HdoBmRrHQMZ+az0DJeLaCYpA8fGJZlzqbHItrJ7KtKEz8UlIHzDjtHcu0RnBJsFwDgsvSW4PpZQNpjVvbRuYUS5LUBjuh8T9mUTbivWRTmEbzXLnkZQAAuLktFSZ+FjvGvLDWKok87f58eLrKI48OL0NXEljuf2a++jvk0bPK3fu7jVgCQBeTLmH98ATZ9kSaxzMcefdL6HdQ0TbxAA2KSJ+/t1hlWBPY3ECgNgOHIW0+iKkBB0O9oNiwVeYS62x6Sk9xvuPKXZEvbOZUjOtfR/KEav4aiHU8l9ZWFdD+HYmefHSgfPAXGYcWpLqLpBpXtejVuS3NK8l0N2zRYB4ALc8spHUU51LH6j0sPRPAj6ac1jjU+lP70jm21vQQ+IsqtPXHPLyPHlui9q1/jEJSIQ00SMA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWhoWTB1dFNYQUtNM1VVYUNJUHMycE1YZ3dwOWEzcmM0ZUJ5Z3FCK21xWUpR?=
 =?utf-8?B?RmdTbk5Vd2dLQkhCaWQ3NHJUTXF4VjNOaVViR04rV2liL2lNUGFtSU1qMFdi?=
 =?utf-8?B?cVJPZHk1NjZCRUp4S1grR1lTL3BDcUhOMXlqUGV6b1NGa2lSRThhMzNUYWxm?=
 =?utf-8?B?Z3diZVF5c2JsSXh0YS9ySGFSeE9PZWl1aTZBKzUxZjkvckI4dzdRR3VKWnhQ?=
 =?utf-8?B?cVdWaGlSckFrUEx2TGhHNWMrQjVvZ0xxR3BuSlBWNmJPS1M3MFJuNURyeGl3?=
 =?utf-8?B?UGlPQkRxMWJZR0VPWE0rcnRPTWRMZWR3OEFxeWJwSWd6bEpwRktVOVVKbWpj?=
 =?utf-8?B?MWlTa0hpMHZYckFscVd6em5UdkJya0lJM1VIQ1phSjdMNU8rMVZtTGF0cFph?=
 =?utf-8?B?Q1dIOUZNM1EyTWtKdGlVdW5SN3ZsTmZJQzZtL1JsQnlrVWVVeVBtOXJvemdO?=
 =?utf-8?B?czZ2b2Y1S2VxbVhMMGxmRlRpbXVkZzN5STdtQngwN0VqQWJRaVpXSlNJSHVt?=
 =?utf-8?B?VFJvMmJPTXNhY0U1MGNEQWNVSDUwb2gvMVA1ekcxZW9XWUJlc0JWQ2o1QkU3?=
 =?utf-8?B?OHgxOEdjYllrTmEyNWEvc3Nzam9HVmRlekNoTksvRksybXR4WnZ6bC9rM1pM?=
 =?utf-8?B?KzhpZ0JIOXlzcVZFK3U5WkdFUXZRaE1WaENwQno4MGRxcUJRaGowRU1DMzJT?=
 =?utf-8?B?R0lENEZGNnk3RXFTSEVIcXpvUFhic0JGeVphY2kyT2ZUT1Vqdm9xSGZabnlp?=
 =?utf-8?B?em5oTisrdlFrV2VyaEozQWd5d3JxeXhxTExRL2oxSzA3c05PQVNnQjFSOFBH?=
 =?utf-8?B?UXUrZ3Q5SXB5dTNLaGFsc2RUUUhBc1NNbG9RcFdwNzVZWVFEdktzN1krSkFh?=
 =?utf-8?B?OGdhOU5wUFk3a3I3Z2srdVZSUmZPY1Z5QjlpL3JtbzlaeW5xeEhCN245Szlu?=
 =?utf-8?B?OWRVR1cyZER1WDF4WEtnWHNlUnZocVUyV3h4MWVZTEVKSGE3Nnd0Sno4alBK?=
 =?utf-8?B?NUx2cFhyMExmNE03cnFaNVBVN3d4cUl6RVArYnpjNVNGWVlHWEZUcUNKMTNN?=
 =?utf-8?B?RDkrdm1iUmM4SGN0blJFbnRiS2ZJclJ2aytwa3lrMU4vYlA0dTJrWmpadWRD?=
 =?utf-8?B?aGx2UkRzRFAybGQ5ZFJaQ3pYeHRYL3ZXaTEyWW42R2NGZ3B3Um0zTTA4VHNm?=
 =?utf-8?B?Y3B2VjhENkpuOGNpQXNWVUlsdmtxeWdpZ0p5K080TXBlQjgzUWVQNnEySUtP?=
 =?utf-8?B?c2dFMGhidDREK3BWcGRLUDlvUTZCc1pPOVFVUnhsZ1FlOEJ4TFJxQVJua3ND?=
 =?utf-8?B?a2ZwQjZQR0x4TWExRVI0cUMwekpTVlJCMG80a1hET2JoOFJ5SW9IL21vZlpN?=
 =?utf-8?B?UThWRllpVWJXVmdZR3RnV1ZOdXR3b1VsQVl1MlZMVlJuTnorQzNGTHU1L3RY?=
 =?utf-8?B?NDdDVHpBTFIvSmhxUmpBK3dNNE8xa3hteW5xRjBFRE1XNkdqNlRMOXU2TWE0?=
 =?utf-8?B?b2p1Vy9UeUdFbndYTjBlekNJSEhWeHdPU2QvYUlxS1Ayeks5SnJvWnNHYVdT?=
 =?utf-8?B?ZFRVMzZUMlRNUENET2xzcEliRStBMHhtMm5QQm1vcnJEdC9YYmE2Z2JvR3lZ?=
 =?utf-8?B?Z1lvbXc2ZXRJalY2R3pFTjVRT0xXcGhVZUZwOFJ2Q0VXN3c3dUM3cnMxUm5a?=
 =?utf-8?B?cHZsSitVTnhURmJjYUsyRWZ4N09KdnFhVmZKMXJqK0pTbFh0cSsvcVVrUzFE?=
 =?utf-8?B?UjRJRyt2dU9VUUFHRUlJa3BxU2xLaytmQlZaRDlWU2I5dEVWemlZQTVkUkRS?=
 =?utf-8?B?OE83WEVLK0djVnRkL3ZLOThuU0F6K0ZSUHZWK2NIUkptUm5zK21IeFFSOUl6?=
 =?utf-8?B?Y0FQdnQ3enJsczlZUk92UXNhUi9RUkJSN2ZCdWZXZVB1YTNCUmFWREtERXAx?=
 =?utf-8?B?UHdJaU9ySTRpdjV2ZVBFUXl0aXJ3ek5kRmhyN0JZdmlHamdNcm8rSHZJR1FG?=
 =?utf-8?B?YmN0NEo1U2tMUnZSSUJINnJhTnM4UTQwTEhsQnUyajNCNTJCOVk2aHNXcDlH?=
 =?utf-8?B?T0xLY0FtM1h4VnNTeWZ1OENsWEM3QVVXZ0ZxZHpmbUJZZzhGQmlCT0krQjAr?=
 =?utf-8?B?TitFZUJibTRCWUFCNjZJeHB2QjZqVEE3bjNXSVFSZDQ3YktOTVNlMjFkZkVX?=
 =?utf-8?B?ZTNERWEzcDg4eGNkWlVydlZqR2YxQkMxbU9WZVVZb0xON3A4blArZlNZTVcv?=
 =?utf-8?B?VmVxZkJhdXNUbEQzMjFjK2graVhaZFg5ek1rZE5xd0NJNytCSkc2ZExtbWk0?=
 =?utf-8?B?N3pGakhER3BTS00wVnJXY0hyYnZXSDZIWDFNdTN2R2FDemw0dkZVZklDUm43?=
 =?utf-8?Q?fjgH5zskFsg9566c=3D?=
X-Exchange-RoutingPolicyChecked: dteXVLGkJIGPzHE926smh7aN5FE4FLHleovb5jrZ/WTDBQjRfDuVeJ7t/18x/a2x7illOlNbhh358agDQSD7itfI7EqGput8GC6xZ5N9x863j9Vl4kR5Jnoc+Blv+eIebYe+LSrRz0PS+btUp1Gztl/XVqy5iPR1lpC/+bcXmuaXldGsSmZWV47OYFmTTV7IicsQm0Sz+fC6qSfyD9WQ7wi76f8mNZ7YTdLh5cj2kxjTCxhnpt2AyWGS0f58OYAQOn4w6giUFqTSAYbhD+F13LLoCCFTn/iQ0LdanVged9vjTwWsXl1v+UcVBdJ5TV3P4rh9rkxBbnH8v6nmeUQxxw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 408ca496-8e4b-4d8d-6b77-08de9bd21043
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 16:06:05.4539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XarY9v+Xs2Tf7UybUZbcWO940XMg7hNq/SPK+4P33ffH2bhwXyyMTNv+c5cBoA9338vnYZLFvNXNgm6cQKzXvvZB9wVy+ATnWN17XfhZeb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5D8CD6E8B
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2026-kwi-16 15:18:31 +0200]:
> When preparing number of impacted VFs parameter for the reporting
> helper function, we wrongly ended with adding +1 (representing PF)
> twice, since local variable total_vfs was already adjusted. This
> resulted in printing a message that was referring to an invalid VF:
> 
>  [] xe ... [drm] PF: Enabled 2 of 24 VFs
>  [] xe ... [drm] PF: Tile0: GT0: PF..VF25 provisioned with 0(low) scheduling priority
> 
> Fix variable initialization and adjust the loop accordingly.
> 
> Fixes: fbbf73a81b84 ("drm/xe/pf: Force new VFs prorities only once")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index e112aa148dab..2c9b85b84b1b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -2626,14 +2626,14 @@ u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid
>   */
>  void xe_gt_sriov_pf_config_force_sched_priority_locked(struct xe_gt *gt, u32 priority)
>  {
> -	unsigned int total_vfs = 1 + xe_gt_sriov_pf_get_totalvfs(gt);
> +	unsigned int total_vfs = xe_gt_sriov_pf_get_totalvfs(gt);
>  	struct xe_gt_sriov_config *config;
>  	unsigned int n;
>  
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>  	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>  
> -	for (n = 0; n < total_vfs; n++) {
> +	for (n = 0; n <= total_vfs; n++) {
>  		config = pf_pick_vf_config(gt, VFID(n));
>  		config->sched_priority = priority;
>  	}
> -- 
> 2.47.1
> 

-- 
