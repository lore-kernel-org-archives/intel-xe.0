Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62F4606A31C
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 20:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QgZ9gmL7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7810D10E18A;
	Mon,  9 Nov 2026 20:55:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7FB10E18A
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Nov 2026 20:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794257728; x=1825793728;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=94ygq4LIvK2ClV7p+p7A9fdTfZx0wXqf2FRO/AFDsUg=;
 b=QgZ9gmL7GYzhEFNip6A7GTMxzkuyYrLCJW6PAfeSQddUIzLW863NZFVQ
 IIgfd16IuutJQRsGrshkBAHXbXEidvLHe1CS3oHWanxdAK1hI/Jioc3AR
 iO8h6c3PgSPWRDfK35RUMyXOrQmNGueksR5p/yV9fZR7pw+MN1aROOQHH
 TOZiVjvJLmP3O6icjYEtliyuUu60b1MUlZfM5A2bXAWGaitqvyNnPtEWe
 olCTzbIk90rzpSckFqJdSWsyFAI/+G5m2fYpBGvROGGXSXDRkLu+GBYm7
 zKji5VpYW85AjaEvIo8Bbvgzg1JsbnZHR7/xWsVTvEe62mFlWmSEwbxKA A==;
X-CSE-ConnectionGUID: eZdCXK2wR8ObzIAlG+zp4g==
X-CSE-MsgGUID: BsjBCSvaR9qpehQXHKo5wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3023347"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3023347"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 12:55:27 -0800
X-CSE-ConnectionGUID: uxpdk6T3RySl3qP/s8+BJw==
X-CSE-MsgGUID: eS6fFLrKSkq1KQ209oXp8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="9822577"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 12:55:28 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 12:55:27 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 12:55:27 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 12:55:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uf5/UZ7tHsgHOqFMm9rLpoCwXBkUqYbLnWt88vmLrZGBXJV6dEB22+gAOitMwLRzk+dBh8KJW5E4aVWE89miUT6ARP4oPhuMPYE2zScnEzPeLWgVQxpCnRPe50WRAT5RGdT9FByP038EL1/ODqgRTlerqMcswrRfeO3vDq3ZTf/alc8q9UBmWV0Cuk8eptyQOiN/F515uqVESE0dERl5AW0Of1kn+PT3kjTwwEANQtQ2QecVQCRVlaclPlvAfY2KodiG+d1KPookAzbBeerdQb1d4nIdBBLE2gfYEwuXlZ+wWI5M7tlUnigJhHFSsh8MS/xpj5pwDh9k1a+pU5+PZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkuI8rGTbjCEpc+H5+YOQCO0ex4lYZQm/d+4uq6eTnU=;
 b=r5+ugWTrQSSWpr4FdyC6AHrvrCpEXuPZVQ3ijLeSzXaoIyd6p3LN6SmnaloXE4LLlCgR3xO/8zHXsK9HiewSpmggKm2kjQfRVs4EmMKhHx2zM86wqd8oJbNL4JW8nw+YGB1VQ0Wq9LLy3FLav846UYK0Ef4M1/In2Xs2Waku5QUeGa+TOxyhSL7YK+UwByFkgEPx2MCmxRgFv+wP4FrtIRnjdy+vNIgMiSPyWDFKpuLg7quDAU49bDxzc1HBh6Ry2wvO+yyd3jizA0p5XCj0txerQg1HH5l0Fk9uSHl0swWviE58kDS2mHm8lOjDXg2g4MdW8Zegcbfa2Gb/peWg/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 20:55:24 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 20:55:24 +0000
Date: Mon, 9 Nov 2026 15:55:20 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/forcewake: add delayed release with hysteresis
Message-ID: <avIzOG78pyACjrCl@intel.com>
References: <20261017031856.2723986-1-zongyao.bai@intel.com>
 <20261017031856.2723986-2-zongyao.bai@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261017031856.2723986-2-zongyao.bai@intel.com>
X-ClientProxiedBy: BY3PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:a03:255::7) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CH0PR11MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: 573e37c6-32e9-4e05-06f0-08df3ea3c67c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|4143699003|11063799006|261009223027099003|261021123027099003|56012099006|261021121427099003|261022105027099003|261022075727099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: of6HyDpi8O5lK8gxTD6AfoulbMTXE2bhsy8mvMFFVU3c0iciXjg1PL7BzeLcJRo4Gzux0i/dvcS44rN+ga5CUFWhCB7p7mBnJRHg4Gqroimvr5wfmvTlAV1BIZGT0CYWqgzDxWNizVJ3JAKInW93UTYCU6/Kl97nEbX7fcxXhUi+chEfdJaf85lqlXo2xP5O3pltTqF+65LEG37cYJBJTjK0C55ANx33Zy48q0jpnXOiXv9tzbzbzL6X/g+8ZbOGxj+i50nbXvdP9lottm64XTOAWRBlxVrXPycpsw/6KgtY+2MkEqeMjk7AlRtYb3zzIx4xMI0Qw7yaIfudEo5rSEJuDfk+p2LPegHdN06FuYQqrERhhCr2OtKCV4J9OWTMpvIjDFujzVoHrr4QsPmeT/iPqgn6xYo9WpCjAJQe5SK/X/LlYIDoH1B9+ld4kXb6iEDGKeyIOVmhhnK6pwtN9RZTVD9U1U2Npfq0Gce3WEkpHA64Uaw7PM+botFydb/3JqkuEFWBwQdLgGDL+CAAZgorYPZZ+AbztuGNKQA9kw2QUqnviZUwDrDVWfouXuBxwcDxFxXIgPQOvtYgb48cbh0b4eaFz5Wnc3Lf9ZaPEtkJcWuZGhsTqnKYRJMxbzTuGSJb6/rSHFiLOYOT+AHH19floVEr78+q5mmHBIIUgSc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(11063799006)(261009223027099003)(261021123027099003)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xYq8dLPxTZ0C/hZx8H6qXUDYTpAIolyijaBr6IIwq28n3RE5k0ka4iDmXjvL?=
 =?us-ascii?Q?2JP8cNKX0WwyGVzBGEsufUleFMadY5eIw+f2cxKFIrfRbMMG6JPKZGlVJVoD?=
 =?us-ascii?Q?mg0dcIrmBz9BTVXYM/r2CzRtMWEsMnd4kd8k0iiCxf3wZebGX4X9e+2Xq9yQ?=
 =?us-ascii?Q?yc0a3C8xDSBQlKEW3Rqvsws8r8/BeJLmwuiIi7+BiOV2zc3Pz61JfYbFA929?=
 =?us-ascii?Q?AUEYD+tmjjBvS/EBcqNFik3007bmnPAOLPkkC1MQtYBo5XL49/N7LODeJgBp?=
 =?us-ascii?Q?Yoneukcf3iJKtEL81vQ4i0kXn+Oy+6I8UNnUfXjyweUj5YElydPAbMgtbEmm?=
 =?us-ascii?Q?BMmD4IcIbfEDBM56nUSbcEHCq/V/diwmZ58OMpDzRZ6f/wz1Iahy5ZFBNKHJ?=
 =?us-ascii?Q?8oNQu1isCP0ux6IzRzwN4ysFqg4qqPYE5DARllo3ki0E8l2hieZMWRrjHQ/q?=
 =?us-ascii?Q?JgmSv33lMrSYbHk/vlFLT3lgtvIUObmAyvTlwcpqbqsuz2ssenYPXVX5QYpF?=
 =?us-ascii?Q?3Y8YiyaHNtxbrTzw9S5bSDHS5q2asLstkIr8iGqmzR0mS8bI5vzcPsRwOEfh?=
 =?us-ascii?Q?RCBou+EyOMJqlZpW3t4hMr0WEoG4+bCJAOEv8YL7G1FG0NcGSTS3Ut/bCSLK?=
 =?us-ascii?Q?Yfd/z60EYLRQeRP/nLAz7fgTChNl7FGoND+JO54aRhKh5f4S/MkXfyjtsD0a?=
 =?us-ascii?Q?CJEP93fV2+jCC7C9Z+e5i4mhTbAGKichUo/BT11PqNfpXe8Zl/RihF9TAtdw?=
 =?us-ascii?Q?cAwNi/02sT57eaBFOiKhWa9mA+xjLNgHJv1uI8wraSu4DWJZtCfdlTJbSfKh?=
 =?us-ascii?Q?u2z4nemDH0f5ZmCWUDE8Uzw9Al+EaGEJic0+Ujm1hzDOFf2RX37JZRCkPXIu?=
 =?us-ascii?Q?NeX/a61cfbitcuedPK84uVcpjM/T63JNMNvXban4EBVYHcewRJg8yDlMQiSv?=
 =?us-ascii?Q?dBKTP68ByNriEVdoQP5LpKOIvmOw2L7x+bNLUaJOfukKHePJud2MrXer/psr?=
 =?us-ascii?Q?Z059OCPSC3eWsut7KuphIrrkvjHusQ0ANsdrmnZ3C+phLi+FZPetXo/RpA/t?=
 =?us-ascii?Q?MXywn1V7RcN4csCKSnUFCYu/e3ieALSVduNt8F28fpMlTT7E5hYyAiqE7G8J?=
 =?us-ascii?Q?zkt2Q/bIlt8FPbeSaoXQfDRYJK0qXW26bjXKIun6v9cP2aNYgyFVnLsawCHu?=
 =?us-ascii?Q?Bihf2UFBubE36L8dUR16qDlLuB4F28fl/ztnHU+OVj5YXBVD/5RWofKk2HxX?=
 =?us-ascii?Q?MOzIKbDqxHhadci6iBtguefyV5xthvM8wefHbAEaZozcg0HA8q1GZA+66uNP?=
 =?us-ascii?Q?InSuT+TfF8dLa/q24v6JbGLzh8kc3vHrzx4qRb0CIZ900gI3Qo5OF/gS6D5B?=
 =?us-ascii?Q?9yA033WmflGQNKktfSaD6ejfnFbz7qSMxep/9l8iOLusU6qEEZz988JMqWdn?=
 =?us-ascii?Q?K6NPSR9VlFZKBHR4tgLRUUbuzl4GA6OuNmgbtMLqHhYlaI72goRONSTSNgyw?=
 =?us-ascii?Q?XhY6aEuDgYGOK9UIEx/TiTQTuo0vtR+8B2c0fjKeUYSUSkI8h7Fpg+LP+exW?=
 =?us-ascii?Q?w49eVoN59mBHD8qRrOBIt+lIh4F24Y56nNjzYBJFQf6AgFgBwTQjEITEzZ8v?=
 =?us-ascii?Q?3DKCwbdkB8xXp9NW6cbZ6HVBHplpFTtklzjYypV3UyFknutSzIqEb3v8SQDp?=
 =?us-ascii?Q?w4g4XrO+9A2+kAEGerwjzDb0JOqL3Plhvycsneopzada2p22P2IVB6yir2Nw?=
 =?us-ascii?Q?aU+XH8UZEQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: LxezHafqjJ5C3gfZRD0S/4zzl5qjqOfhEM+JEStcumhaxWALuUs8Lp8GqcQpkqswWXb93p8cchg+ntcxLL+AK2hvDNX/GgD4Q7KhZXHNo8LaC1TGeoHC3FdpDx/ibggzGuVQMruXSBoh3kQxVlSVSSWtUR6DylIGmSaF46W8hKwB9XLDVTEew8pLbjCrpek/udEGGyRSHeKO+8m34lZfAkzuIu1wckbKgAAvxJ6liycI52tg3dtU/kxQrq5N8DQGdNbAiOc12fvlDUSDm9bgKtWq3WihsEIoQLfXwLlVudrB5+ulM4eNbx5BssY/HZu8OzGJlymMk412rGM3fSDxGw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 573e37c6-32e9-4e05-06f0-08df3ea3c67c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 20:55:24.3124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhMmPU8RaP0W5e9oxVSYLOKUjPYN9e7+/Jk4ZTvP63Q6og6BWZKkJWAX5UgSt9DafACVnIdjkAyHdydgqJoLmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8189
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 17, 2026 at 03:18:54AM +0000, Zongyao Bai wrote:
> Add xe_force_wake_put_delay(), which keeps a domain awake for a short hold
> time after its last reference is dropped instead of putting it to sleep
> immediately. A xe_force_wake_get() within that time reuses the awake domain
> without a wake request and ACK wait, which makes repeated short accesses
> cheaper.
> 
> The domain is put to sleep from a delayed work, in process context, so
> the sleep ACK can be waited for in the same way as a regular put. The work
> sleeps only the domains whose hold time expired and which still have no
> reference, and requeues itself for the rest. The hold time is a couple of
> jiffies.
> 
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c       | 184 ++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_force_wake.h       |  21 ++-
>  drivers/gpu/drm/xe/xe_force_wake_types.h |  14 ++
>  drivers/gpu/drm/xe/xe_gt.c               |   5 +-
>  4 files changed, 197 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 197e2197bd0a..71517bc4ffe6 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -6,16 +6,22 @@
>  #include "xe_force_wake.h"
>  
>  #include <drm/drm_util.h>
> +#include <linux/device.h>
> +#include <linux/workqueue.h>
>  
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_reg_defs.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
>  #include "xe_mmio.h"
> +#include "xe_pm.h"
>  #include "xe_sriov.h"
>  
>  #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
>  
> +/* Minimum hold of a delayed release, in jiffies. */
> +#define XE_FORCE_WAKE_HOLD_JIFFIES	2

please define in msec and use msec_to_jiffies()

> +
>  static const char *str_wake_sleep(bool wake)
>  {
>  	return wake ? "wake" : "sleep";
> @@ -42,12 +48,22 @@ static void init_domain(struct xe_force_wake *fw,
>  	mark_domain_initialized(fw, id);
>  }
>  
> -void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
> +static void xe_force_wake_disable_work(void *arg)
> +{
> +	struct xe_force_wake *fw = arg;
> +
> +	disable_delayed_work_sync(&fw->delayed_release_work);
> +}
> +
> +static void xe_force_wake_delayed_release_work(struct work_struct *work);
> +
> +int xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
>  	fw->gt = gt;
>  	spin_lock_init(&fw->lock);
> +	INIT_DELAYED_WORK(&fw->delayed_release_work, xe_force_wake_delayed_release_work);
>  
>  	if (xe->info.graphics_verx100 >= 1270) {
>  		init_domain(fw, XE_FW_DOMAIN_ID_GT,
> @@ -58,6 +74,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>  			    FORCEWAKE_GT,
>  			    FORCEWAKE_ACK_GT);
>  	}
> +
> +	return devm_add_action_or_reset(xe->drm.dev, xe_force_wake_disable_work, fw);
>  }
>  
>  void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
> @@ -187,8 +205,13 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>  	spin_lock_irqsave(&fw->lock, flags);
>  	for_each_fw_domain_masked(domain, ref_rqst, fw, tmp) {
>  		if (!domain->ref++) {
> -			awake_rqst |= BIT(domain->id);
> -			domain_wake(gt, domain);
> +			if (fw->delayed_domains & BIT(domain->id)) {
> +				/* Still awake from a delayed release: reuse it. */
> +				fw->delayed_domains &= ~BIT(domain->id);
> +			} else {
> +				awake_rqst |= BIT(domain->id);
> +				domain_wake(gt, domain);
> +			}
>  		}
>  		ref_incr |= BIT(domain->id);
>  	}
> @@ -212,23 +235,46 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>  	return ref_incr;
>  }
>  
> -/**
> - * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
> - * @fw: Pointer to the force wake structure
> - * @fw_ref: return of xe_force_wake_get()
> - *
> - * This function reduces the reference counts for domains in fw_ref. If
> - * refcount for any of the specified domain reaches 0, it puts the domain to sleep
> - * and waits for acknowledgment for domain to sleep within 50 milisec timeout.
> - * Warns in case of timeout of ack from domain.
> +/*
> + * Put the @mask domains to sleep and wait for the acknowledgment. Must be
> + * called with fw->lock held. Returns the mask of domains that failed to
> + * acknowledge.
>   */
> -void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
> +static unsigned int xe_force_wake_sleep_locked(struct xe_force_wake *fw,
> +					       unsigned int mask)
>  {
>  	struct xe_gt *gt = fw->gt;
>  	struct xe_force_wake_domain *domain;
> -	unsigned int tmp, sleep = 0;
> +	unsigned int tmp, ack_fail = 0;
> +
> +	lockdep_assert_held(&fw->lock);
> +
> +	for_each_fw_domain_masked(domain, mask, fw, tmp)
> +		domain_sleep(gt, domain);
> +
> +	for_each_fw_domain_masked(domain, mask, fw, tmp) {
> +		if (domain_sleep_wait(gt, domain) == 0)
> +			fw->awake_domains &= ~BIT(domain->id);
> +		else
> +			ack_fail |= BIT(domain->id);
> +	}
> +
> +	return ack_fail;
> +}
> +
> +static void xe_force_wake_warn_sleep_fail(struct xe_gt *gt, unsigned int ack_fail)
> +{
> +	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
> +		   str_plural(hweight_long(ack_fail)), ack_fail);
> +}
> +
> +static void __xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref,
> +				bool delayed)

perhaps instead of bool we pass the msec of delay instead?

> +{
> +	struct xe_gt *gt = fw->gt;
> +	struct xe_force_wake_domain *domain;
> +	unsigned int tmp, sleep = 0, ack_fail;
>  	unsigned long flags;
> -	int ack_fail = 0;
>  
>  	/*
>  	 * Avoid unnecessary lock and unlock when the function is called
> @@ -244,21 +290,111 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
>  	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
>  		xe_gt_assert(gt, domain->ref);
>  
> -		if (!--domain->ref) {
> +		if (--domain->ref)
> +			continue;
> +
> +		if (delayed) {
> +			domain->hold_until = jiffies + XE_FORCE_WAKE_HOLD_JIFFIES;
> +			fw->delayed_domains |= BIT(domain->id);
> +			/*
> +			 * queue_delayed_work() returns false both when the work
> +			 * is already pending and when flush/stop has disabled
> +			 * it. A pending worker releases the domain later, a
> +			 * disabled one never will, so release it right away.
> +			 *
> +			 * If the worker starts and clears PENDING between the
> +			 * two checks, it is misread as disabled and released
> +			 * early. That is safe: the delayed bit is cleared
> +			 * under fw->lock, so the worker does not see the
> +			 * domain and does not sleep it again. Only this one
> +			 * hold is lost.
> +			 */
> +			if (!queue_delayed_work(system_percpu_wq, &fw->delayed_release_work,
> +						XE_FORCE_WAKE_HOLD_JIFFIES) &&
> +			    !delayed_work_pending(&fw->delayed_release_work)) {

This is confusing... perhaps a fw->delayed_enabled bool that is set and cleared
under fw->lock by stop, is cleaner removing race and comment above...

> +				fw->delayed_domains &= ~BIT(domain->id);
> +				sleep |= BIT(domain->id);
> +			}
> +		} else {
>  			sleep |= BIT(domain->id);
> -			domain_sleep(gt, domain);
>  		}
>  	}
> -	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
> -		if (domain_sleep_wait(gt, domain) == 0)
> -			fw->awake_domains &= ~BIT(domain->id);
> -		else
> -			ack_fail |= BIT(domain->id);
> +	ack_fail = xe_force_wake_sleep_locked(fw, sleep);
> +	spin_unlock_irqrestore(&fw->lock, flags);
> +
> +	xe_force_wake_warn_sleep_fail(gt, ack_fail);
> +}
> +
> +/**
> + * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
> + * @fw: Pointer to the force wake structure
> + * @fw_ref: return of xe_force_wake_get()
> + *
> + * This function reduces the reference counts for domains in fw_ref. If
> + * refcount for any of the specified domain reaches 0, it puts the domain to sleep
> + * and waits for acknowledgment for domain to sleep within 50 milisec timeout.
> + * Warns in case of timeout of ack from domain.
> + */
> +void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
> +{
> +	__xe_force_wake_put(fw, fw_ref, false);
> +}
> +
> +/**
> + * xe_force_wake_put_delay - Decrement the refcount, delaying the sleep request
> + * @fw: Pointer to the force wake structure
> + * @fw_ref: return of xe_force_wake_get()
> + *
> + * Like xe_force_wake_put(), but a domain whose refcount reaches 0 is kept
> + * awake for a short hold time instead of being put to sleep right away. An
> + * xe_force_wake_get() during that time reuses the awake domain without a
> + * wake request, which makes repeated short accesses cheaper. The domain is
> + * put to sleep by a worker once the hold time expires without a new user.
> + *
> + * Meant for opt-in hot paths that are expected to be repeated shortly after.
> + */
> +void xe_force_wake_put_delay(struct xe_force_wake *fw, unsigned int fw_ref)
> +{
> +	__xe_force_wake_put(fw, fw_ref, true);
> +}
> +
> +/*
> + * Put the delayed domains whose hold time expired to sleep, and requeue for
> + * the remaining ones.
> + */
> +static void xe_force_wake_delayed_release_work(struct work_struct *work)
> +{
> +	struct xe_force_wake *fw = container_of(to_delayed_work(work),
> +						struct xe_force_wake, delayed_release_work);
> +	struct xe_gt *gt = fw->gt;
> +	struct xe_force_wake_domain *domain;
> +	unsigned int tmp, expired = 0, ack_fail;
> +	unsigned long flags, next = 0;
> +	bool remaining = false;
> +
> +	xe_gt_assert(gt, !xe_pm_runtime_suspended(gt_to_xe(gt)));

what about a get_if_active variant or something like that instead this
fragile assert?

> +
> +	spin_lock_irqsave(&fw->lock, flags);
> +	for_each_fw_domain_masked(domain, fw->delayed_domains, fw, tmp) {
> +		if (time_before(jiffies, domain->hold_until)) {
> +			if (!remaining || time_before(domain->hold_until, next))
> +				next = domain->hold_until;
> +			remaining = true;
> +			continue;
> +		}
> +
> +		expired |= BIT(domain->id);
> +		fw->delayed_domains &= ~BIT(domain->id);
>  	}
> +
> +	ack_fail = xe_force_wake_sleep_locked(fw, expired);
> +
> +	if (remaining)
> +		queue_delayed_work(system_percpu_wq, &fw->delayed_release_work,
> +				   next - jiffies);
>  	spin_unlock_irqrestore(&fw->lock, flags);
>  
> -	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
> -		   str_plural(hweight_long(ack_fail)), ack_fail);
> +	xe_force_wake_warn_sleep_fail(gt, ack_fail);
>  }
>  
>  const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id)
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index e2721f205d6c..35a2252c762a 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -11,13 +11,14 @@
>  
>  struct xe_gt;
>  
> -void xe_force_wake_init_gt(struct xe_gt *gt,
> -			   struct xe_force_wake *fw);
> +int xe_force_wake_init_gt(struct xe_gt *gt,
> +			  struct xe_force_wake *fw);
>  void xe_force_wake_init_engines(struct xe_gt *gt,
>  				struct xe_force_wake *fw);
>  unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>  					    enum xe_force_wake_domains domains);
>  void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
> +void xe_force_wake_put_delay(struct xe_force_wake *fw, unsigned int fw_ref);
>  
>  const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id);
>  
> @@ -103,6 +104,22 @@ DEFINE_CLASS(xe_force_wake, struct xe_force_wake_ref,
>  #define xe_with_force_wake(ref, fw, domains) \
>  	__xe_with_force_wake(ref, fw, domains, __UNIQUE_ID(done))
>  
> +/*
> + * Same as the xe_force_wake class, but the domains are released with
> + * xe_force_wake_put_delay().
> + */
> +DEFINE_CLASS(xe_force_wake_delay, struct xe_force_wake_ref,
> +	     xe_force_wake_put_delay(_T.fw, _T.domains),
> +	     xe_force_wake_constructor(fw, domains),
> +	     struct xe_force_wake *fw, unsigned int domains);
> +
> +#define __xe_with_force_wake_delay(ref, fw, domains, done) \
> +	for (CLASS(xe_force_wake_delay, ref)(fw, domains), *(done) = NULL; \
> +	     !(done); (done) = (void *)1)
> +
> +#define xe_with_force_wake_delay(ref, fw, domains) \
> +	__xe_with_force_wake_delay(ref, fw, domains, __UNIQUE_ID(done))
> +
>  /*
>   * Used when xe_force_wake_constructor() has already been called by another
>   * function and the current function is responsible for releasing the forcewake
> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
> index 14b7b86e801b..5c16511c6f36 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
> @@ -8,6 +8,7 @@
>  
>  #include <linux/mutex.h>
>  #include <linux/types.h>
> +#include <linux/workqueue.h>
>  
>  #include "regs/xe_reg_defs.h"
>  
> @@ -82,6 +83,11 @@ struct xe_force_wake_domain {
>  	u32 mask;
>  	/** @ref: domain reference */
>  	u32 ref;
> +	/**
> +	 * @hold_until: jiffies value until which a delayed release keeps the
> +	 * domain awake. Protected by &xe_force_wake.lock.
> +	 */
> +	unsigned long hold_until;
>  };
>  
>  /**
> @@ -101,6 +107,14 @@ struct xe_force_wake {
>  	spinlock_t lock;
>  	/** @awake_domains: mask of all domains awake */
>  	unsigned int awake_domains;
> +	/**
> +	 * @delayed_domains: mask of unreferenced domains that are kept awake
> +	 * until @delayed_release_work puts them to sleep. A subset of
> +	 * @awake_domains.
> +	 */
> +	unsigned int delayed_domains;
> +	/** @delayed_release_work: puts expired @delayed_domains to sleep */
> +	struct delayed_work delayed_release_work;
>  	/** @initialized_domains: mask of all initialized domains */
>  	unsigned int initialized_domains;
>  	/** @domains: force wake domains */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 775c826b68b4..5ed96807fe34 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -515,7 +515,10 @@ int xe_gt_init_early(struct xe_gt *gt)
>  
>  	xe_wa_process_gt_oob(gt);
>  
> -	xe_force_wake_init_gt(gt, gt_to_fw(gt));
> +	err = xe_force_wake_init_gt(gt, gt_to_fw(gt));
> +	if (err)
> +		return err;
> +
>  	spin_lock_init(&gt->global_invl_lock);
>  
>  	err = xe_gt_tlb_inval_init_early(gt);
> -- 
> 2.43.0
> 
