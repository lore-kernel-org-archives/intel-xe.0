Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D7DC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 18:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C30310E08E;
	Wed,  3 Jan 2024 18:16:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D121110E08E
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 18:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704305797; x=1735841797;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dslm2zTPjEsj6LgE4zaPyMPhWL72P9wl1FTCtnkWBLw=;
 b=Iak/zu7TL5GY2M5icWJvZIKYqSUDxFxT4EkLoXM+JHIFVET0KlNqIDNt
 FKNXmj3WRS8QzVFk6RTX2IlpArQoCHY1KxFDcz9UgULexzP293wLQE/lg
 O2mzgJxnkW/KUThy54EubDFwdpWJY2md+N3lsuUYPxy6mTfrEh35QU/21
 ER6l02zKbN6RmxqDneWI0nRNpiequh1e6vEwwivaFi+siZkUbHDcmUgym
 QwxVbpqlXyOdxv49+5WoPLTKr4bzG+1FQhHSQaT+SXI6sd4LtCrKzhKEx
 0jJRaPB8nSTxF8n3XCcDSJutDKns/b8tXpwXi/7GULeOc36ssOexj1onx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="461352307"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; d="scan'208";a="461352307"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 10:16:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="780055528"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; d="scan'208";a="780055528"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2024 10:16:37 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 10:16:37 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jan 2024 10:16:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Jan 2024 10:16:36 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Jan 2024 10:16:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FI3bc8A4Rnd1u1eMbxlUKA8vs3l13zVrzwKv/cEO0ogFd/C6UQS0AUdkKmUCQQKi0r/TQsiRpyFfrIMptdIE5uHZliU2RXKFgUWZeq6CZeucSunqVxBrpJin3dmwGT8SO7admfC73FZoS7ohFrOPLVvqUQRpgQ7AXpZC+ZWzsJvGaMNADGmimlGUhJjOuMeqCaA3De7x7e8tLGFpYmMPwecPcX2i2wk12onDHIWyl14XOkrBVZbuDa9c+eEj1fngBHWQgXwvewFSU/avxQ9LYhsjbI/K88Q0mJdFlPGeDSZJcfpdmeQhSasJCXBnk5wm75ng/o2Mod92NB+rmXHs1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYUvwKPq3vAwDzwmJ91lpj6J0wWGvPZVdU4x5UxFguE=;
 b=jfisVPdt+GtqdoeLLfBy6DvMGNY4z9MHDomgwogc90fIMEybU1lytORqS9V7vLsR43jz68EjB1muquoebOrnRpyHKxT3EtkR6JBrdMEav3vqKAql3BBrax7SRmlxcylJi/zRqHbH4VxV9zIjOb6ClRnPOtREoF9xJL88vmPbaNO2UWKjLaNUtnabehN1RjdQN/uafN9Lbsat4M2551f6rRuzUHN9kpbiVuqkYOPfqXLD97lxFm6ePnrXs3+dP+IZBoF2WTjYMwNj1wQfOM0xqgEl5YDrvih9JfMi78hfbMYeHRm1iNYFeoQs3esrVxhPKQkO+cHk2ecdecnNaTKtrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by DS0PR11MB6470.namprd11.prod.outlook.com (2603:10b6:8:c2::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7135.25; Wed, 3 Jan 2024 18:16:34 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e%7]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 18:16:34 +0000
Message-ID: <66f32564-1602-409b-9c60-b38ec1414199@intel.com>
Date: Wed, 3 Jan 2024 10:16:33 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe: Finish refactoring of exec_queue_create
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20240102211731.6720-1-brian.welty@intel.com>
 <20240102211731.6720-5-brian.welty@intel.com>
 <ZZUVt8eBvfXls8oC@DUT025-TGLU.fm.intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <ZZUVt8eBvfXls8oC@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::8) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|DS0PR11MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: 512e6181-0c83-40d1-4a13-08dc0c881e1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YYULGr7GG1zJAvFCur6jmNY03QEZ9T5ij8/Q63OOkr8SqqVOa8+y+0FEnXSOcaSc+FiMaoVVAZsiKa36pnBkd2T03fH2O+qaYleCQk+Vfy6ahI4NFHlcSo6pYoCUOQgrm1Pdo0Dm6yWw7CF8IlCK9PIBBe6G5nodwvHaKNmMqxVscYwYQFgQBHLPl8W5gIj91wQHGZdBpaNIQ9uGZzVmKpLsJL/LqWQUTr/1+RCE00jA2uUD5HZ6v7iZ3KqERduV87UJStI5yIZjFml2bfsFCUz3685tODmoe0SS7aYF8mYyiMWVneglqapgiuOp3z/FIRe9VONE/HeLtX9dWqDFk0Wf0C6L8ggTHlWJwl6abwIa6ILQVWpcOwfkfKvvWEQJBxCjfl/GNkkLV2beYhgzrN/O7KorJ5l7u+2MkXPjcWFL3pyjJmK1T5k5siv5hLGQmosx0PxensWnN50V5CEtj80eb5Z7NnQ8A+xmC8+3jDNZSEP3Hnzz5nPdOLdZAe6Q/xqkWRnLi8u2vvv3HQpyVtDtnbrd/aCZyh/yN2NYnDikxWvEsJXnHPYZNaMwDt1VLF2INmXqMVemnPuSyV3/e/FF8GvB4XVP4eaMg/gQjiMePKU0TSdg5NBv+4jcbOGnEgZ7vWO7oX1nSqm6LSuHIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(136003)(346002)(39860400002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(316002)(86362001)(6862004)(6636002)(4326008)(37006003)(66476007)(8936002)(8676002)(31686004)(66946007)(82960400001)(31696002)(36756003)(66556008)(30864003)(5660300002)(38100700002)(478600001)(6512007)(2616005)(26005)(53546011)(41300700001)(6506007)(83380400001)(2906002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUY3eURFcmkrQmx4SFJ1MkxRQUU2S3pkb1R4WHdSdXVaamExVlNiemNXQk5u?=
 =?utf-8?B?NjNqZXpGbXpSZ2NTczdTVWVRbW5Ea0NmdnRPS0RJclM4cjVLVitDSGVHeUls?=
 =?utf-8?B?Ty84QkVoTlRnei9HNVN3TVdva3BJVGFSSTVNMWpGUittVjFWRFZCNXpuYVNs?=
 =?utf-8?B?MFBUKzlTc0hnQllROXY2TUpKUTRqajk1RU1Ud2M0cFJFRFFTR0x6SjJsdFdF?=
 =?utf-8?B?dmJwSUNmRy9ReC9XZHExMUxzemZIR0t6bTRydGpuWEplVlpaTFdidVpNOFVw?=
 =?utf-8?B?MWVzRHhWdytiWWpuY0o2MTR6WkpLWDA4dVdDYnA1K1MwQy94dUU4Sm1NYWpw?=
 =?utf-8?B?QnVFRE1pamIzamxVY2pIQlRjb3JkVXR0SlhUY0I3UUhkbFM5cEFVWEo3cVZT?=
 =?utf-8?B?N2kwMUNDZDByaHlDYzZlVWNCV3NFNGxHRmowWExvd1ZyTnFEbks0b3didlZz?=
 =?utf-8?B?Y1kvY1FGL2dKM1UxZW9nYVByempkbnU3K2JvaWdHdmhNVm1sRE5aVVJvbzFi?=
 =?utf-8?B?TkdkeTZ5Y1U2OWo3M3pTSlRUS0hXcUUvcTBIMGJHS0g3RUEvYm5kbGRjNDBm?=
 =?utf-8?B?US8zRS84UkltZkRtYXNvems5SUlhWWpnUG8weDJHQkVmcG5IYjZmSm4vZDh2?=
 =?utf-8?B?NFE4cCtzcnhnNWJtVENyN3R5Q0xwWitOeCt4Z3k5L0hBUUNoZGJIRDZXWU5z?=
 =?utf-8?B?MEYzaVRNWWpBVHdERXRwaGw4NUdhRlQ5U3o4T0g0SktrdUNoQUhkczN6Q1pU?=
 =?utf-8?B?S2thMWo1dG5IL3hIRFZiRWJ4eXYzK2liMTVvcWZuVGlpdCtWYVN0NEYzMkx1?=
 =?utf-8?B?aGxtZldxTlhHd2JqSEw4azB5T1ZsWlM1MkNnMkJKTGZWUDcxSWRDMytvbWRu?=
 =?utf-8?B?QlBDOFhwSCtxeUo0ZEpPY0gzcUZMOWxqalBGZzI3Nyt0UDJ2dHpOSVV1MTJY?=
 =?utf-8?B?dTZadGcrd3EvZmpKUXJvVDlvYU1CZ0hPYkYxWTJBUEFXMFVmUk8vNjBmZVg3?=
 =?utf-8?B?U1ZyY0JTSHJ5Y3VqRXJUT09admg2Y2Zlb1JCYU9MYUE2MVBWd3NwLytCYjc1?=
 =?utf-8?B?bjFpNDNsbWJtSXdoZjB5a1RIZC9SL1FvSnBSWjRaeUQyRFBob1BmZ2hvU2xQ?=
 =?utf-8?B?OVp3dWh4TWRxMGRYRzNRUXlmNmFNVGN1dkF0Y2ZmNWZBYUEzWEZmR1pyZW12?=
 =?utf-8?B?MmxpdHIzOVpKa1ZobVcwZFlSWDFaeUpIU0RlYTFFbjE1QWsvMmtXUmhFRVVP?=
 =?utf-8?B?MExJeC9OSjBjL2lELy95cHJwNGVCUzBlTkhMTXNJL0FjZkNPUmIvMVN1V2p4?=
 =?utf-8?B?aGt4Y1hvQlJ1QW9aT3VTNUc0MGZVVElLQ2ExVThmRE1VeFJ2TTZOWlE5eHZr?=
 =?utf-8?B?bXN3bE5Qc3B6ejdnblV6ajRxY2ZIRWNCTWlrRE1hRFBJam1rb0VyLzh5bEhp?=
 =?utf-8?B?UE0rRndGZWhJbEhtUVJMVC9Zc0VMQWIxZVRqTXJqVEpFOXFBcURsaGVucisz?=
 =?utf-8?B?Wk5HaWszVmYxdEp1MnRQSXpNaVlFeC9nWjZTcDJqVVg0bjhUWGRSbGRJYlN1?=
 =?utf-8?B?M0hrRzdQZWFMRzhNVWRlMVNTMlV0cGlkVzdTTzFJdXRZR3VYdFdSNExpU3BB?=
 =?utf-8?B?Sk83N2pCcklqOGlMdjh4R1VJbGFjOG5QVjIxQ2d6bFY1ZElaSmpHUHNPY284?=
 =?utf-8?B?MkJtN3NicVB3MTdEMXNra2g4SVJIV1pSb3A0bGFkV3ZERFZjQXhRUDdWSXlG?=
 =?utf-8?B?VVErZGV1cFhGUzY5MU5nZVBiU0FpSDdjR2FaNHp3N3hsVWJyaTI0eENmR08r?=
 =?utf-8?B?TVM2MjV4Sm51RFh2TTIzYTkzbFJJbW1Qa3UvZkxocVB2SnVHLzZrOXhHQkhv?=
 =?utf-8?B?RGZZc3RhaGhhd00xQVlLR0xFL3VKYnVpeGkvY0lMNnZBZ2M4Uy8zNitFS3hC?=
 =?utf-8?B?WFJ0QmxwMmpqMTlJTlVsUURRTlJ4L3ExUTNyQkpZWUlFS08rWjRUWHdUM0VO?=
 =?utf-8?B?SHY0Mm1BV3pmdFRRcFArcVlHOTczWWVHeDh4RGxHcWpSL2dJc0w0NUh6eFZ6?=
 =?utf-8?B?eVZQVTM2OVU3SUo3MmNYS2ZLRDY4czFpWThNNFRYdkNuUTRhVzkxR3FXOVZa?=
 =?utf-8?Q?Fzem6kYwoMoWuPeCnfBf3i8Oh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 512e6181-0c83-40d1-4a13-08dc0c881e1b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 18:16:34.1183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHRM7rIaN7U+5BIVA5nulrMYY6KldWskL93bPPaeFp5htCadHHdl6QcG/OVb6GsO5DOhEE+z83c/uYx0PHV/Vw==
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



On 1/3/2024 12:07 AM, Matthew Brost wrote:
> On Tue, Jan 02, 2024 at 01:17:31PM -0800, Brian Welty wrote:
>> Setting of exec_queue user extensions is moved from the end of the ioctl
>> function earlier, into __xe_exec_queue_alloc().
>> This fixes bug in that the USM attributes for access counters were being
>> applied too late, and effectively were ignored.
>>
>> However, in order to apply user extensions this early, we can no longer
>> call q->ops functions.  Instead, make it more efficient. The user extension
>> functions can simply update the q->sched_props values and they will be
>> applied by the backend during q->ops->init().
>>
>> Signed-off-by: Brian Welty <brian.welty@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c | 74 ++++++++++++++++++++----------
>>   drivers/gpu/drm/xe/xe_exec_queue.h |  3 +-
>>   drivers/gpu/drm/xe/xe_gsc.c        |  2 +-
>>   drivers/gpu/drm/xe/xe_gt.c         |  4 +-
>>   drivers/gpu/drm/xe/xe_migrate.c    |  2 +-
>>   5 files changed, 57 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 9891cddba71c..8a2d51b994cf 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -30,14 +30,18 @@ enum xe_exec_queue_sched_prop {
>>   	XE_EXEC_QUEUE_SCHED_PROP_MAX = 3,
>>   };
>>   
>> +static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue *q,
>> +				      u64 extensions, int ext_number, bool create);
>> +
>>   static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>>   						   struct xe_vm *vm,
>>   						   u32 logical_mask,
>>   						   u16 width, struct xe_hw_engine *hwe,
>> -						   u32 flags)
>> +						   u32 flags, u64 extensions)
>>   {
>>   	struct xe_exec_queue *q;
>>   	struct xe_gt *gt = hwe->gt;
>> +	int err;
>>   
>>   	/* only kernel queues can be permanent */
>>   	XE_WARN_ON((flags & EXEC_QUEUE_FLAG_PERMANENT) && !(flags & EXEC_QUEUE_FLAG_KERNEL));
>> @@ -50,8 +54,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>>   	q->flags = flags;
>>   	q->hwe = hwe;
>>   	q->gt = gt;
>> -	if (vm)
>> -		q->vm = xe_vm_get(vm);
>>   	q->class = hwe->class;
>>   	q->width = width;
>>   	q->logical_mask = logical_mask;
>> @@ -69,6 +71,21 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>>   				hwe->eclass->sched_props.job_timeout_ms;
>>   	q->sched_props.priority = XE_EXEC_QUEUE_PRIORITY_NORMAL;
>>   
>> +	if (extensions) {
>> +		/*
>> +		 * may set q->usm, must come before xe_lrc_init(),
>> +		 * may overwrite q->sched_props, must come before q->ops->init()
>> +		 */
>> +		err = exec_queue_user_extensions(xe, q, extensions, 0, true);
>> +		if (err) {
>> +			kfree(q);
>> +			return ERR_PTR(err);
>> +		}
>> +	}
>> +
>> +	if (vm)
>> +		q->vm = xe_vm_get(vm);
>> +
>>   	if (xe_exec_queue_is_parallel(q)) {
>>   		q->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
>>   		q->parallel.composite_fence_seqno = XE_FENCE_INITIAL_SEQNO;
>> @@ -124,12 +141,14 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>>   
>>   struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
>>   					   u32 logical_mask, u16 width,
>> -					   struct xe_hw_engine *hwe, u32 flags)
>> +					   struct xe_hw_engine *hwe, u32 flags,
>> +					   u64 extensions)
>>   {
>>   	struct xe_exec_queue *q;
>>   	int err;
>>   
>> -	q = __xe_exec_queue_alloc(xe, vm, logical_mask, width, hwe, flags);
>> +	q = __xe_exec_queue_alloc(xe, vm, logical_mask, width, hwe, flags,
>> +				  extensions);
>>   	if (IS_ERR(q))
>>   		return q;
>>   
>> @@ -174,7 +193,7 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
>>   	if (!logical_mask)
>>   		return ERR_PTR(-ENODEV);
>>   
>> -	return xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0, flags);
>> +	return xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0, flags, 0);
>>   }
>>   
>>   void xe_exec_queue_destroy(struct kref *ref)
>> @@ -258,7 +277,11 @@ static int exec_queue_set_priority(struct xe_device *xe, struct xe_exec_queue *q
>>   	if (XE_IOCTL_DBG(xe, value > xe_exec_queue_device_get_max_priority(xe)))
>>   		return -EPERM;
>>   
>> -	return q->ops->set_priority(q, value);
>> +	if (!create)
>> +		return q->ops->set_priority(q, value);
>> +	q->sched_props.priority = value;
>> +
>> +	return 0;
>>   }
>>   
>>   static bool xe_exec_queue_enforce_schedule_limit(void)
>> @@ -325,7 +348,11 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
>>   	    !xe_hw_engine_timeout_in_range(value, min, max))
>>   		return -EINVAL;
>>   
>> -	return q->ops->set_timeslice(q, value);
>> +	if (!create)
>> +		return q->ops->set_timeslice(q, value);
>> +	q->sched_props.timeslice_us = value;
>> +
>> +	return 0;
>>   }
>>   
>>   static int exec_queue_set_preemption_timeout(struct xe_device *xe,
>> @@ -341,7 +368,11 @@ static int exec_queue_set_preemption_timeout(struct xe_device *xe,
>>   	    !xe_hw_engine_timeout_in_range(value, min, max))
>>   		return -EINVAL;
>>   
>> -	return q->ops->set_preempt_timeout(q, value);
>> +	if (!create)
>> +		return q->ops->set_preempt_timeout(q, value);
>> +	q->sched_props.preempt_timeout_us = value;
>> +
>> +	return 0;
> 
> 
> Nit: I found this tricky to read with indentaions as is, how about:
> 
> 	if (!create)
> 		return q->ops->set_preempt_timeout(q, value);
> 
> 	q->sched_props.preempt_timeout_us = value;
> 	return 0;
> 
> Just my preference. Same for all other cases.

I like it better too.  Will change.

> 
>>   }
>>   
>>   static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue *q,
>> @@ -376,7 +407,9 @@ static int exec_queue_set_job_timeout(struct xe_device *xe, struct xe_exec_queue
>>   	    !xe_hw_engine_timeout_in_range(value, min, max))
>>   		return -EINVAL;
>>   
>> -	return q->ops->set_job_timeout(q, value);
>> +	q->sched_props.job_timeout_ms = value;
> 
> set_job_timeout vfunc can now be deleted, right?

Agreed.  I'll delete as a next patch in series.

> 
> Everything else LGTM.
> 
> Matt
> 
>> +
>> +	return 0;
>>   }
>>   
>>   static int exec_queue_set_acc_trigger(struct xe_device *xe, struct xe_exec_queue *q,
>> @@ -651,6 +684,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
>>   		for_each_gt(gt, xe, id) {
>>   			struct xe_exec_queue *new;
>> +			u32 flags;
>>   
>>   			if (xe_gt_is_media_type(gt))
>>   				continue;
>> @@ -669,14 +703,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   			/* The migration vm doesn't hold rpm ref */
>>   			xe_device_mem_access_get(xe);
>>   
>> +			flags = EXEC_QUEUE_FLAG_PERSISTENT | EXEC_QUEUE_FLAG_VM |
>> +				(id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
>> +
>>   			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
>>   			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
>> -						   args->width, hwe,
>> -						   EXEC_QUEUE_FLAG_PERSISTENT |
>> -						   EXEC_QUEUE_FLAG_VM |
>> -						   (id ?
>> -						    EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD :
>> -						    0));
>> +						   args->width, hwe, flags,
>> +						   args->extensions);
>>   
>>   			xe_device_mem_access_put(xe); /* now held by engine */
>>   
>> @@ -724,7 +757,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   		q = xe_exec_queue_create(xe, vm, logical_mask,
>>   					 args->width, hwe,
>>   					 xe_vm_in_lr_mode(vm) ? 0 :
>> -					 EXEC_QUEUE_FLAG_PERSISTENT);
>> +					 EXEC_QUEUE_FLAG_PERSISTENT,
>> +					 args->extensions);
>>   		up_read(&vm->lock);
>>   		xe_vm_put(vm);
>>   		if (IS_ERR(q))
>> @@ -740,12 +774,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   		}
>>   	}
>>   
>> -	if (args->extensions) {
>> -		err = exec_queue_user_extensions(xe, q, args->extensions, 0, true);
>> -		if (XE_IOCTL_DBG(xe, err))
>> -			goto kill_exec_queue;
>> -	}
>> -
>>   	q->persistent.xef = xef;
>>   
>>   	mutex_lock(&xef->exec_queue.lock);
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>> index d959cc4a1a82..02ce8d204622 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> @@ -16,7 +16,8 @@ struct xe_file;
>>   
>>   struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
>>   					   u32 logical_mask, u16 width,
>> -					   struct xe_hw_engine *hw_engine, u32 flags);
>> +					   struct xe_hw_engine *hw_engine, u32 flags,
>> +					   u64 extensions);
>>   struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe_gt *gt,
>>   						 struct xe_vm *vm,
>>   						 enum xe_engine_class class, u32 flags);
>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>> index a8a895cf4b44..5b84fc9ab8ad 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>> @@ -356,7 +356,7 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
>>   	q = xe_exec_queue_create(xe, NULL,
>>   				 BIT(hwe->logical_instance), 1, hwe,
>>   				 EXEC_QUEUE_FLAG_KERNEL |
>> -				 EXEC_QUEUE_FLAG_PERMANENT);
>> +				 EXEC_QUEUE_FLAG_PERMANENT, 0);
>>   	if (IS_ERR(q)) {
>>   		xe_gt_err(gt, "Failed to create queue for GSC submission\n");
>>   		err = PTR_ERR(q);
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 3af2adec1295..0f2258dc4a00 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -235,7 +235,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>>   			return -ENOMEM;
>>   
>>   		q = xe_exec_queue_create(xe, NULL, BIT(hwe->logical_instance), 1,
>> -					 hwe, EXEC_QUEUE_FLAG_KERNEL);
>> +					 hwe, EXEC_QUEUE_FLAG_KERNEL, 0);
>>   		if (IS_ERR(q)) {
>>   			err = PTR_ERR(q);
>>   			xe_gt_err(gt, "hwe %s: xe_exec_queue_create failed (%pe)\n",
>> @@ -252,7 +252,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>>   		}
>>   
>>   		nop_q = xe_exec_queue_create(xe, NULL, BIT(hwe->logical_instance),
>> -					     1, hwe, EXEC_QUEUE_FLAG_KERNEL);
>> +					     1, hwe, EXEC_QUEUE_FLAG_KERNEL, 0);
>>   		if (IS_ERR(nop_q)) {
>>   			err = PTR_ERR(nop_q);
>>   			xe_gt_err(gt, "hwe %s: nop xe_exec_queue_create failed (%pe)\n",
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index 6567abcb3c6d..e1615717486a 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -344,7 +344,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>>   
>>   		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
>>   					    EXEC_QUEUE_FLAG_KERNEL |
>> -					    EXEC_QUEUE_FLAG_PERMANENT);
>> +					    EXEC_QUEUE_FLAG_PERMANENT, 0);
>>   	} else {
>>   		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
>>   						  XE_ENGINE_CLASS_COPY,
>> -- 
>> 2.43.0
>>
