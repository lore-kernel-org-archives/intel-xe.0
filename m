Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B78C27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 03:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA70B10EC1B;
	Fri, 14 Jun 2024 03:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ez91v04R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EF610EC1B
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 03:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718337558; x=1749873558;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0QdJg18dzBHzQkLwdFJVEBX+QUmF3ql6YM/fnnX7ADw=;
 b=Ez91v04RwRdt7BEnNInkFvh3o5dqmvMiZcvDlXb++Eu4FBDY8TEkant9
 SD5SzBDMgiTHXJShfLQM467fZFYQ2fuJY4v44PBAxz891P/2UsQDwAVDu
 qMhB9IwtxGD8IwYLsDuiMG40z0d4pDTEtWsLMTMVHcLVnusieHyHNMW9m
 +EmIMTs5qfFIrQliWjBp6NH8n0qLrcoAqrkdL5wbr6yQ+bUA0SH6JusVT
 i5fsctdwmaZ9NC8aG7cnu6wno4j8cmSpmgvmc3gMcTwZjC7S7qCL1OqAX
 mjlADmb0tYrzbYnP5lVMx5lmKKXucj37zW5FkMeZjBoZ6IXaz/ChcD9hw w==;
X-CSE-ConnectionGUID: pUQdmeo9SJCHPJDx1/mSdQ==
X-CSE-MsgGUID: 6KVXZbZGTfOjBp9fXzqbgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26325794"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="26325794"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 20:59:18 -0700
X-CSE-ConnectionGUID: 1Gf2P2R+QnuiZcyB2NIvtQ==
X-CSE-MsgGUID: sMwKiwTQSAiF54WaIsmY4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="40509194"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 20:59:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 20:59:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 20:59:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 20:59:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afwVpMQI4NjWU235HZVAUn9juC2ehkwBmml8q7bGzUlPnBRRqmXvzYu08VM1i0ewVFx/Hl5yFGpuJVsR5KARv1RxTMH0Q0rBxu7203qC0t3Y3BdYAZFf8mHUZebb44+x7xB/8S4ny6/Syd9A3fmdiNUGb84Fpd+Cq72Ur9uKSs2XDYEp6juirE0fe7qikyUvybsjXKpqk3JeTK7pEEUFta+8ZXU4SK19s2lE7fJeX8QuJ7c/dZtORe3STYlO2V+6aNJ2YPuSl85DCJsYLKw9/7yEavBmZC0nvXgogvncbu7tumHFWtzpop2miH3kwwCYzONrgCWgES0QGORD0vAEOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZT+OyA0sJXWx2L1JbFS/fSZXZMq/GNeqzX73Dom5xw=;
 b=P/zkNnmFw9C1SXhq9twj2jyQWOmxa1I6QGiRWeqj/wjyIMXRby2yLBor8seh9sh5/GN0nOnQqS7xA0bNhAuoQsOJ9o3HJlnKWSbM/stInNNSvgQwR39qV8h6L9UfshFyzBH6066IAbHo+vLHAn9UPaa9F+FIlW6d3c2CK29WLCqPIYa9oNk6xafZbDiuQy/1rAFLTQhh0SUJ2SE3vD+0c2nXENzj+QWTcT8miU601bmhfT9kwUO3Ysp9Ntjgyk26fHa4LKi6uAyvQk4oP+PByqoxMbeETGtIXT4g9V0In1z12kC6qm2zNzjQ4R+9C7Pf9Fmim2/jolqpl6wXU7x5Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 SA2PR11MB4779.namprd11.prod.outlook.com (2603:10b6:806:11a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.21; Fri, 14 Jun 2024 03:59:15 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 03:59:15 +0000
Message-ID: <6e478df8-a2d4-421c-9c63-49ab2e21c34b@intel.com>
Date: Fri, 14 Jun 2024 09:29:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/xe/hwmon: Remove xe_hwmon_process_reg
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <ashutosh.dixit@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20240523182540.2777895-1-karthik.poosa@intel.com>
 <20240523182540.2777895-2-karthik.poosa@intel.com>
 <2vidvodng6hykwe7bsdf32ew7glhkptmh4k466ylkiucmsxyd7@gvfthfkbzcpw>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <2vidvodng6hykwe7bsdf32ew7glhkptmh4k466ylkiucmsxyd7@gvfthfkbzcpw>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|SA2PR11MB4779:EE_
X-MS-Office365-Filtering-Correlation-Id: e1585258-6ae3-4add-5b24-08dc8c265b55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|376009;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWNjaG1rRHRscy83bnZ6WmM4SFh2UFdUak1xRUJIc2IzVjdCbkx2TEVhcjZP?=
 =?utf-8?B?L2VnSmxERmhFZkdvaTJYVWJOMWFCVk5IRC9tTWJibEp5NjdRT3lsTDd3Si91?=
 =?utf-8?B?M01EL0IydG1FdkYwNzE1VEhZbGxtY2M5NWhjN294RTBEV0dBUG0reXg1aHhF?=
 =?utf-8?B?REE2Y2RQMXFKNitiTHoyd2tNdTB5ZmJqTEdYVXdJTVVmakdoZjBJQWxDZHBK?=
 =?utf-8?B?R0xWaC96bjVKdjBFOXkvaW5zMWlDbmRkRWd1TERhdkJrSndaUFkvZGsrNFZ4?=
 =?utf-8?B?bG1oNHpJTDA4U0hlMDM1ZDliUDhUa1FOZFFIejM1N05ua013RDVaVjBVMnpz?=
 =?utf-8?B?bW5DT2djNWtvNW5NL25nUUc3TUNyRWFsRzdWYVNLb1RKblU3Z0ZRN0dKK1hR?=
 =?utf-8?B?WXFoR3M4bm1tUUlmcFJJeGQyNEFoaHc5amxHdjQ3SlB5WG5Rb1BkRC8vRzVC?=
 =?utf-8?B?ZVJvWEFHdk9sMlZtMndlNnVmSnRRWEtpRGxPMTNCcWlFMm1BTW9qSnRQdE52?=
 =?utf-8?B?SWMxVHBMbkV3elRZR3pBYWxjUXpBOHNIbENuMlhCT0lCRko2UFVXZmMwZ09E?=
 =?utf-8?B?cDVLYVN1MUFQMlV5RWtmd3pQcFpja3U5aWFUbHRVU3V4TU1BSFJXKzB5MXh6?=
 =?utf-8?B?RkVBUWFEVWRjU09yc1RnZU5RcWIxL0pFTW92MXovYk90RWl2Sjk4bGprWmIx?=
 =?utf-8?B?VVlMMGx2eW1vRkNCMk1VaVh5NkxCbUIrOWdTY0lyLzdDNTJHQUNjdWc1TWsr?=
 =?utf-8?B?cEFaY0RrQkRRRTZ5VEU4SXVzRnR0dmZUTk5qM1JnbWRxK2tBa05STmxMSHpj?=
 =?utf-8?B?ZTUrcGdKWk5zRnJmTjROU214eGdFeTJEMFcxcjBxbU9FQXhSa1pWaWtSRThO?=
 =?utf-8?B?NVlpSmsySzMzWVNvSjN4emZhOFRvblYvc3BPWkVndGZ1dTJITkljTzJkRWU4?=
 =?utf-8?B?NS9IQ2xYM2pBV05yWjFSUUNNbEpLdEpLR3FVRVpLVEVtNldxYzJURDYzNy9m?=
 =?utf-8?B?eHVreE5JTkRiV3JJQVc2Zkw3WnpQdEF4RzJ0c1RuTGtoN2NvaDVud09jYkQ3?=
 =?utf-8?B?NFdPNllMcXVEc09GeWZZa3JnZTN4VFpBWUtaWkltMS8xdEh5eStMT2ZWVFZK?=
 =?utf-8?B?WVA0SHZEN1B2MzVRSk9YcnNzR0xqNXpqVWJoamNYMis2dXUvU2RtMVhYbk9l?=
 =?utf-8?B?TUZEZXhLVE1La2pXUTY3b2RJN0RuRlJUL1JSZUwwamQwMUQ0Qlo1ZUl5cUI0?=
 =?utf-8?B?ZU9DazlrYWd6TVBWODdUYlliNEoyeE82aGdqRTJ5c3BGNEhHNGY2WmY4TDB3?=
 =?utf-8?B?dkhVSE5HcWpSOWlGa1JQZ1hUMkhiOU9rRkVyeDN2RHFwNEhjUHNuVm1FSzE3?=
 =?utf-8?B?WDVXYytlQzRQQmNEOC8rbzdhM2NsR1NpUjFVQWpkTWVRUktXQTZLVW50QmNS?=
 =?utf-8?B?L2NwbHBISENBc2crdzNsLzZjZjR1Y25Fd0phak1JQm53cHJ0TFpMbmRoRHVB?=
 =?utf-8?B?SmpUN1ZEeEVwVTJGdEpQaUZCRkgxcjNSeGtkYThNblM3Sk02UmJ5cExlQ2RJ?=
 =?utf-8?B?YkhNOW40MXNQNU4zQkFoYjNHUjJscm9HdTIzSmhCSGVUU3dTYnBHei9kWlU2?=
 =?utf-8?B?WnN4RW8zSmVWVXErOEpnZ1dKQkxVbCs0aUNnS0k5T25JU1gycHZRYkRKcGNJ?=
 =?utf-8?B?endHTFBMK0tHMHFidi9JTzBxY2pJcXcya0J4NzRDVE9ueGR1Rk1QM3VYVmVy?=
 =?utf-8?Q?ZqJnaamBA4stwekqGpb6piRek797BEYmB7dFRwg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(1800799019)(366011)(376009); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk9QcVBtWFpIaEo4K3hPZURrbTQxbHBqZ0Y1YjZCNStUSWVYN2pSZDhWS2pn?=
 =?utf-8?B?V1J6eVhURStCakNYTVBxUFRrYm1pWnhRMWdPUHdKR2htVmhOZkt1aHV3dlMr?=
 =?utf-8?B?dEU0WWxuT1ZyWTZiUGpvZE14cXdrcjVFM2ZJb3RGOUFUVW9YNTIzbEtkcENY?=
 =?utf-8?B?NEI3UzlTZUlsd252RExsQUlmRDFnY0RHOW9oSDF2WkwwbWtBQXc4Q3hTaDVt?=
 =?utf-8?B?OEVCTmtYdHFZVG50UUQyTUloMWhLaTJsUXUwakJ6U1l6R05NV1dIZ1Azb3o2?=
 =?utf-8?B?WW52ZmRRNTI0OGpubmJvemM4K1dYNUdlZHRxTHdMVUNWV2lJa2JLRmZVRVZr?=
 =?utf-8?B?Y0JMSGVieUtTL2tJMGtReDlVZmxEblBFZEQwd25KWlVDWjZCeGNCWFExcjVV?=
 =?utf-8?B?ZVdxSmo1SjFUU25NNFpqbmN1aGp3b0d5OUVteXZGRXZzOW9MTm84QW5TeUdk?=
 =?utf-8?B?NGFWa0hCN08wWjgyajdsa2ZMVjRxN3BwZ2dyYXYwaG1UM1JhVWxFK25rZHda?=
 =?utf-8?B?aUpMU2lOSGdQNW8vM1hMS1pMblBQV0xsdnRiSlFIaUsrcXBCVmZqWEU3K05G?=
 =?utf-8?B?RWVnMEpMYzdYandJMTBJMTlqWVgyc0c5WTJSb0RjRjlSeUNxbEdHdGYzNUtp?=
 =?utf-8?B?OGpwVlppZ0pKZ0RIVDZZc0ZVWk1IOFdxVFhDSytaeGVERWhRTnk4WHQzcjNW?=
 =?utf-8?B?RGQ5bDQ5cEF3K1hMUzVGVTRQVktONXp0TWFoSDN5L2NzRmM1NFJpc21pQk9L?=
 =?utf-8?B?ZUR0bERmZXhZU2Q4YmUzU3BIMEJDM2JQKy9mVmNiQ3ZPTmZialc5VDVsUXFN?=
 =?utf-8?B?VTFqUkhjSTVValNXbUFMZElJcHY3ajdxVXBTMW91cFloNTNqVGQ2akVZTlJk?=
 =?utf-8?B?ZVpNRC91STZGaldhUUR5b0tValpOekRYUEh4TXQ3bHNRelQ0c3ZoeUxXcDBU?=
 =?utf-8?B?OHlsb2RVQ1lsdk1DMFNZc3RieE1jMjE1cEpXL0I1cTNPQ2Y2d1IvcWFYMHZK?=
 =?utf-8?B?RVhha1UzeDlHVkl5OUxxRlFzNXpqYTdDQzY2ZldVVEFCeDVDc2VLbjFWWERm?=
 =?utf-8?B?bHg0akh2QUh2TDMySGZudk40RUtpdW4wbkZWU3lYUlJlRVBhNWZmOEZicGFP?=
 =?utf-8?B?WWJIM0prTlhHdTd0NHdXNmxiQnN0NGRtek4xWVFWcUhQREo2N2poSCtsbXRN?=
 =?utf-8?B?U2JHMmdLM05lcjZkclN6RktzcU9hUkNLM0cyb1lsTTNuM1p1Z1hpY3VPNTNo?=
 =?utf-8?B?dHZIeHFKdytjRW1HT2tiTXZqemprcUp5aW11c0lKNVRCRTcwUEdQR2h6cjFq?=
 =?utf-8?B?TVNKRjNQZHBQNmNzQ2Nxa2xsN2xaWEViWFU3YmlleFl0Nk1xS0JoZG9JUlZi?=
 =?utf-8?B?cHR1RE53Y25kTkFXWS9aVFhhcnR2QndsMzVPT2lXekp2dWRtNk1KK29KKzMx?=
 =?utf-8?B?amRBMkYyMnh3YllGc055SC9pbU5CdzlZRGtBQ01TTlZqL0JGZUgyVWNvR0lT?=
 =?utf-8?B?TUxmaGNtbE1qV3ZIc2plU1ZOQndVZDMxb3N0NllEeVdRdnlmcVU5WFZhV1My?=
 =?utf-8?B?T0lMbFBOSE1IQXNvN1MxRTlEQ2NyajB1OGpkZUNLdHk0V0ZnenVqdGFFWEh3?=
 =?utf-8?B?SUVKNVVNSTFxTGZWK2xFWVJ1M3JZblhzcFhJc2xpbmpnMDhuM0dLSGV4cmpG?=
 =?utf-8?B?UkRKYzBEWjYxWWkzUEtJVHV1Q2cxUmdLQW5xK3BuMjFIblR3SGh5TWdzdUcv?=
 =?utf-8?B?MEdFUDNOS1BHYkFvK3o4WVR2Q3cwSHpJYVhPcHBVNHhBUG4xQnpzQjg2L290?=
 =?utf-8?B?bUlFMCtXSDJibDBSNHNVUnNpUGF2aWxGUjU2ZHN0WUhzeS9CZXBFdHpEUDU4?=
 =?utf-8?B?MTdBY05UdCtTMFhvZ3NsL1o5WitMSUp3bmtQRDVUWDJnZVYrN3huR0lPa25Y?=
 =?utf-8?B?S2pFQTNaTUd2R2VwVlV4dm5nSzRvY01sNmpqeFljQ0hkQVhIaWVVU0VDSElZ?=
 =?utf-8?B?QjJFQnFLRTlwMHZJRzNzS2s2dUNFMjdpblE1TWdTQlVLSWExRGVCdS9wSzNB?=
 =?utf-8?B?RFp4TzRqYlpUVVRpTko0ZWo0bVFvWHJmRjVXZzNxbUlrcWVOUm16ekFGK0ZV?=
 =?utf-8?B?bk52ckg0aURjaWR0ekE2bHl5NmZjYzNvbjFDREx0QWd3RDI3NkNrS3VlNHI0?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1585258-6ae3-4add-5b24-08dc8c265b55
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 03:59:15.1935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DcZsPlM7AqY7feZ9usueAG5fhvfh4hW632p9H/KX2ATI4z3xtFNTWXULLRBkS/PV99CTOIG5r9acG6XcihYNIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4779
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


On 07-06-2024 23:15, Lucas De Marchi wrote:
> On Thu, May 23, 2024 at 11:55:40PM GMT, Karthik Poosa wrote:
>> Remove xe_hwmon_process_reg as it is a umbrella function which can be
>> avoided (Lucas).
>>
>> v2: Improve commit message (Badal).
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_hwmon.c | 80 ++++++++++++++---------------------
>> 1 file changed, 31 insertions(+), 49 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index dca275117232..4d8ee9cac068 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -121,34 +121,6 @@ static struct xe_reg xe_hwmon_get_reg(struct 
>> xe_hwmon *hwmon, enum xe_hwmon_reg
>>     return XE_REG(0);
>> }
>>
>> -static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum 
>> xe_hwmon_reg hwmon_reg,
>> -                 enum xe_hwmon_reg_operation operation, u64 *value,
>> -                 u32 clr, u32 set, int channel)
>> -{
>> -    struct xe_reg reg;
>> -
>> -    reg = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
>> -
>> -    if (!xe_reg_is_valid(reg))
>> -        return;
>> -
>> -    switch (operation) {
>> -    case REG_READ32:
>> -        *value = xe_mmio_read32(hwmon->gt, reg);
>> -        break;
>> -    case REG_RMW32:
>> -        *value = xe_mmio_rmw32(hwmon->gt, reg, clr, set);
>> -        break;
>> -    case REG_READ64:
>> -        *value = xe_mmio_read64_2x32(hwmon->gt, reg);
>> -        break;
>> -    default:
>> -        drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon reg 
>> operation: %d\n",
>> -             operation);
>> -        break;
>> -    }
>> -}
>> -
>> #define PL1_DISABLE 0
>>
>> /*
>> @@ -160,10 +132,21 @@ static void xe_hwmon_process_reg(struct 
>> xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
>> static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int 
>> channel, long *value)
>> {
>>     u64 reg_val, min, max;
>> +    struct xe_device *xe = gt_to_xe(hwmon->gt);
>> +    struct xe_reg rapl_limit, pkg_power_sku;
>> +
>> +    rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>> +    pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, 
>> channel);
>> +
>> +    if (!xe_reg_is_valid(pkg_power_sku)) {
>
> shouldn´t you also check validity of REG_PKG_RAPL_LIMIT?
this is already checked in xe_hwmon_power_is_visible and 
xe_hwmon_attributes_visible.
>
>> +        drm_warn(&xe->drm, "pkg_power_sku invalid\n");
>> +        *value = 0;
>> +        return;
>> +    }
>>
>>     mutex_lock(&hwmon->hwmon_lock);
>>
>> -    xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, 
>> &reg_val, 0, 0, channel);
>> +    reg_val = xe_mmio_read32(hwmon->gt, rapl_limit);
>>     /* Check if PL1 limit is disabled */
>>     if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>>         *value = PL1_DISABLE;
>> @@ -173,7 +156,7 @@ static void xe_hwmon_power_max_read(struct 
>> xe_hwmon *hwmon, int channel, long *v
>>     reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
>>     *value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>>
>> -    xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ64, 
>> &reg_val, 0, 0, channel);
>> +    reg_val = xe_mmio_read64_2x32(hwmon->gt, pkg_power_sku);
>>     min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
>>     min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
>>     max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
>> @@ -189,16 +172,16 @@ static int xe_hwmon_power_max_write(struct 
>> xe_hwmon *hwmon, int channel, long va
>> {
>>     int ret = 0;
>>     u64 reg_val;
>> +    struct xe_reg rapl_limit;
>> +
>> +    rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>>
>>     mutex_lock(&hwmon->hwmon_lock);
>>
>>     /* Disable PL1 limit and verify, as limit cannot be disabled on 
>> all platforms */
>>     if (value == PL1_DISABLE) {
>> -        xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, 
>> &reg_val,
>> -                     PKG_PWR_LIM_1_EN, 0, channel);
>> -        xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, 
>> &reg_val,
>> -                     PKG_PWR_LIM_1_EN, 0, channel);
>> -
>> +        reg_val = xe_mmio_rmw32(hwmon->gt, rapl_limit, 
>> PKG_PWR_LIM_1_EN, 0);
>> +        reg_val = xe_mmio_read32(hwmon->gt, rapl_limit);
>>         if (reg_val & PKG_PWR_LIM_1_EN) {
>>             ret = -EOPNOTSUPP;
>>             goto unlock;
>> @@ -208,9 +191,8 @@ static int xe_hwmon_power_max_write(struct 
>> xe_hwmon *hwmon, int channel, long va
>>     /* Computation in 64-bits to avoid overflow. Round to nearest. */
>>     reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << 
>> hwmon->scl_shift_power, SF_POWER);
>>     reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
>> +    reg_val = xe_mmio_rmw32(hwmon->gt, rapl_limit, PKG_PWR_LIM_1_EN 
>> | PKG_PWR_LIM_1, reg_val);
>>
>> -    xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, 
>> &reg_val,
>> -                 PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val, channel);
>> unlock:
>>     mutex_unlock(&hwmon->hwmon_lock);
>>     return ret;
>> @@ -220,7 +202,8 @@ static void xe_hwmon_power_rated_max_read(struct 
>> xe_hwmon *hwmon, int channel, l
>> {
>>     u64 reg_val;
>>
>> -    xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ32, 
>> &reg_val, 0, 0, channel);
>> +    /* REG_PKG_POWER_SKU validity is checked in visible, we need not 
>> check again here */
>> +    reg_val = xe_mmio_read32(hwmon->gt, xe_hwmon_get_reg(hwmon, 
>> REG_PKG_POWER_SKU, channel));
>
> what do you mean by "is checked in visible"? Is this about the visible()
it is checked in xe_hwmon_power_is_visible and xe_hwmon_attributes_visible
> op? Maybe a better comment would be:
>
>     /*
>      * This sysfs file won't be visible if REG_PKG_POWER_SKU is
>      * invalid so the check can be skipped. See <function name doing
>      * the check>
>      */
>
> in any case, I think it's clearer to move the get_reg() outside and have
> something like:
>
sure will change this.
>     struct xe_reg reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, 
> channel);
>     u64 reg_val;
>
>     reg_val = xe_mmio_read32(hwmon->gt, reg);
>     reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
>     *value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>
> rest looks good and those things above are more nits than anything.
> If you are going to change, then respin once more. In any case:
>
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>
> thanks
> Lucas De Marchi
