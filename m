Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10ACFE7FDC2
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 19:47:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EF010E276;
	Mon,  2 Feb 2026 19:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHGtSOM4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CF510E276
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 19:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770061645; x=1801597645;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E3Z3ypZeTaZf4/cKgj3P6gOWHjKw/ox0pnHuFBTPWUw=;
 b=OHGtSOM4orqGtWhfGi2HHYm+BUTvzeIUO0WJLuzzb1Bs3aP3rjuiqDc1
 73Gr4YT4F5qjL2pH4+UgtZEyjSlhx0iGCfMM0TYsj04sW7C+yibfMpJmF
 niD6z0c/4fHP3RdsX1aewKVHrFU11yPgLHtq522etNzKV1fIjgvw+D19c
 OsFpU+z3eFKTxYsI2arsHTIIhN4LEBbrefxnsWzqmQVCPCR8LhZ25mceM
 0Kj7SdlurqNWYXvJMt5lqMbZienHiU62zrn9reVEOUAnQJtrQfdr9xsDB
 HJMmPXrFmIzJF7XJOxpk5lcZFR3UQ1rZzRMaJxHPE1P0gaOjUoIG73fcz A==;
X-CSE-ConnectionGUID: xunxo8VxSaiZLJOEDuuwzw==
X-CSE-MsgGUID: eaeXSaq0RG+JDxydYcOKAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71266643"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="71266643"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 11:47:25 -0800
X-CSE-ConnectionGUID: b5kg8OkTQuuyPlLC9bqLQw==
X-CSE-MsgGUID: t3dHj+gNRTSRz2VCB036bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="208718435"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 11:47:25 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 11:47:24 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 11:47:24 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 11:47:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiFH6kDS2f8PRE9STUaBEXshB39jgnnHoCbbjzgbVeMt27HIWnceas9kHxqk+zTRJ9TbR/wJjlFYyWd/btIvTCEABofMrhz+yEP6iDZXYPe1xMxSRWWXzJDnRku6EAboKEWVYKPjlvyKEThSyYvWMWx0NyZcxcSYrNx09NFLze13KnZcMi43vkFhhe6Bd67tqDvWMyw/a9gjFd+YWLhI2prs7pWVpSxEJsPPMLb+eUDxVRqAQHr9gMJQMBUDbJdyWePrnapzzel8djP96TdUaPeBU2qGbAtPkPtgkYCQohRFhf9FuPqCPw05JtCa3FBIhEFS296ABtBrCAo51UQ0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=va4aTDqNGTKcBESEy4rcXl8h7eRhJ8Rxvp6aOsDUM0s=;
 b=ttDQ0NXZ7h6WdrZMuy7qpxsWfqYuzeH8YEgBUxd6pfLnQgAvRK77WVapQLBj/iQ45o6lFvjRTfdDjCdv8MP1eE0McIp4uw3PJqSZufy45VfMJAnMrMHrfFVaFe1QBYtVMGA5+9gtCmE/AV86lu416mAGLTJjf15Vl4ELXNh7/N1jTELlJsgyboGx1mxmopRyeIoU/WQWazjwULMBFer7wtS4p4JL2deQ2N05dz6GWtyJ6dETekDeHEodLvN1FXrT6MzMmwao3sWh0nayHik7DLkV+WH8SgP/bm1GO5S3amYYI1m8NgjeUI6AdAIBlqeX4SlRDl5QTQn0OIsniBeJnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ2PR11MB7713.namprd11.prod.outlook.com (2603:10b6:a03:4f6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Mon, 2 Feb
 2026 19:47:19 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 19:47:19 +0000
Message-ID: <1d343871-4872-4ad8-860c-6f75312eb9f0@intel.com>
Date: Mon, 2 Feb 2026 11:47:18 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure
 on reset
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <vinay.belgaumkar@intel.com>, <nishanth.p.reddy@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>
References: <20260202105313.3338094-3-sk.anirban@intel.com>
 <20260202105313.3338094-4-sk.anirban@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260202105313.3338094-4-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::15) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ2PR11MB7713:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cd3f1e0-0ed2-40f6-98b4-08de6293e022
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXhMZ3FNdDN5QTBxaGgraGRnRXhQOENOelhIWXZmNmFtSWxwRng5ZitvQWhC?=
 =?utf-8?B?Z0Z6YXFyanZ3eGxZYVVITnpiYms5YWh1VG1uOU9zWDV1M3ByM0pSY0xuQlcr?=
 =?utf-8?B?OUt6Qjl4UHRpVXk3MzQzVC9CSU14SUlac2hSTzVEZHp5WW1XL2JEN0dEdnFS?=
 =?utf-8?B?bVczOEgzUVRDaWEwT2pubFlWYUpEeml3YzE2aEswdXM5V0dDdW9oRWU4L2JR?=
 =?utf-8?B?VnVvZzc3UmwxK1lhbkhjYXVUdStPSmVLYlZXdnl4ajNTSzBrMUJNNEdGK0lO?=
 =?utf-8?B?aG8valdtai9zV0ptV0FXNURIRHl0cXhCY2N0UjdueWJRbVlyeitCcjFWay93?=
 =?utf-8?B?cjRXMEFLc1Y3NUhpTXZSWWFyN3VOVEdobENxSDZoelpCY1oraktkMVJadzVY?=
 =?utf-8?B?a2xLQnJpU2hsN01hT3FVWHFCVU5zejRCbmlFcUh0T2lDV1I4SWZTU2ltaDll?=
 =?utf-8?B?VFppcS9rTlZUV2JkWlRCaDg4Q2RVaWJPVGtYUlBPZldDR3pGVlNyeGc4WWxU?=
 =?utf-8?B?THgxejlzL0t0U1FTRXpnRzdWd3o0Vi9mVW1rdWllQUMvTE9hcENEZTZ6NEh2?=
 =?utf-8?B?K3JXN040dGhVMktMMEQ3bDUyRnJZOVowTlltL0ZRWFRJR00wM2dCVkhWcnpu?=
 =?utf-8?B?eURoTndVUGRnREdjTWpuMVEyZWdvaGNjN2g0U2FwM2dXTmsyS1ozRkZzQVV1?=
 =?utf-8?B?N0FKa1Z0bVd4dzV3NklZK0Fjb0ZuQ2ZhT2dKbUYybXhtNUJYbm11NDd0SFls?=
 =?utf-8?B?ZURHcndwdGFTbWkwTThRZ1RMaUllVGVuc2o1VFdhdlZmWDdJR3JXSk1RMndF?=
 =?utf-8?B?WHlibjJlb0hvc3EzVlVESkFtbkNTbnhiOXp1VU85cktUVzdFdmQrckNrRzh0?=
 =?utf-8?B?bk9VZ0pFbU85SDJWeGdTbXBWMkh2b0dOajk2T0lqQmJ2bURiaEtldlhaU0tT?=
 =?utf-8?B?eVZ1VVpoNHBzMmpHUktOSGRaWlVvVVlneWN1ZlBQSzRLd2Y5L3B0TWJLQk02?=
 =?utf-8?B?SGRCOVUzd094Mlk2Mk5YcFFKdWJhdHAwNDcwM1JYeGxJZHk1aERnbjdOamlt?=
 =?utf-8?B?eXRac0VRd05JMVhhNkNWT3g4d1NVWS9hTWFVVnV3ajVzK3JuR3JocnhpZk1j?=
 =?utf-8?B?RDJYUWxOV2o2WGlQUVpUd0Rtc09udVBxejBFUU9hSXhnR1NLN04zUGRyOEpU?=
 =?utf-8?B?bHVsNkFOU2RsMVgrTEcwcDFBZkUvekNkYlBPUkNXbEVLMnVkaExqSjd2Rk82?=
 =?utf-8?B?YWMzRnFhQmxFQ1lnTWIyMEVTLzRQWTJXdW91ak5YTWFNRU1qeTk2RnJqM2dj?=
 =?utf-8?B?azZQa3hYUFhWQUUwNzkwT3RXTEZBZ3RLbngxYXY5cFVpRG0xcU1COE1YblVW?=
 =?utf-8?B?WDhSTnpDSzdvYUlLVk5TdUxOQTlRU1h1Qi91TzZtODlMSXFrWGxUdStGMlBj?=
 =?utf-8?B?SDlqYmp6WVpMWVBpUmNpUDJjUFAwUkg1dXdGZDFleE1wU0FIQzJSVWpOWnZU?=
 =?utf-8?B?MTljMHRVYmkzTTVZTlZOTUVYVFplNnY4NzY3R25neDZRZCs3UWl6cGlhZC83?=
 =?utf-8?B?OE4yMGVsVk52NS9zNkd4SlRVZjRYL1VPN1AxVEI3Umo0QXNkWmVpanN3eWRw?=
 =?utf-8?B?Ykt5WjhSWlA3OG9VMDFTZU5wK2ZNYzVtK2ppbFpzNndOak1wRlhOQVlVRmZV?=
 =?utf-8?B?NWRvQXIxQ0F1eHV6QTZSUmQyS3B6TlY3M2wvY3J3WkI3eGZCVHd5bDdTeWN5?=
 =?utf-8?B?ZDdLTXlybFpzbkdjbFcxRFlSRTA1amVETUpQOXY1NDQ0OFZ2OExGY1FLdkFL?=
 =?utf-8?B?YVVMcU1EWWtXU1FFeXFSM3hwZXorSnNsUUlEUjIzR3ZINDkyUGdQeFZ6OEha?=
 =?utf-8?B?bmRRZllvcXRzMk1vZ2pEZmxIVGxyemdWTFQ5UFZPZjYyNTRQdllVb2FEejZY?=
 =?utf-8?B?TzY3WmRSOXdoVU45MHpvOHY2RmJnREdZMkhpTzVZYjVvMm14cndpMGtHaDgy?=
 =?utf-8?B?bnN3K3ExVlpJeXN0WEdqN0xJaGlyQTNNcW9nZWhmM0FLdnVWMS95anpBcFB4?=
 =?utf-8?B?OHROYTEvMnQyc1VyWWpLTnJzM0VFVlF1UFZwMmY0VzFQbmtIYm9JU2psUHBp?=
 =?utf-8?Q?KUD0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0lycGdSMjVzai95alZnU2JTWHd6TXlHUWpHVk95elMzS1dhbnFrY2JsTnVq?=
 =?utf-8?B?REpnNHlDV3M1UE5WNTc4S0FLNm9FNk9UbDhiT2s2R1Y1RXN0U3phTzdTTVRG?=
 =?utf-8?B?MW5VMmVKcVlIYnZkYjQ5NFhxUnFXQjhqc0xyOVg0N2FuelQyVFpKSHpva2NX?=
 =?utf-8?B?ajlhRXJvcG1VOS9BaFB4V0FVSUQ0T2gyVEZVczBMWnhnVEhPbXlKRGtqM3Zi?=
 =?utf-8?B?c0JhNk9rcVhOWHFJV05RdFBjcURLTzc3di8rZ2dXakR6ZTU5R0Z2WVdxVFhG?=
 =?utf-8?B?ZlBsMnhBUDNQd2ZPU1F5YUpxTUFsZFlBTWVPVzlVZ2lrM29ma1FFTDVhOFBZ?=
 =?utf-8?B?eWNSeStFNnVNVVdwblpLbDZ5N2hMTGd6Q1d3WWs0akVNcG12M2dwM3A5VUlm?=
 =?utf-8?B?MERPaXZwa1l2UnNOOUMxa3pvMFFUQkZMNXFzM0JuOC9YSk10bGdQMlFwMHp3?=
 =?utf-8?B?RDc0UnlBdXhaaFRrRnFOVlNPQzFTeFlPRzN6dVFmYnR2SEY3cldId0pwUi9s?=
 =?utf-8?B?Yno0MnljaWt3aWp3QldSRDRjSHFjUE03N2VaeXo3WmtFaGJTQ1NCMHg3cDBu?=
 =?utf-8?B?MkZoTUY0bHpWclpPZkNFbVpaTSt0UzYyVmVkYmM0WWhsRDdDNld4cjA1Rk9K?=
 =?utf-8?B?cFJxR3U5S0hKTEZnV1VsZGFzaVJqNVFocFJBcEtsMU5pdFV2aXJFWmZOU3Zk?=
 =?utf-8?B?WE9Xc1k1OGNKN3laMkUwODdOTUszdGs2ZEh5VDVDdVVGSk9FdHZjQVcyRTda?=
 =?utf-8?B?dWFoeGFsNjNnQWg2cDIyNzFtazg2VitLQ1l5VDVaQVZsUytHN3RnUEFHL285?=
 =?utf-8?B?WGszTWYxOFJwRzN0a1pZbnorajBSTEtvRmdIbzJWdURybGdLUU5Cbkg3NVJJ?=
 =?utf-8?B?cE9GNTc0bjBIVGF5dW5lREVYdUYvY3dHY1htK00yMjVwTS9qTDA2bVN1WFlO?=
 =?utf-8?B?b2tuVCtwSzlUQmNta2pmZ3lydUttMS93bVJ0cGFlMmQ3eWJ1VmM4cVNNKytm?=
 =?utf-8?B?L3lLMWRXSkxaeVJ6MGk5OWlIQTdid0Z5VURHaWxva1JpZnkwb3d0Sjd5ZXgw?=
 =?utf-8?B?TWNkdVl5Rm9zd3NjcnlPQUdQL1FuTExNaXVDTlpOU1pRNDVLeEZUU2t2ZkpW?=
 =?utf-8?B?NTlDa29DVjdlazFHMDZqeHJNSXZQWXhhdWlaV2t2WVc3M0hMSEIyb2FBMlJX?=
 =?utf-8?B?ckFIQnR4OUJTQ2xVRWJVZHJCODBjbWdDMEoyMHliSTBpSDdZTDVUeGpYNnNN?=
 =?utf-8?B?NFBKckIraFkyek1OZSs5eW9NbFFoRG9PdDJjKzdSa0R1QkkwWDkwMGtvY0lu?=
 =?utf-8?B?ejVaOHluNURZTEEzM0FkMGpzMisvMkkrcUFReHV1N0k5cHk2Nm1pcWtqb0Rr?=
 =?utf-8?B?Mm5GdU5MTDhnUlRpSDZzVEtpMTR2eHNsd2RGdUdBN2xMbFVHOFMrd0NodCtT?=
 =?utf-8?B?aDU1SDFSbVBmR3p5OHRsSGUzWmExcWJzRlVwai95ckhUcjZWT0pGS1ZaakEy?=
 =?utf-8?B?QjZOSHR5OWlqTjM4bUZaYnQwdk9NR3h3QVUvclJIeWIrN1U5RlYvS2V1WTE3?=
 =?utf-8?B?VVVXSVpmbVJuVS9ZUWlYZjFQTzQ2elRva0VBdkRmc3UvcjBpS00rdFVkM0ht?=
 =?utf-8?B?ckRSczdtakF4ZC9hODBlbzVzWWh2ZUhzaTFWWElWSHBSN0JtREIwUDZUemZz?=
 =?utf-8?B?WGd0bFdsTjFUM3F6NnJ6L2FMRUdIL1hPeXhYcjN3c1k2QlBBbG5KRmh3aFNV?=
 =?utf-8?B?dzkzMWJBUGJvZlNzdEVycVlmR1BOdUFiUk9Fd0o2dVQwbFZNc0c3RnZJdUs1?=
 =?utf-8?B?TXV4Yyt5RHFBVGlaSERDTDhuSnFKLy9PcG5EQVB5bVczSE9iUmVBTlpSZkhO?=
 =?utf-8?B?VGFEUlh6clF1UmpBdWRwVUlVT3MyMWJwUVNwNWtEcFc4ekNTbEtISlRwT09k?=
 =?utf-8?B?OVFTc2UvRC9DMkZoZlFDVFBxVm1tUzRRbVRxMTJTVzhrdWtQTjJJa2pWWi9l?=
 =?utf-8?B?eWFMWHpKZ1dlZUtMVXhyc001YzZaMzc3MVh4T01MSUl5MmZkZGFQeEFtSEpI?=
 =?utf-8?B?eXBrNjdlWVRQZGJJRFNUSm15KzllQTdZTUtWTlA4RHZBZEFUeUhodkNKVXh2?=
 =?utf-8?B?a3lrMzJSemFvdlBxNUZZVEdrTkc2d0FWb1dWUFpRb01WdDgvZVQ0NW5Ebld4?=
 =?utf-8?B?R0ZWaHVOSlAxVjEvdUREUVlHbmZhRUszTEpMUi9RTmNjK3dGVnoveEJtNXNZ?=
 =?utf-8?B?RHlTdUF4dVFmVzl2bUFqaGNGTkFZd3Nxd1NhTWtLT1R5UjVHN0M0c1JUTk1P?=
 =?utf-8?B?MkVvT1dVMmZGWTRKbTVpTG5PMGxLMDRCU0FGVGhXSXg5b0RRTWdick5kb1Rm?=
 =?utf-8?Q?HV5dOugqGfKidmys=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd3f1e0-0ed2-40f6-98b4-08de6293e022
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:47:19.5196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XD7sy0WzP3vTf5GA9whpFQQx0Mjvd4cuAEnX/SVwDbGb4+N8Bxknr+mmFX16t6llRFKNuoe7z5570GKNdPsij8UKijkubEqPHWcUIGhzfbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7713
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



On 2/2/2026 2:53 AM, Sk Anirban wrote:
> Prevent GuC firmware DMA failures during GuC-only reset by disabling
> idle flow and verifying SRAM handling completion. Without this, reset
> can be issued while SRAM handler is copying WOPCM to SRAM,
> causing GuC HW to get stuck.
>
> v2: Modify error message (Badal)
>      Rename reg bit name (Daniele)
>      Update WA skip condition (Daniele)
>      Update SRAM handling logic (Daniele)
> v3: Reorder WA call (Badal)
>      Wait for GuC ready status (Daniele)
> v4: Update reg name (Badal)
>      Add comment (Daniele)
>      Add extended graphics version (Daniele)
>      Modify rules
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 ++++++
>   drivers/gpu/drm/xe/xe_guc.c           | 38 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  3 +++
>   3 files changed, 49 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 87984713dd12..5faac8316b66 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -40,6 +40,9 @@
>   #define   GS_BOOTROM_JUMP_PASSED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>   #define   GS_MIA_IN_RESET			REG_BIT(0)
>   
> +#define BOOT_HASH_CHK				XE_REG(0xc010)
> +#define   GUC_BOOT_UKERNEL_VALID		REG_BIT(31)
> +
>   #define GUC_HEADER_INFO				XE_REG(0xc014)
>   
>   #define GUC_WOPCM_SIZE				XE_REG(0xc050)
> @@ -83,7 +86,12 @@
>   #define   GUC_WOPCM_OFFSET_MASK			REG_GENMASK(31, GUC_WOPCM_OFFSET_SHIFT)
>   #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
>   #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
> +
> +#define GUC_SRAM_STATUS				XE_REG(0xc398)
> +#define   GUC_SRAM_HANDLING_MASK		REG_GENMASK(8, 7)
> +
>   #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
> +#define   GUC_IDLE_FLOW_DISABLE			REG_BIT(31)
>   #define GUC_PMTIMESTAMP_LO			XE_REG(0xc3e8)
>   #define GUC_PMTIMESTAMP_HI			XE_REG(0xc3ec)
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 2efc4678fa73..369b5a8f129a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -911,6 +911,41 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>   	return xe_guc_submit_enable(guc);
>   }
>   
> +/*
> + * Wa_14025883347: Prevent GuC firmware DMA failures during GuC-only reset by ensuring
> + * SRAM save/restore operations are complete before reset.
> + */
> +static void guc_prevent_fw_dma_failure_on_reset(struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	u32 boot_hash_chk, guc_status, sram_status;
> +	int ret;
> +
> +	guc_status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
> +	if (guc_status & GS_MIA_IN_RESET)
> +		return;
> +
> +	boot_hash_chk = xe_mmio_read32(&gt->mmio, BOOT_HASH_CHK);
> +	if (!(boot_hash_chk & GUC_BOOT_UKERNEL_VALID))
> +		return;
> +
> +	/* Disable idle flow during reset (GuC reset re-enables it automatically) */
> +	xe_mmio_rmw32(&gt->mmio, GUC_MAX_IDLE_COUNT, 0, GUC_IDLE_FLOW_DISABLE);
> +
> +	ret = xe_mmio_wait32(&gt->mmio, GUC_STATUS, GS_UKERNEL_MASK,
> +			     FIELD_PREP(GS_UKERNEL_MASK, XE_GUC_LOAD_STATUS_READY),
> +			     100000, &guc_status, false);
> +	if (ret)
> +		xe_gt_warn(gt, "GuC not ready after disabling idle flow (GUC_STATUS: 0x%x)\n",
> +			   guc_status);
> +
> +	ret = xe_mmio_wait32(&gt->mmio, GUC_SRAM_STATUS, GUC_SRAM_HANDLING_MASK,
> +			     0, 5000, &sram_status, false);
> +	if (ret)
> +		xe_gt_warn(gt, "SRAM handling not complete (GUC_SRAM_STATUS: 0x%x)\n",
> +			   sram_status);
> +}
> +
>   int xe_guc_reset(struct xe_guc *guc)
>   {
>   	struct xe_gt *gt = guc_to_gt(guc);
> @@ -923,6 +958,9 @@ int xe_guc_reset(struct xe_guc *guc)
>   	if (IS_SRIOV_VF(gt_to_xe(gt)))
>   		return xe_gt_sriov_vf_bootstrap(gt);
>   
> +	if (XE_GT_WA(gt, 14025883347))
> +		guc_prevent_fw_dma_failure_on_reset(guc);
> +
>   	xe_mmio_write32(mmio, GDRST, GRDOM_GUC);
>   
>   	ret = xe_mmio_wait32(mmio, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 5cd7fa6d2a5c..ac08f94f90a1 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -73,3 +73,6 @@
>   15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>   16026007364    MEDIA_VERSION(3000)
>   14020316580    MEDIA_VERSION(1301)
> +
> +14025883347	MEDIA_VERSION_RANGE(1301, 3503)
> +		GRAPHICS_VERSION_RANGE(2004, 3005)

We usually avoid having these big ranges in the WA table, in case a new 
derivative gets introduced that doesn't require the WA. If you think it 
is justified in this case, please get an ack from the platform enabling 
side.
Apart from this the patch LGTM, so I'll give my r-b if you get the ack.

Daniele


