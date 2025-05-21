Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB05EC2D0CD
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 08:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF2110E6C9;
	Wed, 21 May 2025 08:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JTprAfn/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD0E10E6C9
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 08:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747817561; x=1779353561;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=80pBkhOHbwQ/7Aft7Y5BoPcyzGqOrRz3t9ic1WEsmRA=;
 b=JTprAfn/F26WVG2ENV67mPxPrDvNh2DVOH8OHOYRmNkrDqx9dowvpXpj
 HIS7kWZNlGzbMcW1eCj/D+EoUh6BMlULCc0XwHbh1dgU5/e3UYWzUhHBb
 YvCOBRuCVadGTDfgMT/m8TRsF9fdwyUmYqOUGIq5hMajQbsrlJfU+Eioz
 84oSgR5Ld9O1oivF5LLX785Eo499M1qIRlXtp0+5MFn/hSoGSNCBenTk0
 XTg7LI3ednxz+5bU1sMxO0d9+ueYfHjoCf6z3JQMu8uVenjqWmXjRNwJL
 2GV2WHvVK2ucoTjDa/7PRxpRaYAzzIviQuUVDsGBs2YHbaVB9VlwMRSQU Q==;
X-CSE-ConnectionGUID: FZ+XgM/RQI2F4xRUY6T8Pg==
X-CSE-MsgGUID: +G4mRPllRXGYd50BRkWXug==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49771928"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49771928"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 01:52:40 -0700
X-CSE-ConnectionGUID: nxGM6Ln3TJOB5RNs/WpdVA==
X-CSE-MsgGUID: gV5EFxvJQtiL2o6xJz1yTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140493692"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 01:52:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 01:52:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 01:52:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 01:52:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nidAuXik9e2SYUp28hH4Jxly81nwq4QpRqYQywN3u5QcUs5yRL4bM4/pW/nrN5RfEt0b+3zs6QqCSbQF4m/FRdF/IJnhXHpFP6sUjL5OfvFFjsw3i8h9DUUkvOWp/GrZ4x5wPTWO67iOqmJgJpZkobBvTm5G0/xrD3MDZCpRODdfwZXKHuCUI6KsR47ekK2Bi3tM1jPVyGFfDclr8e2agz4jAWlcO8HkdUEtxscaZZfkdA73Rks4ypGPL0ODgdbM/XFMQPPCPIG6WnrGk6jRXeSHJKxR2ILRrLikxYenKIzljFJSTaf6spXhJi8uGZZmUer1KWaJVTnhIrT131fiSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5po8qji/Uw0BbuaSIiIjrUFMcN+LveWIqHH6DM15jB0=;
 b=GoC09B5fzkViLHFio26oRW54z5/4Wa81Z1PkQwY4zgY/NvhbzRukxbkxIvL3fUzxVDE2kOQKp49NrriouAubBGtZLyFJO7SlLnBQ5/sE0wQcugCUQnHBlpWTyJKhmWMUjezRkGw5NRpfolTx+f/mdtFJ1dOBeggcsA8GDzuxSyotWcIXksa0srqWlDyXYNOlAEEVBEkn0x0ACgYeXiDv1xodCIqnrPOyOnHMF/fW6w4Q40WOe92V8dIJIXt2ZoCQTCQT+Rn8Ry8nrTUqH6rOpzrMk6JVmNkK/CXM1TJCzFL3UbPkhFSCFr1oPKGPd5FvuOI7nR5YpfYwYNJye4ywqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ2PR11MB7646.namprd11.prod.outlook.com (2603:10b6:a03:4c3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Wed, 21 May
 2025 08:52:37 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8699.022; Wed, 21 May 2025
 08:52:37 +0000
Message-ID: <ecdd5c6b-10b6-4377-b53e-af79fd7e3d2e@intel.com>
Date: Wed, 21 May 2025 14:22:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 28/32] drm/xe/uapi: Add flag for consulting madvise
 hints on svm prefetch
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-29-himal.prasad.ghimiray@intel.com>
 <aCUFlk/jxBJJwETa@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aCUFlk/jxBJJwETa@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::18) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ2PR11MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: b5c688c6-d02f-4d94-7f0d-08dd9844d5d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFJ5M0phdlVCcWx6T1pNaitEWnJuTy9TTHlPL3piSnErYXdGb2crUW9rd2dF?=
 =?utf-8?B?d2hkQnZCQVR3ejRPOWphT2ZHM040cmdnTzRkajVrQk5vMlYzSnZvSUVWTEUz?=
 =?utf-8?B?c2JWSHh1SFRWOURMMEZwekxiVmNpdEFkV3BqblVCRkwzRmZBUmFpY1M4Z3N2?=
 =?utf-8?B?eXZxQWlyanl4MHVsQzh1bURsUWgxcXZ6aURSZldQL1hLdmxNUEg5VnMzenNM?=
 =?utf-8?B?ZEFSaXAxU2l3ZGNuYUJJckJNbTE0aEtaRUhCQjJjMDQ4N2NObHgveW85Q2ht?=
 =?utf-8?B?MERpOXRhbkxIYWsvYWpPS2taN2hpUzQyRTl0clBQYnBRZ08waTV2ZCt2ZFFh?=
 =?utf-8?B?dXdaNCtRVUhGWXI1aWVDcFBiRTg1RVpXeE9mSGJBeXB4UmpSaWhpV1puTFBJ?=
 =?utf-8?B?LzA1aFJDMitJUHpCOEcvVUhQaHJCaGx5YVAxM0dudDVWMzNZa0hmOU8wbkVz?=
 =?utf-8?B?Z2czbUNRM2lERmdBQnB4N0VibHZOQVNPSy9yVnoyemVHMHBhNjhsb0s4Nkxw?=
 =?utf-8?B?ZjhmQVJwVWR1NnpqQ1h3K2l5SzRveVh3Sld3QmxURUtiNEloOVNyRVplRkFs?=
 =?utf-8?B?R281dEVpRjU2aGRaN0JSQ1pFUi81TVByNzYvemljREdyejEvbmdwU2Z3TTBa?=
 =?utf-8?B?Q2x2Vk42MXZ1dmxjQlFoRVdXbW5YSnV2L3E4MlNBVkpxeW8zQlQwaFQ3WVRB?=
 =?utf-8?B?WnlMSU41REFJaW5VSUZndkZwYnc0VEJpejFMTVY4aU43a2FxNEp5QnpWaFVs?=
 =?utf-8?B?b0UrODV5VFdhdGtYYVpjUG9tR2hPWDF3dXRwOUI5T1V2UEFNdTZOUlIrWERl?=
 =?utf-8?B?cVlTUkZMK2hnWW93V0wyQzRRMDk5WDB2SVNNSVBrb0YwbnpMRCtkclRiN2pu?=
 =?utf-8?B?Zy96RGJ4ZExaYzBQSkRXQXpnV3ZOa1ZBNGF0YnFFV0RKNTI0SjhlYjE1K2ZK?=
 =?utf-8?B?MDIzeDF6MDE5cVoyT3U2UnhMVyt5THJxdkFXbytzaWorMnpzU2s5Y05BYTdU?=
 =?utf-8?B?Z2hOeXRKYUpFZnd5ZldBQTNCSlFicVludGNHN0dMT3NVeUtsZkh0dDk2R05F?=
 =?utf-8?B?YzE4TEs0RDM1a3hlMytWT2RvZFlwM0dxYTVOSk9tVThmWGpDQTNJNDIzd1BO?=
 =?utf-8?B?RW5EN2xxQjhtWDRuekxMbVducmN3bkJCNFdpQ3R6SWpZYlJ4a3dDN2FUaVRC?=
 =?utf-8?B?dHRHUU5pN1NxSVlGdFcwNXFMa0VJNVBzZGhTb0xGYk9GRG5aUTJpQXJQTU9K?=
 =?utf-8?B?M2V5RUpGcG1VL0ZvcTZaUGZWTk1MQWwxeHExUFFkaDA3MUhaeEVoTDVFL3M4?=
 =?utf-8?B?N0JaNmJuTWdaUGJCelNUNGlnMi9SbEJaMEp3UVNXNFlJaTNFN00wTkdrZkVn?=
 =?utf-8?B?YkRMNXhDaHNSbXBLelF0WVI1WkVEUHJQK3NjM3pNRVRPeGRlQ3cxUXJPWGRK?=
 =?utf-8?B?M3lTdW9LWk5SUUFMeWxncUsxa3dOcy9LSjlFVHZVaUtPRzZLSmk3RVdRVld0?=
 =?utf-8?B?Y01xUENzL1d1S2d6cjFMeUpNbGQ1cFVyTW8xSWlJcmdUeXg1MzVIckgyVjhW?=
 =?utf-8?B?TFRLc3pzYmJnWlNSWWk3QmJxbm1vbytuUklOb2hEbmhBT2tTME92YjdGblFj?=
 =?utf-8?B?bDFsWXVRUXpzM25mcmIwTGNpcWVkb1JZZWl5TlFwclRjQ2NFLzlHNFNFRTdI?=
 =?utf-8?B?cVd3TzhlbXJiQ1B0N2swVEpWRU9SdUIwdzM1ekJkN3luVCsxcXVYWDZRV3NN?=
 =?utf-8?B?a0FsZndqVnZDaHRiM1M1cWJlc1I0L0kweTRiR1pRS3k2eFE0aXp5eXZHTXlH?=
 =?utf-8?B?cHBpbkdHdHh2VkV6UmRvdDBzNmgrc1g5azR2TmpzQlpaSG1VMjVad29yY3hL?=
 =?utf-8?B?cm5hT0h3TGlBUDh3dThGWkI3RWNsd3dLazBnTCtoTUZxV1haVk95MXhraUFO?=
 =?utf-8?Q?4iyEGj0AcLs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SElPSFJOS3ovTGZCUGxXWUpsY3BRYW1SZ1pWRWNXUllJYUs3TFJTbkZLNFRL?=
 =?utf-8?B?bVRQcnVjQ3V0S3BiQkxDYnprT0JvTEZTK3JiTGRPVDh0WXVDY1oxZUFqT0NG?=
 =?utf-8?B?aEFZQ3FVczNmQ2xZTUVBc2dBVlV3K2JIeU1TSUI3Wmp6VnVtWThxY1V1R3cy?=
 =?utf-8?B?WGFKNjBDcmJmejI1eFpkOHgwQnAvcm5SNFBOcnNNUlArNmZPUWxmNkVMMEdL?=
 =?utf-8?B?bURsZGxwaGs1VTFabVNWY2FRY08vVUxQSWFyT3hiekhOSC9SVTlsbW1xVzhQ?=
 =?utf-8?B?M2luOVY1NUxiVlViWWVjWkQ0RFYvdUtoVngwbFNwREZtTU44SVVCNkROKzlM?=
 =?utf-8?B?UmNCR0lScHZWV1VOYTRSUEFiSXZxUEFZakRFS08rV0I0RW9jSGMzWEFjYUdL?=
 =?utf-8?B?dWVLNkovL0c4eFF0Vjlub1hwUmNJWnFxOWxqcHRTd3Eyanp0OUlVQ1hYaHI5?=
 =?utf-8?B?aTdjMG5qOXpsUTZkSXF2MWFBV0pIblpzNlVsMXNmcHhCOTZZcmxEY1ZDSDlZ?=
 =?utf-8?B?ZytPTnhSRW1zRHhCa3lJWitXcEY2QVdjNlU3U2xvNWZVanpQZ3I5ajNvNVR5?=
 =?utf-8?B?MVM1ekpWTG40UjA1bzU5Mk1JbXRVVFpRVjF3bkdkK2kyV0JUaFZiNjdiczhT?=
 =?utf-8?B?NFVPcCsxci9uWjZNZm40ZTBPelVNOHZyWjVHOUUyVkdPTjMwOHE1dkFmcGE4?=
 =?utf-8?B?Q3FLVzhtQ0JPb3RZTVJ6Wm5LMmw3Y2FtNkxNVHNHZDU0TUxSK2I3K05DSms4?=
 =?utf-8?B?dGdmeWIvSTFIOTY0YkxUYW4veFVsVldqRm1MdWg2NVFiY0F0Z2FBVk9vNmlw?=
 =?utf-8?B?RWtCa0FPTU81cGtDZE1PUyt5T2Z4Q0U5azRNZXpmVlkxL2JOZmZsd2JpM1lU?=
 =?utf-8?B?d3N0V0k2ODZHTjVWWVJUSWtYRHNoWGtkWjBScTFDZzkyYTRHUk01aWsxSHht?=
 =?utf-8?B?WUE2VnlseFdHaEJoN1FLVmdrZjhnQTg3cXRpeFBMU29IYkxTRWRqdVJCejJV?=
 =?utf-8?B?TUI4UEVaVUtMMzJ1Si9KSmhkY2JjRlM5TnpTSnAycDdqcEQ1Y2VnaFE1c1BT?=
 =?utf-8?B?c1JhTnIrZmt5bHJuTmVsRmMzbjBWM2tkeEdMU01ITXg1NDZOUHgvWHdkWUFZ?=
 =?utf-8?B?OXdVYW5OTWhqVW5MQjBUb21iY1ovdmcwaGlkaHF6Vy9mcTJQc0NCSmVnVXp2?=
 =?utf-8?B?L0JucjF2clpYUHBFTnl5V1pXaU5uSmYvLzdSOUJUbUUzcjhSNm9mVm9mRG80?=
 =?utf-8?B?WkhMU2dwNDNCVURpckRrNnVOR0RabmNVRFQ3b2ZIZ3MrQ2o3SmU2SE9nV244?=
 =?utf-8?B?cWt5ZGNackdlVzNJb0JhMGd6RytqeTVBR0MvaXROUnRrNHYwenlCdytETG5J?=
 =?utf-8?B?ZS8zekhHZzdyalhkWkhEVVE4R2szU3lHRFlHK1BmNmpNQmNXYjAzT1J5QkhZ?=
 =?utf-8?B?MUpHOHY4STRTWDhoSnQ4QWtnSTVsbDlhRlJZSGRCVENaalg1VysvZzl5ZzVx?=
 =?utf-8?B?TlhlMlJVWlJpRmVrYjVia1pHR0VjMkZtZTI3RndYOStvMEVrTkYrMHhPdXhO?=
 =?utf-8?B?emFxN2FoVWRNZFk4SmtvVzRzdmtHWmE1dUYzamYyY0F2UG9wY1NiN0VzSGFV?=
 =?utf-8?B?ZjNZczJZbUlLRndMSlJid3FtTUpKQ3dyV21vNWlKbGVmQ3dnMWkzcm1qdyt4?=
 =?utf-8?B?TCtydDlBZUVaS1V6OVpxa2pNRzJITFlvQTFvWHNrWEVvQ013MEhXNnFDQ1dK?=
 =?utf-8?B?Qkg0ZjVSVHpsUzdaemZsNmF6NThnelhBUFFKWE1ZM3NhbkZJWVF1T0EzQlhK?=
 =?utf-8?B?dnFQMmVFS3ZTZ1BRTFB1WUdmNTNVa1hLYklSSGljUlJ6TUhxelowV2Z6RklG?=
 =?utf-8?B?TlQreDlTczcxclRUdnZzeXlnWlI2T0x3UDZMT09WNWJaZkE4UXdOOVluRjlM?=
 =?utf-8?B?Zmt5anpyQTQ3YWpZSEoyaTdHdmtOZjFrVXZpT0FiR1llWFBmUHlxTyt3dUVG?=
 =?utf-8?B?TmEwWHFweE8vTmNBM2EzQW1uSHNCcWZDZlhxaFJsaFBjbGlTdFNqMzRFOVRO?=
 =?utf-8?B?MjkwREF6ZENPdDlaWDJXR0laTnFmcFByczVtdUtsMEFId3lkOS9JOXllTzlG?=
 =?utf-8?B?RGdCZVVTa0x4Y1R0U0pEcHNxUEp4Z0RQZU1MV2FGNitqdkFYcVdOQ2ljTm5n?=
 =?utf-8?Q?aTQH9TZXi7toBMA3THdDvlM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c688c6-d02f-4d94-7f0d-08dd9844d5d5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 08:52:37.2104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1rStdvGE0AEbdjXDWWJ1+69oNDdtBTwyU6s7mvTW44Fqywvd8i5kYefow5/F4t4ptvvYlXh6eVIRE8R+ftBTH5UPEsgqeAsRU4Sq4t1Vew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7646
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



On 15-05-2025 02:35, Matthew Brost wrote:
> On Mon, Apr 07, 2025 at 03:47:15PM +0530, Himal Prasad Ghimiray wrote:
>> Introduce flag DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC to ensure prefetching
>> in madvise-advised memory regions
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   include/uapi/drm/xe_drm.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index aaf515df3a83..ab96dee25f6c 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1111,6 +1111,7 @@ struct drm_xe_vm_bind_op {
>>   	/** @flags: Bind flags */
>>   	__u32 flags;
>>   
>> +#define DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC	-1
> 
> Replied to wrong version before. Kernel doc.
> 
> Otherwise uAPI LGTM.

Thanks

> 
> Matt
> 
>>   	/**
>>   	 * @prefetch_mem_region_instance: Memory region to prefetch VMA to.
>>   	 * It is a region instance, not a mask.
>> -- 
>> 2.34.1
>>

