Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98F6C3ABCB
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 04:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F7110E1D6;
	Tue, 17 Sep 2024 04:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ObPOB2iX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7C910E1D6
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 04:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726548551; x=1758084551;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u502om45bsHovuJJW6xSnp3BPmaL2QX8qv2c25GgvgM=;
 b=ObPOB2iXv93ejda+npy4k9RmttzrWt2b1eCChX5qjfuKKLgnxWNY9Cun
 hHEQaj+qjAbxFGTKbcy4UrNpimBx1XTxCYcWTrJGw1pfsl+Ardw1fsgUb
 0u5OJD8AzUDa8N/mjvehReUEQub1LmN82aVjnW2bajHpCsrPF0j1xziY8
 ndcjTZoMNjXtrXURmyjzMMj+xqgXWOYrN90huxFQXeSzzLc01zfUdK5/C
 7QwBxCtx4WRUdQbZ1rwG+HVbBLNLzqiIUboAtJvCIb26R+M77b6Xz1I71
 9WjSmaaIspiaqilSVaX2oprFv3X33dSM/nI1qrfVhzFmid5ndDrM+maK8 w==;
X-CSE-ConnectionGUID: RHwOxLR8RY+YTOENfrS7kg==
X-CSE-MsgGUID: xCgbacwyQfmfjsI4/YcPgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25328478"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="25328478"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 21:49:10 -0700
X-CSE-ConnectionGUID: DRx5RFtaTB2uF+SRmkCS/Q==
X-CSE-MsgGUID: cpyuoqh6Sra/neUTeE1/gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="74070267"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 21:49:11 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 21:49:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 21:49:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 21:49:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzJQMNPkRofUdzDDr9hVnmBRLPmb+AXIy88zWjcVDZzTXg7LvW6CC3vlXqDVGl35q2JzGmQ54MjysZWf5xl+EQxCxEFFrT2D76NslZVsN5991oHlx0gSa2mqq+8+SSP17BEi6dGZvmXdm3scT1xoA28qOI35FqQWRG69Fxa592VXExkhcsNzDR3l4i1Oam51Necs3dniA+wJkUJg2rL1D5Jzi+KeW+vsYwzQyOWOauUvmopBESkgde9r9DmsdHpbJzxjGgijSbpQw4Ou2qYHKqHPJuJvibqtJB0SRjgCpTShahDAfQtcefybQouDJzcYa7v0fhZ/CobiwozDX30YIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjFaBFuGxyi8k1yruFlfdmN4sWd2K2xb4E1JcBZehK4=;
 b=rhNTurxtukGD8y7rVfAH3KqgqpN1/pITH5zFw48iM+pgJLNyrndqZxtbyBA1/PzD4yafIcl7V4vTwJH7lKQL4sweRMpXUu/GjfWGkVitIvlEFyaI9VuTpB+kQc+YgjJvmEV0ct92sZ7tCbwi45MZiSgfhE4IyGSl1sZV6OEYdWBhl5tCCC9ZsEgkDr78gyVlw1U2Y1SIYcJf5xrs60J2ryXpMrlIGCShg3oIvhe4w4aFpJrE/oBWVXsL2i9/cFm6ihYMQ0r74VtQPybSCmihOutqg8sHZNMoROqo1XDaIobc4KzWJHDJOsdhwerOkUA551mkqaijdPKsEdt4UqzJQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW3PR11MB4652.namprd11.prod.outlook.com (2603:10b6:303:5a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 04:49:01 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 04:49:01 +0000
Message-ID: <c93e3fcd-6648-4a07-8645-6e10310f0b41@intel.com>
Date: Tue, 17 Sep 2024 10:18:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/23] drm/xe: Change return type to void for
 xe_force_wake_put
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-24-himal.prasad.ghimiray@intel.com>
 <fdf3d4ea-dacb-48e2-8b20-a4fd6fd73e00@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <fdf3d4ea-dacb-48e2-8b20-a4fd6fd73e00@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0174.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::12) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MW3PR11MB4652:EE_
X-MS-Office365-Filtering-Correlation-Id: 285634c1-736c-4f1d-2956-08dcd6d40cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qk9mMmh3M2pCV0lIN1BKejk1ZkhneXo4eHJxdm42VlBZejhBQmFiQWZyZCtK?=
 =?utf-8?B?WDJkZ1RUUlB4dERuRHV3STFDRFdYK211S2p1WWhDT29KRTkzeEZxRnR1SmF1?=
 =?utf-8?B?VW02UFFMbGxBb1d0bnFmenY0UU5Hdm5VR3hhK3dGZGhjTFBHNk1vM0V3b0Z2?=
 =?utf-8?B?a1hqY21YSzhlVG9iWHJ4cHIxb3E5cC96OGpyanE3KzgreXNYSElaNjhTaU5z?=
 =?utf-8?B?K1JIWmZ6NjRSYys3T1Y1bTU3RkdQVHk3TmNZUUNCMUJOZ1NZdTFvanN2cjJx?=
 =?utf-8?B?Tk9WSW9jREYxZTczTHZNSzU0djh0WGFsTjl3TDhRVjBpRElKN3BxUmNPeThV?=
 =?utf-8?B?bCs0Y0VaWEVwWGw2VWhiZXRveXNKR1FCQnJlOUU2dkhJbm44OUo4d3JPM3I2?=
 =?utf-8?B?dC9acG1DWkUvYWZYMTdnNUdnMkVUN21PVXdGbWlVa2wybFJ1ZjllTHJTbDNK?=
 =?utf-8?B?dEQ5T0xGQ0I5OFBuTlBBTy9Kejc3OXFJQTFtN0hONDhhNFRDNnl2Ym1TSE8y?=
 =?utf-8?B?OVk4YlB4Vk9tb2gzd0p6TS84UXhpVUhRUVFnaEYzd0NZclZtbkhEcUEyNUE4?=
 =?utf-8?B?b01KRTFHaTlsNnF3RytzdG40UnFqMjBtSEdVVE1HdXV2Z3d0azlMekcvdFFB?=
 =?utf-8?B?Rm9PcnBlcW9SQzd1Z2tJUnhtZ1VrUUY4Sm9VVUx1cEVQSFp0VlM4Qm5mOEp5?=
 =?utf-8?B?Wll4dlBLRlZGZFhPRDViZ24ydm95Y3l2UkN5TldoV3RMNG9CSU02WElSN0x5?=
 =?utf-8?B?UUFsLzZGYXprSVQxTHFKODc1WGFPMHFsK1FqREptZTVMMEZOUWcvaWxObmN0?=
 =?utf-8?B?YzlGT2lqMjc0dTVrTnBtSFV4UXlWa1NHTnJZaG1jT2x1TnhVWm9WbDBVeUtM?=
 =?utf-8?B?Mm9RdWVHaE1iMm9SYzVXbmZ1Skg0bUZGenRxK1ZEY0luZkszQTNRNExHK2kr?=
 =?utf-8?B?MzBmVm9TT3ZUQy9Band2ZHVBMklGdVlwOEpLd3FyVTNlZzR0akczanVYMUN1?=
 =?utf-8?B?UFZkcURRQVVCakxDMmM3VkhWZU43RGMrV2MyQUc3S09rYytqWE1iUHF1R1J1?=
 =?utf-8?B?SGkxbzVwQjIveStuenBRZDhWWTNjby9rUVlpeDR0UUJ2cCtpb1h2SDZQRE1I?=
 =?utf-8?B?SEFuc3pOZ0ZqUzBZMWhHcUR5WkNzVzNpaGlMbnlFMWg3M21xdXMyQlNUdVlF?=
 =?utf-8?B?VlBZLzFqcjB3VHhiOFR0ejVmSEVCbWNNdUovU0UxcUNPaW5PUkZDYy9vbjZm?=
 =?utf-8?B?M2tpMTJrYWJBMkhUQitVL2pIeENkMVZ4T2NFWnpLTEIrWmJTcEpvMmVWVlpE?=
 =?utf-8?B?OEt4MXc1Wm13L2xFc0Nod2IyRnVTV092YUszQTdTQzFVb3JnN1k2REoxa2Zq?=
 =?utf-8?B?UUNlOUJjVEFsRTRJdlNVRjYxMWZFWnF0OUF4NUVHcEplcFU1R1U5d0dTa2tl?=
 =?utf-8?B?dnlYKzZtL0NyQnB5MFQvZThpUXdWVWdJWEdQQUlvREdZU1RFYklieStsM2xD?=
 =?utf-8?B?Z2E4NGZxSHVKd0FsT0xRNXJyTHBwd2NTSVA1VHU4czBhdW1xY1h2UkhOS0Uv?=
 =?utf-8?B?SHUrT0xmZmM2Ui9Gc0FFNHE1M1RQQ0lrZTlKeVpZYlVMdGVVMFZ6blRBanN2?=
 =?utf-8?B?cUFLdkxlcFZPWGF0SjRsUFNNUUtoaUY2QzB0b0FpMlY4cGFTTy9oOWwrSXJY?=
 =?utf-8?B?Y1FBazM2U1N1YnU2aEsrbWZaa3JnWXl1N3Rsd3U5b21GSUJLK2ltcFcvRlRM?=
 =?utf-8?B?YjJIMC95UDdDOTgrTnJJQ1EzYXpOL3BLaDFaSUt2QWpSeDdlUzkydzJkUnlU?=
 =?utf-8?B?TDFLYTVnVG1TNkRaMXlsdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHdGT1NMTFIwVjdWdUtDb1kyYlB5RUtXME96WEVFZGNEZExLQTkrSFFEVy83?=
 =?utf-8?B?b3lCdjBFTGE2MVgrcVo0Tjd0OHJ1TVVBUkU2UWFOL1N5OUJiV1MxdVM2cjBK?=
 =?utf-8?B?bjJYeFRFRFN4TFAzVjFsVmVEOWU1dzZ1R280S09nMVBWYldmY1ZPVFdhb0R4?=
 =?utf-8?B?NHdjeXhtN0RIaVYzWFhBK0FNVThVbGQyVlJyR0YvSnV3ck5mcjlyNlJmeHAr?=
 =?utf-8?B?S3VaV0labVFZejV5WmtzQlhkZlpnN3VybHZYMFkzVFk1cVAzTlJJZVZlSmp3?=
 =?utf-8?B?dm9ReEt4NDIwSXV3Y2Qwd1dHazNDTndicXJnbzhNSlN3dGs1ZnZCVkRwODlI?=
 =?utf-8?B?aXJkSU51TWZ5Ynd0ZUlZYU1ySjhaR1g5K3NQYWgxbGUydUtoTkxtOFB2QUk4?=
 =?utf-8?B?MzgraEFpT09uWjA1NFE1TUh6YWhFVWk4ZmthWStYM2ZVcmdlTkFwaDNKMHcr?=
 =?utf-8?B?b2ZFRmxBMkw0QitNbGEzeE1BWkpISHVGTmxYWWVpeVdrc0JZa2JtSEpFTERE?=
 =?utf-8?B?WTF3TENKZGswOEd3cVd2SGhub1Y2OW9UeUVib1A4VVB6QWVtNTJHUS9VV0pn?=
 =?utf-8?B?TjRsS3FpNlFPZ0JDS2U0dHQ3NWxXSFJma0lESFRLMWh4SHJ0UWkvK2FNRnMx?=
 =?utf-8?B?NGRneSs4cWszTUZ4a3QrTVAvVkhJN24ydmVDekE4OEpSaGNtQjNHYjNQa3pN?=
 =?utf-8?B?QWdCTUNyZlFVcExJaEZLQUZFVVRxZVk5MjlKOEcvM3hVSzMrdXVLUTlZbTVk?=
 =?utf-8?B?aHBVTG9LY04wMHNVRk5UaGk4bWUvMXZlWTIvc3pPd0pGRGFrZXFaT0E3cFlK?=
 =?utf-8?B?MFp1V05ncjJZT1FNSElaSVdPOUppalp3REhoRk5ZZUJ0L216a1RJenZJT2t5?=
 =?utf-8?B?L1ZmbXpxc0U3cHJhVGNpbWE3UTJYUFBad2VtbVlGNHl1c29xR3p5QU9EKyti?=
 =?utf-8?B?N1IxNlUzcTJNenkvMVJaTVZJbG5IMzFkcUkxTlpQaFdxMmRPbkpUdlkrTXRx?=
 =?utf-8?B?MXdkZ2VTMEIyMkREMC9DVVJ6bVFGWWdIU1djc29aZFJJSzVqUVk2V3RBbkVX?=
 =?utf-8?B?MnJpUGd2cmdkaVozRXNZTktQNkhXV3VXT1BZbVkvSGhGMWdIQmlEaVdVSE5U?=
 =?utf-8?B?KzlHemlXUDFLMGhzdGxqVUdPNXpRT2dNbTIwL3V0T1Y0Y1E2N2hzVmZPL2RZ?=
 =?utf-8?B?WWFQR3lXS3Q4S3JPR3ZlMXJkRjJIVjU1a0o2bDQyRnJEblp5WElMM1MzUW42?=
 =?utf-8?B?TlREejhpSm95L0V4UlpiVnJoR21lS2hNcVFDaHJmQ05sRlBSRTdIa0FPRzdS?=
 =?utf-8?B?VGJFRFg0TnBCVDNBa2hKSjdSYUt3Tk82OXlMVW15ZTlMZzZoell3TVBodkJ1?=
 =?utf-8?B?a3A1SHJKZ0hpcEorMlU0ZG1qazloeUpWTjQyUmdOdXRrY092ZWtHNUJzaDlV?=
 =?utf-8?B?ekxZeGUwcGsxNU1lY1R6cUJnSzltQW8xMm05V0pxdXczN1dMaXJWc0ZTMy9x?=
 =?utf-8?B?WGY0VzRPcnNndlZ5QXFqZ0pvc0lEVitQb21LZnJmdEp0L0drR0hPaWJncjli?=
 =?utf-8?B?dFN4ZDhrUDQyN2k4WE9KeCttOHh3UFBRS09UdkJqam5VSUhLWm5hYUlidFlt?=
 =?utf-8?B?cmtWYkxLbW5hK3NMWEFLellFWXVvOThkOHJQL2N4bnQ0QWpKM0FldE9jWDFB?=
 =?utf-8?B?cWFMUzAxbDZZUVlJN3R4d1FMdk14aG5iR3c3aEt1SGU4Q2VUcm9kU0VETi9v?=
 =?utf-8?B?RS95Y0JTSVB0VmlwMUROa3R0Mkc5dnRFT3RvMi9DVUZFcnh6TjdEMkxlWVEr?=
 =?utf-8?B?WXVlYzc0NFJvSklaWmh6ZjRPNnhIbWVrSnpsNUlsSCt1bENUbmMrdjdyRGNp?=
 =?utf-8?B?WXF6bG1OSWRmMk1RS3dodVpnSVJ1MUtta1ozWmozNGwzdkhMb2ZrUGhpN29V?=
 =?utf-8?B?V2pzd1ArOEVlNFBEVElSY0x3dGxxRktja3p2K3JMbG01aGJpRkFHamJGdDNV?=
 =?utf-8?B?VXdJSDEyYkVVbzI1bGd4aU1nZEN5L3dMbU9keDJBblZDeFJhTjN0MUhVem1o?=
 =?utf-8?B?ZFB6ZGNRN0NDbDNwNktxYVlwNXNJZUFuZk8rbWhGYzhsa0JyT0FaN2s2alRI?=
 =?utf-8?B?dm9sRzI1MWhLYzAxbGR6aG0xdjlyOUtlMm9LOW1ibVVoY2Q4R0pJSWxON3Bk?=
 =?utf-8?Q?tLB9oMvFvHeLKWEpB5fcONM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 285634c1-736c-4f1d-2956-08dcd6d40cae
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 04:49:01.6997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 926Ryc+fmAUxFpiJCbiTr70VSUhqm0ESJqywwx9r1G+MSRMuRZxPAfo3wpLecuoYI4MU2Nr46E9j/ttuJf5s6+S0YekotjK4HzCRy1O2AFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4652
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



On 17-09-2024 00:12, Nilawar, Badal wrote:
> 
> 
> On 13-09-2024 00:46, Himal Prasad Ghimiray wrote:
>> In case of xe_force_wake_put failure caller just calls XE_WARN_ON
>> and continues. Move XE_WARN_ON inside the xe_force_wake_put() and return
>> void.
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c     |  3 ++-
>>   drivers/gpu/drm/xe/xe_drm_client.c |  4 ++--
>>   drivers/gpu/drm/xe/xe_force_wake.c | 14 ++++++++------
>>   drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
>>   drivers/gpu/drm/xe/xe_gt.c         | 22 +++++++++-------------
>>   drivers/gpu/drm/xe/xe_gt_debugfs.c |  6 ++----
>>   drivers/gpu/drm/xe/xe_gt_idle.c    |  6 +++---
>>   drivers/gpu/drm/xe/xe_guc_pc.c     | 14 +++++++-------
>>   drivers/gpu/drm/xe/xe_oa.c         |  4 ++--
>>   drivers/gpu/drm/xe/xe_pat.c        | 30 +++++++++++++++---------------
>>   drivers/gpu/drm/xe/xe_query.c      |  2 +-
>>   drivers/gpu/drm/xe/xe_reg_sr.c     | 12 ++++--------
>>   drivers/gpu/drm/xe/xe_vram.c       |  3 ++-
>>   13 files changed, 59 insertions(+), 65 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 5edb1cf51ea5..cce754801e8d 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -620,7 +620,8 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>>           drm_dbg(&xe->drm,
>>               "Flat CCS has been disabled in bios, May lead to 
>> performance impact");
>> -    return xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +    return 0;
>>   }
>>   int xe_device_probe(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c 
>> b/drivers/gpu/drm/xe/xe_drm_client.c
>> index 01f643f6aaba..e5defce08281 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>> @@ -301,12 +301,12 @@ static void show_run_ticks(struct drm_printer 
>> *p, struct drm_file *file)
>>           fw_ref = xe_force_wake_get(gt_to_fw(gt), fw);
>>           if (fw_ref != fw) {
>>               hwe = NULL;
>> -            XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +            xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>               break;
>>           }
>>           gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>           break;
>>       }
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c 
>> b/drivers/gpu/drm/xe/xe_force_wake.c
>> index 73d37e79da9c..01b8bfdd748f 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -11,6 +11,7 @@
>>   #include "regs/xe_reg_defs.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_printk.h"
>> +#include "xe_macros.h"
>>   #include "xe_mmio.h"
>>   #include "xe_sriov.h"
>> @@ -208,11 +209,10 @@ int __must_check xe_force_wake_get(struct 
>> xe_force_wake *fw,
>>    * and waits for acknowledgment for domain to sleep within specified 
>> timeout.
>>    * Ensure this function is always called with return of 
>> xe_force_wake_get() as
>>    * @domains_mask.
>> - *
>> - * Returns 0 in case of success or non-zero in case of timeout of ack
>> + * Warns in case of timeout of ack from domain.
>>    */
>> -int xe_force_wake_put(struct xe_force_wake *fw,
>> -              int domains_mask)
>> +void xe_force_wake_put(struct xe_force_wake *fw,
>> +               int domains_mask)
>>   {
>>       struct xe_gt *gt = fw->gt;
>>       struct xe_force_wake_domain *domain;
>> @@ -225,7 +225,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>>        * in error path of individual domains.
>>        */
>>       if (!domains_mask)
>> -        return 0;
>> +        return;
>>       spin_lock_irqsave(&fw->lock, flags);
>>       for_each_fw_domain_masked(domain, domains_mask, fw, tmp) {
>> @@ -240,5 +240,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>>       fw->awake_domains &= ~sleep;
>>       spin_unlock_irqrestore(&fw->lock, flags);
>> -    return ret;
>> +    if (ret)
>> +        XE_WARN_ON("Timedout for domain sleep acknowledgment");
> 
> This looks good to me. There is no need to propagate error if domain 
> failed to sleep, warn on is enough. Additionally we should see if fw 
> domain ack bit is not cleared due to PCIe read completion timeout. i.e. 
> if mmio read for fw ack reg returned value 0xFFFFFFFF. This means device 
> is in bad state. In this case should consider putting device in wedged 
> state.
> 


This seems to be good check to have. On cross verifying, I see similar 
implementation in i915. If you are ok, How about taking this as seperate 
patch ?

BR
Himal

> Regards,
> Badal
>> +
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h 
>> b/drivers/gpu/drm/xe/xe_force_wake.h
>> index e17fe316dc3c..c2c729371b2a 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -17,8 +17,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>>                   struct xe_force_wake *fw);
>>   int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>                      enum xe_force_wake_domains domains);
>> -int xe_force_wake_put(struct xe_force_wake *fw,
>> -              int domains_mask);
>> +void xe_force_wake_put(struct xe_force_wake *fw,
>> +               int domains_mask);
>>   static inline int
>>   xe_force_wake_ref(struct xe_force_wake *fw,
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index b0126daee359..5f5760b60eac 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -446,8 +446,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>        */
>>       gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -    XE_WARN_ON(err);
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>       return 0;
>> @@ -533,9 +532,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
>>       if (IS_SRIOV_PF(gt_to_xe(gt)))
>>           xe_gt_sriov_pf_init_hw(gt);
>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -    XE_WARN_ON(err);
>> -
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>       return 0;
>>   err_force_wake:
>> @@ -787,8 +784,7 @@ static int gt_reset(struct xe_gt *gt)
>>       if (err)
>>           goto err_out;
>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -    XE_WARN_ON(err);
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>       xe_pm_runtime_put(gt_to_xe(gt));
>>       xe_gt_info(gt, "reset done\n");
>> @@ -796,7 +792,7 @@ static int gt_reset(struct xe_gt *gt)
>>       return 0;
>>   err_out:
>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>       XE_WARN_ON(xe_uc_start(&gt->uc));
>>   err_fail:
>>       xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>> @@ -835,7 +831,7 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>>       xe_uc_stop_prepare(&gt->uc);
>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   }
>>   int xe_gt_suspend(struct xe_gt *gt)
>> @@ -857,7 +853,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>>       xe_gt_disable_host_l2_vram(gt);
>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>       xe_gt_dbg(gt, "suspended\n");
>>       return 0;
>> @@ -865,7 +861,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>>   err_msg:
>>       err = -ETIMEDOUT;
>>   err_force_wake:
>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>       xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
>>       return err;
>> @@ -914,7 +910,7 @@ int xe_gt_resume(struct xe_gt *gt)
>>       xe_gt_idle_enable_pg(gt);
>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>       xe_gt_dbg(gt, "resumed\n");
>>       return 0;
>> @@ -922,7 +918,7 @@ int xe_gt_resume(struct xe_gt *gt)
>>   err_msg:
>>       err = -ETIMEDOUT;
>>   err_force_wake:
>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>       xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
>>       return err;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c 
>> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index 86146de1d31c..2ecf3c87c6b0 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -90,7 +90,7 @@ static int hw_engines(struct xe_gt *gt, struct 
>> drm_printer *p)
>>       struct xe_device *xe = gt_to_xe(gt);
>>       struct xe_hw_engine *hwe;
>>       enum xe_hw_engine_id id;
>> -    int fw_ref, err;
>> +    int fw_ref;
>>       xe_pm_runtime_get(xe);
>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> @@ -103,10 +103,8 @@ static int hw_engines(struct xe_gt *gt, struct 
>> drm_printer *p)
>>       for_each_hw_engine(hwe, gt, id)
>>           xe_hw_engine_print(hwe, p);
>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>       xe_pm_runtime_put(xe);
>> -    if (err)
>> -        return err;
>>       return 0;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c 
>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index 9af81b07ab7a..1a7ee5681da6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -144,7 +144,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>>       }
>>       xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   }
>>   void xe_gt_idle_disable_pg(struct xe_gt *gt)
>> @@ -161,7 +161,7 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>       XE_WARN_ON(!fw_ref);
>>       xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, 
>> gtidle->powergate_enable);
>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   }
>>   /**
>> @@ -223,7 +223,7 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct 
>> drm_printer *p)
>>           pg_enabled = xe_mmio_read32(&gt->mmio, POWERGATE_ENABLE);
>>           pg_status = xe_mmio_read32(&gt->mmio, POWERGATE_DOMAIN_STATUS);
>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>       }
>>       if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index c7a00565216d..27ad412936f7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -423,7 +423,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, 
>> u32 *freq)
>>        */
>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>       if (fw_ref != XE_FORCEWAKE_ALL) {
>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>           return -ETIMEDOUT;
>>       }
>> @@ -432,7 +432,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, 
>> u32 *freq)
>>       *freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
>>       *freq = decode_freq(*freq);
>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>       return 0;
>>   }
>> @@ -508,7 +508,7 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, 
>> u32 *freq)
>>       *freq = pc_get_min_freq(pc);
>>   fw:
>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   out:
>>       mutex_unlock(&pc->freq_lock);
>>       return ret;
>> @@ -870,13 +870,13 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>       if (fw_ref != XE_FORCEWAKE_ALL) {
>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>           return -ETIMEDOUT;
>>       }
>>       xe_gt_idle_disable_c6(gt);
>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>       return 0;
>>   }
>> @@ -968,7 +968,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>       if (fw_ref != XE_FORCEWAKE_ALL) {
>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>           return -ETIMEDOUT;
>>       }
>> @@ -1013,7 +1013,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>       ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
>>   out:
>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>       return ret;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> index 80e5c4ef86ef..8d7d9e7ade51 100644
>> --- a/drivers/gpu/drm/xe/xe_oa.c
>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>> @@ -840,7 +840,7 @@ static void xe_oa_stream_destroy(struct 
>> xe_oa_stream *stream)
>>       xe_oa_free_oa_buffer(stream);
>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>> +    xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>       xe_pm_runtime_put(stream->oa->xe);
>>       /* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable 
>> rc6 */
>> @@ -1463,7 +1463,7 @@ static int xe_oa_stream_init(struct xe_oa_stream 
>> *stream,
>>   err_free_oa_buf:
>>       xe_oa_free_oa_buffer(stream);
>>   err_fw_put:
>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>       xe_pm_runtime_put(stream->oa->xe);
>>       if (stream->override_gucrc)
>>           xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index 96d5ec1fbbd9..4372dd727e9f 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -182,7 +182,7 @@ static void program_pat_mcr(struct xe_gt *gt, 
>> const struct xe_pat_table_entry ta
>>   static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>       struct xe_device *xe = gt_to_xe(gt);
>> -    int i, err, fw_ref;
>> +    int i, fw_ref;
>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>       if (!fw_ref)
>> @@ -198,9 +198,9 @@ static void xelp_dump(struct xe_gt *gt, struct 
>> drm_printer *p)
>>                  XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>>       }
>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   err_fw:
>> -    xe_assert(xe, (fw_ref && !err));
>> +    xe_assert(xe, !fw_ref);
>>   }
>>   static const struct xe_pat_ops xelp_pat_ops = {
>> @@ -211,7 +211,7 @@ static const struct xe_pat_ops xelp_pat_ops = {
>>   static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>       struct xe_device *xe = gt_to_xe(gt);
>> -    int i, err, fw_ref;
>> +    int i, fw_ref;
>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>       if (!fw_ref)
>> @@ -229,9 +229,9 @@ static void xehp_dump(struct xe_gt *gt, struct 
>> drm_printer *p)
>>                  XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>>       }
>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   err_fw:
>> -    xe_assert(xe, (fw_ref && !err));
>> +    xe_assert(xe, !fw_ref);
>>   }
>>   static const struct xe_pat_ops xehp_pat_ops = {
>> @@ -242,7 +242,7 @@ static const struct xe_pat_ops xehp_pat_ops = {
>>   static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>       struct xe_device *xe = gt_to_xe(gt);
>> -    int i, err, fw_ref;
>> +    int i, fw_ref;
>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>       if (!fw_ref)
>> @@ -258,9 +258,9 @@ static void xehpc_dump(struct xe_gt *gt, struct 
>> drm_printer *p)
>>                  REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
>>       }
>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   err_fw:
>> -    xe_assert(xe, (fw_ref && !err));
>> +    xe_assert(xe, !fw_ref);
>>   }
>>   static const struct xe_pat_ops xehpc_pat_ops = {
>> @@ -271,7 +271,7 @@ static const struct xe_pat_ops xehpc_pat_ops = {
>>   static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>       struct xe_device *xe = gt_to_xe(gt);
>> -    int i, err, fw_ref;
>> +    int i, fw_ref;
>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>       if (!fw_ref)
>> @@ -292,9 +292,9 @@ static void xelpg_dump(struct xe_gt *gt, struct 
>> drm_printer *p)
>>                  REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
>>       }
>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   err_fw:
>> -    xe_assert(xe, (fw_ref && !err));
>> +    xe_assert(xe, !fw_ref);
>>   }
>>   /*
>> @@ -330,7 +330,7 @@ static void xe2lpm_program_pat(struct xe_gt *gt, 
>> const struct xe_pat_table_entry
>>   static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>       struct xe_device *xe = gt_to_xe(gt);
>> -    int i, err, fw_ref;
>> +    int i, fw_ref;
>>       u32 pat;
>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>> @@ -374,9 +374,9 @@ static void xe2_dump(struct xe_gt *gt, struct 
>> drm_printer *p)
>>              REG_FIELD_GET(XE2_COH_MODE, pat),
>>              pat);
>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>   err_fw:
>> -    xe_assert(xe, (fw_ref && !err));
>> +    xe_assert(xe, !fw_ref);
>>   }
>>   static const struct xe_pat_ops xe2_pat_ops = {
>> diff --git a/drivers/gpu/drm/xe/xe_query.c 
>> b/drivers/gpu/drm/xe/xe_query.c
>> index 7c866b736f00..df7bdf3822cc 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -153,7 +153,7 @@ query_engine_cycles(struct xe_device *xe,
>>       fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>       if (fw_ref != XE_FORCEWAKE_ALL)  {
>> -        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>           return -EIO;
>>       }
>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c 
>> b/drivers/gpu/drm/xe/xe_reg_sr.c
>> index 6ab6a48b1d29..874523f22f56 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>> @@ -202,14 +202,12 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, 
>> struct xe_gt *gt)
>>       xa_for_each(&sr->xa, reg, entry)
>>           apply_one_mmio(gt, entry);
>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -    XE_WARN_ON(err);
>> -
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>       return;
>>   err_force_wake:
>>       err = -ETIMEDOUT;
>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>       xe_gt_err(gt, "Failed to apply, err=%d\n", err);
>>   }
>> @@ -256,14 +254,12 @@ void xe_reg_sr_apply_whitelist(struct 
>> xe_hw_engine *hwe)
>>           xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, 
>> slot), addr);
>>       }
>> -    err = xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> -    XE_WARN_ON(err);
>> -
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>       return;
>>   err_force_wake:
>>       err = -ETIMEDOUT;
>> -    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), fw_ref));
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>       drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>> index 3b5256d76d9a..1384c97a75c2 100644
>> --- a/drivers/gpu/drm/xe/xe_vram.c
>> +++ b/drivers/gpu/drm/xe/xe_vram.c
>> @@ -263,7 +263,8 @@ static int tile_vram_size(struct xe_tile *tile, 
>> u64 *vram_size,
>>       /* remove the tile offset so we have just the available size */
>>       *vram_size = offset - *tile_offset;
>> -    return xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +    xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> +    return 0;
>>   }
>>   static void vram_fini(void *arg)
> 
