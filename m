Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4CBD59D91
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 20:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2B410E762;
	Fri, 12 Dec 2025 20:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EtoQAeE6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B31A10E762
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765570536; x=1797106536;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5hPheKllaG7jZbt7Ml4eUPXwnCCtjkBCw+8uW/Meti4=;
 b=EtoQAeE6XZArX/dXcivEjb6/JMjazVqFXH7DEl5YVYNs04lqoaWCLMVz
 2UOQyjLdDEptvRirXolhSVoXHah50JCaa3YlTW75CaB/9m+h4f+dI26Fk
 gebcYiiawFFlx1poupuuwg+NfVvX9Zpj6Efmu7KaCJJItC/KLatb72D4g
 ov6cRrK3m5IMZ5AXFa3CzoKMcGbm0MTClCUPWNt4PI4tdv07ltQ9BVwMe
 x4FoNbFYLLDgvBvyqUnCiYakBc8jAdwfDLeSOc5BXI5VZKteiE+ghEq3B
 tSqKkka+z28QFln6/x8vzeDRrkgE36mntmV9rAb2pb7PG8ney6YcJUllp A==;
X-CSE-ConnectionGUID: vTpZXjXzTFeF7MaSJe5I+w==
X-CSE-MsgGUID: hV3DPydyTSCUm0eYzNi20Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67521403"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67521403"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 12:15:35 -0800
X-CSE-ConnectionGUID: wuZrjIM9RaiULnNPPJlCfQ==
X-CSE-MsgGUID: /4EC8plJQneWInkFdmZR5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="201659863"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 12:15:35 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 12:15:34 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 12:15:34 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.69)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 12:15:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doY5Aw5cTNuBAn7wQ+isZOuG9hEh6qWC5YndXefRhbaBJL/EGoYQNjENAdjs91oYZP8J8zqfcVbetIOH/G8/zDDXoGCI2cmAAaiQDzB2nMjI+pJDrgJw7NbxkB6PR31hbIJkW4n+k+9AlVKJcKoVZESwglUuVIMQbrDVElfVWG2FLqzElnpF29UiSJXi1lWPF3iLlfxqu4C/673J1ZhQ1H49Rd/H3XsDXVBk4iSWfFf+rDJpyhAoYgaAVePPM64U7nPYznUrV+p7fzqXTRWVjwZ+0eu7YMuMuqajOvnUAl7oxDB7hblo3KOXLwCwSV5zjKdmDsqVjsEcGTsieTUyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nf8eqwdXtHIFrRUCljMqpQumEHosthXDuUYcL02vpyE=;
 b=unvYUMvj+WcsNcYS4seWQ7TgMegnnPHdbsc6diceUySckyvVtQU20ZPOUuZkoWDdBiiVyyQGbf7By6TVpCiqpvBZCH1xa++Pv3PC+BaNCRqK6RU/mkeL4rmpQ9YHIrWXpd7EZUC1Jzd6D4xmseGJDyla0fiGjzKaWk+2nT9tVuF/b0GLfepmvu4v7kTKO4Kmn9y62r7atR2vTMh6FKcMryUlVnH1La2iFZgDs963Q6AnKVs8mwZzfHR8XVtedT3iK/Y4+TTGYVz7/9dxJO9dKTlsWA/OzrEoRjRL4z8h/KM/drkEKtRTxeOAsXFZ4SWDFZXCX/7bfaZXo7jAILCnvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH0PR11MB5781.namprd11.prod.outlook.com (2603:10b6:510:14a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Fri, 12 Dec
 2025 20:15:27 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 20:15:27 +0000
Message-ID: <d419d646-ffe3-486e-aec6-54f2b8c24a55@intel.com>
Date: Fri, 12 Dec 2025 12:15:27 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/pf: Add handling for MLRC adverse event
 threshold
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251212173449.192639-1-michal.wajdeczko@intel.com>
 <20251212173449.192639-4-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20251212173449.192639-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:254::25) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH0PR11MB5781:EE_
X-MS-Office365-Filtering-Correlation-Id: f37cb93d-7a43-4779-a888-08de39bb308a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjlBWDB0TGlTSHg3d3pWQmlrZ1IyeEY0dmdpVmRjejhwdkZFU3dmL092cmpx?=
 =?utf-8?B?RU03Y0dLbHZHR1c1ZnZTVG9NbFRYWWErM04rYmhoOEZubWJFb1YraVhzOStN?=
 =?utf-8?B?THZhK2RSZzQ0YkZzcWJGS2FMNFdTcndzWVpSdUFJMlRxeGZZaThTKzBRL25K?=
 =?utf-8?B?VlZ2SnFLZHhwT0pUSXNwOU1uK1JyYkFvTlpPUnZNWlRsQUdVSmtrQ0EwSkFP?=
 =?utf-8?B?Z0hmNUhRWFpiSUMwaXlMckZmMk9kSit3YloyWkR3WVUwbVJVdWZoREMyTnBo?=
 =?utf-8?B?NjlCRm5lUjhlc2I1STBOMFByNHZxV1V3WWZFZGtxa2dkZ24xaWlmK01tVVIx?=
 =?utf-8?B?akpkY0EvZXlqcUhyM0NYOEg1OGZ0U2tBWndtWjFhOTRNZXdybVNGMmRvajN4?=
 =?utf-8?B?bEhGclROditid2hHYkY4VEZ4ZnB5eFRGcTB5bmprZk9zS3hGK254WmlxOFJ0?=
 =?utf-8?B?N2tWL0xwVlcvcHdmWTZZRzRwRVl1aUFXYjh6eFdLZmZpTjlDcmxIbVlVYXND?=
 =?utf-8?B?UU9MODBEQjhQTmxGb3lQSzJZanV1eWIrR1NnZUZIbEYxMEdGSXFZMHU0dDFS?=
 =?utf-8?B?QUlHcXJic2J3TGtmdVo2WjFVWUxPK2tNcUZJb1NmYW9RS0ZkWFdXY0tOR1JU?=
 =?utf-8?B?eVpteTQ5QUd2NDJpeDcvcDRvZkk4cGpCdjRwYkk5a3p0eGtBUGkwYWxubVZm?=
 =?utf-8?B?UURESTUvUjdiNkFNaXFaMm9wVTN1MVZTVHU1RTFJTDhCalVIZU5SeTJsV05R?=
 =?utf-8?B?aUxRc2pmR255Nm1vRnUxVUdPMTduVFc1d1FZbm5xNGlPNG1yUnNpYjlNWVFN?=
 =?utf-8?B?UzcwL0h5MXhvUCtKYUVmaTNjcW9mVjdTR1Avd1oyOWRidlVnc2hZdHJ6MDZt?=
 =?utf-8?B?bGRyVmVQZGV5WCs0Rlh5a1VETVI5OEFKdUt0VWVsYTFaTUZ3cWhQNlo1Rmtz?=
 =?utf-8?B?N2pFa0l1LzB5RjIwNVFmUGtCem1aTFp0UWd1aTYvTUtlbnZLUFhqSUpNL0lG?=
 =?utf-8?B?c0hKUjJ5a3JJM2wrL2VhVjFiQ3ZlOXNJQzZSUEpobHZhY243OGNGV0RhS1N4?=
 =?utf-8?B?K1ppeno2V1BnMTJWT1lCa0dlSXdvMXYzQ1BSNUNDS0N5RkhyOWpHVkEvYUdz?=
 =?utf-8?B?aVpOcGNrdVY0amErMnFrL1kxT3R1dFhkcCtwUXdsbHpYRU00ZENKZkdJTTIr?=
 =?utf-8?B?b0hPMUhyUE52Wi9IWXI2UURQeFhRQ0lqYkNxeEczVTR0ZGVTRCtrT2gvYjhq?=
 =?utf-8?B?d0VicWlDQ2xVSmkxSy9odkY2T2dESEVtamVIRWFKSW5YVUlTdTVwYVB3N3hk?=
 =?utf-8?B?bkJxa3oydGtOWFdkeG13eXhkODdId0VMeXhjaTYycGMrQnB5RW8yY0NnVU8v?=
 =?utf-8?B?dHlndFlOZHZHZUoxNjJLR0FiVzRlVlRnL2grMzVNdmZlUGpia1g3YTdtS3Jz?=
 =?utf-8?B?Z2NyWGRGdVNyVFlzT29rTHRITmlBa1ZwL2pMQTZFaStDbG9zZmw3aEd0MlVj?=
 =?utf-8?B?M2NXdUhPc3hZekRLMUpyOVQ1VFpVQjJ1V0NMdUFlZVJXSHJwQnEwRzE2TWFZ?=
 =?utf-8?B?VnI2VGNLakZGQVRCV1Z3RVZMdGI4ZVhodE41cGRxT2ova013L2w2ZXZoeWo0?=
 =?utf-8?B?RG9SaklrNmJkUHgwdWV0Y1NkTmoxNzZ3R0RXNkFSQlBDMlphZDliVW5zZzhN?=
 =?utf-8?B?MXArRjRxelA3UDQrUmwxcjJJa1BkYkxucGw1c3NRZzViWkZyejBGV0ticXFz?=
 =?utf-8?B?enVoUGpSMU1Rb1QvUTlHYUp0NTQzb21ZWnJDQk9YWHBVMVZNaGgyRHdQYzVh?=
 =?utf-8?B?VU4zYzBmbkJFbXNRaW9hVURTOExIcDBMS0FtN0lCWFhocVcvYko0OFNFSGl5?=
 =?utf-8?B?YTEvL3IzVEJiSTlQTlNQcitDRmhLK2xwZmdpaGdwRXQ2WVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2dFUEZ2OFF3eEhKODk1ZEo0d08vSm5IV3Z4T3BKaUc0NWlhVkRDZndMUFA3?=
 =?utf-8?B?WEd4MzdjU2JMU3dxMkV4bjgveXBVTVE5cnh4VkROSUV0VDlwdjBZS2loaXpi?=
 =?utf-8?B?TFI0aE1ZbHkvblQzaERmNnlRWDdndnVwRysxaXFPZUlVczh1Z0hzdzFVTlY1?=
 =?utf-8?B?WlFtMW14TDlFR0VBOFpjUnQ5N0tHTVJMZ1JTVlVkUnVEMnM3Vm9PK0dIbzlE?=
 =?utf-8?B?OHNSMVBQekNFK2hlVGlqcGlCWXpHZDZTQjBneDFxVFBubU5hMGNxNy9vcXNo?=
 =?utf-8?B?UXdzTnRhRG5jbjI4alZnZnVLYWZjdG0vZGNWMFE3MVcxOGNzSjBhZ0EyMjFu?=
 =?utf-8?B?THFwbFlreEhQK284K1hxcC9ycUlXaE5hWTBaU09RNlpRUmw5SXU1azhWY0hI?=
 =?utf-8?B?ejRiWEk1bCtnU3d5THo5VExQOS93Z2FXSXZtUE95V0ZkSVA0OEFSeDdhUHlK?=
 =?utf-8?B?VEZiWjRtTHJVRS9SL2lWSHRBcVJmYjlqVnRsM2czYmM3MTVVYzdnWFlIdXZI?=
 =?utf-8?B?eVRwcTZGTlV6UUJGVko1blhjVXJlSzFOM2tZWnBoZjBhUDFrZk9PYTdhd1VP?=
 =?utf-8?B?WlcwMXBOOThFSTI1MEd3QzRsck00SzczVFp2YWUwSm4wcm8vN09oVlNDMFVp?=
 =?utf-8?B?RnVLTmFqNUN3OFJUMDMwMjRlT002SnFaenRGWUplNkRqenBUalBtcDFuMXln?=
 =?utf-8?B?UklENnlkc3pDcEVINm1HeDYxcCs2c3p2MEphN250aU11aitXQnUrT3MrenJ0?=
 =?utf-8?B?Vkg3Rm9ZU2JwS1RJYVBvcThrT05FSGp6WGsybnBkVS9MM0J1SmxBOU9FMkVx?=
 =?utf-8?B?a3J1bVRZODJBaEVKNHBmRGZCd0c1dGpmTVRKYUZaY3FhdWVLaDhqUlgrbmR1?=
 =?utf-8?B?dlNkeXdKZHVBUlNQWVRObDhQS3M5OFFieGRmUWppUVFORWZqRzI0cUxGSE9L?=
 =?utf-8?B?MHk4Qk5vWHBlcnZ6eUIyV3Y4Z1drZEs3N25OUzNIRlI1d0s5Y0JoaVJmL2hk?=
 =?utf-8?B?MTZ1bnFYKzV3elQwTDNRekhtam96anhPNk53c05tMTVBQW12d1NZYnl6aG10?=
 =?utf-8?B?UE1Cakx4S0FjWmZWdTRYY1pKRGpVK2lnSEUwZUZsSldjc0VhSlRkd1JTWGhL?=
 =?utf-8?B?UHk3YXQ3Tmw4aDV4L0I1YzJjZGxJQ2xHRWdZVFJFN1V4eHE5YjlPcjl2a1JP?=
 =?utf-8?B?MWRzZlFjWDV1L3ZhUVJabHZRRDVQVm93a3dwV2tBYkVPVFExYUVTUWJtTE9U?=
 =?utf-8?B?aDJiY0pXUXBlam12WFA1RG0yVklJYmVyT2ZPcTY4dGJDTVkyblhjMytDb0Qy?=
 =?utf-8?B?ei9pYnZRVXFYQ3lIM05laExtMTFaTHd2djV1R09IWTVtVE8ya2l1R2phKzJU?=
 =?utf-8?B?WGlxVHNqaXNFWGU2c0NDem5KZnUyMUR4ZmJnOVF5aWoxeHZlMlFZSERvSy84?=
 =?utf-8?B?MXZjaHFvbldxL1RhU2dCbjZYMVhTNlJyOEFSWURjN3d3VnVBSnRRcjFaRll0?=
 =?utf-8?B?dWliWWdtT0pVTm9nbDVaU3FWSzNGMG5QUWVzTTQ1SEEzS1J0MU9pSTZJZUl5?=
 =?utf-8?B?TUR2a1ZYMUlmUk1ONlh3aVRtYmtsOVc4eVhPVDl2RG80TmZIZXJGSmpPU1RC?=
 =?utf-8?B?WlN5Qjh5ekxURzUzazh2V1RDUm5PN0NpU1YyT2pKUnJOd1BuakU5bEVHeVBu?=
 =?utf-8?B?U3NHdTJ5T0prNVN3QUdRYWVVNUw2eHVLK0w2Z1ltWjZtQm5pa3dTdFhjUlRI?=
 =?utf-8?B?RjVkeWYzdmtqQW41WE5PUU1hQnVXYzJwMFNVL1VjSW9nczhQenNOZHRwOEpk?=
 =?utf-8?B?UWlBeU1QVk1uRGhHR1RZbWEyRE5BTW1aM3Y0MmJOcjNaRDRMdFF5SytqUzhR?=
 =?utf-8?B?bm1FWnhBQzR6OUtwYm5VVG1DUVRuVHgrSjBka1hobms0enZNdGVCTjI3Qi92?=
 =?utf-8?B?U2VFaDgzblZNVno4K1V0RlZVREtJazRpNldRL2JLdlNSSUU3SVhxeWV4QXR0?=
 =?utf-8?B?RzFpa3laYUl2Q2haWDF0Vnd6U1R3NVpZaVZEZE84bkVSVDcvK1hDNUZ5cmQ0?=
 =?utf-8?B?b3VGSjlrSzZvNTR0a0dJVHA1WWp1WGh1ZEEyT2FNd2k2clkvc09MNHdaTGdy?=
 =?utf-8?B?NkhOUkkzOEFBRko2MzVhOE04eFN5eGRJN3Q0TjdPQmhUWFpHeEoxMkROTStt?=
 =?utf-8?Q?q6FBQII8i4eO2tR6NnW9Uw8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f37cb93d-7a43-4779-a888-08de39bb308a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 20:15:27.0397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INtTSxtpcbqEjbKDp37iKuVj9udM0En49MNk/LPb6Q3F+McAfUf2SNKzLVf7oeceFb6YzVPZfCd5h3TlNJyAYYY3jZYQIDlNQff97RdtVc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5781
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



On 12/12/2025 9:34 AM, Michal Wajdeczko wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> Since it is illegal to register a MLRC context when scheduler groups are
> enabled, the GuC consider the VF doing so as an adverse event. Like for
> other adverse event, there is a threshold for how many times the event
> can happen before the GuC throws an error, which we need to add support
> for.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

LGTM. Not sure if my r-b counts as the original author, but here it is 
anyway:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
> v2: split from previous patch, add GuC version checking
> v3: don't move version code to its own file, call MAKE_GUC_VER from the
> caller instead.
> v4: cherry-picked from [1] and rebased (Michal)
>
> [1] https://patchwork.freedesktop.org/series/158142/#rev3
> ---
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h                | 9 +++++++++
>   drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h | 1 +
>   2 files changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 265a135e7061..89a4f8c504e6 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -352,6 +352,12 @@ enum  {
>    *      :1: NORMAL = schedule VF always, irrespective of whether it has work or not
>    *      :2: HIGH = schedule VF in the next time-slice after current active
>    *          time-slice completes if it has active work
> + *
> + * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
> + *      Given that multi-LRC contexts are incompatible with SRIOV scheduler
> + *      groups and cause the latter to be turned off when registered with the
> + *      GuC, this config allows the PF to set a threshold for multi-LRC context
> + *      registrations by VFs to monitor their behavior.
>    */
>   
>   #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
> @@ -410,6 +416,9 @@ enum  {
>   #define   GUC_SCHED_PRIORITY_NORMAL		1u
>   #define   GUC_SCHED_PRIORITY_HIGH		2u
>   
> +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY	0x8a0d
> +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN	1u
> +
>   /*
>    * Workaround keys:
>    */
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> index 5f84da3d10d3..45ab5a3b5218 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
> @@ -37,6 +37,7 @@
>   	define(H2G_STORM, guc_time_us)			\
>   	define(IRQ_STORM, irq_time_us)			\
>   	define(DOORBELL_STORM, doorbell_time_us)	\
> +	define(MULTI_LRC_COUNT, multi_lrc_count, 70, 53)\
>   	/* end */
>   
>   /**

