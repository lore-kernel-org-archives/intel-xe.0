Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB72D10F5D
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 14:42:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328B410E643;
	Wed, 26 Nov 2025 14:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMPezs2w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD1410E643
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 14:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764168135; x=1795704135;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+c0ImleuZL2KmW7/amPOB1jW2Dan65EZCUXgru9Px/Q=;
 b=XMPezs2wrG/MDge3/Kl0HX7gKReHSQveF8FiXQ1QwTtb1W1/D/5xN5dy
 5qryZsqUwpw3MQHFuW1JCxnOntT2DZT1fEXpzaiIiUGGTOvcXZPj0KG1e
 pfrfATy/l5G5alWv/0heBTRXVYHBVxHcyM8NcKgj2yKe/UpeZgH/pGzoc
 06YVo1hdpoUkdwb3tyhW5iXmccFplUAdMgxAbJL3vS25nMoD2blqpfjd0
 KeEvfc9p8pNB0MLmROxodXevB6MzIEMOeTHH8Trz3gjFFuSKnbxvf0+kY
 T9n34n7ZWVbAG+BCQ+gzgb+TnmdirIj6GHJsXjHbsxppcRI0rlEth6M14 A==;
X-CSE-ConnectionGUID: 3tkNNc3TSZ2G7zuejOsveQ==
X-CSE-MsgGUID: INUcCYPpQzqUrxR4WH2l5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="53774923"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="53774923"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:42:14 -0800
X-CSE-ConnectionGUID: PSfVNoPCS96zoXrcW4k2ug==
X-CSE-MsgGUID: FGLXTQrFQf6CRYDdgJM4BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192748203"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:42:14 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 06:42:13 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 06:42:13 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 06:42:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miwUoB+B9krTLr8XElKvCMzWsmoZoJQO8XbKkfUgmYdZAQyU7TlvFmKGSPuMcFb4WnMWVuvjtcF9lX8e0fZXhN5QLTau6wi7NRy2tWNWxz7IF1f/QgKk+oBsyo3O5QA9qAYaZ09iqtUgT6QWHZRA9YOkPZkhxZq1s4G9F09JvAvP0oZPKEa3uOw9hJhRNXyqYkH2LqkO2qTV2llV1VkawCm4UqukvM83RZfNY9ybLSN7SYOaCVJM1eZlMpJPTjjapT4jdmjb/IYoDriS37sUIADPSf4mZ+iX5fMIFcBqE22e28vmF6S/FOv8/fhjJr1eMYlsbVPZoX9gUMGsRmSBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5HUm1t55B90bOEU6h4O1ZRPbub2FMPU7KpVpwn7QEc=;
 b=DXSUQuVG/72KGyXs1V9ScF5D6NtVqxwsISOTQGKebgQ2lnBOpMmkk5Qlvp+RPWbhJwTAO8GWOws5shTWQr+f1QyTMwFl5q3pydHRuNjgAMsggv218TuPnDupemvKwaT5lhze6u9fo9ZR/AiH8bnFLP13FP7+QtLUMf4NoxSHfIfgXdP/R713jj7hnroKoM+3o2FfG03ffhkcOjA7Aa+J4uzxB2jQNcXPWjXsWy9FG2KswBB9grg4bfakMvNXqJuhAOoTnGErEV42tt741KSXa526CSD6mhX6HQ2FD6LtpZaGeNUSRLB2h32B75qp4qu3gufU0bm3DU/3vQtJx4nxlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DS0PR11MB6374.namprd11.prod.outlook.com (2603:10b6:8:ca::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.12; Wed, 26 Nov 2025 14:42:09 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 14:42:09 +0000
Message-ID: <6af47ed6-5c0b-49f2-8bb2-902ff2162745@intel.com>
Date: Wed, 26 Nov 2025 15:42:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/4] drm/xe: Don't update wedged mode in case of an
 error
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
References: <20251125135422.11244-1-lukasz.laguna@intel.com>
 <20251125135422.11244-3-lukasz.laguna@intel.com> <aSXx1lYwgvSWjvqc@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <aSXx1lYwgvSWjvqc@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0062.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::39) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DS0PR11MB6374:EE_
X-MS-Office365-Filtering-Correlation-Id: b37a7c3a-6436-4f0a-355d-08de2cf9fa3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2Qwc1ZDYk13bW8rd1pQS2RaL1ZiV2gra0NjVDd3TXJ5OHF2TDZGMDB3TWRO?=
 =?utf-8?B?d1BjNDJ3c0ZhL25nNUY2TGVVYll0OHhneFJXK0tYQ0xGSzRBemhYNnZMR1BJ?=
 =?utf-8?B?NzUwQTh2Z3BQbFIzL01LVUxMWDV2S2F1MVhHRDRvR2NteU55ZlhXMi9jdWFT?=
 =?utf-8?B?UXJOODN1ZmlONGZpZzEyTGRkaGc1ckZQcDRwVCtYalI5bWVBa1dFb2JFd0Jw?=
 =?utf-8?B?Z2lianZveEEwNm1ReTByZkh4WjNIYlBoVXpMUy9GV3d0bnFhNzdUL3V5T2Jt?=
 =?utf-8?B?TFFheE1jQUJLL3E4eGgweU56VkhIN1ZGV3pHeUI5bTZOZ2Q4K0h3UnZZRDNE?=
 =?utf-8?B?ZnUzMFh2ek9wT3RUY2FBSlI5MHZXSGhJTFlhN1NDVkhqemhSaFdpMlQzcTlQ?=
 =?utf-8?B?VkdMYnl4S0RmWTNSaFRHZXlhekxmM3ZNOHB0MWNhWHJBR216WDB2cVV1VWpq?=
 =?utf-8?B?dm5ORGh0NHc2RWk3YzZzdkllc2NkS2lab2RMRC9SMFRpeWJwUTMycmNDenlm?=
 =?utf-8?B?WkNYbmR3Qmx4RnhVTlFDWHJMQVp4cnQrV3Q4d0ZMdVluNWxlVWZxSzdFWHRQ?=
 =?utf-8?B?TGsxaFVVZ2dzMDZHS1hNVjdmUDlnbm84TFB4S3RaT2RIcEdWNXpxTW9DRVh6?=
 =?utf-8?B?N2xoWG9rQjQwWEZNNE1OTlZwcjlhTlZWUzNVZ2U0a29QQlVnMGRMdVFiY2VT?=
 =?utf-8?B?WEtlQUFISFRWdzJjWjdRVE9HYldTdDJZRkZldjRNdHlmM2VxekpRM3ROKytO?=
 =?utf-8?B?UGEzNGwrNzdPaEtPSVZ4U3Aya3Qwdlk4TzNTQ09oZk1sU3draTI0NFI5MnpN?=
 =?utf-8?B?TXY2SnAvQzZVNGxMaVhJc0h6V09ENm5HOEQzOFM5Z1Q3c0l4TitvWEpFYWJp?=
 =?utf-8?B?Nk5uNWNUM0FNaTQ4enRVNW5JTUkyV09jRW83NjFoOWxia1J0VkFZTFpmUm53?=
 =?utf-8?B?cTZNUHlzZHd0cnFZYnJnd0paZTBZbm1BdmhvdVk4SWZzSGFOOHI2NndlRy9W?=
 =?utf-8?B?NFEwVVJwVHVSeTdWTmtQQjRYY3NOQW9hMnE4M3BnOVZNREFIeTVqcXVtUUNx?=
 =?utf-8?B?N3hXcnFlVDJxc3lBbjJOaHd1SlRPRGZFdnU0R25PN3BaaWNmZE1vQ2U4VDUz?=
 =?utf-8?B?cVZFYXdiWjZzbFIzTC9kaHBTOWw1eVBMaDZKSFZlV1liY0paMWJ2bXhpVzRi?=
 =?utf-8?B?VEV5R1pQTVRxY3BZZVZQWmJEQzBLbFd1WWRuWVpHcDdZbXJmK1FOWUt5cUU0?=
 =?utf-8?B?OWZYbWx6eXFSeEtIQlM2Rks3YTJHWUZES000RVRnL2hZQ09qeWFZaXl1THp1?=
 =?utf-8?B?KzBlVU9hbElMQ29YbGttYXRISFAvakt6Z1dRWkNMYm51Zml5cFovK1ZsTkNH?=
 =?utf-8?B?NWllbEYvUVFOdGNQd0s1aENBM3dDU1g3a2M4alRrVzhKSUNVS0k0czM3NWRF?=
 =?utf-8?B?SEdTbjROVXl6ZElIYXI0UGF2T095V0FyMWZ3SURvTWNsYzZBYUV4bVVTMVdH?=
 =?utf-8?B?aTFQRmNheEpCcmR6bnV4N0w4YXl2ZzJsdGFwNmE0Vk1GOXlkSGJ2WFR4Zm53?=
 =?utf-8?B?ZjE5RUhlQXlHOFErRzRHb3R4VzJOZ2JGL2hZSUR5czFTN0N3RmdKbkJPRnZ4?=
 =?utf-8?B?V0dLdlRyMkRmNUtTVlFRMnpMMVRxZ0EramUzQ3p1VGdsM3lSSmtBNFl1bjZD?=
 =?utf-8?B?emtOd0NUY0RmR0pSam5JMmtBQXlteHpFUUZ5S3Bremlla0FXZGE3blJhNVdS?=
 =?utf-8?B?SG5XakxteXVIdWg1b3kwbThkbzY1bU1iOUxrM2NPWkJ2VVJXVGZ0RGx0dmow?=
 =?utf-8?B?RzJickNZazNCa2ZnUldCZkxkb0hUY3laQ0V6bjdWZWpHa0M3dmp1UnNrK0t6?=
 =?utf-8?B?RHZqT3Y5bmpJWGtOQmtVb1pLdjFyazhrb2dSTGFOU2xTRWw5Nis2bk95aTkw?=
 =?utf-8?Q?wQcpE/iVVHsa10A0o+QyC5DdkVwiAjgH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmFtdEVUT3I4KytJNjVHSEI2YzdvNVVYOWRINE92V2FsTjhDWmloWTE4dEZO?=
 =?utf-8?B?S3Z2RWhQdnQ0YWdPK2gzUFlUOWszcTlDSDZreFAvRVFOWkJiNjgrNmt4TWhT?=
 =?utf-8?B?aEhoUXJ5OXVYSHN2NWZrQzhGdEVLdzJMcWlnL2FYdGxjSmtOZ2RDazNTODVZ?=
 =?utf-8?B?dUhVVVFXQ0Z5S01xc0U5ejIzWVRDc2NoTU9PRkJEdTVuUDhnb3Z6cmN4dEQ5?=
 =?utf-8?B?MWwyK0ZGV3pHYXhnQUh5SU9tdVJaWTdTeHVONEhTaS9Md3laSCtVYTlQNFlG?=
 =?utf-8?B?eXkwd3kyeFBSeGE4akpzazMxZU1QYjIwOGFzU01HZER5aTJORGRvTGtZdnp5?=
 =?utf-8?B?VDd3ZFQ0c2o3bHlrNHBGMk9ucDdpcHNUYndCbW5Gbkk1WHR5MXpqeisrbUdo?=
 =?utf-8?B?NndBWmNrOU82QVpoRXBzNTNIdFNBaTF3b1ZlRWljNldvSWs5Uk9uMXMwRzR2?=
 =?utf-8?B?bWpPSE1DOG4xaTZuaEFQWFFjVTUwazlXd0k0SWx6cFphT21UWUh5R0R0bVdt?=
 =?utf-8?B?dXJqbDFuMlNhVWxnUHQ2U2pNQTgra3VCTHZlZlVGekpaZFQ2SGdjaWdDR1pD?=
 =?utf-8?B?RTY2ZzhKeCs3czNVY1luekxZei9MRlZ1RE81RkxwNHErSk56WCtBRmowdzJR?=
 =?utf-8?B?M1hRQWMwY1htalJWNzEzU29sd2o2dG0zSEVpYXBGR0s1RXI1aEVUZUE2blRt?=
 =?utf-8?B?aVpkdzNHbW5HTHBZZ3hEQitNbDEvZ2FTYUhxV0hlWituUG5ld0N6TW9aZDZJ?=
 =?utf-8?B?NC9OY21xSUpqaUUyOGlRVk5PbG9VWjhWWU45bFJPN1k3RGl5Q2lTSnlaNlc4?=
 =?utf-8?B?U1NSZ2RzOFowTFlTRjdmcHJBTE92UTB3TGtLTmd3Rm9SSXkvUTdzaVhNd3pU?=
 =?utf-8?B?SEZIYU05S0t3NS9qQ2ZPT1dRU3dRZWdKWHpHZ3BXS0tRM1hnaFJJL2t1QUJr?=
 =?utf-8?B?ektVbmlqZXZEYUYwNFltcXQrMExGN0w1S3JFUVM4ZWpzMVFabHRoaFZWS1Bh?=
 =?utf-8?B?V0NxU1NhcEhkeGNvMlp6V2c5d0U2TlR4cGplUE5DRlArdjloUVF6cjN2NVRO?=
 =?utf-8?B?SENadnFXNjEyOUVLVzRoeTdCMDFxdUtOWk9IWUZhei9tMjAyZWlTdFhtaUNM?=
 =?utf-8?B?dU1qUkgwTDhlRUNDbC9zRkE0K3ViRU8rQysxQ2FIa2l4U3VKWUYzbjBSY2Rx?=
 =?utf-8?B?UXVFUGFiUWhVYnl6bVFUSXRsWlFHQnY5N1Y5ZXRoZTN0emZUNWpDN3pPOTFF?=
 =?utf-8?B?dm9vaXNMVlZTSmdqLytwYWQ5bTJDMU1Fek5ZRXppR3Z1Ny8xSTV4cjJtUmZw?=
 =?utf-8?B?aVB3ckRKeHd5ZXpZeFdPM2s2Z1MrYkZyUEFUcXBZOUx1ejNiT0NCOS9LWkp6?=
 =?utf-8?B?eTdXWEZrazVLK0F4RzdacENvbnZFWlNxOGFqOHVwNENsbEs0T3E2MW9Mc05K?=
 =?utf-8?B?WFBQNjN6TjRON2JVTW5xUkdjQllJU1BPQ1BNazBzTVdyZktQa1d2cFpwOXpL?=
 =?utf-8?B?L1Q0STY4QndJQlNYK2hlMWMyMzl5VjBxanFMR2pSNEs3eXBHUnp6Qm05ZUxm?=
 =?utf-8?B?Rm5IREUwMklLR3huZDQza2RWOE5wc3ZPcnFQMmFKbVVxOXhsMWRtbDdaVlFI?=
 =?utf-8?B?MVhTMktLdHBkL0lxdXV5YjRrbzJrTlJyVEFjNm5YMy8xZDZJQkc3UTBsSUht?=
 =?utf-8?B?TW5KUzF5a3VpWTdpSG1vSFN0TTQyOVdON25aVGdkR1hXdkh3SWR3V3FtYmdO?=
 =?utf-8?B?Q3RJSzBPNWh2ck5najR2U1U0OFpqYnJTalM5RDJNMnI2VHd5bC9kbzVVMlpo?=
 =?utf-8?B?TGNiYzJXbkx5SlpnV2NsKzl0QVdhdjBDejdSaWlvakdib29LS1pLZmhzVjRt?=
 =?utf-8?B?NWI4NWRvOGp0YzBtcXljTFhNY051czJJQ1ZWdS9WR0M0VG53dW12c3BmdlJi?=
 =?utf-8?B?Sm9NUUtvWml4ZjdmbTVJVGc3WGFwTUdPZUZPNTNsM2VZcnhNNWtNbjRPRXNh?=
 =?utf-8?B?TXc1TG53ZkhrdnpSS0gxQS9EK1Bnb0o3ODFXWlZUWGlwNHBHU3Y3QkQ4ekxP?=
 =?utf-8?B?SSt5WXc1aXBFTHNvcFVDbVZmSmdwU3l6TEtRaUJ1UXJVSTBpdWhNZjZMU0xs?=
 =?utf-8?B?TWdpdUJ0cUFtVy9QdW1jWlNVNGd3eG1xNTVlcmI4VWFjemlhdld3aFEyVFpr?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b37a7c3a-6436-4f0a-355d-08de2cf9fa3d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:42:09.0849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJ/oBQJ6qhd+3iV2CD78Ty/xpk8jEpai8NaKpj78hdDWMLu8ItW4zxVTYbVUonamfQh/qHj/OrdNCrQGODwfpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6374
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

On 11/25/2025 19:13, Rodrigo Vivi wrote:
> On Tue, Nov 25, 2025 at 02:54:20PM +0100, Lukasz Laguna wrote:
>> Change driver's internal wedged.mode state only in case of a success and
>> update GuC's reset policy only when it's necessary.
> I'm afraid the description here is not enough or the patch itself is making
> the wedge_mode and reset even more confusing...
>
> After reading this I have no idea more when the reset is attempt or not,
> how to actually select it, when we expect that to not reset but reset
> is still atemptted...
>
> Something seems off here. Please clarify.

OK, I will update the description.

>
>> Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_debugfs.c      | 68 ++++++++++++++++++++++------
>>   drivers/gpu/drm/xe/xe_device_types.h |  2 +
>>   drivers/gpu/drm/xe/xe_guc_ads.c      | 12 ++---
>>   drivers/gpu/drm/xe/xe_guc_ads.h      |  4 +-
>>   4 files changed, 66 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>> index e7cdfb1cda8c..71d53099187c 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -252,14 +252,62 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
>>   	return simple_read_from_buffer(ubuf, size, pos, buf, len);
>>   }
>>   
>> +static int __set_reset_policy(struct xe_gt *gt, enum xe_wedged_mode mode)
>> +{
>> +	int ret;
>> +
>> +	ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads,
>> +						       mode != XE_WEDGED_MODE_UPON_ANY_HANG);
>> +	if (ret)
>> +		xe_gt_err(gt, "Failed to update GuC ADS scheduler policy (%pe)\n", ERR_PTR(ret));
>> +
>> +	return ret;
>> +}
>> +
>> +static int set_reset_policy(struct xe_device *xe, enum xe_wedged_mode mode)
>> +{
>> +	struct xe_gt *gt;
>> +	int ret;
>> +	u8 id;
>> +
>> +	guard(xe_pm_runtime)(xe);
>> +	for_each_gt(gt, xe, id) {
>> +		ret = __set_reset_policy(gt, mode);
>> +		if (ret) {
>> +			if (id > 0) {
>> +				xe->wedged.inconsistent_reset = true;
>> +				drm_err(&xe->drm, "Inconsistent reset policy state between GTs\n");
>> +			}
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	xe->wedged.inconsistent_reset = false;
>> +
>> +	return 0;
>> +}
>> +
>> +static bool needs_policy_update(struct xe_device *xe, enum xe_wedged_mode mode)
>> +{
>> +	if (xe->wedged.inconsistent_reset)
>> +		return true;
>> +
>> +	if (xe->wedged.mode == mode)
>> +		return false;
>> +
>> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG ||
>> +	    mode == XE_WEDGED_MODE_UPON_ANY_HANG)
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>>   static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>>   			       size_t size, loff_t *pos)
>>   {
>>   	struct xe_device *xe = file_inode(f)->i_private;
>> -	struct xe_gt *gt;
>>   	u32 wedged_mode;
>>   	ssize_t ret;
>> -	u8 id;
>>   
>>   	ret = kstrtouint_from_user(ubuf, size, 0, &wedged_mode);
>>   	if (ret)
>> @@ -269,20 +317,14 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>>   	if (ret)
>>   		return ret;
>>   
>> -	if (xe->wedged.mode == wedged_mode)
>> -		return size;
>> +	if (needs_policy_update(xe, wedged_mode)) {
>> +		ret = set_reset_policy(xe, wedged_mode);
>> +		if (ret)
>> +			return ret;
>> +	}
>>   
>>   	xe->wedged.mode = wedged_mode;
>>   
>> -	guard(xe_pm_runtime)(xe);
>> -	for_each_gt(gt, xe, id) {
>> -		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
>> -		if (ret) {
>> -			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n");
>> -			return -EIO;
>> -		}
>> -	}
>> -
>>   	return size;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 81bf4a70b888..4aa99bcfbcc7 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -603,6 +603,8 @@ struct xe_device {
>>   		enum xe_wedged_mode mode;
>>   		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
>>   		unsigned long method;
>> +		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
>> +		bool inconsistent_reset;
>>   	} wedged;
>>   
>>   	/** @bo_device: Struct to control async free of BOs */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index 466f192b6054..e5ca25b865a7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -983,16 +983,16 @@ static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_off
>>   /**
>>    * xe_guc_ads_scheduler_policy_toggle_reset - Toggle reset policy
>>    * @ads: Additional data structures object
>> + * @enable: true to enable engine resets, false otherwise
> please use a meaningful name here... enable is way too generic for this case.

OK

Thanks,
Lukasz

>>    *
>> - * This function update the GuC's engine reset policy based on wedged.mode.
>> + * This function update the GuC's engine reset policy.
>>    *
>>    * Return: 0 on success, and negative error code otherwise.
>>    */
>> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads, bool enable)
>>   {
>>   	struct guc_policies *policies;
>>   	struct xe_guc *guc = ads_to_guc(ads);
>> -	struct xe_device *xe = ads_to_xe(ads);
>>   	CLASS(xe_guc_buf, buf)(&guc->buf, sizeof(*policies));
>>   
>>   	if (!xe_guc_buf_is_valid(buf))
>> @@ -1004,10 +1004,10 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>>   	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
>>   	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
>>   	policies->is_valid = 1;
>> -	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG)
>> -		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>> -	else
>> +	if (enable)
>>   		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>> +	else
>> +		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>>   
>>   	return guc_ads_action_update_policies(ads, xe_guc_buf_flush(buf));
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.h b/drivers/gpu/drm/xe/xe_guc_ads.h
>> index 2e6674c760ff..9879aadd22d6 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.h
>> @@ -6,6 +6,8 @@
>>   #ifndef _XE_GUC_ADS_H_
>>   #define _XE_GUC_ADS_H_
>>   
>> +#include <linux/types.h>
>> +
>>   struct xe_guc_ads;
>>   
>>   int xe_guc_ads_init(struct xe_guc_ads *ads);
>> @@ -13,6 +15,6 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads);
>>   void xe_guc_ads_populate(struct xe_guc_ads *ads);
>>   void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads);
>>   void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads);
>> -int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads);
>> +int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads, bool enable);
>>   
>>   #endif
>> -- 
>> 2.40.0
>>
