Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BC1C5CFEB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 13:57:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64AA10F358;
	Thu, 13 Aug 2026 13:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ExiPPkjX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0810C10E4C4
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 13:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786629446; x=1818165446;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oPD9lT5ariuk0Gv2UP5um2oWNCsynh/YjXT2NkroBKY=;
 b=ExiPPkjXxqrMh0rhZSp4T/sGemM8c9SoGk6vbISwHco+h+i9PoUTgMOU
 AKZwdpZYuK0s/Qg3ismqVgM6w9FbQIXV4vGfITExRdpfy4+JkGo63FXBy
 Zuej0lcdrtUjMb6h/quWkLxqaaf45WA95eSNw8ItBlz51zw7NlhaapHw5
 fu5RBu1rVZu1mjlpoc+1rL4631slFHJhMTcQ7Hynzh/YgIOq/2j6fbbuG
 WItzcxepVvUdqQxN0M4Wnv9/Em/UfA3TMfBrxknk6i0D6QOxZQwzVXrtD
 fOArn2LM+zDVUfJHQPBrx0T7YGaN9dut2HmMPgCC8KzVbftaFE/q9n1sY w==;
X-CSE-ConnectionGUID: JSoVM4BkRLS3/yNf/Wx1cw==
X-CSE-MsgGUID: rlkOmO9VT3GBL4QUgvXW/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="91014793"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="91014793"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:57:23 -0700
X-CSE-ConnectionGUID: Uag0R3mmTW+g2M46lukXKA==
X-CSE-MsgGUID: KekSCj5eRGGOUI/wfv41IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="264529182"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 06:57:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 06:57:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 06:57:21 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 06:57:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cam7OX4Wf+rGHiNTyEAS58dutCOsDH9rElJycYdi1w7myUjmWjCgpK5wF9D/yk2jwA4qVPSBRQSCiF7GkMkKCPOMjYHOD1lr4pRlyYOohZmzAZDU5XUUFM2gTYC38UVfCX3rSovtaFEUZtFkWOap7Qs8m2ljVH5StgseobhdEHGTsfviLnMWPDmGWCYUY/psgp3e+9mLbBMcFttgMe/HF1dwc39EU1RRzBAyhQvseVcY1NHehtchNYz/8EIv/hTP34Z8fzJpSP+iTuA0pQWHQjPPgWFbir5b8DnpXQU9Zo2ZkDeLzXJwTjH2h9dZMx04STbA5mQh9BgZpCWk2LqQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/1kXDDjEZLv6pECBPzxw9NxJVHHSw4Lhq/fD62Il0Q=;
 b=Zy4JgnxHyMSahp4P1Bf4NJSiaAWNMzV4+vI3EE/LrTlbxp2sfY18V5TNhmk/WNZ+xW9q1KXfhHE/NUW6P3kXMuO8IowdURWBGMF5gI5KalTZe22tq6q0lQAVLSqo17PPBdjwoZBrkosn/nbVD9Ins3V1OPJmePv+N534x0afdJ9nqiYMNZYqlKM2j58qEeQwER0ImQz8sITqm9kdundcW8LLw0N4WFw1PdIAppuUMKb+2fY4ZY/AGkUG327XU+O3btTLS4DT47teuiMUStqa70fYhEocCarAywIJcbvwywoDjFSEU8JbRpOqqI7Kig1OEfR5oX5XmyftHCUnRFUnTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 13:57:19 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 13:57:19 +0000
Message-ID: <904384e5-4688-488d-9d72-1c0a6b513cfd@intel.com>
Date: Thu, 13 Aug 2026 15:57:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/32] drm/xe/log: Add structured SIGID error logging
 infrastructure
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Stuart Summers <stuart.summers@intel.com>, "Yoni
 Levitt" <yoni.levitt@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Raag Jadav <raag.jadav@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-3-michal.wajdeczko@intel.com>
 <30c300a4-e743-4322-a1ab-f8edf2b81b40@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <30c300a4-e743-4322-a1ab-f8edf2b81b40@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA0P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::14) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH3PR11MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: 631dece1-40d2-4220-b2b6-08def942ca0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|6133799003|10067099003|4143699003|56012099006|5023799004|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 8Eh9srWAx1FRW6txvyUrk/fMP6lTtyg5OdZY+pfvpR7BKmRablB9hsVsDKyXM8rJCCOXEqfhu6bE2meKrMZ7XnbFh2qLnBBrbd7KBaG5UW+bpi/XScxRArNOcNn02Uo/ccgFo/7sxLu5lYKTfarOsgWCaBt3p9QfLDCQA5mpDKdwCDKQtwlp6pu74iuOpL3CtWic/IuSXTV/Gk+zwtmTpKTUf7x1n8d1GQj5Pwl7psZdrppCJlMoJ2Hqyt8jhZO/RHAA9ISpA49nNwkEIoRGzWuUi+7sy2F5VNugOCENlXP8t/z878sq2Ejzoh5jda3pIjGFWf5xT9zQ1PSQBk7Q31P1tvwtU1kBsD9r4EHjiGjc1lyW8qlPUmRhwsb2ymdTOXv8qnYGfdybLt8CpaUNANxP43DLLzMb/EYPayZOh0lbvowejrSvJiB6JU6lfy7zkmJ4qhwU4FggfQtNc9lb5NH/TUetA9sEMS11AlyJX7XbJCtC8zCb//buTsB9cJV13nu01Gn2N+lPv9Q+FP646dwrf1aLPKEDD1ApQPJmdY0ykNjJWhUoMLhx6FdB9XGd6eilnoKQ9O1NcG7ij/bI+6+eTuBfcJmAayHoJX8j7f+G6gFSR8GzKvDSfvSKAwsXoX9WIe46ZL720KJxTcDF3VeZju6AKK/ZHt39+vzTiL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2x4aDBBWlFMZmNjZml3eGp2TUtDbStSY1dEVVl0djNRZnBzZmExY21TdnBs?=
 =?utf-8?B?Z1F1OWpoVmpsQ0tPWXBXWW04TGJPQzJnYjR3clZUR0N4b1BQZUdiWGV2VEdH?=
 =?utf-8?B?YnlOVzVIWmZ0MjY1SFJYejluV3lJZlNUS25oVnEzZG8rdnpDRmg1SlV5VVEv?=
 =?utf-8?B?dlBkKzV4SDlHc2xtM2xkVjBjMnRVSmRvNjVudURxTDVGbjRyaHQ5ditHazhU?=
 =?utf-8?B?c1Z0OEp1MnNGS0ZGekxCQUtMMDh5YmNsblpnTWZoeWVQU1pzcWVvdEF0T2FI?=
 =?utf-8?B?em5pU3pPdXB5UGRIaVN2Q2dKUEFHZkt0U1ZLSUZjUFNyMTJpYTgxaU9DZFFM?=
 =?utf-8?B?bUV6aEVCTTI3Q0JwSkJKdWE1OXVYNjVJaEQ2dEZrKzNMWHdsakFzdnhlQkI2?=
 =?utf-8?B?TTFORnRFc2hjRnpLai9DMzlJYUxZZkxjbnZVZkwzb1JzcnlyUzJZc3FzL0xG?=
 =?utf-8?B?SS92N2FENHlIc3JOdHR1ME45TGo3UWFmd0MwenB6T0FJRkhVRm1TK0MrZWYx?=
 =?utf-8?B?Z3FMdTFKN01HOGppWVE0MGtFUVg2R01RbEdhMUZpTXl0bUhGV3hLcStRNVFV?=
 =?utf-8?B?Ry9PK2ZQbmhkZHI2d1JTVjBvazBSUzRkTWxoK2swQjU0TGRKV3hRc2lEUnM1?=
 =?utf-8?B?cXY1UjUwMXhlQ2Z4RzlRRlNwWmp3WEhDaEhLc1daU1pGT2ZLVHR6dzYzeTJU?=
 =?utf-8?B?a2RuR2xsdC81UWxVWlRjWGxHS3prelJIdklsR3d5SDNBUVpTNUJmYXdVOWJ6?=
 =?utf-8?B?cTgySlJEZkRlWUpNNFg5SldKZ050T3BDTS9lamVaT05LV0wyOEp2cTRDSVg1?=
 =?utf-8?B?aUloMXJwL3B4S0VnYS9rVkFHSnFjMFduYjltYTNFZy9lOFhSV2ttU1ZHZXNk?=
 =?utf-8?B?ZUtDUXFhWmszMTdFd1hRQnlHbHZKZDNtMjcwMExyWjlYL0twaThPTG5iVnBT?=
 =?utf-8?B?SDlRaEpGK3h6NlBWMFdPNVlSRmkvdk51cURHbENvcXFQSFJqRmg1NzErY3kz?=
 =?utf-8?B?ZkM3TDBVQnR2dTRkeDZHMkJTajNTY0RiclhUMVN1Wm13VHpVVFh3MnI1M1c4?=
 =?utf-8?B?cThBd3lUU0xMVUVYMWE4WEpvV1YyRG51a0hJR0lpb0FzQWljNzNLQXNVdVcv?=
 =?utf-8?B?cFJDdmMvNDBrK041SHJVd3h2ODJFZmhWcmpNeGxKY2puaFhhZXV0bzZzQ2FQ?=
 =?utf-8?B?Q3lFNkJRNEh0TnRLRTM0RDMrSTh6OW5XRmF0b3FvOHp3RUxwUVZXQ0NIM2E0?=
 =?utf-8?B?VEJhSzlNanlWMjlIalYvQjVUMDN3bjQ1SXpiVzVrSk0wamVQTmEzU1E4NjRF?=
 =?utf-8?B?SVRvZmZuS0hRTEEzekRRbUpnd3c3SGNEOVQ0Q2RVdHE0ditHa1hBSkFLMnp3?=
 =?utf-8?B?TzRNN2ErREJRcEpncU82WjNwc0Z5ejBCazByVkdvc1JPUCtvazB6WG5oYXJV?=
 =?utf-8?B?Wm1BZ3NNWC9jOXQ5QlUwdVN1NTJlck4rUjFIVzE3TTlOS2tiZDE1ZmxQbFNv?=
 =?utf-8?B?ck9SdkhDRHk3dWhBZnFUNVFRaGJoZldidjVYREJCc3J0VFl1WnpPeFZ6clZz?=
 =?utf-8?B?MSthRERPR0xuSHZmekdyRU96cklERXlEdEYzQ2t5ckZkNm83aGR0SUczY0hh?=
 =?utf-8?B?dDB1azR6SWhMaEk1TzV1cFVyN1hVMVV3NmpTb2lGN0o0bnA1cFNIWmtUVkNM?=
 =?utf-8?B?R0xwV3BTZUhYNDVpU005Zk1GM0w4OXlnSHRzbFpoa0pmZ2pwbXM3T3lYQ3Nj?=
 =?utf-8?B?aGsvNks1RTc1c1dRQ2ZTdlp1di9Db2FjQktSZWg1dWxGRHptYWVZSXZWejdt?=
 =?utf-8?B?RXNZcE03K3RZZklJdUJPZktWb09ZTXhNQzJuem1OOWowdVN4dGRzVFdjZWlR?=
 =?utf-8?B?a0xYSXp0UGNwVkpOcVlQS25xMzFiOWoyWEVQVjN0S3ZCdmRIc2JqZTFmS1p2?=
 =?utf-8?B?cDY5cEYvd2YwbTNoTTd0U0xBTHhsM2d3amxCYWpkT3BOWUg5Ly8wNFRHVk1t?=
 =?utf-8?B?T1Jxclk3ZGtUK2RtZ2swSzNZRFNGL0xGcUpzTmFWY2tnMmdLamZLOXBqa0FK?=
 =?utf-8?B?ZUlsWDh4Mm5PZU5mRWE4bDJyaXEvb1RpaGVYUzJUT01NV0pjazMxaTNlQVZr?=
 =?utf-8?B?VGtweWZWY0ljWmRDV0lNWURQVW9yS3ZhaXlxNzdXZE41VGhWb1BoRFJZRGly?=
 =?utf-8?B?Rms0YVhzczNQaUFOZ25rNXBGMENlb09JNTVHQXFYZ0VIOENtRlRaRGpGeUNm?=
 =?utf-8?B?OGJGSGR5NHgrQjFnNk9wMVZialBIUkhSblNIMGh6SThrR0hlVDUrVWZsM1Ny?=
 =?utf-8?B?Z2RMRkRlalBSbXNjSzZjMmM1Q1RUdUt5eTBDUTNFL0lQb3VQZHN1cnVpdHpn?=
 =?utf-8?Q?QWD83MPH3rT6192k=3D?=
X-Exchange-RoutingPolicyChecked: PJMtsn0cY1xwza/49BiILVpQGnlC9WTsik0nKDX3DoULgr7Xs+t0O9wJAyJ+049hIDuBiCFeECtZUa8pggzW0EvFdj4jeJzdjrQI22tshlnpoI6Nla9tXotulCIsLEonYmelzUuqeSf8L0NtWjZUeCItWHVfnymuC75Zz6DYmewKwPmIpUma2wjulzsooRE26jh60OdX7dL1UpDGQqIhREc4Xm4xcJ/685nXMj7PhUrmd7EMeliMDW0seXooYxXoc9dB4Gso4AcftL1/CS+/6XIqgdM7rjtl7kc5hMX6VOGqMh7StG+8zjHqXpt3y+vITKdTtJLoqha5BYacOa41GQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 631dece1-40d2-4220-b2b6-08def942ca0d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 13:57:18.8852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4z80R1L3mqRddP00FYkpdQMBu6bgzo2q7GrECmQplXwiGimvESztTWYq9x3DWPTkGwo2ZDDJTQDTn8FI4E+yyI2A1lpeUQJ5K/3W+7MAf/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8774
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



On 8/13/2026 3:33 PM, Mallesh, Koujalagi wrote:
>=20
> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>
>> Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
>> strings that have no stable shape. That is readable for a human, but it
>> gives fleet tooling nothing durable to match on: the wording changes
>> between releases, lines can be rate-limited or dropped under an error
>> storm, and there is no consistent way to ask "which recognised fault
>> just happened?".
>>
>> Introduce a signature identifier (SIGID): a small, stable integer that
>> names one recognised Xe fault site and serves as the primary handle for
>> triage. A SIGID maps, through published end-user documentation, to a
>> description and a recommended action; the driver only has to emit the
>> right SIGID next to the usual human-readable text.
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Assisted-by: Copilot:Opus-4.8
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Co-developed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>> ---
>> Cc: Yoni Levitt <yoni.levitt@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Raag Jadav <raag.jadav@intel.com>
>> ---
>> v2: CORRECTED is still an error (Michal)
>>     prepare to decorate dmesg with comp/loc (Michal)
>> v3: update SIGID DOC section (Riana/Aravind)
>>     warn about unknown severity (Mallesh)
>> ---
>>  Documentation/gpu/xe/index.rst        |   1 +
>>  Documentation/gpu/xe/xe_sigid.rst     |  14 +++
>>  drivers/gpu/drm/xe/Makefile           |   1 +
>>  drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 159 ++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_log.c           | 138 ++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_log.h           |  20 ++++
>>  6 files changed, 333 insertions(+)
>>  create mode 100644 Documentation/gpu/xe/xe_sigid.rst
>>  create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_log.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_log.h
>>
>> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index=
.rst
>> index 665c0e93601c..0247a255f7e6 100644
>> --- a/Documentation/gpu/xe/index.rst
>> +++ b/Documentation/gpu/xe/index.rst
>> @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is =
provided by
>>     xe-drm-usage-stats.rst
>>     xe_configfs
>>     xe_gt_stats
>> +   xe_sigid
>> diff --git a/Documentation/gpu/xe/xe_sigid.rst b/Documentation/gpu/xe/xe=
_sigid.rst
>> new file mode 100644
>> index 000000000000..45d84a62f185
>> --- /dev/null
>> +++ b/Documentation/gpu/xe/xe_sigid.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D
>> +Xe SIGID
>> +=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> +   :doc: Xe Error Signatures (SIGID)
>> +
>> +Signature Identifiers
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> +   :internal:
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 44ed055439d4..92134709d998 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -87,6 +87,7 @@ xe-y +=3D xe_bb.o \
>>  	xe_hw_fence.o \
>>  	xe_irq.o \
>>  	xe_late_bind_fw.o \
>> +	xe_log.o \
>>  	xe_lrc.o \
>>  	xe_mem_pool.o \
>>  	xe_migrate.o \
>> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/=
abi/xe_sigid_abi.h
>> new file mode 100644
>> index 000000000000..93967183ae51
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> @@ -0,0 +1,159 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright =C2=A9 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _ABI_XE_SIGID_ABI_H_
>> +#define _ABI_XE_SIGID_ABI_H_
>> +
>> +/**
>> + * DOC: Xe Error Signatures (SIGID)
>> + *
>> + * What SIGID stands for
>> + * ---------------------
>> + *
>> + * SIGID is short for *Signature Identifier*. It is a small, stable int=
eger
>> + * that names one of *recognised fault site* -- nothing more. It is the
>> + * primary handle used for triage and maps directly to specific report =
site.
>> + *
>> + * Numbering
>> + * ---------
>> + *
>> + * SIGIDs are a single flat list numbered sequentially within the assig=
ned range,
>> + * in the order the fault sites were introduced. Values are stable: onc=
e assigned
>> + * they are only ever appended, never renumbered or reused. A retired f=
ault site
>> + * SIGID value is deprecated in place, never re-purposed.
>> + *
>> + * Why this exists
>> + * ---------------
>> + *
>> + * Today the driver reports faults with ad-hoc ``xe_err()`` / ``xe_gt_e=
rr()``
>> + * strings that have no stable shape. That is fine for a human reading =
dmesg,
>> + * but it gives fleet tooling nothing durable to match on: the wording =
changes
>> + * between releases, lines can be rate-limited or dropped under an erro=
r storm,
>> + * and there is no consistent way to ask "which recognised fault just h=
appened?"
>> + *
>> + * A SIGID answers exactly that one question, identically across driver=
 and
>> + * firmware versions, and (eventually) across other Intel devices in a =
node.
>> + *
>> + * What a SIGID is not
>> + * -------------------
>> + *
>> + * SIGID deliberately does not encode the detailed reason or the outcom=
e. Those
>> + * are carried alongside it::
>> + *
>> + *   SIGID    -> which recognised fault site is being reported
>> + *   severity -> how serious this instance is
>> + *   errno    -> the failing operation's error, if available, shown wit=
h %pe
>> + *   message  -> free-form human-readable context
>> + *
>> + * Severity is independent of the SIGID. The same SIGID can be reported=
 at
>> + * different severities depending on the instance and the recovery take=
n.
>> + *
>> + * When to use SIGID logging
>> + * -------------------------
>> + *
>> + * The xe_log_*() helpers are for these recognised fault sites only --
>> + * important, operator-relevant faults and events. The driver's only jo=
b is to
>> + * emit the right SIGID next to the usual human-readable text.
>> +
>> + * They are not a replacement for ``xe_info()`` / ``xe_dbg()`` / tracin=
g, nor
>> + * for one-off diagnostics; using them for ordinary logging would dilut=
e the
>> + * fault stream. Not every ``xe_err()`` needs to become a SIGID report =
-- only
>> + * those that correspond to a published fault sites.
>> + *
>> + * SIGID log output (dmesg vs. the machine record)
>> + * -----------------------------------------------
>> + *
>> + * The dmesg line stays close to a normal xe error message so it remain=
s
>> + * readable for admins; the only stable, machine-matchable token on it =
is
>> + * ``SIGID=3D<n>`` (``dmesg | grep SIGID=3D``).
>> + *
>> + * The full dmesg line is not an ABI: the surrounding text may change f=
reely,
>> + * and lines may be dropped. The durable record for tooling is the CPER=
 record
>> + * carrying the same SIGID (generation is a planned follow-up).
>> + *
>> + * How to pick a SIGID (the uniqueness rule)
>> + * -----------------------------------------
>> + *
>> + * Pick per *report site*, not per incident. Each site emits the single=
 most
>> + * specific recognised SIGID *for that site* -- so the question is neve=
r
>> + * "classify this whole failure", it is "what does this site detect?", =
which has + * one answer. A single underlying failure therefore legitimatel=
y produces a + * *chain* of reports from different layers, each with its ow=
n SIGID -- e.g. a + * GuC communication failure is reported as %XE_SIGID_RU=
NTIME_FW by the firmware + * path, the failed recovery as %XE_SIGID_GT_TDR =
by the reset path, and an + * aborted bind as %XE_SIGID_PROBE by the probe =
path. That chain lets triage + * follow a fault from origin to final effect=
; it is not a duplicate. + * + * If a site does not match any defined SIGID=
, keep using the ordinary + * ``xe_err()`` / ``xe_gt_err()`` logging rather=
 than forcing a SIGID: a wrong + * or over-broad classification is harder t=
o retire than a missing one. When a + * new report site is genuinely worth =
triaging, add it to the list below. + * + * Usage of the existing SIGID rep=
orts must reevaluated according to this section + * after making significan=
t changes to the site that emits this SIGID. + * + * Scope: software vs har=
dware
>> emitted signatures + * ---------------------------------------------- + =
* + * Some SIGID represents fault sites that the *driver itself* detects an=
d + * reports from the software POV: probe abort, wedged, survivability, dr=
iver- + * detected firmware failures, engine TDR, memory faults and IO/bus =
faults. + * These are the only values the driver assigns on its own. + * + =
* Signatures that *originate* in firmware or hardware are a different thing=
: + * they are produced and identified by the firmware or the hardware itse=
lf + * (e.g. via their own records or error counters), and the driver merel=
y logs + * them as they are given to us. They are deliberately enumerated s=
eparately. + * + * The two driver-detected firmware report sites below (%XE=
_SIGID_RUNTIME_FW, + * %XE_SIGID_DEVICE_FW) are software signatures: they m=
ark that *the driver* + * observed a firmware problem, not a signature repo=
rted by the firmware. + */ + +/* + * Top level Intel Error Signature Identi=
fiers. + */
>> +#define INTEL_SIGID_INVALID 0 +#define INTEL_SIGID_BATCH 100 +#define I=
NTEL_SIGID_RANGE_START(n) ((n) * INTEL_SIGID_BATCH) +#define INTEL_SIGID_RA=
NGE_END(n) (INTEL_SIGID_RANGE_START((n) + 1) - 1) + +/* SIGIDs 1xx are rese=
rved for Xe GPU software and 2xx for Xe GPU hardware */ +#define INTEL_SIGI=
D_GPU_XE_SOFTWARE_START INTEL_SIGID_RANGE_START(1) +#define INTEL_SIGID_GPU=
_XE_SOFTWARE_END INTEL_SIGID_RANGE_END(1) +#define INTEL_SIGID_GPU_XE_HARDW=
ARE_START INTEL_SIGID_RANGE_START(2) +#define INTEL_SIGID_GPU_XE_HARDWARE_E=
ND INTEL_SIGID_RANGE_END(2) + +/** + * enum xe_sigid - Stable Xe Error Sign=
ature Identifiers (SIGID). + * @XE_SIGID_SW: Software component failure. + =
* @XE_SIGID_PROBE: Device probe/bind was aborted. + * @XE_SIGID_WEDGED: Dev=
ice was declared wedged and is no longer usable. + * @XE_SIGID_SURVIVABILIT=
Y: Device entered survivability mode. + * @XE_SIGID_RUNTIME_FW: Driver-dete=
cted runtime firmware failure, GuC/HuC/GSC. + * @XE_SIGID_DEVICE_FW: Driver=
-detected device
>> firmware failure, PCODE/sysctrl. + * @XE_SIGID_GT_TDR: Engine hang / tim=
eout detection and recovery (reset). + * @XE_SIGID_MEM_FAULT: VM bind, page=
 fault or GTT fault. + * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO acce=
ss fault. + * + * Each SIGID represents the report sites the driver detects=
 and reports. + * Values are numbered sequentially, are only ever appended,=
 and are never + * renumbered or reused. + * + * Firmware- and hardware-ori=
ginated signatures are not listed yet here. + */ +enum xe_sigid { + XE_SIGI=
D_SW =3D INTEL_SIGID_GPU_XE_SOFTWARE_START, + XE_SIGID_PROBE =3D INTEL_SIGI=
D_GPU_XE_SOFTWARE_START + 1, + XE_SIGID_WEDGED =3D INTEL_SIGID_GPU_XE_SOFTW=
ARE_START + 2, + XE_SIGID_SURVIVABILITY =3D INTEL_SIGID_GPU_XE_SOFTWARE_STA=
RT + 3, + XE_SIGID_RUNTIME_FW =3D INTEL_SIGID_GPU_XE_SOFTWARE_START + 4, + =
XE_SIGID_DEVICE_FW =3D INTEL_SIGID_GPU_XE_SOFTWARE_START + 5, + XE_SIGID_GT=
_TDR =3D INTEL_SIGID_GPU_XE_SOFTWARE_START + 6, + XE_SIGID_MEM_FAULT =3D IN=
TEL_SIGID_GPU_XE_SOFTWARE_START
>> + 7, + XE_SIGID_IO_BUS =3D INTEL_SIGID_GPU_XE_SOFTWARE_START + 8, +}; + =
+#endif diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_lo=
g.c new file mode 100644 index 000000000000..ae4f6e33f5b8 --- /dev/null +++=
 b/drivers/gpu/drm/xe/xe_log.c @@ -0,0 +1,138 @@ +// SPDX-License-Identifie=
r: MIT +/* + * Copyright =C2=A9 2026 Intel Corporation + */ + +#include "xe=
_log.h"
>> +#include "xe_printk.h"
>> +
>> +static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_s=
igid sigid,
>> +			  u32 component, u32 location, const void *data, size_t len,
>> +			  struct va_format *vaf)
>> +{
>> +	/* TODO */
>> +}
>> +
>> +static bool is_hw_sigid(enum xe_sigid sigid)
>> +{
>> +	return (int)sigid >=3D INTEL_SIGID_GPU_XE_HARDWARE_START;
>> +}
>> +
>> +static bool is_sev_error(int cper_sev)
>> +{
>> +	return cper_sev !=3D CPER_SEV_INFORMATIONAL;
>> +}
>> +
>> +static const char *log_hwe_prefix(int cper_sev, enum xe_sigid sigid)
>> +{
>> +	return is_sev_error(cper_sev) && is_hw_sigid(sigid) ? HW_ERR : "";
>> +}
>> +
>> +static const char *log_sev_prefix(int cper_sev)
>> +{
>> +	switch (cper_sev) {
>> +	case CPER_SEV_FATAL:
>> +		return "FATAL ";
>> +	case CPER_SEV_RECOVERABLE:
>> +		return "";
>> +	case CPER_SEV_CORRECTED:
>> +		return "CORRECTED ";
>> +	case CPER_SEV_INFORMATIONAL:
>> +		return "";
>> +	default:
>> +		WARN(IS_ENABLED(CONFIG_DRM_XE_DEBUG), "LOG: unknown severity %d\n", c=
per_sev);
>> +		return "";
>> +	}
>> +}
>> +
>> +#define __LOG_DRM_PRINTK_FMT(fmt, args...)	"[drm] " fmt, ##args
>> +#define __LOG_DRM_PRINTK_ERR_FMT(fmt, args...)	__LOG_DRM_PRINTK_FMT("*E=
RROR* " fmt, args)
>> +
>> +static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struc=
t va_format *vaf)
>> +{
>> +	if (cper_sev =3D=3D CPER_SEV_INFORMATIONAL)
>> +		pci_info(pdev, __LOG_DRM_PRINTK_FMT("%pV", vaf));
>> +	else
>> +		pci_err(pdev, __LOG_DRM_PRINTK_ERR_FMT("%pV", vaf));
>> +}
>> +
>> +static void log_dmesg_printf(struct pci_dev *pdev, int cper_sev, const =
char *fmt, ...)
>> +{
>> +	struct va_format vaf;
>> +	va_list args;
>> +
>> +	va_start(args, fmt);
>> +	vaf.fmt =3D fmt;
>> +	vaf.va =3D &args;
>> +
>> +	log_dmesg_vprintk(pdev, cper_sev, &vaf);
>> +
>> +	va_end(args);
>> +}
>> +
>> +static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_=
sigid sigid,
>> +			   u32 component, u32 location, const void *data, size_t len,
>> +			   struct va_format *vaf)
>> +{
>> +	const char *hwe_prefix =3D log_hwe_prefix(cper_sev, sigid);
>> +	const char *sev_prefix =3D log_sev_prefix(cper_sev);
>> +
>> +	/* TODO: add component/location details */
>> +
>> +	if (IS_ERR(data))
>> +		log_dmesg_printf(pdev, cper_sev, "SIGID=3D%u %s(%pe) %s%pV",
>> +				 sigid, sev_prefix, data, hwe_prefix, vaf);
>> +	else if (data && len)
>> +		log_dmesg_printf(pdev, cper_sev, "SIGID=3D%u %s(%*phN) %s%pV",
>> +				 sigid, sev_prefix, (int)len, data, hwe_prefix, vaf);
>> +	else
>> +		log_dmesg_printf(pdev, cper_sev, "SIGID=3D%u %s%s%pV",
>> +				 sigid, sev_prefix, hwe_prefix, vaf);
>> +}
>> +
>> +/**
>> + * xe_log_emit() - Emit a structured SIGID log entry
>> + * @pdev: the &pci_dev device
>> + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
>> + * @sigid: signature identifier, see &enum xe_sigid
>> + * @component: component identifer
> Typo "identifier"
>> + * @location: location details of the @component
>> + * @data: pointer to the additional details, or ERR_PTR, or NULL if not=
 applicable
>> + * @len: length of the @data in bytes, or 0 if not applicable
>> + * @fmt: printf-style format string
>> + * @...: format arguments
>> + *
>> + * Emits a dmesg line that includes a single stable, machine-matchable =
token
>> + * ``SIGID=3D<n>`` followed by the optional severity token (like ``FATA=
L``) and,
>> + * when @data pointer is set, either the error printed with %pe or a pa=
cked hex
>> + * dump of the @data binary blob. The dmesg line will also include prin=
tf-style
>> + * text message.
>> + *
>> + * Note that the full dmesg line, with the free text message, is only a=
 debugging
>> + * aid, not an interface! Only the ``SIGID=3D<n>`` token is stable ther=
e.
>> + * The durable machine record is the CPER carrying the same SIGID.
>> + *
>> + * Note: generation of the CPER record is a planned follow-up.
>> + *
>> + * Examples::
>> + *
>> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=3D104 FATAL (-EPROTO) Inv=
alid GuC reply
>=20
> Missing TAG: in this case=C2=A0GuC/HuC/GSC:=C2=A0=C2=A0
>=20
> right?

not really

at the current patch there is only xe_log_emit() function available,
there is no other macros, no component definitions, so for the call
like this:

	xe_log_emit(pdev, CPER_SEV_FATAL, XE_SIGID_RUNTIME_FW,
			ERR_PTR(-EPROTO), 0, "Invalid GuC reply");

the output will be:

	<3> xe 0000:03:00.0: [drm] *ERROR* SIGID=3D104 FATAL (-EPROTO) Invalid GuC=
 reply

but later, after introducing more macros and component/location
definitions, one can use this instead:

	xe_log_err_fatal(gt, GUC, -EPROTO, "Invalid GuC reply");

and then indeed the output will be decorated with location/component info:

	<3> xe 0000:03:00.0: [drm] *ERROR* SIGID=3D104 FATAL (-EPROTO) Tile0: GT1:=
 GUC: Invalid GuC reply
>=20
>> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=3D106 (-ETIMEDOUT) Engine=
 'rcs0' hung
>=20
> ditto
>=20
>> + *   <6> xe 0000:03:00.0: [drm] SIGID=3D103 In survivability mode
>> + */
>> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigi=
d,
>> +		 u32 component, u32 location, const void *data, size_t len,
>> +		 const char *fmt, ...)
>> +{
>> +	struct va_format vaf;
>> +	va_list args;
>> +
>> +	va_start(args, fmt);
>> +	vaf.fmt =3D fmt;
>> +	vaf.va =3D &args;
>> +
>> +	log_emit_dmesg(pdev, cper_sev, sigid, component, location, data, len, =
&vaf);
>> +	log_emit_cper(pdev, cper_sev, sigid, component, location, data, len, &=
vaf);
>> +
>> +	va_end(args);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
>> new file mode 100644
>> index 000000000000..d475e816ee0b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_log.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright =C2=A9 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_LOG_H_
>> +#define _XE_LOG_H_
>> +
>> +#include <linux/cper.h>
>> +
>> +#include "abi/xe_sigid_abi.h"
>> +
>> +struct pci_dev;
>> +
>> +__printf(8, 9)
>> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigi=
d,
>> +		 u32 component, u32 location, const void *data, size_t len,
>> +		 const char *fmt, ...);
>> +
>> +#endif

