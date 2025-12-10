Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0ADD3B9A9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 07:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482B710E24A;
	Wed, 10 Dec 2025 07:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHxxQ6gz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC84C10E24A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 07:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765351103; x=1796887103;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=skrguZ5h3Qfpo2ec/HioQ2iA/dmiXGQrfgdLY/tqgLA=;
 b=dHxxQ6gzb7a8jryhXv74j5qN/ETBWKU9dYg51Lw3jtGwW/SbYNhuS+Bb
 rdiOiqbXbBJ8P7S28yRZegzB5c7r0nKB1nVb0HnVn/RS/65scDvDmw2as
 4jpPwyJ9/KHjeEGQuNDySbvdnXHwSBD5ivUSYxJLpdETuRIuGJtec/4DS
 NKGWZTI/F3n5JqdN99vMMXCPZpc7/B8anRByem52uBJOfCwuPRngl8Bpu
 wn021JjB2TvgoEuqsIgyPxSFqKCofoKmrWOSN5Ijge/EaG2w4G1qiFId4
 6RM2JUn9is8Ds10MUFed3hlTIOXElAmgXQaqw4T8/uVsFPN+DGMHESGIC A==;
X-CSE-ConnectionGUID: aeBVElpvQcKWpwgBhdOgpA==
X-CSE-MsgGUID: T951E9C+RtKS2GqcjAVaHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71165312"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="71165312"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 23:18:22 -0800
X-CSE-ConnectionGUID: r03iZyJDR2GTh5FVK1equQ==
X-CSE-MsgGUID: 25zCvIWzTba8/2GMwY1Wig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196731946"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 23:18:23 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 23:18:22 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 23:18:22 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 23:18:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUGA0IaenpWwr97a08CGZHf3ByzKKL11qmoGrtBngo5VGoHeb8xLf/YSFe+woROYagMS5u3wcI7P5LQ+ppbHzm9wxJwctF+2bGJ3oTCQFRjQHThog/0L9gpwmootA96E1FwwJbxvh9GcJgL+LAmHZRLkOC5gcaqTJHTVW9rnfJp0ZdvUGolAqRvUpNfm0CMV/XCmnUE+nGPehGPnff/GcPoXd3r4OiO7aodaYLf2pBuo3fB7/MPIlbzNc7ef1oSsDkrF7qBU5L42aIOyfEXT7MYPTILQmoaFJg9gdCo8tBUE0xqYg3zU4lyLtxAGIJpcDJg1x/d8E3eGygbFvuaVZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDI9qUPSMsrDixYidvq27lVP47KB3w8DPE6VDHOWt+0=;
 b=lNeTQmFcV8UAlfEVax76GbgJWMWn/axksEJ9vCwAAbND9tx1IJpOBCMt8rsI4CBPlivMTeUz1Gk4LQZSZXJ70BDKR7e6xo4Qn3PP9sTxCYGAQVUDtFR6AEN+FR/PZHZagEtDl4VGcQW4d2G06/0V5UN3Sy5cIsrIlUtoYdBJCIyz3Y4nMETnRZ86OBU4BZzy+yJMR/LxbV9Md/JsOYtNHgvWVpeLW5EI+q6CgqPAeNnNMUgYtWjAAiM0mQXtvEEPK6nSuzj4ZgvXjoq+Ljf32HkHJhkFg8KAl7Is8istDhfvC70u9gnSCbD+xUksvWVXYA/9o/ozUJRZhWU87uboBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3052.namprd11.prod.outlook.com (2603:10b6:5:69::29) by
 MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 07:18:19 +0000
Received: from DM6PR11MB3052.namprd11.prod.outlook.com
 ([fe80::c685:30c9:fec0:40d0]) by DM6PR11MB3052.namprd11.prod.outlook.com
 ([fe80::c685:30c9:fec0:40d0%7]) with mapi id 15.20.9388.012; Wed, 10 Dec 2025
 07:18:18 +0000
Message-ID: <2b9c497f-89bc-4de4-a4cf-2f3f1bff1d9f@intel.com>
Date: Wed, 10 Dec 2025 12:48:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 2/8] drm/xe/bo: Add purgeable bo state tracking and field
 madv to xe_bo
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
References: <20251210043112.3267620-1-arvind.yadav@intel.com>
 <20251210043112.3267620-3-arvind.yadav@intel.com>
 <aTkJUOI5vTQKTbvp@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aTkJUOI5vTQKTbvp@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0229.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::9) To DM6PR11MB3052.namprd11.prod.outlook.com
 (2603:10b6:5:69::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3052:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f40ce41-23e5-4d8e-be0a-08de37bc4b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHQxM0wrcVRBd3hFRTFLQ3p1UFI0YmVnTkxwVXc2N0dWOWdtWWdEc3ZMRTZu?=
 =?utf-8?B?MjVwb1FxRTNTWWp6NlQ4L01PWWJWWmZObzZzNlJUWFpvWU5hNkpZeHJ4dnpw?=
 =?utf-8?B?Y2xOSytiTlFNSjRIK0pmb0FJZ0hDRWUxQXFsL0hsdEE0U3R6dE9oT2k5WUpl?=
 =?utf-8?B?N21oNWszbVJsandHS0w0elZSbXFpWWZ3OFlHV3Z6aUVIMWRVdmZvalZvVXht?=
 =?utf-8?B?Um9YN0RRK3ZtdWNOQzFLT0Fyb04xZ09icTFoR1lYVW40UC80SWhaZUsvSExj?=
 =?utf-8?B?ODlLS1RMYjNhUFJIbzFJWnJlL0VZMDdMcXNWSVJBd1JRQWN2MGttU1lLay9j?=
 =?utf-8?B?cEM3MHhnUmN1RXdnVXlyTWpQajgxd0dFdGdzUnp0OUQ1YVVnUDBrc01qTHF4?=
 =?utf-8?B?ZGRLM2Z1Q1pRS2VqUDlIa2JwWXpRbEJsZHdreGZ4S09UQmN5UGRNRXk0NXlw?=
 =?utf-8?B?dWJnUS8wMDZxTnVIbVU1M3FjK0R1a3EyTDFJeEZoWTN2S3dwY05OM1diSVIy?=
 =?utf-8?B?RlJsdTJMd1VOQmM0NzBISDRHcnp4aGJGWjRqQmZlbXMwczBCK2JUemZLd09m?=
 =?utf-8?B?b3J1elh0Q3BUWWRmNVV1MzczNmRpUFpzcjNkaE9MOFE0SWxlU0RZMkR3Z2pq?=
 =?utf-8?B?NXNmaTJaS3R6QnczODZFUWExWXQza0p4dXZZUy8wZE1Udm9GVS9UKzhRRHV6?=
 =?utf-8?B?ZTl5d1BBbGEyMFNpLzdaclBSU2JiTm03ZHhTbCtzYk54K3ZCSkovUk1kR05U?=
 =?utf-8?B?OCtSclR3Vk5MSktyUG9CRlVqZStxZWxjdXVBNkdqcGlhM0N0WnRVeFNyV3d6?=
 =?utf-8?B?NjlOUWtPMi9zWnRVdTd5ajlqYWxLSnVUWHBWU0krY2VsR1dGaFcxaml6NmRT?=
 =?utf-8?B?eTBYMlJabGM4S2NlM1dBYVFwdG5QODhWSDdYWkhyaTJxaDJzSjh2V0lqUFQ0?=
 =?utf-8?B?WDloSFdGOVZ0blU3Yld5WEdVbWxDVzd3VEdjaFdtYVlKbGRpZHlvQk51WHYz?=
 =?utf-8?B?b1FFTVFiY245dzV4SS9ONlFDbTVtY2pNbmhBQ25DRWlJS2RiL2lTOUVVblg5?=
 =?utf-8?B?WjBxeHZkTzByeW16eU1zYXl5TncrRkJHWnFjZlk0b3lxTHl3NThkd3ZLMUxH?=
 =?utf-8?B?aTZacXJ4QU9sMmFSSERqQUdzMjdzRlZwb29zZUw2TjRvNjhqbitIY0tES21q?=
 =?utf-8?B?TE1jWkl1NDlrVTJzSThveU40QkgxV29BR3pBU0lQNERraXVBYVRUUGVUd2pB?=
 =?utf-8?B?Z1l1elFqNFRNM1VMLzR2NWRNVkU3ajUyb3FsemFNaGM2RE0rMnBpcXJaWHp5?=
 =?utf-8?B?TjVYMjdRamQwRFNSVXk4QUszTEVWZW1Rei9XWnVkLzdjODl3WFVXN250a3B2?=
 =?utf-8?B?SERxaDdCeGdLOGRmbGtndGk0ZVN6UCtlOEV6bjN2Rmcyb0ppQmV6UDVXN09v?=
 =?utf-8?B?QnMvazBGdjhPeWR4a0h2RTRLZGJWK3Jla3hzNWRsMmJtZ24yNDd0eUNtck5K?=
 =?utf-8?B?NXE5V1o5bWFnQ3hpTXppQ1VoMFNiS3Azb0ExYW0rbHQxc3c4MHJyYlp4NTAw?=
 =?utf-8?B?UGpydWREY2R6L3FNVWkva2ZQS2c5cG8wNTBRT1BSbXZMMG1DV3gzdWFZdXl0?=
 =?utf-8?B?U0IvN2JzRGdjWGVMTkxVQUVQZlkrU0NuTjlYRjdNelJpc25ZR29wcGNxbUhQ?=
 =?utf-8?B?UVgvKzRrZDlPeVJuMXJRNFNQL2xGSERyUkJkbjZLVFBNQVBpME5Fa210TnB3?=
 =?utf-8?B?TmlYWFRycTFTR2VIUDJ2cFpwelQ2RHRqelN4ZXRSazhjaGw2bXZtNlFpZ1dq?=
 =?utf-8?B?QUFIYTlUQkIwNVk2YzMzblozQkUySVE0NmkrbXpHaENxTzFLcnVCbWdGVHV4?=
 =?utf-8?B?ZTl2a0lTNUpSVks1N25CZEkzU3Z5UVM2R2VKYUFnZDVFeEVzUmo3WWdLZ0hU?=
 =?utf-8?Q?TJ+GxNGaZlMF1Q2A4TisLMr/BbvX7fr4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3052.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S21ibTNXVW9vZjVLRlhuNnBVQ3ViV2U3RmU0czFwK0ozbHJ2TlUwRDlMMmFF?=
 =?utf-8?B?V2tDS0E0aTFRN3J2UTNZdU1vYlhnN3ZMYXFKSXU4aWYzeHY1Y2dvZUx1MHhv?=
 =?utf-8?B?OEd4SmJUWFlJZ2MybG1US0FTUkRqbGNDOFZSTnFlRENrbGFSRVJGRXpBSVJ4?=
 =?utf-8?B?RHJjWlFUNFRTdUhtMW5mcHF2bmJ2aGdlMnluUlVjQnhuTXJyOFRvQ29Md0ZP?=
 =?utf-8?B?ZXA2Rk5LWnN2TDVGbURSbWlRTDFNWWZ2MHNMWEUrdStJRmNHM1V5R3k4NkQ5?=
 =?utf-8?B?cmIrcEZGcFhVYlJHeGVOSmR3aC9rL3dWN2hpR1FrNmxuYjVKN0ZuR25lYTlh?=
 =?utf-8?B?MUVHV3VQWDlaU1FldloyMDdyVXVsbmxOYUFxREFHbXM3R3lYalBydHpscUgz?=
 =?utf-8?B?UHBjSVp3OWllY2dpc21pVDQybkNRMm9EZnYyQytUZGY1ZGdxZC9odVpObTRN?=
 =?utf-8?B?dEZEZHM4VTBya2ZJSWJZNFdWaVFYWU1hcmJQclFMRDdvS3VhbnlieGgyR3ZI?=
 =?utf-8?B?Z21hWWNFcG5SYjNwTnRLNEkwSUJKOXo5NGg5cjQ4NmdYRm9qY0xhb0JRYUZq?=
 =?utf-8?B?NzdTS2lRbjhJZmRtZndpQUMvYVpCTm5wc0lyNWRqVVgyK0JaWkUvdkROMFRm?=
 =?utf-8?B?K2d1YXY5TG1UTkpjWU5WZy8rRlpKaVdISHBUTW5wTmpaZE9sOXR4b2pyT1BT?=
 =?utf-8?B?bzY4OXNFai9xeXJYRVNsQnVHVTVGZENuSDllSU1QVVhrREdML2dtdVpVMEhE?=
 =?utf-8?B?dm85azhueldWeFdnQ1FXMkt2U2tIckFxN0gxTTBtaGxNRXpGdHFvV20wQkZy?=
 =?utf-8?B?bHRra09kN1hSUEU0dGh5UmllelJpMGZVbVhsdFZRTW1jQ1lXdGRFT2x2anNE?=
 =?utf-8?B?WmcxUlpNQ3NSenZxbC9Uc2pvVG5IclltbUQrdXJRTnhuQTlrTCtVTUZISHFl?=
 =?utf-8?B?ZkhOOE5mWG12bHBvc0wxRkROTkJhK0pmVGp6a0N3MW9QckFoQmhUbjd6UnNZ?=
 =?utf-8?B?b0hJY2crazVNUzAvQXFGUDhkV3JoZjNFTzRXZURWTGp4NEVlN1BwME95ZlRD?=
 =?utf-8?B?emdBbmk4aW1maG1id29mWnpyMlQzRXI3VWlycXJNNGxQbkM3VjdRa0VpYWJQ?=
 =?utf-8?B?b3psd09pQWgzMHNXRDQ1ZVh2VitZV3hwWGcxRjh3SWlNTWF5V21lSWNZVkxM?=
 =?utf-8?B?dUNRajZtV2xGVnI2RWpkQ0NrdGUwbWdlTnkzZWE2OWYvNUsySVcrRDFwWWpC?=
 =?utf-8?B?ellhMGE1V3hSbldyT1EyMWViRktrV21ycDYrNTRTdW5SZ2xpYUFseEdGOTB2?=
 =?utf-8?B?Y2hlTUJMMjZPTVFVUklwd3ZEaFQ2ZXdKdy9wM1hOTnFObkFnWHRoNTBJVlRE?=
 =?utf-8?B?Q0pZSHdGdS8wV21rQ0hNWDUyQzNuNEtBN1BvbWhTQ1pVZEhuNE5iVXg1UVZG?=
 =?utf-8?B?cVpvbitQay9xVHJPSHk1Z0Uwbjk2c1M1YmNiK05XSnJEY3liRGhRTGxMMkpU?=
 =?utf-8?B?NVB1ZTJRUGZaSlYzMHJCWU9hazc2NVNNVFZ0R0JvTTQ5KzdQejMxb3RmNEpT?=
 =?utf-8?B?NXRqZEdSWmw0bVB0QnIxb0pVR0RVQlA0S0FxZUorbU5CTEQvbnNVbVE4RXZH?=
 =?utf-8?B?KzVYY0lhZW1QbVlQalZub1B4RlVnWkNvVnI2UDVDM0xwdEpocUpEQzNOc0Z0?=
 =?utf-8?B?elVYRzJiWEtEWDczcndjdmtGZHFVT3YxTzl6NlpMclJURGdpTkJPWkswbjN3?=
 =?utf-8?B?SFNrR2VHU1JuMVdXcWttbktCVjdIRVFFSnhROGdER2h0YjZNNUhDREZLTkpL?=
 =?utf-8?B?WDZuNHQxZWpYcE1qaHJKOWZONVAvYU1oSkQ1MUk4Q1RGUXUzU0YwWTQ5VEJx?=
 =?utf-8?B?QkMxWUZZU3lLSHErdzUzSC9vVE1lTUlsOHhMY291Ly9rbGx5VFM1dmNseTN0?=
 =?utf-8?B?bk90RnFqNGs5U0VTV1JvTDhaallKR3Y5dVRqT2d0djY2bzE3MFRNUE45NmdL?=
 =?utf-8?B?dXVNdldLZVJMbnQ0Q0VLNjJkcEtlbUQ0ejR4bTU0d2xmc3pzbndJTlFNZkFK?=
 =?utf-8?B?RHFWb0gvd25LQzN4ZVBmUlZGcHhLVDQwMmVxY1BHc3B6ZXJ6ZEkwemlZaTA0?=
 =?utf-8?B?bTQvTm5WbnhEMk53YlBpbHlIVXA1dG5WU28vdFhaT1dKNTEyRmRyaWR3dG1h?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f40ce41-23e5-4d8e-be0a-08de37bc4b00
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3052.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 07:18:18.7864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MG17b2UF3x4Ll2VBKC33jNGitw0y+7XqXPLq3d9I0+dSRbyH1pAFLo9xqnlGOoQEFzmmAn3otJ4sdqPmPFpUBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
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


On 10-12-2025 11:16, Matthew Brost wrote:
> On Wed, Dec 10, 2025 at 10:00:46AM +0530, Arvind Yadav wrote:
>> Add infrastructure for tracking purgeable state of buffer objects.
>> This includes:
>>
>> Introduce enum xe_madv_purgeable_state with three states:
>>     - XE_MADV_PURGEABLE_WILLNEED (0): BO is needed and should not be
>>       purged. This is the default state for all BOs.
>>
>>     - XE_MADV_PURGEABLE_DONTNEED (1): BO is not currently needed and
>>       can be purged by the kernel under memory pressure to reclaim
>>       resources. Only non-shared BOs can be marked as DONTNEED.
>>
>>     - XE_MADV_PURGEABLE_PURGED (2): BO has been purged by the kernel.
>>       Accessing a purged BO results in error. Follows i915 semantics
>>       where once purged, the BO remains permanently invalid ("once
>>       purged, always purged").
>>
>> Add atomic_t madv field to struct xe_bo for state tracking
>>    of purgeable state across concurrent access paths
>>
>> v2:
>>    - Add xe_bo_is_purged() helper, improve state documentation
>>
>> V3:
>>    - Add the kernel doc(Matthew Brost)
>>    - Add the new helpers xe_bo_madv_is_dontneed(Matthew Brost)
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.h       | 56 ++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_bo_types.h |  3 ++
>>   2 files changed, 59 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 8ab4474129c3..1090a60f6ef6 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -86,6 +86,28 @@
>>   
>>   #define XE_PCI_BARRIER_MMAP_OFFSET	(0x50 << XE_PTE_SHIFT)
>>   
>> +/**
>> + * enum xe_madv_purgeable_state - Buffer object purgeable state enumeration
>> + *
>> + * This enum defines the possible purgeable states for a buffer object,
>> + * allowing userspace to provide memory usage hints to the kernel for
>> + * better memory management under pressure.
>> + *
>> + * @XE_MADV_PURGEABLE_WILLNEED: The buffer object is needed and should not be purged.
>> + * This is the default state.
>> + * @XE_MADV_PURGEABLE_DONTNEED: The buffer object is not currently needed and can be
>> + * purged by the kernel under memory pressure.
>> + * @XE_MADV_PURGEABLE_PURGED: The buffer object has been purged by the kernel.
>> + *
>> + * Accessing a purged buffer will result in an error. Per i915 semantics,
>> + * once purged, a BO remains permanently invalid and must be destroyed and recreated.
>> + */
>> +enum xe_madv_purgeable_state {
>> +	XE_MADV_PURGEABLE_WILLNEED,
>> +	XE_MADV_PURGEABLE_DONTNEED,
>> +	XE_MADV_PURGEABLE_PURGED,
>> +};
>> +
>>   struct sg_table;
>>   
>>   struct xe_bo *xe_bo_alloc(void);
>> @@ -214,6 +236,40 @@ static inline bool xe_bo_is_protected(const struct xe_bo *bo)
>>   	return bo->pxp_key_instance;
>>   }
>>   
>> +/**
>> + * xe_bo_is_purged() - Check if buffer object has been purged
>> + * @bo: The buffer object to check
>> + *
>> + * Checks if the buffer object's backing store has been discarded by the
>> + * kernel due to memory pressure after being marked as purgeable (DONTNEED).
>> + * Once purged, the BO cannot be restored and any attempt to use it will fail.
>> + *
>> + * Context: Caller must hold the BO's dma-resv lock
>> + * Return: true if the BO has been purged, false otherwise
>> + */
>> +static inline bool xe_bo_is_purged(struct xe_bo *bo)
>> +{
>> +	xe_bo_assert_held(bo);
>> +	return atomic_read(&bo->madv_purgeable) == XE_MADV_PURGEABLE_PURGED;
>> +}
>> +
>> +/**
>> + * xe_bo_madv_is_dontneed() - Check if BO is marked as DONTNEED
>> + * @bo: The buffer object to check
>> + *
>> + * Checks if userspace has marked this BO as DONTNEED (i.e., its contents
>> + * are not currently needed and can be discarded under memory pressure).
>> + * This is used internally to decide whether a BO is eligible for purging.
>> + *
>> + * Context: Caller must hold the BO's dma-resv lock
>> + * Return: true if the BO is marked DONTNEED, false otherwise
>> + */
>> +static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
>> +{
>> +	xe_bo_assert_held(bo);
>> +	return atomic_read(&bo->madv_purgeable) == XE_MADV_PURGEABLE_DONTNEED;
>> +}
>> +
>>   static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>>   {
>>   	if (likely(bo)) {
>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>> index d4fe3c8dca5b..57b4dc7012e2 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -108,6 +108,9 @@ struct xe_bo {
>>   	 * from default
>>   	 */
>>   	u64 min_align;
>> +
>> +	/** @madv_purgeable: user space advise on BO purgeability */
>> +	atomic_t madv_purgeable;
> If this variable is only accessed under the BO's dma-resv lock, this
> doesn't need to be an atomic.
>
> So also...
>
> '@madv_purgeable: user space advise on BO purgeability, protected by
> BO's dma-resv lock'

Noted. Will do this changes.

~Arvind
> Matt
>
>>   };
>>   
>>   #endif
>> -- 
>> 2.43.0
>>
