Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E2CEDB7CC
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 09:48:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E742710E3A4;
	Tue,  7 Apr 2026 09:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRNfJ36w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FAB10E3A4
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 09:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775555302; x=1807091302;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WaGB3RcbNHr7M8ih9iNpvGAMlQwbVo1/KB87AEdhxYo=;
 b=VRNfJ36wzaZzK5+0AoFYL5fCtRVz/l00oRhUv8WhwR8oCZ/5M0EiJ13p
 qhkdita4zmV96ZxnPsVwpFb2Wa2meUzvaGh7tT7qdsUFF3Zod8zX+3E/O
 kvJXsOBKEpFf09BcHt8VssWL/wa8aMsMKS9WaGu57/Pialksq/As6llrs
 8LhQ6q7c1AN22slGSx6ROu5w++AQYHqxt8jwgoGJhxGXCjA+6s1iF/MK6
 jnIdwsyL0+IouLyYXTyoq6LsINpUMD5iW3W8bMoC1eBhwHzw0YfjBqwAs
 67xpHhZlfRpDF9ioWXQT6xOzxFAWCBaZosJ+nzes+lGWlINAXovkajUxB Q==;
X-CSE-ConnectionGUID: PtxADL46SsmYCtFvqQQb+Q==
X-CSE-MsgGUID: t+xoa08YSi6+Vgw2YqpmGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87588111"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="87588111"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:48:22 -0700
X-CSE-ConnectionGUID: ib3/yd/IT265oIHJtKaxUA==
X-CSE-MsgGUID: J1d+2CyaT5+zR6re6v7kkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="228397913"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:48:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 02:48:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 02:48:21 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 02:48:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M33ut+2gO/3XW6cOS1tNwF/rqCYeJapt2S/XLIz8yeo3fwlPOz/o6ukNc49RbuKa06ta1XripIU6JXSjNtk43up45jI5kcd08JvT2cOQNfP9+ELRqhz/oD+UELAiiP06nukasmlokIq+bvb2XqOwx9bVY3RlzvvfTT/vLnhdB0jURUQR2aNh6eeY2ij0BAFQMHBhPzZkaXCplayACyrMrtuQGpYayQP7Ba0BVbEdl+YlyJzdXF4lMaDz3MIobFAmQgliHFiO/jueGhNo7z0A31+6+sbtRMHSjcPrT7DOjV81rvBeLz/zKuiwAvBBH/k4lSjJYucLu3f1gHtVssAusQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FmMjk77x78iEdrAzls8hBkJdhxYh2fiEFvvk2OwOD4=;
 b=Hyo3UF8iluJZ6ekogruD7DdnPm/fBVoJ7YMjzUT8XkacZRpz8aKgZfo+OBea8MpeQF0LJWm64YD0J4lZNvhNhTI3T7rW9Wju6ic6JyR2zOO2nEoQPGcwUMEBWUE/pXJ011GqidpBiZSLt9FTQ+be4Hhw7El1rRP9P6YEGTUDwfHlrdRn9CJtsStGeRvdVCI8t2dwrS7H4yGw3HBmqg/WCvZcgK358liLUTaX2CH2uiu2UpgqrG5anbpQ8ZWOWqh2HvD3H2xjKUXwddPvLDV6oPeScFNfhlyfuKNguPhc1Wspm+SdNDEiC7xlUy0lXzr8qknamUTK5dCUDF0uMEMRaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB6604.namprd11.prod.outlook.com (2603:10b6:806:270::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 09:48:19 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 09:48:18 +0000
Message-ID: <fa58f4c0-d126-417f-803f-7a521c5df8da@intel.com>
Date: Tue, 7 Apr 2026 11:48:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Add support for NPK as a GuC log target
To: Stuart Summers <stuart.summers@intel.com>
CC: <matthew.d.roper@intel.com>, <fei.yang@intel.com>,
 <shuicheng.lin@intel.com>, <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260406225338.98533-1-stuart.summers@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260406225338.98533-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0076.eurprd04.prod.outlook.com
 (2603:10a6:802:2::47) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB6604:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a662b91-192f-4666-a851-08de948acc0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 6dgcFuotkfKbe+WTOG1veYkN1XkQ+ZVaa6IwtxacCFhrjjS7mmzonxFF97uMFXAxn/iHftG9ar/JuFEY3gv+KvrkcVLiJeuRr4qCrN29j/4FBbSkATmC0TvvssmoMLwSzw//Y+pQebj+Cku3MbeMNzMLtr1MISR7I0QHDlZM1+DmtURahUiG12FRa7rouMEFBDmJbBtt6m687FghK6m3O2Iwu1UD/CBHZoOFs9k2Bd0RNbp5lQSloQ8Yxe6UCYAKoqmYaVKtaUfjEjBXIRarn5n3ACrfSU1AkqjWjgPLLQ7LyZZWDmNhqdQN0Rnt/34ZGVbNEMYQeDI40aIQBKA/2XD73KYbdex80E80yQc0ANLJ9Nelx+lqDduXdrS2B6nFaxfEQwMzawCWijbiAPEMC/EWaRTzEOEGfD0ZePBPwbVOpSE4qTalbH3zF89SI/yNq3c2ObxmmpUr32d8hjX+wvHz6Sw0+myNU6Rjd2Rl1PVfNRrt8Y1XjgK2kt4+IQcavuzUaD9ZZguMeJofaVIIQfPjWof1pfLP4LFlHTfJnCXpK7edmNGgeXMp79WpUhoMPXBHhJmVub3/oQ98a3ItJStlsTRspzLroN3nFSw6sjDPpfge3vsXrNjfLZ2JSYs0IQzrTP+3pddJlJC3CQQTtNj0P9BrDzAte4UmU26cfY0ya7cxMea4tXqGI6yll8RB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEtXQ0QxcEUvTXZ2dzlHbEorTWQxYmdnVXpTNm85N2xLN2RZMXRXem5ZZytS?=
 =?utf-8?B?MzdWc1Z6M2pXVnpZMlVncG5qenc3Nk90SGduL3NvdFhnWm9kdW5yQWd5VDJn?=
 =?utf-8?B?TnNyUlNLbUthYXZkaU00NjhBVGtLS0VCanpYYXhPWnp3T3BMdEtWV3hjMnVK?=
 =?utf-8?B?SlBIM0ZTc3prUFNqaEdqU2RBUHRJUUkxdG5ZdVZjVXJCZ09aQXRycDFNaEtV?=
 =?utf-8?B?MjRrNGNFV2FBRko4UmlvUlowWTB0RmdMcmFycHdvWXN0bmJOTjdRcjd6Q3ND?=
 =?utf-8?B?MmpBNnhTaHlnOVhjdGpqWWFTNDMyRFBybUNkb0xxaWorcHY3MnUvbnlkSGxK?=
 =?utf-8?B?ckJmQ3RacWFwRXkyOCtZa3REV1F2ZDdEWVE1L3o2M0hWTDJOOFFnc0dDNEpa?=
 =?utf-8?B?ZnFCT1BOZ3ZoMlNOc3dpbTVlYjZQNlBWNkZHa1dHc2NjSjluLzBBT2ZDTjhn?=
 =?utf-8?B?SWdQZEQ5bnIyN0RoSjljRitrTmZFclA2UWloMWpkM0NyTTFtREI3TkpMTzI5?=
 =?utf-8?B?NjVweUpqb1FHRHFnbHZLeTNBWEI3bVdIZlhGeG5FNVg3TVRYREZTZUxBWmpT?=
 =?utf-8?B?Q3M2YjJyRXAzTkE3VEd6dy94aXRoSXVUZzdTd0RNSC9hdWhDemZvWUdQQ0xG?=
 =?utf-8?B?WkRnb25LK2Jpd2RRZkJSbWxhdHUva3dOeC9vd3V4QzlzQWpIdkx0eUNSSUtL?=
 =?utf-8?B?bTBzWmNCc1RSdGVPTFVHMHdLRS9sMkpaYitUTkMvVWFGMklraE9PUlBzNGo5?=
 =?utf-8?B?S1JEREpmUWM0S3lPV0sybTZZV3djN3FMTUdXd0x3WUVyTTBlSmVMc2VJVXRH?=
 =?utf-8?B?WDF2aVMrbk5ENE5nekdxdTY4M291ZSsrUTl2V0VyNlF6VWFUS1N1NVM1NlZE?=
 =?utf-8?B?Mi9yTURmMjVkbFFkallSU3dtQzNwQTZwZXNNUFJET0tsRU5pZGY1RFE3cTBU?=
 =?utf-8?B?T3Bmd0dFT0JEeWJRUzROKzcySTduMmMzK0JId1lWMHVwaE9weUNheXpLK3Av?=
 =?utf-8?B?VlIxdjJkRFZxRXI0K1ozL0lsRFRnZXF5Ym1IQURXSlFleE9ENTFzTDNMTFdL?=
 =?utf-8?B?c25OaThXSGVKU0dCVVhvZ3p3bnlaTm0vQ3FXZWh0RHpyNVZUM0ZqSW54eThW?=
 =?utf-8?B?MmhHS0hxakxuQkFPMkh6VFVWM3dQUzZPcFlVdGdDN3lqSGpyWHJCcitBRzNh?=
 =?utf-8?B?STM2MnhZalh1b2o0d1FaZUUxTVBXWDNQZmlETGpUVlhsME8yYXdpb0l6Q2lL?=
 =?utf-8?B?NW4zVlZCRklTeURUcXdYUGZRdWhzQ1JCRTRHTmNYSlArK1dzL1MzU2p2ZGoz?=
 =?utf-8?B?WGMzTHVFOUpHcHB0L0YyMGRxNUZxbjNZUmk0QjFtTEtHai9XNUNiTExlMXNF?=
 =?utf-8?B?U2RVYk9YNHoydzZzWlZoRWVEL0hOTVhZL2pVQm5LYmtKeS95bG4xNGVETGVL?=
 =?utf-8?B?QUVNazVaTW9WbjE2bW1aS05zdU42ckhCTWl3OVQrRHV4SDBVbU5FeThNSUJG?=
 =?utf-8?B?RWFUdmtmM0hoM0I3Y2Z6TUZHWXpxcFpKNmNIbk1Zc2NFTXFKMmNTcCs1dENz?=
 =?utf-8?B?Y1dDbHMxN3NtVFR6UVlYdExQSzBiL3NpTFEyemNsT3JoOVZZeW1Na05uQzF6?=
 =?utf-8?B?T3A0bGhJNlFsN3Nub3BhVFdlSGtTbHpHN3VlejdlMlRLSUJ4Ym5HY0tVT0NF?=
 =?utf-8?B?U2hCeWFuc0lKc3hDRTY2N0dsRVpjWGJFd2lMYzg0cm9Pb1RvUTU4d3g2SVJm?=
 =?utf-8?B?UTJyN2s3N2xLak1JUUdpdGVpOUlrRDc2bmgwMkRnNkkzeUNzeHl4YlFqQmVK?=
 =?utf-8?B?aTZWa3JDNVNkV1N3TDF3UWpoQ1d2VVAwa3RIaVNOalpqRXNzVWVsM0dFM1JZ?=
 =?utf-8?B?T05DZmdiQTdMdEhSN2ZQTVFhcXFzTUdLRlFwODRtNHdSWkJ6NFZDQXdNN0RD?=
 =?utf-8?B?K0grL3h4K2pTd1VqWllmbmNsSkdINXZMdTMxdGxXeDV0dnBTclVsYUVoUzVp?=
 =?utf-8?B?QzhSTmVXRXNXNzdGb2IvVHY2Q2NOZy84eTgzR1E1RXZNUThoczVVaWRrUnRF?=
 =?utf-8?B?cTNrVjN3ZUJ2cmZIRHNjY3Rxc1Z5Sk80eXIyNWVXbFcwNG9Ycmh6V3EwTGxa?=
 =?utf-8?B?MWRSU2hJVnNjZ3NkSXl6WnFkMVVZWlhhZlorRk05Y2FaNGZCNXF6TVNXb1RM?=
 =?utf-8?B?SCtDUXZ4cm9iSTVPNWZNaXV1cUtoUHdyanErVlI0WG9sMzQrWmVVVDMwYjBC?=
 =?utf-8?B?aXFwNjZ2S1ZKVTlRSVJwQm9PQllkVGphTEYzV2VmQlppeTZvWUluVzZvc1ZT?=
 =?utf-8?B?UG9oRGIzK1h0OGNnQ0lWRm4xdTRCQkhtd1FBaUlPUlE4akpxMlpoTXRXWkhw?=
 =?utf-8?Q?WYoycMdY4cFFOU1A=3D?=
X-Exchange-RoutingPolicyChecked: tm/1Zm2rCFYEXc76WEClqunW28DmMYw+lYTsfCRDwE9MtgeaNXiLAL92rubiPsMrmC0P3sHqFx/B0U0ibKM7Ft57ThtJfsmrzAfwcz3yoBMDOHARodXvJg3L84Nf+aE1enZGd+1Aw9iiXhNP7ZsON9bOOUxSmnZIYIEBUcGeZPXCXM9McTibdl0i1fnV7GHSe58IGwnGtUtlwIzyuSNAEzt5j0wEoNZY66rcOmSFqtNG/e5Br56FwF5ksM/U3HRB+ZG0ns7LNcOc8/ucrpz6QH073nJe5/H/9HibrYaD9p3kEe5c4Rw1DPKbiB1uy6c6+I6jLU5fgdc69o9ZP31iTA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a662b91-192f-4666-a851-08de948acc0e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 09:48:18.4221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FgcBFGH4BsnHz5epR9TSlY2YSLKqVQwxhFJWm7BSOByejY4nmvB4almM+WrqugJP4dYpcRDbiNkLhKesdC1bEpSSfF00TdIrtIKsecDdEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6604
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


On 4/7/2026 12:53 AM, Stuart Summers wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> GuC provides the ability to gather logs through a hardware interface
> called NPK. For certain debugging scenarios this can be advantageous
> over getting logs from memory (or in addition to).
> 
> Add a hook for this alternate debugging mode via a configfs. This
> translates into a parameter passed to GuC during load time.
> 
> v2: Convert to configfs from modparam (Matt)
> v3: Configfs documentation formatting (Shuicheng)
>     Kerneldoc/comment add + configfs entry ordering
>     Only set the guc_log_target when GuC log is enabled (Daniele)

nit: we may keep change log under --- so it stays on the ML only

and please not forget to use -v option while preparing new patch revisions

[1] https://git-scm.com/docs/git-format-patch#Documentation/git-format-patch.txt--vn

> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Acked-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 70 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs.h |  5 +++
>  drivers/gpu/drm/xe/xe_defaults.h |  1 +
>  drivers/gpu/drm/xe/xe_guc.c      | 11 +++--
>  4 files changed, 84 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 32102600a148..e4511ee4e135 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -83,6 +83,16 @@
>   *
>   * This attribute can only be set before binding to the device.
>   *
> + * GuC log target:
> + * ---------------
> + *
> + * Set the destination for the GuC log. 0 - memory only (default),
> + * 1 - NPK only, 2 - memory + NPK. Example::
> + *
> + *	# echo 2 > /sys/kernel/config/xe/0000:03:00.0/guc_log_target
> + *
> + * This attribute can only be set before binding to the device.
> + *
>   * Allowed GT types:
>   * -----------------
>   *
> @@ -256,6 +266,7 @@ struct xe_config_group_device {
>  	struct config_group sriov;
>  
>  	struct xe_config_device {
> +		u8 guc_log_target;
>  		u64 gt_types_allowed;
>  		u64 engines_allowed;
>  		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
> @@ -277,6 +288,7 @@ struct xe_config_group_device {
>  };
>  
>  static const struct xe_config_device device_defaults = {
> +	.guc_log_target = XE_DEFAULT_GUC_LOG_TARGET,
>  	.gt_types_allowed = U64_MAX,
>  	.engines_allowed = U64_MAX,
>  	.survivability_mode = false,
> @@ -357,6 +369,41 @@ static bool is_bound(struct xe_config_group_device *dev)
>  	return ret;
>  }
>  

can we expose this new attribute only for XE_DEBUG_GUC config?
we can easily use xe_config_device_is_visible for this

> +static ssize_t guc_log_target_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +
> +	return sprintf(page, "%d\n", dev->guc_log_target);
> +}
> +
> +static ssize_t guc_log_target_store(struct config_item *item, const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	u8 guc_log_target;
> +	int ret;
> +
> +	ret = kstrtou8(page, 0, &guc_log_target);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * No need to define full enumeration set since this is directly
> +	 * applied from the user here to GuC.
> +	 */
> +#define GUC_LOG_TARGET_MAX	2

late to the party but agree with Daniele that this should be part of the
GuC ABI file, and unlike Daniele I would prefer to enforce that as otherwise
we will start again mixing local defines that we can change with GuC
definitions that we don't own and can't change

(and yes, GUC_LOG_LEVEL min/max definitions should also follow that rule
so they should be fixed too - someday ...)

for me it looks that this MAX could be based on existing define:

#define GUC_LOG_TARGET_MAX	FIELD_MAX(GUC_LOG_DESTINATION)

but I'm wondering whether actually we should expose in stable configfs
the low-level GuC ABI definitions

maybe more safe solution would be to add just higher-level attribute

	bool guc_npk; /* use NPK? default: false */

and just convert that into GuC ABI bits in guc_ctl_debug_flags() ?

	flags |= FIELD_PREP(GUC_LOG_DESTINATION,
			xe_configfs_guc_npk(pdev) ?
			GUC_LOG_TARGET_MEM_AND_NPK :
			GUC_LOG_TARGET_MEM_ONLY);


> +	if (guc_log_target > GUC_LOG_TARGET_MAX)
> +		return -EINVAL;
> +#undef GUC_LOG_TARGET_MAX
> +> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.guc_log_target = guc_log_target;
> +
> +	return len;
> +}
> +
>  static ssize_t survivability_mode_show(struct config_item *item, char *page)
>  {
>  	struct xe_config_device *dev = to_xe_config_device(item);
> @@ -815,6 +862,7 @@ CONFIGFS_ATTR(, ctx_restore_post_bb);
>  CONFIGFS_ATTR(, enable_psmi);
>  CONFIGFS_ATTR(, engines_allowed);
>  CONFIGFS_ATTR(, gt_types_allowed);
> +CONFIGFS_ATTR(, guc_log_target);
>  CONFIGFS_ATTR(, survivability_mode);
>  
>  static struct configfs_attribute *xe_config_device_attrs[] = {
> @@ -823,6 +871,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>  	&attr_enable_psmi,
>  	&attr_engines_allowed,
>  	&attr_gt_types_allowed,
> +	&attr_guc_log_target,
>  	&attr_survivability_mode,
>  	NULL,
>  };
> @@ -1095,6 +1144,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>  				 dev->config.attr_); \
>  	} while (0)
>  
> +	PRI_CUSTOM_ATTR("%d", guc_log_target);
>  	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>  	PRI_CUSTOM_ATTR("%llx", engines_allowed);
>  	PRI_CUSTOM_ATTR("%d", enable_psmi);
> @@ -1147,6 +1197,26 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>  	return mode;
>  }
>  
> +/**
> + * xe_configfs_get_guc_log_target - get configfs GuC log target attribute

nit: we try to append () to the function name in doc, like:

    * xe_configfs_get_guc_log_target() - Get GuC log target attribute.

[2] https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation

> + * @pdev: pci device
> + *
> + * Return: guc_log_target attribute in configfs
> + */
> +u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	u8 target;
> +
> +	if (!dev)
> +		return device_defaults.guc_log_target;
> +
> +	target = dev->config.guc_log_target;
> +	config_group_put(&dev->group);
> +
> +	return target;
> +}
> +
>  static u64 get_gt_types_allowed(struct pci_dev *pdev)
>  {
>  	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 07d62bf0c152..fb5cb7c57e75 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -19,6 +19,7 @@ int xe_configfs_init(void);
>  void xe_configfs_exit(void);
>  void xe_configfs_check_device(struct pci_dev *pdev);
>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> +u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev);
>  bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
>  bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> @@ -38,6 +39,10 @@ static inline int xe_configfs_init(void) { return 0; }
>  static inline void xe_configfs_exit(void) { }
>  static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
>  static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
> +static inline u8 xe_configfs_get_guc_log_target(struct pci_dev *pdev)
> +{
> +	return XE_DEFAULT_GUC_LOG_TARGET;
> +}
>  static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return true; }
>  static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
>  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
> index c8ae1d5f3d60..fbe670668a04 100644
> --- a/drivers/gpu/drm/xe/xe_defaults.h
> +++ b/drivers/gpu/drm/xe/xe_defaults.h
> @@ -12,6 +12,7 @@
>  #else
>  #define XE_DEFAULT_GUC_LOG_LEVEL		1
>  #endif
> +#define XE_DEFAULT_GUC_LOG_TARGET		0
>  
>  #define XE_DEFAULT_PROBE_DISPLAY		IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  #define XE_DEFAULT_VRAM_BAR_SIZE		0
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index e762eada21db..c40bd4aec2ce 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -73,13 +73,18 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>  
>  static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>  {
> +	struct pci_dev *pdev = to_pci_dev(guc_to_xe(guc)->drm.dev);
>  	u32 level = xe_guc_log_get_level(&guc->log);
>  	u32 flags = 0;
>  
> -	if (!GUC_LOG_LEVEL_IS_VERBOSE(level))
> +	if (!GUC_LOG_LEVEL_IS_VERBOSE(level)) {
>  		flags |= GUC_LOG_DISABLED;
> -	else
> -		flags |= FIELD_PREP(GUC_LOG_VERBOSITY, GUC_LOG_LEVEL_TO_VERBOSITY(level));
> +	} else {
> +		flags |= FIELD_PREP(GUC_LOG_VERBOSITY,
> +				    GUC_LOG_LEVEL_TO_VERBOSITY(level));
> +		flags |= FIELD_PREP(GUC_LOG_DESTINATION,
> +				    xe_configfs_get_guc_log_target(pdev));
> +	}
>  
>  	return flags;
>  }

