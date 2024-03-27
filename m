Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B949AC47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 17:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CA810FEDF;
	Wed, 27 Mar 2024 17:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kCYkYAfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7611310FEE1
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 17:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711561610; x=1743097610;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0EhE/dg6OFtdiw0wDU0iBGrEnKgpL5RCjU1EfI/Cokw=;
 b=kCYkYAflKlfi7f/0uUdaRuB31mjXHi1Swy9PSt/CNxGcwCS5Me0JdUeT
 je24KW4gJQFNmpXlrPXrwIHPKHmwOuVSL5UV5a0Y/JEHhICQolpo7upFw
 TaERZK1uD5ky+ap/xuFykAMGPFoEk7p27P/rDlVQ4yEmtGDhRdV4BYwLA
 INReA8Zw4Ln7Ft5qohnkH+SugkBvH4GDU0MeCrNO6nfa4sc/4+YRp6+w6
 Rhs/jU4VIp5l2hBnRqhk6PQNy9pEnasAsv/76PQLRTP4iD9nGd4Ml01Lf
 Jc8KdCNuDAWhmTddnrqdWJxAyidtKOOz+NIpRCrcJHIkWefB8l/6eSGW6 w==;
X-CSE-ConnectionGUID: lfBg5OeJQSCqFI3q5cqlTA==
X-CSE-MsgGUID: K0F/Vdy7R2u6E+hgmNcITA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="29162921"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="29162921"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 10:46:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="16400999"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 10:46:49 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 10:46:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 10:46:49 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 10:46:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3MBGwojPeJnYWjxOBzu5YFRpvKq3ILbznXXhQHstCu11t0I6T1mVJxRZ10HWJ+jNb1xSY20S+n02BFH1UPDnvk4yZzVvzVarKmNOxoUoH+4AcoUKYGEzbonNbD4vZ9r+QmnbKlweXWPYINAQfoL+CDRPDkZ6+MRm5n83JhRTU6e6yZTIXYbzEBezpxtwuRv3vuP9bmDGgyYZOmr45dt6xCYLoJiM5DEObxDSDH0wtjia+eHQVYvnHUW5zod07QTt3qDR3XXhIuXDPTcT/pA2SCnhmZwstwhrh8Vs7YBsoGeaUXclNqNzk8IKw9nmHU6te0sC12jP7L8IHmg/mbZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9kDd+RcW4I250gGZ4O3qtg8KXqXouWSfGa8QQOuU7Q=;
 b=irsbDlsZBv6HfsI0okYDck0ywwZywF01yb6+TWchXYAKEd5nDFtZJxHYqUIgTrdHth4AUUfXAfwc3kzWNKAKOXSUZo+CgpkEwKK7cqmOo3MokhUqeLaKSuhhBsOjR7OEP/9rfsp5mbHphQYtDqQbBRuIT9JjYmSqKXnglMDZQjvobgj/30OXCdXHiybhJ/ijh5Psb79kfZggD8pRyAG9Pc3bPA0Vwksmkq1i+7VSSGrsgJI3owc6wlhCR21c01FKqL8ihQyOevl7MqkfRC63zgIkVH7NuXx7i/HELjWzDLhD/wWsY4L/wjIHyaqVpwrJNQMjDnYAbJQrpGKha1TdaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH7PR11MB5768.namprd11.prod.outlook.com (2603:10b6:510:131::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 27 Mar
 2024 17:46:46 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::8778:d67d:55f9:f68a]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::8778:d67d:55f9:f68a%7]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 17:46:46 +0000
Message-ID: <2d4f8f53-e918-412f-a01b-da770546df80@intel.com>
Date: Wed, 27 Mar 2024 13:46:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/8] drm/xe/guc: Add GuC based register capture for
 error capture
Content-Language: en-US
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
References: <20240319143621.371087-1-zhanjun.dong@intel.com>
 <c8d124823fe7da90916042fcd09edd6e550bd5bd.camel@intel.com>
 <545e620aef74383ae1137dd4dc3cf98020d60968.camel@intel.com>
 <ec7b3393368e3371228256785e9edcb0016425ab.camel@intel.com>
 <1226b37a-b163-4b03-97b7-863dc258dca4@intel.com>
 <91ee9ae7-105f-4cfd-8e80-4a3caac15fbd@intel.com>
 <beb3b7e6a062008afda7007ca40606f848a626e5.camel@intel.com>
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <beb3b7e6a062008afda7007ca40606f848a626e5.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0063.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::40) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH7PR11MB5768:EE_
X-MS-Office365-Filtering-Correlation-Id: 051ed700-723b-4bf5-18bd-08dc4e85df52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nHd86IF11JWErRu484ijkhudZpHUs567y7mjLi9/FvICUh9NlAMCZiv84Z/zslyNEyu0y+FMQxLuwH6eJr/9Fn9KZHtd83FsOHVcA0oNjADeIvFgfja8YL5HP2otT0oofeKJsNZoHlsZbx+L2VqWreSRzmRh4yOQXo4hOWGfpDZQX/xBgGyWMf+rTkU76lxEWbVw2xonCmcZ0gy6TD+UVzfhkjDecsHAJU7DVLEUtOox3u1vLjyk+2OjVaoNBZHgAVlw3+RXTxYuw4qlyMdWrcJuROlCQ51jHNz8zh+opp1Eol5Vha6bh+pSOX9qdGkbtsyycmo3K0aW5CkH6EZF2hnnI3I8G3b773jgQMoZNHfeD1oghW8P27/f1QP4fmIfxPt2dqygjRWUa+dhzSv+kpl0y5q9GCFJ9S+DB4XYVszoH2GVsPkgnPV5il9c8eel9Wl5q05SQ/xJZah3+YltpiJFyicty9r4pnYa2ZYs0rh7oAqgxmTc/4ZLdBpD8ZIvHJY9u5Gq+IfX+f0qFoditwkAcTVNzzVWDGp5ZyHt+DkUspUSUvSOb7XHnEShs+YuMEdzVSeyolN2kuUrpZMAfS05nd1YRwwYuxwn4k1WzsTRinHPeXzbRBCJ3a9HXAj60k0sWgDk1nutFT73YBY+b+dyrHy7I1yzVU8l9S3fJYo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGRZVlRnRHNJam1ydHpDR2xtcCtZblF4b08wa3FSNnkyTWhndmhrMlU3Mm53?=
 =?utf-8?B?TzY2M1VXOUF2N0VtWFV6RytuSWtFc1hFWXZ1S05iNWFGb0FVbUN3M3dsRDZJ?=
 =?utf-8?B?L2UrWlhXNWVqaGR6UFhBQUdBZlVTUUY3eEFNdGI1TzY4b1ZycEMwckVibk8r?=
 =?utf-8?B?RE1URDVNVDZQby9xR1R3SnQ3V3Q5L1RHQUVoOSt1MmZ1eVlST2txQ1ZnTUx4?=
 =?utf-8?B?bVlOL1MySzN0MzhnZ2FQamNocEN5UysxQ1pvd1RxYVY3dmFlMzMzTlE4NDFj?=
 =?utf-8?B?eWJ2NjZjMEhnaGdrekVGVHB2b0pwakxsTUpoUjZubXBEdGlhUmhXMHZlay9n?=
 =?utf-8?B?VWVMd2dWSFFYU2paVmtVYVZlTG15ZFk5MHdSVlhxa0JLZFVRdGF0OHhLZ0lL?=
 =?utf-8?B?WkxrWkpMcENPUlRRU0tjQVpBZkptUGowMjNqaE1kWkpSTHBjUkNZczRGT2oy?=
 =?utf-8?B?WEQyRGlhdTdyUUZxVTZqKysvSURNWXJuK1BXa09jODRlZUxXUVBsbFFOa1Nq?=
 =?utf-8?B?MkZpOFYvSXJKcWVad1FKelJZNWJoNXpERkt5SU05WjRxSW1sY3kvUlFBMk5D?=
 =?utf-8?B?b0RrdUdnQm5MdlZSc2Q2NndoblNBZlRLT0pveFppZTR1ZEh2Mzhha2RWQ1ha?=
 =?utf-8?B?MnJkK0p1Q05vM2I1Mm4rOCtDQ1lvR0lQeThQN0I5WVBhMXdRTi9mREZJcXE3?=
 =?utf-8?B?cjZIQk8zNWRlbm9VT1N1M09VTmt1ME81Nldhc0E5WHZTRkY1Tmp3TEl0Z2xh?=
 =?utf-8?B?bFFRbXpvWm9id2ExdmJUcitlSDROZGRZNEFzbnJUUTd3WG5lV0RISy94Q2Jz?=
 =?utf-8?B?bEk0Q0tQYjN1SXNUZkk3WWlMWUZwVXlBWWllZllKRm9KTkRKRnF0TDdPRXFB?=
 =?utf-8?B?b2VLVXF6TWxQbG16aEdVUERiUGhMaUpXMVM0TnhVdVdNNy94T1dMUWg3ZkZW?=
 =?utf-8?B?Z0x2NjdvOVBHSXdtejlsR3hQM0Y5NGlRTk91dFYyM0FqMkx1ZnBXa0lNMGpF?=
 =?utf-8?B?NFJZejNnOG5RK2ZMMzRQN1JpYUpFbDg1MGJ0bG1RZ3Z2MXc1ckloV204eEM5?=
 =?utf-8?B?OFZheHk3U1doa0M1YWlxeEV0Y0o2RitWaHdlNTZYTXplYkZQd2dqU0ZrRHZx?=
 =?utf-8?B?ZjRwc1RwSW51dWpoZnFRUE9TSm9ET3Z1S29IT0R5Q3lXVmRHUXRGRDBQSWdh?=
 =?utf-8?B?RzNIMEtlWHU1ZWpSYlRaUjNxN2xiRW9MOWxDcEh0bzJYNDF0WVU2akNIWEFr?=
 =?utf-8?B?Y01xWmxwTXBJVGpwaEFlcFVnaENBcTFicXBuYlB3N2x2YllkMXRjUU1XbHBu?=
 =?utf-8?B?UFFGZWlid0lBRFFHOXVXeTFySWppZEtuaFZNSm5hVzVIOTJqOVRuUDFWblJm?=
 =?utf-8?B?VUp2YU9WeXNCdEM5NUFxdlpHNHJNaFdISU96S1A0TFFCTE8zdWFXUGttSHdq?=
 =?utf-8?B?OTNLeTF1dkpxYlRaZ3JaSkFrRmZVZXRsckdValZmUXkxUE0vZGl6ekw3U1dq?=
 =?utf-8?B?RnFFVzRWZzNVR2hDL0dJaFA3OXFWaWI2SFhObWtNby9FenZqK0R5QXRvZUYz?=
 =?utf-8?B?UVY5ZFFGUUVHa2E1L25HT3VnZnV5L2YwbW8ybUFpTkpKa1VqQ2VZMUdwZm1V?=
 =?utf-8?B?cytINjhUNUlYUzhPVm5pbGNaZlpYNk44VUdVUGxEYXZ3Q1QyT0Qzc0Q5eEd1?=
 =?utf-8?B?V05UZ1dodTRlWm1wWXd6MTZNbTdwUHFPblY5eFhwNDBMUGMyYVgrRG5nZUJT?=
 =?utf-8?B?N0hURWhiMGxmblBJaGllYWEySFFzcURlQmJDa01iUkNxWW54QlJ1cTJMRHBJ?=
 =?utf-8?B?TU9EcXdyWGdkclA4anVqR2YyajlGMlV1UkdDNkFjWEQ3MElmdXFabUJqQTNZ?=
 =?utf-8?B?aCtWREdyempXbnBFVVBHeTFwOUlpKzZjRmZNQ2dkeGYvWkFLa09EY01uNGRa?=
 =?utf-8?B?UzE4MVFrZ1VFcmtEV0J5VVI0NFNMT2RzZTJMckUrbTNQYndMRlVVZWRwVWtL?=
 =?utf-8?B?M0JDclNVQTliZFRES25qN3c1NEtUQVp4YUt1MWVRSHJUMkpZbDkwV094ZFpQ?=
 =?utf-8?B?MmVCWWs5aFlYU1RDam9wR2Jic1NiVis4WWp6TGRsclZJNFlYVm9YbTBTR2Jy?=
 =?utf-8?Q?w9PaOGRLcUjlFRCPUp93+meBi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 051ed700-723b-4bf5-18bd-08dc4e85df52
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 17:46:46.5579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okxkkPdqzYMirvqOwOVWoCkuqdRsIyIT6azQZhdsqnRRh2EQXfkWQHkSgAxd+IxA555AxFu73lnHQi9MB4D6aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5768
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



On 2024-03-26 11:52 a.m., Souza, Jose wrote:
> On Tue, 2024-03-26 at 11:40 -0400, Dong, Zhanjun wrote:
>> See my comments inline below.
>>
>> Regards,
>> Zhanjun
>> On 2024-03-22 5:36 p.m., Dong, Zhanjun wrote:
>>> See my comments below.
>>>
>>> Regards,
>>> Zhanjun
>>>
>>> On 2024-03-22 5:28 p.m., Souza, Jose wrote:
>>>> On Fri, 2024-03-22 at 11:37 -0700, José Roberto de Souza wrote:
>>>>> On Fri, 2024-03-22 at 09:57 -0700, José Roberto de Souza wrote:
>>>>>> On Tue, 2024-03-19 at 07:36 -0700, Zhanjun Dong wrote:
>>>>>>> Port GuC based register capture for error capture from i915 to Xe.
>>>>>>>
>>>>>>> There are 3 parts inside:
>>>>>>> . Prepare for capture registers
>>>>>>>       There is a bo create at guc ads init time, that is very early
>>>>>>>       and engi  ne map is not ready, make it hard to calculate the
>>>>>>>       capture buffer size, new function created for worst case size
>>>>>>>       caluation. Other than that, this part basically follows the i915
>>>>>>>       design.
>>>>>>> . Process capture notification message
>>>>>>>       Basically follows i915 design
>>>>>>> . Sysfs command process.
>>>>>>>       Xe switched to devcoredump, adopted command line process with
>>>>>>>       captured node list.
>>>>>>
>>>>>> Just some notes after trying this to debug a issue with this series:
>>>>>>
>>>>>> - CONFIG_DRM_XE_CAPTURE_ERROR is not a good name for a config to
>>>>>> enable GuC based capture.
>>>>>>      - in my opinion this should not even exist, always capture with
>>>>>> GuC if xe_device_uc_enabled() is true.
>>
>> 3 reasons:
>> 1. This GuC based register error capture is for debug purpose, does it
>> still important for production stage? I want to leave it an option for
>> users who don't need it.
> 
> definitely needed in production
> 
>> 2. With this opiton disabled, extra memory could be saved. It might not
>> be a big deal for PC, while might be valuable for customers who want to
>> save few 10KBs to 100KB RAM usage.
> 
> not relevant amount, having a accurate register dump is more important as allow us to debug issues reproduced by costumers.
> 
>> 3. The feature with an opiton is what we have in i915, where the feature
>> is ported from. So make it the same style to avoid users migrated from
>> i915 complains about it.

Although I still think for users need it they can keep the config option 
enabled, but after review of i915 code, the kconfig option is not bring 
in by the feature. Thus no need to add the option here.
I will make another rev with this option removed.
>>
>>>>>>
>>>>>> - coredump don't have some registers like SAMPLER_INSTDONE,
>>>>>> ROW_INSTDONE, XEHPG_INSTDONE_GEOM_SVG...
>>>
>>> Yes, those steering register print out is missing.
>>>
>>>>>> Here the output in LNL:
>>>>>
>>>>> ah this could explain...
>>>>>
>>>>> [  152.189386] xe 0000:00:02.0:
>>>>> [drm:xe_hw_engine_snapshot_from_capture [xe]] GT0: GuC error capture
>>>>> is empty, take snapshot from engine.
>>>>> [  152.190215] xe 0000:00:02.0: [drm] Xe device coredump has been
>>>>> created
>>>>>
>>>>> but both code paths needs to dump the same registers
>>>
>>> I found you have another patch:
>>> drm/xe/devcoredump: Print errno if VM snapshot was not captured
>>> I will take a look.
>>>
>>>>
>>>> Hi Zhanjun
>>>>
>>>> Mesa team needs the INSTDONE registers to debug issues and I have
>>>> patches implementing the dump of this registers.
>>>> Do you mind if I send this patches the list?
>>>
>>> Sure, please send it.

Since you already send the INSTONE patch, my next revision will not 
conver this part and will get merged with your patch later.

>>>
>>>>
>>>> I guess this GuC based register capture will need another version and
>>>> someone with experience on GuC to review, so it will take a while...
>>>>
>>>>>
>>>>>>
>>>>>> **** HW Engines ****
>>>>>> rcs0 (physical), logical instance=0
>>>>>>      Forcewake: domain 0x2, ref 1
>>>>>>      HWSTAM: 0xffffffff
>>>>>>      RING_HWS_PGA: 0x01693000
>>>>>>      RING_START: 0x029d5000
>>>>>>      RING_HEAD: 0x00001914
>>>>>>      RING_TAIL: 0x00001968
>>>>>>      RING_CTL: 0x00003001
>>>>>>      RING_MI_MODE: 0x00001000
>>>>>>      RING_MODE: 0x00000008
>>>>>>      RING_IMR: 0x00000000
>>>>>>      RING_ESR: 0x00000000
>>>>>>      RING_EMR: 0xffffffff
>>>>>>      RING_EIR: 0x00000000
>>>>>>      IPEHR: 0x7a000004
>>>>>>      ACTHD: 0x0000effeffff9208
>>>>>>      RING_BBADDR: 0x0000effeffff9209
>>>>>>      RING_DMA_FADD: 0x00000000029d6968
>>>>>>      RING_EXECLIST_STATUS: 0x000000004000279c
>>>>>>      RING_EXECLIST_SQ_CONTENTS: 0x00000000029d9719
>>>>>>
>>>>>> - a lot of style issues, see 'CI.checkpatch'
>>
>> After review the CI.checkpatch output, all style issues reported is by
>> purpose.
>>
>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>>>>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>>>>>>
>>>>>>> Changes from prior revs:
>>>>>>>     v6:-  Change hardcoded register snapshot fill to follow mapping
>>>>>>> tables
>>>>>>>           When capture is empty, take snapshot from engine
>>>>>>>     v5:-  Split dss helper code out as an standalone patch
>>>>>>>           Remove old platform registers definition.
>>>>>>>           Split register map table to 32 and 64bit each
>>>>>>>     v4:-  Move register map table to xe_hw_engine.c
>>>>>>>     v3:-  Remove condition compilation in code
>>>>>>>     v2:-  Split into multiple chunks
>>>>>>>
>>>>>>> Zhanjun Dong (8):
>>>>>>>     drm/xe/guc: Add kconfig for GuC based register capture
>>>>>>>     drm/xe/guc: Update GuC ADS size for error capture
>>>>>>>     drm/xe/guc: Add XE_LP steered register lists
>>>>>>>     drm/xe/guc: Add capture size check in GuC log buffer
>>>>>>>     drm/xe/guc: Check sizing of guc_capture output
>>>>>>>     drm/xe/guc: Extract GuC error capture lists on G2H notification
>>>>>>>     drm/xe/guc: Pre-allocate output nodes for extraction
>>>>>>>     drm/xe/guc: Plumb GuC-capture into dev coredump
>>>>>>>
>>>>>>>    drivers/gpu/drm/xe/Kconfig               |   11 +
>>>>>>>    drivers/gpu/drm/xe/Makefile              |    1 +
>>>>>>>    drivers/gpu/drm/xe/abi/guc_actions_abi.h |    7 +
>>>>>>>    drivers/gpu/drm/xe/regs/xe_gt_regs.h     |    5 +
>>>>>>>    drivers/gpu/drm/xe/xe_gt_printk.h        |    3 +
>>>>>>>    drivers/gpu/drm/xe/xe_guc.c              |    6 +
>>>>>>>    drivers/gpu/drm/xe/xe_guc_ads.c          |  229 +++-
>>>>>>>    drivers/gpu/drm/xe/xe_guc_ads_types.h    |    2 +
>>>>>>>    drivers/gpu/drm/xe/xe_guc_capture.c      | 1332
>>>>>>> ++++++++++++++++++++++
>>>>>>>    drivers/gpu/drm/xe/xe_guc_capture.h      |   21 +
>>>>>>>    drivers/gpu/drm/xe/xe_guc_capture_fwif.h |  221 ++++
>>>>>>>    drivers/gpu/drm/xe/xe_guc_ct.c           |    2 +
>>>>>>>    drivers/gpu/drm/xe/xe_guc_fwif.h         |   68 ++
>>>>>>>    drivers/gpu/drm/xe/xe_guc_log.c          |  179 +++
>>>>>>>    drivers/gpu/drm/xe/xe_guc_log.h          |   15 +
>>>>>>>    drivers/gpu/drm/xe/xe_guc_log_types.h    |   26 +
>>>>>>>    drivers/gpu/drm/xe/xe_guc_submit.c       |   21 +-
>>>>>>>    drivers/gpu/drm/xe/xe_guc_submit.h       |    3 +
>>>>>>>    drivers/gpu/drm/xe/xe_guc_types.h        |    2 +
>>>>>>>    drivers/gpu/drm/xe/xe_hw_engine.c        |  261 ++++-
>>>>>>>    drivers/gpu/drm/xe/xe_hw_engine.h        |    4 +
>>>>>>>    drivers/gpu/drm/xe/xe_hw_engine_types.h  |  117 +-
>>>>>>>    22 files changed, 2421 insertions(+), 115 deletions(-)
>>>>>>>    create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
>>>>>>>    create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
>>>>>>>    create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_fwif.h
>>>>>>>
>>>>>>
>>>>>
>>>>
> 
