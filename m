Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5351BEB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 16:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295A210E6C4;
	Fri, 21 Jul 2023 16:55:44 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F22610E6C4
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 16:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689958542; x=1721494542;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lpKIeY9ZE0zs6d3TGY+zCMmT6Uef8F5KwxY/7ojbM/I=;
 b=MOkZXUIUMQpcfG9fMqZDbjFscMyn+6YWJyMNv8VLeVayEOGQmxLqaPA6
 ufjKomrjt7dtuer5iGFDA/0z3h7elM9FNP8tMBvvqccqr/sQxkD5YiKpj
 cFoDqrBg/E8OhJEnyVFEuyWLmEe7H4YrXRPqL9exAkBNtlaPyWtOiHkGH
 1NKXNPAvNIwjt2v5A7s5c3Tb1PmwGP6kF+Wu+jhaCfJL5prtWDg4Emx/0
 yfH149EuztgHz/EnTzsCC3NSlu5L0zttcjVWSy7cFgqxTqgNkXnC5ZaMQ
 VjIeqZ1Ko9itkJuAjXbLbiSZy3WUIxNAzYox6TiYy7jpIMojd1VQXckX1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="351950577"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="351950577"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 09:55:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="898764436"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="898764436"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 21 Jul 2023 09:55:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 09:55:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 09:55:41 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 09:55:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLwXRuhWy1q9dETdoQUDQ+lWKPUKqhacGToSAl3SAWtV1eHURSYgAv0paXWk9mrPPz5/ZsEkynfBK0xDLLtnJLjf5m4jngVsowFhTtJSiy7uRltKm2/b/Oaxtrq//LiBlVSBLZi61nQTPn0fsgwzis1EGwDL5pCTsOfBFg5W7qeEpSNW8H24oD1DgybGI7DJVEYie9iUcQtBMXVxYvhZYtM55NjGrGl296NKKpynrgBGfJFtELCwHyXG0M3cXTJMTWx9NqgU5Asa8gwbJoiPUjYfR6891kzK+rA/9x0EolP27PfHIv7R0/vxV5BRxP1htVXiFX+3asQeYx4KEck0Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlH+hLXILkxAgqaKycC2g+jf3dxZCTRzLbfivaqnw7M=;
 b=AL4R6gJhSl+N2vrzfxaL0UvjB+gfJAtdLB1wGHArFHuEPw0bB5L1GJVawwGr04S+8elz7zTet2SoBlLgQeQAco2pY9+QIjAyJUYCERYz9ghh2kNO38QlRwh4EEUPr0O52TItpymRQmBUxiF92wqAPwAdmxVffSa1izfJEDzkgWZPatLgAcKvxHJkK81jOv3NRjUh9E8ztmAJqtjqE5FY5QTQcivj50BBOrV1t2KejMeod/g6F1MYRneIQNLDYXLCVrZUfLHCRYKERP8T/Gj2TAdkuoIkVLgFWnM1uxGWrAxPY0cpBM2BlLGyGjJl+mbCFmJooeD4Jxv1eofUEwzV6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 SA0PR11MB4656.namprd11.prod.outlook.com (2603:10b6:806:96::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.28; Fri, 21 Jul 2023 16:55:35 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::dead:4565:f8d6:50a8]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::dead:4565:f8d6:50a8%5]) with mapi id 15.20.6588.031; Fri, 21 Jul 2023
 16:55:35 +0000
Message-ID: <644937ca-56b1-48ce-36f5-3e683639152a@intel.com>
Date: Fri, 21 Jul 2023 22:25:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230712125640.1471850-1-ravi.kumar.vodapalli@intel.com>
 <ZK6+NZUQnfZCLQj0@DUT025-TGLU.fm.intel.com>
 <mr6slrxoedm46acyb73yzx5yoyuhjbeuixh3albo5jofuuawma@uformzo3j2r5>
 <e19e20f1-637c-4660-ee24-bfa714e89d17@intel.com>
 <kdwwfs57uc4i2fwttajp4mybarsdpiq6hvy257ga2dp47r7h3w@vmazxnk62wau>
 <77460a29-28fe-b4cb-0b20-508736309e3f@intel.com>
In-Reply-To: <77460a29-28fe-b4cb-0b20-508736309e3f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::13) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|SA0PR11MB4656:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f18e8b-caa8-4ad6-5566-08db8a0b4d0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LD0CIdGWL+deiL65Q8lxnoXRPOnMyn5ioQRkgw3566VIA6Ak4eMwgyUBkrF/Hrv6h0vgRW628DHuuggctxvjko81T7inl8pDWHfO0n0x+Z4bqLdyf7ecAWo4M4iFzxBBCVZet6Ohomwk3ZVHnz236V7Aiu7p6wJhhSFfvbA/+3R+BJEsDsnRsbUIPNPJjt+9aK8W1G7a96GEFckvV5QmBiOZDzNcQw9PUSAdSFHHYi4xSnrjhLgWupa2epUC/+x72v+xyoPp6FRdC7hhvDO/h3tGJps8sypcAwbyVq7pEh2O3TktJBDto4qBiWCfzXDn7OhfRFeKBdkfKuRvBmduJ/JfBYiX6IjG9lD4wJS4oyKHVOto0iybZFiaVBozUiLn675HOzbZexmN5IrF76UQn4zPqKm/pyySuVqynd0Tyil6lU8X0Z0EdEJmPESXxhfl0az8VMm2sXUlVbopJyTQGdREpFeYOcYmq6fdgwz0VWmirVOMvObEl1ZFvM4agQlb46OJ1pdevPI/JsiVWe0Jp+0vYfmjmBW761RB1FT40epvDx1WRyKMYggrSdcijYUISlS7hYoThRmdg7SKlMNPP4eUiv03r9P+VDI7/rLVRUSrtUlhtanG4xHJvWFVAHpWYjKO+4dGYTlsixUA3W0OsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199021)(31686004)(6506007)(53546011)(26005)(38100700002)(82960400001)(66476007)(478600001)(31696002)(30864003)(5660300002)(66946007)(6862004)(8676002)(66556008)(6636002)(4326008)(8936002)(6486002)(86362001)(37006003)(316002)(41300700001)(6666004)(2616005)(186003)(36756003)(2906002)(6512007)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YS8wVW5YY0EzS0JmWUwvRkIwZG9reGVZT2hmUlNFUzF0bjRiYkVSVklVREcx?=
 =?utf-8?B?N3kwL3FzNlVrdWEwVk1PWUQ5dlJmM29ySDRQVnAzaFB6RjhycjAzckZzZVpy?=
 =?utf-8?B?VmkrYkVNNVlSbk9QcDVwUlNJTGRTdy9idGpaT05JK21uN2Nwck5DcXFUdUNC?=
 =?utf-8?B?UTFTdytQRkUxVGo0VUdZK1Z2NzhFd1doNG56UElCc3ZUNm9CSktSVElrME5W?=
 =?utf-8?B?dEh1NzZwaDdFQlkrTDFkc2EvN000aWUvcEJzZ0VDdnFtL01rQzNxVUd0dnh4?=
 =?utf-8?B?Ri9Ua2N6eVBheTR0cXdXS0dUTkVueGVhckMwVGtFdHdCK2Q2dHhIZ1QwWGJs?=
 =?utf-8?B?YkhERmc1bUcxU0VEOGhFVFlFZFU3Tll0d3dFdjl2c1E1QWpWS1VpaWxpdUlQ?=
 =?utf-8?B?Z2VvOUhKTFRlS0M4Vm5RaUxMNDU3czlSazMyQXFRUHJZSW1BKzcwZEhudkcz?=
 =?utf-8?B?Z2hHUlY4UWdYVHFYVGo5MEJreTk5WGxSZ09ScVk0NFM4OWIvNkdCMU94L0lt?=
 =?utf-8?B?R2l0Nnhkbm1nNTZLV3cyRkZzdjNHemdDd1IxN3NSN3lmNkVDcmVJU09lWTUv?=
 =?utf-8?B?ZDg1THJ3MjlubU11WVZVbEc0Szl4anlXN2dTVnZEQmhCaGo5eDBuMnVmQVhE?=
 =?utf-8?B?WGp3bGNndjl1Zmhib0d5Q0FMamNva1NFUzk3SWUwYnljNVY5d0xSNE5Ua1RE?=
 =?utf-8?B?RnNObHNMR0NQeHRXQzhGQzdmVlNJRXlaZGJTVUZ6WC9KNmtGN3c0WmY2TDB2?=
 =?utf-8?B?SnNnOW5LRWhtVnVnOGN4Rzk5MmFPMHNEbHRXVk80bmtpOXV4VWxSeHJFK05l?=
 =?utf-8?B?Z2JVdEZaaEtZRnN0YjRTSXNBUjZDZ1gyM0xBMk4rUmF2dHFlamFvMFd6UUhl?=
 =?utf-8?B?L3RXUTE2M1FQOXBoUmZzWjhWMGFZSm52M3pSZzI5OUtQVWJBa0lRNVR3V09O?=
 =?utf-8?B?bldLL1h2NGdFaXRqTzF5TkRFVDRtd05WenhldWdFaTFjOVJHRERwTHczeXd4?=
 =?utf-8?B?VGdteTRkdnBlRGRhU2RwckhvNkZ4NU9Fb3BJNHlaWVlnRi9QUnhRRUs3ZjZI?=
 =?utf-8?B?Z1NKNnJtVWxRaFlvTGRLMnI4OTFHalc3OC9YVGI0dzIycmxJQmVqd0xnMmx0?=
 =?utf-8?B?YjZEeTBhTjdxdjI5SWxacVJoMzZBcVB6SWZRcEFYMG9tbi9rTUdPWmM1UE5j?=
 =?utf-8?B?TXJNN09mWE9mN3VqTzY4TlV0ZEhFYVNubXpLcUkvQ3Y2d3Z3MTNjM3RkYWdG?=
 =?utf-8?B?S2NURUNBQThzcXFnWTBUY2d0K09zTzlWZU51MGdaMUJoTS95cks3K3ZiY3dr?=
 =?utf-8?B?cVgxallHaEFTMkNpYnVRR2piYWFGZmdFOHltZUJxUmRJYmx0dEtzSU4zSnFw?=
 =?utf-8?B?WThXQmcvS3R6M0o5QUJ5RjI1djJwSDA5ZUcyWDcxUXhwbC9laHZYSjMzR0JF?=
 =?utf-8?B?V0hmMjczSVNGSFJHWDNCc2VRRVhuTGx1UDYrQklZSzVjSGxLY0ZhVWtNdThY?=
 =?utf-8?B?VkZHQkZCT25EeWVNb3VmUzhrZzdHYkh0WWh1TTVtS3JPeG5HSmV4YzVOalpX?=
 =?utf-8?B?eStyZUR2WVBzQzBEMm5TaUdYL0dHdzZldndxY3FvSGl2WkJEa1NCbDludXhz?=
 =?utf-8?B?MVk1UUttYW5IRmsyRmdTRlduUCtFOEFXZ3hnck13YlA5amRIdTVkaGVQUDdO?=
 =?utf-8?B?UUJwM2YwUlZDWWY0cFZ3SjhPSjQ3LzJQUEVYck9kajluN3pUNzNmWDBUaTd6?=
 =?utf-8?B?dFN2S2V0d3RDRlErS3lPVXU2eHlqNzdkYUR3bjZvUjdTVTJibTRPU29PU3lE?=
 =?utf-8?B?ZEJhM0J3dm1UeXoyUWtWb0dRU1ZyMGhCQXZKbnAwNHZpODRDQW9uQ0Q3OEJY?=
 =?utf-8?B?N0pzUDJRK1dSZVlVOHg3VG1pRE16a09iSjdDTktnVzFxREgyMXBhTytZbWxT?=
 =?utf-8?B?TmIvaXRQaWp1TTdWYVRJaUpOTVdETFlMR0x3Q2ZzVHdpeG1GS0g4RXFWSUVo?=
 =?utf-8?B?bHdUMitrWmZOSzNtYzF3Y3hvb0RZWHltdUJmNGRvU3g0UVhqYjI0elZHbG5G?=
 =?utf-8?B?dHNFbVhSUXI3YUxIcENTR1J0anhYOEVGdEppRk0rdXZZenVCNFN2dDB2Z2ZO?=
 =?utf-8?B?WXljUi9lMGxZcStZeWhTM2hJZ3NCZG9FeEExYU9YZ0g5b2pOYXpXNFpXVFls?=
 =?utf-8?Q?NeaV0xBAcWF5qnvKvi0cs4A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f18e8b-caa8-4ad6-5566-08db8a0b4d0d
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 16:55:34.8652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0EKGEkVwcH59xKV0gVHq+0AVOphjH1jf/dZ266dVxtLdcyiLP87jBSmc3smlXfusEqz+65SSNhl8eKy/y47k/Ojxh7mnIXiAsJ94QyIvKBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4656
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/ppgtt: Add support for correct PAT
 encoding in Page Table Entry (PTE) format
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 7/21/2023 10:21 PM, Vodapalli, Ravi Kumar wrote:
>
>
> On 7/21/2023 9:43 PM, Lucas De Marchi wrote:
>> On Thu, Jul 20, 2023 at 07:48:33PM +0530, Vodapalli, Ravi Kumar wrote:
>>>
>>>
>>> On 7/17/2023 6:53 PM, Lucas De Marchi wrote:
>>>> On Wed, Jul 12, 2023 at 02:52:37PM +0000, Matthew Brost wrote:
>>>>> On Wed, Jul 12, 2023 at 06:26:40PM +0530, Ravi Kumar Vodapalli wrote:
>>>>>> Different platforms has different PAT encoding in PTE format, add
>>>>>> correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).
>>>>>>
>>>>>> Bspec: 45101, 71582
>>>>>> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/xe/xe_pt.c       | 110 
>>>>>> +++++++++++++++++++++++++++----
>>>>>>  drivers/gpu/drm/xe/xe_pte.h      |  31 +++++++++
>>>>>>  drivers/gpu/drm/xe/xe_vm_types.h |   1 +
>>>>>>  3 files changed, 129 insertions(+), 13 deletions(-)
>>>>>>  create mode 100644 drivers/gpu/drm/xe/xe_pte.h
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>>>>> index 00855681c0d5..e7f8bd4dd518 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>>>>> @@ -16,6 +16,7 @@
>>>>>>  #include "xe_trace.h"
>>>>>>  #include "xe_ttm_stolen_mgr.h"
>>>>>>  #include "xe_vm.h"
>>>>>> +#include "xe_pte.h"
>>>>>>
>>>>>>  struct xe_pt_dir {
>>>>>>      struct xe_pt pt;
>>>>>> @@ -111,19 +112,7 @@ static u64 __pte_encode(u64 pte, enum 
>>>>>> xe_cache_level cache,
>>>>>>      if (unlikely(vma && xe_vma_is_null(vma)))
>>>>>>          pte |= XE_PTE_NULL;
>>>>>>
>>>>>> -    /* FIXME: I don't think the PPAT handling is correct for MTL */
>>>>>> -
>>>>>> -    switch (cache) {
>>>>>> -    case XE_CACHE_NONE:
>>>>>> -        pte |= PPAT_UNCACHED;
>>>>>> -        break;
>>>>>> -    case XE_CACHE_WT:
>>>>>> -        pte |= PPAT_DISPLAY_ELLC;
>>>>>> -        break;
>>>>>> -    default:
>>>>>> -        pte |= PPAT_CACHED;
>>>>>> -        break;
>>>>>> -    }
>>>>>> +    pte = xe_vma_vm(vma)->pte_encode(pte, cache);
>>>>>>
>>>>>>      if (pt_level == 1)
>>>>>>          pte |= XE_PDE_PS_2M;
>>>>>> @@ -187,6 +176,94 @@ static u64 __xe_pt_empty_pte(struct xe_tile 
>>>>>> *tile, struct xe_vm *vm,
>>>>>>      }
>>>>>>  }
>>>>>>
>>>>>> +static u64 xelp_pte_encode_pat(u8 pat_index)
>>>>>> +{
>>>>>> +    u64 pte_pat = 0;
>>>>>> +
>>>>>> +    if (pat_index & BIT(0))
>>>>>> +        pte_pat |= BIT(3);
>>>>>> +
>>>>>> +    if (pat_index & BIT(1))
>>>>>> +        pte_pat |= BIT(4);
>>>>>> +
>>>>>> +    if (pat_index & BIT(2))
>>>>>> +        pte_pat |= BIT(7);
>>>>>> +
>>>>>> +    return pte_pat;
>>>>>> +}
>>>>>> +
>>>>>> +static u64 __xelp_pte_encode(u64 pte, enum xe_cache_level cache)
>>>>>> +{
>>>>>> +    pte &= ~XELP_PAT_MASK;
>>>>>> +
>>>>>> +    switch (cache) {
>>>>>> +    case XE_CACHE_NONE:
>>>>>> +        pte |= xelp_pte_encode_pat(XELP_PAT_UNCACHE);
>>>>>> +        break;
>>>>>> +    case XE_CACHE_WT:
>>>>>> +        pte |= xelp_pte_encode_pat(XELP_PAT_WT_CACHE);
>>>>>> +        break;
>>>>>> +    case XE_CACHE_WB:
>>>>>> +        pte |= xelp_pte_encode_pat(XELP_PAT_WB_CACHE);
>>>>>> +        break;
>>>>>> +    default:
>>>>>> +        /* pte |= PPAT_CACHED; */
>>>>>> +        break;
>>>>>> +    }
>>>>>> +
>>>>>> +    return pte;
>>>>>> +}
>>>>>> +
>>>>>> +static u64 __xehpc_pte_encode(u64 pte, enum xe_cache_level cache)
>>>>>> +{
>>>>>> +    pte &= ~XELP_PAT_MASK;
>>>>>> +
>>>>>> +    /* Initially assumed as CLOS0.
>>>>>> +     * To Do: CLOS1/CLOS2 has to be set depending on requirement
>>>>>> +     */
>>>>>> +    switch (cache) {
>>>>>> +    case XE_CACHE_NONE:
>>>>>> +        pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_UNCACHE);
>>>>>> +        break;
>>>>>> +    case XE_CACHE_WT:
>>>>>> +        pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_WT_CACHE);
>>>>>> +        break;
>>>>>> +    case XE_CACHE_WB:
>>>>>> +        pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_WB_CACHE);
>>>>>> +        break;
>>>>>> +    default:
>>>>>> +        /* pte |= PPAT_CACHED; */
>>>>>> +        break;
>>>>>> +    }
>>>>>> +
>>>>>> +    return pte;
>>>>>> +}
>>>>>> +
>>>>>> +static u64 __xelpg_pte_encode(u64 pte, enum xe_cache_level cache)
>>>>>> +{
>>>>>> +    pte &= ~XELP_PAT_MASK;
>>>>>> +
>>>>>> +    /* Initially assumed as Non cohorent mode, correct values
>>>>>> +     * has to be set depending on requirement.
>>>>>> +     */
>>>>>> +    switch (cache) {
>>>>>> +    case XE_CACHE_NONE:
>>>>>> +        pte |= xelp_pte_encode_pat(XELPG_PAT_UNCACHE);
>>>>>> +        break;
>>>>>> +    case XE_CACHE_WT:
>>>>>> +        pte |= xelp_pte_encode_pat(XELPG_PAT_WT_CACHE);
>>>>>> +        break;
>>>>>> +    case XE_CACHE_WB:
>>>>>> +        pte |= xelp_pte_encode_pat(XELPG_PAT_WB_CACHE);
>>>>>> +        break;
>>>>>> +    default:
>>>>>> +        /* pte |= PPAT_CACHED; */
>>>>>> +        break;
>>>>>> +    }
>>>>>> +
>>>>>> +    return pte;
>>>>>> +}
>>>>>> +
>>>>>>  /**
>>>>>>   * xe_pt_create() - Create a page-table.
>>>>>>   * @vm: The vm to create for.
>>>>>> @@ -216,6 +293,13 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, 
>>>>>> struct xe_tile *tile,
>>>>>>      if (!pt)
>>>>>>          return ERR_PTR(-ENOMEM);
>>>>>>
>>>>>> +    if (GRAPHICS_VERx100(vm->xe) >= 1270)
>>>>>> +        vm->pte_encode = __xelpg_pte_encode;
>>>>>> +    else if (GRAPHICS_VERx100(vm->xe) >= 1260)
>>>>>> +        vm->pte_encode = __xehpc_pte_encode;
>>>>>> +    else
>>>>>> +        vm->pte_encode = __xelp_pte_encode;
>>>>>> +
>>>>>>      bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
>>>>>>                    ttm_bo_type_kernel,
>>>>>>                    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pte.h 
>>>>>> b/drivers/gpu/drm/xe/xe_pte.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..8b3b5b471a99
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/gpu/drm/xe/xe_pte.h
>>>>>
>>>>> s/xe_pte.h/xe_pte_pat.h
>>>>>
>>>>> Just my option prefer this.
>>>>
>>>> dunno, but since we have different pte formats for ggtt and ppgtt, IMO
>>>> it would add to the confusion.
>>>>
>>>> Maybe this belongs in xe_pat.h since it's xe_pat.c that programs the
>>>> tables giving the meaning spelled out in the macros here for each 
>>>> index.
>>>> The rest of the code then need to set the bits in the PTE to reference
>>>> those indexes, according to the PTE format.
>>>>
>>>>>
>>>>>> @@ -0,0 +1,31 @@
>>>>>> +/* SPDX-License-Identifier: MIT */
>>>>>> +/*
>>>>>> + * Copyright © 2021 Intel Corporation
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef _XE_PTE_H_
>>>>>> +#define _XE_PTE_H_
>>>>>> +
>>>>>> +#define XELP_PAT_MASK                  BIT_ULL(7) | BIT_ULL(4) | 
>>>>>> BIT_ULL(3)
>>>>>> +#define XELP_PAT_WB_CACHE              0
>>>>>> +#define XELP_PAT_WC_CACHE              1
>>>>>> +#define XELP_PAT_WT_CACHE              2
>>>>>> +#define XELP_PAT_UNCACHE               3
>>>>
>>>> example... this duplicates what we have in xe_pat.c (comment added 
>>>> here
>>>> for clarity)
>>>>
>>>> static const u32 tgl_pat_table[] = {
>>>>         [0] = TGL_PAT_WB,
>>>>         [1] = TGL_PAT_WC,
>>>>         [2] = TGL_PAT_WT,
>>>>         [3] = TGL_PAT_UC,
>>>>     // .... those are programmed, but not expected to be used
>>>>         [4] = TGL_PAT_WB,
>>>>         [5] = TGL_PAT_WB,
>>>>         [6] = TGL_PAT_WB,
>>>>         [7] = TGL_PAT_WB,
>>>> };
>>>>
>>>
>>> TGL_PAT_WB maps to PAT table register bit mapping, we cannot 
>>> directly use tgl_pat_table to get PAT index rather we
>>> need to implement code to retrieve the index like below instead we 
>>> can use macro directly.
>>>
>>> xelp_pte_encode_pat(u8 cache_type) //example pass TGL_PAT_WB
>>> {
>>>     u8 index;
>>>     for (i=0, i < 32, i++)
>>>         if (tgl_pat_table[i] == cache_type)
>>
>> no, we don't want the caller to pass the platform-specific value.
>> It should pass a platfrom-agnostic value and xe_pat_get_index()
>> translates that to the platform-specific index. There are just 2 entries
>> really used by the kernel: uc and wb. Then the xe_pat.c returns what is
>> the entry to be used in those cases.
>>
>> Lucas De Marchi
>>
>
> I have discussed Regarding encoding the index into pat pte with 
> Matt,Roper
> He said instead of writing common function for both ppgtt and ggtt, 
> the best approach would be separate them as below so that in future 
> adding more support will be easier
>
> static u64 xelp_pte_encode_pat(u8 pat_index)
> {
>     u64 pte_pat = 0;
>
>     if (pat_index & BIT(0))
>         pte_pat |= BIT(3);
>
>     if (pat_index & BIT(1))
>         pte_pat |= BIT(4);
>
>     if (pat_index & BIT(2))
>         pte_pat |= BIT(7);
>
>     return pte_pat;
> }
>
> Thanks,
> Ravi Kumar V
>
>>>             index = i;
>>> }
>>>
>>>
>>>>
>>>> IMO the abstration could be something like
>>>>
>>>>     // this is valid for both ppgtt and ggtt
>>>>     pat = xe_pat_get_index(xe, cache);
>>>>
>>>>     // this changes between ggtt / ppgtt
>>>>     pte |= vm->pte_encode_pat(xe, pat);
>>>>
>>>
>>> I have one approach like below example where we can use same 
>>> function for both ggtt and ppgtt
>>>
>>> static u64 pte_encode_pat(enum gtt_type, u8 pat_index)
>>> {
>>>     u64 pte_pat = 0;
>>>
>>>     if (gtt_type == PPGTT)
>>>     {
>>>         if (pat_index & BIT(0))
>>>             pte_pat |= BIT(3);
>>>
>>>         if (pat_index & BIT(1))
>>>             pte_pat |= BIT(4);
>>>
>>>         if (pat_index & BIT(2))
>>>             pte_pat |= BIT(7);
>>>      }
>>>     else if(gtt_type = GGTT)
>>>     {
>>>         GGTT type PAT PTE encoding code here.
>>>     }
>>>         return pte_pat;
>>> }
>>>
>>>
>>> vm->pte_encode_pat(u64 pte, enum gtt_type, xe_cache_level cache)
>>> {
>>>     switch (cache) {
>>>            case XE_CACHE_NONE:
>>>             pte |= pte_encode_pat(gtt_type, XELP_PAT_UNCACHE);
>>>             break;
>>> }
>>>
>>> what's your opinion.
>>>
>>> Thanks,
>>> Ravi Kumar V
>>>>
>>>> so the PAT indexes are handled by xe_pat.[ch]. The pte *encoding*
>>>> is then handled differently by ggtt and ppgtt. Thoughts?
>>>>
>>>> Lucas De Marchi
>>>>
>>>>
>>>>>> +
>>>>>> +#define XEHPC_PAT_CLOS0_UNCACHE        0
>>>>>> +#define XEHPC_PAT_CLOS0_WC_CACHE       1
>>>>>> +#define XEHPC_PAT_CLOS0_WT_CACHE       2
>>>>>> +#define XEHPC_PAT_CLOS0_WB_CACHE       3
>>>>>> +#define XEHPC_PAT_CLOS1_WT_CACHE       4
>>>>>> +#define XEHPC_PAT_CLOS1_WB_CACHE       5
>>>>>> +#define XEHPC_PAT_CLOS2_WT_CACHE       6
>>>>>> +#define XEHPC_PAT_CLOS2_WB_CACHE       7
>>>>>> +
>>>>>> +#define XELPG_PAT_WB_CACHE             0
>>>>>> +#define XELPG_PAT_WT_CACHE             1
>>>>>> +#define XELPG_PAT_UNCACHE              2
>>>>>> +#define XELPG_PAT_1_WAY_WB_CACHE       3
>>>>>> +#define XELPG_PAT_2_WAY_WB_CACHE       4
>>>>>> +
>>>>>> +#endif
>>>>>> +
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h 
>>>>>> b/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>> index edb3c99a9c81..9e1b33c17d05 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>> @@ -312,6 +312,7 @@ struct xe_vm {
>>>>>>
>>>>>>      /** @batch_invalidate_tlb: Always invalidate TLB before 
>>>>>> batch start */
>>>>>>      bool batch_invalidate_tlb;
>>>>>> +    u64 (*pte_encode)(u64 pte, enum xe_cache_level cache);
>>>>>
>>>>> Add kernel doc.
>>>>>
>>>>> s/pte_encode/pte_pat_encode
>>>>>
>>>>> Again just my opinion. Let see if anyone else has an opinion on 
>>>>> the naming.
>>>>>
>>>>> Other than these NITs it LGTM. Didn't read to the bspec to check the
>>>>> actually bit setting, but can do that ahead of the next rev. 
>>>>> Speaking of
>>>>> that, do you have a bspec link so I don't have to search through it?
>>>>>
>>>>> Matt
>>>>>
>>>>>>  };
>>>>>>
>>>>>>  /** struct xe_vma_op_map - VMA map operation */
>>>>>> -- 
>>>>>> 2.25.1
>>>>>>
>>>
>

