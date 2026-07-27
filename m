Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47671C53209
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jul 2026 20:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E8C10E49F;
	Mon, 27 Jul 2026 20:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DoqdmP13";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3422710E49F
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jul 2026 20:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785184007; x=1816720007;
 h=message-id:date:in-reply-to:references:to:cc:from:
 subject:content-transfer-encoding:mime-version;
 bh=sLiOUlfR1mxUTwk4ikle5YOmMwDBLNjb69ec/DFQVBQ=;
 b=DoqdmP13L32I7HebWjUY4jCdFxLbYxFHAfcPqCJJW4RXe02s6sP/4x+W
 ajEuomTxGu70bgH1I7+ud30sIAuaEI/FV7RQhZMqo+6j4HsEwxIrnElWN
 JYBos4BGtGwODPLnfKtJzVd3CaPasxqd24DJKZzYuiW1JRuu4M5/wZ3Th
 yorw/Csolp9ivnOAWngD6l+l9/2rtFouU8NIXJ2Yni4z3X6xQcFlE3LLM
 1dd48xun2AmV+Dp621TDElVAYkRM5VuRbeBigveoYZmF8UEl3Up9DL8Xw
 IJWnzDcme5kLsF/znLr8pE/qXwscgdIGPP1Ho8F+UgjVyNJpGW6OCpnqs Q==;
X-CSE-ConnectionGUID: TP00/850TxCV/U2HD3EkpQ==
X-CSE-MsgGUID: 7g9Q8jIbQx6QsTKjNdwLiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="96114725"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="96114725"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 13:26:47 -0700
X-CSE-ConnectionGUID: i0Yg9BXcRXO78vmsNYAWkg==
X-CSE-MsgGUID: QB8jKvxuTUWVK/1RR2qzSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="263818398"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 13:26:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 13:26:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 13:26:46 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 13:26:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8dCFZ2Fz9qKxwv+VHePmVibUlj+4xLlOxsu7MLF8z+iFBfTDqzJUflbzqqE0zgb/DjBBP/NxpTS6LFpx0WJ8u6jgz1Y80fFRWk2mMKkYE9+QSZka/QG3GT+f2pwMuNbODZWf9AyfioQQrlULRHtDaykP41eh0YxudhIt4RmmZojgnHIOsmLqeEOKGhbmfJMY1WGt1MyRlpSQxMcj+KhAUFxdHheCmSXZ6KYZtuz3bmYMbicrWHdQGwXPmbnoIgP+AncMJszQdvWNsTOPLOhYf2qNRdIV3uX64VvLsplRNNgvraY/1oG3FbofDsoyoCDG+UWvEaWl1x4vzeAz99BCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yM+/92+i1jn9nJRl3tC/Hga7tjvgOTm34V09uWqihcA=;
 b=bUl0/m8M+S1XtcdACn7iWOMHRKvyPmfV6G5w1dJoa0AoAexgEehMdry9JafiIIHva2V882RCmwRnQpcg/Fdtirhu1csvDwNx5V3F6qaOHlcHDJqAD23dMg4KskRJF43TufkEmTaNcQV7aAyPwOBeA6cxh0dics3J+BF/EgWE5oRyVqE7LH5+OKqNjOVQxXM8xxJMQ6SqJuX/5uupw8gxcufkzbajco/7gZKdjMfiFvz2u6lCelptRvBCsAS7x9ReYcKuy/TXv+0IHZJAYgUGMofyzPZ+thSX+4rg64AF+1dVRw7s6aBu7+kmuVKl3zH8eHZlAOUAf4AFyErSxu5Z9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by DM3PR11MB8681.namprd11.prod.outlook.com (2603:10b6:0:49::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.13; Mon, 27 Jul 2026 20:26:43 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 20:26:43 +0000
Message-ID: <0cda2aef-1f9b-4a7a-9ec1-fe9e9a779435@intel.com>
Date: Tue, 28 Jul 2026 01:56:36 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
In-Reply-To: <20260721175534.654743-3-vinay.belgaumkar@intel.com>
References: <20260721175534.654743-1-vinay.belgaumkar@intel.com>
 <20260721175534.654743-3-vinay.belgaumkar@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <rodrigo.vivi@intel.com>, Gupta Anshuman <anshuman.gupta@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
From: "Anirban, Sk" <sk.anirban@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe: Add debugfs for IA/GT bias
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0131.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::19) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|DM3PR11MB8681:EE_
X-MS-Office365-Filtering-Correlation-Id: ded3fe45-877d-455d-bdb9-08deec1d5f6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: Z/CtwhGp66zwJU5Pf7ezGcu6ID/qXpTlf+IpsCna/Cq1TDZSUaaavBKq9zlSPa9wtSP6vkhi1ASWy6UU+rtk/FpgS0JdKQa+1BcfF67AAJM02sP/AxesJ0aKn8WFeV7m41sQ4xloXW7T8BwyGthFhiE/yGEeTSBpolCxi0yAqBXG7D1W19j+3FYkewmm3J5D88497vMVf8lpmiR316JuJcajk4LjCmcWk0BPvQDbXS8rZ/iOlgJTehDFJG/faIPTgStmO6yLbC4wlqoA+SOV0bO2aUmHowIwtm7RIkWNB0cTL895g5pileaHDH8GBXYQcY+MwWZtNgOmXNF3QDwT7Q1/esM7TMlFQW7t173OV1EOjWNBZzNEwLTzwmZJK+ekhoOlFVwBdtExffGgLZuQa7aXw2Z5jgqBeR23ZLNXZMPlvc1q5X3Ak3CRo9/tpELGf5myVYpjYrtduWRe7kam0UtYmXGb4z4HpEt2m6ZfxQG47/ykUmG/mqgcFxIDvbxBAWAIQPzhLzcHuh8cn6L0DuAFuGrwZq8aZ3qeR4+FeBBqcz8bn5A7tBcoAsbn3tBouAIqS+sCwGSvz7Es+3OxTaF9Bbht8m78rb4OG4qbQawkv7ZuH61zem6Pbg+gbPwc9zhIlEByfgPCoydIs40FTLLfphmBJvWV/6ql2cL8k7s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1lVWlZxbk1yOW1WTVNCWFRsRnFjV21ZOHo4NXE5ZlJwUWlNWEZEWVgzMlVl?=
 =?utf-8?B?MHJQb29XUWk0cVYrcEpsakFobGVaQkY4ZDNGQmNrcE5kaG9iREhwOEd1dWhL?=
 =?utf-8?B?ZUNHbXFRelVsM0xjUnh6SGVjTlgweVdyTTFPZ3lCL2dvdWRrUXdhVlc3M1V5?=
 =?utf-8?B?d3hxODVrSEpENm83enJxL1NSOWN3SFBvbEQxS1NUUXk4S0hLR29lTUMrNlJl?=
 =?utf-8?B?Sm8wWC9sVjQyejIzSzI5MjBFdzNlL0FKak5kL3JxUTM3TDhRS3dtM2RaY2d5?=
 =?utf-8?B?UUptZHdyRWFNeGNYZDMvR2FZTjErRXVsRjhOVTlkaVJzdzN4bUtHT0M0Y2hx?=
 =?utf-8?B?WGx2ZEZDYzdtWk5JTXkwSGdMQW9rTWZ6a2V4RzFZSUFnd28xYVFMT1g3eEQ2?=
 =?utf-8?B?ZDJBTmFDNHEzUWlib21MYVNrbXM1c016WHZzZFhjN096blZDZG9xOFpTRzhq?=
 =?utf-8?B?NHE5UFlMdUVrV1FkQjNNSkVWck13d2tnM3JVb2hrK3dDeUZyN2lHWFZiSCsv?=
 =?utf-8?B?dE9ubWpCcFh3VzNWWlVuU0JDK2hoRzN1dnAycVVtZ1VXeUVsNUNpU01OdlpL?=
 =?utf-8?B?UWhkMXY3Q01wRndLdjd0cE9LQWx4bmV4QXpWUlp5eEJvVVhYRmJFZDc2bVlp?=
 =?utf-8?B?dDZrem85RTFCaCtrbytVbEpFcVZCVkVjTEZuVjl0bVRRQm1JM250MHRmZEQw?=
 =?utf-8?B?c0FETFRSeXFhZDJDU09zQkNqWlZGeHArUU81Nmltd2RCMndKb25Balppekx0?=
 =?utf-8?B?eHZNTU02ajRDYmVRS1RtWFlUL0ZEeVhEbm5sR0NIUVJZREtOV3krbitXL0Vm?=
 =?utf-8?B?V2VVRVBZU0lDVGJtdDRsakJabE01RUxRQXc4Q3ZSTFJ1cHVzakNiZmhMN2NT?=
 =?utf-8?B?MXdXejhpNHhXTXZCZWNOUm04WnNROGYxbm41dElUeWxHVnpqS3dLNWpuNEVF?=
 =?utf-8?B?MTFlcDlRUDdYSU0zTkV4NElUV2taWURUWGRKLzZ4b2dPZ2JTQmtWYUpMbWNR?=
 =?utf-8?B?cHRnY0FIcUtwWXo3QnF3czM4NkR4bXpIVk9aMHFTSmsxMU1aN2haTFBOYTBU?=
 =?utf-8?B?QVBOaHlaNENhUWMyRHFKNmY4M0pOZUZwK3VZc21pVW5QVDQyUjZuL3JiSWtu?=
 =?utf-8?B?M3F0Znh4WEJuQ0U0OHFRQkhNcEErWmJkekdaRGt1VytOY01KMW5HSjJsNVFJ?=
 =?utf-8?B?bVU4M0NTTUx4WHdvZzNuQWpoT0U2TzVXODlSWlU3cTNWMEhWQ3kvUWRXbkhP?=
 =?utf-8?B?NWozaTI2dEtuVmQ4emVNcmFKL0tJcDY4RWh3Wm5YeXFMNVNWeDE3UDhua3ha?=
 =?utf-8?B?MzdHTDJGczRINElFT2NPeDNDQWlNQmh2STFaNlJoTVl3QWRJa2x0WXpQMCs1?=
 =?utf-8?B?ZzJBVGhzRzVTaGViYUJJUnRNYWpkTStGRCtzVFpJOHFsOEZzWXhiMk5pWFlK?=
 =?utf-8?B?NndTdjNnL1NYWFpnQVZ5YkpqN2ZOUHJiTGNGWHlNYW1hZ01abmNuMEV5U3hM?=
 =?utf-8?B?am1qdGZ1by96Y1pzUkcrNlVnMVp6WlpKdnNJdW5wQTRHRjBMZzQ3SWFVbDRC?=
 =?utf-8?B?TndVOHdhMklUaEg0Ri93VEo3cFAyOG92MUJoNE00QmFHSkVZNFNHN0JzUHJP?=
 =?utf-8?B?QlF3Y1BZK3pib3lab3BtS3VVVll6T2ZFVXdPMlZrdjVTbWpJbTg4MHhydE8w?=
 =?utf-8?B?WEtMQkQ2Z3RrMzliMThwQ0FTUmtkU09mZkxCemtaajNhcFdpaHhxcm13czZL?=
 =?utf-8?B?LzNGSUNtdldvTjM0WnJrSE9LVk1NdVc2d2lqOUZOWm0yQTNEUEt0VWRtcVZv?=
 =?utf-8?B?Ni9kMk54YVZGWmE3b2VSbWw5bW5hVFFsYk9LR0RNZ0NqQ0RTakNYTUVQSmUv?=
 =?utf-8?B?RUJCS3oxZzFTRnVMYzcvRTQvQW1GMGNwdnB2VERFOTZrM0xNQ2tnTHNHYTlz?=
 =?utf-8?B?U2F5b3pNV29kbVJ0dndONDJCbzVlTGlHUTJUcUF5SWlUWDk4N0hNK3VGRjRh?=
 =?utf-8?B?TlgxTVZ2d2VRQm5URmZRY0JqdlhMKzFyRFBIcFhQTlhGVjFGcS9iRkJDYzNN?=
 =?utf-8?B?ZFA1MG1qbHNMY0VEZ0NtOENaNy9mbDQ3NlVjdkZzbnc1UlkrKytCcnJHR01E?=
 =?utf-8?B?YUFSRFhLYUprakZuNUNyemdnS2VqRVhlUVIwbE1hRkM2VEs5ZmtQYVhQSzUz?=
 =?utf-8?B?SGtxMG92MFpSY3JGN2NlcXpwV3dnRzA4UFJuWmd1VGx4V0tHT0lRRUtRejU0?=
 =?utf-8?B?eXRRdTc3SjU5ZVlncjlwTXFTNzI2am5yM3l1enM2V2ExSCsrR2h2dURrZ3Ni?=
 =?utf-8?B?eUVOK0k2bng2bVpVOFU2cUxzcHY4ZkRRT0h2UGYyMVhGSXFxYkJldz09?=
X-Exchange-RoutingPolicyChecked: Dlf1+s4a8auA3XalD8UMMyvvTCoXA6rkCpFtDb8ct+3deRTfsCW4E1jFYQ/Je81rf/Rb5LqhPkqp2IQXwGYW9nwg9yqPaRYRwul8rFf6QtRLwLv4bjdGGWsoufL/q3dVumFDmiwj+peHotaYG1YHueJxgslhFMDB6dN3iCNwHeoNiaslEnmMUEbRIPugfcq0ssa/Kq+RsIcO8Ayam8D1ToHhe0NVxyMlkCBxcVfIP15s5RvR10lLHdHkPO04kB8KXsKVy5CKqw3HxIQayQSXlTijhAChiMI4W6N6owD3w01Vf0DpQqi7RcbKarv3piPmUVZVYVxdqnyuvJs0Iz2y3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: ded3fe45-877d-455d-bdb9-08deec1d5f6f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 20:26:43.7218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7LG8rNipJIs/yDpS25ntzJm629RNtSpOj5EJDAtXoVgJ/qQK963qBDLtaInK3Pcppx/2UOJXzG584g7b17a5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8681
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

Hi Vinay,
 > GT_IA_PERF_BIAS_REG indicates power budget between IA and GT.
 > Lower 16 bits correspond to IA and upper to GT. Higher value
 > indicates more bias towards that plane. The values are in U1.15
 > format.
 >
 > $ cat /sys/kernel/debug/dri/0/gt0/ia_gt_bias
 > 0x80004000 (GT: 1.000, IA: 0.500)
 >
 > This interface will allow us to observe power budget changes while
 > running workloads and also, if needed, tune it.
 >
 > Bspec: 51878
 >
 > v3: Add a helper function for U1.15 decode (Michal)
 > v4: Validate input values (Rodrigo)
 > v5: Comments (Michal, Rodrigo)
 >
 > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
 > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
 > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
 > Assisted-by: Copilot:auto
 > ---
 >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++
 >  drivers/gpu/drm/xe/xe_gt_debugfs.c   | 77 ++++++++++++++++++++++++++++
 >  2 files changed, 81 insertions(+)
 >
 > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
 > index 08251c7a1a4b..4f1404c6c209 100644
 > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
 > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
 > @@ -634,6 +634,10 @@
 >  #define GT_GFX_RC6_LOCKED            XE_REG(0x138104)
 >  #define GT_GFX_RC6                XE_REG(0x138108)
 >
 > +#define GT_IA_PERF_BIAS_REG            XE_REG(0x138158)
 > +#define   GT_BIAS                REG_GENMASK(31, 16)
 > +#define   IA_BIAS                REG_GENMASK(15, 0)
 > +
 >  #define GT0_PERF_LIMIT_REASONS            XE_REG(0x1381a8)
 >  /* Common performance limit reason bits - available on all platforms */
 >  #define   GT0_PERF_LIMIT_REASONS_MASK        0xde3
 > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c 
b/drivers/gpu/drm/xe/xe_gt_debugfs.c
 > index c38bcacb27e4..8e3ff50d71e0 100644
 > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
 > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
 > @@ -9,7 +9,9 @@
 >
 >  #include <drm/drm_debugfs.h>
 >  #include <drm/drm_managed.h>
 > +#include <linux/math.h>
 >
 > +#include "regs/xe_gt_regs.h"
 >  #include "xe_device.h"
 >  #include "xe_force_wake.h"
 >  #include "xe_gt.h"
 > @@ -22,6 +24,7 @@
 >  #include "xe_guc_hwconfig.h"
 >  #include "xe_hw_engine.h"
 >  #include "xe_lrc.h"
 > +#include "xe_mmio.h"
 >  #include "xe_mocs.h"
 >  #include "xe_pat.h"
 >  #include "xe_pm.h"
 > @@ -336,6 +339,77 @@ static int force_reset_sync_show(struct seq_file 
*s, void *unused)
 >  }
 >  DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
 >
 > +#define U1_15_ONE        0x8000
 > +#define U1_15_INT_BITS        GENMASK(15, 15)
 > +#define U1_15_FRACTION_BITS    GENMASK(14, 0)
 > +
 > +static void u1_15_decode(u16 num, u16 *i, u32 *frac)
 > +{
 > +    /*
 > +     * In U1.15 format, uppermost bit is integer value and the
 > +     * rest 15 are the fraction.
 > +     */
 > +
 > +    *i = FIELD_GET(U1_15_INT_BITS, num);
 > +    *frac = FIELD_GET(U1_15_FRACTION_BITS, num);
 > +}
 > +
 > +static void u1_15_decode_decimal(u16 value, u16 *i, u32 *frac, int 
digits)
 > +{
 > +    u1_15_decode(value, i, frac);
 > +    *frac = (*frac * int_pow(10, digits)) / 
(FIELD_MAX(U1_15_FRACTION_BITS) + 1);
 > +}
 > +
 > +static int ia_gt_bias_show(struct seq_file *s, void *unused)
 > +{
 > +    struct xe_gt *gt = s->private;
 > +    struct xe_device *xe = gt_to_xe(gt);
 > +    u32 val;
 > +    u32 ia_frac, gt_frac;
 > +    u16 ia_raw, gt_raw;
 > +    u16 ia_int, gt_int;
 > +
 > +    guard(xe_pm_runtime)(xe);
 > +    val = xe_mmio_read32(&gt->mmio, GT_IA_PERF_BIAS_REG);
 > +
 > +    ia_raw = REG_FIELD_GET(IA_BIAS, val);
 > +    gt_raw = REG_FIELD_GET(GT_BIAS, val);
 > +
 > +    u1_15_decode_decimal(ia_raw, &ia_int, &ia_frac, 3);
 > +    u1_15_decode_decimal(gt_raw, &gt_int, &gt_frac, 3);
 > +
 > +    seq_printf(s, "0x%x (GT: %u.%03u, IA: %u.%03u)\n",
 > +           val, gt_int, gt_frac, ia_int, ia_frac);
 > +
 > +    return 0;
 > +}
 > +
 > +static ssize_t ia_gt_bias_write(struct file *file,
 > +                const char __user *userbuf,
 > +                size_t count, loff_t *ppos)
 > +{
 > +    struct seq_file *s = file->private_data;
 > +    struct xe_gt *gt = s->private;
 > +    struct xe_device *xe = gt_to_xe(gt);
 > +    u32 val;
 > +    int ret;
 > +
 > +    ret = kstrtou32_from_user(userbuf, count, 0, &val);
 > +    if (ret)
 > +        return ret;
 > +
 > +    if (REG_FIELD_GET(IA_BIAS, val) > U1_15_ONE ||
 > +        REG_FIELD_GET(GT_BIAS, val) > U1_15_ONE)
 > +        return -EINVAL;
 > +
 > +    guard(xe_pm_runtime)(xe);
 > +    xe_mmio_write32(&gt->mmio, GT_IA_PERF_BIAS_REG, val);
 > +
 > +    return count;
 > +}
 > +
nit: drop the blank line  to stay consistent with the other 
DEFINE_SHOW_STORE_ATTRIBUTE uses.
 > +DEFINE_SHOW_STORE_ATTRIBUTE(ia_gt_bias);
 > +
 >  void xe_gt_debugfs_register(struct xe_gt *gt)
 >  {
 >      struct xe_device *xe = gt_to_xe(gt);
 > @@ -378,6 +452,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 >                       ARRAY_SIZE(pf_only_debugfs_list),
 >                       root, minor);
 >
 > +    if (xe_gt_is_main_type(gt) && !IS_DGFX(xe) && !IS_SRIOV_VF(xe))
Do this feature also need specific IBC version? if yes I guess it's 
better to add a guc version check here also.
 > +        debugfs_create_file("ia_gt_bias", 0600, root, gt, 
&ia_gt_bias_fops);

As per the debugfs output the GT bias comes first and then IA, imo it 
will be better to follow the same chronology while naming also.

Thanks
Anirban
 > +
 >      xe_uc_debugfs_register(&gt->uc, root);
 >
 >      if (IS_SRIOV_PF(xe))
 > --
 > 2.38.1
 >

