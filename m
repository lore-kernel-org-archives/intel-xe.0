Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BD9C982FA
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 10:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEBC10E0D7;
	Wed, 23 Sep 2026 10:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IL30fUc9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DC410E0D7
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 10:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790160858; x=1821696858;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I5zjlXbt/il/yfMt9ei94UW+Q9M5STxAI/Lr/jGz39c=;
 b=IL30fUc9JjhtcOWoLBGQTnobhFWJU6fXCl6QNUA1pvkF0rmkMvUZ9REy
 EPRfx76iDMyXiEoOqoSOgCax9aI/n8VtqOXsA1oMQwSxRVZVIJIX5eJDX
 61LQK+pMCcA/dWUgZLRN9QX5Y+u3zDqHDTpJYn9hOq7hs6VIxUOEyyZcc
 C0JC1kgJOeMFjOv739Lxf5tdM5eIbcWeUJKky2d17eAM7k3NiA29rVdin
 TL9cWrwlqA8LEok91joE/fTQ+5Y7ESsRTmCQPkLv8qniBvnxBLtN+QuW8
 jfugey7wo9U2+JZsfMS69iyb30zyuJKD5aumrhnMg9NjEa5a7gA5UrPIu g==;
X-CSE-ConnectionGUID: a87JT6xRRge5xPOQQ9jyUw==
X-CSE-MsgGUID: fa7hQSM/RGKt8+S0DwMyBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="78396791"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="78396791"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 03:54:17 -0700
X-CSE-ConnectionGUID: tcYKefmpTpeaUzL1sjry0Q==
X-CSE-MsgGUID: F4pnGHggTIyQMWNwWpfGZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="273729584"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 03:54:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 03:54:17 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 03:54:17 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 03:54:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HStgxbuLx/W7eDKtBqw9bf9UVqsbdXWJ/Ah1Pj3Cxk2fZuYwriGX+HSfwPtK3aaXyD6GTw2A6siwM4Djg4/EMtCjZ6MDZu9tooldGPybMG8ds7ahTrAYOFBB9gl4ETEYoiuGskFPmhc1gw6xiyM5qb9kguZgatN44AGOrFZG3vtXJgLuzPL5eDBbWF4LSfPPuJPLGOT2U8SQr6gB8L8Mq4FeMBcSKFQFqj4ROc72LYHKn2IQiqiI2k7mPFHsu8dcBynO0vy334jH8EF7RTz17xwebCU7vLZ+K0WFx1Gk59GCgaj/QgDGZ4tCCpl0uh0XvF11320uLzM0AVBYwLfphQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1uYI386l0AhZ4fFBJuR4RACD7GZi0O8k33cTrQ6l44=;
 b=ditYbdHdQ3SA+SsnzcTp6oXENKXv7LUhkDOEr6KgCdMLJH8MiVz3atv9lyNlrb7CYbPNSlNeLKIdI+O31Z1iNEZ+ZXxiFlWByHRHEuIXBH35PFXIQdVUtD8NAUZNe6fnDy46w7BitKxXimzfpa0Pfwvuduq8As3ovspwAD0SVSjqgUHColyiXNVelmPCqbTlAYVzIyxuXV2jzbLPnLE8F6MegAL9Q82/e7igY/+7cx/vOVvWDxF74QSFTUZIuRU7dn5nMZZXjchbDt1H451Qs+wfH90VoZ8cHywXp5Y3QoNBfy9j9PQ2WwhW0TGrT76eQgWtuwcH4FlYvFCDUHKKsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by MW3PR11MB4556.namprd11.prod.outlook.com (2603:10b6:303:5b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Wed, 23 Sep
 2026 10:54:15 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 10:54:14 +0000
Message-ID: <1c079a6d-856d-4740-b51e-fb778d838437@intel.com>
Date: Wed, 23 Sep 2026 16:24:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/10] drm/xe/sysctrl: simplify mailbox header handling
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260921133927.128281-12-mallesh.koujalagi@intel.com>
 <20260921133927.128281-18-mallesh.koujalagi@intel.com>
 <6911aced-7d9b-4ff1-adf2-a5d9b62f92af@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <6911aced-7d9b-4ff1-adf2-a5d9b62f92af@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PNYPR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23f::16) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|MW3PR11MB4556:EE_
X-MS-Office365-Filtering-Correlation-Id: 52ae4112-b757-4e23-df48-08df196101e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: pih+OP54KuolX41HmZD8xTeefw8J53ZWm06feiA3MUP1NprevMlZ830ZW2rAdMWG6TA4RX7oQMpMtrvo0YUl7jQd0mLD0p9B1BdyNrBbQk33fs9RnoQ0/b3u2iYLoCg2QYux6mm2CxQGoTQI3UVA2/QrAikyj5Su+eaOFhz8XfJjo3rTOMDTwc8B/i4ZIAwjuRxSv5O5xEyg39jBaXLtlAWTU3oxPc5DDCGNXJsTAzw0NJ2v1vVSx5robukYC2lTrU/zzg6memDnAHH0GtA0ZjxWYRbHELnL0xzP9OGFmxc4jjv5NJ0yoLDG6Wh+b3iY5/bwgbHgV78u48hZd+qPX980G+RxW8HPLlT7vhygfQA/NK24HoVlW58iJLr02hbYMrRVmv7egchRD9Q6hOck/VSsrVOyVEoBEw6YyKrgKskbKZtoTtkjpyYKvUKZEwplHesX27akzxwi8/25A4rS2QzZ23CMz2PfzZgYlF9afnB2VmI010bZdVMi5B+jjY2Fj4CZRVgkaRvqtqV58DuWqc2LULRcrVtmZht9xPVDRYfaalvAaQ+CYG7ahKvgS9EIEgZ/c4bbkJVvKSwnJ9PrCVTa8VOL8sNroK3N0ngwssk1i2y/ZZJEfyh6kk09qNuOTFfZuD+tRhl2PK+lIkdrap1yiTexK7OcZQYVYDzdOY4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWRDRTAxaS9XQTVqREMwb1JNTFZDQmdGZWc3bkJ6a1hCbDY0M1R4VDdFdU9y?=
 =?utf-8?B?QzEwc0liWnpYSUszTnRiMTdEdlZMVzJhVnNwMWlkbVNTS0x5MkY0cThpL3p0?=
 =?utf-8?B?RHhjK1M5Rk43UGpuSk51Tm5PWW5nV0g3c09ndk8vWVMyNTc0YUNqdTZUZlo3?=
 =?utf-8?B?QS8yelJNZVdGR2F4Rm1LMUlFbzNrdmxsVVNRNzdJdzVKcmFOaEl0eklyMCtH?=
 =?utf-8?B?VmFaMWNKeWJlZ1dhTGlCWjRNSW5wb3VVME5na3BUV25xNC9xQnVuZjkwclJI?=
 =?utf-8?B?b2pFVHZDWFZocVRhRTZDMmVTWVRSK3dNbTF5M1dKRS81bmc2M3h5WUVSS2Vi?=
 =?utf-8?B?NzlOcFFFZ1lyY1NvZXJGeUZCYklVcGtFOENzZVc4Rnk0UW5LOTk4WHU1ZC9U?=
 =?utf-8?B?K0EyUUlwTjkyZTdkQzFTWVA3eDFRbmtaRTQ4c1ljd0VCSTMvYnBhdnd5R2dz?=
 =?utf-8?B?T0ZjQ3ZSRnlDUFJ0L3FENU9EWjJlY0ZHTXBHVmdpZFN3SWoydUNseU5nTTFU?=
 =?utf-8?B?WnNvM1ZhQm9mQks0UW1DZERMYnN5R2NUaDB2NzJXT3FsTUlYcS9ERFV6Yndq?=
 =?utf-8?B?T0orNW9HVEJHUFRVVllQVUgwWHNOTzdwblAvQllnSnREM3BVQVdyMW5UOFgz?=
 =?utf-8?B?OGg3WDJVY3d4SGJvblJrM0FTNG1XMHM3NEhVSVhZZ2JDSlB6bjhjZ3NnZjM0?=
 =?utf-8?B?dmJLUHJlNFFOdk5lQU9DT3BkSEZkT3didkJKOElWV1ZXYzNOQm41WnFicHBG?=
 =?utf-8?B?dk5vZFQvZ0VtV3hRanZsQzQxSHlJa0xMZDJDbzlXUGViTUUzWjBsL09NZFBK?=
 =?utf-8?B?UFZ5cXdzaEVER0tlcnRzeVRTNm1HVUlRa004bXd3SjZzL2R5MEgvNFVnYXNX?=
 =?utf-8?B?RXFjZ3hxYyt1NlVHT0x5YUgwVllpMHFobzdHdGg3SU9BaWNuMzVnUndZZ21H?=
 =?utf-8?B?NXIxMnYzdmNRQjdCclE4T25UNlk5QjZVY1hpblFnbkpSQmRGdTJHVk5oMGF5?=
 =?utf-8?B?bTVCN29QM0pya01QdDk5WEdSVXkvUExINndQdHYvejROTmhMdzhUUzNxSFVV?=
 =?utf-8?B?YnQxZG9BaVZJRHJ4VTl2OUVuUUE5Uzd1MFMzK2hYK3FjZEtLeGhnMmlRMXJJ?=
 =?utf-8?B?NGV2bHQ3dUw2bEFVYmdXU2RUbzJsNDg2NHJkV3J6TFRsZjhlQ2tkTFpBK0FH?=
 =?utf-8?B?VEpkUitMYWRUOStsZVFhRWVxOHFYd09lZDdzd2tJYTFmaTRNUWxUWmpMTFVC?=
 =?utf-8?B?M0IwSk0vejlPL09TWmxrOHpEdUIzVUFGOUl2S1FUaVYrVlo5enphWXpCdHhk?=
 =?utf-8?B?OGkrL3FnaHVvRVhBcGJicEFqZEc0djB1N2NwTDdSVVpsKzVoNU4xSm1EY3Fx?=
 =?utf-8?B?NzdBVWxMbmU3cWIvUms1QUJabEgya1QyZEI3NWJNbU0yWkpKbDJTaDlsL0xS?=
 =?utf-8?B?MGJ2cm1kT2RsQnp3V2lnT09DTUEyM1NyeTRXYVlhZ3RRK3lFM2dmL0R3OFZq?=
 =?utf-8?B?SHprbHpEa1BxN2tIVHg2RVZjZ2c1c3Z4ZFZaSVJWaC85Mi9lRFZOd2MzWjZz?=
 =?utf-8?B?dkU2QlNlMFZKTjljZ0ZkR1JWaUxFQW4wT2dKK0Y3M1VBN1VWdXRWRDhuRFd0?=
 =?utf-8?B?VXIwaE1WTG9nNVYwQmJDN2NvckNPR2x2L29aZDIya280Uzc5K2Y4TlJJSTFN?=
 =?utf-8?B?Zm1sY1FueVpPSkRyTG9oNC9mVFlRMmYwYi9ndzROWmdsSXJ4SmpqbFpmRkZH?=
 =?utf-8?B?YWZSSFFMNWJEUUliYkp0bmNwNXM5U01xT044RHFXalA5NDhlSDNuRjEzaXR5?=
 =?utf-8?B?TlZKbmNPeGE2bzlDKy90ZjdLVmNlQTJLcmE2NmRDbHpoVWYyZHdybEdBbWh6?=
 =?utf-8?B?RnNReVdNRzBaWnBGdlJqcmNnVUlvQS9XRmk1d092VGp3aU8xbFFWNUxYSmpG?=
 =?utf-8?B?ZlpWRGh6ZEg4RGFUTWRKNWxLdThnT24za2ZybzZublg3YytGNm9adVlsaU1w?=
 =?utf-8?B?SGk3Z0I0Q0RZVFVsMDgvM3NSM0I5WlVUdmxxODZ5bjU3bE9qNmR4aDVzU2k2?=
 =?utf-8?B?U3ZzTXBHUWovem5rTFRnZDgrZlpZYnQ3bnNTVHpFV1A2TDhsWksyLzNmSkVr?=
 =?utf-8?B?WmJ1eFowRy9pMnpTWHNHRTJaWmtteDJUekNENFh5MFlzRThmMElvOEc2Y2VQ?=
 =?utf-8?B?NFBwb3hyMkZwbEtTVnRYVUJmV0hpS3o3THdldEZLVktmaVA1ejg4WHBza2o3?=
 =?utf-8?B?T1FMalcwaXI3endkRlI2R1UvZ0FYa0tUSUZYSzZNbnE3b215SllmYWd4SlV5?=
 =?utf-8?B?Snh3MkV4UDZHNHdzT1l2azYrQ1htdnk0WWhVTHdKSlRuVzZyNFhvcmVyNTl6?=
 =?utf-8?Q?Fl1VcnGI6FqKskeU=3D?=
X-Exchange-RoutingPolicyChecked: Dc/axZVITP8M0E+/aVZ5yXClugObhdd9e5o5bzKJrdHXVOnL0rOiSnKgw228Zj2iTPIRp6IiXNJT4xB4/u4tDmNBi3D60fw00yJHc7pax+Fb3/fPxDc39+5uRqBSipjmiEPoOV7cMSVqaTgid1xuWik3q3f+CHcqSr+3BDP/NoYGS/3AHXIB8MDq4sqXRz9lPyz3IqhTIftnxGCMyLzKZ/7nmF5XurAXvADW4SkZ1/AonJ8uRCarfBuwnaeZBIxWyosCfU1HTc/QrT8XVnHn4qVVQrx0bNqfhz85tFo2ZzLNkUFWlizquN8T+wPStZ00Cj7SlKvfTf7PpF0hVtkVjA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ae4112-b757-4e23-df48-08df196101e4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 10:54:14.8192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Me2OVhy9xki2e2x0XIn4OoR+NTgMuVNDZm8UfcuY+eG5a0Pu//bMvAfrM5SeWQhSAlVcO6fjltpvsfz9OTqDWQREL24/k9V0VItqMOh+bkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4556
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


On 22-09-2026 04:47 pm, Michal Wajdeczko wrote:
>
> On 9/21/2026 3:39 PM, Mallesh Koujalagi wrote:
>> Use u32 for the mailbox header data field and remove unnecessary
>> cpu_to_le32()/le32_to_cpu() conversions when encoding and decoding
>> header bitfields.
> you still need to add the "why" parts:
> why it is safe to remove those conversions now, or
> why it was wrong/redundant in the past

Sure! will update next revision with below details:

"  The mailbox header was defined as __le32, which required
     cpu_to_le32() and le32_to_cpu() conversions whenever it was
     write or read.

     These conversions are unnecessary because the header is always
     handled as a 32-bit value, not as raw bytes. It is written with
     xe_mmio_write32() and read with xe_mmio_read32(), which already
     handle any required byte-order conversion through the underlying
     writel()/readl() accessors.

     As a result, the header value is already in CPU byte order when
     used by the driver. Keeping the extra conversions had no effect
     on little-endian systems and could cause an incorrect on
     big-endian systems.

     So use u32 for the mailbox header and remove the unnecessary
     endianness conversions."


Thanks,

-/Mallesh

>> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Tested-by: Anoop Vijay <anoop.c.vijay@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> index 50bbdab072de..750178a0974b 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> @@ -20,20 +20,20 @@
>>   #include "xe_sysctrl_mailbox_types.h"
>>   
>>   struct xe_sysctrl_mailbox_msg_hdr {
>> -	__le32 data;
>> +	u32 data;
>>   } __packed;
>>   
>>   #define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
>> -	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>> +	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, (hdr)->data)
>>   
>>   #define XE_SYSCTRL_HDR_COMMAND(hdr) \
>> -	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>> +	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, (hdr)->data)
>>   
>>   #define XE_SYSCTRL_HDR_IS_RESPONSE(hdr) \
>> -	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>> +	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, (hdr)->data)
>>   
>>   #define XE_SYSCTRL_HDR_RESULT(hdr) \
>> -	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>> +	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, (hdr)->data)
>>   
>>   static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>>   				  unsigned int timeout_ms)
>> @@ -112,8 +112,8 @@ static int sysctrl_prepare_command(struct xe_device *xe,
>>   		return -ENOMEM;
>>   
>>   	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
>> -	hdr->data = cpu_to_le32(FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
>> -				     FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));
>> +	hdr->data = FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
>> +		    FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command);
>>   
>>   	if (data_in && data_in_len)
>>   		memcpy(buffer + sizeof(*hdr), data_in, data_in_len);
