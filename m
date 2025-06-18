Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814BCC71157
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 06:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3859910E7AF;
	Wed, 18 Jun 2025 06:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V0eCbO4t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883C310E7AF
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 06:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750229284; x=1781765284;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=l5MJ7EMFNwhKTkCMq48urw07EAwsef4vx6TRBr1lNE0=;
 b=V0eCbO4t1YlGrC9ZyImuxC2nGgsI0/vW1vKC7A0fLLzMnhHCN2S0HXyl
 o7CENZLFsRcxJvIx0UIus5EFNH+m62Qa+fGe2NJQGNIP9YOG8pBMANLci
 OxvvP8/0XZzJAHerpiAuwtCch/dfWbrnO+9yqKbZz3hH0juZfhdX4aVnh
 OM0ijJ1B74f27p15MHPYbXeC93tBhNEawBqKAXLhQ5Q7aM6PAxy3Gs0RB
 gnsujN+tnTNsb1MWhvFk+waLB5h42I9p+5CipVxcR+HS/xAuuv4LQ8puc
 By+CN4DS1RfJ6r0daWXuXFSEOr74u42DDRHgPqeP5vNDQ/74F+TKZtqoZ g==;
X-CSE-ConnectionGUID: jnHUSLORRwmX4E4PIRoGWg==
X-CSE-MsgGUID: 3Dt+9TZIRyyb2soEZUD+Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="51658940"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="51658940"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 23:48:04 -0700
X-CSE-ConnectionGUID: jbvb3B5VSc6pUzDBLi11Dw==
X-CSE-MsgGUID: DmRbQYQ/Q669OcniDemZug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="149607528"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 23:48:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 23:48:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 23:48:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.74) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 23:48:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wh9Rj08h7Fjepy6ocb+d+g1Xyrx3u9lq34mjBK7FuWSULm7EYk1CzoxBDBsx9QqgHCU1YE+rUg4H97ymFSduvrYGENPPiDjEJMLGomc9Tpi4fidOg4kYl1QWf5EFItR1Gyne8GHeeHl4rd6DLbOGGTO/VqmAC0WnxiaBTn2D3eSq53W20LUMbIVej1imSy6P3f+mVzt6kZ46jGovxKxyGhEcIebhSEWQfXQxwASSgCBBx/toIOJ8vAVQ+lshTQh6zyy4+iluI+FxyI1eW4dR93KeUKk8OtvnTORNAuGtJqFHH2sbEeoeTju2ihOKJhyWiYAbUPJmrEcPlrbxd1eSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XojYwB13YAXzuYzsp64SXewiCz10NQJaHaENn0ocHgM=;
 b=kqasA4NJw4ftbJhmKY78u5K+NCD2fcySSWhZNl65xP+YQIRxpks1vum9uifAtHdn5GltcQxYAPWz0xUcOH72FzTT6ELllLvqglXpPGjmypjqHEi9U/4VY8CS3HMN9p9eGWsqmsnIPT8x+4KUDyDGeqmZscyynUS2Mu4pvs1vMvQiGdNG6fjG1axx2Ku5g7Ru72MjcfaAlr5DYQjku6Pr3VHH5Sin6riejB6sv6qsOmYlbwyU7Q6QDZyYu/ncYBBjWckZSsxOoRPbhoaggNGZyEKr+5eeQzzSHrLaH5Fh8HoIK3uT+D5f22QUIDRUjqUX7vDFMHp43/wgBw/IXCfYmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by LV3PR11MB8694.namprd11.prod.outlook.com (2603:10b6:408:21b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 06:47:47 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%4]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 06:47:47 +0000
Message-ID: <90bc1e1c-e38d-4336-ac71-e99749cbeb0a@intel.com>
Date: Wed, 18 Jun 2025 12:17:41 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_WildCat?=
 =?UTF-8?Q?_Lake_support?=
To: <intel-xe@lists.freedesktop.org>
References: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
 <175001798264.80433.15695367238368136170@1538d3639d33>
Content-Language: en-US
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
In-Reply-To: <175001798264.80433.15695367238368136170@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::15) To IA1PR11MB6266.namprd11.prod.outlook.com
 (2603:10b6:208:3e6::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6266:EE_|LV3PR11MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e74632c-f906-48ff-4a4f-08ddae3408df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjFwVC9ST3BCMUJqMkpuRCtSWUJybFpER2h0VXNBQkNFajRXZnVsY2FLc2pT?=
 =?utf-8?B?VjZVdkZVM3hjeWF2M2hibWt1TDZUbk1lTmJFOGFsdkwyZ1J0WDJNc0MyRHpS?=
 =?utf-8?B?WHFsakdDa2l4Qkc5WG1ScFIrMEZTVzV6bFhqMzBnWkJ1N0xKZnlvMnFVazlm?=
 =?utf-8?B?SmVZcnVnN2NQQUd0anFkeGpweTZzbU5mOEZGeG5oMFU3T09JN0kzcUxjejdD?=
 =?utf-8?B?M0l4SzNwRUNXRmMwcS9kditvamxJRHZVbEFvbnJaNlhDK3NvUVFaSmVNS2xU?=
 =?utf-8?B?b3BKTVAzS1lNR3BzekFWR0xGUnpaVU9MU1dRYnc5Mlgydzk1TEZpczBFajNo?=
 =?utf-8?B?dVZ2dGJoLzUwZkVXakdwdXRSTUF3WGlTc3NUb250dTkwS1pNSFFYTDBwMnJP?=
 =?utf-8?B?ZCtJZjQ2b3k0cFFlbWRmNHpWdk9PR1hoN3luNEord3F2bE1OQWRYaVVwQld6?=
 =?utf-8?B?NEQ5Rzc3TXZuUWhya2NsV3pqVUZzd2tYMnBYdEJqaWRmdXV3a2tLc1FpY0M5?=
 =?utf-8?B?dXV6WlRiYXhKa3Nlays4c2xvNHZOSlVRajFha25yN3E0VGI5cm13WXg3MFEx?=
 =?utf-8?B?a0NnY09aczlsRi95c1pQbk54TGRsK2NuYVN3RER3VmZIakNzWVVpVU1reXhs?=
 =?utf-8?B?NmVWMENPWklaSHZVc2NDZVIyWVRRaE5Cc2ttWEZKMGtENE9waEhHSTh1bmVq?=
 =?utf-8?B?N0JWMkc2anArNVArU05lbFJadHM0SkxEUXNCVHBtbkZSUVlDYldIYWZwTWtH?=
 =?utf-8?B?dUlCMFppSkJnQ3NqN0Q3SWZyQUU3UFFDV2RyRkx2TFF4ekJFblQrdTZSZWpY?=
 =?utf-8?B?bDBJRU5NckRnUkhEKzJERDNPbU5VU1hRZTlPNWp6QkloOWxjenBDQWFxcGFG?=
 =?utf-8?B?VFZDaVJyZm1HRWxVZHUzcjN6UUtyUW11eDRsQ2ZJZFJ3bDBiWTkwL0ZONWtV?=
 =?utf-8?B?WmZVUHE4d1p6Tm1CdVVkQk9rejA4aFhDaWtnVXFkY0lPVGtEc2EvU013M1gy?=
 =?utf-8?B?bzViWVMxVU84dFNyeC9KeUEyUFVweUdmQTl4ZnN4ZEpWaFJ4a2pSYmtXaVRW?=
 =?utf-8?B?UVhJZ3l2NHdQblFHUW9vVS83OXBWNUlYd1NCQVQrSHppV3pDdXdPSHdIRnMx?=
 =?utf-8?B?N3RBM1dLWTJkVnJQZ3lEOXFURWZNbWkyNnlQVHJzRWVzSG1LTWEyT09nK0Qz?=
 =?utf-8?B?VjFBa2pIWDZZN0k5V2lBTVphK0JMaEpETW5JN09ZUlhlQVpET0pOLzhSaWhR?=
 =?utf-8?B?YXNodXFVT1lIZURqK0tRVjNiWStudmlKUWdFcGZKYTdHbGQ1N1V3VUVranp1?=
 =?utf-8?B?M2ZUYjhaTTZrWVBPYnBLNVVJb0kyM3NkdE9OMmRsTGxwKzlLMDFqNUliT1NR?=
 =?utf-8?B?L2hVQXd0eVFJMFlHWlFkWktLbkJYMjN1Z1VhUzg3QUFNdUJRZmtUR0RmbjlI?=
 =?utf-8?B?eGxKNFZtM09SSHNSOVVPSFVFRDNMTnhleVhscjJ3RzltZVZDczBxcTF4ckFZ?=
 =?utf-8?B?S1krQUJVZE1KdnZ6cHU5VzJRNFd4T2o2cm8vYW9JbXBBR3RyWVprZ3lMbW9V?=
 =?utf-8?B?QWY3UXAvWUtJUkFrSEZsN00yQ2RUK2ZpUyt1OS9ScnR2OGZqdi9IWk4zV2pU?=
 =?utf-8?B?c0lhdlNSUFdkajJpYW9pSGJFN1V6MGpjWW5jVE85aWVubWpXS1lyeUdCU0VY?=
 =?utf-8?B?MHN5Z20zY2ltTStMOHNlMmZZdjFpK05YdkNwSTdzbjl6MnhTdGgrbVZyUWow?=
 =?utf-8?B?UlByMmtvVlVPSFdXRVpkeWZCMnV6bXYxNlRJSTVweDVNTXpRUUFsRzdGOWRs?=
 =?utf-8?Q?1/+X3TVnSaExtfMeZUdZfEn+5RxMYdYrSGa04=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dERDeVVwcjRsSGJLYWs4TzZlYWo0OFRzVXFrZ0tWV3JKbFl0OFhOc2Njd0V5?=
 =?utf-8?B?djZ1K2cxOENQYWRpay9IbkJDLzkwMXBNZ0Jxbkd4UjZjeEc2V2Z3Zjd6TUVp?=
 =?utf-8?B?RHBaa1ZqSS9BRVQwb0I2Z3Qxb0FpdENjTUVLRllEbG96MG5tdHQwYThtYWhl?=
 =?utf-8?B?NTBUMTJuTWJVL3JjanFtK2pUUzZPMm9YM3NzcUVhY2Z4dE5UbmpLM2hCVCsr?=
 =?utf-8?B?NXlQb0N0MTNseGhTRVJtZTlpdk9NMVVXRDRPS2treGVGQ05oUjVRcHZlNjNx?=
 =?utf-8?B?YklMTmt1cXVIa3dOZEg1RHJ0Rk95TXVPNjBaSm1iRVJ0U1o1VXdqU3JUdWhD?=
 =?utf-8?B?Y2d1c1VOMTZCV3pqbzlNTlJFVi9QWmJhaFY1TllZWkNhVjc3anR6K1JTeDBr?=
 =?utf-8?B?eWxRTEhJR2tyM0Fhei9LQVhFTWJWOExoVG1kb0gyY09oWWlSVDdZY3VUU3RK?=
 =?utf-8?B?YnkyYmVUWVBka0dEdEp6Skg2VC9PMElBN3NFMGdYT3loR3JBRC91VXhjNHAz?=
 =?utf-8?B?WUkxbzdRbkI0cjVRVUZUS2lXK0NDS2NIYmduYzFxM29MbE4vQitDTzVxTVV5?=
 =?utf-8?B?czh6Y05qTkQ5QkdtdVRta3lEa042TVQ1Ym9pVS9vWE1qU3pvVHg2TEVDRTEw?=
 =?utf-8?B?TmNWNlBxbXJPVE1jRUs2RzRUbG02MWtzeXRNOHZoakl4ZzBMdkc5MlJvdk9U?=
 =?utf-8?B?WW5TT1cvSWhuRzNaN3phRG5RSEt1VEdtQjhQZXo1QlZNU3plV0MrZkFUSktw?=
 =?utf-8?B?bEVKRDFOeTY5Ni91cWQzd203M2plVjN6SWZvREF2TDdTODZiM3JVdmp0b0JK?=
 =?utf-8?B?WnBLWUgrdHBZV0w3eEt1cjFnZTBKbCtOcURhSEtsWE1ZQnA4L0daVHlVYkJR?=
 =?utf-8?B?SVMySlZJR2laTzRpa1RCU2xOVGJnL01ZYTQ2UVVJMkJqb1lyUXJiUi9lRDUy?=
 =?utf-8?B?SGFUV1dtKzJZQlZ3akl2YmVsQXRRWTlBNFNSSk05aFY1V0w3dDlsRmF3YVA2?=
 =?utf-8?B?QXliS0NXUytITXJvSFlRdG9NUkJoekxJM05GVTJkYUNmT3I5b3dxeEswRWta?=
 =?utf-8?B?Z0tOMnV1N3ZIZmVBQ2FWK0FoTWhXbm9LM1BxYll3TExxbi8zcmp2RkZaTXJB?=
 =?utf-8?B?cm5hbUVDOVRQUktHSDFiNDhxd3JsL1dhMkhrYWVBVENITFBHalVkQUxQNFJa?=
 =?utf-8?B?YWhqT3VRK1kvcTFpOVRGQnFFbWx5WE8xODBrb1NrNGZDRFNZd3FEVzBwaGFK?=
 =?utf-8?B?bDdodnBNc29vRm8vSk8yWGp3Qmh5cjgyYXNScVQzTmYrV1hhMFZnTkhKK0Y3?=
 =?utf-8?B?VEhIcWs5N2JDcUpkTVU2VGFlODV0NFdscUZIL3dBL2VoWG1IeDdCV1JvekxG?=
 =?utf-8?B?TFRKYjVQNStZQnNDVm5POEFMclk3aFNRcmVQOGh0VWRYTGxQUWd3bXo3cndJ?=
 =?utf-8?B?Y3ZtLy9PRzZ0bnl4TWdWTWFpR3EvLzQrcTB0TTQvR3lrMkRpZ1ZXaUNzQm8w?=
 =?utf-8?B?VFQ5QjFCeUh6cTNWT2NzMlNvZU9pUVlBeEdhaGRMc0Q2RWlKb3NVN1hRVHJa?=
 =?utf-8?B?UzQ2cERqTjNIb2dEZW5iemh1TEFYKzdtc1pLUnhPU1hvalFXTytyMmJRcXQ1?=
 =?utf-8?B?aTN2a1RkQU1iSmcyQ1IrYXpBM0JxV2dZbGs5dGt4QUs2T3VGVkNaNG9tN25I?=
 =?utf-8?B?UkxtUHZqNFNWR3JoREozMnV0YU9PRE45Sy9UYUpmQ2Nmc1ZNVkZVRllqbFZw?=
 =?utf-8?B?UnlUMG92L0RGbDV5VGZEZHc3MHAwR1ZnTFRTc1FWejg1bEZJYWswZ1h2RUQ0?=
 =?utf-8?B?S200TzBYU3ZnSk5uZ0NNMkY5LzJCZFJac3BZWWloNlo5bWNxWmRTUnViMDE5?=
 =?utf-8?B?T2NkdmtFdm1GdXdIOENhRmVtZktvaGZsek8zUytKN25MV2txbW5LdDR5SVdJ?=
 =?utf-8?B?Kzh3UkhEdHpuTnIxOHo3VURGYVZxRThFbVNNVS9NbTVleldMSWxzNjBFaWRB?=
 =?utf-8?B?NUNoMy9YVGNud2E1R2FGOEc4ZnVsLzdQakpWUjVsRjkrYUl4bkJoWEQ0dVh4?=
 =?utf-8?B?YjhXQVBISkF5b2tGZERZMkFzT29lUlU2ckxzaGdscmk5MU1HYnJXYTlqdFIw?=
 =?utf-8?B?eG5Va0NuVWo0R2t1MDdpMHAyV1ZBa3JYTWxyM3YrampxSVY0UlNBZlFHdVph?=
 =?utf-8?B?SFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e74632c-f906-48ff-4a4f-08ddae3408df
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 06:47:47.2084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THWPiIBdg47mI4X/8YJHV0JsaVDe+D36L7AYsIAqWcSA3NqO546V00gGOvAg2yxm7JInwNpIsEs2OwXor+MTNSVf/BXnsNmdhv4eizNRRfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8694
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



On 16-Jun-25 1:36 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	Add WildCat Lake support
> *URL:*	https://patchwork.freedesktop.org/series/150255/ <https:// 
> patchwork.freedesktop.org/series/150255/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/ 
> index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-3252-4d016d6e602638e0ebc3895331224e057508c07a_FULL -> xe-
>   pw-150255v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-150255v1_FULL absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-150255v1_FULL, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
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
> Here are the unknown changes that may have been introduced in xe- 
> pw-150255v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1:
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/
>         igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         adlp-9/igt@kms_flip@flip-vs-absolute-wf_vblank@d-hdmi-a1.html>
> 
> 
>         Warnings
> 
>   * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-9/
>         igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-
>         random.html> (Intel XE#5214 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5214>) -> DMESG-FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-1/
>         igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-
>         random.html> +1 other test dmesg-fail
> 
>
These issue are not affected by thie above series, We can ignore it.
Dnyaneshwar,
>     Known issues
> 
> Here are the changes found in xe-pw-150255v1_FULL that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-270:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_big_fb@linear-32bpp-
>         rotate-270.html> (Intel XE#2327 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2327>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_big_fb@x-
>         tiled-32bpp-rotate-270.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-
>         flip.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-150255v1/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-
>         stride-64bpp-rotate-180-async-flip.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>)
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_big_fb@y-tiled-
>         addfb-size-overflow.html> (Intel XE#610 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_big_fb@yf-
>         tiled-8bpp-rotate-270.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1 other test
>         skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-
>         hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/
>         igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html> -
>          > SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-150255v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-
>         displays-3840x2160p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_bw@connected-linear-
>         tiling-3-displays-1920x1080p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_bw@connected-
>         linear-tiling-4-displays-3840x2160p.html> (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_ccs@bad-aux-
>         stride-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +3 other
>         tests skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_ccs@bad-pixel-
>         format-y-tiled-ccs@pipe-d-hdmi-a-1.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1
>         other test skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-c-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_ccs@bad-
>         pixel-format-y-tiled-gen12-rc-ccs@pipe-c-dp-4.html> (Intel
>         XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +13 other tests skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_ccs@bad-
>         pixel-format-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) +3 other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_ccs@bad-
>         rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html> (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +7 other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_ccs@bad-
>         rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html> (Intel
>         XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +5 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_ccs@crc-primary-
>         suspend-y-tiled-gen12-rc-ccs-cc.html> (Intel XE#3432 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html>
>         (Intel XE#3124 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3124>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-
>         a-6.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1727> / Intel XE#3113 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>   *
> 
>     igt@kms_cdclk@mode-transition:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@kms_cdclk@mode-transition.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
>         igt@kms_cdclk@mode-transition.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +8 other
>         tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-adlp-6/igt@kms_cdclk@mode-
>         transition@pipe-a-hdmi-a-1.html> (Intel XE#4417 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4417>) +2 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-blue-to-red:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_chamelium_color@ctm-
>         blue-to-red.html> (Intel XE#2325 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-
>         hpd-after-suspend.html> (Intel XE#2252 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +2 other
>         tests skip
>   *
> 
>     igt@kms_content_protection@srm@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-2/
>         igt@kms_content_protection@srm@pipe-a-dp-2.html> (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
>         igt@kms_content_protection@uevent.html> (Intel XE#1188 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1188>) +1 other test
>         fail
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-32x32:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_cursor_crc@cursor-
>         onscreen-32x32.html> (Intel XE#2320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_cursor_crc@cursor-
>         sliding-512x170.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>   *
> 
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/
>         igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         (Intel XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) +4 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>     transitions-varying-size:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_cursor_legacy@short-
>         busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#2286 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2286>)
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_fbcon_fbt@fbc-
>         suspend.html> (Intel XE#4156 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4156>)
>   *
> 
>     igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-3/
>         igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         bmg-4/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html>
>         (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2882>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a6-dp4.html>
>         -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-150255v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-blocking-wf-
>         vblank@ab-hdmi-a6-dp4.html> (Intel XE#886 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +1 other test fail
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/
>         igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-
>         dp4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-150255v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-
>         vblank-interruptible@bd-hdmi-a6-dp4.html> (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3321 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3321>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/
>         igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-
>         dp4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-150255v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-
>         vblank-interruptible@cd-hdmi-a6-dp4.html> (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +5
>         other tests fail
>   *
> 
>     igt@kms_flip@2x-plain-flip:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/
>         igt@kms_flip@2x-plain-flip.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-6/
>         igt@kms_flip@2x-plain-flip.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +4 other
>         tests skip
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/
>         igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         adlp-9/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html>
>         (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2882>) +2 other tests fail
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-2/
>         igt@kms_flip@flip-vs-suspend-interruptible.html> -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html> (Intel
>         XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2049> / Intel XE#2597 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2597>) +1 other test incomplete
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/
>         igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-150255v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-
>         interruptible@c-dp4.html> (Intel XE#2049 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2049> / Intel
>         XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-
>     upscaling@pipe-a-valid-mode:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-adlp-6/
>         igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-
>         upscaling@pipe-a-valid-mode.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3 other tests
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-5/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>         upscaling.html> (Intel XE#2293 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2293> / Intel XE#2380 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +1 other test
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>     upscaling@pipe-a-valid-mode:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-5/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>         upscaling@pipe-a-valid-mode.html> (Intel XE#2293 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) +1 other test
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
>         igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-
>         render.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4141>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-
>         render.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2311>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-
>         blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +3 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html>
>         (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2313>) +8 other tests skip
>   *
> 
>     igt@kms_hdr@brightness-with-hdr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
>         igt@kms_hdr@brightness-with-hdr.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_hdr@static-swap:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/
>         igt@kms_hdr@static-swap.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-6/
>         igt@kms_hdr@static-swap.html> (Intel XE#1503 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) +1 other test
>         skip
>   *
> 
>     igt@kms_joiner@basic-force-ultra-joiner:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@kms_joiner@basic-
>         force-ultra-joiner.html> (Intel XE#2925 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>   *
> 
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_joiner@invalid-
>         modeset-ultra-joiner.html> (Intel XE#2927 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>   *
> 
>     igt@kms_lease@lease-get:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@kms_lease@lease-get.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
>         igt@kms_lease@lease-get.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +4 other tests skip
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-y:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_plane_multiple@2x-
>         tiling-y.html> (Intel XE#5021 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5021>)
>   *
> 
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
>         igt@kms_plane_scaling@plane-upscale-factor-0-25-with-
>         modifiers.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +19 other
>         tests skip
>   *
> 
>     igt@kms_pm_dc@dc5-retention-flops:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_pm_dc@dc5-retention-
>         flops.html> (Intel XE#3309 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3309>)
>   *
> 
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-
>         plane-move-continuous-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>   *
> 
>     igt@kms_psr2_su@page_flip-xrgb8888:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
>         igt@kms_psr2_su@page_flip-xrgb8888.html> (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_psr@fbc-psr2-
>         primary-blt.html> (Intel XE#2234 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2234> / Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850>) +2 other tests skip
>   *
> 
>     igt@kms_psr@pr-sprite-plane-onoff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@kms_psr@pr-
>         sprite-plane-onoff.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +1
>         other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
>         igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@kms_setmode@basic-clone-single-crtc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@kms_setmode@basic-clone-
>         single-crtc.html> (Intel XE#1435 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>   *
> 
>     igt@xe_compute_preempt@compute-preempt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
>         igt@xe_compute_preempt@compute-preempt.html> (Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>) +1 other test skip
>   *
> 
>     igt@xe_eudebug@basic-vm-bind:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@xe_eudebug@basic-vm-
>         bind.html> (Intel XE#4837 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4837>) +1 other test skip
>   *
> 
>     igt@xe_eudebug@basic-vm-bind-extended-discovery:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_eudebug@basic-
>         vm-bind-extended-discovery.html> (Intel XE#4837 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +2 other
>         tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@xe_exec_basic@multigpu-
>         many-execqueues-many-vm-null-defer-mmap.html> (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +3
>         other tests skip
>   *
> 
>     igt@xe_exec_basic@no-exec-bindexecqueue-rebind:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-436/igt@xe_exec_basic@no-
>         exec-bindexecqueue-rebind.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +104 other
>         tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-invalid-fault:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
>         igt@xe_exec_fault_mode@twice-invalid-fault.html> (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +2
>         other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-
>     new-huge-nomemset:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-2/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-
>         mmap-new-huge-nomemset.html> (Intel XE#4943 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +5 other
>         tests skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-shared-vm-many-large-
>     execqueues-new-bo-map-nomemset:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-lnl-6/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-large-
>         execqueues-new-bo-map-nomemset.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-lnl-2/
>         igt@xe_exec_system_allocator@threads-shared-vm-many-large-
>         execqueues-new-bo-map-nomemset.html> (Intel XE#5018 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5018>) +1 other test
>         fail
>   *
> 
>     igt@xe_exec_system_allocator@twice-mmap-remap-dontunmap:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
>         igt@xe_exec_system_allocator@twice-mmap-remap-dontunmap.html>
>         (Intel XE#4915 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4915>) +37 other tests skip
>   *
> 
>     igt@xe_module_load@load:
> 
>       o shard-dg2-set2: (PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-
>         dg2-464/igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-464/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-436/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@xe_module_load@load.html>) -> (PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-464/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-464/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-464/
>         igt@xe_module_load@load.html>, SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-464/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-464/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-435/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-433/
>         igt@xe_module_load@load.html>) (Intel XE#378 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>   *
> 
>     igt@xe_oa@create-destroy-userspace-config:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-lnl-4/
>         igt@xe_oa@create-destroy-userspace-config.html> -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         lnl-3/igt@xe_oa@create-destroy-userspace-config.html> (Intel
>         XE#2594 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594>)
>   *
> 
>     igt@xe_oa@polling-small-buf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@xe_oa@polling-
>         small-buf.html> (Intel XE#2541 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2541> / Intel XE#3573 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +1 other test
>         skip
>   *
> 
>     igt@xe_pm@s2idle-d3cold-basic-exec:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-433/igt@xe_pm@s2idle-
>         d3cold-basic-exec.html> (Intel XE#2284 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@s3-basic:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
>         igt@xe_pm@s3-basic.html> -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-6/igt@xe_pm@s3-
>         basic.html> (Intel XE#569 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/569>) +1 other test incomplete
>   *
> 
>     igt@xe_pm@s4-vm-bind-userptr:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-3/
>         igt@xe_pm@s4-vm-bind-userptr.html> -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-9/
>         igt@xe_pm@s4-vm-bind-userptr.html> (Intel XE#1794 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pmu@gt-frequency:
> 
>       o shard-adlp: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-adlp-6/igt@xe_pmu@gt-
>         frequency.html> (Intel XE#5214 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5214>) +1 other test abort
>   *
> 
>     igt@xe_pxp@pxp-termination-key-update-post-suspend:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-5/igt@xe_pxp@pxp-termination-
>         key-update-post-suspend.html> (Intel XE#4733 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) +1 other test
>         skip
>   *
> 
>     igt@xe_sriov_flr@flr-each-isolation:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-2/igt@xe_sriov_flr@flr-each-
>         isolation.html> (Intel XE#3342 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3342>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_addfb_basic@bad-pitch-63:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_addfb_basic@bad-pitch-63.html> (Intel XE#4950 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         adlp-6/igt@kms_addfb_basic@bad-pitch-63.html> +18 other tests pass
>   *
> 
>     igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-1:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-
>         adlp-4/igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-
>         hdmi-a-1.html> (Intel XE#4543 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4543>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/
>         igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-
>         a-1.html> +1 other test pass
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
>         igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>         (Intel XE#2314 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2314> / Intel XE#2894 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2894>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/
>         igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-
>         dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#3113 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3113> / Intel XE#3124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3124>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         +1 other test pass
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-
>         dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-
>         hdmi-a-6.html> (Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727> / Intel XE#2705 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel
>         XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3113> / Intel XE#4212 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4212> / Intel XE#4345 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4345> / Intel
>         XE#4522 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4522>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150255v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-
>         tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html>
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
>         igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-
>         varying-size.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-
>         varying-size.html> +2 other tests pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms-on-nop:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
>         igt@kms_flip@2x-flip-vs-dpms-on-nop.html> (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
>         shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop.html> +5 other
>         tests pass
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-rte:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_frontbuffer_tracking@fbc-1p-rte.html> (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
>         shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-rte.html> +2
>         other tests pass
>   *
> 
>     igt@kms_hdr@static-toggle:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
>         igt@kms_hdr@static-toggle.html> (Intel XE#1503 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         bmg-2/igt@kms_hdr@static-toggle.html> +1 other test pass
>   *
> 
>     igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
>         igt@kms_setmode@invalid-clone-single-crtc-stealing.html> (Intel
>         XE#1435 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1435>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150255v1/shard-bmg-2/igt@kms_setmode@invalid-clone-
>         single-crtc-stealing.html>
>   *
> 
>     igt@kms_vrr@negative-basic:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
>         igt@kms_vrr@negative-basic.html> (Intel XE#1499 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         bmg-4/igt@kms_vrr@negative-basic.html>
>   *
> 
>     {igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-
>     drm_xe_engine_class_compute}:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
>         igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-
>         drm_xe_engine_class_compute.html> (Intel XE#3970 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3970>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         bmg-5/igt@xe_compute_preempt@compute-preempt-many-vram-
>         evict@engine-drm_xe_engine_class_compute.html> +1 other test pass
>   *
> 
>     igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-
>     nomemset:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-7/
>         igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-
>         unmap-nomemset.html> -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-4/
>         igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-
>         unmap-nomemset.html>
>   *
> 
>     igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-
>         dg2-435/igt@xe_exec_threads@threads-mixed-fd-userptr-
>         invalidate.html> -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-dg2-435/
>         igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html>
>   *
> 
>     igt@xe_pm@s2idle-basic:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-
>         adlp-3/igt@xe_pm@s2idle-basic.html> (Intel XE#2953 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2953> / Intel
>         XE#4173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4173>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150255v1/shard-adlp-9/igt@xe_pm@s2idle-basic.html>
>   *
> 
>     igt@xe_pm@s3-vm-bind-userptr:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
>         igt@xe_pm@s3-vm-bind-userptr.html> (Intel XE#569 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/569>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         bmg-2/igt@xe_pm@s3-vm-bind-userptr.html>
>   *
> 
>     igt@xe_vm@large-misaligned-binds-2147483648:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@xe_vm@large-misaligned-binds-2147483648.html> (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
>         shard-adlp-6/igt@xe_vm@large-misaligned-binds-2147483648.html>
>         +29 other tests pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@core_hotunplug@hotrebind-lateclose:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@core_hotunplug@hotrebind-lateclose.html> (Intel XE#4963
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963>) ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-150255v1/shard-adlp-6/igt@core_hotunplug@hotrebind-
>         lateclose.html> (Intel XE#2953 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2953> / Intel XE#4173 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4173>)
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-180:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_big_fb@4-tiled-32bpp-rotate-180.html> (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
>         shard-adlp-6/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html>
>         (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1124>)
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_big_fb@linear-32bpp-rotate-90.html> (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
>         shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-90.html> (Intel
>         XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/316>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_big_fb@yf-tiled-addfb-size-overflow.html> (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
>         shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         (Intel XE#610 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/610>)
>   *
> 
>     igt@kms_bw@linear-tiling-4-displays-1920x1080p:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_bw@linear-tiling-4-displays-1920x1080p.html> (Intel
>         XE#4950 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4950>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150255v1/shard-adlp-6/igt@kms_bw@linear-tiling-4-
>         displays-1920x1080p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html> (Intel
>         XE#4947 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4947>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150255v1/shard-adlp-6/igt@kms_ccs@bad-rotation-90-y-
>         tiled-gen12-rc-ccs-cc.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1
>         other test skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html> (Intel
>         XE#4947 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4947>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150255v1/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-
>         basic-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +1 other test
>         skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-
>         dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#2705 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2705> / Intel XE#3113 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3113> / Intel
>         XE#4212 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4212> / Intel XE#4345 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4345> / Intel XE#4522 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4522>) -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#3113 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3113> / Intel XE#3124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3124> / Intel
>         XE#4345 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345>)
>   *
> 
>     igt@kms_cdclk@mode-transition:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_cdclk@mode-transition.html> (Intel XE#4947 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         adlp-6/igt@kms_cdclk@mode-transition.html> (Intel XE#4417
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417> /
>         Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>)
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html> (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
>         shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html>
>         (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/373>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html> (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
>         shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_content_protection@atomic-dpms:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-7/
>         igt@kms_content_protection@atomic-dpms.html> (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
>         shard-bmg-6/igt@kms_content_protection@atomic-dpms.html> (Intel
>         XE#2341 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>   *
> 
>     igt@kms_content_protection@srm:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
>         igt@kms_content_protection@srm.html> (Intel XE#2341 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         bmg-2/igt@kms_content_protection@srm.html> (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_fbcon_fbt@psr:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_fbcon_fbt@psr.html> (Intel XE#4947 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         adlp-6/igt@kms_fbcon_fbt@psr.html> (Intel XE#776 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>   *
> 
>     igt@kms_flip@2x-plain-flip-interruptible:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_flip@2x-plain-flip-interruptible.html> (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
>         shard-adlp-6/igt@kms_flip@2x-plain-flip-interruptible.html>
>         (Intel XE#310 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/310>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#4947 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4947>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150255v1/shard-adlp-6/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>         downscaling.html> (Intel XE#4947 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-
>         yftile-downscaling.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2 other tests
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#4947 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4947>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-adlp-6/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2311>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150255v1/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2312>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2311>) +11 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#4947 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4947>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-adlp-6/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/656>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-
>         dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-
>         pgflip-blt.html> (Intel XE#4842 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4842>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-
>         blt.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4208>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#4141 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4141>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-
>         mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-
>         mmap-wc.html> (Intel XE#4141 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4141>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2351> / Intel XE#4947 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-
>         shrfb-draw-blt.html> (Intel XE#651 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-
>         onoff.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2351> / Intel XE#4947 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-
>         indfb-onoff.html> (Intel XE#656 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/656>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-
>         blt.html> (Intel XE#4947 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4947>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-adlp-6/
>         igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150255v1/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-
>         render.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2313>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150255v1/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +9 other tests skip
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_plane_scaling@intel-max-src-size.html> (Intel XE#4950
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
>         shard-adlp-6/igt@kms_plane_scaling@intel-max-src-size.html>
>         (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>) +1 other test skip
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#4947 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4947>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150255v1/shard-adlp-6/igt@kms_psr2_sf@fbc-psr2-primary-
>         plane-update-sf-dmg-area.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>   *
> 
>     igt@kms_psr@fbc-pr-primary-page-flip:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_psr@fbc-pr-primary-page-flip.html> (Intel XE#4947
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
>         shard-adlp-6/igt@kms_psr@fbc-pr-primary-page-flip.html> (Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) +3 other tests skip
>   *
> 
>     igt@kms_psr@psr-sprite-render:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@kms_psr@psr-sprite-render.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
>         shard-dg2-436/igt@kms_psr@psr-sprite-render.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html> (Intel
>         XE#4950 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4950>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150255v1/shard-adlp-6/igt@kms_rotation_crc@primary-4-
>         tiled-reflect-x-180.html> (Intel XE#1127 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@xe_ccs@suspend-resume:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@xe_ccs@suspend-resume.html> (Intel XE#4945 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         adlp-6/igt@xe_ccs@suspend-resume.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#488
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/488>)
>   *
> 
>     igt@xe_eudebug@read-metadata:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@xe_eudebug@read-metadata.html> (Intel XE#4945 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         adlp-6/igt@xe_eudebug@read-metadata.html> (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +1
>         other test skip
>   *
> 
>     igt@xe_evict@evict-large-cm:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@xe_evict@evict-large-cm.html> (Intel XE#4945 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         adlp-6/igt@xe_evict@evict-large-cm.html> (Intel XE#261 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>   *
> 
>     igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html> (Intel
>         XE#4945 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4945>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150255v1/shard-adlp-6/igt@xe_exec_fault_mode@many-
>         bindexecqueue-rebind.html> (Intel XE#288 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +3 other tests
>         skip
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html> (Intel
>         XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-150255v1/shard-dg2-436/igt@xe_exec_fault_mode@many-
>         bindexecqueue-rebind.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_exec_system_allocator@processes-evict-malloc:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@xe_exec_system_allocator@processes-evict-malloc.html> (Intel
>         XE#4945 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4945>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150255v1/shard-adlp-6/
>         igt@xe_exec_system_allocator@processes-evict-malloc.html> (Intel
>         XE#4915 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4915>) +60 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@threads-many-large-mmap-mlock:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@xe_exec_system_allocator@threads-many-large-mmap-mlock.html>
>         (Intel XE#4915 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4915>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150255v1/shard-dg2-436/
>         igt@xe_exec_system_allocator@threads-many-large-mmap-mlock.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +14 other tests skip
>   *
> 
>     igt@xe_oa@non-privileged-map-oa-buffer:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@xe_oa@non-privileged-map-oa-buffer.html> (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
>         shard-adlp-6/igt@xe_oa@non-privileged-map-oa-buffer.html> (Intel
>         XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2541> / Intel XE#3573 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3573>)
>   *
> 
>     igt@xe_oa@syncs-ufence-wait-cfg:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@xe_oa@syncs-ufence-wait-cfg.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541> / Intel
>         XE#3573 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3573> / Intel XE#4501 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4501>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-dg2-436/
>         igt@xe_oa@syncs-ufence-wait-cfg.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@xe_oa@syncs-ufence-wait-cfg.html> (Intel XE#4945 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         adlp-6/igt@xe_oa@syncs-ufence-wait-cfg.html> (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541> /
>         Intel XE#3573 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3573> / Intel XE#4501 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4501>)
>   *
> 
>     igt@xe_pm@d3cold-mmap-vram:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@xe_pm@d3cold-mmap-vram.html> (Intel XE#2284 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
>         shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@xe_pm@d3cold-mmap-vram.html> (Intel XE#4945 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         adlp-6/igt@xe_pm@d3cold-mmap-vram.html> (Intel XE#2284 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pmu@engine-activity-all-load-idle:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-
>         adlp-9/igt@xe_pmu@engine-activity-all-load-idle.html> (Intel
>         XE#5214 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5214>) -> ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150255v1/shard-adlp-4/igt@xe_pmu@engine-activity-all-
>         load-idle.html> (Intel XE#5214 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5214>) +4 other tests abort
>   *
> 
>     igt@xe_pmu@engine-activity-load:
> 
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@xe_pmu@engine-activity-load.html> (Intel XE#5214 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5214>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         adlp-2/igt@xe_pmu@engine-activity-load.html> (Intel XE#5214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5214>) +1
>         other test dmesg-warn
>   *
> 
>     igt@xe_pmu@gt-frequency:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-435/
>         igt@xe_pmu@gt-frequency.html> (Intel XE#4835 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4835>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         dg2-435/igt@xe_pmu@gt-frequency.html> (Intel XE#4819 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4819>) +1 other test
>         fail
>   *
> 
>     igt@xe_pxp@display-pxp-fb:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@xe_pxp@display-pxp-fb.html> (Intel XE#4945 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         adlp-6/igt@xe_pxp@display-pxp-fb.html> (Intel XE#4733 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4733>)
>   *
> 
>     igt@xe_query@multigpu-query-gt-list:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@xe_query@multigpu-query-gt-list.html> (Intel XE#4945
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
>         shard-adlp-6/igt@xe_query@multigpu-query-gt-list.html> (Intel
>         XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-dg2-433/
>         igt@xe_query@multigpu-query-gt-list.html> (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/
>         shard-dg2-436/igt@xe_query@multigpu-query-gt-list.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_spin_batch@spin-mem-copy:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3252-4d016d6e602638e0ebc3895331224e057508c07a/shard-adlp-4/
>         igt@xe_spin_batch@spin-mem-copy.html> (Intel XE#4945 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4945>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150255v1/shard-
>         adlp-6/igt@xe_spin_batch@spin-mem-copy.html> (Intel XE#4821
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * Linux: xe-3252-4d016d6e602638e0ebc3895331224e057508c07a -> xe-
>     pw-150255v1
> 
> IGT_8411: d5b5d2bb4f8795a98ea58376a128b74f654b7ec1 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-3252-4d016d6e602638e0ebc3895331224e057508c07a: 
> 4d016d6e602638e0ebc3895331224e057508c07a
> xe-pw-150255v1: 150255v1
> 

