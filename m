Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95376C5DF81
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 16:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3503E10EE63;
	Wed, 19 Aug 2026 16:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ogifposk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DF310EE43
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 16:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787155858; x=1818691858;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gQRhYAim1G76dfjrmL8HYjlmODYSA/QsYD6ZO+SooBg=;
 b=Ogifposk6eYn2zlDv+OCB/bblHnoy4n5L9f15UM/DDUaVtZRZ32MF7kw
 AJ7EKXbK6xd90dLU/CLJnr9ofWpqLqG5bggu6UksOJKmxAWaqiJxLJuvd
 /X/zztR3lDouYTy1fqmcO8mP4mLGxkOXx+gpx6ZuxjTXm9/jaASJP7wUS
 uAKmCXiHzBVmlG2W+zmFRo02kZPCjxovRIxRp7WwbWKWTrDDQKTOTD4rM
 eY1xfPgAutVhGd6h9KkhebxZt7xqXS9GgCYYY1D0kO5cFfQ1miryXh+g1
 NueF/OXBZduEIAuLS1zdnNE3v3zTAPE0MmVzB46yp4WjCi1F/tTJPPdF3 Q==;
X-CSE-ConnectionGUID: bKejb0OuRD2AdLnii808GQ==
X-CSE-MsgGUID: Ysfc/VLlTb6kstpZTll1ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87695970"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87695970"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 09:10:58 -0700
X-CSE-ConnectionGUID: HMKjweKOQGGYE4gQLmxwgQ==
X-CSE-MsgGUID: VUVboquMRPqaG1FLMJuTsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="269451440"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 09:10:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 09:10:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 09:10:57 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 09:10:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMyFgnsuurpB1KFEMnyPHj930JlmdXIe71763t9okmzmPuLyAlhqKbAEaoqcNkcNY8K8FHOwnp2GT1/6ww+Cm4J37WtL0wITWune7v8QjLvGeAJNOC5cjKaZ5hgbWyAJezqd91zsbDFarxbZH6gik6c6z7PmGeqp791Xv98f9D8G+NbvDnVu6sN3ln7Qa6C0RdLD6/HNNRi5UBeODdpzoKJsHHQr6kf+j6uG9grLQ47vLsZehHjQNDixeQQ5HnR9KyFZrD8n1BGJoJ9Phh90M04e4O/Y6F3v6KfCOTuKMyj7ZctfDqBw+jRQKkrTCXQXabsi3/nVhKom17bJ4XGqmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idr38mlf5pbEqJgsSwYNIlVf5pXQvk5xV4MdLiD69Oo=;
 b=gZxVDgiiWrkp4wSmxOSCMONXlSry3YZgEaMALGJwSM9hvCYBmaiOP8odqhbFVqBHB+412ajASiW8ivZN+rs4j4NmH1aGisrEKCYyhvq6okNIXV8fkAgRXYjCnkHG2+hoBnyWOVI90PSKtrjZGawaTWXy/Hzl87gN3AkG00ilwfkn7oWZygekKv61iOCp2yPb3VOG5/dEnPULzrz8MFA1lkraUgkMVciQwfnurSY8BAjy8ddDH0c45TVs92Xq+2kv8kNRp54GI9vT+tgbZ87igw7VphfG/1MDss1oxBzfeE9AUzT427UcGbUvyLWUX+zBedmAa3yEmVt31MNhqPKL9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB5806.namprd11.prod.outlook.com (2603:10b6:510:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 16:10:47 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 16:10:47 +0000
Date: Wed, 19 Aug 2026 09:10:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Raag Jadav <raag.jadav@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw6IHN1Y2Nl?= =?utf-8?Q?ss?= for
 drm/xe/pci_error: Allow debugging PCI errors (rev4)
Message-ID: <20260819161044.GC681121@mdroper-desk1.amr.corp.intel.com>
References: <20260819113519.510853-1-raag.jadav@intel.com>
 <178715168037.67908.10585420798388477832@61270ab9df2a>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178715168037.67908.10585420798388477832@61270ab9df2a>
X-ClientProxiedBy: SJ0PR03CA0383.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ab46383-6fca-4ed5-a697-08defe0c6dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|4143699003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: IygJlS1JD6nQuCdm7KzcvLTdvtLcmudmXh6rU6e6H4Uo2mhFSMoA1ClaXUrVKv2g8QO9tRn+WYeHFmL0OgWbvUllqcNFNNySeFqRon3uSvxV2P9b4b8NTQoHl6YDO2bF+v6+2YL/ylRT+KWalB1I7UfSjaeDgyLHbudnQRsUBAaxi7g0yfPi/bCEr1YLXNSrSoGCjuOa6RlJAfEBTpaUwRs7Mdk5ExA+4Jfah97BcKkWxr9YakftUDx7THjQvvYOhMjbbmylYqitl0avKOA93KbJGKammZSbqJWrSIPdVWkl60Wu5OYPOnRprT2XCFNac51ZFGt6NHMSJoouM4Q4yjGm2TrV3OVQnPVaxw9CqSFJDMALV0myZtMGNFTRkF5xhja18A+3DNgEbaJEFEPGiGH84o7OIf5PF2NkJXkURGRIw8Sx5wwIZOd47jpaz1WLChWf/7ZEj9I5Kygk/ywYhYXd9U8W+p1uP8KFFUXDCbfeQbqZfTh9FNQ1ahoVqcxBbWIquQJppHtkwoJR3srYQQQWW/OPpHIPdhkp5SOjebvAvpNA4c42TD39cckh7nFFAan8St4lmZU/G5BzBZottqSd1lv0pW7163Uhq4Fwb3E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(4143699003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DPGQAzr2vmjZwdnXbHHbxwas10ajQiDPe4U3DX+aOChlQ3jR5aURo9RnoeOr?=
 =?us-ascii?Q?J0b6TnX7mooG8dKfqpUMH98fL11UgjS54TXi358zZhJXWDiYt0wjTaV6os3w?=
 =?us-ascii?Q?tL9ucVfH/yrX6gWaMn6wCkgzYp8aoOzBalTShw03IBAndnDAt5IavtHEQk9A?=
 =?us-ascii?Q?DTDbdNmChU0YfAMY65ExWMc2csYWaO1A3zBBpgiIkno/ZxuraNjlCr5av2eX?=
 =?us-ascii?Q?U7Bxsx8hUGRSyAxuPo9a8IgFkO0Mn0hnDaz2PajS201g3WzcbcV0E/9d5XGi?=
 =?us-ascii?Q?Tuv01vvE407psGcU0FpvYrHPkLQlslslVIYCIDLPyM9Kxz0QIlZovgZLf+bz?=
 =?us-ascii?Q?K0P6B+YwrbHyCZjxEjoiMvHXc8Ae15gWTlpJgRMz+tdBvTvquAt99vIZoLM2?=
 =?us-ascii?Q?FEkgQst1rUalvGKYTmC9b2VB0MgZrtrmIOvVsNjbQRpPaJwUSsc7y+amPjuK?=
 =?us-ascii?Q?eEa1GxdSYrbJhjHG6Hn6F+4O1p0NoLMEsIG94Sl0tiKfumCTXSY85va6s4gI?=
 =?us-ascii?Q?+JOvYPmSxGzb/Ym+2yIsmWblaEflAa98hmtCg7wjilcUZic3H3hNjrY+uC/+?=
 =?us-ascii?Q?6VZLhYOO+9ieUm/uABmZaugTVtomEG/fIGj0rYaeaLvBX6B3Qc0krm53s1G0?=
 =?us-ascii?Q?5Hk+G8EvedTRUDJRrByhJ1Xfu4zMXSoJaZWdo01smWWk8vzELkmB9sn1DIr3?=
 =?us-ascii?Q?PRleHmp249iBfL20TGZNsziX6wPg3EAimNjCk/YvAEKZVqdWtgzDy8LRdbkT?=
 =?us-ascii?Q?N6Pr3iUl+tmgkla3WjsgZ9i0ui3I+48UULwXASwBjY+97dtjfS/cQ5Xk64kA?=
 =?us-ascii?Q?vwbB0h4oVpREt9optQRGfsq7rSA/scfqWdf6kZekv/csM/IzqoyZx6sUzJWY?=
 =?us-ascii?Q?NYZqCLBDJ1fLxHAb8JHI3M3SH5zXDt1frvq4J9NpDSEDCLwE2K9ulOmIMI5b?=
 =?us-ascii?Q?zIcTBe0MSXd5tYb4R6R5oInpt8jSLM1/52VjH3jh9iy2lYyg5W79Y9tw2Igg?=
 =?us-ascii?Q?gheXa9R/atiz4Zwt9uuPJu8RIFhn9N03PGRneTz4Td6E0DuWRRX4Y1AT74JE?=
 =?us-ascii?Q?yB922DIfrp5AukN9iU/6ALwiD3sWb+mbToU+hU7cbpMafin6BslQU4FyHePo?=
 =?us-ascii?Q?F2KT64HPUrnfOqVMk9mW87BQfTUGDvG4fD0Stm7CafiC0/wwq3H/w5DzypmB?=
 =?us-ascii?Q?w6GJNaTRqQAciTIFTUAYzEGaWC0xy+CC+oy9dlZKOhkiYYcq0zQFwfVdjfqA?=
 =?us-ascii?Q?3Ga53CrINVbkO9V1ggujRxFftU+b3CeD3PTA59wndAFzQr5ygksG84DBdVub?=
 =?us-ascii?Q?4EjJ14sERkZSPoUbprDN9Wj+LVZnh5MgoXMpykMLqhjqYmUf8Gs/OnWwe4Dh?=
 =?us-ascii?Q?Y0rS4AIljQAdCvOG4J4f/3hcURcW81vpYEtP1C8Axh3fkezhJc7HQ6HWm1eG?=
 =?us-ascii?Q?Q3Le4tXFgotuJ4Ex8apJayzY/k+5wCRjKXJj+0yz3QqUfo9w5EGAWjgUq/6x?=
 =?us-ascii?Q?8WziR/MgQAIDpFLBz4XAEGVVNtQVVhOftMcFsWjA40P7VUsY/6m5ox7f9ApJ?=
 =?us-ascii?Q?UvuYv7klAaQ1t5tKOOw3x9IKduhe8likSxY0aoDlR4ya0TG/GVAyIpr5ROsf?=
 =?us-ascii?Q?Q0pFw0YmFAatXt49b7l/9MK2O2vmOXqhGiZdgrTi5x3l1J7Maf0avhHpXpbm?=
 =?us-ascii?Q?/r79hc1dvBlY3JW+d+6+9V5WszW4lKdaEWpT3FreKu2e4xqpGOLJCRKSXjc3?=
 =?us-ascii?Q?AjyDrJdEzUgelylQVfPbknaEX9rCHRA=3D?=
X-Exchange-RoutingPolicyChecked: q55FIJZg0Le0NR1wbcXUfNnNXKdOU5VdUchwUPZsb/gYLWwagJK/SJUpwL6+zkq6AIm5G1suYi/oQY3NReSPGJ1sEyK3ECNolxd9syNishyfvsAnVOsf9KCQ0+ZgBkGIvLrWxlDF1/wqgZTmE+FzdcHWTV/O7uhAq4cbQl3UD9RNgZhmNdj9LZl/40kyvmLPubf2Jqx732eBBrYOjkSClH/IYRvHaLQE5WKvZgF+sdncdKcan1C+uXG1cmGuix3R56wXmgpK8HALMUI7HkBwwWhYNTZFOUCTS/oCYY91QJnFXGivV8I3LiWleox5W5FgaMsipl8s0cwRd4QJt8RH4w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ab46383-6fca-4ed5-a697-08defe0c6dc9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 16:10:47.1143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRzOxE9IiAIl4+SDkxyg4zDMiqjFF5FF0EjCgr8YwnvSZfFPYyd/Qv+YQ6fMaqoj0e+iPkUWRewKqBsKnmLawhA/3YzxIP0faxJV08UQfE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5806
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

On Wed, Aug 19, 2026 at 03:01:20PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pci_error: Allow debugging PCI errors (rev4)
> URL   : https://patchwork.freedesktop.org/series/172226/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c_FULL -> xe-pw-172226v4_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patch and review!


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
>   Here are the changes found in xe-pw-172226v4_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2233])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2327]) +5 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +16 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#7679]) +1 other test skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#367]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2652]) +8 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +22 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-9/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#7358])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
> 
>   * igt@kms_chamelium_frames@hdmi-aspect-ratio:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2252]) +13 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#7642]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-3/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2390] / [Intel XE#6974]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@dp-mst-type-0-hdcp14:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#6974])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-8/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
> 
>   * igt@kms_content_protection@uevent-hdcp14:
>     - shard-bmg:          NOTRUN -> [FAIL][14] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2320]) +4 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#7809])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#8265]) +6 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#8680])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-10/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2372] / [Intel XE#7359])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-1/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [PASS][21] -> [FAIL][22] ([Intel XE#301] / [Intel XE#3149])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7178] / [Intel XE#7349])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7178] / [Intel XE#7351]) +4 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7179]) +2 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-2/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7061] / [Intel XE#7356]) +7 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#4141]) +15 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2311]) +79 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7061]) +10 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2313]) +75 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7399]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#7308])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c/shard-bmg-8/igt@kms_hdmi_inject@inject-audio.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-7/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#6911] / [Intel XE#7378])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#6912] / [Intel XE#7375])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-modifier:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#7283]) +6 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-4/igt@kms_plane@pixel-format-y-tiled-modifier.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2393])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#5020] / [Intel XE#7348])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-8/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_dc@dc5-pageflip-negative:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#6927])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-3/igt@kms_pm_dc@dc5-pageflip-negative.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2505] / [Intel XE#7447])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-9/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#1489]) +9 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr@psr2-no-drrs:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2234] / [Intel XE#2850]) +18 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-4/igt@kms_psr@psr2-no-drrs.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full-aspect:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2413])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>   * igt@kms_sharpness_filter@filter-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#6503])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-7/igt@kms_sharpness_filter@filter-basic.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1499])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-10/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_vrr@lobf-dc3co:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#8397])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-9/igt@kms_vrr@lobf-dc3co.html
> 
>   * igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
>     - shard-bmg:          NOTRUN -> [ABORT][51] ([Intel XE#8868])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-8/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#6599])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-8/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][53] ([Intel XE#6321] / [Intel XE#8355])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-mixed-threads-small-multi-queue:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#8370])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-8/igt@xe_evict@evict-mixed-threads-small-multi-queue.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2322] / [Intel XE#7372]) +14 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-imm:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#8374]) +24 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-imm.html
> 
>   * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#8364]) +38 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-9/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html
> 
>   * igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#8369]) +2 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#8378]) +10 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html
> 
>   * igt@xe_multigpu_svm@mgpu-pagefault-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#6964]) +3 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-5/igt@xe_multigpu_svm@mgpu-pagefault-basic.html
> 
>   * igt@xe_oa@oa-tlb-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2248] / [Intel XE#7325] / [Intel XE#7393])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html
> 
>   * igt@xe_page_reclaim@binds-null-vma:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#7793]) +3 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-2/igt@xe_page_reclaim@binds-null-vma.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#1420] / [Intel XE#7590])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-10/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-1/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@d3cold-i2c:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#5694] / [Intel XE#7370])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-6/igt@xe_pm@d3cold-i2c.html
> 
>   * igt@xe_pm@d3cold-mocs:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2284] / [Intel XE#7370]) +2 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-3/igt@xe_pm@d3cold-mocs.html
> 
>   * igt@xe_pxp@display-pxp-fb:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#4733] / [Intel XE#7417]) +3 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-7/igt@xe_pxp@display-pxp-fb.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#944]) +2 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-9/igt@xe_query@multigpu-query-hwconfig.html
> 
>   * igt@xe_sriov_vfio@open-basic:
>     - shard-bmg:          NOTRUN -> [FAIL][69] ([Intel XE#7992])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-9/igt@xe_sriov_vfio@open-basic.html
> 
>   * igt@xe_survivability@runtime-survivability:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][70] ([Intel XE#8966])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-8/igt@xe_survivability@runtime-survivability.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@2x-plain-flip-ts-check:
>     - shard-bmg:          [FAIL][71] ([Intel XE#3098]) -> [PASS][72] +1 other test pass
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-lnl:          [SKIP][73] ([Intel XE#8361]) -> [PASS][74]
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c/shard-lnl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-lnl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][75] ([Intel XE#7397]) -> [PASS][76] +1 other test pass
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][77] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][78]
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:
>     - shard-bmg:          [ABORT][79] ([Intel XE#8007]) -> [PASS][80] +1 other test pass
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html
> 
>   * igt@xe_sriov_flr@flr-each-isolation:
>     - shard-bmg:          [FAIL][81] ([Intel XE#6569]) -> [PASS][82]
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c/shard-bmg-9/igt@xe_sriov_flr@flr-each-isolation.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-8/igt@xe_sriov_flr@flr-each-isolation.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][83] ([Intel XE#301]) -> [FAIL][84] ([Intel XE#301] / [Intel XE#3149])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][85] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][86] ([Intel XE#1729] / [Intel XE#7424])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
>     - shard-bmg:          [SKIP][87] ([Intel XE#6281] / [Intel XE#7426]) -> [ABORT][88] ([Intel XE#8007])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c/shard-bmg-9/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-7/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-bmg:          [ABORT][89] ([Intel XE#8591] / [Intel XE#8963]) -> [DMESG-WARN][90] ([Intel XE#8963])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c/shard-bmg-5/igt@xe_wedged@basic-wedged.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/shard-bmg-7/igt@xe_wedged@basic-wedged.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>   [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>   [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
>   [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
>   [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
>   [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
>   [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
>   [Intel XE#7325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325
>   [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
>   [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
>   [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
>   [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
>   [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
>   [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
>   [Intel XE#7393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393
>   [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
>   [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
>   [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
>   [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
>   [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
>   [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
>   [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
>   [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
>   [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#8361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8361
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
>   [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
>   [Intel XE#8591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8591
>   [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
>   [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
>   [Intel XE#8966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8966
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_9060 -> IGT_9061
>   * Linux: xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c -> xe-pw-172226v4
> 
>   IGT_9060: 9060
>   IGT_9061: 9061
>   xe-5615-291141d363710c4ac7ef9ab71153459d746ed50c: 291141d363710c4ac7ef9ab71153459d746ed50c
>   xe-pw-172226v4: 172226v4
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172226v4/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
