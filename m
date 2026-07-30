Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839A0C5516D
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 18:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245DB10F028;
	Thu, 30 Jul 2026 18:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7GPQE3/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F77110F019
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 18:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785435540; x=1816971540;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LhHX8yzSxYxhyoJy+daq3k8Hjkm9DvaHwjEM1CrPbGs=;
 b=K7GPQE3/ZUyfoV/QxUG51ybD7Ux7sH1NG5RqCF3QinduTObcz1u7HKwf
 kC4bBIqBmxi++jSLdokmyhVz9UUgMXQLAyVNCBt30Nc9gt5TGFDGn6UyA
 fSwPkgaVquzHuieOZRVYFQlOoSDWNQOmAkMU9nWrct1H++P+D7cB7nsO2
 iN2CRMYk4IrH5pMzxo0GJs7rjlrIlsUD2NT8pFlqRMgtD4+wpmRdZwDVP
 fB0U2ESOwGtLJ5xeyCyR8ggkpV2YRByuQRydvUa/mkHH+mnCZN4MlXMlx
 nukoPGzhRm1mPcoC465MIQ0bw4gkJszXdJA4T9BmNhFXSKI/WzMgFO6Vr w==;
X-CSE-ConnectionGUID: 4Fuzm8rJRnat94Ehzy15nw==
X-CSE-MsgGUID: iurwVG4cR7iJxOWEGP7vXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="97577043"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="97577043"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 11:19:00 -0700
X-CSE-ConnectionGUID: DaYmBx2vS/C7ryT677xpww==
X-CSE-MsgGUID: oC2qePEUT+eYTPJAoAO6JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="254048939"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 11:19:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 11:18:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 11:18:59 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 11:18:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mX1TtiuJrgF+dLUx3xS3spruOCLSR6+y2E0Hhj2LDVkeRHyNjElZCXdL/JCtmwpCOS8A6NHalFHXXvjKsQMztw6Qvl51pvaWSgAD/RLvMfU8S8arJVb1TgHGIkvEGyvsWf4Sx+dw2Wz74Y3wtQ+33Zdvy5Ob7CHsXXs4YxC4fcyvLUTid9YQLqf/uBzNawgLhYCyMjSgCo6zjto1bfLI48iHr0/gYkih4zNwpLHDOVPxtCmMuRe7jyNOqhPB/o/lz428WWmEpLVimKQAC3XO7PhLgWrAI4V1oW1FS1ZJDJlmXyeVT9se8TLzXTueU7DPiWy46UFZKwTOcaHgqNDpHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrtR9aI8nj6JU6046w+/Y/tlJ8JLuK+MJ18DqUKQSDc=;
 b=uiURPM1ap5yVhPwAL05nK6GSm4iZBRJMLA+FQySGkwnXAiSYK8jT9ysoYxC5LO8ewC624Lix01SAPEWnUqwSfBPbYjfE67AtdfgBPMjcdPgO1JvSStMS3uIVpnu0VpFijya98RifL3wPJtWy98y3AVLA2E0BOY6eOkPgqp0aNLFgyJAc/lPbisQmpL8mM4Sd7s2kwS/4IhQTz89ehHYqKBAFK1vHS+mxnfEbWKP22+Kr8z0jmAxcGughxHhBLQqxfMbiYz7o21xqutWblPOBp9LXWjP9ithG585QnBdUQOogdaZkN2tz5adczx1//hGRi/EjEE22cCBALuwU7AeFgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 18:18:56 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%3]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 18:18:56 +0000
Message-ID: <3ea292eb-ce41-4fc0-8bf9-9c2ea43a2f46@intel.com>
Date: Thu, 30 Jul 2026 23:48:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] drm/xe: Add debugfs for IA/GT bias
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20260729221629.593195-1-vinay.belgaumkar@intel.com>
 <20260729221629.593195-3-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20260729221629.593195-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0154.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::13) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|CO1PR11MB5057:EE_
X-MS-Office365-Filtering-Correlation-Id: 6954def3-f51e-4065-b806-08deee6704d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: rED77nAvcQtwN0iZ40iAp14HTBWPQHuOe+GOejzl0xWLDdc3X/Jw87MNeSGytO8Cx77VcdCgFVRyWFG86fMGdrfGYIz652vSDpOy7V5Sy9XKIHiPz7pec4OKhZdcp/eTjiOoLZfD+a9P6fHasAxq6nkkayP8gxJjG7lnQEqvtrJ7HIpnQbYQUB2h6YGezCVgnyIC+KSVMaC77FnXoRO4NAJ3AweYHMb40TZFVb6NllIf4+T0ictFtBxE8FNbon78it0eFe0NyDoP/pjQ9+/Ih5kyKBkB4XCPZ+LMEtpC+OjECcMqvkJewdQvIHpDQ7Q2wKTJ/edC1YjqfakDfqxjj+e7ZV+Y0C6Tk3zAgrpDJit5OoLLxfknu1MaJhC69m1BqPKkXC1KJhITBdbtiFOxHVrrki9hXW25z1Cdf7WiaIi8GT1kfhYoi1CGtUMS+B0ikvvodlMs8mXKETW2VdoESgOfOeiaxz3oc5SkxdmLQ/ubogSmLGshjb9/6cZzL5QWRyogdfciAGG7i4VHhrsaaJmDie0ABVrYSoalJjBcy3woHB6qj+qc4s6KkcMZ/hW3tiPDkw2D3UQR1JrJ1jNLqlAfwoLzTD9PWw7/79xmK6eE7DPH1ldfpL4Ev+mW4o6uMor5UPy7Frq7sxaDoYMfwkozcU9Non9Dgf/DBTqO11M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXIvT1RITS90UEs2R3ZXSnAzQUttdHpFUVpUbDYrbkY2aGVxejR4dVkwS2pU?=
 =?utf-8?B?M1JKYmhaeXZKUStvQXFTaUxlRjI1cXFaQ1Z0bTJrNS83eWU5OTJQcjlWd2ZR?=
 =?utf-8?B?Sm5RYVBwYnRsSWtSOU5IU1FaL0RyNm9FQVVwaGc1TjRCTVg5eFdtazliMytP?=
 =?utf-8?B?K0NBaGxrUFg5QlM5QW52YVBYVDVBTmxSUkZZNEZlaGEvZXErMFcyY1pTK3B3?=
 =?utf-8?B?dVp5T1R3UU96N0JLT2FUM3ZGaTY4NDdTRE0xZE5rTFFVMTZBVmNFQlE4dHlL?=
 =?utf-8?B?OFhOTG9KbFhOMHNPeDI4QlhxajBQbFRxRDlpSHp5OFIxektHYi8vT3ZLRmhz?=
 =?utf-8?B?S2c2VmZEaXZZM0dwOFZjaDNyeXRZZFlaRzVyb2ZjQ2J0Rmh0Z1BaeFlqd1JK?=
 =?utf-8?B?SWViOGdDREQxbVQwenUrd3VsVHg4K1pUVGpwcmR5ZFlvUU9FYngwVENiWEZy?=
 =?utf-8?B?OHhKcmVvYkw3akF5VDdjT1hKNXZIUkdGZ3JoOHRHdXFlOVY1YnY3Qld6a0E0?=
 =?utf-8?B?bmdkdm43bUhldkt0bXpKZkNlTVkzRVpQWDB0N1JBWmpTdCt0MFh6TmZHbk1S?=
 =?utf-8?B?dlFFUDJMOHVOSEFMWStDZ2Z0TFlGMGJ6VHpRN0lvM2dIQi8reHBDSkNiMUFr?=
 =?utf-8?B?VkV1OFhlQi9KV0cxOEo4S0puY3lBR09KVVJVTGdaTFpsbDl3TWxpWVJyb291?=
 =?utf-8?B?WGNYRnR2ZHNTN0dwYW91OUxoRFR5eHAzMFBNaFNuUjlCdlBsK3MxNTZ3cEE3?=
 =?utf-8?B?b3F2YUlmUzZhcTJ5YzBQR1VrM3BGVHZjeHlKbGxQcUxqZGRXVkJPclR0elRP?=
 =?utf-8?B?R1JpcndWVnRrSmVsZUErMWxFOUFuRnlHYzhvd0pWaUh4NlVhT2lLajNJM00w?=
 =?utf-8?B?bFp3WVBmbTB2VU5tdytGbCtVcHl4MWRFM3pRd1VPamF4MVNlaHhCWCtTOW55?=
 =?utf-8?B?T1VVU2VSUDJ1M21MN1ZUbE1YSFFsQUhsS1dhd0tVT05KalJvb1BuK3ZpWUg1?=
 =?utf-8?B?d2Z6RHZ1YWhFSmhOQmtNS2xObjVpWTBvTFNGd3RrUFNQVkpvZFBGSjl2cm9N?=
 =?utf-8?B?cmc1ZHlBcEpHUHpZcnZQZVlCMUZBRGRJcmYxNE9hN1VNV3FhVjN0WnlXcUpI?=
 =?utf-8?B?RjNNcng1V2JBbWl0NWNER2pqODdRaTd2R2hUZlJyY0NDTVd4N0VTVTlYdEZD?=
 =?utf-8?B?Y1diZTZ3WnNJZzJ6M05DeUFIRWs4WDE5Z3VqclR2bTEwdjAzS1A3ZVpnV1Vn?=
 =?utf-8?B?eGhuRkN0TENRWUcrOGhmRXFPbnA4eUVtVXF0T2RCRTRvUi9QbjJZUThuNUxH?=
 =?utf-8?B?RHJFdThRbzJYSi94cUxydE1yTUFGZG9YeFh6cDFJQTdnOXRWcFM1OWM1clBJ?=
 =?utf-8?B?UnB0eXkwaENLRWo5SlNwVFFla3hHb2x2MnlkM2RwQUh6Vy81REU2dWhENWha?=
 =?utf-8?B?amVZTnpFaFg5ZU4yd0RFYm5PYXlXVnlPbmVnVDFSNVVZZU55WWluNDFtOW9O?=
 =?utf-8?B?RW83Yjh4Qm56Qkt0VEhoK203a1BDOUM1MzhxL09EV3Q1V25sQUNncE9idHpH?=
 =?utf-8?B?NVphWVVwTXNpbUFRQTFKU0RvV2lqUlF2bksrRW5BMkx3WHA1RE82QTVxdG5Y?=
 =?utf-8?B?MzJqQlljWHVlbkFzYy9BNDhiT1BOcnVmbjY1RXkvcnV4RHJUdER1NW8xSUNV?=
 =?utf-8?B?RHA4Wk8vRFdkL2RzajI3SlZNeUFIaEdRQmhROFh4TXdIMThmcUlCQkwrQnk2?=
 =?utf-8?B?TlFPV3QzNDdyMm9BTFF5TDl4UzU1SnZmUlF0ajl6L1g4b1NvZ1hPdnBtWHdV?=
 =?utf-8?B?Y2IwdTJZSmZrMjZ5VUtBOC9JSXdDQ3NRdzVMYnFBR3BUbi9Kd0VYVHhURmZx?=
 =?utf-8?B?NE53cTJuTVNnaTJ3UGQ4OEVJRmVRMUVlRHhQaktUcXVMVWdBcXdXVDEwWG5C?=
 =?utf-8?B?OEp4ekRGQUJ5a0RRVjNyanZwLzRuTzNpQmcvcW9jdTBwdDEvWmxXZ0tRcURk?=
 =?utf-8?B?VnRtWXNiYjJLdlF1RW8yZTl6bVVCbDljU3dQblhURVRhNE5ZN1k3UTVWWnY3?=
 =?utf-8?B?SDhrR3Z0aGd1OXZPNjRLczNoTjRKY05VbHZVYUVzK2FlaFpEa3VhOUs3UGpx?=
 =?utf-8?B?UDR1NW1INXF3a21Ed0NhS2ZUcFNTcnR6bFZqbGRvRG1sMmw2VDViM2I0M0Vk?=
 =?utf-8?B?eWpCY3VKZWpKWUpEUjNHcmdCRjNtYWpPeExtY0FpU0h4V2ZZWEhpNStLT2w5?=
 =?utf-8?B?UWhKVXMva3ZPcWU0NVgvbzN0SXZZbnowQkhHdllwekRKNDl2N2ZwV0k3ZXR3?=
 =?utf-8?B?Uk05enRzTTZPZURpcHVsamszeTRqMFpkdVdxRTN4b3FVWWtMR0pUQT09?=
X-Exchange-RoutingPolicyChecked: RdeJ+UkE9YsgCN1Qev/nngeFgZ+mXX1ohQckUJ8+gjK3RzmZxRyr/fIYvr/hu/O9vre5bATfknJyqsAtXr0dBejpPjv6z9BYY8tSLJiDsYggZYQbJk/yZGYeFn2wvTksc8AkdIMg6IM1WRcvtjQQtHurKgdtj+c/hvEF18gFqYGVxuU/FNVPBw12AgYC9vWTUmWHFB55uznOxDoC0paF/CuWvkhSeqOhHPfANz2lXMB9+CwteZsb2uKkQc3p/TVOzf4kmBCE1FMaMXdjlf8317veHyvYSE6i/ghkTW4ybm03e7z480jE/9KNDjK06wylPCZwmOfVQwupRdLOQgQx/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6954def3-f51e-4065-b806-08deee6704d7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 18:18:56.7172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: koVg9OlNwHfBdMMzIgnxQ2YcJs/eiWcFotYA65BKSjK+sRBPW7TbXniEvUHhgej9iDhdP4O8Ufmwb3J9KquoYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5057
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

Hi,

On 30-07-2026 03:46 am, Vinay Belgaumkar wrote:
> GT_IA_PERF_BIAS_REG indicates power budget between IA and GT.
> Lower 16 bits correspond to IA and upper to GT. Higher value
> indicates more bias towards that plane. The values are in U1.15
> format.
>
> $ cat /sys/kernel/debug/dri/0/gt0/gt_ia_bias
> 0x80004000 (GT: 1.0000, IA: 0.5000)
>
> This interface will allow us to observe power budget changes while
> running workloads and also, if needed, tune it. Minimum allowed value
> for each of GT/IA bias is 0x10, and max is 0x8000 which corresponds
> to a bias ratio of 1.
>
> Bspec: 51878
>
> v3: Add a helper function for U1.15 decode (Michal)
> v4: Validate input values (Rodrigo)
> v5: Comments (Michal, Rodrigo)
> v6: Rename to gt_ia_bias (Anirban), check lower bound (Michal)
> v7: Update filename in commit message
>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Sk Anirban <sk.anirban@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Assisted-by: Copilot:auto
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 +++
>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 80 ++++++++++++++++++++++++++++
>   2 files changed, 86 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 08251c7a1a4b..48c515d91882 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -634,6 +634,12 @@
>   #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
>   #define GT_GFX_RC6				XE_REG(0x138108)
>   
> +#define GT_IA_PERF_BIAS_REG			XE_REG(0x138158)
> +#define   GT_BIAS				REG_GENMASK(31, 16)
> +#define   IA_BIAS				REG_GENMASK(15, 0)
> +#define   GT_BIAS_DEFAULT			0x10
> +#define   IA_BIAS_DEFAULT			0x10
> +
>   #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
>   /* Common performance limit reason bits - available on all platforms */
>   #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c38bcacb27e4..ea78b57b1c31 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -9,7 +9,9 @@
>   
>   #include <drm/drm_debugfs.h>
>   #include <drm/drm_managed.h>
> +#include <linux/math.h>
>   
> +#include "regs/xe_gt_regs.h"
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt.h"
> @@ -22,6 +24,7 @@
>   #include "xe_guc_hwconfig.h"
>   #include "xe_hw_engine.h"
>   #include "xe_lrc.h"
> +#include "xe_mmio.h"
>   #include "xe_mocs.h"
>   #include "xe_pat.h"
>   #include "xe_pm.h"
> @@ -336,6 +339,80 @@ static int force_reset_sync_show(struct seq_file *s, void *unused)
>   }
>   DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
>   
> +#define U1_15_ONE		0x8000
> +#define U1_15_INT_BITS		GENMASK(15, 15)
> +#define U1_15_FRACTION_BITS	GENMASK(14, 0)
> +
> +static void u1_15_decode(u16 num, u16 *i, u32 *frac)
> +{
> +	/*
> +	 * In U1.15 format, uppermost bit is integer value and the
> +	 * rest 15 are the fraction.
> +	 */
> +
> +	*i = FIELD_GET(U1_15_INT_BITS, num);
> +	*frac = FIELD_GET(U1_15_FRACTION_BITS, num);
> +}
> +
> +static void u1_15_decode_decimal(u16 value, u16 *i, u32 *frac, int digits)
> +{
> +	u1_15_decode(value, i, frac);
> +	*frac = (*frac * int_pow(10, digits)) / (FIELD_MAX(U1_15_FRACTION_BITS) + 1);
> +}
> +
> +static int gt_ia_bias_show(struct seq_file *s, void *unused)
> +{
> +	struct xe_gt *gt = s->private;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 val;
> +	u32 ia_frac, gt_frac;
> +	u16 ia_raw, gt_raw;
> +	u16 ia_int, gt_int;
> +
> +	guard(xe_pm_runtime)(xe);
> +	val = xe_mmio_read32(&gt->mmio, GT_IA_PERF_BIAS_REG);
> +
> +	ia_raw = REG_FIELD_GET(IA_BIAS, val);
> +	gt_raw = REG_FIELD_GET(GT_BIAS, val);
> +
> +	u1_15_decode_decimal(ia_raw, &ia_int, &ia_frac, 4);
> +	u1_15_decode_decimal(gt_raw, &gt_int, &gt_frac, 4);
> +
> +	seq_printf(s, "0x%x (GT: %u.%04u, IA: %u.%04u)\n",
> +		   val, gt_int, gt_frac, ia_int, ia_frac);
> +
> +	return 0;
> +}
> +
> +static ssize_t gt_ia_bias_write(struct file *file,
> +				const char __user *userbuf,
> +				size_t count, loff_t *ppos)
> +{
> +	struct seq_file *s = file->private_data;
> +	struct xe_gt *gt = s->private;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 val;
> +	int ret;
> +
> +	ret = kstrtou32_from_user(userbuf, count, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (REG_FIELD_GET(IA_BIAS, val) > U1_15_ONE ||
> +	    REG_FIELD_GET(GT_BIAS, val) > U1_15_ONE)
> +		return -EINVAL;
> +
> +	if (REG_FIELD_GET(IA_BIAS, val) < IA_BIAS_DEFAULT ||
> +	    REG_FIELD_GET(GT_BIAS, val) < GT_BIAS_DEFAULT)
> +		return -EINVAL;
> +
> +	guard(xe_pm_runtime)(xe);
> +	xe_mmio_write32(&gt->mmio, GT_IA_PERF_BIAS_REG, val);
> +
> +	return count;
> +}
> +DEFINE_SHOW_STORE_ATTRIBUTE(gt_ia_bias);
> +
>   void xe_gt_debugfs_register(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> @@ -378,6 +455,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>   					 ARRAY_SIZE(pf_only_debugfs_list),
>   					 root, minor);
>   
> +	if (xe_gt_is_main_type(gt) && !IS_DGFX(xe) && !IS_SRIOV_VF(xe))
> +		debugfs_create_file("gt_ia_bias", 0600, root, gt, &gt_ia_bias_fops);
> +
>   	xe_uc_debugfs_register(&gt->uc, root);
>   
>   	if (IS_SRIOV_PF(xe))
Reviewed-by: Sk Anirban <sk.anirban@intel.com>

Thanks,
Anirban
