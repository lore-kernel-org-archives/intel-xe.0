Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9775EC47074
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 19:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8E810E46D;
	Thu,  4 Jan 2024 19:03:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348D710E46D
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 19:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704395031; x=1735931031;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8qjvw32Wd+HAWOdgXahxNYcYS1m4I6QrOqJeywGxSQQ=;
 b=R+0Um1tp3N0tmoHsYhCTjOgrVJcBw19C/U/Qif2JZ6GbRBXIEcdLkJ+s
 adoguQ3qhBxyYr1cbKVQDrw0t1xrRzLi/xQZZx2ig0zuzZiuvtvf6TSXH
 Q1rHY84axQO3mERZ0+XRLHBLaoL9bIUezbxvPeQeeYyinh8n6LTRRsCUB
 3UHFbPlpXQr7I9c+6PYCSayIuhNttkC5Kzh7hMgF1qHVnIbydfnfJpmkn
 DRmKIvIz9y1DbudCL7xIIrdmODw35QH9RaTZMmPojwEjSvhpkBG1Jop1b
 zafDSfIBCpZH/PHFXDShhCBZleW1iAjiikJKw1DjpB0BtWPxFUCPksu7k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4152738"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="4152738"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 11:03:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="28887847"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jan 2024 11:03:49 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jan 2024 11:03:48 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Jan 2024 11:03:48 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Jan 2024 11:03:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YprgCPTiRIU7AXrB9ym+f2nC4VptQDspKeVkdZLiJ2eX6P44DbZlNvt+ev6RWEj5+Vn0v26C9LIFJxvjra7nLFYmIjfF3zoMQd0GkWN4TYcd8Eethza6bakLpYO5VpPrEmUrh006400qlVIEdnrSQnFhisaCUy4zyMDPjwPkQOSKwLhL74eD4K1JnaUCDGJupiu8e6TregryIgdg93DejAMID2KIz1N2xxwAL/fF+fnyX7LojVqbtNRuO7bfLvEi/q2725S5msVCIPg2wm+wduO7GxWI0P92+aWM36e9MJ3jgxMRfyIo4dPml8Nh08n6aDlNWbPvwsRBqrYkFpicMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rCBYl4/285BlMgAy1U1zwscE5vGwDcojg6W+5Q3Nzo=;
 b=F0r6shPLuOUkopVmjEgKCFGiKUjL04IcwGNfUYRnXZ+0OxwfPNzXaN+4HO8mkwdmXYbD0/m1wWDOCK+vypKN5e6t58rwU/gYl1JO9o0w7AGWK9vvAh3X1Q5ucS7kFvVFClQ1T8DUUZngfShLOt6UIuuHZDhaFjRur8qJh2HJaX1gUo03wwxm+T6fzjh6k9GKBLf4URLAn5HDl1hwXiT1q1oydIJ2MBSloI+jsN0sQsf+WOC7NgSZXCQqcn6DgF5iEhprE7RWAi3DY+BCfGaAxJf2RIOPxHi2zl9djgxsWMIMj6IupxEu3vkrikY4tshO9qMkby0ZdcuYSlCSa6fObw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by SA2PR11MB4780.namprd11.prod.outlook.com (2603:10b6:806:11d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.14; Thu, 4 Jan
 2024 19:03:46 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e%7]) with mapi id 15.20.7159.013; Thu, 4 Jan 2024
 19:03:46 +0000
Message-ID: <0cf6e9d0-a3fa-44f0-98e7-5cedb882ebe8@intel.com>
Date: Thu, 4 Jan 2024 11:03:44 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] drm/xe: Add exec_queue.sched_props.priority
To: Matthew Brost <matthew.brost@intel.com>
References: <20240103184408.17844-1-brian.welty@intel.com>
 <20240103184408.17844-4-brian.welty@intel.com>
 <ZZbg+5FsDPhvGzn+@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <ZZbg+5FsDPhvGzn+@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:a03:180::36) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|SA2PR11MB4780:EE_
X-MS-Office365-Filtering-Correlation-Id: d8dda09d-658b-46aa-c408-08dc0d57e088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jjAe+GdAl/12gWkiV4S8PC9K+X7NWSpz2rfc3NCyzv0bSjcJiDKRWnWxu3MwuszLfyNLPc/2usTFp5FrHSGZqTeqQvZ5r2PF2VBbRy7IeKXPPwHgCCUGGthh+YVFraYW9sMZ8s4mEbh93ONYEekFP6DiBNTGLaPGYg9hwJVuNQmUOFM6XxlSzs2tOfyNocVNHU7IeQGVAixn28dq45Iaw97M/sNNkN7D1bn8cpwlk3w3KYTC3smes+RnKg+mi9kBFDeUH23urcLcYbboK70nUbs21ZJiyiuInEZgkXi8Sa1FZwo6+dyUMMqSxI6EeGjOz2tH7yallPoUjJ4wPlckG7S2NswPthWuPAMloxlsoWPTRswm/4hDTcB5gIXMd+mDnlstKMWFaiIES9b8dZkbaeQ6DMA/UuZpRdVVGKwYVfMT4LEtlD6zxFYQvakHYo0ZojT4NuiE5MHvn1vxsbP6Wu2vOoBSjccnQ5iORpdIrHvJVYaDuPbxcU9cPVXY1jd9MG4BIuynF5UEowCGm/l1MvlK723SAJpUlzY1zzrpCMA32psAOTJUJg59jDWjTNVGajItLclX3NplikZvQe0FoSIVX9ow/NDoKhUCI21VfL9ZOW+D8d8RlB6bSrQa6l/nolDunO00P9ffsWJ/VIFtYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(39860400002)(396003)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(66556008)(66476007)(66946007)(6636002)(53546011)(26005)(2616005)(36756003)(6512007)(31696002)(86362001)(38100700002)(82960400001)(83380400001)(6486002)(41300700001)(478600001)(6506007)(6862004)(4326008)(31686004)(5660300002)(316002)(37006003)(66899024)(2906002)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzBERUNWd1hRNFZpbDJkaEpheUpodDVDTlR6emRldXpSWWVDOWJWUWdpNS91?=
 =?utf-8?B?cFcrR3drbkpJNVNWZlgrK2k1RVpqQWF0ZjJDUk5LQ1NEVmZDMEFuWWVBaGd6?=
 =?utf-8?B?aG1lZXRjV2lFWExzdll5L2dTc2VUUEhkY0VCS1Q3Ty9kdnJJeVdDYlYxWlZW?=
 =?utf-8?B?aXVZNUROWUU3RzF5ZUwwNVlWSFdtamQyc3JvS2FINUFjb1VlZWxIM1RPMnBh?=
 =?utf-8?B?ZzVDakg2NUUyZ1IxeWd0c1lnRkd1QXVvVEFWMFozbmJUeVdIVVMzSC93ZUUx?=
 =?utf-8?B?Sm5NeDlERmdQTXVIcUl4M0tOTndaUXFkcGg5SFlIN05lbjhuM0E0SmpnT09K?=
 =?utf-8?B?MERaTUpweGwrQmRJajgyTjhqRWdxY1U5SzRnUWZuN1Blc2lRcDQ0ZzZLRytP?=
 =?utf-8?B?SFZBOGpUTmJOUEo0UDdCS2VmaUFKZFZwNXVreWdHTGFNY2lNd3plUmhYSitT?=
 =?utf-8?B?cmNNVS9tb2FWbGpjTC9qVDBYRW1LL1ZlNzBQUDNBM3ZHajRhNFgxeWdnUjZ4?=
 =?utf-8?B?N3h1NGtMVXFIU1pMUER0b0E1MnhacEJSQ2hqaDNRREhqRkJzTkkxT0c0c3pt?=
 =?utf-8?B?dCs3VDZuYlZVMjVTcE5FMVlsZHRpdHorazFRVDBncit1emNES1lKZUFtcjRK?=
 =?utf-8?B?QzBENk1VQTNWS1lvTVB3dmNMUTlMOUJGVURKNExrVm9tNktwMTlXVCtmV2g3?=
 =?utf-8?B?RURQalJDb3dqOENwdlhtdVo0dSt4RnFXYWdDdmI3ZmNTekE3N3BIN01YY0Uy?=
 =?utf-8?B?UjROejlZZ1JZVkc1bVlDbndkbVdGZEwzdTBDWlp4SGhCZERQSW1zSHk1all5?=
 =?utf-8?B?dS9rem1iV2hTTmtnNDVJNWt2YXBYZEwvV1BxZTBTTGJNSTBVQXBFektDaFNj?=
 =?utf-8?B?MzRSeXZ2UGFVdThTNTBGci8rcmhpbisrejRUTFMxekhacGU1Z1FvU0MxVnhI?=
 =?utf-8?B?TEhLa1hVZHFjQjJnUzdqdVpJVjdqYnpvN0VaRTVUUm55QUtlSkhWWFFPTXM5?=
 =?utf-8?B?czhqcjBzZ1kralVhOUsxVFpiL3lNRHBnSFFSZWxyNm9adGRTVHN2WWtCamFY?=
 =?utf-8?B?MjlVZVVTN1ZHUktCZGxhNVNwSXJmdWdUS1pBMEJyUkVhcGhncWEzTDcrc1Qz?=
 =?utf-8?B?R01id2hVMmVKQjg1UVJuaHJqOEd6eUNwNU5Pd0JtMS9jcXZhdjArU0MvMU9v?=
 =?utf-8?B?ZzF4UisrckxlakxYUjJBVk5hWWtEYXZiUjJNc244a1hSa0VhWFdiWFB6bTRw?=
 =?utf-8?B?YnJwaEQvL0h1MU9PN3A5dnpBOThOUE14VEtFZytkYXRiVDhzTVoyK3hVWGlB?=
 =?utf-8?B?ODljUXdxNzFFeWJnVVJPV0E4bCtPd3dqNlcvNnJ4VTBMbnFlYVd1QWFSZUZW?=
 =?utf-8?B?QWJyRE1TQkwxNCtTNUNpZVB5S1ZacFEyMGp4WFFSRnlqS0NIbm1IT1VCT1dx?=
 =?utf-8?B?ajUySDA4T1pKTE1sK0ZSay8xSEZENDd3a0ZmSW5Lczl4b2NCRy9mcHZ4ZlBk?=
 =?utf-8?B?RGg1cllRWFBLZURCMVE5VnVrWVZPNUdqeFBZK0JudjNFekdTdVJGdzc1UE5R?=
 =?utf-8?B?QjBhVW5aMWwzczBzNUVkT25Ua0ZMYlVUUUl5ZTRPMGZJTDkrQzlmSmwyem1n?=
 =?utf-8?B?WS85QTQrcytCQzgrNDdlOC9va2RrK0pFQ2p2T3ZtR0NFeWc4Ym5FblBUMjRt?=
 =?utf-8?B?SnpETXl1WlZrRk5ONllObnBTWXI4OVhEZ3dFM21BUHJQYzYrbmJVbkRlWFRO?=
 =?utf-8?B?NXdtR00zNmFYZURLempBNlJ1ZmdHZlFoeHQra0c4RWxpZFpGNUlFcWk1eWs5?=
 =?utf-8?B?T0wwQTNYU0pIbHRFcGU3dXBvVit3ZU1zM2NXYVFuYjJHK0o2YzhvbC94WVJE?=
 =?utf-8?B?eTVFTDVwTzFjSWZ3Z0kzdjUzcmpCNlllZWVzNnBYMjIzcjRCd2x6WEhmcUFN?=
 =?utf-8?B?eG05QkttWFZYaThKamcrcEUvbngyUytxVThkYzJ6QUtocXRUWU8zMnlZQlV2?=
 =?utf-8?B?YjRub0ZheHlJRkI2YThzNGhLTDRsdGdTa1pGV2VzSnpxRUw2cmhFdXdKV0Ra?=
 =?utf-8?B?cURlbTZybk81b3ZOVGg0WUhBMkNnYnhYUzBBeHRha3o3NDB2TU9CZFVOcnBL?=
 =?utf-8?Q?aBMdusbnn0M7RqzLryWAR16FS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8dda09d-658b-46aa-c408-08dc0d57e088
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 19:03:46.1828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4W+pC3B2MrNTPFQLssHEtpXXEAYZWbl5yqFpYHxFq/xxmQTq06lmSNpa04okKufpR28mTJUxTEueMeCL4c1taQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4780
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



On 1/4/2024 8:46 AM, Matthew Brost wrote:
> On Wed, Jan 03, 2024 at 10:44:06AM -0800, Brian Welty wrote:
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
>> v2: fix existing bug such that q->sched_props.priority is now set
>>      before guc_exec_queue_add_msg() (Matt)
>>      fix existing bug in that xe_migrate_init() should use exec_queue's
>>      vfunc for updating priority.
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
>> index 56c0a7bf554f..392cbde62957 100644
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
>> @@ -1301,15 +1300,15 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
>>   {
>>   	struct xe_sched_msg *msg;
>>   
>> -	if (q->priority == priority || exec_queue_killed_or_banned(q))
>> +	if (q->sched_props.priority == priority || exec_queue_killed_or_banned(q))
>>   		return 0;
>>   
>>   	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
>>   	if (!msg)
>>   		return -ENOMEM;
>>   
>> +	q->sched_props.priority = priority;
>>   	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
>> -	q->priority = priority;
> 
> This probably should be its own patch and maybe with a Fixes tag too.
> 
>>   
>>   	return 0;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index adf1dab5eba2..f967fa69769e 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -356,7 +356,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>>   		return ERR_CAST(m->q);
>>   	}
>>   	if (xe->info.has_usm)
>> -		m->q->priority = XE_EXEC_QUEUE_PRIORITY_KERNEL;
>> +		m->q->ops->set_priority(m->q, XE_EXEC_QUEUE_PRIORITY_KERNEL);
> 
> Same here.

Okay, will pursue....   but then I guess I'd rather pass a new flag into 
xe_exec_queue_create() and just set the priority upfront rather than use
the vfunc to modify it here later.  Will code it up and see how it 
looks.  Then don't have to deal with the vfunc possibly failing.

Would it be wrong to simply always use XE_EXEC_QUEUE_PRIORITY_KERNEL
for exec_queues created with flags:
	EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_PERMANENT
??


> 
> Otherwise LGTM.
> 
> Matt
> 
>>   
>>   	mutex_init(&m->job_mutex);
>>   
>> -- 
>> 2.43.0
>>
