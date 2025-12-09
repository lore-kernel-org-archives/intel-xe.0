Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E789D3B7E2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 00:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D074810E1A4;
	Tue,  9 Dec 2025 00:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mDpBcMGD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9821210E1A4
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 00:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765240608; x=1796776608;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FfAVgzjKt2AnOPzY+mBsDLfOPmQPBfXmJdWiy7KSuuI=;
 b=mDpBcMGDFeS0G7/L2WnDgQbutizJc1jMDT8dicWzpYcMS9bb2Zx+rTtl
 upPW10oRg1ArAqjyfzzlkOZoBqFckU/45GTd9dXywG10ZAF5ggVmhfp0Y
 S7UPOE4fVGWkCoTLncuTNF9O/jI57Mxpr6sLK4LiyK+wRSZSUY8qS+hzz
 f/j+zie91nL2DpCKGIoZjmC9R/G1VQhY7QGnrXOjF0oria9z+tDsH4F+X
 V7ZH0WlzrfxxBiWRkH4i/m2G5132YjYjY68DrWa1n3dykRy8tva0GWm+j
 9LxO7r7Y1C2cuXxoCK9h4KEVqXDuIX1MC/HT991MHKSQS02CtCCqv3qNc A==;
X-CSE-ConnectionGUID: hEv814FZQRC/VQIIh14HLQ==
X-CSE-MsgGUID: knT2+2DqQ0Op5PlmkaKpZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="54735661"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="54735661"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 16:36:48 -0800
X-CSE-ConnectionGUID: FBOdFxlbRHa6TKfPBoWwvw==
X-CSE-MsgGUID: dmUY4sx0T+Sm9KESVUDwBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="200258783"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 16:36:48 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 16:36:47 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 16:36:47 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 16:36:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jeYOT+u4OELTFGTXoa4AKJz5ukNUfI2axlZtHDjosUCUc1D8Ntyq4gLMJPgaHoJuE0VwdOVnbtRTVm22345zvucp5/dUTxB+0st/sg1hsBHn6FxhXVcJnwGnIsMGY7KuXR84qE2ITX8U9DYyAtLd9fW4WAyVRj0z0K0d0rNXpVI1Yq0JgbbNnI5CR7qFZD8hY9TEkAbWVgTz7Tg8/rJ2E57ksUfOpox3IdOGscjj8RfXK7sM1yMvP1Nrg9aVjxWhSxfFf0aZ0WD36QaoLQxHNWEH8kytUeWgaLosVk5iGkQX+Zt9DZyBu8CAbqD6anC6k01fgvIyMUGT/5c5MSWGCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkOP3W3y08wQKYQtf/503QXejU4lQGGlIkyWeTw02Q4=;
 b=FOEp39BW7Zdc5B9SA3osQhKTvGfvgIYwkHtt5kjCdkPoLRwU6O493fWIB6NvAMnPrawbWEJpG4QNtPGSQlgo87AiGDBQP8K2sHx6S5kjGHosvigLxX5bNSENfZi5ZJvGHmFA65h1nj1p13Lyc988B5W5RXlUFO17EZEYZqvwYWSCCPrQNLkRCIvf8zpo8qV8h6juWRGnG/IMEErGLrTRI7+aelwfkThzuljf/t5+DuSJvj490iyqFuAdNphMSJWu8KIhSK5qwjIut2bWh7hRk2v3GCdU6QvduFPO82HeprrKho/oCDQWX4jBKcEwdsLFqEEgPjJ4YbF3B2gaXgpXpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA2PR11MB5020.namprd11.prod.outlook.com (2603:10b6:806:11f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 00:36:45 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9388.003; Tue, 9 Dec 2025
 00:36:45 +0000
Message-ID: <d6580e58-9e7b-4d5a-ae43-42154099260f@intel.com>
Date: Mon, 8 Dec 2025 16:36:43 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] drm/xe/sriov: Add debugfs to enable scheduler
 groups
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
 <20251206230356.3600292-19-daniele.ceraolospurio@intel.com>
 <a203d8b9-628f-4b5e-94ac-fadd45b1e9c1@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <a203d8b9-628f-4b5e-94ac-fadd45b1e9c1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0145.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::30) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA2PR11MB5020:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dab6482-52d5-4060-cb99-08de36bb07d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2tKMTEyOGROTDB5MDVsblJLazV0ZjRTT2pNa29uSnIxTUVTYW05eEFqSzZE?=
 =?utf-8?B?NkdEN3NnK1hWNWo0b1AyR3BZa0pKdVhQSGN3LzN3SDlMdU5ka1Vtc3VmelFQ?=
 =?utf-8?B?Z2RjSGJsemJCdlF1WDlmS0FSZFdoUko3dFloWVl2Y1JIQ0FZNVY5UGlDYXRk?=
 =?utf-8?B?K05Oakh2MjZzUmlvdlV5K2o5eUZrWUkyNGoyajFIdHJIbU9hbFlUYUZicXhY?=
 =?utf-8?B?cnFkYUtqSTV1TEZJbnpXd3NNQ2RNdWw2Tyttd2x5cjZIbDRrMGZSalJFeDZu?=
 =?utf-8?B?dXpYdFhoWCt4d2FpZlBsSHJOUnZwOGQrck1lYVZqQ2tQWEpRcTdkRjZZVmpI?=
 =?utf-8?B?MG5XYWRhTmZETGVEYllCbnVib09EMVdaemlMUTlhYlNFOCtLUEpJZGlFejU1?=
 =?utf-8?B?eHR0d0hhRFdLS0tuNTZRRTdIT2NEODBkU1hyUlFpTkhZbnhvOVZBWU1ic3g4?=
 =?utf-8?B?ZjlOU2hJRGJBaW53eHZzQUlTTXZhZXQ0ZHgrOUVKNFlOM3Q4STRkcUxyWUIw?=
 =?utf-8?B?NlRGQW5tVmFZRjNPSm5qdjhYZXdvZ09zeFJZUmwvYlRIRjhZNnBMUkpLbHVm?=
 =?utf-8?B?Ymlld0g3Wks3NlBxZWxyRGFxMXJXckM1bndRYmR5YW9aaGtkMCtidUpnOG55?=
 =?utf-8?B?bWtJb1JROGVWMUc1Ni9HYWRaNkI5L2NQVDRPbXBKTjBHdUhkM3VJN09JZ29O?=
 =?utf-8?B?VFpwa3pKVFRxOHZxR3hDN1JQK0NVQWtSc2FSMlN3UXZiMnBrczdZNFgzT0x6?=
 =?utf-8?B?UStaMjdEOGFKUExVakl2UzdUVzV3N2FuazF4TERCWFQ3QnZxcndjOWNYa0RB?=
 =?utf-8?B?QjVLOXJadUNsdCtNZzVMQnFISUZ3UkUwZTJEN1d3Z0tGWlJZdGYvaTBwc3JK?=
 =?utf-8?B?eTVMZEd3dmpqYmZvZnREN0NOOHlwcE85S1FDUy9ITkFNc1c2VXpzMVU1OXhO?=
 =?utf-8?B?cG94eVRPTUtrVzk0UXZ6YUtDNTh4Z2h1TmZOWXB2SExSTTMzcUNpVDlKaHM1?=
 =?utf-8?B?RWF5U1cvSGJFMHpFWEg4ZUErNTNMa1o2QlVINFZhV09IS3E2OXBmYUx5SmZa?=
 =?utf-8?B?Y0djSnBka2dMQjZhZXJoRjJ0cUpob2xrMk1wTjM1aUlYanB0OUtLb3BJak5s?=
 =?utf-8?B?ZktnQVdSMVZqTGNVRENHSHRyYVBJRGQrc24wYUlENERKamxOTTd1dzd1cS9P?=
 =?utf-8?B?TmFPeUdXY3BTQjVSZFRKZWtXY3RIRWZYV0Q4R3V1ZDlGbGVRNGcyaWk1eGVl?=
 =?utf-8?B?dkh0Y2hrejFoM3Vpc01rekxVMWFycWRjdHBmeWQxRzFyUXgyR216YkZoanI1?=
 =?utf-8?B?R0dIK25NQnlSdGZMd2tkZHdMNjNsTDlQYnVNSjZUeHJ4TXcyamxMaVZlSmQ2?=
 =?utf-8?B?ekhOWHVzR2U5Z3F0NUs3R240bUExbjB4YXQzQlRhUmhGbjl6V3ZpanFZcita?=
 =?utf-8?B?cHBFZE15UU1DV3BBTDJnMmwrWGlYTm9PWnRVNWpaYXFuZmlqSHE4ei91MlVM?=
 =?utf-8?B?WTViNEQzcVBVQ3R3VkNIY296MFFseE0wbTdRd1dnZG1lcGhhQXhlL1gzR3Ji?=
 =?utf-8?B?Y2hCZ2dYTHpHK0x3cG1pVDM3dGY4YVVqa1ExTVJrVGF4amI5SWRDWXh0UVNu?=
 =?utf-8?B?QlV0Z3JVWXFjZmhldXRzQ29lTWIyOFFud1plTThwUmlSeGo3d0dNZEhlN3Vt?=
 =?utf-8?B?dlBzeEtBcUtzOFBya3VnK25JSDMzbjQvSlVYSkZIeGQ2bUROYTdyL2p4d2FU?=
 =?utf-8?B?YkZMYkcwdWJmaThtU1J6aTRLSkI5ckRkc2orcDN1b0NGVERyVFhVZW9ZclQ4?=
 =?utf-8?B?ZFRmM2xrR3A0YlpDdVNSZHBmRzB6bER6eExRWURqR2d1NTdJNEEyODVtWjVD?=
 =?utf-8?B?THpOR0RBNUNqOFgyQ1hGRzgxTnVmM3NUMlNBNTlwdmxLeVN1QVdBUThhMXBQ?=
 =?utf-8?Q?7Nf8tbNRA5GmirY+DeRG21bBXqoTw2Ls?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW05WFpKTk5YK0wzQkpCV01oemNnMk1RRFJuWWdGbWE1SUhJekNUOGRGVVNL?=
 =?utf-8?B?VTNObTEyazJjSmN1T3pxUTk2dUtSM1pZazhsSW9MdlFZZXdIazhRTjV3UVRv?=
 =?utf-8?B?eE81T3NSV0VQck9kY0E5UWdFTXdEVi85aWNZZE4yMy9lU3M1Z3pkOGNCZmM2?=
 =?utf-8?B?MkVIWDdVOUFWbFpUNVg0Mng5eEdPOG1xK2lpZmE4clJxZ3lzZ082VGlYVUUx?=
 =?utf-8?B?OE1HTFlNQS9TdXB6OEhWcnAxVjRzTE9xL21aRHlIYXU2emdWNVUwR2xkajZk?=
 =?utf-8?B?WWNmUm42T3Z2Ni9PWFg1T2pDaXp2WXk4Q2tDSkR5SnZ1TzRmcVA2akd0ay9Y?=
 =?utf-8?B?dC9aNXR6UDFjY0x6cUxFMTV0alZQMzF3cjA2T2tJdzNuZVpsRUhsdU5pOGdC?=
 =?utf-8?B?b2FwWldvRXhzbkMwaXQvV21hM1JscVIrUW41UDAwMGFCUERuL1pxcVBrMi8r?=
 =?utf-8?B?ODlvcEw1YmhUTFhyY0dxYUUrVkxSUHIrb2owMkcrSDAzd29QcTNic2QxMDdZ?=
 =?utf-8?B?Yzh2VFV6dC9KRU9jWC9zQVNkQ2M1MUdTNEVHRXFtN3FoNlZIdU9JMkdGTEt2?=
 =?utf-8?B?Mk9zUmovY0l5VEd5MXZvN3BGKzlrNFRqVHlNZ2V3Z3V5eHkzUVlLWDBya0hY?=
 =?utf-8?B?cFh6anl1bXRUc292WVV4UmFROE93akh5d0tucWNBbCtOL050WWY1aW9vNGtj?=
 =?utf-8?B?R084bUxmTCszeWxiWkhWWkZyS3gwcU5CTmpFWmRuR1ZjZFkwQ1RJWlN2L1R6?=
 =?utf-8?B?TUkveFkxNU9icGhzKzVXNjk5WDhOU3pDQUVCakw3MjVSSW8raFlmMTJ3U0Nh?=
 =?utf-8?B?eTUweldDVUJxQ2Fxa29VaG9JTnVhVjlLdTVoT0I5YkNRVFlQRXR6bHZsNjg3?=
 =?utf-8?B?UFhjcWtGdDhOMTRQanRjWTlQWU9XUGhaWkJkYjRsQWZHRjZBRE0zbGZsRktn?=
 =?utf-8?B?RHBJYndlbDlhUWxHZmkyWUczNzhlWnptcENsS0xuZnRNVldIWXVyRFRnSEJ3?=
 =?utf-8?B?cWFPUVZkWDRhbjdqRlNLRU9tQnREZ2FTMnVxdUdzSzRhTjVKVU5PVjlldEVZ?=
 =?utf-8?B?clBRRWQ5M0MzcERNVFJYK1FxVlh1UzJnNTIvQVd2TlQrMFBhRllwdmpWV2o2?=
 =?utf-8?B?WW9YTEdLT1Y2RUJvSDhKYkk4eVZPVVh0bEVlTzNYRGpwK0hjL0hmVVRuYUUx?=
 =?utf-8?B?eVFsRmExR3BWR3JVSWgyaG1WSzkxMGNoaWZYeWM1UTdnU0llQUY4bHdHNzZJ?=
 =?utf-8?B?UkdFQTV6c045bkw1dGxFYS92Y3NQdWZmcGt6ZldFc3hqc3Zzb2sybzhxSURX?=
 =?utf-8?B?TzEyYVVRQy84M3pncTY5MU9Qb2tvdUhnNlJkalF3TVRNMW53Y1JkMWZPUGVU?=
 =?utf-8?B?ZTJITEY1YkFuWkd1RElrWGlDQXltQUVZQW9sendEckc5L3Z4T0hpaE1JS1lu?=
 =?utf-8?B?NHliYjV5ZkdmVDhidzRHNzlnZW42WmJnQUhuOGJEU2VqRkNRREI5RVk5QUhN?=
 =?utf-8?B?WTd3NnZHSFcrbGpwTmZZaWZWdFRleWQ4ZFV6U1AvaGEvUVBxWGYrdndMNXBY?=
 =?utf-8?B?cjd5L0pQMUxjMjBlTHpoZG4wcGNHRkF4NjU1L2tYMlhsNkxMNnR4WEMveGxh?=
 =?utf-8?B?YnVhZzI5SzVHcmN2dW4xVGNTdXRaWnVDNVErQTVKT3FmWVZGeWVrWnJDaE1r?=
 =?utf-8?B?cG5CVHVNTFFSTDg1d3Jlb0lkNDh4VlpMU01Qd2pkWVZBUUxyazhtSFdCOHdQ?=
 =?utf-8?B?MVk0Y0NMamxBaFR2UWZCRzdKVmJQYXIxQXVMalI0UStXaVlVVTk4UVZBVkxx?=
 =?utf-8?B?cTl4UEUyd3pZYU1xcmVDS0VSM25kakliNDR4ekIxNjgvSC9wcEJ5QkdFYjVv?=
 =?utf-8?B?enIrZjRzaWRadlVYaThSTDZjWHdnRWRzL1YvaFNCbEtzNUNOaTBwa01RWWwz?=
 =?utf-8?B?dCtlNUZnV1crcFQxWFZtaElGSlZkSXkrUGVvTWNMK0xMSyswb2hsOFJadTlu?=
 =?utf-8?B?bzd6b2hDdk83SFlFdTNyOW1Od0VZNERaWFdoMFRmM3JjRko4aWZ0OXNZbFd6?=
 =?utf-8?B?ckNzam9EQ2RyZmg2aWNqNU5HeUUrbkVYYU1SK1BnbUtnNnVrRkE1UVc5VWFY?=
 =?utf-8?B?TE8zTTNWNytZTjZiNnQ2dlpmSGovNGdZclA5TzI1eTVIRVA0TWwwdVE5RHZN?=
 =?utf-8?Q?59nprzX1VVnXbScE9A4rBNM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dab6482-52d5-4060-cb99-08de36bb07d2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 00:36:45.3251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXkkw+Fi8jdBr1AKMSsshHj7iN07WeI10gyoAVw7eJDvjCDRb6RUwH911lT2QxKTkhT+ezXVLNAaOzo/lQiRX+HT9Sn4bljrflZ7wtB/PBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5020
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



On 12/8/2025 3:38 PM, Michal Wajdeczko wrote:
>
> On 12/7/2025 12:04 AM, Daniele Ceraolo Spurio wrote:
>> Reading the debugfs file lists the available configurations by name.
>> Writing the name of a configuration to the file will enable it.
>>
>> v2: don't print anything if the feature is unsupported (Michal), add
>>      TODO for reworking init order to know if there are valid groups
>>      when we register debugfs, check for basic feature support.
> btw, recently in Xe we started to follow core kernel rule and put the
> change log under the --- line

ok

>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 126 ++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c  |  19 +--
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h  |   1 +
>>   3 files changed, 139 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> index 5123ff1fb116..1be23809e624 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> @@ -156,6 +156,131 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>>   	debugfs_create_file_unsafe("sample_period_ms", 0644, parent, parent, &sample_period_fops);
>>   }
>>   
>> +/*
>> + *      /sys/kernel/debug/dri/BDF/
>> + *      ├── sriov
>> + *      :   ├── pf
>> + *          :   ├── tile0
>> + *              :   ├── gt0
>> + *                  :   ├── sched_groups_mode
>> + */
>> +
>> +static const char *sched_group_mode_to_string(enum xe_sriov_sched_group_modes mode)
>> +{
>> +	switch (mode) {
>> +	case XE_SRIOV_SCHED_GROUPS_NONE:
>> +		return "disabled";
> maybe we should be consistent and use either:
>
> 	"none" / XE_SRIOV_SCHED_GROUPS_NONE
> or
> 	"disabled" / XE_SRIOV_SCHED_GROUPS_DISABLED

I am ok with switching both to disabled. Or maybe we should just go with 
"all_gt_engines", to indicate that all engines in one GT are in the same 
group? Because AFAIU from the GuC POV you always have groups, the 
question is if more than 1 group is actually active (and it also counts 
as an actual mode instead of just being the disabled state)

>> +	case XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES:
>> +		return "media_slices";
>> +	default:
>> +		return "unknown";
>> +	}
>> +}
>> +
>> +static int sched_groups_info(struct seq_file *m, void *data)
>> +{
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +	struct xe_gt *gt = extract_gt(m->private);
>> +	u32 current_mode = gt->sriov.pf.policy.guc.sched_groups.current_mode;
>> +	int mode = 0;
>> +
>> +	if (!xe_sriov_gt_pf_policy_has_multi_group_modes(gt))
>> +		return 0;
>> +
>> +	for (mode = 0; mode < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; mode++) {
>> +		if (!xe_sriov_gt_pf_policy_has_sched_group_mode(gt, mode))
>> +			continue;
>> +
>> +		if (mode)
>> +			drm_printf(&p, " ");
> nit: drm_puts() ?

I'd prefer not to add newlines here.

>
>> +
>> +		if (mode == current_mode)
>> +			drm_printf(&p, "[");
>> +
>> +		drm_printf(&p, "%s", sched_group_mode_to_string(mode));
>> +
>> +		if (mode == current_mode)
>> +			drm_printf(&p, "]");
>> +	}
>> +
>> +	drm_printf(&p, "\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static int sched_groups_open(struct inode *inode, struct file *file)
>> +{
>> +	return single_open(file, sched_groups_info, inode->i_private);
>> +}
>> +
>> +static ssize_t sched_groups_write(struct file *file, const char __user *ubuf,
>> +				  size_t size, loff_t *pos)
>> +{
>> +	struct xe_gt *gt = extract_gt(file_inode(file)->i_private);
>> +	char name[32];
>> +	int ret;
>> +	int m;
>> +
>> +	if (*pos)
>> +		return -ESPIPE;
>> +
>> +	if (!size)
>> +		return -ENODATA;
>> +
>> +	if (!xe_sriov_gt_pf_policy_has_multi_group_modes(gt))
>> +		return -ENODEV;
> maybe we should drop this condition?
>
> if we don't have multi-groups, we will still display:
>
> 	[disabled]
>
> so for consistency we should allow:
>
> 	echo disabled > sched_groups_mode

Sure, that makes things easier.

>
>> +
>> +	if (size > sizeof(name) - 1)
>> +		return -EINVAL;
>> +
>> +	ret = simple_write_to_buffer(name, sizeof(name) - 1, pos, ubuf, size);
>> +	if (ret < 0)
>> +		return ret;
>> +	name[ret] = '\0';
>> +
>> +	for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++)
>> +		if (sysfs_streq(name, sched_group_mode_to_string(m)))
>> +			break;
>> +
>> +	if (m == XE_SRIOV_SCHED_GROUPS_MODES_COUNT)
>> +		return -EINVAL;
>> +
>> +	guard(xe_pm_runtime)(gt_to_xe(gt));
>> +	ret = xe_gt_sriov_pf_policy_set_sched_groups_mode(gt, m);
>> +
>> +	return (ret < 0) ? ret : size;
> we can drop ( ) here

ok

>
>> +}
>> +
>> +static const struct file_operations sched_groups_fops = {
>> +	.owner = THIS_MODULE,
>> +	.open = sched_groups_open,
>> +	.read = seq_read,
>> +	.write = sched_groups_write,
>> +	.llseek = seq_lseek,
>> +	.release = single_release,
>> +};
>> +
>> +static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
>> +{
>> +	xe_gt_assert(gt, gt == extract_gt(parent));
>> +	xe_gt_assert(gt, PFID == extract_vfid(parent));
>> +
>> +	/*
>> +	 * TODO: we currently call this function before we initialize scheduler
>> +	 * groups, so at this point in time we don't know if there are any
>> +	 * valid groups on the GT and we can't selectively register the debugfs
>> +	 * only if there are any. Therefore, we always register the debugfs
>> +	 * files if we're on a platform that has support for groups.
>> +	 * We should rework the flow so that debugfs is registered after the
>> +	 * policy init, so that we check if there are valid groups before
>> +	 * adding the debugfs files.
>> +	 */
>> +	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
>> +		return;
>> +
>> +	debugfs_create_file("sched_groups_mode", 0644, parent, parent, &sched_groups_fops);
>> +}
>> +
>>   /*
>>    *      /sys/kernel/debug/dri/BDF/
>>    *      ├── sriov
>> @@ -531,6 +656,7 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
>>   	} else {
>>   		pf_add_config_attrs(gt, dent, PFID);
>>   		pf_add_policy_attrs(gt, dent);
>> +		pf_add_sched_groups(gt, dent);
>>   
>>   		drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), dent, minor);
>>   	}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> index 6a682d788b02..2cafacac5d8e 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> @@ -451,19 +451,24 @@ static void pf_sched_group_media_slices(struct xe_gt *gt, u32 **masks, u32 *num_
>>   	*num_masks = GUC_MAX_ENGINE_CLASSES * groups;
>>   }
>>   
>> -static void pf_init_sched_groups(struct xe_gt *gt)
> missing kernel doc

will add.

>
>> +bool xe_sriov_gt_pf_policy_has_sched_groups_support(struct xe_gt *gt)
>>   {
>> -	int m;
>> -
>> -	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>> -
>>   	/*
>>   	 * The GuC supports scheduler groups from v70.53.0, but a fix for it has
>>   	 * been merged in v70.55.1, so we require the latter. The feature is
>>   	 * also only enabled on BMG and newer FW.
>>   	 */
>> -	if (GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(70, 55, 1) ||
>> -	    gt_to_xe(gt)->info.platform < XE_BATTLEMAGE)
>> +	return GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 55, 1) &&
>> +	       gt_to_xe(gt)->info.platform >= XE_BATTLEMAGE;
> and maybe we can introduce this function in patch 2/11 to avoid this diff?

will do.

Daniele

>
>> +}
>> +> +static void pf_init_sched_groups(struct xe_gt *gt)
>> +{
>> +	int m;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>> +
>> +	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
>>   		return;
>>   
>>   	/*
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> index ceaf797ca21b..f5ea44dcaf82 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> @@ -17,6 +17,7 @@ int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
>>   bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>>   int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>>   u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>> +bool xe_sriov_gt_pf_policy_has_sched_groups_support(struct xe_gt *gt);
>>   bool xe_sriov_gt_pf_policy_has_multi_group_modes(struct xe_gt *gt);
>>   bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode);
>>   int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);

