Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E0CCEFC39
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 18:28:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA51A10E59F;
	Tue,  8 Oct 2024 18:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRs1LhPZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EE810E59F
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 18:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728412124; x=1759948124;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3TJhLpT2Vxr3LtSW5tmyF+srowawW3YN3WQzttfJ5h4=;
 b=SRs1LhPZNPsjq95IM/Te24aMr/waThnVkd10ZpqoksuNY+r+ve15Ty+C
 ZvF0K44/+C4rdjwEqaVc4F3LAGQVotsBF6pUx6OWNHl98NxC0KPnNpfGL
 pkee9mkb7StM1VzvAGgMrwkX3L1F9gHeJX5HlRFoVEcatFHM0OEdq7wRX
 HkvqQjxD3q9LYTd9SMcYy1YSyuZopADk/7sb8cn6LiLN+X0T1e/3XD9XR
 xdLcBo+hODdLp9sFVHmO5EqIWl0joPWS6xnpsg9xDOyOqpdv/exrrO+MF
 WH/pcirL3lKX9BUlnLlJZeuCFiy/CwZSGWUftIr8RiO+aFBeQ/ZbNTwO2 Q==;
X-CSE-ConnectionGUID: 1sV05vHySai3tRuB69t4TA==
X-CSE-MsgGUID: /h7WnqoRSSubeAkEmNLqtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31340394"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="31340394"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 11:28:43 -0700
X-CSE-ConnectionGUID: bRTjPLEORES7M/oKKNGXWw==
X-CSE-MsgGUID: AqphH7elQDq5D9Yu6fi3gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="80954643"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 11:28:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 11:28:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 11:28:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 11:28:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGoQmsckwKXpaI1wPwfiU92ryUBq2zu4UKcRM0kbBa/i+Xcqqwewj//8Fw6aiAEN2yujXk4xxf+GRivQcOfFLZO7/KsNbc5y0TNshFIQFvv+EIf+G97AeJyWy6GM6KH+FjVP8E8mafv0dLhmo098rg6+XvK5n6vhNyG/Ihc0Bjv2DvTSC+QEbm9ncvV2U3rBSBzgUu1Y0m8QpEwcMHWhjqcpg0ZnTKz18VDy69vufaPkcMMK3NRHxmdULgs0Aid6Opv2L84fcCyFJUZirJY29ZQEQ0F+Cl6Y3lo1NlJ81Jj0m/GrtPIs1IbNs9F/GmQA9bxnwy8xbL7T8sKV65NiOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LeHXp0BqglDYza43vYE9bxiJhfAlb56nJ6y/F6a5w5c=;
 b=gaZmvQpYPZ0R4dwCIUkBMHQL1E62gar9lYYd6Dz0m8COUE4LF14JoOb15B7zz8T95JONproPJmDkUab13A7FHIRbz5L206ysjHFwRofGzfoSbju7crQXm7B7F0UWHVIlNFJcxxf8pSb0+xa9cUgrxe64FHzChe6Sp445Qe2nbTsULsH2qgyuruxsuXjoHHDmykyZuPVoQZ6kg8nj4g/93ijzXRaQK8yg/UuWhHZduwPmAuh6pD4RMUd59L2PKnR4looAmgyzPModer7wOFRFad0IOD86kHltfU56tCJWhyGS9qbq9SO1ybRrjScX83aEi3+y+2LqNKc+5E3nwoXX5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by BL1PR11MB5238.namprd11.prod.outlook.com (2603:10b6:208:313::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 18:28:39 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%3]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 18:28:39 +0000
Message-ID: <2c8efac2-ce0f-4366-9fec-d5eb5dc5f669@intel.com>
Date: Tue, 8 Oct 2024 23:58:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/xe/xe3: Define Xe3 feature flags
To: Matt Roper <matthew.d.roper@intel.com>
CC: Matt Atwood <matthew.s.atwood@intel.com>,
 <intel-xe@lists.freedesktop.org>, Haridhar Kalvala
 <haridhar.kalvala@intel.com>
References: <20241008013509.61233-1-matthew.s.atwood@intel.com>
 <20241008013509.61233-3-matthew.s.atwood@intel.com>
 <7a77f979-5743-4626-8307-d5bbe5d3450b@intel.com>
 <20241008161512.GG4891@mdroper-desk1.amr.corp.intel.com>
 <d03ace74-4158-4881-b5f0-8efdf4d7029d@intel.com>
 <20241008180609.GT5725@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20241008180609.GT5725@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::9) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|BL1PR11MB5238:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a930dbd-4d7b-4bf6-c9e9-08dce7c70751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGlVU1FJOXdXamFXWmJVVlF0UEZwbHNzM3JhNjFqd3J6Q2VCVVlNM1lnNjZt?=
 =?utf-8?B?TnBWMWRyc3plblJ4aHBWQzNnWUVIWUZiTERMd2JPUm9vVVRQb2R2TVNJZ1pu?=
 =?utf-8?B?R25KcW5BaVREUXFWYnI5KzZ1R1ZzVWMvbWFTWVJ4R2NiUGthUlBaaXFZYzhx?=
 =?utf-8?B?dGRTQlAzUVdBd01GcEhBMzRRQ0s0bTN3VW1lOGpNd2VhdlhtekUxN0V2dVBx?=
 =?utf-8?B?OUZzTDVlV0tDWTZjZk1nWVZYSmFxSDhOZm10Szc3dUxjL0JxbEVqTXNuQmMx?=
 =?utf-8?B?TFNwaG5pUjVvN2FMQWFlUGpDaFEvUGdQYy9kZnZFaUFHZEhJQWdTRGlHZkxB?=
 =?utf-8?B?WHVqajF5bW5qUnoxRXY4bW1hL1ZHaStXcXAvdTNtYTFEYitRZG8vdUovYWhQ?=
 =?utf-8?B?MldLdXNzdnBwcGsvNjU1a3hGSzgrVEd5V0E5NmR1OTRwYlhIak8xZFk0a2pq?=
 =?utf-8?B?dzdzWVdQR2krNDJKWFFGQ1R4UVNKWHZUNFpFV0M0SmZiYk9SUGlDWGpONElu?=
 =?utf-8?B?eEFYVWduOW5zWmhPTUV4VE1WOGhPdmpCS1lkRE55Z01MS3Z0VHZUWEE1SEhV?=
 =?utf-8?B?YkxJNWxjYXAxdGFnSnRsdkp0UG8yR3V2WG5hYkFTZGxoRm01Y1k1SlFVSlNs?=
 =?utf-8?B?THlNM21hajlvUzl1eTM3aHhJTjNudzZVWU9SZ2JDK0tvOVg0T0JEeVp0UlZp?=
 =?utf-8?B?ZGp0Ym1MV25vRVpQaXNqVXRxWkdJaDFaR0NCNDgyWm00NFpKKzZXTGtWYVpR?=
 =?utf-8?B?bXBlQmpBQXdzRWo1RGhFUjU5YjBkSm1EVzZDWExrZ2RnaVI4cWozeGpYQnNO?=
 =?utf-8?B?VDVtZFRKNkhZeXptaEN3RHlxV25NQlZaOFA4TzYyR2N3a2JpbHlaUFpKUjEw?=
 =?utf-8?B?czlBWWJYZ0hGU0RlM1FqeUxwY0Zma2wzY2NzeVFTeGlYbDBkeHR2Ujd1WXl4?=
 =?utf-8?B?RTNjVDVEQnFDRkdZemhSbVJkOGoySk9ZMGJ5MmxhMWtraHdQVmhidjQ2R3Bj?=
 =?utf-8?B?M21YZlZjcE1UeWxZMUluTEZFUUdCa0hmN3B1MHZEMHh6WlpRd2hLMUMwQ2Qz?=
 =?utf-8?B?QUhtUlZ6N2JBUkR5anNRTkNGYW9UWmJYbU5pVS8ycnd6dWlpK0c5dWQvZ1lT?=
 =?utf-8?B?MDhjaU5pZEdUTWo5aVBZREh5NWs1cmpSMm40eldScWw2OUhGQ25uelZPT1N3?=
 =?utf-8?B?a3oxekRtc3NLTjV1R0FtWnVTRWNFVGRMRGhLTEpkMGtHQ3NlRUFIQUlEWUEy?=
 =?utf-8?B?a29aQkp2UWFUbUZTajNMZjQzNVdFd2NkQUhTc3pIdG9IQS9pdXNHaE42R1Nu?=
 =?utf-8?B?OWVtS1VIOVhJMUxwMmkyK1lsV0Zob3NudzZ4N3RBTy84UFpSYmxkaUZtTVlk?=
 =?utf-8?B?SU9iQzJmMzFzcmxDODdkTW1saURHRkdLRTNqT2F6aVlZRFNodFdxL1BIcVA1?=
 =?utf-8?B?ZWRuaGxjRndabUdLdlpUc3Q4SEMzcGlpWHFrU3I5OEluQ2hFcTRXczBLZmIw?=
 =?utf-8?B?UmFFbnlxZFVLb2U2MjZ0R1E2Y0s1ZVlQeTFEamNSS3FpcTQrbm41K0lEazlS?=
 =?utf-8?B?OWhUd2ROSjUvSnF3em5OOTcwc1huK0E3NVpiWGdsTEdiYjJtbk1hYjlSbElt?=
 =?utf-8?B?dU5rV0Y2T3J2cTdUVGFLbWp6a3YyMW1BdUJyUDNRbmZkZzVBZW9jTmJtRDBr?=
 =?utf-8?B?VG1nLy8rRnVUUmNmOEJzSytJbFU0aEZ6ZWt2ckhVM0h6bFpyaXJ0WStBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDZuNEZtcWoydGhnVWxkK243RnhvN3lXZGFxRHlWWjFranV3NXAzUzdWOE44?=
 =?utf-8?B?OFV6akNEZlN6d2lxdE5zalVpaDNIOU1HSC9PMC9Tb3pBYkRFa2NDeTRleTln?=
 =?utf-8?B?eTVsNTdobjBTc2pXaERWNUlMamU2Q2Nsa0tFYXdpbEtwak1LOVM0UktrQjE1?=
 =?utf-8?B?ckZLMGRCcURBbkVIQllOTlZFYW83aERaSDFYVUxXYzRHZ0JZSUNVSml1dDlu?=
 =?utf-8?B?aTRJeHVvRjdqVXRPZXFGeHVMbHBaOUdiQ2I4bTB3TDVZWmVqcE1aZE5OWnFo?=
 =?utf-8?B?VjdVdXV4amhGQ3k2bnd0Ukpxc0Y5dElFdW1UaGdzWWdjQit6VzBKZnR2cS9a?=
 =?utf-8?B?dmYyQk9VRUdPVHNhVkJDR1dNend5a3ZFUGZkTDdIdjRyS3ROczIzMDlPVnNk?=
 =?utf-8?B?cHU0WWJEMUVsNjRGaEVsZTNFM1IrNGVOdm5FRHFDaTFheS9abkZEb0hIanRv?=
 =?utf-8?B?MWpscS9IY1J1ZmZjNWF0SlRUS2NhVURaSWdKTUxpaGtuLzZpYzRERVg3WERI?=
 =?utf-8?B?cE81T0JXSTIvNWY2SFIvUWo5a2pXUFhPUDVyZEpOTkxSU3NmcWJXQUorL3FL?=
 =?utf-8?B?ZC9VK2tNRkVDZVRQSFV4amdXanQvbVRyb3Fjd2lURmplVlhhcE1oc1lMUDkr?=
 =?utf-8?B?aVhmb2hkYWlnMjNIREtZeEtTcmZDbW9RYnlEV3l1YmxreWxQMUxmNTBlYUFX?=
 =?utf-8?B?aGJDZzlRekVQc2tvNCt5OTl0dXJxeWk3THRDZDloS0hUVXdpcG54Vm1FUUxS?=
 =?utf-8?B?QVZtTWs0OWkrdDNNYUJHSGI3RUtxRmdjekJscHlRQzBMa0FxU2JaRmJQNUtY?=
 =?utf-8?B?UlBEWUtzZmFzUkMzcGUyOWYwL3F3WWp0RkFTWE1lYngvT1dEZGUzY2lDUWxh?=
 =?utf-8?B?blJ2Z2VXNXlONG42NXFsbE5rODc3NVZIUzN5T1lKaEZEUGZ5a1liOFBYWmdk?=
 =?utf-8?B?OHRSS0UwTzduOVlZL2hUc3JzVXF2ck5XdVluRGIrOHM0VTB0YzUremZaVytj?=
 =?utf-8?B?eW92VWxEdkFlcm5GQzl2a0pKVlgwdnh1S0N5UFd4STBtWXI5bTZJL1ZpU3VG?=
 =?utf-8?B?R1JoVm9Id3F5eFVFTWZNUTRQRDYzYlppOEJwWTZNYUozZ0pOMEIveWYrUUNY?=
 =?utf-8?B?U3R1UVJ0N2xFRXU5Smd3S2xqajg1NjJSam0xWkRGcm5oYyt4Ry9qZElPZWZ2?=
 =?utf-8?B?NWFDMmxkYUFtZENEYzgxSHB6SCtYSEN5cEFEcUNoOTFXa040M2N4SUlqZ1Bo?=
 =?utf-8?B?ZWpQcUVteDBrWlV5alhOU3B0NU1HZkRrRllsYlVKVDhJN3NVcklyU2NlVnZE?=
 =?utf-8?B?Um1JZ2NmYVZ4dXREUmg1YVdlSDRZZXpuVEQzejRCalhqNzBNczRyNmRQUXYr?=
 =?utf-8?B?WVdieUt6STMyVUIzMWxKa0xvM292MmtOTUJMNnRwd1ZSdWJrRkFwM0ZuRE5G?=
 =?utf-8?B?SjhGeDZjVm5NQVRxMi9BOUVSQ0kwcXJVQzhpNTZmbFh3M21QNzVINk9KcVBu?=
 =?utf-8?B?VEJSZjIxUVAxV3dmeDBiVy94U0IzY3BxM25Jd1B2Zm9ZdXVzemhqN3U4QzZ2?=
 =?utf-8?B?WHdrQStIT0hodXlUc2FHWmFmRG1UcCtHZVovOUdVVzRQbnpJT3hGV2dhYUw4?=
 =?utf-8?B?bmI5c1UwZW90ejF6b3hEekliWTJSa1d2dnVOTUZLMm1BM1VJQ0hYdlRGVGhF?=
 =?utf-8?B?dUFzelAvNS8yOFZjYmZZY0w4QkZzamM2N0RpSHpNeC9ZZE1WeFlTRXRWYWZv?=
 =?utf-8?B?Wm9lWng1N1dZcCtZMEZVRFlXZnhTaWpSVmppZlNJNXVOZktMOFlFdlpwdjZE?=
 =?utf-8?B?TkVWeWxpWVZHMllOK2VzcUFHR3ZMVjMwSWppNGI4blYzTUVKTzNTY3pEOHhj?=
 =?utf-8?B?ejd3T2ljd1FBTWgwL1pvWnlIYXhpTC9YMTFEUndvZ0F3bC9YUHJRSmJ5NHFw?=
 =?utf-8?B?cEVLV2lUd1VXajc3Q0s5K1BSdGNtdk55Q211SFY5dUZjT3JmaExBN1J1aEgw?=
 =?utf-8?B?dk9WUjlSb0QvSEJnNVA1VzRkNlJ1WVk3YWZneXN4RVpzOHFBbXFESkpsSjJF?=
 =?utf-8?B?V3dmU0p4Q1d2dHozUTJKL0ZDL3h0MnFEZHlaWUMwUUVSdzUzQjkxbVJsM1U4?=
 =?utf-8?B?d1V6Q2l0SklNR2tjTWNHWk9aN3dnUWxEYU16T1V1Ryt5a05MWjlaeGJDMXV4?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a930dbd-4d7b-4bf6-c9e9-08dce7c70751
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 18:28:39.0095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZt8AzVGGR3TqZHjIA606DT3KpF0WVgUQH5mKIXgTAf3/WdMsWKPp29So7LUr6naXa2145pstvQz1nnOherpsqT/oxy6An1iT0o+z3MxcLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5238
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


On 10/8/2024 23:36, Matt Roper wrote:
> On Tue, Oct 08, 2024 at 11:19:55PM +0530, Chauhan, Shekhar wrote:
>> On 10/8/2024 21:45, Matt Roper wrote:
>>> On Tue, Oct 08, 2024 at 07:53:00AM +0530, Chauhan, Shekhar wrote:
>>>> On 10/8/2024 7:05, Matt Atwood wrote:
>>>>> From: Haridhar Kalvala <haridhar.kalvala@intel.com>
>>>>>
>>>>> Define a common set of Xe3 feature flags and definitions that will be
>>>>> used for all platforms in this family.
>>>>>
>>>>> The feature flags are inherited unchanged from the Xe2 (XE2_FEATURES)
>>>>> platform.
>>>>>
>>>>> Following B-spec details inherited from Xe2 feature flag definition
>>>>> commit.
>>>>>
>>>>> v2: reuse graphics_xe2 defintion
>>>> The patch itself LGTM, but since we're re-using Xe3_LPM with media_xe2, I
>>>> believe we can have a v3: Reuse media_xe2 definition. Also, there's a typo
>>> That wasn't a v3 change; this patch has been using media_xe2 since its
>>> original version.
>> I meant with the v3 being sent and then there were back and forth changes,
>> might as well document them.
> Yeah, but the media definition isn't something that ever changed here,
> only the graphics definition.  The changelog generally just indicates
> what's different since the previous revision of the patch that was sent
> out.
Got it.
>
>>>> in the above graphics_xe2 'definition'.
>>>> Both of these are minor things which can be addressed while applying, so,
>>>> with that,
>>>>
>>>> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>> I think you copy-pasted my r-b here by accident?
>> Ah, nope. Your review did most of the work, mine was an overview.
>> Henceforth, I didn't mean to "take" it away. I've done something similar on
>> the other patches as well in this series, where most of the review was done
>> by you, but then I had a final look over it.
>> Let me know if this isn't allowed, i.e., having 2 reviewers for a patch.
> Generally every r-b line is an indication that the person has fully
> reviewed the patch and approves it for merging.  If someone raised
> concerns on an earlier version, but then doesn't have time to re-visit
> the updated patch, it's not really appropriate to put their r-b there
> since they haven't confirmed that the fixes are correct (credit for
> their review feedback is usually given in the change log as "v2: fix foo
> (Matt)." It's fine for someone other than the first reviewer to to do
> the final review of the patch as you did here, but then only the final
> reviewer's r-b should be included unless the first reviewer also has
> time to come back and check it themselves too.
Okay. Will keep this in mind!
>
>
> Matt
>
>>>
>>> Matt
>>>
>>>> Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>>>>
>>>>> Bspec: 58695
>>>>>     - dma_mask_size remains 46   (not documented in bspec)
>>>>>     - supports_usm=1             (Bspec 59651)
>>>>>     - has_flatccs=1              (Bspec 58797)
>>>>>     - has_4tile=1                (Bspec 58788)
>>>>>     - has_asid=1                 (Bspec 59654, 59265, 60288)
>>>>>     - has_range_tlb_invalidate=1 (Bspec 71126)
>>>>>     - five-level page table      (Bspec 59505)
>>>>>     - 1 VD + 1 VE + 1 SFC        (Bspec 67103, 70819)
>>>>>     - platform engine mask       (Bspec 60149)
>>>>>
>>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>>> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
>>>>> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_pci.c | 5 ++++-
>>>>>     1 file changed, 4 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>>> index 7ffee06fab13..2139edba9062 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>>> @@ -208,7 +208,7 @@ static const struct xe_media_desc media_xelpmp = {
>>>>>     };
>>>>>     static const struct xe_media_desc media_xe2 = {
>>>>> -	.name = "Xe2_LPM / Xe2_HPM",
>>>>> +	.name = "Xe2_LPM / Xe2_HPM / Xe3_LPM",
>>>>>     	.hw_engine_mask =
>>>>>     		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
>>>>>     		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
>>>>> @@ -360,6 +360,8 @@ static const struct gmdid_map graphics_ip_map[] = {
>>>>>     	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
>>>>>     	{ 2001, &graphics_xe2 },
>>>>>     	{ 2004, &graphics_xe2 },
>>>>> +	{ 3000, &graphics_xe2 },
>>>>> +	{ 3001, &graphics_xe2 },
>>>>>     };
>>>>>     /* Map of GMD_ID values to media IP */
>>>>> @@ -367,6 +369,7 @@ static const struct gmdid_map media_ip_map[] = {
>>>>>     	{ 1300, &media_xelpmp },
>>>>>     	{ 1301, &media_xe2 },
>>>>>     	{ 2000, &media_xe2 },
>>>>> +	{ 3000, &media_xe2 },
>>>>>     };
>>>>>     #define INTEL_VGA_DEVICE(id, info) {			\
>>>> -- 
>>>> -shekhar
>>>>
>> -- 
>> -shekhar
>>
-- 
-shekhar

