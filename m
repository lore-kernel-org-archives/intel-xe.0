Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE95CD5BDE
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 23:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8CD10E14E;
	Tue, 26 May 2026 23:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TLXFbJwn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF86810E14E
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 23:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779837695; x=1811373695;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1R7wEoYg/n/2yQOzG/DTCemIzTpp72cQ3nleJrcEdF4=;
 b=TLXFbJwnwuTd8o10DF5/UpdE1UmNcHdbfOSh7dJ8kWjt2OPvsyab9eU6
 TkJJghtx/G1CVGS4E04KuR7mryp6O77/iz1t123N+8WEW/tZ7eHOFObBf
 znRsFyJfUOh/FZlqFwBuswgFesWSMA1nw9RcMZFuLksCUtYD9r04TLyef
 iVfSKTT8gFx9w89YSehKfCcFG+Vi1t5nv7wt1MLooxs81jb18ok1Zjtv3
 bnln+4T1pz05Ma7CbZKlSzj/K69hSAzQ1YXMr7tKBngq/QcZxEGpvFsTW
 wsSGylwWvYChOPoX/5z3XcG7zp2jtL3bIxpCiriSckX6AMi6va3oLSOFo w==;
X-CSE-ConnectionGUID: TZPzkfXjR+Khw8/oEZhlkQ==
X-CSE-MsgGUID: gbDxRaivTgug4TwbRULWcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80572137"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="80572137"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 16:21:34 -0700
X-CSE-ConnectionGUID: eRjHdZ2sRKmqjHZd9ONqSg==
X-CSE-MsgGUID: SwctMFC+S+Wd78bBoJCA6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="237893401"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 16:21:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 16:21:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 16:21:33 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 16:21:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMCU3d3oaXO4WTmeIfkqWjoBhYmxJmLlThxNSOmb0QwLjEier/Bp6HJf++PQMTCciQ8ARO+QUD1pOUVFVF1T9wb37Y9qMN5CuE/BmZwWHmofC+lOAXZ97uvksMR3IEsoIE7TZAVbuNOki1wBHlm91I/gYy301EbDTOCT0y52fsQ1bAkVEwPlH69b3m8G2ya50Lheb3vu/TKDIO9naghW+x/LKykmOU6A3GQR3qorTzIOIECKYJKzx/WV3sXf4hrZ6c+WYNkV/cS1E6cuDHXzbUnifY/MrxVXsjDF6xpl1XH7r+hHIBpFH+xuO2abYlNBJ/9e9GVoJVCi8s56YhUMpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJ3N55UHvx7zDkpCOfAzuyN2in6DT9hcA5b05S+Vpb8=;
 b=mA6gZWCwfcUcTaokwEGjlmULiapXGOn2m0Dn32QlRQdbTi18GYaHm+CVoFzWiRrgiydOdadw3UUHjn5jl1Vr+IMibui1nVLq3PkkzAeqCkvwSupNz5r/XQbxhp2SPfw+m62ElItdFx9UecS+uqpI4D1ZsR0BpNqhDs2QRpnx9+JwutiUTSHOv8//KVEggOyDYPwhxx6KdtB6VZDaifRvx9ZccxwGawsM9wtzTuM6fLJgoYfVFRlItplDXplYF6bdV3OD5HvsAnaip/rWA3u91rp+naXaxf18D6kQg3R8EztoBSb7GQC6jxMeRRmLluXseUHmGAEDHvGRPq89U1DDYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CO1PR11MB5201.namprd11.prod.outlook.com (2603:10b6:303:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 23:21:31 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.21.0071.011; Tue, 26 May 2026
 23:21:31 +0000
Message-ID: <5e63fc7e-7acc-4fca-9384-8f4d62ef0b19@intel.com>
Date: Tue, 26 May 2026 16:21:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] drm/xe/hw_engine: document top-down paging
 requirement
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20260526141901.62207-12-matthew.auld@intel.com>
 <20260526141901.62207-21-matthew.auld@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260526141901.62207-21-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:a03:505::14) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CO1PR11MB5201:EE_
X-MS-Office365-Filtering-Correlation-Id: 21208f2a-10f7-4709-1e53-08debb7d84de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|11063799006|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: HGZnEKBZhKKwvth799Lou61gBxJaIIdN2nCo2pCtsySFOghh2slyU/HaNbccGIMXLd31wNIWtj8lUmqn4aRtaVPXSnmPtz2aIrL0urEzNX/DbDMJcmS7u6kN39Nue83RG1ZkXbBWfLEF1OO4pTeXCHXreGzCKH4zqeyXBie7IF9r6LS7qPCkk//jvR8Dc6+UT+ug6X8CbC1BTmuwRZbkMAHEbJVfdRP+ruUWj52dOPwQb9NBZTrmZFx5pEZkio5vIbRdOEibwNnNytZTFPzCzzWP3ut4yGvMoKGddoNz3fqyKzslDSFRPru2/MhkiOh4F8cQQMxMmJQIk0tvW1NJM0WkEV8K0t5Fn2P/ppcW6z1Z4YjIOvxvWmA3Z2o7pQSpongRfk8halbRx0y5u+m4tUDlwqaVDIlArROHnb5QnZOsQU+3+gvTwvL+yZ/NqzZSiYTq56+KOgFir0+6cTmyP5cFK1XXfeeL+fSD0cZvtnSr9xraAV/jixxEWuqNdBk2G1NP+XS3Di+yQYke8Kd069s0gm96j1mMBYE4O1Nz9vDz7bojelg17dZM+hj6PCi9V8L7U3Z/CD2sfhOeduyTQ1NME/KkyMdA+E+n4r8xBGmvcGCbRwFD17WGQldhfWIbnQXONKff6nPjY4CL5FV06YRs3JPFEb2i/L28Kec7QpKVJbezuFsUFaoOzJCzOkQd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDRxdDNGcWF2YWNTN2ZoSlRVNkwyQkZjNEV3MWN3L2pEVlJEWWJxREJYUWx1?=
 =?utf-8?B?b1o1M0w0T1ZCRU90QUdLSUlocFdEc0lVRk9OQm1MQU5pU0p3NS9kL2Zxd2dQ?=
 =?utf-8?B?SFUycHZaY0QrK3VJM09Lc3BHcm8yNzVWMHFTT1lTdVlWaW52MXpTR1JKYXNp?=
 =?utf-8?B?MkxqQTd5dUh3NDhaWGtZWUttZ05hWWFDZk8rbDdwc0xWL3ZHUlFoS29qS211?=
 =?utf-8?B?T2NCVkZQVWVoRFlvaEpDS2t3ZEdBa2RGR0ZUK0pzcWxKcE9UclpDYzJzaXpM?=
 =?utf-8?B?eGNnTjZTdmxXNllEemN4RVdacjBsVXFhNk9zSFhJR3gyUEs2QUxrdWVNYzA3?=
 =?utf-8?B?Z2NOSFRMVnVTK0k3L0h2QXRCNGtpSFhNc2xEeS9GM0h4KzlmZ3ZiV1JlUzVG?=
 =?utf-8?B?N2FLaCtheWNZQmZXS1pYMzhKbkdmRjVxaEhYUUxablNkN0RMVXZ5cHNiWk5a?=
 =?utf-8?B?ci8vY3JGMEFMRzBoNVYrejJxZ1U4RVIvSkp5M1h0eE5sRVMvMkE0b1N4dHVk?=
 =?utf-8?B?cGMrL1BTOEtVWXdQQ1NpZHZ6NE9GOU1QMkErK3hqdUNwbE1zY0xxQ3FPYXZ6?=
 =?utf-8?B?YTdMdlJzWGJscFVwb1N5TVNiQ29XVTZEMUdCUjJvcUxTMklmN2hrK2JpTlVS?=
 =?utf-8?B?dlFKaHhiRms1eWplblUrNmI0TmhTN08xT3pkbGVXVmJWVU9QWmVOVHg4ZlNi?=
 =?utf-8?B?a0o3b2VJQ0lkM3hqekU1WkEvTnJoTnZkVHRCcTJYZVBTYUsvTncvRCt2bXJo?=
 =?utf-8?B?TG8rdFV5M200VHZKaFgydU53cDhVOHVlVjkrVTZ5K2kvZXZ5OHgrTmN3YmR6?=
 =?utf-8?B?U00wK0dmeGREV0QxNVU4SU9LbTNFQ2ZFYWtGZkd0K3hzbFZYV1oxVVhlSWx1?=
 =?utf-8?B?TjJQbmtyZmxYU0pIaXVJa0F0QXFDREtpdHg1SldDYmw5dkxRekZwT0xGT202?=
 =?utf-8?B?RWphaTdiVjUwR1gxSzRjL1F6K21FcmFDZHJUMHdOZFVBQitZVGtDdzJLZXY5?=
 =?utf-8?B?blFqWFJLR3NiRUFkSUU0L0lLMENUMjA1VW1JU0JWelQrVHVwZVA0eHplUnl0?=
 =?utf-8?B?NHNpNWV0UXBjWUlscGxiVnRORmRvZjMzRkR6ZVJMODJVYnMzeTIweHBpVnc0?=
 =?utf-8?B?TFY1cXpPbktVdTBoMUJDSmRpTmhuVjdwN2RLMGFMa1lNcTFMTmNOTkJwRVNq?=
 =?utf-8?B?Y09UNXFFeTJyT3NYaG05Vm1nZkhta0FyUkxnWEdBYjh3M0ZvT3BobGsvK1Av?=
 =?utf-8?B?V0pGOUxwM1lDN2x6bUdZRXdMVVFpbWgxUXZSWXRQVS9IUDRCNVprRWFwb2Mz?=
 =?utf-8?B?UDRTOHc5NlZaa3dGOEFwbTB3dHpiVlRmbCt2Ukt1VWp2UHJOdFFROVJtTC9m?=
 =?utf-8?B?bjB3bDR0UXVsL0ViOEEySGZOU0E0amtPVUt1ejhwaG5JZ3NWU08xSitOdS9G?=
 =?utf-8?B?ZmxFWm9YVmM2M0pwZ3ZpL3lXLzQ4bFpwKzU0UkNxRGs5YzZxY2IwbFBIMFBX?=
 =?utf-8?B?c3ZVRlUxb1AvclhqMlJMdmtSNllld1p3cEdzR2hDT252M0x4RTdPbitVdzdD?=
 =?utf-8?B?SE40dUlyVGdGMzBSczhDdU9iUjJ5N3dHNTdWcFpHdGUyUERsVUJDSzIzTGpn?=
 =?utf-8?B?UWw5Rkc2cTllV3NOWnkwczJ5MG9hb2w0U0xwTW9DcXJsM0Z1blo2SytsNkJk?=
 =?utf-8?B?ZU9IU2VMQmVvaG5lai9XT00xczdqV2FqdGg5bENGR3pZZDVMa0M5RlNpeGY0?=
 =?utf-8?B?RENWOXpBZWtBOWVQVFI4VnFabTFIM0E2LzBDemVGd1dOWHFQVWNjMEM2T2lB?=
 =?utf-8?B?UVJIU2R6cVJVK0tvMk1SN2NIMUZaRnY1dnJEWkZoWHNSaks4d1hmK2ppYW50?=
 =?utf-8?B?SWZ5bjlMclE4UzROMlJhSTlNbzJ3eUw4VmsyTU5RdGUrS3dHRFVOZStUcHFX?=
 =?utf-8?B?TjRQTkF4U21rblh5UWUzaEZHMlV6NkoxWGdkemp4WE9YbWFtWjBEcy9uNlRn?=
 =?utf-8?B?YnZ4azltTWRWTXN3KzN3T2pOR0lFdWMvcDNJWVlaSjllZmpSdGlZdU4vN0Uy?=
 =?utf-8?B?N3YxMGxCVG5nM1YyMXRBNnE2S3BTcWhZYmIxYllISmsvbUc5TWJZTXVqWW5M?=
 =?utf-8?B?bi8xYWpCemRCREZOb1RsN25qMEtPbmtuR09vdTlYUHdqcUZBb2o1S2RRRU1D?=
 =?utf-8?B?YndxakI4L2k3MUhhNE5xMDRpZ2gzem4xeE5LVnBDcysydUplQUxYT0xiNys4?=
 =?utf-8?B?YXp3Mkh5dFN3dTJzUDRIQWlQY2FINnNZc3ZVN1d0R2lRTVBWVUZISGViMkVT?=
 =?utf-8?B?YzlvNzQzK0pCc2V6UDRuRFNQdWptVFVpMkpzZDZDb2ZYV2hsOGFOTjd2TG93?=
 =?utf-8?Q?XwDowiDlZDucAJM0=3D?=
X-Exchange-RoutingPolicyChecked: VUSWERuJtBtCBRUwPh0/M8dWbniJYBN0pLXZ5npSe302t5SzqP9ACrgO42Zbh8xzxOg+5Xy7Ld3MmNtkiE8k0FYsJyahnd14l+Qz8KLV2umPD7Fsv4holAciQDYPQQKGHMzejMjQRI7ecL3QP+OtlGrmIDkXUcdIWaSL8etPZuJQxQI+465Ybu9/iiMzcgJo0R7tlO6RnPTXW7LMNy0YLaaHb0dMnfZSnauZtGtqHlILNgA7i9I2To35nmyAIHuRTwZDJQ2yTQPAcjdyVgKsNEOFdp26EFQKGm5+FzpTXgtp6tlTlMDyBirifgEq4fRZ2J8mMxgMqwCK9mDAPKGFcw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 21208f2a-10f7-4709-1e53-08debb7d84de
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 23:21:30.9357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mp/8UfizRrM1XxJwXly8W49l5qQIuZrJNuFgQInbfPpeiD+cF4gaUjnQGZyhmheoEBe/EQpmpX+Kwhguuuf/Wvi9t2+3R4ecS2e5yGhN4d0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5201
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



On 5/26/2026 7:19 AM, Matthew Auld wrote:
> We were doing this anyway, but going forward for paging engines,
> agreement is to always reserve BCS instances in top down fashion. This
> hopefully future proofs things for VFs, where in some low-level places
> it might only have the physical BCS instance from the hw pov. If we
> stick to a consistent mapping scheme, it should make it possible to
> determine if this is a special paging engine, or not.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hw_engine.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 62b966bde34f..1a254e70927f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -665,7 +665,6 @@ static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>   		if (hwe->class == XE_ENGINE_CLASS_COPY)
>   			num_copy_engines++;
>   
> -	/* We just reserve the highest BCS instance for USM */
>   	if (num_copy_engines && xe->info.has_usm)
>   		num_paging_engines = 1;
>   
> @@ -691,6 +690,16 @@ static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>   		       num_paging_engines > num_copy_engines))
>   		return -EINVAL;
>   
> +	/*
> +	 * On PF, we just reserve the highest BCS instance for USM.
> +	 *
> +	 * Note: This is now a requirement going forward. The PF must ALWAYS
> +	 * reserve BCS instances in top down order, that way the VF has a chance
> +	 * of discovering the physical BCS instance mappings for paging engines,
> +	 * in conjunction with vf_num_paging_engines. In some places we might
> +	 * only have the physical instance, and from hw pov there is no such
> +	 * thing as a paging engine.
> +	 */

For reference, an example of data that the VF can receive containing the 
physical class/instance is the page fault descriptor, as that comes 
straight from the HW.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>   	reserved_logical_bcs_start = num_copy_engines - num_paging_engines;
>   
>   	/* FIXME: Doing a simple logical mapping that works for most hardware */

