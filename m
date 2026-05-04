Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB7FCD342C
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 23:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02B610E129;
	Mon,  4 May 2026 23:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f1rliSRy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526A410E09E
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 23:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777939190; x=1809475190;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=moDAa3uhrnSjtJ5s2rNHcROpbV2hI6bzhg1mL8kX/L8=;
 b=f1rliSRyyiwGOdsIsxcN8gSYi94PgJyOIoeP8Y68tbpOXZpELQASMg3j
 F33EMpRzkzgiEqROB7sPh1uobYYhIfN7wxW76RyHuDCBs3pSXzOSIeFsG
 JjcD92UjsUtwLnRM4Pps4nEyx/Ilm8qc/bAOkSKeXaYt1hSQ0mTT41iVO
 YewS1VPZc+jcgOjdcsA0OpZfsSJBaSYgKZdQQqe6MO26Ilp/HD8KDDIEB
 pT35FYReHfivkPc6768CXDZAINjCqG13fC+af9oY7/A5basAQshdPU7ui
 FlmAQeDJqeNkrrQc6sAu4TSUOscXjIZMoQoU6OpI8VutH/baw+zaPByq8 g==;
X-CSE-ConnectionGUID: TjzXgBaURkuX5iUKM2q7WQ==
X-CSE-MsgGUID: hCKXpphzRq6U7zjzdEtYng==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="77961046"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="77961046"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 16:59:50 -0700
X-CSE-ConnectionGUID: gk7mOshETWS51S45HMHqTg==
X-CSE-MsgGUID: 9AvLl8CMSSaaswihhUUaGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="235708133"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 16:59:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 16:59:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 16:59:49 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 16:59:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmXmKVmK0eVs3DAR8aBmFF6F1SYx9dk2MgqhH3i0mHThqNNtymL5+LMJOgr3LHirRqK47FkOJoylHrRjdpT/NFEER0IxSlwYtQz5UqBZswTpV+MijcZJfIOS/oobkpZDtqdGEx2pDenRPhR+0JRWo23LjnWodS2WCBqqfA3N4ZAQxDDMvhYPEIjp03xk0HttmEXAxQmK8CQkIsDmT7/qyXO373g5sltaoVuv5KuirAQ4CTQkF/HRgxCqKPiKjTz1BZeyxiECn38TOkVHLE//+tMqwXYvM9kLP75hA7gLZ0sK7t7Q8nXVzsDXDbiWaEw+5qUfFMW9TbYwhiDImXJlkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVadwNMDsKZmFAzFENyJigGWfgVQ3/jyLUXDB21aw58=;
 b=K0EoXuD5iyUSbLcCO2bCUK/hcGbIKJPAjdDj56S4MfVDc/gc3aG6x4uAPbc7XNpyBKaGQGjsAylzdwzg7NFbXiUKwhqV72716jPcQOYbqbKA/fnDwh5hZBXZ77b4467p+NjzLCvpHsEFG3FcPDLuIaUU3bPPhILmbIcgPOvsHeadLoOjKMB2U9v/shVmOUDHji0+VjQdbSKPrmi1SeyUSrTYuLmg4gqoM+rbheamZh62YJ1lNBt3BXnxEHi3o29auNacRsQqLCvq+SbTLREFz8JncMe28D0sz3jPhnA986WFPtX1xrwHw6n7eMSH+BUk1RC7tv9CTQs80GuRHn/+RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CH3PR11MB8154.namprd11.prod.outlook.com (2603:10b6:610:15f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 23:59:46 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 23:59:46 +0000
Message-ID: <68c4aad8-851e-48af-9a38-59039a123482@intel.com>
Date: Mon, 4 May 2026 16:59:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/xe/guc: Exclude indirect ring state page from
 ADS engine state size
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20260504094924.3760713-3-satyanarayana.k.v.p@intel.com>
 <20260504094924.3760713-4-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260504094924.3760713-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::8) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CH3PR11MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: ae780711-cf47-481a-c78c-08deaa3937bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: I6iY+5Lf5+5NYTTbYrtZ+lfPWMCYcl2frxT4OnB2GpPo/xIHxWriSFtgsKwtyJ3dO8SB9LaqlNHNSfWVYRHw0TVT3+Ajfydn7Rz/UNctWAKRVWgPyWEim9Ua2g9fdkcHPIf/OaqRJh/RSrThffsBoxZqOzBchZEd72J5mji+oEawqzq8BNohMHn03etq0TorX95NGdyMANnnaNYm/9JxN989RgXGjid5M0+8PCSmEgfcfxNy4A2yb0l2Wd3N1+ZV9NNqx4MWeIRdwMx+UBts8eRNnlcIIVR33NQzkvBHBGlynZrpTNQ/ZR2fCU8Xs8o7cC+nHo39NrX4bnXWi2tT1OKi6NsY6PBhaqKMMLt4xfALir28Ji9KBSo1jPrTlEMmKjF+uRJm4VBhquXBuO+e2nDnMF8YRtpXy82BvlZVEvszsTU0tg2nVQ6+fvBKWvUTKee4CehSdXbp9Nj6TS8NAsRch04FKrgrIZa4rSi5fIe5pEm/A3IVkbNDh8vreaRe9FepM7cN4kDZxwhpc3CH0Gtn5xflftB/lIX8GaaLnfsjd1LxdvxXddKcb+HGEDUMrDmiy5ElrBJRuEGysxHm9S8vzlDQDgff5xeYwX6tOx7ZN6QbYhoz1HF9nABSbetc1sBLNxol/BwcPkZwGaZDnFfLElHKcO4+o3aOdz9fYSK4OcvwHctFHgQ5N0+wx/R3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEJucnVtLzI3VjlOdjUzQnlwYXIraDlHSHg0dWRGYW84QzZuV1lKZkQySXlR?=
 =?utf-8?B?V2xvUWNJSWZmV05rN1lYT0dqMjZHSW5CY1ZqeHVpTWJWT1E4cisyMmVUaXR3?=
 =?utf-8?B?cHhNcStWczBnWm5ubFJhUWJTMVFMZlNENHVSbHZtRkZEM0tiWEpTUy8wTmZ3?=
 =?utf-8?B?SzU4NEFBTXYvZDBsOTBOckxNWGtJU3NobkkyN2Fwc1RLcjFkb01MejVxNGFx?=
 =?utf-8?B?MGpVeEU4OEZJMHRPa3RQWWhlQjhiMjZNVE9CVVVPNC9QTlRpU2JOdFVBd240?=
 =?utf-8?B?S0REUTlQalcyVkNsRWxMUDBzTlRwdzBaNGtBSGxxVDBodkZaVUYyendkOVdT?=
 =?utf-8?B?dUpxSXJnb1NZd2ZGd0JObjZ1dFZPejVSZ3N1ZS9TSnMwSTE5RW5tWEZseTY1?=
 =?utf-8?B?TWVuNzFNL3RiNkhUZlJFY1NVejQ0eUJMTE9WZ3R5SXhHWVVTNXMxQVNQdTFR?=
 =?utf-8?B?d0lZZEI3S1I5Ym16ZU5tVFI4aUxjNExZcnlKMTEvWHQzbmpyVkRVU1dEMURI?=
 =?utf-8?B?L2RNT0U5SlZrMnBGaXRrK2VMN01SNTJjTXJMbTU4a0g4c0crblRsOGJCWmlR?=
 =?utf-8?B?eVZvbU92bFdaWDdxVUJzOE5yYkNxaytWN2l5czl4OG9YbEhXcWF1clE2amw0?=
 =?utf-8?B?YkZ4c2Zjb2F1RjJjNGhYTkxYMzNiZzFVQ3JYTUZNVzVOZkt6MWFEVVVTVHRO?=
 =?utf-8?B?RUNLd2VLdE9pVjh2QUJyZ0NsK21NRUxnSVZMMmViSjVqcTBybmJGT0oxOVZ3?=
 =?utf-8?B?VkovclVxc0cwVWlQeGpmVXhweGNQMXcrL0pRRHBENExvM0kvUHk3dS9qdjE4?=
 =?utf-8?B?VTNJY0w1VE5hLzRVR2N2cE5scWVjMC9BbVc0S2wzb2xDRUtsQ2czTXBjUnZa?=
 =?utf-8?B?VUFiWUoxYzl3ZDhydjNsd0hjL3RGRFkyNmViYWEwaUtIVWxGcllOT0pTOG15?=
 =?utf-8?B?V3JLd3FwQzU2bEw5VlJFRThTcU9jeFFta2F4aHFkS0R1SHF1T3lLK2VLOEVW?=
 =?utf-8?B?RzlTWW9hOHRxbmtMSGZjM21IMGZsQmVONDBEd1FveXNWOWJjTW5mU3NqUmRX?=
 =?utf-8?B?ZUh4TFdqMHliTkV1bVR5WmNVSXArTEJGS3BRQnVDbDJ0ZkNVYW9MSHVrbGFm?=
 =?utf-8?B?U252RWw3SnZBb2JCUnFxRVJXU3F5TVR0YXFqNGZBK2pub1pGMTBKZFM2OTJ3?=
 =?utf-8?B?cUNXeDVLUmttcG5VOE1UUkRJSFpMOURqdFFlU1MzK1JVUHBheUlwNHF1SHRU?=
 =?utf-8?B?NEVlNzhhNkJoWVJXZmd1NTBpOUFOSXZiZS9uNnhCMVdmWStwb2todFhzdFB3?=
 =?utf-8?B?QTFwZ1BhZFlwb24rYzMrRFVleXovYTNuUTRxOHFQRDFFbCtPTDFjWm9lK2Ix?=
 =?utf-8?B?WVBNRTFULzljUEZRV1FIWEordjNhUkVVOTR3bXVTMGtNVXEvOEhxZW5XY0NZ?=
 =?utf-8?B?d3BXR2ZyVWg5NlZnNUVZSi9OUmJYRDlUbXJPVTdwTE9sWTlORWFyQ3dZOUNq?=
 =?utf-8?B?VUk3YlcwOHlKSG5VMFNqcDVEUmxHZis0QnRlZU9HRnV6aTlUUEtQMStRTGY5?=
 =?utf-8?B?cjZTRmhFUkk4OFMzYXlSdjBKemZIbmxkd1hFSHVaR3c3STRXa3ExUzEzOS9O?=
 =?utf-8?B?TjZyU3I1YkxjMmxhZ0UzWGtlM1hmVW9QSGI2RnQzTE42MmEwVTlUS3BCc0F5?=
 =?utf-8?B?NitsNjd4OWxXOGdadGhPNjhqOGtHK09RcG8zVE15bWs0NHFiRVF0YVpTVVpp?=
 =?utf-8?B?ZDVYYk02QURhMkgyY0hsSUhKdGtLR21RV0g4MEJqeU13Z1BaMGZzaFBPTmdB?=
 =?utf-8?B?SnZaSURTeE9QbGJ5UVh0Sy9QYjBlM0FJanIvc05PbDRQTld5bTM2SldrUktW?=
 =?utf-8?B?TVlRMmcyUlZ0aUJhR0V6RXVGQmptMmE4YjFNWFpjeTZPV2hvQTNOcjdHMHRz?=
 =?utf-8?B?UHhYY2hUSFZGN3VNdEVwSzd6blo3citOb1YyV2tCWG9QY25iVTg3anZMeHZz?=
 =?utf-8?B?TE5rejcxSHFXdUdjTUFrSnpJeTBCeC9SeUh2UkNjUHc0YitFWmNIcWM1YWpm?=
 =?utf-8?B?UWlpZjJmRjNMV0lDamJaWlA3aWFlK203a3FUM2ZBM0pGS1Y5YkNxcENHa2Fo?=
 =?utf-8?B?b0ozQSszOTdCdkRrcDVNL1orN3AwQjBKS1Z0S2FzeWw1MUZFcG1STTNiQXVh?=
 =?utf-8?B?NkptSVd5a3Vlb0lPbGxTWjRBSWJhMVExYm43aWcwa2xJazFhUS8wbmRoZ0xW?=
 =?utf-8?B?NW5yQXpRL2U1K1MvTGFDdlUwOUFsR3dSeHRsclVoM3loeDJNeDU1SXZodzRP?=
 =?utf-8?B?QndlcHVmZTMvLzU3Y3lLQUdveHpIVUE4T1pReFlXeXlkaDN0b1VGWG5pRVlD?=
 =?utf-8?Q?U64B5grcN0D3/E4w=3D?=
X-Exchange-RoutingPolicyChecked: etMQIoRsV54arcGiJL2nFvUf8wedmJjCpPQaFFKUBtT5k9nX8yVReL/c1a/YAOKRjA+vG2drG0UnaSosoRQgYPgY4pVss72ZFBm3eMa1ULeW5kI4/YrFL0sjOSRXLUsDpsD1lUsMHSPIBPXw+8z5TDo4RUPD29yAc+9RNK/lKcU9SN+KzgGiZEPShV1E1s5qtshPtPZeDxjNskBJNNAfgivBQOEmEDuWKtaYs4wh0vSJ9Dez+ODXBvwbDLvr/V+sM9y5dugOVN32+FipjR3fcrE1LrBmMcarmUC/38aQSzfW0moVIZOUpcQxYTVurRSqHpANGCUiXbUY9kx32+mBtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ae780711-cf47-481a-c78c-08deaa3937bb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 23:59:45.9275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zkv0CFZA2xrAIeZ7iolSDi3VRfxYk7sC6Nr5kDHbR6lgIsUV6vYfvoL6tFyr7oKk5yJC3UakkdeHoIM9dznLfiTJYlGm82t4K0DMClodeuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8154
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



On 5/4/2026 2:49 AM, Satyanarayana K V P wrote:
> The engine state size reported to GuC via ADS should only include the
> engine state portion and should not include the indirect ring state page
> that comes after it in the context image. The GuC uses this size to
> overwrite the engine state in the LRC on watchdog resets and we don't
> want it to overwrite the indirect ring state as well.
>
> Fixes: d6219e1cd5e3 ("drm/xe: Add Indirect Ring State support")
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
> V1 -> V2:
> - Replaced xe_lrc_skip_size() with xe_lrc_engine_state_size().
> - Updated commit message (Daniel).
> ---
>   drivers/gpu/drm/xe/xe_guc_ads.c |  5 +----
>   drivers/gpu/drm/xe/xe_lrc.c     | 11 +++++++++--
>   drivers/gpu/drm/xe/xe_lrc.h     |  2 +-
>   3 files changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index ce651da6f318..b9bca6084a4f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -515,12 +515,9 @@ static void guc_golden_lrc_init(struct xe_guc_ads *ads)
>   		 * that starts after the execlists LRC registers. This is
>   		 * required to allow the GuC to restore just the engine state
>   		 * when a watchdog reset occurs.
> -		 * We calculate the engine state size by removing the size of
> -		 * what comes before it in the context image (which is identical
> -		 * on all engines).
>   		 */
>   		ads_blob_write(ads, ads.eng_state_size[guc_class],
> -			       real_size - xe_lrc_skip_size(xe));
> +			       xe_lrc_engine_state_size(gt, class));
>   		ads_blob_write(ads, ads.golden_context_lrca[guc_class],
>   			       addr_ggtt);
>   
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 9db914584347..fdfe2ed5f683 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -727,9 +727,16 @@ size_t xe_lrc_reg_size(struct xe_device *xe)
>   		return 80 * sizeof(u32);
>   }
>   
> -size_t xe_lrc_skip_size(struct xe_device *xe)
> +/**
> + * xe_lrc_engine_state_size() - Get size of the engine state within LRC
> + * @gt: the &xe_gt struct instance
> + * @class: Hardware engine class
> + *
> + * Returns: Size of the engine state
> + */
> +size_t xe_lrc_engine_state_size(struct xe_gt *gt, enum xe_engine_class class)
>   {
> -	return LRC_PPHWSP_SIZE + xe_lrc_reg_size(xe);
> +	return xe_gt_lrc_hang_replay_size(gt, class) - xe_lrc_reg_size(gt_to_xe(gt));
>   }
>   
>   static inline u32 __xe_lrc_seqno_offset(struct xe_lrc *lrc)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index e7c975f9e2d9..5440663183f6 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -130,7 +130,7 @@ u32 xe_lrc_parallel_ggtt_addr(struct xe_lrc *lrc);
>   struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc);
>   
>   size_t xe_lrc_reg_size(struct xe_device *xe);
> -size_t xe_lrc_skip_size(struct xe_device *xe);
> +size_t xe_lrc_engine_state_size(struct xe_gt *gt, enum xe_engine_class class);
>   
>   void xe_lrc_dump_default(struct drm_printer *p,
>   			 struct xe_gt *gt,

