Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15C4CE8D79
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 11:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB8210E2A3;
	Thu, 19 Sep 2024 11:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HyAhQJig";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D318410E2A9
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 11:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726744088; x=1758280088;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RUGHEn52/NYwVnHvrkv1RrbYjSaFJjV5tU8JHcBcDvE=;
 b=HyAhQJigC3ZAkJ6j498JqX3iCy+J5mIhjD38iOT18funl5Zlsd1cD/Ef
 fHeGZkkeRISFETNWym2j4UgMllFFoPgVztQh48c8G0H05ySC8IzBj/SJT
 h7upXHyeSkjAQySIwGiK7xPLPaq/IGgh+YLq2USD2yqAEn96vCGgW3ojm
 rF1A1ern0wuhAp2VLk7beDzGpyTwmvC2sHvNgJDnHjE7qCm7wGNwwQvs9
 77f0nDC7Y9lPc5ix23DeX7jxSHz9ot8YIgqBW65BUbskpTzS0FxgajA5l
 HFbqQIYYMHfdjmUvWq6/e1gyzd9WJqBULMegjN84sM0MnC9QIRIw5z4HX w==;
X-CSE-ConnectionGUID: S39eDLqrQrSKpKTHSyJnfw==
X-CSE-MsgGUID: bvEpEf5jSjyTfU/9uroEUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29440971"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="29440971"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 04:08:08 -0700
X-CSE-ConnectionGUID: c+2VVSbMSECY0rk1YWDzPA==
X-CSE-MsgGUID: UmdT05ftQpW0mvnnozmO8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="70025339"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 04:08:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 04:08:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 04:08:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 04:08:07 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 04:08:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhEi8AQtyrw4vsVbB70xvf9WVj3fs6mhPcwtrvc68zLOWLnSv1dLLCEcEBUJ6JE7szDwpapk4XWXmLZjWkoQlD/5msFvSPF5rK50snICyxCo0ux8sY7eKQlje2PRMBX0jjBvg1OTNawk2JISHd0GxlkbThs8Gbx0OkQjU7B7ccPOkPzs0W8QMfSN5OxNR40BOKAn+P8/hQbp8opjb9bIsixbLUparfFufQtPGE58W5hH+EVJ0rrEwmcw1MgIhaG+WhyE6fa2cmkYgpwhc9s3Fel1xF/RFkAExN6IWq2CJF3jRKNxG8xngPHG/dX04m6jkYrK0wzA9BlfVSoDIHqOUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zR6E/6W5xITWUUE6SpqrW3yvlZ2bLg24IeOlSJGvNYg=;
 b=EJ5Zfn2s5alLH36/Uz5Uj65VEXLSXA0xbvXnLz//YuuaYqd8tQpX/f10m3ILADtMC216UiCepMnD/m5dAGGzsS2DpnwZTLNXG+QxmM7e6covLwU/DzJmM2NtK0mBltfqnQNSms/VhOwNhu1PLiPqUjRlsVBdHyJz6ifvZEbYUkQZOxYZp1TBV5XOoCaJI3My8933GFrP4Kraawy4vQOG/7Azxq+2ZKJBb+6ke79y1KoY38PuOCla3BnQGK6xdxNiR4P3KSjF+PmveKMnHhEg0yWChTiu0DTAismzgiCC/E/z9ulEr/Pxp22VbkmvdWv1RFNfP0iwEnc4G76P1YFuTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW5PR11MB5882.namprd11.prod.outlook.com (2603:10b6:303:19e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Thu, 19 Sep
 2024 11:08:04 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.7982.018; Thu, 19 Sep 2024
 11:08:04 +0000
Message-ID: <de0252d3-2af4-4abe-b4a6-f188b8062221@intel.com>
Date: Thu, 19 Sep 2024 16:37:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/23] drm/xe: Error handling in xe_force_wake_get()
To: Jani Nikula <jani.nikula@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, Matthew Brost <matthew.brost@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-2-himal.prasad.ghimiray@intel.com>
 <ad2bb8fa-bd4c-4880-b4a6-f3483e6a2b7d@intel.com>
 <31983baa-d613-4a79-b39b-3d315b87a14d@intel.com>
 <6ea536da-fed3-429f-82d4-f118d53309dc@intel.com>
 <4853d43b-0eb2-414c-816b-96e25bc6d604@intel.com>
 <7d1e6ccc-3dc1-4cdc-a30e-f0f1b0f12193@intel.com>
 <ZunPgOAndPtrl74H@DUT025-TGLU.fm.intel.com>
 <271c25c3-401c-43b3-8d9c-dc13027a6ea7@intel.com> <87v7ytbf9y.fsf@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <87v7ytbf9y.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0158.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::28) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW5PR11MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: a997c87c-9de3-44a9-eb22-08dcd89b5553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YThUcUMwcEMvb2ZDRnpLd0VTcjJMV1haQVdiM2dMeEszRFlITm9hVERhd3V5?=
 =?utf-8?B?Qzdod25wL280azlQRXZXR2M5Zk1LSFI5bDdJNEIvcHJMK3dwQW43RGptNlhq?=
 =?utf-8?B?bkxJbzk1em8xY2tOZWd5WUllM3Jxbk16LzVhVlZHZW5lemljUWVPMTRjajdx?=
 =?utf-8?B?ZCtzb0RScGNkS1pDTEpTRllEeHEwWXJHcGU2TXpzamhaMXFBU0d0aVpMbU4w?=
 =?utf-8?B?c1o1WkcxVDBhazU2K1J5T2VmOGVYcjdWMndyN2labVMwQXp1R2JnY0p3QUN2?=
 =?utf-8?B?bTBTY3NvZ3BwVlBOaUFacjFZMmVqR3BrS09ZSkcrZzlNZTh5eWJ1MEJNNUhF?=
 =?utf-8?B?Y0xyRW5JMkdHSVVPUnRyclFJeEhKMjV1Sm9NYnpmUmdibUQzUUN5amIwOHhY?=
 =?utf-8?B?VjBxRndwRnh1MU1hblN5TmRtTEJOUnlyemhmN3NEdWM3eVNReFBaUjIyNjFx?=
 =?utf-8?B?ZUlpRkhmVEVXdmY1YzlodWFDeFpCVVBteEVXUzN3TkEzdXQzQW1TOFphTUtq?=
 =?utf-8?B?WTZjYWZnWUIzVlJKV1J4UXhGUnFGeTJZclQyT0pNczRCTUVEQWg5bnZKVjZS?=
 =?utf-8?B?cXVTMGhZZG4yYTZYWmdWUXdtSGxxRW5UbG5uT0VYQ2lKUDFMcldTR1hpcTNT?=
 =?utf-8?B?Y3lZcGlxWjRpZ1RFSWtueGllL0s3SVRreUp4Mk1wYkI2dThtbXlKdjJuQSti?=
 =?utf-8?B?ME56TTBtbURiNldCbEQ5b1BQUWVFbWNmcnpRRFJock5LSDIrYUNwb2IvRThG?=
 =?utf-8?B?MHVJN214TlU0ZnNOOENwVFBKTHU5L0ptSldacjJVUzJnQmw0eWVXZFB2amxp?=
 =?utf-8?B?NlV1U29Eams3djQ5Q2dveTA0dUZqMUZCZ0RlK2J4RWxsSEM1UysxNUhLVGR3?=
 =?utf-8?B?cUhJQWZsZ0lkOG5lWjNBdzI5M0t2bXREeGFEQkN5TnJqU1ZJbzZtY3c4dWI5?=
 =?utf-8?B?L0hKQW1TaXl2aEViMGxPSnMzaFJhbjhoclUzN2t0VmI0UnpEZXFwQ1ZEaDA0?=
 =?utf-8?B?N0R1MmVLUzZtV0hvM3pyTVYyZW5tM2w3bmpFdHBieUF0ZE5TUDNyYWhwRWgy?=
 =?utf-8?B?NmMrVUdxYkRjR3ZVVk0zcm1ZUkZ3aENZSTd6OEt4d1o3SlBTTzJ0RVlrNHFW?=
 =?utf-8?B?UENxMFp3R1NvaFNqaTlnWWhYRVpWdmFwd0hIVHJwVjZLczVsTTgxVjNxME4r?=
 =?utf-8?B?TldVTVRvZjJIQmMzV3M5anJwTGZvZjNSVk1UNmV0YnA3SU43VGp3L0RsM1lm?=
 =?utf-8?B?TjEvZUNwTTlUcWQ2Nysrb3ZhNzNOUnJyTWIzVU9hV20zcHNVZFpoOFB2TndH?=
 =?utf-8?B?QzFnYXh1UUxiblU2bWt1MzhNMDJaaHlrQ0ducGFLUGUwbzFROWhpUkgrS2Fr?=
 =?utf-8?B?R3dkQno1L2h5bVpOcGJ6cWNzVE5pK1ZxSm1OY2MzcXZMaFhKN0ZoajNqVUVV?=
 =?utf-8?B?R0NtZDNNRDQvc1FVWCtVbUZJaVY1Q1BFZ1ZNUGtpalAxazdrTzhBZWJ4T3Uv?=
 =?utf-8?B?KzdCckZHaHdZa0xuTGYxVHdPYlJwUEhaTmJUYU5iSkI0RUthY3FtV05PVjhH?=
 =?utf-8?B?U0JCNkZDdnlqMmJnR3N1bHFaemE0QXJiVFZ6ZkpEUVJ3TWtrUWlYRE5RTTM2?=
 =?utf-8?B?a295dUZaelRpQ0hOY1MycWlIYkZJK3djUHdQbmxBQ1VaZTJabDd4YW4zbmVm?=
 =?utf-8?B?VlhJUnc4Tm0xZXRYWWFCanIySVp5ZDV4bzhaNU16NVdlMEs3ZVhLY2J4ZUZK?=
 =?utf-8?B?clF6RlhRN3R3MEM2TzFWWmxCUC9GS0FqWUpROVlGdGUvTHFvZ2doTW9MWDVX?=
 =?utf-8?Q?XpJNysgL7BI32HqwmTRvgmui1SDVHGs8Ptfkg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amMwQWd2azdoOURJVzlJWGJyZjR6ZFFjQkltVzdBNzdGU0dISHQxWi8rZFJG?=
 =?utf-8?B?bHlZL1Q2WXdVNGxMZEdzRkkzYmRlRVFDYW9BN3dPQjJCVUVNRVNiaXpGNndF?=
 =?utf-8?B?RWpKa1h2S1FoRXB1akg2bkNxbzkvNUIrYnRyR295UVVLWmdTbTdseVRWczJq?=
 =?utf-8?B?L2VBWmZXVktIT3ZHYks2amVraWlnazQxY0lGaThIdVcrMWNJTnZxZW1rdGZs?=
 =?utf-8?B?Q0VvUHNQajQ0YVZ1L3N1SjA3dlk1T3FlWWJOQXk1a0xHUlBTMVZRSEJaWjhk?=
 =?utf-8?B?VzEzWFpHNFAwUUZ1Qmwvd0hBNXVvY3pqVDZnUVNuOTNFU2FUYUhTYjhkVTlt?=
 =?utf-8?B?N3FzWWRrektUQTlzTm5TSlZ4VUJFRlYzQjYyRXVUK3FNcmIxby9Tb1VTd0tO?=
 =?utf-8?B?eTc4eVBiMHg5ZisvUEdhbGxtdmZWamxPSGVmOWxLTE42QXo0NGxSLzRFdUVp?=
 =?utf-8?B?bkMyeXJIemlnNHNCWjZqNjZNYTZ6cGp1Vk13UC9EdFA5TGtPbXc4b0Zycisx?=
 =?utf-8?B?YWZsRU5vVkdjaDJ1dmdoNzBldHhzM3MzRE8zZGxySHZqTzQ0RnpGbEpUZS9x?=
 =?utf-8?B?OUhRU1Z6RFphVVBXcU12MFNRbFBOQUtwT1RRRzcxQ2lBQVA0SkU3c3l3NEFJ?=
 =?utf-8?B?ZmNKUi96aldRMm1NQnY4TktiNDZ6VUlHczFMQ2JnNFY1eE9NYVMrNlpYTlE3?=
 =?utf-8?B?UmZMcnpENGNFWXoxRXVNRHFzZEpzMWR1SGFHK0hmQXBSZXRrUUM2T2UyT245?=
 =?utf-8?B?aURhZkZqSEd4Nmp5SlI1Z3FVSzBNSVR2NlRXUWRqQ01zQThxZUVtb3VoOUpP?=
 =?utf-8?B?U1EzdkJWNUN0TmFyUWdkU3pEQnI0OWxzelpTQy9qSFJ3aUlGcjFrZkhabm0w?=
 =?utf-8?B?RFFraWFqcjFlY1lMM3huQXJ1RU9nOGhYdFkwRDZJaVcwVTFBWWVzdklhS3M1?=
 =?utf-8?B?Q1Qza0labk5kbFcxZVZMS09xZGozZlpvYXkzYkV3NG4zZTF0TjJzbE9XZ29r?=
 =?utf-8?B?b0FubDQyK2tRb21DeDJ2V2JkSlNGYldjVUp5bFd6MkpIU04zYW5aWWJlM0d2?=
 =?utf-8?B?QzhIOS8vT2lmOXRLTkxlNVpUVmJRZzdOQ2hNL1BHMFVlOTJ3L3pYRXhKaWNJ?=
 =?utf-8?B?bnQzQk1pdTBlTWpmcmRVdS9IdHRCTzEwNnpvbE1Iem9wSFIyUTJZbjl6OVdC?=
 =?utf-8?B?eXQ0Rk01ZzNQRHRFQ2JpSFRSbjFVTVZQaFhReWJqY1RyelZkQ0FEaktwdnZR?=
 =?utf-8?B?VHhvOENrMkk1bFBXYWpzYk1kU3QwYnRGQjA1Nnc5c1ZPeWdOZ1o5TldYcE1I?=
 =?utf-8?B?c3huTTVBZ0FDeHhBR2d0NHNqSGlGaGliMXhLZWpKTCtnYklzM28vSlpEdnpB?=
 =?utf-8?B?MFNLRENRTGQ1M3JFbTE3RGVoM3pCbGdYTHRQZnNsVFRKNkVPQm9lc01VdEtj?=
 =?utf-8?B?dE9Tc1k5K0RzSG56NjIwaTFTN0t3eXdNa3h6ZXlIaHM3ZFp0eC8rVlJpU3pm?=
 =?utf-8?B?TmkwaCtHdjRvQVFheXhidGNOcCtBQTFTVUZZVUptNFRvTGZ0TExiLzhLSVk0?=
 =?utf-8?B?L01VNG1aSVkrZzZob0x3aG9uOXdEenVGeHpaMXdUZzkrWWNsTkRvMVlTVk5k?=
 =?utf-8?B?M2FZV0VObFh5OHdGRmRuVjc2RU9zdUdnL1N4eUJyZDR4aXFNTzB6NkVLL1hq?=
 =?utf-8?B?N2RsRjZxOHNtU2tEUUhKdjZNU0dzWDJRek9lSTlpalQ0Q09KVm5HT0ZvaCtt?=
 =?utf-8?B?V2tyRk5wMEd5SDd1UmJBMjBHRWFzYXlJSklYYzZhQm13bngwU1VsMW5ZOUI0?=
 =?utf-8?B?SXZCdGpJNnJJZTRwUGN5bVFaT1BLZldlTGdnV1d4TlBOMVFpZ1RSZ1Nub0c5?=
 =?utf-8?B?YkY0N1FteTJtY2NodUkxVjQ1YzFTdzlQeFRxSkFDUmNkUE1Sd2VodUdUMk5Y?=
 =?utf-8?B?TjFaTEVJVHRsdEN2MkFIMHc5VTAvMHJXOEZWdWl2UFdpTzVlTCtmVEduR1Ja?=
 =?utf-8?B?alBGcVZIMDZXcUY3MkdocXR0OWNYYi9qMjJsdWpwQUI0MHA5M2xUMFg3Y1JN?=
 =?utf-8?B?VzdteWF0K1E0VkFuVDh4Wms2S2hwb3RRd0ducXVHOFFxWG5WckRwUGRSejJF?=
 =?utf-8?Q?pQZjjwv8w4azorMM2S0vfuCJ0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a997c87c-9de3-44a9-eb22-08dcd89b5553
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 11:08:04.6025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IP5RpKBDnvmiURFzmRMU+PR8iv0nhDYZ/X5PIr1bnlXAFt3CRimLGJfH91H0zI2OrodkdEswLIdYr8aX4tbPtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5882
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



On 18-09-2024 12:49, Jani Nikula wrote:
> On Wed, 18 Sep 2024, "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com> wrote:
>> On 18-09-2024 00:20, Matthew Brost wrote:
>>> On Tue, Sep 17, 2024 at 11:18:47AM +0530, Nilawar, Badal wrote:
>>>>
>>>>
>>>> On 13-09-2024 18:47, Ghimiray, Himal Prasad wrote:
>>>>>
>>>>>
>>>>> On 13-09-2024 16:56, Michal Wajdeczko wrote:
>>>>>>
>>>>>>
>>>>>> On 13.09.2024 05:59, Ghimiray, Himal Prasad wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 13-09-2024 03:01, Michal Wajdeczko wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 12.09.2024 21:15, Himal Prasad Ghimiray wrote:
>>>>>>>>> If an acknowledgment timeout occurs for a domain awake request, do not
>>>>>>>>> increment the reference count for the domain. This ensures that
>>>>>>>>> subsequent _get calls do not incorrectly assume the
>>>>>>>>> domain is awake. The
>>>>>>>>> return value is a mask of domains whose reference counts were
>>>>>>>>> incremented, and these domains need to be released using
>>>>>>>>> xe_force_wake_put.
>>>>>>>>>
>>>>>>>>> The caller needs to compare the return value with the input domains to
>>>>>>>>> determine the success or failure of the operation and
>>>>>>>>> decide whether to
>>>>>>>>> continue or return accordingly.
>>>>>>>>>
>>>>>>>>> While at it, add simple kernel-doc for xe_force_wake_get()
>>>>>>>>>
>>>>>>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>>>>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>>>>>> ---
>>>>>>>>>      drivers/gpu/drm/xe/xe_force_wake.c | 35
>>>>>>>>> ++++++++++++++++++++++++ +-----
>>>>>>>>>      1 file changed, 29 insertions(+), 6 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c
>>>>>>>>> b/drivers/gpu/drm/xe/xe_force_wake.c
>>>>>>>>> index a64c14757c84..fa42d652d23f 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>>>>>>>> @@ -150,26 +150,49 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>>>>>>>>                           (ffs(tmp__) - 1))) && \
>>>>>>>>>                           domain__->reg_ctl.addr)
>>>>>>>>>      +/**
>>>>>>>>> + * xe_force_wake_get : Increase the domain refcount; if it was 0
>>>>>>>>> initially, wake the domain
>>>>>>>>
>>>>>>>> while likely this is still recognized by the kernel-doc tool, this is
>>>>>>>> not correct notation for the function() documentation
>>>>>>>
>>>>>>>
>>>>>>> I assume you are suggesting %s/xe_force_wake_get/xe_force_wake_get()
>>>>>>> will fix it.
>>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> [1]
>>>>>>>> https://docs.kernel.org/doc-guide/kernel-doc.html#function-
>>>>>>>> documentation
>>>>>>>>
>>>>>>>>> + * @fw: struct xe_force_wake
>>>>>>>>> + * @domains: forcewake domains to get refcount on
>>>>>>>>> + *
>>>>>>>>> + * Increment refcount for the force-wake domain. If the domain is
>>>>>>>>> + * asleep, awaken it and wait for acknowledgment within the specified
>>>>>>>>> + * timeout. If a timeout occurs, decrement the refcount.
>>>>>>>>
>>>>>>>> not sure if doc shall be 1:1 of low level implementation details
>>>>>>>
>>>>>>> Does this sound okay ?
>>>>>>> This function takes references for the input @domains and wakes them if
>>>>>>> they are asleep.
>>>>>>>
>>>>>>>>
>>>>>>>>> + * The caller should compare the return value with the @domains to
>>>>>>>>> + * determine the success or failure of the operation.
>>>>>>>>> + *
>>>>>>>>> + * Return: mask of refcount increased domains.
>>>>>>>>
>>>>>>>> if we return a 'mask' then maybe it should be of 'unsigned int' type?
>>>>>>>
>>>>>>> Agreed. Will fix in next version.
>>>>>>>
>>>>>>>>
>>>>>>>>> If the return value is
>>>>>>>>> + * equal to the input parameter @domains, the operation is considered
>>>>>>>>> + * successful. Otherwise, the operation is considered a failure, and
>>>>>>>>> + * the caller should handle the failure case, potentially returning
>>>>>>>>> + * -ETIMEDOUT.
>>>>>>>>
>>>>>>>> it looks that all problems with the nice API is due to the
>>>>>>>> XE_FORCEWAKE_ALL that is not a single domain ID and requires extra care
>>>>>>>>
>>>>>>>> maybe there should be different pair of functions:
>>>>>>>
>>>>>>> I am not convinced with different pair of functions:
>>>>>>>
>>>>>>> In current implementation:
>>>>>>>
>>>>>>> int mask = xe_force_wake_get(fw, domains)
>>>>>>> if (mask != domains) {
>>>>>>>        Non critical path continue with warning;
>>>>>>>         or
>>>>>>>        critical path:
>>>>>>>            xe_force_wake_put(fw, mask);
>>>>>>>            return -ETIMEDOUT;
>>>>>>> }
>>>>>>>
>>>>>>> do_ops;
>>>>>>> xe_force_wake_put(fw, mask);
>>>>>>> return err;
>>>>>>>
>>>>>>> Above flow remains intact irrespective of individual domains or
>>>>>>> FORCEWAKE_ALL.
>>>>>>>
>>>>>>> In case of individual domains if (mask != domains) can be replaced with
>>>>>>> (!mask) and user can avoid xe_force_wake_put(fw, mask) in failure path
>>>>>>> since mask is 0;
>>>>>>
>>>>>> so maybe we should have (by reinventing i915?):
>>>>>>
>>>>>> // opaque, but zero means failure/no domains are awake
>>>>>> typedef unsigned long xe_wakeref_t;
>>>>>>
>>>>>>
>>>>>> // caller should test for ref != 0
>>>>>> // but shall call put if ref != 0
>>>>>> xe_wakeref_t xe_force_wake_get(fw, enum xe_force_wake_domains d)
>>>>>>
>>>>>> // safe to call with ref == 0
>>>>>> void xe_force_wake_put(fw, xe_wakeref_t ref)
>>>>>>
>>>>>>
>>>>>> // helpers for critical work that must be sure about domain
>>>>>>
>>>>>> // compares opaque ref with explicit domain != ALL
>>>>>> // can be used by the code that obtained the ref
>>>>>> bool xe_wakeref_has_domain(xe_wakeref_t, enum xe_force_wake_domains d)
>>>>>>
>>>>>> // compares fw with explicit domain != ALL
>>>>>> // can be used by the code that does not have direct access to the ref
>>>>>> bool xe_force_wake_is_awake(fw, enum xe_force_wake_domains d)
>>>>>>
>>>>>>
>>>>>> // helpers for checking correctness
>>>>>> void xe_force_wake_assert_held(fw, enum xe_force_wake_domains d)
>>>>>>
>>>>>>
>>>>>> then usage would be:
>>>>>>
>>>>>> xe_wakeref_t ref;
>>>>>>
>>>>>> ref = xe_force_wake_get(fw, d);
>>>>>> if (ref) {
>>>>>>       // ...
>>>>>>       xe_force_wake_put(fw, ref);
>>>>>> }
>>>>>>
>>>>>> or:
>>>>>>
>>>>>> xe_wakeref_t ref;
>>>>>>
>>>>>> ref = xe_force_wake_get(fw, ALL);
>>>>>> if (xe_wakeref_has_domain(ref, d1))
>>>>>>       // ... critical work1
>>>>>> if (xe_wakeref_has_domain(ref, d2))
>>>>>>       // ... critical work2
>>>>>> xe_force_wake_put(fw, ref);
>>>>>>
>>>>>>
>>>>>> so above will be very similar to what you have but by having explicit
>>>>>> types IMO it will help connect all functions into proper use-case flow
>>>>>
>>>>>
>>>>> Agreed implementation/usage will be same, will use explicit type for
>>>>> clarity.
>>>>> IMO typedef unsigned int xe_wakeref_t is sufficient instead of
>>>>> typedef unsigned long xe_wakeref_t;
>>>>
>>>> I agree with this.
>>>>
>>>
>>> What? Really? I thought it was pretty clear rule in kernel programing
>>> not use typedefs [1]. Reading through conditions acceptable and I don't
>>> use anything applies to this series, maybe a) applies but not really
>>> convinced. The example in a) is a pte_t which can likely change based on
>>> platform target whereas here we only have one target and see no reason
>>> this needs to be opaque.
>>>
>>> Matt
>>>
>>> [1] https://www.kernel.org/doc/html/v4.14/process/coding-style.html#typedefs
>>
>>
>> While running checkpatch on my changes, patchwork had also issued a
>> WARNING: NEW_TYPEDEFS: do not add new typedefs. I reviewed the usage in
>> the Linux kernel tree and found it used in many places, which led me to
>> assume it was safe. I now realize that I should have been more careful
>> in understanding the context of its usage and referred to the kernel
>> coding guidelines. This was an oversight on my part.
>>
>> Since this doesn’t impact the CI or runtime, I will avoid reverting to
>> unsigned int immediately and will hold off until I receive the other
>> review comments. I will incorporate the changes to revert it in
>> subsequent versions while also addressing the other review comments.
>> Thank you for bringing this to the attention.
> 
> If you end up replicating intel_wakeref_t from i915, and go as deep as
> the rabbit hole goes, you'll realize intel_wakeref_t is a pointer
> disguised as an unsigned long. It's a struct ref_tracker * when you have
> certain configs enabled.
> 
> You could just use struct ref_tracker * everywhere. It's an opaque type
> to start with.

The original idea of using typedef for the fw return mask was for the 
sake of clarity. However, Matt B pointed that the use of typedef in this 
instance is not in accordance with the Linux kernel coding standards. 
Additionally, I agree with Matt B that there is no need for the fw 
return mask to be opaque; therefore, it is preferable to maintain the 
use of unsigned int.

Regards,
Badal
> 
> BR,
> Jani.
> 
> 
>>
>> BR
>> Himal
>>
>>>
>>>> Regards,
>>>> Badal
>>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> // for single domain where ret=0 is success, ret<0 is error
>>>>>>>
>>>>>>> This leads to caller only calling xe_force_wake_put incase of get
>>>>>>> success. so in case of caller continuing with failure, he will need to
>>>>>>> ensure the put is not called.
>>>>>>>
>>>>>>> for example:
>>>>>>> int ret;
>>>>>>>
>>>>>>> ret = xe_force_wake_get(fw, DOMAIN_GT);
>>>>>>> XE_WARN_ON(ret)
>>>>>>> if(!ret)
>>>>>>>        xe_force_wake_put(fw, DOMAIN_GT);
>>>>>>>
>>>>>>>> int xe_force_wake_get(fw, enum xe_force_wake_domain_id id);
>>>>>>>> void xe_force_wake_put(fw, enum xe_force_wake_domain_id id);
>>>>>>>>
>>>>>>>> and
>>>>>>>>
>>>>>>>> // for all domain where ret=0 is success, ret<0 is error
>>>>>>>> int int xe_force_wake_get_all(fw);
>>>>>>>> void xe_force_wake_put_all(fw);
>>>>>>>
>>>>>>> In case of xe_force_wake_get_all(fw) failure, how the caller will know
>>>>>>> which domains got awake and which failed ?
>>>>>>>
>>>>>>> ret = xe_force_wake_get_all(fw);
>>>>>>> if(!ret)
>>>>>>>       No way to put awake domains to sleep
>>>>>>
>>>>>> in case of failure, it would be the responsibility of the
>>>>>> xe_force_wake_get_all() to put all partial awakes immediately, since it
>>>>>> failed to awake all requested domains (same as in single domain case)
>>>>>>
>>>>>> but let's drop this idea
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> and
>>>>>>>>
>>>>>>>> // input: mask of domains, return: mask of domain
>>>>>>>> unsigned int xe_force_wake_get_mask(fw, mask);
>>>>>>>> void xe_force_wake_put_mask(fw, mask);
>>>>>>>>
>>>>>>>> this last one can be just main implementation (static or public if we
>>>>>>>> really want to continue with random set of enabled domains)
>>>>>>>>
>>>>>>>>> + */
>>>>>>>>>      int xe_force_wake_get(struct xe_force_wake *fw,
>>>>>>>>>                    enum xe_force_wake_domains domains)
>>>>>>>>>      {
>>>>>>>>>          struct xe_gt *gt = fw->gt;
>>>>>>>>>          struct xe_force_wake_domain *domain;
>>>>>>>>> -    enum xe_force_wake_domains tmp, woken = 0;
>>>>>>>>> +    enum xe_force_wake_domains tmp, awake_rqst = 0, awake_ack = 0;
>>>>>>>>
>>>>>>>> it looks that you're abusing even more all enum variables by treating
>>>>>>>> them as plain integers
>>>>>>>
>>>>>>> Miss at my end. Will address them in next version.
>>>>>>>
>>>>>>>>
>>>>>>>>>          unsigned long flags;
>>>>>>>>> -    int ret = 0;
>>>>>>>>> +    int ret = domains;
>>>>>>>>>            spin_lock_irqsave(&fw->lock, flags);
>>>>>>>>>          for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>>>>>>>>              if (!domain->ref++) {
>>>>>>>>> -            woken |= BIT(domain->id);
>>>>>>>>> +            awake_rqst |= BIT(domain->id);
>>>>>>>>>                  domain_wake(gt, domain);
>>>>>>>>>              }
>>>>>>>>>          }
>>>>>>>>> -    for_each_fw_domain_masked(domain, woken, fw, tmp) {
>>>>>>>>> -        ret |= domain_wake_wait(gt, domain);
>>>>>>>>> +    for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>>>>>>>>> +        if (domain_wake_wait(gt, domain) == 0) {
>>>>>>>>> +            awake_ack |= BIT(domain->id);
>>>>>>>>> +        } else {
>>>>>>>>> +            ret &= ~BIT(domain->id);
>>>>>>>>> +            --domain->ref;
>>>>>>>>> +        }
>>>>>>>>>          }
>>>>>>>>> -    fw->awake_domains |= woken;
>>>>>>>>> +
>>>>>>>>> +    fw->awake_domains |= awake_ack;
>>>>>>>>>          spin_unlock_irqrestore(&fw->lock, flags);
>>>>>>>>>            return ret;
>>>>
> 

