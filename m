Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF25FE8181B
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 05:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8BF10E0B0;
	Tue, 26 Sep 2023 05:12:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56F610E0B0
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 05:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695705132; x=1727241132;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2Icp4aRjgBWFLGEPCr//5ikO/6CO1bSuudc2MLmhkc0=;
 b=b4gaQZWDN99Qjw0QXrpEYVOaltc6Z0wtHJdS6ddMieW5EyN927wG2LqD
 raCi+GofToaIsXtx2Mv8633ZJaXYIvDCV+Rzrn8Jy20t9BsjeWX01dbVX
 mr8VgnuL3EL+6f3q0quEx0ShudnRDDY10qBk2DM/hwzJEvUuK5hAIRTD9
 n0/ftO9XjFxXNy496pJAch4l7LqI4q7MGGSk3bRROJP76hIKRdYHGnUn6
 fSJabupjLdAkWMOAri/fbIbZutJB2d9avQuMS39NR11j3dhMXtW1Dn049
 x+7DgGqYTUWsDMB1A2cqrydtwdd1NSs7r9/ewdNzUiCx66k+featK5NDK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371819479"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="371819479"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 22:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="783822431"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="783822431"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 22:12:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 22:12:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 22:12:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 22:12:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 22:12:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnzPW5vpqp0jnKnZtlfJEh3ZauSzjkAwc74y3abQsQFxmRT0WUUydag6OOtuEMnv7+aEEq4CAINUaaocEBg97olGf+mu14uXxm7U44J74wuiGgmFQElRttvNx+gloF9P6Gg/x3iQxCyeh+Q3QJ8t1ewwTXMBdt4PRtmfQIVYTKnhvnx6op7CeqitIiBQCKBm4JxmNhmTj+DYRGLyKa2rqv6i6NK/VZVP7s13NzB76zQaOuufHMDYQvLxhmANh1Y3hXs1iQidkMg20SzABIw8iwZ3/zwaxNPWaJlt+zz4OM79wBMyJaCgrk98wpcVN9mdDw4IkH7LcX3Q5Azaw1S59w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pmYTLlSfiLzjtSJ6xF1FZwEcUMBApfBIY3EhMcQPkE=;
 b=OZRle2LiMv8fe5NFglnqWGEPZIxvxl/FU9IT2AehaXIJvBLarEaiScNVgHXs5rYAKVJq0EWy2WLZzmj27DZtsVPHmxGLHtJ04ixkeDoeBsgg7UZgx+pUlIsmgIQczOizhiRMooKK9eTqlqjdAiPkQY2eOO0lkIbiIgNyxNeperusWExjMqJZhW26phmDb+kdCQYxDYrT+FObhv/OUbQ980v83YZc9PocfDxqdBgiPseh28J9L8zYU4ipWlCpda/3fHG2DL8FLmS7Fuj6cYIjgbDmOpWpdrUjN32+2gRS/5EgXhrgerAXtox0vMsOHTMc3i8GQ20eXmDJsCbleEYGiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB5455.namprd11.prod.outlook.com (2603:10b6:5:39b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 05:12:08 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::82e:c2f3:6b0f:3586]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::82e:c2f3:6b0f:3586%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 05:12:08 +0000
Message-ID: <237a5223-ff08-4d9d-8ddd-b2f9cf71e350@intel.com>
Date: Tue, 26 Sep 2023 10:41:55 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230823085842.1440523-1-himal.prasad.ghimiray@intel.com>
 <20230823085842.1440523-4-himal.prasad.ghimiray@intel.com>
 <63c64b22-501c-d6e1-669e-b85822d88819@linux.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <63c64b22-501c-d6e1-669e-b85822d88819@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::15) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB5455:EE_
X-MS-Office365-Filtering-Correlation-Id: ce40de6e-5a3f-47f8-fbe4-08dbbe4f21dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jDTkRLQQ40RTIF90qMWCH3hm/A7KINTTswGkmdtpsZe/0K4FvlSpPzSYyWqaFCugzfwna6BkV03CikwDtGr1igIWlBz3A8pwz9EpIcDJqCHjyiRa+TstYd9q+mmCtYziox+p4NDRiLe9YKEUlbGlz8rUOSUaB8fOe5hpvorTOOJS1kkewjZGSKSHPQhuA8APHVSs2+4f4KV+DIh1ScTOCSp1Yu9PNbt42pfPRfMs4AQbghBpi4YMalx70X/arDZm8eD8PEmMekvhS3J/tFrllzScSdhG68dr3HCIq6VzZi/ihHJZalsF7Im/npaOG4KrEduvBq33uOrHeXuxTY8wy91wiNiRfEWMDDUhStjvhT4s/+SR7//lAwO1DcqnZH0tYpD8nT5WMrsPLy634/QyPPtiSdzUvfECXOwNyjjZT2E+eYUfWG7DpHGF4aTTcdvVaoGEWU8A398THAKun14CSD/HLDXr8Rn5oRKDcYbDz4/7oSuYWjhHZZ0kMMq821P70sMmoeOKRCcPhUuHUkZiLI1kI4Q74aXaopGU87s8HlODf2EbkxrU6Xyzlw+kOv87VzAjc1ICVS7Jv5m00B/SMyfERvRjWLdeX3uqLTYncdiy/XwrI+yCgTOGyk7p+uejIhxHW5ES+4N37ufGeqR8Ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(186009)(1800799009)(451199024)(53546011)(6486002)(6506007)(6666004)(478600001)(83380400001)(26005)(2616005)(6512007)(30864003)(2906002)(41300700001)(66946007)(316002)(66556008)(5660300002)(66476007)(4326008)(8936002)(8676002)(54906003)(36756003)(86362001)(38100700002)(31696002)(82960400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WENia0xsODkzMzhKTElCc1VxRVhNMjdYQnptZlRVQmxMQyt1L3I2YVI5R2pr?=
 =?utf-8?B?bjZlUXF3N2p3UXNoQUZTbEY1OVJIQnJPNE1BbEVwVTF0OTJHSWxINVVabnpK?=
 =?utf-8?B?enh2aVZZV0l6Z3ppQnJnMmUyNTZUSnM5WlJYZStxOXJSa1BTVHFGSmJGaDZi?=
 =?utf-8?B?QkREU3ZrQ0xzMUJLREJidWlxd1BRWTNNZDJrRUdsSndNcXdLbk5SUnF1NUly?=
 =?utf-8?B?L2pmc2g5SHJUcEVEWVNBS2YxTFM3L1M5ekJCeHNWR1Nyb0MrSGJwOGRJZnFR?=
 =?utf-8?B?YW9Zdk83V1g1QnEzWXFhRTEzeEYyZUlkT2Rxdm40T3NHVDNDYkcyWUgvSmdo?=
 =?utf-8?B?R0NqUUxKU0RrVnhKQkZ5RVRJR0lQaVFXTGJsZXVFYVJZMUljMzF3Z04wS0gr?=
 =?utf-8?B?aGdDb0tKSWw4TGpQUXNNUHgxb25IVVV4RElyWU1MTGJYWWZTdlVUM0VjSjFO?=
 =?utf-8?B?cFF4SjVEbU5zbGxhdDFqZXNXREtKS3hKNnh3dlBJV3VUT0ZLSTFWWFdrV1Jr?=
 =?utf-8?B?NFRFUVJab3Y2ai9RdDM0NUFkdzVTekFsQUxrZitBVjVMQzlPSlVZa1Bwbm9n?=
 =?utf-8?B?SzJuMUVLbHFlNnRwMWNyMWJPRlhLcHBDS1ZvOS8xZmRXYW5UUHRQMG5OKzdm?=
 =?utf-8?B?dENhOUtwRm1zT1JRY20zSE1EMmdQdXNEaDJCTTIwUm9Bb0R5MEp2UDdJSVlY?=
 =?utf-8?B?dTQxeGN2RytZYWFSaGd4VDIzMnpCSzFNVTBSTlFCRHFqbTBPakowZ0srckJM?=
 =?utf-8?B?UFZ2NWVVSEJRcG5GbmJYeVFCc3U2Z3c5cm9Ybno4VkxsbGhEcUxFMnVPUlJX?=
 =?utf-8?B?bHQ0bXNqRzhPOHBUbm5yYWFrOTB3UU5wM25acTFwNk91eVpPbE5SZlU5Nmk1?=
 =?utf-8?B?SFlZL0JEQWZXR1BtSTB0MFVyTjZFdm1IQjRNYjRDdGZWelRwb21xWjRCeTRI?=
 =?utf-8?B?ZXRRcVJaOENEZmJCdWRvbERXQVU2S0RGUk5wRGR6N2NmZkw2MDE0Zzh2b29l?=
 =?utf-8?B?WE9DZ0l0Q2hId2lMUTRqd0xlZ2xqbmdIWUMxMlQwNEZtNGRCd1AyVm8rODNn?=
 =?utf-8?B?VC9lVkVwTGt2OVlSd1dZYUlsazI5R205bE0rRHlDRGs3T1RFV21jUVQrYXpC?=
 =?utf-8?B?bXVmR21qeUZtWnBPcEJHSnZ2Nm1NQVBnT1FBc01ETENpSVdyMW12akFHaFZS?=
 =?utf-8?B?eElqRmxyUzNwR3RSRFgyRDZWWThDZ2k4dUU1U05ZV2xXcGZ4OUJvK1lHRnVB?=
 =?utf-8?B?akFwQm5UZXUrT2dMckRHZ3FkOGI0NEJ6dDhPVkcycEMva2l5Z3NVbTFXbnpP?=
 =?utf-8?B?R1Z0eWZYdTJLUCttek9mcnU1clE5ZStSVFlSSDVvMjdkRDFuWEl2eHB0aCtq?=
 =?utf-8?B?Skl2WUxCaGVBQWpMdU05SXp0SVhBczFrMnRnZUVnVlY3L2FqcEtKYllhN2d6?=
 =?utf-8?B?R095Mi9EUHBTdndZdHFoRE5vS2piTDRkaDMrekluM3dabjFMdVBjeGRCd3E4?=
 =?utf-8?B?RHEzOUhMUE9pbVFiVXJDeG9tY1dHOEl5cGN4MUJHc3N5ZCtVaStmdUxyNjlw?=
 =?utf-8?B?Z3lXT2hHQzVNKzR0YnYrYWx6Z2tpRjBkbnNRU2NDTExJMFlvSVh3aW5yRmZu?=
 =?utf-8?B?ZU9IRFQ3Y0FPWW90TWRzNDlmUkVJaDVtWm1LdUFBdm9oRzRzWUkzS2x0Yzh4?=
 =?utf-8?B?aVYyS0R4YzFLT3VOR3IySld4L0M1SHJqeW9YME9EcUVVS3dLNjBXY0hwSjM5?=
 =?utf-8?B?aWRDSWhIRml3TVFwZ0tGaFUzTWFhWTB6em0rWFVHUVhmZUh3ZGdKcDdPUWVk?=
 =?utf-8?B?Q0ZDbU1uUnJFMzdRM0dmcWJ0WC9yRDhteTg0STVOVEJmcDdBQWI3MWdjdm1E?=
 =?utf-8?B?K0NSaTZhenlEZk5YdjBoQmRpZ0hOb01ZeXpKcG1jcE1QaHVjSDlSRWN2cW5t?=
 =?utf-8?B?b3MvL3Y3N2FHcGt5MjJ3SlVOZysxdGJFVWwwMEZBdlNadWxUaG5TcGJqekYy?=
 =?utf-8?B?Q21xcEJRQ2xNbHRPQVB4dFFRQVAxcmpiQm8vNi9jYTk1OVp6MVp0YWJ3T0tq?=
 =?utf-8?B?ZUF3eWlEcjNVNENzQzd0WVRONUNoQ3B4Z1pzdEh1TFRSRG84Z1EzUkFsRUtJ?=
 =?utf-8?B?cTJvSFNCRU1TYm1FZVMrNFFaalNnZ2Qyc2VhL3JMMDZrczZuR1EydE83bWhm?=
 =?utf-8?Q?YjCSYIOSlCjgh9aqHsvwMEI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce40de6e-5a3f-47f8-fbe4-08dbbe4f21dc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 05:12:08.6142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJ09N0Y6k1b7phIyqcnWrl12WWqG3IfBSnacY1jCa2lN3ok1ZsCXEh1YMa04gCt9ixaibEn1wjnDfIcTjtnfRQR1Ed9DYKQMjwCau8rTU3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5455
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 3/4] drm/xe: Support GT hardware error
 reporting for PVC.
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 26-09-2023 09:51, Aravind Iddamsetty wrote:
> On 23/08/23 14:28, Himal Prasad Ghimiray wrote:
>> PVC supports GT error reporting via vector registers alongwith
>> error status register. Add support to report these errors and
>> update respective counters.
>> Incase of Subslice error reported by vector register, process the
>> error status register for applicable bits.
>>
>> Bspec: 54179, 54177, 53088, 53089
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_error_regs.h |  16 +++
>>   drivers/gpu/drm/xe/xe_hw_error.c           | 122 ++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_hw_error.h           |  20 ++++
>>   3 files changed, 154 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
>> index 6180704a6149..39ea87914465 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_error_regs.h
>> @@ -10,4 +10,20 @@
>>   #define ERR_STAT_GT_REG(x)              XE_REG(_PICK_EVEN((x), \
>>   						_ERR_STAT_GT_COR, \
>>   						_ERR_STAT_GT_NONFATAL))
>> +
>> +#define _ERR_STAT_GT_COR_VCTR_0         0x1002a0
>> +#define _ERR_STAT_GT_COR_VCTR_1         0x1002a4
>> +#define ERR_STAT_GT_COR_VCTR_REG(x)     XE_REG(_PICK_EVEN((x), \
>> +						_ERR_STAT_GT_COR_VCTR_0, \
>> +						_ERR_STAT_GT_COR_VCTR_1))
>> +
>> +#define _ERR_STAT_GT_FATAL_VCTR_0       0x100260
>> +#define _ERR_STAT_GT_FATAL_VCTR_1       0x100264
> the registers shall be defined in the ascending order of their addresses.
sure.
>> +#define ERR_STAT_GT_FATAL_VCTR_REG(x)   XE_REG(_PICK_EVEN((x), \
>> +						_ERR_STAT_GT_FATAL_VCTR_0, \
>> +						_ERR_STAT_GT_FATAL_VCTR_1))
>> +
>> +#define ERR_STAT_GT_VCTR_REG(hw_err, x) (hw_err == HARDWARE_ERROR_CORRECTABLE ? \
>> +						ERR_STAT_GT_COR_VCTR_REG(x) : \
>> +						ERR_STAT_GT_FATAL_VCTR_REG(x))
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 10aad0c396fb..deb020a509d2 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -148,6 +148,41 @@ static const struct err_msg_cntr_pair err_stat_gt_correctable_reg[] = {
>>   	[16 ... 31] = {"Undefined",             XE_GT_HW_ERR_UNKNOWN_CORR},
>>   };
>>   
>> +static const struct err_msg_cntr_pair pvc_err_stat_gt_fatal_reg[] = {
>> +	[0 ... 2]   =  {"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
>> +	[3]         =  {"FPU",			XE_GT_HW_ERR_FPU_FATAL},
>> +	[4 ... 5]   =  {"Undefined",            XE_GT_HW_ERR_UNKNOWN_FATAL},
>> +	[6]         =  {"GUC SRAM",		XE_GT_HW_ERR_GUC_FATAL},
>> +	[7 ... 12]  =  {"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
>> +	[13]        =  {"SLM",			XE_GT_HW_ERR_SLM_FATAL},
>> +	[14]        =  {"Undefined",		XE_GT_HW_ERR_UNKNOWN_FATAL},
>> +	[15]        =  {"EU GRF",		XE_GT_HW_ERR_EU_GRF_FATAL},
>> +	[16 ... 31] =  {"Undefined",            XE_GT_HW_ERR_UNKNOWN_FATAL},
>> +};
> let all fatal definitions be moved into the patch in which fatal is processed
Squashing patch 4 with pacth 1.
>> +
>> +static const struct err_msg_cntr_pair pvc_err_stat_gt_correctable_reg[] = {
>> +	[0]         = {"Undefined",             XE_GT_HW_ERR_UNKNOWN_CORR},
>> +	[1]         = {"SINGLE BIT GUC SRAM",	XE_GT_HW_ERR_GUC_CORR},
>> +	[2 ... 12]  = {"Undefined",		XE_GT_HW_ERR_UNKNOWN_CORR},
>> +	[13]        = {"SINGLE BIT SLM",	XE_GT_HW_ERR_SLM_CORR},
>> +	[14]        = {"SINGLE BIT EU IC",	XE_GT_HW_ERR_EU_IC_CORR},
>> +	[15]        = {"SINGLE BIT EU GRF",	XE_GT_HW_ERR_EU_GRF_CORR},
>> +	[16 ... 31] = {"Undefined",             XE_GT_HW_ERR_UNKNOWN_CORR},
>> +};
>> +
>> +static const struct err_msg_cntr_pair err_stat_gt_fatal_vectr_reg[] = {
>> +	[0 ... 1]         = {"SUBSLICE",	XE_GT_HW_ERR_SUBSLICE_FATAL},
>> +	[2 ... 3]         = {"L3BANK",		XE_GT_HW_ERR_L3BANK_FATAL},
>> +	[4 ... 5]         = {"Undefined",	XE_GT_HW_ERR_UNKNOWN_FATAL},
>> +	[6]               = {"TLB",		XE_GT_HW_ERR_TLB_FATAL},
>> +	[7]               = {"L3 FABRIC",	XE_GT_HW_ERR_L3_FABRIC_FATAL},
>> +};
>> +
>> +static const struct err_msg_cntr_pair err_stat_gt_correctable_vectr_reg[] = {
>> +	[0 ... 1]         = {"SUBSLICE",	XE_GT_HW_ERR_SUBSLICE_CORR},
>> +	[2 ... 3]         = {"L3BANK",		XE_GT_HW_ERR_L3BANK_CORR},
>> +};
>> +
>>   void xe_assign_hw_err_regs(struct xe_device *xe)
>>   {
>>   	const struct err_msg_cntr_pair **dev_err_stat = xe->hw_err_regs.dev_err_stat;
>> @@ -164,6 +199,8 @@ void xe_assign_hw_err_regs(struct xe_device *xe)
>>   		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = pvc_err_stat_correctable_reg;
>>   		dev_err_stat[HARDWARE_ERROR_NONFATAL] = pvc_err_stat_nonfatal_reg;
>>   		dev_err_stat[HARDWARE_ERROR_FATAL] = pvc_err_stat_fatal_reg;
>> +		err_stat_gt[HARDWARE_ERROR_CORRECTABLE] = pvc_err_stat_gt_correctable_reg;
>> +		err_stat_gt[HARDWARE_ERROR_FATAL] = pvc_err_stat_gt_fatal_reg;
>>   	} else {
>>   		/* For other platforms report only GT errors */
>>   		dev_err_stat[HARDWARE_ERROR_CORRECTABLE] = dev_err_stat_correctable_reg;
>> @@ -176,7 +213,7 @@ void xe_assign_hw_err_regs(struct xe_device *xe)
>>   }
>>   
>>   static void
>> -xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
>> +xe_gt_hw_error_status_reg_handler(struct xe_gt *gt, const enum hardware_error hw_err)
> is xe_gt_hw_error_log_status_reg sounding better ? and have this in the earlier patch
Ok
>>   {
>>   	const char *hw_err_str = hardware_error_type_to_str(hw_err);
>>   	const struct err_msg_cntr_pair *errstat;
>> @@ -186,9 +223,6 @@ xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
>>   	u32 indx;
>>   	u32 errbit;
>>   
>> -	if (gt_to_xe(gt)->info.platform == XE_PVC)
>> -		return;
>> -
>>   	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
>>   	err_regs = &gt_to_xe(gt)->hw_err_regs;
>>   	errsrc = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err));
>> @@ -230,6 +264,86 @@ xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
>>   clear_reg: xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err), errsrc);
>>   }
>>   
>> +static void
>> +xe_gt_hw_error_vectr_reg_handler(struct xe_gt *gt, const enum hardware_error hw_err)
> similarly, xe_gt_hw_error_log_vector_reg
ok
>> +{
>> +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
>> +	const struct err_msg_cntr_pair *errvctr;
>> +	const char *errmsg;
>> +	bool errstat_read;
>> +	u32 num_vctr_reg;
>> +	u32 indx;
>> +	u32 vctr;
>> +	u32 i;
>> +
>> +	switch (hw_err) {
>> +	case HARDWARE_ERROR_FATAL:
>> +		num_vctr_reg = ERR_STAT_GT_FATAL_VCTR_LEN;
>> +		errvctr = err_stat_gt_fatal_vectr_reg;
> why don't we define registers once like it's done  in  xe_assign_hw_err_regs.
>> +		break;
>> +	case HARDWARE_ERROR_NONFATAL:
>> +		/*  The GT Non Fatal Error Status Register has only reserved bits
>> +		 *  Nothing to service.
>> +		 */
>> +		drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "GT%d detected %s error\n",
>> +				    gt->info.id, hw_err_str);
>> +		return;
>> +	case HARDWARE_ERROR_CORRECTABLE:
>> +		num_vctr_reg = ERR_STAT_GT_COR_VCTR_LEN;
>> +		errvctr = err_stat_gt_correctable_vectr_reg;
>> +		break;
>> +	default:
>> +		return;
>> +	}
>> +
>> +	errstat_read = false;
>> +
>> +	for (i = 0 ; i < num_vctr_reg; i++) {
>> +		vctr = xe_mmio_read32(gt, ERR_STAT_GT_VCTR_REG(hw_err, i));
>> +		if (!vctr)
>> +			continue;
>> +
>> +		errmsg = errvctr[i].errmsg;
>> +		indx = errvctr[i].cntr_indx;
>> +
>> +		if (hw_err == HARDWARE_ERROR_FATAL)
>> +			drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR
>> +					    "GT%d detected %s %s error. ERR_VECT_GT_%s[%d]:0x%08x\n",
>> +					    gt->info.id, errmsg, hw_err_str, hw_err_str, i, vctr);
>> +		else
>> +			drm_warn(&gt_to_xe(gt)->drm, HW_ERR
>> +				 "GT%d detected %s %s error. ERR_VECT_GT_%s[%d]:0x%08x\n",
>> +				 gt->info.id, errmsg, hw_err_str, hw_err_str, i, vctr);
>> +
>> +		if (i < ERR_STAT_GT_VCTR4)
>> +			gt->errors.count[indx] += hweight32(vctr);
>> +
>> +		if (i == ERR_STAT_GT_VCTR6)
>> +			gt->errors.count[indx] += hweight16(vctr);
>> +
>> +		if (i == ERR_STAT_GT_VCTR7)
>> +			gt->errors.count[indx] += hweight8(vctr);
>> +
>> +		if (i < ERR_STAT_GT_VCTR2 && !errstat_read) {
>> +			xe_gt_hw_error_status_reg_handler(gt, hw_err);
>> +			errstat_read = true;
> what is the need of errstat_read, isn't i < ERR_STAT_GT_VCTR2 sufficient
In case we see errors from both vect0 and vect1. We shouldn't be 
servicing error status register twice.
>
> and also instead of if check for every i we can have switch case
>
> switch (i) {
>
> case ERR_STAT_GT_VCTR0:
> case ERR_STAT_GT_VCTR1:
> case ERR_STAT_GT_VCTR2:
> case ERR_STAT_GT_VCTR3:
>
>     gt->errors.count[indx] += hweight32(vctr);
>
>      if ( i < ERR_STAT_GT_VCTR2)
>
>          xe_gt_hw_error_status_reg_handler(gt, hw_err);
>
>      break;
>
> case ERR_STAT_GT_VCTR6:
> case ERR_STAT_GT_VCTR7:
>
>      gt->errors.count[indx] += (i == ERR_STAT_GT_VCTR6) ? hweight16(vctr) : hweight8(vctr);
>      break;
>
> default:
Looks clean. Will use this.
>
> }
>
>> +		}
>> +
>> +		xe_mmio_write32(gt, ERR_STAT_GT_VCTR_REG(hw_err, i), vctr);
>> +	}
>> +}
>> +
>> +static void
>> +xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
>> +{
>> +	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
>> +
>> +	if (gt_to_xe(gt)->info.platform == XE_PVC)
>> +		xe_gt_hw_error_vectr_reg_handler(gt, hw_err);
>> +	else
>> +		xe_gt_hw_error_status_reg_handler(gt, hw_err);
>> +}
>> +
>>   static void
>>   xe_hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
>> index 82c947247c27..3fcbbcc338fe 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
>> @@ -51,8 +51,21 @@ enum xe_tile_hw_errors {
>>   	XE_TILE_HW_ERROR_MAX,
>>   };
>>   
>> +enum gt_vctr_registers {
>> +	ERR_STAT_GT_VCTR0 = 0,
>> +	ERR_STAT_GT_VCTR1,
>> +	ERR_STAT_GT_VCTR2,
>> +	ERR_STAT_GT_VCTR3,
>> +	ERR_STAT_GT_VCTR4,
>> +	ERR_STAT_GT_VCTR5,
>> +	ERR_STAT_GT_VCTR6,
>> +	ERR_STAT_GT_VCTR7,
>> +};
>> +
>>   /* Count of GT Correctable and FATAL HW ERRORS */
>>   enum xe_gt_hw_errors {
>> +	XE_GT_HW_ERR_SUBSLICE_CORR,
>> +	XE_GT_HW_ERR_L3BANK_CORR,
>>   	XE_GT_HW_ERR_L3_SNG_CORR,
>>   	XE_GT_HW_ERR_GUC_CORR,
>>   	XE_GT_HW_ERR_SAMPLER_CORR,
>> @@ -60,6 +73,8 @@ enum xe_gt_hw_errors {
>>   	XE_GT_HW_ERR_EU_IC_CORR,
>>   	XE_GT_HW_ERR_EU_GRF_CORR,
>>   	XE_GT_HW_ERR_UNKNOWN_CORR,
>> +	XE_GT_HW_ERR_SUBSLICE_FATAL,
>> +	XE_GT_HW_ERR_L3BANK_FATAL,
>>   	XE_GT_HW_ERR_ARR_BIST_FATAL,
>>   	XE_GT_HW_ERR_FPU_FATAL,
>>   	XE_GT_HW_ERR_L3_DOUB_FATAL,
>> @@ -71,10 +86,15 @@ enum xe_gt_hw_errors {
>>   	XE_GT_HW_ERR_SLM_FATAL,
>>   	XE_GT_HW_ERR_EU_IC_FATAL,
>>   	XE_GT_HW_ERR_EU_GRF_FATAL,
>> +	XE_GT_HW_ERR_TLB_FATAL,
>> +	XE_GT_HW_ERR_L3_FABRIC_FATAL,
>>   	XE_GT_HW_ERR_UNKNOWN_FATAL,
>>   	XE_GT_HW_ERROR_MAX,
>>   };
>>   
>> +#define ERR_STAT_GT_COR_VCTR_LEN (4)
>> +#define ERR_STAT_GT_FATAL_VCTR_LEN (8)
>> +
>>   struct err_msg_cntr_pair {
>>   	const char *errmsg;
>>   	const u32 cntr_indx;
> Thanks,
> Aravind.
