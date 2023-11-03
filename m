Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B212EC4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 19:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8093F10EA6D;
	Fri,  3 Nov 2023 19:14:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2391A10EA6D
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 19:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699038888; x=1730574888;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f3TVGmWLOYj8PCRPe6EQhm3liEJK4gVUR2FEAzr7zK4=;
 b=F5nqzfVjup/k3uJHux9WMGk2xEdRbK/f/7rT58VcceDcO4N78ZcJMiDE
 bluFH/eOIdMv3dGSF97FEBgbhUrtadqg0bSXCbP6hnkM+WnaExyKCnMy/
 1tIAb3YOPtmapY85E/eVR5q9FozQwE0Hu7cYjTDskwyxbKO7JesR7qrLu
 k4+daKfAJ0KaUL8/dizVqgGvcsrBE4yxwKqzJko5yiDKKgZDbu2LjykhP
 x1uDOUZmt41NRfi+1ZGlYb+AIy3kXvJdqpsxnK25R56LIfPh6YzWPB3ZA
 KjvY/A3wsd5tfkZAnMJfpdiKu18d+o9easSGgINl6A89qN/hNjDAtrXzF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="369212411"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="369212411"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 12:14:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="765336301"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="765336301"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2023 12:14:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 12:14:47 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 12:14:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 3 Nov 2023 12:14:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 3 Nov 2023 12:14:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUv1JieHFTr8kBvct5abH3765TLTN4WzUVMjKa6yOPvLSD+Rygmj6HSeYmxCUIjHnvkv2cX6lAta1Ga1LCh/sUvgJEZTGAwSqF9B/S9nGEVwYvoIXr91XPw2THD/L2el79zNZGc8xZg2K6fZ46i5cfHvBw+qk2fMMKvf0O12VpfTZWuSA+xG4qdd4g/5jPH4Uliz5l9q8RYLDVmeXDMtQ7wAFiL6VLZsaSz2YZkzW3E9N6xmUJ7ceCeXNXORB4J0fuXT0sGB/Hdi60qHd5m7LoFlnW8WvxRwZmWUPmxMYCCQALGoBGDONsa/fDsMwr+8X0hsehnWhovTXxkqll00RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=np+XFm/BETWNH1l31Wbm0ARAyYwt2WoxcJ824zu4+Mk=;
 b=NM1Kox9doOM4w1tIOuaNZs/C5cf3HeAPQH3lgG7+bVp791+B9qxix9fClwPlBS3uCgs3XafSsZTxY4x+Zb0jVkomrF16LmxTjNcoUOLapXfEYyx+x+jO+3sCrLpfcGQG7GhJn2kgsnHyb5BFMX068DHOBt1eRZ9H+opMJT+wIBredPEDlf/2r8/Tc0RLNpK+y2R8+FOPEgieQhwbpF6kiDGPXNlfL9+aLlOPedliuES5OxGN9cWRROjXmaUmG5QL4vhCpMzIz/oTV4ALrhZ1fjZsbLvEqkwi6j6HkLQyYdr96TGUqZ9xrXcpNnbO8/zVNFuo73t9FMn3X6n8CgKGLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by SN7PR11MB6947.namprd11.prod.outlook.com (2603:10b6:806:2aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Fri, 3 Nov
 2023 19:14:43 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::7c9d:a4c7:4e1e:aebc]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::7c9d:a4c7:4e1e:aebc%4]) with mapi id 15.20.6954.024; Fri, 3 Nov 2023
 19:14:43 +0000
Message-ID: <014d4506-919d-4d53-b08a-0d37ec07cdc8@intel.com>
Date: Fri, 3 Nov 2023 12:14:40 -0700
User-Agent: Mozilla Thunderbird
To: Matthew Brost <matthew.brost@intel.com>
References: <20231103014309.13927-1-brian.welty@intel.com>
 <ZUUQWdiJSNjtkfmE@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <ZUUQWdiJSNjtkfmE@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::15) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|SN7PR11MB6947:EE_
X-MS-Office365-Filtering-Correlation-Id: 229c0ba7-1ce9-40e6-88dc-08dbdca121dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9uC147jsFVKnk/0ii9BLfiWthR0bsSIxRYjOO0U8ArpElftMbzu4rq8dbIhUvXoh1ueyhm9XQgC6aOeqBxW/IiVDrEAk/ZakAMFQi0QsW4GWAoZJQVFACcQ6Mwm86L4kYMs1qJGgFN2b6bZXmbgo9aEuqvvwosPLv4dLK4RJKia3ir7Pq00v88hr0HP6x/YK2hGF2+wezkbRmlrZJKAW8+HonFhNoDcWOenRy3f6Yx9X6VjWVZ0sbHNQbthJtw1uxCI0T5rCxcwacRlZxkp5sJAiUv9n/yZIYRZ30eB+bLevwAFCrHbWH9DNYOhyHTMEPqxdBFHzY9heKykhnIw/EJA3gKa/E4k7JsOblaJdTeQX1SEENI0DRgY//o1s4mGZWoVOyYzyLb5GNVlnf20PbigktdYp9omvV7h2nLil/M6k1x1Mt/o3pn62L8xiw+XDEWjmgFPEM4vsoe8F9q4GTRelgzIivPC3bVOSFdYmY1Nhkg70yVBf4urFveMqJEq9CqoitxI792DVqmHLVdrAbpHZH4+e7W0bsXbXs7x/8/YZpQCNQA7fVS81hfWkeFXYzMufgurJeglykXecbbF+ejRq/CdLekqYS/6VS1lY3/HNDpAB9NyCIa3tzEK4ymkwnX/Ef94OwXziBZI7utC9fQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(366004)(396003)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(6486002)(478600001)(83380400001)(5660300002)(53546011)(6506007)(8676002)(8936002)(4326008)(66556008)(6636002)(66946007)(37006003)(107886003)(66476007)(2906002)(26005)(316002)(41300700001)(38100700002)(6862004)(31686004)(82960400001)(6512007)(31696002)(86362001)(2616005)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1k5cXpodjMydFFuaDN4eklsYm1DbnpiVVVrVXErWFRKakJRanc5WXE2amll?=
 =?utf-8?B?VFVvWTZXR29MUUF5WEkxUHI3eVRxejB3MUUrVG40NjdRSUxsOHc0SUgwRGtm?=
 =?utf-8?B?NFIyVE83R1FLSXF2M0s5NjdvRDdlVHVaTmkzWHVmNjQxbUs5MkVTMm93bUNM?=
 =?utf-8?B?bzJDemt2MFByMGdTRE95cWFiNXZ1ZVBEMnpWeC9qS2NYbDgyK1h5eGtjR3Vn?=
 =?utf-8?B?L2xUVXJPRG9pMzNraFBURDFpRjRSRTZqS1Q4Q0FkUGZJTXVvVng2WFEzNEFE?=
 =?utf-8?B?bnVzck1wY2REbUU2RFZzdWZaZTZWU2c1L0IrS2xmSmhXOFJyTWgyNXVHRHo4?=
 =?utf-8?B?Z0dOaWNrWGpIL2Y2djdGWXBSQUhEdjgrNnJSOFZ2SEtOZ0NiVjJYckIrbU83?=
 =?utf-8?B?L1dnb01kUCszOUNKdmlYcFFEaHRuM0ZqTFQyRmFsVTlzcitUUEdRQ2JWSlNk?=
 =?utf-8?B?aWl2T3lEVXRlMUhKb1l6bVE3U3BhWVB5bGpjYkE1OUhuSE50NG9zck43L3dL?=
 =?utf-8?B?WDg1aGtmUTU0cHhORFFBeFp1c2QyWk9oQi9nTnlDcmhDQ3RtNU9UUXl4SVpE?=
 =?utf-8?B?SGZUTE1FR3FZZHBaMzNPMGNtbFNDenY1YkhVeG5jSDZWQlE3ZVM5NXFkbjZP?=
 =?utf-8?B?NmRRdnA4OStFbnBNM295aFJOc2FwOG5qR2ZXUE5OUWQrV3JYSUEvRHN2bktl?=
 =?utf-8?B?UnUvdGlXM0pjdW9iY2JTQmpsNnFDTWtzWHhGcE1SK2NuU1VnZ0lEOXl3UmV6?=
 =?utf-8?B?TXpjQTE3SDNXMFU1NEFneDJkM2ZBZU9PZytURFZRZm1CL1BubnlFSXdhRHZy?=
 =?utf-8?B?d2VNTEdSM2xIdmpXMmFiOGE1aDlQYjVuRjUyQVVuT2FvNi8xa2Z4amRZejAv?=
 =?utf-8?B?clhuTkFQaDVkeHFGY1h1QkdKWmJOcHloUHdaMiszanZRUXVEdGMweERjUVNW?=
 =?utf-8?B?L0hEN0RWU3R1a2c0NG9kcy9mTm1mRXB5OVdxWHlad2NzMmdXWVoyeHM3ejBh?=
 =?utf-8?B?UXM2enJMb0IvUmlENEYwcFd6R2F3SDFrV05TM2xwWWJLa1phd0FwSXV5V0Zz?=
 =?utf-8?B?VDl0Rno4K0x6eFdleDBCaHpTaFRRTTNxdzJ3MlB5MVdmbU9lVkpuU0NEOEha?=
 =?utf-8?B?Ujd5SlN1NmJEdVFySkdjbEUwM084djlHZEtQZkFueEFaMWhpRHZLalEzL0Yx?=
 =?utf-8?B?SkoyS3duZ2FwSHhRYXh0Sm9VbXZuMk9iSlg2ekxvUHJYa011WDh3N1pPdk9B?=
 =?utf-8?B?YlFaN0l1VlNIUGtoeG1NYTIra2hQZkNQRkkxYUFTUC8rbE9UWHRlbTNjWVIw?=
 =?utf-8?B?SUdQRVlldFh5enlYVVR0TmorVjRWRVAyOHh3d1d5a1JHb1RUeEVIQ3hYemps?=
 =?utf-8?B?NUFpdnduOGVHTGpjY0dXM3hrT0dGeXo0QUl0V0M4aWhRTFJlQ0ZRUGdhdU84?=
 =?utf-8?B?bnFyRzFKT09aL3hHd0NvNnd3cHNzMDR5YS9oemxmVjM5czdwaHFZWkVSUW5M?=
 =?utf-8?B?WkQ2TkxPc2NOYlowbUVCdFZ5UG1jVGl6V01LQmVQWFJpREh0clNJOGVaQUZ5?=
 =?utf-8?B?OXo4Y1lZemNvM3RUMWFtNm9Ud3Z6WW5la2ZBdUc2N05rQUtGbEhnS05KSVJX?=
 =?utf-8?B?Zm1TcnhISW4zL0hKQmpUbTZRVWZFaXkvZFZyTnJkTDhnQkNsZnNvYkliY1V5?=
 =?utf-8?B?OXZFVm1EMjl2YksvTFFwMUlSbzFod2xITHBnclhId3RzOWZQekl4bTZrK1pW?=
 =?utf-8?B?UFhqc3lqdktTNmprbjVIbTAyc1dEZFd4RmxNcVRta2gwSnZOcWx5SnN3L0x1?=
 =?utf-8?B?akEzWlpDa29Yb2ZiM3Fua0RWb2Vic2RQMXVkZk95QjFtRG43R3VKUHNDMWk2?=
 =?utf-8?B?b2JobW5nZjhTNzNFLzNkdVZjeDBSaTIyWmhhYXhlVTBLbWJrUDl1ZGtKNisz?=
 =?utf-8?B?SkNzVkdYaFVRU3NEMWVtNUN4UkZncHV1aWhJSE1pclFnMm1rcDFTMEsra21M?=
 =?utf-8?B?YmtSc3A5M1NvU1ZrS2xRWERKdW15RWVldzlOSmdnUUF0UGpabXZkejNLQmxS?=
 =?utf-8?B?bHlkNFdLY0JpL01BZVZ4dndSdmtnN0VySHRQV2d6V1Zld093NTRKWDBBKzht?=
 =?utf-8?Q?J9YYa9+LwWgeenjSn8qwg7aW3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 229c0ba7-1ce9-40e6-88dc-08dbdca121dd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 19:14:42.0328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05l3VGa+Fmt8EPuyBeHDIrJgPF+blOp/9/eg8EcRFfw7M5TswdeDORpXPxkJDDRWd5HA5NWjEAL8OHOpydd5BQ==
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 11/3/2023 8:23 AM, Matthew Brost wrote:
> On Thu, Nov 02, 2023 at 06:43:09PM -0700, Brian Welty wrote:
>> When processing G2H messages for pagefault or access counters, we queue a
>> work item and call queue_work(). This fails if the worker thread is already
>> queued to run.
>> The expectation is that the worker function will do more than process a
>> single item and return. It needs to either process all pending items or
>> requeue itself if items are pending. But requeuing will add latency and
>> potential context switch can occur.
>>
>> We don't want to add unnecessary latency and so the worker should process
>> as many faults as it can within a reasonable duration of time.
>> We also do not want to hog the cpu core, so here we execute in a loop
>> and requeue if still running after more than 20 ms.
>> This seems reasonable framework and easy to tune this further if needed.
>>
>> This resolves issues seen with several igt@xe_exec_fault_mode subtests
>> where the GPU will hang when KMD ignores a pending pagefault.
>>
>> v2: requeue the worker instead of having an internal processing loop.
>> v3: implement hybrid model of v1 and v2
>>      now, run for 20 msec before we will requeue if still running
>>
>> Signed-off-by: Brian Welty <brian.welty@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 80 ++++++++++++++++------------
>>   1 file changed, 46 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> index ab6daebbd77c..c99af751d1fb 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> @@ -276,10 +276,10 @@ static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
>>   
>>   #define PF_MSG_LEN_DW	4
>>   
>> -static int get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
>> +static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
>>   {
>>   	const struct xe_guc_pagefault_desc *desc;
>> -	int ret = 0;
>> +	bool ret = false;
>>   
>>   	spin_lock_irq(&pf_queue->lock);
>>   	if (pf_queue->head != pf_queue->tail) {
>> @@ -303,8 +303,7 @@ static int get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
>>   
>>   		pf_queue->head = (pf_queue->head + PF_MSG_LEN_DW) %
>>   			PF_QUEUE_NUM_DW;
>> -	} else {
>> -		ret = -1;
>> +		ret = true;
>>   	}
>>   	spin_unlock_irq(&pf_queue->lock);
>>   
>> @@ -348,6 +347,8 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>   	return full ? -ENOSPC : 0;
>>   }
>>   
>> +#define USM_QUEUE_MAX_RUNTIME_MS	20
>> +
>>   static void pf_queue_work_func(struct work_struct *w)
>>   {
>>   	struct pf_queue *pf_queue = container_of(w, struct pf_queue, worker);
>> @@ -355,31 +356,37 @@ static void pf_queue_work_func(struct work_struct *w)
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	struct xe_guc_pagefault_reply reply = {};
>>   	struct pagefault pf = {};
>> +	unsigned long threshold;
>>   	int ret;
>>   
>> -	ret = get_pagefault(pf_queue, &pf);
>> -	if (ret)
>> -		return;
>> +	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
>>   
>> -	ret = handle_pagefault(gt, &pf);
>> -	if (unlikely(ret)) {
>> -		print_pagefault(xe, &pf);
>> -		pf.fault_unsuccessful = 1;
>> -		drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
>> -	}
>> +	while (get_pagefault(pf_queue, &pf)) {
>> +		ret = handle_pagefault(gt, &pf);
>> +		if (unlikely(ret)) {
>> +			print_pagefault(xe, &pf);
>> +			pf.fault_unsuccessful = 1;
>> +			drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
>> +		}
>> +
>> +		reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
>> +			FIELD_PREP(PFR_SUCCESS, pf.fault_unsuccessful) |
>> +			FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
>> +			FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
>> +			FIELD_PREP(PFR_ASID, pf.asid);
>>   
>> -	reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
>> -		FIELD_PREP(PFR_SUCCESS, pf.fault_unsuccessful) |
>> -		FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
>> -		FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
>> -		FIELD_PREP(PFR_ASID, pf.asid);
>> +		reply.dw1 = FIELD_PREP(PFR_VFID, pf.vfid) |
>> +			FIELD_PREP(PFR_ENG_INSTANCE, pf.engine_instance) |
>> +			FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
>> +			FIELD_PREP(PFR_PDATA, pf.pdata);
>>   
>> -	reply.dw1 = FIELD_PREP(PFR_VFID, pf.vfid) |
>> -		FIELD_PREP(PFR_ENG_INSTANCE, pf.engine_instance) |
>> -		FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
>> -		FIELD_PREP(PFR_PDATA, pf.pdata);
>> +		send_pagefault_reply(&gt->uc.guc, &reply);
>>   
>> -	send_pagefault_reply(&gt->uc.guc, &reply);
>> +		if (time_after(jiffies, threshold)) {
> 
> Maybe check if PF queue is empty here too. If empty do not queue the worker.

Right.  Latency sensitive here, so I tried to avoid testing that here as 
thought would have to grab spinlock.
But seems if just reading head and tail and not advancing them, I don't 
need to hold the lock here.

If we processed more than one fault, odds are that the worker was 
already requeued anyway by the parent.  So not sure this matters too much.
But yes, agree and will add the check here.

-Brian


> 
>> +			queue_work(gt->usm.pf_wq, w);
>> +			break;
>> +		}
>> +	}
>>   }
>>   
>>   static void acc_queue_work_func(struct work_struct *w);
>> @@ -544,10 +551,10 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>>   
>>   #define ACC_MSG_LEN_DW        4
>>   
>> -static int get_acc(struct acc_queue *acc_queue, struct acc *acc)
>> +static bool get_acc(struct acc_queue *acc_queue, struct acc *acc)
>>   {
>>   	const struct xe_guc_acc_desc *desc;
>> -	int ret = 0;
>> +	bool ret = false;
>>   
>>   	spin_lock(&acc_queue->lock);
>>   	if (acc_queue->head != acc_queue->tail) {
>> @@ -567,8 +574,7 @@ static int get_acc(struct acc_queue *acc_queue, struct acc *acc)
>>   
>>   		acc_queue->head = (acc_queue->head + ACC_MSG_LEN_DW) %
>>   				  ACC_QUEUE_NUM_DW;
>> -	} else {
>> -		ret = -1;
>> +		ret = true;
>>   	}
>>   	spin_unlock(&acc_queue->lock);
>>   
>> @@ -581,16 +587,22 @@ static void acc_queue_work_func(struct work_struct *w)
>>   	struct xe_gt *gt = acc_queue->gt;
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	struct acc acc = {};
>> +	unsigned long threshold;
>>   	int ret;
>>   
>> -	ret = get_acc(acc_queue, &acc);
>> -	if (ret)
>> -		return;
>> +	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
>>   
>> -	ret = handle_acc(gt, &acc);
>> -	if (unlikely(ret)) {
>> -		print_acc(xe, &acc);
>> -		drm_warn(&xe->drm, "ACC: Unsuccessful %d\n", ret);
>> +	while (get_acc(acc_queue, &acc)) {
>> +		ret = handle_acc(gt, &acc);
>> +		if (unlikely(ret)) {
>> +			print_acc(xe, &acc);
>> +			drm_warn(&xe->drm, "ACC: Unsuccessful %d\n", ret);
>> +		}
>> +
>> +		if (time_after(jiffies, threshold)) {
>> +			queue_work(gt->usm.acc_wq, w);
> 
> Same as above, check for empty.
> 
> Matt
> 
>> +			break;
>> +		}
>>   	}
>>   }
>>   
>> -- 
>> 2.38.0
>>
