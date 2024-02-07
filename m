Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016E5C48297
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 01:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C507113058;
	Wed,  7 Feb 2024 01:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cSivAkIi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBE5113058
 for <Intel-Xe@lists.freedesktop.org>; Wed,  7 Feb 2024 01:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707270693; x=1738806693;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ssYVQJfsjPAnzHk0Y74D3W1DkP0N2pJRnSHG6gVMtgQ=;
 b=cSivAkIiCpOZG3qn6hmJdleWx3DVrQh47IEo+WlM79HeidfIkpoSHSco
 G8PXjlbHX08oDGEgECXvvv720O9gZCpEqmPJbnSLSbRtZabr0xihSrzHN
 69/W7D5kvlFU4BnNBY/0VlJ817qW2EYUfEWiB7BhjbybxKX2AnI90xHy3
 HNrLFiu+YOyZEgi+ByUCqCnKUS9bEVkM85heUOuIyXVE6DmM8ymqZn+70
 x7/YVEspKFWa6DOeuB3nTq4JiK5gnDDZrk7H4Ae3iPEXMhLVhNzKUyEtm
 BGB2Q2sJfz0UE2r7vYuJBLPtoRyRYdKb7DZh0uqBnH4/DMFw3q/65cvHF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="26333323"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="26333323"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 17:51:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1239017"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 17:51:33 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 17:51:32 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 17:51:31 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 17:51:31 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 17:51:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bO6wY518vcixgU3R5V7XMsxcj+H80QsXOzJ9dp6d/ogH8GUD57YR4OdAY/AD0zizS8g5WwG+i9acBVFQL7jMTfHOXBrb0NfPizIDSnh70kzDa5oVGzhnTsjXNB8xYFm/7FDez+AcsVkfV+5tgsQvbcKSlBC8p7gUSZH/+dTR6RNIg1xqja/GAf1iPPUtjTc510aZ8pqYg9UbjAq0c8Ngydxwpel+frw/0ycreHdZqI+Tce2QpCyyuFYisg4Fi7yfR1T51yFvSKO1YY1YrIiInQF8myj5aaIpzSGPCkkpOqD60kAegE87PRJ7bXMucfA3LMInw/HzkUTIDzucEFRUKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MA2iWq7iHCJrygYtAwBv1geE+UZTnr5Kby/htqdg64k=;
 b=gO05QcKjGJaJBQUXc89pyp6PTKGDbvyGOEY3pCp+WE0U9heoEzMUYtGNWCLJtIV5JOkcCPMpXDPCmK9R82TsvGzAEzS8/Y10E7Iro+PRVpo+al8bfQuTuSJgz+dSAFDCid4IPAW1O7uTbsRLsqBT8YooSMR2DH0nas1DfHrMM+uXookvFmYGvbFULmA+9cZkmaC2kJIn9EsYqRjtLEJ1CWUldYIO41/1gySvObds3rJKKBAw99zxUa70METLB68HSwSoz5OOcYv/6N68U0kcjeXdW7+HZTTWpHRL3lo8dZGVgAqZuF929tFrO8tuDT0k2mz1L2g2baKgwVoznF5NJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB7430.namprd11.prod.outlook.com (2603:10b6:510:274::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 01:51:27 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7249.035; Wed, 7 Feb 2024
 01:51:27 +0000
Message-ID: <b0a3b750-ffee-4735-8342-036f010eefa4@intel.com>
Date: Tue, 6 Feb 2024 17:51:24 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Port over the slow GuC loading support
 from i915
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20240206201153.2773996-1-John.C.Harrison@Intel.com>
 <20240206201153.2773996-3-John.C.Harrison@Intel.com>
 <4ec5q2znrsevf3ihnzv6vvcztufpioxlwmy6342k7mam2tkq5l@6istqc7flazw>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <4ec5q2znrsevf3ihnzv6vvcztufpioxlwmy6342k7mam2tkq5l@6istqc7flazw>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::17) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd2160d-57d0-4d1d-e2b0-08dc277f4bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mywrL0qah7E0BZ4fsvd2o97/5PCYFnXFMpqFAFwtxUqxOo+aIeR1OQFYQA2sEKSdjIyY0J1bhlF759P1OPwlD6pMwogMqSXVMgH3K4RszVGj8XpoYHdq0zURZR1d5+xd8QFvAlSKmxJ0Td/tYzuq1xmvJF3aKO9zJ1zTTjsQuMh7stsJ7Api5VWO7l0QJyzVUj2CdWVzeiJvTP5/9jX+4LUtLGRW4dMp0QqXfkFGRV0PHnnfqK8mW6cwa6qXD+Nv5H49oWVfuLOlgGiqRNmYEcEMdcG2q5G8wKdinWALanhsdrlBCEAHETK2jRuSuMrJfJ+u27S8u6GGAJdZ4v9yyWg4zLSqsw3o/vk/BVmgm1Hqbu4IYtlUhPTLeNf/ZokgYX/wQOJJHNkF1k68qV898cOBxoqC15knbpRVQYxed8Z5txHt1n3cKPwn4GEXKYuVFZT1XYlmDxlge5YQMGBKcOeiQGlQAMXn4nMmtqy9FUh9FQmUXkjqe9NQv0/eCLFxYaOoq/UC8pooGoDLMLDwfXJhM/mA/vGd2DFGHrJjK7Jcoc01ld3lAERWQnuVFFOXyk9KEs70rWlzYd4GPh6ZHhtieWTjAbyrnahstzNKOMey1KKLZ3OIqZA8lndhruFLEJAJBsGoosmso/sJ/vYXug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(376002)(136003)(39860400002)(230922051799003)(230273577357003)(186009)(64100799003)(1800799012)(451199024)(38100700002)(31686004)(82960400001)(53546011)(6666004)(83380400001)(41300700001)(31696002)(6506007)(2616005)(86362001)(6512007)(26005)(6862004)(4326008)(8676002)(8936002)(36756003)(2906002)(478600001)(30864003)(6486002)(5660300002)(66946007)(316002)(6636002)(37006003)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUFxYzlSY2JTRytHMi84aUZWSUlrVlVlZHI3Q09jM2kwVU0vancwTlRXdnRy?=
 =?utf-8?B?Y1BVU0VMbTQ3MXQ4bHZ6OVhUSElEd0c4d0NPbENZdXltaUVyUmFxNFh4UEpT?=
 =?utf-8?B?RUxiR2dCZmdXckZqcUVSZ2ZNcVM0dWR6UzBSb0N0dVpVbVhXR0xsN3FYNjdi?=
 =?utf-8?B?UXJpRHhZWlhEbTZzYUttc1pDdndieTE5cmcrd2tUVkN4amo2YzZwNHFNcDJz?=
 =?utf-8?B?N0h2cmJoNHJhNHdWdnlpNG5pYmhMTEZTdXVYc00wWHhnWm1aYWIrVklNS2tm?=
 =?utf-8?B?MFQyWVNCQVF4UU0xbW1FakV5WFRWOGF3NkovOGdGbUt4TFlvTUxvNkJjYk1F?=
 =?utf-8?B?Nm1mdEMraklSTnJOUW85VFlJWlV0UzBmUG5rM3lIUXhRRlZidnl1bThhUWxh?=
 =?utf-8?B?NHRYQ21PbmRjdHFiTGM5NEhuRWlBQXpkcDVnU1Q4NjZoeDZyOU1rU0ZWL01W?=
 =?utf-8?B?RFhYd2R5Y2ZMaFQ5Z0hMd3YzcW5ScmpoRGg1ekdTRDB1MWcvZVFXRUlvc0tU?=
 =?utf-8?B?SzJMT1AxeTBzeWlQd2tkMlpZeEhmWTZVOVZyOEJ6TjhGb0JWZGR3S29KVDV1?=
 =?utf-8?B?dkN4ODZYQTNEUDF3TlhpM1h6NVJ2ZjI2NEhVWFFkekZQODJEOElzRFl4Nkxz?=
 =?utf-8?B?TWZOalJNb2pQUGQxb3Bib1UrYXRJejlyUHJybmFzYmJkeEhTZGh1My9aSVAr?=
 =?utf-8?B?YUd2blZNNXZRZ0hJQUg4emZoY1JlaW9NRDVINnNuc3RTeUFYMStObmVNalN5?=
 =?utf-8?B?OWRHK1RqVWEvc1hLcmdXb25tdkdJbTBSSXNzU2g2RGdXYkJKTDVLcVVoSU00?=
 =?utf-8?B?TVhBRUVrZU04NDNlQnFMbVB2bHZXQTZuVVZySUEyUFNxaGx2K3I1RzVLZ0Jj?=
 =?utf-8?B?RXB1QmFJOFRhZVlkTnNDSzBlZG5yZkp2dDlQd3NZRlNhTG1Yb2c0ZjZPS3Nj?=
 =?utf-8?B?MGxQVWNPSjhWZTFSbVROdzRJV1F1NGdETGY0U0Q4T25PVzJnR0hET1R2aGU1?=
 =?utf-8?B?UUFKcm9TV0hIT3ViVGRDWWxjZXBDa0pWRzNnSXo2VFhHeXppYlhhUnY0dHdo?=
 =?utf-8?B?Ri8xNmlBL3NUOG4zUmppbStlRmFockdoRWlGVDFYZ1N1cmpyQnBNQktIQmgz?=
 =?utf-8?B?UTBucEwxWXdRc1BvNm9PQVpQNTFxS0xaTGlPYk1DWnl3d05Rd09HMVg1eXJS?=
 =?utf-8?B?WVJSR1BSNGlGRjR5QUlFUEc3cjM4cVdSbEZ1c1VoOEh3dy95ampnOXc0QzFC?=
 =?utf-8?B?aGE5aTRDUjRNdGRUODZiRVVKaHFQVzBweWtjUXZVekd4VFl2bzhDQTV3dCt6?=
 =?utf-8?B?c0dBUU5RZXZUR0ZORVREVmR0NjdvNzBYL1pXbzJXMVpqRWRrTDdNbVRrK1dO?=
 =?utf-8?B?TW9wNkdCbWdKaElEMEgzeFdOVjZsekhyeUlBRVgyMU9obXNmSEV2SmFkRkw3?=
 =?utf-8?B?YlF4WGZiV0tUbTdxTG1UdU9pQy9EZWhHdERjVXEwVHZFODJtMTE2dW1NYWNS?=
 =?utf-8?B?dnIvRjhVNy9hK2FQd1NOY0FjcEZhekVFd2hRaHI0cFRSdE9VcmdNdk5Dc2Rk?=
 =?utf-8?B?SlAyZFpZRnp3SnpsU21OQ3pBaDE3VDdrSnRKMDJqVFJWSHdzSHZERzVQUFJI?=
 =?utf-8?B?MlF5L2hpT09XZjIweEFjTVFZb1pINzM3RkJEOVp4TnUvYitFTmM2RXFncGdN?=
 =?utf-8?B?UzYwSkRJZnBQM2hxOEhVdTRFL25zcUthRnpDQW9Tc1Q1d0g4T2JWalJsQlpT?=
 =?utf-8?B?c292dy80UFJjdnNPa2c5eUZMTng1cEVBdVIyUk9IR3BLVjBFbTdIVFhQa2Iy?=
 =?utf-8?B?UEtHSWRBcWZENmRCc1JOMDFlVEs1UHdMaDhVVlZiclljbTR5c1hrZUxyMTVt?=
 =?utf-8?B?VVo2YkRoSXBGMHkrOHFnNG1xZUoxZDV6Vm1XNzFtY2JYalBzazhWdkNHRHJa?=
 =?utf-8?B?dUg1NGxLSm9KYlZVMHB4MGtNREltQy9zdy85dFFxZ3ZQZUowcEhoQ2IwRjlt?=
 =?utf-8?B?TDRFMjl6N2szRnZwZEdaQndsTlVHRXpDbWdRMjdxUStZU080azVROFNlNUNY?=
 =?utf-8?B?UzdhNjBNeHFrTHlMN3hPbGlYSDg3SEhxQU9wQmpELy9YRmR3akQ3RjVFUVZt?=
 =?utf-8?B?OFJpZDgvRFg1ZjRtZ1Z2WXRTOXA5MkpoL1ErcEhhYm5OdWpCZTVNYzRhMXlP?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd2160d-57d0-4d1d-e2b0-08dc277f4bf3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 01:51:26.9686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhM6SwIVWemonI3i9PLmoJMtNhEL/Cb1h6GZcNtr3lEtuIdTuCEUT5QyGlDEkaDCGoXn1COj2ElHdCw5KjaBF30ZQ9+7Wm66ys2I663smSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7430
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

On 2/6/2024 13:36, Lucas De Marchi wrote:
> On Tue, Feb 06, 2024 at 12:11:51PM -0800, John.C.Harrison@Intel.com 
> wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> GuC loading can take longer than it is supposed to for various
>> reasons. So add in the code to cope with that and to report it when it
>> happens. There are also many different reasons why GuC loading can
>> fail, so add in the code for checking for those and for reporting
>> issues in a meaningful manner rather than just hitting a timeout and
>> saying 'fail: status = %x'.
>>
>> Also, remove the 'FIXME' comment about an i915 bug that has never been
>> applicable to Xe!
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>> drivers/gpu/drm/xe/abi/guc_errors_abi.h |  26 +++-
>> drivers/gpu/drm/xe/regs/xe_guc_regs.h   |   2 +
>> drivers/gpu/drm/xe/xe_guc.c             | 197 +++++++++++++++++++-----
>> drivers/gpu/drm/xe/xe_macros.h          |  32 ++++
>> 4 files changed, 214 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h 
>> b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>> index ec83551bf9c0..d0b5fed6876f 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
>> @@ -7,8 +7,12 @@
>> #define _ABI_GUC_ERRORS_ABI_H
>>
>> enum xe_guc_response_status {
>> -    XE_GUC_RESPONSE_STATUS_SUCCESS = 0x0,
>> -    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL = 0xF000,
>> +    XE_GUC_RESPONSE_STATUS_SUCCESS                      = 0x0,
>> +    XE_GUC_RESPONSE_NOT_SUPPORTED                       = 0x20,
>> +    XE_GUC_RESPONSE_NO_ATTRIBUTE_TABLE                  = 0x201,
>> +    XE_GUC_RESPONSE_NO_DECRYPTION_KEY                   = 0x202,
>> +    XE_GUC_RESPONSE_DECRYPTION_FAILED                   = 0x204,
>> +    XE_GUC_RESPONSE_STATUS_GENERIC_FAIL                 = 0xF000,
>> };
>>
>> enum xe_guc_load_status {
>> @@ -17,6 +21,9 @@ enum xe_guc_load_status {
>>     XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH       = 0x02,
>>     XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH       = 0x03,
>>     XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE      = 0x04,
>> +    XE_GUC_LOAD_STATUS_HWCONFIG_START                   = 0x05,
>> +    XE_GUC_LOAD_STATUS_HWCONFIG_DONE                    = 0x06,
>> +    XE_GUC_LOAD_STATUS_HWCONFIG_ERROR                   = 0x07,
>>     XE_GUC_LOAD_STATUS_GDT_DONE                         = 0x10,
>>     XE_GUC_LOAD_STATUS_IDT_DONE                         = 0x20,
>>     XE_GUC_LOAD_STATUS_LAPIC_DONE                       = 0x30,
>> @@ -34,4 +41,19 @@ enum xe_guc_load_status {
>>     XE_GUC_LOAD_STATUS_READY                            = 0xF0,
>> };
>>
>> +enum xe_bootrom_load_status {
>> +    XE_BOOTROM_STATUS_NO_KEY_FOUND                      = 0x13,
>> +    XE_BOOTROM_STATUS_AES_PROD_KEY_FOUND                = 0x1A,
>> +    XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE            = 0x2B,
>> +    XE_BOOTROM_STATUS_RSA_FAILED                        = 0x50,
>> +    XE_BOOTROM_STATUS_PAVPC_FAILED                      = 0x73,
>> +    XE_BOOTROM_STATUS_WOPCM_FAILED                      = 0x74,
>> +    XE_BOOTROM_STATUS_LOADLOC_FAILED                    = 0x75,
>> +    XE_BOOTROM_STATUS_JUMP_PASSED                       = 0x76,
>> +    XE_BOOTROM_STATUS_JUMP_FAILED                       = 0x77,
>> +    XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED               = 0x79,
>> +    XE_BOOTROM_STATUS_MPUMAP_INCORRECT                  = 0x7A,
>> +    XE_BOOTROM_STATUS_EXCEPTION                         = 0x7E,
>> +};
>> +
>> #endif
>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> index 92320bbc9d3d..a30e179e662e 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> @@ -40,6 +40,8 @@
>> #define   GS_BOOTROM_JUMP_PASSED REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>> #define   GS_MIA_IN_RESET            REG_BIT(0)
>>
>> +#define GUC_HEADER_INFO                XE_REG(0xc014)
>> +
>> #define GUC_WOPCM_SIZE                XE_REG(0xc050)
>> #define   GUC_WOPCM_SIZE_MASK            REG_GENMASK(31, 12)
>> #define   GUC_WOPCM_SIZE_LOCKED            REG_BIT(0)
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 868208a39829..82514d395704 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -16,6 +16,7 @@
>> #include "xe_device.h"
>> #include "xe_force_wake.h"
>> #include "xe_gt.h"
>> +#include "xe_gt_freq.h"
>> #include "xe_guc_ads.h"
>> #include "xe_guc_ct.h"
>> #include "xe_guc_hwconfig.h"
>> @@ -427,58 +428,172 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>>     return 0;
>> }
>>
>> +/*
>> + * Read the GuC status register (GUC_STATUS) and store it in the
>> + * specified location; then return a boolean indicating whether
>> + * the value matches either completion or a known failure code.
>> + *
>> + * This is used for polling the GuC status in an xe_wait_for()
>> + * loop below.
>> + */
>> +static inline bool guc_load_done(struct xe_gt *gt, u32 *status, bool 
>> *success)
>
> bogus inline
>
>> +{
>> +    u32 val = xe_mmio_read32(gt, GUC_STATUS);
>> +    u32 uk_val = REG_FIELD_GET(GS_UKERNEL_MASK, val);
>> +    u32 br_val = REG_FIELD_GET(GS_BOOTROM_MASK, val);
>> +
>> +    *status = val;
>> +    switch (uk_val) {
>> +    case XE_GUC_LOAD_STATUS_READY:
>> +        *success = true;
>> +        return true;
>> +
>> +    case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
>> +    case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
>> +    case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
>> +    case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
>> +    case XE_GUC_LOAD_STATUS_DPC_ERROR:
>> +    case XE_GUC_LOAD_STATUS_EXCEPTION:
>> +    case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>> +    case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>> +    case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>> +        *success = false;
>> +        return true;
>> +    }
>> +
>> +    switch (br_val) {
>> +    case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>> +    case XE_BOOTROM_STATUS_RSA_FAILED:
>> +    case XE_BOOTROM_STATUS_PAVPC_FAILED:
>> +    case XE_BOOTROM_STATUS_WOPCM_FAILED:
>> +    case XE_BOOTROM_STATUS_LOADLOC_FAILED:
>> +    case XE_BOOTROM_STATUS_JUMP_FAILED:
>> +    case XE_BOOTROM_STATUS_RC6CTXCONFIG_FAILED:
>> +    case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
>> +    case XE_BOOTROM_STATUS_EXCEPTION:
>> +    case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>> +        *success = false;
>> +        return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +/*
>> + * Wait for the GuC to start up.
>> + *
>> + * Measurements indicate this should take no more than 20ms 
>> (assuming the GT
>> + * clock is at maximum frequency). However, thermal throttling and 
>> other issues
>> + * can prevent the clock hitting max and thus making the load take 
>> significantly
>> + * longer. Indeed, if the GT is clamped to minimum frequency then 
>> the load times
>> + * can be in the seconds range. As, there is a limit on how long an 
>> individual
>> + * usleep_range() can wait for, the wait is wrapped in a loop. The 
>> loop count
>> + * is increased for debug builds so that problems can be detected 
>> and analysed.
>> + * For release builds, the timeout is kept short so that user's 
>> don't wait
>> + * forever to find out there is a problem. In either case, if the 
>> load took longer
>> + * than is reasonable even with some 'sensible' throttling, then 
>> flag a warning
>> + * because something is not right.
>> + *
>> + * Note that the only reason an end user should hit the timeout is 
>> in case of
>> + * extreme thermal throttling. And a system that is that hot during 
>> boot is
>> + * probably dead anyway!
>> + */
>> +#if defined(CONFIG_DRM_XE_DEBUG)
>> +#define GUC_LOAD_RETRY_LIMIT    20
>> +#else
>> +#define GUC_LOAD_RETRY_LIMIT    3
>
> why? so developers don't reproduce the issues happening on normal
> system?
Not sure I follow.

For CI runs, we want to cope with as much as possible. Anything above 
the limit below will be flagged as a CI failure, but if a load were to 
take 4 seconds then having the driver actually complete the load and 
keep going to run further testing is better than it aborting the load 
and killing the entire CI run. Especially given Xe's current penchant 
for causing kernel panics if something fails to start correctly.

Whereas, for end users, we want a timeout that is short enough for them 
to not reach for the power button because their system has hung. As 
noted, the load should never be in the seconds range unless something is 
really badly wrong. But that's still not something we want to force on 
an end user.


>> +#endif
>> +#define GUC_LOAD_TIME_WARN      200
>> +
>> static int guc_wait_ucode(struct xe_guc *guc)
>> {
>> -    struct xe_device *xe = guc_to_xe(guc);
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +    struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
>> +    ktime_t before, after, delta;
>> +    bool success;
>>     u32 status;
>> -    int ret;
>> +    int ret, count;
>> +    u64 delta_ms;
>> +    u32 before_freq;
>> +
>> +    before_freq = xe_guc_pc_get_act_freq(guc_pc);
>> +    before = ktime_get();
>> +    for (count = 0; count < GUC_LOAD_RETRY_LIMIT; count++) {
>> +        ret = xe_wait_for(guc_load_done(gt, &status, &success), 1000 
>> * 1000);
>
> this will need to be rewritten without this function rather than ported
> over from i915.
>
Re-written how?

>> +        if (!ret || !success)
>> +            break;
>> +
>> +        xe_gt_dbg(gt, "load still in progress, count = %d, freq = 
>> %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
>> +              count, xe_guc_pc_get_act_freq(guc_pc),
>> +              xe_guc_pc_get_act_freq(guc_pc), status,
>> +              REG_FIELD_GET(GS_BOOTROM_MASK, status),
>> +              REG_FIELD_GET(GS_UKERNEL_MASK, status));
>> +    }
>> +    after = ktime_get();
>> +    delta = ktime_sub(after, before);
>> +    delta_ms = ktime_to_ms(delta);
>> +    if (ret || !success) {
>> +        u32 ukernel = REG_FIELD_GET(GS_UKERNEL_MASK, status);
>> +        u32 bootrom = REG_FIELD_GET(GS_BOOTROM_MASK, status);
>> +
>> +        xe_gt_info(gt, "load failed: status = 0x%08X, time = %lldms, 
>> freq = %dMHz (req %dMHz), ret = %d\n",
>> +               status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
>> +               xe_guc_pc_get_act_freq(guc_pc), ret);
>> +        xe_gt_info(gt, "load failed: status: Reset = %d, BootROM = 
>> 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>> +               REG_FIELD_GET(GS_MIA_IN_RESET, status),
>> +               bootrom, ukernel,
>> +               REG_FIELD_GET(GS_MIA_MASK, status),
>> +               REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>> +
>> +        switch (bootrom) {
>> +        case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>> +            xe_gt_info(gt, "invalid key requested, header = 0x%08X\n",
>> +                   xe_mmio_read32(gt, GUC_HEADER_INFO));
>> +            ret = -ENOEXEC;
>> +            break;
>>
>> -    /*
>> -     * Wait for the GuC to start up.
>> -     * NB: Docs recommend not using the interrupt for completion.
>> -     * Measurements indicate this should take no more than 20ms
>> -     * (assuming the GT clock is at maximum frequency). So, a
>> -     * timeout here indicates that the GuC has failed and is unusable.
>> -     * (Higher levels of the driver may decide to reset the GuC and
>> -     * attempt the ucode load again if this happens.)
>> -     *
>> -     * FIXME: There is a known (but exceedingly unlikely) race 
>> condition
>> -     * where the asynchronous frequency management code could reduce
>> -     * the GT clock while a GuC reload is in progress (during a full
>> -     * GT reset). A fix is in progress but there are complex locking
>> -     * issues to be resolved. In the meantime bump the timeout to
>> -     * 200ms. Even at slowest clock, this should be sufficient. And
>> -     * in the working case, a larger timeout makes no difference.
>> -     */
>> -    ret = xe_mmio_wait32(guc_to_gt(guc), GUC_STATUS, GS_UKERNEL_MASK,
>> -                 FIELD_PREP(GS_UKERNEL_MASK, XE_GUC_LOAD_STATUS_READY),
>> -                 200000, &status, false);
>> +        case XE_BOOTROM_STATUS_RSA_FAILED:
>> +            xe_gt_info(gt, "firmware signature verification failed\n");
>> +            ret = -ENOEXEC;
>> +            break;
>>
>> -    if (ret) {
>> -        struct drm_device *drm = &xe->drm;
>> -
>> -        drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
>> -        drm_info(drm, "GuC load failed: status: Reset = %d, BootROM 
>> = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>> -             REG_FIELD_GET(GS_MIA_IN_RESET, status),
>> -             REG_FIELD_GET(GS_BOOTROM_MASK, status),
>> -             REG_FIELD_GET(GS_UKERNEL_MASK, status),
>> -             REG_FIELD_GET(GS_MIA_MASK, status),
>> -             REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>> -
>> -        if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
>> -            drm_info(drm, "GuC firmware signature verification 
>> failed\n");
>> +        case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>> +            xe_gt_info(gt, "firmware production part check failure\n");
>>             ret = -ENOEXEC;
>> +            break;
>>         }
>>
>> -        if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
>> -            XE_GUC_LOAD_STATUS_EXCEPTION) {
>> -            drm_info(drm, "GuC firmware exception. EIP: %#x\n",
>> -                 xe_mmio_read32(guc_to_gt(guc),
>> -                        SOFT_SCRATCH(13)));
>> +        switch (ukernel) {
>> +        case XE_GUC_LOAD_STATUS_EXCEPTION:
>> +            xe_gt_info(gt, "firmware exception. EIP: %#x\n",
>> +                   xe_mmio_read32(gt, SOFT_SCRATCH(13)));
>>             ret = -ENXIO;
>> +            break;
>> +
>> +        case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>> +            xe_gt_info(gt, "illegal register in save/restore 
>> workaround list\n");
>> +            ret = -EPERM;
>> +            break;
>> +
>> +        case XE_GUC_LOAD_STATUS_HWCONFIG_START:
>> +            xe_gt_info(gt, "still extracting hwconfig table.\n");
>> +            ret = -ETIMEDOUT;
>> +            break;
>>         }
>> +
>> +        /* Uncommon/unexpected error, see earlier status code print 
>> for details */
>> +        if (ret == 0)
>> +            ret = -ENXIO;
>> +    } else if (delta_ms > GUC_LOAD_TIME_WARN) {
>> +        xe_gt_warn(gt, "excessive init time: %lldms! [status = 
>> 0x%08X, count = %d, ret = %d]\n",
>> +               delta_ms, status, count, ret);
>> +        xe_gt_warn(gt, "excessive init time: [freq = %dMHz, before = 
>> %dMHz, perf_limit_reasons = 0x%08X]\n",
>> +               xe_guc_pc_get_act_freq(guc_pc), before_freq,
>> +               xe_read_perf_limit_reasons(gt));
>>     } else {
>> -        drm_dbg(&xe->drm, "GuC successfully loaded");
>> +        xe_gt_dbg(gt, "init took %lldms, freq = %dMHz, before = 
>> %dMHz, status = 0x%08X, count = %d, ret = %d\n",
>> +              delta_ms, xe_guc_pc_get_act_freq(guc_pc),
>> +              before_freq, status, count, ret);
>>     }
>>
>>     return ret;
>> diff --git a/drivers/gpu/drm/xe/xe_macros.h 
>> b/drivers/gpu/drm/xe/xe_macros.h
>> index daf56c846d03..eac8f2c9fba5 100644
>> --- a/drivers/gpu/drm/xe/xe_macros.h
>> +++ b/drivers/gpu/drm/xe/xe_macros.h
>> @@ -15,4 +15,36 @@
>>                 "Ioctl argument check failed at %s:%d: %s", \
>>                 __FILE__, __LINE__, #cond), 1))
>>
>> +/*
>> + * xe_wait_for - magic wait macro
>> + *
>> + * Macro to help avoid open coding check/wait/timeout patterns. Note 
>> that it's
>> + * important that we check the condition again after having timed 
>> out, since the
>> + * timeout could be due to preemption or similar and we've never had 
>> a chance to
>> + * check the condition before the timeout.
>> + */
>> +#define xe_wait_for(COND, US) ({ \
>
> we don't want an wait for on arbitrary condition. At most we wait on a
> register to become something, and for that we already have
> xe_mmio_wait32().
Except that function is insufficient in this situation. What we need to 
wait on is a status enum register, not a bitfield flag. Some values are 
intermediate steps, some are fatal end conditions, one is a successful 
end condition. Simply waiting for a single value is useless. And 
expanding out the macro to have the wait loop inline in the GuC code is 
against the kernel coding principle of using helpers for anything that 
could sensibly be a helper function.

John.

>
> Lucas De Marchi
>
>> +    const ktime_t end__ = ktime_add_ns(ktime_get_raw(), 1000ll * 
>> (US)); \
>> +    long wait__ = 10; /* recommended min for usleep is 10 us */    \
>> +    int ret__;                            \
>> +    might_sleep();                            \
>> +    for (;;) {                            \
>> +        const bool expired__ = ktime_after(ktime_get_raw(), end__); \
>> +        /* Guarantee COND check prior to timeout */        \
>> +        barrier();                        \
>> +        if (COND) {                        \
>> +            ret__ = 0;                    \
>> +            break;                        \
>> +        }                            \
>> +        if (expired__) {                    \
>> +            ret__ = -ETIMEDOUT;                \
>> +            break;                        \
>> +        }                            \
>> +        usleep_range(wait__, wait__ * 2);            \
>> +        if (wait__ < (1000))                    \
>> +            wait__ <<= 1;                    \
>> +    }                                \
>> +    ret__;                                \
>> +})
>> +
>> #endif
>> -- 
>> 2.43.0
>>

