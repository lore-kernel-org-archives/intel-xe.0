Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B94CA0EC6
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 00:10:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1714110E00C;
	Tue, 12 Sep 2023 00:10:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB0E10E00C
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 00:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694477445; x=1726013445;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gmbO9iiwSnPqrTy1VYCQPWq8kpQNngBL2yECA9hRXps=;
 b=FSBrOffcMEUN8pMIHHUAZwC28SOVFNNHsPzSorr0rFw62UCpK9PvqjI1
 U4Xi2xl0A6zQU07dzmI+jxnc2W5n1CgOQPAnx3akZIY8cLud5Lyr4ECJ3
 vowIQNN7n8+JoRzahDEnLkmTamRB1oM5DZf/6BzakczhVQL6XuZdnW6hd
 hyqRE6rm1Im+nxqTJS4nG9jE1b7XeBRwW+8qAERsYhJfQMSSJu7GUtOoV
 01ipkNRVXzhBvN6DtOGI7eg/GPVIUGyx+/Of4J5aZo+9mA+cbMA/1MkbB
 svu3Rr5zFm5cbxhR8t6dlJCTEe7O+HuF6HTg/IUg8HzQdm3qDQi48QYWk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="382051752"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="382051752"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 17:10:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="833692635"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="833692635"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 17:10:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 17:10:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 17:10:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 17:10:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 17:10:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNNjUWC3PSVnPDGZeJ165pFPoQq61pb0m+CV9WeFc9x93bPR5lJW/GVimu9Lt2ynWazSCKdStVVJX6RE33Z2neGaup8J9IcPGYUU53AwXSzX4TzC2UbEilqzKVcWW3YU/R0EBHbrtO9YHqiyb/xFx5T5Gu/Pwj0s/vi/sf+bw4ZsvOohsekntczLfgqSu/Ku6+Zjjo5Vh7g/XtU5t/G1CI8Zi4ctZDDpG5vpFYsV7PtNq2kzKkz9cMBPlLwLaHQFkZr4QZOv+rodnb0PO3zRDOHoWVAmDpjdmZpnWfI0Z+KQV+nt1kF9/FVQhLSp2pySfv7JHo+OaBiH3sBj+Rgdgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZL2lz664ADqm95rYENVouGjvMkxkyRyc9vufXAbu08=;
 b=gP+R7JZ4A1nry2zZnyZTaQCkTs7zcsm6Nb0JvSFtQhWF1ja2Kea6PIJYhwi8NSiY5TErU/Vf8Uv2j4PDtUel+EO1LCsl1FQ/aFYkQ6xFYOSa2H6NXXD6ymLs+Ghpcfw5BPm+hRX/+v73KZ4cWtTEAyuHOFj1Z8nV6/+zQ+77W/d6sIZ68GFv+VyNPYYcKz5olM34rF3e5w2Ohzuie/lur3eUKb16ZpJOzH0bpkKkh/FrDilihPUdV5Vq0RjApO6W8ivCe2gl1XmUn5whtkRBVJW2QHHmbtx9BAUuFRNzeSqO1tuZ5Yjw7qIOmfYH6dtfGkFzyUfgDE7U74ZQ9ttfXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA1PR11MB8198.namprd11.prod.outlook.com (2603:10b6:208:453::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Tue, 12 Sep
 2023 00:10:42 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::4b20:e34:71f:139f]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::4b20:e34:71f:139f%4]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 00:10:42 +0000
Message-ID: <6a7efd35-773e-4b61-8f61-8ef733c7edf8@intel.com>
Date: Mon, 11 Sep 2023 17:10:39 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230802212646.838717-1-daniele.ceraolospurio@intel.com>
 <20230802212646.838717-2-daniele.ceraolospurio@intel.com>
 <5ca76588-9822-cc1e-3c91-5f14918312ea@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <5ca76588-9822-cc1e-3c91-5f14918312ea@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::27) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA1PR11MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: 53110994-8764-488e-299b-08dbb324b3d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D01bFG5l5HQdRT0EJpGROXAWY+eU5iynRgAVFcu7qwSd0CLFpkBeoaXWpQIpNHqyU6VdpTvEcBxAFnsXAaadDoCvBLK8fAU7Hkh7e+uMJMEuxNyXsRhs4w/xYS9/96xvJwCmgWCI4yj/LuK1x/vFHU3S/KVaOE4IKrr+hO2enjxwcmcagFhW0vw2sCY94z58KYhsJ4sO2ovfebxpetPerFw7l8NZgTMfRG3tajYCaQHUUSSaxVrYSWAwsSSgoBmdYgwmeN4Knt16+jDAobjPGyb2LN6MvT9cwHFXFPyaS7qP5c54cK8sGsHm14XI8r0QGjIX8/1fSnSTY/eN81C136VJc+n9swlSuoS6cqAKQc17TeKOf7XgUE8yyoqYbefIgRWEW1Yw5C7J1Up4w3iMgYXcuxuBDfKLl7LjSzi+2BxSQX7xvapg6p5OXjWLEQFC6b61iJLapcNp2fqQ+iz/PwZ0jvaI61QvEBCMNGvqIfOpOG7431YHbK7KSb6vQRZJrIpyu6Ijb/gJK8mIxOHi4uL2f8LfPMDdrynuiO2Qz/gNP8lU//KqvN9Unb68XKZOBbX6se7+Xh7PjPkLA89ZQnEXDc10AQADq8lZjRb/4ydOR+y/GQKJ9g35mgOv+ygIYepud3J5hLxcjx0eX0fIQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(396003)(346002)(366004)(186009)(451199024)(1800799009)(41300700001)(316002)(26005)(107886003)(31686004)(478600001)(8676002)(8936002)(66556008)(66476007)(66946007)(4326008)(5660300002)(2906002)(6666004)(53546011)(6486002)(6506007)(6512007)(36756003)(2616005)(83380400001)(38100700002)(86362001)(82960400001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVVlYnFwbTI3WFNiMHA0N0lrdE43Z05jMEdyc2phUG9TWXIweTdSMGxTNnRO?=
 =?utf-8?B?WnA5eUo0MDdrRmJVdm84a2pMalI5OWhNOSt2bmN1WUlTa0N1TDhWeW84R0pm?=
 =?utf-8?B?c3g0ZHp1bkZNbFU4ZjQ2WVMwdVB5alRCekl0R01Qam9IOFI0Z3hGY0FLbWtn?=
 =?utf-8?B?SHRrcVpKOFh5NHkzWkI2ZmN2NitueGVEcEtnYmRhanRrODF5U1FoNSs5ZDNn?=
 =?utf-8?B?SkZ0ZklrUlV1L1lwOXpMai9LZmtURkZzMmdDV3VxdksrNUthVGRuZ2F2KzYz?=
 =?utf-8?B?REtsVXA5dDdPT2hmd05lUWEyWURCanpsL0dCMVpiRXlHaXNZSDBvVU1pWklp?=
 =?utf-8?B?OXVSU3paVDBmN0gyY05sMHNBcFl5M3VwdFBSSy9ydE1BYVBYSWs4RmRDWHg1?=
 =?utf-8?B?MG12MjFvZWh1a1luYXlPNjR5bkg1cFBKZWd2UnpXMENBTEFNSFF1ZzcwNkZl?=
 =?utf-8?B?eDEyeVFlRCswRjcrZWNQZnUzRG5lMTNQTTBWSEFPcExaREFCZ1NnUDZUaUYy?=
 =?utf-8?B?bmYrbGlLL0FuRS9YQ3psb2RRQkxRWXB4QW40c2dPdWMzWVc4N0tWYVNSQzcr?=
 =?utf-8?B?Sk14VHFzdGlkSTJ6MUJQV1JrZ0tMMlY0K2lkdy9iSW8wWWI0dDh2ZUp6UUFY?=
 =?utf-8?B?aFJzVzVqVjM1cDdXb3psWG9Ed0NDYXdiR3VrR1llbEw3c3lpa3lGbHpLUU9m?=
 =?utf-8?B?MGF3TnlhUlBQWTRVSDZkbExHeE56STdQbkVRSTdneW9UODhMajQwMSs1U1Fs?=
 =?utf-8?B?cUJsaENVL1UvOGN3UmYxMXBNMVEwdkRkMTIwTTNyZDhGUkZpYUlXbGRCRDFL?=
 =?utf-8?B?VWZqTEovUm1MM3Rnd2FmRTFhZStQSVJza2J4ejdmRXhHQTk2ZXBBTWlOU1ky?=
 =?utf-8?B?elQvZkcvVnlpdTRUbjJMQmZTcjZhYlB3MWhvdGNndmZZUDVXSGZzSWIvL2Fo?=
 =?utf-8?B?N0Z2V2xpbGZCVnNGaldTOVBibnp6cjJoMnJXQm1nYkRtZ0kwMmJmbmRseURF?=
 =?utf-8?B?dFlsL3VmbVhpWjRldlVxQ21WRlhpN1VmN2xlOFR6eENWWEFsTlNjTTJwdUs1?=
 =?utf-8?B?NExnMVp4U0FaSmFhTWFjR3YrZjY0ZUR5d1h3WE9MaGZLY2tjM3dSeTBMSzJk?=
 =?utf-8?B?KzZQTHR3NlpacWE0UEgzbHNkaFVJelZxOGYrYzFaWTN4eENlM3BRMHR2UjRD?=
 =?utf-8?B?U1UxS28zb01ZaXdxdUg1TlJId2RlczBUZFBxS1dGVjNZK0V2a29VZW9kaVAv?=
 =?utf-8?B?ZE1yd3AzYkhYUklSeHpkOUFJVGsxSDJUa2VDdno3ZkFjQTd6NlhmaEgzTmQ1?=
 =?utf-8?B?ZHNrbFNvZ1pBNzlIdUZYbmdUd0REU2ZQMFhJQzQ4d3ovQXlQYnllaGRtVHdC?=
 =?utf-8?B?Zi9CNlhzYWlFLzZzanlEckxFMTlUUVpzNTUzaFdjS210dTBvaGlkb3BHSTBC?=
 =?utf-8?B?YzdFSmtlWGIrWXBacVRoN01ybE1NWlVYd2duSlkrQ3N6eGIvd2V1cGg4QWkr?=
 =?utf-8?B?c0UyOGlrcnpQcXB3cG9zellsajVjeEZCTll0RTBGRi9NVmtoakttMDVzRFdo?=
 =?utf-8?B?WkxqajF0aVJsREh6TlhJbVhRZHZiY1lselJaZWRudGJ1dENaa1JadHRuV3Yz?=
 =?utf-8?B?d0hFQnhaNWtVWlV3L2VabG94TThkR2I0aGxSWXQ0d1dMYVgwbjUzcWF3RU40?=
 =?utf-8?B?cEhBMkNRa0lvQ0dhOCt1WjN0VUw2VHZNZXdSNC9RZUNXQVp6ZmFXN0tYaHFl?=
 =?utf-8?B?QXBPQlJIVmx1MXZCQWJmZkhqdzNLQnpDc0VxVjdrWFIxbU5jb1o2RHhHZ0x3?=
 =?utf-8?B?Ums5ZDJmSHhSY2lKeWlMTTRMVmFlaXBEL0Y2MTVsb0dpV1lUamhacUczeFIx?=
 =?utf-8?B?cmUraDBHVFh6N2RoQmc3WGFIUFdqaXFzbWozN0x3elBQTzcwWWh3UEovRkF1?=
 =?utf-8?B?MzRpcENzUHZmZE43UHZ1SENRUnhPendCYk5VeTZkOUQxV3FUeXZjTFlyTGhx?=
 =?utf-8?B?cGd2VTVUL1c3bHZXR3NrYzBmb0I3dzFObnlxckE3RllKRVhkOENaSlR0VUh3?=
 =?utf-8?B?azNUWVRvL1Bldnh2NTlnRUl2aVBYc1VtV24zVjZ1U2tySGVCZkllZjJ3RjJj?=
 =?utf-8?B?aDE5VitEcGw5TWJDTmh2RTBoMzB1cFViU1d5Q1hwZTZvbGh6U0oxSjlIK213?=
 =?utf-8?Q?o7UL3dN2QAQm0da+TAWAV2g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53110994-8764-488e-299b-08dbb324b3d1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 00:10:42.1398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iz/Hu+4bLwq/wNiEWvk+TSyW2q+n0496pd0v69nMm2RHxgHkrWUyWb2bZgdOsdw9QF93KnP5eYS80LfddzkzxhS9rJmuKm+1CbHBBDfCEeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8198
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



On 9/11/2023 5:00 PM, John Harrison wrote:
> On 8/2/2023 14:26, Daniele Ceraolo Spurio wrote:
>> When testing a new binary and/or debugging binary-related issues, it is
>> useful to have the option to change which binary is loaded without
>> having to update and re-compile the kernel. To support this option, this
>> patch adds 2 new modparams to override the FW path for GuC and HuC. The
>> HuC modparam can also be set to an empty string to disable HuC loading.
> Why the difference between GuC & HuC? And is 'disabled' significantly 
> different to just setting it to a non-existent file?

There is the global switch (the one you commented on in the previous 
patch) that can be used to turn off all the FWs. I see no reason for 
wanting an additional switch to turn off just the GuC, as the other FWs 
won't work without it.

Also, Xe aborts the driver load if any FW file is not found, so yes 
disabled is different than not found.

>
>>
>> Note that those modparams only take effect on platforms where we already
>> have a default FW, so we're sure there is support for FW loading and the
>> kernel isn't going to explode in an undefined path.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_module.c | 10 ++++++++++
>>   drivers/gpu/drm/xe/xe_module.h |  2 ++
>>   drivers/gpu/drm/xe/xe_uc_fw.c  | 30 +++++++++++++++++++++++++++++-
>>   3 files changed, 41 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_module.c 
>> b/drivers/gpu/drm/xe/xe_module.c
>> index de85494e2280..0660017c3e83 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -30,6 +30,16 @@ int xe_guc_log_level = 5;
>>   module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
>>   MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level 
>> (0=disable, 1..5=enable with verbosity min..max)");
>>   +char *xe_guc_firmware_path = NULL;
>> +module_param_named_unsafe(guc_firmware_path, xe_guc_firmware_path, 
>> charp, 0400);
>> +MODULE_PARM_DESC(guc_firmware_path,
>> +         "GuC firmware path to use instead of the default one");
>> +
>> +char *xe_huc_firmware_path = NULL;
>> +module_param_named_unsafe(huc_firmware_path, xe_huc_firmware_path, 
>> charp, 0400);
>> +MODULE_PARM_DESC(huc_firmware_path,
>> +         "HuC firmware path to use instead of the default one - 
>> empty string disables");
>> +
>>   char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
>>   module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 
>> 0400);
>>   MODULE_PARM_DESC(force_probe,
>> diff --git a/drivers/gpu/drm/xe/xe_module.h 
>> b/drivers/gpu/drm/xe/xe_module.h
>> index 2c1f9199f909..e1da1e9ca5cb 100644
>> --- a/drivers/gpu/drm/xe/xe_module.h
>> +++ b/drivers/gpu/drm/xe/xe_module.h
>> @@ -10,4 +10,6 @@ extern bool force_execlist;
>>   extern bool enable_display;
>>   extern u32 xe_force_vram_bar_size;
>>   extern int xe_guc_log_level;
>> +extern char *xe_guc_firmware_path;
>> +extern char *xe_huc_firmware_path;
>>   extern char *xe_param_force_probe;
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index fd53ef9e5c99..ef873e894714 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -15,6 +15,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_map.h"
>>   #include "xe_mmio.h"
>> +#include "xe_module.h"
>>   #include "xe_uc_fw.h"
>>     /*
>> @@ -209,6 +210,30 @@ uc_fw_auto_select(struct xe_device *xe, struct 
>> xe_uc_fw *uc_fw)
>>       }
>>   }
>>   +static void
>> +uc_fw_override(struct xe_uc_fw *uc_fw)
>> +{
>> +    char *path_override = NULL;
>> +
>> +    /* empty string disables, but it's not allowed for GuC */
>> +    switch (uc_fw->type) {
>> +    case XE_UC_FW_TYPE_GUC:
>> +        if (xe_guc_firmware_path && *xe_guc_firmware_path)
>> +            path_override = xe_guc_firmware_path;
>> +        break;
>> +    case XE_UC_FW_TYPE_HUC:
>> +        path_override = xe_huc_firmware_path;
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +
>> +    if (path_override) {
>> +        uc_fw->path = path_override;
>> +        uc_fw->user_overridden = true;
>> +    }
>> +}
>> +
>>   /**
>>    * xe_uc_fw_copy_rsa - copy fw RSA to buffer
>>    *
>> @@ -346,7 +371,10 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>       if (!xe_uc_fw_is_supported(uc_fw))
>>           return 0;
>>   -    if (!xe_device_guc_submission_enabled(xe)) {
>> +    uc_fw_override(uc_fw);
>> +
>> +    /* user can provide an empty string via the override to disable */
> But only for HuC?

And for GSC once I get around to add support for that. I wanted to keep 
the sentence general here, since there is no visibility of which FW it 
is and there is already a proper description of the override in the 
modparam definition, but I can add a "non-GuC FWs" at the end if you 
think it makes things clearer.

Daniele

>
> John.
>
>> +    if (!xe_device_guc_submission_enabled(xe) || !(*uc_fw->path)) {
>>           xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
>>           drm_dbg(&xe->drm, "%s disabled", 
>> xe_uc_fw_type_repr(uc_fw->type));
>>           return 0;
>

