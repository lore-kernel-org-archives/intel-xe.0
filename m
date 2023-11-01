Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98907C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 04:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B83010E048;
	Wed,  1 Nov 2023 04:53:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A3C10E048
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Nov 2023 04:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698814421; x=1730350421;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HKs2khtLUDw0z2jSP/tzanxLJ/o4f9LuAtzVE8pmULU=;
 b=EPcecXtVNZo9uHmlqiNygmAm+c/OqdkoyZsPKshIZAFSjDIQO9VQrq+i
 xXVMjJHFvfZcaJvTbXfUceN4J4Hygn/ao28MuyG482haOyVlg6CGE7BK7
 71+aJIo8nhfpN1jHYDh4/fyhfgSdyMkJuIWGi+z2fm3cs+jEJCd5SVtnp
 7GYiWqrgxCty3GaEaKPQUFYVKAfvixLyJMmk9GuNBAQcmmlc56cCnou4p
 RlnKDPmj+9js+Jw8Hg3BTPX3DFxRy80JbTdbKdXJeNi39uXRYGtqgV1+c
 fjMwnYAWCz/E69pipsSeic5ofLRKu1PJf/8fYKVGyTppwZIHmChJdyScm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="388255041"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; d="scan'208";a="388255041"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 21:53:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="795798198"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; d="scan'208";a="795798198"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2023 21:53:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 21:53:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 31 Oct 2023 21:53:40 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 31 Oct 2023 21:53:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSPqVCvOJKyplzZKQQANsYgK5cHiwPbrMOsNwsEKQSSOUv9ckftpmJflTyhWRFKHkWrFIlnZ494ISUIG0dYIS8Pz+cjW5evGmdx1Fka5Pkm4BjL4ENzsYZVOPLpdkRIU/nAo9lBrkwwiZEvp8zb66GTXlnMVRaU/Z1f44BauerPpUBMw/ixcan9eKNdXDWNqi1qCyDRgTqooq8mKikXT9ospQHPXdemVG9UZnQJNFbAzW6KQs4ea627XsxlSUeVDpdeFKKQzb55Hd63zeyNfxhnFo50BVYaazCBEhFhCmoaTyC997xgD1blD5LazNYmlwJ/IADApRfit8PpYz7ZXDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jKhPA8zfQZe0Ec1QaXgocZa3Hqd2ZEblWHKHO/edWA=;
 b=MpWfU9VwW66qABYTyYpFdkmqAAuruE2u5y5WHhqRTzdCHXzaJ9h0Bof+qWO/gl094YZ425ka4VPkp0XphQok+Gw4N2AXs8BFYghy6Qfpqih+AiMdATOmrFXAXnrPBGYZtl0im8PhzYiHT25sms2yp0laXTO/gDJw6lJkJ0rVgl/crscWod3bcp5cl/QZC5Or1Y8IcmQQHbUh6/7HY2mbTspplTAklkhY9d19FhbWYldvC0QLpdjUcAEZ6tmyTtDNP5hzW91Bm3ktODzJCnr1BCCkHOAjf2X46unc2AN8sh437QAVIs7N8lxWBLri+Stbust0gBzmCTtf1E5FOAHYKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Wed, 1 Nov
 2023 04:53:33 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::7c9d:a4c7:4e1e:aebc]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::7c9d:a4c7:4e1e:aebc%4]) with mapi id 15.20.6954.019; Wed, 1 Nov 2023
 04:53:33 +0000
Message-ID: <7214aa37-3a10-46b4-b410-a80fa6eaaf08@intel.com>
Date: Tue, 31 Oct 2023 21:53:31 -0700
User-Agent: Mozilla Thunderbird
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231031221510.29355-3-brian.welty@intel.com>
 <336cc01975710b80646905be5e9337e6735cc67a.camel@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <336cc01975710b80646905be5e9337e6735cc67a.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0085.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::30) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|DM4PR11MB5995:EE_
X-MS-Office365-Filtering-Correlation-Id: 3502b64d-d578-4c8f-18d6-08dbda967fdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pj6miBZcZewimbzr8TOaMgytl83K+LFMlCNlgOXsHtP5C1tASCEIKQ2ybUxZfO159PNQYY+arOrXRNhgN5v4OMTCGeBQQsaGorRt6vvvPDVifubvt0bcJzA87H/1nPM+AoTMmbRfSsjm6lPkTE8YRc1//JDniTo+R92CsWo1BjsPaHS0SV8wOq61kqwJjo8cFpj7G/Y/Ga0ceWeK6xyrCYJU8HlfmkQH0LVV0A5ANt9gBRckDPJa6AwaNufER1LbymE9tVnKFjem+gOEr3l1B5zBn3VrBocsQUvwHB+bxNAMKiAR0nzoD5lDXfx8td+rysz+diBefRfwr9ENQu9s2EKt0Dm+C/q+T98O/oxnyrdCMaQVb439qkEiwThQxEmYGuPnwda82lI+qOpYPJaqRAAqK/P8ZhRcKX7VJWSUEeL+rKh8do9QBsAUGV4/NWUGcyjIycAJpkGXe171RA728jIMgvK+Eg3xdnmWTXd8aOHidfzuTSssrxviFssoMQWlF83Eaz6xF6/dE8QldSrbmtyqDux8+/qDDTznf9J/qXoo0iZLvu+X0PKO+9kyZGImEwmKU7XJW6fM8zP+7A5jg4e1z2lPUAbFz2gxMWRmCkY0M7xxHXn6c4WqH51QzgkhsJJVH4uQCo8EBMlRHOSnOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(39860400002)(366004)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6512007)(6506007)(38100700002)(31686004)(478600001)(6486002)(36756003)(26005)(66946007)(2616005)(82960400001)(83380400001)(53546011)(66556008)(316002)(66476007)(5660300002)(8936002)(4001150100001)(8676002)(2906002)(110136005)(31696002)(41300700001)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEZCSkN4OUNLa2o1RzFvUGNuZE9jR3ptY3MwRjVIRkZnRXo3TG9wdG44azRF?=
 =?utf-8?B?SGlvM2xRYUxSYmFsQ0E0QzgvOW0xejhRYTFpLytUTjFiMVJzc2FFZHNoeDNP?=
 =?utf-8?B?NlRta2p4QTFRZ3lYQUdlWGpxMTcrdHFHakZXUFZONWFaOFhteWdYdkVMQm9D?=
 =?utf-8?B?b1BiY0RLQ01ZRm9OSzVSSk5PSDhqNGdYcEMrTWNTR2N6TlFoVGd2TDQ3ZDNX?=
 =?utf-8?B?YkdxWXFaN0MzUEtHRVJsaDgrbXc5TWp4Y0hiTDJkMXFTRG5KdktlYkg4ajdE?=
 =?utf-8?B?SHZpTHR3a0FLUEd5Uit4TEY1Y3kxS3ZnL21wcCt0aWZQY0d2b2xNNlNtNjFr?=
 =?utf-8?B?SDZKNE1WVDBzUWFaRm5XODNreW5vcmJuZWMzK1lXUGxyTUlsbi9JT05LaVN3?=
 =?utf-8?B?RlFCUXhBc3d5VW1lWk0wZWVoVHNwL21hR3hYZkN3VUg2N2d0emp5bFczRjRQ?=
 =?utf-8?B?M1F0aGJCRFJhVGI1MFZWaGFJZ0MvNnQ0M1dqL0pzd1YwZWg3ZnZlQkJtLzQz?=
 =?utf-8?B?Y3VzTXErQ3lWa2xZcENIKytUbjdNTVJMZWlvbDRnemxGa1RSMGNDMUduTFhm?=
 =?utf-8?B?aXF2N0N6Mjl2Uis0OU9VcGxKTjlKWDFxRDhNQ2hlc3dOekNvZGFNbk9Oek8y?=
 =?utf-8?B?dDVOTVdKRWtPRmZ6UmJZblE3aGc0eDJOZENUaGNiRzNndklBUEZZVGVyd1RE?=
 =?utf-8?B?U0g1ZUlUTDBHaW1GZzR3OTlYVXB3d2RWWHpHUUdXdFBsZkxJblVaMENHdkRZ?=
 =?utf-8?B?Yjl1STFzTXBXN21KdCsyMEc1N09Yd1htVENqcDlUUXNvOU9rM1JTQi9KZDlN?=
 =?utf-8?B?a3J4eDhxYUlnSStqd3pod204N29VWFFiYTEzRURhS2VTSlE0cDZSd2lHSUE0?=
 =?utf-8?B?aDBXRlNjV01PMjMyaWhlSUhGVnl2UFJIMWVzL21wYS81ZzdBbS9lUXk3K1Yw?=
 =?utf-8?B?ZTk0S2hSajZVRGZaOHpDOGRuTE1TbTllMXA1cmlDQzRCQ050Mk9LemJRKys3?=
 =?utf-8?B?MStCYXl3a3FIdVF0bmZieEZOeVFtaW53SkNleEFHZHd6ZW5XNEw4Wm9LU3Bi?=
 =?utf-8?B?eTkzVkRDZzAzUDFZRUIrNHpUbklpUGRYUGtCN0hSMGdxZThlSm51OURDNWxH?=
 =?utf-8?B?eVFnd2xDVnhYdHhRdWlwK01sSjJCMXFkUy9hdUpkV1U2MS9qeUZUajg4WE54?=
 =?utf-8?B?WnczdnYzS2FYeTNidzEvcWs4SkhmSk4yUkdGd0ZmbXF2NEFPaUI2MHFxVmhR?=
 =?utf-8?B?K2poTmtIKyt2UVJOUEkrZCsyMjR4VEVUbHlmWGtINFM3KzhLTVJHNEpnMkI2?=
 =?utf-8?B?bVkyMU5jTGJ1eEpsdnJTYmpoY0JEdG9aaXluT3FJNWJPQ2tsMFoxemlQSzg3?=
 =?utf-8?B?TnFvRUQyQXU4MUZCdFBHeUpXQWZUNi8vWkFnb2hyUGdkY3ZFS1ZRaVlCMW0x?=
 =?utf-8?B?d1hXTkJ1SVJlOWtkSHNCYUtRblY1QzNDZS95LzdCakJPajIxRjRVRmpoSkhV?=
 =?utf-8?B?aUgvaEtrSDdlalZEdFZ6L3prOGJ0elN0emhaTmo5ZGFNT0o2VWhVRmUzdFVC?=
 =?utf-8?B?emd1TVloUjRwVXYxWFQ2NlpHTFRrNGVTYVBLVEg2SklGY2EyOWphY2ErU1li?=
 =?utf-8?B?aDB2OTNWL2t5VGVZbGRzLzdhSHAyd3NlMzJMcktZZjlsVTZQN2E4ZXBUemtt?=
 =?utf-8?B?L1dYTEFYOWppYm9nVzhPajU2OFZxOHU3clI1OG52WFR5TlNPWTM4WHFZd2pq?=
 =?utf-8?B?aGxMVmlTSWF1SWU4Y1JuVDVpdzFSQ2NJNE5UV3lxdVBwczQrR0dXWHF4M0xt?=
 =?utf-8?B?YXdTeDNBRnRlZHFCS2RjL0JKR2R4RUhYOXhTL1JwaGc3MkwxclVxQkpZRkZ6?=
 =?utf-8?B?SmxHcWlLVnhsaXdYK0U2a1k0d2ppVmhJY050VmdRUUhBUXVtZVYvVHV2eVBB?=
 =?utf-8?B?UVNXUFVhdkRJT25YR0hFa0F1d2kxU0NxeWs3Q3dGSkJYT2RyWHlvL05sVk9N?=
 =?utf-8?B?aTVwTzZXcERXdTlyeHIwOWZ1dml3WUJkeUtldWppVHNXU1V5WW5xYWtwaHA2?=
 =?utf-8?B?ck53WS9PQkRKSGEwQ3Z4MVR2SDY2MzRmQm43QkNTeVo4VE5DeGZ5bzU4Nk40?=
 =?utf-8?Q?dvnvcIoLbhBXEy7cDv60QGRub?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3502b64d-d578-4c8f-18d6-08dbda967fdd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 04:53:32.9704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0k/3+JOhx7cjcs5UVmrdyOiZurVGV6yJlZrMx+agW+y96deoewKofmkFeIh75V2VWVBAJpmJj6EuU4ABKQlZMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5995
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [2/2] drm/xe: Fix pagefault and access counter
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



On 10/31/2023 3:53 PM, Summers, Stuart wrote:
> On Tue, 2023-10-31 at 15:15 -0700, Brian Welty wrote:
>> When processing G2H messages for pagefault or access counters, we
>> queue a
>> work item and call queue_work(). This fails if the worker thread is
>> already
>> queued to run.
>> The expectation is that the worker function will process more than a
>> single
>> item, and is updated here to continue executing until all queued work
>> items
>> are handled.
>>
>> This resolves issues seen with several igt@xe_exec_fault_mode
>> subtests.
>>
>> Signed-off-by: Brian Welty <brian.welty@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 66 +++++++++++++-------------
>> --
>>   1 file changed, 30 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> index ab6daebbd77c..63fba83c0839 100644
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
>> @@ -357,29 +356,27 @@ static void pf_queue_work_func(struct
>> work_struct *w)
>>          struct pagefault pf = {};
>>          int ret;
>>   
>> -       ret = get_pagefault(pf_queue, &pf);
>> -       if (ret)
>> -               return;
>> -
>> -       ret = handle_pagefault(gt, &pf);
>> -       if (unlikely(ret)) {
>> -               print_pagefault(xe, &pf);
>> -               pf.fault_unsuccessful = 1;
>> -               drm_dbg(&xe->drm, "Fault response: Unsuccessful
>> %d\n", ret);
>> -       }
>> +       while (get_pagefault(pf_queue, &pf)) {
> 
> Sorry maybe I'm missing... don't we want this to be
> while(!get_pagefault())
> 

That would be true if get_pagefault() was still identical to the current
code in drm-xe-next....  but it's less readable that way.
So I changed it. get_pagefault() now returns true if it dequeued
a work item.  And false if it did not.

Make sense now?


> ?
> 
> -Stuart
> 
>> +               ret = handle_pagefault(gt, &pf);
>> +               if (unlikely(ret)) {
>> +                       print_pagefault(xe, &pf);
>> +                       pf.fault_unsuccessful = 1;
>> +                       drm_dbg(&xe->drm, "Fault response:
>> Unsuccessful %d\n", ret);
>> +               }
>>   
>> -       reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
>> -               FIELD_PREP(PFR_SUCCESS, pf.fault_unsuccessful) |
>> -               FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
>> -               FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
>> -               FIELD_PREP(PFR_ASID, pf.asid);
>> +               reply.dw0 = FIELD_PREP(PFR_VALID, 1) |
>> +                       FIELD_PREP(PFR_SUCCESS,
>> pf.fault_unsuccessful) |
>> +                       FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
>> +                       FIELD_PREP(PFR_DESC_TYPE,
>> FAULT_RESPONSE_DESC) |
>> +                       FIELD_PREP(PFR_ASID, pf.asid);
>>   
>> -       reply.dw1 = FIELD_PREP(PFR_VFID, pf.vfid) |
>> -               FIELD_PREP(PFR_ENG_INSTANCE, pf.engine_instance) |
>> -               FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
>> -               FIELD_PREP(PFR_PDATA, pf.pdata);
>> +               reply.dw1 = FIELD_PREP(PFR_VFID, pf.vfid) |
>> +                       FIELD_PREP(PFR_ENG_INSTANCE,
>> pf.engine_instance) |
>> +                       FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
>> +                       FIELD_PREP(PFR_PDATA, pf.pdata);
>>   
>> -       send_pagefault_reply(&gt->uc.guc, &reply);
>> +               send_pagefault_reply(&gt->uc.guc, &reply);
>> +       }
>>   }
>>   
>>   static void acc_queue_work_func(struct work_struct *w);
>> @@ -544,10 +541,10 @@ static int handle_acc(struct xe_gt *gt, struct
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
>> @@ -567,8 +564,7 @@ static int get_acc(struct acc_queue *acc_queue,
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
>> @@ -583,14 +579,12 @@ static void acc_queue_work_func(struct
>> work_struct *w)
>>          struct acc acc = {};
>>          int ret;
>>   
>> -       ret = get_acc(acc_queue, &acc);
>> -       if (ret)
>> -               return;
>> -
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
>>          }
>>   }
>>   
> 
