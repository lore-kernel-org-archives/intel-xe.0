Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE73BC46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jan 2024 11:19:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8CF10E168;
	Tue,  2 Jan 2024 11:19:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4F310E168
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jan 2024 11:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704194351; x=1735730351;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=td0F66jNK4NXQa7TNxel2lMsQJ8IfvlH0gM6QHIhqzs=;
 b=lp+EQnMuuPzjB39VWeEjsMi3SIcgZ2jPDVEJndE5UEyAH6xLS5hSZm06
 AaDxPN09TwwJIVtyj6MzAuX/SAyr4ObTo0k29vZkI6D/5zX0050Rsa3qM
 OwuJ1hOT9wr5nD1hHfB7pTlGEZEL7duG52Ki7n6+Z7IOp/R5TSjxL18E8
 4drePWXzN6nCuj9qzif+CDdLgnwOhw/Od6Sl+JcJeVSTzBRGzRCt7VlPV
 VF0qw20WK/UfmkktDkPBUamijRdWgTnOmChUufGr20/qlWcipZ063R/fu
 VsRODc3dvY+K5nwKv5d/F/GgRecMfw/A233nyjm0IW8TOaMWu9YRrFeIS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="3680981"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; 
   d="scan'208";a="3680981"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 03:19:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="1026749554"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600"; d="scan'208";a="1026749554"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2024 03:19:11 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 03:19:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 03:19:10 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Jan 2024 03:19:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eP8htCMHOMyj19J+TJCOdOFq+H37LmXItYH6mI//R4FsWiLC8pis+jBDhzMQG/2DMlTNXS2hwMDWJhastZZXobNrq4/nMOqqoz9F4CwJmVYNs0wsbHuLhHNm70poGhV61CmEpTWpd0MESAjzrjQItF/wagih8bNhJc1GNNoy0ykrdg3rzhkCL3Q2a4lMNZB8usRgdwjAocgNtuDdpDsEBFeT/L8GYas8bA5dl0TK+h9+fp/W3XgLstOYVX9CUIUxU3KhpBV9CFBkuqwY68Ecka6DPN/uePfhIt5wkUI/nGacFV7QFfW9Gp5XkAxHK0PaIYRARhP8SG4n3W2eCJG99w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckA/E41hS8Ad+j/0gbljjMUOqee0wfq8iCtj5+Yt45Q=;
 b=cPMoZyYH1sdzerVcveqpuuptbrgWxuY/6DZidnET1ckHgXgjkg+7eYiq2q9wHEH/xPEnd3xCGifpzdu+wqpcaV0B30Qf4QPvT7aWuVsQoMJxPvDSOvafMJd8b1Odgead/j4wKF106U5Erka9yVrTTv/w+AKQJGp2geMxHrn3z50uLFaz35UW4eo5rGrHZRJloAB3Ssc0U2ATaFcYZeR+d813aGQG0mcUVf/hH3pYY9CFogk9Th3rdccJwVuZivKen/2jfwWD/zb6tAsmbtIaLT9ezuUJktr2s4EvIkAmYjZe63D9um/N5h4OYRqoJkD7UNjPAbVV7lDL7yoS32Ks3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 MN0PR11MB6112.namprd11.prod.outlook.com (2603:10b6:208:3cc::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7135.25; Tue, 2 Jan 2024 11:19:02 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7159.013; Tue, 2 Jan 2024
 11:19:02 +0000
Message-ID: <da936f57-818f-4dd7-b264-e4968b7cdde8@intel.com>
Date: Tue, 2 Jan 2024 16:48:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v7] drm/xe: Add vram frequency sysfs attributes
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20240102052748.1598057-1-sujaritha.sundaresan@intel.com>
 <CY5PR11MB62112ED786C7B196DCF70BF79561A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <c1086ea1-eeda-434e-8627-b28103eaa3be@intel.com>
 <9fc522b9-4dc3-4fca-868e-bade09eb9df9@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <9fc522b9-4dc3-4fca-868e-bade09eb9df9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0240.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::17) To SJ0PR11MB5664.namprd11.prod.outlook.com
 (2603:10b6:a03:37f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|MN0PR11MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: 99beabc9-00ec-4c03-6cb6-08dc0b849f3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fBYa4ANYGjVjIOh7KWUsSj0sztV+XQPStkGoClcLoRAqWKqfBhduwFVYlEvNcTRACzqZfvXuhEapkigQ024HnuBn6mX/t7BDuMG5ONKp+x1WJXcgyoPmceE47Inzz8TShol9q1WglCGWIxM1AB6BTOSXk1rMLne1NwKMKJBqDHgAaSusIWXXJmjzYlsavHwjck0mqcYW0uiqU0V+vKC0xWY6C6lq89weB5jMJjuPjut2T46hPsO06rTYU+WeCoUta6G899gnbHaQ5HVW7feWLeZaQfaGD2S17+bS7r0Go+DUaPVhGY7iJRST1ujBKeYUfL15Acv8E+ssLLEAyqbhAs6ZrPiRqmQLeXkGUL8s3wXLbjDOzrbTM0MbrXBbDh1g13NS7ad91f06Djo43McgpurfKwVqgZdLB9JsU6X9cVkcRJGEcHpPmLpGSkI1O2H/MMkSgIPY3YBPN5TEUmz1Meez790PfJAn/nCiKNeZ0jMtL8itIWuyFDbWyF+3Al0Lvf94PXyX9MYW7zZJh7c5MC2IAGic57eJ+72pzPUU0S0BlzN8mOHQQSpcMkCu8mg0Tw5XAVjD6Oc1VZIVjAxNeQQfK7Rc2Wrb6mQ6sLOojBUPh3kiEXkeBQFmxLN1Fv/ThIRj5WU2zmOBm0YbMTR16Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(346002)(376002)(136003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(31686004)(41300700001)(2906002)(5660300002)(8676002)(316002)(110136005)(66946007)(66556008)(66476007)(82960400001)(478600001)(31696002)(38100700002)(6486002)(86362001)(6666004)(6506007)(53546011)(83380400001)(8936002)(36756003)(2616005)(6512007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVZINzZQeTFDZk1kR1B6THJqRStTc1o1a3dHTkRZRmQzdnd5MUNCdUNoZWhP?=
 =?utf-8?B?ajhkTE5zdU40anZVMjRZZDlHay9IVjg4RHhBclBSVlZ5Z202T050Y0FNUFp5?=
 =?utf-8?B?Y1U0dmtzVW1IWEx1bFUvTDUxTkxZZVpRT3VZUWw4M2UxeG5oWnp2MEMzMjdl?=
 =?utf-8?B?RDFnbUsrL3FEOElhL29sUzd0Q0lFZkN5UWtFMjd1RGlUSm1MRnFmOHU3MUJM?=
 =?utf-8?B?UUxSMjVCaXd1YXphN2FURzJkMEpDQ0d5MjEwZEdxbDBqSzJwWU9ISFZEOXFF?=
 =?utf-8?B?OHduaFFoRngzL1FDY0o5R0QzNVN2RzNLLzM0RHN5RGNjbWxYNWthV3FTUExr?=
 =?utf-8?B?Q2ljdGRRN0d6QmZNcVBTVkVmekxHTVNLdytBd2paN1NaN3MxWXVlcGdpeWdW?=
 =?utf-8?B?RnJRVTFseHlxSTZyRmdydFU3ekJLVHRSY2J2dXpvZGNJdGdOV2QyRmFKWVpn?=
 =?utf-8?B?TG5CMzlLN0taUVYyNlpJQno3MzEzS0VqQk9ZeWxiaWI2eUFENFN1Z0FnWGZQ?=
 =?utf-8?B?VW1rSkdWYlljNXlqWGJYMlpQTFZLWmpqRXBKOHRWOTkycXRaN1hyS1JkekZh?=
 =?utf-8?B?a093K2RsUThRNURtYTBsbXU4bExReXlEdTZDOWxyNVhRdHJlSXFWWnNGTDRR?=
 =?utf-8?B?QnFHS2lsUjIrMmluclBoNlRMa09CbVUzcnp5NzhYcHc0cFFHSTlDMFJsenBP?=
 =?utf-8?B?Z3JLVXhjdTlEMGVNaVI0UU9vbWRrVzQ4TkhaVGt6VGtYMG0yVHRHRnFHOWxH?=
 =?utf-8?B?MzVrWkxGejhUdG53c011Y1hsL2tjUWR3OXVrSE9nQW9jTkMvdUZkVW9yd1cw?=
 =?utf-8?B?L2REc3BKOUlveVJ1a2lOVGR0cTdzQXF2eVpZcmxwbUdzYVUvQ0tsRTVqRDEw?=
 =?utf-8?B?c1I2K0JIblVDUElsU3B4Y1hYUFRrYlZsOExUUFZTRGd0bEJRS1RVbm9CbFda?=
 =?utf-8?B?WVptcUloRXgwUDVHcDA1WWtYb0hZbHF3dTJZdkZMd1FaS09EVW5nZzRIWXBw?=
 =?utf-8?B?czREekNyUVpkc0p6RjRkL0FIYksyOFlZaGtEN2lpVC9Rb09DelVWMDVwZHRG?=
 =?utf-8?B?TjhNaUQrbHE0QWY5UWpvUEFYYUJIQ0p2eUd3QW1OYkl5TU9QdWg5VUl1dGVs?=
 =?utf-8?B?Wk5ZeW5acDJjbXZkVTF1bWFWdTBabzBDVGM3T1pyNEZPNzRINUM3MFFUU3d5?=
 =?utf-8?B?S3FUa3I4azJSbkpXTGtkUUxGaTdQT1RMM3duaEd6ZmNyYnp0cFR0Nzg3a3hX?=
 =?utf-8?B?d0h0RG1KOEFSQlBqVFBLMkc4MUZQUEhsNkRiVTgzZEtIWndGKy9UT2RvS3Jn?=
 =?utf-8?B?UkhtTE0wY1hhcjNNV1dPTTRhekNoZHNsUUovQUoxS1ZIbEs5R1kxMkVTeFhG?=
 =?utf-8?B?emZxZyt4RloyL0c4RXBLUW1MNUtRR2FZbkFpUllRbUF3VGNIVDJiaUFiakFm?=
 =?utf-8?B?SVVPckNDRkhBWW9SYTlJYTZETDFySUoyS0dWeUJEWFc0Z3dpanhLR2RsUDdJ?=
 =?utf-8?B?cHN0TEhwT0VJUllWcFlEL3Q0bGxhNVA0dUJHa0JmbmpOem43UDZLclZJMzFT?=
 =?utf-8?B?TlNkMnJKc2tzbGpvdCszQ24zUllqbENRZUZURGFyWjVIYTNzQS91Z29wdXRC?=
 =?utf-8?B?MVAwa1o1dlZTSHNSQllQbHFISmhJSnNmT0pySzhodzNyVEtPYk0raHE0bUpt?=
 =?utf-8?B?S09tUDR0clIvZHFQOVVPbGdsekdld2JQZmZCTTBHMzJ3RTFjdkZ5QUdDTzg2?=
 =?utf-8?B?S0p3ZmFPWkM1bnhBUWREK0JCL2dEWVFYeFFuSVVCZVdlZ2hnUmhzR01hTFZX?=
 =?utf-8?B?U3RNTGFVSENWcWNzT3ZxeXJHRktNSTg2bWthR2xGMVFlaHQ2K2RQajFDM1dC?=
 =?utf-8?B?dGI5bmUzMFZhaFZmV2M3VHVqUkl4QThDTWZScXExSzh1RUdROEsvRXJCVS9j?=
 =?utf-8?B?QzVlODd0bGJ6QUkza3pyUUQ5QUhBN1FQNTROQzNCT0FJb0V6Qm9HSTU0VE9o?=
 =?utf-8?B?enMxK0hjSUlJbjJaT2xRelNaQ3RWZ0hFYlk0WDNVSXFjY2loZlNvTHMxRHRE?=
 =?utf-8?B?VFRObGI4MFgzTjd5MG1Nc0tpbG9qdy9OYjFUYlljV29UZ3VRMm9HNTRwYWU4?=
 =?utf-8?B?SzRkSHJxei9oSzVqejJQbmppTjFIYjJqNU1CbXJNK2xFMXNYWnhqeGJsWGFW?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99beabc9-00ec-4c03-6cb6-08dc0b849f3f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5664.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 11:19:02.6170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 68lE4hHl1+DfoZ53FZMa2kcHJdnKe/DqY47LUrDnTlzHa+COZen1aegrTQB2B4tdNguwEg20chXqzXpOxvtgfIeOul1eY7rI5+uWnnIQwXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6112
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 1/2/2024 4:19 PM, Riana Tauro wrote:
>
> Hi Suja
>
> On 1/2/2024 3:48 PM, Sundaresan, Sujaritha wrote:
>>
>> On 1/2/2024 3:39 PM, Gupta, Anshuman wrote:
>>>
>>>> -----Original Message-----
>>>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>>> Sent: Tuesday, January 2, 2024 10:58 AM
>>>> To: intel-xe@lists.freedesktop.org
>>>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Sundaresan, Sujaritha
>>>> <sujaritha.sundaresan@intel.com>
>>>> Subject: [v7] drm/xe: Add vram frequency sysfs attributes
>>>>
>>>> Add vram frequency sysfs attributes under the below hierarchy;
>>>>
>>>> /device/tile#/memory/freq0
>>>>             |-max_freq
>>>>             |-min_freq
>>>>
>>>> v2: Drop "vram" from attribute names (Rodrigo)
>>>>
>>>> v3: Add documentation for new sysfs (Riana)
>>>>      Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
>>>>
>>>> v4: Create sysfs under tile#/freq0 after removal of
>>>>      physical_memsize attrbute
>>>>
>>>> v5: Revert back to creating sysfs under tile#/memory/freq0
>>>>      Remove definition of GT_FREQUENCY_MULTIPLIER (Rodrigo)
>>>>
>>>> v6: Rename attributes to max/min_freq (Anshuman)
>>>>      Fix review comments (Rodrigo)
>>>>
>>>> v7: Make docuemntation more verbose
> typo
>>>>      Move sysfs to separate file (Anshuman)
> Separate file will not be needed if drmm_add_action_or_reset is added
> similar to the file xe_hw_engine_class_sysfs.c
>>>>
>>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/Makefile        |   1 +
>>>>   drivers/gpu/drm/xe/xe_pcode_api.h  |   7 ++
>>>>   drivers/gpu/drm/xe/xe_tile_sysfs.c |   3 +
>>>>   drivers/gpu/drm/xe/xe_vram_freq.c  | 127
>>>> +++++++++++++++++++++++++++++ drivers/gpu/drm/xe/xe_vram_freq.h
>>>> |  16 ++++
>>>>   5 files changed, 154 insertions(+)
>>>>   create mode 100644 drivers/gpu/drm/xe/xe_vram_freq.c create mode
>>>> 100644 drivers/gpu/drm/xe/xe_vram_freq.h
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/Makefile 
>>>> b/drivers/gpu/drm/xe/Makefile index
>>>> df8601d6a59f..17884e422cec 100644
>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>> @@ -139,6 +139,7 @@ xe-y += xe_bb.o \
>>>>       xe_uc_debugfs.o \
>>>>       xe_uc_fw.o \
>>>>       xe_vm.o \
>>>> +    xe_vram_freq.o \
>>>>       xe_wait_user_fence.o \
>>>>       xe_wa.o \
>>>>       xe_wopcm.o
>>>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> index 5935cfe30204..f153ce96f69a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> @@ -42,6 +42,13 @@
>>>>   #define        POWER_SETUP_I1_SHIFT        6    /* 10.6 fixed
>>>> point format */
>>>>   #define        POWER_SETUP_I1_DATA_MASK
>>>>     REG_GENMASK(15, 0)
>>>>
>>>> +#define   PCODE_FREQUENCY_CONFIG        0x6e
>>>> +/* Frequency Config Sub Commands (param1) */
>>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0    0x0
>>>> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN    0x1
>>>> +/* Domain IDs (param2) */
>>>> +#define     PCODE_MBOX_DOMAIN_HBM        0x2
>>>> +
>>>>   struct pcode_err_decode {
>>>>       int errno;
>>>>       const char *str;
>>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>> index 0f8d3e7fce46..ed60d12f5cf0 100644
>>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>> @@ -9,6 +9,7 @@
>>>>
>>>>   #include "xe_tile.h"
>>>>   #include "xe_tile_sysfs.h"
>>>> +#include "xe_vram_freq.h"
>>>>
>>>>   static void xe_tile_sysfs_kobj_release(struct kobject *kobj)  { 
>>>> @@ -50,6 +51,8
>>>> @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>
>>>>       tile->sysfs = &kt->base;
>>>>
>>>> +    xe_vram_freq_init(tile);
>>>> +
>>>>       err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>>>>       if (err)
>>>>           drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed,
>>>> err: %d\n", diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c
>>>> b/drivers/gpu/drm/xe/xe_vram_freq.c
>>>> new file mode 100644
>>>> index 000000000000..166d41a6b222
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_vram_freq.c
>>>> @@ -0,0 +1,127 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation >>> + */
>>>> +#include <linux/sysfs.h>
>>>> +#include <drm/drm_managed.h>
>>>> +
>>>> +#include "xe_gt_types.h"
>>>> +#include "xe_pcode.h"
>>>> +#include "xe_pcode_api.h"
>>>> +#include "xe_tile.h"
>>>> +#include "xe_tile_sysfs.h"
> unnecessary header
>>>> +#include "xe_vram_freq.h"
>>>> +
>>>> +/**
>>>> + * DOC: Xe VRAM freq
>>>> + *
>>>> + * Provides sysfs entries for vram frequency in tile
>>>> + *
>>>> + * device/tile#/memory/freq0/max_freq - This is maximum frequency. 
>>>> This
>>>> value is read-only as it
>>>> + *                    is the fixed fuse point P0. It is not the
>>>> system
>>>> + *                    configuration.
>>>> + * device/tile#/memory/freq0/min_freq - This is minimum frequency. 
>>>> This
>>>> value is read-only as it
>>>> + *                    is the fixed fuse point PN. It is not the
>>>> system
>>>> + *                    configuration.
>>>> + */
>>>> +
>>>> +static struct xe_tile *dev_to_tile(struct device *dev) {
>>>> +    return kobj_to_tile(dev->kobj.parent); }
>>>> +
>>>> +static ssize_t max_freq_show(struct device *dev, struct 
>>>> device_attribute
>>>> *attr,
>>>> +                 char *buf)
>>>> +{
>>>> +    struct xe_tile *tile = dev_to_tile(dev);
>>>> +    struct xe_gt *gt = tile->primary_gt;
>>>> +    u32 val, mbox;
>>>> +    int err;
>>>> +
>>>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
>>>> PCODE_FREQUENCY_CONFIG)
>>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1,
>>>> PCODE_MBOX_FC_SC_READ_FUSED_P0)
>>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2,
>>>> PCODE_MBOX_DOMAIN_HBM);
>>>> +
>>>> +    err = xe_pcode_read(gt, mbox, &val, NULL);
>>>> +    if (err)
>>>> +        return err;
>>>> +
>>>> +    /* data_out - Fused P0 for domain ID in units of 50 MHz */
>>>> +    val *= 50;
>>>> +
>>>> +    return sysfs_emit(buf, "%u\n", val);
>>>> +}
>>>> +static DEVICE_ATTR_RO(max_freq);
>>>> +
>>>> +static ssize_t min_freq_show(struct device *dev, struct 
>>>> device_attribute *attr,
>>>> +                 char *buf)
>>>> +{
>>>> +    struct xe_tile *tile = dev_to_tile(dev);
>>>> +    struct xe_gt *gt = tile->primary_gt;
>>>> +    u32 val, mbox;
>>>> +    int err;
>>>> +
>>>> +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND,
>>>> PCODE_FREQUENCY_CONFIG)
>>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM1,
>>>> PCODE_MBOX_FC_SC_READ_FUSED_PN)
>>>> +        | REG_FIELD_PREP(PCODE_MB_PARAM2,
>>>> PCODE_MBOX_DOMAIN_HBM);
>>>> +
>>>> +    err = xe_pcode_read(gt, mbox, &val, NULL);
>>>> +    if (err)
>>>> +        return err;
>>>> +
>>>> +    /* data_out - Fused Pn for domain ID in units of 50 MHz */
>>>> +    val *= 50;
>>>> +
>>>> +    return sysfs_emit(buf, "%u\n", val);
>>>> +}
>>>> +static DEVICE_ATTR_RO(min_freq);
>>>> +
>>>> +static struct attribute *freq_attrs[] = {
>>>> +    &dev_attr_max_freq.attr,
>>>> +    &dev_attr_min_freq.attr,
>>>> +    NULL
>>>> +};
>>>> +
>>>> +static const struct attribute_group freq_group_attrs = {
>>>> +    .name = "freq0",
>>>> +    .attrs = freq_attrs,
>>>> +};
>>>> +
>>>> +static void vram_freq_fini(struct drm_device *drm, void *arg) {
>>>> +    struct kobject *kobj = arg;
>>>> +
>>>> +    sysfs_remove_group(kobj, &freq_group_attrs);
>>>> +    kobject_put(kobj);
>>>> +}
>>>> +
>>>> +void xe_vram_freq_init(struct xe_tile *tile) {
>>> Please provide a kernel function doc for this exported function.
>>>> +    struct xe_device *xe = tile_to_xe(tile);
>>>> +    struct kobject *kobj;
>>>> +    int err;
>>>> +
>>>> +    if (xe->info.platform == XE_PVC) {
>>> Drop these platform checks(including below ones) , instead use a 
>>> early return at starts of this function.
>>> If (xe->info.platform != XE_PVC)
>>>     Return.
>>> With all of above comment.
>>> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>>
>> Will make the changes. Thanks for the r-b.
>>
>> Regards,
>>
>> Suja
>>
>>>> +        kobj = kobject_create_and_add("memory", tile->sysfs);
>>>> +        if (!kobj)
>>>> +            drm_warn(&xe->drm, "failed to add memory
>>>> directory, err: %d\n", -ENOMEM);
>>>> +    }
>>>> +
>>>> +    if (kobj && xe->info.platform == XE_PVC) {
>>>> +        err = sysfs_create_group(kobj, &freq_group_attrs);
>>>> +        if (err) {
> Need kobject_put here?
> If there is failure in creating freq attrs, memory dir will be empty.
> Should be removed.
Sure, can't hurt to have extra cleanup.
>>>> +            drm_warn(&xe->drm, "failed to register vram freq
>>>> sysfs, err: %d\n", err);
>>>> +            return;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    if (xe->info.platform == XE_PVC) {
>>>> +        err = drmm_add_action_or_reset(&xe->drm, vram_freq_fini,
>>>> kobj);
>>>> +        if (err)
>>>> +            drm_warn(&xe->drm, "%s:
>>>> drmm_add_action_or_reset failed, err: %d\n",
>>>> +                 __func__, err);
>>>> +    }
>>>> +
>>>> +}
>>>> +
>>>> +
>>>> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.h
>>>> b/drivers/gpu/drm/xe/xe_vram_freq.h
>>>> new file mode 100644
>>>> index 000000000000..94b04178a798
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_vram_freq.h
>>>> @@ -0,0 +1,16 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation
> 2024
>>>> + */
>>>> +
>>>> +#ifndef _XE_VRAM_FREQ_H_
>>>> +#define _XE_VRAM_FREQ_H_
>>>> +
>>>> +#include <drm/drm_managed.h>
>>>> +
>>>> +#include "xe_device.h"
>>>> +#include "xe_tile_sysfs.h"
> unnecessary headers. Use forward declaration of tile
>
> Thanks
> Riana

Sure will fix above comments, before merge.

Thanks,

Suja

>>>> +
>>>> +void xe_vram_freq_init(struct xe_tile *tile);
>>>> +
>>>> +#endif /* _XE_VRAM_FREQ_H_ */
>>>> -- 
>>>> 2.25.1
