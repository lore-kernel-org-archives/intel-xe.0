Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E56EC5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 11:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFDB10E367;
	Fri,  6 Jun 2025 11:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WYmgj5ia";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C753010E367
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 11:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749210510; x=1780746510;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u6qWr0SUxfCToEd1LGHBqv8l3bUH2rqnWnkyaVEsX/4=;
 b=WYmgj5iaGKqERvBL/xo8imO7QhkYsSt4lqzMeU8qGe5owX/3QivmcKTS
 XrujwSaNNgvp7VYTIrACWHJ0no+GeUhE4YgXA9OsB+sipZPRee13xvdyV
 sHkk5A74MlrjXg29/yxrbeFXQX52L7t0iMoNSgdDpjjcddSoEX9jiKNdC
 /bh2Yw82Ttxy/yVgKGEezFeXS1V4LxDRT9E8SLAEoUXsmkbEVgSL4ephS
 BiDKSh0umic61cBWn9syrA32O0/fdY5eyTYcu/wAOxdbGaq3n+LxWJTWo
 zzYIucZH1wUgvKRr72Ld5vGx5BkBgHKkhVww7nHHBL264/ksTgOFrqJsK A==;
X-CSE-ConnectionGUID: dn0w8Tr5RdyB3uEMVcHg7w==
X-CSE-MsgGUID: QVZvF/GfRyirA0bpKD9r2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51459463"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51459463"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 04:48:29 -0700
X-CSE-ConnectionGUID: ogoIUnnIQcSRy+uR6F6IYw==
X-CSE-MsgGUID: b9kyaptBSUKqit25wyugOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="145744045"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 04:48:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 04:48:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 04:48:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.44)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 04:48:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfTnmC+4jp4NerDx5daxYiLC6UE0n+egXC14QDMud+6Z42QysaMaKOBOH42WwjCFdL9S6Z/LpNGRhyuU0T1haIz+XldxW7p5xvNCSjtrRrNAb+EOwF7Se56nX1aDZh1fWCetykipwxt1Bk7lAK6f+dwnIF6X6p+NK3+TeqEvGcIy+MJqtWIdXSqfRVOTJTQvbQdfUrvG1pwvLYwYTGO5y6oPvl+KMbFThYIFJxCgPYQZI97eBep5hcjUtvsii636BSm6e5wEMYpemQzn6h/RgWw2p0HZeqaWYsmhlDmyJ2Nw2YRO+8qRFp0AmyIRpMgzFn/i74WmmcLNpjeTegozUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zszwbS7PfrAdQpdLh+rX2ZH/ijMeRs3HZAKcHgUnVkY=;
 b=XuqD9YTzHwRaSGsuus+JdgPTnVxJ4WXNHFDXb1Up5cdrrDTLC3maNv26chr3DwYQ+cMVrShAPjX1ZfGWqErKbPIrjwqv0ZwrhHU1NbW9lzFtD6d4epOj0GbWzoV5pkPve5JKLjiLKlcb3q7IVIRQAbpPMYfj3y/MR1T6aUzIC2zUuxCu5GallZ+Ypk+9Eo3OfrmNIkSu34K9u2Ljelpngmmpmi71kByrz5l37UHDOb8VsMOjc3xWKZjdPg1LBxz2shNQCqJK3M9w/p5R282ONxr4WBqaBW/8Wh52sZmzg/tGx3mjTL1RW1TP+rsF3uaNLTO6fsHZh1jc0swpkha2TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 SA3PR11MB8004.namprd11.prod.outlook.com (2603:10b6:806:2f8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 11:48:24 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8769.025; Fri, 6 Jun 2025
 11:48:24 +0000
Message-ID: <658c3dbf-0b08-4675-a2b3-bf1206cc02b7@intel.com>
Date: Fri, 6 Jun 2025 17:18:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v1] drm/xe/pm: Wire up suspend/resume for I2C controller
Content-Language: en-GB
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <heikki.krogerus@linux.intel.com>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>
References: <20250602070818.701834-1-raag.jadav@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250602070818.701834-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::7) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|SA3PR11MB8004:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d4fa0af-63c6-427f-ea14-08dda4f00ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUZUVUN1c01iUWNCUFpBdkw2cVU5UytMSVVNaGNKVjVRWWlWQmlTMDBKWVR3?=
 =?utf-8?B?cUVFbHoyV0drNGR6VnAvaWIyQUd4aU1FaEhGZGVzQTBrbFU2d2c1NjYyM3cv?=
 =?utf-8?B?a1E2dkZkeEJFc3BMekt2VCtLQS91OEtnVmszYW5IUys5U2FmZ05mdmVGOWF4?=
 =?utf-8?B?QlhpWUhjSnA3SVVGVGlXSjI5ZWtIdXRjWHBKS2d2ZVdwY05BczQ4Ukk1Zms1?=
 =?utf-8?B?b0JOOWRKL3QzblZSMmJvTC9wS1h6aGJRbXplUXMwNFVjRC82MERrK1dYTHZP?=
 =?utf-8?B?V0RBOUtpNUs3WUd4NFordHdnWUQrcTJFc1orOGVqUkY0K3BpcnJmOEZ5UFRG?=
 =?utf-8?B?VUluNXBLcCswS2ZOejgzSDg1WGdub3R0U1JlNjcrNGJ4UDlWWDV0cFFXbm1P?=
 =?utf-8?B?TDgyeVEzdU1zQmNHdmx4ZzM3YmM0Y21tbG5vbGxqOVdCeXhqdlVlK05tcWxt?=
 =?utf-8?B?UGZWTVpPaStTT3JRNzVLY1VHc0szM0gvVGZnSUhvK25RaUtnRmFpa2plT0pB?=
 =?utf-8?B?U2R4QXExaXd2QVhqNUdPaVdjMXdVSEtvSGpBc09LelB3cVhjbWhEaGlQVlZK?=
 =?utf-8?B?N0NFWk5ROEx0QStiZnVpWGFnYjRnRWI5NEFlZ2Q3YXRKc245OUd3SGhsZWlj?=
 =?utf-8?B?d3phOS84WUJWR3BqVmFtc2p5cW5QYTVXeHlXVDNrUEVDSDBJd2dwSCtra01j?=
 =?utf-8?B?MURkcEg1dlBzZ09DeWl2UmYvandQV2M3T1pVRnE3SHhNQ0QwdjRGQmhzNEpD?=
 =?utf-8?B?MVUvU0JPY1o3RTZuS01LKzB0MjdERnF1d3hGcHFzVUpoR3pPWEtrc0M5VTZD?=
 =?utf-8?B?TlUxOGo1WHJPZzhuK1BjTlZNRTlGTmZybzVPck1UOC9YZThwdWNhMG5aYzdm?=
 =?utf-8?B?SEQzeVhtNUtBZytERG9qa2xiZWxSTmI0cy85VUoyN1pxemRWc3FpeHJiSmk2?=
 =?utf-8?B?dFhScTNobS9FMEdDSmNqejBMMkVFcGltL3hpZlJ1MXY0b2QrTmtJVDFYdFFa?=
 =?utf-8?B?T2cycURFYjhWK0ZzK0Q0MGJSM0NibXEyYzV4R2tjVFdYWUM4TUxJNGROMm8w?=
 =?utf-8?B?a0w3a2QrK0srNXJkNk9NM2NXc1VMMDJXYmhlV3NDOHF1SWNFZ1ZHV3doT1p1?=
 =?utf-8?B?OTd4aVFTZWpyVEJuN2NhaXM2WGZrcXI2clhuZkFhMzZvVW5maUFWZm5ycU9p?=
 =?utf-8?B?Z2dkVkVkMnh6UjVNaGNFQWZaanNCeXpXaC9EOFFMTmh2MmgrbHdsdlV3Yzh3?=
 =?utf-8?B?VXhoaktjN00vT0ZVNjArZi9PRG5FQWhkNWtDdE4rcEN5UThDVlBOeGxzZWRq?=
 =?utf-8?B?ZWNUVTYxaVpwQk1CdUJiaFVkdFY5SkdqZ2RWTFdiRXkyZDAvTng5T25DVnNE?=
 =?utf-8?B?Y0tqQW9LbTJyVzJwSzhrMEtscVRjMlBPRFdzZ2ZJTlF6T0VGNEdLbCtFVVpN?=
 =?utf-8?B?dUkxWVRtcXc4VE4xdnBFR1ZIaWlHNEdSclVaNnBpZFhPWkNyM05hZkNyMkc1?=
 =?utf-8?B?Q1Z2TU1YMDl5YXN0S2tYTXhab1p3R01JZVBXRTk2VEJFaVNpbkZxMFFDd3Ew?=
 =?utf-8?B?NW53TGtFMSt0ZEFKM2NkVDJ5SmdWOEtCb2szdlNmYmsrRE4wWUVzMU9ma3dR?=
 =?utf-8?B?TFBBUzA0SnBtSXRlOGpGbVdmZEZnbzdwV2E0b2VJd1RIS1lkNDNDdlNIWm15?=
 =?utf-8?B?MlpzWm1CTTlkb0lyWVAyM0g5NHk2aEZYaFl1N1JrS1BCeFdsSTlOOXNBS2tZ?=
 =?utf-8?B?cHJnSjlsTlo2L2MzbFQrRUs4QjQ3eHQ3Q1JjTFZEWVFQYm5yRzh5Q0U3a1o3?=
 =?utf-8?B?VkFGZGtJUVUzandpaUhLQ2dad3NiMVIrQUdmSXovWmg2N1dKNGVwZzNBOEI1?=
 =?utf-8?B?MzM1L0lOb2FwRGpzNVRGTUpjS1YvR2lMcE5sSmZlR2VDTzZ3dk1XUUJiM0d2?=
 =?utf-8?Q?SSYr7S0DBW8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFY5YnlEUGFTSkljb0FLUUx3MU95djM3dnJQN1RiV1E5aVpYanZpRkNHejhM?=
 =?utf-8?B?M3RjL3YwQWV6YjYxTXJFMkZLMlprTTJBOHlubndFKzNaVFhJNEVyQlMwOHZl?=
 =?utf-8?B?anNaNHJKRUFsdFhlNzVtbjBld0lqc0NzRXAxdmRGQTlKK0tlKzNMbUliVUY1?=
 =?utf-8?B?U05sTzlubyt3aGI2RkFIczFaMnF5M2RVQ3N5Z0l4RmdZa2pxSmprTS9WRVFv?=
 =?utf-8?B?TFQ1cnBoZkJrLzU2UWpETXpQZytaSVU1Zmk5Z3lkbTVpc2IreTdnOStvK3po?=
 =?utf-8?B?YzI1WnBuWlBzRWhYVkxDZ1YrSjdGaWZoOVVybytRaUsvWW8zZ1d0RjloanQy?=
 =?utf-8?B?UG8wREU0RHdVL2tDaXlUcTRXRjBqR3RkUGkxZ1daZ3RuTko5THJMQ0txUkNj?=
 =?utf-8?B?a05DaXk0RnlNNzhmK3oyK3J3OXI4T1NKQWIramVjbjY0NHZ3ak5WaWdOS1dw?=
 =?utf-8?B?aTFyTFdVNWo5Y1RRZStCNmtiMDY1T0k1dVdMRlg2OUxZSUV6S1Y4azVoTUVK?=
 =?utf-8?B?bkZQRVFWbWNrbDBKMGpPWUNLbnR3dlZpQ1pvUmg2UzFra05zRVBWTFRzeWgx?=
 =?utf-8?B?RHo3QzNJVFAzNisxaXhYZFFxd0RQZkRQVmRDbDVYOFFGZVBObUF6MFdmZy8z?=
 =?utf-8?B?RjBVMHBIMFkxVHpmVkdSUks4UC9ZSjdTRFcrMGY0SVpnVzNTdzk1VFJqT2dU?=
 =?utf-8?B?RXdqWkwrazZ2OTArUjJ5RngxREpRMGdXcEFjZjF6MjkvUElpL0loakY3V3h1?=
 =?utf-8?B?czg3bzlyekl6cFNuU29ZV21OZXJWT05LMnIzTmJFanlacXVSTEpiT3NPTzVY?=
 =?utf-8?B?cXJja1BnWXBzWXZUcXVJNXF0YjlvYXhFVlI4MjhpT1llS2hGeXhHa2lJUXlZ?=
 =?utf-8?B?ci9OelVCQWc0b09jUXR1d054akFWWEV5NVJNai9IeU1HcCt3S29qa016V2l3?=
 =?utf-8?B?bWNqeHIvRW9nTlQzK3dpUHIweDRUZHVSUHFiZ2R4VjRKVm1hUWtQY3pFZUdK?=
 =?utf-8?B?TFF3ODJqMDFZQnE4ZHVLNTJCUElsNEp3bE5lcC9oNm1ZQTVPRTlJUHdJU0pO?=
 =?utf-8?B?aXpnSFlMUXhPT1ZQV2dEbUFIRFZmMDVoYkg1SU8xYUcvcUYwM0p6bkJ1eFpj?=
 =?utf-8?B?a00ySURQK3NjMUtKQ2c1YXhzbTBobTVJcHBHY3VsYmREcERPMnVLQ2V5MldS?=
 =?utf-8?B?Y3BTcWFRSnJJQ243bzFoQmxDRXEydTRaOHBsc3NWdVR5YmxrWVBqQ0ZueGJZ?=
 =?utf-8?B?ZUYvemEzRjViT2ZhNVVhVWpHWEx3MFhyakdraTk1UWRGNE9CS3hGZDBNbm5h?=
 =?utf-8?B?dFRUa0dYK3ZvVnQ5R2ZrNkZLVG00SXAreWZRZXFHOGtvajNaelArT29UNmlr?=
 =?utf-8?B?Qnh4aGRxRXdjdTVyY24ycGlqTXB6UTBsaEFRTEQzenM4ODBsM1BhdEUrRVpu?=
 =?utf-8?B?c3A3cGhJOTIzVFJxWHIxWkpJbXBGeFVxWkFDTm45MWszRlJWYU5HYkQ2RDBK?=
 =?utf-8?B?Qk5kSHgzbVhZS1pSTGNZbGd3VC9pbmFZMjBkZjBvQysvdXdkWTJ5OS9sZlo0?=
 =?utf-8?B?V05lZERiejcwQWkzSkMzQVVWczNmMnoyaTZtMVovZGVPZSticTJmdWoyUE9j?=
 =?utf-8?B?TzhDWUpLdS92U0VRbVRYWDY3S3R6c1JiRDNPMGVzZnMyaCtyUFhUdElZazll?=
 =?utf-8?B?c2tJTEZoREVHV2hCNlVnSTZ2OUhMQWFwN0FJWG9QSVNjSXhZZUNKUjhnVWdm?=
 =?utf-8?B?OGh6UDc5cTcxcTBtdUEvSEcrWW54NlgwTHpOUmdkMlh6YVVtN05ZMit4MDJU?=
 =?utf-8?B?aHVtc0V1KzhJOXhjME1iZU1JQ3lEbFBzQWFCRTZjZXZ4K1AzNHdiMCtGUkd6?=
 =?utf-8?B?Qk05UFl1NGNldWFYU3U0aGFZby9nMmtWVGtHMUdUajl0S0pPVlZwdllhQVFS?=
 =?utf-8?B?VmVvL0VoTXVqVk1VRDFTRkk1SGlhRWJDTUwrSGxrWldTVUVac0I2MUE5L2FY?=
 =?utf-8?B?ZEFraFE1Ym91VzRGVHdGbk1QNjYyMGhQbUN4bjRZYnF5aEo4bi95aFptaFRH?=
 =?utf-8?B?QmNlYUlFd1NCeVEyRjdSQlpkMW5pcXBMK3VjbkV3UWZNWTlxaTFXa0Jjc2lz?=
 =?utf-8?B?Tlc4QWNqY3YveWJ0WWRWWEVKR2t6WDZCUXdaYy9UTDZoVDBRTmZxQjAzRGNm?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4fa0af-63c6-427f-ea14-08dda4f00ad8
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 11:48:24.1859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ZhfdAtYJ2RAtiXVbS+UtLq9EEM78/CqT2ng/6ZCXs+uL0vUfb4z4elPznpG7dmhoBfv1CfK+bjvmZEY60fSCg==
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


On 02-06-2025 12:38, Raag Jadav wrote:
> Wire up suspend/resume handles for I2C controller to match its power
> state with SGUnit.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>
> This depends on I2C series by Heikki on [1].
> [1] https://lore.kernel.org/intel-xe/20250530141744.3605983-1-heikki.krogerus@linux.intel.com/
>
>   drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  5 +++++
>   drivers/gpu/drm/xe/xe_i2c.c           | 29 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_i2c.h           |  4 ++++
>   drivers/gpu/drm/xe/xe_pm.c            |  9 +++++++++
>   4 files changed, 47 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> index 2acb55eeef0d..fce0066e92e5 100644
> --- a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
> @@ -2,6 +2,8 @@
>   #ifndef _XE_I2C_REGS_H_
>   #define _XE_I2C_REGS_H_
>   
> +#include <linux/pci_regs.h>
> +
>   #include "xe_reg_defs.h"
>   
>   #define SOC_BASE			0x280000
> @@ -13,4 +15,7 @@
>   #define CLIENT_DISC_COOKIE		XE_REG(SOC_BASE + 0x0164)
>   #define CLIENT_DISC_ADDRESS		XE_REG(SOC_BASE + 0x0168)
>   
> +#define I2C_CONFIG_CMD			XE_REG(I2C_CONFIG_SPACE_OFFSET + PCI_COMMAND)
> +#define I2C_CONFIG_PMCSR		XE_REG(I2C_CONFIG_SPACE_OFFSET + 0x84)
> +
>   #endif /* _XE_I2C_REGS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index cc231368789f..6cfb04a739dd 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -208,6 +208,31 @@ static const struct regmap_config i2c_regmap_config = {
>   	.fast_io = true,
>   };
>   
> +void xe_i2c_pm_suspend(struct xe_device *xe)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +
> +	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> +		return;
> +
> +	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, PCI_D3hot);
> +	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
> +}
> +
> +void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +
> +	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> +		return;
> +
> +	if (d3cold)
> +		xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_MEMORY);
> +
> +	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, PCI_D0);
> +	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
> +}
> +
>   static void xe_i2c_remove(void *data)
>   {
>   	struct xe_i2c *i2c = data;
> @@ -243,6 +268,10 @@ int xe_i2c_probe(struct xe_device *xe)
>   	i2c->mmio = xe_root_tile_mmio(xe);
>   	i2c->drm_dev = xe->drm.dev;
>   	i2c->ep = ep;
> +	xe->i2c = i2c;
> +
> +	/* PCI PM isn't aware of this device, bring it up and match it with SGUnit state. */
> +	xe_i2c_pm_resume(xe, true);
>   
>   	regmap = devm_regmap_init(i2c->drm_dev, NULL, i2c, &i2c_regmap_config);
>   	if (IS_ERR(regmap))
> diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
> index ab8e21630838..2a275826c4da 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.h
> +++ b/drivers/gpu/drm/xe/xe_i2c.h
> @@ -52,9 +52,13 @@ struct xe_i2c {
>   #if IS_ENABLED(CONFIG_I2C)
>   int xe_i2c_probe(struct xe_device *xe);
>   void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl);
> +void xe_i2c_pm_suspend(struct xe_device *xe);
> +void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold);
>   #else
>   static inline int xe_i2c_probe(struct xe_device *xe) { return 0; }
>   static inline void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl) { }
> +static inline void xe_i2c_pm_suspend(struct xe_device *xe) { }
> +static inline void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold) { }
>   #endif
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 693866def183..dbadbb0d95a6 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -19,6 +19,7 @@
>   #include "xe_ggtt.h"
>   #include "xe_gt.h"
>   #include "xe_guc.h"
> +#include "xe_i2c.h"
>   #include "xe_irq.h"
>   #include "xe_pcode.h"
>   #include "xe_pxp.h"
> @@ -146,6 +147,8 @@ int xe_pm_suspend(struct xe_device *xe)
>   
>   	xe_display_pm_suspend_late(xe);
>   
> +	xe_i2c_pm_suspend(xe);
> +
>   	drm_dbg(&xe->drm, "Device suspended\n");
>   	return 0;
>   
> @@ -191,6 +194,8 @@ int xe_pm_resume(struct xe_device *xe)
>   	if (err)
>   		goto err;
>   
> +	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
> +
>   	xe_irq_resume(xe);
>   
>   	for_each_gt(gt, xe, id)
> @@ -488,6 +493,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   
>   	xe_display_pm_runtime_suspend_late(xe);
>   
> +	xe_i2c_pm_suspend(xe);
> +
>   	xe_rpm_lockmap_release(xe);
>   	xe_pm_write_callback_task(xe, NULL);
>   	return 0;
> @@ -535,6 +542,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   			goto out;
>   	}
>   
> +	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
> +
>   	xe_irq_resume(xe);
>   
>   	for_each_gt(gt, xe, id)

LGTM.

Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>

