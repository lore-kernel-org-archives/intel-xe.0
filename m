Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10075C02180
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 09:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1B610E915;
	Thu, 16 Jan 2025 09:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htrXSqz5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A72F10E915
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 09:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737020892; x=1768556892;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zjyiotniA2YUH5wMDsH3wShx9eeenTZioSWpUGIR9+8=;
 b=htrXSqz515E6jiDl8/JjfPurJ2IUTd0y4gpVvBqJduVeEss5Bbkm2i0G
 FL3PV7Ps0Lg0wa/Gab69AF87DyqsUOHiODZb4zlMuPvuRDTyCm5xf6uOV
 k4oZkgJHvIvFrAD/NOqDr7tz62iOjNKm0P1N6vrEb5s/+bu/OgY3HJ8i3
 5z/KHojPQyli0CyeAnHPd4+8rRhRe22tS+KrITHTJppa/LbVfqpAc9B0e
 VH3ogDBKtRx9htazwt2nIVm0VoETSzGo2O6ZkTaO+r+yJhYYkY3ht8ZrY
 5IyyRH3J/YDFKXtwR3QB7UFSwjwYdBHo/AU0UgNkryXbBo5WsXpUN4+dF w==;
X-CSE-ConnectionGUID: +bLZ89soTBq3e9Qa+poDLw==
X-CSE-MsgGUID: XziEEbMeTK+JjJgTLeDgDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="54942885"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="54942885"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 01:48:11 -0800
X-CSE-ConnectionGUID: yWx0Ity0R8iIw9NjOtChbw==
X-CSE-MsgGUID: /Z/TT4pBQTSE4rgKXdtshA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105281633"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 01:48:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 01:48:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 01:48:10 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 01:48:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywhpX/Z5DsskTgtnV6CYEN5cuF1xylCRbWZTYgW0KZocmMuksdtFTw/dkYjcj08fkVj913SGCZ8hV+bxRpok0ZBYnVLxAOAmyLjcS7x6Z12GGqwN71Jq+2bwa4h0lZFshxuIZkxuP4sXO0JTYbcRTApR0PjoLLH5dH5KztXvdsQqXvs0KpRuGNINxjYcOSaNfM7Lzav/aEYBY0PThIHXMwAtu1UlHBd8Yj+Kf+ndupHIJMdfn8EcEJqNwyFdHvM3gmrL3/CjYf+ISR4I7jgAGBMBk0ovQFMnstFZZSfOMU96tDqRHpTkE7MReILcQGoydMFjtdcRMj3KYR+VJBhUyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0mQFTAJEWWVtNTWmBG8WeRkBuTEM2kXl2/OYs9RGdc=;
 b=vzAPt0GiTDkDU7w+Qn0fqfqWod6S40HIqZ8CGBU0hdGkI6QNnKAao178jGeHdZczOStXbFE+9rxrQ8k+RYcANs6DzzqtzYe4+w0DebrnCBhoEiYlsb3NL/9ykXdHoZ6NsjvY7AVpZxh31IcpWj3R2EKwpCLSdzB8pEt9Foduf30Dh5z1cXNPBXv6/OyIbKBbgutO4JNIpTRUARw6PMkjyK/dmFgRvO5KLcj4b7///7rgLMvSfRY7MEiv1A73aXXXQCdRFk5d9nVUsI8TqBU+FBvTqf+L8JTmw70KNyajXb3YDYt/wxzygaNdg0L9FO3ePcWTjIhUF7wrQQ4PHc3jJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB7917.namprd11.prod.outlook.com (2603:10b6:208:3fe::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 09:47:55 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 09:47:55 +0000
Message-ID: <6eddec69-03a0-4de2-94ca-7a8df5b82981@intel.com>
Date: Thu, 16 Jan 2025 15:17:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Add functions and sysfs for boot
 survivability
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@intel.com>, <jani.nikula@linux.intel.com>,
 <matthew.d.roper@intel.com>, <alexander.usyskin@intel.com>
References: <20250108103959.1219312-1-riana.tauro@intel.com>
 <20250108103959.1219312-2-riana.tauro@intel.com> <Z4E7DB6pbb11QDWT@intel.com>
 <bfb3420c-dc1b-4947-bfa7-2d60d6bce2db@intel.com> <Z4gPjdxODiIq0pZt@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z4gPjdxODiIq0pZt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PEPF000001AD.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f9b4757-d028-49e0-60c1-08dd3612d9c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXhzN0lGWmlDUWYrOXlLdnNQS0VJcnkvY3ZuSDNKYzFEakJWU2k0MGx1R2pH?=
 =?utf-8?B?V2p5NVVoVjZTOFdJMnFmZWJqVUJ5MnBaUzFKYTQxbWpGbkQ4Uk9nOUVHclN1?=
 =?utf-8?B?NjhVd3JHVU1PRzV1V0FxSy95SEVMZ0M1aGtpanNVdzRsTEp5YzJHMHozQ3pY?=
 =?utf-8?B?cG1VbVBKMkt5VlJYeEJxWUJtTzJDREtDRnc5ZGtTQnJQK1ZFTzV2OENmVWJD?=
 =?utf-8?B?V1RxWmI5RGlkL0ZpUHl6TURlam93Z0xTUXhleGFQSVJYVnlaUzVZclBVMFBY?=
 =?utf-8?B?TzRuN3lzRm5nOTVZN29pWEtDeVdodkw2UW15dnRTZkxLN1d5STJOT0habm84?=
 =?utf-8?B?bWF4dDVYTE1TejR0bzU2NXVnWjBlR3lhaHdDekxqVFl2b1NVSW1vMU9RT1JT?=
 =?utf-8?B?MFlLaU1pZ3VDakxnQ0M5dzk4Z0JXNFl2V0FPa3pwU1k1NHVqZW1xSkRnSFNJ?=
 =?utf-8?B?TjV3d2RSVm5sMnY5RjVoZlVzeXptT1pJc0xGeHB3dlhuc3gvMUpPVFBmeHF3?=
 =?utf-8?B?cWhLUmtmYzNYUEtmcVBWbjRuMkdnQzgwSDd5TnVIcjdVZnBTWE1kbUo1Mkps?=
 =?utf-8?B?UEZuUmVPdWZCTGszNWo2Q3JnY0F1TW96TUVVbHp1ajRaZ2oxc1FFQ3dJMWc1?=
 =?utf-8?B?dG5Kb1V2NlJtTDlWOVZxb3JIY3dYVUpPcnVIU0RxUGJXcE5VcTREaXp1SFdL?=
 =?utf-8?B?TUc3eEZ3cmdFeVVrQXpJbEpDVXZIOXQ2MHVuZTNiMFEwTzdRejhxeE1HVVdo?=
 =?utf-8?B?eTJKck52cDdMcFNZTEV1ZmJFQlNKd2Vka0Rmb0hZUWZBZTV6dHV0bVhvaHFx?=
 =?utf-8?B?U0h1Y1RBOTJzdTFIVXVXWjJLdC9JQjcraG5xb1NRQVZySWJVQ1RkL00vUkZP?=
 =?utf-8?B?QW1ZbWVoTnAzSVJmeVFMNDJ2N1F1aEdjbThrUWNaM0NLVDVqWm9tR1pKNTR2?=
 =?utf-8?B?M05TL2YzN2Q4WlV3OVFyQUhzQUdjRlRhQ1Y1QU9zdmhHU1dVbFlXMkZLNFNj?=
 =?utf-8?B?Wmg5NVR6R2twWjQ2NExiczd1VDZFc2l1bFlmb0p0U1MzQlJIUUZQYnoxVnJP?=
 =?utf-8?B?R1NZTlNRT3RCb0VtbDRBWFE1T0JtWktpRlpZbGRUQXREVWlxRVN4WmVmU3Zy?=
 =?utf-8?B?V2xyNmRsek1SN2lkTjltNE81a3FCeDZhUFJWTUcxb1pGVm9PUU9yN25JRWNu?=
 =?utf-8?B?cjVsb2ZqeWRKOFRkNzdqdElUWUJhQm5SM1B1UFhPOFlxSExINzNZSy9xSW1o?=
 =?utf-8?B?YjJuT3RGTllOMU52ckpMazlMMzAyOEpMY3loWkd6d1MwdS94QzV3OHVxeEZ3?=
 =?utf-8?B?RjhOV3JXbW1Td3hHNU9ldU5ZME1GN2VMUUNzWEJaZmV0eHZ0bUhBU0ZFTzBD?=
 =?utf-8?B?R2E0Tk1saGRKMjU3ZFRYM0RGUnRDOExjR1hFSjNBY0dLNCtIanlxRjBuWjgv?=
 =?utf-8?B?QTNvWmdSUG1ieU5IMm5scFcxYVVuaDdPRVN2VEJFY25UVGZ5aFFSclhQRWdW?=
 =?utf-8?B?bGxmenJVTjQrdlFzcmNoaFVFcjRNOVl5OGZiNXIxejFyb2dveWtUV21rZ2FC?=
 =?utf-8?B?SzRGczRGTHgwendTelY3dlRtb3RSc0hpVkZGRy9CRVRaSnJsSXBVazE3d3Fo?=
 =?utf-8?B?dVh1a0FGS3JZZTVyRXVyUGtWN3d2UjVLVGFuNmI3aUtoVEExY052RWNGWEJp?=
 =?utf-8?B?d1ZENnViZ2J3eGI1NWVXUUxaMkk5eGgwaWV4TWZlUlA0cEdDNUl0V09Fd3E0?=
 =?utf-8?B?WVlNc1NRN3p1UENXTk1JQ3ZlbVYrL2NkbWhyYy9PQk5aU0ZDQXdLRk9xeENC?=
 =?utf-8?B?WUdQZWNEVGZwMEJlcFg3aTdMcmJkcXcrZjhjK1JtbmRJVkdzYTMzL0U0d2Jr?=
 =?utf-8?Q?uC0yV1M6RDoEi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c29ab2lTYm9RNWtsUUJnQVR6L0FuSUFaeUlBTk9lZ1hQUWFkZlN3U3F2STRF?=
 =?utf-8?B?UVdDQktqdmRXaGdwclZUVjR6b1FXZTBOVkZIR1crUFpPdEtpajUzTXREcG9J?=
 =?utf-8?B?MTBNL2QvTWh0Vk9TazEweU1oSTY1TldYYU83S3JZcmNKcWxXajBZM1pSNVdW?=
 =?utf-8?B?Vk8zVWJqMkhNaWFNNzNsT0ltM3cxSmJlTHhDd3RyN2wwOEgySFdnWDZhL0k5?=
 =?utf-8?B?U1Z4UkRPNWZUL0U5Tk5xRGs1WkhoblM1VVJNZWxva2ZQM3lsVERPam1jdnpv?=
 =?utf-8?B?QUF5RFlwcVVmSVkyVW03bXdDMnNBWXg1cVpLWGZYekFGQVRlVnJ4TXF5a253?=
 =?utf-8?B?WGdHRWRnYU5CaU1GdWs1MVkwampZUUJwU25JeTV3bU1vc3JzaFFPZjhZbXY2?=
 =?utf-8?B?cVpjRHBaVGpJdDZvVmg4SVhONW1IbThsTWswRWk2U2lDMWptMExBd1VpbGZS?=
 =?utf-8?B?ZmtMS0lzMkpyTmNZdzlnTkUyeUlteXFhRkUzTndhYnlaeHF2Vy9Xd1V5bzRX?=
 =?utf-8?B?Snp1RW4rU1l4NTdPUHVVNVM3RFhoVmU2UzZFb20ycGJQODhTSE8vVWsvc1JC?=
 =?utf-8?B?cjcwNkhBa2pnZ3VvN2NqaCtTanZscUtrbXg0aWhvZ3hWdFN2ZlFzSkVlYVhp?=
 =?utf-8?B?Z0k5ZHFFM3VZTFBDOHFaQjRjeXJDTVdIVHpINnU1TC9hYTN4cUczUXhkZ3Zk?=
 =?utf-8?B?cDhSTFNEL29kRXhZeWZCTGRUWGF2RUVCb1hZUXRFSmN2S3ZyOWd3cXlIcEZG?=
 =?utf-8?B?OVNkOWZYa09ETHgxMW8raEF4SS8wYXhXZkh3emN1akNLVnpNZ2JlWTdoUVFR?=
 =?utf-8?B?RWZ2ZG9FRVpiTWhvNCtvY1BYTFF6MHcyM2UvODFueCtSWjV4Ly9HeTFaeE51?=
 =?utf-8?B?V1c4RC9lY1ZvTDAyRjBOTE9taGhRY3BOU0FoTzNBbStyVEx0VU8yd0MzS2xV?=
 =?utf-8?B?WUpJV1FnWVNBZUpCNHgrcC82c2p5TElrelRSK0lESERSckVBZlpQU1Y2YU84?=
 =?utf-8?B?Mm9MRnN0MjljRWgyMmxVVmwrcGV6Y0pHNjl5MmtBaWllNGNhZDY5TUppL3By?=
 =?utf-8?B?L29kRHFYelUreDFhZmUrUy95cUR3Zit4aStRR1pVMXE1ajdpaHk3TXlhb0tH?=
 =?utf-8?B?amhpV2M4b1hrTlJjWUQ5WUZXTzM2ZXFNRmYvOWNaOG03NGlCaDFNbHVtNlJ2?=
 =?utf-8?B?aVJ6RHRRYjZBTXcyVUZJWWx5MXh6Z1BYWjV6NEhYaVlOT0QxVlB4UEozUDFH?=
 =?utf-8?B?SkFFKzluY2VRZVYvUkVmU0w1ZTY1aXgvbmp1dkRKWXA3UG1LWUR5VkxpWDgr?=
 =?utf-8?B?SlB5SCtnVWpwSUZ3Z241dnUxVEkyQ0JCaGIxV25obHVOTWJ5NkVZb08xWCt3?=
 =?utf-8?B?UFVhaWlvNWFXQ2NoSDhXM2ZIdzFablY2U0R0SVV0SnBUSTdacVBYWUFaVGcz?=
 =?utf-8?B?Q1Jrdkd6K1lLSFlzOUZNT0hreWJqZlFpK1d6cUlWVkZrTmRYRS9IT3oyRGxY?=
 =?utf-8?B?aytzaGxYUC9LeWx2RGw1REQ1ZUZlSzI2Q1ltczFDMUlNb3JLS29Od3VNbXJp?=
 =?utf-8?B?UG8rdTlScGJKRFNnbmkybHBhVENMK3dFR2pLTWFPNUFvSFcwQ2JCNXMxdXd2?=
 =?utf-8?B?RjIyUm9PKzNJWnA1UDdQRTI2b0dlUGc3MWduZkFJSGswNUY5VEVxOXZpbDlv?=
 =?utf-8?B?OFg4amwxY1RGcjRNNTRUZzFCRzdEMlpJUHQ3OWgxUy9NMy95TStUYnlIMTVM?=
 =?utf-8?B?UFF4S0ZXVE9XNktLOG01Z0RoZDRhUkJHQlFmazFyZWF0bkNBRThOWXk1cFBB?=
 =?utf-8?B?empQR2szRFNvczl1eXEwS1hxVkRRVS9yZUtRdUVRdldnVW8rN1hER3F3YnRi?=
 =?utf-8?B?WndXTnk3QnVyVkZ6ZmdqV2hSZUMyNFFPdlpxZ2RwTjRiNzZKS3MvYkNReldX?=
 =?utf-8?B?MHRTVFlVYjIzYVU2SFd6VU9OaDJoVnVWeVlDd3Y5Q0k3T3ZOVXF2VG0xUE5w?=
 =?utf-8?B?R3NkMC9hZFJCeFNZM1BGNXRYR3VveWRRdGJpdk5zKzJ5OUgzZ25ycHlka2pI?=
 =?utf-8?B?cW14RGVyc0NiNGlWb0JWS0ZCMklybGsvK1JGY1BrbjViazgzeDkvRUliRGRL?=
 =?utf-8?Q?LX7gw+KvmScrSz3ULOclqT5ox?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f9b4757-d028-49e0-60c1-08dd3612d9c1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 09:47:54.8991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2MyZ16Y0m1e6/tNXoFSCERMWyoEkcN7W6EMduw4q/t7yDm9empXneT/eCHl0RKByilWPKHIY9al7xTgLZM8GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7917
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



On 1/16/2025 1:12 AM, Rodrigo Vivi wrote:
> On Wed, Jan 15, 2025 at 09:47:53PM +0530, Riana Tauro wrote:
>> Hi Rodrigo
>>
>> On 1/10/2025 8:51 PM, Rodrigo Vivi wrote:
>>> On Wed, Jan 08, 2025 at 04:09:57PM +0530, Riana Tauro wrote:
>>>> Boot Survivability is a software based workflow for recovering a system
>>>> in a failed boot state. Here system recoverability is concerned with
>>>> recovering the firmware responsible for boot.
>>>>
>>>> This is implemented by loading the driver with bare minimum (no drm card)
>>>> to allow the firmware to be flashed through mei-gsc and collect telemetry.
>>>> The driver's probe flow is modified such that it enters survivability mode
>>>> when pcode initialization is incomplete and boot status denotes a failure.
>>>> In this mode, drm card is not exposed and presence of survivability_mode
>>>> entry in PCI sysfs  is used to indicate survivability mode and
>>>> provide additional information required for debug
>>>>
>>>> This patch adds initialization functions and exposes admin
>>>> readable sysfs entries
>>>>
>>>> The new sysfs will have the below layout
>>>>
>>>> 	/sys/bus/.../bdf
>>>>                	     ├── survivability_mode
>>>>
>>>> v2: reorder headers
>>>>       fix doc
>>>>       remove survivability info and use mode to display information
>>>>       use separate function for logging survivability information
>>>>       for critical error (Rodrigo)
>>>>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/Makefile                   |   1 +
>>>>    drivers/gpu/drm/xe/xe_device_types.h          |   4 +
>>>>    drivers/gpu/drm/xe/xe_pcode_api.h             |  14 ++
>>>>    drivers/gpu/drm/xe/xe_survivability_mode.c    | 231 ++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_survivability_mode.h    |  17 ++
>>>>    .../gpu/drm/xe/xe_survivability_mode_types.h  |  35 +++
>>>>    6 files changed, 302 insertions(+)
>>>>    create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>    create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.h
>>>>    create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode_types.h
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>> index 5c97ad6ed738..fb1cb98ce891 100644
>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>> @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
>>>>    	xe_sa.o \
>>>>    	xe_sched_job.o \
>>>>    	xe_step.o \
>>>> +	xe_survivability_mode.o \
>>>>    	xe_sync.o \
>>>>    	xe_tile.o \
>>>>    	xe_tile_sysfs.o \
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>> index 8a7b15972413..0f5a052150c9 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>> @@ -21,6 +21,7 @@
>>>>    #include "xe_pt_types.h"
>>>>    #include "xe_sriov_types.h"
>>>>    #include "xe_step_types.h"
>>>> +#include "xe_survivability_mode_types.h"
>>>>    #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>>>    #define TEST_VM_OPS_ERROR
>>>> @@ -341,6 +342,9 @@ struct xe_device {
>>>>    		u8 skip_pcode:1;
>>>>    	} info;
>>>> +	/** @survivability: survivability information for device */
>>>> +	struct xe_survivability survivability;
>>>> +
>>>>    	/** @irq: device interrupt state */
>>>>    	struct {
>>>>    		/** @irq.lock: lock for processing irq's on this device */
>>>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> index f153ce96f69a..4e373b8199ca 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>>>> @@ -49,6 +49,20 @@
>>>>    /* Domain IDs (param2) */
>>>>    #define     PCODE_MBOX_DOMAIN_HBM		0x2
>>>> +#define PCODE_SCRATCH_ADDR(x)		XE_REG(0x138320 + ((x) * 4))
>>>> +/* PCODE_SCRATCH0 */
>>>> +#define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
>>>> +#define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
>>>> +#define   HISTORY_TRACKING		REG_BIT(11)
>>>> +#define   OVERFLOW_SUPPORT		REG_BIT(10)
>>>> +#define   AUXINFO_SUPPORT		REG_BIT(9)
>>>> +#define   BOOT_STATUS			REG_GENMASK(3, 1)
>>>> +#define      CRITICAL_FAILURE		4
>>>> +#define      NON_CRITICAL_FAILURE	7
>>>> +
>>>> +/* Auxillary info bits */
>>>> +#define   AUXINFO_HISTORY_OFFSET	REG_GENMASK(31, 29)
>>>> +
>>>>    struct pcode_err_decode {
>>>>    	int errno;
>>>>    	const char *str;
>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> new file mode 100644
>>>> index 000000000000..077422ae009d
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>> @@ -0,0 +1,231 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2025 Intel Corporation
>>>> + */
>>>> +
>>>> +#include "xe_survivability_mode.h"
>>>> +#include "xe_survivability_mode_types.h"
>>>> +
>>>> +#include <drm/drm_managed.h>
>>>> +#include <linux/kobject.h>
>>>> +#include <linux/pci.h>
>>>> +#include <linux/sysfs.h>
>>>> +
>>>> +#include "xe_device.h"
>>>> +#include "xe_gt.h"
>>>> +#include "xe_mmio.h"
>>>> +#include "xe_pcode_api.h"
>>>> +
>>>> +#define MAX_SCRATCH_MMIO 8
>>>> +
>>>> +/**
>>>> + * DOC: Xe Boot Survivability
>>>> + *
>>>> + * Boot Survivability is a software based workflow for recovering a system in a failed boot state
>>>> + * Here system recoverability is concerned with recovering the firmware responsible for boot.
>>>> + *
>>>> + * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
>>>> + * to be flashed through mei and collect telemetry. The driver's probe flow is modified
>>>> + * such that it enters survivability mode when pcode initialization is incomplete and boot status
>>>> + * denotes a failure. The driver then  populates the survivability_mode PCI sysfs indicating
>>>> + * survivability mode and provides additional information required for debug
>>>> + *
>>>> + * KMD exposes below admin-only readable sysfs in survivability mode
>>>> + *
>>>> + * device/survivability_mode: The presence of this file indicates that the card is in survivability
>>>> + *			      mode. Also, provides additional information on why the driver entered
>>>> + *			      survivability mode.
>>>> + *
>>>> + *			      Capability Information - Provides boot status
>>>> + *			      Postcode Information   - Provides information about the failure
>>>> + *			      Overflow Information   - Provides history of previous failures
>>>> + *			      Auxillary Information  - Certain failures may have information in
>>>> + *						       addition to postcode information
>>>> + */
>>>> +
>>>> +static void set_survivability_info(struct xe_device *xe, struct xe_survivability_info *info,
>>>> +				   int id, char *name)
>>>> +{
>>>> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>>>> +
>>>> +	strscpy(info[id].name, name, sizeof(info[id].name));
>>>> +	info[id].reg = PCODE_SCRATCH_ADDR(id).raw;
>>>> +	info[id].value = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(id));
>>>> +}
>>>> +
>>>> +static int populate_survivability_info(struct xe_device *xe)
>>>> +{
>>>> +	struct xe_survivability *survivability = &xe->survivability;
>>>> +	struct xe_survivability_info *info = survivability->info;
>>>> +	u32 capability_info;
>>>> +	int id = 0;
>>>> +
>>>> +	set_survivability_info(xe, info, id, "Capability Info");
>>>> +	capability_info = info[id].value;
>>>> +
>>>> +	if (capability_info & HISTORY_TRACKING) {
>>>> +		id++;
>>>> +		set_survivability_info(xe, info, id, "Postcode Info");
>>>> +
>>>> +		if (capability_info & OVERFLOW_SUPPORT) {
>>>> +			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, capability_info);
>>>> +			/* ID should be within MAX_SCRATCH_MMIO */
>>>> +			if (id >= MAX_SCRATCH_MMIO)
>>>> +				return -EINVAL;
>>>> +			set_survivability_info(xe, info, id, "Overflow Info");
>>>> +		}
>>>> +	}
>>>> +
>>>> +	if (capability_info & AUXINFO_SUPPORT) {
>>>> +		u32 aux_info;
>>>> +		int index = 0;
>>>> +		char name[NAME_MAX];
>>>> +
>>>> +		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, capability_info);
>>>> +		if (id >= MAX_SCRATCH_MMIO)
>>>> +			return -EINVAL;
>>>> +
>>>> +		snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
>>>> +		set_survivability_info(xe, info, id, name);
>>>> +		aux_info = info[id].value;
>>>> +
>>>> +		while ((id = REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, aux_info)) &&
>>>> +		       (id < MAX_SCRATCH_MMIO)) {
>>>
>>> This is a clear case where 'for' is better. But also, generally here we
>>> try to limit while usages...
>> This is similar to linked list with the address of prev aux registers in the
>> AUXINFO_HISTORY_OFFSET. So used while.
>>
>> Using for would be like below
>>
>> for (id = REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, aux_info);
>>       aux_info && id < MAX_SCRATCH_MMIO; id
>> =REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, aux_info))
> 
> I believe the right way is something like:
> 
> if (capability_info & AUXINFO_SUPPORT) {
> //you could move all declarations to upper scope, or move this to a separate function
> 
> 	id = REG_FIELD_GET(AUXINFO_REG_OFFSET, capability_info);
> 	if (id >= MAX_SCRATCH_MMIO)
> 		return -EINVAL;
> 
> 	snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
> 	set_survivability_info(xe, info, id, name);
> 
> 	for (index = 1, aux_info = info[id].value;
>      	     aux_info && && id < MAX_SCRATCH_MMIO;
>      	     aux_info = info[id].value,
>      	     id = REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, aux_info),
>      	     index++) {
> 	    	     snprintf(name, NAME_MAX, "Prev Auxiliary Info %d", index);
> 	     	     set_survivability_info(xe, info, id, name);
> 	}
> }
> 
>>
>> Isn't while better?
> 
> just by removing the duplication of aux_info = info[id].value
> and by making it clear what is the start, what is the condition and what
> is the iteration fields, I do believe 'for' is better than while...
with the index also moved for is better. Thank you.
will fix this
> 
>>>
>>>> +			index++;
>>>> +			snprintf(name, NAME_MAX, "Prev Auxiliary Info %d", index);
>>>> +			set_survivability_info(xe, info, id, name);
>>>> +			aux_info = info[id].value;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void log_survivability_info(struct xe_device *xe)
>>>> +{
>>>> +	struct xe_survivability *survivability = &xe->survivability;
>>>> +	struct xe_survivability_info *info = survivability->info;
>>>> +	int id;
>>>> +
>>>> +	drm_info(&xe->drm, "Survivability Boot Status : Critical Failure (%d)\n",
>>>> +		 survivability->boot_status);
>>>
>>> hmm, since we are avoiding the drm, should we really use drm variants here?
>>> or the pci/dev ones?!
>>
>> drm variants use the dev ones and prints the prefix if drm is not null.
>> Will change the drm_info in this file  but the logs in mei and vsec
>> initialization would have to be retained.
> 
> ack
> 
>>>
>>>> +	for (id = 0; id < MAX_SCRATCH_MMIO; id++) {
>>>> +		if (info[id].reg)
>>>> +			drm_info(&xe->drm, "%s: 0x%x - 0x%x\n", info[id].name,
>>>> +				 info[id].reg, info[id].value);
>>>> +	}
>>>> +}
>>>> +
>>>> +static ssize_t survivability_mode_show(struct device *dev,
>>>> +				       struct device_attribute *attr, char *buff)
>>>> +{
>>>> +	struct pci_dev *pdev = to_pci_dev(dev);
>>>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>>>> +	struct xe_survivability *survivability = &xe->survivability;
>>>> +	struct xe_survivability_info *info = survivability->info;
>>>> +	int index = 0, count = 0;
>>>> +
>>>> +	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
>>>> +		if (info[index].reg)
>>>> +			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
>>>> +					       info[index].reg, info[index].value);
>>>> +	}
>>>> +
>>>> +	return count;
>>>> +}
>>>> +
>>>> +static DEVICE_ATTR_ADMIN_RO(survivability_mode);
>>>> +
>>>> +static void enable_survivability_mode(struct xe_device *xe)
>>>> +{
>>>> +	struct xe_survivability *survivability = &xe->survivability;
>>>> +	struct device *dev = xe->drm.dev;
>>>
>>> do we really have this pointer valid at this point?!
>> This is allocated in xe_device_create. Registration is done later in
>> xe_device_probe so the prints and xe->drm.dev will be valid
> 
> cool then, thanks for the confirmation
> 
>>
>> Thanks
>> Riana
>>>
>>>> +	int ret = 0;
>>>> +
>>>> +	/* set survivability mode */
>>>> +	survivability->mode = true;
>>>> +	drm_info(&xe->drm, "In Survivability Mode\n");
>>>
>>> same here...
>>>
>>>> +
>>>> +	/* create survivability mode sysfs */
>>>> +	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>>>> +	if (ret) {
>>>> +		drm_warn(&xe->drm, "Failed to create survivability sysfs files\n");
>>>> +		return;
>>>> +	}
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_survivability_mode_required- checks if survivability mode is required
>>>> + * @xe: xe device instance
>>>> + *
>>>> + * This function reads the boot status of Pcode capability register
>>>> + *
>>>> + * Return: true if boot status indicates failure, false otherwise
>>>> + */
>>>> +bool xe_survivability_mode_required(struct xe_device *xe)
>>>> +{
>>>> +	struct xe_survivability *survivability = &xe->survivability;
>>>> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>>>> +	u32 data;
>>>> +
>>>> +	data = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(0));
>>>> +	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
>>>> +
>>>> +	return (survivability->boot_status == NON_CRITICAL_FAILURE ||
>>>> +		survivability->boot_status == CRITICAL_FAILURE);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_survivability_mode_remove - remove survivability mode
>>>> + * @xe: xe device instance
>>>> + *
>>>> + * clean up sysfs entries of survivability mode
>>>> + */
>>>> +void xe_survivability_mode_remove(struct xe_device *xe)
>>>> +{
>>>> +	struct xe_survivability *survivability = &xe->survivability;
>>>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>> +
>>>> +	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_survivability_mode.attr);
>>>> +	kfree(survivability->info);
>>>> +	pci_set_drvdata(pdev, NULL);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_survivability_mode_init - Initialize the survivability mode
>>>> + * @xe: xe device instance
>>>> + *
>>>> + * Initializes the sysfs and required actions to enter survivability mode
>>>> + */
>>>> +void xe_survivability_mode_init(struct xe_device *xe)
>>>> +{
>>>> +	struct xe_survivability *survivability = &xe->survivability;
>>>> +	struct xe_survivability_info *info;
>>>> +	int ret = 0;
>>>> +
>>>> +	survivability->size = MAX_SCRATCH_MMIO;
>>>> +
>>>> +	info = kcalloc(survivability->size, sizeof(*info), GFP_KERNEL);
>>>> +	if (!info) {
>>>> +		ret = -ENOMEM;
>>>> +		goto err;
>>>> +	}
>>>> +
>>>> +	survivability->info = info;
>>>> +
>>>> +	ret = populate_survivability_info(xe);
>>>> +	if (ret)
>>>> +		goto err;
>>>> +
>>>> +	/* Only log debug information and exit if it is a critical failure */
>>>> +	if (survivability->boot_status == CRITICAL_FAILURE) {
>>>> +		log_survivability_info(xe);
>>>> +		kfree(survivability->info);
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	enable_survivability_mode(xe);
>>>> +err:
>>>> +	if (ret)
>>>> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, ret);
>>>
>>> same...
>>>
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
>>>> new file mode 100644
>>>> index 000000000000..410e3ee5f5d1
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
>>>> @@ -0,0 +1,17 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2025 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef _XE_SURVIVABILITY_MODE_H_
>>>> +#define _XE_SURVIVABILITY_MODE_H_
>>>> +
>>>> +#include <linux/types.h>
>>>> +
>>>> +struct xe_device;
>>>> +
>>>> +void xe_survivability_mode_init(struct xe_device *xe);
>>>> +void xe_survivability_mode_remove(struct xe_device *xe);
>>>> +bool xe_survivability_mode_required(struct xe_device *xe);
>>>> +
>>>> +#endif /* _XE_SURVIVABILITY_MODE_H_ */
>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>>>> new file mode 100644
>>>> index 000000000000..19d433e253df
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>>>> @@ -0,0 +1,35 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2025 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef _XE_SURVIVABILITY_MODE_TYPES_H_
>>>> +#define _XE_SURVIVABILITY_MODE_TYPES_H_
>>>> +
>>>> +#include <linux/limits.h>
>>>> +#include <linux/types.h>
>>>> +
>>>> +struct xe_survivability_info {
>>>> +	char name[NAME_MAX];
>>>> +	u32 reg;
>>>> +	u32 value;
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct xe_survivability: Contains survivability mode information
>>>> + */
>>>> +struct xe_survivability {
>>>> +	/** @info: struct that holds survivability info from scratch registers */
>>>> +	struct xe_survivability_info *info;
>>>> +
>>>> +	/** @size: number of scratch registers */
>>>> +	u32 size;
>>>> +
>>>> +	/** @boot_status: indicates critical/non critical boot failure */
>>>> +	u8 boot_status;
>>>> +
>>>> +	/** @mode: boolean to indicate survivability mode */
>>>> +	bool mode;
>>>> +};
>>>> +
>>>
>>> I believe the only blocker is the while-vs-for loop. I believe the 'drm'
>>> could be avoided, but not a big deal if it is really working...
>>>
>>>> +#endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
>>>> -- 
>>>> 2.47.1
>>>>
>>

