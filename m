Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A676E77188
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 19:49:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30F010E128;
	Wed,  8 Jan 2025 19:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BjprGRGQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2191610E128
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jan 2025 19:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736365795; x=1767901795;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=T5JTBnDpB+HFO8f2OqDGQsjm2GnBmVa4pLlFUak3pCY=;
 b=BjprGRGQCA7mMJPkAwIZXhHtocSCYMJEbEfzMgxkIWmp6XxstnlRZB6Z
 Ta5S1lJ6ht3mGzunXkVeAF00YOo9X7cJl3XTbzSKCgba8rtN4OOFcqD4y
 mmIxpUMXNA6dCYw/OZ3ukrbV5XZWnS6vSDTkQCyLxNWg3yu3SWwr0+cnt
 3XHnmgVtbbq24JgiqJrF+5bBVK8Tm5pyZRybRb+0qCmErN2LG0BCGmPQk
 enBuwhkir0bf9enc1Gic2VK9IeaVXygmMkSl3zlWowqJbYiZbOtyV59X/
 +5CAYnG35KcmfMqpLAj0lvRYEhcessdCMZP+5SnIFFvvd6h0AqDGB7Bn2 g==;
X-CSE-ConnectionGUID: oMnG2vEcQtqAUN5YYTmsdA==
X-CSE-MsgGUID: bVPJBGNKSdWDLh+WfWZvuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40287957"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; d="scan'208";a="40287957"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 11:49:54 -0800
X-CSE-ConnectionGUID: YieM8GMkQ5aOmV8MDgkGAQ==
X-CSE-MsgGUID: tamIXx1nQxaHpIVe6vJjRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="108242239"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2025 11:49:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 8 Jan 2025 11:49:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 8 Jan 2025 11:49:43 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 8 Jan 2025 11:49:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJjfKnVVMp7Kum88JVewIddCFYOM/kucMoqP7Fl7llbZl4biq2Gqe2EpB6kV6qXwkS3eLdAu5WfGsb8RekbOFx6WKmCCIfBoaZIVMBdGQpgD72tHOMg3RnIn6XDbzAhoD8BVTNARAZmja6D0cpCA9o1VlEeeymHTqtJhrqKUzxUVOKUZDGOlwxwzE/pJCeFW2LFWjeGpJ7S1vOiXEGWXGIiIOmqFk10RMSDExhfsxRcumhBvKuIPQu7Y61andhiduPgALdbo3E6ZQxeVbMezRiUOIFKF0nWD77CIE5EUenPQeAxU2ZVoS90hBuTCL/6EeuXA89pHMSpu+A7B4Wt+rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NFs0McA6mkwalXxXXwWkV/tv7SIaPTeJIS4S2U0irc=;
 b=HdQa8QCcejqk+Dzq/6wqJEIamQ1/Apukr2XHKdRVnJDG7QD3c2Ofy2akyHuhTj72XjlO1aB+kWNc76gkkGKujjvIBbeSKFRwzGIJ3os5W6XxkCAiuIXjvTyY/q4zX1KC2zpfZ6RE2JDF8OI9DQPhKM1FubuceXYNRstX2ktdet7D4CHqMsRJHUGf/IrA0nT1DuD0FNwWm8C8UBIlEXBzBi66qz2ByngwTW2eFz4s403NPF6ZFT8KOL0LpfBhrFGAdT2sfcm0lDjvKqqScodLoASAkACbmv04+rhhGqyEWy7XhcipVdtF0E1UwIcQ9DV2bXsQmly3W+hWRwEB2GtuTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SJ0PR11MB5865.namprd11.prod.outlook.com (2603:10b6:a03:428::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 19:49:27 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 19:49:27 +0000
Message-ID: <f2dc78fe-dbe8-4157-a5d4-e9d17f1d4b28@intel.com>
Date: Wed, 8 Jan 2025 11:49:25 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Introduce the RPa information
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20241220152936.623627-1-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20241220152936.623627-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::11) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SJ0PR11MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: c0dcd69b-936e-4a44-2b1f-08dd301d8f1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWRkWmNUMkhqWjdzTnpSM3dndm12WmhCc25waW1xSmtTRm9ENDdUU2dxMHBL?=
 =?utf-8?B?M0xmTzdRclo3Z3ZJQnZVaVN3OHZ4NUtTUzAvSXZUZ0d6dlFscUpWdDlVdFZG?=
 =?utf-8?B?VDBLcFJ4SEM3ZCtlTnZTOER0RmNrbjJhWWJCd3g2Wm9wNnlmRVo2N2ZCdElh?=
 =?utf-8?B?T05HYnFicXAvd3pGV1FTd3pLUHdGcDE1VjdWckhucjQwU0xXc0ZUQXdFUEF1?=
 =?utf-8?B?TnJSS1k0NjZVQWI3SzJPbU5oMUt2ajFmN1hURWNuK3dDNjlWUkNJWmM2bzdP?=
 =?utf-8?B?RHljNHJzOU01N1cybDh2VlNiTThDR2l5ZnFPL1VqYmF5NFlFMm5kTk1BTWdn?=
 =?utf-8?B?VGo1bDhWMzIybXFQR2NIcUNjc3MrN2U0cVhqYW9aYW9PQXJDdldnQnZDd0dG?=
 =?utf-8?B?K2tGQ21LNjJRRURpcXZJbGlwSWw0aTU3NkhjZmlidnkrZ2pTQkhleGRKTzJG?=
 =?utf-8?B?ZERiLythNGh6NFpiVXVHc0UvbVZndTd6a2hraTB4TDlMMHNQdlBwNGVhQTBj?=
 =?utf-8?B?RVdMSUdBcHRMV3E0cmJwZ05RVzR2VC9RVHoxL3dZdzFCYlhKUnoya2M1cUNU?=
 =?utf-8?B?OTJjRllHcXBWOVdLUXM5RWM0aFNSVmxSZGQ2cTdlZ2dNSVNNSWgyZm1mTCtB?=
 =?utf-8?B?eXZhWHhueVJsWkxiUWphZCt0NXJlSXlFVlk5RW0wYXFuaUFKZmdLSmlpbE1L?=
 =?utf-8?B?aHVldVVMWjRKQVhIQnJOeFlTZWlFQXpEUVZPOUorUFE5QWJRZVVXREdaU0x5?=
 =?utf-8?B?bGh1d2lWbWFrUkhDY1l4S2tZbjE0a2phVHZpQ2pmTmRVZmFWVFRLdjV2U3NJ?=
 =?utf-8?B?YTY1bEtyODYxYmYwRm44YTM2OHpkOEY0UWZyMklyclc1TzRSczFoTTQvNnhm?=
 =?utf-8?B?L2FyRy9VZENUajg4eHR4ZWZGdFdCcXpESktXZTI2cDNaVkhYQ2NndWJFMUNN?=
 =?utf-8?B?ZnFEOHM1MkRrdFQyNzg0NVEzTGR0UEk3ZEpEY25uV3YrT29qRjZjVlJYa3BB?=
 =?utf-8?B?cWdDUmpSSndNLytnR0FJOG5SWDRPWThvNml5SkpYWGx1ODRGZ2F2V3E4K0FI?=
 =?utf-8?B?MVhPL1R0Rk92aUxaM25WUGQvUG1jS1B3QXpZaVl2aytpa01KV0hSSktuTkxX?=
 =?utf-8?B?K2Rpek84eFNCKzEvL2p5ZUlodzc5UjNSa3JFN0pKMmdmRUtpVWxEbEl4bkR2?=
 =?utf-8?B?RkN2cVg1bGxldk5sdGJHYnBORExJMWgvNlN2Z1RTVzAyREE4WUgwTFlvV3VU?=
 =?utf-8?B?UDZWOXFaRjNpNklCVVA5YW1TVXYvTWRlS0lPYjdzeWoxTHYrRjFsZ21nbWlv?=
 =?utf-8?B?VmJwdEprK0VCNExEYU9hc0FMZXROWGErTVB6UGZ5akp4b2laV3VKMzJ6TXox?=
 =?utf-8?B?bjB6Q0JSQlQxLzcwY2UwWWFKc2VKNUtubXRyZTkvM3NIdWhaUkxBeERUWVN0?=
 =?utf-8?B?RTlmc3dUOVJaSEpOYTUrMWwzQWQzRzNrSDd2WE1UY1ZoRTJpRHlUMDhnay9K?=
 =?utf-8?B?VjB1N1NtVldnelBRcVhPY0pzOU1OWFlGczFUbW1ZWTZnS0x3WFdtOVJQUnFB?=
 =?utf-8?B?OWxmMVlXOUQwMWQ4SUwyOGNOMWxQd3NKT3NHdTZqS3pFZC96TFNKQ0VXTGlv?=
 =?utf-8?B?NFI3ODNhL2pKb29LSjRBY3NLbzRoRTRPY0FBSDF4cklNTUk2Uk9ta09uUGwr?=
 =?utf-8?B?aUlnQXMrWXNFUGo5eG9Nc053WUsyRVk5SFBoYS84b3YxOStmZjNpSkxmR2JH?=
 =?utf-8?B?L3BIL0w0MDNJNWlrM2ozbHNqL0NDZERKbFFQN0lleWhEOFFpUEplTGl1U3li?=
 =?utf-8?B?b0xHeGN5bzZEcHB1dUdjUXlxcERFWEovbWN0TWdrcVAyQnVQaDYrL1M0WDQv?=
 =?utf-8?Q?r/GFKNoy/vAUs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWpBU3I5RkhNYjFhRTVVNmFiUlRZRE8yQUh3MDZUYStTYXNodkVFR1pjeXhX?=
 =?utf-8?B?K3dsQnFGVzk0MHg4SVJDN3FWNHdrN1VDT2R5WXBoTGxOMU5tdEJXeW9uVjVp?=
 =?utf-8?B?aWFBYmFObE1hZTNmUlgvMGllVjV0aGtGenVYckFSOEs0TkVxSEJ3eTZiYkxX?=
 =?utf-8?B?ZnpjVzRVQXp4azBJenNDZmRwZDFLV1E5TlFkZUNRSXQwMmk2a0R6dzhURjA2?=
 =?utf-8?B?QzJGdzgrSmJiQ3U0Q2dkQ1c4UU50aTROK2VYZFdqTjJyaktMazEyd280ZnNh?=
 =?utf-8?B?UDNOQ0hKK2VueU9qbExTclJncFI3TXQzaCtFQWtVa013dU92OEpFOEJ1MXZ0?=
 =?utf-8?B?UldnanV3cjY0U2dtUXIvTFZNbkZKYmVoUk1jSzNFckZFc0JjQ2NyOWdoSWZZ?=
 =?utf-8?B?WDNDY2FZWUlmckpPU21WYlFXdXEwaUN5ZWFGVFRRWUYwSFVtWU00aEUxVmph?=
 =?utf-8?B?WjBEaWVLaGl1ZnhQMkdoRFpzMVRvNTEySWV0Wkt4bkxMWjVxVVFxYndlTmUz?=
 =?utf-8?B?aFo1SWZ4eGk4VmdIZ2kwRDh0K09jM3Jhb1RzYmQ1UEdSeE15UE9FcmJSampL?=
 =?utf-8?B?eGRJWG8yQUlsTkhmNWQ5c1FnNEZMQ3FpM2FkVDBtU0V0eWxqTi80Z1VjNUFy?=
 =?utf-8?B?VHZiWkdoZThTVHpRUGUvcWZXOElhMCtyVjA5NW01NWVXdUJHcWl4SWVPSUht?=
 =?utf-8?B?ZGJZWGxxVlhMTE5EUjNzUXVPdU5kZysyYXM0cUo5SVVqZ2NIS05LZ2Flbk9G?=
 =?utf-8?B?WjJaYnZoTzB1WFlBSllmZWtCWG1vMU9IcGhjNkdyaXRjVU9OYUxObHNtSUUx?=
 =?utf-8?B?dkNRZkU2T2dJbXNVOUJlVXY3eGo2WE9LMW5HOFZvVnRyNm1vdlJRRi9KQldG?=
 =?utf-8?B?RHBVZWp0YUNSaVFYaG41MGhKU25hbm1tMUp5cVVnSnIwcEs0QW1POFpBZE5G?=
 =?utf-8?B?eEh1RzZHVU4rNW9OQVhyODJLNWNtdm10YUNUa0VFdnF3d05sby9EcXg1QlB2?=
 =?utf-8?B?N1lBMmJjTEhSZ3NFQkRLejM0bUhTV3ZTUWhFTmlzbVhnV2szZURpME5qaW9G?=
 =?utf-8?B?L0JMVlQwTWxUWVA0bWdBUjNkYnlIeEZ4dUMvT3drbHBhNU1JdzRLZGc3TGZw?=
 =?utf-8?B?TzIvVVVsQU9QOEUzTzUxaGlLRElyVXBVNFpwcmFxZ0lhMFJyaytvREtaem9J?=
 =?utf-8?B?aE9naGNCUk1sQWpwUnBZVTBEOWlML0RhRC8rOHdjdXZwVlN1VFlhdzhqTWkv?=
 =?utf-8?B?akhHNW1MU3FxTzErbGlxUHJYdmdVclNJaWFMbjlzQlpQUmljU1lYRk84c2JS?=
 =?utf-8?B?NDZKZkV5TDc4eXdWVGorbFRkd0xwWWN4OHlsVU54b2hXQWtYdGF4ZkxBQ29s?=
 =?utf-8?B?MzB0L21KV3VWd1ZlZnFPRjdNZlU2VG4vYVlNR013L3dtNE5taTlEWmVQcWZm?=
 =?utf-8?B?a2lMVzdRRkZqT05NN3NOZmp5Rk9pTWZmOXBSam9mOWRscU90YlFiaHlDd3A2?=
 =?utf-8?B?Wkloei9XM2lZWjViNjZYTFFWTGxBSXNtTmtqZGRzMWt4WitLbG5qK0NFVno2?=
 =?utf-8?B?ZTZiRGxOdGJiMjVOOVg3d3Bjakk4ZXZoV3R2MXNLYkJFQTNjc0NORWhnenNv?=
 =?utf-8?B?dGxxZ05COFg4L2tJaHZMYW5UUDh5bFlGZmZReDRDMVkrdEN2RFA3MEpVVnhZ?=
 =?utf-8?B?ekpLdXlPWndJcXZiSnV3YkxXQTlZazMwMXFFOFJneEk3eDhvNVBOKzY5U0V4?=
 =?utf-8?B?eTR1UTY0Q0UwQmhFdmJrc3N2ZndkV053bTFvclBqYXZNTlBReThRM0I0ME5w?=
 =?utf-8?B?eXpVcHZHYktiUWdoMGlVV1MwMGVQc2krWnQ2RnJOVHFPeWZHRGdOYmMwVGhW?=
 =?utf-8?B?YmFNS3pWbW5GUElydVdMcGcyUGVYbjkvdE1pL0V4S2RqdkJkOWZlQWRyOUdF?=
 =?utf-8?B?VFJLZGpQRVcxVm5CZk5IQWQvVTlPNGU0ZzlKUXhjQXdGRjN2WUlscnNVRG16?=
 =?utf-8?B?NjBGNTVyYm53c3J1OXY5VWl1TEJ0OHIxcFh0T0pJY0VDVGpvUDVWbTVvV1p3?=
 =?utf-8?B?Wml6THlDVUtkSFFiZzFnbUJCc3lVcmEyeUNWbklHb3dMekxRY2ZCeG9SaHJJ?=
 =?utf-8?B?cGZQR0k5RkhlVXRDOGJpdHhoeFpEQ0VGL2ZGVGlaRWlnRlFob1F1MlN4ZVE2?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0dcd69b-936e-4a44-2b1f-08dd301d8f1c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 19:49:27.0878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Csv94mToiVi1Es+DzOMrn8riPYYbIca4RPNDgisDiEEc7rrjeh+Si/VIUZxi2VEYINaEeF2aujz/Sq3VWUtTTWstG1z6MRHzD+jpekaWEF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5865
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


On 12/20/2024 7:29 AM, Rodrigo Vivi wrote:
> RPa is the Achievable frequency, defined by PCODE at runtime
> based on multiple running conditions.

This is a good data point in addition to the throttle reasons that can 
give insight into pcode's decision process.

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>
> v2: Remove RPA_MASK from i915 file
>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_regs.h    |  4 +++
>   drivers/gpu/drm/xe/xe_gt_freq.c      | 15 ++++++++
>   drivers/gpu/drm/xe/xe_guc_pc.c       | 53 ++++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 ++
>   5 files changed, 73 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 3293172b0128..6cf282618836 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -44,12 +44,16 @@
>   
>   #define MTL_RP_STATE_CAP			XE_REG(0x138000)
>   
> +#define MTL_GT_RPA_FREQUENCY			XE_REG(0x138008)
>   #define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
>   
>   #define MTL_MEDIAP_STATE_CAP			XE_REG(0x138020)
>   #define   MTL_RPN_CAP_MASK			REG_GENMASK(24, 16)
>   #define   MTL_RP0_CAP_MASK			REG_GENMASK(8, 0)
>   
> +#define MTL_MPA_FREQUENCY			XE_REG(0x138028)
> +#define   MTL_RPA_MASK				REG_GENMASK(8, 0)
> +
>   #define MTL_MPE_FREQUENCY			XE_REG(0x13802c)
>   #define   MTL_RPE_MASK				REG_GENMASK(8, 0)
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 6bd39b2c5003..604bdc7c8173 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -115,6 +115,20 @@ static ssize_t rpe_freq_show(struct device *dev,
>   }
>   static DEVICE_ATTR_RO(rpe_freq);
>   
> +static ssize_t rpa_freq_show(struct device *dev,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	u32 freq;
> +
> +	xe_pm_runtime_get(dev_to_xe(dev));
> +	freq = xe_guc_pc_get_rpa_freq(pc);
> +	xe_pm_runtime_put(dev_to_xe(dev));
> +
> +	return sysfs_emit(buf, "%d\n", freq);
> +}
> +static DEVICE_ATTR_RO(rpa_freq);
> +
>   static ssize_t rpn_freq_show(struct device *dev,
>   			     struct device_attribute *attr, char *buf)
>   {
> @@ -202,6 +216,7 @@ static const struct attribute *freq_attrs[] = {
>   	&dev_attr_act_freq.attr,
>   	&dev_attr_cur_freq.attr,
>   	&dev_attr_rp0_freq.attr,
> +	&dev_attr_rpa_freq.attr,
>   	&dev_attr_rpe_freq.attr,
>   	&dev_attr_rpn_freq.attr,
>   	&dev_attr_min_freq.attr,
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index e8b9faeaef64..a6fdd2c062ff 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -38,6 +38,7 @@
>   
>   #define FREQ_INFO_REC	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
>   #define   RPE_MASK		REG_GENMASK(15, 8)
> +#define   RPA_MASK		REG_GENMASK(31, 16)
>   
>   #define GT_PERF_STATUS		XE_REG(0x1381b4)
>   #define   CAGF_MASK	REG_GENMASK(19, 11)
> @@ -328,6 +329,19 @@ static int pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
>   				   freq);
>   }
>   
> +static void mtl_update_rpa_value(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	u32 reg;
> +
> +	if (xe_gt_is_media_type(gt))
> +		reg = xe_mmio_read32(&gt->mmio, MTL_MPA_FREQUENCY);
> +	else
> +		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPA_FREQUENCY);
> +
> +	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
> +}
> +
>   static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>   {
>   	struct xe_gt *gt = pc_to_gt(pc);
> @@ -341,6 +355,25 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>   	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>   }
>   
> +static void tgl_update_rpa_value(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 reg;
> +
> +	/*
> +	 * For PVC we still need to use fused RP1 as the approximation for RPe
> +	 * For other platforms than PVC we get the resolved RPe directly from
> +	 * PCODE at a different register
> +	 */
> +	if (xe->info.platform == XE_PVC)
> +		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
> +	else
> +		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
> +
> +	pc->rpa_freq = REG_FIELD_GET(RPA_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> +}
> +
>   static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>   {
>   	struct xe_gt *gt = pc_to_gt(pc);
> @@ -365,10 +398,13 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>   	struct xe_gt *gt = pc_to_gt(pc);
>   	struct xe_device *xe = gt_to_xe(gt);
>   
> -	if (GRAPHICS_VERx100(xe) >= 1270)
> +	if (GRAPHICS_VERx100(xe) >= 1270) {
> +		mtl_update_rpa_value(pc);
>   		mtl_update_rpe_value(pc);
> -	else
> +	} else {
> +		tgl_update_rpa_value(pc);
>   		tgl_update_rpe_value(pc);
> +	}
>   
>   	/*
>   	 * RPe is decided at runtime by PCODE. In the rare case where that's
> @@ -447,6 +483,19 @@ u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc)
>   	return pc->rp0_freq;
>   }
>   
> +/**
> + * xe_guc_pc_get_rpa_freq - Get the RPa freq
> + * @pc: The GuC PC
> + *
> + * Returns: RPa freq.
> + */
> +u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
> +{
> +	pc_update_rp_values(pc);
> +
> +	return pc->rpa_freq;
> +}
> +
>   /**
>    * xe_guc_pc_get_rpe_freq - Get the RPe freq
>    * @pc: The GuC PC
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index efda432fadfc..619f59cd633c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -21,6 +21,7 @@ int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>   u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
>   int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
>   u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc);
> +u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc);
>   u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc);
>   u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc);
>   int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index 13810be015db..2978ac9a249b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -17,6 +17,8 @@ struct xe_guc_pc {
>   	struct xe_bo *bo;
>   	/** @rp0_freq: HW RP0 frequency - The Maximum one */
>   	u32 rp0_freq;
> +	/** @rpa_freq: HW RPa frequency - The Achievable one */
> +	u32 rpa_freq;
>   	/** @rpe_freq: HW RPe frequency - The Efficient one */
>   	u32 rpe_freq;
>   	/** @rpn_freq: HW RPN frequency - The Minimum one */
