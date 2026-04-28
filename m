Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDA9FF885D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 08:24:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BAF10E03C;
	Tue, 28 Apr 2026 08:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AynSimGy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9BA10E03C
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 08:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777364668; x=1808900668;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eAaEaKt5FzmknKSj9BNmqUpASdBBrEkuIObXwSoW0hE=;
 b=AynSimGyJDfJ8OFOIHaf+fw1lgYYB6G+MYawRWuRElTh8lCRnE7Vr+nw
 g/PO7+aaP2XSJZuZdU2CGcjEj8rOUVa8OjXVKv1aqqMrd3gEtT3EuXjwG
 KfPcoQxQ+tOHAByQdv7wgVAHluz9SaRpKP0mh8pdUeGEyFzB5ToMdE3O0
 SAjnLcvxQVNOlgIn38P+oboYgfQIFQfecx887zimchf6BO2nAqWGuwyyB
 Y+DiawdmW90lZwQI84pQ4QTHFJzWSxn6vCq9qUbMUeiiETnpRBWuNTloj
 Lc5jy2YGkUsTgiuuaxBczUUH+CI6DZL37iJxBcFKg7/9nfmCbLvX0WamQ g==;
X-CSE-ConnectionGUID: y3CoRJ4VRpK1DyS1Y12VVg==
X-CSE-MsgGUID: rr/dUdPyQd697c1feboXTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="89726435"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="89726435"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 01:24:28 -0700
X-CSE-ConnectionGUID: KPRJAPxjR42sl9Xt34qwOQ==
X-CSE-MsgGUID: dFZ/pUeLTsGHZwijIJD92Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="238225565"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 01:24:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 01:24:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 01:24:27 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 01:24:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Co/4hDk5tvDNY/j0+dZjiLLdtJB1gt8+jQY5CF+nXaMGGHYrK/muH+OwfC7Fe/Qwuo8cn5PcOk/VDMn5NzsT2p7uk3J281UFWGZff1t3atwv5rsTbcn2F8ufS2o5EE4+PHHSgdJkzuwAuxLEjrZ3uHXekvIDtaK8gr/EQMc+srQ2+ADb7inWMfDqkn/AifWOhHJqNv/Xs6U/AohVGKr08NCsIHPbMQcyPae5DeeQGyAfqX7ZklXz5tnQZM2A/+HKvVd8xvh+UT1cqVYxTQqTj3vLOaCZHLrKjnXSrz/klqRenSDFLbJQvWajWK3QqiHFp5/NLE1S+cRHZH8rDph4sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOa7I2L8ocSLUYSigVKwdHxYcv1ATHfY7XzDmbuccAM=;
 b=bmraKxqFC6YAl6Vc2W2h3iqlZ1sCyktrdGiUsgj+ES0TD+yZvgVhG6tlbo4oI94uQGBSRdiYMVih29g+yJj20O8suJ/YWxGZbELq81WtgJOyLh+K1ZSEE1TWbWKByqr3VJ2zt2oan7avI6X8FB6nIbaosb2jczQM62xsasvlhL4EIA36ML5ShZqPAjT/BgaDZPnBJBLGMwRPFmMhCROzbfgOPaxuCNr6fv2mMuU9duI0f0ODy6dzVozM0P1L6CUxC54jgzoR/5dwvP3GeNkODvApAMuE2xPPrg+cbjVq7cbzkjHSAYd5FyI9B74QV2+kzLUzfkCZxhX0mK2/TMktYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB5158.namprd11.prod.outlook.com (2603:10b6:510:3b::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.22; Tue, 28 Apr 2026 08:24:24 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 08:24:24 +0000
Message-ID: <f9b1624f-543a-45dd-ad02-6a656999a1e3@intel.com>
Date: Tue, 28 Apr 2026 13:54:15 +0530
User-Agent: Mozilla Thunderbird
From: "Tauro, Riana" <riana.tauro@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/xe_ras: Add RAS support for GPU health
 indicator
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <andi.shyti@intel.com>, <rodrigo.vivi@intel.com>
CC: <anoop.c.vijay@intel.com>
References: <20260423173925.699486-1-soham.purkait@intel.com>
 <20260423173925.699486-3-soham.purkait@intel.com>
Content-Language: en-US
In-Reply-To: <20260423173925.699486-3-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB5158:EE_
X-MS-Office365-Filtering-Correlation-Id: 620dabf9-b059-4bf7-27c9-08dea4ff8e36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info: /I90Fr6un7kV14YRvxhYVSIC2PRQPZvx27sqo5o0X3oXsHiSdymuxvXVtapeI+6kE/oaUUa8poOWOLaMoihvKh0Ve135DmCHORP1EVJp/GV9xEvRaSNuQmnYD4tKTiWgBNuPVNvHvpHhrjhlrdLIR2vWj1HGJ54dGPeWMPZkb8mMDW1wkXHY+mDJB96gmUesgLyGHNLJ4H1UcnDQK1O/j7SqRFCme1uip8OTNPxWNgoiB/Y5NXFSMP8t3xaUjQrwZ8KaU77SsXDCAMdrVNKbnnPr017TZjNxprFgeJU96nkmx02dSMFUnItmnh01Rax877lDkXtIuCM3vE8AL7e4QTTrp8clqLfyPzuAoITIFfmkO+EZSu1X6DXmuPhXSRfItXLMK7y8jirq20V0/zXlX4bqT3P/T+AvpwctZcvPkOm92Zo36RuaL+MvZm7VyX1C3FWwjvV4VO7FAOetEcL0wDGPZhRYjAqdHoovG5nFCF/LjZxn5jvxP7Fqg7+b3wLNzT/mn6Jiw01q403OrJNeiAnd4d/sQ347QcCkzu50uMuzwD8DzrQd5eTseNL5nfTUYELh5365jjK7aNcWkodHhKfEfFuRWlo85rVuR+c0759ns2A7Sun+p8Gl81CggVdXD+abWCz4IwPS+Ui7ATweM2MaKUh6imDGY43DbiK8HbdXJeOvxfbA+NwR8UAYIPdPInUk8FdiKrVRW9m/fARMLUlt8bSmDF3MsucL0bkMbnk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(921020)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjNJK3o2K1FqeVZNaEJrd3AreDEwR1h1NGZQTENyQnRuQzREaEI0K3l4bHZ2?=
 =?utf-8?B?STJFMXhFSCtHK1JNN05XR1hIbU5RaGluQ2JsaHJHWEdXR1lZcWEzRnZSVDM1?=
 =?utf-8?B?Q25kTmFXMkFWa3ZNNXlJekZiYXdhc29YMi9rNW9aSThJcWJDdzdHVjZhQ0pk?=
 =?utf-8?B?ai9LL3cxVmRlNWFodmVIREdmcnVHSUtnSzM4UUpWTEYyVUxwQTU4WFV4OUFj?=
 =?utf-8?B?bW1iRjIraEN1NEtSNGdTMjFvZlhBTHZISVM0N004aUl6eHpmNUw1TGJJSUxn?=
 =?utf-8?B?eW9UZEhibVlmNkVDV0pQNzlPbFlYVlZ3SGJ0MmRQQWhWM0tuZXRRR1BNRitX?=
 =?utf-8?B?a2ZOak5GUDZXdFNHYWNBa1hualUrQVpqY2NSTU5aWHhiVjlPSTIrU3ZVai9M?=
 =?utf-8?B?Y3VkQk1oOTBzT0pSaEdDZHFIZzY5bC9vK1VwbGdRdmVUS0YrdnVvcW5URXFz?=
 =?utf-8?B?MUV2RCtjdjhVaVJyMnJYRWpuVlVFWExMOEJWM0lPbWg0L0FReDZvL1lscW1Q?=
 =?utf-8?B?L01xbE11N1AvRk9OUHNhemxpcXpMcTMzeTM3b0UxK2RNak5CcmpiaVRiKzdB?=
 =?utf-8?B?Q3BvbjBmUmh4S2E3Ky9iWDhaZEp1dGM1YlpZQTY2K3kwVVZacnZCU2NwR3A4?=
 =?utf-8?B?dEIrdTVwaWRIRjdFa0FmZnU1UTJQc1BsV1FmTkREQ3FDeVBGWFhubVBYOWU4?=
 =?utf-8?B?dGovUE12dXVtRWJvNFlFQ3hacnpHakk5OEFKd3dDZHlRVFc4M0dlNXN0LzRm?=
 =?utf-8?B?aktiZ3JLR09CUkFSQmdheTQvYnNjS2F4emo0WWlnR0Evb05LMGticmpHQ1k5?=
 =?utf-8?B?bG8xeGZVa1RBUmdpREZyb1JaRUFMYWpZZEU5emlpQkM1Zi9zUFV2eGxyaHB3?=
 =?utf-8?B?N2dIOHFiT09zam1CUHBMNmcya3g4ZnZsZjdHd3FjZEt5dXIyUjFVTkJRNHFv?=
 =?utf-8?B?bmpheERRenJoYVQrVC96UXNyOUMzd3hlT2VIU2F6L285NVhlYnA2U0dNNmtH?=
 =?utf-8?B?Q2FNREQwSDJMcTlKUUozUysxaDVON29qaEZlVGNpL1duemVuL0pTQVc5a1Ny?=
 =?utf-8?B?MmJQSU5HT3pxM1pKRnZHSWdISys5VkZLQjNWOGgzVVZjNHJIZXVvVlNJZlli?=
 =?utf-8?B?c3BHSGhYVkg1T2RoRmIrMVZYVTVHVWpGTnBidjkrOUlaazhDVE41ZzBFOXE3?=
 =?utf-8?B?MTROVjhHUGt2bzJxSGlOVWRnV3JBMHM2VEhBL3hIdHZya3o4QUVSVDEyQ3JR?=
 =?utf-8?B?dG1zN2RtTThXaDA1VkppWW53Yk9PclVQamlNa2RsbkgvcHJMOFRPc09SWlRn?=
 =?utf-8?B?SGlkbDgyU0ZMWkVzdUNFQWkrYm9kYkNGdGR4dk9FVGZrOTNzbjB4YXViZmt4?=
 =?utf-8?B?dkF1bmtKb1ZPMHRRbGMzeTBrdSsyRko0Z3lwd0Y5SVBIWUF2YUNFK0tacXBz?=
 =?utf-8?B?TVRsZUcvMFNCNFhtbXhGREl6Q3E2TTZJK3BqRm8xZW8vaWxra2tjQkdkZ2dB?=
 =?utf-8?B?QUNqNnJvVHhlYnRDLzdTVzRERUF1cFJ6RFQzMjhPck9yRHR2ZFUwWlNRR3hW?=
 =?utf-8?B?NDhWcFpJMUJrTHV2T1BTQXdHR2lHQXgySjVIMzZOT2NSbk9nR2ZnZ1ZFbDdm?=
 =?utf-8?B?K3FYZWlDeHkxalpFZzhuQ1ZSV2lmUlF4bkd6L1NiSGZpdzlzREx6YWw5YWQy?=
 =?utf-8?B?ZUl1MmpmOC83dlFmcXFwd3ZpbnNDVmhabE5WdWpjRzFsZE5jRWV4Mkt2aG1J?=
 =?utf-8?B?WXg5U2xidlQyUy85QWNoNGRmWEJ0cjV3MkZlRGxrdFNDR0M2bksrcVVBbk0v?=
 =?utf-8?B?TjZwWE9ZUU5LeWhxS09zenlwZDVFUCsrMkthZWo2ZkpyczV4WnpQbXJvaExx?=
 =?utf-8?B?Vldhb0lTUUs4QlNTeU1Cbm5SZ2ZVN0dHSnZTVjhNSGtoa294cksyZFdIN0xt?=
 =?utf-8?B?cXc1Ym82U29rSE5WSlRMMjlHRTEwZWFSem9OMzZlSlNQWmhCV3ViM3ZmZDhz?=
 =?utf-8?B?T0NNaVFXTlhvbjd2ZCtqYmtVSktpek5FL2lRZWVrMW84U0ZTSGdXRjRBNWYx?=
 =?utf-8?B?cmk2U0NieGJNTG1kY2NJOEJqa2ZHbzFVMzJvUWdMWktObnh1OXByb0p6OElI?=
 =?utf-8?B?TkJtOG5xWEMydHBqTWRiTCtVTms0ZVBqNVpaWnJSaG0wdXlFY1BFM0FNTitL?=
 =?utf-8?B?L0NMSVp3eWVWdkdmKytHSkhQMHlDQSs4Rm1TZHdnLzlYaWNNZTVTdFZITG13?=
 =?utf-8?B?WVkzL294S2Y3N25Ic25mVk0va1NFVEl2U1FENnp5dlB0M2Fta29nSzZhK0xq?=
 =?utf-8?B?YktST1NMenNvMEdpbU5qbTMrSHc1Uk5IaEgwRWdTaFNwZVNYQk1VZz09?=
X-Exchange-RoutingPolicyChecked: aaxbGUjobSx4hcP1UzmSR4qEdf3oz390IjDIWJT1GFsAXrTQ2Zw09mKGl4/WzZjF+Oqe4nfcexHTdTH++H4miPVfMSeHfWv82+uMkbUM9F5ojZrshhVTg7LEZKqoyqyEN2eepAePq1Vc/g6vGZUwNMb1Wn6bMt8hD3zMvg+u6G9WATGFOAAYng/JPH4NE0ZlXsWnkEdxvREOcLD1i/7PClEdo0ZU7UkTpAq4x1ikTsHDHWFDUzrpsFxTGmdwKnfgj0mO/O0IXeqAKOGicABqjKoKgzvV2S2yp5XGY9gIpIltu6RWPMXrBP1qWmavvCdZJPdwJw0v1MW1hXiK1tfNKA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 620dabf9-b059-4bf7-27c9-08dea4ff8e36
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:24:24.6261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aTbkhBdJuiwyAO1+p7UYTZjTJj6YXvpvR7XWssoV9GkMLr7/8ROHRfvDOy+XONW9nlUxBNrrFW0hQF7cQijlCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5158
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


On 4/23/2026 11:09 PM, Soham Purkait wrote:
> GPU health indicator exposes a single sysfs interface, gpu_health,
> at the device level, allowing administrators and management tools to
> query the GPU health status. The interface permits both read and write
> operations on PF and native functions, while on VFs it is exposed as
> read-only.
>
> The sysfs file (gpu_health) is placed at the device level and behaves as
> follows:
>
> $ cat /sys/.../device/gpu_health
> ok
>
> $ echo critical > /sys/.../device/gpu_health
>
> $ cat /sys/.../device/gpu_health
> critical
>
> V2:
>   - Return error number instead of error message in _show and
>     _store. (Andi)
>   - Remove redundant VF check in _store callback. (Andi)
>   - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
>   - Return only the current health state for sysfs read. (Andi, Rodrigo)
>   - Add documentation for sysfs interface. (Andi, Rodrigo)
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-ras     |  33 +++
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   drivers/gpu/drm/xe/xe_device.c                |   3 +
>   drivers/gpu/drm/xe/xe_ras.c                   | 202 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h                   |  13 ++
>   5 files changed, 252 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> new file mode 100644
> index 000000000000..085cb79a6e00
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> @@ -0,0 +1,33 @@
> +What:		/sys/bus/pci/drivers/.../gpu_health
> +Date:		April 2026
> +KernelVersion:	7.0
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		This file exposes the current GPU health state and, for Physical
> +		Functions (PFs), allows GPU health state to be updated.
> +
> +		This sysfs file is only accessible to administrative users and is
> +		present only on Intel Xe platforms that support the GPU health
> +		indicator interface for RAS.
> +
> +		For Physical Functions (PFs), the file is read-write, while for
> +		Virtual Functions (VFs), it is read-only and does not support GPU
> +		health state updates.
> +
> +		Read return a single line containing one of the valid values for
> +		the current device health state. Only for PFs, writing one of the
> +		valid values updates the current device health state.
> +
> +		The valid values for the device health state are:
> +
> +			ok
> +				The device is healthy and operating within normal
> +				parameters.
> +
> +			warning
> +				The device is experiencing minor issues but remains
> +				operational.
> +
> +			critical
> +				The device is in a critical state and may not be
> +				operational.
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 95666f950a6f..28a09d06a44c 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -112,6 +112,7 @@ xe-y += xe_bb.o \
>   	xe_pxp_debugfs.o \
>   	xe_pxp_submit.o \
>   	xe_query.o \
> +	xe_ras.o \
>   	xe_range_fence.o \
>   	xe_reg_sr.o \
>   	xe_reg_whitelist.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4b45b617a039..cb5484712f1c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -62,6 +62,7 @@
>   #include "xe_psmi.h"
>   #include "xe_pxp.h"
>   #include "xe_query.h"
> +#include "xe_ras.h"
>   #include "xe_shrinker.h"
>   #include "xe_soc_remapper.h"
>   #include "xe_survivability_mode.h"
> @@ -1067,6 +1068,8 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_vsec_init(xe);
>   
> +	xe_ras_init(xe);
> +
>   	err = xe_sriov_init_late(xe);
>   	if (err)
>   		goto err_unregister_display;
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> new file mode 100644
> index 000000000000..25609257bd07
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/minmax.h>
> +
> +#include "xe_device.h"
> +#include "xe_device_types.h"
> +#include "xe_pm.h"
> +#include "xe_printk.h"
> +#include "xe_ras.h"
> +#include "xe_ras_types.h"
> +#include "xe_sriov.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +
> +static const char * const gpu_health_states[] = {
> +	[XE_RAS_HEALTH_STATUS_OK]		= "ok",
> +	[XE_RAS_HEALTH_STATUS_WARNING]		= "warning",
> +	[XE_RAS_HEALTH_STATUS_CRITICAL]		= "critical"
> +};
> +
> +static const int ras_status_to_errno_map[] = {
> +	[XE_RAS_STATUS_SUCCESS]			= 0,
> +	[XE_RAS_STATUS_INVALID_PARAM]		= -EINVAL,
> +	[XE_RAS_STATUS_OP_NOT_SUPPORTED]	= -EOPNOTSUPP,
> +	[XE_RAS_STATUS_TIMEOUT]			= -ETIMEDOUT,
> +	[XE_RAS_STATUS_HARDWARE_FAILURE]	= -EIO,
> +	[XE_RAS_STATUS_INSUFFICIENT_RESOURCES]	= -ENAVAIL,
> +	[XE_RAS_STATUS_UNKNOWN_ERROR]		= -EREMOTEIO
> +};
> +
> +static int ras_status_to_errno(u32 status)
> +{
> +	status = min_t(u32, status, XE_RAS_STATUS_UNKNOWN_ERROR);
> +	return ras_status_to_errno_map[status];
> +}
> +
> +static void prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
> +				    u32 cmd_mask, void *request, size_t request_len,
> +				    void *response, size_t response_len)
> +{
> +	struct xe_sysctrl_app_msg_hdr hdr = {0};
> +
> +	hdr.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
> +		   FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);
> +
> +	command->header = hdr;
> +	command->data_in = request;
> +	command->data_in_len = request_len;
> +	command->data_out = response;
> +	command->data_out_len = response_len;
> +}
> +
> +static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_health_get_response response = {0};
> +	struct xe_ras_health_get_input request = {0};
> +	enum xe_sysctrl_mailbox_command_id cmd = XE_SYSCTRL_CMD_GET_HEALTH;
> +	enum xe_ras_health_status health;
> +	int ret;
> +	size_t rlen = 0;
> +
> +	prepare_sysctrl_command(&command, cmd, &request,
> +				sizeof(request), &response, sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret)
> +		return ret;
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe,
> +		       "[RAS][GET_HEALTH]: invalid Sysctrl response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EPROTO;
> +	}
> +	if (response.current_health > XE_RAS_HEALTH_STATUS_CRITICAL) {
> +		xe_err(xe, "[RAS][GET_HEALTH]: invalid health state %u from Sysctrl\n",
> +		       response.current_health);
> +		return -EPROTO;
> +	}
> +
> +	health = (enum xe_ras_health_status)response.current_health;
> +
> +	xe_dbg(xe, "[RAS][GET_HEALTH]: current GPU health state = %d (%s)\n",
> +	       health, gpu_health_states[health]);
> +
> +	return sysfs_emit(buf, "%s\n", gpu_health_states[health]);
> +}
> +
> +static ssize_t gpu_health_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_health_set_input request = {0};
> +	struct xe_ras_health_set_response response = {0};
> +	enum xe_sysctrl_mailbox_command_id cmd = XE_SYSCTRL_CMD_SET_HEALTH;
> +	enum xe_ras_health_status health;
> +	int ret;
> +	size_t rlen = 0;
> +	int state;
> +	int ras_status;
> +
> +	state = sysfs_match_string(gpu_health_states,
> +				   buf);
> +	if (state < 0)
> +		return -EINVAL;
> +
> +	request.new_health = (u8)state;
> +
> +	prepare_sysctrl_command(&command, cmd, &request,
> +				sizeof(request), &response, sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret)
> +		return ret;
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe,
> +		       "[RAS][SET_HEALTH]: invalid Sysctrl response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));

Please keep error logs/ return codes consistent across multiple ras patches

Refer to the patch Intel Xe - Patchwork 
<https://patchwork.freedesktop.org/series/160184/>. This will likely be 
merged first

> +		return -EPROTO;

Is this the right error code for userspace? We do not expect user to use 
any protocol.
And system controller might fail due to its own errors.

> +	}
> +
> +	ras_status = ras_status_to_errno(response.operation_status);
> +	if (ras_status) {
> +		xe_err(xe,
> +		       "[RAS][SET_HEALTH]: cmd 0x%x failed: fw_status=%u errno=%pe\n",
> +		       cmd, response.operation_status, ERR_PTR(ras_status));
> +		return ras_status;
> +	}
> +
> +	if (response.current_health > XE_RAS_HEALTH_STATUS_CRITICAL) {
> +		xe_err(xe, "[RAS][SET_HEALTH]: invalid health state %u from Sysctrl\n",
> +		       response.current_health);
> +		return -EPROTO;
> +	}
> +
> +	health = (enum xe_ras_health_status)response.current_health;
> +
> +	xe_dbg(xe, "[RAS][SET_HEALTH]: current GPU health state=%d (%s)\n",
> +	       health, gpu_health_states[health]);

Do we need this debug log since it is sysfs

> +
> +	return count;
> +}
> +
> +static struct device_attribute dev_attr_gpu_health_rw =
> +	__ATTR_RW_MODE(gpu_health, 0600);
> +
> +static struct device_attribute dev_attr_gpu_health_ro =
> +	__ATTR_RO_MODE(gpu_health, 0400);

Use DEVICE_ATTR_ADMIN_RW/RO. More readable

> +
> +static struct device_attribute *gpu_health_attr(struct xe_device *xe)
> +{
> +	return IS_SRIOV_VF(xe) ? &dev_attr_gpu_health_ro : &dev_attr_gpu_health_rw;
> +}
> +
> +static void gpu_health_sysfs_fini(void *arg)
> +{
> +	struct device *dev = arg;
> +	struct xe_device *xe = kdev_to_xe_device(dev);
> +
> +	device_remove_file(dev, gpu_health_attr(xe));
> +}
> +
> +static int gpu_health_indicator_sysfs_init(struct xe_device *xe)
> +{
> +	struct device *dev = xe->drm.dev;
> +	int err;
> +
> +	err = device_create_file(dev, gpu_health_attr(xe));
> +	if (err)
> +		return err;
> +
> +	err = devm_add_action_or_reset(dev, gpu_health_sysfs_fini, dev);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_ras_init - Initialize Xe RAS
> + * @xe: xe device instance
> + *
> + * Initialize Xe RAS
> + */
> +void xe_ras_init(struct xe_device *xe)
> +{
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	ret = gpu_health_indicator_sysfs_init(xe);
> +	if (ret)
> +		xe_err(xe, "[RAS]: failed to initialize GPU health sysfs, err=%d\n", ret);

Should we fail probe here?

Thanks
Riana

> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> new file mode 100644
> index 000000000000..14cb973603e7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_H_
> +#define _XE_RAS_H_
> +
> +struct xe_device;
> +
> +void xe_ras_init(struct xe_device *xe);
> +
> +#endif
