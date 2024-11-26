Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44CBD66B8E
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 23:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABDD10E0CC;
	Tue, 26 Nov 2024 23:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iEywM4Em";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF7910E0CC
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Nov 2024 23:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732663473; x=1764199473;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VVAh9RByPpWrUFKrxyyjVfh1IIv2CG9SASaiMDM1zJQ=;
 b=iEywM4EmwsajO+gKkQocvPbwX82mTI+Vui2Fm/97Bk2yfsh1pssAZ+Ln
 ++keucgc/QgJZXPZi0zyMu9USXRZehh/xRvuc1hkDpbjAwRsiQssrSD0l
 uuNNAxLLVWNT2yd8VqepgcJos4MOiIO/UoFEsq6GqVTPyuemzvs3Bpffa
 xmPulHWgsKAHkKmkv1nhPvugvn2UsAynVfSMc9GUnW8bi1gxATxYtI+3a
 ICkM7M6dqf9YbSTq2gFJlWJ1gup6yw3GnMgS8YIkXDlm4PCci0bF/vTSP
 mdC7jmFk71qkwO4P74ECPLeW86ZVtdf8ZKtIYrLMM0fLEHPo+lWNnHYy3 g==;
X-CSE-ConnectionGUID: L8ZQOFKsT0KLAAx9g06NVQ==
X-CSE-MsgGUID: hUp1jrqkRpu6ShfZZCSG0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="35714609"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="35714609"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 15:24:33 -0800
X-CSE-ConnectionGUID: FYR9DhXVToed1Xd/eYdHcA==
X-CSE-MsgGUID: XHEmNhVGT7ulvFTP6ukA2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="95832024"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 15:24:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 15:24:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 15:24:31 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 15:24:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I80JZgJNDuFZDuVCyUptXTY1cHq9f9rXF0dNMZID7F9LBrxRbRdMiLfHCg46bIDkdkajHe+xJV8JgNY4uXyW7hph/Skr/NJROzL3YGTsjfE+XFHsqxMRZRPrBbupxbVf7l7BFRkGfkpYTv4JDY+b799t9VKUIgTVetxS+waOXuqLioYXPIbcup1qNQex5qT4phEQ7PQ+OMzLyjjjwxls+H9VSJy6e6scHUH5nPRbnQHk0nmsztNvWyoDWjIjX1vNVJPrcFqVcQdo7C7ZkN+43eiz7og1Mc0N7FVelsL5ZoeWd+sEaSaoCzApKtnJyrv2Td/v1d8pCSeZIPP4dZz00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIb+J17LqXl6iX8voYm3jCCgcf63RlQfVFpjUU3BTN4=;
 b=alv2OfQCbgE/huX0q0JtuVrAi2nSyjTzpaFzancDCz33BPDMY8CkcIWcbhfURvy2kIu7hx8rtBdy3Wp3nvdaqVr6iktJ30y9YhKu0TshpUQlJ1QSVgXVE9n7nLH/M7hqj/Ki3kr4hdgaTiQ2KGPW50UdGCLnwdOkQJ3qO9UthpLgJL31cTo5biew9XBxsTiMWqre52zvEd+ksyRD0oTH3FoKxM9hNJ7eGfj3PfH/oP0K5vuzpuxL/CdDgkN1tnFylfSB3zQulvm9KrcSIt5EvLqx7rzEMOhd98zTNQStP+BMCNZ2OhMdhIG6IHRw/WD8y5OTM4Oi1NSEadHK71hawQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CY5PR11MB6209.namprd11.prod.outlook.com (2603:10b6:930:27::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 23:24:28 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8207.010; Tue, 26 Nov 2024
 23:24:28 +0000
Message-ID: <efe270ad-c05a-4dc0-9864-7e848ce7d29c@intel.com>
Date: Tue, 26 Nov 2024 18:24:25 -0500
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Fix_missing_init_value_and_add_register_order_check_=28rev4?=
 =?UTF-8?Q?=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20241126201052.1937079-1-zhanjun.dong@intel.com>
 <173266257995.3524169.11677814577137452296@b555e5b46a47>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <173266257995.3524169.11677814577137452296@b555e5b46a47>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0044.namprd02.prod.outlook.com
 (2603:10b6:a03:54::21) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CY5PR11MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: de62fcef-edc3-415e-8075-08dd0e717916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjFwejRyQWpvSGlwTklhTzN4ODRQZnRaaExVQnNUTzlZdGl3UkFmTzUvN0Z6?=
 =?utf-8?B?R1huN3A5MG5sUGtnWmQ5RW40UGtaOFVKMVhDTjR0aTBTalBWOUpaU0lqMUxi?=
 =?utf-8?B?MzZBZVgvWU5zTTBoQklOZHJwQ1N2UUY3YnZja09lemZrakorNko4UXRNWFU5?=
 =?utf-8?B?RVNVakwrVCtVNEhLaGt5ZUxhYjRmazQyMXZIelMxUjZkanEyL1IxT2ZTZWdN?=
 =?utf-8?B?NHptZGJ2Q1k5UmhqS29rZmRFNlRvbnZYZXhWa3NrdXdURU5DeWRjbnNXd2lM?=
 =?utf-8?B?Zm9ETHBFbThaTFhqbks3YXkzcXZJVVFadHZuVzVGYWJaK29rVGdWRkZucGxR?=
 =?utf-8?B?Q0hsYjlqdUwzVjdsQVArYU1NT0J2UXd0VjJyVStMMDV2eS9XV2NwV1hqRnRU?=
 =?utf-8?B?Q1MyYnhZRnRzbmMwSm5wTm5Mdm1ZTzV4WDhzdndObWhWQ012WWVpcG5jR3o2?=
 =?utf-8?B?cUNkWlY0RGRvVkdOY1h2MXRkdDNVeGZCQXg1WXRmZld2VDRyL1dFWG05MVYv?=
 =?utf-8?B?RzR1Um1DV3ViUUhLK2xxUDRyeUI2ZTlXOWRtMlpnSkNQdHR3cVFQaUt5WU5F?=
 =?utf-8?B?UEZyZ3J5dVc1aVVnV0RuKzVSdkRLUmxJQ3ROb0sxbUR3L05VUjNLOTE5QXg5?=
 =?utf-8?B?R3AxUmt5cjRsbTNrN3hsazVkR241czhDUFNVZ3ZGc290eG1qTVUyVHRZQXlv?=
 =?utf-8?B?Y3JwUnFhNlpVUkxnTW9BVGpZTjZ6aEhYdlNjd2pHMVZvNTg0N3ljYktnWktH?=
 =?utf-8?B?dEZHUDRpVmszeXRpdXRWQzEzZTlvRStyVTRtT0djeDZZaDNWRlovQTMzMEtm?=
 =?utf-8?B?QlFoRGxPeThnb3ZRZ3VTZ2l6M1lJbkFxUTZYOTVsalk4MmM4azFLT0UwcW1Q?=
 =?utf-8?B?WXJlMGtkcnMyZTlOem5sZTVDR1IybnBMcjJIYVljRTJzWklvc3JkWFBwK0Q0?=
 =?utf-8?B?SGwzNmxGRFQwSTRjZnJHWWExNERoU3E2bTEwSEFnL0ZIZ1VKQndnMTY3R0lu?=
 =?utf-8?B?dWY1eHVMazE2cWNybjRxQVExd3RFbWlnWFVhNVpjZERnSDEzNGxpZEg2UlY0?=
 =?utf-8?B?WkFyNzhDVlJrdW5CR2dRTHRKOGtPWnIrbC9xTDh2Z1hsN3VqQlFHb1MwWk9O?=
 =?utf-8?B?NFBsaEdpK2lRNHpSR0x2dHcra0hhNWVmalRxNkZNNU90QjZtWlRlaEJqL0VF?=
 =?utf-8?B?TGR0SGN5SjJ1TnZwTkU2SzR5YmV6ck9yZTNmN1dEQWVDNnA5Z3lSbld4TkFU?=
 =?utf-8?B?czVkZU04N2dQd1lnMm5qbHZ1WjN1eUhtdjQvbVRDUS9zK3lEQTRBbnVmM1Bp?=
 =?utf-8?B?NS9jbWRnUExXR1VBQXZaV0F0TUY3SDJwSlR1YUYvTFk3bWVJZ1ZhVjcwbzlD?=
 =?utf-8?B?STE4VStrQlNMaDBWQzNLdkRRbUdPcVhLY0RKWXBzTDdQZnVFSkRvRmVPeTFY?=
 =?utf-8?B?SWswV2o2RjlmdVRIRVY0R3RORXpvMHRjYmlGUHhIc013NER3RWdwR2lmZ0pI?=
 =?utf-8?B?Uk5yR09oN2hWYVNqaHVEUHI4TGhwTU14d1BmWjloMlZUY3FwZE15ZGxrWm8r?=
 =?utf-8?B?QVM2dmx5a3MwMFdlSy94dzdTZ1dmWDdyRGJBQTZHL20yTWFENEdoSUpFNFdV?=
 =?utf-8?B?TjFFY3FjWElpd2Fqcm5rY3BtNEt0RnBMTGJmYU10M3VoMlBFZWtaclFyMjls?=
 =?utf-8?B?MjZyN2huNHZCNjUxbkJPT3NqV0IxcVNsSklKcGNieHdaK1JqSFlZMjJ5a1FM?=
 =?utf-8?Q?vaJil6YI4mUkS50PYQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHg3U2pIOE5RWGFwdWhaKytNaDhwaGlMTGV5U01seHgxcVg1blRqTkdyWHU5?=
 =?utf-8?B?R2M0YUdTWFl6QzNvVkZteEZER2NPdXByU3R6Z2lIYmhibU5BWE1zbytiL25v?=
 =?utf-8?B?WnlzMlRjUnhsa3hLeEh6clZqbWQ3ZzR5blU0OVpTZ2VxemQ4VDFXbnY3LzFi?=
 =?utf-8?B?T285YnRLUkpqTkE4b2tsMklDdEwvcER2bEo0R2o2SDBGUnMvNkR6YVltVlI3?=
 =?utf-8?B?b2V1aldSK2swRjc3VXZMRGpiZlhvdlhSelNEV0FRMTlJZy9ER3BLQVdBblMz?=
 =?utf-8?B?N200ZEU0ZzBJRlREWmFLWnlYWCtpd1RPNTFrVVlCVXF6K28vYWlIR0hDNWJV?=
 =?utf-8?B?NWo0ZERvUWZXYXgxcnB6ZzVVQ01MSUluZTdmMU1zUHMrNUs0UUxkN2dkQUQ1?=
 =?utf-8?B?c1l2aVhSSGxQdmNKWDc0N2ZaeUFGMWdkb2NqTzJyQXU0YTZkWU0xV1BhZXk1?=
 =?utf-8?B?NjNzWVhMVERJYzJoNmJ5ellYN2JWcnF2NEZpS3IvMGh5QklpWjlMSmpqV3c3?=
 =?utf-8?B?Tmg0U0NFQzJLODN5WWNNNitQb2pUcjdpQUYxSG54QjFRN3p0RFI3b1hsNFFy?=
 =?utf-8?B?ZVR5USs4aXBlSjgyUDRKdWJ0Z0hSK09xUzVuc2w3S2tmcFhyQloyamtQaERy?=
 =?utf-8?B?bThyZXc5cFdPaHJhcDh0SE1yZ1JUMmc5VThXK1c5T3lnS2VOMzNabUJFRGxY?=
 =?utf-8?B?ODJmRXpNdGx4KzIxMG00QWpuRkM1c3lYQVJSOEQ2b0JqNE93MGppQzZHZkZ0?=
 =?utf-8?B?VE9zOWVScy9hK1BPdTNpRGk2aXlmTkhrbklqU3k2bmpQcWZabHNjUFRibkF2?=
 =?utf-8?B?dFZOUnplY3hSTlh2VEtXQU1USFJvczg5VUFDVHkrbkZseHdyalZsMVRUejBH?=
 =?utf-8?B?TUpKam85U05vYjVHM0o1RmRjV3o1NXVLM0tWRG9Od2wxT0FENkhSVFRYTlNw?=
 =?utf-8?B?SS8wL3FiMW5raVJsUDhyN0JLZElOSjJiVEUyZkdpVEl6ODEwL2d0Z0pDWUN0?=
 =?utf-8?B?Ky9NbjlkbGpKUVZnYUhJY0NDNjA4UFFMMkNsWGp0WHdqWkRubHBEc3lRa1ZE?=
 =?utf-8?B?eGxiVGYrSFZ1RVlIOFYyb3VTUlcvOXllanpLRnBQbVdxcHRkWlY3Y1JuSDlZ?=
 =?utf-8?B?aUFOTjA1MlNnbUtNTTZzamI2WTFTeHdkUThzV1NaZ0xMaEJFeUk0UGErcExx?=
 =?utf-8?B?emIwanFhdkk2UEhzQS83NmN1a0diSHFNTlF1R2kzMGJ4cm5hSkprY2ZncnJH?=
 =?utf-8?B?azdFZHczZlp4Ym9ubGVlN1BwY09wNEh5K3pDSDlMVk9ReTdjeXNQdjVFOWYz?=
 =?utf-8?B?dEI5RWNnalFaUzZvQTJkT0dUR1g0MzJNcE5hbGJIMzd4N1hDZnRobmZqcU9H?=
 =?utf-8?B?SjVuQVRUNnl3UVJWbzdLWVJzNzREVHJyQUY4bjJtL0hZUGRLLzdBOEptZWs3?=
 =?utf-8?B?bXV1RkNFNkpuTTZpTXVUbmRUVzRubzBzOU5Yb3YxY1JIZ283c1NMN3NOWUJD?=
 =?utf-8?B?WGJKWGVvVDhFcHZYT1lUT1pGZkZsOGpsUlJnL2hOL01zQUdxdjd5dURZVkdF?=
 =?utf-8?B?R3FUbmI5RGp6UTRLZmpIV3Zhbjh3VjdIU3lXcG0waWZrcitwbnBDdndZNzlo?=
 =?utf-8?B?cjNzbGhqTHpPc0lMM3RDY2tNcEc1SjhxdmxXeW93LzUvbUlheWhSaHN0dnJr?=
 =?utf-8?B?K1VobVh4cGFjT0cvb3NFbkw4VWl0M2tMUHUvREdkYkpUVndxQkRXdVJGcTFy?=
 =?utf-8?B?eXpTcm5HTENXbDF2Vk9NQnI0d3lodkhQbklDQlh2N1ljSUwxbTZnV3B5VWgv?=
 =?utf-8?B?M1BZd0NVS2h0R0NJVjNoMHEyTTk4alhvUWFmNUFaUGVkZ0NQWVBLYmlpS2J4?=
 =?utf-8?B?cFhBOEJENEw3Qm5tZEZsZklpUXNPV3k1WVRmSUdyTExhQk9hM3Z6cmtFYVUy?=
 =?utf-8?B?T25QVHpBMVVoeXZhSTA2aFJpWXpPZFBuNG9icVE5VmhmQXBmV00vRFM3MU9z?=
 =?utf-8?B?SGNVb2F2QW00U1RuZnp6WDAzc1BMUGt6bUhSOTU5dXluTFNiOGhoUkNnYldZ?=
 =?utf-8?B?T2pucVgvZmtZd0xCekV1NW1pUnZtMHJXWUNUOGQvcVppekVySmo1aEoyNkRp?=
 =?utf-8?B?ZXl3Mzg1QXI2UUtMOGxYb1UyeFlOcmJHVmxSU3gwdy9KbFczejZjUGE5NVRa?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de62fcef-edc3-415e-8075-08dd0e717916
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 23:24:28.3868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6Smm4gmsySVvzY1OPqMH/CcY6JuwffavRPYIOQGpMLe2pIme+b93r+ZO9hGoODG/eMYpMa//YGdMGszoi83DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6209
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

Overall, all failures is not related to this patch.
Details listed below.

Regards,
Zhanjun

On 2024-11-26 6:09 p.m., Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/guc: Fix missing init value and add register order 
> check (rev4)
> *URL:*	https://patchwork.freedesktop.org/series/140889/ <https:// 
> patchwork.freedesktop.org/series/140889/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v4/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v4/ 
> index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198_full -> xe-
>   pw-140889v4_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-140889v4_full absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-140889v4_full, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-140889v4_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@core_getversion@basic:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/
>         igt@core_getversion@basic.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v4/shard-bmg-1/
>         igt@core_getversion@basic.html>
The failed test about:
drmtest-WARNING: No card matches the filter!
is not related to this patch.

>   *
> 
>     igt@kms_plane_cursor@viewport@pipe-c-edp-1-size-128:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-4/
>         igt@kms_plane_cursor@viewport@pipe-c-edp-1-size-128.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-140889v4/shard-lnl-6/igt@kms_plane_cursor@viewport@pipe-c-
>         edp-1-size-128.html> +1 other test incomplete
The incomplete test is not related to this patch.

>   *
> 
>     igt@kms_rmfb@close-fd@pipe-b-hdmi-a-3:
> 
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v4/shard-bmg-7/igt@kms_rmfb@close-
>         fd@pipe-b-hdmi-a-3.html> +3 other tests dmesg-warn
The failure about
pipe_off wait timed out
is not related to this patch.
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-6/
>         igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-
>         async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1231>) -> DMESG-FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v4/shard-adlp-2/
>         igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-
>         async-flip.html>
The failure about
*ERROR* CPU pipe A FIFO underrun
is not related to this patch.
>   *
> 
>     igt@kms_rmfb@close-fd:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/
>         igt@kms_rmfb@close-fd.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v4/shard-
>         bmg-7/igt@kms_rmfb@close-fd.html>
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         xe_device_create.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v4/shard-
>         bmg-7/igt@xe_fault_injection@inject-fault-probe-function-
>         xe_device_create.html>
The above 2 failures about
pipe_off wait timed out
is not related to this patch.
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-140889v4_full that come from known 
> issues:
...
