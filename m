Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0533DD6CFA7
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 21:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B300210EAD7;
	Thu, 22 Jan 2026 21:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RnJDJoYI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0240010EADC
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 21:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769118177; x=1800654177;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IglrUol+bR5AlKtWK7H+RzjshfgIZMSFzxIlrNxEeMk=;
 b=RnJDJoYIt5KDydx2MZCvTFMsgOFWGbfozf7TYlvB1m0l9/tVqwdEcmri
 cTsJOM/26ee8Kd1KN4RExnHnDCV5GQcH24/sCauYv4njqddKOghatpzSc
 hMJF4q60NpogzziDMnYAWbh6fj6Ypn43hNvapCVkVKheU2yaOlqHYpoCA
 NcnhkcBPfe9t2GFhyAgbCDC8H76/yjd0/Kq7Odw35M0cxBqRJJ9q5UH4K
 Cj4Vvi60ALoJ1SfTmdtrI+360AiU5RwKJXrCHd8Is+3uNUmDTrIIuSAb3
 eI+o1ORVQSLxjt9MdVd8ObPRMwjmNTtmDLTux3/NGjrz0EeqSegkQriFo g==;
X-CSE-ConnectionGUID: IMt8qCaeS++6/v3XneQt1Q==
X-CSE-MsgGUID: cClE5mqAQOuLPNFxhS2Lig==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70428269"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="70428269"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 13:42:57 -0800
X-CSE-ConnectionGUID: Hv/t45DTR7qfv65D1sbmfw==
X-CSE-MsgGUID: UA7AjCdWRnuWIny6IeV2Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="207100128"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 13:42:54 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 13:42:53 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 13:42:53 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.8) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 13:42:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HC8M1TcjXk5F4rkzTnd5xg+XfSOtkoCJXJcO+zhvG/TKfg3PJ29shi/e3UnCag1copmR+s159TILQKkcD6MyCOPu76QHLchx6R4vaFpuCPVuOt41tovZ5fBw8qOQ9FlamiC8X2gbepCVzrCRM4Km4VePqVknJOxSL/su4fPtv9dmEMEi1FHar6ZSBhqN4V/zAEPECSbeEALuc7DWGvnP7fmVw0AXudbuM+e6eOLedQq/lj+riq334xsF0xsSdPyHVao96hQ/J79m4wxSA3RChXOiaotSXZe+xFa2/HimtWKhpIRk09/rBJiLKeZsBQi7bFLMmmU2unIdKcGBQDiHAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jJfGG5EBdwqS1+5DQzTjRnfqD0SKzI6wXbJMSUcZyo=;
 b=LRz0TTSexf03csbxUIWQjnE4odcdBUIUrnpeQUdo0zKaAGDVO1J/2n6oXy/j6O6fSOPqlWGwCRlHhMRFAKwjke5k6QdDRHquXnUKPJG7mTb+x1JXw0+KNwtv2bw2dRaMZFne8FfHxyD5HjGWXY9GbyQTZLnSjVKjJS/8EeZ3EBefIf3VB/SKpv8bFeNFnZMNi9lGpWLOBSaV2JxYnRJNBAhgp114RFVtCONNIQ0TqcQCL1NNxGYS+c3D8PecT6wei7xMsH9hztzRNuBVLLO3vVpssdihO1HJuKJingBo53bXhAKD0BQEpzo8C71L8nz3NtSMqMHq6SAulCnlK8ZVFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA3PR11MB8004.namprd11.prod.outlook.com (2603:10b6:806:2f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 21:42:46 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9542.010; Thu, 22 Jan 2026
 21:42:46 +0000
Message-ID: <5d9b546a-421d-4006-98ea-a2e930f935fe@intel.com>
Date: Thu, 22 Jan 2026 13:42:45 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure
 on reset
To: Sk Anirban <sk.anirban@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <vinay.belgaumkar@intel.com>, <nishanth.p.reddy@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>
References: <20260116103451.304716-4-sk.anirban@intel.com>
 <20260116103451.304716-6-sk.anirban@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260116103451.304716-6-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0011.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::24) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA3PR11MB8004:EE_
X-MS-Office365-Filtering-Correlation-Id: c14911c8-0cce-4e6c-795e-08de59ff2e91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDNKUVpRTDQ2MDlWMTRhTDc2SUdVSG9OOXQxVnpjNFo5b0lCNmk3RzRHUTdV?=
 =?utf-8?B?OW5sa0g4QlhFdGJyNThMRW1WcGYwNWtWb1llbTJyOVZzQWVkNVVsNVRDaE5X?=
 =?utf-8?B?bGpXQ1UwQ2pRVEVUVGl2SFV0UlJXQWcwTWRNZFRCOTFsbWwvbkt4bWtIM1g2?=
 =?utf-8?B?dkFzWkdqaUQ4VS9rUjJKbjJXdElyV2o5T29DdXhudHA5U21oRjlJYjJHNlV0?=
 =?utf-8?B?WXlsVXN5Uk5vWTJwc0loMS9WVnhiVXhhSEluVFVKK2ZhTUFXbWxRMDZuSjN4?=
 =?utf-8?B?T1ZWM0REUUNiY0VNaTlna0wzaWRTSS9nRzh3cnpFR09ETTdyeFY4djRZUDgw?=
 =?utf-8?B?c1JxMkhRT0V6bENuR1RrRGNPblUzTTJIVTY2V0dQcCtna05YekUyWDkvT2xt?=
 =?utf-8?B?aW91ZTZKWmNFdVVvZEY5cWxRZGEyejJKTklRcTFnTU5SM2pKckREU2t5Misr?=
 =?utf-8?B?L1ZMYVpqcWVRYmVXWkhvY0drYllyVVd4ZVVBamZ5QmlISEhpenJvdXFFY2hL?=
 =?utf-8?B?YmxDdGtMb3R3YS9aMEhoZFltdEl1WVFuU2tWTkFQbHUrTUZJNGgvK1h2dVA0?=
 =?utf-8?B?L3hpVHZKcDhxaWxxUFFZVkdwRExoVyswc1UxR0c5amlRU1hUKzl6cGxTaHg2?=
 =?utf-8?B?RTVqWWJqclpsWCtIcFQ1OHllRHZLalk3V1B2UkZFR3ZHTXRBNU9Malg0QjZU?=
 =?utf-8?B?TGtjZjdUZ2w2TzFXZW02b1ZrM25TYjFkMkxldHNubHlZYzhmTlNaV2NIYWRq?=
 =?utf-8?B?aFRCbzg5UEZ3RVZSRmlQMmk5SzZ2anllaTBxUW1KaG9Uay9xRm5ycGliRTVG?=
 =?utf-8?B?dzd6MFZNZ2h6ZU96QjA2ZzE5K1F1VnphYjRjYmIwN3UyQURIMWdrL2xta1F4?=
 =?utf-8?B?SjVoREVLZXB4VjVPdGtwcFlZTEZKY2lSUnRhaTNmSEZ0QjRsNTRsVGN5RXJH?=
 =?utf-8?B?NW1EZEltNEVaa2pjZ0xOamhiaUtkYXdJN0tpQlNiN01HOElPK1hFUUEwaGhF?=
 =?utf-8?B?S0Jyci9pejM2Z1BZNlg3VHA3NkorWmRrSk1kM24yS1plVXlWNzFrSjVOODE2?=
 =?utf-8?B?Qno1cFJraSt4c2NaVUhPVW9kditHUzBHM2Yrd1o0Z2xmZ3dUVHBBa2FZenFL?=
 =?utf-8?B?VWowS1g1dytaWlowWnF5cmx0ZU9OZnNCdlFOWkJ4cWFrQVpYTVBOeU42OC8x?=
 =?utf-8?B?M1kwbnBwejNNR3VtdVUwZnVLQ0R5RHdiTVdkY1dDbittYWp5eDdvWVN5UWhU?=
 =?utf-8?B?WFJqa3lURmtPY0RvVlI5SWdkTFNWVEZoWGE2Z1pDL1FkbVZOcHlQS0U1ck01?=
 =?utf-8?B?eC9NZitma3hMcUZPQlhObzU2amJVMkRZWnRJYVFPZi9rSzNaZXB1WVRwQnFG?=
 =?utf-8?B?ZTg3YUNtUm9EQkp4YXJxeDh1MDVad3BJZ01Rdm9QeVBReUphYkcyTmxCTytk?=
 =?utf-8?B?K0pJbWJpS2x5S1JSU3I0REhkanIvNjZ3cWNuR1VEMkZJMHpHMlJKOTUwT1N0?=
 =?utf-8?B?bFZmcHdLZ3IvR3JDdVdGcEFBOGtQRzA4Uzd1d3dWTTF4WkNtRGFtTFN6NTZ1?=
 =?utf-8?B?T3NWWHZ0cXFkMjlWcHNRRWJYV3pDQXI1RFc3bHBSSHFONnhpZG8yTUNPN3dx?=
 =?utf-8?B?MEpFSHhJdFY3b1pLMm5JQnRtM0ZpRmxNbko0eGpFWTB4MkxrQzFZVkFqRGFO?=
 =?utf-8?B?MmFrWkRxbHVXL0trc3pYRmtCTWV4N3ZlK1BrMDk2WDJHK1F3eXc2QmY3cXly?=
 =?utf-8?B?Q1ovbVVSaXBzQjJZbEQrL3RhdldtV2Q3UU5rclc3Y1I3WTRCV1dPOEtyemht?=
 =?utf-8?B?bEZQdFhpZ2JSQ0d5NlE3MGdhT3dYekdYa1E0WExJTWsxSW50d1lrK0oyOTRD?=
 =?utf-8?B?VXIzeWh6UW9MeVdSRGtXSkZiRStWYjZqbnQ4MlB4WUxzVFJuWWVxOXZVeFFB?=
 =?utf-8?B?Q2RyL2Z3RzdkQ3NtanJsbUJFbEQyN2RGd3c0SUdhTDNvR2Z0VjdIWTdqUGx1?=
 =?utf-8?B?ci9QSjFaaG43Vjhsc2p6V0FyWlBJNjRKY2VuT3ZUcjhvaXRhYnNCRGtHM0Yr?=
 =?utf-8?B?eVJpZk5wbThla2xJb0lCQVB5UHR6alNpV01XMEJ1VnhZTGZ5M2VCNitYYy9t?=
 =?utf-8?Q?6LxM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emRzMlpSNGk4U29ab2hPek1XVWJGUzNYL0RXeVNRMjVINzhiQ1RFMWZwUTdF?=
 =?utf-8?B?UzBKVEZpQ290SThLbEhDT0l3bVFNWnpKYmF1Qy9wODVLb0FWTGtObElIcUJH?=
 =?utf-8?B?aGVvZG12UVpLY3MwcElhMjZNeTJ2d2EwZGROWk1uZ1ZUSWtnZDgxZUJ0Tjl2?=
 =?utf-8?B?S1hnT2Z5UGRyQy9rV3RLVkl1QURydkdrS3VoSlc1d01xV2V1ZTJVb0hxN2p0?=
 =?utf-8?B?UEJWNkdXcUw4dlk0U054K2NEQkEvRlg2STJyQVV6T2dlaU9KRGF6LzJKdnE5?=
 =?utf-8?B?cHpZV2RoUXpqTDREczVCRUNaNXhsZUVIRldkdy9yVzNDR1ZVWkZFbkUrL3oy?=
 =?utf-8?B?OCtCY1NFbHl4WVNKbTJJTkEydmNPQVkrMGk0d0FtVmdGNFJWY3JCSFFxOFJM?=
 =?utf-8?B?dk1iRlhMMXlEd1lrZnNFK2xoelBsT0ZGdm5vbkhOZEpMWlQ4b1djSGEySWFk?=
 =?utf-8?B?Z0p5TklleHFnaFVPTXFpNVROMCtTQVBsbWhGcDU2c0pSbmRLMGN3S1BKRmNW?=
 =?utf-8?B?c3AyWTI2Y1lka2s0ak9oZVMwS2NYZkFJZkhVVndtdjlHZEtrNW9zZHlVN1M4?=
 =?utf-8?B?UnpRc0tXNElCWXRGZlpHcHZHTkRpSytiUHgwMzV1WjBBTWszczJaZmlFa21L?=
 =?utf-8?B?TGtQVGlrZlRSR1dQS0tMbi9oQmtMcnlaZVpRem5raGw2V2ZzUHdoVzlUL2Fm?=
 =?utf-8?B?c2dXWnhZTGlZRDI4SElkQWRMeHF3WFVCTzNEanl5OXJKK3h2eU8ya25mT0J1?=
 =?utf-8?B?OFVmZnIzNkZKWlJTOVAwZy9KazNnM1B3SXhxNmUybU5PZEZ1MUdpQkJNOGlL?=
 =?utf-8?B?c3lKSjlPNXM1TWZHS2hnRmNYSUJSbkZrWUF6TmpiTUtpb1NCZVA4WVZkT1FX?=
 =?utf-8?B?ZjBxdzVUVUFNeHhKOXlWVm15RzV2MUZpM2pZWGVubU9XOXdlc0x0WDZKakky?=
 =?utf-8?B?TWkvL1BhalgwVE4yd01Qc0xoZzhlRDBuWitSRGh0QTk1cFZkYVFsT1pCT3U4?=
 =?utf-8?B?dlU0UGdwdGI5TWtXaGlLLzcvQ08vUC9EZUFtQWtkOHBLcDhqS1BPLzlPdjlz?=
 =?utf-8?B?Mk9WdDIvRVRtRjUxanJvb01CVXYrd0FQa1hvV29pSUFEUXFjeU1GZGhtbzBL?=
 =?utf-8?B?SlNkM0ZySkF3eEJ2WThYemZ4TjgxNFd0dnc1TDRaSHhTQWVGbFNOeEMwN1pN?=
 =?utf-8?B?d25aYlpqUWtCZkJGcGhLV1JSVm9zb1RXZlJYTW9EMG9iclBkVVpvbnpCU3A3?=
 =?utf-8?B?c1Q3TFZWT2YweVJVOWdxeUFKaEtrZ3BnTUVwMzNlMklOaHYraW1KSmtCSjBo?=
 =?utf-8?B?REVIWk5BU01WVkVKMThWZHpWQVZ4YUc1WHA3em1uT3Z5bFEyUkhia1VYYnZo?=
 =?utf-8?B?alVEd1N2K3hiaGxKQ0xYRzlZcVNSbTNRMUxaZmU2RzJjY1RZMC9YQkRPS1do?=
 =?utf-8?B?KzdReEdrT1dhbnBsL0t6dTNvQ1JDRmErdUZtUDVyT3JnL3Yvbkt3Mlp3Wkh2?=
 =?utf-8?B?dVlxUXlud0h5QnVoaVFuVzFWRzZHRkRqOTg5SHh4U1A4bjVIV09DRk15a0tG?=
 =?utf-8?B?NldDK3lIanpwcERYRHI1QnVYSk1VS1F0RUVQNnpUZGpyMEJsQmQ4c0VObjJx?=
 =?utf-8?B?UFRSdm50a1VDVklld2pmTkkwaUZnVWpVM3dDME1ZVk5qYW9FWGJOQkkzVVJh?=
 =?utf-8?B?b3JFNFJYd1Vja3JqMS8vZ1NpMWVod1VmNmh1NE50eE12NUJNZzlxbnZqaWtU?=
 =?utf-8?B?N3pOejd3T3lVcHpMVnRBSlQ0MS8vVkJCRUU5cXBRRHlTTkJFaExxbUsrRW9a?=
 =?utf-8?B?TFZGVERxakFRZXhyQ1FxMnBKZlRUUTZkWkx6Nk8vekFaYTNZbEp2dXBMWlZI?=
 =?utf-8?B?eWo5aWZYa3hxMzhyWEdGMDhZVkxOQ0lZc014d0dVSG8vV0E2Tm1mellMQ3NY?=
 =?utf-8?B?aDhIaXVsMFN1bmJ2TkdxWUgxcjJCVTU4UWpYSFR5dTBBNks1OWxmSkFGTmFK?=
 =?utf-8?B?d3pUb1JJVFNPLzV6eXZrMngzQ2pTai9zZVV4aEc3U0hyNS9QRjVtcHY2UFo1?=
 =?utf-8?B?K091UXNjS2NNYituN21jMkV3MnFSYlRvcGwwTDdIWkloMWZDYTlVWURUelg0?=
 =?utf-8?B?aVZ6N3V6UFl6SER1WFhMRUNqc1NTOHQwczh2YS95Qk5aMnl1eE4rZHVNQWNv?=
 =?utf-8?B?Q2lJbjFJUWx2UHZRZ0xGeE0rZWthUGRqRmdSclYvUjQzSVY5SWFrKzNFNlJV?=
 =?utf-8?B?bVFJZEJoTlZBOVNWN1NZQlpkK3B5blhLQ1l1T1FKL0pRVW1kY1h5bjRBaEZq?=
 =?utf-8?B?MmdJT3VOYTIrd0p4VGRhWHlrTVFESjQ0UFpCWmt5Q1IxcXE0QmhpMWFkMURO?=
 =?utf-8?Q?qqQYu+HHBpGqFs2Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c14911c8-0cce-4e6c-795e-08de59ff2e91
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 21:42:46.7553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bsyh2YspIEzeOB/IgQPzmj4T5FfcxtNZHXSRR/wmlPV9cXdtMHPBxRMIXQL8lJ7Mdtf3cz0fYwufIdyGPvmmwJuVKreVh7Cc7XAjjlKpK8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8004
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



On 1/16/2026 2:34 AM, Sk Anirban wrote:
> Prevent GuC firmware DMA failures during GuC-only reset by disabling
> idle flow and verifying SRAM handling completion. Without this, reset
> can be issued while SRAM handler is copying WOPCM to SRAM,
> causing GuC HW to get stuck.
>
> v2: Modify error message (Badal)
>      Rename reg bit name (Daniele)
>      Update WA skip condition (Daniele)
>      Update SRAM handling logic (Daniele)
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 +++++++
>   drivers/gpu/drm/xe/xe_guc.c           | 30 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_wa_oob.rules    |  9 ++++++++
>   3 files changed, 47 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 87984713dd12..c9cb02f32f5a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -40,6 +40,9 @@
>   #define   GS_BOOTROM_JUMP_PASSED		REG_FIELD_PREP(GS_BOOTROM_MASK, 0x76)
>   #define   GS_MIA_IN_RESET			REG_BIT(0)
>   
> +#define GUC_HASH_BOOT_CHECK			XE_REG(0xc010)
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
> index 44360437beeb..42658a409556 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -900,6 +900,33 @@ int xe_guc_post_load_init(struct xe_guc *guc)
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
> +	boot_hash_chk = xe_mmio_read32(&gt->mmio, GUC_HASH_BOOT_CHECK);
> +	if (!(boot_hash_chk & GUC_BOOT_UKERNEL_VALID))
> +		return;
> +
> +	xe_mmio_rmw32(&gt->mmio, GUC_MAX_IDLE_COUNT, 0, GUC_IDLE_FLOW_DISABLE);
> +

The WA says that we also need to wait for the status to be "ready" after 
setting GUC_IDLE_FLOW_DISABLE.

Daniele

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
> @@ -909,6 +936,9 @@ int xe_guc_reset(struct xe_guc *guc)
>   
>   	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>   
> +	if (XE_GT_WA(gt, 14025883347))
> +		guc_prevent_fw_dma_failure_on_reset(guc);
> +
>   	if (IS_SRIOV_VF(gt_to_xe(gt)))
>   		return xe_gt_sriov_vf_bootstrap(gt);
>   
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 5cd7fa6d2a5c..ff2efc7a68cc 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -73,3 +73,12 @@
>   15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
>   16026007364    MEDIA_VERSION(3000)
>   14020316580    MEDIA_VERSION(1301)
> +
> +14025883347	MEDIA_VERSION(1301)
> +		MEDIA_VERSION(2000)
> +		MEDIA_VERSION(3000)
> +		MEDIA_VERSION(3002)
> +		MEDIA_VERSION(3500)
> +		MEDIA_VERSION(3503)
> +		GRAPHICS_VERSION_RANGE(3000, 3001)
> +		GRAPHICS_VERSION_RANGE(3003, 3005)

