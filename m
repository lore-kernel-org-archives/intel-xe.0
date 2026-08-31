Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D93C624C6
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 17:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479CC10E0E6;
	Mon, 31 Aug 2026 17:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCMPXKfb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD1F10E0E6
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 17:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788196586; x=1819732586;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jKSps/gqjvkTj4bBI+2w5LVFXaUH+3iL5GWinmeFm1c=;
 b=mCMPXKfb3ECUKvjvD8cHNsZnSra8rXSYO+qp4+ehxEaYZHIYfPaVYLny
 22K8RaMdJesZQiMmbMmdjDp+6R7rBXRS3XsJZd6dtUAHmn6qwbQY3gGzw
 n+1h2bFF2mBLPSI4RWJF+36a6xMkbMBKtwecTDSPxmgxkAv2/iC20A+F+
 cJkuyP/v5JMGJw4UxAM3FR9STT7fHOxlGojeQrl4uADhzkazm4bE3dPiB
 6ruZYdw5lDy32jlj162jHk1Yzsn68uM41gwzBfTsI2OhkjoyW8UKY9/dq
 y0CQkF5NSwmSoItuvox0u6MIIFVCxv4R2AkS+REinKkJQAg1Hetu4SNlD w==;
X-CSE-ConnectionGUID: obszRrLDTB2UOUEQQP91fQ==
X-CSE-MsgGUID: GvrPZ1AbQi6E4/DYG4ROQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="98947964"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="98947964"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 10:16:25 -0700
X-CSE-ConnectionGUID: 18eoLJTwQ+K0JnsW2Bht4w==
X-CSE-MsgGUID: SESLAyI9QMqX7QnFV2AlaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="265615055"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 10:16:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 10:16:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 10:16:24 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 10:16:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cA7Ecxv3BrggKzcw/Yk4nZzSaWrHYuGiyPMeB/KBz/6TWF9YNFfAjhKm9h8OFLWQghefVznHJ8LFbxBXlpPLbrjdA1NCf7ceshC+wV7uzC7kkEzO4VvR+5g+6qX4ndpjNgFSVdDleqvIyBcVfBHbMTi4UYvUcNr6yo8M2HnrSeHPpLyiNW3OkJau0G1/0PkLl9iajoCsXnNjFVpB5QEeArb+Hyml1hGWsAtMQQVUY1qaZZILsAyqGX7EG0fUXJ3tsgiQhcKavYWbxA3ccUbIRr4HIaC1eNi52ShCTVXBTXigrDZdJWx1SQDhiqa3hQCoDsszmCuVwp59Fr0+PBcIHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aqF3J7GEMlddRcTLEB74jpnRyaBDRNDisRhhPzNO4I=;
 b=jqGny5WXypDIrUBstjcLrEYhKZzNoNbi1x1dKuxrSKuXk3HVUK74KlmfghvZyrYTP1b2wjqG3h3rfq21Rg6yBcMUUdQKClvWW/EB69uMfOlB305Bi2O6UJiU37rhsdkwm3qEXAi+k1Rmu+Xb1qtFobaW43Jy/GPtbEMz7Um1Fw+S7Ls4wcDis5WVH0MMA3ua1A9g1rUXFfkiUZVGuEzVW52eCSFMkOzx7rIXUV+AnIfuj4r89bu7UPtgE4PvCMzMNJy6edq/4PoeHcJPjD2ZhAL42mv6QxZm//QRK5XrVLhGBmjoB2+KIiI+Ko7huGjjR8O4QC7N2li2RLqrPA7VHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by PH3PPFEC5C0F28D.namprd11.prod.outlook.com (2603:10b6:518:1::d5c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:16:22 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:16:22 +0000
Message-ID: <0d5ec949-e97c-49b6-922b-f4a2a07f1cf2@intel.com>
Date: Mon, 31 Aug 2026 19:16:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vf: Retry GuC state reset until timeout
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <satyanarayana.k.v.p@intel.com>
References: <20260831092118.488317-1-lukasz.laguna@intel.com>
 <602fcc3e-78bc-45e7-93ad-fa3f3ee43a1d@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <602fcc3e-78bc-45e7-93ad-fa3f3ee43a1d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P190CA0025.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::30) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|PH3PPFEC5C0F28D:EE_
X-MS-Office365-Filtering-Correlation-Id: 91fe61d0-368b-41ff-a50b-08df07839427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qAMzPVWbatd/NP0XHLyqDtWh5QhLDyGWexv3H3i6OP9gM6hTiBzyYuOzeyFipE9OA33jeP432gWLQiAtcw3Dj8J4ZwOg0OC6HbgPIFLznINhnpwYSatn3oqu1ogX732a7LZ8WeGiOON+Gdt/TiL23XCG3cJLWjNo5jX/zbcHXKGVbr4Szw+UXxVc9+TZaoIovjLflBLDouTsxH/ygzHCB+q+pnuiXvFPr+NIWJYmwZuAXo8PvZEMAM4lIbZFpxeFV3TKYPqTSVgbTfPM+igKh9mGcMAHcRIpMOveQyHKf/jpU8CJJ8pw3nRv/yI4txrRR4IKb5dZUqg78bGX/rmgc1mrSDjdmeYAJ4FetwzYrrqfVZm5kVli7xMZDFlhcbawY31nIz9HZh8uiaRbl4JGix3C2ryHpL/W79esghHBPtEPHzkIaOP9zRcFnvjg5/PRDXI24fKCPs44sJ20Q894mV/3XqHBhijfMsR9CmYbjGlPPAEv2zSQ2ly4u/1JOU6yAzBh80CMZwuNL6k7l1vtDpHqCJ9PM9ncvezH1w6FkWjLADKDeNhQrxpCOAnXCbHXshhyZgudrQ56GoDBxgvWalGJDveOyaObALS1nYro3yIM7b6gcCgPdkrIlLvsQnchs3KyYVcTV3tfcqQLQ9MhdaLh46eGFt3jDiOVcgjeiEM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGhMMUxNclNXZlFRdFNHWjdXM0l5SkVaVEt5RnI4Tng3SmF1YUtXZWxQaytp?=
 =?utf-8?B?ZVNkL1UrRjJZMCsyZHFDQWlxN3B6NFAvRXFMNERCWUp2UWU3WlhWOU9rcjZ5?=
 =?utf-8?B?a0FCTkpjNGw3K3FpeWkrTGV3WGlHZ0ZUV2VQNS9IQTlhdnlVYVFFakNZeHB2?=
 =?utf-8?B?Ym1xVVJ5ZnN2VXFsSmQ0aHdoLzJkM2JMVU0xTEhRVnJHbkpzeVIySlRRUkFa?=
 =?utf-8?B?NmZ3bDBHNmpvMXcvYlYwZzRGd1I5SlRrSXZxYVZXamVTN0xFcTN3WXp4NTU5?=
 =?utf-8?B?OXJ6R2x2bGNDdVZjSkpaalkvMk12WGVCL0JiZzNsN3Focm04eFJsbzBvenBH?=
 =?utf-8?B?bjByNFVWVzRFSGVBTERjeVYvSDRrQUZFQU9TcW9LNmowVTg3Q0dJaHZ5M1l3?=
 =?utf-8?B?a2tGbWxhWXVIc1c4WndaMWVkNy9TUWhnOW4yZTZvdVBXK3QwR01hclpXUkc2?=
 =?utf-8?B?eFdvVFNVeDd5cUw0L2lKZENVOVJzN0FhZFl0TzV1UkRvZVZPcE9NalNqS2Z0?=
 =?utf-8?B?K1dTdXQycms3Z0l6NmN6aVhubk13SDJwT2FUaXFGWGRpRlZYNnp0VUxiR001?=
 =?utf-8?B?aTgzYXpxRFkzZnR0K2c5QkprM0xXTnVpcmQ0M0s0Z3ZLUnd1ZzZMUE5YMHVS?=
 =?utf-8?B?ejZrQnlUbzlaOHlFanBpM0JjQitGU095QU5Id3dLRXFydTZwMVFoVGZDZUt2?=
 =?utf-8?B?OElvNEE2SnE3VGc0VW81MDBOamZrM0FXVUNDQ3N5eGordzBjUTRpMmRKY1Ix?=
 =?utf-8?B?cmJuVEdDR0pnTUxnTHcxME5vYWoydHVkc3lyN2RSVVhLL2lkTmJJc2lHS1lL?=
 =?utf-8?B?WmUzaVVWTWtmTHlTbnhwVythemlWQi8yc2c1Nk14eDA1Y0VET1p6M2pNZHFk?=
 =?utf-8?B?dTFWalV5M2FldDFnL050NVlxazRGeEZEM3NPN3JGSWNrcmJpOWJUQWlyRU4x?=
 =?utf-8?B?VjlPTWVCbzN6STBNZWpBWUpLVWNTZTFXc042aHEyMHJlNTQxM2hhTmJseWYz?=
 =?utf-8?B?RGlZMTRvNC9mZHhvR1lRbnk4UEs0MzcxSkpIT0FWOTVsT3J5Mkh4Z2VUUFM4?=
 =?utf-8?B?Z2JsSFhnVHRRUjdlZFl0aldVTk45N1JIM3NtZDE0U2tkWU9vYjg2TnE5ZklY?=
 =?utf-8?B?YlJ1c0paeWhxQTBUYXB1MDkvNGM3NHZrRUQxcGhqUnh1Z0FXMmxSWHhyWEZr?=
 =?utf-8?B?OEJQaDFVa2l3eFFkZ2RudEUwV1NNRFV1V0hzamdaOXl0QllxTEpPNzZ4eXhj?=
 =?utf-8?B?MjJ4cmJNSE94b1had3FtQlJkb2twNkIrSzR5RHZFaXJGb2xkamZFeW1hbmVj?=
 =?utf-8?B?YzFwT0JNQjhmTi9aVWNoMzB0NVl6Q0djVEhGQTVhTEcrYXN6cVp6MVhYQU5X?=
 =?utf-8?B?TlZncTBISG4zaUNjaTVwZURQbWNFTDNyQzZRODJKSjlnYjl4ZldpVHJ2SkhH?=
 =?utf-8?B?TmlTU01ZYTFPdmo3dXN3Sld0SXVBa0JYb1dEUzd6OG1TQk45eVVyZ1lPei9J?=
 =?utf-8?B?TG5LTW9pbW9OQVg4c1IzZDVjNkJFQkg2SGRFSG9rNTdheWlEckZjZWxvbFBH?=
 =?utf-8?B?OGdVUTQvdDdoR3A2dUI0VUFDQ2tEbVFGVWU1Znp2KzE0WDRmSnpJRlI1aWRp?=
 =?utf-8?B?bEZOcTZoalZwM0xmbE5aOUtRY3BKS3dhU3B5bjJDeTl3U0dQamZWVTZmWi9Q?=
 =?utf-8?B?eXZSRkpzb0hQQW9IVkRrLzUyZTZrWkZlendCRHM4RHpvdVRKcmpUTEpHSUdo?=
 =?utf-8?B?YlJRbUpoaWQzcnl3b3dzQUZ6VlhSK0VqcHRNSHNkcUR1R2w5RmZHNk53Zjk1?=
 =?utf-8?B?NW5LeEE1Vk5CVURqL2VQRS84Sll3QlYyUkJNdE5GajJiOTgzUFZNMHQrQTRo?=
 =?utf-8?B?b2I1WEVDVUQ1M3RiVkhUZGNSMVRqZ08ySS81eTI4N2FZSTMzTHpvajZLTDN5?=
 =?utf-8?B?UnZQQlRKQlB1SUhaV3Y3cU5BUzRRMklEaUJRRjNZVGg5U2UwUU1FUjJUbVVX?=
 =?utf-8?B?SU5JeSsvNXlZSFhiS0ZtSVJDN09IL291NlA2blNGWm9rY0luODhKck44Ym12?=
 =?utf-8?B?M2hFRjROS3FyaFlFMWxXcStIaHM5STAvRTN2VzJ2cEJHN0hFdUZ1Q0lGN0hI?=
 =?utf-8?B?QVM1MjdsYUVlUDBOTXdmemlyelVpeWFXTGQ0cnNPNTRRaGIwbGwxS245UGtS?=
 =?utf-8?B?eEowS2dYcjZ3WHhqdWo3MWxRSklSbDAweWZRdmxQYU9pSXpDWlRld2ZVUlhk?=
 =?utf-8?B?N2VXVnJ1OEwzOERTUFJxdEhheW1oZEsyZEhWZjU2L0hOMnNPNGdaQnFpVGxZ?=
 =?utf-8?B?Y1NYRFozSVdCUDhtR0UrWFI4ditpbEJPaEZCTGpqVGJHV05SQzh3dz09?=
X-Exchange-RoutingPolicyChecked: Q86KxqOVrPRl3QjbIAXuf59A9Ff+e/rf5e47lvb8nB3PcyEfHznUglGeojmSEhEZk1PlkhgME9LiICuH/K0K15jR1sGaZ3doxeSOIa0vqp8z9qPPRvgimQSUBMGdrgC5Yr8TTYTzQgeVIzUuEvQ4EdSigigEVXMmJHJbWooJBA/QT1BWjhHiC5AD+MNprgdW7YxE4TTlv9NRnIIu7Oww+k0qy6q0r1Dl8ik/MOAY/gmQ89wnB8Oc1nIx3IYnaeZ/+O/gAKwg0VI9h37bR8uP9bCN9zEAZAvwCnFVDCU2PLMP7GcvcE4q2OUjQ0nrM1FlIji+EwBUzX728JpGD1FrGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fe61d0-368b-41ff-a50b-08df07839427
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:16:21.9039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3YA0D6fbLxFLSKZAG8ddvQ6RlfgZiqVIiNxvF2v8wc7V2PDfFZOaZeAXSfNod/yh3PPme1LVNvhZ90erRzWbVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFEC5C0F28D
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


On 8/31/2026 12:06, Michal Wajdeczko wrote:
>
> On 8/31/2026 11:21 AM, Lukasz Laguna wrote:
>> Instead of using a fixed number of GuC state reset retries, keep
>> retrying until timeout with sleeps between attempts.
> why?
> why 10s?

In case of VF FLR or PF FLR with VFs enabled, GuC reprovisioning may 
complete much later, so a fixed 10 retry window may not be enough.
Instead of relying on a fixed retry count, I wanted to introduce a 
deterministic maximum wait window, with sleeps between attempts, to 
avoid spamming requests while GuC is not ready.

Why 10s?

On the PF side, VF FLR uses a 5s timeout. I used 10s on the VF side to 
keep a safety margin from the VF perspective. This is empirical and may 
need adjustment, but so far I didn't observe any issues with this value.

I decided to send this now as a standalone reliability improvement 
(sleep + timeout), but maybe it'll be better justified when sent 
together with the FLR series, where the dependency and timing context 
are more explicit.

Lukasz

>
> you should describe the problem first
>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index 37899fcf5b22..01873896f77b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -31,6 +31,7 @@
>>   #include "xe_lrc.h"
>>   #include "xe_memirq.h"
>>   #include "xe_mmio.h"
>> +#include "xe_sleep.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_vf.h"
>>   #include "xe_sriov_vf_ccs.h"
>> @@ -86,18 +87,23 @@ static int guc_action_vf_reset(struct xe_guc *guc)
>>   	return ret > 0 ? -EPROTO : ret;
>>   }
>>   
>> -#define GUC_RESET_VF_STATE_RETRY_MAX	10
>> +#define GUC_RESET_VF_STATE_TIMEOUT_MS	10000
> 	10 * MSEC_PER_SEC /* 10s */
>
>> +#define GUC_RESET_VF_STATE_SLEEP_MS	10
>> +
>>   static int vf_reset_guc_state(struct xe_gt *gt)
>>   {
>> -	unsigned int retry = GUC_RESET_VF_STATE_RETRY_MAX;
>>   	struct xe_guc *guc = &gt->uc.guc;
>> +	unsigned long jiffies_end;
>>   	int err;
>>   
>> +	jiffies_end = jiffies + msecs_to_jiffies(GUC_RESET_VF_STATE_TIMEOUT_MS);
>>   	do {
>>   		err = guc_action_vf_reset(guc);
>>   		if (!err || err != -ETIMEDOUT)
>>   			break;
>> -	} while (--retry);
>> +
>> +		xe_sleep_relaxed_ms(GUC_RESET_VF_STATE_SLEEP_MS);
>> +	} while (time_before(jiffies, jiffies_end));
> btw, maybe we can use poll_timeout_us() here?
>
>>   
>>   	if (unlikely(err))
>>   		xe_gt_sriov_err(gt, "Failed to reset GuC state (%pe)\n", ERR_PTR(err));
