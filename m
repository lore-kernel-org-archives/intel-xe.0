Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3780C53219
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 14:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC0F10E94B;
	Tue, 28 Jul 2026 14:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gBu+kEny";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914F310E93F;
 Tue, 28 Jul 2026 14:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785249966; x=1816785966;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mWTWHlC19f5vvRa6df9YxQ4bJ+ZxjpB69mJ8/rNAPGc=;
 b=gBu+kEnywvvkAR84F7UBLs8IfZhybNsG6XygNpBnJKUpIOtlgOtr78yu
 7FCFCJBTuE0KXWFCu2qKlRkheZgKF2Jx6j9r8qEoYFVC6cMvO8iW8FBTS
 XMuB/uDcGBsvhm6zidDwIx2NMTm0IWqsgpAY51D1z4XDuzuWNv3iOJzPq
 aRaF5IBLG9E01GCr95kj72sP3H3zo3jLPbVcWpMcgbpgm8q7D7Kv/rkv6
 NU4f923G2VyVCQgdyB84gUczuIYmQ1V6KvT/MVM7tcs6b/2QUDP30lH/Y
 Qzaq99nUSRCl2NVQ+Qf9M6uO/70tqIrvyYtYLxGqtfvXECipPeNCDy/+t A==;
X-CSE-ConnectionGUID: CsKPM8fWSGad7LARhtpY9Q==
X-CSE-MsgGUID: Pmvxm81eRwaZg3UYwsd5vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="84814841"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="84814841"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 07:46:06 -0700
X-CSE-ConnectionGUID: ld5C89lATeasHj2Y1TXqsw==
X-CSE-MsgGUID: Du/0IAo5QQe1D5AHIYNaJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="263516826"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 07:46:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 07:46:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 28 Jul 2026 07:46:05 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 28 Jul 2026 07:46:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6TfRSVGFeVuT4qOpqoXboPGiDBznlP0SgV12BFMqWkbZP8aK/poHan9wx8hotW0h/QUheNGFluG/EyRNPiE/jg3s9dVOxTAPwQ48ldP+qT3aObCpERlHsuBke4kUqDfEV0kE+YPM55MrWXp8raed2jEkA/pv1lwdASI8XVI3hOAK8sKEiGpsbaZYGQ8AVlCBtgB6udzZPbw7HN/0oC8DTeQjD6dKiWSSqZdZVKMbzj4jOWUR+wyEjJaTNbZF4ENYKhJmNeP1sM5Uf0ceHiRsm7Xu7KDTe/IL3nJe2eACYNxxO/RRfbQtWdzLUfTQFRITzqnj2pcYd53VmcY8tYNdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IaCM7ELEIb39uw43KGb8InRpyoMS5hSCHzxoKLcUSe8=;
 b=dSE1bGo6LA22ZP5aVKMErtTBRHlukzM6QfUbLpz3gkA6UL9PGw4d87CDb1YxGhN68O8rdVfQ7ckq2OfLo9dWFza3+4pB+zTJJXihO+vPPVAxb/W9032AclAmCmEdwhEDvl+Hw153UusJkBv7ZivoaIIpU74MYpH3vIaSS+jnLGCjax+PnpdXdR9eyYhLVlKqryj8tCtTAo6ZAk7LW1JkPQakoDQdau2o4EZhCoSmYNhIAa5LSejP97ipDzZJ3xOSgjK0BCDc5DDofUmkBDFFLKH4Ts61SWuvICcZSiejqNGiZaAqkAg+xOGIMTR3hIe/ZaRw1pzbYN4FXECWiFBK5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 14:45:55 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 14:45:54 +0000
Message-ID: <a381bdf8-5c16-4b16-8770-4e565c8e65c7@intel.com>
Date: Tue, 28 Jul 2026 20:15:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND] drm/i915/hdmi: Poll for 200 msec for
 TMDS_Scrambler_Status
To: Jerome Tollet <jerome.tollet@gmail.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <ville.syrjala@linux.intel.com>, <arun.r.murthy@intel.com>
References: <20260520022544.3097252-1-ankit.k.nautiyal@intel.com>
 <20260727131445.28048-1-jerome.tollet@gmail.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260727131445.28048-1-jerome.tollet@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::11) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|SJ0PR11MB4894:EE_
X-MS-Office365-Filtering-Correlation-Id: 7051059d-4f69-4816-722f-08deecb6ed20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: VK6SWq8BMPWiD0fUEv/CICIgVZrOnc3YwRLfjSKraIZx57thK+mTFtNXE395z6cSIK38TES74tNpZJYoX/aBjDGxFus+i3T5LawWmJdRqEA7Ib5CyOo7brDTkFuTFboGKUWW4P7phmrg0PZhQpm/U91NghMcAvw4yL5sKJFnZSJTtv9arhufHLtlCDzfuv9/y9JLUqZ91RBQmv+/+HPJRPfyeFQb+mKPq89z/gE7Eg9fkJ8mFUBG6KgDEG9blXbu1oArArZgxpirUP3kM/XSb3IbIGcQYI+DH0xbSvWw6sjDsmfXmGEMN/pfz1lmejxjb2cSRcNwujSv3ycwm8rROnqkTLthKJe0kuk6tFMMIw6vqkEyJyM1we92KIDbaG8V7K6hUzFZpqVcHS+he4TCFrnSp7Td5Gb82y+Y3EI56V1wkOQHmj/MPVXKeX9QdYYuncw/UsDxdo10iRTcKoeUrNkBDO5sd19pGydLpGVeanSWJhhC8GG8WjVVB0rxkRgDv7tIbr68OpsLmr8QxFHYfmpN+epaLgWgBnaQ4z6jiKGQ0+T3HGZLw6neeO16Mg4ABysrzmLEC21BReepSCkCm3lQGkUA4obSKW1EBsXxrcuiRs76+FpTvBzhU+z49fgGpA4W9lTikbAwEIaR0YoInS5kR4evqd9zW3jmx5ia5aM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7554.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFlnbHVXMVY4Z0oyOWpqS1dkOTRwQjMvelZJc080a3VNbjk0NXV0WGhOcGg3?=
 =?utf-8?B?K1NyWmpWTVg0eUJBMkNQU0pveHBKSVFlb0djQStGR1VWM1ZKbWc5dmY0aG05?=
 =?utf-8?B?ejZ4TUk4K2FuVy81U2o0NEdXYUtCY0ZHMFBrRzZJNWhPdGdPK1BOajlWRWxJ?=
 =?utf-8?B?VEtMSTlVVUtma2lRUXZ5UGxiNVdxYUJ3NzFiWjlWY2pab2hnbjhNdDdMVW4r?=
 =?utf-8?B?dE1tZzRvSjZxbDhwZmZzLzBGN0lpWG03ZEtySE0xSEpsUmlONnN4YjhBTmdE?=
 =?utf-8?B?WWhzaG1HVzJ6OFlzNVphNlVxMnltUk9SUW5mbWhuUVkrV3hFRThSeFk3QkJo?=
 =?utf-8?B?TnNiWTZpSkU0TUlFWjZQaVZQL1V6UVd2bWU1NjVZL3BsVWVhNU1qaDhlT2k3?=
 =?utf-8?B?NzJzdnVaV0J4VitLWjNnYm50d1VyWldqNE56K1dEcnlNK2lMRFhvNEFQMW1C?=
 =?utf-8?B?UHNxeDViTlN3U3FrdUdWT0tlT3ZnTVpMSUpjRmw2dGVYQVk3TzhjY21TcGZ6?=
 =?utf-8?B?TkIwWDA2TG1EU2k1MFlRblJnYnVGR1daNHpxZldUYnQwRlh2bm5ub3BlT2VR?=
 =?utf-8?B?NjhFOW00L3pVZ1RuMTkrdGFMaXl1YWtBLytRdndrSDFTbXAwMmlTRFpUcnZy?=
 =?utf-8?B?UFdpUm9VaVVwVkRnMU1jQ0lxaGNodzRlWjMvLzc5V3BNQW9LWVZGRDRFVHA1?=
 =?utf-8?B?cDhTTnFPRVgvNnluNEFzVFMySkhzT0o1SnBOVEZpMlMwN2xVbFpic2dxWDY1?=
 =?utf-8?B?czVzVmpYQnFBeDQ2WUI0cHdhdG9CcDB1L3Fpa0RBOVBya0Z5cmFzN0JiYVVE?=
 =?utf-8?B?a3Y5TU5CSE1pSjlFOE44R2ppQTdPeTFoeWZteUJtZXdhcW1rYWhVY1ZpNDZk?=
 =?utf-8?B?Q2N6cFliQkM1Mm5mSWdvZWRHNG8wMEJPaGM3MUtZQUUramFzVUJoakRZMkRH?=
 =?utf-8?B?S2JlWHdZUXhBbFZFeENFOVJUUTBqeFUzMlFVUkFGZ1pFbVAwU01HYmlmcHNV?=
 =?utf-8?B?RU9ZdUJWRmtOZVZ5SGdkcDJ0R21SOFhNQ0pUMDkrVTd1RTN1RU14Y2o1dnpK?=
 =?utf-8?B?d3FiSDhFOEZFZU4zQTdoTDNLZ2ZwSkw5WUpuZU1nYXI1VTloV0sxM20yOGFF?=
 =?utf-8?B?UXIrdXdLY2t6aXdlb3ZYOUIraG9CRURxUTRoZWxkeS9UUGxPTUx6NWtGbkMz?=
 =?utf-8?B?Y2libGplc2ZBZFBaYmJWVjZMM1Z3ZE9TbWhXMTAzOFhJa0NVczJpNFRadDUw?=
 =?utf-8?B?eUtUUk9IRVd5SzdCN0RUcUYxZXhteTg1bmgyK3JnVWpkK0h5UTRza2JwdFFa?=
 =?utf-8?B?ajRBdUlVa3htblZxQjVveW9YeDhaY2VzNVdSSGVYWlI2d0hBdXBBMlMyQi9a?=
 =?utf-8?B?R3liVFJNZkZwQ2pJKzVpeWo1QkFjOU5kRml0QWgwVS91RlJLSnVSU2JVR0RS?=
 =?utf-8?B?OFNhY1BiZHFuRWdHMVdaVndUN2YrWGJ2T1MvZVpKNnR1Nis1RUJtbm9BSk1C?=
 =?utf-8?B?TnE4YUhWYkhyZ0F6K3p0RHB2RzdyV2lCdHVDb2R0Q3pyVjIrUStNM3FkM2sz?=
 =?utf-8?B?THVaV3lTVmdKOGh2Si93bTNXZzdhalAwVFBmd0lKcTAvMEwyRWlBU3pWNVBD?=
 =?utf-8?B?Z1RXWVpidWpSZk9HZmJqU0YvYXV1ajFZaEpUZ1dSazE5a2RoVFJQMmtGcUMx?=
 =?utf-8?B?Vk5heENyeTNDbEFIcDdQS1ZlbGZSb1R5aE15VE9WbmluZks2Y2t6THhrMXM2?=
 =?utf-8?B?U2FUcFEzTVZaUmJUMCtqdzEwL1VkK3pvSURpTGxMTDR5VG5DYnYya25sUmYx?=
 =?utf-8?B?eG13cFAvRmxpdlVpakk3Ni9WdlFYT2VWSHlMOWRuaFFqbWdnWXJZc1hsRUw4?=
 =?utf-8?B?YW1kK3VlNklqaTltWDlUVmVqTHJndHYxM1FSYURabWYvZVd1ajY3K3lsdGg1?=
 =?utf-8?B?b1o2ckV4SStnWUF5TUJqNWVBeW0yU0V2RDdvOWpOWS93b0JIbnBoN0pwajdH?=
 =?utf-8?B?aXUrUXROME5iWlJ5VWJIMWNnb3dLL1pWR1pleEVSQWZMN0V0VlBSOHVXVkFY?=
 =?utf-8?B?YnlJdDllNU45ZGJTRDFwaElhNHo1UjlxRi9QckdFZytpU2xrUkxZRmVJSTF0?=
 =?utf-8?B?ZS9vZWdZM3h2L29GNlAvc082K0ZJaTl4eDFrMnZZQkxKLzYyZE5nZzVsME1x?=
 =?utf-8?B?WGxDZkJsVGF5K2FDNTlzUk5YWHFlMkhDeFFLQlFmcDJXUDZWYXJ4TzBzOXBx?=
 =?utf-8?B?QjlZTnIwTlFneldPL25RS08vL29zM0c1UXoxSzdjazRVR0JSNjdDWmdLT0RG?=
 =?utf-8?B?WGJEUkJCWVlCWVlVTWRKZ29JL1UwbW1lMnYwWi8zdnJEZ01MaUFoZ1FzTkx5?=
 =?utf-8?Q?Mi/VCSsDKLsGJoJE=3D?=
X-Exchange-RoutingPolicyChecked: m3yVuLA3b1wJ4Ozszp+KjjsR79XRHt/R+ABBzzBVgED2ZiSm3NorfZRydA1T0ANpsiGDz4leYO5QkczwrnmIvN9ySbP8j7C3qYq+55QahrU0lPzjsL892kOtdiZnz6d8xG0PeKYB3lXQoKOm4XwPPU9a/PXrWCO23ohttYhkA5b01q3lP1tRkZkgOUX3TWvJaO/ysw/agHIv5OvKOqpt47p+yXpMknHfwHkh1ZTwmkSOLJXx7+UMjGsl4PzxJOZXRfwVVuMrkLwk9kPUjBt5acovJ7L618lmmqy8VekpweKFIOeiNlCW1XU85w1MtnAR2AW4758jU/SymhLONS8okg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7051059d-4f69-4816-722f-08deecb6ed20
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 14:45:54.3290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJhDFPtJEiu3hky2BMFpVkENlqZtqtIprAFwAFylBhVXNoCJ17R0PfdDEPiJynsZwpBLD79t9u05jplI4QJ213VmGJlap9Pxg7QA4/33p9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4894
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


On 7/27/2026 6:44 PM, Jerome Tollet wrote:
> Hi Ankit,
>
> Following up on my last message from June 29, where I noted that commit
> b7d51d65e4f1 ("drm/i915/hdmi: Poll for 200 msec for
> TMDS_Scrambler_Status") was in drm-intel-next and asked about the next step.
>
> I also noticed that GitLab issue #6868 was closed on July 21 by Rob Clark
> with merge request !238.
>
> However, I checked the official Linux v7.2-rc5 sources and the helper
> intel_hdmi_poll_for_scrambling_enable() and its call are not present there.
>
> Could you please clarify whether the patch is queued for a later drm-intel
> pull, or whether a resend/rebase is needed for the v7.2 cycle?
>
> Please let me know if anything is still needed from my side.


Hi Jerome,

I checked with Jani regarding this. His comment was that commit 
b7d51d65e4f1 was already part of the July 2 drm-intel-next pull request [1]

Beyond that, I'm not aware of the timeline for when that pull is 
expected to land upstream.

I also don't see the commit in the v7.2-rc5 sources, so I can't comment 
on its upstream status.

At least from my understanding, no further action is required from your 
side at the moment.



[1] 
https://lore.kernel.org/r/934cacdbf2a37856eb5cd6337d8774b449405bd8@intel.com

Thanks,
Ankit

>
> Thanks,
> Jerome
