Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ABAE85388
	for <intel-xe@archiver.kernel.org>; Fri,  3 Apr 2026 17:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C72B10E55F;
	Fri,  3 Apr 2026 17:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DwcRQYZE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3987110E55F
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Apr 2026 17:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775237646; x=1806773646;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/ekdoBkQOj0NZj62pUHkuQzW0NeRAaSmBumFI5fwRMM=;
 b=DwcRQYZEf/Jf+JRkko9gyRYvv5rkDRsSHARTzPtonz2i3622TKuKrUcK
 CafZDC0OqLBdtBTxqVFaqUp7hI+cQdRtdQ0nRXiHn6GLi4FGjin1KSPMZ
 /3mXyNEmkF8qXzFjyI5OgVEnAo76n9aLSy8h0IquSk7ItnBqj54Ql0XJs
 JPMqbkWGkkt07KaRbAvhUq7F/ewtwl19rGqBMnW2ZWD0vzl9ds5w0FWGs
 TFBmH59T0iBsZXnOnL/h2p7DV0vCShnPLGpKWV7swU96TJaYnY7XWjrXq
 8AAqmalsEXhV+b3kOiF51r3OLan4b74C9vynqGuj5dMXk30+U8RkpS1Rq g==;
X-CSE-ConnectionGUID: 73+GOugORMmhbZZLw5oYzQ==
X-CSE-MsgGUID: N8xDbdCXQLq+bmXYRYhXDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="76320407"
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; d="scan'208";a="76320407"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 10:34:05 -0700
X-CSE-ConnectionGUID: 8hkonuJrQwKzeNwgYMjJbQ==
X-CSE-MsgGUID: jwsIzgVzRAScSyqm9+V3sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; d="scan'208";a="227246121"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 10:34:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 3 Apr 2026 10:34:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 3 Apr 2026 10:34:05 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 3 Apr 2026 10:34:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2BUTRxwbT0eij+whFrBMbvKRE6YOTZCfG73U0/eFFrCN/if2C98fzD/AmLAFpSufgXSmlY8/L36mOe+37+ZaHO7rUXsf9S2olnJB4GJepZmc3loBV4vlLCHwvimMMXOaiZsOwpSNRiDdwOyqJa4mOyGAy97KZJYViLqoxOO77RM//MNwU0mqnMkTDSvoVHri37M5eYJ38idC9MHBMjNUbGJqpa3VZx2blU6RoiM+hGvaXM8TMMqkg5/RkrMNFQn8ZmDLItebI8ofc0XWuq4WGqS0hQXS3lU8eNx+F9BjcRqA/5zPr+8oek8btaZSFRUdqVxKh65LmzanTPDtPqceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KM7ru1yUTV39VgbZOYfNutEok0fwmhD5rkWjnbLTUJY=;
 b=Y+gXqRdpo7z2IAmA5/sox5MD4pebG1RgIaRVUPTMHYCvV8och+sfwUpKi10rsx6mHr54h8tchE54EJdyFzD5U2eEsPpyC5wZgLVHb1bSF9Yh59Yv8N0VIwtYb+4U/D/Sp4dXPPxrzdKY0xfGuQWdjDmn21Eaj94eKeKcxengYryiJQmCwmiw/zB524N5cSCN7xyqMfAq9CIwGp2MICy4XO3PC2HnCstMjciT9w65DWx6IdA726RAFqzyAPDcR1dfN17zpXrsLCyGL+i4kuwuYgtGFhkNbQLtkCeFMWs8pCggBYjpINgisGHt611e3IK6oH+XkYH+x7V1uLg6sPUYHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by LV3PR11MB8768.namprd11.prod.outlook.com (2603:10b6:408:211::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 17:33:58 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 17:33:57 +0000
Message-ID: <c06619c4-59ea-4ed1-a76b-4d0a70fc8900@intel.com>
Date: Fri, 3 Apr 2026 10:33:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Suppress reset log for destroyed queues
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260402213029.3970116-2-daniele.ceraolospurio@intel.com>
 <ac7hhMY7sZWW3aT7@gsse-cloud1.jf.intel.com>
 <38565bd9-47e9-4727-aa00-f49962250fee@intel.com>
 <ac8NoEXghE1XbfbE@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <ac8NoEXghE1XbfbE@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:74::26) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|LV3PR11MB8768:EE_
X-MS-Office365-Filtering-Correlation-Id: b08bd1b4-6b41-4397-9251-08de91a72fa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: Tv/PvgDC3Gfk3szoSZT4AsDyT6sqT59/889pHlnoHPtPq4QANz1CaVUquIDEtCT8tQjvnVXNdHaDwVJ/a4T/Ddyn1XAbRqIZbykwUpIETxdR/xlDjLyCqd6Q7x7zD1HtKW2nyAWP/HfFYCTn1okAFzyb9eFrxtXCXnj8gdHGSTmq1c1TEXbYiwic1o8rWRZO9FRCXNzpBXZFkG7qH9zyRB0KfyBTg28evPgAuZQVCH7KCYUVj0fivJht/qDsVocgqAMZw31cdzVTqxdUv6XZ3L+D9Hw5BOqOmppm2zsV1JS3F4ps6Tq+keZMs1GDn7NYnlcWa7lX3qWri3y6DC2iFTAjcSQPHro2r0mnZ25LK1FuvW9eX2OU3FFTcD9GQ9lkjAihqJbKtrf6F3BOcxr1Ofo+D82Zu3wxyN5bW5hX7y6u5csNprvaxDOiiB6V/wrXXfcA74wChjY1zusLEkGQP/FGd9AeBL+GKE4oUioL13SKdez2+1Tp0avsrl3G2H3PcN5iXLPvwwkZcJxIuySffleMgLBPyVsRkCzhBgYjGfqUtjlp87HOMEfgRTX5oZ+bMsP/S2svpBMwCEBXuLD4DKdyCUCnfiuKFFIn5UMdmIWPWobda6AWlMUrjfJDuQ4+eoidvZg1OTfnZsLJZfzo2n37zlUjRhDO9wRuZSo9Dq2pL+BsieC/gJUPSxd0Tb+xDRAIjF8VN0H8vb3ta/fdCKWqJ6W2nInVeqepLyc8R30=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGtmeWhqYUhMMU9ibW0ydFNGRW9KYkVKVndVYWEwR0VQQ1dFaXY5K1UzMmVF?=
 =?utf-8?B?cGkrbEJZOXhSV29uRVU4b0NtS0dZMGUrQS93ZTNkaEFNQnA3clZza3orRmQw?=
 =?utf-8?B?Tk5TUElIVkRReitpTXBjcE9kVHo1b1ZnTzlIdUtTdW16aEVXQzZEbGlUcGEy?=
 =?utf-8?B?NTJYR0d6WW0xU0JmRVREcXYwcHpVaU0vZ2dnUGZyVjBOeGI4WjB4Nm9oR3h0?=
 =?utf-8?B?VjgwQzNhVnVhSGJOdE5QTnlEYXZ6aWNmamVIL0RTT0YwdkkzQlJ4OE1Dd0tW?=
 =?utf-8?B?WUswUW8vR3JPYmk5TXdGNEJwbHJ2OEx5WGNHMllQaWoyRU9NRiswN1pUSUlq?=
 =?utf-8?B?dXVGdTF4OCtXcFZ1WHAzWnZRQkJVbFVvK0IvWk1jVmFMa2M3TFBvUHM3dTI0?=
 =?utf-8?B?bU5ERTg1NTVMQk4vWms1c3hKNVNhd0hKN3J2eTc4MVpGVUt3V3F1QkZMcmts?=
 =?utf-8?B?bWN4YXZZU3FuUVVkWWFFNEZrVEpnWmQ0dUsvUW9JcTc2Nm9WRnU3U2RWdUVH?=
 =?utf-8?B?djRiaWZtL1J3SHord2JGcTlHcGpKQXZSUFM5bEhyUEhwLyswb0oxMks5R1hN?=
 =?utf-8?B?anlMYSttVlZHMk5UZWJZQWNCaVhpQWRaaFd3TG9jTzk3QWlvdkN0TS9mQWZH?=
 =?utf-8?B?L05aanZaOHVSWlZGYmRSOFp1dHQ5RTJDeGF6dmxod1IwbWw5NWNsS3VNZCtY?=
 =?utf-8?B?Sm15TmFLTGtrTGFQa0NwRTRPTlJRQTZOWFdDSm54eEVaYlVDa0pBZWtaMTBU?=
 =?utf-8?B?bjJtT0JWdklYczNoREFQZk9zN1B2ek8rRHB5bVliamZKRm12b1g3dUpOeFNp?=
 =?utf-8?B?TC9UV0F6LzBBOFcxRWNoc0Qyd1BzamMxenR5RWpaUFZUYU1JcGRTQUd5NUN2?=
 =?utf-8?B?bVNTRlB6cC82RE9ZVmNkSG5rMXp6WlVGSms2VlEySHZXMVdEZUFDMzI3MnhF?=
 =?utf-8?B?WUZUSnYxQkpGRElXRWNWaitwWlk0OWVoanlPMHZEU1kvY3VnM3BNZWQ1b0tz?=
 =?utf-8?B?a1BVSy9pRkc1U3FEMUIrMEJBdC9YMVdrUlZGeWJJemRoZkhVMFBvMHJpZUxT?=
 =?utf-8?B?WjRIU1laYk5Wc3RUM3RtTnZQcllhVlJkUlVuQ2t2THdoZjNtSVphenNSQlFh?=
 =?utf-8?B?SFlVbnRaK284WXFVYXh5Z2o1aVgzcXB2cnRtaFQ4dEhJTC9nRlJUdDYzUWZ0?=
 =?utf-8?B?elh1RjhaWktOTWpUT0VZLzFUSTRaTjB0ZGpFcExCUjJ4R2pSOUw1OExhcmcv?=
 =?utf-8?B?UnRaZ3hhSVJnVEkrbmVrV2lWQUhzbHgwMjhGTm1uaGxrcElBVVdwNnpNMHE1?=
 =?utf-8?B?eDVVYURVYjdkR3orOUlmWXVZR0JqSllKK21PSUFKOW1JUjkva0RrY3k1MWFJ?=
 =?utf-8?B?dWk3ZVVuR3pnKzRrNkNPOE9FZ1dZWk9LU3FyWnVFTmU0dVJWWmI3dU12bENi?=
 =?utf-8?B?bU9jK1BWenRIVmx4czlVcTVmaW5ZTmpBdmFEN3RDdkRmb0dYRXVXT0ExNk5l?=
 =?utf-8?B?RmhSK1l4dFBUSk51aC9YZXIvL0J6RUJUYi9iNVVVNzVaUmVyRXNMM3AvSDFR?=
 =?utf-8?B?QUt5emVlemlOOGp5dXpCUHpLcFRuSVJNVTFNVVFTR2lEM0xsV1FUR3QwRjV1?=
 =?utf-8?B?ZmwvMmpRTC94eW55N0M4ZkU4ZEVCYnREemxuYjZKclZQOUFzK1hWdVluTFFy?=
 =?utf-8?B?RW5uTkVWbzBVZ1NLMmtvYjY2akQxN1lkWExjRUdRTnQzdG1qMXNuNWdJYkRY?=
 =?utf-8?B?MFV3aW9UM1U2VHozZk9kVm5sR0pOQlpXSzZrbTBJWlJKZlJxNnpzNmZwdnM4?=
 =?utf-8?B?TnNXTDJvYmdkOVJDZjgvR3I4NlpiSDlQOFd0RURESUVpcDBYWDhtS2hiZGxi?=
 =?utf-8?B?djZmSXNMcXJUVUlYTlVRREdEdHBvaEExZE51MmlXR2pURWFvRGp6Q1pOUGtn?=
 =?utf-8?B?UVk1QVR6QnlJNkpRU2E5UDFqcXhVZEdGcy9zeGpVL1VtcTJ4ZlRnSkowQk03?=
 =?utf-8?B?dlltR3JHWVAvaGVRc20wQ3c4R0JDTmQ3QURxNkR2QllhYjAzbm5NeU5UQTds?=
 =?utf-8?B?ZWZnZWxSS1VnZVhmWUs0VWFvcHh1dFFYbVZmdTMvSm9tN3dsdUZ2VTVBRDNM?=
 =?utf-8?B?REtLRHlZajFSQ1RwWVlSQUpXUlE0bmxpcllBbUI3M1dwczg4VDQ1S2R5L2d3?=
 =?utf-8?B?UDRSMm1KUXJXMnptSHhoWnRvb2JSRld1RDc1K25MVHRYU01lNi9WSk5YbnBB?=
 =?utf-8?B?dFNuUk9FWUIzUEtZTHQrM0NWbWZCakpHMzJUZHFiaW5CemI0RWNFZlFMK3A2?=
 =?utf-8?B?b1N6aVI5aXlCS0YxVisydmd4M3ptMVVYT2QwcElHMG5kUGJYU2lhSUV2OEZ1?=
 =?utf-8?Q?QUQYAdDkU099Wlio=3D?=
X-Exchange-RoutingPolicyChecked: jAgn0ScyYpkJzvn+kd+1vCA/VkdoFIEttJws2rLeB1Jg6TaoggNBEV8Tsj5bt2Ar2Ef+D4B+fwsNXeXhtehdJWG66WQ8GMq6BD4POVzz3EBbl1dInFaU9cICPhlokbHGIiqJzdvLTbs5qUfoM4rxeJI2ySvzOELRkAfPq4l7TMSg0rq1LDYUu8zg95nDA2YxCL+9KWcSRY3jZ4WX8xksRSnWA/Nr6Gk6OcuegWhmuO1bzB9j7mllaQiShS7ZfMA5oeBGgCJO9QSUT6I38vHhkNBy/pXga7Q+tv3+CTGFsbZoJDB7U2VLMzOQOlSNl+3YdK3GG4Ka5WVUx3VsqHIUjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b08bd1b4-6b41-4397-9251-08de91a72fa5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 17:33:57.9237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGjodftfMHNrTY/WTinvCs62VDbkGxTprPH/H3jIOW4O5nwQV640KoVuStyJbdVdeVOb4slTrorvmwQSWO7lJFxJVTvm2BHH4fqFrFT6LxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8768
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



On 4/2/2026 5:45 PM, Matthew Brost wrote:
> On Thu, Apr 02, 2026 at 03:51:36PM -0700, Daniele Ceraolo Spurio wrote:
>>
>> On 4/2/2026 2:37 PM, Matthew Brost wrote:
>>> On Thu, Apr 02, 2026 at 02:30:30PM -0700, Daniele Ceraolo Spurio wrote:
>>>> When a queue is destroyed while still active on the HW (for example
>>>> because the app owning it is exiting abruptly), the driver tells the GuC
>>>> to preempt it off the HW immediately and to reset it if it doesn't
>>>> preempt. This can cause a reset log to be printed to dmesg, which can
>>>> be confusing to users as resets are commonly tied to errors, while in
>>>> this case the reset is just done to speed up the cleanup.
>>>> Given that a queue is only destroyed once all refs on it have been
>>>> released (i.e., no one cares about it anymore), the log of it being
>>>> reset is not useful and therefore we can simply suppress it to avoid
>>>> confusion.
>>>>
>>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++---
>>>>    1 file changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> index 10556156eaad..e6702bd99309 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> @@ -2968,9 +2968,10 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>>>    	if (unlikely(!q))
>>>>    		return -EPROTO;
>>>> -	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, state=0x%0x",
>>>> -		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
>>>> -		   atomic_read(&q->guc->state));
>>>> +	if (!exec_queue_destroyed(q))
>>> I think you want killed here—right? Destroyed is tied to the refcount,
>> I actually wanted destroyed here. I was thinking that a queue can be killed
>> outside of the user control while the user is still using it (e.g. PXP
>> queues are killed when the PXP session is invalidated), in which case it
>> might be useful to keep the log.
>> I have been pinged multiple times about engine reset logs on destroyed
>> queues and I kind of got tired of having to explain that it was irrelevant,
>> which is why I'd like to just suppress the log in that scenario. Maybe I can
>> rework the commit message to be clearer on where I am coming from?
> This was my mistake—I didn’t read your commit message closely enough.
>
> However, destroyed can only be set once the queue is off the hardware
> due to the reference counting between jobs and the queue (job hold a ref
> to the queue). Note that disable_scheduling_deregister, which sets
> set_exec_queue_destroyed, is called from __guc_exec_queue_process_msg_cleanup,
> which only happens when the queue refcount reaches zero.
>
> We can only reach a refcount of zero once all jobs have naturally
> completed, or after we time out jobs, disable scheduling (a one-way
> transition), and then signal the job fences.
>
> So we should likely assert !destroyed in
> xe_guc_exec_queue_reset_handler, since reaching that state afterward
> really shouldn’t be possible.
>
> Compare this to a user pressing Ctrl-C on an app (which sets kill). We
> can trivially trigger this message while the queue is still on the GPU
> because the TDR (immediated kicked) sets the preemption timeout to the
> minimum value, disables scheduling, making an engine reset highly
> likely. I think this is the case you’re trying to fix, unless I’m
> misunderstanding the problem.
>
> I haven't looked at the PXP cases so can't comment but will look in bit
> if we to discuss further.
>
> Matt

mmm, in the logs I've seen the queue was marked as both killed and 
destroyed when the reset occurred (state = 0x99), but the job also 
seemed to have completed naturally (i.e., the engine reset happens 
during the context switch out).
However, your reasoning makes sense and my case is not what usually 
happens on ctrl+c, so it might be easier to just check for killed here 
and put an explicit log in the PXP code to cover that use-case (which 
AFAICT is the only case where a user queue can be killed while the fd is 
still in use).
Let me think about it a bit more.

Thanks for the feedback!
Daniele

>>> whereas killed is tied to either a user closing an exec_queue or the DRM
>>> render FD being closed. There may also be a multi-queue case that needs
>>> slightly different logic. I forget the exact multi-queue teardown flow,
>>> but IIRC it is slightly different. Niranjana would likely know that
>>> offhand; otherwise, I’d have to reverse-engineer those flows again.
>> I'll check that out.
>>
>> Thanks,
>> Daniele
>>
>>> Matt
>>>
>>>> +		xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d, state=0x%0x",
>>>> +			   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id,
>>>> +			   atomic_read(&q->guc->state));
>>>>    	trace_xe_exec_queue_reset(q);
>>>> -- 
>>>> 2.43.0
>>>>

