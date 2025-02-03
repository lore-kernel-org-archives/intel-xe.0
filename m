Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7C8C02190
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 05:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3444B10E1B9;
	Mon,  3 Feb 2025 05:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I4jun/Px";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D8A10E220
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 05:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738560413; x=1770096413;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R43+MBkJTDfI5UQ2CXWE9rqEJdTzHbymkLqI0Cgt118=;
 b=I4jun/PxPNbG0TblBOf8vA6st6VyEJbSF/cAM5/uMtoWmDY3DVKBN1tp
 oo8WaSUNedV0d+edqJPTeVO1s1xV1l4pqX16bC30jXqCGqb+Kx/qpmdwU
 Mx8Qs1rTFupPpZmTBnCdehm+9oHWwRgT5Dkoyq3/cG2iOuPt8QPUnLgIn
 zWugH9txQcgZh2axlTvhKnA1PxsofjC5926E0Hg+rE2el2g7zhMowpmqK
 9C0KDCzbY0Apaw13LXhGIfPT3nZb4jLg1vuX5XL5RQcR+D8jdrXB78Naj
 5KMugBE0VwjlMKOmjmnmAIoI0n02ER4nPjm+v5BKrCKx+v/ZAAmApmKMz w==;
X-CSE-ConnectionGUID: JMdK5NGCRc28JJlSbWkKLw==
X-CSE-MsgGUID: cyfoI9cnQSyIFCNnxki+Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="61515218"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="61515218"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 21:26:53 -0800
X-CSE-ConnectionGUID: dkzuUfWKQfCBM0vjqAmC2Q==
X-CSE-MsgGUID: PZcru9n1RJudhPp8/31AGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114818460"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2025 21:26:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Feb 2025 21:26:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 2 Feb 2025 21:26:53 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Feb 2025 21:26:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPYj1dMAW7cK8KY/nfu2lBlcangiWQTQDwqxN54VTfiozm7vGPLrQ4ADUChaXWoNXrUAmRQU5qKAmkbOf8KVNZt/6vFIwQuI/kl7jdYn/1S6nW5B+rr7Q21zFpCBmT5SHB5Bq2LuqyXBiXYmAsbRQOQjiEKiCCMOgHRV5jj4ejrfCORoZj7OIXksZr+6h2iCUJWxbCGrzzwgQGqfSdo4SNlhZ25DvZi1Rik2jxgpRGacMYeB/98Az25G9rIgl97Oeum4aSqjxD8M2YtS6ga2ICMSuxuYYO36xnrlss/r8wf9d1d4y5n95UyFIxa20caCuE47v2IcuTKe5JA0sINvhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICC5PoJkwCU/PNTJ9VDV/KGtm0YQZwYo44rIYj4vhbY=;
 b=rXcUV8zeJCuGbHkIV4zy/CR8e7jPl1U62iO6/FSNP0vFCA8GiVVOCaOzVPkzRCSUHUZnUuuhSTvADlFzqoo+HrQeTVoqO+WQu/DTVkuluy48wxYAZCwUQS/T63uQk0l15/jO+xt+JSo6MpZSBqOdnKMfeNfKDBt9zBDpZ2XRZjza42HMf/BXMLZOjskVMxgA5bliffJ76fXeooVLVkxHZB5oNVqn8ujrdPhv481RkOtOFBYuN28gkdzGdQOP25+lwlj8O+2gGNQYeeGlHsccGjp7BWzbxc2M8YunMeXJCwtgGTwKUVvPpBlE/tpx6KplcpPKkdEwFpsownm5oim15g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB5055.namprd11.prod.outlook.com (2603:10b6:a03:2d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 05:26:10 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 05:26:09 +0000
Message-ID: <df3dc547-8740-45f2-85bb-2c6e889440b0@intel.com>
Date: Mon, 3 Feb 2025 10:56:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] drm/xe: Add support for per-function engine
 activity
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-7-riana.tauro@intel.com>
 <Z51iK9NZ6YDi4YTb@orsosgc001>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z51iK9NZ6YDi4YTb@orsosgc001>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB5055:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c597e32-32fe-45b7-6754-08dd4413444d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmtrVUZOVUt1WUUrTm44eHVTdjdOVHdTTFFhRVFEUlU0R3hlcU5OQUFmTC9Q?=
 =?utf-8?B?S3NqN0tieVJ4akovck44dmFCdXp4bVRINmU3dE11UzhFdDZ2MFU1UzdHVEdO?=
 =?utf-8?B?UjdCSHlod0kzbVQreUVVZEdhMnJwMDZHTXB3cGdZb3lCaDkwOTFtTzFob0Ix?=
 =?utf-8?B?M3JtVmxoNDhWVkdVUnVqZnA4blFtbTJicjRqWmVSQXhtcjhka3czRGxIZElO?=
 =?utf-8?B?R2kxWTBxMThKVW4vYzlpUktOOEpKUjdqT3Q5VlFGRitVOHVBL3Ayb2VKQk1x?=
 =?utf-8?B?MjZKc01jMHlrRkhPeEdyRm00UGRlM3YwRkZubW9XKzhuaUE1VFpxUUdjczdG?=
 =?utf-8?B?ZVlwS3ZmQjlXVTZreFRUcTRyWHQ1TWRtSVA4T1MvSlZRdTczS3dIWjZRZTZv?=
 =?utf-8?B?VkJPb2VOVUtsS0NZYWRQUERNNUpXb0FmLzNSWkh0Z3lxdHd4YVpNdWpTT0lT?=
 =?utf-8?B?T1dzUUZXVUtFQ0Y2UGRuL25uTU5iZXJLdEtvWHJPNWhNK1pZTGdZbzZsNGg5?=
 =?utf-8?B?ZmRkR0xtWkxTUWFjVHA2UzV5K1RKS2cwWm1DVUpkd3Z5aDVKYzVFYm1aK29Q?=
 =?utf-8?B?eFFqN0g3bHJrOHRxQ0xLN1o2ZTBmc3NsRUFodTV4SXNwMGJiK2JWeFBsekpw?=
 =?utf-8?B?SHNrb3FpTE50OWxPMXRVY3lqbEsvbVNOT1dGZHZoTWMydlI3OVZaYTF3SGtp?=
 =?utf-8?B?OXUxWFMvbXFJRFRIczNYdGhDK0d4UXFZT2JBNE5BaUh0eUFmV2JlVEdpdlRy?=
 =?utf-8?B?ekNmcGRxSVUzdGpJRWp0RWVXWXJnaXlTZEIzWXlzWFVlRW5EZlZxRlJTRit0?=
 =?utf-8?B?SUMva0daNEdmc0cwWGlPZHVRK1ExWHFiYUlmSFRpdEtPRGFQVTlWZ21SN1Q2?=
 =?utf-8?B?bm42VE9wQXgyOVJUMkplNVRIVk44NFQrckVUOGFNTllvSHh4UnAvRWd0L293?=
 =?utf-8?B?LzlWRWxUR0xrV0xyTmZmNHY0djhNbFQxQzNzU3hnRkdVaU9JeUhMSW1WZU5R?=
 =?utf-8?B?V081WDNwN3hubnVldkl6Y1pUZlZkdFIzRG1KVmhQUS9sNklFR1gvQ3FEZXVZ?=
 =?utf-8?B?MUFmaHZ5b1dsQmRYeEZ3bDdMSzQ2NFh5WEhXZ2NHZUtxOEFxY09Sd1NxcENT?=
 =?utf-8?B?QmZobXZydyt6MnVsYkVqUTJVR2RVeVNhME15SG41T01nT0swdDZmUGlwbXB2?=
 =?utf-8?B?WkZDbnJ4a3J6MGl5dCtFdXo2bTlFSTVLZjNsRzBXY0ZzVFZuVnpUUFpkM0du?=
 =?utf-8?B?OFg3NlN6L2FQZmVDWGhHYnlBTmlnMTA4ZWtMbS95RUJzdktlRThrNjdYVEl1?=
 =?utf-8?B?UDdJaWVnVnVuMHpsdmpMYXovUmdvT3Vkd3F6aEhKaTNTeUF5Ukd1eGJOVVh1?=
 =?utf-8?B?UmtsRG45a3F6TlZnbzhOamdLNWQwSDNoYlNkRGlZYTJxL1FXd0M0VVJVRDVZ?=
 =?utf-8?B?eTlaMjVjT3FtaEFzYzQwWElYcEhiQ0lRVU1Wd096THhacks5QlI1VEUzTk8y?=
 =?utf-8?B?d0YrbzN6OWQ2VGRMb1ZhbzNwSUw3WVlZYmloZExVd3kvQ3ZtQjFzWnVUVnRz?=
 =?utf-8?B?aXdjbDkyWTM1SDJYZmpCdDBCaDdLUnJHZENsRnlBeTl2a2RHR3Z6VldCNjB6?=
 =?utf-8?B?NTRVYWZDTkQzejNrdTBBNzlXTkx5dnU4bnVmTUZDdTRDQ3FqeFVWT1pOWGY0?=
 =?utf-8?B?TW5VdnFaYVZPY2dJWWYzUUh4cWpVVWthUVFDd0h5aWZqZ0VpQmhMczY5NTcr?=
 =?utf-8?B?Z29Zd1RCZ1NwOFMvUUkrQzFYK1YxM2gxczFPcTE3RlpPaWl2aW52cnkwNGJC?=
 =?utf-8?B?dHA5bXo1bXk4MldWTm5ENjhreHlMUzNMNUcyeGZDVEJDOFVIZVNXOVVtc21G?=
 =?utf-8?Q?AMtV3qCgEBHfG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXF6UWJuMWJQYkJ1ZGoweXhPOFhjMzZwOTVDRktVTlNvY1BkbFRjWWVlYWVt?=
 =?utf-8?B?WHMrSy9zelczQTI3TWZoSkRzbS95YUZqT1dBSHhCbklGd2JKUUltZGFXd0JN?=
 =?utf-8?B?MUQ1ajhrMlQ0MlQ0Z2s4VlB6b3N6U2RETVhXVUNSR0RMcDNsc0NaYmdJdTlv?=
 =?utf-8?B?RFNpUjNEWStjbzVkYnRWMU05RVJqQnJ4RmtkUjZLVlRYalkrV0pDUDhNV0Iw?=
 =?utf-8?B?eEE2dE12VTdxWWRmNkFWUTZxMCtoa2lWM2pScXhVaG5ELzI4NGFFMHk5SXY3?=
 =?utf-8?B?Y0EvYW14VzNuamZkQjUwTDVQa0E3dlg2MjB1emNGS2VDSDVSRi8ybm00ZzVa?=
 =?utf-8?B?aGhXUEQrZy92eWQ4LzcwT2xCbVoxK01qaEFmVGszOUVia0ZkUmFXZ2tLNnJh?=
 =?utf-8?B?R2tvY1VDWWxlQldwQm5iUDFMNk1hUnJHa2V0MlM5UDY5NlhvZnR5TVZsUEFP?=
 =?utf-8?B?Z1Npc2RHRkRpUGRhUDA5N3dsTWNOS3ArQmRkRzJ2Tk43U0d1cVNBWkU3R2Ry?=
 =?utf-8?B?cWRLd3ZwQzNJNmcrWUEzVndwS1Jwak5kV0tKR3BCdWRuajVSWS9YZFc2MzlC?=
 =?utf-8?B?NjE2aEdxcTFnZ0dqdTNqeXkvaTNSbGZLTlN4akd4ZkJZOWxJRkJrbmNBcFBW?=
 =?utf-8?B?WFQ2TGhmUmFpUk4zNXNSVUNmekRTUHY0WGgzVEdQVzFxaThLRVRDSnY4UG9h?=
 =?utf-8?B?WU9KU3BGc3AxVjdqdmdSMTRKdS9jTGQ4UWMrZW12TjBFUjhIbks4c1NJMHpC?=
 =?utf-8?B?VkxDWGhwNmZmNk9OSzl5VWxPTGZVUi9zQWROZHB4RVlYcEV1K2lSSXdKclNS?=
 =?utf-8?B?dHVIRDhzWE9pUmwwSHQwbkxQTGE4REl4dEF3a2Vweng3VkFnUHpib0dycGMw?=
 =?utf-8?B?RGFIVlBPYXZYaUlZcjlnU01mOVRiUVlncUlHaitjbzRFSS9SNkRLVTFzWWF2?=
 =?utf-8?B?RjJrSWp2cWVBSmFtY0J3bUs5ZFlrQWxBR0VXM3dWNGFXbldtMXhKVEdCL0ZD?=
 =?utf-8?B?a0JkSFlsQVlOSkkrYVRoZlVkMDJOeE81bit3WXcyMEVZdjRWSitib0tMdjJP?=
 =?utf-8?B?MlN6UFJSeVNHcTk0bEVjbmNoMnMrL0ZPamkzVW1iZm13UzNHV25RQ0R2bXJX?=
 =?utf-8?B?SEpqdlBKcm5nQlJVTm1haEpoRngyMnBSaWcrc3dQOGUyU1RxcE9nUGp6TVJv?=
 =?utf-8?B?Q0lFdERoN2lQbHU2UmRVZWhkWEdIdlYxSkF1UlZIWWgzbzN3V2lTa3UyOXRS?=
 =?utf-8?B?dTBCL0k3WjFkZ1o3R21NR2luWnJRL2FZbzVmeU1zZVdLWnVJK2pVVFdtWGU4?=
 =?utf-8?B?RkZBSEFvSm1XalRkdkdkbGZkQnR2cEYzYnBJUDUxa0FRRTR4eFZ5L1VsT3ha?=
 =?utf-8?B?cHM4aW00T2JBT3lpd3hsdVBHK2RNbW9LNUZHUi9FNHdzTFhTUERKNkhFYWNj?=
 =?utf-8?B?VlNXTGYrQzY4VGZndGZBMDJYRXE2NDNsYUFjdXhYUmlFbVhHaFdQT0RnRURL?=
 =?utf-8?B?Uno4bkkzSVhyWVFyVlZKSVJYdFNCNmVtS2pFSFpOdGx1emRoMHJta296SVdP?=
 =?utf-8?B?Rm5yNzd3UDk0Y3lHSTVRMjBRVGZSSFRjZmdnRHE4OFpOSVhVV1RNQ2hxdDVn?=
 =?utf-8?B?U05SSXJrZ0VqMHVWVGV6QkdYcmFSLzR3MUdDRjJYZWEyUkZhNXlXNUx2TG56?=
 =?utf-8?B?cVV2eEREMDBTclVLNG5qWDAxMlEzVTVpZERyRmtmOTRSWlZ1aEtFcmdkaGdV?=
 =?utf-8?B?cXJXbEFEMjNZZytIbXVoLzVhYkU3dlpzUE9GWG9CRUwxMWUzU2MvcEt2L2hw?=
 =?utf-8?B?VWduWUdZSzhZZFVhaWVFS3ZEREQ5RG81emk0RDRYcTNZdnlXWnVuL1NjVzhK?=
 =?utf-8?B?TnRWMld5RUE0OUdQU1lQb1JiaFNUTTBKTUg3Wms5dDh3S3JjeFN4ckE2ckFY?=
 =?utf-8?B?MWloRzU3dGdGZnVpSGJoLzFnVjA3cEpmUWhHcHQ1SW9la2hiNjA0ekxlbUxX?=
 =?utf-8?B?RkovS09qaERBS2RCRzFiMEw2S2xuK0dscVhVY01HN3N1NEFQelBPWFdkKzVP?=
 =?utf-8?B?Z0txT2M5clhpdmppdkhOdEgrM0Y3VmVQR0w1dHRCQWxHdUhrWGt6VndsUG51?=
 =?utf-8?Q?TXjiYV31GlnK9xUcE0m1FkX5L?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c597e32-32fe-45b7-6754-08dd4413444d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 05:26:09.8691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtTtvv37cIhpwGIdCnzgDBuCDRwWxzKXTvryNn+AbSxNZG3bgpD7ZWkst3pvKBdONPxMV3JWUBVYN4Wf0F4edQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5055
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

Hi Umesh

Thank you for the review comments

On 2/1/2025 5:22 AM, Umesh Nerlige Ramappa wrote:
> On Wed, Jan 29, 2025 at 03:46:49PM +0530, Riana Tauro wrote:
>> Add support for function level per-engine-class activity stats.
>> This is enabled when sriov_numvfs is set and disabled when vf's
>> are disabled.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
>> drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 200 +++++++++++++++---
>> drivers/gpu/drm/xe/xe_guc_engine_activity.h   |   5 +-
>> .../gpu/drm/xe/xe_guc_engine_activity_types.h |   8 +-
>> drivers/gpu/drm/xe/xe_pmu.c                   |   4 +-
>> 5 files changed, 186 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/ 
>> drm/xe/abi/guc_actions_abi.h
>> index ec516e838ee8..448afb86e05c 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -141,6 +141,7 @@ enum xe_guc_action {
>>     XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>     XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>>     XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>> +    XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER = 0x550D,
>>     XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>>     XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>>     XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/ 
>> gpu/drm/xe/xe_guc_engine_activity.c
>> index 4d720afd12ac..0ab716a58d5c 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>> @@ -15,35 +15,61 @@
>> #include "xe_hw_engine.h"
>> #include "xe_map.h"
>> #include "xe_mmio.h"
>> +#include "xe_sriov_pf_helpers.h"
>> #include "xe_trace_guc.h"
>>
>> #define TOTAL_QUANTA 0x8000
>>
>> -static struct iosys_map engine_activity_map(struct xe_guc *guc, 
>> struct xe_hw_engine *hwe)
>> +static struct iosys_map engine_activity_map(struct xe_guc *guc, 
>> struct xe_hw_engine *hwe,
>> +                        unsigned int index)
>> {
>>     struct xe_guc_engine_activity *engine_activity = &guc- 
>> >engine_activity;
>>     struct engine_activity_buffer *buffer = &engine_activity- 
>> >device_buffer;
> You can drop the initialization here since it is being set below.
yeah missed to do this. will fix it
> 
>>     u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>     size_t offset = 0;
> For readability, you could set offset = 0 in the else part instead of here.
okay will add it below
>>
>> -    offset = offsetof(struct guc_engine_activity_data,
>> +    if (index) {
>> +        buffer = &engine_activity->function_buffer;
>> +        offset = sizeof(struct guc_engine_activity_data) * (index - 1);
>> +    } else {
>> +        buffer = &engine_activity->device_buffer;
>> +    }
>> +
>> +    offset += offsetof(struct guc_engine_activity_data,
>>               engine_activity[guc_class][hwe->logical_instance]);
>>
>>     return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
>> }
>>
>> -static struct iosys_map engine_metadata_map(struct xe_guc *guc)
>> +static struct iosys_map engine_metadata_map(struct xe_guc *guc,
>> +                        unsigned int index)
>> {
>>     struct xe_guc_engine_activity *engine_activity = &guc- 
>> >engine_activity;
>> -    struct engine_activity_buffer *buffer = &engine_activity- 
>> >device_buffer;
>> +    struct engine_activity_buffer *buffer;
>> +    size_t offset = 0;
> Same here ^
> 
>> +
>> +    if (index) {
>> +        buffer = &engine_activity->function_buffer;
>> +        offset = sizeof(struct guc_engine_activity_metadata) * (index 
>> - 1);
>> +    } else {
>> +        buffer = &engine_activity->device_buffer;
>> +    }
>>
>> -    return buffer->metadata_bo->vmap;
>> +    return IOSYS_MAP_INIT_OFFSET(&buffer->metadata_bo->vmap, offset);
>> }
>>
>> static int allocate_engine_activity_group(struct xe_guc *guc)
>> {
>>     struct xe_guc_engine_activity *engine_activity = &guc- 
>> >engine_activity;
>> -    u32 num_activity_group = 1;
>> +    struct xe_device *xe = guc_to_xe(guc);
>> +    u32 num_activity_group;
>> +
>> +    /*
>> +     * Two additional activity groups are allocated one for global
>> +     * and one for PF engine activity when SRIOV is enabled
>> +     */
>> +    num_activity_group = IS_SRIOV_PF(xe) ? 
>> xe_sriov_pf_get_totalvfs(xe) + 2 : 1;
>> +
>>
>>     engine_activity->eag = kmalloc_array(num_activity_group,
>>                          sizeof(struct engine_activity_group),
>> @@ -59,10 +85,11 @@ static int allocate_engine_activity_group(struct 
>> xe_guc *guc)
>> }
>>
>> static int allocate_engine_activity_buffers(struct xe_guc *guc,
>> -                        struct engine_activity_buffer *buffer)
>> +                        struct engine_activity_buffer *buffer,
>> +                        int count)
>> {
>> -    u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
>> -    u32 size = sizeof(struct guc_engine_activity_data);
>> +    u32 metadata_size = sizeof(struct guc_engine_activity_metadata) * 
>> count;
>> +    u32 size = sizeof(struct guc_engine_activity_data) * count;
>>     struct xe_gt *gt = guc_to_gt(guc);
>>     struct xe_tile *tile = gt_to_tile(gt);
>>     struct xe_bo *bo, *metadata_bo;
>> @@ -89,10 +116,17 @@ static int 
>> allocate_engine_activity_buffers(struct xe_guc *guc,
>>     return 0;
>> }
>>
>> -static struct engine_activity *hw_engine_to_engine_activity(struct 
>> xe_hw_engine *hwe)
>> +static void free_engine_activity_buffers(struct 
>> engine_activity_buffer *buffer)
>> +{
>> +    xe_bo_unpin_map_no_vm(buffer->metadata_bo);
> +    xe_bo_unpin_map_no_vm(buffer->activity_bo);
>> +}
>> +
>> +static struct engine_activity *hw_engine_to_engine_activity(struct 
>> xe_hw_engine *hwe,
>> +                                unsigned int index)
>> {
>>     struct xe_guc *guc = &hwe->gt->uc.guc;
>> -    struct engine_activity_group *eag = &guc->engine_activity.eag[0];
>> +    struct engine_activity_group *eag = &guc- 
>> >engine_activity.eag[index];
>>     u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>
>>     return &eag->engine[guc_class][hwe->logical_instance];
>> @@ -109,9 +143,10 @@ static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 
>> freq)
>> #define read_metadata_record(xe_, map_, field_) \
>>     xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity_metadata, 
>> field_)
>>
>> -static u64 get_engine_active_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe)
>> +static u64 get_engine_active_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe,
>> +                   unsigned int index)
>> {
>> -    struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>> +    struct engine_activity *ea = hw_engine_to_engine_activity(hwe, 
>> index);
>>     struct guc_engine_activity *cached_activity = &ea->activity;
>>     struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>>     struct xe_guc_engine_activity *engine_activity = &guc- 
>> >engine_activity;
>> @@ -122,8 +157,8 @@ static u64 get_engine_active_ticks(struct xe_guc 
>> *guc, struct xe_hw_engine *hwe)
>>     u64 active_ticks, gpm_ts;
>>     u16 change_num;
>>
>> -    activity_map = engine_activity_map(guc, hwe);
>> -    metadata_map = engine_metadata_map(guc);
>> +    activity_map = engine_activity_map(guc, hwe, index);
>> +    metadata_map = engine_metadata_map(guc, index);
>>     global_change_num = read_metadata_record(xe, &metadata_map, 
>> global_change_num);
>>
>>     /* GuC has not initialized activity data yet, return 0 */
>> @@ -166,9 +201,9 @@ static u64 get_engine_active_ticks(struct xe_guc 
>> *guc, struct xe_hw_engine *hwe)
>>     return ea->total + ea->active;
>> }
>>
>> -static u64 get_engine_total_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe)
>> +static u64 get_engine_total_ticks(struct xe_guc *guc, struct 
>> xe_hw_engine *hwe, unsigned int index)
>> {
>> -    struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>> +    struct engine_activity *ea = hw_engine_to_engine_activity(hwe, 
>> index);
>>     struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>>     struct guc_engine_activity *cached_activity = &ea->activity;
>>     struct iosys_map activity_map, metadata_map;
>> @@ -177,8 +212,8 @@ static u64 get_engine_total_ticks(struct xe_guc 
>> *guc, struct xe_hw_engine *hwe)
>>     u64 numerator;
>>     u16 quanta_ratio;
>>
>> -    activity_map = engine_activity_map(guc, hwe);
>> -    metadata_map = engine_metadata_map(guc);
>> +    activity_map = engine_activity_map(guc, hwe, index);
>> +    metadata_map = engine_metadata_map(guc, index);
>>
>>     if (!cached_metadata->guc_tsc_frequency_hz)
>>         cached_metadata->guc_tsc_frequency_hz = 
>> read_metadata_record(xe, &metadata_map,
>> @@ -220,10 +255,35 @@ static int enable_engine_activity_stats(struct 
>> xe_guc *guc)
>>     return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>> }
>>
>> -static void engine_activity_set_cpu_ts(struct xe_guc *guc)
>> +static int enable_function_engine_activity_stats(struct xe_guc *guc, 
>> bool enable)
>> {
>>     struct xe_guc_engine_activity *engine_activity = &guc- 
>> >engine_activity;
>> -    struct engine_activity_group *eag = &engine_activity->eag[0];
>> +    u32 metadata_ggtt_addr = 0, ggtt_addr = 0, num_functions = 0;
>> +    struct engine_activity_buffer *buffer = &engine_activity- 
>> >function_buffer;
>> +    u32 action[6];
>> +    int len = 0;
>> +
>> +    if (enable) {
>> +        metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata_bo);
>> +        ggtt_addr = xe_bo_ggtt_addr(buffer->activity_bo);
>> +        num_functions = engine_activity->num_functions;
>> +    }
>> +
>> +    action[len++] = XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER;
>> +    action[len++] = num_functions;
>> +    action[len++] = metadata_ggtt_addr;
>> +    action[len++] = 0;
>> +    action[len++] = ggtt_addr;
>> +    action[len++] = 0;
>> +
>> +    /* Blocking here to ensure the buffers are ready before reading 
>> them */
>> +    return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>> +}
>> +
>> +static void engine_activity_set_cpu_ts(struct xe_guc *guc, unsigned 
>> int index)
>> +{
>> +    struct xe_guc_engine_activity *engine_activity = &guc- 
>> >engine_activity;
>> +    struct engine_activity_group *eag = &engine_activity->eag[index];
>>     int i, j;
>>
>>     for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>> @@ -240,36 +300,103 @@ static u32 gpm_timestamp_shift(struct xe_gt *gt)
>>     return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>> }
>>
>> +static bool is_function_valid(struct xe_guc *guc, unsigned int fn_id)
>> +{
>> +    struct xe_device *xe = guc_to_xe(guc);
>> +    struct xe_guc_engine_activity *engine_activity = &guc- 
>> >engine_activity;
>> +
>> +    if (!IS_SRIOV(xe) && fn_id)
>> +        return false;
>> +
>> +    if (fn_id > engine_activity->num_functions)
> 
> This ^ should be 'else if'. Consider the Native case where fn_id = 0. I 
> believe num_functions will be 0 for native, so the check would fail 
> always for native. Right?
Only if it's greater it would fail. So for native it will not.

In case of SRIOV too. It'll fail only if num_vfs is not set.
So there won't be two counters one global and one PF. Only global will 
be present.

Thanks
Riana
> 
>> +        return false;
>> +
>> +    return true;
>> +}
>> +
> 
> Thanks,
> Umesh

