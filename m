Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3CFCA6017
	for <intel-xe@archiver.kernel.org>; Sat, 10 Oct 2026 06:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFE710EB7D;
	Sat, 10 Oct 2026 06:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lkq6BxIr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852FA10E9EC;
 Sat, 10 Oct 2026 06:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791614725; x=1823150725;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uqHNHo2Ds1eZ7dmyzNSWhQpGX/o8rRQSJVfiSiFTmFY=;
 b=Lkq6BxIrWI1iU74QVDa2JnWfkg0eq6uAX8dLakfMPMeZeQzlYkERG2g7
 xklgIrKaOM1lOCp1r2O3EaW5b6UIrMFFqhyNIPdTBhX8ux6hCvchZgE1G
 wsVW/LlHD3IkcviryU7XDA0p6C8XSTS+iOgen/J4+O6IziWCZlwMGL3H5
 dj3YArvzV0JPGqNqXAkpwGN533lgoaKSS6WreB9rMBnuwqjqgpPwwkKq0
 wzhLPkcWo5KzaZaKx0SOBG+2uiBWcmQu9+ecJlsY6RauQJUOXSr8Ybqnz
 kJGXHSwxuPfaTXNepWycGCabw9WKk5gV+bhbya1qhcwMFj3CdZ5LT0lQM g==;
X-CSE-ConnectionGUID: AczjC/TnTTWT8xjGkBBBHw==
X-CSE-MsgGUID: lpBUkOFuRWm5ptABXzS7AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="401885"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="401885"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 23:45:24 -0700
X-CSE-ConnectionGUID: n/HlKRzCTe2NQvH8zdG80w==
X-CSE-MsgGUID: Ok5UEsBCSjaoHWkaV8R4Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="414277"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 23:45:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 23:45:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 23:45:24 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 23:45:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCzsUSPjTkc17kBjhXO+0NL7uGiVN5MghoozwREkm0dxY5k3HJoCRYS+oQ4n2QDY+7kZHuX6okAlFa6G4LNkl0IV+4g81N5ZTK92kuNhb1DQCRKfmPktdtHWtMB9WN6wtRwVB8WbTcKAMEiPl0s/4wFWpYdiTq4fagdSvPa6iMUrVcR5/K+FPlAbgsHIoVIZcUy8b23G5zU+x7wq+qnZzkN0ASf8wmiPkrs6ZXpdyBtwgsdQqROPNK2RQNNXQ68KPCSPtbTAHkaJHTZjcObHp5ly5Us175Iegl1qAgIkCqI42YO2LscX6SGzmWOt3xaFluoDsiaDRozyUgJGwXDzWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRj4SkCiVSPVDospPeR6zTOB3NuTzYA9yCIqqvqEjcM=;
 b=a/zXSgHrjkFjbaXtO24NnjZZ+oNimUE1Rz318ReFpsgIX2kWsvhUXqHgT0BNCCc+Dqj655SnhcaKsKJ0SMZQP3dCvb5uTGq7KGSfyGbqGjbAkxaOeZxAOhM7KqjphiLWA9+Du/3CJnsHsmnxD1oArRv6/PzMsPL6+Bw7t6d8SJ6M8fd00NnUIPpcagEwjtqs7K8TUv1IbKCNAWdaiTry3bNDSAm6MqPM5x6AJL5OfSpYeaG1XUi4VY0NxvPQAnHUe6jx3fMWmryDDwxWOS/koBvKZv6UuyO3P3ofGqC54welIX2s7jruzlDGEPn+j3WpIzga96rAO/r0W+Hx5JvUOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by PH7PR11MB7449.namprd11.prod.outlook.com
 (2603:10b6:510:27a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Sat, 10 Oct
 2026 06:45:18 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0496.015; Sat, 10 Oct 2026
 06:45:18 +0000
Message-ID: <e9a7ed12-af19-4695-9ca7-8bb7fd83638f@intel.com>
Date: Sat, 10 Oct 2026 12:15:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] drm/i915/gmbus: Add bit-banging debugfs control
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
CC: <jani.nikula@intel.com>
References: <20260928121940.728102-1-ramanaidu.naladala@intel.com>
 <20260928121940.728102-2-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260928121940.728102-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::13) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|PH7PR11MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: b5c24a0c-807a-4b75-7f74-08df269a0c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|261009223027099003|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: FKiRwnxJ2+A5mGjsCRfgbjAb3nkPpdF9xSLt9iCj5tjld/vgp5Q+whssnekf0x7NQi9XknWDKS6QW6UdpeN8LJnGFJs3XIni8QyQF5skF1KEsQxxvwYLyNya6mLXYrbljSJcsCOS2NpbP7CojOdoWcnQPFfXV+0zncmsTcWxOcrrUEmFZjS23bU8hIac7hy7k34SPLIpnue6T3Yq9t5joDZMjlnUXqzv4XvoYRqLQ3XGYuQ6dG4BJ710EarbhzOuFKt5NPGLb78HZ2cxjtmNX72r5wpPUzBijg+oxGqI8nBLtXpvg1mq9SyJ8ey3b3IdefpaT0wJbRG4Yjf5igxDDwCRodK4Fhjh6IOATeNJ0qrj57IoS/ni1TDWWQuhC8shI10cF7F/fiNjmtMOU6AhfosMylfucW/Mcn7NfwsKsAo8hdoGPUsFGWa4aXTCtm+LuGluBvADCCsOW8Oj6HtNL7gYb5Dw/Q12B4iIky/Z+y3h17F9HZpoegwtkzNo+0YX59T937DJDyGCETN9q0v5RAQWPOilBk9nl+DkXFcG3ChY47ZfnJwy7ew9NBaTTBUz7l981r2yaIWUEMqGakQKM6Vlm0VMMOSQAnLPeoCIRq7POYKElAZUAR5KBYkuq/3kyUrerqilOO84JzJJcxs9hUODh6sMUjjN9p+FKVABBPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(261009223027099003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0k4V25LSTBGR3k1bzFLTXpLemo3eDJ0RWZrMUIxQzI0Nm9MS2RjejR0REEw?=
 =?utf-8?B?MXgveTYzbkdyUGFvMnlCWEt6S1kvOE5uUDlXVXVmSm54UmpFN3B6RCtWT3pU?=
 =?utf-8?B?cG5rK2ZWL3g4MklTbHBWbzBLT3pwY0g4VjJ5RmtjbFYrZjMwenhadk9xLzN1?=
 =?utf-8?B?cFpDOEdTS1VKUHJkT1VDZGM4N1ZCbUVzRG1nN01FUlpnNW9lUmxzYXZDcTUr?=
 =?utf-8?B?MzBLVlovQzQwbzNvUVhXeSsyeWtQNi9GSy92alhjYjd6bHNJVTk3cHRrZkcw?=
 =?utf-8?B?U0o2aVZnNTgzdjd5WWhwaDE2ekluRlRvcTRxQ0k3eVFrYmlwYXJJdDFjOStL?=
 =?utf-8?B?ekQ0Z3F2LytrZVlmdDJPUUJaWkRnOFY2QndRNDRCUkJIdk45emh3cjROVmNt?=
 =?utf-8?B?MUp5TmRVNlRPQUxRYS9iOCtNQWFRN0FWMjJiMTB0MDlTaTc3cEVka3F0YVIz?=
 =?utf-8?B?YnhqYkFlYi9Hem9pWmJTb28vandTT2hFd0hOR0oyYStEUVgxbE9mZkpiQUcw?=
 =?utf-8?B?Z2I5WjNmeThrbzBlYThSK1ppWFJKWUJ2U1RJOWRVZzFhQTFkZUpCNlZZNk9K?=
 =?utf-8?B?YUtZTHpRdFJBYjlGZFFETUZFb1N2c0t5MUZjTXFTVEV0eTRpUktMd0g0Rzkw?=
 =?utf-8?B?Tm04Q3Y4aVpPbjcwM3VDSGdMb2w2UVNiMStwSmwyRENOVjdFMzBoTGFqMUIx?=
 =?utf-8?B?UGQ4TmlOTE85V3hrU2VvRmVkZlRpemltek1WVlhaZ29DNUp3eXZVQ3R1R3ZX?=
 =?utf-8?B?RExydEQvdUcwWUsxV2dBNzl6bDgrbEZnZ2tUTkNQakxzdDBaZnlUZ0xsSTlt?=
 =?utf-8?B?S2tJYWdJaHE5Y2JwaWUvWlhNdnFBejBEUnpEamxoV0F6RjlBajB3aU82bExr?=
 =?utf-8?B?SmVFOUJDSUEwVENKT1FyeGdMYTNCVTlpNGxIU0UvZVlSazN4M3dMaE94dWZs?=
 =?utf-8?B?eFVCcFc0ejZEUkJtOGxQa3h4WVJIYWtxYTcyUndqc3h4cUd1TjBxcG9VMVI3?=
 =?utf-8?B?RGs3YnNPODVxUlB3Nm14YzQyZmxmb2I2dENpcUt3WTduVzBjdTZmR1MvOVVM?=
 =?utf-8?B?SUFLWEcxZW1PdHdYV1I2dEVQVEVsRG1NUTZNWVk4WURPTGhDcXVDSGxxWTl0?=
 =?utf-8?B?Yk5nbWpmZGwvUHhRRTdRV3pPYnBzK3hpczN4U0Qybkw5ekQxTEI0TTdWek5X?=
 =?utf-8?B?OUNyT2JTTXR5eE9WVWdtanRuRy9XK3dlUTJWV2xYd2kwUnN4cjJkeWk1dXNQ?=
 =?utf-8?B?b0lYMXFRUVJFUVZXYm9CWHlaQWJDU01UTXJzdmFhWDNlWGgxT3BySWk4bW5a?=
 =?utf-8?B?aVlVWnpZV2drZkp4MUorUW4vMDh4UmJ0bDJLYUp3Mlo5elZ5SzNyYkgwUmc1?=
 =?utf-8?B?NkZ2YVlOUVpGemJvUlBYVDRKY1NJOHg2Y0RxTXVCZEs0dEUxUDVEOFFWTWdV?=
 =?utf-8?B?Zmk4QmQ0bWh1TGhqYm1MY3hsdk1LRlBWYTNqdEY2T3NMOFpGVTkweFY2K001?=
 =?utf-8?B?aHRxWWdhK053aC9BQXRoQnREd1FMNFZsOU53NEtwWXlZTittSHJsSFdrVGlM?=
 =?utf-8?B?cWM5UkptNVdVNGtLUVBsWG5lY2xEa2ZlenJKUDJqeG1tT3JzeUQ1SVVWb01T?=
 =?utf-8?B?TEdMNCsvSGZCMlpwU3R6S0VVUmhsVTlxdTFUYXBweDBla2lxQXVtZTl6Ylcw?=
 =?utf-8?B?RGhXRk16ZWhPM3RGUHJxMUZJd2xhUUlUTHFrY3NnN0NsUnZmcGNRdi9uRlZE?=
 =?utf-8?B?K0RDUU94REFhWGhCaFZXcUpJaUtWa0Y3aUUvRXlFS3UvY0lUdEVubk9iRHJ6?=
 =?utf-8?B?Q1h3MGRjOVdKL0VJZ3NqYTJ0S1l6NVkwOWhBUnYvQTFRUkpmZ0R4VVltUlhH?=
 =?utf-8?B?bDNqWk16T2tTQmdCakJCaDdTQ0E3eWlwYkRKYU85dDZ2MHBQcGdJS3M5VHRy?=
 =?utf-8?B?enpvMDJZYmo2Q3ZUZ1NTbDJ3K3g1QmR2U1lQdlh5cVg0blZGZ1BDcjBpeDRK?=
 =?utf-8?B?cThSY0JDVDFBeit6N0JGazA5QnBpWWR2VVhmcGl0ckFXbmd4eWhqQU5KR21k?=
 =?utf-8?B?VkhtYkhESzQ2ODNEeldUbE04aGVUbThpWHJGM3hNZ0NzcnpWRHdNNnFPYXdy?=
 =?utf-8?B?K2IvV1daVnJHbnQyS0MwUGErMFZKVXFZT2JyMmlEYmpVZFczTEZ2NzkyVGRQ?=
 =?utf-8?B?RGptYTA0QWxtSjM5SmFYWUpzNVRSdzZqN3h3QkhlNmFLKzBleVkrNTkwcG1F?=
 =?utf-8?B?QWJ2TEhvZVZwWXR1bno0c0w5ejhYWDBjUHBTU1BNYW5CSk1POWFJYWsxRUo3?=
 =?utf-8?B?OUtUK0szWm55Zmt1SzcwK1c4L0JyazcycmovVk9jaGpYSng5VVc3Y0JjYXFv?=
 =?utf-8?Q?RDwn7DZRbzdslhgQ=3D?=
X-Exchange-RoutingPolicyChecked: CjD3+l4O8m82Kcm8vNLk7i22SU69Gsk5yiy6oiqdACpo2MKWDurS7w3OVAbAId9o1mv4p4WZCcUZGdjHts0DXcwN+cLLcJSZAeYIG4v74fM6p5RAK6lPM6fVysqIiSA3zjmq5z3c/XdLy8VB9noH6Dcz3pqOiIwXUMYwqBbljzzKO9gvQ2DVSMIFGfJ5IKlcEQAISl7A1CjDEVz6rpROe5ukUaB3o9e/MwwTAo41/OqxMdRxpqtPnM+lBPhVSQsfs/iiblihKInm6dvm5DuoChJBuZVCSLl+gxccVoaCuYTEEViroGR71kYBhHa1lJ8xBcKMJWAbhiUiHQLXt0ox1A==
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c24a0c-807a-4b75-7f74-08df269a0c4c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 06:45:18.3922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9zV2S/ZJKXuXSK+XlmjtF56I2plRdaIoO+bhuCNJ1fK4G0PUkVg1E4wKpnCJL2zxmvehMTgqvRZSa1CReiEGr2DhuwJNgv1y1CfV8Z6cOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7449
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


On 9/28/2026 5:49 PM, Naladala Ramanaidu wrote:
> Add a connector debugfs interface to enable or disable I2C
> bit-banging for Intel GMBUS adapters.
>
> v1: Address below review comments: (Jani Nikula)
>      - Remove HDMI-specific EDID read path changes.
>      - Control bit-banging directly from debugfs via intel_gmbus_force_bit()
>
> v2: Address below review comments: (Jani Nikula)
>      - Remove superfluous newline.
>      - Move debugfs bit-banging state from struct intel_connector to struct
>        intel_gmbus as debugfs_force_bit.
>      - Make intel_gmbus_is_adapter() static.
>      - Fold NULL adapter check into intel_gmbus_is_adapter().
>      - Remove unused intel_gmbus_is_adapter() declaration from header.
>
> Assisted-by: OpenAI Codex:GPT-5
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   .../drm/i915/display/intel_display_debugfs.c  |  2 +
>   .../drm/i915/display/intel_display_types.h    |  1 -
>   drivers/gpu/drm/i915/display/intel_gmbus.c    | 67 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_gmbus.h    |  2 +
>   4 files changed, 71 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 3e302f23f247..b8fd65414990 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -40,6 +40,7 @@
>   #include "intel_fb.h"
>   #include "intel_fbc.h"
>   #include "intel_fbdev.h"
> +#include "intel_gmbus.h"
>   #include "intel_hdcp.h"
>   #include "intel_hdmi.h"
>   #include "intel_hotplug.h"
> @@ -1327,6 +1328,7 @@ void intel_connector_debugfs_add(struct intel_connector *connector)
>   	if (!root)
>   		return;
>   
> +	intel_gmbus_connector_debugfs_add(connector);
>   	intel_drrs_connector_debugfs_add(connector);
>   	intel_hdcp_connector_debugfs_add(connector);
>   	intel_pps_connector_debugfs_add(connector);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 79f30660c2b6..1b8eb08d1096 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -558,7 +558,6 @@ struct intel_connector {
>   	u8 polled;
>   
>   	int force_joined_pipes;
> -


Nitpick : unwanted line removal.


>   	struct {
>   		struct drm_dp_aux *dsc_decompression_aux;
>   		u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE];
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
> index 60a70dea5d85..be6d29508bea 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
> @@ -27,6 +27,7 @@
>    *	Chris Wilson <chris@chris-wilson.co.uk>
>    */
>   
> +#include <linux/debugfs.h>
>   #include <linux/export.h>
>   #include <linux/i2c-algo-bit.h>
>   #include <linux/i2c.h>
> @@ -47,6 +48,7 @@ struct intel_gmbus {
>   	struct i2c_adapter adapter;
>   #define GMBUS_FORCE_BIT_RETRY (1U << 31)
>   	u32 force_bit;
> +	bool debugfs_force_bit;
>   	u32 reg0;
>   	intel_reg_t gpio_reg;
>   	struct i2c_algo_bit_data bit_algo;
> @@ -871,6 +873,71 @@ static const struct i2c_algorithm gmbus_algorithm = {
>   	.functionality	= gmbus_func
>   };
>   
> +static bool intel_gmbus_is_adapter(struct intel_connector *connector)
> +{
> +	struct i2c_adapter *adapter = connector->base.ddc;
> +
> +	return adapter && adapter->algo == &gmbus_algorithm;
> +}
> +
> +static int intel_force_bit_banging_show(struct seq_file *m, void *data)
> +{
> +	struct intel_connector *connector = m->private;
> +	struct intel_gmbus *bus = container_of(connector->base.ddc,
> +					       struct intel_gmbus, adapter);
> +
> +	seq_printf(m, "%u\n", bus->debugfs_force_bit);
> +
> +	return 0;
> +}
> +
> +static ssize_t intel_force_bit_banging_write(struct file *file,
> +						     const char __user *ubuf,
> +						     size_t len, loff_t *offp)
> +{
> +	struct seq_file *m = file->private_data;
> +	struct intel_connector *connector = m->private;
> +	struct intel_gmbus *bus = container_of(connector->base.ddc,
> +					       struct intel_gmbus, adapter);
> +	bool force_bit_banging;
> +	int ret;
> +
> +	ret = kstrtobool_from_user(ubuf, len, &force_bit_banging);
> +	if (ret)
> +		return ret;
> +
> +	if (force_bit_banging != bus->debugfs_force_bit) {
> +		intel_gmbus_force_bit(connector->base.ddc, force_bit_banging);
> +		bus->debugfs_force_bit = force_bit_banging;

I agree with Sashiko's comment here. Theoretically there can be multiple 
users trying to set the debugfs concurrently or along with the test.

for other debugfs tests it might not be a problem, but here problem is 
that the intel_gmbus_force_bit() ref count can get unintentionally 
remain > 0, causing GMBUS to always use bit bashing.

There would be no way to tell from the debugfs value itself that this 
has happened.

I think we can reuse the global mutex similar to how the force_bit is 
using. That will mean to avoid calling intel_gmbus_force_bit() (since it 
already takes mutex) and instead:

-take mutex lock

-check if debugfs_force_bit is changed. Update the force_bit, and the 
debug_force_bit

-unlock mutex

Same thing in show()

-take mutex lock

-save bus->debugfs_force_bit in variable force_bit_banging

-unlock mutex

-print the force_bit_banging.


Regards,

Ankit

> +	}
> +
> +	*offp += len;
> +
> +	return len;
> +}
> +
> +static int intel_force_bit_banging_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, intel_force_bit_banging_show, inode->i_private);
> +}
> +
> +static const struct file_operations intel_force_bit_banging_fops = {
> +	.owner = THIS_MODULE,
> +	.open = intel_force_bit_banging_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +	.write = intel_force_bit_banging_write,
> +};
> +
> +void intel_gmbus_connector_debugfs_add(struct intel_connector *connector)
> +{
> +	if (intel_gmbus_is_adapter(connector))
> +		debugfs_create_file("intel_force_bit_banging", 0644,
> +				    connector->base.debugfs_entry, connector,
> +				    &intel_force_bit_banging_fops);
> +}
> +
>   static void gmbus_lock_bus(struct i2c_adapter *adapter,
>   			   unsigned int flags)
>   {
> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.h b/drivers/gpu/drm/i915/display/intel_gmbus.h
> index 5fdeab1aa794..5c03100ce46b 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.h
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.h
> @@ -9,6 +9,7 @@
>   #include <linux/types.h>
>   
>   struct i2c_adapter;
> +struct intel_connector;
>   struct intel_display;
>   
>   #define GMBUS_PIN_DISABLED	0
> @@ -41,6 +42,7 @@ int intel_gmbus_output_aksv(struct i2c_adapter *adapter);
>   
>   struct i2c_adapter *
>   intel_gmbus_get_adapter(struct intel_display *display, unsigned int pin);
> +void intel_gmbus_connector_debugfs_add(struct intel_connector *connector);
>   void intel_gmbus_force_bit(struct i2c_adapter *adapter, bool force_bit);
>   bool intel_gmbus_is_forced_bit(struct i2c_adapter *adapter);
>   void intel_gmbus_reset(struct intel_display *display);
