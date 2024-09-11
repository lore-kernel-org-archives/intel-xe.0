Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C817FEE57CF
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:36:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A26510EA9F;
	Wed, 11 Sep 2024 20:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTbOM226";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6629910EA9F
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726086986; x=1757622986;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pG6c8R4Fh1Da0B17akRXIAgQhiIqLiEAs8rryNtiqHI=;
 b=CTbOM226SSofm+FpFxyT2uT9sx/+wpvAte2CHYbt7Q8lTiuZv61O113W
 8hVhvlis3RceZcmbHFlcLxLLH4mASJCgktHbj1DiQ3Mmq0+ooQm9/1akD
 Stn4yTftdpGLn/AK18ip0LodkOKgHoqkDPrTZxtz5aioW2C6RK1/BuRv0
 SmlP4Rku+3F5SKvdq3zegQEEGXCfqriu3lvdRR8vlfQcLVtjNtAYvKPep
 jn3sEMH5Z4IjV+wyG8XxAfm+q1sJ+pw7jfWUenihXkTIRbhIOAAFLdNOt
 WpE6SiSjNtG8un7O0LFWDkhOi1o4M1eMAibPqu1g3v9Z6bSM+zqmHF7PW A==;
X-CSE-ConnectionGUID: v5vePLZoSI6K587BRDcGvg==
X-CSE-MsgGUID: meBZ1MbZSLmQZBPDaaHmFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36047686"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="36047686"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:36:25 -0700
X-CSE-ConnectionGUID: bqLoAiYtQgGMMMeIU6zAYQ==
X-CSE-MsgGUID: /ChsD5ioSsu0P3YstHdHBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="90734931"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 13:36:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:36:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 13:36:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 13:36:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAbpkkzPiL9jDTF380MyF+2f0K4WxrdSeqRlSqfNdYJkzprx0YvU26XlgFuAUi4wd7pg6jxFaqvltWEuyz8z9h7ez2AEg81JLXiMOjzQAO1pZppQGfQgrHMdKJaSRvoXSQq1rAVU3w6dnHLxjb0a+o6A4Ru6hzLbuzJHFWL9ebisYZoCO8vY3jNoDPYeWmT7lOWQDg/D6CScpunrm0lB6yDIj0MIPrNZi0hCgcJkItSGQMwH7YAy7FQa6TxiGSbrVA3I2EpKyF/UAZ3eYPZ0UvuyWB/0DhcRRGMAtTVxyAzVNov9EKf80sdSVUk1ElFKHNbV9rk9HiTH4t89DNa+EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3k0mkpw3aDusNSo82yYOPU/VJtuiYhoTfgjm3cErHvk=;
 b=Hrfo/+UfF0FsHbJ7p+RhRymInGTFdwmONceDuxpKabGvziqBDuf4+8SW8jPN1cv8PdC0KObDe2MYVBZthVxLobnxTv0dAKYmNklxVuQqmoscFcnH3oaHL1b2vY47aCBY23jaoV6EJSTAdYncuYQSlfOsvkkOXC6SMuz5ifDPIh4nagOTa8HYFvEse6JoJATFGuHieR3EWhm31xnu0yg1Fo1YrRHpRe0+U3JQTS84e1AYpuklvx5/w9d8COsj1pDqPrPJBNe1zyPJIpvKr+8x2kgYIWOdFsTOho0YAIZszkHT72pNTLRF7//Ijn1rtBkIY/Ro/8FfqDftWWM9DIA4hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by CY8PR11MB6867.namprd11.prod.outlook.com (2603:10b6:930:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Wed, 11 Sep
 2024 20:36:22 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%3]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 20:36:21 +0000
Message-ID: <f9fe6a1c-700c-419e-bc9c-86165b30c1f2@intel.com>
Date: Wed, 11 Sep 2024 13:36:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/10] drm/xe/guc: Add a helper function for dumping
 GuC log to dmesg
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-11-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240905205106.1063091-11-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:303:b9::34) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|CY8PR11MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: c45afc9b-3546-40f4-0d7f-08dcd2a165c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VU4yaDROc2ppNXBmUUpaR0dSY0NvcEp3OGJoM1pJT21LK3FKSXBnNSt5ZVhP?=
 =?utf-8?B?ZlZkRTE1QUt3WUN0VWVNT1lINlNvcmxPT2poOUs2dVZ5L21STWlIbkpCeURa?=
 =?utf-8?B?NmFjR3hST3c3Z3pWTEhRVnhvRnYvVWp1Y3lXWDNSOTZBcDAyR1FnV3lBaWNE?=
 =?utf-8?B?a1ZXem9RaTNDVTlGeXNNa3RWNmFqYU80TXhyRkRuU2xsNk9rUy9kbU9zZ1E3?=
 =?utf-8?B?YU1QV0FmSmtMUjg0c0dvb0t6aGx4L0cwWmpqbUd6amIrR2txL3NyVHA5MldZ?=
 =?utf-8?B?a0hPVy82ekxnVTc1a3lpMDE2MUJ0TmxvUW0xWTNkUTViZ3BlU1ZzMkZMVTBq?=
 =?utf-8?B?SVdod1dNTFNzeml0M2RXQ0ZOMkJrV1NuWW1XaUFacXkwZFB3UFd1Q2VlcVlW?=
 =?utf-8?B?aGRPbVpRVHV4bHd0K3J6UlVoSVhOOXFOOXh5QXM0cWh2aUttRFRZdUZRODUx?=
 =?utf-8?B?TUQ0UDZjRnNUWEJ3akJ2cDdEUmJFc0JYR1ltUFhJRURoaUptUGtNYmgwNGV3?=
 =?utf-8?B?d242ZnR0VmpwSXFFVVZNUmJSb2VuUXBiVDFiQ3RlVnlOWEpmb0h3T2lqMnhW?=
 =?utf-8?B?WVFYdFRNRXl4NlUzK1lmZm52WVFETzVreWIvV3ljZERxVk5zS24rZkhTaUYz?=
 =?utf-8?B?SXNrTE1aMjBBU2lkMVpacERkOXdzUHJFOTZNRHRnYVFFM0w2VFdObXhHWFh5?=
 =?utf-8?B?cldxWFlOT3E1QVlPcG1QaU1WWTl4TnRPOW9EZERIMkF2WVdjR01STDB3Y2Zn?=
 =?utf-8?B?Z0ltc245dWp1d3BYVmNVc2taMEZodzFjZWNzS1FIa1ZzWFRwcGkwS1N6UmMv?=
 =?utf-8?B?K1lPMVYwUVNNY3ozaHBiK2NFTXJkOG4zd0ZZb0xFTmo2clVOZkFNNi82Rm5u?=
 =?utf-8?B?SlZYbndPZlBZUVp0aElLeVNpT2tTaHh1aXNWQldaUnJmZXBVb0E4Rmh2a09j?=
 =?utf-8?B?ZFlBQWMydndsVTRxSzFBZzI1UThEUGxpU1pNekJidzlYODdvV0gwbXZabDh6?=
 =?utf-8?B?ZTZTLzBTU0dPeTFSNXhsM2NSdDVUSEJLeTVCSkdPNTVxVDNURWQvVFVUUVN6?=
 =?utf-8?B?dUdBdmZhMUtFUGJPajJKZnh5cUxjb1kwT3M0dzQ4L0NMbG5RWk1uTHFwUm9Z?=
 =?utf-8?B?U3hEVHFaZThIdU0vaFJ1R2grUHkvY0lkRmJjSkZJdTFrajZTUU5uSzF1Wk9S?=
 =?utf-8?B?UUNmdFAyczU4WmcrWTJvMngvcWVyeEp6Ylo0YWFhVlV4Y1RaejFLb1duRVd6?=
 =?utf-8?B?UC9LZWI1YmtEZEIvalZPVWsxb0VFRG5Eelo0Z0hIM2lKNittak5qZzdTT1k1?=
 =?utf-8?B?VjFmbWJmOGNFLzZuekJmY1ROZTBaMHFMZ2o3Y1VMQTh3c2FQZGVhdU1hUlBj?=
 =?utf-8?B?bjJWeTFuSllIQ0hKV2pvUmNoTDRDV0NxQ3FSUmI5NjF0YzVzak53S2Fadm9i?=
 =?utf-8?B?NUlJdG1SMHF5U2xsTlVTMjZRSFJmNy9jaWdNL2pHVGJDR1NGdjRCZnJNaGRI?=
 =?utf-8?B?bkdmR0Y5L1I3V1VoNDNpV0hQdC91bncxc2VtbkUwRGJyL1NTamRTTHJkbVN5?=
 =?utf-8?B?NU95Z0VLbnN3YW9zL2NCRzRVVHB5K2VlQVUwcU9FNE9CZ1lWKzZBSnlOZ1V6?=
 =?utf-8?B?YkNISU5RUEt1SUhjYk1zREJ5aENmM1hUU0wzNHY5S3p5NWd0MTVYNzh1ZFZy?=
 =?utf-8?B?Qm1IY09ERlFUdmxodVpYQy9JY1k0Z2w0RUs3YXRTVm1pR1NyU1pLTFNTRGJT?=
 =?utf-8?B?MjBXV2ZTK3piU1hlTHFhaC9rTFZIcXYwQWIyQlBYWG56dGhkQ2svRnNTSG9K?=
 =?utf-8?B?elJmbklaTkxOUnJPRzdPdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2xCU0J2a3R1VndHWjVFWXlaNnFTeGxJUVFzdWZRSU5tUEpVdnIyY0NCZTcr?=
 =?utf-8?B?aGw1OU5JTUhBdzUwQ0I5VytnOHNSZGZPTlRjT3ZVWDl5anB1Zkl0N1BLRDNq?=
 =?utf-8?B?V0RadjNTaGdBd2tEdW5yTFgwejdtM1YydkxsUkZBaDVYQzRqbHNZdFhyZGxI?=
 =?utf-8?B?dVU0VUFaNHhTcVpFOEIvZHhkVklLejVxbWw5Ui9EZGU1MkwyT2M3MGNLMU5V?=
 =?utf-8?B?TFhGWVAwVXNHUXlGa2VrM2VHcWIvUFNGUXQvUUdYYldSL3dFbDNWOHd1NXJR?=
 =?utf-8?B?aUk4bDN0R3diVDNHMFpYa3VQQnNDckZuOFJaM0M3YUQ4UVNQdFM3K2pFM3p6?=
 =?utf-8?B?aWFHa3ZEKzlOR0syWCsvZXJRRmw2SGpsdFJyU2JpZndmWTgvTjhsMFlHYnZY?=
 =?utf-8?B?ZnpRNkhNKzUyTHdlSHlZNUR5ZTQ0Qi9uaVp4SEZySEgzVFhQUklVT3VBZkx0?=
 =?utf-8?B?d2l0bWczS2VoVTQwc3FFVm95eFh2Zis2VFp3ak10K3hEMkNVcmcraGQ4TzJj?=
 =?utf-8?B?NlFYWW0yTXo0RVczcm5iRFFHWWc4cElITzg1SDJieTkvaTRKVS9TdEI1ekM0?=
 =?utf-8?B?TEdMMGtBU1BsMmxDKy9xb2VRM3dvL1Q3c0JER3dGck9NRDNzd2JmOGJidnlo?=
 =?utf-8?B?M3hSVzB5ZklHVk1XcisyUE83c0FJelpZb3lqVDJRUEwwU1J2dDNRZEZiTm90?=
 =?utf-8?B?ZXBoa3FSbVRUTlU3T3FScXVDUWdPUFcxTDNyeEtIWEV3bWxyV3dYUm9oeWlm?=
 =?utf-8?B?WUF6OVhBb2FFVTVLWitCV0NMYS9UeEgxZEtDYUFQSkhYM3kwakpGdGc4dEdS?=
 =?utf-8?B?Z0RlYllLT00veTVrS3lJSWFlMUJNTkJUeXhtUW9uSllIbVMxSWtTZGFDNDQ0?=
 =?utf-8?B?WkFTM3JWdjFhdXBTcmFra09nYldDK1hVTDBRODc3YldZV2R5T1k3OEJqWUh3?=
 =?utf-8?B?a2hyZUZWMU13aUM2cW5sZXF6c2hydWFVUTZpU254elhyUW5Ucy9YeE54VTIx?=
 =?utf-8?B?bDBiaEM1TDExdzBubWRYdGdueHVXMkhDZ1ZBTXRFYXY0cXhObUI0azF0NUZM?=
 =?utf-8?B?YUE4NldYMTArTGgwdnBvbE94bnUzemUwZy9JOTUrQmhDVU4vQTgrODMvVlV3?=
 =?utf-8?B?azRqN1dsRVVKM2lRZWVIc1d1Vml1QkJ2OEV4elNURU5SVFByMksrbVVSQjJ1?=
 =?utf-8?B?YW1iaUtsVS9KeE5hdm1nK1hHaUZQSE42WWszMVJqT1pYNHhHMkpOZDVGRXh0?=
 =?utf-8?B?Z09lbS9TMEJJdlc1dFNCZjA1UUVoNEp4YUVCcnl2aklEcHl3TXFldy9yejZO?=
 =?utf-8?B?aFdWRk8rNDRBQmJuUVVlaDJMRVNmVHRGbjVPcjE3NEpDemFvS1B3K0VoYklY?=
 =?utf-8?B?QytadzFrUEhlSGVLMUVKYnI3bFJjSFB1RUQwQmNiSXJsdWw4NUhsdEJBN3lm?=
 =?utf-8?B?Z1g5M0lDN1BTak9UZm1zNy9yMUFkcHZBY3pXWks0M0Zua2NQMWFaT2tKNFV4?=
 =?utf-8?B?aFVTOHJxTlhlU3N0NFdoNUhpOGREMFRqR0w4VUZIaGV0eSs4SDJBblRpNE0z?=
 =?utf-8?B?RzJuOFdqZlErVjVwTkk5TDNycXJqZVcxYUcrTGEwM0FMbExsMmUzQXFhbHFj?=
 =?utf-8?B?THE0S3gxaTJNTWRzSitQNmlsUUZpWDNzTkhLVnErVEpVWmo2bUxpVUJhODNE?=
 =?utf-8?B?U0pNdjN0ckJtMTd5RXU5YkwydlBJYlFtODNaMjM0YXlyaEsxRi9RTEkrR09X?=
 =?utf-8?B?OWx6VytlWWtydzlQOTVmeTBNbDNQZE9acDdYbU9QYjNRQ3VqbStsZUJna094?=
 =?utf-8?B?ZFYza0I3UUFyZG16SnRTeFppa3diWjE3UnZQYmJsczBSUnpPVm9TaWlWbDIy?=
 =?utf-8?B?UVlsdXNMLzlVbElwOWVBVkg0anYyNDlsalRzdlpqdG5nNUVzSkhyckwvMjk2?=
 =?utf-8?B?K0xMM3JpT2MwMjNVTVV0aTBCeUFIUytuSVBDenVqV3RTc3IwS0diN2ZjcUNK?=
 =?utf-8?B?a1REMGdrd1puV2xjb1BlMUZFRnhJc040a0EvQjNGZXNIeE1YdDBhZzQ0SUVI?=
 =?utf-8?B?U0lReUlTL1M2S3VFYkR5MFBWOFpXZUtvK1R3bW9GM0MxR1laYnRoR0lxOVow?=
 =?utf-8?B?WE5lbWd5TDBRZVl5SVFVbDU1bDQ2Qk9Xd2UvYlBCSE53VGVlNmVrQi9FUngx?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c45afc9b-3546-40f4-0d7f-08dcd2a165c2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 20:36:21.9351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwDYMCMHCiaKWUQqIx65Tz7TvuxQr5eGiMYWCt7UFQXv7sk/cNzolZ6sAtDUmfQt3WTk+a6z/Utt5EFtJsWPfEYqS8HVCR3tYXSu3s81Pa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6867
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


> @@ -214,6 +214,24 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>  	}
>  }
>  
> +/**
> + * xe_guc_log_print_dmesg - dump a copy of the GuC log to dmesg
> + * @log: GuC log structure
> + */
> +void xe_guc_log_print_dmesg(struct xe_guc_log *log)
> +{
> +	struct xe_gt *gt = log_to_gt(log);
> +	static int g_count;
> +	struct drm_printer ip = xe_gt_info_printer(gt);
> +	struct drm_printer lp = drm_line_printer(&ip, "Capture", ++g_count);
Increment of non-assigned value "g_count". It is static so zero
allocated but suggest to assign to 0 for clarity.

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

