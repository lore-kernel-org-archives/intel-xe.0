Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFEBC3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 05:34:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC5510E1A7;
	Wed, 28 May 2025 05:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jOYs+xKE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E5C10E1A7
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 05:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748410436; x=1779946436;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6XJQe2JXGKoOK607yblNXKN5X9rduun5TJQCK7ihKZM=;
 b=jOYs+xKE2L6TAZWjSEitAt5vPj6NAy+Co5SrGcLoDhXNTZ9/jIQkEZwB
 pniCEIO8LiRYQA6sIecxVeTp+iYoL2/MSR+VC++xSYHAgQqt8kI9EhHkn
 sa1QJ6pMAZHWfAT5plH45kxG4f9Q69MqCGFrStcVT7ZwFg7kN/YD5iN4f
 BgMZ2pggoJQs4kQ89FoT6IVPYY5GbMDtP9FH3YgADaR3sj0QA/68QnDaR
 o5+pMg9Vn5IlnNyxbeGcsYEvJd78pXquf3kdhU6S1UkSwS9nACkb1Tzho
 es3wFx6jOw+BDlVjdtReTLiqDWJAwsO+G7YOvC94GszJ+JCQ6VfMxOFIO w==;
X-CSE-ConnectionGUID: 5nWwEHcSTLS5Xjns8ee8mA==
X-CSE-MsgGUID: Vnrb1Ge0QKCjamX0wwqxOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="67834335"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="67834335"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 22:33:56 -0700
X-CSE-ConnectionGUID: F0LAYvXDSKyLjOWieA2G8g==
X-CSE-MsgGUID: e9kYJCduRse2aeZRS8KU5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="144102918"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 22:33:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 22:33:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 22:33:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.73)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 22:33:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bi874/4wyn3hbkGRhCi8WsjRWyS3zUQYZC46493YoASuaaStcbC3v0mMu2Acf25/fWQXNs/u0BuuJnb0EpsG6Eu8wCfLKFkJnm9E1REgYnwrPnKZPmQSY0OnZbABh5j2zsn/hCxgqePngn1nwG75dB1tr4cdbqNIhDX/7nqGuNMqzgL5ra5sB+5QtTnfHpF1Cuol5BJKXKtLhGyw4E55fYdcnnJe3uOzFsRKwc9Eu6AiRzRegIJERe3TGZAcpJEExo4CLb+Rp5vLTGvOYA1l6p5hdTpw4tOBtawLLbrev+ZQmEEr2kiAIJSJcaNVdB5HalOFeBXhoynEYRMSkmgYaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzFBBhTr+xYxtolqc0LWy5G0EN8eUxwHyRqT92NQt/w=;
 b=D7h2uz1wi/tUoz7p8ZPEpQN7fYeh/T8rpLr4DagvTQTqf3g/nOOJG21YNHDOwKzDuujTbLLaJmBspwO1a8wHOr0E+iD1pB6vZCrdcxfkTH2g9rMfXxhtZLMiUBhIY+3A+wrU2kymliuVQgQYyCZ52uCvceiwR8Ut2/C46zEhtjtGZCU6T4XMFcQ9SA+QWXNeic5WhTbrDdPo4KGJqJVcIH1A/yh9QXIe2p9xdSOvbxINLC/l2KAAncylYoKUE/o6voI2M1gb42pAAHq4Sn/fYf+8miEtSwEoHbmdpOrAmYs+4QZD07att5ByAXUKzxPt384Hep7b2G+d46lhLBu5kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ5PPF44E8B88DF.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::825) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 05:33:37 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8769.019; Wed, 28 May 2025
 05:33:37 +0000
Message-ID: <d9a23e0a-8173-4c30-8f8b-1f9dbaf7eccf@intel.com>
Date: Wed, 28 May 2025 11:03:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/32] drm/xe/vm: Add attributes struct as member of vma
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-19-himal.prasad.ghimiray@intel.com>
 <aCTik0GGPGymStmr@lstrano-desk.jf.intel.com>
 <eab2c34b-d89a-46f5-9147-bb9060b4a5c1@intel.com>
 <aDX4X7X6GAZcaBBv@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aDX4X7X6GAZcaBBv@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::29) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ5PPF44E8B88DF:EE_
X-MS-Office365-Filtering-Correlation-Id: ac0f9ea4-0e39-4d40-5eae-08dd9da93210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czZ4TDNhYVdPVDhCcFF5QStlWGprMUFJdEVhdzFHclJ1OXl4RWh5TktqMnVD?=
 =?utf-8?B?M21vWFU3RHUwMGFpL2hyU1QwdlhRRXZtUldycUpQditHU29uSGJpRDFQbjRW?=
 =?utf-8?B?U0JXR04wK3RyZ0t6MGpNajVmeDlybHBmK2tybXlCWlc5RDJvOUVtUGg4T3BB?=
 =?utf-8?B?WnVKcytOZFB0TDJmQ0RVb2FhVmR5TGxKMTY4V3hkNTNINnJocGFHVHJ5SFlG?=
 =?utf-8?B?QnBla25MSGxIazBFQkVBc3R1eFRMNDZXTmR3K21xelpPZkRnUVk3dEVaTkMw?=
 =?utf-8?B?T3BCOWhBQWkwcmRPQUJzcXRRREt4QVF6ZklYYWdETVM3R1dzYzFha1RVT3I4?=
 =?utf-8?B?VDFhU1pyaVNYODB5QUd6RmgwNXhiVzcrZ2JJQ2ZPNHNkRlZBQm43OGYydkJk?=
 =?utf-8?B?cnZid0Y2bkVTTU9Nc2xBd1M2RUxlUmovTlZBdjhFR281eFRMYXpmckR0TkxT?=
 =?utf-8?B?c1ZuQkFqMDBEYmJ2NkZUemVDQ2twTkhtMVRPTzgxQnJIdCtxUmtDMlZnYkl0?=
 =?utf-8?B?R2pyeW5BMjBnWlVOcjNqQ0c4SEx2Y080czlxcGtOVUFScEdsTlVvb3hVSnF6?=
 =?utf-8?B?K3NGZmhXNGVMRXRXVFZTMmg1UElLSW04OEFIOE1oZmZxOHlIWjlONkFZYTFo?=
 =?utf-8?B?TGxLWTRUYTJWVmY5a1hHaElNVVpXeHdQbHJhK0lyU3JiOHRldGQxMXFTdEg4?=
 =?utf-8?B?LzVwcmdGL2szY3hlb2s3RWVuV1VJZVhvRTFteWg0UE11SktRMjFUL0ZFMGhB?=
 =?utf-8?B?T2tzUFQ0d1hXZC92cjZDUUNUNEs4TmN2akUwckhmOFZlenRjSTJGOXBqcEhY?=
 =?utf-8?B?QStwY3g3dkRXTndQMlFNaDFMVGgyWTZ1S1hRRk81SDlXLzBOSm0rQVRkWWNi?=
 =?utf-8?B?TnVFQWcyaVpmczRDVmhSSkpTMmgwMmF6SkNYUDMzN1BhS1ZXTTQ2dWNZL3Z0?=
 =?utf-8?B?QXUwNU1UbE9hVGFEYmZwUzByaGdLb0tkVHQ1dEdOaDlmQXpDSGJjVG1VaHNn?=
 =?utf-8?B?SWE4TG5WN2R3Y1R5NDI4bi9UQmdOcDFOSEVBdjl6R1pBK0ZHZ0hFUXZxQ2g3?=
 =?utf-8?B?SStBbHQzQW5YTUorSkl2dVVyMkFiVFFSVVdzcXBBLy81M3FabytWRXd1WE4v?=
 =?utf-8?B?MHJUV1FMdmk3djFIT1VBQ2Z3S3NxeXJ5S1dnNG9kQU9iQVE0Njd4R3lZUktK?=
 =?utf-8?B?eTlqWWx1VWhyazVkVmxhUVQ3RUVUMSsxK3NSYlBUNk0yUVdEYkYwZFNteTRB?=
 =?utf-8?B?RUZrMlY3RmJxYVRQV3pwOGtlZW53a0E2R2VmN1JDQ3RTak55KzNVRWF4U1Mw?=
 =?utf-8?B?RUJ2ZHhaZEFvU0hJTHErK3FFSUtWRnVGbUM4Y1VaaG02bThFMENPKzZ4Rkw3?=
 =?utf-8?B?THMvUkxnWTlRWEsxSmpYOFRIUGxKV3ZpMUM4NEttVW9NRHBaQm4vZ2ZOSlBs?=
 =?utf-8?B?aFNpaW1ZakJwSUY5dzBVSHlua0JuZW5CYytYb3YrVFI5bDFjVHRIRkU1M2Fh?=
 =?utf-8?B?KzE0VmdUMVNmMEJ1Qk5QYnE0aWJvVmlOaGt0VXlPTDZLVGVnd2tvV0d5Z0RF?=
 =?utf-8?B?SWNXVWtVQXlrWmxEVmN4b1pqV2JIOFFZMVo5WXZhZWpCUEZtU0QxdkJ1NXpo?=
 =?utf-8?B?eVJlMGRSNThJTDlTQjgzMXllc3k0Q2dEYnBYeCtkNnhGV0d6T2c0ZHNhWjV6?=
 =?utf-8?B?Ulh1Vk5LbFErS3F1dFg3MzlQOUVVSDYwWmxUVk5ZN0lYK0hZM3pPc3pjaTN4?=
 =?utf-8?B?ejI1Q0FMZzFtUlpvS09LSDA5QWFRK004Lzh4dVVVODYzemJsVE8wS3ZOWUhV?=
 =?utf-8?Q?mKA0QN/03CVWYHzeC7+1JzMrklfaTbjtjIMEQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QktvN0xHUFlWOEVFU0FHd2YvWjQrcVF5VStKWG4vKzN6dTQzUFhxbVRyaWxK?=
 =?utf-8?B?dzNPa1pmZXY0RHBBeVVTS0hocTVpaVNGbDRRYysvMUlhT0R6czFXV2x5bWE5?=
 =?utf-8?B?V1RtaUxsNVhtU0FudDc2VHRPS0hxNFJ3RDlvd2NBUDZ1Ri9hY2ZUekFVNVgw?=
 =?utf-8?B?U0FCOHdRYVRraFV2aEdmQ1B2SHNwV2NBTVNCWjlaa2VVLzMwYzF0WXNhUXNE?=
 =?utf-8?B?NEU3ZjRzVStFeS9QUVFSNHB2ajgrbXJrQmJSRHpsUWxhSVY1Zk11MTFFbFZ2?=
 =?utf-8?B?Zk1KUVk5R25IcGlldlk4QTlNWjFLU2V0cnB0VWUwZTNMbXNMUFMxYmxqLzV0?=
 =?utf-8?B?NllZcFBtMGpGbGllWGJKWWVqejNPUm15SCt6U2Rlclp3bk1iZE5iTjZOaXpG?=
 =?utf-8?B?UDE3QTh3dXBJYUJtRzYvRDl4dDQvcmJIdzkvMk5OMU9CRWxDS3R3Wld3SmlV?=
 =?utf-8?B?ZlgvNXBsa0RwWlY2c2tETEMyTit1M1VUZHNQbnlqdkNwTS9DaWxwOTZZcGx6?=
 =?utf-8?B?U0RuZ1Z4TW5iTk52NVVNaCtZdGVoZlZMNVdBdVZrRmdUblg3QWRYYlJ0Yk5Z?=
 =?utf-8?B?T3pJSWFWTUM4ZlQyUkh1MFprVHpSOWVRajZyUTUxOUlmWW9RWkhmZVVJQ1RW?=
 =?utf-8?B?T2lSNmRKeHM0L3ZYZm5uOWxreklUMktyMllxVmQ1Z3prMG1oZFhtajRPSVRJ?=
 =?utf-8?B?eU5QZkNmRTJIdldZM09aT0dlZXVtTVorRkNiNUhvejB1UTBKSHdIQzBWTitN?=
 =?utf-8?B?QnV3blRCRldiQkJPak9oTVYzVzNubnZnT1ptYzRhNnVSb3NIRkRiNW5GR1N0?=
 =?utf-8?B?SW5TdC9rOHJuQXNmZFdaN2cyN1JURkVLZks2V0p1dDV1U2lJbk13Sm5rK3VF?=
 =?utf-8?B?S014VWZBUTNUb3E5MlFmTzZ6ZTQvRURXU2UwSlpSR2IrM2NLRVFyUWw2TjJq?=
 =?utf-8?B?NzlrTkhPRTJhQS9DNUFWdXlRQTE4VDVZdEZTSUVadjdtNXVhbmgwcjByWmFZ?=
 =?utf-8?B?V1ZuRG40VGxJUkdiSHpBWHhXZEFnMU44dTNENVQ1cml0ODFRK1hmSzAyaDdt?=
 =?utf-8?B?RFpMMTBQRmhlUUswUXB3Sjc1N2JyUlZnNjZBRGsvdTlacWw3Mjg0OFBEcGlH?=
 =?utf-8?B?b3gwMHlLQnJUWTZqRmZuaDgwcmpieS9YUlFpSk84TVRXOXNHWmsrWnU2TldP?=
 =?utf-8?B?TURQZlpLejhTbkVDUHRHcTFISnVONXpMQWw0bCtFMFFJL2RzamNHQjI4L1Zi?=
 =?utf-8?B?MVh4QnFLQ2NkTmIzaFdtV1N4MmN0b1QvTFZ4YlVzSlFVVWQ4bS9yeDgycjVJ?=
 =?utf-8?B?NGlYMkg3WnhZU2JtbHZadHdFekg4VStnQzFGSFZxVkV5WVVSaFFjZVBycFJq?=
 =?utf-8?B?TzlibDdxMm1GTmF2eDhhUDVOUFFhbnEzTjJNdjBZWGVuNVJVZVUwOVdiZ1lE?=
 =?utf-8?B?QkZpVzFBUEFKS3BDZGtwRUF0YzVRU1hmbk9EQjJvRjB1ZVZCaExkR2d2NGth?=
 =?utf-8?B?MDI1a1A3VUk0bGRSZWJFaHBXREZMTHZtcndPK2R1UzBsMDF2emF1MVdITWcz?=
 =?utf-8?B?MzhGRGExY3lZTVJ3bkQzbUN5cHlCZkFJcnF4bkw0K0Z1bTNIZTEzNjBzc1Ba?=
 =?utf-8?B?Zm9BSy9QRHNWN0JYT0NtZndZM3pzak42WFUwOTRuRG4ybGJHNUVodEhENTRG?=
 =?utf-8?B?N2ZlZUNNOWJSOTVJS29QWXdEM0RQMFVpZmZmU3ZlYlpKTHpIWUIwQ0F6TGw5?=
 =?utf-8?B?L01Od1M1MThUaEFmMDkrM2htdStKbnpONWROTmM1ZEVKM3NCVGM0Y2RhTUJo?=
 =?utf-8?B?OVIyc3JoVEpDVG5sQkw4NWtLK1ZEamJVUUgrSVpjTVdvWjRqYnoxS3V1TndK?=
 =?utf-8?B?cXlsTDN4WmVFSHBFbzdHSTlmSjFGSUJGN2RhMW9EWThlSjhzM3BRdjlOZkRl?=
 =?utf-8?B?UWFHTC92Qks4bmFxN2lOeFdUS3oybTFZbjF1S0NXdjBsQTk1bUVPOGlCTTlm?=
 =?utf-8?B?VklRYXE3SEpuQUh0VXdlbkhyTlBOQURUUmt1NmQrS3J6dWZPcVp6TUV5SWpQ?=
 =?utf-8?B?UnFrcDcwUXVIRGVPOGdtN1ZqcG1yU0c4YTlITzRKQTYxSmhUV1dwUEgvcmRO?=
 =?utf-8?B?cGNXSkw0U3FKZXY1cEd1bWppTUo5U01WZW1ESVRGMFNOcEE3ckUvcUw5VFd6?=
 =?utf-8?Q?zsf5FFIWYs8f78Z5e965l9A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0f9ea4-0e39-4d40-5eae-08dd9da93210
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 05:33:37.4571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAF9pfxo7LJ7Jd6q5un/9y1CNWI4RO31oKa0w8udSv1K0BKEDwKNyiITQAnNyRuchqO+hlVFNVzNznC5lHIbbN3OFYsFgZF0rur3+pSpFx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF44E8B88DF
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



On 27-05-2025 23:07, Matthew Brost wrote:
> On Tue, May 20, 2025 at 02:57:45PM +0530, Ghimiray, Himal Prasad wrote:
>>
>>
>> On 15-05-2025 00:06, Matthew Brost wrote:
>>> On Mon, Apr 07, 2025 at 03:47:05PM +0530, Himal Prasad Ghimiray wrote:
>>>> The attribute of xe_vma will determine the migration policy and the
>>>> encoding of the page table entries (PTEs) for that vma.
>>>> This attribute helps manage how memory pages are moved and how their
>>>> addresses are translated. It will be used by madvise to set the
>>>> behavior of the vma.
>>>>
>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_vm.c       |  6 ++++++
>>>>    drivers/gpu/drm/xe/xe_vm_types.h | 20 ++++++++++++++++++++
>>>>    2 files changed, 26 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>> index 27a8dbe709c2..1ff9e477e061 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>> @@ -2470,6 +2470,12 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>>>>    		vma = ERR_PTR(err);
>>>>    	}
>>>> +	/*TODO: assign devmem_fd of local vram once multi device
>>>> +	 * support is added.
>>>> +	 */
>>>> +	vma->attr.preferred_loc.devmem_fd = 1;
>>>
>>> Assigning a value of '1' is a bit odd... I'd prefer using a define or
>>> something similar to indicate the intended behavior. I noticed a few
>>> other assignments to '1' in the final result—same comment applies to
>>> those.
>>
>> Sure
>>
>>>
>>>> +	vma->attr.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED;
>>>> +
>>>>    	return vma;
>>>>    }
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>>>> index d3c1209348e9..5f5feffecb82 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>>>> @@ -77,6 +77,19 @@ struct xe_userptr {
>>>>    #endif
>>>>    };
>>>> +/**
>>>> + * struct xe_vma_mem_attr - memory attributes associated with vma
>>>> + */
>>>> +struct xe_vma_mem_attr {
>>>> +	/** @preferred_loc: perferred memory_location*/
>>>> +	struct {
>>>> +		u32 migration_policy; /* represents migration policies */
>>>> +		u32 devmem_fd; /* devmem_fd used for determining pagemap_fd requested by user */
>>>> +	} preferred_loc;
>>>
>>> I'm a little unclear on how these variables work.
>>>
>>> In the uAPI for migration_policy, I see MIGRATE_ALL_PAGES and
>>> MIGRATE_ONLY_SYSTEM_PAGES (these should probably be normalized with a
>>> DRM_XE_* prefix, by the way), but it's unclear to me what exactly these
>>> mean or how they're used based on the final result—could you clarify?
>>
>> With multi-device support the idea was to have flexibility to move only
>> system pages to preferred location or also move pages from other vram
>> location to preferred location.
>>
> 
> Ok, I think having bits set aside for this makes sense.
> 
>>>
>>> Likewise, I'm confused about the devmem_fd usage. It can either be
>>> assigned a devmem_fd from the uAPI, but in some cases, it's interpreted
>>> as a region. I assume this is anticipating multi-GPU support, but again,
>>> the plan isn't clear to me. Could you explain?
>>
>> The devmem_fd is intended to be used to determine the struct drm_pagemap *,
>> which in turn will be used to identify the tile associated with VRAM for
>> allocation and binding. The changes that introduce the
>> devmem_fd->drm_pagemap->tile [1] linkage will be part of the upcoming
>> multi-GPU support.
>>
>> To ensure that the current changes are easily scalable and can be extended
>> for multi-GPU support, I am defining devmem_fd in the UAPI and using it in
>> the KMD as a region placeholder until multi-GPU support is integrated.
>>
> 
> Hmm, will this break the uAPI though? e.g. How does the UMD choose
> between region and FD at the uAPI level? If the answer is once multi-GPU
> lands it is always a FD rather than region then we really need to land
> some of the multi-GPU patches at same time as madvise - at least the
> ones which export memory regions as FDs.

I have tried to streamline these changes in the latest revision. Let's 
see if they make sense. This is with assumption that in a multi-device 
setup devmem_fd <=0 is actually invalid and doesn't point to any 
remote/local tile.

A value of 0 for DEVMEM_FD means the default behavior or VRAM of the 
faulting tile.

A negative value indicates that SMEM should be used.

Other positive values correspond to valid devmem_fds. With the landing 
of multi-device changes, if a positive devmem_fd is not valid, we can 
fall back to the faulting tile or SMEM.

> 
> Let's loop in Thomas on the multi-GPU assumptions too to ensure
> correctness.
> 
> Matt
> 
>> [1] https://patchwork.freedesktop.org/patch/642773/?series=146227&rev=1
>>
>>
>>>
>>> In general I agree with the idea of xe_vma_mem_attr though.
>>>
>>> Matt
>>>
>>>> +	/** @atomic_access: The atomic access type for the vma */
>>>> +	u32 atomic_access;
>>>> +};
>>>> +
>>>>    struct xe_vma {
>>>>    	/** @gpuva: Base GPUVA object */
>>>>    	struct drm_gpuva gpuva;
>>>> @@ -128,6 +141,13 @@ struct xe_vma {
>>>>    	 * Needs to be signalled before UNMAP can be processed.
>>>>    	 */
>>>>    	struct xe_user_fence *ufence;
>>>> +
>>>> +	/**
>>>> +	 * @attr: The attributes of vma which determines the migration policy
>>>> +	 * and encoding of the PTEs for this vma.
>>>> +	 */
>>>> +	struct xe_vma_mem_attr attr;
>>>> +
>>>>    };
>>>>    /**
>>>> -- 
>>>> 2.34.1
>>>>
>>

