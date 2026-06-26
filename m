Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1758CD4F26
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 07:41:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC8910F45B;
	Fri, 26 Jun 2026 07:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INeZT+V8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E411D10F45B
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 07:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782459702; x=1813995702;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NkEtaTPmIyKCjMdOxuRAzNRliWcTDxS99waUczbbCSs=;
 b=INeZT+V80KMhiNzTzATDJ86LivwZN1DYFquoqPn8DLUypz25hJonabKY
 q4meu20i7AAtSBytsUjafT8a1wLJCKJqY5Wnm0cE9kon2bVLTbAD8gz5X
 S9xLoM1K/lkFE7ONAfvjGm8ZHT+r9dCCvj8ftffiZuQAd9zSwFXz+64QM
 YN1Ctf0QaIq9Xqsf0FCq5irL8Bin5Kvjc7bedsFCfWnCIqOkPoZcIZcC7
 oC4Y1JXFCjkty+QMOueEz8hghHjyMhthIRh4JpOVvELAt55GppsV0cuPz
 szpmlP2f53SSO6q6Sc+MRmocgJ6k0dK+CVII1sLNA0xmvpoRLLnKnevuB Q==;
X-CSE-ConnectionGUID: sSCvqPHlRwKa+vw+tKbHkA==
X-CSE-MsgGUID: OeYMK5ecTEOmv7X4bV9WQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="100802091"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="100802091"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 00:41:41 -0700
X-CSE-ConnectionGUID: ony8jp23R2u4Rtt2EKuenw==
X-CSE-MsgGUID: 3CMLA8uaQwOpdEHos2mhtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="281350283"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 00:41:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 00:41:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 00:41:40 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 00:41:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3xMlA83mh3DmUuZxqNTkXh6vPXmifeHjcu7/PkEXwdYiAED8KmISy3TO9lb38Dx/SlttJYTXAP8TMtgbLHfot2AH/AxLClcfWhDkHUVB1Wd0IdvXQRcl1JLUDg60I2HWaJZ9bwJkrkEIwLrOEu06dUJDA/4RcudW6sFGWsPV8b9hXen9SG1N2V0y1aGJUHgvfv4MVJFM7BbuG0277i3uLAHaPCRlYOa50GO7NURrfCFOchwdsk5uHGRt5SgKBZE2QFURIjk+g9Mk0eFpTlPkEYHQVF3kljI59ZGPrVM56UX8B9NVR7VXQQqp9edf7/NDM53jM+dt8xVER/cJ6mzzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iYo/UiDdwdVrRQf19CtXLeppTYJzUsNdLRxe0O8rkc=;
 b=nBWvYw64UhLrQp5HCXpOb+QMCmZ4rB7NaaT5ihJBCpVEpKbP2Ce9AQBjghzfXq6JfpOhPS0wtmrEiGDzMbJB/zsWWDNPDmKO8xyRoVb79tMh+PUdXHLNEKUrKduF3WZtbr5cBJWpBfBZitfttBHU4GYQXRxKiH6+JAOuaUibhA421QVh7H4/G9G+66DhqT9sktJp/9GODm0I2KtU4XW3SXcAPQUc1OfyaCetSe2aKDFKFa9S/XmkSJcxEFZCa8XjGNQrJepDSKTKJdE/6QCmR8WyKilNMgRAtQj/gmwSdsC2HRsgEiz2TLOltszAmXAuOEEkxGFQb65hET+qBTAxUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DSWPR11MB9953.namprd11.prod.outlook.com (2603:10b6:8:39e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Fri, 26 Jun
 2026 07:41:33 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 07:41:33 +0000
Message-ID: <92dd345b-5b71-42a9-817c-39563d862fa9@intel.com>
Date: Fri, 26 Jun 2026 09:41:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/pf: Do not return an error for unrecognized VF
 events
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260624095634.1250956-1-michal.winiarski@intel.com>
 <13a16602-9bce-472e-a89f-d205f0d2afc0@intel.com>
 <2fb6ee84-c5a3-4889-ab42-93e84e6d9694@intel.com>
 <0ddae88d-04bb-4b97-933e-cfcf873a3750@intel.com>
 <eb78960a-070c-4c69-8efe-f94f1930303c@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <eb78960a-070c-4c69-8efe-f94f1930303c@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1PEPF00005B7B.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::613) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DSWPR11MB9953:EE_
X-MS-Office365-Filtering-Correlation-Id: a9ce013c-4fd0-420f-724d-08ded3565818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|11063799006|4143699003|56012099006|6133799003|5023799004;
X-Microsoft-Antispam-Message-Info: uHtcGoRAY+j06/qjcqHDDoKRkTR8moZCbhojRzSmXfh/NsO9SLHPf9mp/ORNaMQsHPC+KyR+0HC3ze+ZBD5YsnuTTgQnk2+EwLTtJv5TlvF/oCiovnr5JVwCzeyONp9w95lclW3Kb7bO53y0/QntZjksadphFvu/dEjtnN3AXjI6MxfeZ8C99FwledhJuSyDyOVrEnZcPXSTCNY1gF7g5lxNSXYl8iNTmCyq1YylKR/P+G3Nam5SJyYwMgrEa+YGW+Wk/Pg+Sl7Vw5l9ZJlhWj0Eqkna7WS7nezFRbuBJb1SMkQqag7OqLlgnp04wd3s3oPCQszP8fBnfWtWtRWXvzOoK6kLkKwxK8RZQQ9rYvNbMwe1ML3n5u07qHVSF1j6Sh6mhEhr96XDNblu96A6nFR37UjlOCExgljeklpRb/+Qqxovij231DUkTIhvyzHNVaFmftQOIvPl2MHeXIAvzrvwTjckxfPaWrsHQfDMFTN8GLhHud2cmH3JHVIqVqA7tMWXQXVoguBAgW9QTBDDCFrs+FxLc4oTjoXY8IrdiJTmP0tXSLy/AUT6LXUmhco1eiF8EdhtjevQwezfdbTffK5xzjhDR3//O8+0x4vBgj8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(6133799003)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wkl5eFR2dW5IMTJ4UUIzNVFBMHlFWVNsVEh1Sk5QYXljN0VaQkVLejRCTHVt?=
 =?utf-8?B?OFdzT091WFRVUGlUTGJTTFcvNGl0SnFQd0gxK3ZtWERqL3VRUXo3aXR2T2RR?=
 =?utf-8?B?M21QditXVFlSMUhvUEcyVEhPMEhWbGsvL1hGMjFsaTRDaTNlN2lCNi9CS1Zw?=
 =?utf-8?B?SUhja1g5cUYvL3dUeXZ1VjlPS3hxL3Z5R29xNEVjM0ZOYmVZNWc0bmpUNW1w?=
 =?utf-8?B?QjZBc29USUpBelZrbDk2eGNmWTJmaFRkcTFzOXFURXUzdEJjRzBjTElSbEY4?=
 =?utf-8?B?TmVGcnJzVlZaRXhKRG55Sm5CYUx3YWZtNUkraXRtOGk4OGdyL3U0bW80Vk55?=
 =?utf-8?B?ZVB6MjNpeGd5aFRuYnJPUUN1eUc2NUFOTkVnZnhMTDM1WXVSY1kvbmFjRzVL?=
 =?utf-8?B?RGdWWE5Oc003Tnd1MVZlUmpncVlvY3B5RUY3L0N1YTE3U0VkK3ExYmxEY3h3?=
 =?utf-8?B?L3FxRXZjUS95RFA2L1Q0VDBTRWJBNjNGbmZrbkN2VCt2eUpnUVhuUmxFSVBV?=
 =?utf-8?B?WVBxOGs4Y2xIdDhkL0ZLenhHTU41ODRGNis4cXpqY1dsREhBT3ZyR1ArYWI3?=
 =?utf-8?B?RzZ4bjkrdTJTeFBlVVdsYzlmNWpuaFZkam9yamU3dkhJcG4xekhpT0tUQWc0?=
 =?utf-8?B?bEZJQlA4bmJFdlVGWkwrTko4SjZyWXRRLzlYZTVKajFSd1dLWnYwZ01Kc0JC?=
 =?utf-8?B?WXNPbVlVOWVrWUdmSDREMXd3Mk94UG1VUG11b2RJUm9xK3c0TGZMb2JhQmxK?=
 =?utf-8?B?N1dQNWdUTkFSL3NVd1YvaVZFbmsveCtiVjViVjlvTFYvVGcwZkdENFFrQkFo?=
 =?utf-8?B?aGh3V08zTndyaTBybk9sOVNob1JHTS94T0dpdjVROHBTWWthMVZlRmNQRTI5?=
 =?utf-8?B?UW9NdU02RHdkcUhUdXZzMlVMNFFJSk5SOVViVENKZlRNbWZ2N3BzaDZNaVh4?=
 =?utf-8?B?ejUwQmtsVUpuaWF5eEtxcnQ1SDgzTHlJOUJEckNNdmc5aFBDcENneEdsbEZ3?=
 =?utf-8?B?aXQ2RzNTWXRscEdiT3hhTFBsaUd5WHNQK3RyY3VKNEh0bUNQeGQ3NW9qa1ZG?=
 =?utf-8?B?WTRseGJ0NUhXaG0vSjJhWE1OQ2llazFNUmxaTzZaMWR3TW9wbEhtN0NUemIz?=
 =?utf-8?B?K0t2M0svbjJxNlV3NmZjR2ZwNGxzYjRxK0NOa2N3eHFyc2VGL2RzdjRBQlMy?=
 =?utf-8?B?L0ZVVmFtYjZqck1Mb2tpOTFDVklaczJrNFVaRWh5VzRCcU9JNHYrbmZacStI?=
 =?utf-8?B?ZjJwRjFVOXR5Z0JqRmpYWEZlYnBBQ0NnM016UTFjZ1pkL1pNemxZd3VSWDNP?=
 =?utf-8?B?SnJ6aUdsV0dTaURBeDdwNE53Y1gwUE9mbjBDQ3p5S1NuZVJGV0NSeUMwZTlh?=
 =?utf-8?B?bmF3K2R0dldSeEdmd20zR0NrMHpZUzhsVVV1RXRWeXJVaWxLQS9wV2Y2SzJu?=
 =?utf-8?B?d3FYbUwyK05jTE56WG5OQjQ0NXFMaFpmTk1BMXp1QzRzNCsxNEttN0ZrL21J?=
 =?utf-8?B?dzFaTEhKL3FPTjAvT010TVArRWVKam9KcnhuMlJTOVV2YTNwSVB4WTdCa0gy?=
 =?utf-8?B?eHltdEIvaHg4M2RqeG0yMDdHckNSODNkWGI5Zy9RSnJFeUFETy9iM2VsTTd0?=
 =?utf-8?B?R3pMcllTS003cFZKRWhRUjNuTUlVVWUzMUhOZW1KOGV0eVV4V2trcmpoZFVz?=
 =?utf-8?B?dGxkczdiYXdUTTdHTzIwZGpHcmJjRmZzOUx3NWNxL2hodllBbVFxN1Z4eEFl?=
 =?utf-8?B?eUNMeDBXMlM1Z2k2UUxEQktDOVdkMG91NTlPNmVZS3dqNzNMd1FSWmNpKzVT?=
 =?utf-8?B?eTVFR1dWQ21lOVRWUzR2VHkwRDNINnRVVS9ITkYxY3hCNTY4eEFzMW9ybmFl?=
 =?utf-8?B?VTczUDljOUlWc0Uwdm9PcUhHOGpmaGpyU01FQ0hnNVdFOUtwNTJkWkdwQ0VH?=
 =?utf-8?B?SDdRM002QnNBOE1LT2w1OWJKbW1zRjJpYXFGQ3VoNWhhWXJaM2tjNndwVUly?=
 =?utf-8?B?emJsMXIvaEdxb1lGeFl5a3Zjb2pWclI3WDVJZzkwc0JwdS9NVDNIZ3dkc3kw?=
 =?utf-8?B?QnBPTGUyRHl1L2c1QVVHK05WM3VURkU2Q0kyRy9NWGcvSW9pRHFOblZqNkpy?=
 =?utf-8?B?anFGNXdmMnNnVHVTMVB6YndsRDFaWHpwb0hMUktLNEt6MUJpR09hRitad09T?=
 =?utf-8?B?bFlrekM5NjBiQXEyMnc1clhGVExnR2REZWNKdGFmZ0Evd1dVWm1pL3Z2S2tO?=
 =?utf-8?B?V3R4cERSVVdNUkkxeDdRM0pTdW84L3lmRmt1NWhFdkJDL2Y1R2tsd1NrV0th?=
 =?utf-8?B?N1dqVkhFRi9sVEdDVTc1cWpyaHB6TDI1cTRNTFhab2dCZEZ2V2ZYRzVJb0RY?=
 =?utf-8?Q?OLLENB10gSOuX3xs=3D?=
X-Exchange-RoutingPolicyChecked: PF3aa1qCA+tKUqA2HWGCDbZJjVmjAHKoKq8FCXrtCFJP6cgrDpf46xSAYSV0U337OSoBYGgMf2tpiMxH6xvmshHS5yn+bFt2lRY7/UdJ/yBNlJKlCzmU25b/f1hFgFzvy0hi62JBh1lEx/dvzGacO8JuM+YXJW9wfy87DR2yAoQV6j1UCbJSM1hbXuiTIKbaJqHI+ZAJj9KaGJ2XL9odEvzy71d0CjFV01we75w5j1jqhZCTsX84E/bploI8q2lN4botMjnlJiLIKKo0kJ8B8XC8AAp5Zt/3LjiHmOZlzZ6CB4jxaLO6bwdZKkm1WR+NAz3HEI654AaKoWsyxgtDng==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ce013c-4fd0-420f-724d-08ded3565818
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 07:41:33.3559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+PPzGlF9trSP9GqO7WjmMaJVfm54Nvqz4DXYhuQWBhtGwEyz1ULA15Vtcqa3RuslEjqfxNcZUTpXdtveGuyIGNOdchX7/eUOqif8xLlbLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9953
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



On 6/26/2026 1:35 AM, Daniele Ceraolo Spurio wrote:
> 
> 
> On 6/25/2026 4:03 PM, Michal Wajdeczko wrote:
>>
>> On 6/25/2026 11:42 PM, Daniele Ceraolo Spurio wrote:
>>>
>>> On 6/25/2026 2:21 PM, Michal Wajdeczko wrote:
>>>> On 6/24/2026 11:56 AM, Michał Winiarski wrote:
>>>>> Notifications about VF state are generally not considered critical
>>>>> enough to warrant PF GT-level error
>>>> hmm, but without that error we risk that we will not notice that
>>>> we missed to implement handler for such notifications
>>>>
>>>>> and subsequent reset.
>>>> hmm, actually this could be our "problem", as initial idea of returning
>>>> an error from the CTB event handler was to print the whole CTB message
>>>> for inspection and later we also added the capturing of the GuC log to
>>>> figure out why this message was send and if it is legit, all this done
>>>> by triggering a reset to leverage existing capture mechanism
>>>>
>>>> maybe we should change the CTB code instead and trigger a reset only
>>>> under a debug config ? otherwise, if somehow we still have some gaps
>>>> and GuC will keep sending some unrecognized notifications, we might
>>>> enter an infinite reset loop
>>>>
>>>> @Daniele, how you see it?
>>> The reset is not there just for the capturing. Our assumption is that we should never get a message that we do not recognize and/or can't process, so if we do get one then something has gone wrong; since we can't be sure of exactly what has gone wrong, we do a reset to re-initialize the state and start clean.
>> but after this 'clean start' we could still receive that unexpected message again, so we will run in circle...
>>
>> if we believe that there should be no unrecognized/unexpected message, maybe safer option is to immediately declare wedge?
> 
> The bad message loop is not a likely scenario, so IMO it's better to try and keep going instead of wedging. If you're worried about the looping, we could add a counter and wedge if we get X (3?) unexpected messages within a given time period.
> 
> We've had a few issues that were due to bad timing, for which the driver recovered just fine with a reset. For example, we had a bug in i915 where we would in some very rare cases send 2 context enable messages to the GuC and then get 2 replies back, but the first reply would clear the pending bit so the second one would count as unexpected. In that case the reset allowed for a full recovery and I don't think wedging would have been better. This was very rare (showed up in CI every couple of months or so) so it was extremely unlikely to happen twice in a short timeframe.
> 
>> or separately treat the -EPROTO/-ENOPKG errors (wedge), vs other (reset/capture in debug, just error in production)
> 
> I don't like the idea of the upper layers acting differently based on the error code, that seems very error prone to me because the handlers are written by a lot of different devs and all of them would have to be aware of the difference.

I guess once we properly document that it shouldn't be a huge problem

> 
>>> Note that the addition of a new unsolicited G2H message to the GuC interface is considered backward incompatible, so the GuC usually implements an opt-in to keep the compatibility (i.e., the G2H message won't be sent unless the driver explicitly opts-in to receiving it); a recent example of this is the uncorrectable error notification (https://patchwork.freedesktop.org/patch/732697/?series=168465&rev=1).
>>>
>>> If you think that we shouldn't do a reset in this case, then this patch does the correct thing by processing the error within the handler and not escalating it. Maybe we should make the message error-level though, so CI will flag it?
>> the sooner and louder we will report the gap (wedge) then less likely we will hit that condition in the production
> 
> CI will flag both a error and a wedge the same way, we just need to be careful when assessing the issue.
> 
>> IMO reset should be triggered only when we are ~100% sure that it would help and it's unlikely that we run into the same situation again
> 
> The issue here is that there are cases where we are pretty sure the issue won't happen again (like the previous example) and others where it might re-occur (like bad programming), but it'd be hard to distinguish which is which in code. 

it shouldn't be that hard to write a guidelines:

if the CTB data is lost (reading all 0xFFFF's) - that's a FATAL and we should wedge (and this can be done within CTB layer)

if the CTB data is invalid (missing message data) - ok, this might be a cache issue, let's reset and see

if the action is unrecognized, that's FATAL, reset unlikely to solve that, IMO we should also wedge (and this also can be done within CTB layer, no handlers involved)

and the rules for the handlers:

if the action is known but the message format is unrecognized (too long, too short, field out of range) that's also fatal IMO (return -EPROTO to force a wedge)

if the message is legit but it comes at unexpected time or has unexpected state - handler can decide what to do (ignore or only report an error locally and move on (return 0), or trigger a reset with the hope it wont happen any time soon (return -EINVAL) or treat it as fatal (return -EPROTO)

> I believe the current approach is a good compromise to avoid over-engineering, but if you want to spend some time on it I'm not going to oppose it :P
> 
> Daniele
> 
>>> Daniele
>>>
>>>>> Convert the error to dmesg log.
>>>>>
>>>>> Reported-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>>>>> index 058585f063a93..65f015d0ede51 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>>>>> @@ -1973,7 +1973,7 @@ static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
>>>>>        case GUC_PF_NOTIFY_VF_FIXUP_DONE:
>>>>>            break;
>>>>>        default:
>>>>> -        return -ENOPKG;
>>>>> +        xe_gt_sriov_notice(gt, "unrecognized VF%u event %#x\n", vfid, eventid);
>>>>>        }
>>>>>        return 0;
>>>>>    }
> 

