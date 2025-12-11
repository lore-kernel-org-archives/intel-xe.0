Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D416D41C27
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 11:46:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEC410E2C7;
	Thu, 11 Dec 2025 11:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TgVCMriO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EEA10E0C4
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 11:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765453608; x=1796989608;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=MkL3b5+VEyX+ONKdnWSY1KYVhBm0r8ziVwDgohhFktA=;
 b=TgVCMriOIe+I+SDv23dxmBRc3Azau9fOkqx2W6HfZSqrht7eeUe5KEBm
 7fzTpk4obnrBCGVqBXVTEpEOq64Opvy9fM+kNUMp7QK3W68mXOM2MjqS3
 eFLKvF4Q04q72uN/c9H2cnNPXB8p3gocnHzzdpt8MEg9vSfJJ9rIj9uLL
 c13tWYUm5FpNsqgJNgTh6bKB4h2gQVGqruTwqYaBV+jPmAM+Z6OcgCwwN
 OrE5T+UQyd61dIyVCiHgg4xMgOUXBonr0ifYxsiGnMz5Yp7FPn0CsphZy
 065SutrVDd1d12UTV6PqS8Rr7Xhpa9cGHNFNBYZc3CM700/8BKOW1IK6N g==;
X-CSE-ConnectionGUID: Fvzcno4gRc6rdvzvQmK2Kw==
X-CSE-MsgGUID: Gl6PxKVmQ+qmCZW3p+xVWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78137089"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208,217";a="78137089"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 03:46:47 -0800
X-CSE-ConnectionGUID: tEenbCy0SpWnpoajxbVBUA==
X-CSE-MsgGUID: vdDFg98cS9K67wcqdKnvTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
 d="scan'208,217";a="197262800"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 03:46:47 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 03:46:47 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 03:46:47 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 03:46:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alGvrjYCJYr7IoLyiOs4sSU2SDPheUoCuUG1rdjn+aeSLx9EkUKiWNhhlvU8V5ZqbM3wCPar1okLDbnZof23P0bliFznqOTTZGuhxjhiFRr/KRf8uKwW/prsxmEYue5h7uFXkdwXWFv7adMEuKQiL9Fafp8tdmq8gtr3a9vIN7yrwOhlOBynmJFeltjR3VYFuU5/XVIRTQRFfdgfW02EsS5jpvW/z8hHn+q4KW0i2sdaqo8rXKGERbq4DLhaWrSEBLn1Bhdwg64tXLS1oPCcsk0Tj3HjlniwF0kcixrwu+abCm16oTk9fhLfL3eO34OQ1zzfDIqHMPqDFZHESRmYvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jI/2nQZSQnYh8Q/WUIhWbf7B8RETWhXLRoFmcIU5Jw0=;
 b=EFLGOhrqmDJP9F12mcxD06c+hfaI899WM1OpaZcWADS4QBVEBT6soj9nSU+084zNNcrqXg+9JeGNDq8Cx6eMNZBEchwlhqMhoLvO2MrsiFynkRFMzjqZwPwd8ewYQ7XtKcapvFoLCrbz5Nt/v7k8jI2BWMZgflAeLj6hlLYA1xcj3uHNatBsAqY7AQnJ96PGNeXYnl4LVZMHHjkoXv+2uNTn+P4kzoFjKT/IqZlLdvObD74LXzE9KOkyNGk7R2AxMho5Dt2Qh0v3CatkV8RSwCyGKlmwEVH2+IiFWn9gWU/F7og64FA01qznTbBph3/0cYiLzykBPnfrD10JfZhUcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH8PR11MB8061.namprd11.prod.outlook.com (2603:10b6:510:250::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Thu, 11 Dec
 2025 11:46:43 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 11:46:43 +0000
Content-Type: multipart/alternative;
 boundary="------------FUaDpNxC0JuEMV0XJwiNYR67"
Message-ID: <86e94582-c28c-4372-94b8-c3bff3d7baa4@intel.com>
Date: Thu, 11 Dec 2025 17:16:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] drm/xe/hwmon: Expose tempX_emergency
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>
References: <20251210062301.4080549-1-karthik.poosa@intel.com>
 <20251210062301.4080549-3-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251210062301.4080549-3-karthik.poosa@intel.com>
X-ClientProxiedBy: MA5P287CA0280.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH8PR11MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: e89cf122-d8b8-43e0-d7c1-08de38aaf443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHdBWHl5Q0ZMQmJnTzNFa2FNYXJZbjdreHhPL092UFZ1cXVIUXhtcE5PUnp6?=
 =?utf-8?B?NGRMYjJmTVhWZDJ1TThyYkdzV211UGM5NU9YNHYyT3F0aThhcmpMOVNrek1Q?=
 =?utf-8?B?ZU9mWkdyMVovWGZua0Q4QWZkNlh0UEt1RTQ3RS9LbXlSNGxYSDMvT29CWTNz?=
 =?utf-8?B?MnlqcmZlT2FmTmllMmVMelZwNmJkNmxvVENEU0MxVUxwbmVsWE4yK0FwV2lZ?=
 =?utf-8?B?RGNKME9pMmRYQkcxYXh6WkY1blhaWFF6RkVzT1paY3VIRC9hNVFXclByWlBW?=
 =?utf-8?B?TCtMOTV5RUNZVlZjK3JWY2NvVEQ0eG9FaUsvbTkyV3JsUUQydWowQ3R0enVp?=
 =?utf-8?B?eHVuUDYwOG1JbmlXR3Z6WHRjOVdvQzJKWU5CRHRhNWZGeVVtL2ZqTW9jNmhp?=
 =?utf-8?B?MmN6dE5zUWhJQUdQQjFvMzNiV3ovUS9VTkhoL2VOSHFIeG1pWGVzY0FUT1dn?=
 =?utf-8?B?T0NOVm5aMFlzaWZXZXYxMkcyMUIyeGNwMmlZb1JrSkIwak03LzZEUi8zQUZy?=
 =?utf-8?B?L3JaaFhjZ25rdC9LRDlkZXZMVGlRWkxneEw3ZXI5SEJtSHptWi9hRy9FdTJX?=
 =?utf-8?B?K1dLNWdvNC9qZWNmV3AySFJxREZXT25QaFlBR2FXRVJRUjZLY24rSGdLOEE1?=
 =?utf-8?B?d05nN1ROTGgrUk9jQ1J1cmxaZ1pxVldCTzlLUXk3UUF1VUcwK2FKZy9MSTh5?=
 =?utf-8?B?bFkwT3pUKzVQNXFtVUIvL3B3Wm5oRC9GT2taeDZyQXBOTXNuc21OR0UvN0Fw?=
 =?utf-8?B?UkJxSm1xMm1ic0R1UzJVeVhkQk5RczI2dVNFcVpaSkp1ZVJMUWFJRnZtY2pB?=
 =?utf-8?B?ZEFmR0QzcE1XN0dQSkFJQWQ5WVc5d0hRbGJJNHBZWFUvaklCNDZkaDhpTWRE?=
 =?utf-8?B?U2Q2dno4ZDV2VXMzODRhVDhtUStDSmlLYXA2WmIvZFkydldDRTVDMWorRXI1?=
 =?utf-8?B?L24yK2ROT1RoUlpEM1ZNTDc0SGZMM1NnUWFXS0FwTXR0V2sySTFHakV1VnFP?=
 =?utf-8?B?VDRVZ0FURUwvYTVSUTlTbTFVWGkvZzBNemo3UjlmTWZ4Qit5aDFPN2x3Tk5i?=
 =?utf-8?B?Zms4NGFwY0k3OVZHazQra256NXFCbUpyUkhTakxVVmY0NThDWFBHK1BnaGdM?=
 =?utf-8?B?Y3pFVnRhbXF0b2F5TkV5MlVxUVpGekxWbnZLT2lVdlVmNS9tTTh2QkVxUGF1?=
 =?utf-8?B?bXIySU1nb1J5UEpCT1IzRXowYUw4aXE4ZndQK1MrcmdiemJjQUxvRHloS3B0?=
 =?utf-8?B?OHZKQzhzRUs3V2hLZHgwL2MyVTJjaldkbmZ2clF0REJkNWFPUnBBU3gwNUlw?=
 =?utf-8?B?SnFEamxseGpaVXIvME1EY0daYU1hR1hqYjFMenRIc243WW1pa0FSM1FWT1ZG?=
 =?utf-8?B?Ylh0eW5wRDJIMkFYcmVlUGFJYkJxdVlNa1RhWjRMc0hBV2dNdThoUk1VTmg2?=
 =?utf-8?B?MW1iUDgza1lPd3hmR3R2QlFoKzFSOHNiL0dtVDFmRzdZUlIwY0daVXVjK0pB?=
 =?utf-8?B?ZURXWWJGVUVQYkdqbE5FeEY2NkdQelowUDF4ZGYrSmhGYnA1V0tHR1NJSUlD?=
 =?utf-8?B?TWpxQysvK3NsbUppTUpBZksveDFQWlNuRFN5dHQzNjkvOEExV1hiU01rSzFU?=
 =?utf-8?B?UnVFV1dzTmoweU5zbnlRYWJ2QXJKRm90Q0RsaVRBVVYrZ3VuMGdBQ2FBT09n?=
 =?utf-8?B?cC9lNjMrMDZtbzl2bnFhRFlDZmNPeXpoc1hFd2hUVUM4N0VlVEZ6UGw0cXh5?=
 =?utf-8?B?S3pINGR3M1doNXlzMGZtdXV2VzZ2TlYzeTFGRzl2eXI0SFJTWHZFOTdpdDVv?=
 =?utf-8?B?NmZpMEV4bUd6a25GcXJnS25xREY0NTZpVGkzbmdVWGlLWHFkU1MvUW8xY0Vq?=
 =?utf-8?B?d2RHME05di8rUWxYTHQrL3FHektRMVRSSnpua0lxVlVIRkFmcWVWWmc1SjM4?=
 =?utf-8?Q?HiriGbU8OgOgMRX+A4Gy2nG4xc8yXurw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWVtS2M1d0poUlFsalpCYmpob01rSTlhZjRSTTlDWCtDalFPcUpJVDVSTGMz?=
 =?utf-8?B?VHZBUldYSkJsMStiREtBY2hpNmJkMWc4bG9zTlUwQmp6SlNTWWxOaFBMelVV?=
 =?utf-8?B?TDBzZzFKMUVoL1hWV2FKc3gwZE9hZktkQU55VnpzMG5PNVlKaUdDam81Y282?=
 =?utf-8?B?VGxGMlBTK0prRTVVWThqUkQ3MFhjTGh6T0YrM1JQYlJyT1BkVjY2bzEzeitS?=
 =?utf-8?B?N3VkZnBGcWRmRFdvaU5lK2RqWXZmMWxiZEwyY3B2dlFGb3F1NVh4WXJPSEZs?=
 =?utf-8?B?UDBMcFZaZ25SVm4yNnJmUklTcUdkMzVyMkFLYjdZaGNXN2JhSFNTLys4Q0lW?=
 =?utf-8?B?NkUvSXZLNmJDb0taYWloZlFERDhveGJNMklKYUV2WG1qUUlwV215aE9OQnBz?=
 =?utf-8?B?VnBFcENieUJpNkFwN29QTDZYSnVDSE1yVndNWFpTQUxuSFJFZ09sSTZrUFBN?=
 =?utf-8?B?anNRMDAwbFBhVGZHSlNGZVd1WkNIeFhDWVpFMHFoTHRzS0RzVFFQem04V0lV?=
 =?utf-8?B?T3ZtUndSRkxPQzBib054UEQ5K2lzbjlSdGJEa2RUc3RZNXFCM0FHQ0o4OGpq?=
 =?utf-8?B?a0ZBbXN0bThvM2ZFMkJDZ3I4c2xLMXk1VDNGSVZIL1Z5dFZnS1Rna2toMTJ0?=
 =?utf-8?B?NEdCM2I4OHNGSUplclllWk8xUjVVZ3JCQ3FjVWRxSHo2UGZOWHU1cGJvRDZs?=
 =?utf-8?B?SHkzZzRkSUpTZGhhWTFKV2Vxdi9UclFPR0VvZGpsdW15ZGpwYjdyeUdxYjNn?=
 =?utf-8?B?VlRUc3lZRStPbFJQaDZucjZJZXlqTUwzY1poRmRCTVNkQVBMVitaRExtcU8x?=
 =?utf-8?B?bWhwY2ZUZmJyMDhtalF2N3kvSmRuSFdvZnlZVmRQQVI1ZFh0c212c3doWFk5?=
 =?utf-8?B?YjBxZmJucVU4WHRxTktWSkJudTc0b1pBRXQ0aWV1U0VTamQxb01waHU3amZl?=
 =?utf-8?B?MXF1OXBOdzl4QTNlWmFtaFZXV28wSGl1bXBhWEFyYWt3QXh2RzVUa3ZGMzR4?=
 =?utf-8?B?RGxJUzF2ZmRtQkZVL3lYMEtjSldHM2k1TFE3NEdvM2dHVUdhM25oTWtNL015?=
 =?utf-8?B?QzdLeUNETmx0czZ2ZVVPNUdpR0R6QUpjZUFCK3pZc2hmWXFBckxnemw2TEor?=
 =?utf-8?B?SXluZzUwVXhUN1ZScC9DbnJGbXVid0JNY3lUejB2K1ZSVW9zY2RYWitmblJX?=
 =?utf-8?B?ZFREc0ViTGtSenp4STR2NFJFTHFrL0pkSG02WW5Yb0RWUWJzR2gvdys1UmJW?=
 =?utf-8?B?US8rZHBaMHFZMGZ5TThQc3lidSthOCtPdXIvU29DR2NhY3pFZ3g3K2JaL1dV?=
 =?utf-8?B?ZG1pRitrVFhTVzZHWmdPc0NuU3l6RER5dXhzZzdnaWpxNFo2Y2doM2ozRUt0?=
 =?utf-8?B?T1E5V2poUk5xenY4aE1Ia2tUNWNRQTFrQzBuWVd3bGMyaWdKcTZGazlkd3JN?=
 =?utf-8?B?NzZYdERCbGNjZktqcE85bWo4Tk5hcThpbHRSU29aTXBTbnhrWUQ2VXByNGdh?=
 =?utf-8?B?UldNeVZwQVVsNEx0aTU2UHZRSDgxdlFoWnFlNDlXTE9mVkUyNHkyQUdoM3Zp?=
 =?utf-8?B?SHJQam5PSzcrNWFBN0I5NkVOTzd5bitYU09jYjRCSlpPeC9xNkF2cHp0QnVk?=
 =?utf-8?B?dHYydVBDNFlGcjQzOHdJbHIrOXpYcG4rampPOUJOalM2TWFhbDJROW5vVzZ2?=
 =?utf-8?B?aUlKQkxSbVJZVTdwSithdGN2K1l4TUtsc05sSi9SRXNRY2pUN0gxWE1WVUxm?=
 =?utf-8?B?dVp4cy9rWVJldXRobGNReThvTnN2YXl4dmUxQVhLWk5BTVVZT3JLeklXQXYr?=
 =?utf-8?B?TXorNDJ3bGs5NHYrOWhra2d0ZWpmdHk5QkMxN0g5ZFBYMTNPKzZhUTQwVUNY?=
 =?utf-8?B?WEdVMERJZGR1bitONExZaUVjNjYzZDhrYlRrTC83eGM1NnllaDhZOEtqNThR?=
 =?utf-8?B?Y2tQR3NKKzgyZXQxS2VqYnM5TVJvanBiZ3llaytPWmRyb3NtbzhKV3ZsUEpM?=
 =?utf-8?B?NzBiRVMzU2xxOWJxaEZhZGowNWlkSjRaR0lqbTh4dDhpdFZvVGlHRndGVXRQ?=
 =?utf-8?B?YkZ4RW1qbktIVWZNZ3NhYWo4Zy9ITmxPUzF5WWNhWkN0VzdDaTYwYWZjWnJi?=
 =?utf-8?B?bTEyZ3I1WkhTS0oxNkVhNnk3TFBzdkJwUmthU0RHV09saXFoRlI0dlp1eG5D?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e89cf122-d8b8-43e0-d7c1-08de38aaf443
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 11:46:42.9861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YRpUKXKkUCErCwCrDYgL3s3EVRAzipEj3CG9iDZwgwL++jAJWMlzb/2T+D6MxKfrkXt0Exiv5GxAnzmpJxii5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8061
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

--------------FUaDpNxC0JuEMV0XJwiNYR67
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10-12-2025 11:52, Karthik Poosa wrote:
> Expose shutdown temperature as tempX_emergency for package
> and vram.
> Update Xe hwmon documentation for this entry.
>
> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 ++++++++
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 39 +++++++++++++++++--
>   2 files changed, 52 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index d9e2b17c6872..feb33e5ccabc 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -196,3 +196,19 @@ Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
>   		milliseconds over which sustained power is averaged.
>   
>   		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_emergency
> +Date:		December 2025
> +KernelVersion:	6.18
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Package shutdown temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_emergency
> +Date:		December 2025
> +KernelVersion:	6.18
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. VRAM shutdown temperature in millidegree Celsius.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 16f0cc2a0ae4..2dcb9ad74a6e 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -53,6 +53,14 @@ enum xe_fan_channel {
>   	FAN_MAX,
>   };
>   
> +enum xe_temp_limit {
> +	TEMP_LIMIT_PKG_SHUTDOWN,
> +	TEMP_LIMIT_PKG_TJMAX,
> +	TEMP_LIMIT_MEM_SHUTDOWN,
> +	TEMP_LIMIT_PKG_CRIT,
> +	TEMP_LIMIT_MEM_TJMAX,

I noticed that only TEMP_LIMIT_PKG_SHUTDOWN and MEM_SHUTDOWN are used in 
this patch. It might be better to combine patches 1, 2, and 3 to make 
the review easier.

Thanks, Badal

> +};
> +
>   /* Attribute index for powerX_xxx_interval sysfs entries */
>   enum sensor_attr_power {
>   	SENSOR_INDEX_PSYS_PL1,
> @@ -690,8 +698,10 @@ static const struct attribute_group *hwmon_groups[] = {
>   };
>   
>   static const struct hwmon_channel_info * const hwmon_info[] = {
> -	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_LABEL,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY,
> +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY),
>   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>   			   HWMON_P_CAP,
>   			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
> @@ -819,6 +829,16 @@ static umode_t
>   xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
>   	switch (attr) {
> +	case hwmon_temp_emergency:
> +		switch (channel) {
> +		case CHANNEL_PKG:
> +			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
> +		case CHANNEL_VRAM:
> +			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
> +		default:
> +			return 0;
> +		}
> +		break;
>   	case hwmon_temp_input:
>   	case hwmon_temp_label:
>   		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
> @@ -839,10 +859,23 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   
>   		/* HW register value is in degrees Celsius, convert to millidegrees. */
>   		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> -		return 0;
> +		break;
> +	case hwmon_temp_emergency:
> +		switch (channel) {
> +		case CHANNEL_PKG:
> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
> +			break;
> +		case CHANNEL_VRAM:
> +			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> +	return 0;
>   }
>   
>   static umode_t
--------------FUaDpNxC0JuEMV0XJwiNYR67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10-12-2025 11:52, Karthik Poosa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251210062301.4080549-3-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">Expose shutdown temperature as tempX_emergency for package
and vram.
Update Xe hwmon documentation for this entry.

Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 16 ++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 39 +++++++++++++++++--
 2 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index d9e2b17c6872..feb33e5ccabc 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -196,3 +196,19 @@ Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
 		milliseconds over which sustained power is averaged.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/temp2_emergency
+Date:		December 2025
+KernelVersion:	6.18
+Contact:	<a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
+Description:	RO. Package shutdown temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/temp3_emergency
+Date:		December 2025
+KernelVersion:	6.18
+Contact:	<a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
+Description:	RO. VRAM shutdown temperature in millidegree Celsius.
+
+		Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 16f0cc2a0ae4..2dcb9ad74a6e 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -53,6 +53,14 @@ enum xe_fan_channel {
 	FAN_MAX,
 };
 
+enum xe_temp_limit {
+	TEMP_LIMIT_PKG_SHUTDOWN,
+	TEMP_LIMIT_PKG_TJMAX,
+	TEMP_LIMIT_MEM_SHUTDOWN,
+	TEMP_LIMIT_PKG_CRIT,
+	TEMP_LIMIT_MEM_TJMAX,</pre>
    </blockquote>
    <p><font face="monospace">I noticed that only
        TEMP_LIMIT_PKG_SHUTDOWN and MEM_SHUTDOWN are used in this patch.
        It might be better to combine patches 1, 2, and 3 to make the
        review easier.</font><span style="white-space: pre-wrap"> </span></p>
    <p><span style="white-space: pre-wrap">Thanks,
Badal</span></p>
    <blockquote type="cite" cite="mid:20251210062301.4080549-3-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">+};
+
 /* Attribute index for powerX_xxx_interval sysfs entries */
 enum sensor_attr_power {
 	SENSOR_INDEX_PSYS_PL1,
@@ -690,8 +698,10 @@ static const struct attribute_group *hwmon_groups[] = {
 };
 
 static const struct hwmon_channel_info * const hwmon_info[] = {
-	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_LABEL,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY,
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
 			   HWMON_P_CAP,
 			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
@@ -819,6 +829,16 @@ static umode_t
 xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
 	switch (attr) {
+	case hwmon_temp_emergency:
+		switch (channel) {
+		case CHANNEL_PKG:
+			return hwmon-&gt;temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
+		case CHANNEL_VRAM:
+			return hwmon-&gt;temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
+		default:
+			return 0;
+		}
+		break;
 	case hwmon_temp_input:
 	case hwmon_temp_label:
 		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
@@ -839,10 +859,23 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 
 		/* HW register value is in degrees Celsius, convert to millidegrees. */
 		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
-		return 0;
+		break;
+	case hwmon_temp_emergency:
+		switch (channel) {
+		case CHANNEL_PKG:
+			*val = hwmon-&gt;temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
+			break;
+		case CHANNEL_VRAM:
+			*val = hwmon-&gt;temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
+	return 0;
 }
 
 static umode_t
</pre>
    </blockquote>
  </body>
</html>

--------------FUaDpNxC0JuEMV0XJwiNYR67--
