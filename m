Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E1CC61DB9
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 10:37:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D49F89ECB;
	Fri, 28 Aug 2026 10:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mucPvszx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89D289ECB
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 10:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787913472; x=1819449472;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9Oy3wuI+AhsMhPz5VxcqkTvWmcb3Zyid1va9n0nppRI=;
 b=mucPvszxZeRh/jwmkLVqeSVO3Gc5UYtmlybtGentYMLz/zluoId2zAhI
 GIAOhW7r7AcabNlF/ACgJRJ+evS8FVkjVwJdfMp8AhH1XDFHkYXjRm9ss
 v2DHjCrzljDcYd9+LuoPzFHo7I7K0zdv/cY9CU177fZnnkQH+758RO5bI
 jW0dmxWuPgqLPt3v1EG+oUYEhu8VvJ57IP03y4W9sIp3L5xygnHSBnni0
 TcLHKmwweGYSGfCpiS7PN0B7iCEXcSGuRArsRxGauhIkt9c9/pBjUPvZA
 d1fqL7bs5RAw+UMyGHLMVnjKgI+n6znX5bkAd6BxOXahN3HMwRiaxCuaH g==;
X-CSE-ConnectionGUID: hTJtUdDmTK2Wmh78ykNZPg==
X-CSE-MsgGUID: TFNI459TS+K59Riy3vR4dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="92104098"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="92104098"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 03:37:51 -0700
X-CSE-ConnectionGUID: CBmxPNvhSimcv4Uj+YmxMQ==
X-CSE-MsgGUID: IpuHky0vSHmimZ3EczhUVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="268691599"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 03:37:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 03:37:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 03:37:49 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 03:37:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mr5gJcvX+rxw2nud4g4ygIianWTYjfPBE/jQuhOz6594lBUA/5csWYaBZIl4eQyyOw0uD/QBLELIkjHQ5X5GsSmrOtjui2ECEbt7wPoonkYMi/JoCHi5ERuIv+IYqzgJ9Z97QkZbTu3oviBek8l52rCoQY9iyN2EA2X/xQ7raREHvNtph/vFTbsiB2t0xaG6/hBo+m8mw1LrKGqpkbNzkzYl/VyzlX0IY0Z9PTisTh4POyK+PdfQbp8w7dzPcusqaSFxdq4gChStjhbufT2WhOmDF14hf8+tdGh4SShHTUHCteQNin3s3LzPkVJX629a5ebl2lahG3ZhQacrAdKYzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVysoIpaAn/TP3HdOY5dGu0OgDrs7Z/eIUbsAxd4vl8=;
 b=jNcgsUcAdORrXRSap8MXlQo1019SyBOlyis9aSSC1KduV+90ovbvmI+O1wbTCAFZoSzVIJT0JsJ0Cc8GIhq6u8EWsmXu3vUHnz9vWWlTacyLhE4rVagLs7gY/8ZgRxVtBjnfSnAr/1moeAaM2uw/578WBym/bKf61Yg+xihaJmAoGPTHfUVExstMeygi/4/tTa3awgRzrntsiOQHEdrZL1k9VoWR51ZZaYl99lKy1oJoENRo6y7FIfe85ouYnWHb7gtb5+VzXFaI1CHBUyV1fZXSaoYNu73om+TiSkYTAEiTyhXDmXZhmCvEyJHn4WV5ZunWHNDO/npU/hI1jYS83g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB7902.namprd11.prod.outlook.com (2603:10b6:8:f6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.11; Fri, 28 Aug 2026 10:37:48 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 10:37:47 +0000
Message-ID: <47ec309e-8529-497c-9401-6771d76a0a1d@intel.com>
Date: Fri, 28 Aug 2026 12:37:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/xe/guc: Report CGP protocol errors using SIGID
To: Arvind Yadav <arvind.yadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <matthew.brost@intel.com>
CC: <rodrigo.vivi@intel.com>, <badal.nilawar@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260828095803.2130312-1-arvind.yadav@intel.com>
 <20260828095803.2130312-3-arvind.yadav@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260828095803.2130312-3-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIZP296CA0021.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::7) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: 31d7fd4c-4d1a-47a7-2c8c-08df04f06700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|18002099003|22082099003|56012099006|3023799007|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: U4A91Bnok3/RYYqQzy78deAKl4Z2orfrFAvQTyfsIlZOUQh6t4IXjNUFjNAHrThV6Nc5XAqgw7TFDounJ7R7qvWknyfMZeF5KLEThL7O44xn0S/7BUzeHq6q/cRu/wCIBEZgOVDLbAZGZDzZ+ajnpJXhvGzJOu/V8PSnKCrcOkRkeLtv0Yv0jTIZ5lp2T5pWTR/jQgvlozsB7rym5inib3dW4jmkM4+WShN9a5v/DSEysf2tlpLN8JSglO/BT5oWTQICsCQ3hf1vOqeu0LxWBYgG3gbgMCVt3YGcDeXCktLOTzJJDKi6e4iuFPlqe3S/jgq2VKZBEh6kEkY9wtLDV5IAsn6JTLOSHEr7Rbabr8o1E4ql+feNwgdbqgI6RvmNidBrdJSvnX1e6YPQeYcEzU/0kOZvNKEY77w3/VwL3WYU1yptweFTJQ6B1ShWd9HttxAIF8QUG3eM/ioADRZjMjK/FysHUFSNH84sdaEgB/hmwu0UK/WI7hygynNM7DokWQxDeH+2RAkA5pPaMLAE2vXsNYexozdmgjG0B0vg/D45nBOLnyDXryCmXj8PSWV/YfWfrTKISKYK5xZ7g3kGicO04lpUxPjwR912q3vpObCy+SZwlnGB3yORGSptQ0RpeqxcGVUYd/2dPuvBn7we6NdSklwe0uY5KlaquJkktL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(3023799007)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDVuVGVDR1ZUclVzLzRDVjhuQ0pyN3pWc2pac2p1K0tMZFRQS3I0RXJPU3Bl?=
 =?utf-8?B?UElldUpGRmc0UVRTRjB3NVVHeXVGVEJyMlIycUlRMkxOUHJGZUR2YVRPUjI1?=
 =?utf-8?B?QnVPS1hudWM4WnAyMFB3N1k3bmVTV2pmSFJZU0xnZ0RVdXNoUTltZ3Q5MVhw?=
 =?utf-8?B?NWxHaU0yeXJiMDArZmFhNTFiYlhYai9oYUl2QU84aTYwMmh3LzZrMGNsKzdY?=
 =?utf-8?B?cm04QnhNY041T0RkY1BxRUY3a0ZPRnJPcUo5aTlLMkxsQURhbzFWZUFBNERn?=
 =?utf-8?B?eHVJUmkrbHoweGdFT3ZpMEpPUzl4dzhRU2c2U05yY2dlM0NXbWs5SllvUm9j?=
 =?utf-8?B?bXUyY2dzVC9RbThLWnorVTE2Q0NqWlBUTm5tVU1mMFpIYXRRcG9SbTNFN0VP?=
 =?utf-8?B?dyttVTJOODNHTmhmUTh5cHlEeUxjSWcyTkRiYVp5RDFELzlZZUNaYkU2dDg0?=
 =?utf-8?B?VU94K0ZXNHBEcm5OUDBCOWlaSVFjYnBDRU95dk52bVI2Tkc2MUdpRnBNbW5u?=
 =?utf-8?B?WVhQOHltOUhmcDkvc0RQSGxTSXN0KzdyNnN3S1cxNlc0Ukc0Mm5XR2JnRWk1?=
 =?utf-8?B?WFlKRHhFbDRQUWN2eHcwQlBSSkUzclZ5K2NwUXp1cWZSSnRZV3I2V2pKdUZr?=
 =?utf-8?B?WCtGRE9udjUzd1c3alh5OHZSZngyZHNlRjhKREw4SStqcWQyZWpNOWJFcSt5?=
 =?utf-8?B?SGdRVTI4RkFQUURlNlhHVXl0c0hmbmE2OWNpSlhyQzlEaUYxcldWeXdXZ3Bh?=
 =?utf-8?B?YWhZZy8yTWgxVDhrY1c0UVZQaG5mNkttNkJuejRBaDJzM3AweTl5VFB2dFYz?=
 =?utf-8?B?SDh4TXBaOFRiampwV29uUzYvZ1Y3SllhYXlmeWdWeXZUcHVLRDdIclRUbUNl?=
 =?utf-8?B?bEN6OENhOGZSeU5RZ1FPWVFtdVVPNVNoNEFRdEltYjIxbFRYTFJDb3ZYeC8r?=
 =?utf-8?B?RWVoUzNRRStoWXRmUFJvR0p6NFhXVGRISFpJWlQrNjM0Vk5xcFNuaE5ucVlX?=
 =?utf-8?B?aWVhZTFqd1lJQUE4SUhxSklSWEZNTk1nVGtra2V0ZlQwOEVsY2h3K1F2TGR2?=
 =?utf-8?B?M3RGYUxlVHVRUjJvM0xUVk41MFpWZzhQM1Y4STFaNks1ZDI2MkVsbVpSU3kv?=
 =?utf-8?B?NU1pYjBVaG85VHNxWXl1d2xWUDdYY1picDlGeG5UVm8yT2JzdGdSQU5yT0lG?=
 =?utf-8?B?ZWFreEQ4OGYwTFNkcDJIVE4vZjZlWGRaYkVod0xHSWM0UjM5WkNBVHVHblcv?=
 =?utf-8?B?K21FcTFxc2JzWVBXZUJtVUdqbUZqYXhtaTVWZTczdUsxbXFrdVBuM2Z6MHk4?=
 =?utf-8?B?WnVXdnJDY1U5cHo3cG9NZzRnZjBzZk9qQW1qbUdVZ0Rva3RUeDFJcmIyVFFL?=
 =?utf-8?B?VzJNTlpiTzdKVFNuaGNUMUl5QkdFdUFXcG8xZVNVQWhmcmY3U2o2SlVBWkZK?=
 =?utf-8?B?ZmpBdEZLUlQ5Q1RSNVlWK0oxWmpOa2xuSS8wd0xIM3FtWTE1Nmo5VFcxNGlw?=
 =?utf-8?B?T1FIZUlEQWdPWjhhVERQRnYwZXdIZFphdXJWQW94TmVyYnBYdE0yYzI3clpa?=
 =?utf-8?B?MjVWYmh1bUdJNFlSVG91elNPVVZrU0xmbk5NRmxGd1EwVk9IY05KMWNtYzJJ?=
 =?utf-8?B?VzdGYkZEbUhTbENNRmRueFFnNzU3MUpxbW10SFg3d1g3L3ZHVmVDa042WnBB?=
 =?utf-8?B?VlpWYVFVSzh3ZUdzWTl1OTF4aXlFNVg2Z2dqWlppU240ajUvaS83MFpBaGE1?=
 =?utf-8?B?NExMNU4xN0lodDN6OFZDY2xNbjA4VXFkaU1kSFk4dE5BOUR0MjFwMTdtSzRr?=
 =?utf-8?B?cmR6SjA5c1hVd0RWZEJIMExoYU14ZWxQQ2poTnR5VkRJRFBNR3BvUTVwYlFV?=
 =?utf-8?B?S0hCRDJ2dmdiSVNZV1FwN0RoYmU2Q3RIa3JCdllRL0FCdElWYk42WDJJMnZv?=
 =?utf-8?B?aGh6enFkWkNYbzA1eHNsU0Q3SFFVakNmZ1Z1RjBkUkQycWx4alVMNllDVnZG?=
 =?utf-8?B?WndWR3lwczN1VGRteTVIZG05dkRCSVQ1MEVlcWRicW5IM2R2UzFiV0VhNUF1?=
 =?utf-8?B?L0tTck9hTS9WZlBDRjUvSjRjejRxeDZQWVR4Qmx3ZVB0eTd6ZDN0Q0xpdG1P?=
 =?utf-8?B?WmdpUmJ4NmVuWUQ4V0RIM2Zkb3B1aEp2dEhMTWFCU2J2WXVSczZPWGVLRFVw?=
 =?utf-8?B?dEZnWTR2MGVXS3d2eDNVU0hZTkFaUm5qRVVxU3E0L2cvTHN3SkttRTd3VHpZ?=
 =?utf-8?B?RHh3V0p6Z0F1NjdrM2JqbWFnY045dnJvOG1HMVpFVkZaSm9DcmU1eHRxMjRj?=
 =?utf-8?B?TFFtcWlrVy81blo2N2ZzVmdBaWp3c3dkSno5WWhTRjBJTmdVWCtJa2pIenZT?=
 =?utf-8?Q?EH8vdTYm7rsdt6vE=3D?=
X-Exchange-RoutingPolicyChecked: wMsZMRRsUwb92shIPRBu6Q4J4Sjo7UJr41x2Ha60du4obHd7sxWNZjCUU7WinDniS7uiYrxBDPILFBVqYXzqculhLbjVRwgIut+m8jp9Dp0fIcRKP2Umv9Po5/+o9ecylNc6i/e225VShmOGXSc0o/S4LBdnG8Y/RbD4iMUp5NfP7o+Mr91jyqlR4zDq8GNUsVGq9lAMSAyAM5kBjfELbU2kCCGm5bZXKpJga0GcGZ4ZHVkmJ59qWWKblxcuFBuZGwAGbCiEyLUa+XP+nBRCHHn8PjeR+bOmsKVkqZjz8th4vsR/RtMkwvCyDTEsk13roedyq9SL2KC5FUtZICSd0w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d7fd4c-4d1a-47a7-2c8c-08df04f06700
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 10:37:47.7827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tH/fkpqgKfuLqG0mBLmru/jmqLuHXmYZ9WHixDqEbvmhoo9s/u9Ga2IzylknCeaoSV73VWmFiXBJHPwjWB+p1ltIeRUyBNUl0FmzQELAW58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7902
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



On 8/28/2026 11:58 AM, Arvind Yadav wrote:
> Route selected GuC CGP protocol error logs through the structured SIGID

what is CGP ?

> logging helper.
> 
> These paths were already reported as errors and return -EPROTO. Use the
> GUC component, which maps to XE_SIGID_RUNTIME_FW, and pass -EPROTO as the
> errno value.
> 
> Keep this conversion separate from the reset-request failure path because
> it reports GuC protocol/message validation errors, not GT_TDR recovery.
> 
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index c1d469624215..0bd84360f38b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3508,12 +3508,11 @@ int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc *guc, u32 *msg,
>  						u32 len)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> -	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_exec_queue *q;
>  	u32 guc_id = msg[2];
>  
>  	if (unlikely(len != XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN)) {

can you prepare other patch that will move that

	#define XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN

to some GuC ABI header in the abi/ folder?
it shouldn't be really defined here
> -		drm_err(&xe->drm, "Invalid length %u", len);
> +		xe_log_err(gt, GUC, -EPROTO, "Invalid CGP_CONTEXT_ERROR length %u\n", len);
>  		return -EPROTO;
>  	}
>  
> @@ -3546,13 +3545,13 @@ int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc *guc, u32 *msg,
>   */
>  int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
> -	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_exec_queue_group *group;
>  	struct xe_exec_queue *q, *upd_q;
>  	u32 guc_id = msg[0];
>  
>  	if (unlikely(len < 1)) {

and add define for this magic 1 

> -		drm_err(&xe->drm, "Invalid CGP_SYNC_DONE length %u", len);
> +		xe_log_err(gt, GUC, -EPROTO, "Invalid CGP_SYNC_DONE length %u\n", len);
>  		return -EPROTO;

and I guess we usually don't print any errors for malformed message
at the G2H handler sides, as there should be a full error message
generated by the CT layer after we return -EPROTO error

see xe_guc_error_capture_handler
see xe_guc_exec_queue_reset_handler
see xe_guc_exec_queue_memory_cat_error_handler
...

>  	}
>  
> @@ -3561,7 +3560,7 @@ int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 le
>  		return -EPROTO;
>  
>  	if (!xe_exec_queue_is_multi_queue_primary(q)) {
> -		drm_err(&xe->drm, "Unexpected CGP_SYNC_DONE response");
> +		xe_log_err(gt, GUC, -EPROTO, "Unexpected CGP_SYNC_DONE response\n");

I'm wondering it this should be treated as EPROTO ?
what if it is our (xe) fault ?
maybe we should print some more details ?

>  		return -EPROTO;
>  	}
>  

