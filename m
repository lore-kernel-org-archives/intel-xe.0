Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB5BCD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 22:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0976410E420;
	Fri, 12 Jun 2026 22:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LuKhYJpZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6257310E420
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 22:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781302192; x=1812838192;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r9Q/1UJc5nzHfYdpKUJezhNZYxizGuWeLw+vQ4itcpA=;
 b=LuKhYJpZARjrmOCTIOIRP/DXPwCoi0quATgbQn/++VVQd2UpAdiCWWoh
 w6K2ab1POoC3ksOBwwhkAH7jrZfn0gR1iZWxhquHSqus9pOZ4xGbOYVge
 Ua1sK52YVYfy5b9xIH/vk8zvLRz9N0XF/qSOG//U4HHBvstcaxIQXluES
 8H2dN9jqsCdPUe/STXJAJY4PgiWzSzSVLjHfX1BeAZnsO8N4ZN/vTlWKV
 MUrRSwqyxHd96MA3g6beInmvkjMAzuNm9vKeFjMnuC+IfBcs/71O3WN90
 YizFid2t6Oy0/P4OeNZlfW8TkmT4BH+5KzNMyhIrXoGpbJ1QMSvs5Y18t A==;
X-CSE-ConnectionGUID: tA+gkHC8R6eB15VdlMMORQ==
X-CSE-MsgGUID: hHPaUZ5tSOKSUPDPVLSLWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="81157385"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="81157385"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 15:09:52 -0700
X-CSE-ConnectionGUID: qUeeVgnZRM6I0z/n7D54Hw==
X-CSE-MsgGUID: ibdPtVN7Rgalcm3h3yVkdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="242783996"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 15:09:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 15:09:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 15:09:51 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 15:09:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClBcrXPqnXx8n9EFhEXY1f09DOoO0aj/Igq2zrma8ApAswaHp7p5JxJx1dVjOez1PPFpNnqzgNvxgeN1nwyrjH1O+A2Mhlro+WXVDMtXoZpU7gDsVpuCcDMxhLPAnxA/xQ3XcuommHOEYVCm7CkRaPrePSoMfGsa3wBEroCyJFBO8ElXwlFPuXNFcSbDqH1nhcYLOsqsDW71UgHpvI00Aumwv9XFnGn01jJQYT8yA4BNoz6rviuHhjYVpaP/obcCJQ7hKCajalvu4LKzjDuYmZneEy3QqRWhhtQzm5QEGiGF94O4wQxlsHxBVSIatJpOfucuHn6yIlvUmlSo/NtIew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAFQJF9H6NiIq2XIK1khTzCKiDnN+HPyyGYyodJb27k=;
 b=KLI3bAxqMbjTht9CGXcuiMyd/z+JVRv0Wq5+nhMJEO5H6bGo3eWO+Ax4Ve2EtD/t2adV4O3kszGtzKAZPG4/+RzRFxoqLINgJOcAka1BZ2jdxXPlqs10t2J0ndrcoOh10vTpxgnZcWldAKsbR07QY2tFudpdQWaQ8RKUHGBxouNEVueS2dX/xwvZsmqp15s9zVPv5/ZT5EAnExFuNaJYwmDN7QsCH2OMx/STfzCNNN7nwXgl2YO10iKDEVr5k6dZUnG2lyQ73eOZpnX84qG5J51z+eaHinuACqbyEmR7dfyXCw1GGuyu/Q2GvrSkxDS8CyGOu3fuP8r6MwPJFlxsLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN0PR11MB6036.namprd11.prod.outlook.com (2603:10b6:208:377::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 22:09:49 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 22:09:49 +0000
Date: Fri, 12 Jun 2026 15:09:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Nitin Gote <nitin.r.gote@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw6IHN1Y2Nl?= =?utf-8?Q?ss?= for
 drm/xe/xe3: Apply Wa_16029380221 to media (rev2)
Message-ID: <20260612220946.GK6214@mdroper-desk1.amr.corp.intel.com>
References: <20260611162828.3879694-2-nitin.r.gote@intel.com>
 <178124965306.72091.13569936362124415368@6beec6c84f66>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178124965306.72091.13569936362124415368@6beec6c84f66>
X-ClientProxiedBy: SJ2PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a03:505::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN0PR11MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e782867-2a91-41e5-fe2d-08dec8cf51b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|6133799003|22082099003|4143699003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: fQ0avHW9MMVd2+4nx0RU0c6Bd/WF3OjDn0PGPoOYgd0uHZa9/mzvO2qCfoHpmKJV1mBMg0KWmdDJszDwmWsUj8bZ2KOD/bmy2zIiHZAqBBF2RB87VrjBdkw+/yhA1wA5jpxi1IzPGmqDzYEHMkYii/kmz+wROsEP7ie94/zBBWn/Arz2ppAkJv5etQVBX4UMiIBrJ8/C0njZKv2YLdoH026pHQXePDQO+CPb4xFlLJt5w9fsa1UF1aDpGuR82c2B0Se7GCkzunyyYSio7MwCQu8k5qzbXyudDXqnlXFhDyshCB66NrBErD0rOyKNvH0fr8AnOPBS154rAK9oLhjfy/fO2gFnPTia3Kij1bZ8NWmkdGzjwfvMsakJVG+ZBUrFHMVxTyE7imBAHTOYg8QMGZAak16Hl7w38nPUABjd/tWRDwTOq4b9OVbMF6wmNlIbpfvEkb5MLc0EShkYyWNhOY8wCl/+79IYWimVu3OiFCTo146lbLGvo3XTN+XQws+sUIHJHglzw5cy2JkIn/qGFjP+1tSDiloTKDIX++kuEDOCwzvXcS77X2DVtIQBk0F19OCur6p5l7RqSrtgD0RTO6Ah6qErWs4GIInhH1MlnbyF9a5N4YmApSVUBAmUvOSk4NBEQSnziTcpI1+4ZDkpRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(22082099003)(4143699003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sBmPhwBKxu3rFnE6JUJ6dV766kZx6aKG+2Flsf9sz/0PIr5jRZsZFUg52fin?=
 =?us-ascii?Q?WZswBbCmvBSZFQJK9seX/StE1lhQy2KDbEFm7uWfJbHU8eMf4n6og5r54To2?=
 =?us-ascii?Q?U0Yc8p4KQyewxnDcn3KtWf5z18/7imVidpPLE6xp1c4T2cjEGxE3R4umFHkh?=
 =?us-ascii?Q?CZlSDfXrmJDPSNITloE7piuazeAWOrHsz5ECciXxsh8vA0fMT7YG+z+5WgyP?=
 =?us-ascii?Q?1g2Al9rcXavAj7WsXdYT7oYTampYVYh85ABo5A+QmtNs+Q6Ci75gJnQsXP6q?=
 =?us-ascii?Q?lLhKF8H+/hTyTCbSAn6Ah6xuHCdvmhLnzhdHpBpvZNw4UweGWgH/2OqfS5ol?=
 =?us-ascii?Q?YfkLUZ0ktg1ZQdndGgU/sboOaGKevXCz6a6UONQCz5i+bJWdcKhJ3jrRkEH3?=
 =?us-ascii?Q?L8YQWcQakHzov8aGG4FK1TMPbIur7JQ43sjXteAWPNfFCEPi3tZK81TgAtEh?=
 =?us-ascii?Q?fYou2IiDT6FapDgCiWs0tdI95/BWp6q3MtRu65oshP7UhLfwYp8guT7h6Rqu?=
 =?us-ascii?Q?TTpUMaSkX0rSdiddqp5hh5WIjuH9DPxcLPt+SFI9W7OecOLifSTv85pEBZUR?=
 =?us-ascii?Q?PM1oh5yH/4zomtuf5wJSfMjwztG3izkS1q7Viv3OgBUOtZqLMG0HoYXE/MB6?=
 =?us-ascii?Q?IkFLyEhMNnZLxb+yf25CYsqVI20g9khpuq1x8EFybPGyKFaVUZGSmNH/jzK1?=
 =?us-ascii?Q?Q7U4bnbrPCjmHC3itaZWGly1+RuDPY/9mKMryBjuHbjtLh1AnL0nl9t8ZF9S?=
 =?us-ascii?Q?agnxDsJHSgyCEyyJ/ZQ2jVBU/eOj6Vh+gnQ8B9kkPo3qQ3DjBXwc4cCq6O30?=
 =?us-ascii?Q?mROSFOreTclztKEsdlq/p8F5ZUEpwdVWIK2qtlLbdPv0NRaGJAWjN6JGVZAf?=
 =?us-ascii?Q?b/vK9V7nUSi42DBSGQQWbWhyGUlgRTNe9yXusOILTfpDYoGMKHtIBeGz+dTT?=
 =?us-ascii?Q?RopRXNwr7pC3U5AryqxcCIV/TngCeOF5n9rw93kQkO0jQhISndL4Y+EDt+Dk?=
 =?us-ascii?Q?IAvTXmqujLNBQctvfungOSj/Yh5PLWrl1G0F9WD2Z/MV0ab5pW2PrV6wzQSM?=
 =?us-ascii?Q?rXcRTVCbeo0wkFT3lA8OWcQz76lg3/qp4eK6YAMfB7BUMK3JP9qsji2PCskx?=
 =?us-ascii?Q?cinfgYKdM8XL3ihBhx+qiKKCU3I460i/NqxJnZC/KmsoTQb9yiTh7hoxJTH5?=
 =?us-ascii?Q?MM4q3p8h8PdWPSPMrx+k1J4oyiGwaf29esQmnkb4/G6KR++DKocpulnivc/E?=
 =?us-ascii?Q?32llhGY47gKs4JmfLDlOxkBpRHr5jphjJN7Tiu5UjAwz1aYiz/hzdC4EspHw?=
 =?us-ascii?Q?aSCiQ3Zy6+zq/HZMgPzhSYvQYhaxgqwK1wKxgyL6s6t2fDIB8i6YKg2JEsrD?=
 =?us-ascii?Q?ImOX1xeCzOOVByYxmZdPwHIEE6xojVTVFT/cOWO3LKqNfOlwyLa8XZCCGzbA?=
 =?us-ascii?Q?QuRWK/60y0J7asHUaOTtY3Ell+pjJTliVg+LAfWalUeRoSFKcVYsB3pupLx7?=
 =?us-ascii?Q?aZe/a3kiadOyyTS101X8HvxIaHhkZzaZkgLEN2Ha1MFcv9lWZw+wzyNSuv7k?=
 =?us-ascii?Q?ZOrp6BsPF+vKtG/0ekp/Y1DN6K1L293MrjabvUupIsyDbNmf8Jgx8c9jDBOj?=
 =?us-ascii?Q?6plWIi7xLdkgjjeA4RnwN0dfwzAe60MtJgXDD8cxeZ62lk/zwYboUpySMiHu?=
 =?us-ascii?Q?X/KvTGsb9QSkQU0Ogbz4CpafmnkRS6LvyYBK6NEz9zccr9Z5MXxG2KEGMYbo?=
 =?us-ascii?Q?vJ0lSeG0VMte8SMgGOOyLflxdzmcDT0=3D?=
X-Exchange-RoutingPolicyChecked: qhYLKt9y2PKEb/O6ro5KTFBzdaHlWaQ9KuAcnWmGfygA7DE0j8APsrMx+M2lhbe79O0JQ2L1PuTcR0qRdSmQORStwL03Mi46IGP713hQcZ0KRgbt5LczPx/icRA5ZsgGkD5csbKgVwUZ+iEeK8mx9EGmfLOVbt8BY6KoTvKd4La5IBus0Elz9kBbNP15gx+GHqo8l6n9L4hgLxqTSvZnvBVcxMGvwA3tradFzCQnGMyki/pHugcOTtkC+SuDhDdszG3op0FA30P0kphAU3IINlZPJUw2yZ7TBvqPSZg1A691fOYo7yjpFM7GxkNs/gKly+p2+KpUjNcd+btnA5yq8g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e782867-2a91-41e5-fe2d-08dec8cf51b8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 22:09:48.9440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: infqXcMkN9XeOb+FhkeYOeQIfkvSiae0/ju6KH2fllOA5y6gBzQ8vOl9TIiww9pEqBQwaL6KoQtXpR5dF9f4vU3UCoWwFqTYzdWnUs55mB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6036
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

On Fri, Jun 12, 2026 at 07:34:13AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe3: Apply Wa_16029380221 to media (rev2)
> URL   : https://patchwork.freedesktop.org/series/167525/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5241-a472b6217138ef0942355824543a5cce12f43343_FULL -> xe-pw-167525v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-167525v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2887]) +1 other test skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167525v2/shard-bmg-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-lnl:          [PASS][2] -> [FAIL][3] ([Intel XE#301]) +2 other tests fail
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5241-a472b6217138ef0942355824543a5cce12f43343/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167525v2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2311]) +2 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167525v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2313]) +2 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167525v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html
> 
>   * igt@xe_eudebug@discovery-race-vmbind:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#7636]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167525v2/shard-bmg-7/igt@xe_eudebug@discovery-race-vmbind.html
> 
>   * igt@xe_exec_multi_queue@max-queues-close-fd-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#6874])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167525v2/shard-bmg-7/igt@xe_exec_multi_queue@max-queues-close-fd-smem.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#7138])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167525v2/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html
> 
>   * igt@xe_wedged@wedged-mode-toggle:
>     - shard-bmg:          [PASS][9] -> [ABORT][10] ([Intel XE#8007])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5241-a472b6217138ef0942355824543a5cce12f43343/shard-bmg-8/igt@xe_wedged@wedged-mode-toggle.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167525v2/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
>     - shard-bmg:          [FAIL][11] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][12] +1 other test pass
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5241-a472b6217138ef0942355824543a5cce12f43343/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167525v2/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
>     - shard-lnl:          [FAIL][13] ([Intel XE#301]) -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5241-a472b6217138ef0942355824543a5cce12f43343/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167525v2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [SKIP][15] ([Intel XE#1503]) -> [PASS][16]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5241-a472b6217138ef0942355824543a5cce12f43343/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167525v2/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
>     - shard-bmg:          [SKIP][17] ([Intel XE#7922]) -> [PASS][18] +1 other test pass
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5241-a472b6217138ef0942355824543a5cce12f43343/shard-bmg-1/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167525v2/shard-bmg-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
> 
>   * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
>     - shard-bmg:          [SKIP][19] ([Intel XE#7915]) -> [PASS][20] +1 other test pass
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5241-a472b6217138ef0942355824543a5cce12f43343/shard-bmg-6/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167525v2/shard-bmg-1/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-lnl:          [FAIL][21] ([Intel XE#2029] / [Intel XE#7395]) -> [PASS][22]
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5241-a472b6217138ef0942355824543a5cce12f43343/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167525v2/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:
>     - shard-bmg:          [ABORT][23] ([Intel XE#8007]) -> [PASS][24]
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5241-a472b6217138ef0942355824543a5cce12f43343/shard-bmg-6/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167525v2/shard-bmg-7/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html
> 
>   
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
>   [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
>   [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
>   [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
>   [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
>   [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-5241-a472b6217138ef0942355824543a5cce12f43343 -> xe-pw-167525v2
> 
>   IGT_8959: 77337ca2d2dd470f3b32f1cf4760b0e79a52e2b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-5241-a472b6217138ef0942355824543a5cce12f43343: a472b6217138ef0942355824543a5cce12f43343
>   xe-pw-167525v2: 167525v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167525v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
