Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD408CA0EC6
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 00:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EE510E00C;
	Tue, 12 Sep 2023 00:16:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C80E10E00C
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 00:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694477791; x=1726013791;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0OmtD3Jt9l6p/nMPMNDivM7561ooPfDSplpVYekgUrM=;
 b=id7CWIV4aqv2zllsVjsvvurBwdtvP0L/NdLAZnYnW05fIEDtybva1+Y3
 3c3OjH8QGraTyrGTE8egadFRY9eYBQEifaEBETWtNPJqhyQOOHV5Mc31c
 CKXf8ZapawrB54p3AOLk3xN9lgDQhV8cuk1cQKM64Bh9kh3W9dRWLywOE
 L41ubmDDtNU6kcUgqEQHW0Bt93m5p4FYv5YTvqFIVfhxy7yGGSRqc4NYP
 CsWNphzx1iXgLc352UXRU0MjDYn9WpGIvm71CmgBKP4vf3Mh+HspBHk6q
 L8fGEypX9qENCeQRCerjDHFhDAY5eGQG0GiLNvVWu2raN5GMIkN44UhON Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="357675256"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="357675256"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 17:16:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="886737632"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="886737632"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 17:16:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 17:16:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 17:16:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 17:16:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 17:16:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fi1LGzhZaGbnRZaCLrr4iMVRbAJJhukQcc8QxO9EelvzYypQykexX/5uytiuf6X2JhlyWT9nkMB71KBwEPyIzyXPGVuX3O8tZNs4GNhSUedNrW4DlDJsKCENbi4U7fTwh8Ck0gyNpfaCmflov6n7xU353i2YFtVRhcHtEB022X6woVgcv113lLd6pKCpm3yrZ4fUF7bDuod9IZF/r+RJV1zT2xoIK6ccFEqQsTTDzvHTVK9hCdzsKdfRQYR90nduuV0SRE0MFnRVd3U+YHxCxePyO8wDWZqFN+4/P36xHc6vVk6oh4Ht23v2T4W+M7lTT7rw/bZSmH4W+NHZvko/Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPYp+ids8rrMM0l/3XpyvieeL28ENTuYzECuBwV/n3s=;
 b=KpbQW+RZwq62GBctoOKKYgeNb7fCdSHYjFJTsc9KovgSeoFajZidOWU+ENGzHLi4+w6XdzQ3LV+u9X/xNe87fYfkaOvvlXmyNimniYJKS8HzWoI6cGnNmZBNQBpE6LMspuSkSYaT+Ren1f2PFGNx1UMaZXKfRS1eOfesdrlS6FeqlWxruBt9ofAI2gXliC9dzxx0QsCrbhV4Qs+/xrrbTURV3cD49hc1XxMQt7Q2Qk+TZkZJIDoH0mEkxnVO48z01RhI98siVwGEFLc4MyZAJOD5wjkZ46XNul4W7k/fLXF1tUT99iewFhVv1W713Q9WPqVkr71boxP4J4RsI3PiTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 12 Sep
 2023 00:16:28 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f%6]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 00:16:28 +0000
Message-ID: <69339bbc-c78a-9e7a-ac1e-9ac08c84f79b@intel.com>
Date: Mon, 11 Sep 2023 17:16:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230802212646.838717-1-daniele.ceraolospurio@intel.com>
 <20230802212646.838717-2-daniele.ceraolospurio@intel.com>
 <5ca76588-9822-cc1e-3c91-5f14918312ea@intel.com>
 <6a7efd35-773e-4b61-8f61-8ef733c7edf8@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <6a7efd35-773e-4b61-8f61-8ef733c7edf8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0292.namprd04.prod.outlook.com
 (2603:10b6:303:89::27) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH7PR11MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: cd87dcdf-f026-4044-2f5d-08dbb325821a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pqKpv5YYrz0A15TBvzRIxVBXATpN09s9GlcJ2Cg4T92hXP1Jni4w0bU+MAV6RI4EnJ1k9QZqYs5NkxAmGSgCMu3BbUHXA+WYpHpjc4D0KiGQjKSkQWofXExSg3wBgqCI9GOSKXOKQkd0WtzMJSDZ2jh4NrcYjJy3C2SgX6MSoIA+yDj9cE8HbWuDjx8rTkqNtyU2MdW+SO99Ju9Mvwe/Fvk2hwJNTR05GPr+FCDi4GSk0Wv+YDt+mA4p8FPn/enx1NMqmHoV+qAyxWIUTONZOqWQTPGIGwOIX8tHNTan0atzK4Vpz8gWqXdxzCCk8WAQ/9ifRrWfJdythKvCUreQuIgYS50/Mr9GJumxnmnvcsS54dAYSct2tDlEdh/xzBU1GFfsrM6zwsxznnSCaZrVpnvQou7PHBeP0IaWiI9GuNBzxuZh5JkJDjrTOG1YRfEntn7u8sGU/7W67mQs893zJl1ydOrCj5yOYJjfK/pY1AeZkmO+lf+sCCsogd94+qZi++QOnhHMtrKWOdmHdgOMxvIn/cNiFUIvV4Srdxrc8PNsFtBWB/DJWdpASy5tkX24MVhlc8soRnF/hOZ8vLw/RpHSRUNuX77LVHUU4Vq8Qo9KLPc2I3WXHCeOIU0lGWa3fADWOR5Z1Atu/cUKbzeJ7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(366004)(396003)(186009)(451199024)(1800799009)(6506007)(82960400001)(53546011)(6486002)(6666004)(83380400001)(6512007)(66946007)(478600001)(2616005)(41300700001)(66556008)(2906002)(66476007)(316002)(8676002)(5660300002)(26005)(8936002)(107886003)(86362001)(4326008)(31696002)(36756003)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG9BSkdsVGhhRXRaTFFidFBvRDVibEwydFQxdWtvNDdqZUpRc2g0YlNxMVFL?=
 =?utf-8?B?ZmViOElNN1pPeFdLVXJ3L1JnQU9CVzBjMjBDeTZhcjZHcDloTk9PcWFETElu?=
 =?utf-8?B?bk9sdUw5RVB4cTNSVklNWVVKbXUrRDdmcWlWcEZQR3VBK1RQUkttQkY0dUg2?=
 =?utf-8?B?VlVrRWxLN3hMRVMzTkJRSEt0cFJvOUltVzMyUU4zTUpPZThEKzJnZlp5emdX?=
 =?utf-8?B?ZkVmemdwcTEvVjkreWVEM25MQlgwZ2M1Yi9VZ3RRYnJjbjFTSlF6THNzcERq?=
 =?utf-8?B?UXNBOWszekdteTVwSzg1enVQMDU0RFB3NWUwTC9tOWw0cDdVRGNMZlBoMlUz?=
 =?utf-8?B?Y0Z1MXJDSkd0OVNVRGZQZ0k0MmJXZDkxTDlUSjB1Q2tidXB1VzVqdVB3bTFT?=
 =?utf-8?B?WlRocXJsVTNFQTJ4aVVCTm4vbm5MdjZPVjFRS2ZqR2RxSzNrRFR3dDExM29j?=
 =?utf-8?B?YmtiVzRjR1ZRMXp5WjhHN2lKRHdIOU94TUpORVB5cFhrbkZNTnZZbWZiYlFS?=
 =?utf-8?B?YXJtRWtSRFBnN21rQVIyUUZTNFlHZ2tub25uMVlPZlJwd3FKcjFJbXhiV2xI?=
 =?utf-8?B?NFZyYThLWHZvMktOYy9acDc3aVg4WWVhRHFOeWQ1SEN5S0hJRE42NFRyUFRu?=
 =?utf-8?B?S1FBWFdqSXpUb1ZYb09uQTFIaFNqK0gwQ2oxazNvb1VqMVRMUFh5emkwQWFt?=
 =?utf-8?B?K1FhSUtGNS9jSmNlZUl3YU9Xa2NySXBQY2wxb2RhTU1wRnB4UEppZTZraXVZ?=
 =?utf-8?B?WCtjUjJEVFd0bEVzNE9nd3NXUnN6aXVHZi85dy9hcmFCTmtkbW9ndFdjMFhu?=
 =?utf-8?B?Zmxqb1VqZkw0WVR6ZEs5QVVUZzdKamp3R1B2YVVXaHkvWVpQSXg0YzZ1UTE0?=
 =?utf-8?B?c3FwYllCdjhoeXdweEpHMzVFTTJPQTVGekNDWlo3VDRaeUJpTUdkcEd4NmJE?=
 =?utf-8?B?ZWRyaVJyZlNvSHE4azhEb055elh1bHdQMkFGT05jNlk5dG9wVkY4cGJWM3Ey?=
 =?utf-8?B?b2NaRXhCQXU5SXlsbTQySlRaN2V0dTdtT2tpOXQ4U3BGK1M1eXRxZ0haeVpx?=
 =?utf-8?B?dnp3czN6VUNrMDZBU1ZKUGtRM1dCUVB1VGtYbC82VGVhYnlyS1pVcVM1Zk0v?=
 =?utf-8?B?RXJXemhzTk5ORUFXZWpVRi9kb0dhZmlSQUFXKzRtUGM1Nkg1YlF1TStla1Zz?=
 =?utf-8?B?NjNka09ERThYOWFlaERTbmhneDA3aUxYUzI0elZhbU8vV1gxQXY4VTVLZGtZ?=
 =?utf-8?B?Z3pESkp6SDdJZEhGdUpCWUtIQmd0TUM4VGlRUFE5alhEUFBicWluMWd6Mkts?=
 =?utf-8?B?ZU8ydEIzQlJaSFZUYTgrL2Zid3cyZHNReERtSlVXVldYQjR3ajVIeW9OZ0sz?=
 =?utf-8?B?c2ZYSG1ScnBjUVQzSnQ2RE95V0lTS1Q2aGl5Ry94SFNNWUxWUzVHeXh2RFZR?=
 =?utf-8?B?NnRpYVJ2Y2NZT0I0UkwxdGQyQURxTjN5QngyTW5LNmxieHZ5eTVPMTFuMXY0?=
 =?utf-8?B?eWdkVG9hVG9EVzdCcDljRm8xSWlodlBhR1R5TGkyK1JCNEYxUUhqc3c4VzEy?=
 =?utf-8?B?QktZbEpob1NZSFBFanV5V1J2QVN4OWtFVHpVcEJlbjllbDFrbkg5WWZpNHVm?=
 =?utf-8?B?cEFhQklKaE84TWdxSTJDQVhhbklVTUpaazJzWmhMU01neFN2dC90WmxiTE9a?=
 =?utf-8?B?RS9hVjJ2MVdpWFJrQVMybUxWeFZFVGVlY3pkN2wxcFRDQnk4Y21MWmNOSWpk?=
 =?utf-8?B?L2pjTFlIQWJLYy9aVHYyakVxL29sME1VS1o1Yk1GeFhkVFZiWXY2RC9zN3k2?=
 =?utf-8?B?THlsclZiL3JmcjJwNWI3eE0xZjFHQm50ZWp6YjQxUVRwbUhlVkdSbUcrSU4w?=
 =?utf-8?B?TWh0UlVWTFc1THBjTTFWamtjaEg0V3V2TVRaYkZFRGVLMk1kT0tkckVCV1Ru?=
 =?utf-8?B?eWtOUXFOY3Q3TmlwVmoxY1MrdEVqVUJmQ3JXM1FzU0lZQXZwMG9HLzFDZzAr?=
 =?utf-8?B?Z1MrenJMWDZqTDhyaUhDSmFjUEd6VnB1U2ZFV3ZQMVFuSlhGNDF2QXNsZitL?=
 =?utf-8?B?WEZUREoranJvbEpIV0FrbUVpT0EyUHBFVkk1K0t1VW4yZG5HdnhWNjIweks0?=
 =?utf-8?B?c2xLaUs4SW8xNG5QNDJDK2drN1BsdlRkYTJpSURCL24wM1d5ZlI3SVB5V3pL?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd87dcdf-f026-4044-2f5d-08dbb325821a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 00:16:28.2558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JmiXl09643C3wpTYKxYor3kqs/RUOvblWedZdxMmERe6LJzPgo7iZc8Xk469uzudFJMdmkNUtKc9Hbrx7q75Qggnfav+GVI45rK7BF6SmHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7608
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/uc: Add GuC/HuC firmware path
 overrides
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

On 9/11/2023 17:10, Daniele Ceraolo Spurio wrote:
> On 9/11/2023 5:00 PM, John Harrison wrote:
>> On 8/2/2023 14:26, Daniele Ceraolo Spurio wrote:
>>> When testing a new binary and/or debugging binary-related issues, it is
>>> useful to have the option to change which binary is loaded without
>>> having to update and re-compile the kernel. To support this option, 
>>> this
>>> patch adds 2 new modparams to override the FW path for GuC and HuC. The
>>> HuC modparam can also be set to an empty string to disable HuC loading.
>> Why the difference between GuC & HuC? And is 'disabled' significantly 
>> different to just setting it to a non-existent file?
>
> There is the global switch (the one you commented on in the previous 
> patch) that can be used to turn off all the FWs. I see no reason for 
> wanting an additional switch to turn off just the GuC, as the other 
> FWs won't work without it.
>
> Also, Xe aborts the driver load if any FW file is not found, so yes 
> disabled is different than not found.
Hmm. Given the firmware paths are 'unsafe' module parameters, I would 
argue that it is better to keep the code simple and if the user wants to 
shoot themselves in the foot then that is their problem. That is, just 
treat all firmware file overrides exactly the same. And if the driver 
fails to load because the user has requested an unsupported 
configuration then who cares.

John.

>
>>
>>>
>>> Note that those modparams only take effect on platforms where we 
>>> already
>>> have a default FW, so we're sure there is support for FW loading and 
>>> the
>>> kernel isn't going to explode in an undefined path.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_module.c | 10 ++++++++++
>>>   drivers/gpu/drm/xe/xe_module.h |  2 ++
>>>   drivers/gpu/drm/xe/xe_uc_fw.c  | 30 +++++++++++++++++++++++++++++-
>>>   3 files changed, 41 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_module.c 
>>> b/drivers/gpu/drm/xe/xe_module.c
>>> index de85494e2280..0660017c3e83 100644
>>> --- a/drivers/gpu/drm/xe/xe_module.c
>>> +++ b/drivers/gpu/drm/xe/xe_module.c
>>> @@ -30,6 +30,16 @@ int xe_guc_log_level = 5;
>>>   module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
>>>   MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level 
>>> (0=disable, 1..5=enable with verbosity min..max)");
>>>   +char *xe_guc_firmware_path = NULL;
>>> +module_param_named_unsafe(guc_firmware_path, xe_guc_firmware_path, 
>>> charp, 0400);
>>> +MODULE_PARM_DESC(guc_firmware_path,
>>> +         "GuC firmware path to use instead of the default one");
>>> +
>>> +char *xe_huc_firmware_path = NULL;
>>> +module_param_named_unsafe(huc_firmware_path, xe_huc_firmware_path, 
>>> charp, 0400);
>>> +MODULE_PARM_DESC(huc_firmware_path,
>>> +         "HuC firmware path to use instead of the default one - 
>>> empty string disables");
>>> +
>>>   char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
>>>   module_param_named_unsafe(force_probe, xe_param_force_probe, 
>>> charp, 0400);
>>>   MODULE_PARM_DESC(force_probe,
>>> diff --git a/drivers/gpu/drm/xe/xe_module.h 
>>> b/drivers/gpu/drm/xe/xe_module.h
>>> index 2c1f9199f909..e1da1e9ca5cb 100644
>>> --- a/drivers/gpu/drm/xe/xe_module.h
>>> +++ b/drivers/gpu/drm/xe/xe_module.h
>>> @@ -10,4 +10,6 @@ extern bool force_execlist;
>>>   extern bool enable_display;
>>>   extern u32 xe_force_vram_bar_size;
>>>   extern int xe_guc_log_level;
>>> +extern char *xe_guc_firmware_path;
>>> +extern char *xe_huc_firmware_path;
>>>   extern char *xe_param_force_probe;
>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> index fd53ef9e5c99..ef873e894714 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> @@ -15,6 +15,7 @@
>>>   #include "xe_gt.h"
>>>   #include "xe_map.h"
>>>   #include "xe_mmio.h"
>>> +#include "xe_module.h"
>>>   #include "xe_uc_fw.h"
>>>     /*
>>> @@ -209,6 +210,30 @@ uc_fw_auto_select(struct xe_device *xe, struct 
>>> xe_uc_fw *uc_fw)
>>>       }
>>>   }
>>>   +static void
>>> +uc_fw_override(struct xe_uc_fw *uc_fw)
>>> +{
>>> +    char *path_override = NULL;
>>> +
>>> +    /* empty string disables, but it's not allowed for GuC */
>>> +    switch (uc_fw->type) {
>>> +    case XE_UC_FW_TYPE_GUC:
>>> +        if (xe_guc_firmware_path && *xe_guc_firmware_path)
>>> +            path_override = xe_guc_firmware_path;
>>> +        break;
>>> +    case XE_UC_FW_TYPE_HUC:
>>> +        path_override = xe_huc_firmware_path;
>>> +        break;
>>> +    default:
>>> +        break;
>>> +    }
>>> +
>>> +    if (path_override) {
>>> +        uc_fw->path = path_override;
>>> +        uc_fw->user_overridden = true;
>>> +    }
>>> +}
>>> +
>>>   /**
>>>    * xe_uc_fw_copy_rsa - copy fw RSA to buffer
>>>    *
>>> @@ -346,7 +371,10 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>>       if (!xe_uc_fw_is_supported(uc_fw))
>>>           return 0;
>>>   -    if (!xe_device_guc_submission_enabled(xe)) {
>>> +    uc_fw_override(uc_fw);
>>> +
>>> +    /* user can provide an empty string via the override to disable */
>> But only for HuC?
>
> And for GSC once I get around to add support for that. I wanted to 
> keep the sentence general here, since there is no visibility of which 
> FW it is and there is already a proper description of the override in 
> the modparam definition, but I can add a "non-GuC FWs" at the end if 
> you think it makes things clearer.
>
> Daniele
>
>>
>> John.
>>
>>> +    if (!xe_device_guc_submission_enabled(xe) || !(*uc_fw->path)) {
>>>           xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
>>>           drm_dbg(&xe->drm, "%s disabled", 
>>> xe_uc_fw_type_repr(uc_fw->type));
>>>           return 0;
>>
>

