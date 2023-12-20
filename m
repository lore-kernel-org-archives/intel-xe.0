Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC7DC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 05:36:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DAB10E02E;
	Wed, 20 Dec 2023 05:36:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2F410E02E
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 05:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703050609; x=1734586609;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aUVJQNEVLdhpk5xl0MHDbOP1ru4RlGgBrAxQtSdbeqM=;
 b=nWWetCmbCpdMS6MhhSEsFZHnJCu/XNZXglZ8TnfKQu4GNGJfwt9pvDVj
 EohCov0BKfM5SN96VAl3NIHoUZbiXRQV5FPVvrIHr/YpUu0g+gZlDDoe9
 5dPyROwBGyfIFBEmWAibzrB6Hp4s2Nxruiz2jkfGGqTpllzOWPNO8kfGk
 +aDhyHRyqnLer9n3etVB1q6TIFCX+Bzeur9MAlNSxyMdzT5nVPnA5QXlc
 cS/+ysHIqMMM2Qh32T2y2PXbcZs+sR6mEjVtlqq/uqSA1Yv4nfxJ26vfb
 1QczhKrLX1wq8kTyt9aPBO+Nl/ji4vhk22/c2wENHo26ZR2eTaounsMpq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="3001287"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="3001287"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 21:36:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="842147532"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="842147532"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2023 21:36:41 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 21:36:40 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 21:36:40 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 21:36:40 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 21:36:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOMtEVhcPDEhII7AN5XV5A7GkJa9VTMS5XL2OWt56lBtqMg2SBVCdiHQaYS2O6EpAjVJ05bn0m7g7ooiKT6viN7LiJEyxNCGZiGACvrUQqzJtY/WgQkUkt4aDrp29yofVqiHKGHhIwCKXg78v2M0ta4xr16mSHRRFuogHodLsNCSYRrNR5wX8Vo2DiWrf2Nr6CRSBOHS/ODBPxCi0xgT9O9+uE1jMVQjSG3o1/sBr/rYETBQ62S6Ni2GD9YntncFObPsu1oU3WO41sfgAYvrE2OxXhB3wdt28MgJU05PtnliaMd+qo0ZLiJjYfiEfsiFuaeMq27MDQzRW2Qtr2MQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gqjkpGeDiX2o19RclZO1kGcTMoyZwFPNeiS2Omj1CY=;
 b=BBU0FdrzcwPMBK+f5wD0GBZLQRIR02l3Hec+fPtpJP/1iylMhFoHYj6EtozbTGHGudacyHxaYdbgVV9LE768iQOhpF8kYb9iqE9Jgp/7tuv4e2if05eYFHA/tjcVG1QPJ4GGjbL6noIfRP+VkH3y0DgOWo/5NIb2X2GJTeZ1Qagi3G5/kDg/F6CGgR9jl2+PaW9ebW1c3NFaE8S1fA9PFnDPbUhxKrUxF1peGeOg33ue2s5ApQXrfnzDO5ic4sMQU9NUBEsV4/r2I0q1Qk3NSHbSkTUgmOrMnl6tWqvRkv9ga6JR2NskRjEoLM/UWodGu4YvD7cwAvKan3g+Vw2VPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 CH3PR11MB8563.namprd11.prod.outlook.com (2603:10b6:610:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 05:36:33 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 05:36:33 +0000
Date: Tue, 19 Dec 2023 21:36:19 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v2 0/8] Engine Busyness
Message-ID: <ZYJ9U7/Y0uqq/Ygw@unerlige-ril>
References: <20231207125802.3730165-1-riana.tauro@intel.com>
 <4c5c2902-9503-465e-8a59-d17d75d8781f@linux.intel.com>
 <ZXpgwiRQ7z3cTE3V@unerlige-ril>
 <b753ccd6-3417-4da1-b3d3-a16aad6588bc@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b753ccd6-3417-4da1-b3d3-a16aad6588bc@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0092.namprd04.prod.outlook.com
 (2603:10b6:303:83::7) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|CH3PR11MB8563:EE_
X-MS-Office365-Filtering-Correlation-Id: a909f47d-698b-4615-5349-08dc011d9f74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /S8XdPtpThHTH/UqbQy27q+XpebTj0mO3EGS3hxvmFxVTP1V7XWi6G9/MdQhYgh5j+BymMaB59TzyreiElK+E7PVLW9y1bszXYixCyWyPW/wlL6Rmp212Vgfpyl2j0s/J1DEfwOT8+eQuA9iQFpfNG1/4BC+TTvmRmYnoZrLMimLgP0y5uVW8azRuXvKcRpkfNCgLov4QmR49C0DWTZNvT2omdnLf/ZD3MwtSV1IdY7ulE5V1KPi9K9THwVLANP7vHfb/SnD6tWs2tif/zM7CvotwU/FR5cDk50VeRmxSew5V7qjSwCdVamacToHUw7n0vPYB0ZYoCVs77eM76n3MWohAkB9c0M44Igvm5OqzSpmUePqPC2u+w7LScGzeIQ20upBZvXdV6LvA5WikYMHDONT9tQ5qpCJI/vGole0hVYx6anfOv4fo4AhzM4i8MnrUfyI3Mi9AhXrJGJIDJXor+IaiEJw5jscR4BNpL/CFhoHN5gau+C1ZvAziqie0Iq5/fNaihjSLfqBTlr21HKYLdNVOxGhcymz96R5bUdbQGsflIlv4+DtETpA1wCu8pLo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(346002)(376002)(366004)(136003)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(38100700002)(2906002)(82960400001)(8936002)(8676002)(5660300002)(4326008)(26005)(6486002)(41300700001)(478600001)(9686003)(6506007)(6512007)(6666004)(86362001)(66946007)(66476007)(66556008)(83380400001)(33716001)(6916009)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3g4U3FxaE9uTDQrd0NRMUNscXVYMHBkbE1PQ2MwbmZFWHczcWJkTXloZ2x5?=
 =?utf-8?B?OXRDM3VKdmZ6MU56NGl6WGJqQUh4TUtza2ZaNkp2RHhhYmlwWjNBbUxjUVFS?=
 =?utf-8?B?SlNTWlZhM1FRZ2xwa0o1dWJjMDl6N1RPM2cyU3gzYlBpTG1DWVBJbXdObTBp?=
 =?utf-8?B?R29WZ0ROa3JLSEx0T29wR3NXU1BqSzFSL2owTlM1bWJDajh0R1VlVzRpMVA0?=
 =?utf-8?B?UnEwYmZBMXpmTlVpRS9IMGs0d2dUUnUzOXpGSXFaaDFrWTNTMkhKV3JyNEUv?=
 =?utf-8?B?UmRYTFBHWmpPVHpmdEgvbTJGNE1XUE9sOEtUTjg1Qjc5cmNlVms5K3JLdFNS?=
 =?utf-8?B?N2EzNkhzYXRCN01MODdCejh2cTVseE04SHZ6c1lTNWtETENWdE1hcC8xTEpK?=
 =?utf-8?B?MHRFcUFvcmJUOVNYcm1LbGRFbXpyTEgvZjVpL0tFTXBIRkhtVFd3UEdYbks0?=
 =?utf-8?B?dG9xRHhSMjNHa0VSM1BuRklRUlpDRGp5VmhGTkpWRkxGRU5wRnF3TGtGWE5W?=
 =?utf-8?B?alBSY1RRR0cwb2dJeGFTY2RieVQzTkE0VFRDdFVBcHRvZURXeU8yY09CRWRl?=
 =?utf-8?B?SlRXejUrOSt4YVhjS3JFbU1rVjMwd1Y4V3YwSk9XaWRrVEZkdERkWHN1K0Mx?=
 =?utf-8?B?RXNlSkMzMWJqTGptbzloVGIvRTVHRDd1YUpncTFEbUxFeDZRQ0dldEtFMENI?=
 =?utf-8?B?bzZqSEFPa1B0eGNTd1N1OXZpTE8rdXFaL1QwcUIvQ0MzSlREVnpLUm5CU3h6?=
 =?utf-8?B?MVBRYlpwVXdqYVhxallOOXh4Ni85SjdFeS9LVkpIVkZxcGUyMXBEVU5FOGw5?=
 =?utf-8?B?bEsxTHpsTlhJZmFCZFNqOE5reVl2Rm1lRG9FWWl6K1F0SnhnY1ZIdmdBa3A4?=
 =?utf-8?B?MjhUV0FMSURoR3FZUE1aUEVzYXpJQlk2SmpMS29HeEhCY0dycDBNbVZYWWky?=
 =?utf-8?B?Z1ZpR2s3d3kxdzdIUmo4Ty85VWxrczI2UGFQZlRyeDkyTERPNDBDZjVoYmhl?=
 =?utf-8?B?M05YNG42NFZTc092MmtmUFJ2eWgxcFoxNlVJVENRa2VlS1RMYjRGaXdETGVL?=
 =?utf-8?B?RHlUb1hMQ3cyWElHdzdBTGhva2NaVUNYQTJKN1NiRjZsMHJqeWFzNHltOUha?=
 =?utf-8?B?NUNFd2l3eFNmeW81NVpvQ3hBbHRLQkFlajUvRURMSGhaYjByajFBbUVpUXZJ?=
 =?utf-8?B?RnBrUTJobEZoU0NiajBhbFVHRENucjc1YUR6WG13clhUZG5hUWRVdEtTUEQ2?=
 =?utf-8?B?bSsyaGJ6VGkvdmdlMWIvS3RPY09abXZOQUY4RG14Si9WTnZaOWN4aVhvYzNl?=
 =?utf-8?B?UHFCWWlBZDk4Q0VIR3JvTVlhRnd2TEg3MlB3Sm15NExmSzVxVDJkT1Q5R0Zh?=
 =?utf-8?B?UWh5YW5EL3c3d29ycmNsVkJUUlJCQzFQNG54L1BocUxOaEkzQnB5MVZlOEd1?=
 =?utf-8?B?QjM3RnVIQWl2TEIvSGI2Uk1SbytLUnltRGtYeHc4eE5LbDgzMWJaOVZOVDg0?=
 =?utf-8?B?bDJtQmtwSTA1NXIxNlM5VHFXK3JvSkdjNkdiZTZzZFFidzVjaGZLMjdFSzFS?=
 =?utf-8?B?WUZpdTZqY0ZycWRheWJZTHlxdEVpT3RtdVc2RTNHTjBrQ205bE1UVUt3VjBS?=
 =?utf-8?B?K2JaQkhKYmoraWplUGJvYUVTZHN5T0F0SGc4dUF5N0tzQjlaT1k5L3orSW4r?=
 =?utf-8?B?SXJYTVhQQnU5ZWl5L2hTUDNNSkxWb0hmR0E2TndrRDlheXhaVFVoVzlrWGVh?=
 =?utf-8?B?MERKaTVkTDZCZHk5RGc1cytxbmJVNjZyQ0F0TkJlZmV5WlFBVmpnbW5iZ1Zi?=
 =?utf-8?B?VThEVytjMU0xZERUczlQZ3FtLzNZRkZBMlVVN0diVW8xUEwwRlYvcHN6Ym1i?=
 =?utf-8?B?MUdHU0JDVjllYllCZ3FWRE9XV0FxcFFZOUVSdER3ZWN3UjlBMEdYQUxFczgv?=
 =?utf-8?B?UXJDeHpLeG0va0owMzNHM1JsejJvT3l2MFhLMThkN0MzOEFUbDBLVUdBMHov?=
 =?utf-8?B?QTdua2hjM2RwMGpMQ3l2MnIxa3BUaHF3SHR4cm1kQ1BNcWFwWGhoMkRmaUQ0?=
 =?utf-8?B?TFdnV0ZocDgxSWw3ZEI2Vm5MbjJsb3NOQmRzczVWVm51MHMxZnpZdWdaVTcr?=
 =?utf-8?B?NGtna09LRTh2WHZSYmpVOUJaYjgwMUNJcnFaOFpacW53UUM4eDhCMUZaU245?=
 =?utf-8?Q?U+t8PBpc/qG4FPLgtS2KdW8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a909f47d-698b-4615-5349-08dc011d9f74
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 05:36:32.4223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mbdyy0xjsJ4se9EEASLxn5pM3oAUwpp/AGgm/GTzlqVo3JLhObnEvV+0G5TwBZVjPS0f4D2KrIANdkZUS7uILrGai0ZoHu0GA3juG5pxQSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8563
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 08:06:46AM +0000, Tvrtko Ursulin wrote:
>
>On 14/12/2023 01:56, Umesh Nerlige Ramappa wrote:
>>On Thu, Dec 07, 2023 at 02:45:47PM +0000, Tvrtko Ursulin wrote:
>>>
>>>Hi,
>>>
>>>On 07/12/2023 12:57, Riana Tauro wrote:
>>>>GuC provides engine busyness ticks as a 64 bit counter which count
>>>>as clock ticks. These counters are maintained in a
>>>>shared memory buffer and internally updated on a continuous basis.
>>>>
>>>>GuC also provides a periodically total active ticks that GT has been
>>>>active for. This counter is exposed to the user such that busyness can
>>>>be calculated as a percentage using
>>>>
>>>>busyness % = (engine active ticks/total active ticks) * 100.
>>>
>>>I think I've asked this before but don't remember it was clarified 
>>>- what are the semantics of "active" with total active ticks? In 
>>>other words considering activity timelines like:
>>>
>>>1)
>>>    0          1s
>>>rcs0 |xxxxx-----|
>>>bcs0 |-----xxxxx|
>>>
>>>2)
>>>    0          1s
>>>rcs0 |xxxxx-----|
>>>bcs0 |xxxxx-----|
>>>
>>>Assuming 1s sampling, would the above formula correctly say 50% 
>>>for both engines in both cases?
>>
>>Yes. What is the significance of case 2? Are you saying rcs and bcs 
>>are executing in parallel?
>
>In parallel yes. Complete overlap, no overlap, or any overlap of 
>activity in between the two.

GuC accumulates this on context switches, so the overlap does not 
matter.

>
>>Either ways, when total active ticks is queried it would provide the 
>>latest value of the active time (does not depend on gt park/unpark 
>>since the value is either obtained on demand from GuC or is a value 
>>that is frequently updated by GuC.
>>
>>The duration of context (in to out) is accumulated for the each engine.
>
>But why is the total *active* tick moving during the 0.5s - 1s time of 
>the 2nd diagram though? What does it mean by "active" if nothing was 
>active during that period?

VF was still using it's allotted time and hence was active.

Regards,
Umesh

>
>>>I am also curious if there are plans to add support to 
>>>intel_gpu_top in which case please copy me on the required 
>>>refactorings.
>>>
>>
>>Certainly. It's in the works.
>
>Cool.
>
>Regards,
>
>Tvrtko
