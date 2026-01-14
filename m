Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FF6D3CC84
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 22:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4780E10E0F6;
	Wed, 14 Jan 2026 22:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kb0xSTDf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5555F10E69D
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 22:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768430146; x=1799966146;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fb02CflIsvakxvxo3Wx5gzTJ6EM166ONDJLZmVXoIzs=;
 b=Kb0xSTDfWI5S893vFNHia7Z0amaMWkTB0G+fQIk5qZduWz7Cxet6gQBi
 32gxGnNZhaAHupzwW699Z5sOjM2XFONUOsy+7xVkpOITk5GzZwSnBuQSt
 oyFTbdWBpvdBzG5cXXKyVbPpGTGmedQ3l7c1nIVd2f90N1r7Q0e8mcMTS
 8Lp8QZExHeoxsWCPJDMFt/qw4O2o7e1kolVSdpqnv0CMpgZJIKdoYkUFQ
 Ff9+X6IYn4Vv97HtTXVbHHTAeKUV5OzrNH7jisZRjYuNie34WBilUY4mh
 wuFBwY+MBJ8FD3grEcd3pYUYZjR2vOIUyVUuGp8ngQw2eoDWb4W8kZRC9 g==;
X-CSE-ConnectionGUID: MR1ym94AQSKwegbdhP+7zQ==
X-CSE-MsgGUID: +yVaDtRMTnqvnEkznxjbMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="57292916"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="57292916"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 14:35:46 -0800
X-CSE-ConnectionGUID: W/ZOQvjaSq+9anjZAiz/MQ==
X-CSE-MsgGUID: Qx+Z13mOQPySUlC3UG1htw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="209261003"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 14:35:46 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 14:35:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 14:35:45 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 14:35:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLLD49CMtZ8nvUT+v4ZyXj8Z4D+ZDs8fX83wkHpfExnZ5QSe+OgozJbwTU6T2DeyXxyQS31Ywy59MfCZ4x+mX2odox6612iGgpdbv7GrrWe+BpNSUAaP0nSeS921VJY1tW93s0Hztm5sgO2NW5mrG2XDkK/0jwh+tN9QOQFPyX5kS4Pc9Q9N7ZTH4y1EnvWwGj3WqRJ19ivbfIZN+K0+ifGJKhYvzVjYHucwmCsVUEK4uApHgF9QHpvUEkxsX+jML2vO0axCxrqcJvnXzi+6QP+/hIb0xCaLt7LuAGz9/NduHs8qMHMBZ3mmiAftdaRE2ziMj6L8DNUzzcUm8pMgSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIKgmhcRRVSmLeERpLNdQEpRoBMYID3oIQjMK5k+6IQ=;
 b=myZXz8QYyMmogiuCX4UOtLHQTw6ftWiE8Zt0u/I8k48+989rFgGaFYYY5gNgXYjzgyQQsOk4aJRHNOKUkUsufxtAYC6sl7yKllyN0tWGdzEZT9aZvUxUCmHtoUZHJcUPqolzfDDFg+/jMkquaRi4/vlrunxFvMlBpfvxaaojXaRFoR7L08UTtLQFRoPCuf6dnyKtAE20nh3IFUKqCCZ4ufjV6/u0nLdp9XpDFMKam7yRYuu6YrlDcK8ZPfgTR5boxq98vB8IngpYHO7doUiqAxiyJKoaOeVb+t6Vr6wEj1QYGeWn7UrN7PTjdKVIN6Lih6gHFivzGrNtcFKCNG3jVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ1PR11MB6203.namprd11.prod.outlook.com (2603:10b6:a03:45a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 22:35:41 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 22:35:41 +0000
Message-ID: <ae2f2a0f-8ecf-406a-816b-5d62f50e1377@intel.com>
Date: Wed, 14 Jan 2026 17:35:38 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/xe: Forcefully tear down exec queues in GuC
 submit fini
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20251218214418.4037401-1-matthew.brost@intel.com>
 <20251218214418.4037401-3-matthew.brost@intel.com>
 <5a99db81-ebbe-4dfe-a528-1063c4bcf1d1@intel.com>
 <aWAC4EyhqZZT5tbe@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <aWAC4EyhqZZT5tbe@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::21) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ1PR11MB6203:EE_
X-MS-Office365-Filtering-Correlation-Id: 399631b4-cf8a-4a9d-9532-08de53bd3f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVZEUmp3SjJBWHJRcjc3SHAzVzZ4QlJ6Rmt1VngzNjl5WU1pT0RXWkRMNkpB?=
 =?utf-8?B?WTkyNDRRSTRRejU3Mm5lck81MjArU3VZZjlKcUlWMTU1bERUdFU3VnRUdkUy?=
 =?utf-8?B?TFo2NmxqMHBMU0dYbElSUUtnYm5ieWY3QW5id0cvQkdDMmxjZVNVUXBqUnJh?=
 =?utf-8?B?cVZVY3MwNXpPajlPYWRycUJGdW96VkorcnllckxZamZkNXhUQXVPaUtGSXJQ?=
 =?utf-8?B?a1d3TkZQWWY0Uk1SZ1BBa0Q1emt0Um84anBHOVFvRjM2ay8zSGlLKzZjaW1s?=
 =?utf-8?B?ZUhoYnMrWGcxdTgra0NSM3lqeit6QWkwM1NsUzJKOFQwYTFzdHRJSjJ4a2VP?=
 =?utf-8?B?TXRxRUNTNGhVMHp2RmlVbkFlVi9McVBjdko1YVQ5aEE2UFU3eXdBTVVLVlJx?=
 =?utf-8?B?YXovVkx3QzV0VFBpYy92VkFHcVBIS1hSaFRzSVVPRnN4R2NSbTJjSjAzTGhC?=
 =?utf-8?B?R3RwZVdQbHpMa0E2QWxsRndGdUd1WlBYOGdXV0NjT1paWm9VNjluNGdoSHkr?=
 =?utf-8?B?b3FkSENhaGk3eXhXSzFEQktUVk56L1FhM25seVdxbUtpUEFNazRUNlZWTkJE?=
 =?utf-8?B?ZTh3YlFkdWN4OU96cUZWOTEvTnozQWNucUFMRWdjZ2xlb1VFeVhkMXkwekdy?=
 =?utf-8?B?Nm5YQlUxOGdRWW1rb0tvd1Y1WXlBcG1iSzFQN1ZEVWNTWnN2SlJSSW5oQ1E5?=
 =?utf-8?B?T01aRE9LeWNPTCtNY0ZCMjVuNU1PeEJUMEdmTU1laUZQczNaaVpabnprcnRl?=
 =?utf-8?B?NTcrdUVXWTFBTjdqV0ZpR2JaaFhXbGxudlI4NHpjMnZsRnBOR1U3MnlLRlBz?=
 =?utf-8?B?dFI3SWJ2TU1uZHZVdTR1bkM0NEhHTU1EaGdsYTRBV1NRNUk0NlpZckJUMGR1?=
 =?utf-8?B?MDZzSDV3MUQwR0VMc1pUQUNqUXlwVHRkQm5XV3ZtSU5QRkFDWjlMdXM2TXUy?=
 =?utf-8?B?S2xtY1Y2STZkUzN4cUFyUXU1TXpBYkJpSmc0anR3d0pxaktIMi9uanRTVExH?=
 =?utf-8?B?dm9JZ1UrOU16QkhnSkZOQzVEUUlheXRmTVg4dm1ya29CeU11b05IaG5UWWNz?=
 =?utf-8?B?MmlJNUZ4NUh6R3NYRUhQK0pHbjYzVWorODdqVDE3ZDN3UzlhMkVUdFlLU1gv?=
 =?utf-8?B?RE9nYlUwVzU1UkZiN1E4Wkw5THBvem9RSlpLemM2ZWhqWHVEMVZsTHJYcWtL?=
 =?utf-8?B?TXQycHpLbDhjdGpGVEZRbkFzNFNQbzhhR1J3M0xEcmxrY0JJUFozWmVSUVI1?=
 =?utf-8?B?Y3A2L1MvTXBpRkQzSVVzNU85cnZFZTZjQjlhWm82dFpIODJWWmZPbTZLTlJN?=
 =?utf-8?B?TjFwRmdlV1RSOHY3QW5hMmE3d2J1ZE04T05LWVo1RFhGb3NKanlYVEFUL2h6?=
 =?utf-8?B?LytlNzhWNTBPL0FnRTBGVWtHSjBTYVZjYzNnaDhoSFRsdTVuWWtaTzNhZVcr?=
 =?utf-8?B?VmZFeHI2N0ZYWEZPSG9aM1pkTDE4cWcrZGZkTlNTeXFCeUVoekhkU214dkM4?=
 =?utf-8?B?aHRsYjNTWG9JclY4Nk5qNzVsbEY5d0llYTM3bTNqRzFxckVDbWJGQ0o0QWJk?=
 =?utf-8?B?T1BEb3hFK3liQldSRnlReFBwVHh0MFl6VWM0ZEw4QldSRGFiL2M5bUxDRyt2?=
 =?utf-8?B?Si9pYng0UTY2cWtqS1B0UkFEaCtSVzBpUDZNWktUTmE5RURacTl5SG1SK0lY?=
 =?utf-8?B?NnM3U3MwUzBFTjNQQVVmQkJCMmFuREdIUXU0bDJIR3gyaUNQWTlXQzRDYU8z?=
 =?utf-8?B?M3RGVEEzRXZtM3JYbEFpUTVoWUp1aGxFYUtKaDdyYkx6YURXUDhJbU0reHZj?=
 =?utf-8?B?dnJQbkRtS2Y5TlVGUTdaYm1yYjVzZUtYZUQ3VmFTTW1hQ28yNzQ1Yi9SNEIr?=
 =?utf-8?B?Q3IxQ0c5Q043NFBNVHY3T05VUHpKQlNKMUFSdGZXU2piMms1Z2JoOTlOMzkv?=
 =?utf-8?B?anNwQUo0OEtna2NIdEVEUjNqQ3hUbjFtTnRUYWUrY1NJMElUMHIvSDRYbkc2?=
 =?utf-8?B?Zm5lWldOSEZ2cCsyZHZOVGdSSmtoVGY3bzRjdXlraXhubjlzYWk0RUdZODRE?=
 =?utf-8?B?RGJYQTkyWXk2TGpSL1I4MlpFNGhzYXZaQ0hPSVNMVkxrNEQybGdSVlpDRyta?=
 =?utf-8?Q?BRlo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGs2akpwejBPWDFRWHJpTnhyUURINmZTTTAxYjR5bTVNYWRjS1hqSFNhSEcr?=
 =?utf-8?B?ZXhQMlc2SWZ1OFB4Tk9zNEJuOW1XWlcxeXAvNWgxWkd5M2Y3RGlNeXNkbjMx?=
 =?utf-8?B?ZFpsMmo3M0d5Ym9xazBkUzducEN1N3lvNnBJZU1uMW9tSG5SV3RkUDB1QjJI?=
 =?utf-8?B?Qko4dGsxRVQybEN5OVRLdlRaR2ZsdVlXa1BGR2wxT0J5QlQrNVovTXZwbHdx?=
 =?utf-8?B?b1Rka2U5U2d6aER3a2Y4WDBzMVp5VDNvT3NKQW11YjRZeVdTS0w1TGZPay91?=
 =?utf-8?B?QVpwRjZVUitiT0FqVFJsbjFPVDVzdzJHTlRGdHlhWlZ3YWpLaGJEZ1RBVjMv?=
 =?utf-8?B?Qk5kaXBWSUV1Ynd0RFlyRkhWcEY2Yi9Xcm81c2g3Vll6TzFJUUtXeWU1S2JM?=
 =?utf-8?B?SDlYdjNBeHN2cVkvQyt3bVVjaGl4Z2VYTmhOVldCTFluVFRHNFlmOVd6QUFq?=
 =?utf-8?B?WWtSOGxoZWRZWHBwSmVGMmVUT0prL1Q2UGZwNHhlWGZiWWJPYW1XcXIrTHVt?=
 =?utf-8?B?U0kxYTUvL2RCYXBOOXJ5WnQrekwwcW9qbFBGTGZQU0pDd2VXdXRETm56Z0Jr?=
 =?utf-8?B?TGczSmhrVjBmRG0rMVRaQU9yOXlGUWdGMG55ODFBTWUrYmRYMzBYKzI0SStO?=
 =?utf-8?B?SjBmZHhkSWVCRENtTzN0cVg2VXdrbXRmd3o3SUFpNEVlMjhTc0tXVGJSaXJw?=
 =?utf-8?B?NjE3amdxRnQzRnBkRm03M3hXVlp5bUlmcU9NU2lTT21aUnZxRkdkUVhnd1dF?=
 =?utf-8?B?Ry9TVGRDbVFPVzFObHM5MFlkKzNoY3VpNjFLcEVEaUc5bVpPTU5GbmIzNjFD?=
 =?utf-8?B?NzNhYUQveks0UVQ5ZmRFT0NISXcvQjJnY3ZuQ3hhZy9zTDRsVUtXUkViR2ky?=
 =?utf-8?B?ckQ5VTltQTB5ZmhEbGhHc0hRcFg4SlFicnVnZlZ5bHJ1Q1BXdi9Fb2ROR0tY?=
 =?utf-8?B?T2dRbjg5WUhmakE3NWJ5MWRnVEFSb3puWTAzSlBpd3RQZjNZT2FiMEVLS0Zz?=
 =?utf-8?B?bzZ5RTFxcTE0cHJGejAzZUhRb2l3UnpNbEVrZm5YWEFXN0VYYWpnVDBOWEsv?=
 =?utf-8?B?eThjZG0wR1hmNWhGbklWVnYvSW9DeGFBaHBrckNlUUw2VWpIbVlyKzkxbW9s?=
 =?utf-8?B?V2YwQWZXdG9pWGViczBDc0svdkdiN3VLSW5FeHJKb282d2ptK3FqazViUUt4?=
 =?utf-8?B?SzZOb0I3NFBDWTZnc1o5bDRqZ0NkbnIrQ0szVFV0WWhaK09YYUhPTGRTcHVD?=
 =?utf-8?B?MXduclNoenpETkl3V0l5YmpVOHFXZ1FLRXhvcmVYbkFldnk5U3RERTNFQVBL?=
 =?utf-8?B?QTlCM3pzSFlmMUlhYzUveDRNdFRWNnZuV21ka3crTlhtdlpFN3JCb2xReW9X?=
 =?utf-8?B?bnMxdER6R0FYUlRqcSsrcVNWY0pmaDVJWUg2SS9pSzJndzhjQys4VDE5OTV0?=
 =?utf-8?B?cnhOLy9QQmhxcVJPaXJiV3ZIQXFURTV4ZTBFekZSVVAyUDRvTUR2RFY3WjQw?=
 =?utf-8?B?SHI0ckE4NmMzUWxxNXprUjdEeEVDMm5uWldtQktydjN6T2RudzM5bFZqeDl3?=
 =?utf-8?B?QklTR2xiQWYzczFEU3JpNDFEVFEwSkR2U0hudzRGZHRkNmh1bUtOQ1g1WE9n?=
 =?utf-8?B?MTczTHUxMEJQS0dUZytOQTlMU0hIME0xUmRSd2trQTBnQlVuTXZnYmd6NjFj?=
 =?utf-8?B?a2NZSVJKMUt4MlBuUVV0dDRnM01TaWlJckJ2SVhBZWI0TTVHZUV1NzUvUzhL?=
 =?utf-8?B?Nm96anVGU0hYWjFzU1gzaVl0N2NLSk9PK1dwRkplTHMxampGcGVSTDRUbkQx?=
 =?utf-8?B?RkFiN2VocUxMdWs4MkVsaktTS2kzaEV3amF4aUxlN09wMDNCQVBXUEdXbXhT?=
 =?utf-8?B?MzZXRXhsQWV0V0FCajBzTEdveEJsdW1tdTlsbUw1VjUyQUdVbGJtR05Hdlhu?=
 =?utf-8?B?Zzl4S2ExU3o3cTByUVIvejVsS1hkR09La1NlMkJ1dW1GbWdaTHVYSkx3ZjVv?=
 =?utf-8?B?eUtjZmZSKzZ3dEtKaGdKN1RxYlpDNExuZGpBV3NGUmF6WGcrWVQwNWhUWVB5?=
 =?utf-8?B?UXlNOEhHYktLT2tJSEJTdU5tVytMUWtCQUMweGRUMFZrUGNkREtDL1VOTTNF?=
 =?utf-8?B?WWhTTzNXY1R4Y2tCdFFJczlJcU1DeEV0ZDFhU3BEUVVETHRML0xqUFBTUTgv?=
 =?utf-8?B?ZG5iWE1QMnZla3pnRlZ2NmFpYkU5bkh5bUxESTVsNldkWEcwTnl1eHB1Njhm?=
 =?utf-8?B?MkFtUEhoZXpyOGRJa2NCUHFqM01NeEtyT29XY29jbjY2cHVEVVZlQjNrV3Bi?=
 =?utf-8?B?cEFyR2lxUXQ5dEF1c25tTmNQRUNhREZ1MHBtTE12NFIzaHREMTN4dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 399631b4-cf8a-4a9d-9532-08de53bd3f54
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 22:35:41.2760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yaq8V74lSjq7jYNlRO6Z+7ujPapw7T44XFi4gmQo3m+HfbHp3C6JPLsfcIrFEHNXYHg23Pt4fTw/FoJ6sJ1QDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6203
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



On 2026-01-08 2:17 p.m., Matthew Brost wrote:
> On Thu, Jan 08, 2026 at 02:00:15PM -0500, Dong, Zhanjun wrote:
>>
>>
>> On 2025-12-18 4:44 p.m., Matthew Brost wrote:
>>> In GuC submit fini, forcefully tear down any exec queues by disabling
>>> CTs, stopping the scheduler (which cleans up lost G2H), killing all
>>> remaining queues, and resuming scheduling to allow any remaining cleanup
>>> actions to complete and signal any remaining fences.
>>>
>>> v2:
>>>    - Fix VF failure (CI)
>>>
>>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>
>>> ---
>>>
>>> This fix will not apply outright to any stable kernel as it depeneds on
>>> functions which have added in the KMD since the original commit. Likely
>>> will have to manually send out patches to stable for kernel which we'd
>>> like to fix.
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc_submit.c | 27 ++++++++++++++++++++-------
>>>    1 file changed, 20 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index 071cbfec2401..58ec94439df1 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -289,6 +289,8 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>>>    		 EXEC_QUEUE_STATE_BANNED));
>>>    }
>>> +static int __xe_guc_submit_reset_prepare(struct xe_guc *guc);
>>> +
>>>    static void guc_submit_fini(struct drm_device *drm, void *arg)
>>>    {
>>>    	struct xe_guc *guc = arg;
>>> @@ -296,6 +298,12 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
>>>    	struct xe_gt *gt = guc_to_gt(guc);
>>>    	int ret;
>>> +	/* Forcefully kill any remaining exec queues */
>>> +	xe_guc_ct_stop(&guc->ct);
>>> +	__xe_guc_submit_reset_prepare(guc);
>>> +	xe_guc_submit_stop(guc);
>>> +	xe_guc_submit_pause_abort(guc);
>>> +
>>
>> Tested this series over
>> 265d13795b45 drm-tip: 2026y-01m-06d-08h-06m-43s UTC integration manifest
>> ===(CI_DRM_17772) and (xe-4335) with (IGT_8685)===
>>
>> and run test xe_fault_injection --r probe-fail-guc-xe_guc_mmio_send_recv
>> --debug
>> got few problems:
>> 1. Assertion ct->g2h_outstanding == 0 triggered
>> call stack shows:
>> [  708.967261]  xe_guc_ct_disable+0x17/0x80 [xe]
>> [  709.043382]  xe_guc_sanitize+0x31/0x50 [xe]
>> [  709.119557]  xe_uc_load_hw+0x187/0x2a0 [xe]
> 
> Above is a different problem. Just delete xe_guc_sanitize from
> xe_uc_load_hw, that call is nonsense left over from the i915 port.
> 
> xe_guc_sanitize / xe_uc_sanitize everywhere probably needs a look if
> those calls make any bit of sense.
Agree
> 
>>
>> 2. Page fault
>> [  740.822070] BUG: unable to handle page fault for address:
>> ffffc9000c80fc50
>> [  740.828896] #PF: supervisor write access in kernel mode
>> [  740.834063] #PF: error_code(0x0002) - not-present page
>> [  740.839145] PGD 100000067 P4D 100000067 PUD 100ad4067 PMD 0
>> [  740.844738] Oops: Oops: 0002 [#2] SMP NOPTI
>> [  740.848880] CPU: 2 UID: 0 PID: 169 Comm: kworker/2:2 Tainted: G S M UD W
>> 6.19.0-rc4+xu4335+ #3 PREEMPT(voluntary)
>> [  740.859964] Tainted: [S]=CPU_OUT_OF_SPEC, [M]=MACHINE_CHECK, [U]=USER,
>> [D]=DIE, [W]=WARN
>> [  740.867952] Hardware name: Intel Corporation Meteor Lake Client
>> Platform/MTL-P DDR5 SODIMM SBS RVP, BIOS MTLPFWI1.R00.4122.D21.2408281317
>> 08/28/2024
>> [  740.881081] Workqueue: xe-destroy-wq __guc_exec_queue_destroy_async [xe]
>> [  740.887820] RIP: 0010:xe_ggtt_set_pte+0x53/0x350 [xe]
>> [  740.892900] Code: e2 48 89 45 d0 31 c0 f7 c6 ff 0f 00 00 75 56 49 3b 5c
>> 24 08 0f 83 a8 01 00 00 49 8b 84 24 b0 00 00 00 48 c1 eb 0c 48 8d 04 d8 <4c>
>> 89 38 48 8b 45 d0 65 48 2b 05 e6 41 d1 e2 0f 85 e1 02 00 00 48
>> [  740.911428] RSP: 0018:ffffc9000074b9f0 EFLAGS: 00010202
>> [  740.916599] RAX: ffffc9000c80fc50 RBX: 0000000000001f8a RCX:
>> 0000000000000000
>> [  740.923653] RDX: 0000000000000000 RSI: 0000000001f8a000 RDI:
>> ffff888132562628
>> [  740.930705] RBP: ffffc9000074ba88 R08: 0000000000000000 R09:
>> ffff888168188000
>> [  740.937758] R10: 0000000000000000 R11: 0000000000000000 R12:
>> ffff888132562628
>> [  740.944807] R13: 0000000000000000 R14: ffff88816818a768 R15:
>> 0000000000000000
>> [  740.951861] FS:  0000000000000000(0000) GS:ffff8884ebbe0000(0000)
>> knlGS:0000000000000000
>> [  740.959850] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [  740.965534] CR2: ffffc9000c80fc50 CR3: 0000000132923003 CR4:
>> 0000000000f72ef0
>> [  740.972585] PKRU: 55555554
>> [  740.975268] Call Trace:
>> [  740.977694]  <TASK>
>> [  740.979778]  ? __mutex_lock+0xae/0x1080
>> [  740.983583]  xe_ggtt_clear+0xa1/0x260 [xe]
>> [  740.987716]  ? lock_release+0x1df/0x280
>> [  740.991519]  ? pm_runtime_get_conditional+0x66/0x150
>> [  740.996436]  ggtt_node_remove+0xb2/0x140 [xe]
>> [  741.000829]  xe_ggtt_node_remove+0x40/0xa0 [xe]
>> [  741.005393]  xe_ggtt_remove_bo+0x87/0x250 [xe]
>> [  741.009874]  ? _raw_write_unlock+0x22/0x50
>> [  741.013927]  ? drm_vma_offset_remove+0x65/0x80
>> [  741.018324]  xe_ttm_bo_destroy+0xd4/0x310 [xe]
>> [  741.022800]  ttm_bo_release+0x70/0x330 [ttm]
>> [  741.027032]  ? vunmap+0x4a/0x70
>> [  741.030147]  ? vunmap+0x4a/0x70
>> [  741.033260]  ttm_bo_fini+0x3c/0x70 [ttm]
>> [  741.037145]  xe_gem_object_free+0x1a/0x30 [xe]
>> [  741.041618]  drm_gem_object_free+0x1d/0x40
>> [  741.045671]  xe_bo_put+0x136/0x1c0 [xe]
>> [  741.049548]  xe_lrc_destroy+0x47/0x60 [xe]
>> [  741.053691]  xe_exec_queue_fini+0x85/0xd0 [xe]
>> [  741.058172]  __guc_exec_queue_destroy_async+0x7c/0x190 [xe]
>> [  741.063770]  process_one_work+0x22e/0x6b0
>> [  741.067741]  worker_thread+0x1a0/0x370
>> [  741.071456]  ? __pfx_worker_thread+0x10/0x10
>> [  741.075683]  kthread+0x11f/0x250
>> [  741.078882]  ? __pfx_kthread+0x10/0x10
>> [  741.082594]  ret_from_fork+0x337/0x390
>> [  741.086315]  ? __pfx_kthread+0x10/0x10
>> [  741.090027]  ret_from_fork_asm+0x1a/0x30
>> [  741.093909]  </TASK>
>>
>> Sounds like call xe_guc_submit_pause_abort here might cause trouble. That's
>> why I call it in guc_fini_hw, which make the test passed.
>>
> 
> Thanks for the info. guc_fini_hw isn't definitely isn't the right place
> though as that is registered before xe_guc_submit_init is called.
> 
> If I'm understanding the trace correctly - guc_submit_fini should be on
> the devm exit handler.
> 
> Want to give my two suggestions a try? Also feel free run with these
> patch / take over if you bandwidth. It is unlikely I'll have bandwidth
> to pick these back up for at least a week or so.

With more debug print on begin(^)/end($) of 
guc_fini_hw/mmio_fini/guc_submit_fini:
[  183.000171] ZD guc_fini_hw ^
[  183.000187] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] Tile0: 
GT1: GuC CT communication channel disabled
[  183.003374] ZD guc_fini_hw $
[  183.116889] ZD __xe_exec_queue_fini q:ffff88816a92d000 flag:0 
lrc.bo:ffff88816baa8800
[  183.129725] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] Tile0: 
GT0: GuC CT communication channel stopped
[  183.130487] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] Tile0: 
GT0: GuC CT communication channel disabled
[  183.131138] ZD guc_fini_hw ^
[  183.131146] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] Tile0: 
GT0: GuC CT communication channel disabled
[  183.134163] ZD guc_fini_hw $
[  183.235099] xe 0000:00:02.0: [drm:intel_pps_vdd_off_sync_unlocked 
[xe]] [ENCODER:505:DDI A/PHY A] PPS 0 turning VDD off
[  183.238289] xe 0000:00:02.0: [drm:intel_pps_vdd_off_sync_unlocked 
[xe]] [ENCODER:505:DDI A/PHY A] PPS 0 PP_STATUS: 0x00000000 PP_CONTROL: 
0x00000060
[  183.238415] xe 0000:00:02.0: [drm:intel_power_well_disable [xe]] 
disabling AUX_A
[  183.238621] xe 0000:00:02.0: [drm:wait_panel_power_cycle [xe]] 
[ENCODER:505:DDI A/PHY A] PPS 0 wait for panel power cycle (500 ms 
remaining)
[  183.747985] xe 0000:00:02.0: [drm:wait_panel_status [xe]] 
[ENCODER:505:DDI A/PHY A] PPS 0 mask: 0xb800000f value: 0x00000000 
PP_STATUS: 0x00000000 PP_CONTROL: 0x00000060
[  183.758418] xe 0000:00:02.0: [drm:wait_panel_status [xe]] Wait complete
[  183.774541] ZD mmio_fini ^
[  183.774551] ZD mmio_fini $
[  183.777314] xe 0000:00:02.0: [drm:drm_pagemap_shrinker_fini 
[drm_gpusvm_helper]] Destroying dpagemap shrinker.
[  183.789419] ZD guc_submit_fini ^
[  183.792669] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] Tile0: 
GT1: GuC CT communication channel stopped
[  183.793409] ZD xe_guc_submit_pause_abort q:ffff88811d5fd000 flag:10
[  183.799955] ZD __xe_exec_queue_fini q:ffff88811d5fd600 flag:10 
lrc.bo:ffff888168fa6800
[  183.807866] ZD guc_submit_fini start drain_workqueue
[  183.807920] ZD __xe_exec_queue_fini q:ffff88811d5fd000 flag:90 
lrc.bo:ffff888168fa5000
[  183.820685] ZD xe_ggtt_remove_bo bo:ffff888168fa6800 
ggtt:ffff88812c695628
[  183.827536] ZD xe_ggtt_remove_bo bo:ffff888168fa5000 
ggtt:ffff88812c695628
[  183.834390] ZD xe_ggtt_clear ggtt:ffff88812c695628 start:33239040 
gsm:ffffc9000c800000 gsm.:ffffc9000c80fd98
[  183.844343] BUG: unable to handle page fault for address: 
ffffc9000c80fd98
[  183.851153] #PF: supervisor write access in kernel mode
[  183.856324] #PF: error_code(0x0002) - not-present page
[  183.861406] PGD 100000067 P4D 100000067 PUD 100ac9067 PMD 0
[  183.867001] Oops: Oops: 0002 [#1] SMP NOPTI
[  183.871143] CPU: 7 UID: 0 PID: 298 Comm: kworker/7:2 Tainted: G S M U 
  W           6.19.0-rc5+xu4373+ #13 PREEMPT(voluntary)
[  183.882305] Tainted: [S]=CPU_OUT_OF_SPEC, [M]=MACHINE_CHECK, 
[U]=USER, [W]=WARN
[  183.889524] Hardware name: Intel Corporation Meteor Lake Client 
Platform/MTL-P DDR5 SODIMM SBS RVP, BIOS 
MTLPFWI1.R00.4122.D21.2408281317 08/28/2024
[  183.902650] Workqueue: xe-destroy-wq __guc_exec_queue_destroy_async [xe]
[  183.909399] RIP: 0010:xe_ggtt_set_pte+0x5b/0x360 [xe]
[  183.914482] Code: c6 ff 0f 00 00 75 5e 49 8b 44 24 10 49 03 44 24 08 
48 39 c3 0f 83 b0 01 00 00 49 8b 84 24 b8 00 00 00 48 c1 eb 0c 48 8d 04 
d8 <4c> 89 38 48 8b 45 d0 65 48 2b 05 1e 41 d1 e2 0f 85 e9 02 00 00 48
[  183.933007] RSP: 0018:ffffc90001ce79c8 EFLAGS: 00010202
[  183.938179] RAX: ffffc9000c80fd98 RBX: 0000000000001fb3 RCX: 
0000000000000000
[  183.945234] RDX: 0000000000000000 RSI: 0000000001fb3000 RDI: 
ffff88812c695628
[  183.952285] RBP: ffffc90001ce7a60 R08: 0000000000000000 R09: 
0000000000000000
[  183.959338] R10: 0000000000000000 R11: 0000000000000000 R12: 
ffff88812c695628
[  183.966388] R13: ffff8881329ea768 R14: ffff8881329ea768 R15: 
0000000000000000
[  183.973438] FS:  0000000000000000(0000) GS:ffff8884ebe60000(0000) 
knlGS:0000000000000000
[  183.981431] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  183.987110] CR2: ffffc9000c80fd98 CR3: 000000010b9c5006 CR4: 
0000000000f72ef0
[  183.994159] PKRU: 55555554
[  183.996847] Call Trace:
[  183.999267]  <TASK>
[  184.001356]  ? vprintk_default+0x1d/0x30
[  184.005244]  ? vprintk+0x18/0x50
[  184.008446]  ? _printk+0x57/0x80
[  184.011648]  xe_ggtt_clear+0x104/0x2a0 [xe]
[  184.015878]  ? mark_held_locks+0x4d/0x90
[  184.019767]  ggtt_node_remove+0xb2/0x140 [xe]
[  184.024164]  xe_ggtt_node_remove+0x40/0xa0 [xe]
[  184.028728]  xe_ggtt_remove_bo+0xa4/0x2e0 [xe]
[  184.033210]  ? _raw_write_unlock+0x22/0x50
[  184.037271]  ? drm_vma_offset_remove+0x65/0x80
[  184.041672]  xe_ttm_bo_destroy+0xae/0x2d0 [xe]
[  184.046150]  ttm_bo_release+0x70/0x330 [ttm]
[  184.050382]  ? vunmap+0x4a/0x70
[  184.053494]  ? vunmap+0x4a/0x70
[  184.056609]  ttm_bo_fini+0x3c/0x70 [ttm]
[  184.060491]  xe_gem_object_free+0x1a/0x30 [xe]
[  184.064966]  drm_gem_object_free+0x1d/0x40
[  184.069018]  xe_bo_put+0x123/0x180 [xe]
[  184.072898]  xe_lrc_destroy+0x47/0x60 [xe]
[  184.077041]  __xe_exec_queue_fini+0x93/0xd0 [xe]
[  184.081693]  xe_exec_queue_fini+0x2b/0x60 [xe]
[  184.086171]  __guc_exec_queue_destroy_async+0x6c/0x170 [xe]
[  184.091769]  process_one_work+0x22e/0x6b0
[  184.095737]  worker_thread+0x1a0/0x370
[  184.099448]  ? __pfx_worker_thread+0x10/0x10
[  184.103676]  kthread+0x11f/0x250
[  184.106877]  ? __pfx_kthread+0x10/0x10
[  184.110586]  ret_from_fork+0x337/0x390
[  184.114301]  ? __pfx_kthread+0x10/0x10
[  184.118011]  ret_from_fork_asm+0x1a/0x30
[  184.121900]  </TASK>

So the root cause of the page fault should be:
1.mmio_fini do pci_iounmap
2.writeq in xe_ggtt_set_pte access valiad address (ffffc9000c80fd98)
3.Since already unmapped in step 1, the page fault tiggered.

The excution order of fini(s) is:
guc_fini_hw (for each guc)
mmio_fini
guc_submit_fini

meanwhile, it is the destroy worker perform the bo release action, that 
causes problem, the worker out of sync with the managed actions.

Regards,
Zhanjun Dong


> 
> Matt
> 
>> Regards,
>> Zhanjun Dong
>>
>>>    	ret = wait_event_timeout(guc->submission_state.fini_wq,
>>>    				 xa_empty(&guc->submission_state.exec_queue_lookup),
>>>    				 HZ * 5);
>>> @@ -2459,16 +2467,10 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>>>    	}
>>>    }
>>> -int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>>> +static int __xe_guc_submit_reset_prepare(struct xe_guc *guc)
>>>    {
>>>    	int ret;
>>> -	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
>>> -		return 0;
>>> -
>>> -	if (!guc->submission_state.initialized)
>>> -		return 0;
>>> -
>>>    	/*
>>>    	 * Using an atomic here rather than submission_state.lock as this
>>>    	 * function can be called while holding the CT lock (engine reset
>>> @@ -2483,6 +2485,17 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>>>    	return ret;
>>>    }
>>> +int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>>> +{
>>> +	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
>>> +		return 0;
>>> +
>>> +	if (!guc->submission_state.initialized)
>>> +		return 0;
>>> +
>>> +	return __xe_guc_submit_reset_prepare(guc);
>>> +}
>>> +
>>>    void xe_guc_submit_reset_wait(struct xe_guc *guc)
>>>    {
>>>    	wait_event(guc->ct.wq, xe_device_wedged(guc_to_xe(guc)) ||
>>

