Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CAEC282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 14:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DB810E28B;
	Mon, 10 Mar 2025 14:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MjHWoMbR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6BE10E172
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 14:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741616647; x=1773152647;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xX1UyKEXq0a4U9rwzNNNXErAFyxsIKlP03qHgjU258Q=;
 b=MjHWoMbRmdQTNa6+VflMHHYGhlMuUaSm+s/J+cO11dZAbDK3lb+sh7Z+
 /TuYSX/5r7cycr/N4nrphw1dKtWBm7p6Rjy3XvDNOj6U3qxPXJmgxhj2P
 Q72akf2PgkJD0vMdmNmk09XJ0poFJb2HYFKSzSzjKSwWO3Kw7KTgrg0Zt
 497UlcxMY2D3h6NOfdbA5OLP1Rs97ES3T7Mmdq2XwoQQtd4YFhJTKNIWD
 ynGoN5M/r/c0G3J/LFQxgwncITUgR/JMbZYaaNifPVRjfRBE4CtSTrMCE
 o1+8nkO2x/tOm6iZQR0vofqE5ClkZJkAz2rmXp0FJ1HCjQZ6TecstVruQ w==;
X-CSE-ConnectionGUID: P1HFkEPwT8yW9PRLZ/v4xQ==
X-CSE-MsgGUID: 4ErO1VG9SaabdTlmrggJqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="41782744"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="41782744"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 07:24:06 -0700
X-CSE-ConnectionGUID: eCXOxjbJQw+ikzoztgUdPw==
X-CSE-MsgGUID: qlaLd+gmQHuN6CqoKUy+/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="119947670"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 07:24:06 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 10 Mar 2025 07:24:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Mar 2025 07:24:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 07:24:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knOWXNCIZVB82JnXv4aU7XQfy9mF85PFMsPuNf8JML3Xj5IRQ1OTQZ9RcBhXuGwCNbrx5mtwmZnam1mqGQ2aqj6sY5ejJlMoiOfosdcRrTWxHpQDJeRtCIyUAIIjy1XEyuquBVHL1zoZkMNgGIvjNYzWLlvSXzEcNu/dRhRehSdfM9lXRxZDg+7lsy99+7BnHNe9PeeaDZjR8GjxPriahDIcmiipDRVai5ESV/J/HF1Cl1zsTy0mlKoEC5iVtoS7z8M9mkml66B2jeVrXz0y7oY3XiojRCiu5Og7aiHFc772u02Vkog8u8Uyo9HPpKNI5N/U2M4EkCXXYP2vb7SPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Az4Cv39LSUDf9lYx+V1XMeYTGR8lZP77R40Ijn2Q5I0=;
 b=bQmjPDOeQHuWSyrvpDY53xLK085aCkgEo3VEhqGm/0L3w4+ziDf76aGFYRQK3l2/oMadOMgUdiMxEopxSz0KNh+l/sUefMqK+LPhSdpMB4MK/X2Jg7MxsGiamO7UtoNdveycmyqy/kObS54XiPXBVs45JZsN9Z7Bha8THQ5iYrP9Lsq9ZMHh26U/x9qqyg+fg0UuZFlkPHZO7Z550KjdrjwnPZtTWxQNtVTtL0P/NX2HUhCfDVOPUlFa0r06v9gKkUthT2WPKVbvUil6MfCVqlnKk0j0pFmKeGcOeE8PzV9BOZ3i0prQ2GBSG8hZ5yuLm1YlTvJpdofWQD5HWN638g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB7148.namprd11.prod.outlook.com (2603:10b6:510:1ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 14:23:34 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 14:23:34 +0000
Message-ID: <7024396b-0356-4723-bc75-4cb6f6a05cd1@intel.com>
Date: Mon, 10 Mar 2025 19:53:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] RFC drm/xe: Add configfs to enable survivability mode
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>
References: <20250307142446.1790715-1-riana.tauro@intel.com>
 <20250307142446.1790715-2-riana.tauro@intel.com>
 <txoeuk2zlt4gotrzltt3cjtzf2u4ebsjtjicvtsa4a4iz5o5eo@oqgl43byhdoe>
 <bb979148-ec3d-43c8-b73f-e22476f9a809@intel.com>
 <xgmworhkqvbo3gr6toa54occ7tanxjimgyx43pzoojf3li4wxf@7imyzpy5vurl>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <xgmworhkqvbo3gr6toa54occ7tanxjimgyx43pzoojf3li4wxf@7imyzpy5vurl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c98ed5-8d05-4059-b85b-08dd5fdf23c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlhkOGErRkZoOVc2V3NyRGt0VzBQWUVISm8vdkJPWDMvNTVoMkFiZzBlZWRs?=
 =?utf-8?B?ZllRUGRjWTd0V2tRUzJjSEthaVJnVnBETFEydEowbklFY205TXpsakljQnZo?=
 =?utf-8?B?MWQyRG5NT3hRMGxFTFNNWG5nNlhiK2Rrdk5pRytPWGpnK2V0a3J1QklDeU03?=
 =?utf-8?B?aktZNlZuSGxKdWdyMkxWalFPM3ZqbjJYRHVsMFR0Zy8ycjVKL08yTE9uSVJm?=
 =?utf-8?B?VGd0TTNqQVVZU29tSGNjaDU5dTZuZlJxS1ZJK1Q3eWRFckVqaEFZNkFoaFN1?=
 =?utf-8?B?RlRWd1pJSVdnSGRUMmdUMGU3VHJqQnJNbjdzZVc5ejdaRzBYcmQyamdDRGl2?=
 =?utf-8?B?bzdZZzFYL045UllKWkovRDhRUFhHdXBHUlZrSFM0TjhBcEwyMnVyNXVLdGl1?=
 =?utf-8?B?WFo0NzBDeVNQaG1TQUxqM0YrMlNRK3FacGpXeStHZFo0OFpNSlpEVWlLM2xy?=
 =?utf-8?B?NXR2NklnbXROTjA2QzExWjN3UmRoWU4xWnZ4SW8za2h2ay92dUs5K25MVy9W?=
 =?utf-8?B?OEhWamVZTWtKRUszdnRRTFhSa1JaUUR5Mkx3T1kweHlVb2xkNFVqbTVaVkND?=
 =?utf-8?B?bGFmaVhCS2FrWUZ6RU1tNzlFWXpwdk1lZ2NKMmlaV1h4MlY5SzgvRkZCSmFr?=
 =?utf-8?B?T3pJY0RzU011dHdJMFRCNThQYlhLVHhDazJsZFp1TkY2SWY0cTB1emhaZHlE?=
 =?utf-8?B?NVU1eUx2MURqbm5aZUhwQ0czYnJmMVkxanFZWi9hLzhEcHdDTlVZR01iWldI?=
 =?utf-8?B?ZUU5eVBGS1pnWkszajVHWnBoRjQ5S3krRlhlSUIxeGh0clpvTTBtMEh5a3p4?=
 =?utf-8?B?S0dWSWlZcHpJSXc5RzRranA5dTRRZUtUSkxqcFNGNUhFQ1hRcDJGM1JueGtI?=
 =?utf-8?B?azl3eWQxaVRRTUpZakFwNzJRajZZZDR4czhkUlR0UURPRlJDRlA1VGxQWldi?=
 =?utf-8?B?Yzk0UzNjMzMxSnRwMEtzQkxoWmtWRDUzeUt5QlRXWWgzb3Vhak1CYkJDSFJP?=
 =?utf-8?B?MzVSVVZuRUt4aHlzSDNtak56SmRNT3d0bjRSVFEzbzl4YnlTNFNDd2EyVWdC?=
 =?utf-8?B?M1ozR3hiSzc0TmRNMGFrZjZRaWx4OXNIK3dENFNMNmhxU3FtblBxc2dkd3JH?=
 =?utf-8?B?Q0VmRVlEZDVNZFFUNm9XUk05cEJNNVYzSHJVQjZZZjUxWWlhMzBkV0FKblE4?=
 =?utf-8?B?RHdJbE04MlBTckN3a25kWGd3dDh1dHZudWErTTBYM3J3ZWZjbnhwdXVRVzNj?=
 =?utf-8?B?TUQ3aktSUHNIL2FPbUxGVXdIUXBWUnhEbEd1d08vUkVUSDlDV0lsYjlUZDdV?=
 =?utf-8?B?YjNNTDBQZVFaKzFBdUREZ1dveDdQOE9zYzFZNlgyU09FSVM5TjFDaUhib3Bx?=
 =?utf-8?B?eTNoYnpyUEVqUm5FVWZwRExHOWlTQkdLUlpSNThzVWZHR0VIa29wYWNocVY3?=
 =?utf-8?B?MkJ2dHB4YURuNDhEZkcvR21vSEZESVR6S0k0c1FESTVjVHJpQWJrOUxQeWpu?=
 =?utf-8?B?VVdyc3BLYkIyQ2ROZVAvTzczS2Fjam9iaXBHaERDd3lRdzM4ZFlJcWFxKzA1?=
 =?utf-8?B?NEszYVpLWlQ5dUdMejV1UXc5bWlIMng3M2FUeFpEVzJHUVVXNTA3MWtMWDBB?=
 =?utf-8?B?QW85VmJMM0IxUHlKaklFRnhSWm1lOXkvRi9ZaVBEQjN1U2pTRHNJaUhmeWJl?=
 =?utf-8?B?TmlJTnE1ay9uL1VZR0JHck1XZlkvcktucGNwYTNwYXlscExyR0lhb2R2TVM5?=
 =?utf-8?B?SGo5Ni9FUVhrY0JTbUZTb1dTemZGWjZsa2xOSXlkWlUyUUh2bDRUaEhxWHUy?=
 =?utf-8?B?ZUh6b0dVNjJlc3g5ay9tdWZ2aGs0aWtmMnprUU1yTjlOZ0dOZWxvV1FhV01r?=
 =?utf-8?Q?zXjmSN2foY2Al?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0dhTzMra005TWlGeWhrbldPVTVCY2ZsbzVsY2JlWkx5OUVGeGhJVU9XNlZS?=
 =?utf-8?B?ZHpIbWd0WEprejRCaUVXV1VBM3pEZUFRcGlmVFZKclZwanhDLzQreUdiNXZD?=
 =?utf-8?B?Qk42eW80V05weTE5VXd4SldRY0JWaVY3SHBvbTRVL3locnNieXJxK0dsU0Rr?=
 =?utf-8?B?Nm56aGpPU1V5OW90T2Z5YmF4WG9abjFYY0piSWVlRjJLaGYvNm5YVnp3TVZr?=
 =?utf-8?B?UElUYTNTWUp4ejdxUm14QXQ4aFhseEZUaUIvNUowNDc1cU10dUd0MGd3cG02?=
 =?utf-8?B?a0xoSjkxM3UxT3BkQmdRVzdqMTZmeXhsUThWdW1iYUFKdW1McUE3bVJBY1Nu?=
 =?utf-8?B?QkhpR29IaTZ1ZkI1dzkwbS9ua1VOVmhGaWluQld6NmdoYUt5ZHdTQ3RNSTBq?=
 =?utf-8?B?eWE3RW01S0RUVmszL3NzQ2hOOTdEQ1oyMW80LzlZOHMzT2JMSThrRDhXZURj?=
 =?utf-8?B?a24vUmJVei9WeHpZdVZLTWdmaENpZUVYWEgwcWlUUzg4T3ZqUlJxelplMnBm?=
 =?utf-8?B?WmNKYTlhTTdqbk9zSzBGcTdET2llOHdXMVdycW16dGh5d3gzakVpd1RtWkN3?=
 =?utf-8?B?MXRLbUZseDkvVHFNMCszcjF6L1dxcVo4a0x2WjJMSWFvZUNLUE0wdER0N2l0?=
 =?utf-8?B?MUJBOEQvcVNTbVBnL2xNckRoM3NabzVuRDZ3SGMyanppdjVjTzFXQnJnY1ZY?=
 =?utf-8?B?M0VHM3ZqdDBuV1h4VVZZQjJHd1JiRmQvdTJka1JYTU1YTFFETTlNeGlRdHIz?=
 =?utf-8?B?QkVmN09VSzdoTXpqVkQ1N2RVcEtIdWRuV2Nsa2ZIdWdZajdpNXMwM29FMHp1?=
 =?utf-8?B?K3RGRnBNS3l2Zmlrd0o1RjgraGduQVpUMXYrbTZGaGUzTVpHYmN6eVRaUkZG?=
 =?utf-8?B?V3ZXdnBpMEpSQ1dWSjEvdFlPNHh6Z1JsOWExcGd3eFUxQkFmUThJTmJHNXNn?=
 =?utf-8?B?R0ptckVud1VMalMwT3ByRVdkL01ScHhyVVhmL2UzOFovMjgwOVFmRmIwV3VV?=
 =?utf-8?B?elVuT1Vyc0pONEFxc1R2NzRManQrZFBqUnNhVlVJcFZsTkxwYjM5MVMzUE56?=
 =?utf-8?B?UnI3cUd0TlArNDlhRmdZZWJ1Nlp3TDJXVW5GSm5jWnd1bVBMNi9FU2FGUy80?=
 =?utf-8?B?L3FiWkRzR0RnUHRTYTdYN095blBUb1FOVXpIdTFEdFpPUDFaOEMrS20wMVRq?=
 =?utf-8?B?MHZyR2pxR0FJWXdRSHI3RXRHK0Vwc0N0Si8yUU5nbzBtV3ZRdGM1d1U0ZmtX?=
 =?utf-8?B?QXZ5MUc5ZnBmSDh3VEZlVE45aG93ZGlwL05kUHF1YzdoN1BTTVl3QW41UkI1?=
 =?utf-8?B?NytGSW5ESCtxMGRkWmIrL3F2MkV2cGNVeFBRZWwwWXozWHpXU2I1U2ZsZXNF?=
 =?utf-8?B?bUFIajIxb3RFcHBzSjdTdTgvYmFjUFdDTmV6aDFzU0NGV1llWFpHaUxGWVpv?=
 =?utf-8?B?b0Zpa3B4ZExNeDNwYm52c1dnQW8rTXJNeU5WRzduMkNyM2pzY1J4RnA2MjJ2?=
 =?utf-8?B?Q2tzRnBIYng5VUxGUzVBYkJwOC91WmVFSDRjT1RGQTV1SjR0VjI2OTBDM2o1?=
 =?utf-8?B?WXRiUlBuVTNqSS81eUV2YUZQTjR1dzUxTGxWK1BuUHJaUVdYZkMxckI1UlhO?=
 =?utf-8?B?RnlFWWpSZ212b0R3SEMzdTFlVEE2cndjRVl6OGhwS1RsS3hzZEdETklycEFN?=
 =?utf-8?B?RnZTTkNUMmV6ZTlnamtoQkxLdS9Hd09BdVhWcnk3djUvYlg4QUp4VFM3bDFQ?=
 =?utf-8?B?Qk1LdWVRK3JUb2kzdjcyWkNDU0k1d0tITzhlUm9BS1hiL3RkSWtHc25OaDBH?=
 =?utf-8?B?aGNLcTZhRU1kell3cHk0Zmhlb3ZIN2hhTWdSYkpEcnhUZml6RjNPRG5uR0Iw?=
 =?utf-8?B?QWVUN0FSTkhsY2xEcEZONVZ3dkd0ckxJVTAxTmprVzl5bDNlNFBsKzNSdnph?=
 =?utf-8?B?L1ZmQVM5WGJFclJNSmtsQ21FTlIxSzlPRmlpM0dMQ0JaY0V1cmh5cFQrVy9K?=
 =?utf-8?B?L2V6MjVQSzhxdnRVN3kwRzhaR3RFK2x0L0J1TlNYUU5LNUZuRDAzZVdaaWVI?=
 =?utf-8?B?UjdTOHNwbTZvNGNOQUJIRVE5dnAxOGM0RG8rRERob05PbEkxUnJxM0l2WnBI?=
 =?utf-8?Q?RJoxBKyLJCobU49eof21rACy1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c98ed5-8d05-4059-b85b-08dd5fdf23c3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 14:23:34.3219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5Z90P2P0ZBGdhkczw27zxCBt43dkEs21UqK2V2dXx1L4zKnKLypGjO6nGrKbagpFLaMOe7ri4GHH1uU52w9bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7148
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

Hi Lucas

On 3/10/2025 7:01 PM, Lucas De Marchi wrote:
> On Mon, Mar 10, 2025 at 11:01:50AM +0530, Riana Tauro wrote:
>> Hi Lucas
>>
>> On 3/7/2025 8:46 PM, Lucas De Marchi wrote:
>>> On Fri, Mar 07, 2025 at 07:54:44PM +0530, Riana Tauro wrote:
>>>> Registers a configfs subsystem called 'xe' to userspace. The user can
>>>> use this to modify exposed attributes.
>>>>
>>>> Add survivability mode attribute (config/xe/survivability_mode) to the
>>>> subsystem to allow the user to specify the card that should enter
>>>> survivability mode.
>>>>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/Makefile      |  1 +
>>>> drivers/gpu/drm/xe/xe_configfs.c | 95 ++++++++++++++++++++++++++++++++
>>>> drivers/gpu/drm/xe/xe_configfs.h | 12 ++++
>>>> drivers/gpu/drm/xe/xe_module.c   |  5 ++
>>>> drivers/gpu/drm/xe/xe_module.h   |  1 +
>>>> 5 files changed, 114 insertions(+)
>>>> create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
>>>> create mode 100644 drivers/gpu/drm/xe/xe_configfs.h
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>> index 9699b08585f7..3f8c87292cee 100644
>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>> @@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/ 
>>>> %_wa_oob.h: $(obj)/xe_gen_wa_oob \
>>>> xe-y += xe_bb.o \
>>>>     xe_bo.o \
>>>>     xe_bo_evict.o \
>>>> +    xe_configfs.o \
>>>>     xe_devcoredump.o \
>>>>     xe_device.o \
>>>>     xe_device_sysfs.o \
>>>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/ 
>>>> xe_configfs.c
>>>> new file mode 100644
>>>> index 000000000000..8c5f248e466d
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>>>> @@ -0,0 +1,95 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2025 Intel Corporation
>>>> + */
>>>> +
>>>> +#include <linux/configfs.h>
>>>> +#include <linux/init.h>
>>>> +#include <linux/module.h>
>>>> +
>>>> +#include "xe_configfs.h"
>>>> +#include "xe_module.h"
>>>> +
>>>> +/**
>>>> + * DOC: Xe Configfs
>>>> + *
>>>> + * XE KMD registers a configfs subsystem called 'xe'to userspace 
>>>> that allows users to modify
>>>> + * the exposed attributes.
>>>> + *
>>>> + * Attributes:
>>>> + *
>>>> + * config/xe/survivability_mode : Write only attribute that allows 
>>>> user to specify the PCI address
>>>> + *                  of the card that has to enter survivability mode
>>>
>>> I think the desired interface is actually that the user mkdir the bdf in
>>> <configfs>/xe/. This populates the available config entries that the 
>>> user
>>> writes to.
>>
>> Initial thought was mkdir bdf, but since it was a single attribute and 
>> after a offline discussion with Rodrigo, did a simpler version to get 
>> comments on the RFC patch and if configfs is okay to use
>> for survivability mode
> 
> I disagree on the conclusion as then you are moving away from how
> configfs is commonly used and also making it harder to add new
> attributes in a uniform way.
> 
>>
>> For survivability mode, below procedure needs to be followed
>>
>> echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/unbind
>> add bdf for survivability mode
>> echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/bind
>>
>> After the device is removed directory has to be created, the bdf has
>> to be checked if it belongs to xe driver and then attrs populated.
>> Even i think mkdir is better in case other attrs have to be added in 
>> future, but for unbind case the check of the driver might be tricky .
> 
> I think you are talking about the mkdir in the wrong place. It isn't
> related to unbind at all. The sequence you mentioned is just because we
> lazy and let pci auto probe the driver. Under the hood you are doing:
> 
> 1) load the module
> 2) bind the driver
> 3) unbind the driver
> 4) bind the driver in survivability mode
> 
> The sequence we should actually have is:
> 
> 1) load the module
> 2) bind the driver in survivability mode

This is what i meant.

1) load the module
2) bind the driver
3) unbind the driver

4)  mkdir /sys/kernel/config/xe/0000:03:00.0
    echo .... > /sys/kernel/kernel/config/xe/0000:03:00.0/...
5) bind the driver in survivability mode


At step 4, when creating directory. The bdf needs to be validated, ie 
(it should be pci_dev that xe will probe). i checked the struct pci_dev 
but didn't find anything.
Will have to match the device id against supported pci device ids.

Otherwise, there might be wrong non functional bdf directories present 
based on what user provides.

Thanks
Riana
> 
> You shouldn't create any directory when unbinding. It's the user who
> should create it. When **binding** the driver we should check what are
> the extra configuration available and adapt the probe according to that.
> 
> For that we have to disable pci driver autoprobe and tweak the
> configfs settings:
> 
> 1) echo 0 > /sys/bus/pci/drivers_autoprobe
>     modprobe xe
> 
> 2) mkdir /sys/kernel/config/xe/0000:03:00.0
>     echo .... > /sys/kernel/kernel/config/xe/0000:03:00.0/...
>     echo "0000:03:00.0" > /sys/bus/pci/drivers/xe/bind
> 
> 
> Lucas De Marchi
> 
>>
>> The attr is WO and any value can be written, only if the correct bdf 
>> is added in the attr then it'll be used on probe to enter 
>> survivability mode.The current patch only checks the format and does 
>> not check if bdf belongs to xe.
>>>
>>>> + */
>>>> +
>>>> +void xe_configfs_clear_survivability_mode(void)
>>>> +{
>>>> +    kfree(xe_modparam.survivability_mode);
>>>> +    xe_modparam.survivability_mode = NULL;
>>>> +}
>>>> +
>>>> +static ssize_t survivability_mode_store(struct config_item *item, 
>>>> const char *page, size_t len)
>>>
>>> once you handle the mkdir mentioned above, this should probably be
>>> a boolean attr like this:
>>>
>>>     drivers/nvme/target/configfs.c:CONFIGFS_ATTR(nvmet_, 
>>> param_pi_enable);
>>>
>>>> +{
>>>> +    char *survivability_mode;
>>>> +    int ret;
>>>> +    unsigned int domain, bus, slot, function;
>>>> +
>>>> +    ret = sscanf(page, "%04x:%02x:%02x.%x", &domain, &bus, &slot, 
>>>> &function);
>>>> +    if (ret != 4)
>>>> +        return -EINVAL;
>>>> +
>>>> +    survivability_mode = kstrdup(page, GFP_KERNEL);
>>>> +    if (!survivability_mode)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    xe_configfs_clear_survivability_mode();
>>>> +    xe_modparam.survivability_mode = survivability_mode;
>>>> +
>>>> +    return len;
>>>> +}
>>>> +
>>>> +CONFIGFS_ATTR_WO(, survivability_mode);
>>>> +
>>>> +static struct configfs_attribute *xe_configfs_attrs[] = {
>>>> +    &attr_survivability_mode,
>>>> +    NULL,
>>>> +};
>>>> +
>>>> +static const struct config_item_type xe_config_type = {
>>>> +    .ct_attrs    = xe_configfs_attrs,
>>>> +    .ct_owner    = THIS_MODULE,
>>>> +};
>>>> +
>>>> +static struct configfs_subsystem xe_config_subsys = {
>>>> +    .su_group = {
>>>> +        .cg_item = {
>>>> +            .ci_namebuf = "xe",
>>>> +            .ci_type = &xe_config_type,
>>>> +        },
>>>> +    },
>>>> +};
>>>>
>>>
>>> so... it seems you are missing a configfs_group_operations.make_group.
>>>
>>>> +int __init xe_configfs_init(void)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    config_group_init(&xe_config_subsys.su_group);
>>>> +    mutex_init(&xe_config_subsys.su_mutex);
>>>
>>> this mutex_init seems odd, but inline with other drivers
>> yeah it is not used anywhere but the sample and other drivers also 
>> initialize it
>>>
>>>> +    ret = configfs_register_subsystem(&xe_config_subsys);
>>>> +    if (ret) {
>>>> +        pr_err("Error %d while registering subsystem %s\n",
>>>> +               ret, xe_config_subsys.su_group.cg_item.ci_namebuf);
>>>> +        mutex_destroy(&xe_config_subsys.su_mutex);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +void __exit xe_configfs_exit(void)
>>>> +{
>>>> +    xe_configfs_clear_survivability_mode();
>>>> +    configfs_unregister_subsystem(&xe_config_subsys);
>>>> +    mutex_destroy(&xe_config_subsys.su_mutex);
>>>> +}
>>>> +
>>>> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/ 
>>>> xe_configfs.h
>>>> new file mode 100644
>>>> index 000000000000..491629a2ca53
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_configfs.h
>>>> @@ -0,0 +1,12 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2025 Intel Corporation
>>>> + */
>>>> +#ifndef _XE_CONFIGFS_H_
>>>> +#define _XE_CONFIGFS_H_
>>>> +
>>>> +int xe_configfs_init(void);
>>>> +void xe_configfs_exit(void);
>>>> +void xe_configfs_clear_survivability_mode(void);
>>>> +
>>>> +#endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/ 
>>>> xe_module.c
>>>> index 475acdba2b55..15b3cf22193c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_module.c
>>>> +++ b/drivers/gpu/drm/xe/xe_module.c
>>>> @@ -11,6 +11,7 @@
>>>> #include <drm/drm_module.h>
>>>>
>>>> #include "xe_drv.h"
>>>> +#include "xe_configfs.h"
>>>> #include "xe_hw_fence.h"
>>>> #include "xe_pci.h"
>>>> #include "xe_pm.h"
>>>> @@ -91,6 +92,10 @@ static const struct init_funcs init_funcs[] = {
>>>>     {
>>>>         .init = xe_check_nomodeset,
>>>>     },
>>>> +    {
>>>> +        .init = xe_configfs_init,
>>>> +        .exit = xe_configfs_exit,
>>>> +    },
>>>>     {
>>>>         .init = xe_hw_fence_module_init,
>>>>         .exit = xe_hw_fence_module_exit,
>>>> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/ 
>>>> xe_module.h
>>>> index 84339e509c80..c238dbee6bc7 100644
>>>> --- a/drivers/gpu/drm/xe/xe_module.h
>>>> +++ b/drivers/gpu/drm/xe/xe_module.h
>>>> @@ -24,6 +24,7 @@ struct xe_modparam {
>>>> #endif
>>>>     int wedged_mode;
>>>>     u32 svm_notifier_size;
>>>> +    char *survivability_mode;
>>>
>>> drop this.. We want a  config struct in the xe_device. It's actually
>>> allocated by the mkdir in the configs and when we are probing, we should
>>> find the config instace based on pdev and set the pointer xe->configfs
>>> or something like that.
>>
>> Will add a new struct
>>
>> Thanks
>> Riana
>>>
>>> thanks
>>> Lucas De Marchi
>>>
>>>> };
>>>>
>>>> extern struct xe_modparam xe_modparam;
>>>> -- 
>>>> 2.47.1
>>>>
>>

