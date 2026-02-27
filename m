Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F730FD530E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 08:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E815010EA6C;
	Fri, 27 Feb 2026 08:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RLhb0oQF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D3310EA62
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 08:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772181660; x=1803717660;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DxIZknTmZR4Av302u6XX7zGVV2TBPkK7RjI4qDHuo6o=;
 b=RLhb0oQFr6Bl3bQD9IUlH3o2+NY/mpzTfr4uPnkV1vmRCF6tt/H6VzGo
 +VUROD3HMulBD8l3J5pFjFWRYj1VWrNPGT7+Bm/FNOR8pEVHnZH8FlMC+
 /FztYEAtx4wqUT172Xv3uLgLsNxqR1KhzBEwZnd0NooiyMnTIURF68fH4
 0W2W2Wa35OHgAWaCcpZZco71g0Ui9w0MzEyJNmG0s2/2n9kvdRzyALSxo
 2VHG0CN6e02GcWSNAxYecdRT5TOXktnh4T4wyDvyKROjqBHac3yZIl3ld
 oOIQtY5G/+HQZ4Mku8+Yw0rkTPtgKPZtybHOOE7Vbmvf1IXI5PF3DpjhW A==;
X-CSE-ConnectionGUID: bgLVod6JQmm4luwOaAynbQ==
X-CSE-MsgGUID: 55PpZmM1Tyaj8Hh3Y7XG0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="95879539"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="95879539"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:40:59 -0800
X-CSE-ConnectionGUID: 7wX4WajORXS6Ymro57EVhA==
X-CSE-MsgGUID: w6skWIBrSd+13Y2E3oMNKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="221461789"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:40:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 00:40:57 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 00:40:57 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 00:40:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xg5ZFGtHOqfELdDFq/Vwp5z/KKe1ZFKvr0KR3Pbec46AhBDWPiXcJBElh9i0e6drWwTpIOe01PvlN5QcfuruKh/Vv7xJlJBxDsTorV3973qN4rOXqa3+xx1rCtF3b9PlOl8lOJ6rZVvo5yaRp1oERk667PMgJa3fXEYkANhjx24qvwwnJvwLDwlkGyX14UMR+PxdsknNaOzqtWnu/468jaFSK0VLagruPbOSoQPBMtL1Ng9csqnd3kTW5JkjKAUmiYeFwfTnJUd9Ud1MzMpQEajhPyog1u1ahE/uJ5pOPfvRparHmo3zKCa4+VORLMF/k5TTL9VOw8g4UbY3CrHEVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z03CqbDh1smJU/VLU39ywW4GJAqJoxqg1c0vMYQytN8=;
 b=Wt/kcO+dH08nnQyJJ50rb7YIFO8OhXdwfgDK5y20m/8FN5ECvJjGVDW+OM6h3nm0VJQ09mE2eGHvtA12QAbo++8HZNUS8SPk8TImeiOgJTowH049dB8fQykueG2fqFhRykI4TT3cIr0ZwUQoG8sFmjkvT8gcd2we/zt2XuXtwXvuj5IMv3YUyKkoWfkbYwWIwE+QhmxLVVMJFO8Rngd80qy7Ro4Z4/NFp0iEV5lW6bD5GChB0YwwUso3r6xzye07v4o8F8bLb2W6JFrSmVSHst8/P82HbBzNuNXhNTkJtJ1OBKAtGrm+NWtL8yUdvvUAbS9hXbZ0lSY2FPys8i59mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by SJ5PPF4990C6B9D.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::826) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Fri, 27 Feb
 2026 08:40:50 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::a086:2649:bc88:db7d]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::a086:2649:bc88:db7d%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 08:40:48 +0000
Message-ID: <5be3aeea-9822-49bc-a9f8-e28c64a1db80@intel.com>
Date: Fri, 27 Feb 2026 10:42:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] drm/xe: Allow per queue programming of COMMON_SLICE_CHICKEN3
 bit13
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260217083436.1101287-1-lionel.g.landwerlin@intel.com>
 <20260217235140.GT4694@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20260217235140.GT4694@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::17) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|SJ5PPF4990C6B9D:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ce4e134-c3f1-402f-a8cc-08de75dbe7c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: VRoBZPqmcFyopZ+37S4JIweqt8eqfln1+Ky/Cj2WKvAHKU0oaV7khxfqsbS16FJppcIQocfiGxPWeIuvMSD2tcjeNLapiX2/KVMAHNa9DL7qv0pFSjPTXvKlXRVLH05bOiZqdck3nQQQ1kKgyuMnJOxdot2BUYzn0z/5N2cOx106HkJ7KvmSHO6/3EuzG8ostDjfyVY85GhdJhqDbx8kEalulb4VESlMRLbRC7sT6hhXMTS7diOGuIWtec0UHpaIJPZeLopAbREZ1fvRL8ArVgSO01ouVTVtHVixuZD9L47wYzI8RUfRoCXtl/YFSXw89GloFcpPkjjpbApDBNUD4klWZnLwo7lWqMERyNwilY1ez7GFFdsG/LXw19p0cgMqjj1XD9VT9odryldl+6PUmYNCrcmhu/qCHmeeFGp5yXr5H5QjVy+zwQju5PydyQAYIc+SBVS7nupm8z33kYI+C6Kp5w+MygJQNOuLI+cOcCOO/2EYjuFHLrGRJy6eN2mPcUDJSxaSleUlBAuOsQEEyyITFSoBZVHV0O4VfqjPCQXCSP0qs19JaWUI3ufGeteGmbYRq6KnWjuDJq7/QogmcJChFIBI2TRFrcP5jCesze9CdIdeiS0bNdeh8TCW86A1XGcJZWpi2IL3E1QJAIRkpbSIvWV1Fbh7rVlOwgUzG4uPoiY/plvZ0EqmrVnjcEeITytr/c9tFFIl23YCGPvyMbPynM+gR7cy2MNTxZM3uoE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1JNNVllL1ZjSjU5eEZXQnFET2pFWjVOK1U3UHNYbm9aQ0p1NFN1cGMyajAy?=
 =?utf-8?B?eXRYV21oZ1NZTDhmRG5jWWNZTHZIQVpCazRDeXVsZG90WkREaG80WnMrZnpz?=
 =?utf-8?B?YUhUQW9IOHpzdmZQaHNGNmk5NDlBcDFyNWdxWEpsWmoyRll1K0ZRY0xDR1d5?=
 =?utf-8?B?VWQ5RUxYZ01HRGowdW1IWXN2NmpwZU9IYU95eXRFZzd1bXFWelJrb1VoRW1l?=
 =?utf-8?B?eXp1anJsQzRaZndKNHpFbEc5am1mN291Z0tHVjBvKzA5K1VaUTNqWFZOZEd4?=
 =?utf-8?B?VHlMRW5BanhZV0VxVS9vOFl1aklxQXBCdGF0VG1iWlo5bXA2SjIrZExXdnlI?=
 =?utf-8?B?QndtRVdiMlRGSlphOE55a2YwTGRkbW50eWpjMkFYRklISnhTeFRmV3dmcExV?=
 =?utf-8?B?UWtFTEplZXlhT3g2Z1VjZGFHdGVzNnZ3S3ZYQW90cHJqNkZJeGd1a25BeDdp?=
 =?utf-8?B?ZmhjOGE2ZzlrNFRlVitQYmlDUThTeUJEbmdCYWxxTmIxV3hJUXc5ZEV3by9Q?=
 =?utf-8?B?VkROcXkxMmRwSGtXbmQrZnpncWswTFVBTi8wVERuSGhPdlJIRXJrZ0hZRXFC?=
 =?utf-8?B?dUx3aTFNNTI1T2F3cHdtSkkxWWRkbVp3TjhwbHVtMjdDSTZBYmZLNUd5N1g4?=
 =?utf-8?B?RTdUdjg5THo1aFpQVmRXK3hieERZQVd2d21ocXpocngzVi9nQ3VKRU5LL1Nn?=
 =?utf-8?B?bnY0S3J5WktlQWVYd2kxZmJCNkZQL0JzZkVPbHdDS2Yvc2lPdWIxcmpHSVpu?=
 =?utf-8?B?alJJTUs5NmgwbXZmckUyNUcxcG01WnZnY1huRklERyttKzZ6Tk9kcXNzdkxB?=
 =?utf-8?B?bmlqUGFxeWF2Q3g2cGY5aUN0OTNxeXp2cXhYbnEvSnkyRWt4d1RkZEorT2VB?=
 =?utf-8?B?SzEwb2J5eEl2WkdzQ0dVRXByWm8yOHBsUFY4eUZ1Qm54Y3BJOHVDdHo5TktI?=
 =?utf-8?B?MkpLajNOMTV5UjBhVkZmQzA3U0doVW5LZTMxalZYYUVFZTF1UGRXWW5aeTQr?=
 =?utf-8?B?d2xHUEswNFV6TmplRVdEb244TzNOQjJvV1RCSElhS2tFYzVLRmFpZm0yZVM0?=
 =?utf-8?B?WEsvK1hGUjZSSEhkNVR1QkFoRElzNHA4Q2hpTkxDWVoyY0t6TDY5Q1U4UGxh?=
 =?utf-8?B?QjZiRXdaYUUybitmTzhicEVSMkNxMWNSUnlIcmFBTFFHajVELzFNWVJscXZN?=
 =?utf-8?B?NkpXTTZISnpLRGUxaDdxejBKT3QydHcvRWVXdWNxZUhObkxBc0RQWDl4RjRQ?=
 =?utf-8?B?a1YyZGR6LzRtK0pDTmVnL2phY2xZMVlnZERWWmUxeTRtbUg0b1Z4dTRCREhl?=
 =?utf-8?B?eEcrOHhRZkYvWjJDWXZxbC91d0VZWkZrbmZvc3J5Rzk3N2lqakoydlhHdHBa?=
 =?utf-8?B?bTdQZDhtQWdubm14R0svM3lFTmwrb1liMVQ3MStiQUdjU2s4WjR1TjBNcm4y?=
 =?utf-8?B?L295Q2Y5cDhiMEVWaXRKeVJ5NTVnNTd4cEJtbzVXTm1xUTFodDhraXladnBH?=
 =?utf-8?B?b20vR0hmYmlQTzViWkV6Z1BaVHNoTGlMa2VRQzlyaUtkR0R5YWRjNU9ibFlZ?=
 =?utf-8?B?djRxcSs4eUl3bGc2YXArNWJyZ1lJMW5hMDN0RHNQNFhjUXlNQWF1MFpwUnhL?=
 =?utf-8?B?eHJ1aUdITmpXSHhwYTJTWGk1UmxjRmU1ektnRXhXTEtKWk1GN3pUdk5lcmsv?=
 =?utf-8?B?YlE5MEtsd3REVDVlMFIxMkdvbWVJZ2R4WVAvV1dWdXJBeS9FM2pralFZYmVD?=
 =?utf-8?B?YmZ4cUxPbXJnK3ViOVpRRTBCVTJ2bmpxVXI1Z0FIOHpTZ2tQVllFMzhueVVG?=
 =?utf-8?B?cmlPVEprNjdHdUZ1MXpsWXhtUHozd0JnVVpMWnYyN3RLTjJjMFFlN29nUGZE?=
 =?utf-8?B?NTVoZ1dWeXR1R0drSUVXL2EyT0drUjJJU2N6dW1heVRRWHBNT0FUWkVXaS90?=
 =?utf-8?B?QXlBNzVyQis0K1VpV015UFFsVCtVNUowQ3RnZm9HSHRicWRlSXJqcnEvRGdX?=
 =?utf-8?B?Syt2WTV0akg0a1h4cTMrQmhKd09UYU5NdnhjQXB3NmtMOHdaTjBBZmhHV28y?=
 =?utf-8?B?V3pEakd4c2swQVhZZ2V5RFBVK2dtc3pXL3NOajdwQXZxVlF5TjI1SWlCYU5y?=
 =?utf-8?B?YUJjbU1yVzlwQ3Z4ZklSbENkb3kyWXlVWmFrOUVkRHkyV09kQ0M4QmhWOHdn?=
 =?utf-8?B?WWlJTzJ1eVFTbHJ5UmNLWGVoZURaRXpIb0tvN0QzcEJXQjI4dERadWRSVEJE?=
 =?utf-8?B?b1ZsNkF6RXptcGdRaDQ0Uy91WWpGUFdvUUc2cWNwSnJSeG5DVC9YZzF5RHpj?=
 =?utf-8?B?dUk1Y3MwTW9jNDdueDhmZlYyeGllbnRabXBkSEJDeW9aYVFxZitleHVpb21n?=
 =?utf-8?Q?xZAXt078Dj3dD9Ok=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce4e134-c3f1-402f-a8cc-08de75dbe7c4
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 08:40:48.3572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SNLFZawdLRUqUNaSDisiMJxWCt4xFxajXPcVVqg8I6vUUwleiQ5Vlp9mhw7ftocjeJ/zAm46SMkag6BbnnvQ/TtBQR7+QsfUxDJYgRD54g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4990C6B9D
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

On 18/02/2026 01:51, Matt Roper wrote:
> On Tue, Feb 17, 2026 at 10:34:28AM +0200, Lionel Landwerlin wrote:
>> Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
>> ("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access"), except
>> people have decided to not rely on putting the register on the
>> allowlist for UMD to program and instead have context/queue creation
>> flag.
>>
>> This is a recommended tuning setting for both gen12 and Xe_HP
>> platforms.
>>
>> If a render queue is created with
>> DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX, COMMON_SLICE_CHICKEN3 will
>> be programmed at initialization to enable the render color cache to
>> key with BTP+BTI (binding table pool + binding table entry) instead of
>> just BTI (binding table entry). This enables the UMD to avoid emitting
>> render-target-cache-flush + stall-at-pixel-scoreboard every time a
>> binding table entry pointing to a render target is changed.
>>
>> Bspec: 73993, 73994, 72161, 31870, 68331
>> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  1 +
>>   drivers/gpu/drm/xe/xe_exec_queue.c       | 18 +++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>>   drivers/gpu/drm/xe/xe_lrc.c              |  9 +++++++++
>>   drivers/gpu/drm/xe/xe_lrc.h              |  1 +
>>   drivers/gpu/drm/xe/xe_query.c            |  2 ++
>>   include/uapi/drm/xe_drm.h                |  8 ++++++++
>>   7 files changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index a375ffd666ba2..80a438e51419f 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -178,6 +178,7 @@
>>   
>>   #define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
>>   #define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED)
>> +#define   STATE_CACHE_PERF_FIX_DISABLED			REG_BIT(13)
>>   #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
>>   #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE		REG_BIT(12)
>>   #define   BLEND_EMB_FIX_DISABLE_IN_RCC			REG_BIT(11)
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 66d0e10ee2c4a..d3168353fcaaf 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -292,6 +292,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>>   	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
>>   		flags |= XE_LRC_CREATE_USER_CTX;
>>   
>> +	if (q->flags & EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX)
>> +		flags |= XE_LRC_STATE_CACHE_PERF_FIX;
>> +
>>   	err = q->ops->init(q);
>>   	if (err)
>>   		return err;
>> @@ -850,6 +853,17 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
>>   	return q->ops->set_multi_queue_priority(q, value);
>>   }
>>   
>> +static int exec_queue_set_state_cache_perf_fix(struct xe_device *xe, struct xe_exec_queue *q,
>> +					       u64 value)
>> +{
>> +	if (XE_IOCTL_DBG(xe, q->class != XE_ENGINE_CLASS_RENDER))
>> +		return -EOPNOTSUPP;
>> +
>> +	q->flags |= value != 0 ? EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX : 0;
>> +
>> +	return 0;
>> +}
>> +
>>   typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>>   					     struct xe_exec_queue *q,
>>   					     u64 value);
>> @@ -862,6 +876,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>>   	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
>>   	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
>>   							exec_queue_set_multi_queue_priority,
>> +	[DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX] = exec_queue_set_state_cache_perf_fix,
>>   };
>>   
>>   int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
>> @@ -946,7 +961,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>>   			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
>>   			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE &&
>>   			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
>> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
>> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY &&
>> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX))
>>   		return -EINVAL;
>>   
>>   	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index 3791fed34ffa5..f4f72d01eb8c8 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -134,6 +134,8 @@ struct xe_exec_queue {
>>   #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
>>   /* for migration (kernel copy, clear, bind) jobs */
>>   #define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
>> +/* for programming COMMON_SLICE_CHICKEN2 on first submission */
>> +#define EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX	BIT(7)
>>   
>>   	/**
>>   	 * @flags: flags for this exec queue, should statically setup aside from ban
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 38f648b98868d..a962ac2bb7ca2 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -14,6 +14,7 @@
>>   #include "instructions/xe_gfxpipe_commands.h"
>>   #include "instructions/xe_gfx_state_commands.h"
>>   #include "regs/xe_engine_regs.h"
>> +#include "regs/xe_gt_regs.h"
>>   #include "regs/xe_lrc_layout.h"
>>   #include "xe_bb.h"
>>   #include "xe_bo.h"
>> @@ -1447,6 +1448,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	struct iosys_map map;
>>   	u32 arb_enable;
>> +	u32 state_cache_perf_fix[3];
>>   	u32 bo_flags;
>>   	int err;
>>   
>> @@ -1579,6 +1581,13 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>   	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
>>   	xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
>>   
>> +	if (init_flags & XE_LRC_STATE_CACHE_PERF_FIX) {
>> +		state_cache_perf_fix[0] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
>> +		state_cache_perf_fix[1] = COMMON_SLICE_CHICKEN3.addr;
>> +		state_cache_perf_fix[2] = _MASKED_BIT_ENABLE(STATE_CACHE_PERF_FIX_DISABLED);
>> +		xe_lrc_write_ring(lrc, state_cache_perf_fix, sizeof(state_cache_perf_fix));
>> +	}
> This will put instructions in the LRC's ring to update the register.  So
> when this context starts running, the context switch will load the
> default value of COMMON_SLICE_CHICKEN3 from the LRC's main MI_LRI
> instruction, then these commands will run to update the value, and
> eventually when we context switch away, the modified value will be
> written out to the LRC's main MI_LRI instruction so.
>
> That should work, but wouldn't it be more straightforward (and more
> consistent with our other LRC initialization) to use
> xe_lrc_write_ctx_reg() to put the value we want into the LRC even before
> it runs for the first time?  That's how we poke several other register
> values into the in-memory LRC during init.  There's a
> xe_lrc_read_ctx_reg() you can use to get the current value for
> read-modify-write purposes (see the handling of the RUNALONE flag for an
> example).
>
> The only quirk of using xe_lrc_read_ctx_reg() instead of
> xe_lrc_write_ring() is that we'll need to add a #define for the dword
> offset of COMMON_SLICE_CHICKEN3 within the LRC since we don't have that
> defined yet.


I'm not sure how you make this work.

The current register you place like this from the host, their location 
in the image is know and doesn't change.

I can't say this is the case for COMMON_SLICE_CHICKEN3.


-Lionel


>
>> +
>>   	map = __xe_lrc_seqno_map(lrc);
>>   	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>> index c307a3fd9ea28..083a2167aeef8 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>> @@ -49,6 +49,7 @@ struct xe_lrc_snapshot {
>>   #define XE_LRC_CREATE_RUNALONE		BIT(0)
>>   #define XE_LRC_CREATE_PXP		BIT(1)
>>   #define XE_LRC_CREATE_USER_CTX		BIT(2)
>> +#define XE_LRC_STATE_CACHE_PERF_FIX	BIT(3)
>>   
>>   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>>   			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index 34db266b723fa..5927eaf792efe 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -340,6 +340,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
>>   	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
>> +	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>> +		DRM_XE_QUERY_CONFIG_FLAG_HAS_STATE_CACHE_PERF_FIX;
>>   	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>>   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>>   	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index c9e70f78e7238..856838fcadd89 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -406,6 +406,9 @@ struct drm_xe_query_mem_regions {
>>    *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT - Flag is set if the
>>    *      device supports the userspace hint %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION.
>>    *      This is exposed only on Xe2+.
>> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_STATE_CACHE_PERF_FIX - Flag is set
>> + *      if a queue can be creaed with
>> + *      %DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX
>>    *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>>    *    required by this device, typically SZ_4K or SZ_64K
>>    *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
>> @@ -425,6 +428,7 @@ struct drm_xe_query_config {
>>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
>>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
>>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
>> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_STATE_CACHE_PERF_FIX	(1 << 4)
>>   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>>   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>>   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
>> @@ -1279,6 +1283,9 @@ struct drm_xe_vm_bind {
>>    *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
>>    *    priority within the multi-queue group. Current valid priority values are 0–2
>>    *    (default is 1), with higher values indicating higher priority.
>> + *  - %DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX - Set the queue to
>> + *    enable render color cache keying on BTP+BTI instead of just BTI
>> + *    (only valid for render queues).
> I'm not sure if this is the best name.  The bspec indicates that
> 0x7304[13] effectively *disables* "state cache perf fix" which was only
> intended for DX11 scenarios and shouldn't be used elsewhere.  So it
> seems like the name here should either mention "disable" or should be a
> more descriptive explanation of what actually happens when we set this
> flag (e.g., "xxx_USE_BTP_AND_BTI" rather than using the vague "PERF_FIX"
> terminology).  The maintainers may have thoughts on what they want to
> see.
>
>
> Matt
>
>>    *
>>    * The example below shows how to use @drm_xe_exec_queue_create to create
>>    * a simple exec_queue (no parallel submission) of class
>> @@ -1323,6 +1330,7 @@ struct drm_xe_exec_queue_create {
>>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
>>   #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
>> +#define   DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX		6
>>   	/** @extensions: Pointer to the first extension struct, if any */
>>   	__u64 extensions;
>>   
>> -- 
>> 2.43.0
>>

