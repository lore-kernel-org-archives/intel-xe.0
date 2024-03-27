Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71279C47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 17:41:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252F110FEB1;
	Wed, 27 Mar 2024 17:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fh3X2UG2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B8A10FEB6
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 17:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711561294; x=1743097294;
 h=message-id:date:from:subject:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=g+Lzulmra7kFiA6qNrpqr6ca3q5SXHJGo/mZnqDHcc4=;
 b=fh3X2UG2o3O0mckQdOknJXuab6ZT1W3GJJVGS6KMg6DN29ZYyEo6A39X
 hJLdAGDgBriVSUFDuA/rErZZeoaxgqwSNSID78V/zapEf7SlzB6rLWlg7
 wd2kdnOpRvSJCKC8BmxKuRe9hyOtdCujD2tBsbSZ1GEGHLBFP5yISh94w
 S6W9KdBSTBWS/edfzYfWX/6+/dchZd/Ms/m290IsxIajWjrp3tK+orVpF
 jOHkYNvNqfVHK2P8PFy0GuwzplPsxgCu4PygmDaXTFftIG/XcFbM31qMD
 91slyr3yOM17l7fubJq4Z7gRndOQzUybOX1XXKjwhMQc5hzuooJ7sjFms A==;
X-CSE-ConnectionGUID: rSAmzkRfRZCLtT41HqOOlQ==
X-CSE-MsgGUID: I4NMyBkXS3esulQtt+zw6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="24133624"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="24133624"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 10:41:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="16211607"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 10:41:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 10:41:33 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 10:41:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 10:41:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 10:41:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ohyt7clV3BFzz5ze82yZbkPcmgo0qUHCZ4VRzfZdVLLev0LyTDo/R2yqzOjn4kcKBSqMV0rSaobSkxBMP1FkiSLCVZkbVOKGSX3//kJE3oTphUOdYe5p/l9VqKyPC3GtIDbylRGDAvvCieeRimpnUwc1nChxAUgBrxPm13VVXckzFSyyL/qxnuxnQOYwyu7wl4HE+LjU1WHXFn+Ev7R4Tfph0idXxdDwDB96ovdVhQ3msjlQ+k/6zoEZxgLKdLoazAPOrFi02ccTzgGxqXRKcGt0Iex/MIjjHyX1IEzhrS22eQ98j/Wxg3mm3/jcT8JJPUVkXWcapwmXmNFca8MKng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reXEBMctRHX/sUA4/dsqMysUSZMUE29uo7+Kv82R6J8=;
 b=QszNVJPc9DraLrTUmjFP4/8eQYufbH0G1S5wS2o2TBKJWev78wYQGEv64pgED6odgmMryMoWqwCYePmxizMkH7OAI47PPRF4mUBQomHFYwjYJVseBpl8JZ+RBRS9q/+4GsS0X3RMhbjfUe2OuqiuHYo397LrRlKu21ZrBtScBf0ahrpSiZj+6KpaA5kMMS5NcA1PEawaoApturIKUAtzShVZjC/HFoitehKI3kdKg/Qa7zWv6a9kvte+XyXdAS/6AESdgNLTNj9dx5xKJAw3TCKZAOt/Unk4OtKe5uPn5fwJSNIQz9fUJA1oMN/DPegUHXI1JAkz0d+DA8dy8Hy6IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SA1PR11MB6966.namprd11.prod.outlook.com (2603:10b6:806:2bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 27 Mar
 2024 17:41:25 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::8778:d67d:55f9:f68a]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::8778:d67d:55f9:f68a%7]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 17:41:24 +0000
Message-ID: <960beb54-62a2-4432-a560-b5b8dc9d6ab7@intel.com>
Date: Wed, 27 Mar 2024 13:41:21 -0400
User-Agent: Mozilla Thunderbird
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Add INSTDONE registers to devcoredump
To: <intel-xe@lists.freedesktop.org>
References: <20240325190643.150648-1-jose.souza@intel.com>
 <20240325190643.150648-3-jose.souza@intel.com>
 <4c208572-2d94-4946-a798-40037caa65da@intel.com>
Content-Language: en-US
In-Reply-To: <4c208572-2d94-4946-a798-40037caa65da@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:217::32) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SA1PR11MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: e03c93a9-ffe7-4b44-6903-08dc4e851f7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ysjsThKP1VL49pG4PLnAfIOpcpfRRr34rJD++qvZHeOBk0LWpxvCVdGrcB+YOlqHxfD1THWOXZdpWq6DnmnJDKzomIIo1UilAFchRrJ90pl9y7SMgotr+toCZb4gaFzHY93gXHw8qidUi40KQZ4PeXJ+O4lVLCt5+ymrGfmZA0T5xeUZoapZJOJk7M20bSoCbGDziKXMInpUnqfT8ph4Q5j8DT9SqCk0zJqqvtb9y4tqxN9FdBp8cmNKv8LFSmQNdKeFJ9JD3NOu1bmHMq0HNs3Z3i+TUeRdbYytYeaJh7IN5ai+6a6FFvXScBYxeTZoRTlH3Mq0s59arFM+TbuRpf8diW68mQMRa/5WAU1Ouz0/KIPNRV7uxyDVMGpqddx7fVxslCMyc8nGzJSyvIiDOXa19y/ySW5Rf6i3j2QeH172u2+G8NdKMZv2UIVO5KM5oIuhwws8YHJOX9B/ZwYmH6kS61/bU4ZXB8idlb/3FnI+XCfCaMJId13/tkeCQNiTI/P9w+Ujs9UAXoT0fEnG6kIZvORCa/jtvKXbrCRbIRXADZD9xLWTkLmZ2LWx5ajzPjo/r8NvHKWUdbaLVbyPjzHyp9o6MACO/MYR2M4RVItJFchfem91IeufBQHKdrdE7YUObLxFGI4yDZuwdJyStC1Gs2a6b6rmotTBFAiWeBA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajNEN0hTdngzN0dkL2x2VFJ1S1B5ampYd1pnV21WcytsTXFETGtJemJ3UTRL?=
 =?utf-8?B?b21hR21tK0xCbkM5Ym9uSUhXbTg2eWZTMnRiV001Mm95WURFVGc4K2pRMEF4?=
 =?utf-8?B?eTBtR1JSbUlHVEZwV05MV1RySzlFRlZZdzRQNjZnckRNMkJoeTV0aUc4Tnlv?=
 =?utf-8?B?NUVqdDhBQ0dKWEZmVkRzZkxPdHJweWw5ck9Ha2tra0l4NTMybnoyajYyMHRI?=
 =?utf-8?B?WCt4RXVBcjVhd2FseUZmdHdxN1NPS3M1KzVVb284SnRyeHcwWmR3SUtCQzRs?=
 =?utf-8?B?U0Z1TlJGTEVobkpQaCtTZlhBNWZKOWxwazRjWUZ4MzRBSXlBL0VvUXBPQ1ph?=
 =?utf-8?B?ait2TVRBNURSMHRSMjRrSno1dk5YMHRKVEU4ZWRZZCtpbFFKd0ZCZ1Z5TGp2?=
 =?utf-8?B?dUVHZ3NRajlFbWUyOE8wTWU5SlVveVUzQmpXTEw0WjZvVHFFWXdyZk41R2t0?=
 =?utf-8?B?eXpDU0VjMjVyTEpNdmNjRGVpMFpKRlhtU24vMVBCbHYzZlZNWjh5dFJWY1lu?=
 =?utf-8?B?anBKOG1qbjY5Qm4xTG0xZW0wRVptak9KZW80RlFlMHFmbWVYUTJobU4zYjRK?=
 =?utf-8?B?NFRNa0pEalpHL3kxQWY1YU9oZmZQUUlpWloxSitRaDQrb1lPMTVnam5BdlNQ?=
 =?utf-8?B?a3M5Ui84YTJRK1dtM2wvTDg1VEEvZzJBOUlYRkdidFdDZnA1ekVYTEdtb1dj?=
 =?utf-8?B?VmdQSXpkZy9jMGsxT0dOb1Y4eWFLN1p6YTNlQnFaeEFPcVU2TllWUkE1Rk11?=
 =?utf-8?B?RG9TOWpHeUpiU2RCQyt1Y2EwTzM5RU10cTJiUWF5a3RBUkdvOXFwbzkzcmVH?=
 =?utf-8?B?VkUrOFhQQmlVcVBJK1RpUU5HcGF1ZUFvcGsvZEkyQVVXbVhSQWxwRVIvT0pJ?=
 =?utf-8?B?MGZDUzdtVHd0L2NKTkY1U1gzb1Q0M3ZNZmhZaC9GTkV3TVVNQVdBWHBnSXhs?=
 =?utf-8?B?WkdnQnhkUkd0Sy96OGY0dlJPZXFMODAwUVFvdVMrZ08vZktpQjNPV1ZRaDhN?=
 =?utf-8?B?MDE5VDZIcHo2MGxsVzViemdCUGRzc0pKRHA2M1NET0o0ZE1TM0tsbVVQaGpn?=
 =?utf-8?B?bC9jbXRJaW8wKzFWd0hpblNXa0RtMXYxNWxNa1g3ck5MVEE5dXVpSUl2SDda?=
 =?utf-8?B?SnVzRjdxZmorMFVBZmdqdWQ1RHllMjI1U1ZhQllpOHYzYkxsOXIvRWNtY3Bh?=
 =?utf-8?B?R2QwbkwxWFdFNXRjSUFGenVnNGZjREs4K0w4MU9pd25ieXc3NHpzbWs0eHc4?=
 =?utf-8?B?bnpmOVVxK1FkMXVOL1dVdk5mTmpsYjRiZjBZb3NtZ0o4OE1HTTNiM0J1T1BR?=
 =?utf-8?B?bFkwaUJzK1M5UXpHaU82MVgrdDVPU3I0MlNOSWRpQjYvWW1objBZRnJUaGZK?=
 =?utf-8?B?OGx3Y0t2aDJSS0ExWHlwN1BRTVo0MkFMZGpTZk52ZG05Y1RLQVcvQWVsTUIx?=
 =?utf-8?B?WUlmckl0NlhVaUd4OXZ4eXdnWmNGYnM1ZytPUzQ3MUNXNnlJdEluYzVWUlRk?=
 =?utf-8?B?ZlpnaG52VHpqaWJDSmovNm9lanU4bGhqVEdiSmdSUFhZb3gvZHp2OHlnOFVx?=
 =?utf-8?B?bGNqZ05Rdm9RYnk1UG1hV2NrZlRHSEVLaWRsU2QwR0lnSUdFMnArb21BQVJV?=
 =?utf-8?B?dWE2eDh6STNiUTI3LzdmV2R4dVV4Y0xkUVZmU2txU1VYbGd0RFkyNndVMWZu?=
 =?utf-8?B?bFhJOCtZeENiOUI4d0FWVHpyUUNkbm43RUxtNUlGM2xQTFM2b3ZtcWhMSlZO?=
 =?utf-8?B?MDVWSjkrRHF2Ty9DL2V4ZzRJekZhUjZ5eFowWFlPUEpyZkpKRzV6eEh1dW5B?=
 =?utf-8?B?bVlSV3hWMXZNdzhGZVU2Y044KzBkUStaTGVoWTRGSzlHRTZQeTNGVCsxVk5n?=
 =?utf-8?B?M2RZdkVTdm0rRGQycWl1aHlITm8wTnlQTmVEaFBNRzcvbGE0RStPVXBvMGxV?=
 =?utf-8?B?emYwR1NHcjVndldkd0t2NXVpU2N3UmpzVEFkN0UzdVhxT2VqTmN1c21DTCtZ?=
 =?utf-8?B?NG9sRjdqOXFlVnA4NHBBNG9aTTZRaGRtZGNxTkQ1TmhpV3BjZFFmcjJoMFBj?=
 =?utf-8?B?QUd3M09ydU44ZUEyQmFqWVR2RHViVEc1TjBLbXEvMXpxUEk1K0dYZ1NMekFG?=
 =?utf-8?Q?wTB8w6CTYOMKTQ+xjWShJ9qFq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e03c93a9-ffe7-4b44-6903-08dc4e851f7d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 17:41:24.7646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dd3EsHCnNl82elDKB5kMHquVnjRN0AsWuSapDzzAdTkCcvfVH97orB188ryXafkJkQf/D5lVYQoar1rSmBlGuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6966
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



On 2024-03-25 5:17 p.m., Dong, Zhanjun wrote:
> See my comments inline below.
> 
> Regards,
> Zhanjun Dong
> 
> On 2024-03-25 3:06 p.m., José Roberto de Souza wrote:
>> This registers contains important information that can help with debug
>> of GPU hangs.
>>
>> While at it also fixing the double line jump at the end of engine
>> registers for CCS engines.
>>
>> v2:
>> - print other INSTDONE registers
>>
>> v3:
>> - add for_each_geometry/compute_dss()
>>
>> v4:
>> - print one slice_common_instdone per glice in DG2+
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
>> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  13 +++
>>   drivers/gpu/drm/xe/xe_hw_engine.c        | 128 +++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hw_engine_types.h  |  16 +++
>>   4 files changed, 158 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> index a08528d9c76b2..98d830013e96b 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -65,6 +65,7 @@
>>   #define RING_ACTHD_UDW(base)            XE_REG((base) + 0x5c)
>>   #define RING_DMA_FADD_UDW(base)            XE_REG((base) + 0x60)
>>   #define RING_IPEHR(base)            XE_REG((base) + 0x68)
>> +#define RING_INSTDONE(base)            XE_REG((base) + 0x6c)
>>   #define RING_ACTHD(base)            XE_REG((base) + 0x74)
>>   #define RING_DMA_FADD(base)            XE_REG((base) + 0x78)
>>   #define RING_HWS_PGA(base)            XE_REG((base) + 0x80)
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 65af9fe95db5b..8bef88d6ab4e2 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -94,6 +94,8 @@
>>   #define   FF_MODE2_TDS_TIMER_MASK        REG_GENMASK(23, 16)
>>   #define   FF_MODE2_TDS_TIMER_128        
>> REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
>> +#define DG2_INSTDONE_GEOM_SVGUNIT        XE_REG_MCR(0x666c)

The same register has a different symbol name prefix in drm-tip?
#define XEHPG_INSTDONE_GEOM_SVG			MCR_REG(0x666c)

We need the consistant name prefix unless you have strong reason.

>> +
>>   #define CACHE_MODE_1                XE_REG(0x7004, 
>> XE_REG_OPTION_MASKED)
>>   #define   MSAA_OPTIMIZATION_REDUC_DISABLE    REG_BIT(11)
>> @@ -110,6 +112,14 @@
>>   #define   FLSH_IGNORES_PSD            REG_BIT(10)
>>   #define   FD_END_COLLECT            REG_BIT(5)
>> +#define SC_INSTDONE                XE_REG(0x7100)
>> +#define SC_INSTDONE_EXTRA            XE_REG(0x7104)
>> +#define SC_INSTDONE_EXTRA2            XE_REG(0x7108)
>> +
>> +#define DG2_SC_INSTDONE                XE_REG_MCR(0x7100)
>> +#define DG2_SC_INSTDONE_EXTRA            XE_REG_MCR(0x7104)
>> +#define DG2_SC_INSTDONE_EXTRA2            XE_REG_MCR(0x7108)

Need to keep the same prefix of XEHPG_ ?

>> +
>>   #define COMMON_SLICE_CHICKEN4            XE_REG(0x7300, 
>> XE_REG_OPTION_MASKED)
>>   #define   DISABLE_TDC_LOAD_BALANCING_CALC    REG_BIT(6)
>> @@ -326,6 +336,9 @@
>>   #define HALF_SLICE_CHICKEN5            XE_REG_MCR(0xe188, 
>> XE_REG_OPTION_MASKED)
>>   #define   DISABLE_SAMPLE_G_PERFORMANCE        REG_BIT(0)
>> +#define SAMPLER_INSTDONE            XE_REG_MCR(0xe160)
>> +#define ROW_INSTDONE                XE_REG_MCR(0xe164)
>> +
>>   #define SAMPLER_MODE                XE_REG_MCR(0xe18c, 
>> XE_REG_OPTION_MASKED)
>>   #define   ENABLE_SMALLPL            REG_BIT(15)
>>   #define   SC_DISABLE_POWER_OPTIMIZATION_EBB    REG_BIT(9)
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c 
>> b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 6e75803c963ae..0720f779fa574 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -18,6 +18,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_gt_ccs_mode.h"
>>   #include "xe_gt_printk.h"
>> +#include "xe_gt_mcr.h"
>>   #include "xe_gt_topology.h"
>>   #include "xe_hw_fence.h"
>>   #include "xe_irq.h"
>> @@ -770,6 +771,57 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine 
>> *hwe, u16 intr_vec)
>>           xe_hw_fence_irq_run(hwe->fence_irq);
>>   }
>> +static bool
>> +is_slice_common_per_gslice(struct xe_device *xe)
>> +{
>> +    return GRAPHICS_VERx100(xe) >= 1255;
>> +}
>> +
>> +static void
>> +xe_he_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
>> +                       struct xe_hw_engine_snapshot *snapshot)
>> +{
>> +    struct xe_gt *gt = hwe->gt;
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    unsigned int dss;
>> +    u16 group, instance;
>> +
>> +    snapshot->reg.instdone.ring = hw_engine_mmio_read32(hwe, 
>> RING_INSTDONE(0));
>> +
>> +    if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
>> +        return;
>> +
>> +    if (is_slice_common_per_gslice(xe) == false) {
>> +        snapshot->reg.instdone.slice_common[0] =
>> +            xe_mmio_read32(gt, SC_INSTDONE);
>> +        snapshot->reg.instdone.slice_common_extra[0] =
>> +            xe_mmio_read32(gt, SC_INSTDONE_EXTRA);
>> +        snapshot->reg.instdone.slice_common_extra2[0] =
>> +            xe_mmio_read32(gt, SC_INSTDONE_EXTRA2);
>> +    } else {
>> +        for_each_geometry_dss(dss, gt, group, instance) {
>> +            snapshot->reg.instdone.slice_common[dss] =
>> +                xe_gt_mcr_unicast_read(gt, DG2_SC_INSTDONE, group, 
>> instance);
>> +            snapshot->reg.instdone.slice_common_extra[dss] =
>> +                xe_gt_mcr_unicast_read(gt, DG2_SC_INSTDONE_EXTRA, 
>> group, instance);
>> +            snapshot->reg.instdone.slice_common_extra2[dss] =
>> +                xe_gt_mcr_unicast_read(gt, DG2_SC_INSTDONE_EXTRA2, 
>> group, instance);
>> +        }
>> +    }
>> +
>> +    for_each_geometry_dss(dss, gt, group, instance) {
>> +        snapshot->reg.instdone.sampler[dss] =
>> +            xe_gt_mcr_unicast_read(gt, SAMPLER_INSTDONE, group, 
>> instance);
>> +        snapshot->reg.instdone.row[dss] =
>> +            xe_gt_mcr_unicast_read(gt, ROW_INSTDONE, group, instance);
>> +
>> +        if (GRAPHICS_VERx100(xe) >= 1255)
>> +            snapshot->reg.instdone.geom_svg[dss] =
>> +                xe_gt_mcr_unicast_read(gt, DG2_INSTDONE_GEOM_SVGUNIT,
>> +                               group, instance);
>> +    }
>> +}
>> +
>>   /**
>>    * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW 
>> Engine.
>>    * @hwe: Xe HW Engine.
>> @@ -784,6 +836,7 @@ struct xe_hw_engine_snapshot *
>>   xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>>   {
>>       struct xe_hw_engine_snapshot *snapshot;
>> +    size_t len;
>>       u64 val;
>>       if (!xe_hw_engine_is_valid(hwe))
>> @@ -794,6 +847,28 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine 
>> *hwe)
>>       if (!snapshot)
>>           return NULL;
>> +    /* Because XE_MAX_DSS_FUSE_BITS is defined in xe_gt_types.h and it
>> +     * includes xe_hw_engine_types.h the length of this 3 registers 
>> can't be
>> +     * set in struct xe_hw_engine_snapshot, so here doing additional
>> +     * allocations.
>> +     */
>> +    len = (XE_MAX_DSS_FUSE_BITS * sizeof(u32));
>> +    snapshot->reg.instdone.slice_common = kzalloc(len, GFP_ATOMIC);
> 
> Can we move XE_MAX_DSS_FUSE_BITS to a .h like "xe_reg_sr_types.h"? Might 
> need Matthew to comment on this.
> 
> then we can avoid dynamic mem allocation and define it like:
> 
> u32 slice_common[XE_MAX_DSS_FUSE_BITS / sizeof(u32)];
> 
> Beaware that I guess you define the u32 arrary to hold 
> XE_MAX_DSS_FUSE_BITS bit info, then it might be:
> 
>      XE_MAX_DSS_FUSE_BITS / sizeof(u32)
> rather than:
>      XE_MAX_DSS_FUSE_BITS * sizeof(u32)
> 
> 
>> +    snapshot->reg.instdone.slice_common_extra = kzalloc(len, 
>> GFP_ATOMIC);
>> +    snapshot->reg.instdone.slice_common_extra2 = kzalloc(len, 
>> GFP_ATOMIC);
>> +    snapshot->reg.instdone.sampler = kzalloc(len, GFP_ATOMIC);
>> +    snapshot->reg.instdone.row = kzalloc(len, GFP_ATOMIC);
>> +    snapshot->reg.instdone.geom_svg = kzalloc(len, GFP_ATOMIC);
>> +    if (!snapshot->reg.instdone.slice_common ||
>> +        !snapshot->reg.instdone.slice_common_extra ||
>> +        !snapshot->reg.instdone.slice_common_extra2 ||
>> +        !snapshot->reg.instdone.sampler ||
>> +        !snapshot->reg.instdone.row ||
>> +        !snapshot->reg.instdone.geom_svg) {
>> +        xe_hw_engine_snapshot_free(snapshot);
>> +        return NULL;
>> +    }
>> +
>>       snapshot->name = kstrdup(hwe->name, GFP_ATOMIC);
>>       snapshot->hwe = hwe;
>>       snapshot->logical_instance = hwe->logical_instance;
>> @@ -845,6 +920,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine 
>> *hwe)
>>       snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0));
>>       snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
>>       snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
>> +    xe_he_engine_snapshot_instdone_capture(hwe, snapshot);
>>       if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>>           snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
>> @@ -852,6 +928,49 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine 
>> *hwe)
>>       return snapshot;
>>   }
>> +static void
>> +xe_hw_engine_snapshot_instdone_print(struct xe_hw_engine_snapshot 
>> *snapshot, struct drm_printer *p)
>> +{
>> +    struct xe_gt *gt = snapshot->hwe->gt;
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    u16 group, instance;
>> +    unsigned int dss;
>> +
>> +    drm_printf(p, "\tRING_INSTDONE: 0x%08x\n", 
>> snapshot->reg.instdone.ring);
>> +
>> +    if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
>> +        return;
>> +
>> +    if (is_slice_common_per_gslice(xe) == false) {
>> +        drm_printf(p, "\tSC_INSTDONE[0]: 0x%08x\n",
>> +               snapshot->reg.instdone.slice_common[0]);
>> +        drm_printf(p, "\tSC_INSTDONE_EXTRA[0]: 0x%08x\n",
>> +               snapshot->reg.instdone.slice_common_extra[0]);
>> +        drm_printf(p, "\tSC_INSTDONE_EXTRA2[0]: 0x%08x\n",
>> +               snapshot->reg.instdone.slice_common_extra2[0]);
>> +    } else {
>> +        for_each_geometry_dss(dss, gt, group, instance) {
>> +            drm_printf(p, "\tSC_INSTDONE[%u]: 0x%08x\n", dss,
>> +                   snapshot->reg.instdone.slice_common[dss]);
>> +            drm_printf(p, "\tSC_INSTDONE_EXTRA[%u]: 0x%08x\n", dss,
>> +                   snapshot->reg.instdone.slice_common_extra[dss]);
>> +            drm_printf(p, "\tSC_INSTDONE_EXTRA2[%u]: 0x%08x\n", dss,
>> +                   snapshot->reg.instdone.slice_common_extra2[dss]);
>> +        }
>> +    }
>> +
>> +    for_each_geometry_dss(dss, gt, group, instance) {
>> +        drm_printf(p, "\tSAMPLER_INSTDONE[%u]: 0x%08x\n", dss,
>> +               snapshot->reg.instdone.sampler[dss]);
>> +        drm_printf(p, "\tROW_INSTDONE[%u]: 0x%08x\n", dss,
>> +               snapshot->reg.instdone.row[dss]);
>> +
>> +        if (GRAPHICS_VERx100(xe) >= 1255)
>> +            drm_printf(p, "\tINSTDONE_GEOM_SVGUNIT[%u]: 0x%08x\n",
>> +                   dss, snapshot->reg.instdone.geom_svg[dss]);
>> +    }
>> +}
>> +
>>   /**
>>    * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine 
>> snapshot.
>>    * @snapshot: Xe HW Engine snapshot object.
>> @@ -891,9 +1010,12 @@ void xe_hw_engine_snapshot_print(struct 
>> xe_hw_engine_snapshot *snapshot,
>>       drm_printf(p, "\tBBADDR: 0x%016llx\n", snapshot->reg.ring_bbaddr);
>>       drm_printf(p, "\tDMA_FADDR: 0x%016llx\n", 
>> snapshot->reg.ring_dma_fadd);
>>       drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
>> +    xe_hw_engine_snapshot_instdone_print(snapshot, p);
>> +
>>       if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>>           drm_printf(p, "\tRCU_MODE: 0x%08x\n",
>>                  snapshot->reg.rcu_mode);
>> +    drm_puts(p, "\n");
>>   }
>>   /**
>> @@ -908,6 +1030,12 @@ void xe_hw_engine_snapshot_free(struct 
>> xe_hw_engine_snapshot *snapshot)
>>       if (!snapshot)
>>           return;
>> +    kfree(snapshot->reg.instdone.slice_common);
>> +    kfree(snapshot->reg.instdone.slice_common_extra);
>> +    kfree(snapshot->reg.instdone.slice_common_extra2);
>> +    kfree(snapshot->reg.instdone.sampler);
>> +    kfree(snapshot->reg.instdone.row);
>> +    kfree(snapshot->reg.instdone.geom_svg);
>>       kfree(snapshot->name);
>>       kfree(snapshot);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h 
>> b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> index 27deaa31efd31..9f9755e31b9fe 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> @@ -211,6 +211,22 @@ struct xe_hw_engine_snapshot {
>>           u32 ipehr;
>>           /** @reg.rcu_mode: RCU_MODE */
>>           u32 rcu_mode;
>> +        struct {
>> +            /** @reg.instdone.ring: RING_INSTDONE */
>> +            u32 ring;
>> +            /** @reg.instdone.slice_common: SC_INSTDONE */
>> +            u32 *slice_common;
>> +            /** @reg.instdone.slice_common_extra: SC_INSTDONE_EXTRA */
>> +            u32 *slice_common_extra;
>> +            /** @reg.instdone.slice_common_extra2: SC_INSTDONE_EXTRA2 */
>> +            u32 *slice_common_extra2;
>> +            /** @reg.instdone.sampler: SAMPLER_INSTDONE */
>> +            u32 *sampler;
>> +            /** @reg.instdone.row: ROW_INSTDONE */
>> +            u32 *row;
>> +            /** @reg.instdone.geom_svg: INSTDONE_GEOM_SVGUNIT */
>> +            u32 *geom_svg;
>> +        } instdone;
>>       } reg;
>>   };
