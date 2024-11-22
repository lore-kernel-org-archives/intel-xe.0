Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1251E69184
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 17:00:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A38210EBFE;
	Fri, 22 Nov 2024 17:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TLEMVxHy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324AB10EBFE
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Nov 2024 17:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732294851; x=1763830851;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IDcT3lz4dVXJJxtLkG59IEj4uGYvwnCkiiAkfnZmaXA=;
 b=TLEMVxHyBJpKOlDCe61mWhTV2pfNZ5VZ2GaplBE9DP2QS2wc8A6E9vGN
 W5PU0DbP3K/Rzv+VLcoHedFpmxjG70FeBgxuKlv03k7ZV7GYd9sSAIzQi
 nujQFfslL+iTDLhF20Dz8vkGpyhpu4sNHCwU5kHUBMAPAPS7Bn4L/eppG
 iMouADh9Nyi853IwBThBRh/o+CYBcRh8B2w6u2RaLc/60J0+a5r403MTk
 DFEfYblmuxmYQuGXtEA9Qi36ZE33V3LqxrRukZPH/XrKQk3ysY9B6fqE2
 uhGsZsfY0wsEmwoOloujxjEUPIp0q17nAxNqS3kHdXi0R7r8l6gIprxsz w==;
X-CSE-ConnectionGUID: I4wfT04ISlqB2K9fvy0MIQ==
X-CSE-MsgGUID: pqGaM5drS06vumGMD+qsbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="43520836"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="43520836"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 09:00:50 -0800
X-CSE-ConnectionGUID: pZNKwOMdRE2apV4mLQVFEw==
X-CSE-MsgGUID: KhlemQxWQguonViN0fTeTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="95056244"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 09:00:50 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 09:00:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 09:00:50 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 09:00:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WoHKrl1NtArDBdD8JhZqJwQvHUvbAnYAiZW8T0Yw+zWeB36hlohitB1u2nZkKf4D8q9MovY4RpAjUTQ+t5jgu//C+Ll3mAEYy7poJ9IuLZMql1WiYr9kDgZ7dIeQztQdhFzkTZodhMR3f3RUvQQDXAXNe6Pw4os3+kF9PK1bWoxaSxMtrWCHgvLTd5A7ToUX3q1Z1DVuQpizAlno80Z8JFA0sdaFvTDHo/D22xeGYzlswsU4WsQwF8WWWcYRghIeWxArTMUKgsrKH6egipup+JUm0tjF37XGL37deSKBRSG79fAxiy3NALVcDxdSEQLWzG6UMh/u+/Z45dT9R5fIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECDArUTsTVxNy6SIW0r1WHTcyJJ8HcYIt8DpRVMsC88=;
 b=hGeSSfGFeLUBqVEqIXaK4vfEXVqyPrBKy499R4K0IBCF6UYRi53AE/bQ3arGSsNyCpRKm9KFzuLkOcrcYWNrUThfXxz/bBF9S4NRHFmDFa7BT+TL4Jikfp/vDMKHRQwttoCNhJnQjQVKz6eMl7xhXhiaBOsVH9pOnOzvs0u83AnPmpgG8XhndRiabhTtgNyOdyw3nklwOlqahtUiQ7W+C77U9qSLF9IkOH43fzhO3M/AE27VzyzuShTr9OQ46RQt77ezZ3WT6HNN7eATgNISEP8k+ilxLrNOQVjAdVaakH0u46S6/u/qZiKED+MfK4GCi1FmPkF1+vQh0xar2mU29w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 22 Nov
 2024 17:00:47 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 17:00:47 +0000
Message-ID: <534c1c58-57b5-4428-8f82-a18e91186893@intel.com>
Date: Fri, 22 Nov 2024 09:00:45 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] drm/xe/pxp: Add API to mark a BO as using PXP
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
 <20241120234353.1037180-10-daniele.ceraolospurio@intel.com>
 <87iksg29kt.fsf@intel.com> <cb789d6f-dcf0-4077-bc36-e630df0d9913@intel.com>
 <87plmoz759.fsf@intel.com> <7dcfa3af-35e5-40cf-a910-4b3cc1e34c03@intel.com>
 <875xofz4st.fsf@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <875xofz4st.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0124.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::9) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB4998:EE_
X-MS-Office365-Filtering-Correlation-Id: cf71bce2-dfd1-42a7-dd85-08dd0b1735b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDl1dlVHMzdSb0hPaVZTWmJpYTlDZW1yVXNnZFJWc2NQWWFZRm5oYWJUTGNa?=
 =?utf-8?B?cU5pUlBZL1p1Y1lSZzRlZ1ZvR096NFBXQnFOekhQVEZ6STNLT3FLR3ptOE5o?=
 =?utf-8?B?M0JvM0NVVExhMVdvMVp4NmlISU1QZTdrbzAxUWJTdmhjaVVPYXM2T0xOSzcy?=
 =?utf-8?B?MFdPNkhrcFRvL2VlU3ZvQTdIRE02a2E5c0JKbmVSeUl1d0NOeUVWL1NydzNz?=
 =?utf-8?B?K3h1UGszQmdMU2hic0xYTU1JT1FiODRuTmFmUmwwaGUreGlNamMwcW0zUTJY?=
 =?utf-8?B?d3ZqdkRlMkRRd3BwcDBJb1RKK2hPOTg2TFowc1dtZlJwalhRTER4amQ3UlBz?=
 =?utf-8?B?UHZWeE5SVUNiL1B3YW1oRit4UTJjdmFkbG5DVFprSG9hVVdvUm9PS3RjL1BI?=
 =?utf-8?B?MGRYQjRYUkVzWGRMaFRkWnc1ZUFsN2h3S2NuaEpIcHlKYk1FaTg1cDd4MHJr?=
 =?utf-8?B?N0hXUUYxdFViR3d6cmZMMm9OQnRRS2lMaW5YaTZBL3pROWNtU0lFOFpyNVUz?=
 =?utf-8?B?SmFQY1hHSFE0T0tWMmNvelEvM3pJbWFxdVJpeVp5R1RKWDdxb1FJaDg1OS91?=
 =?utf-8?B?ZXEwc001L1VGN0lJckY1aFI3Wmxyemdhb1QyakRlcHd2V25MUDRHZlZpSDVo?=
 =?utf-8?B?MTlpVlNBVi9JRWMxa0RwcTlJNXdIdEJUdEJMcEFvZ2tmU2VrV1pBaTl0OTN2?=
 =?utf-8?B?eGIxcFpqUXU2dUt5dmRKZkxPSnVXangwYU9peG5BS25ONDg1cmN4TEJnTGc4?=
 =?utf-8?B?WWpQbVZiTVpNZVpqcElSVVFPRTIzQWpJaHkvK2J4V0kvS24yZ1krbzh1ZFVX?=
 =?utf-8?B?M3o2MW1aVE0wV0xFckFNT0FIZGpLdkJmR0U5SGVRamFBWW1aWUNOSEo0ZERi?=
 =?utf-8?B?V3pZZnFuNHpwMmJLZVphZzhNRDMxNXNwWnRmOFlSY0dBWGFsRGtaZjVwcENv?=
 =?utf-8?B?cTcyb092elg4UStSRklJd3Vib0h2M3BjWXZBNG1jTXFiMVZsa1J4YmVMdFpn?=
 =?utf-8?B?K0QrT2V0NGJjd0RMcmJuVDF4Skc4T3RvK29MMThkUXNEdVk5RzZ1bFJUNjhL?=
 =?utf-8?B?SEZpTVY1aW9Gc2RtY2xtanNLWW9vZjhYS29IdHZHdVcvRCtEU05lMXFwVnF1?=
 =?utf-8?B?NTc2NnpnUDBsRVdJRGw1M2NHbVJYZ0Fpcys4OVRodVNyWGExdk5mN1loZFAy?=
 =?utf-8?B?RWoxdnY5a0xzdXVhRnRoTHdaUCtCTDhUY1VpRnl3NmRMaVVsQ2h0b01ZUi90?=
 =?utf-8?B?cXlHOEFDQ1YzcXM3NTc3QzNtcDJPM2tGZ0ZkcXh1VEZuTFgvTlB3c1ZUdXBD?=
 =?utf-8?B?RXJ5UHc1UnpaV1VDU3gwNndPamhHTnErM3c0Nng1TlFhd0tlejlTWVJNTUpi?=
 =?utf-8?B?cHd6U1ljcFI5QjJQYWhpZW1wNVovTFJIbWNEYzdQb09tK3R1ZkVMU2hmOG1o?=
 =?utf-8?B?eGlBRHdnZll0ZzRMYjhuSkl6dE0ycnN2K2tLanU4NzM5T0RpUktMTjlnbkU0?=
 =?utf-8?B?bTlsWks1aEowZXl0bVpGMnBYSGdOd2lBU1B5WFVkNUdkcWhvWUp3bHhrQVJY?=
 =?utf-8?B?S0VtTkZ4S1huSUZ5ZGhZbTNEODFneHlYb1NhdDNiTWk1blg1Ni9vazgrbjcw?=
 =?utf-8?B?ZXQ5b2ZaZHJCYXBsQkNDZDNwSm1PekgwUUFacFBCOFJ1eGc1U3dMaHFrR09l?=
 =?utf-8?B?L3NmQW13WkRCd21pWVU3L2I5Ym5mU3B2ZlNvWXU1ZUZzTzVERnhHWFJodk9I?=
 =?utf-8?Q?kN7aYa1RKTyeF5TL4Uzgp/peNhxX0AEHnBzYgAs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2dCSGs3Y2VVdEJUZGNOQlYxR0dLc25adkp2NU1rN1RwZVJSTENNUkJFK3Fr?=
 =?utf-8?B?RTI1V2l6cWJEWCtKWlRsb1llc1FOT0VpaXAzYlNaZjlTbnRJcGpKSWRsMGdt?=
 =?utf-8?B?V0JRM0k4RnJ6Z3pLLzMzMEY0WURYK1lKY1BhWGovZVFYSm5BTTBTL2dIRVZa?=
 =?utf-8?B?c1BPWkFSM3drM1VManFLRFZaVEIvT2tKdVRlUTRENmQ0dVdEWUljZHdPbk55?=
 =?utf-8?B?ZmFZZFlBTktCZmRjSDVTU3REcDcwbTZEdkNsVUpaKzNPU2dTNTUwckU1UEpx?=
 =?utf-8?B?VGNwT1ZlOVRISExBR3NBNjR5YnFWcDlOdENmdWFSSExkdlV3Y2d5dGxsNWxC?=
 =?utf-8?B?UGU0OXlFWk4xK0pnWU1KQzRQRU5iYUtVNUpzWU5qazlXVldtZzVBdFVuNkV3?=
 =?utf-8?B?RCtWWWhyb1JuZWhZUUtlNGVMcTZMRW4raE11cXIwUmp5NGhTZkhaRjdxODBo?=
 =?utf-8?B?Y3pCQm9ZNlRTeUlFeW5vNVRrNVZQQ1lMOVFGbFp6S0wvSm5pOFRiaGNDcnoz?=
 =?utf-8?B?aDM5dFNHL1VRSUFsNk4xUUZFeWRzclZ5K2w0Nk04dzlrRjJTMHR4QmlpdlhD?=
 =?utf-8?B?M2tWVk9qYzBaRnFVZ2VTWG8wUjNZaEFGQ0NmVU1pS1N3UkxZd2FjYnFSZ2Nh?=
 =?utf-8?B?MTdJMUhZVzRDQ25VVHBPYUxtWWpobEdiN1hLc2RFYXN6WmNYTTZYdkM0bUk3?=
 =?utf-8?B?ZXREMTV0S3ZqL3hLQUNiOG9NR0tXbkJubENsS0xXQTd3SUFZcldtZ0l5RnVO?=
 =?utf-8?B?WTNmd2VRTnNmMGxERmtHcHZCbGV2R2s3VXB2M2JTNnBxSnorVUR5ODJ5am1N?=
 =?utf-8?B?REo2bHNEWC8rbUlZeDdCNWc3Z2pNVi93aUtvZzM5ZFUwN1BxVmE0d1hTa0Z6?=
 =?utf-8?B?WVpYdGhXSGJTM0pFdUczdC9HSWlURnNQUVJqSWlLb1N2ZEY5Ky9HTjZhci95?=
 =?utf-8?B?Ly9IMjIyWUVVbE90bjhOcUw2S3RTM2Z5ZzlXMXJDL1Iza05qVm1GYU1VTGRz?=
 =?utf-8?B?NElTb050R1FtMWcydmhyYk1ucW4xa2U2Si9GeWNuZ01Bay9kWVhYNllOZzU5?=
 =?utf-8?B?MFN2Q2ZKcnVhVno5ZW5RNitHZTdRNXYrQzZDUm1IUUs0NTA0N3hOeUN2YWUw?=
 =?utf-8?B?aFdvOXRwTGhpTW1qa2JYUHVJNGFrRFk0Q3B2OXV6bnJSdmVMM2lrOXVoR1Zy?=
 =?utf-8?B?eXlrY1VhMnJrd2lPVEx6eVlTZ0QvVmd4RzlTekM1VXQ2M2hGeDNic3FOb2hx?=
 =?utf-8?B?UGI0OXF6dGI4ZFhuZWdkRGRIbExNNnppL1J0dnN5eXdlclZLakUzallwRjdN?=
 =?utf-8?B?VmZHUnlzbmRScG04SXF5RmIwRHNnZDRDNmVOd3hkK1VlSzlzbXpibVZhZTFu?=
 =?utf-8?B?ODQvZlhNVFJKT045SVBPbkhHUVNOMHdGajFYZ1hGMjlIUExrT3Jmb1gyaER5?=
 =?utf-8?B?eWpibStNL3N3a21kMCtncFAxYzFGSHRxa0FyMXlxS0tsOW1uRGthY2hSY1Nw?=
 =?utf-8?B?bGZJa1Ezbkt1VVk4TFpYbVVBOE9TWExNUHdWVFh5TTU5aFhXM3JDNEdJc1Rj?=
 =?utf-8?B?Rm9sMlJEQzNRUnJPQW85UEk0UDdRcDZMZGNmZWp6QXRVVVBUcUZ2QWV5bVpK?=
 =?utf-8?B?TC83WFdiMEVOMGgrWTNyeGtla3BtcHdUZ1NzZkZlK3lwdXMyT1o4WENQR1Na?=
 =?utf-8?B?TDVaakNFc0J0cDNONEdsUFVLOGdpcFZxa0hjT3dJSDRRd2lnVitYcUtDOHd0?=
 =?utf-8?B?eE9tN3h4TmdYWHZ0blhCTHZSZEdMVnZhb1loTjJwaldVUURwRXc2aWVxRHJv?=
 =?utf-8?B?OElFY0t4cS9xTEJqbmk5WWpvdzF1SUZtRmlXVnYvTnk0SDA4b0lOTENBSHNO?=
 =?utf-8?B?L3ZhSHBuUFFZVmpOQWZzaVp4Zkc0dW9oR3E5UG91ZXo0b2NoZGVadVFFb3RX?=
 =?utf-8?B?U3N2ODFVR2ZITlBJS3JJSnZtQmN3TlZlWGR4S01Wb3ZlQlBtZCs1U1ErU1cw?=
 =?utf-8?B?SC9ERDZ6eHkxWDhNZFdoeWZsNmh1UjNCUHJ2cWZLY3pydXBGbWxWTzFmSW1h?=
 =?utf-8?B?ZU9sdnQwZ3JDaGpGbktLZTVKbk1HYm1DRW1VN0xWMGpLOW93V1M1SVhUa3Jm?=
 =?utf-8?B?QlRrREtyQ3JtenFkTVlDV1hMbC80aFIxTnhKWmdra3QySHRpaFIxQ0JoTnFP?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf71bce2-dfd1-42a7-dd85-08dd0b1735b1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 17:00:47.1624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kf+kqklpwGJLCIjC9BD2wLnpDYtPooQriyISv2ZYjChtTkjna1ldec+vtiCHwxdbxvroXLHEa6Jp51GneOa0nyAocKujr65vnxf/sVrHkqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4998
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




On 11/22/2024 7:06 AM, Jani Nikula wrote:
> On Thu, 21 Nov 2024, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
>> On 11/21/2024 12:03 PM, Jani Nikula wrote:
>>> On Thu, 21 Nov 2024, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
>>>> On 11/21/2024 1:57 AM, Jani Nikula wrote:
>>>>> On Wed, 20 Nov 2024, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
>>>>>> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>>>>>> index 419e8e926f00..533bc82255b6 100644
>>>>>> --- a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>>>>>> +++ b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
>>>>>> @@ -9,6 +9,9 @@
>>>>>>     #include <linux/errno.h>
>>>>>>     #include <linux/types.h>
>>>>>>     
>>>>>> +#include "xe_bo.h"
>>>>>> +#include "xe_pxp.h"
>>>>>> +
>>>>> Can't have this. This will include xe_bo.h and xe_pxp.h from i915
>>>>> display.
>>>>>
>>>>> Basically you can't use gem_to_xe_bo() in static inlines in headers that
>>>>> get included to i915 display. It all needs to stay opaque.
>>>> Why would this be included to i915 display? This is the copy of the
>>>> header used for building the display code with Xe, i915 should use it's
>>>> own copy (i915/pxp/intel_pxp.h). Several other headers in the
>>>> compat-i915-headers subfolder include Xe headers. Or is the problem
>>>> specifically with the BO part of it? Because I can move the code to
>>>> xe_pxp.c, but I'd still have to include at least xe_pxp.h.
>>> With "i915 display", I refer to the display code that gets built for
>>> both i915 and xe. And regardless of which module the code is being built
>>> for, it should not include details like this. The goal is to make it
>>> more and more independent from the two, eventually spawning into a
>>> dedicated module. So we want to axe includes that lead from i915 display
>>> to either i915 or xe core headers.
>> Ok that makes sense, but I'm not sure if it can be easily avoided here.
>> The PXP key is managed outside of the display code, so we do need a
>> callback into Xe or i915 to get that info. The only way I can see that
>> being doable without the different headers is if we pass a function
>> pointer at display init time and keep that stored inside the
>> intel_display structure. That to me sounds like something that should be
>> introduced more structurally for multiple callbacks into i915/xe instead
>> of just for PXP, but I can do it if that's the preference.
> Why not make xe_pxp_key_check() accept struct drm_gem_object * instead
> of struct xe_bo *? Basically all the interfaces to/from display will
> need to use i915/xe independent types anyway.

I can do that, but I'd still need to include xe_pxp.h to bring in 
xe_pxp_key_check(), so there is still going to be an include that goes 
from display into Xe. If that's ok for now, I'll go that way.

Daniele

>
> See ad36a322619c ("drm/i915/display: convert skl_universal_plane.c to
> struct drm_gem_object") which converts i915 pxp. And i915 display gets
> to use either opaque types or generic drm types.
>
> BR,
> Jani.
>
>
>
>> thanks,
>> Daniele
>>
>>> BR,
>>> Jani.
>>>
>>>
>>>
>>>> Daniele
>>>>
>>>>> BR,
>>>>> Jani.
>>>>>
>>>>>>     struct drm_gem_object;
>>>>>>     struct xe_pxp;
>>>>>>     
>>>>>> @@ -16,7 +19,15 @@ static inline int intel_pxp_key_check(struct xe_pxp *pxp,
>>>>>>     				      struct drm_gem_object *obj,
>>>>>>     				      bool assign)
>>>>>>     {
>>>>>> -	return -ENODEV;
>>>>>> +	/*
>>>>>> +	 * The assign variable is used in i915 to assign the key to the BO at
>>>>>> +	 * first submission time. In Xe the key is instead assigned at BO
>>>>>> +	 * creation time, so the assign variable must always be false.
>>>>>> +	 */
>>>>>> +	if (assign)
>>>>>> +		return -EINVAL;
>>>>>> +
>>>>>> +	return xe_pxp_key_check(pxp, gem_to_xe_bo(obj));
>>>>>>     }
>>>>>>     
>>>>>>     #endif

