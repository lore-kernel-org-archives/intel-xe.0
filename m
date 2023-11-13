Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06087C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 21:19:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C171610E1A3;
	Mon, 13 Nov 2023 21:19:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BF210E1A3
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 21:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699910363; x=1731446363;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IcZIds2hPE8Q3THc2GCVY/m2Msx248TrQlmm5KoMC8I=;
 b=QaQ6SBJDAs1UdEnsfNf6j5JsUi71zJywrBFVmWeuuuR+OxT61wet5l07
 j43lQyzKnsr73jPBuFsyETB51IsRpVIUuG/vii7RWy5xM+RIHaNO4fEaE
 R+OwsS1DxinT2q/IcnPoyIn0XIT2VE+/E69ZDD1JI9u8Q9qFqaAvuhJGC
 XHoVVu0R6hKuYOkoJ2jgQm8s6cHlbrNrHl6cqoc+dClzDtaUcaqNiD1xY
 S+s6a4chm5Cadhk0M+zyej8YjTVMzZZsKdEC6lYnz/58QZY8zBZRkFx8O
 Tzpq4tqbYbjshmqJ2wM4W7A9KuNKwWqYDYBvYIa15LVu9lpNYWWDNiL/W w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="394423268"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="394423268"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 13:19:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="740877009"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="740877009"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 13:19:22 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 13:19:21 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 13:19:21 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 13:19:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJ8Avu9RxBN76D63wnwEDUFtqkhfhVIhP1zTSjK+/tAJz5OAD3KcvlWZ8ObKf/wRtFt94awOFVJTY2FV+SCQP9ccD5d/vAtCF4cPimXUVLIWvr0wVeuThG14kDaUwQEpDdCBgFxDLuJYCUl28+NkqJFlMsbmlkppR3fYqTomL99/Q5vWKf6+WAjz/+/L8HWqjCVt5NlwrM6tdgpldwBGgf9K+ZvYDirkFb9Guh+5KAozxBoTPqSNG4ysQclN/Un4h1mU3N8kkmfAWWZ5Jm+TONsm7x+NQ3xzCPSJa5TcqybtIN9lM6GX7wteLVGLUUkZDsrbGb7l0OjEtBTC2v4dZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDSFdpygSrK8v9/Q8Ej3VYPMzH2vAjXT5PWFnbEBnTM=;
 b=TDUitaMPw8heFgE7PCVqU0iB3MWKAdVFVHSnRba4WsN14lyrn3sS9cMG/SL+Vdwhg65JceDD6EgLXfC2sNkWAwoGmKJq1j9c+FllaKmrfgFCgvO9+a6oK4Ja6/40QMbqeh1TUkkthSyGhhFuDiRS1k2S9CPnx5zkmbOefC7veKj9YdOQGae67XiNTpLX6vzUvjxbJc7N42yZBWzrn98t4EXhw/jLoDaEcSxy25XuLtlAspP4y2XdjewWyD2sbp2mbklye/KYSlzJUXJY86WmHmhr5p0jlwXqlw49tBtkvYLINCZJh5F1CqJ67l86/yz61fzYqt9GjEViilqAUAp8Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by BL1PR11MB5223.namprd11.prod.outlook.com (2603:10b6:208:31a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Mon, 13 Nov
 2023 21:19:19 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86%7]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 21:19:19 +0000
Message-ID: <6cd979ca-e5fe-4752-b3bb-dc99a0762c81@intel.com>
Date: Mon, 13 Nov 2023 13:19:18 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-10-daniele.ceraolospurio@intel.com>
 <0a3d8812-fb91-4e4d-b3f6-ae4af119cab6@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <0a3d8812-fb91-4e4d-b3f6-ae4af119cab6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::18) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|BL1PR11MB5223:EE_
X-MS-Office365-Filtering-Correlation-Id: 61076ac7-67ae-4206-f3c4-08dbe48e32b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o3emi1e0XrfXSUYriaUTq9BmLNZu+Qejxp9aV8Pqa/3tn51/VIe80jhkKiP8FqUPLXOK8u5lCLnbH08OYNjUejvG2gXvrH1sijZy+fAJNEm0KS393CAg08AQQC5Fh9t4+Sz/xxso14/P6dpret8O9w9JYaMqH8ZutdlgXrmB30a4Z3pQ6AabCPQDC9sm+UnnMhX19/J0MhkXdyjSuxauAnIQzlB6O9PfJIdRGEnUVsEL73+4iJU4BPa+x0odkZDYNViH0dxvIiDA3pTqYDheL9Tygkv7J/4VMsIHSzyhyxQ/o6HvSAFhlGiFNjzuk9HE4ZlBwVTiv3iJOP9mfAvNtLuJzy5SUmdMXMDPc9LURrGOV+CZcLFlfInsZO9nYWE6RLHcuHWSqtm2eXNe8rwRtNc7OH6rwghsNyfSkxBp+V+h6ZiLk6IXxiOSLTqw08Ft06RReP+s3753VKdbK7mG/4tTqbqH8o5d68CqUaTqcdH+6J7lYZOf2H9fzN2Ol+W7GbNqINpkIQWKZ66QcQ+XVDWfdd/vWc33B4wx144TbniVj6sKb7R7CAcNh2NjW1T898mZ2ksv53Y92qyHykUDNcP2NG3SW3eP3t/CgO38iPyqR4b1Usx/VtmCFkHGgBDtdxvhieqzkX9q3dIZX4ps0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(376002)(136003)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(316002)(66556008)(66946007)(66476007)(478600001)(6486002)(86362001)(5660300002)(31696002)(41300700001)(36756003)(2906002)(8676002)(8936002)(2616005)(38100700002)(83380400001)(26005)(31686004)(82960400001)(53546011)(6506007)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDJ1MGZrWjBQWmJDbnpxMUE4RlYvaUFjRVlCam5nVDNzT3E4S1lKeEQ3dDI1?=
 =?utf-8?B?TEoyamw2YWxQQXJMYkhjV2NCVFltajEvVVdrY0pwQVU2MXFtUGlmOG1tTGI5?=
 =?utf-8?B?K2hiTndrMDFBRFZ1ZWVkY0NKc2dtd3VWMko2UDk3c3FaSzc2NkowQkg1Q0RY?=
 =?utf-8?B?bFFSb1Nkd1BsU0hjWkc3RXVJcFJocDR5UEdNZldqU2NONUVrM3N3aTBVNWZn?=
 =?utf-8?B?UEhyK3RWcDAvYWhVR2N1T1djYWdnT0VkTFlJL091V2dGcTk1MFN1QkVId0c3?=
 =?utf-8?B?MXFDc1RNNURRWTg4SGZtRlZZUHN4anlpQlZLTld4YkxNRWFKeW9qZzhDRU85?=
 =?utf-8?B?dWJrdXJ2UkxEZEF2VEZ2TnRYWFZFMGl2VGlldHBGQ1lJeTBkVjlxRmlXa3h4?=
 =?utf-8?B?emhnanZteUd6dE42TmlyTXBjWWJXSDlmWllHZGZ1bUZBUmVldzh2c1lYakVs?=
 =?utf-8?B?YUdGVHN4UTA2VmE1cVlNRGJrZDlwSGNRczlBemNOaUtGaDV0eGl3cnJQSTdw?=
 =?utf-8?B?VXB2MWpLUkFzYkNndnBzNVBoWHpoVFBxQXc4U2VMNGxOZ05GdjNtU1NDMS9K?=
 =?utf-8?B?UVRlSXV3cGhlbHdkTGhjRlRIeFJOZEE5QjRMSDF2Mk1SVGY3VEdDV3B4ZDU1?=
 =?utf-8?B?MDRPcG8yT2N3ZnJhcmkydFRYMk10Vnc2UndYbTl5eWdNRnBWUjJVc2c5d2Mv?=
 =?utf-8?B?WmhSM09lclpWZThrOEF3bS81eGJkcDhnV3ZNQnZpWVJSWW1ZRUd0TTdnaGc2?=
 =?utf-8?B?SVhldldDczlCemlad0hHeWovcFJ4SGIyK1ROZkdXZy9YdVN4RUlWYU9lR3Zp?=
 =?utf-8?B?a0d6QW1VL1UycklQUUpyK3ZEWkY1dGRBV0pVTVdMTWVWbzgyVzhlaHMxZ3dj?=
 =?utf-8?B?WURSdHZxREd0WWNqTWVrWnRKWGMrVDRSK2tPTWo3NXJ0bU5uMTdIcXhiT0JX?=
 =?utf-8?B?RVFCc0hhUCsvU0MxMGdZTCtlRytGZlR3ZHMreExuR2Z6Q0l3OXpHMmh2RExm?=
 =?utf-8?B?dUZ6ZndvM1BUYkMwUlNoNyt5bGtsYTdVbFdKekVBaEJxSkpRSjQvdnVWaG92?=
 =?utf-8?B?c2pRWGpqenlDQTByZjJQVnFHeGRNbTVDMFpKZ2M5d0llVjNCam94Ykt5SEZv?=
 =?utf-8?B?dzNvOXNacFl4YnJFVEwralhOUGVVQmNXNmxXczU0UnpsNDRmY1JZZ2ZXQUxI?=
 =?utf-8?B?eU90V3RqdmZUSStHMEplOEFjUS9LK0M2TEJ0TitZYkd5VzlQRHZiZUhFL0ls?=
 =?utf-8?B?RDdIWDBVdCsvUWdqQ3FiUlJzMnNsWkx4MEprUE45SFVmWlRBZmgzc3ZDZ0w0?=
 =?utf-8?B?NTNzTmd0dlMvR2x3SUtBTG9zcW13SHJtV1hackNrR2NPdXF2cmVzcjJrY2Fu?=
 =?utf-8?B?M0wvcmpBZUFXV0V0Y0tXbVdNdUFNVVVzRCs5eXVVOStEOElLanhHTlg4ck84?=
 =?utf-8?B?dk1pK0laOTBxM01maHkrM1FNaW9Ya0xxNFlRV3ZtNXl2LytIRzhJbkpVWjI0?=
 =?utf-8?B?LzRTYTlza1NkUWZZa2hGUG9FL09KMzNCcVhKeDRWS0w2VnYzTVpaWWh4SGxT?=
 =?utf-8?B?ekxhOU5zTzVJdlFsTC9uM3ZBWFFjVllWSVFoWG5IanNpa0hHWlNBcnZERXd3?=
 =?utf-8?B?SmExaDBvUlVKWEMzRlJLd2tFdmx2Qm1sd0EzNWswOE1uZjdBR3NyUEZPdHlZ?=
 =?utf-8?B?V3FKL3VFYVlHSXJMeHRYTTdQTTNqaW9KTi9uZGRNQlFJWFBSK3RtWG54elhG?=
 =?utf-8?B?bUVqNlRiM1pWS1pHOUZJSVpZSmlhWGRoMmxZQU1nZ2dFRkhGcFNaeTU2eTIz?=
 =?utf-8?B?S2ZSYkRwWTMrNmxYOUNpSzBESnE4Mmo4cjNncGE4WU5QSzkxNDZ1UHlpanAy?=
 =?utf-8?B?YVlaSzVTaS9hZU1OeWhrekZyL0JuOEF1OUdmWkZTbTcvREg4MUZvakRjeTQ2?=
 =?utf-8?B?RVc4YlMyTVBOK1lIeGlBaVRpTFM3M0tVSTN3dDhaaEEzT1p2MTYyNTJwT09v?=
 =?utf-8?B?OHRTUytZd2ErUjFTYkVaTmtqL0tFZ3hlZFVFVWNZeURMTE9LUzFQa2IyTDI4?=
 =?utf-8?B?UEZ0L2FPU21mZEpWdUxSOVROVzgvMldaMXZvL0Zabzlob2hpL2hnOXhmM3ln?=
 =?utf-8?B?MFoybFVCaCt1OFV4UDQ5MEdTUmh1eGUrcUJDN2cwQ1NxVmYzWjU3WU90YXBV?=
 =?utf-8?Q?LR1O4QMvo0T8baQWBEV5ktQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61076ac7-67ae-4206-f3c4-08dbe48e32b7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 21:19:19.1717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTC30cxcqbB3RbEtjlt33ynntEt4o8y/3zaOnsKD7ZhbMEsBtCL/+58FdNnuOfpLHA/Aa47aFMBmZJ2wKh8HMqB909HjaJtL2KiKgErgibY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5223
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



On 11/13/2023 11:59 AM, John Harrison wrote:
> On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
>> Communication with the GSC FW is done via input/output buffers, whose
>> addresses are provided via a GSCCS command. The buffers contain a
>> generic header and a client-specific packet (e.g. PXP, HDCP); the
>> clients don't care about the header format and/or the GSCCS command in
>> the batch, they only care about their client-specific header. This patch
>> therefore introduces helpers that allow the callers to automatically
>> fill in the input header, submit the GSCCS job and decode the output
>> header, to make it so that the caller only needs to worry about their
>> client-specific input and output messages.
>>
>> NOTE: this patch by itself only adds the interface so it does nothing,
>> I've kept it separate for review but the plan is to squash it with the
>> follow up patch before merge, so that the interface and the user are
>> introduced at the same time.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile                   |   1 +
>>   .../gpu/drm/xe/abi/gsc_command_header_abi.h   |  46 +++++
>>   .../gpu/drm/xe/instructions/xe_gsc_commands.h |   2 +
>>   drivers/gpu/drm/xe/xe_gsc_submit.c            | 170 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gsc_submit.h            |  30 ++++
>>   5 files changed, 249 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gsc_submit.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 4a442dcf4d79..876c122ad63c 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -58,6 +58,7 @@ xe-y += xe_bb.o \
>>       xe_force_wake.o \
>>       xe_ggtt.o \
>>       xe_gsc.o \
>> +    xe_gsc_submit.o \
>>       xe_gt.o \
>>       xe_gt_clock.o \
>>       xe_gt_debugfs.o \
>> diff --git a/drivers/gpu/drm/xe/abi/gsc_command_header_abi.h 
>> b/drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
>> new file mode 100644
>> index 000000000000..a4c2646803b5
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/abi/gsc_command_header_abi.h
>> @@ -0,0 +1,46 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _ABI_GSC_COMMAND_HEADER_ABI_H
>> +#define _ABI_GSC_COMMAND_HEADER_ABI_H
>> +
>> +#include <linux/types.h>
>> +
>> +struct intel_gsc_mtl_header {
> Is this all really MTL platform specific? Or is it GSC version specific?
>
> Given that the reset of the driver is moving to be IP version based 
> instead of platform name based, it seems like this should also be 
> based in some kind of version rather than platform name. Or are the 
> GSC versions all just relative to the platform anyway?

GSC versioning is relative to the platform. As far as I'm aware the 
expectation so far is that this header will stay the same for LNL, but 
that's not a guarantee. Some of the binary headers for example are 
slightly different in the LNL blob (but the differences don't impact any 
of the areas we actually look at, so we can re-use the MTL code there as 
well). If you want to avoid the platform name I can call it 
intel_gsc_cmd_header for now and we can think about per-platform naming 
if we ever get different versions. Would that work?

Daniele

>
> Apart from that, it all looks good to me.
>
> John.
>

