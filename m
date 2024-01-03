Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C41C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 18:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DE510E332;
	Wed,  3 Jan 2024 18:15:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E5D10E332
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 18:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704305754; x=1735841754;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HPxrdAjCQM6VebMJc9OV/4Q5NcS0NJ+Z5SfFC+eGEyk=;
 b=UBJmZGJbQNXZYTqLroH6WuqrP9+tbSQIEI1DGciYiVmCj/oq4mu20XLD
 LAW1F8E4Xi8Ly6SGE1fNDAnGyD9e4QfZ3J2FroCt2t2IpDmbg9Ldgp6UL
 qULFklYCgt6LPdmFjUqzhyhVz8xraFKqbUdScYp9e5lojGNN1vc9NEHX4
 bVfd+5FA6633b8SLSJPGNagcz28NczeSEXlatTzttxMwdxCYOdaCQMxA8
 IA97rozUMvsV+Q1z55Km6dLdxn/GKBWQNG5CiVcXab0b2bJPQ/SWSq2Dr
 MkK0KIQUY5jBROEyUpHwgu+KL5LV6zMJtYOqGrfMwzzJlJDK/WzoKFpgr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="396773989"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; d="scan'208";a="396773989"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 10:15:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; d="scan'208";a="14570869"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2024 10:15:54 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 10:15:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jan 2024 10:15:53 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Jan 2024 10:15:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYDtlENaar+Wu8C3yYxXZ7IKiRyFbGXHJJln4geIsbxFpCMzzvlx/7iW7JYhFs9Ukvi6WjQBjtwl+VhvskulEX8UeQQaPNMn5WuaAMlyAcjPMQESCu8D2iuMcV3tPhdEuv0EQinDlaSdn0FrIstwpSgntJtNY6FYa78tOqYztiTghClTmIgOx0aKD5AEvNqFQwBvXsCfeC0joAQtpTPorbiseYVacFq7R31w5cL9mjzPJ7Zs7I7l6dcEl+vDqXLM2UA7y48VVsYcMCdyApEjd+36nE7L6+jOiml8xn4LOQ3ZR8jObZC38Vq0EACui3tvYl8tr6j3c2Ba1SRsBorJBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YsQdoJeLVdFI0wOOPCeoL6/7saz5+hDJH9yOCs9fJE=;
 b=YlHRpkMSWQKsEPoZBDE32fBDVdH7G+eJFFvL9Z5QsBaXxKqkTy/H9LyWJjqNl77wN30woRgbDFPE3u+XxV2UR8uYYR269piTLTmOSGVkV5bmb1NLUCxAqnefnYn04/BEexVkX7xW8A16B9Zdi7mXxuX2hhIxxG7T4X/+pvbAFkswcG3GODuYOaP7rL6VL1Fp3b9m2uYQxCSD3X/NVudYSXPa/wqLRs8RRhXwDGzFIPHTBaRtEoTtBG2obPrGtvVbrAEUZCEh11iZhOFqxNMemuEQFFaGGQJRrm7erLDm8GqWfdfqgTsGZUtaveC+VtGneh1oLnY0AY58xdIJNxnLYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by DS0PR11MB6470.namprd11.prod.outlook.com (2603:10b6:8:c2::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7135.25; Wed, 3 Jan 2024 18:15:45 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e%7]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 18:15:45 +0000
Message-ID: <0b6616d8-7ffc-4ab9-bcba-eb13bd29cb7e@intel.com>
Date: Wed, 3 Jan 2024 10:15:43 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe: Add exec_queue.sched_props.priority
To: Matthew Brost <matthew.brost@intel.com>
References: <20240102211731.6720-1-brian.welty@intel.com>
 <20240102211731.6720-4-brian.welty@intel.com>
 <ZZUWuCOF5TedDHV2@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <ZZUWuCOF5TedDHV2@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::8) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|DS0PR11MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d60173-53c2-4739-63af-08dc0c880124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uHIB5uOm4Itm46SiA/Pm6BGlPzBdMtgRe1qywy6oaqbmR4AZ6WiDUV1UTdCnMaRwMe6imIx6oI4TS6+bpj/ShI1TfWEsHtZWFJfOktUtogJkoGOAbvSc6c6R3c7iDJbxS2Rzv6bXkjvdkcUvO4muIriON496avKSp4BtUatrVKL8KmA9HtIcwWrrS2tSE7IMA2JpkXmECmK1e+/vnRRYM4Fk/5ESf6Wg+bV/5itqo+3U5ziAojbz0weZmsSMOBV0H2ejyuLv2Eyw9h0XBEaccm2lF4qdIGTx2uil9NC73q/1kEw9WmWVZgUTfUyx97PCRpPSmA+8FfQaXavPnugHpf5DL59+7pZ1OntyJPT2p7D+xk+gXeEtEZhE5XWN7tWEIrJMX4VZQLe+rud7s+qBZX4z0DA8fMXx80QNhVMTNK9TcPyTDui9OlJBQs05qYtPrlvTwy+WM+rC1uxQbezJj4DjfcD3Zhuk2Su1qYKiUDqs0IT35EcG8TuT7GerWi++OJhICrLM9CBz2QGsJVWRi7BvvtMR/S69osArSz/rBIi0Hl00NqC79Qp2IAO9LxleGvKQTWz2AeQu3r5px0+7cJZpzAN9CDuQNc52pLKdQEgMJQ0ELW3SbAsBnVBblBbHKPDKM+l60tKMFjIUBwDiDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(136003)(346002)(39860400002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(316002)(86362001)(6862004)(6636002)(4326008)(37006003)(66476007)(8936002)(8676002)(31686004)(66946007)(82960400001)(31696002)(36756003)(66556008)(5660300002)(38100700002)(478600001)(6512007)(2616005)(26005)(53546011)(41300700001)(6506007)(83380400001)(2906002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGJvaEg4amR0OWdULzdDU2hFd3BiR2tmUDNPY09ic0V5SStUc2RFMm9VNmto?=
 =?utf-8?B?S2JqT1dwWjU1U0VOdE1zbTZQcldXYTdWVVJvZXFVZ0tDU3JJZVNVVTJMb2FF?=
 =?utf-8?B?S1JwYkhCcm90OWNLYVB5Z0JVeDhQeU9XczBqeWg2bzdFQjQzZ3BubXpRalk2?=
 =?utf-8?B?Q0VEYlNLQkhrSG14bG9SaDgxSGd0UGlTR1VKRXc2bmdJdGQ2MjVsOGgyNU1N?=
 =?utf-8?B?TkJseHR6ZURobmNjbjN0K0xQNGdERTdHTXlUUVZ0K1o0bk5keU0yckk4MVBh?=
 =?utf-8?B?Y0tZd3JQaW90WUlMOUFkbnVUazQydERsWjQ3Nml2M29ETW91SitHOVZWd1I1?=
 =?utf-8?B?bUJnT1lvNmpMa2NvRmM1cmFmUlFiNDZvQlY4eUVjU044dmRQeHlubmZ4c1V5?=
 =?utf-8?B?OGg5UmhQaCtpSkdMR3AxVU51ajM0cGVEYTNtSWN2QnBxeDQxNjRPTXRxbXgx?=
 =?utf-8?B?dXJEc1p5NForelgxVEhQZXBzbGRCUitvOWwvcjJWdC90TFRYcDVZSzdPZ04w?=
 =?utf-8?B?V0xKQUNpVi9xV1N0azRUUlBCbkNwK3F1UjExQUdRWkJGRVdwajZBZjBpMTgz?=
 =?utf-8?B?UW9odUNvUStndWRwME05L1FpZURlU1BWMzdPdG1pbUdIdUsvQW9nQmlIa3g1?=
 =?utf-8?B?enBNeXdMbUZ4SWRsTk1BbHhzMk05MVF2U1R3OVZEc3BjdFYrY1p5bExtUHdn?=
 =?utf-8?B?aTZWTU93MHJRRW1wZHUrQzFrWlBibHBLc3hNVFB5YU40WnJpMlV1eUJSdUVs?=
 =?utf-8?B?Z3ZoOFJwMWJHWW9YaEZkYmxUbkttRWI5SGJnOXZZb01MZ3MwU1h0TFlnbHl1?=
 =?utf-8?B?WnBOQXlzT2pWTDFtNGU5dFhUUSs1Z1h1QzFKRUxvb2o1TU5kZ0dhcWdxSW9S?=
 =?utf-8?B?bWRvdmRXU1Q5M0hDTkQwQmNOSWdSaUdIdkJLZ1l4dERORTdyRHd2a1Z4SnVR?=
 =?utf-8?B?VGNxcFBBZWhlNnhnWEp3OVZLdStxWGE5VjYxSHNUaTB3a3V3OGJaUitUMEpz?=
 =?utf-8?B?SFF3MHhyWmJ1NEZDZmtiYkp1WDcxZEdVcHQwVVd3R09xVFA2SXZCcVNZTjNz?=
 =?utf-8?B?R1lSd2lhUjVpckhLaTFGMUppaUtacXhLQ1l5TmRNZjhobGxrZStZNFZCdFgx?=
 =?utf-8?B?S1J1T3lJNVBOcnJTTzk4Wm1yNkhwTmdMb3BqR3VvcUR1eEhNblZURUxQc3d0?=
 =?utf-8?B?V0MyendiQ3VzelRmUmdwM1ZpRVpJL0FGRFFuNHFJVFQ1ZVpjMWthSnExYkZ5?=
 =?utf-8?B?d284L2FxUmtBNVc3TTNxckU3VFRTNUFBV0cvZ25WVlZNUEtyZXZSa0VQL3pN?=
 =?utf-8?B?YWhIM2wrdTA5MmZLdzNsWW40M3B5cmd2bjZHaFFaalZua1ZkMTZhTDdFNllt?=
 =?utf-8?B?Wkdodi9uaWVDdUdpSlpoR2FUbnVmN2ovU0E2T1JYVUVvSjZEdVhCRTAwN3dh?=
 =?utf-8?B?S3BEalhLMzlSS24yQ0Z5amhSbllZOHJyc0F6VTdIQzI2WWtFVCtBUWY1eWtw?=
 =?utf-8?B?STJNREVxa2NtMDF1MDlLY3poRWpOZVZtNTltMDZqQVVTcDZaUW9qMGdtV2p1?=
 =?utf-8?B?WFpsVVVMYng3NkN2WEtyTWFweC9nTlJLcElvam9HZUhxd3hkRWYrOHBBaEdZ?=
 =?utf-8?B?MzUvaGJGUDFhSGM5elh5OEFIZnIyODVtZWpSV3lGeTdEME12bzdWNWFGd2hZ?=
 =?utf-8?B?ejVCenRvK1RNNzlyOUZrWjc3SW0zalI5aFJRUlE3Z1NlaEVndWJUUkRRaUtv?=
 =?utf-8?B?b3B6bGd6aEc1RkZVQUhjRm9BZjU2TnRjUG9VZTNsWWZYM0hWSUxQZmMra3F6?=
 =?utf-8?B?SXFjU2pSNmlhUXJaSStsOEtaSURLZFNjUUpGL1ZKRm12WnNXK0ZpNWNwSDRq?=
 =?utf-8?B?b29haVU0cHBsaFVIci9wSjMrSkJDaFdrS0ZjUVdLMnc5d0YwVFBHbEQ3a0Fw?=
 =?utf-8?B?Wk52dzIvRFVuRnhVdnFTVDdVRm5QRDFNYTNGSnFRZTZWaVBnd2VsTzYrMTRi?=
 =?utf-8?B?UGQvb0NHZ3Z5TGpVYnNpa0JwTVZ1V0RVOHNjUnhGTEdkdXNxTEgyd09ZUGYz?=
 =?utf-8?B?bEU4UmFXVFJ5djlQeVJpd2NZMkMrQjBSMm1GRHRwY29Ha2U4YTJaVi9OUkhl?=
 =?utf-8?Q?FeolxnP/WiFDh76pgRiSc1vUz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d60173-53c2-4739-63af-08dc0c880124
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 18:15:45.5498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1oZbPyQuEbv3tp6gXPZI0GjEZ06WyVf0pDVBW7kwpbB5ItHkjVYS4zTmOZSsuXkMo3c6Qpp5Sro5MAzVL+VBEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6470
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 1/3/2024 12:11 AM, Matthew Brost wrote:
> On Tue, Jan 02, 2024 at 01:17:30PM -0800, Brian Welty wrote:
>> The purpose here is to allow to optimize exec_queue_set_priority()
>> in follow-on patch.  Currently it does q->ops->set_priority(...).
>> But we'd like to apply exec_queue_user_extensions much earlier and
>> q->ops cannot be called before __xe_exec_queue_init().
>>
>> It will be much more efficient to instead only have to set
>> q->sched_props.priority when applying user extensions. That value will
>> then already be set to the user requested value. So the setting of
>> default value is moved from q->ops->init() to __xe_exec_queue_alloc.
>>
>> Signed-off-by: Brian Welty <brian.welty@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c       | 1 +
>>   drivers/gpu/drm/xe/xe_exec_queue_types.h | 4 ++--
>>   drivers/gpu/drm/xe/xe_guc_submit.c       | 7 +++----
>>   drivers/gpu/drm/xe/xe_migrate.c          | 2 +-
>>   4 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index e78b13845417..9891cddba71c 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -67,6 +67,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>>   				hwe->eclass->sched_props.preempt_timeout_us;
>>   	q->sched_props.job_timeout_ms =
>>   				hwe->eclass->sched_props.job_timeout_ms;
>> +	q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
>>   
>>   	if (xe_exec_queue_is_parallel(q)) {
>>   		q->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index 882eb5373980..6ae4f4e2ddca 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -52,8 +52,6 @@ struct xe_exec_queue {
>>   	struct xe_vm *vm;
>>   	/** @class: class of this exec queue */
>>   	enum xe_engine_class class;
>> -	/** @priority: priority of this exec queue */
>> -	enum xe_exec_queue_priority priority;
>>   	/**
>>   	 * @logical_mask: logical mask of where job submitted to exec queue can run
>>   	 */
>> @@ -144,6 +142,8 @@ struct xe_exec_queue {
>>   		u32 preempt_timeout_us;
>>   		/** @job_timeout_ms: job timeout in milliseconds */
>>   		u32 job_timeout_ms;
>> +		/** @priority: priority of this exec queue */
>> +		enum xe_exec_queue_priority priority;
>>   	} sched_props;
>>   
>>   	/** @compute: compute exec queue state */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 6cbf41ad9c8c..0bd79089b633 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -421,7 +421,7 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>>   {
>>   	struct exec_queue_policy policy;
>>   	struct xe_device *xe = guc_to_xe(guc);
>> -	enum xe_exec_queue_priority prio = q->priority;
>> +	enum xe_exec_queue_priority prio = q->sched_props.priority;
>>   	u32 timeslice_us = q->sched_props.timeslice_us;
>>   	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
>>   
>> @@ -1231,7 +1231,6 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>   	err = xe_sched_entity_init(&ge->entity, sched);
>>   	if (err)
>>   		goto err_sched;
>> -	q->priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
>>   
>>   	if (xe_exec_queue_is_lr(q))
>>   		INIT_WORK(&q->guc->lr_tdr, xe_guc_exec_queue_lr_cleanup);
>> @@ -1301,7 +1300,7 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
>>   {
>>   	struct xe_sched_msg *msg;
>>   
>> -	if (q->priority == priority || exec_queue_killed_or_banned(q))
>> +	if (q->sched_props.priority == priority || exec_queue_killed_or_banned(q))
>>   		return 0;
>>   
>>   	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
>> @@ -1309,7 +1308,7 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
>>   		return -ENOMEM;
>>   
>>   	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
>> -	q->priority = priority;
>> +	q->sched_props.priority = priority;
> 
> Patch LGTM but noticed this is an existing bug - priority should be
> changed before calling guc_exec_queue_add_msg. Can you fix that in this
> series too?
> 

I see that now.  Will include fixing that.

Please see question below...

> Will give an RB on this patch in next rev.
> 
> Matt
> 
>>   
>>   	return 0;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index adf1dab5eba2..6567abcb3c6d 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -356,7 +356,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>>   		return ERR_CAST(m->q);
>>   	}
>>   	if (xe->info.has_usm)
>> -		m->q->priority = XE_EXEC_QUEUE_PRIORITY_KERNEL;
>> +		m->q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_KERNEL;

I wondered. Is above correct way to adjust priority?

should it instead do:
    m->q->ops->set_priority(m->q, XE_EXEC_QUEUE_PRIORITY_KERNEL);
so that GuC is aware?


>>   
>>   	mutex_init(&m->job_mutex);
>>   
>> -- 
>> 2.43.0
>>
