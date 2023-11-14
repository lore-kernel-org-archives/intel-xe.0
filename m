Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1956CC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 19:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DC810E22E;
	Tue, 14 Nov 2023 19:32:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0EA10E22E
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 19:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699990357; x=1731526357;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=kC7KPFDIz7jrOHTta5Zu0REl94hf0PqDsYzGesdow0E=;
 b=Urk94v4j3xX9tblgvHivACyVTyekk8idbOT9ZRJ35nB6L/7nACnAduuh
 e2M8sOtbn52jiUQSGu4atb9AH32p2henGc/s1El3UjNjQx0cRUfLEVwyX
 UHOe/q+jNW27g8E54x9TZkdeJQL+EEBEhlfzN9m/kWWEgv+LwH9NC7Ul5
 F3NA1sgMJ5OlfOLWUxcmmPiILBMkEXdk5U6Z9V9hCYFZbA6q4xNrmbmE4
 1mJ2lLBMmwt41srkjVs5bEwrmsEMYiinAnOnlOkM4eK7ImAOuX6dhrQuj
 fvuAdovjxN+4JFm3IcSM56R0accxVTXQUp1vraX7uaw5rWw0FGqgNumDP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="476952131"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="476952131"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 11:32:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="12538787"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 11:32:26 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 11:32:25 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 11:32:25 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 11:32:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHWDPUWwlH9qf5e9piF5s0FMeQM677DKJTYYkJEkgWNqZOFu7/Zy/R6s1isFjQWcobWiKIOCnUfCUwpyDZ07pXVzVPlMKVe6/+XAshqAXmMLpkw9Vv9osoXkWlxoLw+szFZxh88pgh0/sMNMNa/zsH+kLlWf/lS6F8Nohsf8c/IwLPvWMOd9aV0GEsLr1qJZlmXMclLxyZKC8/l5XJ3ZVBdi3q5HKlDfytc0W5nFsbMVTqDq3M0w+WV0jjYNoRpqObjQaMnEEWGe0IZ3yCc8Quc+qDFu6qL8RJHd9ZtMDqmOnKADQzqw50YTA82xu70mRGU8Ew5yGaSdTENHcTrGpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cm9mLbZdZAWgrsYkufxDebydC/SL3LQQ75zlIrpG0x4=;
 b=O1vBCvh+p+KCB1ONCw8LYarqZj758vD51g9Nn91qF06kpmRXOKbKizDqo8Zp1nXXjF5njCk79AwTidZJb7e3uvn9W9nbdORHB3z1HyeKxqpub7eUPtzOAqqE5eCcZ0rChRLW9Yr3b9CUG2LrUBnRA0NK5g4XQAWUJzvb6P1xDG+h0LVQaHO357xUjmTR8ZfqGpv/dKY38n2zZE5ze7B1gI2v1v9ld8RlmoIuUzTkwrrCMhvmXWN4mYSDqFe1Tz06TyOMBg2zeUE0sDiZJY366RvC8EuFkIHjiLBig6PaZREze36zoYtmNI3X6NLlS7Xd86NpaDFvOcI1eYzHC4dWWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MN2PR11MB4630.namprd11.prod.outlook.com (2603:10b6:208:24e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 19:32:22 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 19:32:22 +0000
Message-ID: <5636fb64-e01c-44a8-a851-7bd575230afe@intel.com>
Date: Tue, 14 Nov 2023 11:32:18 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-10-daniele.ceraolospurio@intel.com>
 <0a3d8812-fb91-4e4d-b3f6-ae4af119cab6@intel.com>
 <6cd979ca-e5fe-4752-b3bb-dc99a0762c81@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <6cd979ca-e5fe-4752-b3bb-dc99a0762c81@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0222.namprd04.prod.outlook.com
 (2603:10b6:303:87::17) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MN2PR11MB4630:EE_
X-MS-Office365-Filtering-Correlation-Id: 974be770-2329-4d93-6380-08dbe5486c5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TtTen4Lra7cHqAPLETqbTeHbZqNcID9NqAgOXjITivCNmYwb0fIkV5xXKblIIJ52C8R9ye9rhRSvtxXKCIF1sr1OdlK9fdyPPHGwZRb/QBjtv+0eu4UO4Ax3oKtHIDtowAcsNskBF+qFrBflsLf3fANfPVVn8CrEYae+uzgpnBmtxiEDpVABXZK3GA15zp5aEqglO0IjGDW3Ax5yix2jShi2UgLUbthjRd6CZDx7njItzJsAExMKlw7yaSBXFAY+VfzA0DoRENZPFJ/qpMf7rDQ8kA1lcfd0J9o0x3hlqnGJkUe08uCTdTKPjoOeCVtU+uNrSo8uEkONYWw2AeAYwglgierI9kl/1DS9UiQxKZkGK4R9xU5dsEGHLaV+/uYGKmghaumh2Zl2VR8xcUwwhs/5GviO9dzKJBlTXTaFgbRIJaeK5H9fMCdIpuIM7wqmds8Uhy20Cpgg8LdJ09EGV3/cKpOjKtghSE2S9Y2hMFVQZcwrrwdu8YZHUmE6ht9yD+7edXRohS9ldMeClb/iyIgiFB+rBCSXGIfRDaM/2/lQTYOXq8cb4yKucuYGy62gzFAtMTcyW8CypynWM4/Fjh0kW/1yPRzVY1HvxjJfwTEhY6swgtuoBngcWBkmzlivBTWBCpEf45WY/ABQ2q9y6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(366004)(396003)(376002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(8676002)(8936002)(316002)(66946007)(66476007)(66556008)(478600001)(6666004)(6486002)(36756003)(86362001)(5660300002)(31696002)(2906002)(41300700001)(26005)(53546011)(2616005)(38100700002)(6512007)(82960400001)(83380400001)(6506007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2tzdWRHRmxrM1NjOU4xWGJXL1IxVTlYNFpxeER3RHZwN2FETVlvNXBPeVA0?=
 =?utf-8?B?Z2ZXbzlBZXNQclZuUExTTERqOTZEdVVuMXRyRTNYQlRMTHhZUUhsWHpQTEVW?=
 =?utf-8?B?bEpkYW1nQ0NtV0FYSGhIMXBRUzVtYWV0V3FienpqaTJLZW5aTHMwOGI5cGlM?=
 =?utf-8?B?RGd1dVdJRGhsMGk3UHoxRzQvWEZjWms3cU5IRG5NelhGRENFdjIzb2lYSVZs?=
 =?utf-8?B?L1NWTnhwcXZPQlZrNnpyNHZzZ29yS041SUs4V09jOVF5L1hBT25yWE5OWUcz?=
 =?utf-8?B?eXRMajRNUWxLNDJOQ2tib1Nid0toNWxzNGNZWEppRXMwZ2RmN2FLb2U2Vmg5?=
 =?utf-8?B?b0YrRlRMZzQ0c0RqMzdLSzM0L2FnL09hODgwZjBVZjc2Uzl0THh2V01VRlha?=
 =?utf-8?B?WXB6T3h5L29GWVFNK0t3OW5yaGFNU0ZpQ1JXYzFOckgrcFJVK0VsMmRwRXhs?=
 =?utf-8?B?aFpCUDZGRXNIM2JJeFFaRDNPYWRwN2dnK1JkdFZ3WFI4MXdERjdRS3ZVR1Qx?=
 =?utf-8?B?YjJjNnJ2V1VvTm4zNGl5NnVuT3VvK3FtUlA4WmZxRkcvSUdSdFpqcUZoQTNK?=
 =?utf-8?B?b1pldnE5aDRUc1RQNy81Nk1JNW1EdHdxWDRKWVppVE1pREZVVlhPM05Ybndx?=
 =?utf-8?B?MWZ3SEMxU29KcmFXYjRZNXM0bjMxNFpuQmUxakxRTHM5dSttVmE3K01PUmcy?=
 =?utf-8?B?bkhsTDBOZk0zU2o0T0JDR3pmU1htenZrb1pCTUlvV3VDVVE1dHFjQVVQWFRD?=
 =?utf-8?B?bThTVlFwQkFweVF6WkJZWUdOaXRaSW1oR3BsRUkxVHp6by84dDJwWFJVYjFt?=
 =?utf-8?B?NCt0V0tiSXY1cUxOR001eENqZkUrT2U0Z04xeUNzcTdVMDIydVdxT00zNmdH?=
 =?utf-8?B?VVNQY3FpeW03bTd3U3ptWXQvOXA4VEtSQkprVDJubWN6NWhGMDFQTksyaTUx?=
 =?utf-8?B?SHB5NDlEenBua2tQRmdYUHZHQkt3cmpldXR4UmlvOGUyL2hIL0s0WUI5ek5H?=
 =?utf-8?B?YnB6MmZsVWw5Ti82amdXS1V0Mk1uK0FPMmxWV1pGRS9sRmpyMFIrSVR1MS84?=
 =?utf-8?B?QTlmem1pMXE4RmE1UnJCOENQTC9ZZEhBQUlRY3htTFBHREVlQkVSay9qc1Jz?=
 =?utf-8?B?eWNDdEY1eTJZRHduN2FhQXpwV0JhV1FGZVlSaTNJM0MzZURjSHQ2YXZGdnBS?=
 =?utf-8?B?RE5HYnl3cE5mbERjaWZvQTdEWC9VQi9obE5LcG1lNzVnKzBiMGFnTFFZcE5H?=
 =?utf-8?B?bXpVeTNUS1RHbUord3RWaiszbFRIaGsxNVhnZ1dyK0NaVFZHVGMyVW56cDV6?=
 =?utf-8?B?V3JMeXcrVHMwSk4wMlNBMzZWUERxVjVFaWs4WExMRy9WdmswUFY1dGRnek1R?=
 =?utf-8?B?MGNEZ0hrYU5peHNRdGJhV0RKenZLUndPcHlubm9xRHlRVERnbjZ6ZHViSksy?=
 =?utf-8?B?cWlXMkUvM2I5UmVweDBZeTlCaXZ2a2pRUmRpVGtIaHhtTjNoL2t1VFNOZjZx?=
 =?utf-8?B?VENBdVdBRWRpb1Q1TWlUQ09LUVF0cnJQZTYya09vOXlYSk5BTnFBVVFHRGpG?=
 =?utf-8?B?MW40Mis0NWdrcVdNcDQyS1lTa25PWURIMkdUK1lnSW5VMktXSkUweElNVkRM?=
 =?utf-8?B?VGFYRnk4dTZQY1NNUThOU2puY2lLNkp3T3NEM2pIQjhpSlFsc3pQSW0xOEtS?=
 =?utf-8?B?U21NNEZMOHI1d2trSU1oRjVub2l3ZlVlMlEvMjlWSjNsL1pQZ1F3bjV4NW9U?=
 =?utf-8?B?WlowdlR2RFJURURuV2NiRHV6Q2RBOGpuejhRWWI2WW9Id05jeFBSaFZscVFx?=
 =?utf-8?B?cU1wd0pZNEh4cFI3akFrN1pyRjdNOHZVV0Z3RDVjUVNUa2RCSXUxSU9laDMv?=
 =?utf-8?B?Y3V5cGxQdzdBVENHb1UydTNrUnNnaWkva3RBWE8yYnhYa3N3WEpwTEYxRTVh?=
 =?utf-8?B?QTEzb2pNMjc2R3NZSnYyUXlSQXRIZnJSNkk3VDJRMGd0Z1VKWm9GQyt6c1pi?=
 =?utf-8?B?RWhvWU9NSklIc0lyMjB6Lzg2MlhqckxKTHQzeU1yaFc0Z0dRbzlWL00xem1w?=
 =?utf-8?B?WGlSdHZlRWpwT3NaTW90RndrRE4xOS9RUjREM0hudGpaZTR6OVhZaE5mMU15?=
 =?utf-8?B?a3JqY1Zyc2I5MWpWazhkYlQ4WVJZVm1FR3VjdENqYmU0YkdyZ09wd2pwWHdO?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 974be770-2329-4d93-6380-08dbe5486c5d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 19:32:22.3104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKDTlth9cMjcHtEcLIUylSmQW3/K1BQIw6NXkiG0vVoLJylEQegukGrJ4oehfFS21my5VzQlv0VwiKz+fTEbS8r/J3toMzZiDCyUZOmfHzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4630
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 09/12] drm/xe/gsc: Add an interface for GSC
 packet submissions
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

On 11/13/2023 13:19, Daniele Ceraolo Spurio wrote:
> On 11/13/2023 11:59 AM, John Harrison wrote:
>> On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
>>> Communication with the GSC FW is done via input/output buffers, whose
>>> addresses are provided via a GSCCS command. The buffers contain a
>>> generic header and a client-specific packet (e.g. PXP, HDCP); the
>>> clients don't care about the header format and/or the GSCCS command in
>>> the batch, they only care about their client-specific header. This 
>>> patch
>>> therefore introduces helpers that allow the callers to automatically
>>> fill in the input header, submit the GSCCS job and decode the output
>>> header, to make it so that the caller only needs to worry about their
>>> client-specific input and output messages.
>>>
>>> NOTE: this patch by itself only adds the interface so it does nothing,
>>> I've kept it separate for review but the plan is to squash it with the
>>> follow up patch before merge, so that the interface and the user are
>>> introduced at the same time.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/Makefile                   |   1 +
>>>   .../gpu/drm/xe/abi/gsc_command_header_abi.h   |  46 +++++
>>>   .../gpu/drm/xe/instructions/xe_gsc_commands.h |   2 +
>>>   drivers/gpu/drm/xe/xe_gsc_submit.c            | 170 
>>> ++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_gsc_submit.h            |  30 ++++
>>>   5 files changed, 249 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
>>>   create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.c
>>>   create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index 4a442dcf4d79..876c122ad63c 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -58,6 +58,7 @@ xe-y += xe_bb.o \
>>>       xe_force_wake.o \
>>>       xe_ggtt.o \
>>>       xe_gsc.o \
>>> +    xe_gsc_submit.o \
>>>       xe_gt.o \
>>>       xe_gt_clock.o \
>>>       xe_gt_debugfs.o \
>>> diff --git a/drivers/gpu/drm/xe/abi/gsc_command_header_abi.h 
>>> b/drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
>>> new file mode 100644
>>> index 000000000000..a4c2646803b5
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
>>> @@ -0,0 +1,46 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _ABI_GSC_COMMAND_HEADER_ABI_H
>>> +#define _ABI_GSC_COMMAND_HEADER_ABI_H
>>> +
>>> +#include <linux/types.h>
>>> +
>>> +struct intel_gsc_mtl_header {
>> Is this all really MTL platform specific? Or is it GSC version specific?
>>
>> Given that the reset of the driver is moving to be IP version based 
>> instead of platform name based, it seems like this should also be 
>> based in some kind of version rather than platform name. Or are the 
>> GSC versions all just relative to the platform anyway?
>
> GSC versioning is relative to the platform. As far as I'm aware the 
> expectation so far is that this header will stay the same for LNL, but 
> that's not a guarantee. Some of the binary headers for example are 
> slightly different in the LNL blob (but the differences don't impact 
> any of the areas we actually look at, so we can re-use the MTL code 
> there as well). If you want to avoid the platform name I can call it 
> intel_gsc_cmd_header for now and we can think about per-platform 
> naming if we ever get different versions. Would that work?
If the GSC team are saying that this is a platform specific interface 
then naming it by platform is fine by me. And keeping the name for 
future platforms doesn't seem like an issue. That's how everything else 
works - named by the device/platform/gen that introduced the feature and 
still used for future devices/platforms/gens until the next version 
comes along with a new name.

Reviewed-by: John Harrison <John.C.Harrison@Intel.Com>


>
> Daniele
>
>>
>> Apart from that, it all looks good to me.
>>
>> John.
>>
>

