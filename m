Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3DE606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 05:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V6T5ztS3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAEA10E2C4;
	Wed, 21 Oct 2026 05:33:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4807C10EAF4
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 05:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792560825; x=1824096825;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lXaPWeubFOnsQXcTnsKvt6Azd/9OV0x5aKcanOXYNpY=;
 b=V6T5ztS3qkUWeik9nGcj5yRev3O+ztm5pQzFiZ1QVDX9xPWCtzrZ4YLl
 +ecWcvEGG7RufDQn4pQNLC+d6dFEwJyTgsshmkt83PHHiEJs/u+dAN9UX
 I3lIBHwxhcl0P7pHm3wUlZ7Vtt0ON/B+UDiX6njZiRAOfzqL/a+C3NuFx
 YeKE+asLBUdNHYoQKHD453GbNvHMjDegLHYyLwnbLpZ3Ta0klR5WoBvpP
 /bWzIX6gIEAjLdc9JX1SV+lg1UhrVka8oGyXPMFh9Uaw5k9Sc4S/zulEf
 kRhbdSMNAZvrI7ii5dbatCaXHDTEQDYPTh+2BkwQMENV3Qq3KwmOiS+so A==;
X-CSE-ConnectionGUID: FjvrZrGrQ0yosXytRctgnQ==
X-CSE-MsgGUID: hCgVZOw0S2KUdtuZfVkMMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1175828"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1175828"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 22:33:45 -0700
X-CSE-ConnectionGUID: vhdN3j4bSfiIgdFf9kLK8A==
X-CSE-MsgGUID: sco1yj7DRi+W4m90E+hzhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="4801918"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 22:33:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 22:33:44 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 22:33:44 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 22:33:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxbpS6liYys9StSQDJ6GW7BGdJmXtsBmCpAAEkTmDrp8YBhwarXs0mJ1Uq91HPVKUS98JlmMKMZXnGvPMCkYsVtkk2DqAXqTRi67axXphGM+WceIw0Kvx1iZHJjhLLdH6qpkz2pozs4RqRp2G3tlKYxnjB7aMERp1usEJ+hwuhSey/1fbEX+vQ7SQgYIKUdKLf6s35dbXnmBZpaxWSjZTFg7SCKxr3rP2+L4RSHYvNFGve/Fy/gkJ5FliOmLSv0G+xyniEgEJv6fTnGDiQVmsvliH5VtTnAZ/ARjmT0czQKtOnp21qbsqpxLe+V3u8FRXOZZ0Gzs7UjZd4PjRdvCkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ALckxn63KyOVoIpZxCpWKUmtsy7B4IcuyBiDKNT8Zs=;
 b=XbKtyKLzFxXzHSKWuKMd/fhU9iyB6QG1mq0AabGBJV26YCyPyXrNVE8QowRL4bo7I6aOrNJrQa4K4y1Us3jmV8gUW2plGihByV/cHbUnfv6eAG8C+F/1rk5bmnm4p6FoaRdZwJNaQNrrVjBwMVKIUs3sZRLNervB7gBo4GMU8BE38piKJFZ/nLjZY62IC1xa9xVdTyJMw+oXQWtte0YdsUzgyoNHAG6wOrXflIjxrq2Q9bCshm/XyPWHjyaB/e9euKZrqK+IAMzMge4RToI1Y7/Hk24IJQaotuOIqEpk/pmKl0eo8TjibnU6K5jPo7IUZ5tMtjlPwnh7nFA0yBIwTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by LV2PR11MB5998.namprd11.prod.outlook.com (2603:10b6:408:17e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 05:33:37 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%4]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 05:33:36 +0000
Message-ID: <329a48b4-4bd5-4d39-907e-75ef95cd19f4@intel.com>
Date: Wed, 21 Oct 2026 11:03:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/xe3: Fix OAM stream broken on Xe3+
To: <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>
References: <20261021052333.1341575-2-shekhar.chauhan@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20261021052333.1341575-2-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::17) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|LV2PR11MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: 45d3411b-3a95-41e4-6e0f-08df2f34daef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: lM25rNjUvM6NQgCzKWGWOjgYmi+AhyTfaY7rOCg1pqXZM3PjVZMIV81ANUDnEdz+1xtikIsoaSDC92sCeQ7MF2yHwDn/BHzx0GOka9qBM5/pF/bX6GU1qmOpwMiSJihRUxSlERI1XNxGzHQ1bzY+9jMoeqYTKrzYIv9y+Ou3nHPNioUjlNBwg/F2QPgZJXzBEwAswLpS8rA9Lymsa1LDIsNbigSTC89Kj9WEAy/1NJwlqt6txWyubta8gTT87g+Ncg2i55ao/bb3M9NZ9tagcA1oJmOkvhqi0Tbk4KWAmqvr+2jHfngyOH7DJpG+F5c5o6CFC3zu/EzZR2t/J+N3vxZYeU48DKZUuBmia/V+qvfDH1t/IrYV/0Eb/YRaIHhyrdDRZivDNk6dCKAmW900ggxJzUayYwy0gzmn78SASMmWNAX5uyQYFQsmojr2jEpC+lRO+cUGTNEpEeXi6A3rNLTiNxxbMV67xELkVH+vjZc8lGnVGm0PL5rJGcd6f5DJ/7dI7nT8BgVKcHpoJPOuZOLftkqSNaoa9L2gdsMiBi3+yUnwYZsoT38EQZtIkgPDmTJlbGhxH48Cwto1asLi5yGfqMPEWViCT9FapxT5Ehbe71HGGDjezmpcO289vyGHKVVpvgJ8cN7d7sSvcEL4bLYqsD6lPBYwY9e/QKFtZkA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlFzanNSeklFc2NOWThrTXJzQ2J3NXNkSDNST25NTGtucXJNUkhZZGpXYWt0?=
 =?utf-8?B?RzV4K01kVGx5bnExQjB6dmlzSnY3alVVL3phMHEyY3NrTGNDTVJqcEVZWUVT?=
 =?utf-8?B?eVlHWlIwUkIzWjVpSUxRM1dZYTJhTmVrT3UwRXcyZjMxajkxT1cyYldLK1FB?=
 =?utf-8?B?b1BvTERLSUlBWUZUZUpiaG94WGZXZmtYWTdrbFNJRXVaSVJ1UXpiQjlueThQ?=
 =?utf-8?B?Y01TbTg1L01Tc2lVM0Z6KzR3MjZVckJMeHd0bXNBeXFUc255bFVoY214Umpr?=
 =?utf-8?B?ZWtPcDcwR2pTRXJqbEZVaWxPUmJIeHg0TTl0VWlreFVrRmNJRTJkUTVKMzYx?=
 =?utf-8?B?a1kwRE1GaEFJWk1XZDNkdHRhWHdpZnFudFN3akxydUw4SCtLYWdZU2JyYk5h?=
 =?utf-8?B?b3FxZFkwaHdBajNPKzVkNjJUaWthTHdnc2h4Ri8vV1NLbWZIV3FXQ011bVBL?=
 =?utf-8?B?Vm9oYjJndUQ4TEJhSTViMWF2RzhaUXVxNTRBd3BTWWVpNzNHeFBWVDdwdUJt?=
 =?utf-8?B?U0l5aXd0WldNWGJHRFdyaWtTRnRuUzMvbGdmRTNXTWtKaUcxOG4va01RMmMv?=
 =?utf-8?B?aUpvN0xqOGdZY3dub3ltczY2bEROQnNSR2Qvd0REeG9mYm9GWmhRVHlJV3pB?=
 =?utf-8?B?QktTWVZ2akVsWktJdDl6OGVwcndIeHUvdCtLT0k2Q3RiVlpzYkhQdGpubTl5?=
 =?utf-8?B?Z1E1bjNRM3pEbjdDdEZnSVV6MmhjRHB5ZUszZlVmbWhKUmdQWGovOXVOSEtj?=
 =?utf-8?B?RWI3S2x5YTE5c3BoQlFrRDBRL0MwVHVscThZeDBxM1dlWXA1VEh4VWdQMjh3?=
 =?utf-8?B?Wk5aSmNTazRvWXVxak0rb1M0NGhnWWUxVW5HcnFickdOektQanc0VWtaZmhZ?=
 =?utf-8?B?ZlI3YytEUCtBNk00VUFLV0pGRC9zUnpvbWp2djJUK0crWjBubkQ5TjZlL3lO?=
 =?utf-8?B?dG5JdnRsand3dW45Sk1sK3JiWnlIeDI4eUkzTUZyYlR0OVJtc1JCSUQ0Vmp2?=
 =?utf-8?B?Vi9oTzdxSXRKWkcydUJKdzYwajZ6S0lhNDl6QVYwQ3FWRXhGQ25LTWdvNlc0?=
 =?utf-8?B?QnQrbVJWT2wvbGIzTEMySDA2MFE4b0VKcDNIZUs0RXczN3M5bG5QNHFQWmVS?=
 =?utf-8?B?cG5hbS9FeHdHNFhLdytsOVEvVFVuam5vMUsvZmt4QmI0bXJtT25IekpKZ09Z?=
 =?utf-8?B?R2VWRzhoY2Nkclc3cExjdGFPMHJ1Y3pyQmwvbGNRTENkNHdxZUdHcjdUV3Ev?=
 =?utf-8?B?a1ZBYTFvcWF2TVdad2RtQWQ1VEhocjhmWXBodVlxOWw4WHpDclBXWEdQeDJp?=
 =?utf-8?B?NE5lTmJURzhLd1dYaXEwZjgwMTQwcE1vMVpTcmFZdlZ5QTJWdUluODg0eVdD?=
 =?utf-8?B?Vlhzc0RBc3J6VEM2Q2p5TWs0bW0rVUdtMUlIcFpTNE84cHhzOUxheWZEMDVk?=
 =?utf-8?B?TVlRZlJFejhncThuU3FyMlRldEw4SHZUYnJYS3phYXQ5Ym9LQ1J0bHV3RjJB?=
 =?utf-8?B?dlRhdm53Y0dXc0R1czQ0anJ6dHEwd3RUTDJ4VGNPcUJJTC95OWM2cG81cmVK?=
 =?utf-8?B?TkQyY3Z5UzRjUithM2NybHJESDdUeWFFYVlLeUdBNG9QVkF4dkZ4Mk9VODFK?=
 =?utf-8?B?L1VsamJ1N21vZklXMGpCcm9LOWhubHp1cDJuZ1FMcjJocXVHUHZPNmR1QzVF?=
 =?utf-8?B?T294bk5yT25HYlBUYmx3dXpxNXFtMm8ySTF3TldjUFBucEpQTmRDTm5lT0ps?=
 =?utf-8?B?UjUyQUR4bm1Wck04UktCaW9RbTdLQURSU0VJdG1UMFgrd2orbzVaRjhhZTVt?=
 =?utf-8?B?ZTBCRUc3ai82dGg5K0JxL0xsSVZJWW03NEl2djllZDNLQXU2VzUwNnlMR1FE?=
 =?utf-8?B?ZFJTOVR1RDJ2M0V6bHN0UWY2Rm1CVXdTaE01YjdCZnNBTERoNXVIdzVZMmtv?=
 =?utf-8?B?bmVGNkZMT2tyOGNIR1MrMU1nWlF1dmxZa1hOandvNVJYMUZ5cHRwMWE4Smpz?=
 =?utf-8?B?b0lYWG1YYUFuVm1NQjU0QjJaOTl1dDF2bVcxUlN5T1RFR1lJODUyRTV5ZkFR?=
 =?utf-8?B?QnJGWGx5MC8zS3pqSUtWcW9yN016WnV6cWRaZTZvdG81RU9LaldySlc2Rmx5?=
 =?utf-8?B?MWpycHFnTEJOTkh3QjJjL0wzcGdYWDZZdHEzWFF0bDBUdHo1NDFteGVjOFVo?=
 =?utf-8?B?ZG5PRW1DU1didWc4eTJCY0ZvYlVLVmsyRzRJYlJnYW9kemlVd3JweU5TM1cw?=
 =?utf-8?B?bWQyWlAwNUVJdHZZZGp3c1RXekhRMzcrQW5sdE9Jelp1QXFxVGJsdzNyK1JU?=
 =?utf-8?B?aS90NlcwYWY0RkQ2YkRWNERqQkt4bG5vRk9jRG4wUVJvU1lVMzlNZW1jMFhp?=
 =?utf-8?Q?iZMMNeZhYlps6OzI=3D?=
X-Exchange-RoutingPolicyChecked: HB9UuvEdEx+Mxyt+jXCfy025axGpMMXzDZOAPwX5AlfOqqir9xVUn8sT+4xtGvbixkv6sShnzK1uyXgJMhNV0Ii22xD43sYbBGQkQ1EfoQIL/ly/vK5GoOOmddEXgekwRgHMRC3710zdBX95uIsrAoU73ktj84y30VPQ2EXFQwrj0t9n3LC4EZHq8FOyyiw1MM3EFnC3gZombRgR3gBDbCh6KdKm9jlva0MnSFGZpzirProiSbPHoy/jdborz9Pm+l2/C8UDcdZ+MhOUmMDil3CpjQ6EusS0tYg7XvpIhLVsuhnrMaDemUSDRxQ5fDpeHiYzLwG7x4On+XB8JPqhSA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d3411b-3a95-41e4-6e0f-08df2f34daef
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 05:33:36.8737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K26WdS6eI/vry0yAJ6R/mnNXwOIS01YO0U6slFd9akzmzrA6kHcMheEYWP/T0+jXahV1dcqyDxZ7HEW24E7j5uhE6x1fHDxcM6Xpq9yuj+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5998
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Please ignore this patch, I sent the same v1 in the name of v2. 
Apologies for the inconvenience caused, if any.

-shekhar

On 10/21/2026 10:53, Shekhar Chauhan wrote:
> OAM stream: Prevent partial reports at the end of the buffer
> when overrun mode is enabled by making the buffer size
> a multiple of the report size.
>
> v2: Fix checkpatch issues by using a static func instead of #define.
>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_oa.c | 20 +++++++++++++++-----
>   1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index a3484e943c55..f45d4970b29b 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -1743,6 +1743,15 @@ static const struct file_operations xe_oa_fops = {
>   	.mmap		= xe_oa_mmap,
>   };
>   
> +#define oag_has_tail_address_wrap(stream) \
> +	(GRAPHICS_VER((stream)->oa->xe) >= 20 && \
> +	 (stream)->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG)
> +
> +#define oam_has_tail_address_wrap(stream) \
> +	(MEDIA_VER((stream)->oa->xe) >= 30 && \
> +	 ((stream)->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM || \
> +	  (stream)->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM_SAG))
> +
>   static int xe_oa_stream_init(struct xe_oa_stream *stream,
>   			     struct xe_oa_open_param *param)
>   {
> @@ -1767,12 +1776,13 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>   	stream->syncs = param->syncs;
>   
>   	/*
> -	 * For Xe2+, when overrun mode is enabled, there are no partial reports at the end
> -	 * of buffer, making the OA buffer effectively a non-power-of-2 size circular
> -	 * buffer whose size, circ_size, is a multiple of the report size
> +	 * For Xe2+ OAG and Xe3+ OAM, when overrun mode is enabled, there are no
> +	 * partial reports at the end of buffer, making the OA buffer effectively a
> +	 * non-power-of-2 size circular buffer whose size, circ_size, is
> +	 * a multiple of the report size.
>   	 */
> -	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
> -	    stream->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG && stream->sample)
> +	if (stream->sample &&
> +	    (oag_has_tail_address_wrap(stream) || oam_has_tail_address_wrap(stream)))
>   		stream->oa_buffer.circ_size =
>   			param->oa_buffer_size -
>   			param->oa_buffer_size % stream->oa_buffer.format->size;

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

