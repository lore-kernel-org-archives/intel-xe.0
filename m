Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85F1C54FB9
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 19:30:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED2910E780;
	Fri, 17 Nov 2023 19:30:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4035110E76A
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 19:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700249426; x=1731785426;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E1leO8Tcnr1i5zAIGfxFAQs8bEHaZrb9J/duvvPnEx8=;
 b=YxbqVbpahgjfKcB6/QU6tKBQS1pDH3RnV+AXZZqa4olpoOCYHqVrFvLD
 OfjWgQaccA8keeEKe15P1nqFD9BixwPqEF9EXS/g9C65zAG+JLln7kK0X
 lwr2ps28kkgK6LknK8XWF/hvOH9WtTfPb2iwowBJ53n2zvl/0BwqdfNeN
 u3hniVDYKKrOwlFF/APMCNV6DFRFKHgXzV8MNnucLmTRC+jbUHKhhYywX
 XSw685TWR6eUv4yr0zxsYCh8j0Sjh2wkLVEavTvmgr/m1DRaBKhfHpZU4
 7tw8V7oxE2i+oqwgxThZF2kldoviT99cFN9v0YhQ1kdwCRf1rqQ1TWhfE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="370706085"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="370706085"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 11:30:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="6936433"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 11:30:26 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 11:30:24 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 11:30:24 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 11:30:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccj273xjC0O0fAVnArU29i//l0YM4zxL1TeBkCTn1IILx7RA7hbNcnKfKfY1aXyxg5Lt3R4EwnIfXx18OEWms3hnyBCwq57+r9aplb+AEsckSXgdlofMWLg6klD2yQ5NdbBe10iR7CA5ivSktl37Hw7MQSDwsRa+9+F+Od1Y7JY4arkzuVFOVn/rVutB6bRVHh25IAFjeClWdDGJIruplx52fpj883zPOi0KhD7PofzPl29vV9uTUbyfSKvT3qjK8LZjku8EVD4Id/kSfg2LjXiH3TFNv7OADLlO2eOKCSxzOwCFUuTvKPdnGjrOiYjzNNDCAG4sEKAUQl5T3x0ELw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86n4cFEwB8M/UA/2rcmvYbUOB7Vbwkh8G3F57AplEGk=;
 b=GwxUOfxfMyqoSs3MqyMhLAn6Rj9g4vTp/Kku/WPEDJzyt8BOvRHAqlNr4PGU8hvu0EkIIsnc55M4Ldpecgu61SIswFw3onjcPChg2+ftWz+XL/uH6DZrIPy/qQ5fmubwL1UsWbz166fTdcNH1h/HcbtfFRienXXvnMEXjy71piP3MLjjuL9wivebumUQDNUIdwvWHFCl1GZrdhnwy4/yZgKgt0LDIWNQpKN4GpaYgllfPBO690XtXutsb6a1ZL7gZBrSGVgprBzjNiAguQSpHBKAlBQ9PrNcTWh9qmP5YcUfW2dy99RmhY11L8Wi/QuNYxrSkboGjhmXBsNE9CAXmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 19:30:17 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e%6]) with mapi id 15.20.7002.015; Fri, 17 Nov 2023
 19:30:17 +0000
Message-ID: <6b8e0b45-fb47-46b8-9738-c06a89dfad87@intel.com>
Date: Fri, 17 Nov 2023 11:30:14 -0800
User-Agent: Mozilla Thunderbird
To: Matthew Brost <matthew.brost@intel.com>
References: <20231115031508.173140-1-matthew.brost@intel.com>
 <8f88e133-6595-4cdd-8b81-11fd4e74e85d@intel.com>
 <ZVck+vKWY1o0/3i6@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <ZVck+vKWY1o0/3i6@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0056.namprd11.prod.outlook.com
 (2603:10b6:a03:80::33) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|CO1PR11MB5089:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a10e6c-70e6-4838-905d-08dbe7a3a100
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1tMOW0FdUJOQ54Z1tKvsqIkgiApwmMmbOVRrRgrIFPcwHm0XF2/v5KEhv4k2LyUe0kACRFUedMENSLMDeLVn2mTbImyZcU5ZdztPx6mL0m/iLJG9gV+AiJ0ugGrPeHg+Xs//+TslQPm4RIBqRhBkbV8szd/U7CzBHWGvnww6HyZjyGppQqpqT9PwdY3socx27QflV2gztyh8gQpg3g0XV9P5r2Zh0D2xiPznGPm2KNEKddQ9j0QmIC1OEh+GiQXQ1DU3N49jtZCt1h3dK/qDwy+E6epKAlg3jLmT/ej9tlBOcWlpA0i2dZSpOUYkgOi5e1pgVj+jgO5CMalqIu8VET01P+o2IM+cINxFKvCUSYy85Pu0owrk0dZRWIgfzerMJca3uDtYW6pS/XcPKqjHHhtgXIL8Gwrx+bZphCSu5AInKPWoZfuiqPM6OdxNBxl4H05YljDdnlDRwyuhHiwsX/5NVexn5EylNcfLO50iNxARcBh0Ci4Msve4xAnqP73RZyBZZqPDmqzK15vUK0g1c5U/qHSp97cZQ8DYE/EFzcVZ8YJVVAfqOSOJ3vcFhlZJMlFNicpgYRJ31OcXoKHDaGDRNLJWRrbbB8GoBSqk+X0q5u8q65J6SfJPM7iqSxyydlmaY9T69SDT3isucBmOHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(39860400002)(136003)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(53546011)(478600001)(31686004)(83380400001)(6666004)(2616005)(6512007)(6506007)(26005)(6486002)(6636002)(316002)(66946007)(37006003)(66476007)(66556008)(8676002)(8936002)(5660300002)(38100700002)(2906002)(86362001)(31696002)(82960400001)(6862004)(4326008)(41300700001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THZPaEJwMVhlTTM5aFJhZDdCVmRTL3FsUmhBZzdBUURLQVIrOWphc0s1bWd6?=
 =?utf-8?B?QkxvRmxuYWJPaHZuTmlxZmhQNWRQOVBHV1daSmNPTkdsWlRUaWwxU1BQMitL?=
 =?utf-8?B?TjZueEUyZzFQcGlMNktZNC9ycjdJKzdtNUJVWTc3aCsvd3RvOXlZUVdDOXRi?=
 =?utf-8?B?bnRHMEJ1U0ZyWlRpN29SK0VoRUIxcFdwNEN3KzF6c0YvYjRCUVEvNE9EVmE4?=
 =?utf-8?B?MkEvRE1xT2lpRDNkY3Y1TGlsZExIbGhneHRxc2JZL1BuYUNQd1pIbmRaQktz?=
 =?utf-8?B?T3d3TzF1dVRyR2JRZHdXNDhkWlducllqT1grd1oydm9lRitXb0lwVk52WEE5?=
 =?utf-8?B?OEhDUnpHaHdjcmt1M2pkNnJHYUZpT1NGQ1BkYkp5a2orN3gybkl5T1BhSWhu?=
 =?utf-8?B?OVNjZjJrWk10aGptTlV4WFY4eHc4TWlPZjdsUnhqaDFnK3hHWDAySHFDamFW?=
 =?utf-8?B?ZUNIdDZGc0xmaldCRXliUWFJY043K3pPUk1nb09pSDlGcXlVZWIwRms4RmN5?=
 =?utf-8?B?ZTFFSEFLL2k1Nm9UVk1RL2hMenhDTEQ5L3hQc0RlU2dKQkdTWXNQb1BqQzQy?=
 =?utf-8?B?RFNxdlZFcG1tNDc5R0JNWDdvT3ZHSi93UDhwWDh3MnhrZEtuUFY3dWhMUG5F?=
 =?utf-8?B?VVpKV2lDSjZwZzVqSlhYalIyMFE4NUFHLzRCZE9kMEpYayt1WCtIVUV2anE1?=
 =?utf-8?B?SEpIUVNrSXVsVHlRMGg1VEVacHZJV3EwanJmYjBmMTNuS3JBNmo3dmtHS3Zz?=
 =?utf-8?B?UnVSLzVMOVhRdk9WQUdYMWhCRU4xL0ZwZG8wNE1ISmR3cjRkdThOQVF1TjZ6?=
 =?utf-8?B?elRaVnNUUXB5M3ZiTEtCcFFqeDhBZXlWWGkwWUF5ZmMwdGlBQk9sL2VpZ3h0?=
 =?utf-8?B?aDFxbExIKzR1ZU8wbEorcGU0bmVWSjVSNUVsNnNsTk5TNmh5RldwS05nVlNO?=
 =?utf-8?B?RlFWWEtlZUV1elo1Q0NCZDRZbFUybUd4WTlyTUIvdXJjdUQyWDhMQ0dra3Z2?=
 =?utf-8?B?MGQ2WFJqWHNnUVVBTUNhV3hHNlBvWkl3OTVQQko2SFI3eVlyTXIyVjdCRCtH?=
 =?utf-8?B?MEZXcHNGMndlZDh4ZktoM2N0a2lQRGxKMEoyTjdqc1hUMzBwQzg2cnlFUHRB?=
 =?utf-8?B?Z1R2WG00YU5hN1lZOGNkM1liYzQ0d1psdjZBc3FvbHUzT2g5VThYMCtFTnR4?=
 =?utf-8?B?eGt0MFJ5czhUS2tIbkVGejlGZlpQY1dPSlltZmdNZjN6WlVyUmllbDZwd09I?=
 =?utf-8?B?QVV3MEg1V1ZqZEZTcVV5VG9ocVZlS2JuUHlnUXJEMTVNNW9QRlZwa0VGdW5i?=
 =?utf-8?B?SVJ2cGxwM3E4QVJRVUFyYmRhWGJEak0yWEZ4N2FmQ0xSZ05DRk5ZK0xSVmdr?=
 =?utf-8?B?cjVJWTFuRHIwT0xyR0h5NmZRb2FPNFBaa2tOc0ZwZTJpa2FPYzUzeVNaeGJt?=
 =?utf-8?B?WnpkZTNKK2xnZ3hseXdKdUVrZ1hqYm5iaTRONlFaSy9oSGRFNUJrRGZvcndP?=
 =?utf-8?B?eWIwMVdKN2p2VU1oS0ZnN3RUS1NWYmJSWHB2UkpjaExlejBXL2RzanptSGMr?=
 =?utf-8?B?d3AwdU9nVnZCQkJwUG5nSXFGd3ZRamVhL0dmVzkvTytMRnlxbExhQ1B6M2Vj?=
 =?utf-8?B?RCtaOEZVME1ZTWplYXlNWkJ1d3NtME1yT2s1a0wxTFpJQWJMTUE2MmFLdUhk?=
 =?utf-8?B?a3NEVFcweGpWbm9vbUpES2pPWnVvT0R3TDRmTy9va1d5ak9RMldaeGRpZzhn?=
 =?utf-8?B?eU1SemtpVWY1QnhaTnY0cGFLVlhpNFE3QXRmMWhyVkcxVmh4blNNNVpVWEll?=
 =?utf-8?B?UGRpa1FWMG16aU5EVzhiaEIrT3h4NERGaW9jODFhbGgrQUQvVWtWMUpTUmxL?=
 =?utf-8?B?YTIzSmtUTGkrUGJUOHlrSm9ZbTFUaEFEL3FwYnlDalhUb3haaytGZ2VZZHhk?=
 =?utf-8?B?ZEl6S0p6N2dzVEUvT25CU1JOaGhiaFVxQnZrMnZtQ0xYN2U4RmVDeDN2ZkNj?=
 =?utf-8?B?eFBGQnd6Nlc5RllvK0lrSysyWmxsU1JKa2pZdlltUEVzVmVvdFJrZ2xJb3Z4?=
 =?utf-8?B?bEFMMENVREw5N05xajRodDFGMHpXMVkwUVlaejNTQXAwT1hDZjliT05QYjJj?=
 =?utf-8?Q?ak7Ag5eyFnl4FDdFExelSGrHp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a10e6c-70e6-4838-905d-08dbe7a3a100
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 19:30:17.1429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NcmOvvwN7PxYvCId8uDaELHRoaRZJMpMgJ7xci0R1NNAmo6kI6UC74CmV0mJj1hbce7dFKk0gJGq5+PJBqcXxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5089
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Only set xe_vma_op.map fields for
 GPUVA map operations
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 11/17/2023 12:31 AM, Matthew Brost wrote:
> On Thu, Nov 16, 2023 at 11:57:09AM -0800, Welty, Brian wrote:
>>
>>
>> On 11/14/2023 7:15 PM, Matthew Brost wrote:
>>> XE_VM_BIND_OP_MAP_* IOCTL operations can result in GPUVA unmap, remap,
>>> or map operations in vm_bind_ioctl_ops_create. The xe_vma_op.map fields
>>> are blindly set which is incorrect for GPUVA unmap or remap operations.
>>> Fix this by only setting xe_vma_op.map for GPUVA map operations. Also
>>> restructure a bit vm_bind_ioctl_ops_create to make the code a bit more
>>> readable.
>>>
>>> Reported-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
>>> Signec-off-by: Matthew Brost <matthew.brost@intel.com>
>>
>> Typo in your signed-off !
>>
> 
> Yep, will fix.
> 
>> One comment below.
>>
>>> ---
>>>    drivers/gpu/drm/xe/xe_vm.c | 59 ++++++++++++--------------------------
>>>    1 file changed, 18 insertions(+), 41 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index d45f4f1d490f..1049869b5a6f 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -2187,42 +2187,12 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>
>>
>> Looks like you can trim the arguments to this function....
>> At a glance, looks like flags, tile_mask, and region no longer need to be
>> passed.
>>
> 
> These are still used at the bottom of the function...

Oops.  I read the patch as if you had moved that blob of code at the end 
into the caller for some reason....  either way would have worked.

Reviewed-by: Brian Welty <brian.welty@intel.com>



>   
>> -Brian
>>
>>
>>>    	case XE_VM_BIND_OP_MAP_USERPTR:
>>>    		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
>>>    						  obj, bo_offset_or_userptr);
>>> -		if (IS_ERR(ops))
>>> -			return ops;
>>> -
>>> -		drm_gpuva_for_each_op(__op, ops) {
>>> -			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>>> -
>>> -			op->tile_mask = tile_mask;
>>> -			op->map.immediate =
>>> -				flags & XE_VM_BIND_FLAG_IMMEDIATE;
>>> -			op->map.read_only =
>>> -				flags & XE_VM_BIND_FLAG_READONLY;
>>> -			op->map.is_null = flags & XE_VM_BIND_FLAG_NULL;
>>> -		}
>>>    		break;
>>>    	case XE_VM_BIND_OP_UNMAP:
>>>    		ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
>>> -		if (IS_ERR(ops))
>>> -			return ops;
>>> -
>>> -		drm_gpuva_for_each_op(__op, ops) {
>>> -			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>>> -
>>> -			op->tile_mask = tile_mask;
>>> -		}
>>>    		break;
>>>    	case XE_VM_BIND_OP_PREFETCH:
>>>    		ops = drm_gpuvm_prefetch_ops_create(&vm->gpuvm, addr, range);
>>> -		if (IS_ERR(ops))
>>> -			return ops;
>>> -
>>> -		drm_gpuva_for_each_op(__op, ops) {
>>> -			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>>> -
>>> -			op->tile_mask = tile_mask;
>>> -			op->prefetch.region = region;
>>> -		}
>>>    		break;
>>>    	case XE_VM_BIND_OP_UNMAP_ALL:
>>>    		xe_assert(vm->xe, bo);
>>> @@ -2232,19 +2202,13 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>>    			return ERR_PTR(err);
>>>    		ops = drm_gpuvm_gem_unmap_ops_create(&vm->gpuvm, obj);
>>>    		xe_bo_unlock(bo);
>>> -		if (IS_ERR(ops))
>>> -			return ops;
>>> -
>>> -		drm_gpuva_for_each_op(__op, ops) {
>>> -			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>>> -
>>> -			op->tile_mask = tile_mask;
>>> -		}
>>>    		break;
>>>    	default:
>>>    		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>>>    		ops = ERR_PTR(-EINVAL);
>>>    	}
>>> +	if (IS_ERR(ops))
>>> +		return ops;
>>>    #ifdef TEST_VM_ASYNC_OPS_ERROR
>>>    	if (operation & FORCE_ASYNC_OP_ERROR) {
>>> @@ -2255,9 +2219,22 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>>    	}
>>>    #endif
>>> -	if (!IS_ERR(ops))
>>> -		drm_gpuva_for_each_op(__op, ops)
>>> -			print_op(vm->xe, __op);
>>> +	drm_gpuva_for_each_op(__op, ops) {
>>> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>>> +
>>> +		op->tile_mask = tile_mask;
>>> +		if (__op->op == DRM_GPUVA_OP_MAP) {
>>> +			op->map.immediate =
>>> +				flags & XE_VM_BIND_FLAG_IMMEDIATE;
>>> +			op->map.read_only =
>>> +				flags & XE_VM_BIND_FLAG_READONLY;
>>> +			op->map.is_null = flags & XE_VM_BIND_FLAG_NULL;
>>> +		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>>> +			op->prefetch.region = region;
>>> +		}
> 
> Here is the use od flags, tile_mask, and region.
> 
> Matt
> 
>>> +
>>> +		print_op(vm->xe, __op);
>>> +	}
>>>    	return ops;
>>>    }
