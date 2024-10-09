Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B33CF042D
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 01:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5011210E0A0;
	Wed,  9 Oct 2024 01:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WEkKoZSd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D6A10E0A0
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 01:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728436429; x=1759972429;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=H9F9voleiZ6PnZObn2eyYp5lpPnOs+zp53MmWSZABtA=;
 b=WEkKoZSdz1h1A0DloqpyhidaifB+F3xFIbUhdHGINsCFHPFEHWxACalz
 pMYI+jsm4pTlbZomWeqMkxWQ8gn8wlgDfcihcPPinKOduKbqI2JK+Dyk3
 Ee5K3AGx4WjVDZUGyc2tLSjEVeAw3680cV9q41whmjgSeBlUj4+0PuN2X
 hJoS3RLH5Y49GcjyI8a3zu/zy+Qc8hVu/SsgnWSC6HYNbMxHOgeUDX7Tm
 1B5LyErNEmCLQx4cCglisQTgHdL8PKwPOcReuHTuXnpSdcUBF2N5PC4Vy
 4TQypQEk+0+lk3SnU6R+KcqfcDT2qBm2tThX0bOAF5xLclBuyqZfhrYP1 Q==;
X-CSE-ConnectionGUID: DiAmp1W7Ts2kYAcgyRhj9Q==
X-CSE-MsgGUID: Z7xlwTe5TjGe3MCDMEMXtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38267933"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="38267933"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 18:13:48 -0700
X-CSE-ConnectionGUID: oxmqSQXbRm2up1DXyWSfcQ==
X-CSE-MsgGUID: KFKN+6BhRB2BAnM4FXAXpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="80869939"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 18:13:48 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 18:13:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 18:13:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 18:13:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 18:13:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 18:13:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDpl7IoREwfJjDE/6cWFtPoS9GAEN9WCkdDzP34wLOY00fa5cHj+Sv6bkr938CNfeWG9QGT5aoffrYO9ulgBIl3qBXK1+3wUJXLI6tRb1mzj1iw/jDoSBL3Pxgi8B9r1QZ3Mx0i5syryIQBUJPgS0jUxr3xRLFa8mmgN3Q2Puk/FHZV1OAS/GHz+kuL3NO54ThWN8XcZtSIQGYiVf6S8FQ/997HcRAMl0+e7/BJixQYgctaDPjdnla0XEKVuXDFercCi2c4ihBS6Y5FHSuS1UzN4BfmaCvfOXHnmbBzDycRK8mpVJJSNywlYiEuJQsA42eiEDOklUewKaK8Kc9v45A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rprGvNyJbU5RpmIsgLi9X7vEShiLLQ2co89UALKfXI8=;
 b=A+qtolniJtKKPrzIr0hXJpE5qd1++YJSjFGIIwJ9/3Om6Sfdv+5Sc+gXVzarD6iNEFp7xOatlLNRHwqdJGde4HrMgSCtgWmUEvQAWdeJW+dqLK8zKyfQGg5RXOjc9ItToyDVzms3rEiMGS1Il87fRHdaH2hPqML9cAZK68qxBW8PGhbruYvMs32mHKPNmI7abptnaYD+4kVVGscTrXYggSK+f1NVmFPDqf1T2cyg2PKM7Gag9GspbF0EnfkryId0DzleUne9PWgW6fgVsJzX2nzKAYYgL3lSw63SJ1KGUpJPZBNbmeU/a1rH3dIEjWV5j9zQS412YCul1+x4VecAkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA1PR11MB6420.namprd11.prod.outlook.com (2603:10b6:208:3a8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 01:13:01 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 01:13:01 +0000
Message-ID: <32b467d1-a668-4ec9-a987-1f92c3c5b23e@intel.com>
Date: Tue, 8 Oct 2024 18:12:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] drm/xe/pxp: add PXP PM support
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-11-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240816190024.2176976-11-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0314.namprd03.prod.outlook.com
 (2603:10b6:303:dd::19) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA1PR11MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c9666ad-3e65-4f1e-7831-08dce7ff84a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bksxMUt6blIwenc5c1dOdHhKSGxwUTFWdUg5VDNFaFZPR0NMWnBUbnVMcTdH?=
 =?utf-8?B?YnE2MzI3T2dSbVhMSHpBVkEwZjVtKzZ3S01rc1k1ZUkzQVVLbUorRG80dE44?=
 =?utf-8?B?Sml4bzFRbVJxcTZMbi9BZmxMblRCeGRzRmFpZ1JDaXpEbTVmV3oxcW5OSG5U?=
 =?utf-8?B?ditoZDZrN2ZNZTFiR3Y0aG5kSzVJY3RXY0lROXdtdzllcm1tdWVRSzBrdUN1?=
 =?utf-8?B?bmRqbitxaGcyYlFrRHF2TjBVOUFxejN0ZG12ZFFvUm1kSWZqeE1SZTY0d3dP?=
 =?utf-8?B?S0Q1NlZJbUExQms3dnFBZHRYWlErbDBIbkNyZkdtM0xhK2NMbnBIUTRZOXVM?=
 =?utf-8?B?OU5VUSswZGJxYk4zTDM5bm5oQXVMNEY4K0RXem9QSC9WZ2tNb3JidzR4R1Ju?=
 =?utf-8?B?V2M2VCt6c1VBc3BFaUNKcUsybnRGV1VabjJybDllQkFNcmgreXQxd3ZJVnBs?=
 =?utf-8?B?K3ViMDBaSFVYL1BHOVVlYVVqS0RZTDlrV1ZSTGFVNFZhZ3ZkOGxQSkErVkpP?=
 =?utf-8?B?YnNLckozeG5JWU1QWVQwYkY1dDZ6WUpkSWF6QzlJMzdUbERac21CTXVLNlh1?=
 =?utf-8?B?dkVTKzFSaFJyZkJKWG1na1dQMlFuZCtYakxmN3ZSWUFOZ0JhMHpjSE9KS2w3?=
 =?utf-8?B?enVSWWgwOWZyWjdoaDZSSlBjbWkrclJsZmIvUzFTTnFKREsyaS9xSjE0ekUw?=
 =?utf-8?B?UHhIbkxmRG44eTJMcjRxQzk3TDFjZHI5c2c5Q2lDS25aZTZhNUhFRFdiNEtH?=
 =?utf-8?B?akFDY0dEeGp5a2tqazdqbXN4N211cnhwLzk3bFRtcVZBYUM1OWEyNHh3UFdD?=
 =?utf-8?B?TDA0Q2FkQjc5WUtuM1QzSXpBbTkvNGFRRGNoZE05S3Z2QVo2aUg1UW1BYlZT?=
 =?utf-8?B?VFNtMUNOR3lLVWd6Ync1bmRyZlBmdGR3SXVPRStOeFk0WnZPMDJyRjBDaVAw?=
 =?utf-8?B?T1V1R3lzckl1d0RjODMyTmViSnJmTWNrdGk3eG5uZXpJL0RvMzNSZ2Y2YXov?=
 =?utf-8?B?My94TExmTWg3WFhKcHpyZ3piK1E1bnB4QTN2K3BNVG0yT1ZjS3lpRkhjNXhC?=
 =?utf-8?B?YXBudGIzYjFDVUswSlByK29IOVlvY1NuZ1VseVJ1Q2lFZzF0NzcvQUwvY240?=
 =?utf-8?B?c0FjSjlOVjdkSTJ1b2Z0Q3NQa1dzSndoSXI1aG1yVlVKdVhYM2VmSVhGNFNU?=
 =?utf-8?B?YkRhMlRaanRHU003T3BrN1poL0pJd2NYNGxYTXdER2JETDBrRlIyb0lQVDhI?=
 =?utf-8?B?MUJoaG5qRFNvQ0JtbHNGR3l6S21iR25BNlVoUlNDSEVQL2hsdjd4d3hPU1B6?=
 =?utf-8?B?SFlRVUFVUnVWbXJiRWNnQ2Y1d3QzdXN3Ti9zTGV2c1FITVV1THVJSTQyY0Fy?=
 =?utf-8?B?dEZzT3ZLczlNK2VUcHpxMHlSbXNXSnFndko2Y2kyYnh6V292cmpWV0dpUjVH?=
 =?utf-8?B?end2R2VYZERlNHJQL3JSK1M2QWpjb3llWGlEWHV3MU50QkRBN2JodUQ1NURS?=
 =?utf-8?B?NkkzQjVMZmFPTUhZSnExZ21yd2VNR1Fqam5VNUplNWRKZ2dRM1ZEdHlQOUhY?=
 =?utf-8?B?K1JXWUxzeEpjYXplYTZqTitjM1lUVHY5b1B1My8ybHhmRDhNTE5tZXF5V2Qx?=
 =?utf-8?B?d0pSd0hJMW8rUjlQdkZvSm5VMys1djZDL05VNy9iRldadTJSUWtJZC8rWXND?=
 =?utf-8?B?RElldnl0YktUK2hUWXMrYmQrSzdzVXNMaWErV0ZjV1E2bzJ4ZnFOMU93PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHBtTTBOQmpvNnVrd0lOM1ZsTEI0a0hSb2VPUWVkanducDNGQ1hwYUZvMERY?=
 =?utf-8?B?MEVyc0dHY1RpajFoYTNrdGcyTlZXUk1ZU1dzb0RtZWNYcElaRWdORWZvRXp0?=
 =?utf-8?B?QVhmcmxWSkNiL1BmVkxHT0VJTUZZOERjOThqVHd5OW5oQ010RFZpYmxUaWhN?=
 =?utf-8?B?cC9FSkJNdWszMDFVMGQ2QkJreHA4djF3ZDY0aTQrMUhBTmxHRVhuajhqYkJZ?=
 =?utf-8?B?UmNkSkQ3czZTa3FwYkRacHFXK1ZyRUR3cTVDOEwvNkwzelN3UStxZHdWekgy?=
 =?utf-8?B?czlyS2s4bEkrdkUrMFU4OU9zamdkK3hpb0d2TVpYa01XcXNicTRKV2lWd1dV?=
 =?utf-8?B?MzVuMlJWcy9ZK0IzL29hcE1oQTJlYzNPYlZLcWFaSHVkb0V5QkkzSFlRckFq?=
 =?utf-8?B?dThZU0pJekxiWTY4ZHQ4Z2pobVh5R0hkeGUvZnJBVU5rSWRHa0pOOEMvVE83?=
 =?utf-8?B?OXpsdTROVldJTSs1a2libU8vakE2Qkk0K0VIMW1ZL3pyQTJUOFMwZWxQeWNw?=
 =?utf-8?B?cW1nK3F3bUJkM3R3V0YycFpYY3BkekxVNVViNHlzS0IvbXlzMnFRNTBnbWVN?=
 =?utf-8?B?UmVDczFtSUJpc0UyWG02MTdpc3YrQlBZdFBFcUJ1VmF5UkZFREx6emJrVWlZ?=
 =?utf-8?B?MzhEWFpmeUFHcU9zUUh6NC94VGVZQnRyeVhLQXFnYmpxMTg4TVBXdTUxR2RK?=
 =?utf-8?B?UFZQL0NLZUUzZXNlQzQ5cEtIYTk1dk5lT1psam9MTXBCSG1TYlN3WFlIUHZM?=
 =?utf-8?B?Njk4NkF0MHkxWW9IVEVZUmkxQUErcE12ajZobXhTeFNsdSs3RTBSa3NkSjFs?=
 =?utf-8?B?ZERUeTBZUVlqUTBCV1ZtQldyay94bGw0cnhDRkdDaE9DK2Nld29rWCtvcUtG?=
 =?utf-8?B?UHE0NkFuc0xaeG8zbWdPWDRDK0hSMVpQMlFXU2tPZE5mbUl1SSsrR3pkU0x2?=
 =?utf-8?B?QzAxYjRSeVVqN0xTM2xXQkhPN2N0dmhqS1ZrbnJsM3Z1NTlYTWk3V2hjTXNv?=
 =?utf-8?B?SzZQVDBoekE4SmlBaGk4RTJwWkNHbHl4bDFOM05nUlEzalFIMmpBVEJOOGNs?=
 =?utf-8?B?Rjdnb3BmVStsZFZCaGt3VUQxNzN1ZG90S2QwdEY2ZVByRXAwNW5iTmNBcTVV?=
 =?utf-8?B?NFczeDVQY3crdW9XVGJCNWlnaWR2SnRhYXFlNlN5Vytrc2toYzM2Y09wVjNk?=
 =?utf-8?B?MHpzNjlWb1FuRG0rYnF0ejBodjB1MHVGaHJuVHVRK0s4TlowRGZoODRnL0Zt?=
 =?utf-8?B?Zlo2SEc2RnFkaGdKTHp0ZHRtb3p5SjFpZnBySzdMUVdVdWxzbk5MTUxFejdN?=
 =?utf-8?B?VGhsYTJid1VEK21zMVJEZlJtdklWc1E3cS9XbkU3M1RIeHIzd29Pbzl2OFk2?=
 =?utf-8?B?b0tHdENTaFd0VWJVNWlvSmt5RCszSmd2bnpQSkxNa09RNm91TjNvY1N0Mi9h?=
 =?utf-8?B?NHN6cHpjalRGWWZOTElvTnl4U1BobzRCQ1UySVZXYXN0UU5raTJBOTQ1MUJp?=
 =?utf-8?B?RUJpNWhQUjZXOS9oVUxiZEExeXk5K3Nmdnd1M21HREtXWHhiYys2MUpyd1R3?=
 =?utf-8?B?bGNsSlI1RXpjNU1DQmxucWNHK0c4QnYyalRzUVcveEs1VXdpNTBULzhpV2U4?=
 =?utf-8?B?d0FFWStUc05GWFJNb0daZkVEcWVVUWVkZTg5MTU4SldsNUM2aGNZYVVxSmQy?=
 =?utf-8?B?K0dZZzNBYUxPU1pYVS9EM1RXd2VKcTFjVURsYTVqNVBGV2w2RTNUSnhsRjhr?=
 =?utf-8?B?VzJZYWY5cmhjMExJVDFHN0tRa0gyOUVZN1B4ZWlMaVp5WTZDUGM2Qzh3aGN5?=
 =?utf-8?B?NWNjVDE1T0xod3RmTnU3ancwM2drTy9IVnZnZmUveXpSWTRPV0hrZm55VW5J?=
 =?utf-8?B?cURGMWxjU0NFTDlIdU5RQ1FXQkJRQXRvSW40czUzblpGc2t4M3BsekZOUmhD?=
 =?utf-8?B?a1NvclM3dU9PdkhFbVEwTjZmMmdrWGQrSU54WkxzRksxMmkxMnFxcG51dzQw?=
 =?utf-8?B?THNWTXNSWFgvVWlvUlI4TU1Bd0hOeVNtNnBaaWlJZkZ6QVVzdjhidFdldGJE?=
 =?utf-8?B?NGNSK3pRNmduVWRBaWFNOGVNdDJuMlRFTENJSTd5blFhTmNVZkpIWWxwbndY?=
 =?utf-8?B?NkF2OHJMTGtoUjhJdnJaUDNZNXZSN2xSYXpmbHZBRnhSTWttU2pCWXRFMGpO?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9666ad-3e65-4f1e-7831-08dce7ff84a2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 01:13:00.9138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34bYkzkJldi0Mv4fo69zhpFtYipz7K/ZCRRij1Ak2ZHt0xVXr/FP0zDuqYi8AIEE6NjdqQbWTc8yVb+EjHKD8FPD90T+v2PU8RamfHStyYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6420
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

On 8/16/2024 12:00, Daniele Ceraolo Spurio wrote:
> The HW suspend flow kills all PXP HWDRM sessions, so if there was any
> PXP activity before the suspend we need to trigger a full termination on
> suspend.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c        | 42 +++++++++++---
>   drivers/gpu/drm/xe/xe_pxp.c       | 92 ++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_pxp.h       |  3 +
>   drivers/gpu/drm/xe/xe_pxp_types.h |  9 ++-
>   4 files changed, 134 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 9f3c14fd9f33..1e1f87ec03a2 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -20,6 +20,7 @@
>   #include "xe_guc.h"
>   #include "xe_irq.h"
>   #include "xe_pcode.h"
> +#include "xe_pxp.h"
>   #include "xe_trace.h"
>   #include "xe_wa.h"
>   
> @@ -90,22 +91,24 @@ int xe_pm_suspend(struct xe_device *xe)
>   	drm_dbg(&xe->drm, "Suspending device\n");
>   	trace_xe_pm_suspend(xe, __builtin_return_address(0));
>   
> +	err = xe_pxp_pm_suspend(xe->pxp);
> +	if (err)
> +		goto err;
> +
>   	for_each_gt(gt, xe, id)
>   		xe_gt_suspend_prepare(gt);
>   
>   	/* FIXME: Super racey... */
>   	err = xe_bo_evict_all(xe);
>   	if (err)
> -		goto err;
> +		goto err_pxp;
>   
>   	xe_display_pm_suspend(xe, false);
>   
>   	for_each_gt(gt, xe, id) {
>   		err = xe_gt_suspend(gt);
> -		if (err) {
> -			xe_display_pm_resume(xe, false);
> -			goto err;
> -		}
> +		if (err)
> +			goto err_display;
>   	}
>   
>   	xe_irq_suspend(xe);
> @@ -114,6 +117,11 @@ int xe_pm_suspend(struct xe_device *xe)
>   
>   	drm_dbg(&xe->drm, "Device suspended\n");
>   	return 0;
> +
> +err_display:
> +	xe_display_pm_resume(xe, false);
> +err_pxp:
> +	xe_pxp_pm_resume(xe->pxp);
>   err:
>   	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
>   	return err;
> @@ -163,6 +171,8 @@ int xe_pm_resume(struct xe_device *xe)
>   	if (err)
>   		goto err;
>   
> +	xe_pxp_pm_resume(xe->pxp);
> +
>   	drm_dbg(&xe->drm, "Device resumed\n");
>   	return 0;
>   err:
> @@ -356,6 +366,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	 */
>   	lock_map_acquire(&xe_pm_runtime_lockdep_map);
>   
> +	err = xe_pxp_pm_suspend(xe->pxp);
> +	if (err)
> +		goto out;
> +
>   	/*
>   	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
>   	 * also checks and delets bo entry from user fault list.
> @@ -369,23 +383,30 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	if (xe->d3cold.allowed) {
>   		err = xe_bo_evict_all(xe);
>   		if (err)
> -			goto out;
> +			goto out_pxp;
>   		xe_display_pm_suspend(xe, true);
>   	}
>   
>   	for_each_gt(gt, xe, id) {
>   		err = xe_gt_suspend(gt);
>   		if (err)
> -			goto out;
> +			goto out_display;
>   	}
>   
>   	xe_irq_suspend(xe);
>   
>   	if (xe->d3cold.allowed)
>   		xe_display_pm_suspend_late(xe);
> +
> +	lock_map_release(&xe_pm_runtime_lockdep_map);
> +	xe_pm_write_callback_task(xe, NULL);
> +	return 0;
> +
> +out_display:
> +	xe_display_pm_resume(xe, true);
> +out_pxp:
> +	xe_pxp_pm_resume(xe->pxp);
>   out:
> -	if (err)
> -		xe_display_pm_resume(xe, true);
>   	lock_map_release(&xe_pm_runtime_lockdep_map);
>   	xe_pm_write_callback_task(xe, NULL);
>   	return err;
> @@ -436,6 +457,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   		if (err)
>   			goto out;
>   	}
> +
> +	xe_pxp_pm_resume(xe->pxp);
> +
>   out:
>   	lock_map_release(&xe_pm_runtime_lockdep_map);
>   	xe_pm_write_callback_task(xe, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index 640e62d1d5d7..78373cbbe0d4 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -137,6 +137,13 @@ static void pxp_terminate(struct xe_pxp *pxp)
>   	if (pxp->status == XE_PXP_ACTIVE)
>   		pxp->key_instance++;
>   
> +	/*
> +	 * we'll mark the status as needing termination on resume, so no need to
> +	 * emit a termination now.
> +	 */
> +	if (pxp->status == XE_PXP_SUSPENDED)
> +		return;
> +
>   	/*
>   	 * If we have a termination already in progress, we need to wait for
>   	 * it to complete before queueing another one. We update the state
> @@ -181,17 +188,19 @@ static void pxp_terminate(struct xe_pxp *pxp)
>   static void pxp_terminate_complete(struct xe_pxp *pxp)
>   {
>   	/*
> -	 * We expect PXP to be in one of 2 states when we get here:
> +	 * We expect PXP to be in one of 3 states when we get here:
>   	 * - XE_PXP_TERMINATION_IN_PROGRESS: a single termination event was
>   	 * requested and it is now completing, so we're ready to start.
>   	 * - XE_PXP_NEEDS_TERMINATION: a second termination was requested while
>   	 * the first one was still being processed; we don't update the state
>   	 * in this case so the pxp_start code will automatically issue that
>   	 * second termination.
> +	 * - XE_PXP_SUSPENDED: PXP is now suspended, so we defer everything to
> +	 * when we come back on resume.
>   	 */
>   	if (pxp->status == XE_PXP_TERMINATION_IN_PROGRESS)
>   		pxp->status = XE_PXP_READY_TO_START;
> -	else if (pxp->status != XE_PXP_NEEDS_TERMINATION)
> +	else if (pxp->status != XE_PXP_NEEDS_TERMINATION && pxp->status != XE_PXP_SUSPENDED)
>   		drm_err(&pxp->xe->drm,
>   			"PXP termination complete while status was %u\n",
>   			pxp->status);
> @@ -505,6 +514,7 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   		pxp_terminate(pxp);
>   		mutex_unlock(&pxp->mutex);
>   		goto wait_for_termination;
> +	case XE_PXP_SUSPENDED:
>   	default:
>   		drm_err(&pxp->xe->drm, "unexpected state during PXP start: %u", pxp->status);
>   		ret = -EIO;
> @@ -648,3 +658,81 @@ int xe_pxp_key_check(struct xe_pxp *pxp, struct xe_bo *bo)
>   	return 0;
>   }
>   
> +int xe_pxp_pm_suspend(struct xe_pxp *pxp)
> +{
> +	int ret = 0;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return 0;
> +
> +	mutex_lock(&pxp->mutex);
> +
> +	/* if the termination is already in progress, no need to re-emit it */
> +	if (!completion_done(&pxp->termination))
> +		goto mark_suspended;
> +
> +	switch (pxp->status) {
> +	case XE_PXP_ERROR:
> +	case XE_PXP_READY_TO_START:
> +	case XE_PXP_SUSPENDED:
> +		/* nothing to cleanup */
> +		break;
> +	case XE_PXP_NEEDS_TERMINATION:
> +		/* If PXP was never used we can skip the cleanup */
> +		if (pxp->key_instance == pxp->last_suspend_key_instance)
Again, there is the possibility of this being confused by key_instance 
roll over.

> +			break;
> +		fallthrough;
> +	case XE_PXP_ACTIVE:
> +		pxp_terminate(pxp);
> +		break;
> +	default:
> +		drm_err(&pxp->xe->drm, "unexpected state during PXP suspend: %u",
> +			pxp->status);
> +		ret = -EIO;
> +		goto out;
> +	}
> +
> +mark_suspended:
> +	/*
> +	 * We set this even if we were in error state, hoping the suspend clears
> +	 * the error. Worse case we fail again and go in error state again.
> +	 */
> +	pxp->status = XE_PXP_SUSPENDED;
> +
> +	mutex_unlock(&pxp->mutex);
> +
> +	/*
> +	 * if there is a termination in progress, wait for it.
> +	 * We need to wait outside the lock because the completion is done from
> +	 * within the lock
> +	 */
> +	if (!wait_for_completion_timeout(&pxp->termination,
> +					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
> +		ret = -ETIMEDOUT;
> +
> +	pxp->last_suspend_key_instance = pxp->key_instance;
> +
> +out:
> +	return ret;
> +}
> +
> +void xe_pxp_pm_resume(struct xe_pxp *pxp)
> +{
> +	int err;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return;
> +
> +	err = kcr_pxp_enable(pxp);
> +
> +	mutex_lock(&pxp->mutex);
> +
> +	xe_assert(pxp->xe, pxp->status == XE_PXP_SUSPENDED);
> +
> +	if (err)
> +		pxp->status = XE_PXP_ERROR;
> +	else
> +		pxp->status = XE_PXP_NEEDS_TERMINATION;
> +
> +	mutex_unlock(&pxp->mutex);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
> index 2d22a6e6ab27..af32c2616641 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.h
> +++ b/drivers/gpu/drm/xe/xe_pxp.h
> @@ -20,6 +20,9 @@ int xe_pxp_get_readiness_status(struct xe_pxp *pxp);
>   int xe_pxp_init(struct xe_device *xe);
>   void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>   
> +int xe_pxp_pm_suspend(struct xe_pxp *pxp);
> +void xe_pxp_pm_resume(struct xe_pxp *pxp);
> +
>   int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type);
>   int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q);
>   void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
> index 1bb747837f86..942f2fa40a58 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
> @@ -24,7 +24,8 @@ enum xe_pxp_status {
>   	XE_PXP_NEEDS_TERMINATION = 0, /* starting status */
>   	XE_PXP_TERMINATION_IN_PROGRESS,
>   	XE_PXP_READY_TO_START,
> -	XE_PXP_ACTIVE
> +	XE_PXP_ACTIVE,
You can add a trailing comma even on the last enum value to avoid such 
unnecessary deltas.

John.

> +	XE_PXP_SUSPENDED
>   };
>   
>   /**
> @@ -111,6 +112,12 @@ struct xe_pxp {
>   
>   	/** @key_instance: keep track of the current iteration of the PXP key */
>   	u32 key_instance;
> +	/**
> +	 * @last_suspend_key_instance: value of key_instance at the last
> +	 * suspend. Used to check if any PXP session has been created between
> +	 * suspend cycles.
> +	 */
> +	u32 last_suspend_key_instance;
>   };
>   
>   #endif /* __XE_PXP_TYPES_H__ */

