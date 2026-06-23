Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A286CDB470
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 10:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB6510EA89;
	Tue, 23 Jun 2026 10:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="biimKA8g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D5610EA89
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jun 2026 10:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782211298; x=1813747298;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O0VaaqK09Coo3ouKn3W+HulDFPZqYDIHlp8hmlnig5s=;
 b=biimKA8g5UKS6bgwWWUGDSABsACZyhxftDSfUF7KFWWcSw/E9GlxMWri
 Dp2NbDg9dZfCL2QWrsXBRoxZ+lmdwc643w3adhnw63NTYGbJdd9a2wZrA
 VQ8hXTKQYNPEKoiwAKXRUujLwUOy8wXhVDuNYuoDw2P/Ii9YuR0HM1nlo
 rAauRl3IV0WJQkY2yeZlrZ2tnHnM3c0RbrrmtdwtlH7Q2yJju+dzUOJrt
 0ex76NU6TkiRo2eYjubwVs5VcfgGvi/zjg+wktybFyACmzIK168Q9lk/S
 q7PBXHu0ahV10fJ0v28IRnT09mRREYXro4ja+AjVCaLSagqe8jZc+vJ1w w==;
X-CSE-ConnectionGUID: 0/5RB8NGQEC8TUHK/G2nlw==
X-CSE-MsgGUID: 2lV3FdbOQxyQne35Q5Yt8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="108493697"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="108493697"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 03:41:36 -0700
X-CSE-ConnectionGUID: 0K7+M9hBSdGw/5oAgvKr0w==
X-CSE-MsgGUID: GkVkzuNJQLuy5pJ8GsW+YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="253826416"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 03:41:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 03:41:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 23 Jun 2026 03:41:36 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 23 Jun 2026 03:41:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLreMxBuzvCTnq02pSlhovhbZBajAeaBR6gqYOZNg3WQWf4Nfl6Cdp/zPNAB5rz0nxND25YryF92vSLXuQ2xrHzwO9z0yxaos596Wbw75iy0JGdSOOm8axG6UAwhckcUa8GtXHVG2aAx2OkbPY92pD2uny+0GmEqPEHfxfhTHBwd7HANY+h+SihKTQiBMcfiQaZfWGDrjuphYKPlnhqijSddA/qohBFu3WqCPdUVEHDwB7OmpSnytn5V9EkeeZOewwQ6oNo4SgB0EJDhM/ujco2vH/RrtMwEsj6MvPjZEbRUNc8RxK0X9TISRCTvqpBN4kI7PzpDfYGqF/BGfd35pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlZoLM7SfCWScFVSkeVf/fWHUOSYIb+FZv3iGdZ11jA=;
 b=tgK2jlvvkcti0CgT0Lp7MUYa07wbCB+4PtBnzwwksJv9wbSr7+ufLQ5OQTfLAerq71+zUcQ189m0/V8o4euTIeiCEj3DtGYwhf4TZUHZaPQ+hPGm0Hi6Uhxj9/dEfkE/tUyrzgimUbj+NGaLQp3QnNYk0eCZnDsK55DIX7w8toQnv/AMJLuuQV+OlaQ2EKSnCeae+ixlv5q4hmEfoJacYi93nWCm74J9DtYOXcy1tdNlFZ02Qm29JC2EgFUV8qZrQ9l2BAWse2oB4i5jl6HwwfeuqpFSLYMH19jPaFpKuQcaa/ybjLWryj8x4zhC4yHYvknh4Ad9tPr68rbTeLk2TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by IA0PR11MB7693.namprd11.prod.outlook.com (2603:10b6:208:401::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Tue, 23 Jun
 2026 10:41:28 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0159.012; Tue, 23 Jun 2026
 10:41:28 +0000
Message-ID: <19f99977-7902-4d67-821b-03970b5ae5a3@intel.com>
Date: Tue, 23 Jun 2026 16:11:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 2/3] drm/xe: Add RAS logging helpers
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
 <20260617104711.79646-7-mallesh.koujalagi@intel.com>
 <fcffd5d8-c019-47e8-83cb-c84cdb3b88bb@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <fcffd5d8-c019-47e8-83cb-c84cdb3b88bb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::11) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|IA0PR11MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 80c9d6fa-0430-4d7d-6fa4-08ded113fae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|4143699003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: QjAwZEvxVpBkGNlkUIa86iUf672O4TglDzqVbFRPWcgREUHP0J7KPmxpiabBCrvsrf016s+xddUjwyJ3yhNcCLVs2kksl6nBjdQmQ9uCxZI4Ek4yv7dfG8XOSRlkoAZTJg+op5LyUwnxzjgSWfEGnFFgQSs8lorPYWYBcGTPahSfRRW4zpXFg42eNvfZQnP5ecl3pnceIDwq7j6h9nrpS2vBZVrgRnlcOE53rmsIMc2kqG0Qi+D0MMKNIvH5rSmn+YSJJRl1KNjVeNVBMMF7XOZkwN4mpcFIWRj4+R7Y80yibdgBM19hEtfjia7Fge5B3nbD+3jvCterzlcKB8My2zldM9SGqVDutf8DdxFmwzcDk26hzbrRzO82pzghgUqmvR/bS/JmiZAIQHS1r7PNQgPUz3oUjC1l+Z4VO4o3wlWTge1zs1tPTyMDdoGT05sxdVyJhekpdUurJ+SCOIi8ox7BYCkV3WOliVCySUq0bo0fJmTNWuYbT46KrISWd+64DooDx8WXtxOGsDFzxPocE8BsSbmCG+4m6C0EfppYEfDrloJNgd0HDeIHKxJNlQp5R9bMJSIw81Y5+Rfhq1BfjJhtZUiW4PdRlgXhWj+odV9swAqayTGtq1ZniDDJaI3hvP41sRC906JEdLVFWOoVL3AlgciQHemzK3oORvCmnMc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(4143699003)(56012099006)(6133799003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjdYc3AzT2tRZ2l4cHMrOHUrYUVRMzF3ZTR5Mzh4WmpMd0pXVjFPQ3RhQm9Z?=
 =?utf-8?B?ZTFFQTRsS3AzaDQzNzNhRndFRTBqd1lYbHE2c0RqWUJTM3NPSU95L0RJb054?=
 =?utf-8?B?N1FpYjI1anRpRWdNa1VIRUY2NUVMS3NsZEw0bUI5TEdlNjFTVW0xWUQzSklQ?=
 =?utf-8?B?YTd6QTBZUHhhVjJaNXNnS2N1QXBaQWRiS2RkTnNpQlZmOXNSSVdnMGlWRitI?=
 =?utf-8?B?ZERGTDcrR0lETmp5N1BoQW40UktaZk9Ta3RZNVdKTnVCUnRnWmlHRTEyWnFW?=
 =?utf-8?B?M1pMbTNLQjB0SDR1UDA4NTJkY1oyRGpQaE9sSUFzSU9xTGN2MWhaaXJRVHhp?=
 =?utf-8?B?Z0NZbStRMFU0OWFud1hjWCtUOEV1NGVhRkdmOG1VMWJ3a3psT3NuV1BqdHNM?=
 =?utf-8?B?V25nREE3MHpIMTczRW13WGYvMVBOWFA0MjkxejlPYzhaeUh4VkJvMWhrcXNY?=
 =?utf-8?B?cHM5ZTBHMUZRYng2VzVHenZFN1FQZWNySjIvakI4b0owZ3BHQkJEK2JNWVFN?=
 =?utf-8?B?a3BZZnp4UjAyV2d0bXB6VDlpY2ZKR095UHdkOXN5UTdPcGlGYW9xZ0xURW8w?=
 =?utf-8?B?czBmYUJERUh6THBldDB0dFByZ2FISmNlNWNXcWRBY3NZM2ZnRUFXdDBVYm8r?=
 =?utf-8?B?TWIzOFRhNnp1MUo1OWkvR085U0Q3Z1kySGZmelhmOEY4RXJ1TVRlbzhwYW91?=
 =?utf-8?B?VkNDWlRrZzBqWEVtbjJnR1Rqd1R1UVplY3dBaUdVR2xnald3eVdPeGlac3Z1?=
 =?utf-8?B?ZUJVRGxsdjdGSThkZy82aDJnRWlQN3NYQm5XdERtdUhaOEpnWkd0S1BzWVFl?=
 =?utf-8?B?QnNTRkZidjhNVUlTMEdxZElaS3E2U1QwZ1l6M0orLy9paCtJbVFhSzNzdTVi?=
 =?utf-8?B?UFJiVkFIbkMrc2FYdG4raUdPaXlZQUVhaHhReUZNcVJWem90eUNJMUM4Rzc3?=
 =?utf-8?B?Q25nL3JnQXM0RnBMeExPZ3A1anB6Q3hZUnhQZVJoaHNzRlB5TXNQTUFmZ1Vl?=
 =?utf-8?B?cmMyeCt6eGhqL0Z6WlNhQVp0YVhFS0FhaTZoK2dENUdCNEFOM2NuZUMwZmkv?=
 =?utf-8?B?aTBDOUhjdEthOFVGb3JVRGpGbWV6ZzZnelBjYU1BdnhKN2VsWGk0N2dnUm1l?=
 =?utf-8?B?Y2pQOEx3eUZ5bVRNZlp5T3Bnc0dHN29XRGdDc21wVTdFOEE2WlFrU1RSOVQ2?=
 =?utf-8?B?QjREVWd3S1o2eWxiRDA1RytuQWN1SE9IM3d1YmpEZXVsUzNMTDlSazRxTXZx?=
 =?utf-8?B?czJiQXZ3TFEyemVZSjYwV1NlUXNvYTNkTVRPbS95dTU1ZkxMOEpMMjVUZGdq?=
 =?utf-8?B?SW1rT2JDd21paEthV1RTMHlNbUJEUWd0c2lvd2kzL3podklTdzFMNGdGbGk5?=
 =?utf-8?B?M0lLS2Erb0tVQ254cFlmU0x5SzB2WXBuLzRZSGhnNGgrQzBBRUhwOVdGMUZY?=
 =?utf-8?B?dGI3cmFKWlVvcFk4cHJLYTNiWHUyTEFVdUdxSEVJYjYyd1VwNWllK202WFRo?=
 =?utf-8?B?MVFpVTJXZ2txTGd2bnR3UlJJNFZ2Z3RMc2x0MFE3NFRNNnFFWDFhWnV6bzVY?=
 =?utf-8?B?Q0xVVFNpclc1cEVoWnRLMDBadTNNOFRTV3lmVC95T0xmbWE0V0x3alNDK2kz?=
 =?utf-8?B?NXFLc0JvR2JpR1VjRXdIR1cwQ09nRWZVMnV5all2VjNxWVVqNi9BSWI2OUFD?=
 =?utf-8?B?TTR2cWsxVWQ0MmRxNHloTmpJQ2Q1eVJHMG5BRjJXMUNWQ0srWDVCeEVURFBI?=
 =?utf-8?B?MCtDY2hRM0QwRm1FOFhoWnJhRlZuQnJnNnBYMXd5aWhkaCszZ1h1bGdZdGIv?=
 =?utf-8?B?dUp6RGFtWWhZS0ZSVVFzenFIMmlGSlNoQ25SYXBEOFB2b085ZVR0b3ZSQ1hs?=
 =?utf-8?B?ZXo1MWZ4M3daU004V3AzSnFxdGxXYzRjSnQ5ZUk2RnpGcnpEdVg4MDFad2hj?=
 =?utf-8?B?Y2pUREJCNDNvREJKVExPbUVXWExIbDNLdlY4UEtsSmJucmJ0N3ZRQ1gwNWN3?=
 =?utf-8?B?ZWljUVVsQ0dyV2I0Q2c1YXFBSzJHdDV2WW9DcTBXM2ZvSmlDUGVncUtFYnk0?=
 =?utf-8?B?SklySWVlWkNFNlYycWlOVW1aWENVcUw0dTRnYi9JSFQ4YXFMUHhsb3Ewc3M1?=
 =?utf-8?B?QUNLZEF0eXBFa1dZM0lIOHl3S1pkZEsvSEZ2dStVdW9pdFFIbzhkU1ZXaXJP?=
 =?utf-8?B?bnJ2cXIzL3Yyekk2S2tuTjdybVhpS243N3kwUHdROFlIMjNxQ3VNSjliVHJM?=
 =?utf-8?B?eGJIMEtnT3lTL3poQmxNUzlNdEVUWjhGeHhSTFFxZkZyZC9UTEZZZEFkV0Y0?=
 =?utf-8?B?bmpQelhPTEduRjVxamxlWldKd2VsbGFVUXlZZ3Q5c01nSmtCb0JCdit0VFNW?=
 =?utf-8?Q?SSSEx4vEcAJafwUU=3D?=
X-Exchange-RoutingPolicyChecked: axu6BfBtVG9RzPOvVDS92yEnqWRkjvTXQAoROwsNF20wT1inOQ0t3AEvmbrmgeQq8ZVgHkKqsFCc9rWlMVPjMMQFzUhi5CHcc8DSvNXRveHHSSkfDaDHLB/bdGcZTIvOQZf9sIFwgwtp+zHbKdLrBMCN8vOq33W4Wy6VnmJCubWGusXXRudbfvNpAYOLQr9UlYr5Yk9L8S00RJUqpb1n4frOpWUuL62vyUlhxL73eQ/aHOm9ntR/H7a8MJEcvyVG8P6bdQJJ2IDwMrr6UIjfJv0QrzyXbCA/G3rAgOejYdB6t6MLz1/fC8RlsdlDpglFnLJe3gYwrQfc7gqzHWnDNQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c9d6fa-0430-4d7d-6fa4-08ded113fae5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 10:41:28.1590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wZgyKqSDyFydpY8CN2EpwxGXG25tA/rwmRl2TvXXvygVqodCI4u5Rx+JtjCUoXgj67nHKrfMIJ5aBcwl5obneN9Hwuv7LWRs6+wNolVX+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7693
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


On 19-06-2026 11:13 am, Tauro, Riana wrote:
>
> On 17-06-2026 16:17, Mallesh Koujalagi wrote:
>> Add xe_ras_log.c and xe_ras_log.h so the driver can report
>> faults in a structured, machine-readable way.
>>
>> The core is __xe_ras_log(), which emits a single log line with:
>> SIG_ID, severity, location (device or tile/GT), errno, and message.
>> Fatal faults go to drm_err(); recoverable ones to drm_warn().
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v3:
>> - Refer "Tile%u" and "GT%u" strings. (Michal Wajdeczko)
>> - Remov xe_cper_severity_str(). (Michal Wajdeczko/Riana)
>> - Move __xe_ras_log() function to xe_ras_log.h. (Michal Wajdeczko)
>> - Make macro function properly.
>> - Remove *_FIRST and *_LAST macro. (Michal Wajdeczko/Riana)
>> - Add sig id documents. (Riana)
>> - Change macro function same prefix as the file.
>> - Handle __xe_ras_log() function with variable format.
>> ---
>>   drivers/gpu/drm/xe/Makefile     |   1 +
>>   drivers/gpu/drm/xe/xe_ras_log.c |  63 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras_log.h | 108 ++++++++++++++++++++++++++++++++
>>   3 files changed, 172 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras_log.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras_log.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 8e7b146880f4..607c9b099d03 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -114,6 +114,7 @@ xe-y += xe_bb.o \
>>       xe_query.o \
>>       xe_range_fence.o \
>>       xe_ras.o \
>> +    xe_ras_log.o \
>>       xe_reg_sr.o \
>>       xe_reg_whitelist.o \
>>       xe_ring_ops.o \
>> diff --git a/drivers/gpu/drm/xe/xe_ras_log.c 
>> b/drivers/gpu/drm/xe/xe_ras_log.c
>> new file mode 100644
>> index 000000000000..0e836ef5dcf6
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras_log.c
>> @@ -0,0 +1,63 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_print.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_ras_log.h"
>> +
>> +/**
>> + * __xe_ras_log - Emit a structured RAS log entry
>
> Why __?
>
The __ prefix follows the kernel convention for the function that are 
not meant

to be called directly. In this case __xe_ras_log() is the backend 
implementation, callers

are expected to use the type-safe macros like xe_ras_log_wedged() etc.

Same pattern used elewhere in the kernel e.g. __dev_err()/dev_err().

>> + * @xe: xe device instance
>> + * @gt: GT instance where the error occurred, or NULL if device-wide
>> + * @sig_id: signature ID from xe_sig_ids.h identifying the error class
>> + * @cper_sev: CPER severity (one of CPER_SEV_FATAL, 
>> CPER_SEV_RECOVERABLE, etc.)
>
> Add enum  name instead

The CPER_SEV_* values are defined as macros in <linux/cper.h>, not as an 
enum,

so there isn't an enum type name to reference here.

>
>> + * @errno_val: negative errno describing the error condition
>
> Why do we need error no? 

The errno provides a stable, machine-readable error code along with the 
log message.

This helps monitoring tools and scripts interpret the issue 
correctly—for example,

-EIO on a wedge event indicates the device is no longer responding to I/O.

>> + * @fmt: printf-style format string
>> + * @...: format arguments
>> + *
>> + * Formats the message and emits a kernel log line via drm_err() for 
>> fatal
>> + * events or drm_warn() for all others. CPER record generation and 
>> hex dump
>> + * are planned as follow-ups.
>> + *
>> + * Format:
>> + *   [xe-err] SIG_ID = <id> Severity = <sev> Location = <loc> Errno 
>> = <n> Message = "<msg>"
>
> You are using both error and warn but here it's only xe-err.
> Isn't this misleading?
>
Good catch, I’ll update this in the next revision to reflect both xe-err 
and xe-warn appropriately.

>> + */
>> +__printf(6, 7)
>> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
>> +          u16 sig_id, u32 cper_sev, int errno_val,
>> +          const char *fmt, ...)
>> +{
>> +    char loc[32];
>> +    struct va_format vaf;
>> +    va_list ap;
>> +
>> +    if (gt)
>> +        snprintf(loc, sizeof(loc), "tile%u/gt%u",
>> +             gt->tile->id, gt->info.id);
>> +    else
>> +        snprintf(loc, sizeof(loc), "device");
>> +
>> +    va_start(ap, fmt);
>> +    vaf.fmt = fmt;
>> +    vaf.va = &ap;
>> +
>> +    if (cper_sev == CPER_SEV_FATAL)
>> +        drm_err(&xe->drm,
>> +            "[xe-err] SIG_ID = %u Severity = %s Location = %s Errno 
>> = %d Message = \"%pV\"",
>> +            sig_id, cper_severity_str(cper_sev), loc,
>> +            errno_val, &vaf);
>> +    else
>> +        drm_warn(&xe->drm,
>> +             "[xe-err] SIG_ID = %u Severity = %s Location = %s Errno 
>> = %d Message = \"%pV\"",
>> +             sig_id, cper_severity_str(cper_sev), loc,
>> +             errno_val, &vaf);
>> +
>> +    va_end(ap);
>> +
>> +    /* TODO: Add CPER record driver handler */
>> +    /* TODO: Add RAS dump cper hex handler */
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_ras_log.h 
>> b/drivers/gpu/drm/xe/xe_ras_log.h
>> new file mode 100644
>> index 000000000000..08318dea75a9
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras_log.h
>> @@ -0,0 +1,108 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_RAS_LOG_H_
>> +#define _XE_RAS_LOG_H_
>> +
>> +#include <linux/cper.h>
>> +
>> +#include "xe_sig_ids.h"
>> +
>> +struct xe_device;
>> +struct xe_gt;
>> +
>> +/**
>> + * DOC: RAS structured logging and SIG_IDs
>
> Link this document.  Add a  brief heading
>
I’ll update this with a proper heading and link to the documentation.
>> + *
>> + * What this file is for
>> + * ---------------------
>
> Once  this document is generated.
> "this file" does not indicate what you are referring to.
> Use general doc headings
>
Agreed, I’ll rework the wording to use proper documentation-style headings.
>> + * Use the xe_ras_log_*() macros to report faults in a
>> + * machine-readable way.
>> + *
>> + * What is a SIG_ID?
>> + * -----------------
>> + * A SIG_ID (defined in xe_sig_ids.h) is a stable numeric error class.
>
> Add full form. Define what is SIG ID
>
Good point, I’ll expand and define SIG_ID clearly in the next revision.

>> + * It tells tooling what kind of fault happened, independent of 
>> message text.
>> + *
>> + * Driver SIG_ID classes:
>> + *   XE_SIG_PROBE         - probe/init failure
>> + *   XE_SIG_WEDGED        - device unrecoverable
>
> wedged does not mean device is not recoverable

You’re right, I’ll fix the wording to avoid implying it’s always 
unrecoverable.

>
>> + *   XE_SIG_SURVIVABILITY - degraded/safe mode
>>
>
> not really safe mode. Please use actual definition

Agreed, “safe mode” is not accurate. I’ll update it with a more precise 
description

>
>> + *   XE_SIG_FW            - firmware fault (GuC/HuC/GSC/CSC/PCODE)
>> + *   XE_SIG_GT_TDR        - engine hang or GT reset (TDR)
>> + *   XE_SIG_MEM_FAULT     - VM/page-fault/GTT error
>> + *   XE_SIG_IO_BUS        - PCIe/IOMMU/MMIO bus error
>> + *
>> + * HW SIG_ID classes are hardware-defined categories, reported by 
>> firmware via
>> + * CPER records (for example XE_SIG_HW_DEVICE_MEMORY). Driver code 
>> does not
>> + * emit HW SIG_IDs directly.
>> + *   XE_SIG_HW_DEVICE_MEMORY  - device memory errors (e.g. ECC)
>> + *   XE_SIG_HW_CORE_COMPUTE   - compute/shader core errors
>> + *   XE_SIG_HW_PCIE           - PCIe interface errors
>> + *   XE_SIG_HW_FABRIC         - on-package fabric errors
>
> on-package?
>
It refers to the high speed interconnect between dies/tiles within the 
same GPU.

I'll make the comment clearer in next revision.

>> + *   XE_SIG_HW_SOC_INTERNAL   - SoC-internal errors
>> + *
>> + * Why this exists
>> + * ---------------
>> + * SIG_IDs let RAS tools parse logs reliably, correlate CPER events, 
>> and apply
>> + * policy/thresholding without depending on fragile string matching.
>
> What do you mean?
>
I’ll rewrite this section to make it more concrete and easier to understand.

>> + *
>> + * When to use xe_ras_log_*()
>> + * --------------------------
>> + * Use these macros when the event is:
>> + *   1) a real hardware/firmware fault,
>> + *   2) relevant to production monitoring, and
>
> How does one decide if it's relevant?
>
That’s a fair point. I’ll replace this with clearer, more concrete guidance.

>> + *   3) clearly mapped to one SIG_ID class.
>> + *
>> + * Do not use for all logs
>> + * -----------------------
>> + * Keep regular debug/info/driver-state messages on standard logging 
>> helpers
>> + * (xe_gt_dbg(), xe_gt_info(), xe_gt_warn(), xe_gt_err(), drm_dbg(), 
>> drm_info()).
>> + * RAS macros are for structured fault reporting only.
>> + */
>> +
>> +/*
>> + * Common backend helper
>> + */
>> +__printf(6, 7)
>> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
>> +          u16 sig_id, u32 cper_sev, int errno_val,
>> +          const char *fmt, ...);
>> +
>> +/*
>> + * Driver-facing reporting macros
>> + */
>> +
>> +/* FATAL */
>> +#define xe_ras_log_probe(xe, errno, fmt, ...) \
>> +    __xe_ras_log((xe), NULL, XE_SIG_PROBE, CPER_SEV_FATAL, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define xe_ras_log_wedged(xe, errno, fmt, ...) \
>> +    __xe_ras_log((xe), NULL, XE_SIG_WEDGED, CPER_SEV_FATAL, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define xe_ras_log_survivability(xe, errno, fmt, ...) \
>> +    __xe_ras_log((xe), NULL, XE_SIG_SURVIVABILITY, CPER_SEV_FATAL, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +/* RECOVERABLE */
>> +#define xe_ras_log_fw(xe, gt, errno, fmt, ...) \
>> +    __xe_ras_log((xe), (gt), XE_SIG_FW, CPER_SEV_RECOVERABLE, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>
> Why force a type of severity here?

Good point, I’ll check with the architecture team and update accordingly.

Thanks,

-/Mallesh

>
> Thanks
> Riana
>
>> +#define xe_ras_log_gt_tdr(xe, gt, errno, fmt, ...) \
>> +    __xe_ras_log((xe), (gt), XE_SIG_GT_TDR, CPER_SEV_RECOVERABLE, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define xe_ras_log_mem_fault(xe, gt, errno, fmt, ...) \
>> +    __xe_ras_log((xe), (gt), XE_SIG_MEM_FAULT, CPER_SEV_RECOVERABLE, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define xe_ras_log_io_bus(xe, errno, fmt, ...) \
>> +    __xe_ras_log((xe), NULL, XE_SIG_IO_BUS, CPER_SEV_RECOVERABLE, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +#endif /* _XE_RAS_LOG_H_ */
