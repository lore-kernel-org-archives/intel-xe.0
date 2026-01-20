Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA29D262AD
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 22:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C433A10E65D;
	Tue, 20 Jan 2026 22:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xmuacs1n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F78C10E65D
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 22:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768949818; x=1800485818;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VfshJ+U6vXVev9U7/GElk4kHD+xN1aGWVSjSH9B8x2E=;
 b=Xmuacs1n09CX/T5vF2ZZtX+2vyLMzRmXJM8reiDIKuKuOuUVOn4rPbq8
 Sn2M8TVTcUbqKW/JPkR16H9KIRd4AzMg8X7RBuzUVjekxrl3dMwFoVOLe
 34oL/20VIDkRO+Lwkp5zfxxfihhFMZmrSJr/jF+6m3bs5BhqzsltigzOI
 I+mGBZRNyrMOddoYt0WmDO1wjvbxIVe5lev29n9olMP8U0Zh1ecO/TcW5
 g3ephp8RY3n6UVrm2O4fuDtbVaagJKIpuOu0rfBmczvX12DjGmYeZzVYf
 5V+pKLNGqZFmpq32o8mIyMZa/jpGwOQJVh86kyptRgh0xSYkb4gr3JiK8 A==;
X-CSE-ConnectionGUID: a8hhFdEBRhuzVmDGcxaVAw==
X-CSE-MsgGUID: Ca2jdXcmR1u++Jz+W7HdNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70224881"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="70224881"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 14:56:58 -0800
X-CSE-ConnectionGUID: RVjkT4TkQy2/c5TmA1bP/w==
X-CSE-MsgGUID: 0PbYomHhRo2pqci98Alh/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="229212194"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 14:56:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 14:56:57 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 14:56:57 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 14:56:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aohgcAO9ofSeF6viupYgZ1hKFZzzjf8LyyxLI5rkoAiuU2HppekijQobS/uz4WoBPvxX+gXta5mjvHSjBHKsK9rzFC+FSG6wbtGmnnCocqt3PAE5aOUvNXysrfl3cqgkfCeZBEZk/tInssjhTnHvOBN25CYcWU48loX8C9e204MZM6Mjf9AGYsX/uMVONxHCsJfqUQMNiqDvfdz6KO86qATg5S/lLSurzqwebm2GxiwiVUJ+v7XvZ73tsRY9hOB2Up9S4Hk3To2J2wFQgZmR95N/sT7aLIBKQ89jRc3O44GQ7OikAD0f6kcf61zy1SA4vpQcs+Ik4jy8h9MPapuCvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5Pl6FFNg9bULCUla0aTROHX44wYQPBjXW6zgythk5o=;
 b=tcRxzT1BwtBeCB8rT8DkSrAqqxqI1k2f1z3sPTwaJDn7L+uc8d4Daevg8wTyaUdbkC/xGaTubxhuYN1l3rlkTpr6U036xGM66kttaDCMquuVO5mQv7Waqh4jF2tHXrxBC1Ck/cnTIBBm4v+GFfKFim9U2oUZfcXnGwK1lHNoa8nGrMkRLvDozfGKbMKgn3QctN+GIl/6gPlJR6gSSs+cJAKIx0bi+ABn/1Cf1s6qFTJ1oVMg5cSDtIQa22XFEjOGNPhDuwpg5mfDD6wRWVJCIrQ+wjXivrGrqhisyVQUHNha433CaPN4pmNthWpxy2rcHRAaTXVotIj4tgos3u77lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SA3PR11MB7626.namprd11.prod.outlook.com (2603:10b6:806:307::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 22:56:37 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 22:56:36 +0000
Message-ID: <084a3947-f08f-49f8-a94e-6569dc513360@intel.com>
Date: Tue, 20 Jan 2026 17:56:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm/xe/guc: Fix page fault by moving
 guc_submit_fini to devm
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260120201621.2442803-1-zhanjun.dong@intel.com>
 <20260120201621.2442803-7-zhanjun.dong@intel.com>
 <aW/nk/slTdY/JHwD@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <aW/nk/slTdY/JHwD@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:303:b9::20) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SA3PR11MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f2b0a18-2c45-4228-bc04-08de58772a2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDZtaUdzK2U3aCtLbVA2NERjWTlhVmNCekZPNTVaZnZSK2dmRlc5ZlB3VGQ2?=
 =?utf-8?B?bDJJNzNSRnhLTGg1M1A4cXFZbjhvTXN2eS9talpyWU15bTd2OUVhbktDRkJO?=
 =?utf-8?B?S0srR3ArR1c3dXdZeS8zelJ5bVErWGRtSU00NklzOElRRGJnWGQ0WEhtNGMw?=
 =?utf-8?B?UENHV0hwbjgvMWhTeVNJN3NRNnpTRCtYT2pJcnhDY29mU0d0UGkrZ01XVzYr?=
 =?utf-8?B?bklBVlZIaXlpTC9GOVFsTmVmajhaaVIySVV4R3VOY3ZieHJvbHRuNXFKRHpz?=
 =?utf-8?B?L1RHYVlwcWlWMDhKQjYvZzI2U1VCdFVabjN5cTZWR0Q0WklzaFByYnc4YkpG?=
 =?utf-8?B?VkxhZmZkby9ITko3bU5pSU1oN1FQRDlqcXpNa0prbndVdnF3alFsMXM2alZ3?=
 =?utf-8?B?K1gzcHFhcloxOW84cFhRQXd3WDlpcVNVN3VrZGpLazBWWmN5SUpSZzJyamFZ?=
 =?utf-8?B?aDJjMlBsOFpoL3RSa0E3d2QvZmQ4cW5KTmVpYXM4YjNGSnlNOVBlU29TY1hL?=
 =?utf-8?B?Y1RHRERJbHd0alk5bGJUY1JqZVRacEVET2I5RHJ5ZWtZUzNPK1lObHZBeXpB?=
 =?utf-8?B?WkRuVUpBUmN5cHNUNUR0R2JuNWk5b2NXNUZ5dkpZNDVLWWxncXUvanoxS2Q1?=
 =?utf-8?B?bHczZmRCb3ZCSStGdUEvbDFXR01yWnd2aFUrZ0Z2enlBMVBhN0RTVHdSbVNN?=
 =?utf-8?B?d0NWMm8xTFExcmV6OHhEdkp2SUlBSjFZS2p2QlNWU0NwSmpzN0grMWxOdGp5?=
 =?utf-8?B?WGJnczB5dDRMUlk3RXAxOWxETDZleXk0ckJlamJqMFl4bDdmOXBZWVVWaVh4?=
 =?utf-8?B?MzJzMEVhTmQrNmVHZlQ5bEM1UmdRaEllTS9LeFJSYlp2MjlaV3BTRHp1L0tQ?=
 =?utf-8?B?SlhOVEI2VHJGelk5aUdQVy9GakFTWVZVYkM3M0xPVllJTVh1Vm5xelpkN1Js?=
 =?utf-8?B?T1RNRnZ3b0tDV0lxS2FzVmE4TEZnVXRFZndESy9idGNucUdLbUtncXFxMFpV?=
 =?utf-8?B?d0N5cFg5dmtiRlhPVWlUdGtOUnViQldqT3pNNXdvUzlpRjREWGhwZDdLRTBJ?=
 =?utf-8?B?NXdWdmJZZzBwQkR4TG1GcXVLUVc2Qk95R01rMFNwQys2RkptQWthR3d1R3I0?=
 =?utf-8?B?aGIvT0pMY0ZjalVtUW01cjlaMlkwOUtULzZVcEZCdXYrZzQ1Y0FpTi9GQ2VC?=
 =?utf-8?B?enJQbmh5SENXNHVsRGJuNFJ3WVZ4Y1dyVHdRZlRzLzA3L0RZREdLTVJMYWY5?=
 =?utf-8?B?WFNuRi94Q21aT294UUVMb3ZiVjdnbDlZd2RwejlDRzd0Wk1pVUtsYzFiM3Bl?=
 =?utf-8?B?RDlpQVVyWjQ3MmxTM2lOdFlTL2Q3WkZxMG1UNEI5alhodnIvQnZrUWg5VlpR?=
 =?utf-8?B?NjNPbFllY0twTWYyUFZiZjJYWVdBWUpsZG96alhIQWkzellUTXhyTHpTNGtI?=
 =?utf-8?B?QThkOUxmenk3UUlxZkpYK1hZNVgyTmRQcVdLNC9FT2hCK0NqMHk1YmNsZW5C?=
 =?utf-8?B?N3M0UkJuZkpqd3JNMWVrQkw5bENaUzdkUkRKME4yYUM0VEhaTVllNUZVaVV6?=
 =?utf-8?B?eGJDM1JJN2pCdi8yNHRTQUF1bXhESlJSTTV5VXpXNGVYWXRwSWNRMGIzZEtl?=
 =?utf-8?B?Zkt5dzBJZHJIOTczK0I3Qmk5WEs0eVBHaklTTHpMOWMrNDgrY2dOR2dzcTJL?=
 =?utf-8?B?RFdneno4bkZXb3BhVHlyTnZ1QmZGU2dsU3dOTktQL1ZXNVJmQVlybjN1VnN6?=
 =?utf-8?B?YVd3bkxpNGN3ZWhIRkE2Y3VISDF4aGxHSW0wZ3BqVXBIN2Jad3ZjR1llR0kw?=
 =?utf-8?B?ZjZRNWxMb3cvYjhQNnFJdUVtZlVEQ3VaMGkyd2N1WVlSU1VoUVFUSHRjK0hX?=
 =?utf-8?B?d3ZmaFJxcVpNc3hUSkhvTkZQYlQ0a1Z1RUt1MzZkTGMvaUFBekJlNCtWNzdB?=
 =?utf-8?B?em11LzNvRWRPWHQ2TTNzV1RNdWlVMGUzZUsrRVB2TXN2ZUhmYnF2cWcvN3py?=
 =?utf-8?B?U1J6OGplVjdtM3UwTk1LSmtYdXF3ZDB1Ni9xUEdPdmdqUm9TQ1NRNlgwZ1JQ?=
 =?utf-8?B?NUJIVjZleXBrUC8xbTdFYjUxUFdBbVpaSzk2bW10bC9qWlVFNnliWlRPYVpM?=
 =?utf-8?Q?VSjw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnlobEV1b1BsYk9GY0ZIWWZMMVh4SkhXN2NYSlhEMHpQK1ozS09hVit0MU9C?=
 =?utf-8?B?b2pjZHl4RmVKR3JOZGRSK3lLU09oYmFQaFQ5MzdweUg3V25vb3h3bXhiKzEv?=
 =?utf-8?B?OE8rT0Yrc0tPR0NjQ3ZCTk8xVm1JVDY0eG1xSHVKdXRROHFmbHIxNytPbFN0?=
 =?utf-8?B?MzhpWEFCelhJSlltNVdyL1NjeGYvdUJKYW90MjRweEFLQ1dyZjZLRlB2REtj?=
 =?utf-8?B?dkFrZUdtQ0JFa3Iwc2UxRkFkaElnUkJadDhHaXk4U0RiQlpFTnY5SnVlUkVy?=
 =?utf-8?B?R1NiMVlTMjVEMFBwdHVyOHBCaWcwUm9MOFNWOGVmU3JxYlVFTWFEWDA0bTE0?=
 =?utf-8?B?UW5YaUFqTFh3TitQSWJEeFJRc1BPTWRmcVo3WFMwOHZTVEdLWDN6RVd4YW9M?=
 =?utf-8?B?QWFVdjJnVGY1NDN6VnA3L3dzTVVZWjQ5TDlTeERyZy9YUDVXbzdjUEtFL2lm?=
 =?utf-8?B?VGs3TFU2RzdxdjZNNmpqbFVWMm4rUFZSWDVGNGFEb3lNQ09ncE9TRkc1bjdw?=
 =?utf-8?B?TWdJZGkxUlliZmhCQ3VBVmVPQUFxR09HRFJiNFJsN2JSUEhCRnlydis3VktL?=
 =?utf-8?B?WUE2SzFSRFplclNSMFdIOXFVNFUvcE4vaS9YUzlCUlFNditsOHNGK2dQMGVG?=
 =?utf-8?B?d2NMaDRHYjFZL21LL1MrWnQwNFVPRHB0TzR4dXptZ1YyNnp5ZEVCUWk4Vml4?=
 =?utf-8?B?UW9VWUZiN1FGNmQ2cm85czlOTjBjVmg0c2pJSUlYUFhvTVFsZEtHZ0oxMTAr?=
 =?utf-8?B?bWx3cFBDVlJlcVBLR3FHUktZQXhjNGd3RTkrazJhZXdBN2VzOXovUEJoUllQ?=
 =?utf-8?B?V2ZWZklvSFpVcTFBNkFMMEFBUFk0MCtxV1NnT2lzKy9wbUo2N0xjYXJkRCtF?=
 =?utf-8?B?ZDdsYTJKdFhOREZkNkxKeVh3Qk1uNXBOSFlYa0JjQ3BsL1RqbXM3Rks0MFdK?=
 =?utf-8?B?dWdrbkdKSURMaU1uZUZBSVd3SUNGZTdidWRWVVNyWVQySE40V043SHVVenNx?=
 =?utf-8?B?SUxzTDdWZEUxbmZQSTZTaDVKbDVqVFU4VHoxM0FDbThmOXFIcktoeEZ0d0hW?=
 =?utf-8?B?VFhueWoweXA1YmNjM0lvTkVoSzFBUW14K2FEQXBPc2xPdkdQWXE4YmViTWY1?=
 =?utf-8?B?cy9WMXJBclkydkMzejdGWEZZUFJuMEZpek8zdWkxOFFCTklVUlpZMytmZTls?=
 =?utf-8?B?YmZPaFZLRC93MEtNRTlhczVDdkMvbTRCTnBCMkk4ZEoyVWg2WFI1bzZGVWMv?=
 =?utf-8?B?UENCRTFrVUJmZGdUdC9iNWY1R0pHU0xvRmg1bTNaMXppUHRjK0NmaTNhNXMw?=
 =?utf-8?B?ZFIvODV6Wk9FTDdSbXVDb0d5NVJ4SFlab0ZOeFUwWG9iblcwVExlUkRiS1pS?=
 =?utf-8?B?OFZzT01Rd2VyOXVHaU1YdThmTDd5ZFBKMUVwc2Z3ZUtiRGZuWDlQcW9LUmc4?=
 =?utf-8?B?Wk1PZzNyMUpZKytwbDg1OVpXMW90U0F6NUxYdG5kK1Z5d0FiZmRVVnZsb0dj?=
 =?utf-8?B?a0lSZFJqZHh3UEg4bVhXb2s1bW85TGtQV3pyMXJNZWpZa1FrL211UjRYcmRy?=
 =?utf-8?B?ajdDdkhSNjlXTXFDN3NqdnBzc2FkZ2gxaTRLdWtEekpOMS9HRWhVMDFPdm9M?=
 =?utf-8?B?amw4UWxhcG96cXFLczBSUTVhWXFCanFzamFjSmUrWUFOMGJnSGNrbjJab3Q5?=
 =?utf-8?B?TjFzNHhCS09xUTRZWVJLeTFpUlJYKzVuWE1nbkxWSmNzejQ5dDZSUTdkKzNY?=
 =?utf-8?B?ZWJnV2NWazVoNzZtY2FBalA4bGl3d2VFMVoyZllVRmxhUFZobVFGTnhKQmtj?=
 =?utf-8?B?a01td2puV2Q1eDB2c2xBTFpyc2dUcWV5cWc0V2txZmRHNVR1TUZXVDBoR0Z3?=
 =?utf-8?B?THZCNDRSeWtBbHkzSnc5T29IYkhybVp6Q3ZBOXkyOVRpa2lhM3FtNTR1Zkx2?=
 =?utf-8?B?ejBXcVlXaTlYRGEvSlZHVFlTUjh6NXdDYXplMzg5UUQzSXlBcGxlQTFpcEJL?=
 =?utf-8?B?cVBmVndienlsQS9OemZFYitVTmQyaVBRNnJoSWVQYlJCeGJRWmVRSERsNVdh?=
 =?utf-8?B?K29tNytGOTFIMXYvMW9sRWFXSHNJbFdmVk9NUVVwY2xTZy9vVzBNbTZBOEwv?=
 =?utf-8?B?akhkQ2t0N01WY21TdGRaVm9Hc1BkZWh3NWVGb0I3V3JxK0ZSK2o4VTZEc1Rr?=
 =?utf-8?B?dzRtKzhnRGNvbDlaYXhOaWZWUkUyYSt2OTljcEd4NjZucEFMcjRiWS9rNUQv?=
 =?utf-8?B?SVRqOUhYNkpNQmp2QVF5MHV3OEV6K0VXRzJMcHdYY1hnU3o1NDdYVnpHU2FL?=
 =?utf-8?B?a2ZueVVJa3gzTjFENlQwSjkzVTdSZ2VEbDJjQ2lvZ05mUDRYRG1QY004dXVr?=
 =?utf-8?Q?/AzLnyXGHyl4J64o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2b0a18-2c45-4228-bc04-08de58772a2d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 22:56:36.7278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3ftz2TiZBB4o9+27uoe53M8SmAE0Ic+FqJs0DWco4rbAT/NoL6+WrFhROGI9wy1cNcLDIcYEopqLt+Ve/bHwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7626
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



On 2026-01-20 3:37 p.m., Matthew Brost wrote:
> On Tue, Jan 20, 2026 at 03:16:21PM -0500, Zhanjun Dong wrote:
>> guc_submit_fini requires access to device memory. Using a device-managed
>> action guarantees the correct ordering of cleanup relative to memory
>> unmapping.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> 
> Since patch #2 is a fixes and this fixes patch #2, can we squash this
> patch into patch #2?
> 
> Aside from that, I do think this is correct as guc_submit_fini now
> initiates a hardware teardown so this should be the DEVM handler.
> 
> Matt
To be squashed in next rev.

Zhanjun
> 
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index c848615d6057..f29ed62d2b12 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -241,7 +241,7 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>>   
>>   static int __xe_guc_submit_reset_prepare(struct xe_guc *guc);
>>   
>> -static void guc_submit_fini(struct drm_device *drm, void *arg)
>> +static void guc_submit_fini(void *arg)
>>   {
>>   	struct xe_guc *guc = arg;
>>   	struct xe_device *xe = guc_to_xe(guc);
>> @@ -334,7 +334,7 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
>>   
>>   	guc->submission_state.initialized = true;
>>   
>> -	return drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
>> +	return devm_add_action_or_reset(xe->drm.dev, guc_submit_fini, guc);
>>   }
>>   
>>   /*
>> -- 
>> 2.34.1
>>

