Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E45606A33B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 08:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MfZ+NMeu;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Q53rJAEp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C92911218F;
	Thu, 19 Nov 2026 08:44:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C1F11218F
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 08:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795077849; x=1826613849;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=On8xuWdfo2yRwxb566nzBqok8wXykSJA932gVk5Y5m0=;
 b=MfZ+NMeuuYA12kx4RPh7bYiarXunkIXsv5M/p2GN6DFVmfi8QCiR+1QR
 KVAXXOf9MyeP80Jspg6JpMNCXXdtnK/08OEAPwQx05tjvefOOcZ30wIKC
 wMS2+aaoslmCXRy9NBTksT/PR9Dw6omKWPAfl+v4RtztE3R5uLwHdDi3w
 67yBZKb0HHNQDDnMoWdo92IhDVMDKe9Bv3TGn9kN4CTwgMG3Ge8ii2r1b
 eROGk0+L8eWr8r6z4XpBgv+McNLceNWguihigjrHspi6+bexkvp+SrQQo
 GgmiVwruGulwhMFfO2/wYacVZaGsHncxrtCugE6yaexE90f6oUfPRKWKV A==;
X-CSE-ConnectionGUID: r/xwVy5kTmyk15tH93kj1Q==
X-CSE-MsgGUID: ocr9Y2CqRpyKGbEStxDzkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3763205"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3763205"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 00:44:08 -0800
X-CSE-ConnectionGUID: z3ILaYuwQpeWWQBAcQkwag==
X-CSE-MsgGUID: N8RUiDVXSXOQla3wjNqIzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10936430"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 00:44:09 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 00:44:08 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 00:44:08 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 00:44:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ljoqNXrUOm1u7C+m5YEdWp0/TOt5O2FXO+P/wW2K7oML8qHoFbHyOzI7jfJ27QwO2myveV2GUMbVQ6qEDveCjt1ngfUsLcJt4Zgivl+z/Vj6GKLSG0ukRo78oAuHZtjdYhry21/7MO5QEqPBZ1ZNyfT5fKCW7ZYMn24qYMhvPtYupqxf0D9x7dYK6v49KVl7WLokRwspnUv7+zg7tdLP+sEQWJyyHCQTXbXPJDdfn3JS/9sOtMuJlzD96ctpkC+7SpVS1R4dwmejxU3SWSOcLF39P9lw3qsQ6QV3Wy0v8b5DShDgU9CHCw1VF2Jw47X1zbuldgHPqYa8CWdJP6rPHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BouXti/Z+n5LCRyAz/n01jx/CVtgDPWIw176UoGUdO0=;
 b=qPfKsG1aUsf9ZN4PfyCyvriLpTGmEO67RfjMsAGViYD/xxUI3LP3FvDcic4Rb8rOPxc+6DMi5TqyzAHLDEaftCHBnBVa+5rUybLo7hLfyPM7RhJp2lMsQszz3H7gQLKC4vR4WZxYJJMddomgCq2QKvLpD+m+5EHNIPov3LK0NELdq/ZZ/Jb45YWhjjlufTRvoD4n5Pf0I7gRJFA/+7J+qg3ilrP9gOvI6YxPopwUBh8W7qe/q/RH7OkZ7IxOhxF33KHBmQm/lO5Y4Zj/FdduNg9Bglu/szoT36uUMtH3vcgnUcX4E+HZPCIqdPYpk7ak4iwvnH+vUJIZtKc62Mh10Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BouXti/Z+n5LCRyAz/n01jx/CVtgDPWIw176UoGUdO0=;
 b=Q53rJAEpls2KDpiigD2/FNe7MN6MPexYbvBt6llLbq1pYEfG/yWyzifg0ehlscRVfeq44uo0v76lmj96OXwU7r6D5n9gSzIoYkr7Q0PPSthEO95H8J8e3DATal8cP8C74NiwxufYAcqXN+27UQeXuBCI8ln1KzMnJK3aPKl9420=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17)
 by SN7PR11MB7066.namprd11.prod.outlook.com (2603:10b6:806:299::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 08:44:03 +0000
Received: from PH7PR11MB7145.namprd11.prod.outlook.com
 ([fe80::341e:838e:e911:f62b]) by PH7PR11MB7145.namprd11.prod.outlook.com
 ([fe80::341e:838e:e911:f62b%6]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 08:44:03 +0000
Message-ID: <01248603-d250-49fe-92a9-17d1ea02d33b@intel.com>
Date: Thu, 19 Nov 2026 14:13:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/xe: Expose CRI maximum memory frequency and
 bandwidth in sysfs
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "Anirban, Sk"
 <sk.anirban@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
References: <20261118172458.316603-1-naresh.kumar.g@intel.com>
 <20261118172458.316603-4-naresh.kumar.g@intel.com>
 <78a466cb1e54750ea7ff3d082936a4cce34b0467.camel@intel.com>
Content-Language: en-US
From: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
In-Reply-To: <78a466cb1e54750ea7ff3d082936a4cce34b0467.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::16) To PH7PR11MB7145.namprd11.prod.outlook.com
 (2603:10b6:510:1ec::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7145:EE_|SN7PR11MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b0e80ac-07a8-4553-86e4-08df4619435d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|6133799003|11063799006|4143699003|56012099006|10067099003|261026121527099003|261026140227099003|261028144727099003|261022113327099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: LAaaEFWZGoEj4CTS0ieaN4oCUXL4FWN+i+ZksuMeqg7iGc9bcpp8yRgn1mC+JFRWdeyIkl2jUvLuZLcuK+J6OlnVN123bF+z360w7g+bmxxd/NwwZoryjyXnNhd5hdAw3CWbDyaUezJIt9c9EE6IYni0xtsxK7pnDhx2+0HKkC2piw3Hqdgi2nRhwohw+ojgZmL5MyavZymLPhJpEO7wja9I55zixYqdzB/gpbeJa0bJs/D4OBjSJmpoTr2/z+VIssLeYM935C4HiuHDSkfJHW4Ltqq6QK8KXJX98td0O65BjXRnd+bA6znMfp3M68lBuGbWRfCvOPqspb2oxGZVYeAH4Sr7TKv5MNhfiqN6yYmjdV6vgOIYdFy/mM/vl3Qi9f2dYKcKdA0sZiyhL3+nsJAllJkqbK5n/UCAk7H+4IcxjXmO2mGoml3CJbhQJxRUhgjkQy7TG9j/iBuDsJ7kIBZpgQHuVWK50nXoyt79qWXnTf0OuR/bR3TKZ+DsGYInUWAJuYycZ5B6IeJEAS0lLnWWPdLP+h9PHoTk3FE/xlZF1oBLl3KVG64Df8aHJVYbdF7sN//fC6TjuXaLJ8PPZNHKrf1zhFTas+zR76nFRBbn2H5rKs8TGRHIG7RGsSg0W5a9Sja2IO4N03gZM0nLJfXzGCt131WW1OckgYzPGJc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7145.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(6133799003)(11063799006)(4143699003)(56012099006)(10067099003)(261026121527099003)(261026140227099003)(261028144727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkFBUjhNRUVUQjJKOC8yV0drT0NOOXg1cFVBbzJINGRkbTYzalZIY0hLNE9k?=
 =?utf-8?B?eXBhSmRudWdPei9McGdnWElJVkxTYlQ5dVF5QnFmOHhqdTVlT0tIbWw4VGQr?=
 =?utf-8?B?YkpKS1Z5ZVdpanRXN01PNmIrRCtxaWJkbjZTSnUxNGFJRDBjNmFGc0w5VG9V?=
 =?utf-8?B?cFA1N1JFblB1cy9Ud3FIeElNQzhvQ0MraGkxV2tPSzg4RFRZQXJoSGlnNE9J?=
 =?utf-8?B?cklLWWl1VzNEV0dDWGl2ZTdocno0NmR4RHRDVXhlMFMxUjVnamlPOU1sTndR?=
 =?utf-8?B?UTZYU1M4WFF3ekRuZ3BXMmxuSGRrZC9ZZ0sxN0o3bk5yb3hBS1hVSGh0bzR5?=
 =?utf-8?B?L09GNGdYYzBSbXhWNFJwZlZ0NjVPRWZtSVBxRStvS08wZHpGVWRXeE91MEpH?=
 =?utf-8?B?YUFsRjBQMmVHZ3VuanNDSnpuNzRTcVI4WEt0T1Z5ZGRRc3VrZE5YSGlVbnln?=
 =?utf-8?B?RXBkaXNNWEYvTUFMc0tnMXoxL3ROV3BMcGROZEo0cVZhdXJwYVNoa1RhZDJU?=
 =?utf-8?B?VVBPLzY4SE5UWXpFOUxnbk55Ry9zOWFoZCtkN2JYQUdjMmpyOTRHdTJDYjNh?=
 =?utf-8?B?azNxMjJlWVV5VCtqdW95bVRodVJoY2xrT2FRNFYyblUvRFRkV1BHSm16RGhz?=
 =?utf-8?B?TTAvbXRlZkFOUmRFSmZUMDJYa2NPTk9qdGIvM3c1U3JYdkRDOXNkWitsUHJl?=
 =?utf-8?B?REtaYTlsN2dPTkNKUkZITnJXQ3JFZ0poblpzNGxaLzJ0anh4WlpSZEhINUtp?=
 =?utf-8?B?dTB6aGVldWl6NUduNk9IT3NOWCtRRlRmNWlMcGxrSGIxYU9TZ0J4WDAveUxF?=
 =?utf-8?B?a0YrQ3k4aXJTeTR3QmhWLzBKRkxXcng0QjR4dDA3R0VXbmZuRm1GU1IzR3M3?=
 =?utf-8?B?WHZLZnJ0L2FKN2M4V1I0bWlIZXFmcXNjYlRnMUQydllSR1VvSmNsWGpqZzln?=
 =?utf-8?B?YWR5OFBDbmRmeGk2NWVpd3p5N3FlUGowMkdrY2xjOXlON3d2YldvbElHeGZZ?=
 =?utf-8?B?RTVEWjgvbEUvbXJ4SDNYaWJoYXdSelAzUmlCUkhkQU82YVZzZ3dYaUcvYTln?=
 =?utf-8?B?SDU1NUMrc1pOVDRnUlRScWwraDVKTXJDbzBnSjlPZnFBUi9zN0FOd29VdzF0?=
 =?utf-8?B?NlhKQnJseUpMaUpRcnR1eVozLzdoM3Z2TXVOVEMyK2hyWVovbnFkZW1jVG80?=
 =?utf-8?B?aFUveXFzS2tQcjNVYlFQSFdOcE9aMHBnUlJQbjliSDFBa0dKdnZHNVV5VWVm?=
 =?utf-8?B?dnpvRnErdlF3NmtPdk5ZRHdRTEVmcnZab2tIQ1ZoS1ZKOHNwZytIYllnK0lX?=
 =?utf-8?B?b2w1UUNKUmN3SFB4d3lQWThVMFBmT3lmalgyM3hHOTZhRVR0dmU2em13ZnFt?=
 =?utf-8?B?NVpMeUFjODNQVzRtNU93eHJ6K1hoR2N1RjdMQ2EyellGSXF0MjhIMVB2NUtI?=
 =?utf-8?B?eFZ2WDBFdnFiYUM3TGVwaDVvaXNYbDVHKzBJcWpoaTJ6K2tDdVpwdXVNZFNj?=
 =?utf-8?B?RWF5dnVTMU13WERqLy9RUUFDMVZ4WXcxWTZBZUlZOUdqcVdQTS9PSHA3TTZs?=
 =?utf-8?B?NkZ5SHhVYWJCdmRhbDVGdklyZ2V6b3o4SEI4NVBkSFBmRkdWQmRmNW0yNzRw?=
 =?utf-8?B?RnJYekl3bjUyT2ZmMkhTN0lCUDFDK3pGY2hSa3ZnY3hYVEJMZ2pndGVLaFBI?=
 =?utf-8?B?WDNmdnFqS2N3blg4dDJhOU5VL1FXSlNReXlVd2ZpOFJZNFkrUUZnUlZxRGdh?=
 =?utf-8?B?SXlKQ254bU5RY0lHYVhXQWhYc3VVUzVFTlp4WnF0cFdDRUY4d3RiY1dxNFM3?=
 =?utf-8?B?WUlZL0QrdjRIV0twMSs1RE4yU2dSSDREMFBXY09qckNCektNVVpXeVVsTXc3?=
 =?utf-8?B?ejhhcXExNTBBRFhnNnVRa2dhNHVoandETytaVHZwUklNVW5qcnBTeVJCSG9U?=
 =?utf-8?B?aThNbHRSZWkxbUttOUFmYk5heWRNcW1wTjhySytCT1VYbTh3Q0d5RC9FbWVT?=
 =?utf-8?B?SHZtSFdwZW44aDdaN0Z2RGV5czdXVkk4K1pGekMwb2w4OGE5b2loV2loZlFW?=
 =?utf-8?B?VG1Jc09XVW5nS0lMZlJvWTFSOFBPR21aUmxXMGwvMUdBSFpGczlIbTRnUFkv?=
 =?utf-8?B?OWRYaWJEdmw5cnBUY1JLL29CR3g0M0ErZHpuZHUweG1IZ3hadkdyMWFmRVhD?=
 =?utf-8?B?L0VCelNyaXRtU2V4ZHpmdU5sRXVRV2ozTWZJY0QyaVhWUVRUSWFKVlVycDA5?=
 =?utf-8?B?M0tDMFljYjVBN0xZaE1iUmlrTkNvWmxmRnJiNitDUDNDYlhhSWpGVmhIQ0hx?=
 =?utf-8?B?M3JHQ0o3dEdCZWVnUU9kazR3U3JmM2FSTDhlOWc3QVUyZDNKbUFXQT09?=
X-Exchange-RoutingPolicyChecked: bACIUKroC/1a4W0N2NFQ8/x3aH/qW0xvMEEG2N865t2wEN4xE1bVNpt4WmY6hxToVOGgWbxMZpU+gk7nYFzHCd7NhkRmGzNmse4y+NbxdNPGx9YhrQ6H8e/bR0DmtJT7zvQNPrTapOiY5lLi6SR8+z2MBcMvIfc4knf3s1Y/p9F5DnJJ9k6yciW7SqLmyPLLFtivjlsh6AUOkimIGVHWE1T7Oc8JHqofIjtCOdIY1cZEqxL2TwCMuU0nlGHZgwRQxkZOAN6/n66bxuJkx2pw6aeoNUU0X+DOvZ0Dcwd6pZYNMIV+WEg/Q7HwCaZd3nh/ljvqPOfvWmawNWryUKLnUQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0e80ac-07a8-4553-86e4-08df4619435d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7145.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 08:44:03.1967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dg1xXwjb4BU3kDFIOA/x7Erl2BL4yY55cDlr+gfvPLUnqJqhnAAAJRibq+1RZteEbOmK88svyXM7SDIz8Og3ATb7iALU4Ye5jmjRMw8TccI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7066
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Stuart,

On 11/19/2026 1:16 AM, Summers, Stuart wrote:
> On Wed, 2026-11-18 at 22:54 +0530, Nareshkumar Gollakoti wrote:
>> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>
>> Expose the maximum achievable memory frequency and bandwidth reported
>> by PCODE MEMORY_CONFIG as read-only tile#/memory/max_freq (MHz) and
>> tile#/memory/max_bw on Crescent Island.
>>
>> These are capability limits, not the current memory frequency or
>> bandwidth usage. The existing PVC memory/freq0 entries are unchanged.
>>
>> Document both attributes in the Xe sysfs ABI.
>>
>> v2:(Sashiko)
>> 1. Fixed CFI violation by updating attribute types and callback
>> signatures
>> 2. Added a check for xe->info.skip_pcode in memory_groups() to
>> prevent
>>     exposing these attributes on Virtual Functions,
>>     where PCODE access is disabled.
>> 3. Changed kernel version in documentation from 7.4 to 7.5(Badal)
>>
>> v3:
>> 1. The device_uid version was reverted to the previous value
>>
>> Signed-off-by: Himal Prasad Ghimiray
>> <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> Flyby comment here, but why is this in sysfs instead of using the query
> IOCTL?
>
> Thanks,
> Stuart

requirement is non root read-only access to memory bw and memory frequency,

so sysfs is better option. And other frequencies are already following 
sysfs convention.

Thanks,

Naresh

>
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-gpu     |  24 ++++
>>   drivers/gpu/drm/xe/xe_vram_config.c           | 122
>> ++++++++++++++++--
>>   2 files changed, 132 insertions(+), 14 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>> index 4dc4afc3961d9..b563b7e8a9d9c 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>> @@ -8,3 +8,27 @@ Description:
>>   
>>                  This sysfs file is present only on supported Intel Xe
>> platforms.
>>                  Accessible only to users with administrative
>> privileges.
>> +
>> +What:          /sys/bus/pci/drivers/xe/.../tile<N>/memory/max_bw
>> +Date:          October 2026
>> +KernelVersion: 7.5
>> +Contact:       intel-xe@lists.freedesktop.org
>> +Description:
>> +               RO. Maximum achievable memory bandwidth reported by
>> firmware, in
>> +               megabits per second (Mbps), as a decimal integer.
>> +               This is not a measurement of current memory bandwidth
>> usage.
>> +
>> +               This sysfs file is present only on Crescent Island
>> devices.
>> +               It is readable by all users.
>> +
>> +What:          /sys/bus/pci/drivers/xe/.../tile<N>/memory/max_freq
>> +Date:          October 2026
>> +KernelVersion: 7.5
>> +Contact:       intel-xe@lists.freedesktop.org
>> +Description:
>> +               RO. Maximum achievable memory frequency reported by
>> firmware,
>> +               in MHz, as a decimal integer.
>> +               This is not the current memory frequency.
>> +
>> +               This sysfs file is present only on Crescent Island
>> devices.
>> +               It is readable by all users.
>> diff --git a/drivers/gpu/drm/xe/xe_vram_config.c
>> b/drivers/gpu/drm/xe/xe_vram_config.c
>> index 31a3405c39abd..130a8f76e6663 100644
>> --- a/drivers/gpu/drm/xe/xe_vram_config.c
>> +++ b/drivers/gpu/drm/xe/xe_vram_config.c
>> @@ -8,13 +8,14 @@
>>   #include "xe_device_types.h"
>>   #include "xe_pcode.h"
>>   #include "xe_pcode_api.h"
>> +#include "xe_pm.h"
>>   #include "xe_tile_sysfs.h"
>>   #include "xe_vram_config.h"
>>   
>>   /**
>>    * DOC: Xe VRAM config
>>    *
>> - * Provides sysfs entries for vram frequency in tile
>> + * Provides sysfs entries for vram frequency and bandwidth in tile
>>    *
>>    * device/tile#/memory/freq0/max_freq - This is maximum frequency.
>> This value is read-only as it
>>    *                                     is the fixed fuse point P0.
>> It is not the system
>> @@ -22,17 +23,22 @@
>>    * device/tile#/memory/freq0/min_freq - This is minimum frequency.
>> This value is read-only as it
>>    *                                     is the fixed fuse point PN.
>> It is not the system
>>    *                                     configuration.
>> + *
>> + * On Crescent Island, the following entries are provided instead:
>> + *
>> + * device/tile#/memory/max_freq - Maximum achievable memory
>> frequency in MHz. Read-only.
>> + * device/tile#/memory/max_bw - Maximum achievable memory bandwidth
>> in Mbps. Read-only.
>>    */
>>   
>> -static struct xe_tile *dev_to_tile(struct device *dev)
>> +static struct xe_tile *kobj_to_tile_parent(struct kobject *kobj)
>>   {
>> -       return kobj_to_tile(dev->kobj.parent);
>> +       return kobj_to_tile(kobj->parent);
>>   }
>>   
>> -static ssize_t max_freq_show(struct device *dev, struct
>> device_attribute *attr,
>> +static ssize_t max_freq_show(struct kobject *kobj, struct
>> kobj_attribute *attr,
>>                               char *buf)
>>   {
>> -       struct xe_tile *tile = dev_to_tile(dev);
>> +       struct xe_tile *tile = kobj_to_tile_parent(kobj);
>>          u32 val = 0, mbox;
>>          int err;
>>   
>> @@ -49,12 +55,16 @@ static ssize_t max_freq_show(struct device *dev,
>> struct device_attribute *attr,
>>   
>>          return sysfs_emit(buf, "%u\n", val);
>>   }
>> -static DEVICE_ATTR_RO(max_freq);
>>   
>> -static ssize_t min_freq_show(struct device *dev, struct
>> device_attribute *attr,
>> +static struct kobj_attribute kobj_attr_max_freq = {
>> +       .attr = { .name = "max_freq", .mode = 0444 },
>> +       .show = max_freq_show,
>> +};
>> +
>> +static ssize_t min_freq_show(struct kobject *kobj, struct
>> kobj_attribute *attr,
>>                               char *buf)
>>   {
>> -       struct xe_tile *tile = dev_to_tile(dev);
>> +       struct xe_tile *tile = kobj_to_tile_parent(kobj);
>>          u32 val = 0, mbox;
>>          int err;
>>   
>> @@ -71,11 +81,15 @@ static ssize_t min_freq_show(struct device *dev,
>> struct device_attribute *attr,
>>   
>>          return sysfs_emit(buf, "%u\n", val);
>>   }
>> -static DEVICE_ATTR_RO(min_freq);
>> +
>> +static struct kobj_attribute kobj_attr_min_freq = {
>> +       .attr = { .name = "min_freq", .mode = 0444 },
>> +       .show = min_freq_show,
>> +};
>>   
>>   static struct attribute *freq_attrs[] = {
>> -       &dev_attr_max_freq.attr,
>> -       &dev_attr_min_freq.attr,
>> +       &kobj_attr_max_freq.attr,
>> +       &kobj_attr_min_freq.attr,
>>          NULL
>>   };
>>   
>> @@ -84,11 +98,90 @@ static const struct attribute_group
>> freq_group_attrs = {
>>          .attrs = freq_attrs,
>>   };
>>   
>> +static const struct attribute_group *pvc_memory_groups[] = {
>> +       &freq_group_attrs,
>> +       NULL
>> +};
>> +
>> +static int memory_config_read(struct kobject *kobj, u32 subcmd, u32
>> *val)
>> +{
>> +       struct xe_tile *tile = kobj_to_tile_parent(kobj);
>> +
>> +       guard(xe_pm_runtime)(tile_to_xe(tile));
>> +
>> +       return xe_pcode_read(tile, PCODE_MBOX(PCODE_MEMORY_CONFIG,
>> subcmd, 0),
>> +                            val, NULL);
>> +}
>> +
>> +static ssize_t cri_max_freq_show(struct kobject *kobj, struct
>> kobj_attribute *attr,
>> +                                char *buf)
>> +{
>> +       u32 val = 0;
>> +       int err;
>> +
>> +       err = memory_config_read(kobj,
>> MEMORY_CONFIG_SUBCOMMAND_READ_MAX_FREQUENCY, &val);
>> +       if (err)
>> +               return err;
>> +
>> +       return sysfs_emit(buf, "%u\n", val);
>> +}
>> +
>> +static struct kobj_attribute kobj_attr_cri_max_freq = {
>> +       .attr = { .name = "max_freq", .mode = 0444 },
>> +       .show = cri_max_freq_show,
>> +};
>> +
>> +static ssize_t max_bw_show(struct kobject *kobj, struct
>> kobj_attribute *attr,
>> +                          char *buf)
>> +{
>> +       u32 val = 0;
>> +       int err;
>> +
>> +       err = memory_config_read(kobj,
>> MEMORY_CONFIG_SUBCOMMAND_READ_MAX_BANDWIDTH, &val);
>> +       if (err)
>> +               return err;
>> +
>> +       return sysfs_emit(buf, "%u\n", val);
>> +}
>> +
>> +static struct kobj_attribute kobj_attr_max_bw = {
>> +       .attr = { .name = "max_bw", .mode = 0444 },
>> +       .show = max_bw_show,
>> +};
>> +
>> +static struct attribute *cri_memory_attrs[] = {
>> +       &kobj_attr_cri_max_freq.attr,
>> +       &kobj_attr_max_bw.attr,
>> +       NULL
>> +};
>> +
>> +static const struct attribute_group cri_memory_group_attrs = {
>> +       .attrs = cri_memory_attrs,
>> +};
>> +
>> +static const struct attribute_group *cri_memory_groups[] = {
>> +       &cri_memory_group_attrs,
>> +       NULL
>> +};
>> +
>> +static const struct attribute_group **memory_groups(struct xe_device
>> *xe)
>> +{
>> +       if (xe->info.skip_pcode)
>> +               return NULL;
>> +
>> +       if (xe->info.platform == XE_PVC)
>> +               return pvc_memory_groups;
>> +       if (xe->info.platform == XE_CRESCENTISLAND)
>> +               return cri_memory_groups;
>> +       return NULL;
>> +}
>> +
>>   static void vram_freq_sysfs_fini(void *arg)
>>   {
>>          struct kobject *kobj = arg;
>> +       struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>   
>> -       sysfs_remove_group(kobj, &freq_group_attrs);
>> +       sysfs_remove_groups(kobj, memory_groups(tile_to_xe(tile)));
>>          kobject_put(kobj);
>>   }
>>   
>> @@ -103,17 +196,18 @@ static void vram_freq_sysfs_fini(void *arg)
>>   int xe_vram_config_sysfs_init(struct xe_tile *tile)
>>   {
>>          struct xe_device *xe = tile_to_xe(tile);
>> +       const struct attribute_group **groups = memory_groups(xe);
>>          struct kobject *kobj;
>>          int err;
>>   
>> -       if (xe->info.platform != XE_PVC)
>> +       if (!groups)
>>                  return 0;
>>   
>>          kobj = kobject_create_and_add("memory", tile->sysfs);
>>          if (!kobj)
>>                  return -ENOMEM;
>>   
>> -       err = sysfs_create_group(kobj, &freq_group_attrs);
>> +       err = sysfs_create_groups(kobj, groups);
>>          if (err) {
>>                  kobject_put(kobj);
>>                  return err;
