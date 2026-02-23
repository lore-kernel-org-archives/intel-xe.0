Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D3CEEC29F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 22:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2133D10E1B7;
	Mon, 23 Feb 2026 22:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dRr1YWNS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6BC10E1B7
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 22:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771884878; x=1803420878;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PDhUeBJgmEzqzD+ElPCZweveO9Mce9uSfr+8OnZvI2o=;
 b=dRr1YWNSWN08vPk52oHCy7kCeIvb29AjHKCk6VohVnpsBJDcXzEp+8CS
 YxbFyiP+xHVyFSwEYlUbjTBIiWJSpcTuxsx5Z7Rlcf5ZdHUyq7OwamKWJ
 bZ8yI/MyDgfT7mTolcdie0iQXE9DTUQQpmGXfv1+mc4IfJmBy/NW4cTXD
 hNSnAFvezMihYvi3mtnD0torMqQJgrueixRX+L6viGO6HqCdCCmMHQgka
 LcEjgITelEsc3km9/S1snIy1NkGV4xa0spYDMC47VfjnEIIwJKSywokT9
 YWMzoYunASbJTLVkyIL1bwaIWPq7DVZwoOTZBZm8XjHTe6mX2ILI8Rjtc w==;
X-CSE-ConnectionGUID: //DV9eiLTz+qnxLN+E9TSQ==
X-CSE-MsgGUID: T7Cdbe3/ScO7KnhKet2whw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72802720"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72802720"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:14:38 -0800
X-CSE-ConnectionGUID: ZOK1JtNjSySG1nYXrkgigQ==
X-CSE-MsgGUID: oVVLsuYTSeCFVCnZ6MDMxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220700441"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:14:37 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:14:37 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 14:14:37 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:14:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYPf3Z6+VZKUE6V0n1Kf16UZfOLppvITQkjtSfXkmAcZ97vVX9AeKdJn2BX58j3qlNh+SGvyFpCB63EiBDjgLzbEOaW5huQ9btnXzorgnmeOkK38pYU19MHDr3r8Brd4DpaKvdBsvw1ct2x0rQRR65P8TGhYhtJtIUdtC77PH/oSFUF1iqQqyi7EXpG7DeWbplv9gDgBJGVi3PGrXJpMMYVWV33d1xvqeahnGEeQR1Exa4fyP3cAh0+VW7QUu5Tzl3/UtCi5TRgNT3U1jLzkDa2WMdu9h2orOzOQW4RE5KYYSdBqXuHeUa/6o08Btw0sut8f7p0DynVj6OAjVAcL0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDhUeBJgmEzqzD+ElPCZweveO9Mce9uSfr+8OnZvI2o=;
 b=aY8uviKTZzv5NwaM2vVPM77Eert2RiIybFewaOQnp2dJMhjNq/1KO8QDOTUyaR83suoWuMTT8VRrAXI9XkZtS8h+bp0v9IwIBYNsx+y3UFY0nWLLusuPJBeVaQlScQ8mU3weri1qIgZjt5rREgBM4TSycxqjKp8FlLdz6/SbXwT9zlx2KwpyVBzOdterezDGe+8zWX2ne37991V37Lzk1REMkg0HVsKVri+7VQrNhEDLHIh6mO8u+4j0aigRvUR+C8Ifq/AEHps/w/ad9Tz1YZ+b3GLTmoJleELziLXXOlruoE1duY5rmaZbJxSnIqeMFVk4WC8XYOO0GaGOKDyV/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DM4PR11MB6526.namprd11.prod.outlook.com (2603:10b6:8:8d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:14:32 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%3]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 22:14:31 +0000
Message-ID: <8afd21ec-48b5-44b5-828e-da4e49d2fe74@intel.com>
Date: Mon, 23 Feb 2026 14:14:28 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/pxp: Clean up termination status on failure
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
References: <20260219002627.1208210-5-daniele.ceraolospurio@intel.com>
 <20260219002627.1208210-6-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20260219002627.1208210-6-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0103.namprd04.prod.outlook.com
 (2603:10b6:303:83::18) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DM4PR11MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: 30b6866e-474c-4603-c159-08de7328eb37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0FaWXhXZitlSmZobFFDSmZoaGpvOVYxZnRvWWhudVVCOFNFb1FxenZrS3Az?=
 =?utf-8?B?c3ptWlNoaEhZM0lhT3hZSnIxM2RKVW5DL2tkYVA5RU1xeE1tZWltK2dHdGhJ?=
 =?utf-8?B?c3pVL3ZZSDV3L1dOWFB3eFUrTTRZOG9qTEdHSmJ2OEtmenh4K2JMekgyMnJp?=
 =?utf-8?B?TExHMW9NRnVOQlBsYUVoR3Q1R25HbzhCZ3pkbk9JVGFHdHZhbGxFRG0vN3Ux?=
 =?utf-8?B?aXNoVmtRU29nWDR5cnE2R2w1U2liTUwwekxqMEkwL3g3VDZKY2QwZ2Ywam50?=
 =?utf-8?B?YzQrdS9rTU5QZTJubFNFR0Eyc1NsQVlVUVo1aWhGTWk2OFRzT0dyZkp5QUY1?=
 =?utf-8?B?NDU1ZFVDOG8waHlXR2RwcEFIRGdRZDViek5leWdrRnhHcS9EdS8yWklxVml6?=
 =?utf-8?B?bEFyVGxmVGxCa25iMGpkSnUvNk1WYUdQNjlBdy9oRjlabG1pMSs1Y2RTYk5Q?=
 =?utf-8?B?WTdRQmorWlYxcy9Xa2M5dElvcC8rcGw4Vzk4TmhrYUVDMUw0MEVQM3NTcDYv?=
 =?utf-8?B?aW9LQVRFckRHY09LNytmYXlVYkdqeS9IL0w4bTcvYThMYkxKUFIyaHFGWVN2?=
 =?utf-8?B?SHhPa2JSL2xENm9CM0tQRkFvUERLNDF4OTVBY2F6TFpVd1cvbDRGaUFZZ3JB?=
 =?utf-8?B?V2VMU2FQc0tjQjV3R0lzYXVsTkF4elJBYm51VzRGa25xdTRoa0RMeS9FUmhu?=
 =?utf-8?B?dGxza1RpbXd6dGN4WFkyMzNzeVVTZCs1c2JNL2NEVVpUSkhVOEdxQnNnUEtN?=
 =?utf-8?B?bVJ4ZzdxTHl4TEF4WnhFejl0ckp2ekpVelptSmdEMzk3VWxOa0o0dDQ1ZEpq?=
 =?utf-8?B?dExpczVyaWQ2R1dROFZzWmZYQzVyeFY0eG93Y1FmWVVWcmxKTjhSaUFOZ0g5?=
 =?utf-8?B?eXRhRXFBTHBNdjgyaXVuYjhzeEFGU1V1dUtHQ3ZHZysvT05JRXlVUXFGN29Y?=
 =?utf-8?B?UnNIRk5scVVrdGJQOTlFRm1Xa09FOXVpdzlJdVU5cW5rMTBKSTRQQk9VK1hw?=
 =?utf-8?B?YXN3RTQ4em81UjgxQTJ2TDd6M2dPVXdxUmRVbDI2WUZHQVZDSWN1dmRFcGt5?=
 =?utf-8?B?aVp6UXI3TjJsZ21sM2MxN05CV211NENoR0hGbG9tV2RaaFlZRnlCT0FyMWRm?=
 =?utf-8?B?UmVjT0FCQ2ZpQUkralRKMndIRS9rMUs4OXBuZlQvTGVHV0RnYlhSbHdwTFdh?=
 =?utf-8?B?TjRvaUVFRFVVODBnVzJKMDZ5ang1UHAzQ2xVRldmdEpaUFduZTExRjloWlg5?=
 =?utf-8?B?RDBHallvRlBsMURFOTNLUGdxSUlvNW93SG5DekhqUmNNTXVJUCt0TFNjdTV3?=
 =?utf-8?B?cTY0Uk15ZzRtdTFzcXNBTFo5SDJ0NHREb0ZsOExBMGgvaWJDNlhHcGpjSm5y?=
 =?utf-8?B?K3cranJlSHNqZSs1ZTUwQmI1MHFxVWovWFJhbXQrZ3pNYkN5MkY2aUpTbGY4?=
 =?utf-8?B?NUZJQnNuR1RGTmwwUSsxR2JPU01QMEZwVExYQWo2QkcwTVA2YzdEa3E1Mm1l?=
 =?utf-8?B?cjBNSUtyQTBRd3NWcmN3VEtWbXZ0WDFLRjBEVEtBVCtzVUFEZzU5UnBWc05I?=
 =?utf-8?B?dVo3UnJHVGFrUCtUanJNRUYrQlpoRUY1SDFJYWF3WG9CSFUycjJIK2FXcStk?=
 =?utf-8?B?d0wwV3BoZDZUUm9mRklHZjVyNDA4L2x6NmVTdjdWMldtNW9mY0VoTTdWQ1dC?=
 =?utf-8?B?L2o3Yng5cy9jdnYxTDI4WUZYU3UyTE9rTDJ3MVBheG90VDNTdEVvL0hBSzQ2?=
 =?utf-8?B?S0hBWFlXOUdBcmxUaHpEaGhIamdQT29FaktpOTMvRWYwNklpY1daL0dlSU94?=
 =?utf-8?B?THNYTU9GOVdaK3ZySWQ3M0J4QSt4UGcxS1VmajI3NE1HNGt2K25hMlFUclNZ?=
 =?utf-8?B?YTh4UDNtblhvUFJmQWhKQkxUZzFwSmhGcjlnMkZTbFcyZTg5R01uTVZwSjdP?=
 =?utf-8?B?UHRYS2gwd3p0UVJjZ0NXSHRqRFNmdXdPcmdpWm0zMU5sNEN4aktlRGoxOXdk?=
 =?utf-8?B?NVJ2NmdBd05NcjNnWlZiYjJXT1RiYzVDbnA1Nzc0YTF0TmNLUXVjK1dMUi9p?=
 =?utf-8?B?QVd0ajIwMUxwSW0xMkJubVB4N09HYjVGYTcxb1FNL1dpcE1MR1BMd0QvYjVI?=
 =?utf-8?Q?o4Zc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1ZUSm9SQ1ppZDhDQ0M3eW5tN21nc21UTzRnWENjSDlpTDJweEwvLzJEQWdS?=
 =?utf-8?B?dVo0NTMzSURCbnpnYzREWGNwMWxUaS8yZFhuNGtCSzV5VmhGbXJRN2lsQ25u?=
 =?utf-8?B?ZmhLRmJJZ0VValFLTXlUOU13N2dNa2c2VjFscW5WdkxoS1NqcjdBdUNWQjl6?=
 =?utf-8?B?WmQ4WTJJY0JoSGhUaGtLZEFCZkMyMXEwRmpLZE4reVpoUlFaZHdxWTRzeUNy?=
 =?utf-8?B?UGcwdU9kZmVnN2EvWFh6WWZWYm9JSTIzUUxJZ1ZYSXJRSWxzcWN5czhwYVlt?=
 =?utf-8?B?dDRDZVNyTFhLWG43WU54bjRLZG5LSC9RLzRFMHQxcC9QODNON0tCdUNibzhu?=
 =?utf-8?B?SXRlVVVRV1ZxU1FVdHI2V0o2bnR5TmgvdzVjc2NXdHhlRmFnNGl4dUVBYXRu?=
 =?utf-8?B?VGFSK2JEWnZIZ3dtZUZKbXV3VzRPNEFldkwwVzdQNTVwMXV5N3Fab2lVNHVM?=
 =?utf-8?B?cURqMkZaKy9PalJCcVVPaUFiVEJEdUtXSm54OVdXZURBdkZPQ0lFeUxxNHRw?=
 =?utf-8?B?RWZDNWVJWjNyV0NoYXhKM2YrcHorMmxuYlZ2dkRYd3F3OERqY0pKUm9NRnlE?=
 =?utf-8?B?VkJQZlhmK1ZjcFdtMXBvVGVGQ0hOQ3RwVUVzQjNQQVZCNTc0YUt2QTNEY3p6?=
 =?utf-8?B?am8wMmFHY0F5cUE1UlVHa3NucFRBRDI1QXpQYjJKdmFPaDlDRkRlWlhNNjVM?=
 =?utf-8?B?TXgxNDgrS0QrNU82a1g0YzJYV1ZqZm0rbDJTZ2ZvVytYa04zWUtNT2Fla2JW?=
 =?utf-8?B?YThBUWhsY1pkSGhWOGdId1RPTFVWOVEzanFNVE5LMGxmTFJ6dkZXVnliL0JC?=
 =?utf-8?B?RUF2aXRPUFViaDVDd3NvR3hMekhUNUUvMjN2NUZyQnk1eTZwQzJXMDN6aCtC?=
 =?utf-8?B?SGJsM21GckI0OGFSRk1UaE9abmozcGxLWVViazZCQ0J3RGcwZHJGMWsvZ1VS?=
 =?utf-8?B?SXBsN1c4c2xpaUJEVHdDbGR6U1N4VnY3cC9tRnQ4TjFPOFU4RGgxVEJMRHNX?=
 =?utf-8?B?SWJxY0N6c3dxOXdhOCswMTZJQUd6RWFNamxwaEVudUhXTE9rMG5xRHdHVS94?=
 =?utf-8?B?d0Q3eXQyOGhWMUtQa2hQR2EvWml2ZWhWZUlNWVMyOVZmNzdSUHliU3NlSk94?=
 =?utf-8?B?VnZZdjZGSHhXMFh4ZTdOa0tqWkw2SjBoNUs2QmFQMXUvVTB0dmkxbG4rVHFm?=
 =?utf-8?B?dWo1NnpTOFJ1b0VUNE9vWVZ4ci9wclB0TlZjZW1nMmJEcHhwRVE2K3JvMUVK?=
 =?utf-8?B?Y0J0eEpoRkl0a2VTR09zbnFGV3dZaStIMlREZTZXaWhDN3dMVDlDbnBaYTZi?=
 =?utf-8?B?VXlYS25VMmY3Q2s1NmN4NENiOThoUDdBZGZIcjQ3VHRsR0s2d0dDSm1CMm9J?=
 =?utf-8?B?c1JaVTBtNHdDYkhJeTcvMkxMeHJ4WUlraGM0d0VPblVSV0JuQlpRaUZQQXh4?=
 =?utf-8?B?T3BxMkNibHNnRUZvUytLR05ZV0N3M2o2ZFpHSnB3aTdzMkt0YmJqaDY1ajdq?=
 =?utf-8?B?WmlGUjJuTzV3VUY3RXRkSEs0bXdIbGU5NG5IeXd4Zy8rSS9iM1owOERaWURP?=
 =?utf-8?B?Um5DQXBIVTdtMVBMMSsweDlqTStDSTR4MlRCYzJPeUJFbjZGY1NSSW1lTDEy?=
 =?utf-8?B?N3UzVWdTSWFHYk92bWFMSTJTQ2FKSFVpaXJwakt5T3FTSmVGS296c09acFN0?=
 =?utf-8?B?MTFCMkl2SjU1OFRBbVR1V2NueStvQ3MxaTBDWXcrWlFDVVMzdDgyVlNSbVlB?=
 =?utf-8?B?M3IyUi9xVGlSQVBxY1M2aXE1bDVsTDFzZUdNNmRQVkpPNUUzNXFmTmtOTGsx?=
 =?utf-8?B?TmpDZWEzUUNmcmhXOFl1Mm1ONENBYzZWOWxrdjhPK3J4c2dJZDNkUjNaU2dE?=
 =?utf-8?B?c0VHM1g3eGpwbHRSN0lTb0FCSklFeFFwVjdEdU1kNTZHd0g0bXE5NzhxM3NI?=
 =?utf-8?B?Ui9vSUNSZzY3cExvY3l2TDNOZnJxUk5aWWJWQnJCZHVnc2FWQ0U3WGcxRFhG?=
 =?utf-8?B?a0hFc0dzT2ZkakZMSkF2aGZoSUdQdG8rVi9vUXFmblBnM1lsOGN4Vi9MN3Y0?=
 =?utf-8?B?aXIwZ3VMWU9SQ3dKYjVzV0w2ZG00cFI3WU9qTGh2L2twZUc1YTBJdmRoN0R1?=
 =?utf-8?B?cFQyWWI5K0hWUWlxUENkY1c5dGZ4d2txL3JwUzhjWWwrY3QzQkxnNC9Cd0dH?=
 =?utf-8?B?VmFDV3k2UFVyVzljUy9hRWQxWHNCYUo4Z2lqakQ4eTZqUTJUS0NodnE5LzFi?=
 =?utf-8?B?Q3UrekozdWxOV2ZjRjFrR29Ia2JNb3NRNUxoRVRjVHR6alBKM2kycUh1cGd2?=
 =?utf-8?B?OGVtTzlDLzAvbC9XMm1zYjBsY00xZmxKT2RGenRhOW9NQ0dsN2NIcDlIa2di?=
 =?utf-8?Q?Ulfg4DsK7ewEnKjc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b6866e-474c-4603-c159-08de7328eb37
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:14:31.8334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tIIh/o3RwQvBnK+Eu8+UPapWgc1bR0u88ULSrU3Jbq8xx3XsC8zxCibE6lXJEFmtsq4xU+IRbDgj5yioiHb/inOCDRKWidj64QN74E1/Ros=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6526
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

LGTM

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
