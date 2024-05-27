Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E057DC25B74
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 07:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC4B10E6ED;
	Mon, 27 May 2024 07:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="InHVP04T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6F510E6ED
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 07:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716793445; x=1748329445;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PqLeE1q/GF4cBPfJX0f2+Z/wB5IwIHPojplE7YLOhLY=;
 b=InHVP04T5Hq5MBT9FI0qYBbzX4tNDVYdC7gXel7+sZzZHatIL4xYMunP
 YZR3KALaGBaUqzm70QzE1siltPoTYkAV4MQxemTP09fyQPb15Ffi41WOZ
 xfuCR69FSLMzQKvjh1l2qzJzzpA/xjLn4bXmbBEVVPv+va2W4sOUAX2aa
 gpJNnObH/L3z51bZu52wrR9nwkt5wJcfX5JtY035qRdK2mzRFKWGHPy3e
 SbaXE0QH/TshxADo2BBEm7POkMnAgI49DWAqQy5A7hFu6TQ/tuiGYE7ov
 IcWYc5cigOZYocqTp5Y1WnF5AwcIWuaF7Faxn0IBzqLtPbGq4gCVT8VRl g==;
X-CSE-ConnectionGUID: ES6xokyeQlmwW/bq6grqnw==
X-CSE-MsgGUID: XoHt5cOgSdKYLU2NVN8bRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="13281057"
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; d="scan'208";a="13281057"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:04:04 -0700
X-CSE-ConnectionGUID: yNMhAIPhS1SmwBlx523OFQ==
X-CSE-MsgGUID: krAYfZMRQveqGHYbrfaFQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; d="scan'208";a="65888135"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 May 2024 00:04:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 27 May 2024 00:04:03 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 27 May 2024 00:03:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 27 May 2024 00:03:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 27 May 2024 00:03:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wj6pB951B+4QyBO3g/re9StqfUc80tk7RKcPzJvCAc4koH2+RL5vDDT5xmEtLp6LIoyFmagaZMIJwdpckO4AYb3OvZqP9PzgY6dpwQdSzmFJ2LNdjJLZXiyM8Ex2vazrdiUP4TOPU2bqkEcFqrPIu1etCiFFZvv5fIv/6s21+2uCWLhShgkLrNTce0/Kw4iiP0PbT52HmZNO9actK1H2vVRhKpXuxV+RUU+5fqXRZFcESAC0rX6AyUQ7Wtp7c53NvGxzA2PpNCk7xiD6P3vZp2aiA5dmUUzQm9G8C0vmweBBwk+lLRyL+SaRQkrazu6xT0suqGxmnxy5CdtKiKhmbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okvC9sMU9U7z0rtAvrRq0QvSEs9LNqmDPkmp6UucYP4=;
 b=Xm8JEAJaAroaWnjwqb50sKtUsgzHY63PEUIsDpLk+AQ4kw846FYBnPZtKmLeWZ611m2EC+3BfHepQc+597FxbTdrrCbGmLYsswedx1xf+ZztbHEm7/8C5mG+PelKFN1FRKNy4IaXHVczNlkkxel1/EeiVtTfC6TRgeYO0/jLKx0+t24hm3AoBUOcwf2Ki6Ts43a+QjVOwF1lS5Gp4eaN1L+o5JB6WIAsPtdIS83UCDQhv0c3kin4+cOZV2cMUfFEqup/J3M9Do+VvGmwR+qFSHB/5i9bi/87nF5YQzxhmGbAmPpUih1k+lD6SBrgdZk0a8145tq761qu6kuA25LpWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by DS0PR11MB7530.namprd11.prod.outlook.com (2603:10b6:8:146::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 07:03:36 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0%4]) with mapi id 15.20.7611.025; Mon, 27 May 2024
 07:03:36 +0000
Message-ID: <0cd6f261-2345-4cc5-b95c-b2c28dc79fa5@intel.com>
Date: Mon, 27 May 2024 10:04:21 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/xe/oa: OA stream initialization (OAG)
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240527014333.603914-1-ashutosh.dixit@intel.com>
 <20240527014333.603914-8-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20240527014333.603914-8-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::17) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|DS0PR11MB7530:EE_
X-MS-Office365-Filtering-Correlation-Id: 57b0b86f-0584-459b-686d-08dc7e1b20c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0pRc2VDMkpQSFdyR29wYWNNa2NyL2JBL2hqUkV2SXJIMWZ0YUJlL2dKYmpz?=
 =?utf-8?B?TzFIeFJvSGJMRmc3dkNRanBWK1g5OVppTnlBSzcyenVuNnUwY1M4L3E3djE2?=
 =?utf-8?B?ajF1ZE9nN3VkdGtCc1VuV2V0Y1VYWXlIenU3VDBMUklJaUlQUTJyOVk1UStq?=
 =?utf-8?B?Q1UyZ29YU290Rkluc3hmaEl5RlVpMDNGeG5YbHdUcEU4ZHE5Vmg1bHg2MUVu?=
 =?utf-8?B?dytNK3JpVXlQVUR5a2dKNjl3MkszYytwdlJqaTF6OWlUOTJGTlZFeGdEeURz?=
 =?utf-8?B?TTlQSVpGa1U4TVE3LzNnZUVXOWRMcUNCMHNQdjdsbzU0ajdmaldUaUVlaWNK?=
 =?utf-8?B?eG53bS9mWlR2N2o1bk1uRnU4cDVHZGI0eGVZS1ZRRmNzTTB1L2NLRG1vSjAz?=
 =?utf-8?B?bzZ1SXBIWTZib0tEM0JYUERINDJEVDBmd1FJa0QxT0lmZGJ1STU1azhFYlh1?=
 =?utf-8?B?Vkd6dndvRTlMRmlLYXF1QXFwaWlDa1VhQVhGYXAvcHErSnVORlQzOThlYnRD?=
 =?utf-8?B?THpwT3hsWGVRSkVoNWNBRWNSQlE2NnZHSnVFOUM4VnJ5K3FjOWpUL1lFZy9O?=
 =?utf-8?B?WXAvTFRNcWZNeVh5ay9JQzNrTDhZS0U4cmVpd3JkbmMvRTlOa29GekpSM2lV?=
 =?utf-8?B?YTNUUk9oR1lYeEpScnFxaEx5VFY3NlJmcmFxM0s4Y3BVaG1IaFpBRHNiU0dE?=
 =?utf-8?B?M2tiUWN3SXhHUERhZjhLenkxSXlvUHB3RGZhcElGZG9QMVUwSlNRek1ROE41?=
 =?utf-8?B?WFJOODRCYTZXMkxoNG4zT0Z5N2VFT1hsa1c2MzB6Q2RMOWZXcXRER2ZqUWwv?=
 =?utf-8?B?d2R2b0xkdm9ROTA4a2Z4SVJGRUdxNXRxVE9VRml6MlJlbUlPM1lQRWhuaE1G?=
 =?utf-8?B?Si9jTTJySW5BSVAxbjR5cWpnNnYzckJMRm56YmNVTm95bHFBR0k2R012WXg5?=
 =?utf-8?B?eCtnWksvWXdyTzdEL1ZtV2lKMWNIMzFiSlI5dEFLaWdnVUl5SFNvWHF5dndL?=
 =?utf-8?B?VjJpODFxaVo0aVc3ai96SnNjcTlqZkFBZXIrQlpJZlFaUnlkT21UNTcwV2Ur?=
 =?utf-8?B?OHc1Sm1JV3kvelhRZlN0ejhQWngxR0pmMGNRNXE5RVExVEp6b1lWWHRSS2Zl?=
 =?utf-8?B?TkhXQ2htWGRMa2dmclZmSDNKT3JYMjlzSFIxNUd2T0VjRmpscGhRYS84d01L?=
 =?utf-8?B?ZkIyZEY4UXdCN2E0TUtrU0NZVko2MFBTWUR6OTRkNzNCWTlOVkxsNWlYa3ho?=
 =?utf-8?B?ZWNhQTJrb2hkeTZ4YVRFbWE4ZW1vZFlKNDc0akc5bFg0c2IyWGRxeVRzSzJx?=
 =?utf-8?B?VUVFTWFYTHBlUElzSG53aGdjeWJWbjRzQUpHaWRPUVJQazgrcDJMdDFrdUtS?=
 =?utf-8?B?UWdnRjMrTTNqL1VDemdXRkt4RW5naHQxcjhHK3F0Nlc1dC9nVUNsZlRma3Y5?=
 =?utf-8?B?SkxLZ1pDanpEYkNqMVgzazV4OTZsTzdNWk1ON3gzeE00by9WZW5CdzdsdXYw?=
 =?utf-8?B?U3FmR2RFTlBuNnVzeE8wZUlHLzZnL3VYUmhkVVB3dy9ObVVIeTdNQk56cW93?=
 =?utf-8?B?Vk5NRzlYYmo3Y3BUMlpHRTI0R0tuOFJZNEtlV1JzSGsxcVNpK3B5aFh3c0VT?=
 =?utf-8?B?MXJhV0lZODRCRFpDNmp0TkZkNk44aStxeFl3ckM1RWZpZlk2YlAwSG1UcUQr?=
 =?utf-8?B?UjFnU3ZCTVdjOHI0Zk5zWmVzeVh0elVpZW02TllYQUhZQS8yc2g5dzlRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTdLM2xxTk5scGt6Qmp6eDBOMzl0T2k3dXRLVEF2cWVRaU5SMXZZRjhLTGxa?=
 =?utf-8?B?S0Z0dGZzakU5VEloeUkvOTU0SUNmdWE1ZjdmSXlDZjVlU1o1NkcxLzA5MWUw?=
 =?utf-8?B?cXhGSndmbVdhRFlKR1FhZWtQMk1PRE5GZDQ5TFM3VTVkRW1EZHd1QUZKVFRr?=
 =?utf-8?B?QzRhZVdtWmF0M0Y0L2NMOEt2QjNmZW1yejM5YkRIYUg3eXZrbEdwMmx2d0dh?=
 =?utf-8?B?WlhmaXNwcTVEK3FRZHB6ZnY3c0pPWGd0ZUU0UDY4Qlh5MjJNVmNiMXprMTgr?=
 =?utf-8?B?VmhoYnR4RmcxdjZnYnJmSW1GRUhyY1A2SnRkenlLTlVLYVVMUWtSbXAzYU04?=
 =?utf-8?B?RjViZmhRNjBvUDk1TGh6ZHNxckZ4K2Fmd3puR0dpWmpFU3NDMDBVSjRKT1VV?=
 =?utf-8?B?NW16WHl3SUtwZWVWR1d0czlpVHBVa1ZqRGw1YjNmUFpTaWs3bnRBRFVnRWhy?=
 =?utf-8?B?N2oyYXNENE10d0F2VzVJWTUwaENnMVBkS1NtdTNHL1lIV1RJelk3dTA1cjR1?=
 =?utf-8?B?SU4xemdzNStnUzYwTGVWZGcwOWdVMzlwNHdhdHNHYys1SkJFMStGcmNNQnRo?=
 =?utf-8?B?WXQvbzV3MzBldmFpRjVUVW9naDA0aW5MNmF6bENNaGZiVmd0cGpvSDdwSXVz?=
 =?utf-8?B?cXltRWZYYmJEV2cwWFp3ZTRqdU02YlAweW93R2xvcjNlL0NVR1BMbHh1NVBq?=
 =?utf-8?B?bjdtdFZWZ0s4WWI0ait1bDk3aWRhYVdLM3pNaWNHc3g5MysweFF0Uk1mQWk3?=
 =?utf-8?B?c2tsVG9WWHFZeDYyMmhDaWJkbVlPdjZpK0tDNitRUGMvbVNNYjBOWUxaTWF0?=
 =?utf-8?B?U3hEZkttbVU1VWUvYXBhR3hlY1FtbjJpc0QrUS90Zk1ZZXpMQ1huZThHU0ls?=
 =?utf-8?B?dUhXMS9GVW81WGlYM0VxTzBHbjlEeFN3SkZ2UnVOSHk1enZQWWFEbTlwZWxa?=
 =?utf-8?B?SW5jcnZYTTZ3Zk9wZTMvbCs2YjU5OGxkK1E2VmtGMzBqMkZCZnlORkxyWnhz?=
 =?utf-8?B?OHdHbW5yaFhXSmdVL1hYa2hibEprMUZpWStncDA5Z3ZXTll1RlE0UGcwVkk2?=
 =?utf-8?B?KzJjeVJURXRNa0Z5WlJCeGR4S1lxZGtzZHF5QnZwbGNmSTVrSVZObWh4T3lk?=
 =?utf-8?B?T1EwVWIrcXJMc2FZbklPTFRPQTJNSkZIVE9YWlh4UTVkZlYwdXliOWt0WTVW?=
 =?utf-8?B?Qi9lLzdQblJuSTU1ZFdLR3BOTm1xWk5XZ0toQy9WRUJ5SXJhTVcweFVrOUhU?=
 =?utf-8?B?Sm55enFhSDRndmQxRHJQeWlBaVAyeS9hS1dOM2FkYldZQzlqSlpINmluMERY?=
 =?utf-8?B?ekxIenpqbGFLTW1HdVY1cGhnV3ZNZm1DQlBScXBUTDNpUlRsdmJvdVBEVUk2?=
 =?utf-8?B?aC9xbmhja24zcnpwaitUd1FDNW9sSUFpNUV1azd3Zkw5ZjVQSWRpUTZGV0lW?=
 =?utf-8?B?cG13S0VuV245dEs4d2NxckFNUEh4M0NmMXpYYTE4eWtmSisrWG94alhiL3B2?=
 =?utf-8?B?L3MzSkpPWnNTT0hGdmx4RXVieHBxdmRKcHMrQUJvaWNEVDl6dUhGRkwwdTZI?=
 =?utf-8?B?T0tISWF6ZThSaTFKaytCSTJ4b3BpT1ZHTVdBQWhiZXRTL3lUdS9WdGhVZHNB?=
 =?utf-8?B?dXJXWURaYXVXMDNrMnVjUVRoKzhPcVpMaDB6eWZXek1OTWpneGdkQWY3cFZp?=
 =?utf-8?B?NUJLZkRNdE1mRnZ3M2JidUwyYXk5WVFLd28vQjliTkgxMTIxcGhBS2FXZjRH?=
 =?utf-8?B?dXZ2ZXoxbFAzck5zbEwwbFlJL3pUcFVHS2FMQXhMK0RDODhuRlpVckJvZWlu?=
 =?utf-8?B?bWgwMzM4NG5oNDJ3TW1Cak9sTVpHOE1wNzhWaG9RYWY5Z2VqOWdLbHQ1Y3kr?=
 =?utf-8?B?dHhHaFRYZHhUczdPcDZFamxINHFCNW15ZDFZRU14V1pEWEhwUnhIb29wY3N5?=
 =?utf-8?B?OFM4eWtQUDFiMFFjVGE3clVsMVlCbmc1ZXJ3QitXSVF6NENycldvMWs3R052?=
 =?utf-8?B?TW81L3pyR3JaY2RKSHRWcEg5bDZsSUZ5OGZUQTE2b2hnQm1KaGs1UCtqYjZG?=
 =?utf-8?B?SHBJbDR6OGYvdjFRNXozb1pXZDN1M25OK0dieTBoQ1ViS3VvWC9iYy9Qb29s?=
 =?utf-8?B?a0JnVHZkcWRQS1hDWjYyRVltcjVCQUl2S2xUZDVOeGl5V3h1S092dVV5Zjdv?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b0b86f-0584-459b-686d-08dc7e1b20c4
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 07:03:35.9794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 03aCgF6RFgaAI3T76iF4Spy7RXEIPlPhISwhmXbnGMotiH1O8YqJ+tPEcYFRwPhCFbjwMkdEGUodpFMeAnxQK3UVd2310xZ0fsFT1j8ekGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7530
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

On 27/05/2024 04:43, Ashutosh Dixit wrote:
> Implement majority of OA stream initialization (as part of OA stream open)
> ioctl). OAG buffer is allocated for receiving perf counter samples from
> HW. OAG unit is initialized and the selected OA metric configuration is
> programmed into OAG unit HW using a command/batch buffer.
>
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |   3 +
>   drivers/gpu/drm/xe/xe_oa.c           | 393 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_oa_types.h     |  79 ++++++
>   3 files changed, 475 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 9cacdcfe27ff..f48ed5fe2200 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -170,6 +170,8 @@
>   
>   #define SQCNT1					XE_REG_MCR(0x8718)
>   #define XELPMP_SQCNT1				XE_REG(0x8718)
> +#define   SQCNT1_PMON_ENABLE			REG_BIT(30)
> +#define   SQCNT1_OABPC				REG_BIT(29)
>   #define   ENFORCE_RAR				REG_BIT(23)
>   
>   #define XEHP_SQCM				XE_REG_MCR(0x8724)
> @@ -427,6 +429,7 @@
>   #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
>   #define   UGM_BACKUP_MODE			REG_BIT(13)
>   #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
> +#define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
>   #define   EARLY_EOT_DIS				REG_BIT(1)
>   
>   #define ROW_CHICKEN2				XE_REG_MCR(0xe4f4, XE_REG_OPTION_MASKED)
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 9944a4a5ea15..87a00d38150a 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -3,22 +3,32 @@
>    * Copyright © 2023 Intel Corporation
>    */
>   
> +#include <linux/delay.h>
>   #include <linux/nospec.h>
>   
> +#include <drm/drm_drv.h>
>   #include <drm/xe_drm.h>
>   
> +#include "instructions/xe_mi_commands.h"
>   #include "regs/xe_gt_regs.h"
>   #include "regs/xe_oa_regs.h"
>   #include "xe_assert.h"
> +#include "xe_bb.h"
> +#include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_exec_queue.h"
> +#include "xe_force_wake.h"
>   #include "xe_gt.h"
> +#include "xe_gt_mcr.h"
>   #include "xe_macros.h"
>   #include "xe_mmio.h"
>   #include "xe_oa.h"
>   #include "xe_perf.h"
>   #include "xe_pm.h"
> +#include "xe_sched_job.h"
>   
> +#define DEFAULT_POLL_FREQUENCY_HZ 200
> +#define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
>   #define XE_OA_UNIT_INVALID U32_MAX
>   
>   struct xe_oa_reg {
> @@ -56,6 +66,13 @@ struct xe_oa_open_param {
>   	struct xe_hw_engine *hwe;
>   };
>   
> +struct xe_oa_config_bo {
> +	struct llist_node node;
> +
> +	struct xe_oa_config *oa_config;
> +	struct xe_bb *bb;
> +};
> +
>   #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
>   
>   static const struct xe_oa_format oa_formats[] = {
> @@ -98,6 +115,378 @@ static void xe_oa_config_put(struct xe_oa_config *oa_config)
>   	kref_put(&oa_config->ref, xe_oa_config_release);
>   }
>   
> +static struct xe_oa_config *xe_oa_config_get(struct xe_oa_config *oa_config)
> +{
> +	return kref_get_unless_zero(&oa_config->ref) ? oa_config : NULL;
> +}
> +
> +static struct xe_oa_config *xe_oa_get_oa_config(struct xe_oa *oa, int metrics_set)
> +{
> +	struct xe_oa_config *oa_config;
> +
> +	rcu_read_lock();
> +	oa_config = idr_find(&oa->metrics_idr, metrics_set);
> +	if (oa_config)
> +		oa_config = xe_oa_config_get(oa_config);
> +	rcu_read_unlock();
> +
> +	return oa_config;
> +}
> +
> +static void free_oa_config_bo(struct xe_oa_config_bo *oa_bo)
> +{
> +	xe_oa_config_put(oa_bo->oa_config);
> +	xe_bb_free(oa_bo->bb, NULL);
> +	kfree(oa_bo);
> +}
> +
> +static const struct xe_oa_regs *__oa_regs(struct xe_oa_stream *stream)
> +{
> +	return &stream->hwe->oa_unit->regs;
> +}
> +
> +static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
> +{
> +	struct xe_sched_job *job;
> +	struct dma_fence *fence;
> +	long timeout;
> +	int err = 0;
> +
> +	/* Kernel configuration is issued on stream->k_exec_q, not stream->exec_q */
> +	job = xe_bb_create_job(stream->k_exec_q, bb);
> +	if (IS_ERR(job)) {
> +		err = PTR_ERR(job);
> +		goto exit;
> +	}
> +
> +	xe_sched_job_arm(job);
> +	fence = dma_fence_get(&job->drm.s_fence->finished);
> +	xe_sched_job_push(job);
> +
> +	timeout = dma_fence_wait_timeout(fence, false, HZ);
> +	dma_fence_put(fence);
> +	if (timeout < 0)
> +		err = timeout;
> +	else if (!timeout)
> +		err = -ETIME;
> +exit:
> +	return err;
> +}
> +
> +static void write_cs_mi_lri(struct xe_bb *bb, const struct xe_oa_reg *reg_data, u32 n_regs)
> +{
> +	u32 i;
> +
> +#define MI_LOAD_REGISTER_IMM_MAX_REGS (126)
> +
> +	for (i = 0; i < n_regs; i++) {
> +		if ((i % MI_LOAD_REGISTER_IMM_MAX_REGS) == 0) {
> +			u32 n_lri = min_t(u32, n_regs - i,
> +					  MI_LOAD_REGISTER_IMM_MAX_REGS);
> +
> +			bb->cs[bb->len++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(n_lri);
> +		}
> +		bb->cs[bb->len++] = reg_data[i].addr.addr;
> +		bb->cs[bb->len++] = reg_data[i].value;
> +	}
> +}
> +
> +static int num_lri_dwords(int num_regs)
> +{
> +	int count = 0;
> +
> +	if (num_regs > 0) {
> +		count += DIV_ROUND_UP(num_regs, MI_LOAD_REGISTER_IMM_MAX_REGS);
> +		count += num_regs * 2;
> +	}
> +
> +	return count;
> +}
> +
> +static void xe_oa_free_oa_buffer(struct xe_oa_stream *stream)
> +{
> +	xe_bo_unpin_map_no_vm(stream->oa_buffer.bo);
> +}
> +
> +static void xe_oa_free_configs(struct xe_oa_stream *stream)
> +{
> +	struct xe_oa_config_bo *oa_bo, *tmp;
> +
> +	xe_oa_config_put(stream->oa_config);
> +	llist_for_each_entry_safe(oa_bo, tmp, stream->oa_config_bos.first, node)
> +		free_oa_config_bo(oa_bo);
> +}
> +
> +#define HAS_OA_BPC_REPORTING(xe) (GRAPHICS_VERx100(xe) >= 1255)
> +
> +static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
> +{
> +	u32 sqcnt1;
> +
> +	/*
> +	 * Wa_1508761755:xehpsdv, dg2
> +	 * Enable thread stall DOP gating and EU DOP gating.
> +	 */
> +	if (stream->oa->xe->info.platform == XE_DG2) {
> +		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN,
> +					  _MASKED_BIT_DISABLE(STALL_DOP_GATING_DISABLE));
> +		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN2,
> +					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
> +	}
> +
> +	/* Make sure we disable noa to save power. */
> +	xe_mmio_rmw32(stream->gt, RPM_CONFIG1, GT_NOA_ENABLE, 0);
> +
> +	sqcnt1 = SQCNT1_PMON_ENABLE |
> +		 (HAS_OA_BPC_REPORTING(stream->oa->xe) ? SQCNT1_OABPC : 0);
> +
> +	/* Reset PMON Enable to save power. */
> +	xe_mmio_rmw32(stream->gt, XELPMP_SQCNT1, sqcnt1, 0);
> +}
> +
> +static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream)
> +{
> +	struct xe_bo *bo;
> +
> +	BUILD_BUG_ON_NOT_POWER_OF_2(XE_OA_BUFFER_SIZE);
> +	BUILD_BUG_ON(XE_OA_BUFFER_SIZE < SZ_128K || XE_OA_BUFFER_SIZE > SZ_16M);
> +
> +	bo = xe_bo_create_pin_map(stream->oa->xe, stream->gt->tile, NULL,
> +				  XE_OA_BUFFER_SIZE, ttm_bo_type_kernel,
> +				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	stream->oa_buffer.bo = bo;
> +	stream->oa_buffer.vaddr = bo->vmap.vaddr;
> +	return 0;
> +}
> +
> +static struct xe_oa_config_bo *
> +__xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_config)
> +{
> +	struct xe_oa_config_bo *oa_bo;
> +	size_t config_length;
> +	struct xe_bb *bb;
> +
> +	oa_bo = kzalloc(sizeof(*oa_bo), GFP_KERNEL);
> +	if (!oa_bo)
> +		return ERR_PTR(-ENOMEM);
> +
> +	config_length = num_lri_dwords(oa_config->regs_len);
> +	config_length = ALIGN(sizeof(u32) * config_length, XE_PAGE_SIZE) / sizeof(u32);
> +
> +	bb = xe_bb_new(stream->gt, config_length, false);
> +	if (IS_ERR(bb))
> +		goto err_free;
> +
> +	write_cs_mi_lri(bb, oa_config->regs, oa_config->regs_len);
> +
> +	oa_bo->bb = bb;
> +	oa_bo->oa_config = xe_oa_config_get(oa_config);
> +	llist_add(&oa_bo->node, &stream->oa_config_bos);
> +
> +	return oa_bo;
> +err_free:
> +	kfree(oa_bo);
> +	return ERR_CAST(bb);
> +}
> +
> +static struct xe_oa_config_bo *xe_oa_alloc_config_buffer(struct xe_oa_stream *stream)
> +{
> +	struct xe_oa_config *oa_config = stream->oa_config;
> +	struct xe_oa_config_bo *oa_bo;
> +
> +	/* Look for the buffer in the already allocated BOs attached to the stream */
> +	llist_for_each_entry(oa_bo, stream->oa_config_bos.first, node) {
> +		if (oa_bo->oa_config == oa_config &&
> +		    memcmp(oa_bo->oa_config->uuid, oa_config->uuid,
> +			   sizeof(oa_config->uuid)) == 0)
> +			goto out;
> +	}
> +
> +	oa_bo = __xe_oa_alloc_config_buffer(stream, oa_config);
> +out:
> +	return oa_bo;
> +}
> +
> +static int xe_oa_emit_oa_config(struct xe_oa_stream *stream)
> +{
> +#define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
> +	struct xe_oa_config_bo *oa_bo;
> +	int err, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
> +
> +	oa_bo = xe_oa_alloc_config_buffer(stream);
> +	if (IS_ERR(oa_bo)) {
> +		err = PTR_ERR(oa_bo);
> +		goto exit;
> +	}
> +
> +	err = xe_oa_submit_bb(stream, oa_bo->bb);
> +
> +	/* Additional empirical delay needed for NOA programming after registers are written */
> +	usleep_range(us, 2 * us);
> +exit:
> +	return err;
> +}
> +
> +static u32 oag_report_ctx_switches(const struct xe_oa_stream *stream)
> +{
> +	/* If user didn't require OA reports, ask HW not to emit ctx switch reports */
> +	return _MASKED_FIELD(OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS,
> +			     stream->sample ?
> +			     0 : OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS);
> +}
> +
> +static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
> +{
> +	u32 oa_debug, sqcnt1;
> +
> +	/*
> +	 * Wa_1508761755:xehpsdv, dg2
> +	 * EU NOA signals behave incorrectly if EU clock gating is enabled.
> +	 * Disable thread stall DOP gating and EU DOP gating.
> +	 */
> +	if (stream->oa->xe->info.platform == XE_DG2) {
> +		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN,
> +					  _MASKED_BIT_ENABLE(STALL_DOP_GATING_DISABLE));
> +		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN2,
> +					  _MASKED_BIT_ENABLE(DISABLE_DOP_GATING));
> +	}
> +
> +	/* Disable clk ratio reports */
> +	oa_debug = OAG_OA_DEBUG_DISABLE_CLK_RATIO_REPORTS |
> +		OAG_OA_DEBUG_INCLUDE_CLK_RATIO;
> +
> +	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_debug,
> +			_MASKED_BIT_ENABLE(oa_debug) |
> +			oag_report_ctx_switches(stream));
> +
> +	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_ctx_ctrl, stream->periodic ?
> +			(OAG_OAGLBCTXCTRL_COUNTER_RESUME |
> +			 OAG_OAGLBCTXCTRL_TIMER_ENABLE |
> +			 REG_FIELD_PREP(OAG_OAGLBCTXCTRL_TIMER_PERIOD_MASK,
> +					stream->period_exponent)) : 0);
> +
> +	/*
> +	 * Initialize Super Queue Internal Cnt Register
> +	 * Set PMON Enable in order to collect valid metrics
> +	 * Enable bytes per clock reporting
> +	 */
> +	sqcnt1 = SQCNT1_PMON_ENABLE |
> +		 (HAS_OA_BPC_REPORTING(stream->oa->xe) ? SQCNT1_OABPC : 0);
> +
> +	xe_mmio_rmw32(stream->gt, XELPMP_SQCNT1, 0, sqcnt1);
> +
> +	return xe_oa_emit_oa_config(stream);
> +}
> +
> +static int xe_oa_stream_init(struct xe_oa_stream *stream,
> +			     struct xe_oa_open_param *param)
> +{
> +	struct xe_oa_unit *u = param->hwe->oa_unit;
> +	struct xe_gt *gt = param->hwe->gt;
> +	int ret;
> +
> +	stream->exec_q = param->exec_q;
> +	stream->poll_period_ns = DEFAULT_POLL_PERIOD_NS;
> +	stream->hwe = param->hwe;
> +	stream->gt = stream->hwe->gt;
> +	stream->oa_buffer.format = &stream->oa->oa_formats[param->oa_format];
> +
> +	stream->sample = param->sample;
> +	stream->periodic = param->period_exponent > 0;
> +	stream->period_exponent = param->period_exponent;
> +
> +	stream->oa_config = xe_oa_get_oa_config(stream->oa, param->metric_set);
> +	if (!stream->oa_config) {
> +		drm_dbg(&stream->oa->xe->drm, "Invalid OA config id=%i\n", param->metric_set);
> +		ret = -EINVAL;
> +		goto exit;
> +	}
> +
> +	/* Take runtime pm ref and forcewake to disable RC6 */
> +	xe_pm_runtime_get(stream->oa->xe);
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +
> +	ret = xe_oa_alloc_oa_buffer(stream);
> +	if (ret)
> +		goto err_fw_put;
> +
> +	stream->k_exec_q = xe_exec_queue_create(stream->oa->xe, NULL,
> +						BIT(stream->hwe->logical_instance), 1,
> +						stream->hwe, EXEC_QUEUE_FLAG_KERNEL, 0);


Hi Ashutosh,


On i915 the changes of configuration were pipelined in the application's 
execution just like any other submission.

Creating another queue completely unsynchronized from the application's 
submissions makes this non usable in my opinion.


-Lionel


> +	if (IS_ERR(stream->k_exec_q)) {
> +		ret = PTR_ERR(stream->k_exec_q);
> +		drm_err(&stream->oa->xe->drm, "gt%d, hwe %s, xe_exec_queue_create failed=%d",
> +			stream->gt->info.id, stream->hwe->name, ret);
> +		goto err_free_oa_buf;
> +	}
> +
> +	ret = xe_oa_enable_metric_set(stream);
> +	if (ret) {
> +		drm_dbg(&stream->oa->xe->drm, "Unable to enable metric set\n");
> +		goto err_put_k_exec_q;
> +	}
> +
> +	drm_dbg(&stream->oa->xe->drm, "opening stream oa config uuid=%s\n",
> +		stream->oa_config->uuid);
> +
> +	WRITE_ONCE(u->exclusive_stream, stream);
> +
> +	spin_lock_init(&stream->oa_buffer.ptr_lock);
> +	mutex_init(&stream->stream_lock);
> +
> +	return 0;
> +
> +err_put_k_exec_q:
> +	xe_oa_disable_metric_set(stream);
> +	xe_exec_queue_put(stream->k_exec_q);
> +err_free_oa_buf:
> +	xe_oa_free_oa_buffer(stream);
> +err_fw_put:
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_pm_runtime_put(stream->oa->xe);
> +	xe_oa_free_configs(stream);
> +exit:
> +	return ret;
> +}
> +
> +static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> +					  struct xe_oa_open_param *param)
> +{
> +	struct xe_oa_stream *stream;
> +	int stream_fd;
> +	int ret;
> +
> +	/* We currently only allow exclusive access */
> +	if (param->hwe->oa_unit->exclusive_stream) {
> +		drm_dbg(&oa->xe->drm, "OA unit already in use\n");
> +		ret = -EBUSY;
> +		goto exit;
> +	}
> +
> +	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
> +	if (!stream) {
> +		ret = -ENOMEM;
> +		goto exit;
> +	}
> +
> +	stream->oa = oa;
> +	ret = xe_oa_stream_init(stream, param);
> +	if (ret)
> +		goto err_free;
> +
> +	/* Hold a reference on the drm device till stream_fd is released */
> +	drm_dev_get(&stream->oa->xe->drm);
> +
> +	return stream_fd;
> +err_free:
> +	kfree(stream);
> +exit:
> +	return ret;
> +}
> +
>   /*
>    * OA timestamp frequency = CS timestamp frequency in most platforms. On some
>    * platforms OA unit ignores the CTC_SHIFT and the 2 timestamps differ. In such
> @@ -419,6 +808,10 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
>   		oa_freq_hz = div64_u64(NSEC_PER_SEC, oa_period);
>   		drm_dbg(&oa->xe->drm, "Using periodic sampling freq %lld Hz\n", oa_freq_hz);
>   	}
> +
> +	mutex_lock(&param.hwe->gt->oa.gt_lock);
> +	ret = xe_oa_stream_open_ioctl_locked(oa, &param);
> +	mutex_unlock(&param.hwe->gt->oa.gt_lock);
>   err_exec_q:
>   	if (ret < 0 && param.exec_q)
>   		xe_exec_queue_put(param.exec_q);
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> index b5c1a47c8988..91ecb1a0c7cc 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -14,6 +14,8 @@
>   #include <drm/xe_drm.h>
>   #include "regs/xe_reg_defs.h"
>   
> +#define XE_OA_BUFFER_SIZE SZ_16M
> +
>   enum xe_oa_report_header {
>   	HDR_32_BIT = 0,
>   	HDR_64_BIT,
> @@ -137,4 +139,81 @@ struct xe_oa {
>   	/** @oa_unit_ids: tracks oa unit ids assigned across gt's */
>   	u16 oa_unit_ids;
>   };
> +
> +/** @xe_oa_buffer: State of the stream OA buffer */
> +struct xe_oa_buffer {
> +	/** @format: data format */
> +	const struct xe_oa_format *format;
> +
> +	/** @format: xe_bo backing the OA buffer */
> +	struct xe_bo *bo;
> +
> +	/** @vaddr: mapped vaddr of the OA buffer */
> +	u8 *vaddr;
> +
> +	/** @ptr_lock: Lock protecting reads/writes to head/tail pointers */
> +	spinlock_t ptr_lock;
> +
> +	/** @head: Cached head to read from */
> +	u32 head;
> +
> +	/** @tail: The last verified cached tail where HW has completed writing */
> +	u32 tail;
> +};
> +
> +/**
> + * struct xe_oa_stream - state for a single open stream FD
> + */
> +struct xe_oa_stream {
> +	/** @oa: xe_oa backpointer */
> +	struct xe_oa *oa;
> +
> +	/** @gt: gt associated with the oa stream */
> +	struct xe_gt *gt;
> +
> +	/** @hwe: hardware engine associated with this oa stream */
> +	struct xe_hw_engine *hwe;
> +
> +	/** @stream_lock: Lock serializing stream operations */
> +	struct mutex stream_lock;
> +
> +	/** @sample: true if DRM_XE_OA_PROP_SAMPLE_OA is provided */
> +	bool sample;
> +
> +	/** @exec_q: Exec queue corresponding to DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID */
> +	struct xe_exec_queue *exec_q;
> +
> +	/** @k_exec_q: kernel exec_q used for OA programming batch submissions */
> +	struct xe_exec_queue *k_exec_q;
> +
> +	/** @enabled: Whether the stream is currently enabled */
> +	bool enabled;
> +
> +	/** @oa_config: OA configuration used by the stream */
> +	struct xe_oa_config *oa_config;
> +
> +	/** @oa_config_bos: List of struct @xe_oa_config_bo's */
> +	struct llist_head oa_config_bos;
> +
> +	/** @poll_check_timer: Timer to periodically check for data in the OA buffer */
> +	struct hrtimer poll_check_timer;
> +
> +	/** @poll_wq: Wait queue for waiting for OA data to be available */
> +	wait_queue_head_t poll_wq;
> +
> +	/** @pollin: Whether there is data available to read */
> +	bool pollin;
> +
> +	/** @periodic: Whether periodic sampling is currently enabled */
> +	bool periodic;
> +
> +	/** @period_exponent: OA unit sampling frequency is derived from this */
> +	int period_exponent;
> +
> +	/** @oa_buffer: OA buffer for the stream */
> +	struct xe_oa_buffer oa_buffer;
> +
> +	/** @poll_period_ns: hrtimer period for checking OA buffer for available data */
> +	u64 poll_period_ns;
> +};
>   #endif


