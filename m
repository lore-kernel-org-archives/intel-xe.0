Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33740C83F04
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 14:38:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC49210E861;
	Thu,  3 Jul 2025 14:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CxEcwfd/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4513910E861
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 14:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751553500; x=1783089500;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uidBQzdGYdg9A5+A52dCgon0s8m/Rtx0QVKHCfFjG+k=;
 b=CxEcwfd/bfh1GobRHznboGuMRhhBJOI2GEpDKWh+fHOQ7qGskz5N94eK
 TWt4r86BiOe502hVN9Y5uPYqjyNfsslWFTIWAbhUWn3L337z89QNbygYC
 8d/3LoVn7HjXvxrVK5T+C4vaBjiPsJXGbeXXLhbFTcdfE8gBjFrIhi8p8
 2q978qNdnV9UZViSiqjLDiX3yRKlAZFj43v9W9uobOuX4OSuoVCxkHeLO
 0LzDDlv9jXkQjutwTqxagCrUYcWvXMJfcnuNt+AzkqhxPfvFxqL7S1fkF
 c3psfnjBADTVyvtXlJ1ViN9cP+GCes6nZR6l/3shU0A7loYyFd4EU5U3/ Q==;
X-CSE-ConnectionGUID: amNomVsiR3GbisS4eh9ZZg==
X-CSE-MsgGUID: p9YcHITiQ4mfZOE8pVWjwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="71320554"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="71320554"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 07:38:20 -0700
X-CSE-ConnectionGUID: 5wxDCZZUTcqznqHA4Eb2wA==
X-CSE-MsgGUID: X1OsaY5DSDqrj2E6SSeu0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="158750647"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 07:38:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 07:38:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 07:38:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.79)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 07:38:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLLn4ixp0meRmlrUx9Z9B1exBDUpdqeTDJbk2K0NPSJWpZ3AM0TVr+gOZjMhpVE0QndwBY4oLzcv2FUzUOnBTh3jqWl6uj1eK5M8WDz8lp6Fxj3FDkt31/TJlnN/wFjsVzaLTjqolMfcgXyzW5uOuzHJT2b5KNyy7RKr8fTYYspfhNkrOkXyO3fvzEbuHdsuhabCSrOg/TkgG9tIgo5ZcFK/9KPbjAaQGAoGdYpQKD7u1DWqW36rIZLEAZRnn5QbJSRxinA9zxxOtWtU4axQWy79HtTUd6ToYSnYbGx63TtMuqCY/bprscfrXZoKcG3o/gIuEiBZARQYBStumdQpSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BU5xdYFAkbDBn/fgcg9xlhOLDPHxhrnEjaVIvS/08hA=;
 b=Cyq8YUpZW8605oi/4jd0tE9BSidlVylIJw58pBOZxyQl1Z6Uu3ro6eeShA8P/TN5+k9nwFRe7O7afQuvYrl09WaL2vh/xK8U1HKZrYb2Qi6m+eGCN+jbKaXisBz6pUzZG7oRflLqdsLf7seE+Fsr2NQOURgevPGXKR5v5Sj5wsU2vm29yhi4ltIKFDvfQalhT88W8u3SfeGPCQSZm0F+Nbgj+94nuZf2j7wr+jwHIYTm0G+w6MhAELWRa2MLPD/Yu9IaHfJHF5qhBX7yzN+ZNpV2peGdGIVtJxgjbBHNMDmMT0XdTS3aTx1JellV17H9tVFVp38IimSmhFa6iPZnYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 3 Jul
 2025 14:38:15 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8880.027; Thu, 3 Jul 2025
 14:38:15 +0000
Message-ID: <a6203317-8595-483d-a37e-5f24a0505730@intel.com>
Date: Thu, 3 Jul 2025 10:38:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Remove unused code in
 devcoredump_snapshot()
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250703062024.3441918-4-shuicheng.lin@intel.com>
 <20250703074105.3461107-4-shuicheng.lin@intel.com>
 <20250703074105.3461107-5-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20250703074105.3461107-5-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0029.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::34) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DM4PR11MB6527:EE_
X-MS-Office365-Filtering-Correlation-Id: bad4b039-4963-472b-24cc-08ddba3f3e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkVYTWFNekRQZjdvNGpOMGhBa3NwckVlS2dXS3dXZU9PYjZzZzRXcXNYbEJv?=
 =?utf-8?B?TS9rVUUrZ2M0K2x0Q0dWRlVWdUUraXBMVnp1U3AwZXZwN1ZuVTlkaGxrck1s?=
 =?utf-8?B?Q0x6YVl1RmxTMmhVRkh6UW5sODVIMEFpRmYyZnJlVUlWQnZFY3MwM3dGV21p?=
 =?utf-8?B?cHZCbkYrWnpnM2pzcm1RZXRraFF2WUFrejNzbjdZMmV2U3g0SWtzanp3UmtH?=
 =?utf-8?B?cWlweTQ5d0lwYm1LaG0zN2dwMzlUUWpweGdmRnQreXBxcFhOQ3lpd2ZDeHdk?=
 =?utf-8?B?VkZid2dsMFFMVTRTazB1RXB4eUp6YlRtejNrcm1tVVJWYUpnUGY2TUVBRlpD?=
 =?utf-8?B?d2JNSnV5c0NwbXZnVkhpUG1qVGVMUmJYL1BqQ1lHSWdOQm1kVjNPYmY5WjVo?=
 =?utf-8?B?d2pmbitEdm5HVVd0SEt3U0RaZlFNTjZGK0VzWWMvNHJSTEVram5pRi8zQXRv?=
 =?utf-8?B?QW1vK1pYZ0FyNXFlYy9DMXpyYitSTUozV2NnUUZZRi8rYnp0TWlOYWRidm5T?=
 =?utf-8?B?a0dvT2syY0kzdUdCR1R5dTlCd3lqSUd1Wkdiamk3K2ZoSW1XcVE1T29vMzZR?=
 =?utf-8?B?UVg5em9GRENPWWNIR3lIRTJvbUE1TlBCVTdtck51RWlYU0czdHVzVEpjYytm?=
 =?utf-8?B?ejIxQjRKb1NwOU45cnM3a2JDeHRQVGRPekpRTE5aWTVKeGd5YS9nVFJxV042?=
 =?utf-8?B?Vk1IRk9OZVVvK0xmTWFraWczUGtDbGJPMytvR3dVb2hUSUJXSUJNblJPWUU0?=
 =?utf-8?B?Rm12WWJGcndxblBpZWJsL3YxZ0dUTzJWUXJxUGtraFhjeG8ybDBoSDdyblJl?=
 =?utf-8?B?SllkRXU0dkpCckw2N3MxNmttMVBPWUt4UTZwYUt0dHVkWGk1ZXNINXZsSnZa?=
 =?utf-8?B?czUrVkpQTVZyOVpuTmMvNEpCbmVLaVQ1NXZkVkk1RFY0dU1OTjNpNkdqYnBv?=
 =?utf-8?B?QjRsTlR4V1ZyWlU2WDZzbXY4OEhZVUxCeTFvSkcrVW1LbVptZDVZN1gzdkxz?=
 =?utf-8?B?aUpqbE5seVZGaW9xR1pLQ2NWWEVsWmEwZzl1NHh3N3FGcHNDL3VxbUw4cjZv?=
 =?utf-8?B?YnRpaFFaZEtMK1FZdzNKcDUzS3cwbDRRZDRRZFpRMllaTnVsRDdwY0RCeEFT?=
 =?utf-8?B?L3NjUzhwQjV2elJtZEMyZFFWbGhhUlVFWDE0Wll3b1ZXTlhiVGpmdXhTY00r?=
 =?utf-8?B?SHB3VW1LSzNYbWN1N0dhN21DcEgxQk02dmtZYWp4TFphbWZNMGFNMlN5SnRk?=
 =?utf-8?B?dHhqZXcrRW5uU2JvbUpNdW42YnF2aXE4aG84Zlp5Zi9rQTFmNGxuRFVkZ0tN?=
 =?utf-8?B?TEVYLy9VVHVqZFdPU0lCeHYxUG1raHBybjFzSWJIdW5icEtzL3hEYW5CbGl4?=
 =?utf-8?B?eEgxQVoxYWRVOUVtV2hjcHFsSzJwaWFLNFpucHdzK1AwNGhmLzQwWUwwWFFR?=
 =?utf-8?B?S20xNG05L2o1OTlZYmFXWWVuZ1JlTjJvSnROcVIxTjJGT1oyb0haN3N0QlpX?=
 =?utf-8?B?VDR4YjBqS0o1MitOQ1VOSHZrQVpYeHBQN2RsWnRZSm85WkUzbHZWcXFDVXlB?=
 =?utf-8?B?UUtUdXhtT2ZuaGxjUUlsbWpaM2p5SG4xWk93USs0UE81bmEzTkR4RUFpaG1j?=
 =?utf-8?B?YVNKenYwNWh1eTdJTlMwRkNDdEtNYTdFbElwam93bDdVeWRZN0ZhVDNyVFg4?=
 =?utf-8?B?eG0xT2U3QittbnVSVUtWQWs1VFdPa0FVLzcvUEllQ2dxVzFhTGtNZzBJajU1?=
 =?utf-8?B?QS9DZ3QrSEJxZ3VEUXFldE1xMGJmeFZzYnViS2JWZno4QndvbGdRUDRnVXNO?=
 =?utf-8?B?Q3gxSU9UbXU4aEtONlJqc0IyQTZGZ1AxdE11T3JoZ1lidEVmMnR4eXVLUnJs?=
 =?utf-8?B?VUtCcUFvL1lMUDVlTHhkd3lVS1E0L3JucWxSMWxJQWordnhTcFJ4aEdzNjdj?=
 =?utf-8?Q?xW+fjHOrS8c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1RJL3REaSt2V3cyZFdCMkQrc3Q3Ulk2N1VuVVJ0ZzMrY0k3L1BFUkJHS3JX?=
 =?utf-8?B?bDY0ajMxR1RxSHJmQXl0WWVZSUgwT2YvTDlSQVhpdWpNNE5kMHRMNzZZL3Rh?=
 =?utf-8?B?a0xqNThOVnQvQjRnVFB5dUo2alQ5Y0I3VEVJdmN2SGUzMHFDc3Z0SzV2RVBM?=
 =?utf-8?B?RlplYXJocEt1VzY0YXhTRkVoNEg0d3dlYTZ4N09SV3A0cDdXbUg3bDA0YUtU?=
 =?utf-8?B?SWRZbXlWWW5GWnhzWDZseEpvOEE4bDRQM3BUT0dLY3VCQVhBaW1lTEZhSWxa?=
 =?utf-8?B?SG0vTTRqRHFsYUJDaHZBTW9WZ1BpeDJlUVN3ai9RT0ZiNnZRNkJia1Z6Q1Z6?=
 =?utf-8?B?S1BJV2ZtVGgzYm44eGxHZldXWHU1SFlFNmxxNWhydEpVMHNVRzgySmRhemk5?=
 =?utf-8?B?TVNxR0I0by9uVWNlbTA1K3FLL3NiQi9aL3Z2bnY5OG5SaUdneXl5WHJCYVpQ?=
 =?utf-8?B?NFBrK3lGSzVUQ1owZ2ZsWG1SZm4rK0xGdENsNzhYakpsdnVzUjNpRlh2T1Bp?=
 =?utf-8?B?RU5sbVljWnA1QjVkelVVd1RESWpyNi9oTUFSMENxcmwrakx5b25QQ3dqYUdV?=
 =?utf-8?B?N1ZkSWlteVZzNjBJV2JDa2FYTE9JejVoNSt6aU9OeVFSSzlQK2doS0FwcVFj?=
 =?utf-8?B?eXkwWHYwZzFOUGtBMUVUZndkZmVDZkltVStCQXRnSXNDTjdGQU02SUJ2MjFS?=
 =?utf-8?B?Z1BZaDJXUWs4QTd5Y3o1SXlYNUlaa21MR3FXVFlYMjR4QXlrZDZEbU92aTNO?=
 =?utf-8?B?QWg3MS8wSTdCWmFweFFsSVI0SzAyLzdDZThVdWNWbCtnSUtlWVF6YzUzQWth?=
 =?utf-8?B?QlBsNUkvN3RvRUpaZGEvYkl5a3V1SjRHemVMbkNqMnBmSk9aNHpYQ0tKUkxh?=
 =?utf-8?B?dGFZVTVGZ3p1QkI0VTFGWkwrM3JoeU8yTk0vZ1JGWWZTbFlhU2pZM0FldHVx?=
 =?utf-8?B?MmJYbXdjYkRhdXZaYXFpTjMxeFVPTWwwZjdRYmJncU1jRk9CSzBFdmNqZ29a?=
 =?utf-8?B?YThOZlFjR1NVWlpEMm1HTk5xc294K2Fza0JFbElqNkM2VkhvVGRYL0NJeWF6?=
 =?utf-8?B?aG81RjFMVmgyYUtxMUVTb1lpTE11aEV6QmMrVnAyYUo4cnBJWmhQb21hc05p?=
 =?utf-8?B?VCtqK3BxNSs5RVNObHNDeVNRTXh4M2VnWFIvam16UFd4NnRQeUNYdGpnOWJU?=
 =?utf-8?B?WXNJNitKdytOOGJnTVFiUXdVY2V2YzlvQzl6OHNQU3JiUXB0Mk9lVnZ6czNs?=
 =?utf-8?B?cjlwYWhRdGJLOVlGMmozVTFjNHpnWklYdm1SMDViU0NoY1Q3eFRtQ2tDOTBE?=
 =?utf-8?B?R01kTWZaenFEVk9BOFlUZXNuNE4xeTMrcVZUZ2hyT2Q2NzNaR3VSajRiSkhX?=
 =?utf-8?B?YzhtQW1QZGN0OEg1OHhISmNVcGhYV09ZL1lENVdDRE5rNDhQRGs0ZGo3Z2R0?=
 =?utf-8?B?WUttUUtqMUpmcG5aV2l1Z2RRUDRmeHBmLzQxS0t0NVIwZy84ZFVxOUl1dG5U?=
 =?utf-8?B?c01OQmRmeWJzYkJRYnQzOGFlMlBlRTluQlZ1QU1sVC9Obk9SMzdWMnNIYjRB?=
 =?utf-8?B?SWlPUjBlUDA1QjR4ZzV6czlzbndsb3ROUVIxMnVWVkhXZGNqU3BXbjhWYStJ?=
 =?utf-8?B?MERlV0hlREk1ekJGS3RaOTgwZjl1OUtwM2Nyb0xxWlhhWERqOHJwM0RSOWQy?=
 =?utf-8?B?ZHp3S3VaRkdiNlQxZHlBbGdoVDhlVnRuVHJTNHVVcTlDN3FIdzFsWElBYURH?=
 =?utf-8?B?c29UcHUzRHI0cWNKeWdaVFZoN2srR292OXZia1FFRS9xYVcvSEJWeGk1aXRP?=
 =?utf-8?B?R1Q2K1djMTh0bDNIRG5QbXBNbjA2L29iQ0dUVytKSzNxeTZCbkI4UklFd1cz?=
 =?utf-8?B?dWFUSmh2d0NvTlloQWJKUGVzNzRRYjdxZFN4MlJodjZuUlVRSjNITktiSVJw?=
 =?utf-8?B?Tk1rM2VnanQyYm9FTXdWcnB3VkpqMXRaQy94THhlSUNsQnVXREtGRlB3cUJO?=
 =?utf-8?B?RnpxMHhURjNXNHBKSE1MZ0VWZUw2bWhMWjZ5VFFWSmdVY3lSTTdDYldTaG1a?=
 =?utf-8?B?b2NuSWpyMjEwVHBndVpFZlFmU3Y1RE9SMGlYclllWEhjL0ZwWWNNWHU5WGsx?=
 =?utf-8?B?MjVpY1diTWNOdkFrNkZZVlNPYjc4VlRpRm1lRVU3THVNNFRtQlgwNld0QnNu?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bad4b039-4963-472b-24cc-08ddba3f3e76
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 14:38:15.1765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9UjW9ldqXls0pGu5b/zqP+MtpyIoY+420DDlb8Hjj9WyeAy7zSWYvW97lJB3hkZA3dL1lCirXnoPTGCftPTDkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6527
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

LGTM
Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>

Regards,
Zhanjun Dong

On 2025-07-03 3:41 a.m., Shuicheng Lin wrote:
> The deleted code is no longer needed bacause patch ecb633646391("drm/xe/guc: Plumb GuC-capture
> into dev coredump") has removed the related usage code.
> Remove the code to tidy up the function.
> 
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 7a8af2311318..94625010abc4 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -313,13 +313,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>   {
>   	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
>   	struct xe_guc *guc = exec_queue_to_guc(q);
> -	u32 adj_logical_mask = q->logical_mask;
> -	u32 width_mask = (0x1 << q->width) - 1;
>   	const char *process_name = "no process";
> -
>   	unsigned int fw_ref;
>   	bool cookie;
> -	int i;
>   
>   	ss->snapshot_time = ktime_get_real();
>   	ss->boot_time = ktime_get_boottime();
> @@ -335,14 +331,6 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>   	INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
>   
>   	cookie = dma_fence_begin_signalling();
> -	for (i = 0; q->width > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
> -		if (adj_logical_mask & BIT(i)) {
> -			adj_logical_mask |= width_mask << i;
> -			i += q->width;
> -		} else {
> -			++i;
> -		}
> -	}
>   
>   	/* keep going if fw fails as we still want to save the memory and SW data */
>   	fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);

