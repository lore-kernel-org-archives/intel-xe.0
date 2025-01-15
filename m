Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B678C02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 20:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BCD10E7DE;
	Wed, 15 Jan 2025 20:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q9Eouc4V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3009510E7DE
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 20:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736973662; x=1768509662;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B2WE2z0sK06su0dn4smrNuR2nTFyTkHpTjWeBLa4dXw=;
 b=Q9Eouc4V9f4EvNkLws1kCjHMsfBXj26ebrXcD68OVB0/CqxDpXXdfIDH
 8WWCmbbyjBSYVIt4f+IdixOWaDczVFtrI163ifTTlhBmD1qB+fhjiyWOg
 d/aG8CQIlvLlmZWHpupaL+c3WA2Qkt/IobLe53n0MAnnMXNl2aTAxkDDk
 tDeRYNqkFWx3aqsb6X+yPtPd5tA9PbNR5haa3oq4G4Eee/PB7JZYi5dlE
 up29Bn7q6PaQPXQDdePenokGViCVElorutBh1EV0DzMiqTCzBQqXmGdZj
 xegvJadURWDvJIhq3limUD1iZy2IgvkEPaUlhlYhI0pqwWyxHDYX3ZkAJ Q==;
X-CSE-ConnectionGUID: 4MmBvY83R3G51b7XUwP6Ew==
X-CSE-MsgGUID: IC0YXrA6TSGYg95kL7A3Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="47815993"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="47815993"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 12:41:01 -0800
X-CSE-ConnectionGUID: RqZ90qcPQOS3LxF6U7XYhw==
X-CSE-MsgGUID: xmS7AKUXR5CdpiKl04Pnig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="105084817"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 12:41:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 12:40:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 12:40:59 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 12:40:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6CxnKk+N9E8OstqMSVUPJ4oocfB2mQZujaAIxV85HeaBvWg9tBLu9f/Av7rRJCBKPP/yY/ci+LdFwiRprItw1R8lEkJoPDm4o3CLX0SwenFCdl83uWyenPpmCID6XpT9quRqw4xQccY+kcxqN8dythJJe+Zy92TwShn18cT9t6lMFYmuLXIwsNEgmthKyp+xetiIczHiZl4J2dXwHDKXnQVgDt4dxOmt8tiwQsyGDn8nIeeHtu3YwDdl1+hpZvQcfXjQAhJs/YzXa47ag3iqjjK+AetTU9d9WbhkfJvSBnSmQ6jhSaOCgmDeUbpqorw6Bx6POdcOEwEmeHqUQ56zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kqO/tY8tD/AVXWRpW8sYHcEdyFz4EvNMLJHFDmrhk0=;
 b=fhxUhCr6JILU5ne1zB/4Uem3qbEmOrUVEIASOpCbkgR5Go6+/o5j81x59KQ0fmdGnQLiuUNvv71VhRq/AgxKHO5FDkCwCbuDmNZhYXGhD7lnJcC0ydvdy52SrladWsGKT8eyBJbhlBRKSGGgwOJMY6IvYLBxdq3BqE+0kX5nDtPWec7+2mKxpOGC8BBgnos6GSmqE7HPxOsc9lFr/bNlNRrnHgInlPq7XX8oLcNF5W/2ebMvNxj2xcITHUOUoPN7lg9v02GcbUgwjpxRZWDNsg7Xp1i+g0rDZzlVyFYzOKFGzCHWZ15tEaMojVxSpOeeycSipoC6e44+cYinoNiR+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6478.namprd11.prod.outlook.com (2603:10b6:8:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Wed, 15 Jan
 2025 20:40:56 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 20:40:55 +0000
Date: Wed, 15 Jan 2025 12:40:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/xe3: Generate and store the L3 bank mask
Message-ID: <20250115204053.GG5109@mdroper-desk1.amr.corp.intel.com>
References: <20250114203853.35055-1-matthew.s.atwood@intel.com>
 <173693510738.3905205.4095289374949569346@b555e5b46a47>
 <Z4gbYRJ-KVoY9A2C@msatwood-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z4gbYRJ-KVoY9A2C@msatwood-mobl>
X-ClientProxiedBy: BY5PR16CA0036.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::49) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d19a3b-28e4-464b-096c-08dd35a4e8f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+xkzEztFPiprOBJ1qm+PyzNKBt+ikyvEKSHSRpAZ5iVzqftrrrB8gzPLOM7k?=
 =?us-ascii?Q?U+boFH6ICI3C9fO8fCDywZQSMu+PWdYvbDz8FUr+fqNS1H9JsKP6ohYPTrIv?=
 =?us-ascii?Q?UrrzEeavWPe30IMPKS6pUv+BA2MR1rrAcbDxU/gvpWUcK4vLTgTRGFopjJIE?=
 =?us-ascii?Q?BP3e3KuQ6U8Q8+KGFo6zcmJsnPolw6f7c8TcHOOtaznFwaMmV7r0+6W3hCNO?=
 =?us-ascii?Q?M4+foxpZnV3B7yTY3XGsI7X9o53JknNXbdsArYDYJIvKx4fEpuikhA83hfqw?=
 =?us-ascii?Q?dl89lCUke8RcIYte02ubbyUzNtznQd16jjIY2RVywVKqHkybQ6wo1+2nVvtD?=
 =?us-ascii?Q?uj0vZ8Td5YcBGx5Pj7lW97LXhsCn3HMotBOLCQouQkHr85YlVD+xsMcUYOoO?=
 =?us-ascii?Q?jIPx4hUxkAOlHcFp4MZi7DoiNpSZZgR0MVaKXcbsZn3qcEF6DBIgu3ZAC9ja?=
 =?us-ascii?Q?RJ4+9zh49ci8m82ESxQHDUrqOjadGaCQzbojy9hhAFOUcOTJ0StlvF5nQxCr?=
 =?us-ascii?Q?BVr8vpTDyN1UoteY1O5t/YQ5WD51DnKoNJrZyoWxtip2Fv4LBdp29ki2ewX7?=
 =?us-ascii?Q?B27dp5eG05SlFRWQ2kmSjZWB+Px50wA1gc3Avqb2pszl9dwzMAxtGgQeyS8A?=
 =?us-ascii?Q?6jYFNjioEUYaAsJutAOzulC095IDPH18nrk2cY+TjdFD+2nM8VxZLipABjrp?=
 =?us-ascii?Q?lDBGIW6lDMEunR5qf/IVuzi9xcSdjdV+hd5TKB8LcitcgJ1znULs/r2PGDlr?=
 =?us-ascii?Q?VKCc8Bj2nINEWXt9mZcuvo+kwMlNld4cBZry298gMH97Aj0bFKonvhNTU6gN?=
 =?us-ascii?Q?xl+F+G1IWMnmHRWFuqD3KJyJuYw68t449Wc56D6dYV/8BQ+lzImAf+zJ3NKr?=
 =?us-ascii?Q?kuMxCtcO5OxMl2TEba3kf9dHtkjnVszK4fV1hvDVTPmGMu6SjT/Cb2MTJ04Z?=
 =?us-ascii?Q?TJoyzAM8lviAWRci5Zp7g76Dc2cW1ppodf2PRa5dd4zcmDoAnTOM7+yB66HG?=
 =?us-ascii?Q?0EhP209lohzQuZekxcFNXlk6j+jsEI9eNNyiTLYgH8kj1akg9Lq/Wk0N2AfZ?=
 =?us-ascii?Q?c+w1FMPRGNZV2Q/xF351CZdYctIOMgY92FckEyQvh8EldRSZG1aLKSHQCOD2?=
 =?us-ascii?Q?y31lM+A2Ej4UkTKygpmkMunECHeH/42rOjRfnTecQH69XwML3u1RDqNtxZBP?=
 =?us-ascii?Q?5KGm1d5AkyOjLxRGYKN+4xecChPUaIFbjjCiZYSHfN49OZosQcoANoByr4Cv?=
 =?us-ascii?Q?Pilh/7108pSoIlij7sfozAYnklyZX5xOqGqYrZOrxN9XqFTmR/fd/nKnODG8?=
 =?us-ascii?Q?1wWFzcvuX6ltT2tDqS5nQhgDTtl2ITHiNt3afnsL6p+bbA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J3r2sn7Kfmyase00ZhAXelPWF+nK1fN+nvxCgfi9XHhHCBgLEgAjOuBIZyej?=
 =?us-ascii?Q?CoPt5VwcdPlNDpkDBPD2/ZnLQJA62VkjE/zI5YVRjp7/kKRYncYjhSH0DVNw?=
 =?us-ascii?Q?fLqw3b3vGIgydBIQAYiJLfnM75Wg3Yns8HZoYArHcwzoHnjcPKMN7TfoTZrQ?=
 =?us-ascii?Q?9OxAqkoSJQbU1kDRn4C2luRqBCb98OfUHu7eQmBCaa9SJHi+lOoRDgXqZ0i3?=
 =?us-ascii?Q?c2Wt1RI6Ifg4FxMrWWgPqJ30dv6meaKwnvi+hLFEkK6ssm7Edumh75qxIfkV?=
 =?us-ascii?Q?P9u7BifGxbWdVX0o9StkEGDXtYq75g+yHfwuk25tS2otUdYA5/MGNvgVtM/e?=
 =?us-ascii?Q?aevt4nou23A1sAhtj0I4HlMV4Q/7RMBZh1NrD6FY69L2/uEIYPxP7e05ZZ0v?=
 =?us-ascii?Q?T3WUnpGVu2LszhDmFeRm3FUksr9+GlnTbYAEjMJrf15l9LUUgJMSaFgv18pN?=
 =?us-ascii?Q?UC9a7rHZ96j/ygDW1YZgbWNZf/QloFvPkoy3KpSsrMiJ1ICzQOtf5QheFSfY?=
 =?us-ascii?Q?8Zqndcnob88G2RxHbh7wPRBJu2GTQR9T5jqzk4wcPj7WaY0iTubBwExMCUet?=
 =?us-ascii?Q?CUQItqatS0hDur+PHJyxAnzczfceJ0XZd9QFqRG/e7DSFh+RM+dsBhqLxc0Z?=
 =?us-ascii?Q?mXK3Kz57etYBp9AkRt/s6g9IJyWcf12Jg3g7XQ7m1ToUEgn7KTNL6Mto6Z9E?=
 =?us-ascii?Q?FgVLFJhdRA0PhBBTMed2pOb2mUAULGuiZZtow2WE1b2OYM88XsBZ6xdzdLk9?=
 =?us-ascii?Q?cpf8g+udc95jGZDpi4kFsnCu/pEDckM/RCJI6rXGdlV4jR2EABujfT8Pux3Z?=
 =?us-ascii?Q?oojhbB4VWL9D/mpICp86cRpuCMckvxs49AypVczqYemCqrhboPciHlBE6Lyb?=
 =?us-ascii?Q?0Fn+6Lbuzb4+AQZ3664sMXP35z8EaG/r8fu7d40xYpdePWFn5pZaI8PBLpBa?=
 =?us-ascii?Q?/itjERo3TUa/7fuF8Gw4JgCZ+XJKu7oIlYtu2UdE19IycPUic7tWDKlPjVDp?=
 =?us-ascii?Q?35H6ETwVlVHl4soj084kCJzMDzapyVQWRwP8fzeBX//t2jKTE9AwhbBBFlYj?=
 =?us-ascii?Q?rmcUXotkgy72KpGtPAilta3BKAvas1JArp83YV+2S+KXZCvjWLevM7kncXn5?=
 =?us-ascii?Q?L61se44IpCvjl+EM+X2XnEjK/3jmOZmhmneKaMkgjFCFqxdpSEUjDpqKVdVH?=
 =?us-ascii?Q?VYATmK9ETDVZ3fPDJXHNaDLo43Y6+wEt6ZUygXaCpwG6PvUKSDKJUS6kBi9a?=
 =?us-ascii?Q?DrD52GO5iJO5CWmxZ0dJl54yTPEjFgK+KCZ2l+YJvi/cBRf4BoFV4IkLFejw?=
 =?us-ascii?Q?2CjMPPTkFR/xPi7OstKagwWgfV3+0HxK2hdDvj23zs6+9VYSk2/kFqFi0WUG?=
 =?us-ascii?Q?gQNsguzAfnoSqgrogOQ5sWBsGdILPjjWLEVBlLk3BI+/QFb6TnQmZrXy0qgz?=
 =?us-ascii?Q?/SA1bm3a/CIozvIW2zlLQrcKk9MF1NvmyCDCx62OMRIwyj/UcWuSOR2j+8hq?=
 =?us-ascii?Q?2j+Kmwk7946C5cVl9tNVCGnVI8aPb8pkZ/X+YITTo39qG8Joxkxl2HY8fnGi?=
 =?us-ascii?Q?TSrPvgt7H+0DZyyLPhJSTvk1cgB6LYK3IJAknZNm+M+fjPw2DWgvRov/wFb0?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d19a3b-28e4-464b-096c-08dd35a4e8f3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 20:40:55.7905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6OpM4dSbii1FSqL+k7Z0Wgvv7pANA2Nyv3E6LWfHuKapUPTXpNj+SwuSqvflsTXQQqh3qZZ9VNfuauwzQLf2Ah84JVdGcpZcUXoRevXfiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6478
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

On Wed, Jan 15, 2025 at 12:32:33PM -0800, Matt Atwood wrote:
> On Wed, Jan 15, 2025 at 09:58:27AM +0000, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: drm/xe/xe3: Generate and store the L3 bank mask
> > URL   : https://patchwork.freedesktop.org/series/143531/
> > State : failure
> > 
> > == Summary ==
> > 
> > CI Bug Log - changes from xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6_full -> xe-pw-143531v1_full
> > ====================================================
> > 
> > Summary
> > -------
> > 
> >   **FAILURE**
> > 
> >   Serious unknown changes coming with xe-pw-143531v1_full absolutely need to be
> >   verified manually.
> >   
> >   If you think the reported changes have nothing to do with the changes
> >   introduced in xe-pw-143531v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> >   to document this new failure mode, which will reduce false positives in CI.
> > 
> >   
> > 
> > Participating hosts (4 -> 4)
> > ------------------------------
> > 
> >   No changes in participating hosts
> > 
> > Possible new issues
> > -------------------
> > 
> >   Here are the unknown changes that may have been introduced in xe-pw-143531v1_full:
> > 
> > ### IGT changes ###
> > 
> > #### Possible regressions ####
> > 
> >   * igt@core_hotunplug@hotreplug:
> >     - shard-dg2-set2:     [PASS][1] -> [ABORT][2] +2 other tests abort
> >    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@core_hotunplug@hotreplug.html
> >    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@core_hotunplug@hotreplug.html
> Code Change is set on Graphics Ver 3+, cant impact this.

Applied to drm-xe-next.  Thanks for the patch.


Matt

> > 
> >   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][3]
> >    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> See above.
> > 
> >   * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
> >     - shard-bmg:          [PASS][4] -> [FAIL][5] +1 other test fail
> >    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
> >    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
> See Above.
> > 
> >   * igt@kms_flip@2x-nonexisting-fb:
> >     - shard-bmg:          [PASS][6] -> [INCOMPLETE][7] +1 other test incomplete
> >    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html
> >    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
> See Above.
> > 
> >   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:
> >     - shard-dg2-set2:     NOTRUN -> [ABORT][8] +1 other test abort
> >    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2.html
> See Above.
> > 
> >   * igt@xe_vm@mmap-style-bind-either-side-partial-large-page-hammer:
> >     - shard-lnl:          NOTRUN -> [DMESG-WARN][9] +13 other tests dmesg-warn
> >    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@xe_vm@mmap-style-bind-either-side-partial-large-page-hammer.html
> See Above.
> > 
> >   
> > Known issues
> > ------------
> > 
> >   Here are the changes found in xe-pw-143531v1_full that come from known issues:
> > 
> > ### IGT changes ###
> > 
> > #### Issues hit ####
> > 
> >   * igt@core_hotunplug@hotunplug-rescan:
> >     - shard-lnl:          NOTRUN -> [ABORT][10] ([Intel XE#3914])
> >    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@core_hotunplug@hotunplug-rescan.html
> > 
> >   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1:
> >     - shard-adlp:         [PASS][11] -> [FAIL][12] ([Intel XE#827])
> >    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1.html
> >    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-1.html
> > 
> >   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#2550]) +23 other tests skip
> >    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html
> > 
> >   * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
> >     - shard-adlp:         [PASS][14] -> [FAIL][15] ([Intel XE#3884])
> >    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
> >    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
> > 
> >   * igt@kms_atomic_transition@plane-all-modeset-transition:
> >     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#3279])
> >    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition.html
> > 
> >   * igt@kms_big_fb@linear-64bpp-rotate-0:
> >     - shard-lnl:          NOTRUN -> [DMESG-WARN][17] ([Intel XE#1725])
> >    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotate-0.html
> > 
> >   * igt@kms_big_fb@linear-8bpp-rotate-90:
> >     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1407]) +1 other test skip
> >    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_big_fb@linear-8bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#316]) +3 other tests skip
> >    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
> >     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#1124])
> >    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
> > 
> >   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#610])
> >    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> > 
> >   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1124]) +9 other tests skip
> >    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> > 
> >   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> >     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +5 other tests skip
> >    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> >     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2191])
> >    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> >     - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2314] / [Intel XE#2894])
> >    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> >    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#367]) +1 other test skip
> >    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#2191])
> >    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> >     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1512])
> >    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
> >     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2314] / [Intel XE#2894])
> >    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> > 
> >   * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
> >     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#367])
> >    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
> > 
> >   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#787]) +153 other tests skip
> >    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
> > 
> >   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
> >     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +2 other tests skip
> >    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html
> > 
> >   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> >     - shard-lnl:          NOTRUN -> [DMESG-WARN][34] ([Intel XE#3876])
> >    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> > 
> >   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:
> >     - shard-lnl:          NOTRUN -> [DMESG-WARN][35] ([Intel XE#3890])
> >    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html
> > 
> >   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
> >     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#3432]) +1 other test skip
> >    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
> > 
> >   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
> >     - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
> >    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
> > 
> >   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
> >     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#787]) +2 other tests skip
> >    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html
> > 
> >   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#455] / [Intel XE#787]) +31 other tests skip
> >    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> >     - shard-dg2-set2:     [PASS][40] -> [INCOMPLETE][41] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010])
> >    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> >    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
> >     - shard-dg2-set2:     [PASS][42] -> [INCOMPLETE][43] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4010])
> >    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
> >    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#2907]) +2 other tests skip
> >    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
> >     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#2887]) +9 other tests skip
> >    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
> > 
> >   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1152]) +3 other tests skip
> >    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> > 
> >   * igt@kms_chamelium_color@ctm-negative:
> >     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2325])
> >    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_chamelium_color@ctm-negative.html
> > 
> >   * igt@kms_chamelium_color@ctm-red-to-blue:
> >     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#306])
> >    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_chamelium_color@ctm-red-to-blue.html
> > 
> >   * igt@kms_chamelium_frames@dp-crc-single:
> >     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2252])
> >    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-single.html
> > 
> >   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
> >     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#373]) +5 other tests skip
> >    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> > 
> >   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#373]) +7 other tests skip
> >    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> > 
> >   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
> >     - shard-bmg:          NOTRUN -> [FAIL][52] ([Intel XE#1178])
> >    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-5/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
> > 
> >   * igt@kms_content_protection@srm:
> >     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#3278])
> >    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_content_protection@srm.html
> > 
> >   * igt@kms_content_protection@uevent:
> >     - shard-dg2-set2:     NOTRUN -> [FAIL][54] ([Intel XE#1188]) +1 other test fail
> >    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_content_protection@uevent.html
> > 
> >   * igt@kms_cursor_crc@cursor-offscreen-512x512:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#308]) +1 other test skip
> >    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> > 
> >   * igt@kms_cursor_crc@cursor-onscreen-256x85:
> >     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2320])
> >    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html
> > 
> >   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> >     - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#2321])
> >    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> > 
> >   * igt@kms_cursor_crc@cursor-sliding-max-size:
> >     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1424]) +2 other tests skip
> >    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-max-size.html
> > 
> >   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> >     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#309]) +1 other test skip
> >    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> > 
> >   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> >     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#309]) +3 other tests skip
> >    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> > 
> >   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> >     - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#2291]) +3 other tests skip
> >    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> >    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> > 
> >   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> >     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2286])
> >    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> > 
> >   * igt@kms_dp_linktrain_fallback@dp-fallback:
> >     - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#3070])
> >    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
> > 
> >   * igt@kms_dsc@dsc-basic:
> >     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#2244])
> >    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_dsc@dsc-basic.html
> > 
> >   * igt@kms_dsc@dsc-with-output-formats:
> >     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2244])
> >    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html
> > 
> >   * igt@kms_feature_discovery@display-3x:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#703])
> >    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_feature_discovery@display-3x.html
> > 
> >   * igt@kms_feature_discovery@psr1:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1135])
> >    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_feature_discovery@psr1.html
> > 
> >   * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
> >     - shard-bmg:          [PASS][69] -> [FAIL][70] ([Intel XE#2882]) +1 other test fail
> >    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
> >    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
> > 
> >   * igt@kms_flip@2x-flip-vs-panning-interruptible:
> >     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1421]) +1 other test skip
> >    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html
> > 
> >   * igt@kms_flip@2x-plain-flip-interruptible:
> >     - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#2316]) +4 other tests skip
> >    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-1/igt@kms_flip@2x-plain-flip-interruptible.html
> >    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html
> > 
> >   * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
> >     - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#310])
> >    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
> > 
> >   * igt@kms_flip@blocking-wf_vblank@b-edp1:
> >     - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#886])
> >    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-1/igt@kms_flip@blocking-wf_vblank@b-edp1.html
> >    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-7/igt@kms_flip@blocking-wf_vblank@b-edp1.html
> > 
> >   * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
> >     - shard-dg2-set2:     NOTRUN -> [FAIL][77] ([Intel XE#301]) +4 other tests fail
> >    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
> > 
> >   * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
> >     - shard-dg2-set2:     [PASS][78] -> [FAIL][79] ([Intel XE#301]) +2 other tests fail
> >    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
> >    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
> >     - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2293] / [Intel XE#2380])
> >    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
> >     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2293])
> >    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
> >     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
> >    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
> > 
> >   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:
> >     - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1401]) +1 other test skip
> >    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html
> > 
> >   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
> >     - shard-adlp:         [PASS][84] -> [DMESG-FAIL][85] ([Intel XE#1033])
> >    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
> >    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
> > 
> >   * igt@kms_force_connector_basic@prune-stale-modes:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([i915#5274])
> >    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_force_connector_basic@prune-stale-modes.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#651]) +26 other tests skip
> >    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
> >     - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2311]) +5 other tests skip
> >    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
> >     - shard-bmg:          NOTRUN -> [INCOMPLETE][89] ([Intel XE#2050])
> >    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
> >     - shard-bmg:          NOTRUN -> [FAIL][90] ([Intel XE#2333]) +2 other tests fail
> >    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
> >     - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#656]) +23 other tests skip
> >    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
> >     - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#656]) +3 other tests skip
> >    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
> >     - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1469])
> >    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
> >     - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#651]) +1 other test skip
> >    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
> >     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#651]) +5 other tests skip
> >    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
> >     - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#653])
> >    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#653]) +28 other tests skip
> >    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
> >     - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2313]) +2 other tests skip
> >    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
> > 
> >   * igt@kms_getfb@getfb-reject-ccs:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#605])
> >    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html
> > 
> >   * igt@kms_hdr@static-swap:
> >     - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1503])
> >    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_hdr@static-swap.html
> > 
> >   * igt@kms_joiner@basic-big-joiner:
> >     - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#346])
> >    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_joiner@basic-big-joiner.html
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#346])
> >    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_joiner@basic-big-joiner.html
> > 
> >   * igt@kms_joiner@basic-force-ultra-joiner:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#2925])
> >    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html
> >     - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#2934])
> >    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_joiner@basic-force-ultra-joiner.html
> > 
> >   * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
> >     - shard-dg2-set2:     NOTRUN -> [FAIL][105] ([Intel XE#616]) +1 other test fail
> >    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
> > 
> >   * igt@kms_plane_multiple@tiling-y:
> >     - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#2493])
> >    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_plane_multiple@tiling-y.html
> > 
> >   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
> >     - shard-dg2-set2:     [PASS][107] -> [FAIL][108] ([Intel XE#361])
> >    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> >    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> > 
> >   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
> >    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> > 
> >   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#2763]) +5 other tests skip
> >    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html
> > 
> >   * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:
> >     - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#2763]) +7 other tests skip
> >    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html
> > 
> >   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
> >     - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2763]) +4 other tests skip
> >    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
> > 
> >   * igt@kms_pm_dc@dc6-dpms:
> >     - shard-lnl:          NOTRUN -> [FAIL][113] ([Intel XE#1430])
> >    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
> > 
> >   * igt@kms_pm_rpm@dpms-lpsp:
> >     - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
> >    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html
> > 
> >   * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
> >     - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#2893]) +1 other test skip
> >    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
> > 
> >   * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1489]) +8 other tests skip
> >    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
> > 
> >   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
> >     - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#1489])
> >    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
> > 
> >   * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
> >     - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1489]) +1 other test skip
> >    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
> > 
> >   * igt@kms_psr2_su@page_flip-nv12:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1122]) +2 other tests skip
> >    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.html
> >     - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1128])
> >    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_psr2_su@page_flip-nv12.html
> > 
> >   * igt@kms_psr@pr-cursor-plane-onoff:
> >     - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1406])
> >    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_psr@pr-cursor-plane-onoff.html
> > 
> >   * igt@kms_psr@psr2-dpms:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#2850] / [Intel XE#929]) +12 other tests skip
> >    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_psr@psr2-dpms.html
> > 
> >   * igt@kms_psr@psr2-sprite-blt:
> >     - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
> >    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_psr@psr2-sprite-blt.html
> > 
> >   * igt@kms_rotation_crc@primary-rotation-90:
> >     - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#3414] / [Intel XE#3904])
> >    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_rotation_crc@primary-rotation-90.html
> > 
> >   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1127])
> >    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> >     - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1127])
> >    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> > 
> >   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> >     - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2330])
> >    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> > 
> >   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#3414])
> >    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> > 
> >   * igt@kms_rotation_crc@sprite-rotation-270:
> >     - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#3414] / [Intel XE#3904])
> >    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-270.html
> > 
> >   * igt@kms_setmode@invalid-clone-single-crtc:
> >     - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#1435]) +1 other test skip
> >    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_setmode@invalid-clone-single-crtc.html
> > 
> >   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#1500])
> >    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> > 
> >   * igt@kms_tv_load_detect@load-detect:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#330])
> >    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html
> > 
> >   * igt@kms_vblank@ts-continuation-modeset-hang@pipe-d-hdmi-a-3:
> >     - shard-bmg:          [PASS][133] -> [DMESG-WARN][134] ([Intel XE#877]) +1 other test dmesg-warn
> >    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-3/igt@kms_vblank@ts-continuation-modeset-hang@pipe-d-hdmi-a-3.html
> >    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-3/igt@kms_vblank@ts-continuation-modeset-hang@pipe-d-hdmi-a-3.html
> > 
> >   * igt@kms_vrr@flip-basic-fastset:
> >     - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#1499])
> >    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_vrr@flip-basic-fastset.html
> > 
> >   * igt@kms_vrr@flipline:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#455]) +7 other tests skip
> >    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_vrr@flipline.html
> > 
> >   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#756])
> >    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> > 
> >   * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
> >    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
> > 
> >   * igt@xe_copy_basic@mem-set-linear-0x369:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#1126])
> >    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x369.html
> > 
> >   * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#2905]) +11 other tests skip
> >    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
> > 
> >   * igt@xe_eudebug_online@interrupt-reconnect:
> >     - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2905]) +1 other test skip
> >    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@xe_eudebug_online@interrupt-reconnect.html
> > 
> >   * igt@xe_evict@evict-beng-large-multi-vm-cm:
> >     - shard-dg2-set2:     [PASS][142] -> [FAIL][143] ([Intel XE#1600])
> >    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> >    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> > 
> >   * igt@xe_evict@evict-large-external:
> >     - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#688]) +3 other tests skip
> >    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@xe_evict@evict-large-external.html
> > 
> >   * igt@xe_evict@evict-mixed-many-threads-small:
> >     - shard-dg2-set2:     [PASS][145] -> [TIMEOUT][146] ([Intel XE#1473])
> >    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
> >    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html
> > 
> >   * igt@xe_exec_basic@multigpu-no-exec-rebind:
> >     - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2322]) +1 other test skip
> >    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-rebind.html
> > 
> >   * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
> >     - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1392]) +4 other tests skip
> >    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
> > 
> >   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
> >     - shard-dg2-set2:     [PASS][149] -> [SKIP][150] ([Intel XE#1392]) +2 other tests skip
> >    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
> >    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
> > 
> >   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-prefetch:
> >     - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#288]) +1 other test skip
> >    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-prefetch.html
> > 
> >   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#288]) +20 other tests skip
> >    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
> > 
> >   * igt@xe_exec_sip_eudebug@breakpoint-writesip:
> >     - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#2905]) +6 other tests skip
> >    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
> > 
> >   * igt@xe_live_ktest@xe_mocs:
> >     - shard-bmg:          [PASS][154] -> [SKIP][155] ([Intel XE#1192])
> >    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@xe_live_ktest@xe_mocs.html
> >    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html
> >     - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#1192])
> >    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@xe_live_ktest@xe_mocs.html
> > 
> >   * igt@xe_mmap@pci-membarrier-bad-object:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#4045])
> >    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_mmap@pci-membarrier-bad-object.html
> >     - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#4045])
> >    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@xe_mmap@pci-membarrier-bad-object.html
> > 
> >   * igt@xe_module_load@load:
> >     - shard-dg2-set2:     ([PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183]) -> ([PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [SKIP][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209]) ([Intel XE#378])
> >    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_module_load@load.html
> >    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@xe_module_load@load.html
> >    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@xe_module_load@load.html
> >    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-435/igt@xe_module_load@load.html
> >    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_module_load@load.html
> >    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-434/igt@xe_module_load@load.html
> >    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-436/igt@xe_module_load@load.html
> >    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_module_load@load.html
> >    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_module_load@load.html
> >    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_module_load@load.html
> >    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-436/igt@xe_module_load@load.html
> >    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-435/igt@xe_module_load@load.html
> >    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@xe_module_load@load.html
> >    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@xe_module_load@load.html
> >    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-434/igt@xe_module_load@load.html
> >    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-434/igt@xe_module_load@load.html
> >    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@xe_module_load@load.html
> >    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-436/igt@xe_module_load@load.html
> >    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-436/igt@xe_module_load@load.html
> >    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-435/igt@xe_module_load@load.html
> >    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-435/igt@xe_module_load@load.html
> >    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@xe_module_load@load.html
> >    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@xe_module_load@load.html
> >    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@xe_module_load@load.html
> >    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_module_load@load.html
> >    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_module_load@load.html
> >    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_module_load@load.html
> >    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_module_load@load.html
> >    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_module_load@load.html
> >    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_module_load@load.html
> >    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@xe_module_load@load.html
> >    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@xe_module_load@load.html
> >    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@xe_module_load@load.html
> >    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_module_load@load.html
> >    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@xe_module_load@load.html
> >    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@xe_module_load@load.html
> >    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@xe_module_load@load.html
> >    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_module_load@load.html
> >    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@xe_module_load@load.html
> >    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@xe_module_load@load.html
> >    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_module_load@load.html
> >    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_module_load@load.html
> >    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_module_load@load.html
> >    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_module_load@load.html
> >    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@xe_module_load@load.html
> >    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_module_load@load.html
> >    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_module_load@load.html
> >    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@xe_module_load@load.html
> >    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_module_load@load.html
> >    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_module_load@load.html
> >    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@xe_module_load@load.html
> > 
> >   * igt@xe_oa@non-privileged-map-oa-buffer:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][210] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
> >    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_oa@non-privileged-map-oa-buffer.html
> > 
> >   * igt@xe_pm@d3cold-mmap-vram:
> >     - shard-lnl:          NOTRUN -> [SKIP][211] ([Intel XE#2284] / [Intel XE#366])
> >    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@xe_pm@d3cold-mmap-vram.html
> > 
> >   * igt@xe_pm@d3hot-mmap-vram:
> >     - shard-lnl:          NOTRUN -> [SKIP][212] ([Intel XE#1948])
> >    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@xe_pm@d3hot-mmap-vram.html
> > 
> >   * igt@xe_pm@s2idle-mocs:
> >     - shard-dg2-set2:     [PASS][213] -> [ABORT][214] ([Intel XE#1358] / [Intel XE#1794])
> >    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-435/igt@xe_pm@s2idle-mocs.html
> >    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_pm@s2idle-mocs.html
> > 
> >   * igt@xe_pm@s3-basic-exec:
> >     - shard-dg2-set2:     [PASS][215] -> [ABORT][216] ([Intel XE#1358]) +1 other test abort
> >    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@xe_pm@s3-basic-exec.html
> >    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-432/igt@xe_pm@s3-basic-exec.html
> > 
> >   * igt@xe_pm@s3-d3cold-basic-exec:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][217] ([Intel XE#2284] / [Intel XE#366])
> >    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html
> > 
> >   * igt@xe_pm@s4-mocs:
> >     - shard-lnl:          [PASS][218] -> [ABORT][219] ([Intel XE#1358] / [Intel XE#1794])
> >    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-6/igt@xe_pm@s4-mocs.html
> >    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-2/igt@xe_pm@s4-mocs.html
> > 
> >   * igt@xe_pm@s4-vm-bind-unbind-all:
> >     - shard-adlp:         [PASS][220] -> [ABORT][221] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
> >    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html
> >    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
> > 
> >   * igt@xe_pm_residency@toggle-gt-c6:
> >     - shard-lnl:          [PASS][222] -> [FAIL][223] ([Intel XE#958])
> >    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
> >    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html
> > 
> >   * igt@xe_query@multigpu-query-gt-list:
> >     - shard-adlp:         NOTRUN -> [SKIP][224] ([Intel XE#944])
> >    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@xe_query@multigpu-query-gt-list.html
> > 
> >   * igt@xe_query@multigpu-query-invalid-extension:
> >     - shard-bmg:          NOTRUN -> [SKIP][225] ([Intel XE#944])
> >    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html
> > 
> >   * igt@xe_query@multigpu-query-oa-units:
> >     - shard-dg2-set2:     NOTRUN -> [SKIP][226] ([Intel XE#944]) +2 other tests skip
> >    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@xe_query@multigpu-query-oa-units.html
> >     - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#944]) +1 other test skip
> >    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@xe_query@multigpu-query-oa-units.html
> > 
> >   * igt@xe_wedged@basic-wedged:
> >     - shard-adlp:         [PASS][228] -> [DMESG-WARN][229] ([Intel XE#2953]) +8 other tests dmesg-warn
> >    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-6/igt@xe_wedged@basic-wedged.html
> >    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-4/igt@xe_wedged@basic-wedged.html
> > 
> >   
> > #### Possible fixes ####
> > 
> >   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1:
> >     - shard-adlp:         [DMESG-WARN][230] ([Intel XE#1033]) -> [PASS][231]
> >    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html
> >    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-hdmi-a-1.html
> > 
> >   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
> >     - shard-lnl:          [FAIL][232] ([Intel XE#3908]) -> [PASS][233] +1 other test pass
> >    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
> >    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
> > 
> >   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
> >     - shard-adlp:         [FAIL][234] ([Intel XE#3908]) -> [PASS][235] +1 other test pass
> >    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> >    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> > 
> >   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> >     - shard-bmg:          [SKIP][236] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][237]
> >    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> >    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> >     - shard-dg2-set2:     [INCOMPLETE][238] ([Intel XE#1727] / [Intel XE#3124]) -> [PASS][239]
> >    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> >    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
> >     - shard-dg2-set2:     [DMESG-WARN][240] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][241]
> >    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
> >    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
> > 
> >   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
> >     - shard-dg2-set2:     [INCOMPLETE][242] ([Intel XE#3124]) -> [PASS][243]
> >    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
> >    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
> > 
> >   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
> >     - shard-bmg:          [SKIP][244] ([Intel XE#2291]) -> [PASS][245] +3 other tests pass
> >    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> >    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> > 
> >   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> >     - shard-bmg:          [DMESG-WARN][246] ([Intel XE#877]) -> [PASS][247]
> >    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> >    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> > 
> >   * igt@kms_display_modes@extended-mode-basic:
> >     - shard-bmg:          [SKIP][248] ([Intel XE#2425]) -> [PASS][249]
> >    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
> >    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html
> > 
> >   * igt@kms_dp_aux_dev:
> >     - shard-bmg:          [SKIP][250] ([Intel XE#3009]) -> [PASS][251]
> >    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_dp_aux_dev.html
> >    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-8/igt@kms_dp_aux_dev.html
> > 
> >   * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
> >     - shard-bmg:          [FAIL][252] ([Intel XE#2882]) -> [PASS][253] +3 other tests pass
> >    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
> >    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
> > 
> >   * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
> >     - shard-bmg:          [FAIL][254] -> [PASS][255]
> >    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
> >    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
> > 
> >   * igt@kms_flip@2x-plain-flip-fb-recreate:
> >     - shard-bmg:          [SKIP][256] ([Intel XE#2316]) -> [PASS][257] +5 other tests pass
> >    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
> >    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html
> > 
> >   * igt@kms_flip@blocking-wf_vblank@b-hdmi-a1:
> >     - shard-adlp:         [FAIL][258] ([Intel XE#2882]) -> [PASS][259] +2 other tests pass
> >    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-3/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html
> >    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-8/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html
> > 
> >   * igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:
> >     - shard-adlp:         [FAIL][260] ([Intel XE#886]) -> [PASS][261]
> >    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-3/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html
> >    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-8/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html
> > 
> >   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
> >     - shard-bmg:          [FAIL][262] ([Intel XE#2882] / [Intel XE#3820]) -> [PASS][263]
> >    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> >    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> > 
> >   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3:
> >     - shard-bmg:          [FAIL][264] ([Intel XE#3820]) -> [PASS][265]
> >    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
> >    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a3.html
> > 
> >   * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
> >     - shard-dg2-set2:     [FAIL][266] ([Intel XE#301]) -> [PASS][267] +2 other tests pass
> >    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
> >    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
> > 
> >   * igt@kms_flip@flip-vs-suspend-interruptible:
> >     - shard-lnl:          [INCOMPLETE][268] ([Intel XE#2049]) -> [PASS][269] +1 other test pass
> >    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-7/igt@kms_flip@flip-vs-suspend-interruptible.html
> >    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible.html
> > 
> >   * igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:
> >     - shard-lnl:          [FAIL][270] ([Intel XE#886]) -> [PASS][271]
> >    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html
> >    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html
> > 
> >   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
> >     - shard-adlp:         [FAIL][272] ([Intel XE#1874]) -> [PASS][273]
> >    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
> >    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
> > 
> >   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
> >     - shard-adlp:         [DMESG-FAIL][274] ([Intel XE#1033]) -> [PASS][275] +1 other test pass
> >    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
> >    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
> > 
> >   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
> >     - shard-dg2-set2:     [FAIL][276] ([Intel XE#361]) -> [PASS][277]
> >    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> >    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> > 
> >   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
> >     - shard-lnl:          [FAIL][278] ([Intel XE#899]) -> [PASS][279]
> >    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
> >    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
> > 
> >   * igt@kms_vblank@ts-continuation-dpms-suspend:
> >     - shard-dg2-set2:     [ABORT][280] ([Intel XE#2625] / [Intel XE#4057]) -> [PASS][281]
> >    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html
> >    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html
> > 
> >   * igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-6:
> >     - shard-dg2-set2:     [INCOMPLETE][282] -> [PASS][283] +1 other test pass
> >    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-436/igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-6.html
> >    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-464/igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-6.html
> > 
> >   * igt@xe_evict@evict-beng-cm-threads-large:
> >     - shard-dg2-set2:     [TIMEOUT][284] ([Intel XE#1473]) -> [PASS][285]
> >    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-large.html
> >    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
> > 
> >   * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
> >     - shard-dg2-set2:     [SKIP][286] ([Intel XE#1392]) -> [PASS][287] +4 other tests pass
> >    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
> >    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
> > 
> >   * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
> >     - shard-adlp:         [DMESG-WARN][288] ([Intel XE#2953]) -> [PASS][289] +2 other tests pass
> >    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
> >    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
> > 
> >   * igt@xe_live_ktest@xe_migrate:
> >     - shard-bmg:          [SKIP][290] ([Intel XE#1192]) -> [PASS][291]
> >    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html
> >    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-7/igt@xe_live_ktest@xe_migrate.html
> > 
> >   * igt@xe_pm@s4-multiple-execs:
> >     - shard-adlp:         [ABORT][292] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][293]
> >    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
> >    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html
> > 
> >   * igt@xe_pm@s4-vm-bind-userptr:
> >     - shard-dg2-set2:     [ABORT][294] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][295] +2 other tests pass
> >    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-432/igt@xe_pm@s4-vm-bind-userptr.html
> >    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@xe_pm@s4-vm-bind-userptr.html
> > 
> >   
> > #### Warnings ####
> > 
> >   * igt@kms_async_flips@alternate-sync-async-flip-atomic:
> >     - shard-adlp:         [DMESG-WARN][296] ([Intel XE#1033]) -> [DMESG-FAIL][297] ([Intel XE#1033])
> >    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
> >    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
> > 
> >   * igt@kms_content_protection@atomic-dpms:
> >     - shard-bmg:          [SKIP][298] ([Intel XE#2341]) -> [FAIL][299] ([Intel XE#1178])
> >    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html
> >    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
> >     - shard-bmg:          [SKIP][300] ([Intel XE#2312]) -> [SKIP][301] ([Intel XE#2311]) +14 other tests skip
> >    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
> >    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
> > 
> >   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
> >     - shard-bmg:          [SKIP][302] ([Intel XE#2311]) -> [SKIP][303] ([Intel XE#2312]) +10 other tests skip
> >    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
> >    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
> >     - shard-bmg:          [FAIL][304] ([Intel XE#2333]) -> [SKIP][305] ([Intel XE#2312]) +4 other tests skip
> >    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
> >    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
> >     - shard-bmg:          [SKIP][306] ([Intel XE#2312]) -> [FAIL][307] ([Intel XE#2333]) +5 other tests fail
> >    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
> >    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
> > 
> >   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
> >     - shard-bmg:          [SKIP][308] ([Intel XE#2312]) -> [SKIP][309] ([Intel XE#2313]) +13 other tests skip
> >    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> >    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> > 
> >   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> >     - shard-bmg:          [SKIP][310] ([Intel XE#2313]) -> [SKIP][311] ([Intel XE#2312]) +9 other tests skip
> >    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> >    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> > 
> >   * igt@kms_hdr@brightness-with-hdr:
> >     - shard-bmg:          [SKIP][312] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][313] ([Intel XE#3544])
> >    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
> >    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
> > 
> >   * igt@xe_evict@evict-beng-mixed-threads-large:
> >     - shard-bmg:          [TIMEOUT][314] ([Intel XE#1473]) -> [INCOMPLETE][315] ([Intel XE#1473])
> >    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-4/igt@xe_evict@evict-beng-mixed-threads-large.html
> >    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html
> > 
> >   * igt@xe_evict@evict-beng-threads-large:
> >     - shard-bmg:          [FAIL][316] ([Intel XE#1000]) -> [TIMEOUT][317] ([Intel XE#1473])
> >    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-2/igt@xe_evict@evict-beng-threads-large.html
> >    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html
> > 
> >   * igt@xe_evict@evict-mixed-many-threads-large:
> >     - shard-dg2-set2:     [TIMEOUT][318] ([Intel XE#1473]) -> [FAIL][319] ([Intel XE#1000])
> >    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html
> >    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html
> > 
> >   * igt@xe_evict@evict-mixed-many-threads-small:
> >     - shard-bmg:          [FAIL][320] ([Intel XE#1000]) -> [TIMEOUT][321] ([Intel XE#1473] / [Intel XE#2472])
> >    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
> >    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
> > 
> >   * igt@xe_evict@evict-mixed-threads-large:
> >     - shard-bmg:          [DMESG-FAIL][322] ([Intel XE#4060]) -> [TIMEOUT][323] ([Intel XE#1473] / [Intel XE#2472])
> >    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html
> >    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html
> > 
> >   * igt@xe_evict@evict-threads-large:
> >     - shard-bmg:          [INCOMPLETE][324] ([Intel XE#1473]) -> [TIMEOUT][325] ([Intel XE#1473] / [Intel XE#2472])
> >    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-2/igt@xe_evict@evict-threads-large.html
> >    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/shard-bmg-5/igt@xe_evict@evict-threads-large.html
> > 
> >   
> >   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
> >   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
> >   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
> >   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> >   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
> >   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
> >   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
> >   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
> >   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
> >   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> >   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
> >   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
> >   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
> >   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
> >   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> >   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
> >   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> >   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
> >   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
> >   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
> >   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
> >   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> >   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
> >   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
> >   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
> >   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> >   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
> >   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
> >   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> >   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
> >   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
> >   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
> >   [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
> >   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> >   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
> >   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
> >   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
> >   [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
> >   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
> >   [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
> >   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
> >   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> >   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
> >   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> >   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> >   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
> >   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
> >   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
> >   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> >   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> >   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> >   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
> >   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
> >   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
> >   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
> >   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> >   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
> >   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
> >   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
> >   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
> >   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
> >   [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
> >   [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
> >   [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
> >   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
> >   [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
> >   [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
> >   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
> >   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> >   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> >   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
> >   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> >   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
> >   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
> >   [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
> >   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
> >   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
> >   [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
> >   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> >   [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
> >   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> >   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
> >   [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
> >   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
> >   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
> >   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
> >   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
> >   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
> >   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
> >   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> >   [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
> >   [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
> >   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
> >   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
> >   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> >   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
> >   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
> >   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
> >   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
> >   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
> >   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
> >   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> >   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> >   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
> >   [Intel XE#3820]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3820
> >   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
> >   [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
> >   [Intel XE#3890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3890
> >   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
> >   [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
> >   [Intel XE#3914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914
> >   [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
> >   [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
> >   [Intel XE#4057]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4057
> >   [Intel XE#4060]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4060
> >   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> >   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
> >   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
> >   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
> >   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> >   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> >   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> >   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> >   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
> >   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
> >   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> >   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
> >   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
> >   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
> >   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> >   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
> >   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> >   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> >   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
> >   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
> > 
> > 
> > Build changes
> > -------------
> > 
> >   * Linux: xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6 -> xe-pw-143531v1
> > 
> >   IGT_8190: db6e252e00bc44f90b678d547e93b3f02c02c6de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> >   xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6: 61e0f64bde73d48e3dc204c129c25e0a15f0d4e6
> >   xe-pw-143531v1: 143531v1
> > 
> > == Logs ==
> > 
> > For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143531v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
