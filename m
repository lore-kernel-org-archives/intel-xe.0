Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9315EC61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 05:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC7B10E5E7;
	Mon, 31 Aug 2026 05:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xy0JiX2B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2879010E5E7
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 05:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788154698; x=1819690698;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1GxBK/37UHBaw9Hnwt3ZK8OGEgnKld3Gk88faeWgYws=;
 b=Xy0JiX2BZhKT+YgxUMoSp7oBHh0ARHXy/8kGyISGdXM3OJPWV2n+mBXC
 IO40U48P1gDWPEaBBiLFNTVUaHw/puyGIagTVck6IKODcvfl3uaL9dj2u
 35wGyXIHzZOQ30Uaqpy3BQEeNmWQSl0XQR9nsBNGDooOgLYRBmQ9nLd4k
 uktCULW0NZLXzY9G0xHtxuhuJs5Zr4IpXAWedDXW2MuwzH7bDVdFscQ+W
 tO9arfEhtYW5mQxZ51UOhaX+xSUv5edrYeuFD7yM3Q/dy/i0AbfT6RnFX
 Yqwd9swGK1q67DXdT9NfytAI7pihRKwWbUwccIsbBQASP2bn27UYsWwU5 w==;
X-CSE-ConnectionGUID: WB83unsLQjmc+svgVwEJFw==
X-CSE-MsgGUID: oque8AEwRZmEX/DsXLW6Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88476328"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="88476328"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 22:38:17 -0700
X-CSE-ConnectionGUID: 9/HUDRxjTqGhperI4iYLGQ==
X-CSE-MsgGUID: GjbRZW0kQkaLV13A62/O6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="266124570"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 22:38:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 22:38:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 22:38:17 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 22:38:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVjLixjDW9X2KzXkdIKC//7UlyMkx/9qJKbMqGdaMwGlZAjqOind39iLC8PrLNhx5prsSKHzsuNgvAsWBWiwlAM+16AS5YxWM8hAa8+m3LVtkmV9OsZ4TjF3eLMyDZ1JzfX8qf5MSqCwAtUH7FqMxZ4wB7l8gFuuhKoH8VzkpRA5nyir2DMWIeF3d2X7LmO1PZiAwxvoYgzhV6ApzJvejod+sla0UltYnx8AcGG7YBIT/M98/nNl/30sdKyyGA3EgwWnCue0gQxkg76uWYDki2X62Sm71a3emtJYuf1RhJ3IfLyCCMzcD9HVJbk55krYRKRhphcGgNyKauhVyecRsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnZZ1onhVD/SXXD3DfVlFRTJMlL9YW1vMSkg3dnKEPU=;
 b=ta3DhMqM6tBKCn+pmx9IMbA0CcrmAybn4Ztud4jlMOZgAsQoAg9qRjYgqPhuw8qCOFDdlE9zGR7MsRqK3aHpo4HL4ptBpVBD26Ml3mGmQGNQzcvoWbU1yBh1mDGCfKFi8gvgOsOa+FfNC9q9Cr/asWk/9dR44XhC5Pu9swFHOTfxUULtxI0FLuHFN4pmAFjegD9lQVgUO0R+4YXJCPXJ34/xsmbFbH5Y4R0LlLev0nCGM046W2PQVR9WVmlpndQen5x8eDgK3rOb3dIFSJDuC0rYIDNnWENc7Iv6MR5sOr4x3xfTLylzlcyEzW9iKH6KPqoxH2jKbDIu+SIklOpybw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by SJ0PR11MB5937.namprd11.prod.outlook.com (2603:10b6:a03:42c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:38:14 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:38:14 +0000
Message-ID: <82a95a75-7bb3-4a1f-8320-f95f73bcfc7b@intel.com>
Date: Mon, 31 Aug 2026 11:08:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/xe/guc: Report CGP protocol errors using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
CC: <rodrigo.vivi@intel.com>, <badal.nilawar@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260828095803.2130312-1-arvind.yadav@intel.com>
 <20260828095803.2130312-3-arvind.yadav@intel.com>
 <47ec309e-8529-497c-9401-6771d76a0a1d@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <47ec309e-8529-497c-9401-6771d76a0a1d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0131.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::19) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|SJ0PR11MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: d9092c70-5b2e-4306-b412-08df07220d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|56012099006|3023799007|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: d1GwYktzTdl+ePfA5LBYcwJAIKjtcoyF/zBkYfUCIy2K37TFreX2128C25AKBnW8n8qr3dOvY7N2y2AkxQDYSMw2Figvs3TXq9LUNcX3WGc3KseSslyUQ4xm7PlHxJOypdWF1rKTw83nXkV0I+dqiCI8FdZPkEUrQ6tTAoPyLEkDdCKnlLd0Ebgi9vY/3IFcdo3/fC6AgXjlMWV/kBPGmBKV5auP5WmVVbhfUyXvdsxE8WleZZfLiimnNcphnQYrvN/0b/tmlJ4HXEAQk9QoybwnaG/WLK0Gxw5W+NngfsWs18tpc+E9rpRuKOOxcYQ/C4Kbr2XLE5yggf3oNGfPOddNPD7FuTGlQ3liiM8ez4PkgsWLd1jK9QFhPIODRwcrrDaq0vGPtYwtFCRhjG/6YxWhNvhjiP0e/mx36trcxfv2P9Q0LMQQkgvc5fT6BmcNBP49rPfQ/dnfT67d8TUhWg2ya2pNL4N+gAJ7se+WXah9/KQKMMPAY1A8wmT2ooaVRIAUZcnauAs8YV2Hw4XRxFMaF2RJtsEfEGPj+8iFn/IAQ7jp4BlfPLz/R98hzg5UQwejEvvUpU9YdLXWyL3Tn9sCFrw+gF+NbLQ/wMtSeMNlowiELCvQ2W2zajDfz9rv1dC8b+g/b3eAcEZeJozF4Y6DMcwbQ/q9Nzjr8YM+QKw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(3023799007)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVptMmZ6VmpkOGpCWm1ROUdTODFDNFZLM2hlbDJpbDFxKytjNFdBcHluUUli?=
 =?utf-8?B?T2RYS3BjWlZIQTdyUCtEbk5lUlZvdWsyVjZlZ2VqYjhjVTlNTDArVDNhZk5B?=
 =?utf-8?B?bG83c0hKSWtTUGhrV3o0cWoyZzI2ZkZCcWtELzdNMDdZMVVJaDNBTXhNSWR4?=
 =?utf-8?B?Z2p6MzBGSFpjKzdqekxXaGxLRmovbXBhRXpVcUt2d2V4WDdSYThpMUZVS0ox?=
 =?utf-8?B?WjB5TWJBbHRsSHJaSlMvamNyMzc1RXV4Wmt6Nlp3M2hqRE5sWThiRGVhZFFD?=
 =?utf-8?B?b0piditQbWNicDJYWVFjc0QzR0IxeWQ2MlJLU3ZnTVpCYUZNQlBPeUZHcDdM?=
 =?utf-8?B?MmZxRk54Yi9SdGYxdWM1RnJ0dHgxUUNOTjFha1l2UWEwTFJtYzBzc3c0N282?=
 =?utf-8?B?UmdEMjVSZS9vZkdFYy9hZWZ1QVVJN1NWZzlkR1paUTVKUlRxU25yU2o4OGlW?=
 =?utf-8?B?a28rMXppTUovU0FpM2VRcjRRRnFWY2UrRUYxNnRDd3p2cUxuVHRCZlMwN2pj?=
 =?utf-8?B?bEVGS1BSQ2UzZnNOSEdaeG16bGJWVkh5K0Qwd3dDV25TaEt2OGZlOXRSOUhI?=
 =?utf-8?B?MmtCL1N6bnRCeldYN2MvRk8zeUlFYkdLWUNsR2RLZXF2YjVuckJUeDJ2UTNT?=
 =?utf-8?B?cys3RUdPMlZaYVFiZGErZ1Q1TWNmSFpya1Mrc1R6Y2QycnBKdGhWR1lVNDR1?=
 =?utf-8?B?SnVsOUs5RFduSlV3ZU9WN3NGbXVkcmZWY2ViaGRkd0p5eU9sZnBzL0VMSmV3?=
 =?utf-8?B?M1NCOHMvQ2hLYWoxaVFpZ09Fc1JrSHF5TlVXUlh5QytIZjdMOGo4SFJIS2V3?=
 =?utf-8?B?UitDZ053Z2tFSVhZbmxYck8wV25UV3ljSW9EUEIzV0ZjUU9xY0N5cTZVbDE4?=
 =?utf-8?B?NFJ5UTg2L1V1NnlaUWtLQ1lvMHNmWWFlWXp5a1B3SkF6blBQQzdiQ05Demc3?=
 =?utf-8?B?ZUJqUE12dEV3djNZRmNOOSswYUlCWUpVYlNuWFVlZTV6cHBqNVRIZEQ3STJq?=
 =?utf-8?B?cjlHS2JCQ1hzeU9Fdmp2bitucVBjdFpKQXVqbzF2MWQrUmM5T3dGT2RXOVJy?=
 =?utf-8?B?UTFXdVYwdXNrZGcwdk9qL1dBcGN3NnRxcUQwWkRvU29IVnpwWEpyeVBPWU1v?=
 =?utf-8?B?WnB1M1dTRXdvR0tiTy85TTRVUkQ3S296TE5hTHlxMGt3elA3U0hySjNvaVQ5?=
 =?utf-8?B?d1M5ZUNGVDlxcllNU1ZMSzFTRlM4RUg2SThkaWlKbHA4OHpKRjZ0NlJyZ0Zw?=
 =?utf-8?B?WXZadHMyQzBaTVdPQ000cnAxRUQwTHE1L3JPZFBRY1RuOUJYdXRtV2xNL1ZK?=
 =?utf-8?B?TWRiNWZuQmlWNzZrYjNzNlZ4eWRNSENnOFY0K0JybVV5Wk1rRENZWDBwekxI?=
 =?utf-8?B?N3AvNW9OZ1FmdUMvYm1lNEZYOW82Y1VBTW5GNjEzazgveGtPRE9JZisxekF5?=
 =?utf-8?B?K3RKeW03N1hBMlRMaENBRGVXSXRpWTNQaHJPYWNnNlZxd1lPSlA3dGZyN3VB?=
 =?utf-8?B?WlRuZHNLZ1NHQzdLdjFQeXFHSWordElzVnJmRy9FaCtSa3RnUjNhS3dNcmlS?=
 =?utf-8?B?RWFUSkE4T1NTdCtCdkY0ckwreVZwZnBBVEMvM08wRUZFSmZYMElJUVpQV1Bn?=
 =?utf-8?B?UjZNb1pFcUQ4SnI2SzFJaEIwYzZ6UjZNRmlJNE9ZVzhJZXNUMzZmdFo2OVdL?=
 =?utf-8?B?VGRyY3BWWHNQOHFMQ1FTNHRBdVQ3NnpmZHEvMStMaGdRMnNzUWY2TVJOVEgv?=
 =?utf-8?B?VzVrSFpCSkU4cDhwRzljZFZuZnlsKytyZUpsdWw3MGdWZUdnSlFqN1NXWmtL?=
 =?utf-8?B?b01KTHVQRkJrdU5wbGZocTBLcHdBRXhUeEtpdTUvOUYrUStvRXdxK3lwYktH?=
 =?utf-8?B?aURoeDVlcGdhRzZab1g2WmFlZk5Rc09hek9sT0FNZkRPSDlvZUluM292dXFx?=
 =?utf-8?B?ZlN3VzdlMWhFUFNmSWRid1hmaTlybjBlRk1kVGxjZHZJZkZkV0dINzF6dzV3?=
 =?utf-8?B?cjdQODcrSXpvSTh1M25jUS9sSllub3M3bXNQZ0txcWN6cU5INnNjaHNLR3Zw?=
 =?utf-8?B?SVhVOU53Z1JSRFMxRmtxWWxucnBueG5naGlOVlRGVm5WcFFhR3RpbFhGSUFM?=
 =?utf-8?B?T3hHcy9SczRWQ3dWZmFERk16TFBPSTQvRmZVSDlBbThrZ2JHY3FOQW5kYjl4?=
 =?utf-8?B?dlY2RkUrbG9yQ1BpYlhzTldtb0lIYUpDK2pScmRmQjFuMVlteTNZZ28zL3Jx?=
 =?utf-8?B?d1BzcVJjTmt2c2ZOMldBTVlXZGlrU2lPaXd6dXQrU1V3d0t3aXZDcWtIK25i?=
 =?utf-8?B?UHIrNWJvNGdSYmRaRURjMzU4L2tqNVZFS3ZuOEFUSVVON2FhbUY4UT09?=
X-Exchange-RoutingPolicyChecked: cG1uRbi3pMOu6axA1KPq7Ayx0Zb5zbVXycn7+gz5ABWqFVWBukUf3YmPKbdfvdrDgGca5uSqBbPUHRsbikSg5duwniESGPT+KU1yfsm5lbb1Veu1oKnFA0ZBOyg0dEJx1s/n1pAqOqcxm3uodVXaWQmXgro4mbI68Mzn+MhMbQmhlxDtxHPD5rsXnoMcZ6MrNJQ32vNC0ni4xhTjGoGPekI8xFkviZngXa7eWuEB0+/xCgJeQAc8hepLvOQ3lV49LO6b+JCwghnslODI3Z68busopj9zIAiUm7APElT0jNACwOongY0TeQE/9xLUweRhVM9M2OoiQBoazOxLJi537Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: d9092c70-5b2e-4306-b412-08df07220d2b
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:38:14.3962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvfYg+FCgcRpL1FkYW+WJ+uUlXNSaaFwtXfFfJnpvsmI8BtVtv96/mloYBAEY/LIGWmMe1wa4A+lD3YZdwSpZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5937
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


On 28-08-2026 16:07, Michal Wajdeczko wrote:
>
> On 8/28/2026 11:58 AM, Arvind Yadav wrote:
>> Route selected GuC CGP protocol error logs through the structured SIGID
> what is CGP ?


CGP is Context Group Page. It is a KMD-managed page used to pass 
multi-queue group updates to GuC.

>
>> logging helper.
>>
>> These paths were already reported as errors and return -EPROTO. Use the
>> GUC component, which maps to XE_SIGID_RUNTIME_FW, and pass -EPROTO as the
>> errno value.
>>
>> Keep this conversion separate from the reset-request failure path because
>> it reports GuC protocol/message validation errors, not GT_TDR recovery.


I will avoid adding SIGID logs in these handlers because malformed G2H 
messages are already reported by the CT layer after the handler returns 
`-EPROTO`.
I will drop the CGP SIGID conversion patch. As per you suggestion we can 
send separate a small cleanup patch.

Thanks,
Arvind

>>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 9 ++++-----
>>   1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index c1d469624215..0bd84360f38b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -3508,12 +3508,11 @@ int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc *guc, u32 *msg,
>>   						u32 len)
>>   {
>>   	struct xe_gt *gt = guc_to_gt(guc);
>> -	struct xe_device *xe = guc_to_xe(guc);
>>   	struct xe_exec_queue *q;
>>   	u32 guc_id = msg[2];
>>   
>>   	if (unlikely(len != XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN)) {
> can you prepare other patch that will move that
>
> 	#define XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN
>
> to some GuC ABI header in the abi/ folder?
> it shouldn't be really defined here
>> -		drm_err(&xe->drm, "Invalid length %u", len);
>> +		xe_log_err(gt, GUC, -EPROTO, "Invalid CGP_CONTEXT_ERROR length %u\n", len);
>>   		return -EPROTO;
>>   	}
>>   
>> @@ -3546,13 +3545,13 @@ int xe_guc_exec_queue_cgp_context_error_handler(struct xe_guc *guc, u32 *msg,
>>    */
>>   int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>   {
>> -	struct xe_device *xe = guc_to_xe(guc);
>> +	struct xe_gt *gt = guc_to_gt(guc);
>>   	struct xe_exec_queue_group *group;
>>   	struct xe_exec_queue *q, *upd_q;
>>   	u32 guc_id = msg[0];
>>   
>>   	if (unlikely(len < 1)) {
> and add define for this magic 1
>
>> -		drm_err(&xe->drm, "Invalid CGP_SYNC_DONE length %u", len);
>> +		xe_log_err(gt, GUC, -EPROTO, "Invalid CGP_SYNC_DONE length %u\n", len);
>>   		return -EPROTO;
> and I guess we usually don't print any errors for malformed message
> at the G2H handler sides, as there should be a full error message
> generated by the CT layer after we return -EPROTO error
>
> see xe_guc_error_capture_handler
> see xe_guc_exec_queue_reset_handler
> see xe_guc_exec_queue_memory_cat_error_handler
> ...
>
>>   	}
>>   
>> @@ -3561,7 +3560,7 @@ int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 le
>>   		return -EPROTO;
>>   
>>   	if (!xe_exec_queue_is_multi_queue_primary(q)) {
>> -		drm_err(&xe->drm, "Unexpected CGP_SYNC_DONE response");
>> +		xe_log_err(gt, GUC, -EPROTO, "Unexpected CGP_SYNC_DONE response\n");
> I'm wondering it this should be treated as EPROTO ?
> what if it is our (xe) fault ?
> maybe we should print some more details ?
>
>>   		return -EPROTO;
>>   	}
>>   
