Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27447CD37BE
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 05:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF42710E972;
	Tue, 12 May 2026 05:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D8Ll9mrL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3435F10E961
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 05:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778562307; x=1810098307;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8mb+/Dw1NLUYApTJPeu5L0SFd3jatZPvjfJeDscQmAs=;
 b=D8Ll9mrLJs0ce1mkGAtnU7cYqlwKnpLIPLEK9/+dRttAbVZIyJrXTzkR
 sJrC9UmkfH2CKSfryc6I0z0YMqPuKI3TJlR//IRLsme8JQ51x1aE+5bqT
 gLHMxUYh5/N7N+onXOcNs5hU4rrYVkpHQzo6hrS6EkU0Qa03S3LRFUq/S
 3rvRNkEGl7HVd2FMQferlZfqyIVMw45MhxBiqvhVYSDVvmsXcoWR5aGIh
 /ryvK0cdV+GGImqtn4aINjT2DjAc6vS+gMBYfb09iowrKEy6gTqjGIWvP
 o/i4XE3KLM9W9BVzOfrACvqjInLJZsXBAOGtr2/lJXj47X06s2dpP60+w Q==;
X-CSE-ConnectionGUID: hkaNY8pAQ3yVXduSo98A9Q==
X-CSE-MsgGUID: Cjc2sHK+RY6pj8C7kX8rZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78493638"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="78493638"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 22:05:07 -0700
X-CSE-ConnectionGUID: 3zLztVEUREGqAG/imfpc6g==
X-CSE-MsgGUID: ulq1D9C1RVqVHbJEt78neg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="268013943"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 22:05:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 22:05:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 22:05:06 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 22:05:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtZ3EH7k8xyf78q0gEYd57mIe1IwY+ndA4bBfl9aTS+Smg30lBeruyA1jv2khbRIjm+Ty1vP5dW66GgsJ7aLV+i6oxjKBX2/gLFMhb2HQjf4Sh/bZdk3M8F4NQJu6mPh3uZhdi303u2bzhnPQXzyMezeQ3XljxYoV9hrg2cHvS5OLdO7RSamWdlxNl1ZS3BiEiAXuJGKMys/tb3GDMXATvghaEfjjylKftR1cWtVCyuHJEL1bKuF1nNsQceuHbjYoI0wDK3tIt8DHApIyp9CxOAkQHYwd73lWmsuw8fAqjyeJ+A0/HHDMZsjgHO9JEwycqlr4eK3TYDf/7itgJYpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iopuMJdm2fV/JK4I9/uArv0r8UbRF+q1zhhDyR65k4M=;
 b=hIpJKjdnCWs/5Gpy7frjj8wCy7+soIg2i4kpwLdKFtm8q50imk4KstGmDG7M5O5fqRi7Wi3RsZvkUvSLSh8avHBQCufkVkFnJGp+q8jx+e7BDKT9gT2tbqxMVZ+BXiOcDI+JAYaMsftm7SuKOGdfHV4lTaPOsViE5+qM/kRrSI0tgAyLVLSKiA/Q49m0NTj+NFTaPubr6VY6nZ6Nkw7Ue6yVyCKlZPJJyY+gfK7GyCk+16R5yXbMgj2oKW+PSmVxwognqTNqpWFIX1KX6euI3acAa1biI4PZML0r1Go4WLnDQA0+OAbpu0w4cJIHU0yTAbH1LeYBok+0CLVc6tFxeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB7676.namprd11.prod.outlook.com (2603:10b6:610:127::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.23; Tue, 12 May 2026 05:05:03 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 05:05:03 +0000
Message-ID: <d318ba84-db58-43f4-bb65-03d1ace29030@intel.com>
Date: Tue, 12 May 2026 10:34:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] drm/xe/xe_ras: Move xe drm_ras registration
To: Raag Jadav <raag.jadav@intel.com>, <michal.wajdeczko@intel.com>, "Anoop
 Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>, "Umesh Nerlige
 Ramappa" <umesh.nerlige.ramappa@intel.com>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
 <20260504065614.3832331-13-riana.tauro@intel.com>
 <691a88c5-49eb-4b9c-96c7-8054b3224632@intel.com>
 <afjH2EZD9-kIH2Va@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <afjH2EZD9-kIH2Va@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0339.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: b0177476-80b0-4c06-d757-08deafe40689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: 8P9x2Mo0np5KKoNNmKg50JcM5TuMpD4EfWBYEPoiPYxaEW/cYNb0LQS6GdXGxBKU+rOxg3Q3sjcrW2ROmGqvgTCOdv14wUzXD0OYnEhw2lqsEYH96kmQGVNpXYBLk3b1ap7x7a4fhv78CsuuJUUwsn/W3J423Lwdx+xGHQUo/+IOGM6ANYem2RoPoTOJRtCUJ2UYk8rjqbCMRFRrYYid+MKesFUXzXFtcB6SEOYM2Ccl9pZjPkFYfwyBtW1Y7xw/gMGH3Fd9F/kvs1ahfDNSgavkc8crCtOQSgjMU+uS9jdRZK5mIkonLKfd7GGN+gDirFR71rzxVU1+qpS44hqUKTYtNAwPgmPLrLvkWJS2ud3zbW4xA/IhNMJ1UPrkEsCDd2ONX4VuMj/4qnf31waKDVbMNln8Y39L2COTO8lW4iYpkqWeeBqTcu2WhaGCJTn0s5cWMPVm4wkLjsOwbrGHYjOB+5kKrOAENIwDJ7g+bdZyeecmKEEzWPpb9+MSffYzGa2VTBvWP2ycSvT4sypgirYvNmriZTqaXQi+la3z7sWFwwbCcILIT6H54pMSwiVmu0QFfGj4Q4ud8NRbOVflO6ob+sq8CN2AuDgSR4DLblQG6U/lttpZZ7wthcYObnhf4J9eYpOwqex1ISslonF5clDdiLtPiN7ehT2mSYCC8cg4QG8jUHDm4R52+/91VWlJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(11063799003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVkyOHMzZVo0V0FLZmpzcEtnZ0ZKdkdMRWxlSFNLcHBmbmNKS3MvTHFEYlRH?=
 =?utf-8?B?b2JRWjljWmgzUEJGcmlBTXRHa0IzZ3AxNUdYdjJxZDB0WFF1NDc4OFZabURV?=
 =?utf-8?B?Y1dUb1dmbmdOdkhOTk93cDRuc25aSHNRMnY5U3A4eksxYXp6RmhZWHM2aFdl?=
 =?utf-8?B?dmt3MGVLRFl2VUxkZzMwZm13a284K1lRdkgrZ3I3SE9LUkNmVEJCdzd5d3N5?=
 =?utf-8?B?R3FidmtscE5ML2VNbmtyOU5tM1pkSmgrWFZOcE5ORkptTVlRTWZpN2p4Z3li?=
 =?utf-8?B?b0ZYRERTNmpIREsxTmJUeWxMZWtSK0hnd2V5SHJUd05hSGZ5Tlk0bzlWSUgv?=
 =?utf-8?B?M3k1T0VvWXdVT3l3dkJndmI3bGZ0NTJzMlJMNnpDYjJtZzcyZDFjWktkbzhV?=
 =?utf-8?B?L09UeVlhQ2NpUVdnR1dXemUwZVY0R1RnWUg3eEFMM05pbVpMUFBTMmtWZzJ1?=
 =?utf-8?B?WWI0ZnZMc3o5a3dPSGRYTHVhUHdIMTdCR3VDRTJ2V2tKanRjNHFYRzB6aUZu?=
 =?utf-8?B?YUFmZmRWaFRsck5tTmRlT3JKd1IxMlhzMmd0WjFIdnlnbEkvVlFHNTVoZFQy?=
 =?utf-8?B?K2FVVFNKZkgrOWNmVWlKNVRLUWhJN1NHZWQvU3hmdXRKd0tiQmlBMHIyRTl1?=
 =?utf-8?B?ZVZXdzRDZ1RWaCt0UWlYcGV5WFJETEVPMUpCSGh0VG1jdTNNQzJCeC83ZGJ3?=
 =?utf-8?B?S2tGa2V5d3ZHY2lxNnpjK096TkZHaVh6bkkzOVR4SkZ3ZkpRVkVCdG1Ea0xx?=
 =?utf-8?B?QUNsODI1NWR1Tm94dGNRd0V5Y1NFY205bURud242ZGczMTg3aEdpSHNQay9u?=
 =?utf-8?B?RTh6cnk4d3FzQXJKQjFOTEljbXNXZUhWRVFHR1lsTk9jUjZvcWcvb0lhd1NL?=
 =?utf-8?B?R25pVnlGWGlIL2JNc1pjVWFjckFBWUU5ZmhhOUtRcFZLWXpINVpndmdmbGVx?=
 =?utf-8?B?eDZkN2tGNCtsMFZscU8xUmY2aG9YeEkyK08xR2lkTjR2ZjZvZWZaTldrWVZB?=
 =?utf-8?B?dEpydk1aczJmY0ZJcXB0c24xN3pySHlKVGgvZ2hiT0Z0dVZUUEdxREFUaFZp?=
 =?utf-8?B?WFp6Vk5XSTdjTnB3K1UzNXpzRDJpdzdKSEpQVlNJUXdqcWdvSlhFVDY2bjlt?=
 =?utf-8?B?ZzJZeXVIaWpmNEw2SWJkODFURzhSUFJPU043OWdPSFNHd2F2SHd0TS9Fa28r?=
 =?utf-8?B?NnJzeTJaelFkZVBaYVRvNUgwOW92SjVaVGI2bXRuSzI4SlRoYjlpa3RQZ2xx?=
 =?utf-8?B?ekdxa1VIcFJmQXFoWWordndSei83anl1cTB0MG1Jc3RYbjBWWFM3WVpOYXRT?=
 =?utf-8?B?TlpSMTRyWmFjek8vdFhYN1ZldkhIOTBaMGVwWEpBc1B6L08wQTQ2TEhCdVYz?=
 =?utf-8?B?em52dDBxTFhDV0YzSHNyTDZiNTJFZmhRUWQweDBqN0R6RFNBWDhTTGhmTTNF?=
 =?utf-8?B?dG13Q3lsU2p2dS9xM3hnL3Y3ZzZ0MzdjemFvQ08wb3diS3gxZzdvSzdZVklO?=
 =?utf-8?B?SWlSdXNVNm9OQ05pRGZvWlFHNFRVWUUwSi9qYjEvUUhaNFZDMlgzeVJCVkwz?=
 =?utf-8?B?alhyaXBkbnRMeldjTEhDQlVsY2h5bmkwYkl1Tk9Sd3AvQ0Y1ZzZLMVJPZUJZ?=
 =?utf-8?B?cHRhcnhGQmJ3MUkwdm9YY3g5VENSZjFsdU9Ua1hlZWFiZWt5QUlMYTMzTnEw?=
 =?utf-8?B?RnlOelJtSTZzN1pJOHZsamhGVXovSExsMk5XZGZGWXE5MVdoNEZONVlJOCtx?=
 =?utf-8?B?bHVYNkRXZFNicEc0aDhPNU0zUHBCV2N5YjlYY01LWjg1M1A5dWpCK1Bqemth?=
 =?utf-8?B?ZnpyWDdGcCtzNTBlclZuL0l3ZXRxWmN0T2tNNC9VcGR0YjVIaGtZeWFJNGho?=
 =?utf-8?B?bkYyNjd5ZXdHZ3lFT1o0bGRuTVhvdytvYVRrd0hZN0pSd3p3aFF0OGRVRTM3?=
 =?utf-8?B?dEFMQUJxNDdMK1RQRUtQaytQVXZINHVZK1lZZU04ellqTXIxbFJLc1hUc0RX?=
 =?utf-8?B?SjUvendjRitnNld5UTFtRU1yclUrTHMrV2ZZeEpsUXNxcjhoYzVEVmJQNFhS?=
 =?utf-8?B?dlJuZUl4N0dyQVphZlFlenNjVzkwTnNlOSs0Ky81MlBnNTNvdUI4WHA1U1g5?=
 =?utf-8?B?aTlMVjRkN2k2NmFXTmVMZTViay9yWEZOdkFlZ1lpMzBJczBNcWNNaENxQlVs?=
 =?utf-8?B?dVAxcHc3UjJ4TmxKeEp1QnhlWktTaFNWMnFGSFVnaUoxd0NTeVBLQi9pV3Uy?=
 =?utf-8?B?cHZNdklYejgyeWNVNm5yYWNiQVM4cTZNcVF1d3QzdDBwZUoza0FocjZMak9y?=
 =?utf-8?B?cHJlNGxSL0xzWlNnUTV6eDNUT1B3YjQvRXZXL2dBRWNCSGpxMko4Zz09?=
X-Exchange-RoutingPolicyChecked: Ximv/bRqypVxytGfekzKVR3/thMFV0GAHyMuMie8HL8LB0qOtvjLd7WkWOholXUiyXM9m/IVHxE/mmhINuA6hSpI7aPPWUzvFbAhaNWa3rxu+V4VX7fgahNRXC5oUoqn4pEInnWKs4E4lQPrRDzXWbMUOozg62rFo7XgDdmJh1KFoKqgA2WPLvLpV7QxHFwqCEiCXqNSfu21QfTkjTfvTCDb+nhxnnWoTMNtlXIyqqIdyZ/cZZf1BLA9M3AnzR6qaQy/gC6wRJCIHASATkoqw3bT9CRbaDShwy7qOHG5121XIMmEeCCKM4v/vhDgEuwIXtIoOJcpYUcQ+DVr2+amzQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b0177476-80b0-4c06-d757-08deafe40689
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 05:05:03.4542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tK8vvbX/OLylWYB+aWM3xSiHXEbcCccX/UjZ/guJB4mbI83iAA2KhHgzjw0q9zKfjrJK2BHoEx35K8ESTS3VLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7676
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


On 5/4/2026 9:52 PM, Raag Jadav wrote:
> + Michal
>
> On Mon, May 04, 2026 at 04:23:14PM +0530, Tauro, Riana wrote:
>> On 5/4/2026 12:26 PM, Riana Tauro wrote:
>>> Move xe drm_ras registration to RAS initialization flow and keep
>>> hardware error initialization for processing errors reported
>>> via irq.
> ...
>
>>> +void xe_ras_init(struct xe_device *xe)
>>> +{
>>> +	int ret;
>>> +
>> Needs an SRIOV_VF check here. Will add it in next rev
> Rather, reuse vf_update_device_info() (which I think also should've been
> done for other sysctrl flags).

sysctrl might have other functionality which might be applicable for VF.
@Anoop Will sysctrl be used for any functionality in VF? Are we okay to
disable sysctrl flag for vf?

Thanks
Riana

> Raag
>
>>> +	if (xe->info.platform != XE_PVC)
>>> +		return;
>>> +
>>> +	ret = xe_drm_ras_init(xe);
>>> +	if (ret)
>>> +		drm_err(&xe->drm, "Failed to initialize xe_drm_ras %d\n", ret);
>>> +}
