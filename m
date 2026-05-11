Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEA1CD37AC
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 06:21:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8024C10E148;
	Mon, 11 May 2026 06:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vpqk/jKh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1F010E148
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 06:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778480465; x=1810016465;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=20unTUiBB9RHvXJTsjs/BYuk1/TuDRZKHvc5wzQZH+E=;
 b=Vpqk/jKhrDd6rzNmosJIqFIWAyuVZ9jFb6jqCTA6NfSZ+L/fbNewhAnO
 2l0mow/g0LkLJrvzGJP78TVl+xlFdZKjSNwd1VLY/G5FI6DU7F7FmmxnD
 79FHOyExBaZSWNpdJWKSfPNuTRbkRH7l5lHt9bfQkRJ/I7gCOdruMxEYH
 SI7LJNWS6NQGK7xOMJ8Zbr1wjQCOCmy9BR9aeyrrQi2GsDd9zIjYrObnJ
 HRLD2zsiTTLo1UHCYy6onVNXiVd4BJdi51pRrkNre5mC/mQFhltlI7kkT
 qgwSqWNcqzBdihD+aBlp0lYeWDJl19NWkkm+WOWe5AzXrpYUEjj/rsdEa g==;
X-CSE-ConnectionGUID: NPdP5hUSRCmkBKjlGzNNzg==
X-CSE-MsgGUID: lLjxXz9mQ1iustFSQnfqtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="81924341"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="81924341"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 23:21:04 -0700
X-CSE-ConnectionGUID: aMpI5W1+RgOiJWra52WwgQ==
X-CSE-MsgGUID: ANkBK+eMSxWtS14abq5nQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="237459570"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 23:21:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 10 May 2026 23:21:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 10 May 2026 23:21:03 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 10 May 2026 23:21:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQqdhPnbp7vthpEd5eIPKEbnhA0NgK6dKDIa1TLR4JepOxBWhfHYMmGUsv1t2LYASdJhcPMLugQGbMlLq1Rg8FwUIPoG4DbD5Lw0eHZrG4u41lr5x3lWl1q0ugamQCTHiKmF/GXc4dEowG9YhB3eb6xoZ2JqtC9ZHMeYR+x7Kygh7CVQd0dv+nC5w/zMTCeqxJwnh7FNO9D54SNvcrdrPLhnJJARJnQkEGBG5bBQMk3r3T6Rl3guUBm7fGwdrnea9IZ/2HiX6KIPlK4DQxkYo/I7hPb9FZ0viEPxX6LVnuf4FYVjFYAg1f5MGxabJ8SbRdvhiaGu45pjx8QgVWsUiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdOlbsGIpjHEwuXcgy0DNgVVWDEnvheXkHpac1yXxLA=;
 b=OOzkqsEpTWegXSBVNffzGBNtV60w/0jJqsDOcRPjDoz8GUneC86mGKEz8bPfLlc54OgffTusgQwL8iDsOyozK8HSOYdLD+ouCJhKqrsElCMct9V/C/TxUCkFDW8lw6bAeCJBAC2UOHfxktIFaASgXlKpJ7WUsJxmvkiGIuU6cUKTV6gs1z+0JDm/Y6ufEgdeu0y6MDtK2bAisv/Ch6prSvig8F60qiTVxLalic3RLBRxpSZcGvy1cQC6zZAA/hmAt8dL/qO/tJdV/X5f7Gp5pybz/reV3sEEbwRah7ebULeN9AuUuMoQRG/6XXQn+9lw5zMyQ6dWCoVRktlOlSsCYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB5080.namprd11.prod.outlook.com (2603:10b6:510:3f::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.22; Mon, 11 May 2026 06:21:00 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 06:21:00 +0000
Message-ID: <be71197e-7cb1-4ded-b9b4-3e4b2ac200b4@intel.com>
Date: Mon, 11 May 2026 11:50:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] drm/xe/xe_ras: Add helper to clear error counter
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
 <20260504065614.3832331-11-riana.tauro@intel.com>
 <c4df83de-8203-4b2d-b0f8-c8076fcadac6@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <c4df83de-8203-4b2d-b0f8-c8076fcadac6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB5080:EE_
X-MS-Office365-Filtering-Correlation-Id: 17588855-f714-4739-a1be-08deaf257846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|3023799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: coQrLjMd4jKNYcF8NTBwmUhQgV5emWtAXDTZYcIMoYvbVLGDU0KNOpsl8N2Q9OgNSifj00Ehj245BORJwRM3In9Rn9wd5s+LEaPOJPLpUnOUyqo54mrjk+O7QBYHN1d1i6N8lcxcVAqG6aMwvRwrHmdLCO+Zs2v3aagqRKt5pWUk3UbibqbVMmzxOp7njEhUcewPPSMdZqo4LZhbpzU2eLc2W+BPmcmA26sfxDI/8e2Ae3VwDWi9IPouE38Zwwz2RR4Y4DP7ZJySpNLnQFNqRoqBUNuWmZtVqlEZsg2krYsHY610Ga6uHHsGgBatFmU1oaPZWtRAMr8quZW+2Ehc/W3VkwWY6ZLhmjQoRlir8mytMShwR7SdPgcyVpgzUAP23g2e5+JM4CuCYPWBkikdo0NPLOJ4ljibnFXl3K8tFwJHlB81GhA4P054Jw4SXtvRYixl1rqctiQdQzR/eTqA+cXL5wG4/gB0oXacpAn3P718ogsCOhk1kPjJYw/4y6a95R38TKejNrQhWwTkrJ2W6Er3v6036SsPpvq6FE9lWaZ5mmz0U/UEhoVMKrwBN/ngkrIBUH4rUBohguqjgBDWaU7l5hFN8EJTxrATthfPlJMCFGtezdj3ddqEdFIx8Rew0Nw3JUxjjDt3MQ/B7kFrKMgMPFw4tg3nrE7KGRxgNghnxTGkx2SkfYyhTKhLdT1GAHFwPmXVS5cBhTdZB41t0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(3023799003)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekc5cUFKaVZFZUZTK1dzeS9WR1ZacmtISUk0YkRMOFVwUjB6NHVRQ2RHWitS?=
 =?utf-8?B?ZC9MVnkzTitnTThjWnBacWU1RFdRUS9Ua0N2TXc5VjRXbGdxc0ZpZ0hmWFZP?=
 =?utf-8?B?bzJSeUJFRVB0YWxlVGNGdlZPSFptcHNGNmNQQWxpbHVoSXhJc2JMSWxLcWdv?=
 =?utf-8?B?WWFNQm5pcjU0cEZETVFqNXJTblZNWXQ5UCsxc1ZtZERKT1ZaZUswNjdFWG5j?=
 =?utf-8?B?c0ZVdm9rQnh0MWRDZ1U3U2cyZE1RTTBDejVZTjhKeENpME9NWDQ3RGVPNjVN?=
 =?utf-8?B?UXQ4ZWhMcnAzN2JkaGtBSWlCUC9xc3UzK2lZT1ZBMnVkc01RQkl6c09BMmpz?=
 =?utf-8?B?V01sUW5aaGE0dEdJQm4vTDJtOVNHZ1p4QktobXVHNmFBeVZVK29zWlFvaGlj?=
 =?utf-8?B?SXFMdlRGVFFBZVA2YlUrdlFqMXZmbzlxTTQ4M0RyZ2NhaU1MeUlEalVKbDRH?=
 =?utf-8?B?VG9qVGpkRlRUK3ErSHV3akZpUGs2WXIydGpXREpmSVE3eG13S2tPY0hOYXJC?=
 =?utf-8?B?UU9XUmZGWmJNcmFXd1hyZ1B3Nnp0cVFDZmpya2NZTitsendKMjFlNnMweEZX?=
 =?utf-8?B?Sm1Ndks2ZUpDbHQrbFdHcFAxVjg1eUV4QzRjNEpvRHQ5MVdQYXIycld4WVVj?=
 =?utf-8?B?ZWo5QkFMajNKOFJpMThJRVU4blZablJybnhzNVAwL3hYa1lPcGJkZU1BR1hI?=
 =?utf-8?B?NXdPTlFCcWxQbCtiMERWN0V4ZmxSckh5YWdYalJwdGMwTVZzM0huMFpsQkFZ?=
 =?utf-8?B?eVVUZEx2TFpvREpOazhIZkJscVJqZnZ4R2hSdHQ0aHdQTGIxa09JR255eWZD?=
 =?utf-8?B?SCsyMzh6UkNhcmlVZW8veGpnOHFNcDJFL1kvV2Yxc0lqOUY5ejRwSUgzYnVO?=
 =?utf-8?B?bjhEK1NJWTJVc3JDSWUzY1RiOVM4bEF1alZQVGJZYUhuQXJaa3BTTVBKK2tU?=
 =?utf-8?B?ei9RMVEvVTFOZW5DNXRIMEdKQ1FYbmc0WjNCQTZWallkeXdoYUc4UXgydC9S?=
 =?utf-8?B?bjhaYzlubHh6UENwREpUd1dqdnhscG00d3FsdW0yUUIySGU5TXhsSlp5ZUlI?=
 =?utf-8?B?Q05lMzB5S2dVM0xKcG1CdDBZNEVsYmg2bXhsQ2ZOK2FNNzN4R3VJbGQwYStT?=
 =?utf-8?B?d1cweU9mZWk1am56K3VBOTMybnFxU1pZUkVtNGhna2RrdlZlVlZsbEk2RjJI?=
 =?utf-8?B?eGdDNmNiMGF0ZTJzZThpOVpHdzZmTEQwVEJUNE5BM1o2VzNkaU9FNDZjSUV2?=
 =?utf-8?B?WWFXVEpZZDlGTUxkaDRoZkpHZUtxUGxKQjh0Nks3NXJ5OWxtQVk0aTBSMk5U?=
 =?utf-8?B?MXgxNzZhcDFUbG0vWjFsQjhLNWdLWnVCMjdHUW1iSnByMEVMcVU2WEhaTkxj?=
 =?utf-8?B?anpoR3pyR2hvaHJmNmIwalBPUUFiYUZSSVF3dldacnF0VGlEYTFaN3grZ0Zs?=
 =?utf-8?B?OCszQzIxYkVqSTFxMkVZVENSTFp3bnl4ZlJDRGQrcXFjK0J1L1QwRVlHaUVS?=
 =?utf-8?B?MUFxVnlNUWlRZkg1cWNsOTZVSWlyeTJMeVJyaE9XK21zV1VGZjB0cjQxS3cx?=
 =?utf-8?B?bkk5U21WUHlDSUpieVJaYnZzeTdlcVZTa1hJL1BhWWp2NnpxczVMdVJnR1pJ?=
 =?utf-8?B?enRZMEh0TTViVHpUamNlSmF5VjlpZEdZRDUrWG9IQjJnLzJ4Y1ppSjJwYlUz?=
 =?utf-8?B?T2ZkcTlhNm9RcTlUN2IrQUpzUTVxSlk1SElvZlZFYkpoTyt5dXNINy9PZEY0?=
 =?utf-8?B?UGVwNHFmNll5VENSNVhkUTF3SFZ5V29WTVFsek5PeTRqQitLdmwrTTBDS2N0?=
 =?utf-8?B?cGlEaDB1Y2ZiL2tmaHlZYk43ckswa0pDV3FIZFFIRkNPc24zODA0YWt0RmtV?=
 =?utf-8?B?ZitkSDVoMXM5b1BJcEJYSFV3MlJ0dkRzRm93dmxxWng4NW1mQkl1UzZwMlNa?=
 =?utf-8?B?UjFSTjhnTHVoSDl0LzdxaXVEQy91R2RRdGxFQ1ZZSFlTajN2dVlabTlWaE1B?=
 =?utf-8?B?b205OHdBbkcxdWoxYk03Yjd4V1hQN1lmRGVSM1VRNmpNSG9mOVVYcVBKdzNU?=
 =?utf-8?B?RCtJbUlyb1NESm5DV1lCRHExVGpzblViSnA2ODhnVDBTSjBUKzh2TlVVSTJR?=
 =?utf-8?B?RGRkZlhsMTczWFp1UTlDM1VIaDd4VXpJS3pxOVhoaWFneGtRcjExbEY2U01F?=
 =?utf-8?B?ZzhJTi9MTUIzc3JZdkdYd1ROYXNnL3JmU2VwSVdTZk1pV2ZuSWJwS3hYaUYy?=
 =?utf-8?B?VkIveFNkN0xodXVCek0weWlUSk5nQi9iMlZ1TXJ1djJxYUZoMGFrRk84N3NE?=
 =?utf-8?B?OThXcmIvL25ONXVvVU4wamV4dVBUUTBOMlRPNG55azhaRmVVTy9tZz09?=
X-Exchange-RoutingPolicyChecked: f/mVu9jYB7TLnxUXfuEmw3linP8PbA/kLYs/Ooni7QRcN3CPR0kM07qjkT958wGUdhzVtbzBoa4lTZeExBCwPvKY2ZhXpVbjpsXSquRNMhyDjeQZZWrKIx21dgtb0yKO/Z6kVlmRq6OD/QK2pX2gF0F6YTuY97gDLP7aWLQdSaGcrTxqKqdzGCymKDnNGvtVV01astu+KpwyvAE5Vogv09cXFkgkj9aPOTRQhTWLb+wSZrtBafioDBsFQNh8uTuzjQNXnPJ6u8I/1Tyt8XRRrBAt2bRTiYsdmPVW+HauUA4BddgK1j12Zf59SXjk4q26cPLvlCny1HNESCc2S06QAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 17588855-f714-4739-a1be-08deaf257846
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 06:21:00.1480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vt9Q1ABK+0ZYgnxf5wD8odWgbWHG3wdpaotg/avqmzRH3i2pm3l/LtgRfoTKTtx//BUt9zUvXlBURODNOtwMOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5080
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

Hi Mallesh

On 5/8/2026 1:20 PM, Mallesh, Koujalagi wrote:
>
> On 04-05-2026 12:26 pm, Riana Tauro wrote:
>> Add structures and helper function to clear error counter value.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: add status codes (Aravind)
>>      fix log message
>>      squash structure patch (Raag)
>>
>> v3: rename function
>>      add comma to enum members to avoid
>>      redundant churn
>>      align with tabs (Raag)
>>
>> v4: rebase
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   | 76 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h                   |  2 +
>>   drivers/gpu/drm/xe/xe_ras_types.h             | 25 ++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  2 +
>>   4 files changed, 105 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 47a58ce3b3ca..07f6837694e7 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -34,6 +34,17 @@ enum xe_ras_component {
>>       XE_RAS_COMP_MAX
>>   };
>>   +/* RAS response status codes */
>> +enum xe_ras_response_status {
>> +    XE_RAS_STATUS_SUCCESS = 0,
>> +    XE_RAS_STATUS_INVALID_PARAM,
>> +    XE_RAS_STATUS_OP_NOT_SUPPORTED,
>> +    XE_RAS_STATUS_TIMEOUT,
>> +    XE_RAS_STATUS_HARDWARE_FAILURE,
>> +    XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
>> +    XE_RAS_STATUS_UNKNOWN_ERROR
>> +};
> Add XE_RAS_STATUS_MAX right
>> +
>>   static const char *const xe_ras_severities[] = {
>>       [XE_RAS_SEV_NOT_SUPPORTED]        = "Not Supported",
>>       [XE_RAS_SEV_CORRECTABLE]        = "Correctable Error",
>> @@ -53,6 +64,16 @@ static const char *const xe_ras_components[] = {
>>   };
>>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>>   +static const int ras_status_to_errno_map[] = {
>> +    [XE_RAS_STATUS_SUCCESS]            = 0,
>> +    [XE_RAS_STATUS_INVALID_PARAM]        = -EINVAL,
>> +    [XE_RAS_STATUS_OP_NOT_SUPPORTED]    = -EOPNOTSUPP,
>> +    [XE_RAS_STATUS_TIMEOUT]            = -ETIMEDOUT,
>> +    [XE_RAS_STATUS_HARDWARE_FAILURE]    = -EIO,
>> +    [XE_RAS_STATUS_INSUFFICIENT_RESOURCES]    = -ENAVAIL,
>> +    [XE_RAS_STATUS_UNKNOWN_ERROR]        = -ENODATA
>
> Are ENAVAIL(No XENIX semaphores available)/ENODATA(No data available) 
> correct errno choice?

This is the closest error code i could find. Let me know if you have any 
suggestions.

>
>> +};
>> +
>>   /* Mapping from drm_xe_ras_error_component to xe_ras_component */
>>   static const int drm_to_xe_ras_component[] = {
>>       [DRM_XE_RAS_ERR_COMP_CORE_COMPUTE]    = XE_RAS_COMP_CORE_COMPUTE,
>> @@ -70,6 +91,13 @@ static const int drm_to_xe_ras_severity[] = {
>>   };
>>   static_assert(ARRAY_SIZE(drm_to_xe_ras_severity) == 
>> DRM_XE_RAS_ERR_SEV_MAX);
>>   +static int ras_status_to_errno(enum xe_ras_response_status status)
>> +{
>> +    if (status > XE_RAS_STATUS_UNKNOWN_ERROR)
>> +        status = XE_RAS_STATUS_UNKNOWN_ERROR;
>> +
>
> Check status against XE_RAS_STASTUS_MAX, if it failed log in and 
> provide -EIO and return.


Why? Unknown error makes sense too right? Any error above the enum range 
is unknown.

Thanks
Riana

>
> Thanks,
>
> -/Mallesh
>
>> +    return ras_status_to_errno_map[status];
>> +}
>>   static inline const char *sev_to_str(u8 severity)
>>   {
>>       if (severity >= XE_RAS_SEV_MAX)
>> @@ -182,3 +210,51 @@ int xe_ras_get_counter(struct xe_device *xe, 
>> enum drm_xe_ras_error_severity seve
>>       guard(xe_pm_runtime)(xe);
>>       return get_counter(xe, &error_class, value);
>>   }
>> +
>> +/**
>> + * xe_ras_clear_counter() - Clear error counter value
>> + * @xe: xe device instance
>> + * @severity: Error severity level to be cleared
>> + * @error_id: Error component to be cleared
>> + *
>> + * This function clears the value of a specific error counter based on
>> + * the error severity and component.
>> + *
>> + * Return: 0 on success, negative error code on failure.
>> + */
>> +int xe_ras_clear_counter(struct xe_device *xe, enum 
>> drm_xe_ras_error_severity severity,
>> +             u32 error_id)
>> +{
>> +    struct xe_ras_clear_counter_response response = {0};
>> +    struct xe_ras_clear_counter_request request = {0};
>> +    struct xe_sysctrl_mailbox_command command = {0};
>> +    struct xe_ras_error_class *error_class;
>> +    size_t rlen;
>> +    int ret;
>> +
>> +    error_class = &request.error_class;
>> +    error_class->common.severity = drm_to_xe_ras_severity[severity];
>> +    error_class->common.component = drm_to_xe_ras_component[error_id];
>> +
>> +    prepare_ras_command(&command, XE_SYSCTRL_CMD_CLEAR_COUNTER, 
>> &request, sizeof(request),
>> +                &response, sizeof(response));
>> +
>> +    guard(xe_pm_runtime)(xe);
>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +    if (ret) {
>> +        xe_err(xe, "sysctrl: failed to clear counter %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    if (rlen != sizeof(response)) {
>> +        xe_err(xe, "sysctrl: unexpected clear counter response 
>> length %zu (expected %zu)\n",
>> +               rlen, sizeof(response));
>> +        return -EIO;
>> +    }
>> +
>> +    ret = ras_status_to_errno(response.status);
>> +    if (ret)
>> +        xe_err(xe, "sysctrl: clear counter command failed with 
>> status %d\n", ret);
>> +
>> +    return ret;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index 74582c911b02..bbb9d42bd128 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -15,5 +15,7 @@ void xe_ras_counter_threshold_crossed(struct 
>> xe_device *xe,
>>                         struct xe_sysctrl_event_response *response);
>>   int xe_ras_get_counter(struct xe_device *xe, enum 
>> drm_xe_ras_error_severity severity,
>>                  u32 error_id, u32 *value);
>> +int xe_ras_clear_counter(struct xe_device *xe, enum 
>> drm_xe_ras_error_severity severity,
>> +             u32 error_id);
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h 
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 74d85875cd63..44369fc8ef03 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -100,4 +100,29 @@ struct xe_ras_get_counter_response {
>>       u32 reserved1[56];
>>   } __packed;
>>   +/**
>> + * struct xe_ras_clear_counter_request - Request for clearing an 
>> error counter
>> + */
>> +struct xe_ras_clear_counter_request {
>> +    /** @error_class: Counter class to be cleared */
>> +    struct xe_ras_error_class error_class;
>> +    /** @reserved: Reserved for future use */
>> +    u32 reserved;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_clear_counter_response - Response after clearing an 
>> error counter
>> + */
>> +struct xe_ras_clear_counter_response {
>> +    /** @error_class: Counter class that was cleared */
>> +    struct xe_ras_error_class error_class;
>> +    /** @previous_counter_value: Counter value before clearing */
>> +    u32 previous_counter_value;
>> +    /** @clear_timestamp: Timestamp when the counter was cleared */
>> +    u64 clear_timestamp;
>> +    /** @status: Status of the clear operation */
>> +    u32 status;
>> +    /** @reserved: Reserved for future use */
>> +    u32 reserved[3];
>> +} __packed;
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index b315847cbf64..6e3753554510 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -23,10 +23,12 @@ enum xe_sysctrl_group {
>>    * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>>    *
>>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>> + * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>    */
>>   enum xe_sysctrl_gfsp_cmd {
>>       XE_SYSCTRL_CMD_GET_COUNTER        = 0x03,
>> +    XE_SYSCTRL_CMD_CLEAR_COUNTER        = 0x04,
>>       XE_SYSCTRL_CMD_GET_PENDING_EVENT    = 0x07,
>>   };
