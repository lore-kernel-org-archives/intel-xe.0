Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F127C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 19:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0A510EA83;
	Fri,  3 Nov 2023 19:21:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB54F10EA83
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 19:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699039288; x=1730575288;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rJDTMv252bd89dL/k+jId0CPNJsdHdNgcjJZqUTOMVE=;
 b=kUo7Oppq9blOjkFwaMzmM+ThPys0SSI6C4sBDfC2LNB0T4HiY/OSvW5D
 nMiNx18B2ISishQb83WTIKUPg8NHEpwvUYvu7IgIhlmS2BesZXbF6KvaH
 9bdYzXmmtgu6tn2YRRF8EI+O7NYzsnWt+rI1RwNOMFVAukVbp+hhQ8yqB
 rZ3ByJdU3SvJDvTCglw5UAeeucHu48bIi2ohhEiwgannW73k+gF6TUjvJ
 u+gGO7c5WcUGi/qWz7hLC5Gq1GYrVQXnYwFKwAZY3H5xoeFMksj0dXZ8v
 35e2MPCwXJ7cooSrD2KL4w3ytiwLfBdZHlsGAZ/z/2SHu1dhQ+SmHFVSh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="453304820"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="453304820"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 12:21:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="852354075"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="852354075"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2023 12:21:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 12:21:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 3 Nov 2023 12:21:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 3 Nov 2023 12:21:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+OCu1i1JJ2X53zxNAWlvG2w5JoInXQtDbjVAXhHahF75+4Ibp0Qn0hfoyTHxn/HtEZgFxM5ReMeLVXp2TWpPqCUKwWmegOqvv7frKNWCqUnCngtdqV5NWQ4pIxn4XEUXEWHz9n3NvovuGHvxLpcNKegEIrlPbg0qbQygUlsd8f0Qgun2iQ3ZqTFl/5W6uOaVnL5oYOeTlr7XGk5ffqtNDd2d0UeVVUV+LuS6ZPTqLJsXSLjU+5+5rbyYpWlSzeK2V4sBFiUFUMQPonZBM5DukrYsNdFhUJRMDM/8J5PJGL5ihHuyhwp2Jfyli0ukUQ7ZHxDggNGB1qPu95h208zng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lD8tV0LETFRyX/OHtDK818D/NJjnsJfWMHCGxwECEg=;
 b=TyQh4InsqCLMhmEYUAxgB4Wz0SLOTpgsCJTn2LRTuAN6arYSbCDf4hP2eZSAEpQCQEwtkL9MY01zwuNmV2GOTb+LtQuqyFmcNU+Ncho5xvbT/BtMBxxs+YfxSdSUgwZglum0OsQiMp8J7Fjy3gRyN5jZDAXJ1L/V+pS8lUHk5FsstE5UOS9bttdix5vao3aytKFX0bRUz6Cmw2l/hVctR9jkIdkV6k/IlZ8ONOEzvgMUeeYDe+GlGeqqaOJHJhPF8TYYwYgeaSLLwlq7MYnoSFJh7UAwkHBsIRc0nAPukVXfrUYiAf7vsrbJ2Tim66IOz4lXsomm3GNZq9JbbSdNQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by SN7PR11MB6947.namprd11.prod.outlook.com (2603:10b6:806:2aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Fri, 3 Nov
 2023 19:21:23 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::7c9d:a4c7:4e1e:aebc]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::7c9d:a4c7:4e1e:aebc%4]) with mapi id 15.20.6954.024; Fri, 3 Nov 2023
 19:21:23 +0000
Message-ID: <c8fb9fce-fb63-44a5-81be-15222c665a18@intel.com>
Date: Fri, 3 Nov 2023 12:21:21 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231103014309.13927-1-brian.welty@intel.com>
 <9ea0651f8568f87fcf6d20ba0cc74226b490cf0d.camel@intel.com>
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <9ea0651f8568f87fcf6d20ba0cc74226b490cf0d.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0169.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::24) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|SN7PR11MB6947:EE_
X-MS-Office365-Filtering-Correlation-Id: 589ebcf6-8acf-4512-bf2b-08dbdca210e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BpL1iIvmSFjrRSJ6sPccCaIXNfukOlWhikLT4SA1duE7A386XRfyivVrEbTehD9LR7POC+ohxRCivw+4GP8/IN0Mhy9fRAfEx/wbamDJJsEpyU4tMYDaYiEKmdBpAXku32wCmTcAHMw1xXGOyBJxM9vmn4zTE6yVCr6ZFI0RxNMQEZiwiWtupTnOOgP1mn7wXASbFlNdDKAlnyycM9ShyfjeOFnnzJdu2N71Sv0lVJuVRe2SszGnjw9Xhtm/ADWrkdWjJ+V+LpJlIijvT+EjIExoK9HUE6nOwjEYP7jfztC07tAE4sZx7rpOGyJQXDgAVWx8fsK1I3dJp1oWwoa+1eQIhOL3etF2rZjmWQ0qvUwWMfJRAujD7uSz6+SLf4dVv0uXO/MbAKq4pGQIkiiUcEEjnTbsrErHztG1ZxGmuZ0IQvyeT7GdvuBqoPk4zGik99KzR1aTHclmmTqFYEdiz9LONHtDV4E6v+7mey7/Z8eIAuU0CyZxUTVDMReMJhlyVQzB5DkpTDjXa4Us4GUlpa4KCKG03r7Jj44Dh9/0irnurwHdgPDRJfK5jsCkA/WHI3jlBoaxoMTZalt4Z+xlckY9kJMBa+ikmXdwNibLHuVjPP8werjSiBen2Ifz7BPhD+ZKhBuHyKXYr+rORpFbBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(39860400002)(346002)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(36756003)(4326008)(8936002)(8676002)(107886003)(66946007)(26005)(316002)(66476007)(2906002)(66556008)(83380400001)(53546011)(5660300002)(6486002)(478600001)(110136005)(6506007)(82960400001)(6512007)(31686004)(31696002)(2616005)(86362001)(38100700002)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3cxbFdFaTlyVnJWekZRekRQaWNiVTcyTktJUXAycGh2QXdXVjVVb3RkSzVL?=
 =?utf-8?B?TVpLdXdWUm5ublFpd3VQQVFRUURrZEVSWG1EN0Z2ZkZWbGkrWEczdnBITGlL?=
 =?utf-8?B?TkliYkh4bk1PRmhhaENtVUxYOWNBTDBNSlpCVmFmL2pTU2ZJWmhuZjlSS1Nh?=
 =?utf-8?B?RzJyc2pkTnBDRjVSUVVmcUFLMUVFeGxDREFtZ2pkU2t0VGpDU2tqSVdndFlJ?=
 =?utf-8?B?amR1Q3Q2WFp6TkhpYUVyUG1vb0l3Qzgyc1FKQkRqYlJJTkNkdnd5M2hiQzhR?=
 =?utf-8?B?YmowSEh2L3pLTi9QUXByVXJBaWlMSG43RXRvUnVXRUVZQUorRVpJQ2FGK0tC?=
 =?utf-8?B?SmhENURIcWZEZzA0dStmTnFSYVcrVjJnZS9CeHloL1ZpZ1FpcGNlckloUG1v?=
 =?utf-8?B?MlhaSWFueGxtVWVQai9teEVoWmFpNmlmaXFoY2hKb0U4Zng1UlM4eDFUZW9z?=
 =?utf-8?B?MVdEOXYyZjV1RGhJVDVqVFhkMklTdVFCWDhSbHZHK29VZ1REYWlSNTIvQlpM?=
 =?utf-8?B?dHJobHpmazUrLzFRNEdYYXRqaVZXeUJLUnFtMy9QL3AxVmYvZXd2K0JVV01X?=
 =?utf-8?B?bjk5WDg2M0xlNmI3V0NmNnpPNkdjaEhwR1c4eE9iQkZSRGZQZitEVVpqQmVj?=
 =?utf-8?B?TFNhSDA4QzV0MmFaMWhvd3ROVFpxQ3J4RnZ5N0YvaWhmNFdOQW02U3dTWEFr?=
 =?utf-8?B?eW1ySmFkSjZvWSt3dHVjdFB2TzJ1Q3FVZGtQajdLdDBGWDhOcXRtVkxieDRC?=
 =?utf-8?B?ZHdMa0M4aTBRalpwMk82YldqVTJ0QU1SNCtwK3NxV092MnhhdkRUWVRJOHJp?=
 =?utf-8?B?eWFPTWZlbjBwOFpVRmVYUFluRXRac0R6eGFFWFRqTGtnZzVHM3pnRGpIVmo2?=
 =?utf-8?B?V2VBSGV4NGJPbXllSGEyR1ZVSkErYStNR0E0OVp0dVhFU3h3YlJDY0kxUE5S?=
 =?utf-8?B?bzJLS3BnL25GNElBZzloZ0NJTGRkQTdudm5ReUZPQU9wcGpjM0dtcXF1NmQ5?=
 =?utf-8?B?dXpHTFJ6MlpnRFRBTWxydzVEU0QrOWdYaFdzZTdBbk9Dc09Td0JoSDZ0NzFQ?=
 =?utf-8?B?eWFmZmh6UkdlZDJFQ0xBMVZDYXYrK0ZGRU1Dd1F2eXdObkU0SEs2OXNSeDNt?=
 =?utf-8?B?dGxPcTQwSDBlWks3cWg4SmltaTVWSzVReEJGOTNnVEJ4dndXdm1PYjV1WG9Y?=
 =?utf-8?B?TWdJTWhHUml0RDZ3UHdxcG9VeGk5a1lxNVJ2WmZsK1R0L3NCQ280ZktqYkx5?=
 =?utf-8?B?clo2QVFJdlZUZmpwZFhUem8wbTFwalRpbXlPU0RKeTAxZk9Nc1JhM2hHcHdi?=
 =?utf-8?B?bUlhVzZwVXhFS091dE9YeHA4R2hyZEhUcEZoRGdqSXEyMk40V3pDL1E5UzQy?=
 =?utf-8?B?VzJDZloxbEVXeXU5aFphV29JOGZJNTdDK0x1S2FkTzBVazlURzJ6TjZ3Z0FU?=
 =?utf-8?B?Z1hzRW9GandSd05QMk1yZFRhaHFUVzJRUnFnS0JLb0tlaGtsOENIVXdxeGx5?=
 =?utf-8?B?THhLb2Fwck9HNGpBV0RKdEtWNkFDQTZWdnJHcnpGQ1NFbGRyU1l6em1oU1Ux?=
 =?utf-8?B?bGxzOHFDTCttaTR1bWdiSXhRdVpHNjRjSXZuSDBlK3lqdTUzRkdYeFF0cnBB?=
 =?utf-8?B?cWR6TlM0Z1FHdVQyV24wZmxVTlgyU0JrTFdRQUZ6VGpLL0dmNVAyaGRVUXFx?=
 =?utf-8?B?OWxqOGpDTVZMRFAwMnZNNXJWdlpYMHM5dUpCS0hjRXhnTFhyQSsvREtjQTg5?=
 =?utf-8?B?dHUzSVFjQnptZW9nRm53T1B0a1hIeC9yRWY4amhqS1RLRXJyNzVCR0Zrb3g5?=
 =?utf-8?B?aWlOcXdUd2EzRTg1LzV0SklMUG44bUFma0xCNitBb3Y1K3pGcDNQNmQ2WE0z?=
 =?utf-8?B?T0xpb2JyQVdRc0hxaXVweTdyWlFlY1NacXI4TENPckRYSG1wQUhGWkdGOHZE?=
 =?utf-8?B?ZzUrdWNFOGxjcndOaHFVb2E3aEsweDZ1Z0dyYTFYYVBtSzl5ZVlVWHAxNzZG?=
 =?utf-8?B?b1NHc2QxazVQOUFySE9seEFRYzNGcWJhd0t0ZFUwR1UwYmdoMmFYWk9vOTdQ?=
 =?utf-8?B?OXVYd096M2dTVWJWcEh6ZnZnK1gzR0MwOGNOeEt6bEZiekR0c1ZEK09QQlJ3?=
 =?utf-8?Q?I7TSgREoUobvtHLVRjxFZSzL2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 589ebcf6-8acf-4512-bf2b-08dbdca210e8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 19:21:23.0915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VIP8tDZY4CABgyD359iwkLigki0aZ0b6ETUEq6f3IseAzJTiaY8SbQCShm4zlVHqTCJv9RMUQERheWepHPZzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6947
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe: Fix pagefault and access counter
 worker functions
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


On 11/3/2023 7:58 AM, Summers, Stuart wrote:
> On Thu, 2023-11-02 at 18:43 -0700, Brian Welty wrote:
>> When processing G2H messages for pagefault or access counters, we
>> queue a
>> work item and call queue_work(). This fails if the worker thread is
>> already
>> queued to run.
>> The expectation is that the worker function will do more than process
>> a
>> single item and return. It needs to either process all pending items
>> or
>> requeue itself if items are pending. But requeuing will add latency
>> and
>> potential context switch can occur.
>>
>> We don't want to add unnecessary latency and so the worker should
>> process
>> as many faults as it can within a reasonable duration of time.
>> We also do not want to hog the cpu core, so here we execute in a loop
>> and requeue if still running after more than 20 ms.
>> This seems reasonable framework and easy to tune this further if
>> needed.
>>
>> This resolves issues seen with several igt@xe_exec_fault_mode
>> subtests
>> where the GPU will hang when KMD ignores a pending pagefault.
>>
>> v2: requeue the worker instead of having an internal processing loop.
>> v3: implement hybrid model of v1 and v2
>>      now, run for 20 msec before we will requeue if still running
> 
> Agreed this approach is much better.
> 
>>
>> Signed-off-by: Brian Welty <brian.welty@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 80 ++++++++++++++++----------
>> --
>>   1 file changed, 46 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> index ab6daebbd77c..c99af751d1fb 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> @@ -276,10 +276,10 @@ static void print_pagefault(struct xe_device
>> *xe, struct pagefault *pf)
>>   
>>   #define PF_MSG_LEN_DW  4
>>   
>> -static int get_pagefault(struct pf_queue *pf_queue, struct pagefault
>> *pf)
>> +static bool get_pagefault(struct pf_queue *pf_queue, struct
>> pagefault *pf)
>>   {
>>          const struct xe_guc_pagefault_desc *desc;
>> -       int ret = 0;
>> +       bool ret = false;
>>   
>>          spin_lock_irq(&pf_queue->lock);
>>          if (pf_queue->head != pf_queue->tail) {
>> @@ -303,8 +303,7 @@ static int get_pagefault(struct pf_queue
>> *pf_queue, struct pagefault *pf)
>>   
>>                  pf_queue->head = (pf_queue->head + PF_MSG_LEN_DW) %
>>                          PF_QUEUE_NUM_DW;
>> -       } else {
>> -               ret = -1;
>> +               ret = true;
>>          }
>>          spin_unlock_irq(&pf_queue->lock);
>>   
>> @@ -348,6 +347,8 @@ int xe_guc_pagefault_handler(struct xe_guc *guc,
>> u32 *msg, u32 len)
>>          return full ? -ENOSPC : 0;
>>   }
>>   
>> +#define USM_QUEUE_MAX_RUNTIME_MS       20
>> +
>>   static void pf_queue_work_func(struct work_struct *w)
>>   {
>>          struct pf_queue *pf_queue = container_of(w, struct pf_queue,
>> worker);
>> @@ -355,31 +356,37 @@ static void pf_queue_work_func(struct
>> work_struct *w)
>>          struct xe_device *xe = gt_to_xe(gt);
>>          struct xe_guc_pagefault_reply reply = {};
>>          struct pagefault pf = {};
>> +       unsigned long threshold;
>>          int ret;
>>   
>> -       ret = get_pagefault(pf_queue, &pf);
>> -       if (ret)
>> -               return;
>> +       threshold = jiffies +
>> msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
>>   
>> -       ret = handle_pagefault(gt, &pf);
>> -       if (unlikely(ret)) {
>> -               print_pagefault(xe, &pf);
>> -               pf.fault_unsuccessful = 1;
>> -               drm_dbg(&xe->drm, "Fault response: Unsuccessful
>> %d\n", ret);
>> -       }
>> +       while (get_pagefault(pf_queue, &pf)) {
>> +               ret = handle_pagefault(gt, &pf);
>> +               if (unlikely(ret)) {
>> +                       print_pagefault(xe, &pf);
>> +                       pf.fault_unsuccessful = 1;
>> +                       drm_dbg(&xe->drm, "Fault response:
>> Unsuccessful %d\n", ret);
>> +               }
>> +
>> +               reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
>> +                       FIELD_PREP(PFR_SUCCESS,
>> pf.fault_unsuccessful) |
>> +                       FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
>> +                       FIELD_PREP(PFR_DESC_TYPE,
>> FAULT_RESPONSE_DESC) |
>> +                       FIELD_PREP(PFR_ASID, pf.asid);
>>   
>> -       reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
>> -               FIELD_PREP(PFR_SUCCESS, pf.fault_unsuccessful) |
>> -               FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
>> -               FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
>> -               FIELD_PREP(PFR_ASID, pf.asid);
>> +               reply.dw1 = FIELD_PREP(PFR_VFID, pf.vfid) |
>> +                       FIELD_PREP(PFR_ENG_INSTANCE,
>> pf.engine_instance) |
>> +                       FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
>> +                       FIELD_PREP(PFR_PDATA, pf.pdata);
>>   
>> -       reply.dw1 = FIELD_PREP(PFR_VFID, pf.vfid) |
>> -               FIELD_PREP(PFR_ENG_INSTANCE, pf.engine_instance) |
>> -               FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
>> -               FIELD_PREP(PFR_PDATA, pf.pdata);
>> +               send_pagefault_reply(&gt->uc.guc, &reply);
>>   
>> -       send_pagefault_reply(&gt->uc.guc, &reply);
>> +               if (time_after(jiffies, threshold)) {
>> +                       queue_work(gt->usm.pf_wq, w);
> 
> If we queue from here instead of just breaking out and letting the
> parent function requeue the work, isn't there still a chance we could
> get into some kind of infinite CPU loop? I guess in this case we would
> still queue out to a new CPU each time so this would allow us to
> reschedule on the local node, but doesn't that leave us in the same
> place we were in with v1?
> 
> Basically, why don't we just break out at this point. Why add the
> nested queue?

We can't rely on parent to queue us...  I mean parent does the initial
queueing of worker.   But for the case where queue_work() returned 
false, the parent may then go idle for long time and not run again.
The parent shouldn't have to keep doing queue_work() until it returns 
true.  That approach adds latency to servicing incoming G2H messages.
The better solution is to have the worker requeue itself as it is the
worker thread who is managing how much work it does in one iteration...
Does this help explain it?

And will make small change to above as mention in other thread with Matt.

-Brian

> 
> Thanks,
> Stuart
> 
>> +                       break;
>> +               }
>> +       }
>>   }
>>   
>>   static void acc_queue_work_func(struct work_struct *w);
>> @@ -544,10 +551,10 @@ static int handle_acc(struct xe_gt *gt, struct
>> acc *acc)
>>   
>>   #define ACC_MSG_LEN_DW        4
>>   
>> -static int get_acc(struct acc_queue *acc_queue, struct acc *acc)
>> +static bool get_acc(struct acc_queue *acc_queue, struct acc *acc)
>>   {
>>          const struct xe_guc_acc_desc *desc;
>> -       int ret = 0;
>> +       bool ret = false;
>>   
>>          spin_lock(&acc_queue->lock);
>>          if (acc_queue->head != acc_queue->tail) {
>> @@ -567,8 +574,7 @@ static int get_acc(struct acc_queue *acc_queue,
>> struct acc *acc)
>>   
>>                  acc_queue->head = (acc_queue->head + ACC_MSG_LEN_DW)
>> %
>>                                    ACC_QUEUE_NUM_DW;
>> -       } else {
>> -               ret = -1;
>> +               ret = true;
>>          }
>>          spin_unlock(&acc_queue->lock);
>>   
>> @@ -581,16 +587,22 @@ static void acc_queue_work_func(struct
>> work_struct *w)
>>          struct xe_gt *gt = acc_queue->gt;
>>          struct xe_device *xe = gt_to_xe(gt);
>>          struct acc acc = {};
>> +       unsigned long threshold;
>>          int ret;
>>   
>> -       ret = get_acc(acc_queue, &acc);
>> -       if (ret)
>> -               return;
>> +       threshold = jiffies +
>> msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
>>   
>> -       ret = handle_acc(gt, &acc);
>> -       if (unlikely(ret)) {
>> -               print_acc(xe, &acc);
>> -               drm_warn(&xe->drm, "ACC: Unsuccessful %d\n", ret);
>> +       while (get_acc(acc_queue, &acc)) {
>> +               ret = handle_acc(gt, &acc);
>> +               if (unlikely(ret)) {
>> +                       print_acc(xe, &acc);
>> +                       drm_warn(&xe->drm, "ACC: Unsuccessful %d\n",
>> ret);
>> +               }
>> +
>> +               if (time_after(jiffies, threshold)) {
>> +                       queue_work(gt->usm.acc_wq, w);
>> +                       break;
>> +               }
>>          }
>>   }
>>   
> 
