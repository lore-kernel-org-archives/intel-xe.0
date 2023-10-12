Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5154ECDB47E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 11:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EA910E4AD;
	Thu, 12 Oct 2023 11:25:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184EC10E4AD
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 11:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697109953; x=1728645953;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5I1DmEOyKecDKVSU3684X/Eh0xa1FspFr9a7uUDIWe0=;
 b=jIz4nqH6/pYvC1svo0uJlNsYRXnBrDOLct4NU+zo0umXXa9MYmSqI7Vb
 j46nI7VdsgBHZeeyOOIU4BWYRZCkDPVcjp0hXNSM03f60shBodcl0sPnd
 8Az7ESgy28nVV0M3zJI5QXF06z3Y9jdj/hO33T0qR9bP0qDDXjmMihZ/v
 31HB08Kn12JGJPlCxaq/NyVJdhlwCS8QRMAMGriPtqUkmwnpO7Y/8e6cJ
 /mM6+DujShhy9Vkf5LApZgqzlUu05QWLqMjGTUEHOQlzpIOY/yIqu8RzW
 RFWpWqbO54aIQwgIjq9Ul44GDYJAEiKFCVNHRomSLWjubrz1wQ0Ih7P+0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="388756386"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="388756386"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 04:25:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="730888124"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="730888124"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 04:25:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 04:25:52 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 04:25:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 04:25:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 04:25:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsVPVYAaVjS8iJQTBeWjTUO51E2BXP/2UuaRZqF/IZvpwl5fbgXv2noBmbifaeV4N3lkWEhrwj0YB7LX5qnDcGilLf0b2lAnVAXyc7DEj5sLmrPLDrbPHjMFt9cn0y6ZB5AjaLoEENoNn28MjFrD7p6cs4zomSz85KGPgvAeOOZxfbfogFg3Ror5Fg4FcCKXVd0+4RkS0xp3kLsqkFQVGFJjTbHaM3jteSMsa5VOKT3gA/5DFVcLnhsw2o1WMeWR/sx9D542r608sQeZnC0Lsc7RG2K+TAxTLmSz/SRJYJkTYpytU9HF4G0Y8K0BzB7oo942wtKoNPc83m69sXa/xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRBqu5fvkBkHmwsTa3rrfLkeFy7v9LCyn/7D/xjajpg=;
 b=IP0s3gxudST5iTwgcFycUWnIEUBpbmX1xvoJtnneTlGy58kZ+AXuDVDixc6f29TfvkG5WiA5tuVoTBHQXxaEG+Tl27iX9BUfePjxj6rGeI0ZUEATd/23icqlM1PiEuS0YIsZtOhkebqqjYNG/6RwDZ5xH59WFcx83qyscqc3EnE4+99HamqwgVNbDEV3eP7RajlhTlJjUrCmprj8t9EvhplrIyBMODyz94ii1oP5jZ7aqjXAZm9RykW7fXY1EJnyHF2+LSmG+71SK+391Iv1/Wi8bUj8mJM3jIMrkJN91ZYSbeudV5nvaUSGc1kjrKq5qoyscq5BBkq3CGMI1qwVUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB6836.namprd11.prod.outlook.com (2603:10b6:510:1ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Thu, 12 Oct
 2023 11:25:45 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::c2e3:634a:6cd3:7f46]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::c2e3:634a:6cd3:7f46%7]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 11:25:45 +0000
Message-ID: <30075a70-c7d7-4614-8b05-07f8c208b83c@intel.com>
Date: Thu, 12 Oct 2023 16:55:34 +0530
User-Agent: Mozilla Thunderbird
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231012063209.56824-1-riana.tauro@intel.com>
 <20231012063209.56824-3-riana.tauro@intel.com>
 <7375cb31-7e13-89a8-665e-a38b9286c6d6@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <7375cb31-7e13-89a8-665e-a38b9286c6d6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::32) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: aa4562cb-d982-4c61-1f4b-08dbcb15f9ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WeMrAoSS7Pv2uEUvVf6lHNW2Ms1sVt62vz/m0iVZTu7r56H/RQgLr4vBm0bp7yOkalLo4o6JatEaDTYPzRI51YqZTK1R6PJHCF5b2XmUuwODEDJqbWiQP7XUbwpnAHiszZJQsj+KgfyBvxG6LdP6adG5PN4PAHwB5HI8KhVFRLNU+emea2sVm7lGQiSOOEDpcNPZDmvaYSX8CQP829BpJWgZyywIKhvWpVpzIyLcZAPvXUwreFrOVcVHVI1bsvcIoEh77vQOQLw3fNNDxm0DNMYBFQu8ua2Pwk3HuJwZfabvkgMPzTPf19QVxQmN7KRFsQ33dWRecuq6siKRy5BZu5oA4yIzv4t5kFcdi8+ErS6jV9N/DbS/dqFS8W+wCKLr7ifxgETVcieIR9aQFCX5flPeHGlFqGlt7DZpkr8jwoj4eHUG2yqcu2h57KW9WbIpjkox+8QwQfUunQLLkYpa64wfhb9DjvIgq0tPu7l+FKVze0hV2F6t3RFuDqgvZUGSMpnOf2po1GFt0XUOoVzRfAFhccLIVPOZI6Lh/G97z6IcTY9aZVqaC4SlcTXoHmsaoY7AXEgcK9I9YdcEvsx60Geo3FEggRDVqSlsyhPQYxvJBwzJNlDoNlusd5qOWf6O00rMElgIoN3rAc9kG9oMddo1+Cpxrb2HKmC/seMG0rI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(82960400001)(31696002)(38100700002)(86362001)(36756003)(31686004)(66946007)(2906002)(6506007)(8936002)(478600001)(6486002)(6512007)(44832011)(41300700001)(5660300002)(4326008)(53546011)(8676002)(6666004)(83380400001)(107886003)(66556008)(66476007)(26005)(2616005)(316002)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGpUcTBJODZNS2lFSElIdnoyQ1M3YWF4STZ5MEUwK296N1NNM2QwTE5BSnNo?=
 =?utf-8?B?UWdxTHQxUnlscTZvNkozL2NGdVZlQlgxMnZ0ZWJabTNOSXhEeXhPZEk4TTZn?=
 =?utf-8?B?N1ZnVlBZNEQ5ODljS3VkZGFpY3F1d3gvNlRrZGpnOG9va3B3WHBaWGVVMGRI?=
 =?utf-8?B?NHZGTm9lUVNmblNwRzNYQXR0WkVNSkZqNUJNZEhUcFZEaDNwUUJHbTZwUER4?=
 =?utf-8?B?SEtkbUpOYU9xL2ppZkUrUi9JRWlBNHY3UkliTFZ3cDhTVTVxaUpWSzl3d0Rh?=
 =?utf-8?B?SFFYY0tEemgxMmZuWlZGczQ3QXJOZ2lOTngyN3ZWaGI1UmN3QzBmMjk0TFRM?=
 =?utf-8?B?Uk5ObDF1djFhZ1NFUzkrVEszZ0craDhPR1RSQWs0Mml0WWxDeUxtanJQOHFm?=
 =?utf-8?B?MzlUWmxHWnRKQTRsSTU1Z3VJRnlXTHgvNTFqbGw3ZGxyNEkzby91amlxMTF6?=
 =?utf-8?B?SnpkN0EvNHdxWEgwQnZyVU5NdGJvTDZHZXowNkFlT3NCNkUwMUdFbWl5T0Fm?=
 =?utf-8?B?UDJSVG9XTS9FYnVLZGZoTkZsV21iL3ZEUkllcTRpSWJLZEtLOGVKYUMvekhx?=
 =?utf-8?B?L3RXR3dXaVlvenhoVUptTzE4Zk5tcFZmdmloeVRGaUlXb1U3U2RXVzJnTkk2?=
 =?utf-8?B?aHpnNzYrY1EwaWJYWVNPTXRzMGN4SmtpN3ZxTXlvTVhzOEM4bWxSTnJjVDAw?=
 =?utf-8?B?NEFGYXBSSk9vMzMxVTBnM08wUjQyYTVxZVVuOHRpUXFod0VKL1YzaStDRXY2?=
 =?utf-8?B?K0hYU25UOEZvZ29YZ1BDc2xGMzZYcXRWMFI5aU5tQ29ZeVNLNUxSV0VGcTFP?=
 =?utf-8?B?Q1QzSk94VjdWOGU1MVM2WHVReFNpMFlpOHQ5REJWTFNWZlpOYnZHZjJRSEZU?=
 =?utf-8?B?SmNETEpaSGRvUCtoVEg5a0Uyc09ScHJ2NnR4L3pQLzJUamhQMUZRMWpuNHp1?=
 =?utf-8?B?T2Y3ZVNQcXhBckFFYU91cWxHdDFoc3B0cGhnd2dvK3Y2NkNZK2dFZHMvb2No?=
 =?utf-8?B?RUtqbFNRMHBTMjRxZXhmSUY0ckRFZmFMRkl1R1c4TDFjLzllTFhiRGtzWlpP?=
 =?utf-8?B?NGxZMXZ0NTNlUzdza3pTWGgvcksyVW14SzIzOHdaUHlEQW1WNHpYVHkvWGlN?=
 =?utf-8?B?dXlEZDI2dGk3ZzFpUTR4T3Bqc294SCtyQWdmSGs5VmN1SzVqR3VsdWZMT2Vp?=
 =?utf-8?B?emV4VTYyTkg2OW1hRHY4MzZWOGZqUEJtZEtadUhBajJDSHpmNm9SNUN0UG40?=
 =?utf-8?B?dS9DKzFIUllzeCtJTFQxY0hERFBmVGNvemtuR2RGU1ZqUktNTDNsSW1iVUVi?=
 =?utf-8?B?eGR0MU9JZFRPcW42T1ZlTVdKN0FkZWNlTWkvN2pVMDh1bzFZR0NoYnk4TWsx?=
 =?utf-8?B?L3pMSUFXaS9PQkljZWhCRWRpWUtOL3h4eHllM2gvVXc0c256djNvTlpzL0p2?=
 =?utf-8?B?Z09SL01FaFVvM1A5Z2hCUjdaRktlOTdjeUpkYTB5SXY4NDdmektPb29xVjRV?=
 =?utf-8?B?bzduQWhyWXFmVVJTMWR4MEZEMlhlam5ldnRzb1FNRzJNN3FYT3pDcm9lODUy?=
 =?utf-8?B?SFNYL2RmejVRQzJpL2hlWE1NUXJJQ0h5OUg0RjI5dUsrVEZ6Wk9WOHkwMjJr?=
 =?utf-8?B?WVA3NlVSYWt3QWJMeVJhWDFlUEtyWlBjT3pMd1h4S3VtSncyVFZONzJqbnRM?=
 =?utf-8?B?c1FRVEF6RWZ4Vm5TeWU5WitZS05tSGkweWdnNnQrQjErcXpYWnJ3L2pHNVht?=
 =?utf-8?B?dHBzcHRxTldDektwZkhpR0p1TnUxY3VUMzZZVFhQbDBBLzNadzRDYml6akIy?=
 =?utf-8?B?L0V2SHNJaXcrUmF6YU1UWm1EbzZXTXJsajBIT3B4S1RDL01xOCtxdmE0OHRm?=
 =?utf-8?B?ZzBjNkpJaXBEbnh6cTdQK2dMZ1FIUWM4OUNqUnZjekpiWm5BYUZRZ0pZRTZn?=
 =?utf-8?B?WjRUUkl6YnJBMTlRbXErSTB3RldmNGNkRDdVeWtDQXJaRGl1RTduUkVPMHNX?=
 =?utf-8?B?NEJPemtRb0l4MVVlRVJmR2YrcWh2SUxya3MvSFd2TnlFbVFzZmVjN0FMSHl4?=
 =?utf-8?B?ZWJKcmdDMDM4VkRqSWMwUGlSeWIvTlNMQVJCZ1lkdU4yMWJuc1dlMGJHdGR0?=
 =?utf-8?Q?eQuF6JhURRZEzgryDfkAC7QwO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa4562cb-d982-4c61-1f4b-08dbcb15f9ff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 11:25:45.6167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZzpgj+eU5dQCceK04Ayc1UzMAhtoGYWXNA89QfxJFo95Ke7WfCNcfTQ1cTmPMs+lRwmkWT4TJqaKFYC0jaubQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6836
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe: Toggle GuC CT communication
 for D3Hot Transition
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Michal

On 10/12/2023 4:14 PM, Michal Wajdeczko wrote:
> 
> 
> On 12.10.2023 08:32, Riana Tauro wrote:
>> During Runtime suspend/resume, GuC is reloaded for both
>> D3hot/D3Cold-> D0 transistions. It is not necessary for GuC to be
>> loaded everytime for D3hot->D0, only enable/disable ctb communication.
>>
>> Add a function that toggles CT communication when d3cold
>> is not allowed.
>>
>> v2: simplify code (Bala)
>>      handle pmu suspend in runtime suspend (Rodrigo)
>>      change function names
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c | 62 ++++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt.h |  2 ++
>>   drivers/gpu/drm/xe/xe_pm.c |  4 +--
>>   drivers/gpu/drm/xe/xe_uc.c | 21 +++++++++++++
>>   drivers/gpu/drm/xe/xe_uc.h |  2 +-
>>   5 files changed, 88 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index c63e2e4750b1..2c507d67291b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -709,6 +709,68 @@ int xe_gt_resume(struct xe_gt *gt)
>>   	return err;
>>   }
>>   
>> +/**
>> + * xe_gt_runtime_suspend - Helper for GT related Runtime PM suspend actions
>> + * @xe: xe gt instance
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_gt_runtime_suspend(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	int ret = 0;
>> +
>> +	if (xe->d3cold.allowed)
>> +		return xe_gt_suspend(gt);
>> +
>> +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +	if (ret)
>> +		return ret;
> 
> silent exit, without err() message, is it ok?
suspend will fail and i don't see err message being used for
forcewake in xe driver. I think error message would be unncessary
> 
>> +
>> +	xe_pmu_suspend(gt);
>> +
>> +	ret = xe_uc_toggle_communication(&gt->uc, false);
>> +
>> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> 
> isn't XE_WARN_ON deprecated ?
There are many occurences of XE_WARN_ON in the same file as well
as the driver. Could you point me to the patchwork where it mentions 
about the deprecation?
> 
>> +
>> +	if (ret)
>> +		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(ret));
>> +	else
>> +		xe_gt_info(gt, "suspended\n");
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * xe_gt_runtime_resume - Helper for GT related Runtime PM resume actions
>> + * @xe: xe gt instance
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_gt_runtime_resume(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	int ret = 0;
>> +
>> +	if (xe->d3cold.allowed)
>> +		return xe_gt_resume(gt);
>> +
>> +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> +	if (ret)
>> +		return ret;
> 
> ditto
I'll fix this. Returning err is not handled in pm_runtime_resume.

> 
>> +
>> +	ret = xe_uc_toggle_communication(&gt->uc, true);
>> +
>> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> 
> ditto
> 
>> +
>> +	if (ret)
>> +		xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(ret));
>> +	else
>> +		xe_gt_info(gt, "resumed\n");
>> +
>> +	return ret;
>> +}
>> +
>>   struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
>>   				     enum xe_engine_class class,
>>   				     u16 instance, bool logical)
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index caded203a8a0..e6574e51004f 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -37,6 +37,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
>>   void xe_gt_suspend_prepare(struct xe_gt *gt);
>>   int xe_gt_suspend(struct xe_gt *gt);
>>   int xe_gt_resume(struct xe_gt *gt);
>> +int xe_gt_runtime_suspend(struct xe_gt *gt);
>> +int xe_gt_runtime_resume(struct xe_gt *gt);
>>   void xe_gt_reset_async(struct xe_gt *gt);
>>   void xe_gt_sanitize(struct xe_gt *gt);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index e31a91cf311c..1cd46ab804fe 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -254,7 +254,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>   	}
>>   
>>   	for_each_gt(gt, xe, id) {
>> -		err = xe_gt_suspend(gt);
>> +		err = xe_gt_runtime_suspend(gt);
>>   		if (err)
>>   			goto out;
>>   	}
>> @@ -304,7 +304,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>   	xe_irq_resume(xe);
>>   
>>   	for_each_gt(gt, xe, id)
>> -		xe_gt_resume(gt);
>> +		xe_gt_runtime_resume(gt);
>>   
>>   	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
>>   		err = xe_bo_restore_user(xe);
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index bf75c39d929d..62a5fa6e5362 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -225,6 +225,27 @@ static void uc_reset_wait(struct xe_uc *uc)
>>   		goto again;
>>   }
>>   
>> +/**
>> + * xe_uc_toggle_communication - enable or disable uc communication
>> + * @uc: The UC object
> 
> s/uc/uC
> s/UC/uC
Will fix this
> 
> best if we can link that to some `uC`_ documentation (I hope there is
> some already, right ?)
> 
>> + * @toggle: 0-disable, 1-enable
> 
> maybe @enable
> 
> also for bool we use true/false, not 1/0
will add true/false
> 
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +int xe_uc_toggle_communication(struct xe_uc *uc, bool toggle)
> 
> there seems to be some inconsistency in the naming:
> 
> level:	function:	next:
> 
> uc	toggle_communication -> guc_enable(false) | guc_disable()
The first one seems okay. Why is there a inconsistency?
> guc	enable|disable_communication -> ct_enable(reg) | ct_toggle(off > guc_ct	enable|disable|toggle -> ct_control_toggle(on) | ct_toggle(off)
Agree toggle and enable/disable communication does seem similar.
But i couldn't think of another name for only toggling ct->enable


Thanks
Riana

> 
>> +{
>> +	/* GuC submission not enabled, nothing to do */
>> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>> +		return 0;
>> +
>> +	if (toggle)
>> +		return xe_guc_enable_communication(&uc->guc, false);
>> +
>> +	xe_guc_disable_communication(&uc->guc);
>> +
>> +	return 0;
>> +}
>> +
>>   int xe_uc_suspend(struct xe_uc *uc)
>>   {
>>   	int ret;
>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>> index 4109ae7028af..69d7dff0900e 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.h
>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>> @@ -20,5 +20,5 @@ int xe_uc_stop(struct xe_uc *uc);
>>   int xe_uc_start(struct xe_uc *uc);
>>   int xe_uc_suspend(struct xe_uc *uc);
>>   void xe_uc_sanitize(struct xe_uc *uc);
>> -
>> +int xe_uc_toggle_communication(struct xe_uc *uc, bool toggle);
> 
> please keep empty separation line
> 
>>   #endif
