Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48759CCF9FC
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 13:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0406B10E979;
	Thu, 30 Oct 2025 13:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ou1Gm4oF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CACD10E972
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 13:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761831348; x=1793367348;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NNGgBGSGzB+gjHLs6hx3sBak3aQxXlERHWuR/zybTSA=;
 b=Ou1Gm4oFoXINiGYVomZ2Rt6p5Q1c67zy8fxDLPHFeA3SPIRHbvenSBFU
 DtOseOpoU8rpd9trBIflG+uQdar2gMQ4W30mOo1PgEZ2NlueyGzXDw+3E
 1tukFSbDxLEkRwTgP+J5Z/XjXJaNY7NW05EfM0gFJurlgGXjTgP73khAg
 DWn0/+1JGr+lK4zlayayKTbKtGHjsiggR+G7o4qfQxiHO+hh/cRW12pJp
 L5F3wCK/OZhGxTBcIzCMC37YIDw6l7WFgfcBAf/6FX8MMIVwWxMNnvmKq
 4rxTA/PGDOMUGgozULllmnV8YMLpf98Gw7Vw49S7L5cTsVaHB26apOLO9 w==;
X-CSE-ConnectionGUID: 6U80HYmzTLusZhdsuZFWmA==
X-CSE-MsgGUID: ifWSO9LxRoy+nvw/bqugDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="81600421"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="81600421"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 06:35:47 -0700
X-CSE-ConnectionGUID: z8SY24APQ8e13wQSMMoMnQ==
X-CSE-MsgGUID: cE9zPKfNSAiH9ttOZgmpsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="223177608"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 06:35:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 06:35:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 06:35:46 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 06:35:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUcTpXtEptkz40Jc10EF9YUNFkYvcm9djw7A+TwnTJU1UfVHMmaNyAtPOYDFk3qWCUPvFzKhP+x6rEwyEC1IOuWbqkGDiXPjJN6PWkQvApiFOaaW8o2VESVA7HD3N9iIm+/7lU+qtsARMYH4Zkot6L8ryTFpk+6HWhRqUKXB1fu8H+VlOA6kd0oLRKF4gV689N5r//61fM93EebNM1TBjbxewuuLpwDRGl7qP0/pmQ4wTsd3QSHE8Mco1PpHX/5BiLezrRkjeZf4N/AUGoOgbLkUU4HCQkFwPUJEOd+hdDWpIM1TJX7Q0Gl2qFz1TJP3vtqYIJPP9zlkLuNmP6GyJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhXj6FnIeZZjArE/LZlTHdk4llak/GZ61FG6suMbkyQ=;
 b=RyVNFmdXSRFtdg2duTFzbztmU/FwHiERpMrw7wkpSEhRx3k/A7D5lgY4zIbNsdOOWbjru7Jb/JlH/Ymi5VLqMaTqVdQDnIT+XZGNMQfgZi+vEkOLJUOgU8arXL76bB3PRtSn/Xms4fNlr5/+Adk3pqhMQgGeIyp9Fv6P1s/CJRxYkhnMsocQ82tLAD/gAdQo8Z1fo0rTuPrlA1c60ljQ6P+EUCY16kWHlBTXXyscdu44onxclyZqsCwDGCm4JnNxfFEoNR7MnjmDpiKniahLDD7wh7VTiW+f2jLuZvwRcKUXr90axJzM9jZIuvAzJxQqTF4fl8unJYtQw2eNHb4L+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 13:35:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 13:35:44 +0000
Date: Thu, 30 Oct 2025 08:35:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 13/17] drm/xe/pf: Allow change PF scheduling priority
 using sysfs
Message-ID: <tyzwd55usmombrh62ep47aqz2avhvlbb5xakhq7eli66qaor3s@k7hpxsa33fwl>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-14-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028175832.184534-14-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0037.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2e6552-0650-4762-5c43-08de17b939ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L09rUjl4aE1pKzFlMmdWei9PakgwZXFHNDdSWlNyV2RMZ04reW5QOVlMR0x4?=
 =?utf-8?B?SmNaOWJMWXNMNG5Vd2s0ZzFUTFV4R28xYjhmbE1rQmpYNFdBdkJwdENjblhw?=
 =?utf-8?B?SHpOM0d4Zm51ajY2akRFYjk0c2wxNTduZHh5d1BEQlVlSi9wSFFaUFJ5YUxl?=
 =?utf-8?B?R2QzZW1oZzlkaWltU3piS1ExZkVwU3Uzai8zdnhHTWxrNzZpay9ERlkzVHlZ?=
 =?utf-8?B?dkgwR21HUVVxVEc5K2xTRkQwZTA4L1E4SU95TWNkVzhyTWg5blZxTG9KYVE1?=
 =?utf-8?B?ZTlyVDRYZk0vVmE3SDhPWjVxQ3lhd0UzRnVON0JpQTdnTW11TVZpRDhFQnZI?=
 =?utf-8?B?VHQwUzExd0U4Zk1aWkhiYmQrR0lGNjREeWU5TCtwUWkxQm1uUjE3TnlpRWVP?=
 =?utf-8?B?U2lrWXU2ZmxQbXZJc0RaVVNXZS9jUFdZZkFHWE1vWWNyYTE5a0VITzNrZ01L?=
 =?utf-8?B?MHhXdVd4UHFLUVJKcmlLYURKTnkzSVd2N3ROc3hWK3lHT0pkOFlGYUVXRG80?=
 =?utf-8?B?cFRScUo3V09lWWl5S2xlRFNBcW1oZ0dQM2RPWXFpYkNTbmk0WWdJRFpybXg5?=
 =?utf-8?B?L29EaXQvYjZxRFI1TDR0cFg2T2FoV0VldW45RE8zUGoxSE5PclBwdmo2Tjdx?=
 =?utf-8?B?Q3o0Ym0yL3ladTRreVFXSjFNa0hKWGlicTZONXRhMUkwMjlkeE9oVkZwMWFI?=
 =?utf-8?B?TTcwb2ZQUEpqYXV0c2IyWHlreUhidkFQNFpIb2lNWEVZVXFhV2pCWnB0UmE0?=
 =?utf-8?B?TE5pTE1zekhLSkZNR0tWc3VrR3NweXNacVpRNnU2V3RvbHI4VU93UnNkcFVy?=
 =?utf-8?B?aUl0MjJoOCs1SERNMDcvRit2bm1RckxSa3A5cWNiSnZ5anVRNmZJMklBZk5v?=
 =?utf-8?B?L2twZldSVkNLUm5PZHBSSk00RTROaWt2eGxUN2xsVi9ieS9WSFBmVjF1am1s?=
 =?utf-8?B?dFdtai9aT3I2YjE4UXNEVkk4MDBxNnVERzcySXNCS3lSOGhQeFpSbzlTMXZT?=
 =?utf-8?B?eTFsekx4MmFmbmU1Sk45OHp5aHEwa2N4bkVtRGJrSzNpQUl2L2wxQkdLNWx1?=
 =?utf-8?B?RzVWTzl3VjhoWEJ6ZWl0L3JNN0RYdmdTSGlZWmUweEo5eWt5Ty9IUm91VWlu?=
 =?utf-8?B?ZGlRWHBNelJEQ0dpam9FVjZMRlQxWFhxU0NZalBZakN2Z2dnSEMvNnYrSHdM?=
 =?utf-8?B?ek44SUpDOTJDSzV6RjdlTkZTbGRkaGlSODhmbU5SU3E1bDhWbEdZaFR4YmJz?=
 =?utf-8?B?RWxoNHorR2VrRVVtQWJMVmt1VGxjZDhtaDhycWhoeGNMK1dHSVFRMTNhMWlI?=
 =?utf-8?B?bTJiTDlTQmViVitzd3hNOTZ0NW5MOGgxTFUxYmIvL2pDRk5ZQzBuR3FsbmJ5?=
 =?utf-8?B?dmdWQzRQN29peUd2OW1SQlhOMHJBbHhBcmR1SjMzeWVaWnlQb2VXUDhCSDZn?=
 =?utf-8?B?Q3VtamR3ZkhpdWpmM1BnM3FRL2NVMkNWUDFXaWdaWVk5N1g0YlJ5VXI5UFM4?=
 =?utf-8?B?ZWtKTDBHam5UWm1MNEFYSDlkN1VabThmUks4WDdRYUdMZGRYWXJJZ2w2OUd4?=
 =?utf-8?B?NnplODU5V2YyajU0Qk9kTC8yNjEyYld3Nm9YZUp6a1JySUVhanAwSnpHT21C?=
 =?utf-8?B?WTh2VHFsQ3R2Um9sYlRaQThmUHdpbjBWeTdqU1U2Q3Ryb29TTjRQV2M4WkNQ?=
 =?utf-8?B?M1h4YStVWjF5MjZRZngyaFI3TTMyL1BBNnhZL29VNE00VDdYb3NhU1lMWXlC?=
 =?utf-8?B?ZW00U0lrK21uUmo1Y2FGdjZpSWhxYXQ1c3hzblYxNVRwb0E0Q0ZyTVZnSUZ1?=
 =?utf-8?B?anJUMC8vcEFOU3dpNFZWazJXd1FnMjJFNStHeHdkSEFDVm5IQkRKS0llRUNL?=
 =?utf-8?B?b1ZtWmdWdzRPQW1vWGlMTXMvWGpHU0paUHd0VGppL0lybitjeE53Yk1QbXll?=
 =?utf-8?Q?MMuD0djflKbwmw0yyjR7RKXKVZ/mBtMi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mzl1b21CK1JhaGhLaTNkbkJwSjlrMWhNMlF3cGZ6eWl4TjlZbDBOY1dDVlVz?=
 =?utf-8?B?L0dnTWJHa3hscW9jWi9YWUNOREpmYWlCZldYdG5oTlFvZWtRT1UzKy9CaHlB?=
 =?utf-8?B?NDBJb2syREIwNzAvajRHWEVhWjdKcndBdGp6cHk3TzZ6aVN4bldCamdSbGMv?=
 =?utf-8?B?QlFYK2d5Vk94d1pxNWZhVTNvZi9ONE9vd2E4WmptVEJhMWxOS1BEZjlPeUI1?=
 =?utf-8?B?anhROXcyS1MxWWVnYitNRFkxaVpsT25XdU53YS95eVZtQ0p1eVYzWHY0ek43?=
 =?utf-8?B?WTRaMmpjWGlWZnhXbkMySVlRaFZRUUlyVmN3MEk0V2RKNVRIQ0MrdEFZMlNL?=
 =?utf-8?B?dXdGWVFUMlNaalRLYjdERUlmMExBc0txTTBxaThxdEVQRUdROE55Qk42bmF6?=
 =?utf-8?B?SlRjTjYwb3hvb3ZLNWlRdlp2NEs5S0loSmpKazFrckNTSW9ZbnZJU0NHNEpZ?=
 =?utf-8?B?Y2hRejJSZmJYUXJOL2hEYUNIRkZYdXpScXdqSUprbmdTM0VYV2tOaDN5bU4w?=
 =?utf-8?B?cm53MWVNV210TitpN2UvaGpONDNDbUxpZ1JoTTY3K0xLK2lzc0d5dFkvSVA0?=
 =?utf-8?B?ZzRxOG1ydHJlNHNVZ2IwdWw2SXpsNDkzVy84MFBqWWlpOU91TFEyaFd5Tllz?=
 =?utf-8?B?V2hHZkVrMFdOS2laU1NCYlFOZHlITSsrdWUrWlo4REcxcUY1OGErSWxRcHBZ?=
 =?utf-8?B?WWxhbVpsTVMvSDhnMXdjQlhMOEZ2dW5uWWNqeHQ2SURvOUwrQ2x3QVl2Tzkw?=
 =?utf-8?B?TWxqK2c0bzZHenN5dGEzR2gxMzRnZWZLbXNua0V5dURMUk9JZC8xNlh1emY2?=
 =?utf-8?B?QTlENVN6KytJdlVNSGVSb3B3WWtMaENVV0U5S3ViL0hTbVAvMHlYOGpxV1Q1?=
 =?utf-8?B?eUprNkNESHZZZE9IZXVEWUQ4L25FVUgvaTZLOUdRN2g5SVVheUhQbGw3MXVY?=
 =?utf-8?B?REc5Rlo3Y3lLdHF0cUJvclk3NW5RcGI5RzU2d1pQQStuakM1QVVCbkU1eGwr?=
 =?utf-8?B?bDZOS01nWWdoVUd3TGE2ajZqMWd6NEFRM0RtN1Z1a1M3ZThoUXhiejYzK2Mx?=
 =?utf-8?B?R1BhVHkxTVA2NEZYN1FrWnBHanVKZ3FqSWNFRG5aSE9CZzRJczU1Zll1RmVl?=
 =?utf-8?B?Q3kxQ0pWVHhTSXI4bEFlWjRKK2Q4L1N4Qmx4bGQ4MTNaVXFUNDh3ME1zcHdh?=
 =?utf-8?B?RTVTeWxEYUxZY2Y3ZGF0ZG9sNDBxSnhUSG1EMC9TOWxxNmJkSXpuSGdydTJh?=
 =?utf-8?B?MFV0bjB2Z1pxTzR5bW40YlpKYkV4L1MzdEorUEppMnBTdVdudkxBMFhWQjdh?=
 =?utf-8?B?TXBUVkNuOVU1WVJiM2xTNHJoZnVabGdYWFhuSkpVWUNVTUdxMkZpU0xsUWxm?=
 =?utf-8?B?UVJFQmZLaDlKeVBpbVRSU1ZUTHdIRCs0ZkptMEU2Uk1DaHlaYi9VWHRlMitp?=
 =?utf-8?B?ODdjY0drK2pLcmhmbWlSWGtpL2VCT3VaNkM3VE5FUHMyTGdORm5zV1NEZ210?=
 =?utf-8?B?YXFsbWJucDA4SjRRaG9UYlphQkZmWkYrbXJqQmhuN3NMZ3ZzM05naWZhdG5B?=
 =?utf-8?B?R2FydVJwR2tyUHF5RVk5bnJQendhZnZyOHFYTUordXBLcFlmU05nTktmR29V?=
 =?utf-8?B?SEJPYU9tRlpCRHpmRW15Y21JZEVlRE45MzR2SFpHNjJOeFZhV28zNFFISUtw?=
 =?utf-8?B?azVHZWFCN2lpWXdhWml5cXhkckE1TjVNaCszUXBJZnByTFRtT3M4VStQbVVK?=
 =?utf-8?B?d1daR3pibWxQMUpPaXBhc09XZ3J4dnJpVFZsL2tlZGxtZWQ3dm83cTRwaEZC?=
 =?utf-8?B?OTdxaXJwekFlNDZmdVlSNituZEd4RHZ0eEJEb3VPNjk2R2VtSjY5VUpEMmc2?=
 =?utf-8?B?R2pEaDNCTTFNRkxUWTBad2JYOGhYNTBUSFZhQ0t0NlZta3FQRGFFYWEvakJL?=
 =?utf-8?B?V3JtUzFPc3hWV05aRFF5R0QzYTFTZWNQaEtJRis5cEVmRzh2am1RcFFydW0y?=
 =?utf-8?B?eHJLMGJzS1FRV213Nk5RN3pLdmRFT0dlT3J1VWpzZnZXNStUaG9kQU5kYXRm?=
 =?utf-8?B?NkFOQ0I5RHowSGZpL0l3NldVN2k2L0ppMWlsQy9TOStjNVU2bldFQWtCTWZt?=
 =?utf-8?B?eC9peXI1bllvU2pzS3BjN0VrK1lMbmx4b1VRSHFNSGZmNnJVNi9GcFYrUHVV?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2e6552-0650-4762-5c43-08de17b939ef
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 13:35:44.3730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkOpx4Xii8/XtnZRj5KXVso20GhnPsPJfgE79vzRx85xGn/SmL1kZXBWT4bQRFZBUEXmPGQ+UuCABbOqvF3qywqEDBOC4DNsWVkrWTKxVxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
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

On Tue, Oct 28, 2025 at 06:58:27PM +0100, Michal Wajdeczko wrote:
>We have just added bulk change of the scheduling priority for all
>VFs and PF, but that only allow to select LOW and NORMAL priority.
>
>Add read-write attribute under PF to allow changing its priority
>without impacting other VFs priority settings.
>
>For completeness also add read-only attributes under VFs, to show
>currently selected priority levels used by the VFs.
>
>  /sys/bus/pci/drivers/xe/BDF/
>  ├── sriov_admin/
>      ├── pf/
>      │   └── profile
>      │       └── sched_priority	[RW] low, normal, high
>      ├── vf1/
>      │   └── profile
>      │       └── sched_priority	[RO] low, normal
>
>Writing "high" to the PF read-write attribute will change PF
>priority on all tiles/GTs to HIGH (schedule function in the next
>time-slice after current one completes and it has work). Writing
>"low" or "normal" to change priority to LOW/NORMAL is supported.

same as patch before this one: we need to document allowed values and
their meaning somewhere that is user visible. I like the doc in this
commit message and think you could re-use it where it's visible for end
user.

>
>When read, those files will display the current and available
>scheduling priorities. The currently active priority level will
>be enclosed in square brackets, default output will be like:
>
> $ grep . -h sriov_admin/{pf,vf1,vf2}/profile/sched_priority
> [low] normal high
> [low] normal
> [low] normal
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 82 +++++++++++++++++++++++++-
> 1 file changed, 80 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>index 19724a28fb33..2e5dbf1bff76 100644
>--- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>@@ -17,6 +17,21 @@
> #include "xe_sriov_pf_sysfs.h"
> #include "xe_sriov_printk.h"
>
>+static int emit_choice(char *buf, int choice, const char * const *array, size_t size)
>+{
>+	int pos = 0;
>+	int n;
>+
>+	for (n = 0; n < size; n++) {
>+		pos += sysfs_emit_at(buf, pos, "%s%s%s%s",
>+				    n ? " " : "",
>+				    n == choice ? "[" : "",
>+				    array[n],
>+				    n == choice ? "]" : "");
>+	}
>+	return pos + sysfs_emit_at(buf, pos, "\n");


I'd just do:

	pos += sysfs_emit_at(buf, pos, "\n");

	return pos;

to follow the same pattern.

>+}
>+
> /*
>  * /sys/bus/pci/drivers/xe/BDF/
>  * :
>@@ -30,12 +45,14 @@
>  *     │   ├── ...
>  *     │   └── profile
>  *     │       ├── exec_quantum_ms
>- *     │       └── preempt_timeout_us
>+ *     │       ├── preempt_timeout_us
>+ *     │       └── sched_priority
>  *     ├── vf1/
>  *     │   ├── ...
>  *     │   └── profile
>  *     │       ├── exec_quantum_ms
>- *     │       └── preempt_timeout_us
>+ *     │       ├── preempt_timeout_us
>+ *     │       └── sched_priority
>  *     ├── vf2/
>  *     :
>  *     └── vfN/
>@@ -115,6 +132,12 @@ static const char * const sched_priority_names[] = {
> 	[GUC_SCHED_PRIORITY_HIGH] = "high",
> };
>
>+static bool sched_priority_change_allowed(unsigned int vfid)
>+{
>+	/* As of today GuC FW allows to selectively change only the PF priority. */
>+	return vfid == PFID;
>+}
>+
> static bool sched_priority_high_allowed(unsigned int vfid)
> {
> 	/* As of today GuC FW allows to select 'high' priority only for the PF. */
>@@ -199,15 +222,70 @@ static XE_SRIOV_VF_ATTR(NAME)
> DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(exec_quantum_ms, eq, u32, "%u\n");
> DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(preempt_timeout_us, pt, u32, "%u\n");
>
>+static ssize_t xe_sriov_vf_attr_sched_priority_show(struct xe_device *xe, unsigned int vfid,
>+						    char *buf)
>+{
>+	size_t num_priorities = ARRAY_SIZE(sched_priority_names);
>+	u32 priority;
>+	int err;
>+
>+	err = xe_sriov_pf_provision_query_vf_priority(xe, vfid, &priority);
>+	if (err)
>+		return err;
>+
>+	if (!sched_priority_high_allowed(vfid))
>+		num_priorities--;
>+
>+	xe_assert(xe, priority < num_priorities);
>+	return emit_choice(buf, priority, sched_priority_names, num_priorities);
>+}
>+
>+static ssize_t xe_sriov_vf_attr_sched_priority_store(struct xe_device *xe, unsigned int vfid,
>+						     const char *buf, size_t count)
>+{
>+	size_t num_priorities = ARRAY_SIZE(sched_priority_names);
>+	int match;
>+	int err;
>+
>+	if (!sched_priority_change_allowed(vfid))
>+		return -EOPNOTSUPP;
>+
>+	if (!sched_priority_high_allowed(vfid))
>+		num_priorities--;
>+
>+	match = __sysfs_match_string(sched_priority_names, num_priorities, buf);
>+	if (match < 0)
>+		return -EINVAL;
>+
>+	err = xe_sriov_pf_provision_apply_vf_priority(xe, vfid, match);
>+	return err ?: count;
>+}
>+
>+static XE_SRIOV_VF_ATTR(sched_priority);
>+
> static struct attribute *profile_vf_attrs[] = {
> 	&xe_sriov_vf_attr_exec_quantum_ms.attr,
> 	&xe_sriov_vf_attr_preempt_timeout_us.attr,
>+	&xe_sriov_vf_attr_sched_priority.attr,
> 	NULL
> };
>
>+static umode_t profile_vf_attr_is_visible(struct kobject *kobj,
>+					  struct attribute *attr, int index)
>+{
>+	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
>+
>+	if (attr == &xe_sriov_vf_attr_sched_priority.attr &&
>+	    !sched_priority_change_allowed(vkobj->vfid))
>+		return attr->mode & 0444;

first time I see a attr->mode & 0444 return from is_visible. It's
usually the mode or 0 to make it invisible, but this looks correct... it
would make it read-only if read was allowed or invisible if the attr
didn't have read perm.

with the doc from commit message added to the kernel-doc:


	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+
>+	return attr->mode;
>+}
>+
> static const struct attribute_group profile_vf_attr_group = {
> 	.name = "profile",
> 	.attrs = profile_vf_attrs,
>+	.is_visible = profile_vf_attr_is_visible,
> };
>
> static const struct attribute_group *xe_sriov_vf_attr_groups[] = {
>-- 
>2.47.1
>
