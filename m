Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F09C004C0
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 20:21:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5085F10E5E7;
	Fri, 20 Oct 2023 20:21:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A8610E5E7
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 20:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697833303; x=1729369303;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dqrfWvoaxx4p4rY8uEdCMeygex6cjMTBAg/9VYuGu+0=;
 b=ANK+EgjbTm0hfReiNDRCkD3+Ll5UbA6JA38WWTTnB1CrO7/bCyKsC5fj
 GrTe3B11TahM2IOpmNxijvT+gGBtPm1yFofBzzP9sq66xr4QfDIvkhjvV
 vQ87KaPB1cTT5VVdB5WoDc/o/SjcB43hMKJd4z5cPFFFUGucKtpZGBHC0
 vguoCf4DVv1pNMzFAW3CJlAPAchqAe+sTahyqT0tIgRBLsdT+61cg1IDr
 C0C46F8BzIRRg71TkdbKFRzXilhwtvG/Sq3a07yP15Q+5xgos59DUM0yG
 VJtBFj7Ds7A8C0s8sDWl4xVnZtQbOKxYeoK4Xl7ZnvEvRFG1IAxxKeua4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="417702468"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="417702468"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 13:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="761166699"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="761166699"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 13:21:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 13:21:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 13:21:42 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 13:21:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQTJhPFp4Otnq2dX4F43HGNse6WKXYSmCY4EdYp4eubNI5Ve/AGkAJtF33ZtP6unW10d51usEDHd4Wex47IcF/1YUWQa+e35F1PYEfVOhJFXgYfE/bNXQItaHR1DfIOxRRJ9FkyvhHZtwpedSY6zolZ4iv/Iu9U1cSnVS3kMxhLfCZ8z9VdKUoxoxvHy46QHDQaaUuM2r4oe2LzQU0PpJ5dI8a5hxSrNAA6Ju3bs6FnsP1jb+p5zWVH4+rsje+unHyngTai66D8dbtbRYsTBQOtxVEgGk2G6FVy0oQvARmRHktn63eW93wyA2UlM6o/yrswZ42x6oI9xz0+Ai+RPrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55DZ5r3gFpoN2Yp2VFkXZ4rMBkp/WeSuRO/x7+vjzrQ=;
 b=X7MuA2+iNrR+OGzQcNx/HUWW3aMndukKvbhmIZeEWDJLFiMbmC9MNdzzUYC8sxQAV5GnJDTxRq3UuCM5aub51IMJ8LT9aCX6gAWKxxbHE7w6e7kWCj+iwlrtz955sTuQAmjPvhVP1L9dj98/HYb+PresD4HM+Me9xmbrh6UHzh9KuxfIW6O2XyspONfPIt+asRi/TdjxO9vZvggXwWTLmteapkAjWcp6IMzr9PxmNGhKRRrWCAaFi/UCxTAZk2/lWftGC19/8qNvmr7NSBVTnGfvtRZpTXoy3eY9KsuCHtpK0WOfj+mG9xPdckXQ+ZoKlidyic3NNpf9+/XmTPIpPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by SA2PR11MB4844.namprd11.prod.outlook.com (2603:10b6:806:f9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 20:21:35 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::51b2:a46b:a57e:9fd6]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::51b2:a46b:a57e:9fd6%6]) with mapi id 15.20.6886.034; Fri, 20 Oct 2023
 20:21:35 +0000
Message-ID: <441e70a2-3f69-4d83-b863-0ad1233e6562@intel.com>
Date: Fri, 20 Oct 2023 13:21:33 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Summers, Stuart" <stuart.summers@intel.com>
References: <20231020172155.97172-1-stuart.summers@intel.com>
 <ff03a8ef-4084-431b-8b33-cd87d07d9096@intel.com>
 <8de5abc9acba253d6029d9001c22c5ecdbdbb452.camel@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <8de5abc9acba253d6029d9001c22c5ecdbdbb452.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0180.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::35) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|SA2PR11MB4844:EE_
X-MS-Office365-Filtering-Correlation-Id: 87459a0a-3839-4a85-d56a-08dbd1aa27d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7rWgb2objq3NapgFt0lxrRkp0lyp4bzsDwkMKYvPq36KIRCLSdM/jLN3UbIcsTVm/4dvteD1/i7fSZYl19Sjw+KBc2aU0AlPWSqKcdO7qcyNf3AZ+6dqGGanLzv2nPir/LD9NtCWpe/saUsuN+nYNp0vwKZg1kMkDJH7q4M1a0Ci6zuuFcpjZWbY8PBKkA/17NUzbFdxnNvz8SZVj6aee4XNQ9ARNwOAwVCtjnoD1kobnTZpP+Bmf3svPI8H3xF4hA8mWHFIE46J4W1pDohGG7ZugARI3fr+kCwYEjhOfyJjkFxbNaDGbt7l5fi6uS0ZAQ3qX6Qw6Vb321uYEaw9lB9bk66IunfO75XJMngf3FHxkuyzmezbN+WvtTIV8V8YmDq1mXiIQvdFSibDXhIrfGTZLE8npZrRdBRMeJtr3UK3CCfZc53Wsz/cBOUyHwARktwyPl3Y9KTTuDH5XMILaMNuSunPz8CQ3JVp7h1CYKDC/6b9HX14I5YNmIcolEBkPIM7xhvhomkVB9cj0t2+277HzWFSERNn5VwyOPyFSYIxPkOHR1CPinZFWAnqw71j3Xu1k3BpVJ4hxWYx8XRexV+jDMxZFtQx7IIi+EYogpfYYWBvftLZWiyMJxHGFfcXrtkzijaOi27YvRLfVn/72A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(31686004)(2616005)(6506007)(6512007)(53546011)(38100700002)(86362001)(31696002)(82960400001)(36756003)(26005)(4001150100001)(2906002)(107886003)(478600001)(6486002)(83380400001)(8676002)(8936002)(6862004)(5660300002)(4326008)(66946007)(6636002)(41300700001)(37006003)(316002)(66476007)(66556008)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d21ETEp3MkszV2drdG82TnNBcFlBWDlmV0VTSm1uTVpzODdHcWE5OXBRQUQ4?=
 =?utf-8?B?U09ZbFdZZENrY1ZEeDUxYlVoenhBb2hxdzJrR2htMDlCODUvZEFXU0dtTnkx?=
 =?utf-8?B?Z1NSMnZEbnk1dHRIQVh2VUFkOHk2SFF6dHhSckV1YUV3OFlybXJRNGdOMmEv?=
 =?utf-8?B?UUpZODBTN092UjFtVWtGaTlwT3ltSEJtNnFTczNqd2dJakR4Y0hENFhXR1ZO?=
 =?utf-8?B?dEtySVpySlMzMEh1V09kWTc0V2lDcGJ0bHpOZmZTaTZuNjdyTEV6eldSQUJ1?=
 =?utf-8?B?QlF3TWhoRGF4VmNXeWxQV3B4Wk5mWG0rQnZybzdFUkpMRG9hUlZkTjlaLzFW?=
 =?utf-8?B?dWRwYU5XY1lZQ05TSlViR0QvMkt5UDQxYjBBMTJRWjRDbW4xai9zQXlieGx3?=
 =?utf-8?B?WHlKQTZDSTZHakVWU2swR3NReEwyTHBhZkplVHdwRVNRTkhkeHk0bVY2Qndl?=
 =?utf-8?B?UkxDRVI1VHJuOXpKSE1MZmlMWUlsWWZCaXEyMW5HQnZWQkdBQU5XNnl6MWNL?=
 =?utf-8?B?aGl2Zkh5am1zckdiYVJoUGw2RHlPTW4rSUNFbzR6UUJWWXYvVXFwQVBmRnZJ?=
 =?utf-8?B?ZTJGdVB2cDlFaHVOQlJnYVpoSGRUbGw0YjRkand3dlNWNVJqU1pFa3YxcEhs?=
 =?utf-8?B?eGpzVUt3bW5aWlNtRWlzdVIxOWNHSGk0M0p4YUE2SFVQMWI5cEp2dUpFY1lQ?=
 =?utf-8?B?RDh3ZVVhd1NEQnJaZEptNDZRY00vNWhQMlhIS2FNbzVMOExQRzZ2TmFoaDlF?=
 =?utf-8?B?TWR1TFVrRHVvWWhUWW8va3FLemprdkQvcTdUbkRMNG9qNDI4RG1XMVUwQzNR?=
 =?utf-8?B?S1NReUo1RzU0eGZ5bHdGODZTMEIzTzlCNEN4djdVbGFYSXdhLzNtN3UyZmY0?=
 =?utf-8?B?WnNJa09GaGRvaExhVWJ2bVd5NjNiSVROaTZXNjdjSGVVb2RLSGNOVHV0b3hD?=
 =?utf-8?B?QUdqbFQ4QXRaL05JZFA5Y3RQeHh4QlY4cVF0MkJFQWJiYnRVbmw3bEdiT0pS?=
 =?utf-8?B?UjIycnNqa0MyM2VLUGwxNTRrUnNvdkxOcGMrMGpPdHJrYVBqR29FdlBIVXdQ?=
 =?utf-8?B?TWJldjFVUzRZbThOZklYVnRmZ2R5bWx5empGQU5LZU9JYzZJNXU1V0MxcUxF?=
 =?utf-8?B?T0w5S0tyWDN1empIeS9JNDZHLzlhWXZqS0xweFNxeUtUYldDcmdRaTZhMFdS?=
 =?utf-8?B?WmV2NUZseHhsYlcxNzQraU5IaEtUbGZaNGl3eEVZWUFHekxwbGdpQnJzRHdp?=
 =?utf-8?B?MFRuYksvKzZrOUxHTk1STlJHMXVRYWllczhwZysrWTE3d1V5NzRidWp6YXMx?=
 =?utf-8?B?S3NYb2FDV0gwa0x0YnVKWVF2cnBodDdNS1ZteU5hbzRSTWsyU0xFMWs4Yi91?=
 =?utf-8?B?RnVPbTBLN2luQ3JBZ3hkY3FpUlpoM2pzVHpGTDVWOW82V2JJRjFkWWc2bzE5?=
 =?utf-8?B?cTlUY3pNL1Y4V29zRFpubDJQK1hydDJQZFFNZnJkakIrc0dHWFJvNHAxZW9p?=
 =?utf-8?B?QktBUjRiTnRpYXdjRjQ3SlRDQUw1VFcvOGpINEtiWGZSODdXV09ud0t6RHBV?=
 =?utf-8?B?MUpCRTNZVWE4TUF3YTlsUklrWWZ6ZEY2MGNUV0Q0QnB6L2pUb3FOclQ5bFZE?=
 =?utf-8?B?aW41Tjg3K0R4SnhUWk9tTWlTRFFuVjYvQlVLMTVwRDlUaGZRT05samorb0tI?=
 =?utf-8?B?ZzdWUjBFRi9LOGozRm0vdkwzWlNvTytERjJkRER3bWJtZk5yQS90NkMyZTFa?=
 =?utf-8?B?Y0ZRUExQemNXcVFmZlZuRFVvU2tFQnhwalVvMmhjTUhVRVhSK0tQR2c2VE1Z?=
 =?utf-8?B?U1FON25lTEs3VUlIWGxNUm9GcjN4VllSMHc4NEFmY1JuRnpuOXJTam9xU2tI?=
 =?utf-8?B?aWZGUit5ekRaS1Y2bTAwb3AvOHFENlNBdXpvV1VoWlJHV1phU1B1SlBycEYw?=
 =?utf-8?B?WFBqNmVMWXErUDRReFhFc0t6bnFHbklBOUJZZTZqaHZDbmdCTm9sK216YkdD?=
 =?utf-8?B?clI4QUZOa3lBeDVMUFJFWW41d2xwdG5hK3ZUMllYNTVVTiswSE1oQitaT2Uy?=
 =?utf-8?B?RDZGdkhnWDlvSUU0NzdYOVFnTFZveUlOdHE2a1FLU3ZqTUFrM3BzWFEvcEVU?=
 =?utf-8?Q?qzJGpR90wwlkPHyRtxYojnKLS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87459a0a-3839-4a85-d56a-08dbd1aa27d2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 20:21:34.7178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTRtX5pZpnJ2DJB1e8BwcgzRR6ZoHbQNFZ3cUHUuMpNNChDOgY7IQbEwWcyuQUifVUCG04cFFlZWQCJt9b71Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4844
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Move VM entries print to a trace
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
Cc: "Girotra, Himanshu" <himanshu.girotra@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 10/20/2023 12:10 PM, Summers, Stuart wrote:
> On Fri, 2023-10-20 at 10:44 -0700, Welty, Brian wrote:
>> On 10/20/2023 10:21 AM, Stuart Summers wrote:
>>> While this information can be useful for debug, it is a little
>>> verbose to dump during a CI run, resulting in test failures due
>>> to disk limit issues in the CI machines.
>>
>> But why does CI have this enabled?
>>
>> The description for DRM_XE_DEBUG_VM says:  "Recommended for driver
>> developers only."   I don't think it belongs turned on for CI.
> 
> Ok that's a good point. Other than disrupting the status quo, is the
> worry about tracing that we'll have a huge range of binds and overflow
> the logs there where dmesg storage is a little easier to maintain
> through the syslog?

Just thought it was worth asking...  as in, is this an actual problem or 
not.  Or is just CI need to disable this in Kconfig, or as you say, 
could constrain how much logging it will keep on disk.

Certainly whether this belongs in dmesg or should be converted to 
tracepoints is a discussion worth having.....
But for that, it's best to involve the folks that have made the most use
of this during real world debug.....  I'll defer to others on that, and
let the other thread discuss it!

-Brian



> 
> Thanks,
> Stuart
> 
>>
>>
>>>
>>> For now, move these debug prints to a trace for manual debug.
>>>
>>> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_pt.c    | 35 +++++-------------------------
>>>    drivers/gpu/drm/xe/xe_pt.h    |  8 +++++++
>>>    drivers/gpu/drm/xe/xe_trace.h | 41
>>> +++++++++++++++++++++++++++++++++++
>>>    3 files changed, 54 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c
>>> b/drivers/gpu/drm/xe/xe_pt.c
>>> index 31afab617b4e..eb905878c4cb 100644
>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>> @@ -908,6 +908,9 @@ static void xe_pt_commit_bind(struct xe_vma
>>> *vma,
>>>    
>>>                          pt_dir->dir.entries[j_] = &newpte->base;
>>>                  }
>>> +
>>> +               trace_xe_pt_commit_bind(&entries[i]);
>>> +
>>>                  kfree(entries[i].pt_entries);
>>>          }
>>>    }
>>> @@ -929,34 +932,6 @@ xe_pt_prepare_bind(struct xe_tile *tile,
>>> struct xe_vma *vma,
>>>          return err;
>>>    }
>>>    
>>> -static void xe_vm_dbg_print_entries(struct xe_device *xe,
>>> -                                   const struct
>>> xe_vm_pgtable_update *entries,
>>> -                                   unsigned int num_entries)
>>> -#if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM))
>>> -{
>>> -       unsigned int i;
>>> -
>>> -       vm_dbg(&xe->drm, "%u entries to update\n", num_entries);
>>> -       for (i = 0; i < num_entries; i++) {
>>> -               const struct xe_vm_pgtable_update *entry =
>>> &entries[i];
>>> -               struct xe_pt *xe_pt = entry->pt;
>>> -               u64 page_size = 1ull << xe_pt_shift(xe_pt->level);
>>> -               u64 end;
>>> -               u64 start;
>>> -
>>> -               xe_assert(xe, !entry->pt->is_compact);
>>> -               start = entry->ofs * page_size;
>>> -               end = start + page_size * entry->qwords;
>>> -               vm_dbg(&xe->drm,
>>> -                      "\t%u: Update level %u at (%u + %u)
>>> [%llx...%llx) f:%x\n",
>>> -                      i, xe_pt->level, entry->ofs, entry->qwords,
>>> -                      xe_pt_addr(xe_pt) + start, xe_pt_addr(xe_pt)
>>> + end, 0);
>>> -       }
>>> -}
>>> -#else
>>> -{}
>>> -#endif
>>> -
>>>    #ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
>>>    
>>>    static int xe_pt_userptr_inject_eagain(struct xe_vma *vma)
>>> @@ -1276,7 +1251,6 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct
>>> xe_vma *vma, struct xe_exec_queue
>>>                  goto err;
>>>          xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
>>>    
>>> -       xe_vm_dbg_print_entries(tile_to_xe(tile), entries,
>>> num_entries);
>>>          xe_pt_calc_rfence_interval(vma, &bind_pt_update, entries,
>>>                                     num_entries);
>>>    
>>> @@ -1563,6 +1537,8 @@ xe_pt_commit_unbind(struct xe_vma *vma,
>>>                                  pt_dir->dir.entries[i] = NULL;
>>>                          }
>>>                  }
>>> +
>>> +               trace_xe_pt_commit_unbind(entry);
>>>          }
>>>    }
>>>    
>>> @@ -1627,7 +1603,6 @@ __xe_pt_unbind_vma(struct xe_tile *tile,
>>> struct xe_vma *vma, struct xe_exec_queu
>>>          num_entries = xe_pt_stage_unbind(tile, vma, entries);
>>>          xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
>>>    
>>> -       xe_vm_dbg_print_entries(tile_to_xe(tile), entries,
>>> num_entries);
>>>          xe_pt_calc_rfence_interval(vma, &unbind_pt_update, entries,
>>>                                     num_entries);
>>>    
>>> diff --git a/drivers/gpu/drm/xe/xe_pt.h
>>> b/drivers/gpu/drm/xe/xe_pt.h
>>> index d5460e58dbbf..c7e5f7111227 100644
>>> --- a/drivers/gpu/drm/xe/xe_pt.h
>>> +++ b/drivers/gpu/drm/xe/xe_pt.h
>>> @@ -18,6 +18,14 @@ struct xe_tile;
>>>    struct xe_vm;
>>>    struct xe_vma;
>>>    
>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
>>> +#define xe_pt_set_addr(__xe_pt, __addr) ((__xe_pt)->addr =
>>> (__addr))
>>> +#define xe_pt_addr(__xe_pt) ((__xe_pt)->addr)
>>> +#else
>>> +#define xe_pt_set_addr(__xe_pt, __addr)
>>> +#define xe_pt_addr(__xe_pt) 0ull
>>> +#endif
>>> +
>>>    #define xe_pt_write(xe, map, idx, data) \
>>>          xe_map_wr(xe, map, (idx) * sizeof(u64), u64, data)
>>>    
>>> diff --git a/drivers/gpu/drm/xe/xe_trace.h
>>> b/drivers/gpu/drm/xe/xe_trace.h
>>> index e32f1cad51d9..24d898061d04 100644
>>> --- a/drivers/gpu/drm/xe/xe_trace.h
>>> +++ b/drivers/gpu/drm/xe/xe_trace.h
>>> @@ -17,8 +17,49 @@
>>>    #include "xe_gt_tlb_invalidation_types.h"
>>>    #include "xe_gt_types.h"
>>>    #include "xe_guc_exec_queue_types.h"
>>> +#include "xe_pt_types.h"
>>>    #include "xe_sched_job.h"
>>>    #include "xe_vm.h"
>>> +#include "xe_pt.h"
>>> +
>>> +DECLARE_EVENT_CLASS(xe_vm_pgtable_update,
>>> +                   TP_PROTO(struct xe_vm_pgtable_update *update),
>>> +                   TP_ARGS(update),
>>> +
>>> +                   TP_STRUCT__entry(
>>> +                            __field(u64, page_size)
>>> +                            __field(u64, end)
>>> +                            __field(u64, start)
>>> +                            __field(u64, pt_addr)
>>> +                            __field(unsigned int, level)
>>> +                            __field(u32, ofs)
>>> +                            __field(u32, qwords)
>>> +                            ),
>>> +
>>> +                   TP_fast_assign(
>>> +                          __entry->level = xe_pt_shift(update->pt-
>>>> level);
>>> +                          __entry->page_size = 1ull << __entry-
>>>> level;
>>> +                          __entry->pt_addr = xe_pt_addr(update-
>>>> pt);
>>> +                          __entry->ofs = update->ofs;
>>> +                          __entry->qwords = update->qwords;
>>> +                          __entry->start = __entry->pt_addr +
>>> update->ofs * __entry->page_size;
>>> +                          __entry->end = __entry->start + __entry-
>>>> page_size * update->qwords;
>>> +                          ),
>>> +
>>> +                   TP_printk("Update level %u at (%u + %u)
>>> [%llx...%llx]",
>>> +                             __entry->level, __entry->ofs,
>>> __entry->qwords,
>>> +                             __entry->start, __entry->end)
>>> +);
>>> +
>>> +DEFINE_EVENT(xe_vm_pgtable_update, xe_pt_commit_bind,
>>> +            TP_PROTO(struct xe_vm_pgtable_update *entry),
>>> +            TP_ARGS(entry)
>>> +);
>>> +
>>> +DEFINE_EVENT(xe_vm_pgtable_update, xe_pt_commit_unbind,
>>> +            TP_PROTO(struct xe_vm_pgtable_update *entry),
>>> +            TP_ARGS(entry)
>>> +);
>>>    
>>>    DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
>>>                      TP_PROTO(struct xe_gt_tlb_invalidation_fence
>>> *fence),
> 
