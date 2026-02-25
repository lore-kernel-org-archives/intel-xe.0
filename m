Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F2FEFD239
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 10:11:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3728510E357;
	Wed, 25 Feb 2026 10:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixkAYaMs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4783610E357
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 10:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772014259; x=1803550259;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fPdtCx93Ks1d91xF6YRbpLrDdrxgwgJpoqtjIhpovjg=;
 b=ixkAYaMsHCDDYzFm4uOjPpewN0TQJcxakFC1UBr5ysqiq0uaA8MQ4SiC
 OmVfR0IUX0R2njUjOlKWD0cspsUIrdjgVYCn33UFZVMVxO38bn+GESfEQ
 2q6bn/Np4L7zfNpER0jnO3wPFhN2JeUnQWEEQMBETfp2ODtkkm5wkysLb
 CrigBKGBscXE/XavE6BVe7TBgZahNW9eckotUfqM1vp4kJ7S5/wh17fN9
 y5MIrVVg23GHqqFCWB2i8B/tEJOu1UvHceaJi8ZdFZIpg4HlALx3hTyhI
 z7zjT83BfJ8cgqB10uyDTQyHWKx+FaIf/Rx+hJz11sJ8Ax3CGd7bpr/WC g==;
X-CSE-ConnectionGUID: x45dHOZyT6mSEHLHKwYehA==
X-CSE-MsgGUID: 8tlkcLgLQ/mmyXCp9XqZdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="98513119"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="98513119"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 02:10:59 -0800
X-CSE-ConnectionGUID: iN7r+Rm5QP+0RbcA6APMyA==
X-CSE-MsgGUID: YzTcw5F9T7OU2zC3YyoX4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="213895777"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 02:10:59 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 02:10:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 02:10:58 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 02:10:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkAqfieARKmsWtp0H3tunuxSBQvIKgKU4Tg0efnmfkZr1yg5CNdSYJm2jDlecDINlZmSyoZMszpm0VbMQ/asQJk+wkhTeepbO5WgqR7LpaHem5Ial301766C6IVj/HWMbYw7/nuI5gMOtU5NADNd5c19CbiAQpvspe7oJh6uin7ywBfryDzb2wTecldQnnnAFXTpEdcPqdNYaLKkiZeIgl/w3jfzAo4VcWz9QgngD9UyBpTtcT1AVXOdW2C40IBF9KIP9z/+lSWDDoaq7nqn+ET0hifskAOd5eogpPn3HCuIlBJaNiayxHEKYI9angLPytHcz7hWqA3/hxH28BK1yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNnYf5HHZyovGvABIKSqqay0zaPPPKRC/9eA93q21KY=;
 b=MDvOdm3a75dSsd88a+KYLGGNlSG2dAnTXTRY5chJZpFcW6cpf/ebBuOjfOx+7vpWHFPFZ1he1gmMuH39YERYEkhcCm7nzBBblL5Ej89pKStzVTQ6PlpFkXjkBCuiMAagilmT4WiPpT+3Z8GVikGFdT/Fy27pEIx37Jcgbj3rxr4oFJK/KeV+gi8bJaaVkZ5WLiEI2SFK+Xqrb6GPCuVE/wdPXtaqqRg+Zvpt6BlGaG0osNsPHBXfiGE88OoUFMC3Ni87NcEoDFEzILcA7EATkBN4JrSptK4y2Q9PC33jjPQI3ScOd/We+HvBrbj/tNAjDiW0PoKYPAFYT0D6k5Lr9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by CH3PR11MB7938.namprd11.prod.outlook.com (2603:10b6:610:12f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Wed, 25 Feb
 2026 10:10:55 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 10:10:55 +0000
Message-ID: <5eedccde-63ae-45a4-a974-2c111d1950d8@intel.com>
Date: Wed, 25 Feb 2026 15:40:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] drm/xe/madvise: Add support for purgeable buffer
 objects
To: Matthew Brost <matthew.brost@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
 <aYykWLYG1MsY46en@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aYykWLYG1MsY46en@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0233.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::12) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|CH3PR11MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: b9a3acfd-77fb-4593-4bd3-08de745629bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: GtKCdEUTRRNsJIibP1IzMqkOOMNuwVGJDOdBTDQj4sQjwFBCp5QvSy/1L2itwiaC828CnQFG7IFE6skiWI2e4oUX8402/qPgDWDm6ivRsCbNSf7aXszsnki41PloSSfa05r08MWgLAitSwf8o+CKvKOoh3/8kValpYGTClN+KHfeL+TX6HnKT/ZD1HQH1x0w8Arab3mmfQLHKFYIK9XM5564GuX7o3oTHUKqxW9YUVYYm9GzNwlwtxofRWUc/u1BWt3Zr6Gtd+AyB/LHlToWcAMxVSR9RMLu01ymfhnQoG/Qf6HWE3/QgeAEloWW9KwO0r+X83rmsFoxc4pjpYFQyaR0707eGhKKs3STwWVXR3+gL53LwvsbXBemhXZtAl+jSMWMD2ewhhtQAXMQFqZZoRcwIiwSyo3bgyyPgYTyTmDLn6+xe1dI/UdIs1WUiVhhY55G6syAGpCwbFv/7m4lMEoiiWiCW+izftK3tOhuzTFF1TNUz3SAA2Nikx07Zany9pIhcu75gIa+pXHsGJ2QiQT9/VzobC1BOg5E2IDpxOqmSPi+GSDpxfDwP462Cod8rZzcRtqaoug7zGU3Jt9ZYU5d7tU32JSq2zZDntDyefaYepmskU0kGSLSg7D6Xur3hhDFyMvzTqQB1xik0LA6bv+pWFpoRjvlNS/XSWwnmKT1e9RdeiugyI18P4BOhmVGkdKwxflMAM0WhIMoSk24mwpyxi8W4LCotjeFD+PQuAk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NERFSEl5aWFnTWdndU05SytWYTBTL3JWK2xtenppWVlNc1ZCWHQ0dWpIYXBN?=
 =?utf-8?B?U2ZtMUFwWkxCUXR2VEkwKzJwSWJXMU9wZWk1KzdWcEtPaGppblpERnRJazMv?=
 =?utf-8?B?RUgrQm5YUG9IdDYxRVhtblV1eng2dUEybThGVWlqSmFaYW5GYlR1anJDemFI?=
 =?utf-8?B?S2JNdVQ2VXFSTFc2V2xaS0Mya2c5TWU3MVF6a2ZoYUJ5M0ZYcEZaTnZhVkpZ?=
 =?utf-8?B?ZW5VZytzN21HeS95cGp0SEpJaERCc0U5TUN6aThvWnpCMmg3cjhaNm5oVkJq?=
 =?utf-8?B?NVExcGhwUHVHRUVQb2x1cVNBZ1pIQnR2UHhsclNnSmsxNlVZOXJIeEtlbVJ2?=
 =?utf-8?B?R0RKMzdTVWVMYXhjQmJoSlZLMGszV09KU3hvNitCeEEvSExqOVIyYnpiYTNS?=
 =?utf-8?B?b20zbFJmZFFxY0NzTzdvL09hN1pMQ0hGaTFnMlFYQ1dpSi81M1IxZjdpajdp?=
 =?utf-8?B?MFY0ZEEzVEp3bG8vOGlqcGJMMW14V3FIODhtN0NYQWZZUTVHOHhtZ25xWitk?=
 =?utf-8?B?eVcvRFBLeHR6d3A1OGUydlJzT1MxUG5OUWRicVVWRUxjUDBWK3B1b1EzcWp1?=
 =?utf-8?B?NHhHVzVKUm9Ya0grby9BRmRVSFQvVlVjT1RpV3YwMGZrMlpNblQ0YVhVeFor?=
 =?utf-8?B?RzExdlN4OW0yZGwzZ0QzTDA5cng5di8xYmVYNWcrdnBwbDIvQ0JrZFRaK0Zu?=
 =?utf-8?B?N1l3dDZka0dpUk1jS1E0UUlpZEtZSmhsaDgzVW0zT0V5N3lvTElpYTFld1I2?=
 =?utf-8?B?NDgvYmp4Sk1vaTJEbHJKYWp6cUtlYktUK2ZDbkUrRUhSaVRZMmw3MVFLVk9y?=
 =?utf-8?B?TGdWMDl2TUtjM0VFdm5jU21SODJyWGVNTTRaT3BrYms5SFlLNkJ4QmZ6Tm8y?=
 =?utf-8?B?TVBaZHZBTjRxd0kyVHJmZ2hMSG5ac2pCbCtaUElnOWZzQ3FZcFRvTVh0T0JK?=
 =?utf-8?B?dWVsRC9wemdicyswRGR2VXNOb0VZWVIxa2tLRHZiVVQ1S0tZVmNUYkkxbnhG?=
 =?utf-8?B?M0gwYmJrc29UemdGVFNqaExOWlRUNGE0SmFpR3dXWW85dTF3UisxeGt1SDN2?=
 =?utf-8?B?ZkZkc2Irb1ZCMGJuNTcwMXBHVGNtZmkweHVwT2ZQODA5S24vTW1UYXB5bjZl?=
 =?utf-8?B?cE93ZWdGNGJGdnZoSDdrWDltU051VWdpNXJ0M2orVnNDeHhSTitjZEt5MDNF?=
 =?utf-8?B?VGtBVi9uTDN6WXRVaGNGRGdJcW1yOGZ4cWFhTXNWV0YwVEZUWEdpaXd0WDFm?=
 =?utf-8?B?UW5wcWZzOFVnVFFVd0g4bDFEMlg2REZHQW84Nyt6OUQ5N0JFbWJMQU4rL1RQ?=
 =?utf-8?B?OHVvanZCYm9Sa3g1eWZEaFVweWd6M1EwN2g5VzdlSUZqZTFUYkM0SGFmcEVI?=
 =?utf-8?B?L1FzcC81bklveUJNQjdUbW1HUHhOeHVVMGVUYW9WSmVSZmEway8yQkJyZ081?=
 =?utf-8?B?UmljYnQ4TGlUS1BwU0NjM3YvdHNuZHRiUHlOcDVqQjB0Z2kyNVdDSjJQSEQx?=
 =?utf-8?B?ejRSOTNiVnQ4dkVYZ2RXVVI2alIvYVFTdWRjdXU3d1FJcmk0enRVZkUzWXVB?=
 =?utf-8?B?dmpnTzdiRWljZXpBYk1Eai9xVW1GanpIWUJLSGxWaHR4U2xtckhWL3YwYWRW?=
 =?utf-8?B?ZVA0c2puN3ZzK3VtekRheDg2UXYzSVZxc0M5RkxxblFMeTlndHNQWDE2RGZm?=
 =?utf-8?B?N204OHRsV2R5ZEorazlNZ3M3alN1dHRSRzNHUFhKR0U1eEdVTE90d2tPS3Vj?=
 =?utf-8?B?cGMvckhjQzlGN1M5Q1NPemVqVVRVWFJLL3pURGZhZm9BREVLQkhUSkF3QU1q?=
 =?utf-8?B?TlFlcjdtY0s3dWF6SkxsdWcvWVRUcXdNZUp6aU5kaENDYkhpTXBZekptVTRy?=
 =?utf-8?B?anFueVRnKy9wTmtEMHpCUUpVUVVXRUVZVUw3UUd1TkJxcjBXd2gwUVZBbkxu?=
 =?utf-8?B?OVJsRnlSNVdxN1FtYUlDdUJlMW1pWk54R05meXR2TkdYUDhXZ2wrUDU1eERp?=
 =?utf-8?B?VTliRlNQY3hNQjVaWE1OOXlYbnMwSld0RnM0RmZ6Z0VlUDFER3hEaDlUOXlS?=
 =?utf-8?B?RU9WM3JxbnBUVnU4UHFLOHpVU0ZvK0lQZGFIMUZZTUxtZU9OTGk1SjRCajhl?=
 =?utf-8?B?M1NLSk9KSDI0MjZobjRPU2lXQ2dQdUZ4dVNBS05TYUFIMHBiR2NQVzVxWE9D?=
 =?utf-8?B?cThMRSsvSTZXMGZHN3FzNWg5R3JQNXdHdW9FelJCQllObjRmWTUyQy8vUHhJ?=
 =?utf-8?B?dWcxMnZMMTBjVm9INmx2NHJTKytBc29nelFjb3hSQ3FmdS91U2NGOXFVY2Fy?=
 =?utf-8?B?NGh6WFlHVnJiRFZoeEJjdXZqVGk1UkR1TTljK3pZWDlCSDVKdTQzUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a3acfd-77fb-4593-4bd3-08de745629bb
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 10:10:55.3165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9GutFJ7XxuGUgDVrRWaDRbAlqSIFhXe1Zt21oXxmxMNSWIvyxnpl29z7CuLEmxdOoOyXvHNH4Z7OZ1Cpfwdybg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7938
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


On 11-02-2026 21:16, Matthew Brost wrote:
> On Wed, Feb 11, 2026 at 08:56:29PM +0530, Arvind Yadav wrote:
>
> I have a feeling from the KMD POV we are getting close for this being
> ready to merge. What is the status a UMD PR to use this feature (?) as
> this is a prerequisite to merging.
>
> Also it likely time to start collecting ack's from the UMD teams on the
> the uAPI patch too.

Hi Jose,

Since this is now close to merge. Can you or some from UMD side to Ack 
the uAPI patch.

Thanks,
Arvind

>
> Matt
>
>> This patch series introduces comprehensive support for purgeable buffer objects
>> in the Xe driver, enabling userspace to provide memory usage hints for better
>> memory management under system pressure.
>>
>> Overview:
>>
>> Purgeable memory allows applications to mark buffer objects as "not currently
>> needed" (DONTNEED), making them eligible for kernel reclamation during memory
>> pressure. This helps prevent OOM conditions and enables more efficient GPU
>> memory utilization for workloads with temporary or regeneratable data (caches,
>> intermediate results, decoded frames, etc.).
>>
>> Purgeable BO Lifecycle:
>> 1. WILLNEED (default): BO actively needed, kernel preserves backing store
>> 2. DONTNEED (user hint): BO contents discardable, eligible for purging
>> 3. PURGED (kernel action): Backing store reclaimed during memory pressure
>>
>> Key Design Principles:
>>    - i915 compatibility: "Once purged, always purged" semantics - purged BOs
>>      remain permanently invalid and must be destroyed/recreated
>>    - Per-VMA state tracking: Each VMA tracks its own purgeable state, BO is
>>      only marked DONTNEED when ALL VMAs across ALL VMs agree (Thomas Hellström)
>>    - Safety first: Imported/exported dma-bufs blocked from purgeable state -
>>      no visibility into external device usage (Matt Roper)
>>    - Multiple protection layers: Validation in madvise, VM bind, mmap, and
>>      fault handlers
>>    - Async TLB invalidation: Uses xe_bo_trigger_rebind() for non-blocking
>>      GPU mapping invalidation
>>    - Scratch PTE support: Fault-mode VMs use scratch pages for safe zero reads
>>      on purged BO access.
>>    - Purgeable state is not applied to imported/exported dma-bufs,
>>      those BOs always behave as WILLNEED.
>>    - TTM shrinker integration: Encapsulated helpers manage xe_ttm_tt->purgeable
>>      flag and shrinker page accounting (shrinkable vs purgeable buckets)
>>
>> v2 Changes:
>>    - Reordered patches: Moved shared BO helper before main implementation for
>>      proper dependency order
>>    - Fixed reference counting in mmap offset validation (use drm_gem_object_put)
>>    - Removed incorrect claims about madvise(WILLNEED) restoring purged BOs
>>    - Fixed error code documentation inconsistencies
>>    - Initialize purge_state_val fields to prevent kernel memory leaks
>>    - Use xe_bo_trigger_rebind() for async TLB invalidation (Thomas Hellström)
>>    - Add NULL rebind with scratch PTEs for fault mode (Thomas Hellström)
>>    - Implement i915-compatible retained field logic (Thomas Hellström)
>>    - Skip BO validation for purged BOs in page fault handler (crash fix)
>>    - Add scratch VM check in page fault path (non-scratch VMs fail fault)
>>
>> v3 Changes (addressing Matt and Thomas Hellström feedback):
>>    - Per-VMA purgeable state tracking: Added xe_vma->purgeable_state field
>>    - Complete VMA check: xe_bo_all_vmas_dontneed() walks all VMAs across all
>>      VMs to ensure unanimous DONTNEED before marking BO purgeable
>>    - VMA unbind recheck: Added xe_bo_recheck_purgeable_on_vma_unbind() to
>>      re-evaluate BO state when VMAs are destroyed
>>    - Block external dma-bufs: Added xe_bo_is_external_dmabuf() check using
>>      drm_gem_is_imported() and obj->dma_buf to prevent purging imported/exported BOs
>>    - Consistent lockdep enforcement: Added xe_bo_assert_held() to all helpers
>>      that access madv_purgeable state
>>    - Simplified page table logic: Renamed is_null to is_null_or_purged in
>>      xe_pt_stage_bind_entry() - purged BOs treated identically to null VMAs
>>    - Removed unnecessary checks: Dropped redundant "&& bo" check in xe_ttm_bo_purge()
>>    - Xe-specific warnings: Changed drm_warn() to XE_WARN_ON() in purge path
>>    - Moved purge checks under locks: Purge state validation now done after
>>      acquiring dma-resv lock in vma_lock_and_validate() and xe_pagefault_begin()
>>    - Race-free fault handling: Removed unlocked purge check from
>>      xe_pagefault_handle_vma(), moved to locked xe_pagefault_begin()
>>    - Shrinker helper functions: Added xe_bo_set_purgeable_shrinker() and
>>      xe_bo_clear_purgeable_shrinker() to encapsulate TTM purgeable flag updates
>>      and shrinker page accounting, improving code clarity and maintainability
>>
>> v4 Changes (addressing Matt and Thomas Hellström feedback):
>>    - UAPI: Removed '__u64 reserved' field from purge_state_val union to fit
>>      16-byte size constraint (Matt)
>>    - Changed madv_purgeable from atomic_t to u32 across all patches (Matt)
>>    - CPU fault handling: Added purged check to fastpath (xe_bo_cpu_fault_fastpath)
>>      to prevent hang when accessing existing mmap of purged BO
>>
>> v5 Changes (addressing Matt and Thomas Hellström feedback):
>>    - Add locking documentation to madv_purgeable field comment (Matt)
>>    - Introduce xe_bo_set_purgeable_state() helper (void return) to centralize
>>      madv_purgeable updates with xe_bo_assert_held() and state transition
>>      validation using explicit enum checks (no transition out of PURGED) (Matt)
>>    - Make xe_ttm_bo_purge() return int and propagate failures from
>>      xe_bo_move(); handle xe_bo_trigger_rebind() failures (e.g. no_wait_gpu
>>      paths) rather than silently ignoring (Matt)
>>    - Replace drm_WARN_ON with xe_assert for better Xe-specific assertions (Matt)
>>    - Hook purgeable handling into madvise_funcs[DRM_XE_VMA_ATTR_PURGEABLE_STATE]
>>      instead of special-case path in xe_vm_madvise_ioctl() (Matt)
>>    - Track purgeable retained return via xe_madvise_details and perform
>>      copy_to_user() from xe_madvise_details_fini() after locks are dropped (Matt)
>>    - Set madvise_funcs[DRM_XE_VMA_ATTR_PURGEABLE_STATE] to NULL with
>>      __maybe_unused on madvise_purgeable() to maintain bisectability until
>>      shrinker integration is complete in final patch (Matt)
>>    - Call xe_bo_recheck_purgeable_on_vma_unbind() from xe_vma_destroy()
>>      right after drm_gpuva_unlink() where we already hold the BO lock,
>>      drop the trylock-based late destroy path (Matt)
>>    - Move purgeable_state into xe_vma_mem_attr with the other madvise
>>      attributes (Matt)
>>    - Drop READ_ONCE since the BO lock already protects us (Matt)
>>    - Keep returning false when there are no VMAs - otherwise we'd mark
>>      BOs purgeable without any user hint (Matt)
>>    -  Use struct xe_vma_lock_and_validate_flags instead of multiple bool
>>      parameters to improve readability and prevent argument transposition (Matt)
>>    - Fix LRU crash while running shrink test
>>    - Skip xe_bo_validate() for purged BOs in xe_gpuvm_validate()
>>    - Split ghost BO and zero-refcount handling in xe_bo_shrink() (Thomas)
>>
>> Arvind Yadav (8):
>>    drm/xe/bo: Add purgeable bo state tracking and field madv to xe_bo
>>    drm/xe/madvise: Implement purgeable buffer object support
>>    drm/xe/bo: Handle CPU faults on purged buffer objects
>>    drm/xe/vm: Prevent binding of purged buffer objects
>>    drm/xe/madvise: Implement per-VMA purgeable state tracking
>>    drm/xe/madvise: Block imported and exported dma-bufs
>>    drm/xe/bo: Add purgeable shrinker state helpers
>>    drm/xe/madvise: Enable purgeable buffer object IOCTL support
>>
>> Himal Prasad Ghimiray (1):
>>    drm/xe/uapi: Add UAPI support for purgeable buffer objects
>>
>>   drivers/gpu/drm/xe/xe_bo.c         | 187 ++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_bo.h         |  60 +++++++
>>   drivers/gpu/drm/xe/xe_bo_types.h   |   6 +
>>   drivers/gpu/drm/xe/xe_pagefault.c  |  12 ++
>>   drivers/gpu/drm/xe/xe_pt.c         |  40 ++++-
>>   drivers/gpu/drm/xe/xe_vm.c         |  90 +++++++++--
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 249 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_vm_madvise.h |   3 +
>>   drivers/gpu/drm/xe/xe_vm_types.h   |  11 ++
>>   include/uapi/drm/xe_drm.h          |  44 +++++
>>   10 files changed, 667 insertions(+), 35 deletions(-)
>>
>> -- 
>> 2.43.0
>>
