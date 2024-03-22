Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEAAC54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 21:36:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF7C10FE44;
	Fri, 22 Mar 2024 21:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PldGU1Ph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECE010FE44
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 21:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711143417; x=1742679417;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iUHsNC8eBgebN9HVHngm1E2Zl0DdILyvv3pNrcjzNU8=;
 b=PldGU1PhnIdBjYh/TOI6HqvDdLA2xWJ/OFiGAEYhBLxFyqlkyZ3hKdzJ
 bP0OVSSqPF5myPSOXs/Zl0UMyoXrPBw9HEJcBZvOQB7m+n2+/UHBC1XSt
 ZVz2xF3fprytMEV/HCjEf33XikHK7FkTAkVNCxDboOKYs404TR7FZxy7G
 KhNjUMRemOUDXOShRXIcY4aGbN4THPwisjYw6zvxWkA62u7oFTAXEvB+u
 /OtvNscwjM/bSCN6gB3IdtL4oQrI3igd7G0YKwV3XB8Ilsimfsw5NKull
 GohB6kN+vw9mKGjQEvNxkF0snrjr2ALjhet1+ihBq/Wrx9DyFK8VmdIf6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="17642064"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="17642064"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 14:36:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="15474705"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 14:36:57 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 14:36:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 14:36:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 14:36:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2LmTwLFZqdUQo98VsVGEUPKRhxMSoSym47JVtkHWnUv6FggdMIUgOErlcjRJ4RAc34jN/BKZ+9BT7oxxFWgKedVGm4qIdEfEcZl7mlNFW6td34SvGN+dZvycvwiBeg6rDMjZ49++wBGgDxNNs9PXLhoEAzF9a+IJhb0/TdQ/FWYWdrEvnuWh6Q2oyY2J+qVlwS3F93336kpqjy3PRBCIall4SdPa9gNaavcgrdF3j/dHlvqPYvk0285eSJKsWaxDpX8LjXggJCCx6yeCFqSuYZkW+sVU7B7DcvB6biw4XIKszi4kAZOutFtlKbEBDRWxleDp6l0bced7ZPHTaGedg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+GIjp5E+hPt/PIgqzpwjWL9dMvF5JyBq71bAEGgLxg=;
 b=B5rqS592HWgcG1QOe30EqKo9vLnEFI+4K5CinGY6cwd5Af6eGOLDX7qL2vRLkrYznBIaruaFTfmAEsNosmGkkZtuJHkQqjnDET+f2Tweb/GigOQ9TPydFKS37DYCbeEzBLgU9ZNVgn3cUyQHeoK4FUiIA/NSIsN0PfYOYJYc+dFsQ2mIziv9/ajMn8UYQI/OU7oRltk+4Gn4BrL1dbhtYlrv1AlD432K6cjG0LlxBFLezLQMDo1Fce2AM1HzwXP6Rm1+rxJpgAUGCpmCRsuYxNnrNHnqI3BawPVM213Y8cAxwdYS6v8LLuyHHo2uuxPD8/A0CLBmxrxmvm5mDuZJXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH8PR11MB6949.namprd11.prod.outlook.com (2603:10b6:510:227::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 21:36:53 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::8778:d67d:55f9:f68a]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::8778:d67d:55f9:f68a%7]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 21:36:53 +0000
Message-ID: <1226b37a-b163-4b03-97b7-863dc258dca4@intel.com>
Date: Fri, 22 Mar 2024 17:36:50 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/8] drm/xe/guc: Add GuC based register capture for
 error capture
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
References: <20240319143621.371087-1-zhanjun.dong@intel.com>
 <c8d124823fe7da90916042fcd09edd6e550bd5bd.camel@intel.com>
 <545e620aef74383ae1137dd4dc3cf98020d60968.camel@intel.com>
 <ec7b3393368e3371228256785e9edcb0016425ab.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <ec7b3393368e3371228256785e9edcb0016425ab.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0187.namprd05.prod.outlook.com
 (2603:10b6:a03:330::12) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH8PR11MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: 96693fb3-a325-4aaa-ef79-08dc4ab830fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IRSWT2UoZl1n0cczKt/vBfnhijIfp+oT+teyoqPu2jwzffYBF13b7/Go6gSFPxOMtnWLvZnEWsBsF9Vqy7jPiXgr9qKIaxmI9SidYi/GBnIQTuf0/+3mGE3j5DZfe1L8iXvLNZx194msnbq1xcs4AC1xgaS37O29/jW3JWChRRV3CSU2fOPbHIoufRWnkEG6T3FNHSpROOCnWJ4CR1QKF/q7dnAlfJe11lkIJ22JrlhX2KMB0n12iyhto7wTKE0gve2V5Fo2xApjqO5K4oOm9ixhEd0zKYWPyj267R7W+fMpu21c4nXfxDAEsCgwIJRvN8UzEn3FdUVAdT2Pm3Oko6ql4Y3gS5TIM7FcYDqxvndz7URwzFbxIHxddPhw3jjFO0MzG1GxHxZhsFatfyIR3/nrO60bAkK+hkjzOwO7k7a9RGJyXCd5Vu3e+i6lQvJXYZBc+YqG7yWLiP7tEkihmKBuXZCxdGnURyG9LEbCDFPZMEenOg2tkyQc9ojIKiUxxTlwTxVu/19pqcCVgQj22SYYDlfE3lVXNHes9vLjzTQ55eSjUdk2jS8Yv1FIMPsybTfuVLvCnQF5b0tBZ5UAhVgV9hIY0pKNCstXG5lYPlCaqRRhGJB4SrlD1yDfDhxKs9xTLOv68IO2uxEH1AZnjeUqMlxQDUZo0mnFztEs3ng=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TS8yRFp2THl4L01nNExzODVYNkpscWNSL3ZWYWNad1MzbEJXV0srMThRK3Bs?=
 =?utf-8?B?QVFtanV3QVVXbktydVJXZmprNkRDTzlaTitDUjhtNFM2b1ZiMzI3bVNSVFc5?=
 =?utf-8?B?YkRwR3NxeTV0S1BVdFlOWHNxdlo0Y1JJaUNiWVZESXIwYTFvc3NBYjB0emFK?=
 =?utf-8?B?cE00L1FQaC94R25oSjhRdlI4WFl0Rk1GRFlhMktEMVNteHVpVnQ5cndSY2cy?=
 =?utf-8?B?ZXVMUithWXhKMGdHanFSQmVmdVZDZlBtYU1aUlVscDNuNXh5eHRxNDBtWmVD?=
 =?utf-8?B?UVMzRjIyU3lLRm9nOFRXOExjYllQVGxXb1ZITnNLYzhEM1JLbllMRjYzL3Bj?=
 =?utf-8?B?SU1sV3dBQzh0RkZPS0ZtVVdaRDdXeFc4eVNlN3Z4M3diZ3k2bFowUjFsSjBv?=
 =?utf-8?B?dWozU1Z6L0JnMm1Da2p4MXAyanFiS2hTOWtnRUFKVGZzcDYyOTdhRTRSU21F?=
 =?utf-8?B?SURabnNDZmpveTVRaWR3YXVKa05SVW5vZTMyWlF5TkI4MmxONVNHNUo0WUlY?=
 =?utf-8?B?TXFDOE9HMEtEZU16RFduNHl2QlJickFJOXUzR0kwVXJONjBOYk9Mbk5oWXM5?=
 =?utf-8?B?YWpYL0tockJqTVJ2Q29nWUV0REpsRW1yNi85WU03bDJBNndHMTQ3NXRvL2hl?=
 =?utf-8?B?eml0QnpwWlpPRmtFcWp0eG1TM2hVRFFCMEQrUWRIM2NKckNwa2xHd0w4RDhI?=
 =?utf-8?B?K0pIMXlFWng3RlFMN25qSjNNQXNuWmRJSnh4bTNYSVFHd2R0d0VwR2xUVWlJ?=
 =?utf-8?B?LzU0VU1QVTQxRzZPc2N4MVZtOG93d1Vmc09SZUxqaFNLTmppd1owTVpUMTh1?=
 =?utf-8?B?Wm5lc0Z1QU9SQUFualBkZ3dHUEtsWFhBQVNoUVl1d2V6NG0yOFhHV2d0Y0Fv?=
 =?utf-8?B?RFRvMi9Oc0p5ZlVXaG85OEpDdUswL0N1S2dHbVZKK3dOcnp0UEw1OEhsZVBv?=
 =?utf-8?B?V3V3RGNIYTdKT2MwZ0JPbkFFaHhiWXNnaG8zVUdQMm1wNFFmVVE4Y0Y2UVlK?=
 =?utf-8?B?ejBqMmN3dXRDS0c2ckNzTjZlQmwyQ1RvWE9RaGFzMys3anZuVXRxNEZlOVUw?=
 =?utf-8?B?bE0wdjUwK3ZJRCs4bjZCb09nRVpKVm9RelkwRnhrOTRlMjU3OTAvcUl1bDlj?=
 =?utf-8?B?c0hqLy92NVFBSDNmcnEvalZHMjJDZTJSNVl1ckZBdEFkYUJwU2hWbU5RamRT?=
 =?utf-8?B?bmo0SGp2QlliYy9pUlFOTkRVclRUSjlBMytHV3BIejJiaEhaZ2FqSzJ3YXVP?=
 =?utf-8?B?SHdCdG01SHB1cGxOY0xSbHlpbEd2bjg5OXFTbUhwSDgxZUJVM3RuL0ZmTU4z?=
 =?utf-8?B?UExUbURsTERXQkdNQlpWUjVwYkk5TkYreGhQN1JKMEp6b204NUZwVk4wdS9N?=
 =?utf-8?B?dHNwMjJTRWxlbk03NmpZTVl3YjUzL3E1cGpjVXpsaTZSZ0tiUHdpTmxuWmRh?=
 =?utf-8?B?WWRDdW9tamYyYjErNUg4RVdvRzNnQnUyMk1hUTZBNHNvUndBWC9TUU96WVlo?=
 =?utf-8?B?Mk9uWTR4ejgyRFh0VzdTZDB6YmUzeGNPeWkxNHpNcEs4UjZIZ0RhTmNIQW05?=
 =?utf-8?B?bTQ0V0d6dXBoN0ZnOGM4b01Cd3hDYVhTK1pXRkFwSXM1OCt2VGpxWVpsbW1i?=
 =?utf-8?B?MWJRTTNLYnlUQ2hPZzROYlByckdFN2ZzSTlSaksvSkh6Wkd6eVBibEYxNVNY?=
 =?utf-8?B?WjJIRXdtNHRncFhuQTNWMndiZk1wUEF3QlErOUxadzZKcWRlTUJLNHBMekNT?=
 =?utf-8?B?OVdlWGhJQjVXcU5mbkxxWEdyRVpqb3k4VExzT3N4MDVjeGlxdHBsS2IvSFgw?=
 =?utf-8?B?ZzB0SlgyanVMMU5ZdkhDMTNLcFdmUmpEeUM2Sjh1N1FJQ0lNNTRrOG1QMkxk?=
 =?utf-8?B?SE91TWUvTTB2Q3hDMmNFMVUwTnFDQXB5c1ZpenZoV3BWSU9hQnFyd1BVaVlq?=
 =?utf-8?B?ZVFmdzNRb1RtczVyUW0ycWkyNzhIWExieDcrTnExWmREcVpUakovYW94Yklj?=
 =?utf-8?B?Y2lhcGU1ZVdlRWxFamhNVC8rS2VzVytvaHhnU3o2VU5HOWRrdm9xN051NXJn?=
 =?utf-8?B?cjI2Yk5IU1BROHBXWjUxcEdMRlU1ajJsTzJncVMrbEtwVHR1R1dGc0ZJckZY?=
 =?utf-8?Q?26ljyB+QuHiLB5y03kNTG6Rq/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96693fb3-a325-4aaa-ef79-08dc4ab830fe
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 21:36:53.7833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9C3lL0FHmCKGjuDFR8twMUJRjhRiGvKgcu0jMn8vx2gu1EsUTDlP70F6Qev58e5EeNFR5rhJojmt/N+ku/xYIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6949
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

See my comments below.

Regards,
Zhanjun

On 2024-03-22 5:28 p.m., Souza, Jose wrote:
> On Fri, 2024-03-22 at 11:37 -0700, José Roberto de Souza wrote:
>> On Fri, 2024-03-22 at 09:57 -0700, José Roberto de Souza wrote:
>>> On Tue, 2024-03-19 at 07:36 -0700, Zhanjun Dong wrote:
>>>> Port GuC based register capture for error capture from i915 to Xe.
>>>>
>>>> There are 3 parts inside:
>>>> . Prepare for capture registers
>>>>      There is a bo create at guc ads init time, that is very early
>>>>      and engi  ne map is not ready, make it hard to calculate the
>>>>      capture buffer size, new function created for worst case size
>>>>      caluation. Other than that, this part basically follows the i915
>>>>      design.
>>>> . Process capture notification message
>>>>      Basically follows i915 design
>>>> . Sysfs command process.
>>>>      Xe switched to devcoredump, adopted command line process with
>>>>      captured node list.
>>>
>>> Just some notes after trying this to debug a issue with this series:
>>>
>>> - CONFIG_DRM_XE_CAPTURE_ERROR is not a good name for a config to enable GuC based capture.
>>> 	- in my opinion this should not even exist, always capture with GuC if xe_device_uc_enabled() is true.
>>>
>>> - coredump don't have some registers like SAMPLER_INSTDONE, ROW_INSTDONE, XEHPG_INSTDONE_GEOM_SVG...

Yes, those steering register print out is missing.

>>> Here the output in LNL:
>>
>> ah this could explain...
>>
>> [  152.189386] xe 0000:00:02.0: [drm:xe_hw_engine_snapshot_from_capture [xe]] GT0: GuC error capture is empty, take snapshot from engine.
>> [  152.190215] xe 0000:00:02.0: [drm] Xe device coredump has been created
>>
>> but both code paths needs to dump the same registers

I found you have another patch:
drm/xe/devcoredump: Print errno if VM snapshot was not captured
I will take a look.

> 
> Hi Zhanjun
> 
> Mesa team needs the INSTDONE registers to debug issues and I have patches implementing the dump of this registers.
> Do you mind if I send this patches the list?

Sure, please send it.

> 
> I guess this GuC based register capture will need another version and someone with experience on GuC to review, so it will take a while...
> 
>>
>>>
>>> **** HW Engines ****
>>> rcs0 (physical), logical instance=0
>>> 	Forcewake: domain 0x2, ref 1
>>> 	HWSTAM: 0xffffffff
>>> 	RING_HWS_PGA: 0x01693000
>>> 	RING_START: 0x029d5000
>>> 	RING_HEAD: 0x00001914
>>> 	RING_TAIL: 0x00001968
>>> 	RING_CTL: 0x00003001
>>> 	RING_MI_MODE: 0x00001000
>>> 	RING_MODE: 0x00000008
>>> 	RING_IMR: 0x00000000
>>> 	RING_ESR: 0x00000000
>>> 	RING_EMR: 0xffffffff
>>> 	RING_EIR: 0x00000000
>>> 	IPEHR: 0x7a000004
>>> 	ACTHD: 0x0000effeffff9208
>>> 	RING_BBADDR: 0x0000effeffff9209
>>> 	RING_DMA_FADD: 0x00000000029d6968
>>> 	RING_EXECLIST_STATUS: 0x000000004000279c
>>> 	RING_EXECLIST_SQ_CONTENTS: 0x00000000029d9719
>>>
>>> - a lot of style issues, see 'CI.checkpatch'
>>>
>>>>
>>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>>>
>>>> Changes from prior revs:
>>>>    v6:-  Change hardcoded register snapshot fill to follow mapping tables
>>>>          When capture is empty, take snapshot from engine
>>>>    v5:-  Split dss helper code out as an standalone patch
>>>>          Remove old platform registers definition.
>>>>          Split register map table to 32 and 64bit each
>>>>    v4:-  Move register map table to xe_hw_engine.c
>>>>    v3:-  Remove condition compilation in code
>>>>    v2:-  Split into multiple chunks
>>>>
>>>> Zhanjun Dong (8):
>>>>    drm/xe/guc: Add kconfig for GuC based register capture
>>>>    drm/xe/guc: Update GuC ADS size for error capture
>>>>    drm/xe/guc: Add XE_LP steered register lists
>>>>    drm/xe/guc: Add capture size check in GuC log buffer
>>>>    drm/xe/guc: Check sizing of guc_capture output
>>>>    drm/xe/guc: Extract GuC error capture lists on G2H notification
>>>>    drm/xe/guc: Pre-allocate output nodes for extraction
>>>>    drm/xe/guc: Plumb GuC-capture into dev coredump
>>>>
>>>>   drivers/gpu/drm/xe/Kconfig               |   11 +
>>>>   drivers/gpu/drm/xe/Makefile              |    1 +
>>>>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |    7 +
>>>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h     |    5 +
>>>>   drivers/gpu/drm/xe/xe_gt_printk.h        |    3 +
>>>>   drivers/gpu/drm/xe/xe_guc.c              |    6 +
>>>>   drivers/gpu/drm/xe/xe_guc_ads.c          |  229 +++-
>>>>   drivers/gpu/drm/xe/xe_guc_ads_types.h    |    2 +
>>>>   drivers/gpu/drm/xe/xe_guc_capture.c      | 1332 ++++++++++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_guc_capture.h      |   21 +
>>>>   drivers/gpu/drm/xe/xe_guc_capture_fwif.h |  221 ++++
>>>>   drivers/gpu/drm/xe/xe_guc_ct.c           |    2 +
>>>>   drivers/gpu/drm/xe/xe_guc_fwif.h         |   68 ++
>>>>   drivers/gpu/drm/xe/xe_guc_log.c          |  179 +++
>>>>   drivers/gpu/drm/xe/xe_guc_log.h          |   15 +
>>>>   drivers/gpu/drm/xe/xe_guc_log_types.h    |   26 +
>>>>   drivers/gpu/drm/xe/xe_guc_submit.c       |   21 +-
>>>>   drivers/gpu/drm/xe/xe_guc_submit.h       |    3 +
>>>>   drivers/gpu/drm/xe/xe_guc_types.h        |    2 +
>>>>   drivers/gpu/drm/xe/xe_hw_engine.c        |  261 ++++-
>>>>   drivers/gpu/drm/xe/xe_hw_engine.h        |    4 +
>>>>   drivers/gpu/drm/xe/xe_hw_engine_types.h  |  117 +-
>>>>   22 files changed, 2421 insertions(+), 115 deletions(-)
>>>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
>>>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
>>>>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_fwif.h
>>>>
>>>
>>
> 
