Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BB3C5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 10:27:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BBD10E547;
	Fri, 14 Aug 2026 10:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q+pxPLLH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219DB10E547
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 10:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786703269; x=1818239269;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DDCmCdbdqthTvU7rJlRueRkw1VR/ZK1CH50aqI6n0Ps=;
 b=Q+pxPLLHwU3LWadOaThQHY+dag2P/q5TRIW90L+IEuWkaigzvT6Uai/R
 Nl03wnijSilZIWE6vdnTq6noJpNa7S523yYuPv1B3Y0mQESf2MCUERLFq
 mDReydvfOLFX+ajdS57Vutccpl4peHsXBGKzcqqmHIG+EpFf9H8+mdmsH
 dZ/4XZ3EOKEAspYkcTm2hE7FVhpGng71/WrDJglTUKViiUlEWKfuX+FEp
 3CpwqX516G/JI+s51UsPAgth95PGkqRxunkFo4IsTnwsv33AaBKEWNMSG
 hX2LznK/ZZuwYbZgsxExP+ygurGFX34mFajt1t8y11dy1FzV01ZdRuzig g==;
X-CSE-ConnectionGUID: yglOLF6eTseez6wHUjJkcQ==
X-CSE-MsgGUID: PHo7PM1GSdObEKIZqqxA5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="89801608"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="89801608"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 03:27:49 -0700
X-CSE-ConnectionGUID: B1EuhcNoTXO4UhTfXFDOxA==
X-CSE-MsgGUID: QaXK+a+5Q4GuN6hdWQO1eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="262438978"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 03:27:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 03:27:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 03:27:48 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.62)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 03:27:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIKkkuDbmk9ia8hixZYu6EEXZWk+/Rilj1orC8VPr5px15FiG5j0lStOlv20lsZ0mrCpNOpUVnLD4gI+u4GfEX2Pz36+36ZOjXqimqU6hxH0U78Xw6hKJ2FwSaKlbk7uTX8EOL2HZ2RUc3fTRLri/y89voinSjtsT68bERYT8KY2jNMBo5ivs03FIPYWYLsjuY2BIsD9rCF21KDZ7c/ptkXVDiqtqQ66INxt5ZOyKPtR7UCHskEAX7QFIygbv7+dpwlmAg9AN4vbOKT09XmSTJxIj2TjI6EBOgMqwcMZGE1CHGJn0i2gsVehy66l5mpbaF2kYVOKoPqA/VSnL8B6Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQ2lYgfRRRSqyjXgbIMk+Zkgop4on//RVQOQaUVsOSo=;
 b=iPQGaOhuAf8CJvFcl3EhuOBHJwFC9QrwKX2Eim5p8m7Vgd3+i6Ij66Ct28CEC9ravb0I86lmbwRrK76iOIpen77+XNmFlffYwtiy2t3+ISAZwackoQqw3IU8cGImV8KvIcIHFnyaL7JauXLHCwtueQ4BbYgOAWLCufjYI0pinh+aJBmNy6wTMg29n19PQrL16wJVTAd8aTxS3tLQhTHnVXDyX89ExCiMvUgVcGxTZTFB3KMdV1g+fZFdU0KWLhxp83gqd+jDXQaDKBqgABFe1Ge7UglrDTVovKdcIH06Un3ECs0Ws/H8W5F4g+07V/zcjAsooG2lebtZfjttDYjnqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH8PR11MB9484.namprd11.prod.outlook.com (2603:10b6:610:2c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 10:27:40 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 10:27:39 +0000
Message-ID: <c0da31db-2026-49b6-9d3d-46c295564e6b@intel.com>
Date: Fri, 14 Aug 2026 15:57:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/32] drm/xe/survivability: Report 'Runtime Mode
 enabled' status using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-24-michal.wajdeczko@intel.com>
 <f203ca92-c042-46e1-be7d-773f63d9bb5f@intel.com>
 <d2bd1735-94bc-44cb-8fd2-dbde99db4ec9@intel.com>
 <5db999eb-2925-4301-ba60-8b90f56f8a5d@intel.com>
 <68b5e0a0-03f9-43e8-aa10-2ef1e79d52df@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <68b5e0a0-03f9-43e8-aa10-2ef1e79d52df@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0292.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH8PR11MB9484:EE_
X-MS-Office365-Filtering-Correlation-Id: 2135b868-3901-490b-3752-08def9eeaa2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: fgHjy/MNY7s4zSYdPcB+RuMlxKh87q75cTgJh53sqLsWaW5G/le1gpM5QH/pnK905zsGT0ksxRssEbpWcAihBpUnfGqI1NeKCsGVFK6URBSHR3S6MjgShYzpwXYuU7DgU75apuWXhvlCpNGIFrteHu5fcvWJNJzLIZ0i2yMEdPqeoIoCXcyz57hv8734gu5TA5naju0Cciv7nDm4CqpGiDJYQ/OtRxE8AFOB+6vkOfp7l504rY9/AHHUx1SB6xLDlwsPVmcVOcqSKwyy4ChjDptyxUYOlnIXBk7uJhlMgG/7O/xLlXvFYzG2wz6e5FlJ8nd62dbvJw+wLeeLyyf5zDw84dfpzrUmGWBevEYMODwAbFFiKvI0w4bs+jPsxQwgz1a1XhQdtWj6sAIt+bGAFUTt9yyG1iN7VeAa8+zYIJGxFrrVXKpqKfssMxAfY0MGS5crDgfqSfFv9qU5Bh92yTqvKJbUNUODokvJ2bInV+XdEcOE7s4iO1y1v0BYUPDhbhCXqINHptLqCfFSZ7U8SNStUpJdPXL3bpGu93AK6KWKk/9CKz1QTma2JLsyalrfoJwV2AKd6x32vJjAmYIxB03t/b2COk2gbiM16WrD18g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1BCOEt3SUhHb0JiQnJzcS94RGt1cFdEK0ZOVXZpMGpmMFNaa2pjb29UY0VC?=
 =?utf-8?B?cFNtc0hvaTRwTjdIUk5YMC92RXB2K1o0Y3hKcG9EbGNJeVVRRGIvdTZCZUhV?=
 =?utf-8?B?dEJKSVliYi8zT3F4bUsyUzJUaWlYNEQ0aTJvSkVKcHNRRGtZVWxEZzdLL3VQ?=
 =?utf-8?B?eUxLbWxaazl2eXBvWDg4UldQeWwzTWRHY2dwQkZTb3kwRWxRZ2k2L3FyVDJH?=
 =?utf-8?B?eGpUdDI4ZkxTU2ZsMGY3T2NwL0RqdUk4c0xPWmJFdDlPSGNlZVdaRUhOZU5N?=
 =?utf-8?B?UGw1aEIxYTZTU1Nla0dUK1lsODZoNjhCNERLTXRLbkt5ZkE1NHN6N291NEpk?=
 =?utf-8?B?N3h4NzJEbmUzUDBMOEZWcUJadTRkdy9VQUI2UDhCOHNQbjZzbU5STndzaFEr?=
 =?utf-8?B?TmdOL0R0ZG9pMk1BbWxUMURYd0NnQzBFOVRQQnBZcmhOMTh3TjY2eWM3cEhP?=
 =?utf-8?B?N3RaR0JLenUzbzdyc0pZWE1YSFBzUkg2bzBZdTFKY3ZMMEJoTmxOd01uVzlR?=
 =?utf-8?B?OE94K0NSRGdMVFhJZWppbTFyNkxNcURJbHBkdWZBQnVLVVk1bUJLZWZIMzc2?=
 =?utf-8?B?MXQ3RDdOTXN5L01YMXR0OEVTZkFveXRZSkwvL0swZEhyR2hCOTdFL3lnL3R5?=
 =?utf-8?B?RGNpTWRtbFgxODF0dlcvWmpLTXJ0ZEtaVExHK2g1V05LVmNVM0taTkN4SE5I?=
 =?utf-8?B?SFBQTjgrdWhuaG9aRWUwd1dMM1MxRzFEWk1xNWR1RzFWZ2ZMQVBUSVoxbW9N?=
 =?utf-8?B?Sms1N2lqT01XaVlza0dLVXpMWjI4WjdYemdnR2x3OUVaMmo4VWZKbGhnZ2Nn?=
 =?utf-8?B?dDkvMnE2Q0cvT3J4dUtvRDFOODhrdGlqTjN5WFU5dStnQ21zeXFYQS84RG9n?=
 =?utf-8?B?RENMaGo2Q1BIT3FqS0lsY1gxdEF5bUNYVTJsQUNjdDFQUUZQT29qN0ZIbFBZ?=
 =?utf-8?B?dFV4dFZ5RklmN3ViMTRMVXY5S2RCbFhQNHFXQ3ExdDlPNTYxVGVqSUVXcVFy?=
 =?utf-8?B?VkxIbU80NmdWY2NacFhiM2R0Y0NsZ0FrVE4vTnQ2SjhDVm5KRFdkVUxOdWY3?=
 =?utf-8?B?VFNFaEhVOEh0dFlTNlg1cE16YlNtMjZjTWFyYyt1cFdlYm1VQS8zdEpwb3V0?=
 =?utf-8?B?Qm1LT3dVeWo1MEtZMUpXbFBwM2Z1QVFsZ2FaeUM5REQrM0tzU1I5OEZhSVNo?=
 =?utf-8?B?ZjRBWjFMdGRDZ2JMUEdXeEV4QkFsUmUvY3Y1cllFeEVLays3dE1VN2RJUUNt?=
 =?utf-8?B?RU9FL1MrSm16M0ZqMU9ZZ3NhbzBLOCtXZXRNUHRmT3lEQWxaT21LR0tnc0dI?=
 =?utf-8?B?eGcwZktvMDRxUGMrOE1jUmFCUnM0RXBJWE1SYzB2TGxWZEdQVDZFTzNZSlZM?=
 =?utf-8?B?citjN2NoMTg2cnRKQmRXZXJnV2JNdjcrdkg3Q0VrVTZ1SmEvZm5tM3RlQVhw?=
 =?utf-8?B?SHREMEh4d0pZT2xhRnJISDJadWxZQVEvNlh4UUl0UGNmMGdVbUlkZHROVHNn?=
 =?utf-8?B?T0ZVR2pJcGlNZFlPOVBzUkExZTRVTk0rZk9CN1FVL2hINXpUbGNmeWh1ZDds?=
 =?utf-8?B?MGp1WVpwRTR0WUwxdHZZSXpjT0xCM3NacVNYOFVzTjJTZThleUc0S0R2M09W?=
 =?utf-8?B?YkJKckhQK2d0S1RmOWFmWFZQTUZtTXAyTjZTdmJmM2p1V1BNck1mU3U5THBn?=
 =?utf-8?B?VlZXcWNpdWMxdHlHVVF5NEo4ZlNucGdvbEgrRmxxQnEwZkIvbGhRYXVZcnZL?=
 =?utf-8?B?YVB4emFLcGZrcms5cEpKRW10aUwvdURVSnlTMXpxTjQwZ3Vsc25hcmk4bHU0?=
 =?utf-8?B?WldDSGxJK1lkRkhLeWZ5c2h6ZHV4ZGNhL0VmQURaQ3lxOUx0NmgybDZ0cGZm?=
 =?utf-8?B?Zk9Rbk9IWkZJVzhVRTZCMzA5aUx4M2ExekdkczhZU2JneTFVOXNsU09tc3dv?=
 =?utf-8?B?U1A4UHcxRlo0cjZCckFEMVRuQUdBODdmWnorWG4rTFhBdFErRXMzcVgrcEp6?=
 =?utf-8?B?WDhxSW5yOG04NDdvMG1yUEdRNkFsc2EyOUI1bzlUTitPU210OFFDU2lOMVBC?=
 =?utf-8?B?TDdMdUlSWVA5M1dQY242MnVYRVYvZ3J2Q2FWV3g4Z3BiZFhZUFQvcVJMTEdx?=
 =?utf-8?B?UEtKako1Ym9DZHJIeDE3eFNSSTRmVXNUcCtkTkZkS2hkTUt6eXZ5L0p2UXJz?=
 =?utf-8?B?blR5aXRRNW0vVW9BQ0dXdVpkdHQ5WU1BZGh2dGdCRUdCbzc2SmJSMTRiYTBD?=
 =?utf-8?B?cHdVaXozdlN3TmVQMVQ1dWZjVGxHNWtKcXVUMlVIREQwNHFvbXNleG5EaVB6?=
 =?utf-8?B?bC9BbGpDY2QrM0VEdXdtWlh0U29OUVNKRGhoOWpSUFN5MElNNGJidz09?=
X-Exchange-RoutingPolicyChecked: U5VI6oDHvDBAncan8fPEbv3V85MYe5fuMTf7o+yoSFdEEABRfImFcH9pIS0C8X57OqINYmGbU+MXuf4AVJJX2sTz0mCL5qzl+RNT7rWKx5Gng6ifnJHykmLxR80joJ03w1oJyiylVXYwXw6+lMaH4EkWdX25kUrAziBB3LacwinpVU3lx+Huc++hGWviURURNl+h+eYouHf+WqjEl9DJmGTtekPq1zrlKhO9iAaI5g8Jc/osAJo3nytc6MUAYLRsl6d1XjpCOa16PHh9OCgrmwntpjT4G4nrUKPKCTMbnz0S1PQAzJVCGr7goofGrq/NjCUZeM8vhrCwIGUrA4Vfvw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2135b868-3901-490b-3752-08def9eeaa2f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 10:27:39.0619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTSo6lZgs/7tTcfuOmD+DMjB9k2cCi0Sv/doQQijvZkBfZAE1EiWEhKCVAvkqot2g+BRxKvuH5T97/zAgJ+h6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9484
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


On 14-08-2026 15:48, Michal Wajdeczko wrote:
>
> On 8/14/2026 9:06 AM, Tauro, Riana wrote:
>>
>> On 13-08-2026 18:16, Michal Wajdeczko wrote:
>>> On 8/13/2026 1:40 PM, Mallesh, Koujalagi wrote:
>>>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>>>> Report 'Runtime Mode' status using various xe_log() helpers.
>>>>>
>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_survivability_mode.c | 10 +++++++---
>>>>>    1 file changed, 7 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>> index ebd288986c11..5d3315ac735c 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>> @@ -18,6 +18,7 @@
>>>>>    #include "xe_mmio.h"
>>>>>    #include "xe_nvm.h"
>>>>>    #include "xe_pcode_api.h"
>>>>> +#include "xe_printk.h"
>>>>>    #include "xe_vsec.h"
>>>>>      /**
>>>>> @@ -405,7 +406,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>>>        struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>>>          if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
>>>>> -        dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
>>>>> +        xe_log_err(xe, SURVIVABILITY, -EOPNOTSUPP, "Runtime Mode not supported!\n");
>>>>>            return;
>>>>>        }
>>>>>    @@ -413,11 +414,14 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>>>        create_survivability_sysfs(pdev);
>>>>>          survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>>>>> -    dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
>>>>> +    xe_log_info(xe, SURVIVABILITY, "Runtime Mode enabled!\n");
>> This should be xe_log_err
> do you want to include any specific errno here (like -ESTALE)
> or just use 0 to do not include it in the message?

Can we skip errorno for now based on comment in the last patch?
@Rodrigo I was thinking we could add the detailed error information from 
scratch registers here
in a future patch but will need to come up with some format
Let me know your thoughts?

> asking now, as I don't want to respin the whole series
> after I make a wrong decision based on dice roll
>
> having an extra errno in the dmesg/CPER along with SIGID will
> likely help us write better documentation with resolutions


For survivability, UMD's need to check sysfs always before taking a decision
of recovery as we have multiple recovery methods.
We cannot have generic recovery documentation based on error no here.

Thanks
Riana


>
>>>>>          xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>>>>>        xe_device_declare_wedged(xe);
>>>>> -    dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
>>>>> +
>>>>> +    xe_log_info(xe, SURVIVABILITY, "Firmware flash required!\n");
>>>> IMO, we need to use xe_log_err (recoverable) here instead of xe_log_info.
>> Same here.
> ditto
>
>>>> Already mentioned in original changes [1], runtime firmware errors cause device unstable:
>>>>
>>>> [1] https://gitlab.freedesktop.org/drm/tip/-/commit/a2ca0633a0fef925a0d8125d8f3e4495a5ecb310
>>> but in recent comment [2] you said that Arch team wanted that to be logged as info rather than fatal
>>>
>>> [2] https://patchwork.freedesktop.org/patch/743324/?series=171022&rev=3#comment_1373731
>>>
>>> @Riana, @Rodrigo, @Aravind ?
>>>
>>> I need a decider here
>>>
>>>> As I know xe_survivability_mode_runtime_enable function need to carry errno as parameter to pass into xe_log_err,
>>>>
>>>> however we need to create separate refactor patch for that in future.
>> Why do we need error no here? It should be 0.
>>
>> Thanks
>> Riana
>>
>>
>>>>
>>>> With above changes:
>>>>
>>>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>
>>>>> +    xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
>>>>> +        xe->info.platform_name);
>>>>>    }
>>>>>      static void log_survivability_info(struct xe_device *xe)
