Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229DFCD6E55
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 13:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B2F10E057;
	Thu, 13 Nov 2025 13:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y32YzkBJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BF310E057
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 13:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763040713; x=1794576713;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=La10Su+02Z0c6dEmDjg677PkdcRW3XcPbY7CWi/Vt5Y=;
 b=Y32YzkBJheDGLUc4gdybqNT152lMjcdrzPwJCzUy84H7NA8LlusM+sP+
 SJSiQxkTtwmeJz1Vb+odrT29SfzXAPWa+7hN0bJFE5Nca7b0qRZGvuujM
 /RsmYqPoBpgFiperOZLra789Gb/K0PijIxctrF+fyaBb0VgY48f7eJe1p
 cFqWHsLhJvq8tMtMdpcn2B4vUvXmZEilDRl0X9EFd6QuPhHda3nXyDMug
 OcafodNzXlJdP4owXJsyQuLRIN8wyrcx7KsyZ5nFURFBr51DUF8fQxcp2
 8qGaiRk0aZ8dP0Y4f9NGuIfCusX98sBuwn86F5By84M4G9ZGxgDdQnk8Z Q==;
X-CSE-ConnectionGUID: Xv9La+AvQ7y16N7Jrc+4cA==
X-CSE-MsgGUID: r8HhYiolSJONtFj4vz/+MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75729581"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="75729581"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 05:31:53 -0800
X-CSE-ConnectionGUID: P0J7PPYpT7+8vnU/EnmEcg==
X-CSE-MsgGUID: 3asO9TuDQwapKBFVCTQzvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="193748955"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 05:31:51 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 05:31:52 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 05:31:52 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 05:31:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNPqkJ65tGfoAYM6wW2zlUStcqxNxajmiHeCfCTPeXmv8iJxPW8jWgbgfABBf0aV+neqTnOqB1S7sm2FnfQK34LQxIN9gtUhDSTjv6HFv4kHQGlWn1wbYUBrhZ7BsYKKVOpOjnhTs6BfYo1HTR2y9ZLkpnDAwhkt4pGZM91RZm0cd2SNaby+UaPe570J9yfTzP3HEFLRtZ32jXpCYWFj5OFC56wRnhE1Co+nxxxk8qDSJPdVw7DC6A+1Hb7RVQaH7fa4s8wgXmdz/I2V9kgIzOzh5eVe6k6bJx1p7ZeUWf6yb/fx5nA6nz0r9xmrjxnmIJYlz0Fp8mRgzndIP4pblw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9aB8n7W7T4xRG/AMsImaZ7s3Fy8UeGQgD6KdK6k4H4=;
 b=pywsLxywB+HC7VKs7ErMcp/lIsIoj6DW4iRffw4nJwUJ4Ep2BB0LcH8lN9BxsSrHU3ypEhj2UGUnxRCa0JHN/mduprazsD3vVLA+WNNPfd63s1Dy7idgcFpswBIxEJbC6fcmfUjjeH32g+H7OsKtE7259gl0rvT6k0TtdXm2qIt3AQd17db2hCmVsqCZYo5a6afuaNR1IvW29ZsEncRBGd/SGIBdRIp98gv9rlcTEDZsd52afrhQ6sQlxul+zZVchkpa7jU9kpyM7roxJzN3af67LHfqu3Hwbr/QE063Itv6In55j85rcdt0haGurT4NCtQobxewMV9bY8nelEvS4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB7963.namprd11.prod.outlook.com (2603:10b6:510:246::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 13:31:48 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 13:31:48 +0000
Message-ID: <b616e567-72c0-4b36-81d5-3d4af6c7694e@intel.com>
Date: Thu, 13 Nov 2025 14:31:45 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvcGY6?=
 =?UTF-8?Q?_Use_migration-friendly_GGTT_auto-provisioning?=
To: <intel-xe@lists.freedesktop.org>
References: <20251112124408.8094-1-michal.wajdeczko@intel.com>
 <176296541879.45673.886864167328954776@10055242dc62>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <176296541879.45673.886864167328954776@10055242dc62>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: d6b0607d-96d4-44c7-7b4e-08de22b8ff49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0dITDZRNEtmekluUEMrSE4xeDR6U1lXamZTaUlza2JRK3JJRDAzMTZSSWhj?=
 =?utf-8?B?eURzejNHanRENGcxTjNkOGNFTXBHVFB1N1AzNDlzaFZNa2JEUnRZVjhNL01S?=
 =?utf-8?B?eGJKa04wT1RtczgzbVJheTRZczJsYTUwSWZYV05hZXlxQmhPKzdBVk9oSXlO?=
 =?utf-8?B?NDJGa3NPWmcva3I5aHlqaDlDNkJQN1lOMmhkOVBpdk0wd25sd1ZmK3A3WGVY?=
 =?utf-8?B?U3JCZzZPSDRxSW4zaUs4V1A2TkxkQ2RGcDVEbnhkcG1JVDFVdkdqd204ZGV5?=
 =?utf-8?B?QnlwSWJYWVBxOWNndHE0bWtDdk9MSHlzU2craEtwYkR5WklDMWZzQU5ZVjRh?=
 =?utf-8?B?TlRxSUVjcmdhMUY4bE1Id3RWY1ZuTmZNZ2xZYk9wWHF4ZXNnUXBDUnJFUFRV?=
 =?utf-8?B?eWVCcXhsTUxDd21QeHNKd2FsL25NWC9BSVBvSkMzZ2YwMmV2ZXJBYUtHMVd0?=
 =?utf-8?B?THJjNldLaURmclZ6UzkxLzVtVFQ1OWsybjREU3Vad3lJUVRTUHBlOHROSDlU?=
 =?utf-8?B?Y0ttMWVvQmgzSTNGM1RodkQyYUw5b0diaURzUUhySmZzOTlQL0c1L1cwemxa?=
 =?utf-8?B?NkRueXRqd3JIeGszU2dxL3h3V0JUV3NwZkwydC9yakZabS9lYkwvNEplMmZI?=
 =?utf-8?B?SDJYZk5xMXRvbXc3eUh1S0VibSs1RHNrTGR0Mk5aUTdmK1VrZEdhYzA4KzlU?=
 =?utf-8?B?L3dxa2dKZ0k5dTF0bTBnNEhVc3dZVmVYOGxvRVgwdFFObWlXM0s3cC9qYVlS?=
 =?utf-8?B?dnVYKzBpQ25EekZrYm5RdnZ0M2xjenhPQWlQbTdjOWdjZ012K2VsWUZDUHFF?=
 =?utf-8?B?MWdMaHdFTk16bnZYVWV1YkJuZDZNUjVzdTk1KzlzdWZvaWNzYzduWC9ha01i?=
 =?utf-8?B?MllMV3RFMEMva3Q0ckE0emRhOVR5YWw2a01rcDBVY3c1WFJmSmE1VzhyQ0lr?=
 =?utf-8?B?NHlZemNyVGtNYjY2NnU0UVZ2MVNmOCt3SEZ4clFaOGQ3enRCZVU4cnN4ZTJk?=
 =?utf-8?B?S1JuT3ZaQXo3S3k3THhiZUhoZUdQb1k4NzEvMFRLb0Q5aUhGM1UrS05KVVV3?=
 =?utf-8?B?bjlwakIvb2ZLVlkvMDFzVjg3VnhIM3dUbEZSMEFFdkIzSXJvUUhObmJTTmEy?=
 =?utf-8?B?NHNGRmx3WUhaTnpaT1dnTHQ1VWNDZmJIbitPNEZTeWxjbHk0ZVNsbUpUSzhS?=
 =?utf-8?B?TGhrdEJ1NVZxVE1vU0ZXbnY0eTRiL2NJZTVBUTJFS0k4Y3BCZ0ZqUXd4NGNO?=
 =?utf-8?B?QUdEWUJQS2JyT0kwUTlGNXBodldhTlMxVXZib2QxRXhhTzRIQjJzcXZQQW1T?=
 =?utf-8?B?NWc3b1Ivb1BBNTh5UUVsSlRXeGFnSUZCTzFSdWVaMlRuK2xueDlnRm5VUTVX?=
 =?utf-8?B?VjE2ZDBxWURlRWJGM3A0Q1JnMDBxQVVjenhLN2xEVGNSdTd1eHFZSk4zRnRv?=
 =?utf-8?B?WVR0TjdSU0J6cWtGeFMrYmtJN0JGM244QlU2Q1hRaGZOVENFTTFvSG10VDVt?=
 =?utf-8?B?NjlCdE9vbTNhNE0rRlduOGNRbmhFQzFqd3RmaUpFQk85cmY5ZG1pTXVBb2RF?=
 =?utf-8?B?ZTBYTmp5QzlHVmFhQWgvUUFlREtVbmRrTUhaVFR3QjErUkZzSU5YdzBwd2ZL?=
 =?utf-8?B?cEwzc3J3cUNtRDA4OU1RK1RlR3JFeUdxNHZxeGZZNDhtZVVwVWhJN21FTWpX?=
 =?utf-8?B?bmdlSWhnYUZma2ZWd0ZMaGdtR3BFS0RmVEk0ZEg5QmhFRmo5ZG50eE5rQmZ3?=
 =?utf-8?B?OHJRZ2JHT3JheEZoeG5hd3R6WVU3elVWLzRqeXNDMmNqUTFDYzk4Z1d1S1gw?=
 =?utf-8?B?bjRXVENWOGdNRndyRHp0KzAvZWRVV1BjTHJkZGlwTGtCYkhtQzVxWm10bE0x?=
 =?utf-8?B?K3VHT2JSUTBBWExTZEt4ZXI2QnlnbGZHTGxVaVNZVEtTU1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dCtDT1ZQd0ZqUjZXaE5XMG1QYUFhNmlKTG82QmhFMW1wN0FoV29zQ3p2L292?=
 =?utf-8?B?SkJUTjB5andZZ2pYcE12UTJ4VUE1R21GTmFhMFZFL3MyN2ZmTmY2L05wbkNJ?=
 =?utf-8?B?QXh4a0NoTzNrSWVwekRMaVZKZHhlbjJxeVFvYXBSdGhSWTJraTNUQnR0dHl1?=
 =?utf-8?B?cmVBaVF1b3BLWm5iTlNzQXdoWTNSSWQ2STI5MUYvVkRNSVZVbEJ0cEQ2VG5a?=
 =?utf-8?B?MTBCLzVEYnV6bEdLZzFLYm5XVW14NFhJYmxwNVBJeXZ2WlpWK1VlY0xtS2k0?=
 =?utf-8?B?ZENVSkdaVWNkVVZkMXNsa3cxNGh2WmdQdFR1TklOZ3pBc3p5R09YWnE3emlS?=
 =?utf-8?B?OWFrRjJiK21iRWdMWUttR3F4QUtBangyUG94QVZPZ3N1QjVtUHhVanZWM3Zx?=
 =?utf-8?B?bDlRRWY1LzA0eVBZemdFdlZmMUE5L2xqVkFGcmo0TVYrVWtUUUpDUklqQnZ6?=
 =?utf-8?B?REdkTDREaWlyRUFZUE8zUVJ5TGcvTHJHQzM3YUhHaVMvQTFFQmVXVGJBc2R6?=
 =?utf-8?B?VHlYUXVZQzBiL01pR0hrUTJnb3V2b29DazlJQkdDOGk2azdLNGdEUE5lR0tw?=
 =?utf-8?B?NGRHZUJiem82MjhGTTNvbDVBK3FkeVJRRkFTdjNVK0FuenpTa3pIM05xcEh6?=
 =?utf-8?B?UGRkQW9sb2YyVFRMZFpJNXhiUGpiR0hmanZUbDUvVkQ3S0J6Z0VEVStaM2My?=
 =?utf-8?B?eWtxVkdUb3p3ckowa1AvNkpkdXBHSkJ1SzlmSlFrMndsOE1HbGo1WlFnMkd1?=
 =?utf-8?B?L292M2pFVndvZ3hUZzBlRzljMm9Ra1k4VmZUWnprRHY4dmM1WE5ZNWJ4czRo?=
 =?utf-8?B?VE9DMzhqSlh3TCtzS253MVFSS2YzdEs5bmRpbXJvV0ovT1d4Mlo4ajhvQ3c1?=
 =?utf-8?B?c3EzYjl0SDNZUzUwR1czM0ZUeFRjTzBPbmdTVDcxQkFrVkJGaWRlNW85Z2V6?=
 =?utf-8?B?R2xaaW5sOTZEc1JkdHkxVDNmSnlRNjlYUHNyS2FPR2cwcG91UUkvQTBvZjBD?=
 =?utf-8?B?ZWRvS0tlZHpjSDJIaGQzTWFQdjZLRloyMmZCNlV6WnRoRmVMbzlrbXhncE82?=
 =?utf-8?B?TlpvY3pScmRicTVUY3p4c0lyRzlVOEV1WHJaVHU0TEdtRE9ONHQ2amkzRHJw?=
 =?utf-8?B?QSs2REtJV1YxVUQyVVQzeHFrM0U3NDZHQ3E5NEdEUVNnbGFBd1lzd1ZIb09s?=
 =?utf-8?B?Q3ZoWmp2L3lxZS8rODRXMER2NTg4Z2U2TE1kaG92TXFhZ01KWGxXcTAwRzdk?=
 =?utf-8?B?WW1nME45NWorVmwxbVJTUzFaaDhPQ3dJaDNDU2FDR3FJczZieGYyTXBNSld6?=
 =?utf-8?B?NEMxZ1RJVU1qRzdqUThKdHQvU0VETVJzb2J2OW16OE9rK2lNVGhXZ0tYMGNP?=
 =?utf-8?B?bEFRTTZIcmx1QkVlbU1rUnlZVWM0eWxIRWREWHZ2Yllab2VMQWxxWTU3ZmhE?=
 =?utf-8?B?TmpsRVVkT0pQRzBSOUJZdW5ycjNUOWVoTi9VRU5sc3M2Q05yL3hUN2RCQ2xx?=
 =?utf-8?B?dGIwUTF2cWszSlVkVXpDZTNjc1kvSkdmTzVxWGtjNUJoa0I1dXF3d0M2aGg3?=
 =?utf-8?B?cE9wY09tbXlLT0Irc1AzQkVmY2Z0VkcyeGowbm1hQlcrVW5rV2VxUXZtdmEv?=
 =?utf-8?B?NzhQT2lqLzY5a1Zxeno0MUJCc1Jxb1hCckRNSkF6QW1VakF6cGkxOWZPZ1Bx?=
 =?utf-8?B?dmFzTDI5UEErdFpndVZYeTBTS0d6UUppOVVBdkRoZnErYVV3YmlYVTdNVjM3?=
 =?utf-8?B?MENROTR6bUgrNkg1MnRMQjhHZGRsMSs1cEpmcER0d3NIbkYvOFJJbVdaMEpN?=
 =?utf-8?B?SlBqNU5DeE1jMHVxcmNBQWpZWFl0T1pkeGFqK29nN3VLaHRTQUpzbU54MVdv?=
 =?utf-8?B?VnhZMC9xWmtrUmdOSVdMRjJmKzFIRnJ1YmRFT2hZZjI5TlJhRDMzTU9PaCtE?=
 =?utf-8?B?c293WVJkanBNc0x6SFVENzVaNHlEMFVVbmZyMXRjME1WRXZpUTA2Y2w2WFNr?=
 =?utf-8?B?cWdjVzRVampHM0hsNmRZRDZUVyswa2tJQ3lNaHQ5VmRHUWIzd2luNy9uMERS?=
 =?utf-8?B?aUltMDdqSGFJQnVSc2p5b2pWQ09RZGVPMy80VHozbytMd3FDa00zTDJlZGln?=
 =?utf-8?B?NVdFaVI3TTBQZDgvNmczb3hnaWNiQXFYL3kzbnNRUXpyUSt1RjhGbGVjR2Vv?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b0607d-96d4-44c7-7b4e-08de22b8ff49
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 13:31:48.7572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Utcii9yMrR9qLYcFXpX1DSwiDHVNDIXqCjiCbfdhjFMU0GxuC46fDduWWbQh4C0+pQOyGy1eFW3Rlec/oeZINBNRAZhFnBXVQfbrRonkaFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7963
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



On 11/12/2025 5:36 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/pf: Use migration-friendly GGTT auto-provisioning
> *URL:*	https://patchwork.freedesktop.org/series/157434/ <https://patchwork.freedesktop.org/series/157434/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157434v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157434v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-4090-0961bffa4c3b59fb4c844f2e5687d876a78938c2_FULL -> xe-pw-157434v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-157434v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-157434v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-157434v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_cursor_legacy@forked-bo@pipe-d:
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4090-0961bffa4c3b59fb4c844f2e5687d876a78938c2/shard-dg2-433/igt@kms_cursor_legacy@forked-bo@pipe-d.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157434v1/shard-dg2-434/igt@kms_cursor_legacy@forked-bo@pipe-d.html> +1 other test incomplete

must be unrelated, change was strictly for the PF code, not KMS

> 
> 
>         Warnings
> 
>   * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0:
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4090-0961bffa4c3b59fb4c844f2e5687d876a78938c2/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html> (Intel XE#6251 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157434v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html>

unrelated, non-SRIOV platform
	
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0
(xe_pmu:2246) CRITICAL: Test assertion failure function accuracy, file ../tests/intel/xe_pmu.c:625:
(xe_pmu:2246) CRITICAL: Failed assertion: (double)(100.0 * engine_activity) <= ((double)(100.0 * expected) + (3)) && (double)(100.0 * engine_activity) >= ((double)(100.0 * expected) - (3))
(xe_pmu:2246) CRITICAL: 45.947814 not within +3.000000/-3.000000 of 49.203787! ('100.0 * engine_activity' vs '100.0 * expected')


