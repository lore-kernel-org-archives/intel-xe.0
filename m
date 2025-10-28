Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE74CCF9E0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 10:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A4010E067;
	Tue, 28 Oct 2025 10:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zozz9MWf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B844310E067
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 10:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761645654; x=1793181654;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=owggNVkTHwyKUGBeIn19bvhr7uTUr3o8Jt1Og0E8W2s=;
 b=Zozz9MWfKeZW2KpYIn+IhnPcR0VutHH1pW1rLKQGy1a8q2a/LZNGfvu2
 jDUbPQU4REHtLwxV/89KeRZvqTknqk5VoQJe4CsMdC6K9keLs0AoJRvQw
 23vd1TjCVt8IsS6KfN1eIzrDrsSXNQ8eyoryT9UE+m6hldW401BcbHwhS
 1X2c21kTRfcUTJMcapveZjEH4iGW4psTDC/Xq+ykZSGmACKK+NEf/dTJF
 rWY7Chnod+eWmO2EJx16PtHp4ocJKAQH7b5GbdCJ8ddvLZTTVUVOQVbFG
 u4ainzgdD69nXbOhNBgueSez4O7PFeiQJIkb+y9GXGZWqTKI4sBJfnhLv A==;
X-CSE-ConnectionGUID: 6sIHt6oARBeIwsPajohglg==
X-CSE-MsgGUID: TNgkEerSRUexYCv+xUGdIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74342400"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208,217";a="74342400"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 03:00:53 -0700
X-CSE-ConnectionGUID: cJAFmMoGShu7pTOZKmzfjQ==
X-CSE-MsgGUID: Kv7nDS9tQJy5/9s3GG4Niw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
 d="scan'208,217";a="208902020"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 03:00:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 03:00:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 03:00:52 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 03:00:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPtTB6w4XqkyqwJOZ5Ia/gycfnpYjPNeUt16kTw/oww4EzkS97SrfFQAeni2XLFwOTxxGBTLEjhvSoSzhX2mrd9a6x9eCkTDgzA1A+QTM2xtrqSMCKVnHvfHnxOJVqNTHhqskKHqIgfgQlmxXI40TifCuYXb1CfMf+cWG6qg+dQFn4XVNmYa0gQxLC6mYLi1VdNC759fmIc4tRQQsDNGDDoVncj9NYjdVT5W598XsYRwl1G187bcLzupttb+Uqxg4r9vnQrsZrKmZquRCvwP2qkeTan8ZrgRSJclG0Ib5G6CNbfXNqnM2LspkbDpsq/89F4I8gxXq20l4Y5PJG6xcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzuJ0NjWL+Ja3xBZTdn+HzuE2DV7lZMNW1YKH2jBl9I=;
 b=Ha60oxcKs6i3gTc7GDVtY9HOLJjv0O9nBntjWqySu5VO7FYw+jv4JTYJx5z7ljzObzUjq6iHk+Tf3rDqfAKO6BeAScwX/gWHxR75LR8A99KhUx0Runv6Kr4FtWGOnOKu6IDC48bZGTtReqwATUs/vB3H22zaWCD4r+zCRCprXPD6U/00ZGRO587prhgjB2Aq373O62Q4Fs2W0iG2JqoqpQirmyAg9IkAeBNgaPLmMBVp4FSelzoy11fm5c9i11RqTwW4jGes9ZLPL3yGO6EyK29c0M1Z6BQxgAe5HUF4u5pN43BDyC8Wxpwh6/fFX3FNIiuDJTqlMyUvUXn7d4WR6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by MW3PR11MB4763.namprd11.prod.outlook.com (2603:10b6:303:2c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 28 Oct
 2025 10:00:45 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 10:00:44 +0000
Content-Type: multipart/alternative;
 boundary="------------TGKy2hIstQu5EWQejLDNrbGw"
Message-ID: <775178d5-c39e-4d6a-abea-22eaa3c7f6c4@intel.com>
Date: Tue, 28 Oct 2025 15:30:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/guc: Eliminate RPe caching for SLPC parameter
 handling
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
References: <20251016092536.1918086-2-sk.anirban@intel.com>
 <aPootwV2Dugb70gq@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <aPootwV2Dugb70gq@intel.com>
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|MW3PR11MB4763:EE_
X-MS-Office365-Filtering-Correlation-Id: b057f141-087f-4ce2-4547-08de1608dc69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUt2RmhCWXRXVTZ4eWhIaHNpNVkvRit6Y2UzUWhHR3Npb0QwWDZQSC9jSU5j?=
 =?utf-8?B?eWYvWWErQWFkQmRhY0VTSnVScjVuRndjMVZCSnVZQUZHT2p1eUpjQUE2TFFJ?=
 =?utf-8?B?dXBiQ05zYWxQYis3a1hZUlIzZmJPRXgxbk12alRtdlBnTHh5SFFQV1JPWXNj?=
 =?utf-8?B?ZWk2MHZHRDd5ZURReFUwLzhpd0VOaGVhUytnc2lqdFRPMGxpcC9td1RNclA5?=
 =?utf-8?B?Q0lCVkt4NHpEeURDRlBBQzV4bDlXQS9KdzZBdUN2V1cyOGlLRVh5UW5QcEVI?=
 =?utf-8?B?cTNHbVBrM0xyZ0swV1JMT1ZSa242aS96M1Y2S1E1WG13NTF0ckRleEpjUHY3?=
 =?utf-8?B?Ylk0Syt2UzZZeGpCdFgrelRHTG1Tb3QvQmFHWHdHTzJIODBqNWFkeGZLcStL?=
 =?utf-8?B?dk8zbUtvMUJ1dURqaGRzQjFtMlJtQUNhVnYxTjJUTEYwdjV2TC9RRUQ3NTM2?=
 =?utf-8?B?SE4rZW1hYk1lSEVoNDMzNWR0WWZvckJNM0lrT3RrR3FDRi9tOXcvTmc1VGNr?=
 =?utf-8?B?RmttY0QxSUU5L0VvNFZHaVFkZ0x3eDVQd1FGdzFwRVE0NnVSWEx3b1cxZHVL?=
 =?utf-8?B?amJkSjcyd0tGK0k2YjgvcmgyOVlSaFo0Sm5rcnFZRXUwV1lDVGZvNFlSWnJC?=
 =?utf-8?B?aEYzOU0vRDYxK1NuV2duNzN4S2lEYVQzVzZYZkR3MTdncWVMMzhMQjBDMkNS?=
 =?utf-8?B?TUVQbXp4ZTZ0QkRSSjdTSi9yOUpsYnMyeGh4VG1PWlJ4clJoR09XaWcydGxK?=
 =?utf-8?B?Wm83L0NwNzFFTnhqamdsSmV4RUI4RGJLMW80Q3hyNjZzdHBzVk1sYVBZNnQv?=
 =?utf-8?B?OUVRQzFPdEZxNm84L0VVS0FIZjVIOGs0TFNSU0pTQ2J0cHBKaEVZWisvbTVE?=
 =?utf-8?B?ckZsTE80U1BOVVZ2bmx6SzFWaXpYbnhCbGZETWFMNTBZdXdkZDAwTDRWcm9K?=
 =?utf-8?B?VVQ4Wk9EZkRaT1JCWUxPMGFlektUMkY5alp3dCtYejVTZHBqRDVub3V5NThr?=
 =?utf-8?B?Z0hVVE82MG15RUpkVGJLZ0g2VDZMa2J1emp1aFhuWHg4aWtrenhJSUZJWXpC?=
 =?utf-8?B?bW9YSFlsdWZNM1lPTkZlbW1GNWJnaUlybkcvaXZKMWRiN1FjWWN0N1M0b2Rx?=
 =?utf-8?B?YWE3eVJlUDRmTGZaVEtEZU9kUGVad05mcXc0bWp4NE45Rjl1VjRxTnhTRE1R?=
 =?utf-8?B?RU5rekQ5R0hYNHBDbVBySXhWckhyaEtwbUhwNzZPVVpBaktGMXlma0phRTNR?=
 =?utf-8?B?dkt4NEVUQ2ZEdlJHa2R4VU9zNHNVdE9wdUhCTGNaeEQwZEJuRVBtbFBYb3Zx?=
 =?utf-8?B?dzV6ZFdDSVZrTUFkZ0V6ajZ4bHZsaGxWMWswalVYcDVNKzJEYUpzdDhWbVZa?=
 =?utf-8?B?a1RPUUQrM29MNXJPRzVYR1pJTDlvSGNrZ3UwVnpuNDZBMW1WT2lUd0dFQjhZ?=
 =?utf-8?B?UDNSSVNoaURFVVM2U1Zxdm1pSU9FYWwrM0lpK1RTMjcyYWNBYWROYzhlbUVt?=
 =?utf-8?B?WWdpeXpORXJXaU1DVmltWG1veXhHSHlaam5GS3kzQWMrWjZKQkdMUUo0T0FU?=
 =?utf-8?B?WHcyMitSR2FLaHBoYjdFNGVEUmxyTUpOQmtVMWtSM2RtWEkwWHhRb3Y3NnZX?=
 =?utf-8?B?dzZINHJvK1RocWhLUDlSUFRVdVVaWGM2VGdwTzR5TTFLcXVPYlNRVGRxRWto?=
 =?utf-8?B?dnZ2VU1sS3Q2SzdkRzZHR2hUVU5IM3JvNTZKK2VLUzdFeTJsNEFpWWhTSEho?=
 =?utf-8?B?WWRTOE1vdzVjeXNFKzY1akZlTlFmN0xxOHJCakNjanB2U3BKaWVUQjEzSEZL?=
 =?utf-8?B?UGZ5WjAxdFhsVUJpTlJ0UUVrOTRUMUU1UnBQODVLOTN1ZWNJS3JoT2duSWVS?=
 =?utf-8?B?eUg5U1ozVExFMUo5R3d2Y3lBT3FJbUhpU3BLRlErVmV2VUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVBpRjZRYUdFczFSUmxqVG5BMG5aMG5GbEs1aXY0TTNjaG9jbC9iMmFMUllF?=
 =?utf-8?B?TWVwN3hkLzViR1NJVjF6aUNLbkFwZ3VocTRNZHAxQnpzUzFoRnhtZkZPWHNZ?=
 =?utf-8?B?U1NQRHlyZjhQZitLaUhPZ0pYcG1GTXVPdmNhSzlXT3dKS2UzUUkrK2wwTVpF?=
 =?utf-8?B?S01nNzJRbElPSXZqZ0FvK2tBNmVOVmhpL051em5rNGxIOU13dE9hUjlrbDZs?=
 =?utf-8?B?TDJPcFpZMGFtclZTbHZxTklmQXYrbUFOU2RkUUhlMjAvSlBPdEE2ajVJUVZM?=
 =?utf-8?B?VWlVY1RHQnpTVzRsUmh4QjNKR0VnWkwyNzFwbTVXL0NTbWZnTGVHTTBmMU5r?=
 =?utf-8?B?U3ExL1VsNitaRDBHOW1RQyt6UUdtVHRyQVhJQWJmOUhBSUtSUWNIcDFWVDVM?=
 =?utf-8?B?QkRId0Q5L1JQNnQrOUNZRmR0TGxzanRjS3VSNGU2Nm1mUVVtM3JDYi9pd25F?=
 =?utf-8?B?OEs0UWp4YXp6dEpkTG5IRE5nMjc4ek9ZU0pOWUdVbW9WaWJseTFmcTdaR21J?=
 =?utf-8?B?YUhuZTlTekV5VEZJaFJTREQ5TlMrUTNVcTZSemdvV2NzbWpsZ3AxTDNYWDM1?=
 =?utf-8?B?elNaOFJpOUVvRVBxc0Jxd21yMWplR2cwMVNBYzJJK3ZKRFgxY29XQkpyL3BD?=
 =?utf-8?B?RExxTE1zc0RXV2YxTVgrTmQycTM0OGFGT0NhaGlQK2FudUJBMDlNdHUxQnI1?=
 =?utf-8?B?cmMzV0VqUm9PMVF5VitoTU5VUkR0cGxmMGNnRjIzTmlyQ1FxcDV5ZVFGbWhi?=
 =?utf-8?B?dTdTemVZOHNDeHFDVUpKVU5ZUzhtenkwNTRpQkYwc2tQc0hyZ2JFb01FNzBk?=
 =?utf-8?B?eHlxVkRabWlNZFVPZ2lUZ0R5OS9CMm1EYTNYVVM1OVpuVzErRWk2ZFNZVlZX?=
 =?utf-8?B?SnR5bkpTemljUGg1S2M3K0t0UzNvTHJvMytyWkV1NWs3MTdDSVZZSHZXS2dN?=
 =?utf-8?B?bXovNGhINHcxWFZ0MUoxNTdMRndWL0ZLV2ZwSjRRU09IbEZlMUdvRG1WYUUv?=
 =?utf-8?B?a1R1VWRpaTZRRzhFSzliUlFvN0pNcW40RXo3N3FrVjdsbGkvRSsxbk5HSHhG?=
 =?utf-8?B?Wmk1N01GS3FqT3ZyUHlUL0YxVndVUEpHNDQ1MWhDMlJDeTROK2E0aWRwRXYx?=
 =?utf-8?B?eVppZ0pCS29TcUVKUktmSFRydk5xSFV6VXlnbFgzV1hLQ3ZaNnFRS2pxOWxV?=
 =?utf-8?B?VmhISExzLzFWV1hiWS9XZWd3bTZsbFRIN3IvLzViOXg4WTJnRllwRW1QeXNo?=
 =?utf-8?B?MlQzZTJBUUEweEliaHdKLzZWaUIxQmYwK3haaVlKYkNjV01JazdBVnpWamZP?=
 =?utf-8?B?R0JseVRiNVZ2dldiWHRVR25wcEhYRE5PcERsVlVXLzVNYzFUWFlVWGl0aVRC?=
 =?utf-8?B?TE53bHZjZnE1NzFkeXJXcFB2RWNQejl1a1NoMmtqdnkrYTlzUCtIdGVxaUkr?=
 =?utf-8?B?cUZRbzhUd1A0S2lrWlUzZzBUc0dlTFc2dzFiMCtVVnhwMWJlNjBmYlNNblBO?=
 =?utf-8?B?NFFSbVRiRTh6U1VKZkFRWGFvenVzcHBiWDkzNzk1aVN6NURaU1R6eHFFL2tu?=
 =?utf-8?B?TWdRV2kyN0EzUjNxelVLSXQ5TlhuNm5pWGpCUnF5NzFCa21TTm01aUpSR09u?=
 =?utf-8?B?YjI1SmoyT28wTEJETmNRL29hNHhxYVpvWEtmQVRsQ2tTaGpCajNTekpyM3Zk?=
 =?utf-8?B?aXE5U1Q5QmdvZDBjamhsK3dUVkxKN3RvZVJkdlFpcnUxRFcrcmFYVUNjTG5t?=
 =?utf-8?B?TTB4VmlQa2ZWSUZFK0FlUDdiclB3cEpvR2tqc1pWcVRNQTdnZmlpaUxOcnN2?=
 =?utf-8?B?TUxydm1JNVY4M1c2VENQczN2eFVtUFBrdU10aG02ZlZtdEp2ZE1hYWJIam5Z?=
 =?utf-8?B?dGtlSlNnT3ZRNFBTNGYwUEJoZEtZY1RNclg5QTQycUl1RS9vcEErY1kxczVq?=
 =?utf-8?B?MGovNDdESnhDMkl5QTR3eSszeWwxamdvTzlKTFIvRkE1TkhLYjU1VG8rbGJC?=
 =?utf-8?B?NEgwUmJPcjYxeUpObktTYllKaXV0dEVpNGtMeW5GU3NnUklDSUFLR00rb1Bl?=
 =?utf-8?B?QmdNY3hkM2JYMkk2VlZpb0V2aG5ObFYrQklOcnJaSW1MQW5EelE0Q1pscFRV?=
 =?utf-8?Q?WFz2HF15mJd70MjgJdntnJQNy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b057f141-087f-4ce2-4547-08de1608dc69
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 10:00:44.8701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJtS1ovukihaqITPvSOEqtRYh8dyyvNNS9TDtcinabja+C8WU4htsmc3LCFxmoYNLnJp2iGwDuvmKutQ/n6QpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4763
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

--------------TGKy2hIstQu5EWQejLDNrbGw
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23-10-2025 18:38, Rodrigo Vivi wrote:
> On Thu, Oct 16, 2025 at 02:55:37PM +0530, Sk Anirban wrote:
>> RPe is runtime-determined by PCODE and caching it caused stale values,
>> leading to incorrect GuC SLPC parameter settings.
>> Drop the cached rpe_freq field and query fresh values from hardware
>> on each use to ensure GuC SLPC parameters reflect current RPe.
>>
>> v2: Remove cached RPe frequency field (Rodrigo)
>> v3: Remove extra variable (Vinay)
>>      Modify function name (Vinay)
>>
>> Closes:https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
>> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c       | 33 ++++++++++++++--------------
>>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 --
>>   2 files changed, 17 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 3c0feb50a1e2..20b2f36c94e0 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>>   	 * Our goal is to have the admin choices respected.
>>   	 */
>>   	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>> -			    freq < pc->rpe_freq);
>> +			    freq < xe_guc_pc_get_rpe_freq(pc));
>>   
>>   	return pc_action_set_param(pc,
>>   				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> @@ -375,7 +375,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
>>   	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
>>   }
>>   
>> -static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>> +static u32 mtl_get_rpe_freq(struct xe_guc_pc *pc)
>>   {
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	u32 reg;
>> @@ -385,7 +385,7 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>>   	else
>>   		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPE_FREQUENCY);
>>   
>> -	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>> +	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>>   }
>>   
>>   static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>> @@ -408,7 +408,7 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>>   	}
>>   }
>>   
>> -static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>> +static u32 tgl_get_rpe_freq(struct xe_guc_pc *pc)
>>   {
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	struct xe_device *xe = gt_to_xe(gt);
>> @@ -421,10 +421,10 @@ static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>>   	 */
>>   	if (xe->info.platform == XE_PVC) {
>>   		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
>> -		pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>> +		return REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> please move the above block to a new function pvc_get_rpe_freq,
> then use it's GRAPHICS_VER inside xe_guc_pc_get_rpe_freq
>
> or perhaps, kill these 2 functions and place all the code inside
> xe_guc_pc_get_rpe_freq()
Sure, I will fix this.
>
>>   	} else {
>>   		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
>> -		pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>> +		return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>>   	}
>>   }
>>   
>> @@ -433,20 +433,17 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   
>> -	if (GRAPHICS_VERx100(xe) >= 1270) {
>> +	if (GRAPHICS_VERx100(xe) >= 1270)
>>   		mtl_update_rpa_value(pc);
>> -		mtl_update_rpe_value(pc);
>> -	} else {
>> +	else
>>   		tgl_update_rpa_value(pc);
>> -		tgl_update_rpe_value(pc);
>> -	}
> please do the same for RPa in a separate patch and then
> entirely kill this pc_update_rp_values values function.
> The logic is the same.
We could create a separate function for PVC. However, eliminating 
|pc_update_rp_values| might introduce code duplication in places where 
it's referenced.
Also we are updating RPn here, imo we should consider keeping it. 
Meanwhile I will continue the RPe fix patch.

Thanks,
Anirban
>
>>   
>>   	/*
>>   	 * RPe is decided at runtime by PCODE. In the rare case where that's
>>   	 * smaller than the fused min, we will trust the PCODE and use that
>>   	 * as our minimum one.
>>   	 */
>> -	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>> +	pc->rpn_freq = min(pc->rpn_freq, xe_guc_pc_get_rpe_freq(pc));
>>   }
>>   
>>   /**
>> @@ -560,9 +557,13 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
>>    */
>>   u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
>>   {
>> -	pc_update_rp_values(pc);
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +	struct xe_device *xe = gt_to_xe(gt);
>>   
>> -	return pc->rpe_freq;
>> +	if (GRAPHICS_VERx100(xe) >= 1270)
>> +		return mtl_get_rpe_freq(pc);
>> +	else
>> +		return tgl_get_rpe_freq(pc);
>>   }
>>   
>>   /**
>> @@ -1021,7 +1022,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>>   	/*
>>   	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
>>   	 */
>> -	ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
>> +	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
>>   	if (!ret)
>>   		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
>>   
>> @@ -1339,7 +1340,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>>   
>>   	/* Bind requested freq to mert_freq_cap before unload */
>> -	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
>> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
>>   
>>   	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> index 5e4ea53fbee6..f27c05d81706 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> @@ -21,8 +21,6 @@ struct xe_guc_pc {
>>   	u32 rp0_freq;
>>   	/** @rpa_freq: HW RPa frequency - The Achievable one */
>>   	u32 rpa_freq;
>> -	/** @rpe_freq: HW RPe frequency - The Efficient one */
>> -	u32 rpe_freq;
>>   	/** @rpn_freq: HW RPN frequency - The Minimum one */
>>   	u32 rpn_freq;
>>   	/** @user_requested_min: Stash the minimum requested freq by user */
>> -- 
>> 2.43.0
>>

--------------TGKy2hIstQu5EWQejLDNrbGw
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi,<br>
    <br>
    <div class="moz-cite-prefix">On 23-10-2025 18:38, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aPootwV2Dugb70gq@intel.com">
      <pre wrap="" class="moz-quote-pre">On Thu, Oct 16, 2025 at 02:55:37PM +0530, Sk Anirban wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">RPe is runtime-determined by PCODE and caching it caused stale values,
leading to incorrect GuC SLPC parameter settings.
Drop the cached rpe_freq field and query fresh values from hardware
on each use to ensure GuC SLPC parameters reflect current RPe.

v2: Remove cached RPe frequency field (Rodrigo)
v3: Remove extra variable (Vinay)
    Modify function name (Vinay)

Closes: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166">https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166</a>
Signed-off-by: Sk Anirban <a class="moz-txt-link-rfc2396E" href="mailto:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_guc_pc.c       | 33 ++++++++++++++--------------
 drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 --
 2 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 3c0feb50a1e2..20b2f36c94e0 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
 	 * Our goal is to have the admin choices respected.
 	 */
 	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
-			    freq &lt; pc-&gt;rpe_freq);
+			    freq &lt; xe_guc_pc_get_rpe_freq(pc));
 
 	return pc_action_set_param(pc,
 				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
@@ -375,7 +375,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
 	pc-&gt;rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
 }
 
-static void mtl_update_rpe_value(struct xe_guc_pc *pc)
+static u32 mtl_get_rpe_freq(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
 	u32 reg;
@@ -385,7 +385,7 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
 	else
 		reg = xe_mmio_read32(&amp;gt-&gt;mmio, MTL_GT_RPE_FREQUENCY);
 
-	pc-&gt;rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
+	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
 }
 
 static void tgl_update_rpa_value(struct xe_guc_pc *pc)
@@ -408,7 +408,7 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
 	}
 }
 
-static void tgl_update_rpe_value(struct xe_guc_pc *pc)
+static u32 tgl_get_rpe_freq(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
@@ -421,10 +421,10 @@ static void tgl_update_rpe_value(struct xe_guc_pc *pc)
 	 */
 	if (xe-&gt;info.platform == XE_PVC) {
 		reg = xe_mmio_read32(&amp;gt-&gt;mmio, PVC_RP_STATE_CAP);
-		pc-&gt;rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+		return REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
please move the above block to a new function pvc_get_rpe_freq,
then use it's GRAPHICS_VER inside xe_guc_pc_get_rpe_freq

or perhaps, kill these 2 functions and place all the code inside
xe_guc_pc_get_rpe_freq()</pre>
    </blockquote>
    Sure, I will fix this.
    <blockquote type="cite" cite="mid:aPootwV2Dugb70gq@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	} else {
 		reg = xe_mmio_read32(&amp;gt-&gt;mmio, FREQ_INFO_REC);
-		pc-&gt;rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+		return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
 	}
 }
 
@@ -433,20 +433,17 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (GRAPHICS_VERx100(xe) &gt;= 1270) {
+	if (GRAPHICS_VERx100(xe) &gt;= 1270)
 		mtl_update_rpa_value(pc);
-		mtl_update_rpe_value(pc);
-	} else {
+	else
 		tgl_update_rpa_value(pc);
-		tgl_update_rpe_value(pc);
-	}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
please do the same for RPa in a separate patch and then
entirely kill this pc_update_rp_values values function.
The logic is the same.</pre>
    </blockquote>
    We could create a separate function for PVC. However, eliminating <code>pc_update_rp_values</code>
    might introduce code duplication in places where it's referenced.&nbsp;<br>
    Also we are updating RPn here, imo we should consider keeping it.
    Meanwhile I will continue the RPe fix patch.<br>
    <br>
    Thanks,<br>
    Anirban
    <blockquote type="cite" cite="mid:aPootwV2Dugb70gq@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 
 	/*
 	 * RPe is decided at runtime by PCODE. In the rare case where that's
 	 * smaller than the fused min, we will trust the PCODE and use that
 	 * as our minimum one.
 	 */
-	pc-&gt;rpn_freq = min(pc-&gt;rpn_freq, pc-&gt;rpe_freq);
+	pc-&gt;rpn_freq = min(pc-&gt;rpn_freq, xe_guc_pc_get_rpe_freq(pc));
 }
 
 /**
@@ -560,9 +557,13 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
  */
 u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
 {
-	pc_update_rp_values(pc);
+	struct xe_gt *gt = pc_to_gt(pc);
+	struct xe_device *xe = gt_to_xe(gt);
 
-	return pc-&gt;rpe_freq;
+	if (GRAPHICS_VERx100(xe) &gt;= 1270)
+		return mtl_get_rpe_freq(pc);
+	else
+		return tgl_get_rpe_freq(pc);
 }
 
 /**
@@ -1021,7 +1022,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
 	/*
 	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
 	 */
-	ret = pc_set_min_freq(pc, min(pc-&gt;rpe_freq, pc_max_freq_cap(pc)));
+	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
 	if (!ret)
 		ret = pc_set_max_freq(pc, min(pc-&gt;rp0_freq, pc_max_freq_cap(pc)));
 
@@ -1339,7 +1340,7 @@ static void xe_guc_pc_fini_hw(void *arg)
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 
 	/* Bind requested freq to mert_freq_cap before unload */
-	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc-&gt;rpe_freq));
+	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
 
 	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
index 5e4ea53fbee6..f27c05d81706 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
@@ -21,8 +21,6 @@ struct xe_guc_pc {
 	u32 rp0_freq;
 	/** @rpa_freq: HW RPa frequency - The Achievable one */
 	u32 rpa_freq;
-	/** @rpe_freq: HW RPe frequency - The Efficient one */
-	u32 rpe_freq;
 	/** @rpn_freq: HW RPN frequency - The Minimum one */
 	u32 rpn_freq;
 	/** @user_requested_min: Stash the minimum requested freq by user */
-- 
2.43.0

</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------TGKy2hIstQu5EWQejLDNrbGw--
