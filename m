Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0F3CAC5BB
	for <intel-xe@archiver.kernel.org>; Sat,  4 Oct 2025 17:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561DF10E00D;
	Sat,  4 Oct 2025 17:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCbyfyzG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A0F10E00D
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Oct 2025 17:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759598042; x=1791134042;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gQfBRv5icFnygS9hFm1pyURNYXXhseWp/BcTOMS+HAw=;
 b=aCbyfyzG2yhyiat2XMF5knrJSC7VIlL4vb4lvfz1qdr5hno0YOhTMD+N
 KxOmpWW4FclmY7d4Mq6jMGT9+I2r2PYJysKSlPh86IEINzOF7GYUXDeiF
 SBIyJSoumSqPQSZTA2sbQAt3a8/Nc6PGsHWo607vUQIAQFH3jm0iVcJZy
 RqCBsAc6YrV5l7D0huAS/XQuwyRdnRSugVsYpIfpbPGrKJoCOS2YiZMN5
 E0BHXEazm7FVg6Xd9pgGZfevcsCnSmqA768N7HblIuTt48HtG9Dsdlr62
 QdQp7vfw3nB603BT7eXy2oBiYxe6ZBQxVjkQbAH9UZtCmkdo8ERDexa0s A==;
X-CSE-ConnectionGUID: XFO67NFJT12nItvD0O0tZQ==
X-CSE-MsgGUID: XgpyoUEASwuBCJK5vnmuDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11572"; a="84467028"
X-IronPort-AV: E=Sophos;i="6.18,315,1751266800"; d="scan'208";a="84467028"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 10:14:02 -0700
X-CSE-ConnectionGUID: Di99rKD9Q9ewxY7LJWwEjQ==
X-CSE-MsgGUID: fDQ3x8w/RFyQsdkslZ8qDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,315,1751266800"; d="scan'208";a="179136652"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2025 10:14:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 4 Oct 2025 10:14:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 4 Oct 2025 10:14:01 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 4 Oct 2025 10:14:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smv9zPEy4AtBbwqgAeNN6i0qmQM44j/NllnwQe7wR8YCmpkTwDfpj71s7Cso4hNQ5SNdOz9y6LX7OyjmllzWiPSkiJddzx5mHEllVorvzSwqTmIBNYsx9tfX+zCX54s9hmpaQ5yZU32ntKnDHZNoYkHMThn+a5+emr0hZPjyE++qz9Rz/cZqEQYkNAD9erz1Z1SqJFAYAeNS//eYjs9LcZLg+dox4Ya2jYjTjhhgjvFfDTfZmYqXBSxoucu/bfZxdFnhrl1+7A7NFnJI+odW8aZvMi08LCbvrdCoJ1m47UV2t8DqKJYIMaZXPRl9hfEujKN0lk6qxGCvnQFBQDXDGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMQzlFgD7DP2pW+fJn9AWqwb1cqofOWil9vooo7WOEk=;
 b=dviS1qR6URvkWURKDYEJuUd2jcXUUR03KC5aXgsRwDCFlMHnYSeIIXHJ3Wpv0bKHnumccHR4kkO377omun+3P8NXRcfAXr/s0JJrPUXdDmavVJ3TqZcr2zh9HE3RL1PIMtZIvTAxpoMrLlWHRf/Jj74rznq+kf0ILcoYWCNj1KRE/RomL1k6H1qza8Z9PDlQ9uiqomXD0hKAIa05GufrkLomu7bgzS9R3EvOZfWR3wxv8CO4xAoATJQwMv/aXgBSDCT7c1JTTEVFsmgbucapUPwlLXXdIg0c6hV53mg1IuaBRpCSUNAto9wn2zx19jPIBMViuA5FgCC5K/NRRk3Oag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB9478.namprd11.prod.outlook.com (2603:10b6:8:28f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Sat, 4 Oct
 2025 17:13:54 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.015; Sat, 4 Oct 2025
 17:13:54 +0000
Message-ID: <0d01a481-1bc6-4843-b2d8-ca0e2bf73dcc@intel.com>
Date: Sat, 4 Oct 2025 19:13:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe/guc: Add prefix to guc log buffer macros
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251002150302.99524-1-zhanjun.dong@intel.com>
 <20251002150302.99524-2-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251002150302.99524-2-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::21) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB9478:EE_
X-MS-Office365-Filtering-Correlation-Id: 6178554f-66d5-4ed4-3ff2-08de03696550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2o0NzBvd0ZRWWxKaUQxd1BpbHNPcW9QaFJhUms5U21Lc1J6dXV0RXkzWjdZ?=
 =?utf-8?B?Lzdqd1g4eDA1T3IzaGo2eTBzMjNyVm1pT2tQNDJlaFlFelNreXdJWmFhQi9s?=
 =?utf-8?B?QTduV2tlRnNmTVdZSFIySEZCazFDZTNtdHJzMHdQVmthYW44UlZINEUwdytt?=
 =?utf-8?B?a2N5eUx4amY3ay9FVW9jbU90bzhUUFhDM1BDbUZJVWNURTROWkZmOEc3ZWhP?=
 =?utf-8?B?NGloZUJjNGY0VnZCUURjMWhXUitGaDF4Wnk5d2lzMzVZckl0RHh6cEVsa2xT?=
 =?utf-8?B?VnBOdkhxNDF0cElRUThXOEJ1bGRpMkd2YU05dVcrSDc0elZ2NDlEMFBOc21j?=
 =?utf-8?B?bTVscGlDZGoyZUxwTVRodkIzbjlmNkVsUjlJSEpLb3RncGZRMzBqZHhPM0pZ?=
 =?utf-8?B?ZHFNb2VHQlFmSFZLT3lmN0R6Zk5NUXh0K2N0ZXpid0w1WjR0SEd2Ui9GU2VI?=
 =?utf-8?B?VkxwWi8raFNBMWMvcG1oc0QwbXZyaHQyc01DSEpRUDErRGloMDFBdVJ1N3NK?=
 =?utf-8?B?YXpCUDF3ZlY0ZVAwSTVCcEtXWUwrbis5NTJmV085WnQxSENkMWtEbmtENW9B?=
 =?utf-8?B?clZpS25yMEV6L055ZGJFcGZiZDJwZHFGQUNsTGo5eHh5Q2hYVVFIZHN3eldT?=
 =?utf-8?B?QkNQTEp0MFpaOFZ0QVlOZjBzdFZTaWpvVWNBWVFqdzVCQ0RxU3g1K2ZVazN5?=
 =?utf-8?B?emFPbkJTdjZaWkZFZW50VWlySVFlbHZQak1pUjNldXRLSlY3VTVIUHc1amRT?=
 =?utf-8?B?WGxra0srV0NUN2t0aVAzeXBZa0NWRktpUWdxdTFZYm1jcG9ybVVPbVA2dzNT?=
 =?utf-8?B?WG9UQlRhK2xqNUdDYkpvWEh5YytnMnJGcEJGeHJGUHNtdlJDcHFjOWlwS01X?=
 =?utf-8?B?a2FDY2pLc0VrR0s3M3kxNnhtWmVsME9JTDVEZkFTdzZET0tMMVNyVmxaYk9P?=
 =?utf-8?B?d0lNTllkbitFRmVYRmpFNjZHSm5oTThkaHFXR1VjWnhKMjhlRE5EZXVyanpJ?=
 =?utf-8?B?VnhoWWtESy9VN1QvSXl2Uk9Oc2tENWtPTzlQdGJWUVQ2RnZYVmJuSVpWUDZp?=
 =?utf-8?B?dWVHWFJZempyQ3U1VkUyMHhFUDREZXJxa0lxMmxqcHFyYksyd0FJdklsRzRu?=
 =?utf-8?B?b2hVb1ZlcXN3cEdhamhXbVcyQUNPcW8yMEJwcFROZlorRnJiZE9vRWltWWZD?=
 =?utf-8?B?U1NtR2kxZG5wMy9TbzI5TEVhaTk1K0tZSmM2dTlET2N1czMrVytDUFpIYXM5?=
 =?utf-8?B?SUExZ1krakxTYSs1QzZwbG9SK1gybUtEWkczVmhWSjdPeHIxNFhmLzVlSnZE?=
 =?utf-8?B?NVhmWWVsdjVhNm1hbmZpV3BHWEc0c0tMbnErZ3hULzRWbEkwSjhNeXJhRDFq?=
 =?utf-8?B?NFhpVllmVXVFYlpSL0dvT2ZGdFkvK0QvQ3FTZWdRWm5tTXpSZStsNzl4dExD?=
 =?utf-8?B?WS9naTFLY2lGdXhkQ2ZnaVNOZHVmOWpKRUlVZXltL1l3Q09RL2t6Y29ET2xo?=
 =?utf-8?B?N2lFV2FDb084cXlMZE1kb0tmNFd6T3RsK3psYUtNL0hWMGQvUFZWVUxrTmF3?=
 =?utf-8?B?aWNBVUxaeGJ2cm1BTzJ6UWQ4b20rVTBna2N5ajdraEl2R25aR1JWSU1kNlRs?=
 =?utf-8?B?NHg1dEtDZlpYeWc3TDJTYmdZVkQzOHI2cHMyNU1Hd2dFdzBsVjVwNkFuZVpM?=
 =?utf-8?B?MlJRdWpXeXpQMm1GNzlnNzlHNy9FdHJ0K1JCZG5tdW5kWWlLTHd5VDloeXps?=
 =?utf-8?B?RmZ4aHdXNnJFcmpiT3prTUJYcjdTZlZvZW9xRVBKb0NLRUVZU2xPVWxsd0R0?=
 =?utf-8?B?NlU2ZHdzYUsxTmh3YjdIeitPV2N3ODFURERYUnRhYUFXMFplTWZyamlpM2Nr?=
 =?utf-8?B?OGVndk83NTErL0hKY1R5dXBKajZsVjQvYW5rSzNMQmdpZWtMSHBPR21za0M0?=
 =?utf-8?Q?eJbW8FNYxGZSFx1+Tch+8+rUFesl1plx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3hMUzBnRXNFdlZkNVpUTnB1ZGhlR3N1a3gyTWErdGdzQ3pjQ2M0cFU3WGUz?=
 =?utf-8?B?VlFOMDJ3UE00U1RCV0tRaDU4T2VSRDFMUjBIb21XSjlKZDhCVlVBQVdBS0tQ?=
 =?utf-8?B?U0ZKaTRjeDJLM0E3Wm1UdXdNMHVibUgzV0J5R2lWYzVvNnNPVTNtYmZFeE4r?=
 =?utf-8?B?U2pTTVNPSEZBemtwNnN2Y01xSU5QY0hXZ3YrcEVWcnVyREI1YndoUEh5TUlZ?=
 =?utf-8?B?dS9iaVozWmR6dzBCVmN3dHllelRnQWkzaVAvNEY2MzFBSDRYQmNVWEVLMnFq?=
 =?utf-8?B?Ry81VWtGbGdlVjBKbTJMU2d4VisxVEsyc0lqdzBQU3l1UXE4eGlJTWloZjND?=
 =?utf-8?B?MVRkVUR4VHBscFJ2emcvN29sY1ZLaFJvK25mRFYvMHk3ZmtvNUs2ZDU1YTdl?=
 =?utf-8?B?Z2NNMjlsYWdmbVdoZ05aSmQ4cjdid1BaRnpmTlA2Y2t2Qit6d00xTEhDSm5Q?=
 =?utf-8?B?TmFGMGdNSHNvL0FZT2oxaFJZclZjL09qcFQ3OE5EREVvVHVramNFS2RlWGth?=
 =?utf-8?B?YmRxNFpSZlhybzVPNDU2WmpiSmRTOGRjeWdDUHVpVUdZQldOcElkL1lBUUlm?=
 =?utf-8?B?YjNwckxSMERsZktuM1Q3N1hzY1B1ZzlBcGR4dGYvaks5ajhTYWxPZnFKeXFn?=
 =?utf-8?B?VVhBLzJveDg5ZmNJQ2trV2tHdm1LSmdEc2tDWFMySWF3THpXd2I2MFVvVzJi?=
 =?utf-8?B?K3RYK1hJMm81blJCWjl4dGtBMkI3azhRSnFmemdZSzFxQkl4OGFHV1BuVWxU?=
 =?utf-8?B?YTNwTU10RnU5aHNYdTZ3T2ZPN09GeEs3QzJmNFoya0kwQ3ZtTTRLcUl6RHFF?=
 =?utf-8?B?c1VwOU1nOGtIRW9qMFFDNTcrUUF5eW9QMVcxMTlYMVVHM085TzVlbm4wMlYy?=
 =?utf-8?B?Yk14NERra3lEY2szQy9ZWCtsTmdHVExjWDN4VlV1M0pGT3M2cGU3d2VKbW4y?=
 =?utf-8?B?VkNSdVdneGQ0OUNWVE5XTmdtbzU5RGVqZllMbmRrSExoU0tMb2xtak5qa0lm?=
 =?utf-8?B?L2o4R0tsR3lvNjh2UDF3ZzR3V0Y4RE9acFpMcGhucCs0UllMYWN2eXVVNkZs?=
 =?utf-8?B?QnR6eFNqVVZIM2lNOWJXcFoyei9jV2VyQXpkYk1HR2dsRjVoVHdHczNiMmNz?=
 =?utf-8?B?Tkh3YTF1b2JCenM3WGpVYnBPSnVsbCtRSDNJc1ZYc09IRFZSNllGS0xqTlJq?=
 =?utf-8?B?NERNeE83SFNzdnJ4aGZkOVJsZk5QNUN5R1NvV1hDV3kwbU1QdkhCRGF1MkhX?=
 =?utf-8?B?dE1IN1Z0N2VwcURibGxlK0RXb21XOFpGSEZid1Zac3p5SzlFQkxaNGc2UjR1?=
 =?utf-8?B?VEJBbDYzOFR0emlHSERVbldFRElVS1ZwMzRhQyt1SlViaFU5d20xMm1NR21Y?=
 =?utf-8?B?TmRvcUo3OXdJRzJJZ1k0VnVkaSs5ZmFURmxkaUEwQzVEMzQzY3VrWGpSRy91?=
 =?utf-8?B?NVhrL3pRRnI4N1gvWmh6cTdCckhtd1dodEl5S0FJU0RHcDF5ZDN6VjN4K0Zy?=
 =?utf-8?B?cnNQN3hBZlZpN3ZHSU1QYk1pQU90Um1SdFBOQTJzL1crb3JPT090bHRLaFNH?=
 =?utf-8?B?U2RZNU5TMjNsT1pIQjhOWkFBdzBSMUV5WC9yS1dGdS95K3Q1cE4zbDIzcVYy?=
 =?utf-8?B?aHFVUnBJNnUrZm1oanBtc1puY1FiNDZiVVZqcHJoZXNFYXpXeXRlLzBuU3Y2?=
 =?utf-8?B?MTV6bHVJWmJvZERtbkx5Q2hZSHBzRnJMK2tXWmUrN0MxcFJ2enZKT0o0Y2Fr?=
 =?utf-8?B?QmRQcWlxZmYxOUwvVzFQcTlSdllrWm5CM2hVaStETXpwYzhaWWJmOGtwdDhW?=
 =?utf-8?B?dThCaUNPVHRaYVpDWm5KSUpSeDJTRU5JOVdOck1TWTUySnZMaXprM0d3OWNQ?=
 =?utf-8?B?cnpkU1ZRcWU0VExXeHRyN3BjTllVOGhpRjk4MnM0L3hiUGh5c3V0MDFYZWxo?=
 =?utf-8?B?cHVoaXNqRTloTUZ2YXdON2NMdy96elNnREFqbjQxekptNjI1czVVQ2lpOCsy?=
 =?utf-8?B?ckdJd1BzelNhUlU5UHNGTGVRcTREUS9yU2Y0YW02N1hMUVhYb2ViRTYxWFg5?=
 =?utf-8?B?d0QvaUZJbWsrUUZPcWNHc3YxamdlZ2lJYVExaXQrOFB4OWRwYmQvWHo5Tmhv?=
 =?utf-8?B?cFR0MUc5M3dSY3dJdzA1c2hYcUdtNkRiQzViS0pnN2h4RU1jaFpNQ0F6NGh6?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6178554f-66d5-4ed4-3ff2-08de03696550
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2025 17:13:54.0358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PzSmBROX7F+62lAna2TwYY3Wi/rSbtL/VvtPKLhhMbNuMIKJqO0dOZMyq1toaKGf4yJCZYfZTBahi/M78ihenmYysZ65JF5JBN/We/W/Q2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9478
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



On 10/2/2025 5:03 PM, Zhanjun Dong wrote:
> Add prefix to GuC log buffer macros to follow Xe naming styles.
> Remove helper functions, replaced with macros.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c         | 22 ++++-----
>  drivers/gpu/drm/xe/xe_guc_capture.c |  6 +--
>  drivers/gpu/drm/xe/xe_guc_log.c     | 71 +++++++----------------------
>  drivers/gpu/drm/xe/xe_guc_log.h     | 14 +++---
>  4 files changed, 36 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d5adbbb013ec..b0ea9a13847a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -99,7 +99,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>  	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
>  	u32 flags;
>  
> -	#if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
> +	#if (((XE_GUC_LOG_CRASH_BUFFER_SIZE) % SZ_1M) == 0)
>  	#define LOG_UNIT SZ_1M
>  	#define LOG_FLAG GUC_LOG_LOG_ALLOC_UNITS
>  	#else
> @@ -107,7 +107,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>  	#define LOG_FLAG 0
>  	#endif
>  
> -	#if (((CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
> +	#if (((XE_GUC_LOG_CAPTURE_BUFFER_SIZE) % SZ_1M) == 0)
>  	#define CAPTURE_UNIT SZ_1M
>  	#define CAPTURE_FLAG GUC_LOG_CAPTURE_ALLOC_UNITS
>  	#else
> @@ -115,20 +115,20 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
>  	#define CAPTURE_FLAG 0
>  	#endif
>  
> -	BUILD_BUG_ON(!CRASH_BUFFER_SIZE);
> -	BUILD_BUG_ON(!IS_ALIGNED(CRASH_BUFFER_SIZE, LOG_UNIT));
> -	BUILD_BUG_ON(!DEBUG_BUFFER_SIZE);
> -	BUILD_BUG_ON(!IS_ALIGNED(DEBUG_BUFFER_SIZE, LOG_UNIT));
> -	BUILD_BUG_ON(!CAPTURE_BUFFER_SIZE);
> -	BUILD_BUG_ON(!IS_ALIGNED(CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
> +	BUILD_BUG_ON(!XE_GUC_LOG_CRASH_BUFFER_SIZE);
> +	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_CRASH_BUFFER_SIZE, LOG_UNIT));
> +	BUILD_BUG_ON(!XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE);
> +	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE, LOG_UNIT));
> +	BUILD_BUG_ON(!XE_GUC_LOG_CAPTURE_BUFFER_SIZE);
> +	BUILD_BUG_ON(!IS_ALIGNED(XE_GUC_LOG_CAPTURE_BUFFER_SIZE, CAPTURE_UNIT));
>  
>  	flags = GUC_LOG_VALID |
>  		GUC_LOG_NOTIFY_ON_HALF_FULL |
>  		CAPTURE_FLAG |
>  		LOG_FLAG |
> -		FIELD_PREP(GUC_LOG_CRASH, CRASH_BUFFER_SIZE / LOG_UNIT - 1) |
> -		FIELD_PREP(GUC_LOG_DEBUG, DEBUG_BUFFER_SIZE / LOG_UNIT - 1) |
> -		FIELD_PREP(GUC_LOG_CAPTURE, CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) |
> +		FIELD_PREP(GUC_LOG_CRASH, XE_GUC_LOG_CRASH_BUFFER_SIZE / LOG_UNIT - 1) |
> +		FIELD_PREP(GUC_LOG_DEBUG, XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE / LOG_UNIT - 1) |
> +		FIELD_PREP(GUC_LOG_CAPTURE, XE_GUC_LOG_CAPTURE_BUFFER_SIZE / CAPTURE_UNIT - 1) |

hmm, but here it looks the in the GUC CTL params, the naming is different

and the GuC spec is using this naming:

	GeneralLog
	StateCapture
	CrashDumpLog

so if you want to do cleanup in naming, please update both places (BUFFER_TYPE and GUC_CTL_LOG_PARAMS)

or just make them consistent

>  		FIELD_PREP(GUC_LOG_BUF_ADDR, offset);
>  
>  	#undef LOG_UNIT
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 243dad3e2418..acb95a93b530 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -816,7 +816,7 @@ static void check_guc_capture_size(struct xe_guc *guc)
>  {
>  	int capture_size = guc_capture_output_size_est(guc);
>  	int spare_size = capture_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
> -	u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
> +	u32 buffer_size = XE_GUC_LOG_CAPTURE_BUFFER_SIZE;
>  
>  	/*
>  	 * NOTE: capture_size is much smaller than the capture region
> @@ -922,7 +922,7 @@ guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *no
>   *                  ADS module also calls separately for PF vs VF.
>   *
>   *     --> alloc B: GuC output capture buf (registered via guc_init_params(log_param))
> - *                  Size = #define CAPTURE_BUFFER_SIZE (warns if on too-small)
> + *                  Size = #define XE_GUC_LOG_CAPTURE_BUFFER_SIZE (warns if on too-small)
>   *                  Note2: 'x 3' to hold multiple capture groups
>   *
>   * GUC Runtime notify capture:
> @@ -1368,7 +1368,7 @@ static void __guc_capture_process_output(struct xe_guc *guc)
>  	xe_map_memcpy_from(guc_to_xe(guc), &log_buf_state_local, &guc->log.bo->vmap,
>  			   log_buf_state_offset, sizeof(struct guc_log_buffer_state));
>  
> -	buffer_size = xe_guc_get_log_buffer_size(&guc->log, GUC_LOG_BUFFER_CAPTURE);
> +	buffer_size = XE_GUC_LOG_CAPTURE_BUFFER_SIZE;
>  	read_offset = log_buf_state_local.read_ptr;
>  	write_offset = log_buf_state_local.sampled_write_ptr;
>  	full_count = FIELD_GET(GUC_LOG_BUFFER_STATE_BUFFER_FULL_CNT, log_buf_state_local.flags);
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index c01ccb35dc75..fa1d490dca0d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -50,16 +50,16 @@ static size_t guc_log_size(void)
>  	 *  |     Capture state header      |
>  	 *  +-------------------------------+ 96B
>  	 *  |                               |
> -	 *  +===============================+ PAGE_SIZE (4KB)
> +	 *  +===============================+ 4KB
> +	 *  |          Event logs           |
> +	 *  +===============================+ + XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE

I'm not sure it is worth to include obvious XE_GUC_LOG prefix in the doc

maybe this diagram should just look like:

	 *  +===============================+  0000h
	 *  | ... header                    |   ^
	 *  |                               |   |
	 *  |                               |  4KB
	 *  |                               |   |
	 *  |                               |   V
	 *  +===============================+   + <-- GENERAL_LOG_OFFSET
	 *  | GENERAL_LOG (events)          |   ^
	 *  |                               |   |
	 *  |                               |  GENERAL_LOG_SIZE
	 *  |                               |   |
	 *  |                               |   V
	 *  +===============================+   + <-- CRASH_DUMP_OFFSET
	 *  | CRASH_DUMP (raw data)         |   ^
	 *  |                               |   |
	 *  |                               |  CRASH_DUMP_SIZE
	 *  |                               |   |
	 *  |                               |   V
	 *  +===============================+   + <-- ERROR_CAPTURE_OFFSET
	 *  | ERROR_CAPTURE (raw data)      |   ^
	 *  |                               |   |
	 *  |                               |  ERROR_CAPTURE_SIZE
	 *  |                               |   |
	 *  |                               |   V
	 *  +===============================+  80100h (max)

and it can be even promoted to full kernel-doc

>  	 *  |        Crash Dump logs        |
> -	 *  +===============================+ + CRASH_SIZE
> -	 *  |          Debug logs           |
> -	 *  +===============================+ + DEBUG_SIZE
> +	 *  +===============================+ + XE_GUC_LOG_CRASH_BUFFER_SIZE
>  	 *  |         Capture logs          |
> -	 *  +===============================+ + CAPTURE_SIZE
> +	 *  +===============================+ + XE_GUC_LOG_CAPTURE_BUFFER_SIZE
>  	 */
> -	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
> -		CAPTURE_BUFFER_SIZE;
> +	return SZ_4K + XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE + XE_GUC_LOG_CRASH_BUFFER_SIZE +
> +		XE_GUC_LOG_CAPTURE_BUFFER_SIZE;

those are all macros, maybe guc_log_size should be also converted to macro ?
>  }
>  
>  #define GUC_LOG_CHUNK_SIZE	SZ_2M
> @@ -274,49 +274,6 @@ int xe_guc_log_init(struct xe_guc_log *log)
>  
>  ALLOW_ERROR_INJECTION(xe_guc_log_init, ERRNO); /* See xe_pci_probe() */
>  
> -static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
> -{
> -	return CRASH_BUFFER_SIZE;
> -}
> -
> -static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
> -{
> -	return DEBUG_BUFFER_SIZE;
> -}
> -
> -/**
> - * xe_guc_log_section_size_capture - Get capture buffer size within log sections.
> - * @log: The log object.
> - *
> - * This function will return the capture buffer size within log sections.
> - *
> - * Return: capture buffer size.
> - */
> -u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
> -{
> -	return CAPTURE_BUFFER_SIZE;
> -}
> -
> -/**
> - * xe_guc_get_log_buffer_size - Get log buffer size for a type.
> - * @log: The log object.
> - * @type: The log buffer type
> - *
> - * Return: buffer size.
> - */
> -u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type)
> -{
> -	switch (type) {
> -	case GUC_LOG_BUFFER_CRASH_DUMP:
> -		return xe_guc_log_section_size_crash(log);
> -	case GUC_LOG_BUFFER_DEBUG:
> -		return xe_guc_log_section_size_debug(log);
> -	case GUC_LOG_BUFFER_CAPTURE:
> -		return xe_guc_log_section_size_capture(log);
> -	}
> -	return 0;
> -}
> -
>  /**
>   * xe_guc_get_log_buffer_offset - Get offset in log buffer for a type.
>   * @log: The log object.
> @@ -327,13 +284,17 @@ u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type
>   */
>  u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
>  {
> -	enum guc_log_buffer_type i;
>  	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>  
> -	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
> -		if (i == type)
> -			break;
> -		offset += xe_guc_get_log_buffer_size(log, i);
> +	switch (type) {
> +	case GUC_LOG_BUFFER_CAPTURE:
> +		offset += XE_GUC_LOG_CRASH_BUFFER_SIZE;
> +		fallthrough;
> +	case GUC_LOG_BUFFER_CRASH_DUMP:
> +		offset += XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE;
> +		fallthrough;
> +	case GUC_LOG_BUFFER_DEBUG:
> +		break;
>  	}
>  
>  	return offset;
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> index 98a47ac42b08..0cc059cedb9c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> @@ -13,13 +13,13 @@ struct drm_printer;
>  struct xe_device;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
> -#define CRASH_BUFFER_SIZE       SZ_1M
> -#define DEBUG_BUFFER_SIZE       SZ_8M
> -#define CAPTURE_BUFFER_SIZE     SZ_2M
> +#define XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE	SZ_8M
> +#define XE_GUC_LOG_CRASH_BUFFER_SIZE		SZ_1M
> +#define XE_GUC_LOG_CAPTURE_BUFFER_SIZE		SZ_2M
>  #else
> -#define CRASH_BUFFER_SIZE	SZ_16K
> -#define DEBUG_BUFFER_SIZE	SZ_64K
> -#define CAPTURE_BUFFER_SIZE	SZ_1M
> +#define XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE	SZ_64K
> +#define XE_GUC_LOG_CRASH_BUFFER_SIZE		SZ_16K
> +#define XE_GUC_LOG_CAPTURE_BUFFER_SIZE		SZ_1M
>  #endif
>  /*
>   * While we're using plain log level in i915, GuC controls are much more...
> @@ -51,8 +51,6 @@ xe_guc_log_get_level(struct xe_guc_log *log)
>  	return log->level;
>  }
>  
> -u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
> -u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type type);
>  u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type);
>  bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
>  				   enum guc_log_buffer_type type,

