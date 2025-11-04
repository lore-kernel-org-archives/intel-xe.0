Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11DFCCFA04
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 14:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724A610E620;
	Tue,  4 Nov 2025 14:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ecqKRRQl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9429410E627
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 14:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762267686; x=1793803686;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fl3FkvSWErsriwUydAfxuNEgPCOa1A2MjgYiElZ/d7g=;
 b=ecqKRRQlcVLnUxxkoynmC4OzKjOfsEvLGT45UWymfXEodL4pirmDNe28
 00B3Lsir87lW+MN0SDLnosL3MrjCzcz/tAIMvuolrmSi5Ls6JcG9N2V/U
 tGwL0xB55RNty9gvLLxLFAfvPa2cIWrQtsxs/F9P6lYfVQ9tfVf5jm45E
 EQfTXdoDGWzBpunA34Oc0KSOBOlR6WjNmXHNtBK/IdMGAxNlN/O4b3uVR
 oE8Tx4xCNGuhgVtKO5bZ0c3OK1oEvvTuvJx6g5GyRajaNIcoOh2zX9dz/
 Ol97GLSs8Aok6rNnov7yMtH8JxtjpCn/iVwmv9Kvzwp7nZRSNN83gNaNb A==;
X-CSE-ConnectionGUID: pjl49b4rSHaXQUsu8XJaYQ==
X-CSE-MsgGUID: ASQdruAJSQONtKQysMstLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81769468"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="81769468"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 06:48:06 -0800
X-CSE-ConnectionGUID: 8X/BXNtKTnSPsEfaDJFkcg==
X-CSE-MsgGUID: UMCMoQgwQxurvuJdMbf6Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="191481081"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 06:48:05 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 06:48:05 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 06:48:05 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 06:48:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5X84pyy9bM4k4oXbzrTdCd04/o935GbIF46AYt3SydC5hxvWg/sqpadrtAaeJbghHlk/Uf3pfYj/K4SioBlXDkle/9VjLnYMgbad2k11aUq33vyBDVi29I1v0GQhczoWueRECIHQSIwJCUPI8Ec5WA6BuUuuW1/0e/vrBwoI+vvRTtuMKVWjU39JCN6Oubktztp6dJTWqEgZh1ULRTx85L+UaAifjLtT8VC0sfQ7D5gB89WSKpF73i2SrU6aDTnsWtCOVSgyfAH0hKc2z+T6mqG0yWusW5OK8XT+MhGsRNEIQBB2lkKz//HBLYG+hO5VFN12TSadfdYKu/5fRORUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHFdxGv42BAPucbiq9qSFgUkP5D6bi2t8vsckFzNA0E=;
 b=jWkBQOxTE5e1FGJJEdTcoqQOh5XUxyspubicJbiV8UURY1jheEv7o/xn5OTtpzhXxR8XU2ACTymHXLqJqPQHMin5oFHcna44loftG4LA52LoQrK+l6jQXGPF+QRmuFAghiMNIDrIOltwSt81uHWWv4/2kaNChMufmvwL1qzr4DdtOPfKmXHRIYqLpPAlPs+ezBlLy66nuAc3j1KaNN+5gay1Rvn7Apq79kqMML+vimoQY52g4g10Lg/ft5Ye0VOQJqz5dKKnyBL7rGWLGa18txBiviW1/UWi+QX1S3BcLyYuXe8LiHi8arkFiNIgA+VgnZgqS20rYFO5nmH0G9foGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS0PR11MB7441.namprd11.prod.outlook.com (2603:10b6:8:141::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 14:47:58 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 14:47:58 +0000
Message-ID: <24d58635-9dbb-4d88-9c18-bea7ca5f133f@intel.com>
Date: Tue, 4 Nov 2025 20:17:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe/guc: Eliminate RPa frequency caching
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20251104104207.696448-4-sk.anirban@intel.com>
 <20251104104207.696448-6-sk.anirban@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251104104207.696448-6-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0113.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS0PR11MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ea35a17-04b3-42cc-d5e2-08de1bb124ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzQ2QmNSazJ0Wm0rb0V1RDFlQUNKbDZQTjk3bTAzV0FiMk5vSm9BM2pIK3dz?=
 =?utf-8?B?b1FhOWhzcTBXTURTYVJNcndnUGk4TzdpdHAwZk9LQ09VQ0JCcEovNFVpSENR?=
 =?utf-8?B?V2ZnWlBoUWVlUFJmcnBCb1g5YzBoOTR0VHBzS2ZpQnVxNWJDa3pzOVpJNi94?=
 =?utf-8?B?cUlFWWNlRFJVdkx3TitOalBNS1lmMVFHcmJXOWhPWGpoejVpQ01GS2JXT2Iv?=
 =?utf-8?B?MFErUzFhdXpCdjVRTHVxbkgyT1FhMmxLSXJONjVyUWtMeHJJOW40TytrSU4v?=
 =?utf-8?B?V0xmRjZaRElid3owVkU5WEI0RWVUaEthcE9aNlVMQzJzNW1KME05ZXJ4UzAz?=
 =?utf-8?B?TkZJVFBpSk1rL3dJNklHZndGcFV3eTNpb2U2VDVNWHZ4cncyNkVHbnU3Z2xI?=
 =?utf-8?B?UC85ZGlyY1Z2ekRYYU1UUHRGZ2NFcnBhYW5sMXg3Q0FkTmRIVVhNSzZTNzVk?=
 =?utf-8?B?U0FxNksrUFFjMU1vUUgwTUhMYUtId2NYYTRYN1RSZDdPMDNkWWo4bjM5NTlE?=
 =?utf-8?B?UVBHN0psSWZiVHFxc1ZMRFFxZ0VJYnYyVWVMSlpEbWIzZm5vUXVaeXRvZnhz?=
 =?utf-8?B?cjBuMFF2SFJmRGtsMUo5bUFxNXkxZWUzb3dieWEzeDNadkx6YjFod29PNUFj?=
 =?utf-8?B?T1dtRENGNlh0QnRnTVVmTDdjS0NYK1JFellRNzVjcEJ6b2ZJZHRVa1JvWmxp?=
 =?utf-8?B?ZDRNSDBxYnlsK3ZWOGJ1NFRQZTZsSGxtR05la2tnVHQrWUNTUksyc2Q0SXhV?=
 =?utf-8?B?OTVoanFCYmx6ZGhzYXlOeUkzdk1mRStjRnlEcjVLMlRtUzhJbDd1NmFrdDZO?=
 =?utf-8?B?UW1pU1krYUdCQXMrOWxqUlkvM0grSWEvKzVYU3BwT2U5UFZLUWdMNGprVVla?=
 =?utf-8?B?N2RWa3ovRm5DcFJtMFRJNjZQbXR4d2dWVmdTK0duTFl3a3JXQjEwN0FmM0lh?=
 =?utf-8?B?emNhZVFTQ3E3b0IvWk41OVR4MzZrbXdQWlVkSHdQSE9UQ2VSVGJ1VHRuTDlB?=
 =?utf-8?B?SzRDeXEwbUZDaXRWdzltak9pblcxNnRQUjY2QjFFNGR6b0hwSFdKaDRWOXNu?=
 =?utf-8?B?OFE3Y0U2enlHNDBvcXIvM1pOWEJudnVGZXY4MWFuQ3ZDODltQ0x3Rkd2TExO?=
 =?utf-8?B?MjVyQWpqdXNuS2NZMi9jbGVaOXdKdGV5aFRDdjFhWDJvTmU5NzB0ZFNaMk1W?=
 =?utf-8?B?RWN3RzFTSENDN20rMW43bnRnY2NZaUsxOEhVUmRtOU0wYndHcnhXT2xPdXhQ?=
 =?utf-8?B?dGVpQVF6eS9LVXUyQVhGRUVYeXVsL1JhQ1FRdTdqYTk3VU1ieTBBb1JqL3Jv?=
 =?utf-8?B?czlSMXpJSUpDQlBmUG1yc1hFWTUyRUtjb01ST3ozMG5CMzkycFdEb053blJt?=
 =?utf-8?B?MEwvSU5PZFk3ejBsVU9KaXJNc2dwMGVHaUp5TWg1RFJTV1VaVEJQaXdUNEFP?=
 =?utf-8?B?b2hBT2w2cW4xa3FKdTZvSTROZExKNGJIUmkvVUlYb3R0NG1rWnNIOE5UZkdq?=
 =?utf-8?B?ckxkZDhyblBMM0w0NDk0NStGb3NLaVkzUERmRmlBdVkrdG9JRUo4dVNmZER2?=
 =?utf-8?B?TGM4UFNocXlXMWFZbERCZVR2OHJZMlhDTXFmaUllMGdNMEJaRzJZWDJNSUZH?=
 =?utf-8?B?ZzJhSDNEVGZXeWRKTC82YnNINllkRXNWQnl2bTZhZTlINGdQNFdiN1U1MGh3?=
 =?utf-8?B?bjdCaDZoV3JYLzZMaXAwUkdRbkdHQUd1NDU5QlpqZEgraTAwalNxNGFwSy81?=
 =?utf-8?B?bGo5Yys1QjAxODdUN3ZlUDEvd1g0Y3BZS1RXN1NlWkNHZ2g1RkxjZEZqUmVB?=
 =?utf-8?B?dVZ3aGZUYkVCZHg5UjBKRzZyeWcyMEZZZXJGakp0S0lWcFM2ZGM0Y2ZqMEda?=
 =?utf-8?B?eGFqd2VWOG1TWGlESDArbnorcmtlY2ZOVmpnVHdDaldHVHEvS1Bvajc4cTJH?=
 =?utf-8?Q?5WZAuwan2di+uTXpsoPGbOHpnnibqlgt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?My9VSWs1WjlCYS9Uc1R4T05DcHcram9kcWNHRVBYWDQxNzNYWnN2cVBZSVhN?=
 =?utf-8?B?Qjd1T0J0YUVyU0pMSmp0ZWxoWFM1aTRBaHBTanY1VFhaZmhjNG5qWlF6Nlho?=
 =?utf-8?B?eGhTamJWUVBUOThwYml2QXJCMUpxbjJla1pmS2NSMG51Z3lJTWozcW5tRkpI?=
 =?utf-8?B?THFmREw5aHN5VzVOWGJXY2dmcklacjIyS0RsOE42MzVtUURKM0dobGFMaXJr?=
 =?utf-8?B?dWRaMTBUUW9FaEkrMmJmOVFHZGtMK3NIbEIxUzlUeTZJOW1kYjBxN3VMdlBN?=
 =?utf-8?B?SFE2cFZCY2FwK05RcnBBM2RMQUFvQUl6T0I1SDROcWhZUXNzcEJlajVIanlz?=
 =?utf-8?B?WTIrd2x6VnlRVlpIV1UybTJBTU0xVC9BN3dvZGQzbk13VGcwd2NmNEhhU2Na?=
 =?utf-8?B?andVanhYYi9JbmdwczVQT2pvUStCQUZWLzd4TDNWRkljWWtHbUV1ZytnK3Z4?=
 =?utf-8?B?UDdVSTJKTXhoM0J6SjJULzEzNFA4K2NXTHpodDVDYko0Y0lpSlFzVkc2RDRy?=
 =?utf-8?B?MkRNaFE1enBvVXpnZjRQbkFDcVZOeUFQR0UrMHdGb0xENC9nMnFoeWQ5bDcz?=
 =?utf-8?B?LzNkRSttQy8zMUhSakZzT1BOOEFWMWozMUtabVhielZrT2g5YkZMZVNWakVL?=
 =?utf-8?B?YVFabzNPeFJMSk9pZnFkWU1NSFAram1UbHUyWGpnVUZDcDRCZFpkV3RmeWg1?=
 =?utf-8?B?QXpxamZ4V29aMGVIQUJQMG1ESjFaMzIyb3dFWWFaTjRNVlNReEthc0xOSG5j?=
 =?utf-8?B?ekRTekxBd3Z4b005MmhyZy9DMHVjeG9OTnVzaE1haUk5QUorSUQ3WnFGWHh4?=
 =?utf-8?B?OTBvZk9hRTlwTHBhZDZZazBJcHNtWFNDQWZUMkhqYm9OaTVrV0JEbFZxR1M3?=
 =?utf-8?B?dm5yNndsSzdldDVRQVBlbGJNTUxrYWhGcTNqZDUrc3U2UWdOeHFCNTQxRDRR?=
 =?utf-8?B?T1dLT3FhQW1qV0hqNW1ySXZGMlZ1Njd0bnpKWkh4ZUpJTjhhditGYXkzWGRT?=
 =?utf-8?B?cHRTQW1veldLU05DV3J1cVBRRklzVmR4eUhUd0hFWlkzaFlNa3NqMmFpeDNj?=
 =?utf-8?B?N0ZKdXlVa2NEQU1odURmTTlwK0tRdGsreEhQNXhURTJRakpkNzg0WldHWmhj?=
 =?utf-8?B?dEV1NndlK21tZ0xQUHZCYmFyL3kxZzF1eFZPQThrZ0d1WlAvY0tMb21vRWRm?=
 =?utf-8?B?L0NLbW5Odk1aempIZGVKNS9TZnRXVWpUYmJ2KzJucmdyRjBOZVhGWU45NTdH?=
 =?utf-8?B?aTFabUJ3eitMU2JoZE5XaGJxK0UyZUpiS25uZXVjOENTM24wN1QwbDEyMURz?=
 =?utf-8?B?M3lyYzF6TGw4UVJSRkpZVlBZWmYwbktkSGpVQy85T3Fubk44TjdJMS8ySkNx?=
 =?utf-8?B?bUxKVTF0NXc3YVl0ZHMxcHN0L2tueEd5Ylo4ZXM4Q2RhbExFZEt4ZnlKT0tq?=
 =?utf-8?B?MkFHcmV1blA4b2ZSTjA3VW9BL3B3MzRvMEdzRU1ZT3B3ZlV5VTlUNTYyOWRo?=
 =?utf-8?B?NzV3QjA3eUt2Y3VtQ2t1Y0o3eWRUWnYxdEQ2eGtHLytDZ2hrTXFJYWxFSHVS?=
 =?utf-8?B?WHhUa1RFdGdrdHBrK1NnMy9jSWtMWm5IcldMOEN6N3prTW9iN0J4ZDJjYnhT?=
 =?utf-8?B?Nkp5YnRiT2dXNm9oVjVGQXh4eUU1RHQ2bmZLR3hWVnRBWDFsVFlETHBMQU8x?=
 =?utf-8?B?QnNBL2JwU2NPK0g0ZS81bjRFNVFwekdKVU9qUkQyQVNuOThvNXZjZmRvaUQ1?=
 =?utf-8?B?T2hlNUgyNExQTFRQSndjSnZ3dU5qbGh3eEFPSlQ2NHIwcG1GTHhzRUNSeUNu?=
 =?utf-8?B?TUFIcDVlQ3N1Vkw5Vm53MlV3NG4xanRHMVRGU0dLTU1SdWlFTUl1Q3dxdUZu?=
 =?utf-8?B?Y29jVTlNOWwxck9oQmFLeVQ3cFhEQzV4QzRjd1FyaXFsbXhXUDJSZVNWUTFn?=
 =?utf-8?B?bWdhOCtJZHlPcGxNZnRGb1haM2NrWjZHaWd6U1Rwd29SamdMTEFRVVk0Zlow?=
 =?utf-8?B?L21DRHJoQ0pjSm1TQWxuaUZLQjJvTHovaXM1Nms2UXpuZThGQ1pJR0ZZblBn?=
 =?utf-8?B?WURpZDVUeTRaZ2t6WUZnNHVlMlgwVFhnS2h4UEZuQTduQ2cwYU5kdHZ6ZkdG?=
 =?utf-8?Q?3buBjmFuFaT1P80YnXWPrcFSm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea35a17-04b3-42cc-d5e2-08de1bb124ba
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 14:47:57.9116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/rneXwbIAOhM+sIfxde5PevEdOiTWwZxKTTrGvaJuhO6J6xr+rVdMVCo310uPdRkSzfS00DsU3BQK7ozOWAJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7441
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


On 04-11-2025 16:12, Sk Anirban wrote:
> Remove the cached pc->rpa_freq field and refactor RPA frequency handling
> to fetch values directly from hardware registers on each request.
>
> v2: Check graphics version instead of platform (Rodrigo)
>
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Suggested-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c       | 55 +++++++++++++---------------
>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 -
>   2 files changed, 26 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index a9c29f123b37..01fc8ecb373d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -362,7 +362,7 @@ static int pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
>   				   freq);
>   }
>   
> -static void mtl_update_rpa_value(struct xe_guc_pc *pc)
> +static u32 mtl_get_rpa_freq(struct xe_guc_pc *pc)
>   {
>   	struct xe_gt *gt = pc_to_gt(pc);
>   	u32 reg;
> @@ -372,7 +372,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
>   	else
>   		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPA_FREQUENCY);
>   
> -	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
> +	return decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
>   }
>   
>   static u32 mtl_get_rpe_freq(struct xe_guc_pc *pc)
> @@ -388,24 +388,28 @@ static u32 mtl_get_rpe_freq(struct xe_guc_pc *pc)
>   	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>   }
>   
> -static void tgl_update_rpa_value(struct xe_guc_pc *pc)
> +static u32 pvc_get_rpa_freq(struct xe_guc_pc *pc)
>   {
> -	struct xe_gt *gt = pc_to_gt(pc);
> -	struct xe_device *xe = gt_to_xe(gt);
> -	u32 reg;
> -
>   	/*
>   	 * For PVC we still need to use fused RP0 as the approximation for RPa
>   	 * For other platforms than PVC we get the resolved RPa directly from
>   	 * PCODE at a different register
>   	 */
> -	if (xe->info.platform == XE_PVC) {
> -		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
> -		pc->rpa_freq = REG_FIELD_GET(RP0_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> -	} else {
> -		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
> -		pc->rpa_freq = REG_FIELD_GET(RPA_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> -	}
> +
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	u32 reg;
> +
> +	reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
> +	return REG_FIELD_GET(RP0_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> +}
> +
> +static u32 tgl_get_rpa_freq(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	u32 reg;
> +
> +	reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
> +	return REG_FIELD_GET(RPA_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>   }
>   
>   static u32 pvc_get_rpe_freq(struct xe_guc_pc *pc)
> @@ -426,17 +430,6 @@ static u32 tgl_get_rpe_freq(struct xe_guc_pc *pc)
>   	return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>   }
>   
> -static void pc_update_rp_values(struct xe_guc_pc *pc)
> -{
> -	struct xe_gt *gt = pc_to_gt(pc);
> -	struct xe_device *xe = gt_to_xe(gt);
> -
> -	if (GRAPHICS_VERx100(xe) >= 1270)
> -		mtl_update_rpa_value(pc);
> -	else
> -		tgl_update_rpa_value(pc);
> -}
> -
>   /**
>    * xe_guc_pc_get_act_freq - Get Actual running frequency
>    * @pc: The GuC PC
> @@ -535,9 +528,15 @@ u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc)
>    */
>   u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
>   {
> -	pc_update_rp_values(pc);
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	struct xe_device *xe = gt_to_xe(gt);
>   
> -	return pc->rpa_freq;
> +	if (GRAPHICS_VERx100(xe) >= 1260)
> +		return pvc_get_rpa_freq(pc);
> +	else if (GRAPHICS_VERx100(xe) >= 1270)
> +		return mtl_get_rpa_freq(pc);

This code will never execute in its current position; it should be 
checked first. The correct order is:

if (GRAPHICS_VERx100(xe) >= 1270)
	return mtl_get_rpa_freq(pc);
else if (GRAPHICS_VERx100(xe) >= 1260)
	return pvc_get_rpa_freq(pc);
Regards, Badal

> +	else
> +		return tgl_get_rpa_freq(pc);
>   }
>   
>   /**
> @@ -1134,8 +1133,6 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
>   	if (ret)
>   		goto out;
>   
> -	pc_update_rp_values(pc);
> -
>   	pc_init_pcode_freq(pc);
>   
>   	/*
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index f27c05d81706..711bbcdcb0d3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -19,8 +19,6 @@ struct xe_guc_pc {
>   	atomic_t flush_freq_limit;
>   	/** @rp0_freq: HW RP0 frequency - The Maximum one */
>   	u32 rp0_freq;
> -	/** @rpa_freq: HW RPa frequency - The Achievable one */
> -	u32 rpa_freq;
>   	/** @rpn_freq: HW RPN frequency - The Minimum one */
>   	u32 rpn_freq;
>   	/** @user_requested_min: Stash the minimum requested freq by user */
