Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592B8C02197
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 14:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2115E10E67F;
	Tue,  4 Feb 2025 14:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V0l2b7xw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F16B10E67E
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 14:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738681173; x=1770217173;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K4GbeM1+tvf4aYvq4scsBz+5iykEcQw1PV9lsTNXZUA=;
 b=V0l2b7xwbf9wYkLOJWwzhAF2lTHp1+INZTklNrmsW3isiWTw6XnHOjQy
 MvDY8i1QPup56ZjkjN/ew0qFmAHD4rGqqc9/nFOO4JIgn7SY464IXMxi7
 i0P4tZqpqEWzQa24tyLN3Xn5ziHYnzsLXPRV+VOqFrWBO1dH/KeGye+qL
 WRx6+yJ6kdPUd5oO2739EsWW+dtknYWTPt1PnVwMLkdYNzCdnx5s51pxK
 YApO3xUhrnEUaJVtYGSVcwydtc5xMIvrKKzEZMP981UiYtTvtkhqkE+Js
 P4i4ShgYz+4HOaWHJ9oW/seELEXm4WBZfo2XZ6v+gzslXT1FOYH1W8kWi w==;
X-CSE-ConnectionGUID: QUejpAgARWG7Ukd2497Mtg==
X-CSE-MsgGUID: R43r4KP0TmyFDlzY1O301w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39315828"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39315828"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 06:59:33 -0800
X-CSE-ConnectionGUID: EcJk38tbT0a6xkGgMbX72A==
X-CSE-MsgGUID: DFRMlz6kSaGmsck9xmNn4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="141485226"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 06:59:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 06:59:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 06:59:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 06:59:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmKOOEF5xts7+7/EU3E3MQ69pq8nKNBo3qe3dzLt69X/pMV9ABRgZ9i5vKucMhEJ+nlQdDE3YaQVklxTdcVAEckB6NRTK2RKFSdNeB7ECQqWfAWOaSIE0REjOry0LiCcN/cyqp5XhMK1HfBkt13p/bmkn8WRb1rFSneBJLD+fTjG8J3/UlM3nIk9EnUEL3zdShSpIIi2IoThZc8Jgvo1myUTGOFr8pDbi6BqpkEY6rsj7WeugdvtHtyVeUjr8VcpHbsarreOnJrkniwE77w9dVbE5NUDuPPjB+P4aySDA50ys3CToLx44bqhZuYoFnbbPZfQtorXWruXAx5vab+FDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1nNTxIaY5AQKYX2qKPIcIYEuXQY9oVrplPNbBxjJjw=;
 b=iZ82273+r8mjRLB8uI2z0C1jYPhI78a3mKMJwk2A3qbfGT8zmPP5yNXzjKCYeazVX9Uc2dwnXdGasRVta/nRyGIuqlwtvb66AXZEFflhfDrNtcXgRHb3XGh7AleC0c6YNDUJ2Z7NIchyGZMDbZqEuk+hw/p1R7fF8ApHsVTabdNpWAEM1F+GjKYtpib1w9Vr3HZFe0rRYkRo1bSMzvUk4SQEfAzKIELhpquqg0u+HmPU1Pyv7PBbbWOBAnx/M+AdwHkq38eTaeA1vFgzktbDJpdc+t98R+CZ6hV46zB/13P7Q1NMU0H4zrdEUULBV3ItPdxrLn8oc2wCF39Lg6zeiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4516.namprd11.prod.outlook.com (2603:10b6:5:2a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 14:59:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 14:59:28 +0000
Date: Tue, 4 Feb 2025 08:59:25 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/xe/display: Move dpt allocation to helper
Message-ID: <iqfwraitkhmzhjiga2vfwwgqwlcawdbksmde2oqggh5rl5mzap@jrwrmzlk6x5b>
References: <20250114180403.896587-1-juhapekka.heikkila@gmail.com>
 <87o6zj6utf.fsf@intel.com>
 <xi5ybwn5vzqeoukafh2rbepe5emvotghbp64bz63ofgzhvb736@766j7qcwvis6>
 <87zfj2573g.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87zfj2573g.fsf@intel.com>
X-ClientProxiedBy: MW4PR04CA0099.namprd04.prod.outlook.com
 (2603:10b6:303:83::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4516:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c2832e4-42b5-4639-14ba-08dd452c8613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7s4/hClTvJCO8zbbbHJ9J7DLp0RTOuBlFgn0Fnwi46wR8cTI9sylYA9PDwEF?=
 =?us-ascii?Q?E6dzRQ/4ld7xb6MdiPkDtSxrsMEosGxe2cszxWL5u+MejQvL2NIBqp/1GXPH?=
 =?us-ascii?Q?NJsWUDJmS/lNbCN0BShZD6GK/CoTHZqWC/ibv1xTFtXOhxd2uuWaon3vdexM?=
 =?us-ascii?Q?kIqofkVjnFQgLVELzprkN76kEIOOVM0BSpAUWpBVRgsvv/7u6y73RtMrSvMX?=
 =?us-ascii?Q?RErvSiend7g3m+C+ykR2z3DUB974O6QkryzC6j7dKVwtp00RfZKhXUFpgJaP?=
 =?us-ascii?Q?0nadRg4wOzBiACJSf3BOjxCsfwHjLmSXj3Cb1F733pp+CMO7KSIbRurPC+F7?=
 =?us-ascii?Q?3ZBcr7ZHyC0gKLaWTp0wg/SE7dRtD3Ma+V9UsbwBzJTR0+XIZKpbUESrF6Zx?=
 =?us-ascii?Q?EZvem7cm3eQjb3VjPY5ClMbw/K/GZgzvREWFwAK24duBNlxQ88ajiudomMYg?=
 =?us-ascii?Q?rewGMN6lU25H2n7ZOMUKsUZrAswZNWnyK31YlBV+GYOzp4cBs5LIZ1K6SMqa?=
 =?us-ascii?Q?WyKc7onEYsz+XIp/1yGpm3tZGkq9PHnSbkOPh8P5WJcqsqYQJy9p6fK9rOkS?=
 =?us-ascii?Q?iXpYwHZ9jFcz5whw5hHa1hqip1oetfkLIsL4/1rU1Ow/UJuLB9nY6aTsgaXx?=
 =?us-ascii?Q?9ds8YudLfzfZq3HRsXQ90R7JMGIE2sGasdzZC4exuWQzMsSK2a0ky7qpxQf4?=
 =?us-ascii?Q?7Vu+slZhbsovkTPf9XfsbSN9hA6mbOLxKEfeSPg2JBTDNlbFrcLPghjj/bWs?=
 =?us-ascii?Q?OxTKzi/uIMVIx4ljCAXmSFxWHT6LVGusoKk/C9f4qUswlX/MS/vPkWmT0YZ+?=
 =?us-ascii?Q?/RtdFSygQmoewvRGY277C/HzHWAeXrdHBKiEwfIwPSkbOyqo9qukzFSBSUt9?=
 =?us-ascii?Q?TW34OlNxzl2ZO/gSasaHTNFUSJPTjd8EqvQbuspp6AUv1LbcJmRCPFdg5qT3?=
 =?us-ascii?Q?lxDxH2QNEIyvmD3b26waZzY/f6sNTPbJ5Nvq7UFATIgdtHl/hVi+RQAnVNwA?=
 =?us-ascii?Q?0Ogpjt1rX1yTQE7MqLlyPVK65LGn9d86Gc3fruphe+oane5zfNW4+wdYq5pE?=
 =?us-ascii?Q?yKkCH2gIboo5C4g/zO6ucGLt0PLvN+/WBSPBvlU9kw2VLpNRCq078zhMrpCY?=
 =?us-ascii?Q?8TtFSnhj2OZ8h9PkteNaxGDZrJhYjtqL+CD7IkbafuVv77VP248nKEz70omg?=
 =?us-ascii?Q?GyodNfpZYVdQqJjvAq9vR74PKQxvw0JNhCC8RPdLToDFssoneYWOFmpmgyZE?=
 =?us-ascii?Q?vN27jYX7w++QOVy/XDPaa3p/0GIt/P2/lCVB5Y3HuinZdNPgvdHGRBXqcOai?=
 =?us-ascii?Q?r3TPEakv2XwEcg9z2ZhO9z65dmlvaz2toATb3WlAX3h+P7nwZcToSXnByEed?=
 =?us-ascii?Q?z1c/LHi643vKIwWwXRWzxGQeg3A7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/a3+wdiH2NOqtrS5nDy4pqHl8sxA2z8svUbzolpt1QmDP1lF/vXI+WeNOeoQ?=
 =?us-ascii?Q?L7v1pMHBSYp1Rrny6JbyL6j7l6HGJp9EKTNBnNlOBULhOiebbhgggR+8e7Lh?=
 =?us-ascii?Q?I/IfekGJ1US2tjTppc/pkrXWwysH/xKcRYVVSOxp3hupOgrbzCpnYYuakXFe?=
 =?us-ascii?Q?dF1iNVOrPpkH9O3fW6uxuULtnkyS+X8Jis3F2sCamvvOElIjtUqFX3WHCC3A?=
 =?us-ascii?Q?97KFrZ6dd+dMAswSA7FoBOcj54IBXNHch6ClRXsspybFG0CuQbkM9IlQXuqN?=
 =?us-ascii?Q?3wu5jt83SShxctUYjdAPhwk64RDYmTzMTS3XBSLv1lgUVMUZOMkxUQ3L/mb6?=
 =?us-ascii?Q?o2uVZnjNNIJeb2T93qmreuwjSwRXYZouMl4Z8L9Ckem4UrA7Oclz9z6Dre29?=
 =?us-ascii?Q?M1+J3fxnqC/C1Nb87V/YuLCxLYiU9p8CpYU4EnJfwXIEA9tGbS+mpFlbZPR2?=
 =?us-ascii?Q?Kwvzn9hL7bKrEyN0XZYBkSJ9RyD3I1PFerEq6dOclfkZzzV4BEZub2at3OYb?=
 =?us-ascii?Q?43z1W66PdQM4tseFEMQYyMQW2AB+UQifj2Rfu1w3laVYgtxVy5j1TDlm2ygv?=
 =?us-ascii?Q?pSkYowBUB57zFvbRO5kt+Tz8sRaS8hWIPLXDDofWCZNrjxRC+P1WDdMVKsxB?=
 =?us-ascii?Q?qaactoINHThrd3InQt7is4+8b5x/zcsBCEcRAfd75ji72ujD4QHBJcVEM6++?=
 =?us-ascii?Q?K0Bjkv+3gF/ceSk/JodJhCpvfqpTWrtfvV1qPoTDb3qaEo4I5OMPgcr/EROb?=
 =?us-ascii?Q?5uANiuvP/tqLCDnGNcLh2fBSpv/A9z/hatO5hnbjpjYjacymCOjoOVfq7eU5?=
 =?us-ascii?Q?nHwjVxRxY1ZVJkQuIiZK9X3rIt7K7lcXOh9sN+J4DiTsHvvvJbnj1B3r9sFw?=
 =?us-ascii?Q?vfIPwwy6UwauBA75CmwtWRGL9WFc3zRAm/ieN3jW59+2gvlhqg8LI4vQFexs?=
 =?us-ascii?Q?7oKqLD20R2kAdsRo9Z7CWaKy2h7w1tKmJgiFT9YLgkTAdzbcewHgFP1aKQ1A?=
 =?us-ascii?Q?nJdw4nzvGF6mMjbUzxTfkzTe/yWU8zAVeJ5rYZHBeWZlIkSOmV860Xks+IP5?=
 =?us-ascii?Q?TP7bFeiWXywubhV2evExoQfNfidsV/aKkZoBea+EfytgDuRSVPti7xYdV4DA?=
 =?us-ascii?Q?EvNxyq9YEpO6CaunxMCMpdn60YtlwQRTZzW+FcdV6PNnTojhdwgTpkKa2Spm?=
 =?us-ascii?Q?rE8Mv2rB+ou+fdAQuvXiLCeOSKTEKcgBwUTVJRBZHBIcdo/j90x7fKOa6Bk3?=
 =?us-ascii?Q?bMOtdc7tegcxc2nGw05/XSboa740JiQgdCx4pAMLLCMEI32U2rvJ4p2wYbQ3?=
 =?us-ascii?Q?gtJ8BW1l2A8paY6H/8xEZuyi5X+kSikWl9KAg1MOjBBbhYeKj5zBQLzc6Q0l?=
 =?us-ascii?Q?GskfJZPAwvJlx36jGcdW1VWpOi3PIpB6Zg6mja7S4eL034+Cbm/UbhNBBt7s?=
 =?us-ascii?Q?5BLyDKkWaNmpNzqZsOgfT6Qei1Vu49iKDisZjZCDmZvYbvLQCkPbhtFmQezN?=
 =?us-ascii?Q?hUTLwzCAvNJs5Hu7kCpB/VAkx1ZyQFM/oa1hcBgX2Aot1OPjl2Bn40PVDW37?=
 =?us-ascii?Q?oy4SWUNp9tlB2EBkR95PnIrw8MXKlBV0s0Awp32vmIfjF3//i1PbzrabkWQp?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2832e4-42b5-4639-14ba-08dd452c8613
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 14:59:28.8229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VMStZOH3jOynk0UVgp/ZRH9KOJ9r1kb1T2VySbAOSuweQIIKb6z7vgCE9YuIPHxFmAYE6jleKrsCSPAC/rCwzxOtjMPeDmgk03ToQUCqKes=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4516
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

On Tue, Feb 04, 2025 at 12:37:07PM +0200, Jani Nikula wrote:
>On Mon, 03 Feb 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Mon, Feb 03, 2025 at 03:07:08PM +0200, Jani Nikula wrote:
>>>On Tue, 14 Jan 2025, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> wrote:
>>>> Simplify __xe_pin_fb_vma_dpt() by moving dpt allocation into helper.
>>>> This also fixes bug where dpt could have been allocated from system
>>>> memory when on dgfx.
>>
>> I'd also get the fix in place that will also be needed in stable for
>> platforms like BMG. Then the second patch to move it to this helper.
>
>Let me clarify, are you asking for changes before merging?

the reply I gave was very confusing, sorry. What I meant is that there
are 2 things here:

1) A fix, so it doesn't try to to allocate dpt from system memory on
dgfx
2) Move the code to a separate function.

For backporting to stable we'd only need (1), which is trivial, rather
than also needing (2) which may have more conflicts.

I'll leave that up to you to decide though.

>
>
>>
>>>
>>>Cc: Rodrigo, Lucas, Maarten
>>>
>>>Should this be merged via drm-intel or drm-xe?
>>
>> I'd say.... if it's possible, through drm-intel since it's under
>> display/. However this only uses xe stuff and may have conflict if
>> drm-intel is not in sync, so it may need a backmerge from drm-next.
>>
>> Since it only deals with xe-stuff, landing it through drm-xe should be
>> good too.
>
>I'd generally err towards merging all of display through drm-intel, but
>just asking as a courtesy here because it only touches xe side of
>things.

yeah, I think it makes sense to prefer drm-intel. Ack for that.


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>
>BR,
>Jani.
>
>
>
>>
>> Lucas De Marchi
>>
>>>
>>>>
>>>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 67 +++++++++++++++++---------
>>>>  1 file changed, 43 insertions(+), 24 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>> index 9fa51b84737c..c28885316986 100644
>>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>> @@ -77,6 +77,47 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
>>>>  	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
>>>>  }
>>>>
>>>> +static struct xe_bo *xe_alloc_dpt_bo(struct xe_device *xe,
>>>> +				     struct xe_tile *tile0, u64 size,
>>>> +				     u64 physical_alignment)
>>>> +{
>>>> +	struct xe_bo *dpt;
>>>> +
>>>> +	/*
>>>> +	 * If DGFX: try VRAM0 only
>>>> +	 */
>>>> +	if (IS_DGFX(xe)) {
>>>> +		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>>> +						      size, ~0ull,
>>>> +						      ttm_bo_type_kernel,
>>>> +						      XE_BO_FLAG_VRAM0 |
>>>> +						      XE_BO_FLAG_GGTT |
>>>> +						      XE_BO_FLAG_PAGETABLE,
>>>> +						      physical_alignment);
>>>> +	} else {
>>>> +		/*
>>>> +		 * For IGFX: first try STOLEN. on fail try SYSTEM.
>>>> +		 */
>>>> +		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>>> +						      size, ~0ull,
>>>> +						      ttm_bo_type_kernel,
>>>> +						      XE_BO_FLAG_STOLEN |
>>>> +						      XE_BO_FLAG_GGTT |
>>>> +						      XE_BO_FLAG_PAGETABLE,
>>>> +						      physical_alignment);
>>>> +		if (IS_ERR(dpt)) {
>>>> +			dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>>> +							      size, ~0ull,
>>>> +							      ttm_bo_type_kernel,
>>>> +							      XE_BO_FLAG_SYSTEM |
>>>> +							      XE_BO_FLAG_GGTT |
>>>> +							      XE_BO_FLAG_PAGETABLE,
>>>> +							      physical_alignment);
>>>> +		}
>>>> +	}
>>>> +	return dpt;
>>>> +}
>>>> +
>>>>  static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>>>>  			       const struct i915_gtt_view *view,
>>>>  			       struct i915_vma *vma,
>>>> @@ -99,30 +140,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>>>>  		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
>>>>  				 XE_PAGE_SIZE);
>>>>
>>>> -	if (IS_DGFX(xe))
>>>> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>>> -						      dpt_size, ~0ull,
>>>> -						      ttm_bo_type_kernel,
>>>> -						      XE_BO_FLAG_VRAM0 |
>>>> -						      XE_BO_FLAG_GGTT |
>>>> -						      XE_BO_FLAG_PAGETABLE,
>>>> -						      physical_alignment);
>>>> -	else
>>>> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>>> -						      dpt_size,  ~0ull,
>>>> -						      ttm_bo_type_kernel,
>>>> -						      XE_BO_FLAG_STOLEN |
>>>> -						      XE_BO_FLAG_GGTT |
>>>> -						      XE_BO_FLAG_PAGETABLE,
>>>> -						      physical_alignment);
>>>> -	if (IS_ERR(dpt))
>>>> -		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
>>>> -						      dpt_size,  ~0ull,
>>>> -						      ttm_bo_type_kernel,
>>>> -						      XE_BO_FLAG_SYSTEM |
>>>> -						      XE_BO_FLAG_GGTT |
>>>> -						      XE_BO_FLAG_PAGETABLE,
>>>> -						      physical_alignment);
>>>> +	dpt = xe_alloc_dpt_bo(xe, tile0, dpt_size, physical_alignment);
>>>> +
>>>>  	if (IS_ERR(dpt))
>>>>  		return PTR_ERR(dpt);
>>>
>>>--
>>>Jani Nikula, Intel
>
>-- 
>Jani Nikula, Intel
