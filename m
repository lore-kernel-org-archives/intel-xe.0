Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F528E77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 13:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF07B10E1ED;
	Thu, 19 Dec 2024 13:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMam6OBh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE0D10E1ED
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 13:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734616743; x=1766152743;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=o823k9h0IQnvYxRgc3zQhPTVCMmg4eiCir5nsPNjAjo=;
 b=GMam6OBhOL8dNarPTckBUIgVzLQlN93bCaVrkCzRd5w6uhB2nAzfTZKc
 SPvEgMYmDjqMG5IVyNqTD73mbzvRt8ZC5LqF0lX3TejeHJKSM1VNDYzap
 xcktdZUccht58btBo5WzDdqQ1/9YuyZmSIdgk3LxAK7KMvEhdl+qXX0wC
 aZJJSvAxrKWy5WgcwHRc22qNPT9yTV45c9ZD7KPI1iiIt6zKVcFIqngNP
 TbKw8nVHPkLIPWKAqgzyuHr9AkJBNdP0hjeGiD04l3pN7skAR/fpwZ4pm
 tVX+Q+D/pGup25GO/9jsmXoMiegr2IGwkhn/vIgPfybZh8Ij6mqnhRwE3 Q==;
X-CSE-ConnectionGUID: udced3uTRuGx6ncwJeDnBQ==
X-CSE-MsgGUID: SP+hEi9iS7K3zm6gPINxnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34410383"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; d="scan'208";a="34410383"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 05:59:02 -0800
X-CSE-ConnectionGUID: arHVP3KFSJGqoyq24QAh+A==
X-CSE-MsgGUID: f0ybchYtQgGoFlTxxdI23w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98026864"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 05:59:02 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 05:59:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 05:59:01 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 05:59:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+wdoWbZT1Sop0wsYuKgDfwa73runIXLZFohcF0tqy4P///7db6himfKXNl7KELet4nqgz2+KasTsl0yC3R0GhKt9I81/9j/g9ZvHOQVSBfARCxswwf8INZTdzIhKfGD39cl4Zz+unP0GfEKVcyQ0klqJYJFdV9ZhYNsJAcol/aPndTQxvIJzWiFe4vxPOXtwnslgqaS8rH8H0ic3CDz0LzMAaFtmGBdeRLhm9Z5hNr7CNY+jRdwbngCH7kEqWhCEdcMUCS1u6ilbQ5zH5IrvyUZjN/+y0ZQs1qaSKRRedocEl+t74bmmlVetJ4uA1n/akG4mtvyTMuom1KMkDr1oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o823k9h0IQnvYxRgc3zQhPTVCMmg4eiCir5nsPNjAjo=;
 b=q+qozmxMcCl3J+FjBUb9C7+Tadp0dZylb+HOUgL9YOOKd7/fr+HllTDvB8UNBI5xmuWjG39NpKnIZH1x8wcsLEm7bjH+c2IRnd00z0Ix/ONjG5tGpAgk0nSOO1zV9kZ/C1AJ2QBnI4ZPUXT4DQK6u577x3FKi60sgpxK8TCXXspXdNnmP82+GR2XpyMuTna5WbY8SKgu5dz8QkGniw8fSLm5UjIdB9lSSsq5diTZ7G8nwpkBMu30Ju2+43/t8BInBnrYF/3oGa2Nf4VytCet3lwl2GPy5Kcw5w82NoxKLn3TzL1fY8CFVMZ1b+JnepThT0QPJXsa0fkaL39508+vng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH3PR11MB7868.namprd11.prod.outlook.com (2603:10b6:610:12e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Thu, 19 Dec
 2024 13:58:59 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 13:58:59 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH] drm/xe: Force write completion of MI_STORE_DATA_IMM
Thread-Topic: [PATCH] drm/xe: Force write completion of MI_STORE_DATA_IMM
Thread-Index: AQHbUJ3YMHh4/aZOLEyCN/bDzf7Xc7LrGKgAgAEL9gCAAB5oAIAAkLEAgADHVwA=
Date: Thu, 19 Dec 2024 13:58:59 +0000
Message-ID: <ea6999937576f73fa5e9c54e24f940d83bb3eef1.camel@intel.com>
References: <20241217160732.46280-1-jose.souza@intel.com>
 <Z2ILvmX9y87iFvZP@lstrano-desk.jf.intel.com>
 <3ebdd73cecef119cbfb7fc902909c8c2adc5b0fc.camel@intel.com>
 <Z2MGCDqGmlsYwi+J@lstrano-desk.jf.intel.com>
 <85wmfw1l7b.wl-ashutosh.dixit@intel.com>
In-Reply-To: <85wmfw1l7b.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH3PR11MB7868:EE_
x-ms-office365-filtering-correlation-id: a6de426b-a3ea-4332-3246-08dd2035499c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZzF3azl0d1VsWC9tNERLdVNrT0xWUHI4YXJwd25ZUVBzYXozbzg5a2FkNUMy?=
 =?utf-8?B?bkc5cE0yVVI3ODdwMmZZYjRXWS9GMitvUHIveGVFblRuQjFuaHpBTFZXOTNr?=
 =?utf-8?B?YUxLNGF1cUZGTVBuSFFaNTA2UjdkMlZEV2owcnR4b1JKYkVrbEdFamRWRzdK?=
 =?utf-8?B?QlVnMjNWZHhDQ0RObGNPNk5xZmNrcWdEUGgyeVo1SW1EeisrYUFmMDJUd1VH?=
 =?utf-8?B?aG5rd0l1MHowQU1IdyszbnFaajAwdFJ5aWZFTTh1dlAza09OTzIveC96ZmZy?=
 =?utf-8?B?eFp5eHZwR1lJUzRXanBZaCtnUm82MmZBVG1DQjRHNHdoby8rQzFlcGZ1Y3ZS?=
 =?utf-8?B?SmdlcGZSK2ZUbWpld0JyMC9oRUl0TktiWUZRTWhUZCs0UFp0R2dDZW9hL1Rk?=
 =?utf-8?B?VUxsQ0pDSFFsQ2VVbU1nNXZZa05HVUhhampUOEp1MS9CM3lXSXRLaUFPa1Ar?=
 =?utf-8?B?c3VtZi9uZ2VhVUwreG1RSHdNZGlUR21vME0rVGNyclFiUTRKMWNOand1YWd1?=
 =?utf-8?B?ZzNhMXRsa0hEMS9sUDZXSHJDWHZ3NUIwSEhQaksweGRoL1Z0ZVJpV2RxMW1h?=
 =?utf-8?B?MitKazVEV0QyY3Y0aGllZm5RMVdidHpsU3BHWGhXK3JJQkNDa2NEYTh4T3NP?=
 =?utf-8?B?OFByMzdMdDBqRnZQeTUvbnEyNGwwMXJITTNkTGx0bFNZcWJIMGRuU0ZFV0hO?=
 =?utf-8?B?d3Ard2R2SjBlNUhBMnF0WXFLYkpLNTFwMmdQU255TGZoK3dFZW1nSUVIQ2dC?=
 =?utf-8?B?K3lDMDIrZkI2UFJHVFk5czRBb0d4S3JSeGJWdWJrRmZDQllzTTByM1BDaEhB?=
 =?utf-8?B?TVY4cHptZGpqeHQ5aTdOeEpxaXZ0TjZsWG5CdWRrRmlCdkxoZEdZcnFtZG1V?=
 =?utf-8?B?UFRWTWR2SENWL2Zzd2JibVhjR1F1eWlvUWQ3cVJETGc1V3NOQmZYRjdYd0la?=
 =?utf-8?B?R1Bmem5FcWlzbmw5OGdaSmIwMyt4SUxpcGZqUHIzRzYvOHRpdFJsUGlTSFdX?=
 =?utf-8?B?YklIRlBlVzFsWHJPa0tDU09ZaXVPTTF0RFEzenlTcUZFU01NWTRvK0VBV1ht?=
 =?utf-8?B?U0JmSEYySjVmSFQwR0hCWFhCalUzeXhXRzBJMkwwNS9KcTJ3K1B2SmR3K2ZE?=
 =?utf-8?B?ZG1HMUhxTktteFZZRTZ1bDJxdXpyWTR5TEJuQnhJMGVHV2lkUnIrMEFNUHVZ?=
 =?utf-8?B?bHEvbm13Z3VYMWkzNzlSNFBraXIra3lyY0gwVzlvNjYreS8yT1cvSU1LWE1J?=
 =?utf-8?B?eW5weUoxUEgvQ3lrVWQxbFJJaW5SUEcrKzBnV0R5aVdtWUdCTFBHTTY5V1lG?=
 =?utf-8?B?L3FNMFQ1WEJPd1F6RUlQd3RLdXpJS1VHMHg1SzlvTFhJeCtMU2ZhK0x2b2FE?=
 =?utf-8?B?MXJISzl2Q2I4cldwWGk3UFZTU0xZSHRIM3dYd0U3MUMrYWdyUUdhcWM0cmUx?=
 =?utf-8?B?VVk4dWNHcWg0RkI4cktDZzN1Nlk1WWZIblVabE9BVXNyTHJkWllmM29YRXhv?=
 =?utf-8?B?YURYT055L1FuNGJ3YmVFSi8vK3RJa3hRYTMzL1M0UjNrYnQwbDZBMkNtTk4w?=
 =?utf-8?B?b252MHlGVVdGKzlTUHdPVHltOTlnRFIrYnZmbzEveTZWZks3clMyeFFFR1Z3?=
 =?utf-8?B?eTNneDRkVFg0V25RQm1lVEo2ZCtoMFBJaitMbmFWaHp1cHplZXNHT2R1WjN0?=
 =?utf-8?B?VC9YOU9sV1BwZUh3V0ZHV0hwd0taSC9EQWJoMXBkWHQ0ckFmOUVjc29QMTRI?=
 =?utf-8?B?em5xR0hjL1hnZ3dteUdvNkplZFh4NjI3cTBVOUpSM01xckNMSkdTUGltS3FX?=
 =?utf-8?B?cFZaYmRISXp4TUp0dGhMRXFJMjNmMUt1amlYdGtwVVBCTGsyZWw0S0hib3Jo?=
 =?utf-8?B?YVQ4VHRQVVlQUnpRcVE4S2ZQUTFNTGZ3K0g1Qk9YcUsvVzBERElqcWNZSGlt?=
 =?utf-8?Q?OpQ8qciuX2FSN8XZzgCgwsji7WgG+HB4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlJLRm5tUVFPYndiaWNrK2pzSlN1bHZYaEo2aW53WXlaMzBpZlZqR1B4K3g1?=
 =?utf-8?B?SHZoSXdwL2RaTTRwdi9LQW9naWgxUEEzVjk4enY2bm9MQ2tYM0RLaWlWeWZs?=
 =?utf-8?B?UDdiRGx0Y0VtN1A5UUJYMFRySGMvZEhyeGVMaFlKZ0x0blVVTCtBWDdtRGZB?=
 =?utf-8?B?RG43SFp2SFQwcnBaRVNjeEVGbllxRGRaM1B1czRkdVlDT0kvNnQ3OEZIc3Rm?=
 =?utf-8?B?VEVpOXBwRjIzOGF6azV6dGVjU1BUb2piVnllZVRGc0JyOS9WU1dLR0w0dTYy?=
 =?utf-8?B?L1V5b1JUcTdVZDFwa0pUK2RGQjNBY05ldmdwNnEwWks0YjA0bmJxUC9mSFFU?=
 =?utf-8?B?dHZwYXlQZkh2Nmg4cFhNNkpFYng4K29uSFJkNVRiVFIyUGw1eTExVGNWNjhU?=
 =?utf-8?B?V3YwNGdtSnkzZmI5blFrZjlWWlVLd1lMdjRtaU5tS01zRHAzaksvQk5GUnQr?=
 =?utf-8?B?eU4rZm8wbmphMVFoajFNdW9Iby8xWjIrQzAvV3hPQ1UyOWdWeWtnU1RqNkJU?=
 =?utf-8?B?Vjg2SDhONXptWDZaRSttK1A1N3VudTlpRDFCamhpQU9vdHRIVzFjdktrYTBy?=
 =?utf-8?B?WUhYZmNsZ1JobkxqeEV0UUVxdjFXckYyUTZTWU5CUis2c0lHd3crUWhrSmRR?=
 =?utf-8?B?V04yK25FY1Mrd0pZUFo0VTZ5Q1c2MlVzR3E1SnVkUmM2VFUwOGk2ZUpIcGxB?=
 =?utf-8?B?WlcwQ1dtbjZPV0lEWENwTjFwcEs4UWQ1Wm1DaDNsL1c4UExoTkhldlpjeHMv?=
 =?utf-8?B?akFseXVmUG9rSWZNalFlamJ5bThaNlliUUcrTFpzYUZaNXJhTHlDNTNHMzZN?=
 =?utf-8?B?bW5hdXRDVVZBZVdTalQwUDkyOVEzZ25wM29zd3pkR0FaZis0ZTJxZXM4OWo2?=
 =?utf-8?B?ZnZNbGhGL0liUUxlWGRiYklnN0NNVVkwcm9yUzdqSG9OVDdKYzRVeXdJM2lz?=
 =?utf-8?B?UEZKMC9pQTFYQ2psU3ZuOWlaNmFTSUtCaXl4RTEzR0hjbklpNE41UUx3Syt5?=
 =?utf-8?B?L0JFMVhsMEI4b0tCOEQ1R0NYTTJwK0dyTHF5VlI0SXBvWFZHN2xZWjV6WE0x?=
 =?utf-8?B?ZEpwSkZNcUpMdFFTeWlZSmlZTzQrSDZDaHJqeGdvNzhGMGdxbm53c0RZbEk5?=
 =?utf-8?B?aWhZdnFqcG00TlZmcGc3czFtS2p6UXY0bEdLSzZaVkdSbER6RE0xbE9DS04v?=
 =?utf-8?B?L2JkL0NhR0wzVUVkYmZHRTlmTERSLzhleUJyVEpjblB3cEFoZlAyaWgzZmxh?=
 =?utf-8?B?cHZKMUZQVmtPMlRCdlI3QTVjUEpFK0VZbTd6SzZaazgvUXBub3V5OTlvcmYy?=
 =?utf-8?B?WHR1b0FNSThVb29nSWg4TkhIRWM5cUJEVndlRDRXODZJWXgwMlFJTzlDMzYr?=
 =?utf-8?B?cHIxU0xKaVBnWURsYVBucVJvZWRTREs0Zng5OXFGQm5FVUJyMEY3bkY0SEht?=
 =?utf-8?B?VGZDdUVpT252RDl4eHl2Q05DbzJOWDlJa3F4d0Rpcm9VQjJpL0tpcHVBcXpN?=
 =?utf-8?B?NzBFMlg1Vk94Uy9xSTludFNmd21qNUlqOUZLUExYQjBJRFhuNWRuY0lZNmJa?=
 =?utf-8?B?QWxOUmMvSnpEd1JZc2VCcTNWVTVRTngrTERrakh6c3RZVktOZDRBSWNCaC9s?=
 =?utf-8?B?K2lmWWJkb1o0TWRqaW5UeUhXM0xxWFlEWmFDclIyWlgxWk41N05TNFd2dnhF?=
 =?utf-8?B?QjAvZ0xma001Y0E0QzRhQVREenN0dXZUZmJlL2F6bExLWWM2TlRkeUpnUTVH?=
 =?utf-8?B?L212eVI5WVExaUg0K0xrU1g0dDFXY1lDa2xWajdDZXJCdS96cGZiL2Q5NVV5?=
 =?utf-8?B?cVdseUw1VDUwQm9DaUdZSTBhTUl4NVk2cVE2OXZ4MkxrdFJpd25WUjBjeDkv?=
 =?utf-8?B?d3d6VW9tNU44SnFIaTVCWmF4eDk4eG1TdnpmbTJaOFFsTU1wd1RoeFZPV1F0?=
 =?utf-8?B?SEFnVCtKeEdBQ2F2dlF0cWlBeEZHdnAwNlgyUHdscEk4MDI4d1FGYjJOUTk0?=
 =?utf-8?B?c3NyMUREb2FENDhkYU5Zb2RXbHdzOHZFS2xiR3NXMkNscmlBOGFoNVZiQzdE?=
 =?utf-8?B?N1owUTdyNWVaK2orSnJhMmdZTkh1NGlIYUYreUd3M2kyZ1pXNGk4R2VFTy9V?=
 =?utf-8?B?SVBDYXZqT0hjWlBDY3QrWmVqdmE1eWsvMldJTlljcEVrRTlxMjZrQkJwS1J5?=
 =?utf-8?B?N1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C6A89AB4684AD4D9C32BF4D41427755@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6de426b-a3ea-4332-3246-08dd2035499c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 13:58:59.6413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gDk1/+A/F42YAdJ5w32ahXowwPhU8ERko6aFXIFIJx1A8RYVX3phkgCUYoEWUaRxE/gR4nIRsNeTRU7YX7DWGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7868
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

T24gV2VkLCAyMDI0LTEyLTE4IGF0IDE4OjA1IC0wODAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIFdlZCwgMTggRGVjIDIwMjQgMDk6Mjc6MzYgLTA4MDAsIE1hdHRoZXcgQnJvc3Qgd3Jv
dGU6DQo+ID4gDQo+IA0KPiBGb2xrcywNCj4gDQo+ID4gT24gV2VkLCBEZWMgMTgsIDIwMjQgYXQg
MDg6Mzg6NDlBTSAtMDcwMCwgU291emEsIEpvc2Ugd3JvdGU6DQo+ID4gPiBPbiBUdWUsIDIwMjQt
MTItMTcgYXQgMTU6MzkgLTA4MDAsIE1hdHRoZXcgQnJvc3Qgd3JvdGU6DQo+ID4gPiA+IE9uIFR1
ZSwgRGVjIDE3LCAyMDI0IGF0IDA4OjA3OjMyQU0gLTA4MDAsIEpvc8OpIFJvYmVydG8gZGUgU291
emEgd3JvdGU6DQo+ID4gPiA+ID4gV2l0aCBGb3JjZSB3cml0ZSBjb21wbGV0aW9uIHVuc2V0IHRo
ZXJlIGlzIG5vIGd1YXJhbnRlZXMgb2Ygd2hlbiB0aGUNCj4gPiA+ID4gPiB3cml0ZSB3aWxsIGJl
IGdsb2JhbGx5IHZpc2libGUgd2hhdCBpcyBub3QgdGhlIGJlaGF2aW9yIHdhbnRlZC4NCj4gPiA+
ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IERvIHdlIHdhbnQgdGhpcyBiYWNrcG9ydGVkPyBJZiBz
bywgbWF5YmUgYWRkIGEgZml4ZXM/DQo+ID4gPiANCj4gPiA+IE5vdCBzdXJlLCBJIGRvbid0IGhh
dmUgYW4gYWN0dWFsIGlzc3VlIHRoYXQgaXMgZml4ZWQgYnkgdGhpcyBidXQgSSB0aGluayB3b3Vs
ZCBiZSBnb29kIHRvIGhhdmUgaXQgYmFja3BvcnRlZC4NCj4gPiA+IEJ1dCB3aGF0IGRvIHlvdSBz
dWdnZXN0PyBBZGQgYSBmaXhlcyB0YWcgdG8gdGhlIHBhdGNoIHJlbW92aW5nIGZvcmNlIHByb2Jl
IGZyb20gTE5MPw0KPiA+ID4gDQo+ID4gDQo+ID4gWWVhIGZpeGluZyBMTkwgZm9yY2UgcHJvYmUg
cmVtb3ZhbCBzb3VuZHMgcmVhc29uYWJsZSB0byBtZS4NCj4gDQo+IEhtbSB0aGUgcGxhbiB3YXMg
YWRkIEZpeGVzIHRvIHRoaXMgcGF0Y2ggYW5kIGFsc28gQ2M6IHN0YWJsZS4gWWV0IGl0IHdhcw0K
PiBtZXJnZWQgd2l0aG91dCB0aGVzZToNCj4gDQo+IDE0NjBiYjFmZWY5YyAoImRybS94ZTogRm9y
Y2Ugd3JpdGUgY29tcGxldGlvbiBvZiBNSV9TVE9SRV9EQVRBX0lNTSIpDQo+IA0KPiBMdWNhcy9U
aG9tYXMsDQo+IA0KPiBXb3VsZCBpdCBiZSBwb3NzaWJsZSB0byBzZW5kIGl0IHRvIC1maXhlcyB3
aXRoIGEgQ2M6c3RhYmxlLiBXZSBoYXZlIHBhdGNoZXMNCj4gZGVwZW5kaW5nIG9uIHRoaXMgb25l
IHdoaWNoIHdlIHdhbnQgdG8gc2VuZCB0byBzdGFibGUuDQoNClBsZWFzZSBjb3JyZWN0IG1lIGlm
IEknbSB3cm9uZyBidXQgdGhhdCBpcyBlbm91Z2ggZm9yIGl0IHRvIGJlIHBpY2tlZCB0byBzdGFi
bGUsIGl0IHdpbGwgaGFwcGVuIGluIHRoZSBuZXh0IFhlIHN0YWJsZSBwdWxsIHJlcXVlc3QuDQoN
Cj4gDQo+IFRoYW5rcy4NCj4gLS0NCj4gQXNodXRvc2gNCj4gDQo+IA0KPiANCj4gDQo+ID4gDQo+
ID4gTWF0dA0KPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gTWF0dA0KPiA+ID4gPiANCj4gPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVs
LmNvbT4NCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL2luc3Ry
dWN0aW9ucy94ZV9taV9jb21tYW5kcy5oIHwgMTMgKysrKysrKy0tLS0tLQ0KPiA+ID4gPiA+ICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jICAgICAgICAgICAgICAgICAgfCAxMSArKysr
KysrKy0tLQ0KPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfb2EuYyAgICAgICAgICAg
ICAgICAgICAgICAgfCAgNCArKystDQo+ID4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9y
aW5nX29wcy5jICAgICAgICAgICAgICAgICB8ICA2ICsrKystLQ0KPiA+ID4gPiA+ICA0IGZpbGVz
IGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0KPiA+ID4gPiA+IA0K
PiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvaW5zdHJ1Y3Rpb25zL3hl
X21pX2NvbW1hbmRzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUvaW5zdHJ1Y3Rpb25zL3hlX21pX2Nv
bW1hbmRzLmgNCj4gPiA+ID4gPiBpbmRleCAxMGVjMjkyMGQzMWIzLi5mNGVlOTEwZjA5NDMyIDEw
MDY0NA0KPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9pbnN0cnVjdGlvbnMveGVf
bWlfY29tbWFuZHMuaA0KPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9pbnN0cnVj
dGlvbnMveGVfbWlfY29tbWFuZHMuaA0KPiA+ID4gPiA+IEBAIC0zMywxMiArMzMsMTMgQEANCj4g
PiA+ID4gPiAgI2RlZmluZSBNSV9UT1BPTE9HWV9GSUxURVIJCV9fTUlfSU5TVFIoMHhEKQ0KPiA+
ID4gPiA+ICAjZGVmaW5lIE1JX0ZPUkNFX1dBS0VVUAkJCV9fTUlfSU5TVFIoMHgxRCkNCj4gPiA+
ID4gPiANCj4gPiA+ID4gPiAtI2RlZmluZSBNSV9TVE9SRV9EQVRBX0lNTQkJX19NSV9JTlNUUigw
eDIwKQ0KPiA+ID4gPiA+IC0jZGVmaW5lICAgTUlfU0RJX0dHVFQJCQlSRUdfQklUKDIyKQ0KPiA+
ID4gPiA+IC0jZGVmaW5lICAgTUlfU0RJX0xFTl9EVwkJCUdFTk1BU0soOSwgMCkNCj4gPiA+ID4g
PiAtI2RlZmluZSAgIE1JX1NESV9OVU1fRFcoeCkJCVJFR19GSUVMRF9QUkVQKE1JX1NESV9MRU5f
RFcsICh4KSArIDMgLSAyKQ0KPiA+ID4gPiA+IC0jZGVmaW5lICAgTUlfU0RJX05VTV9RVyh4KQkJ
KFJFR19GSUVMRF9QUkVQKE1JX1NESV9MRU5fRFcsIDIgKiAoeCkgKyAzIC0gMikgfCBcDQo+ID4g
PiA+ID4gLQkJCQkJIFJFR19CSVQoMjEpKQ0KPiA+ID4gPiA+ICsjZGVmaW5lIE1JX1NUT1JFX0RB
VEFfSU1NCQkJX19NSV9JTlNUUigweDIwKQ0KPiA+ID4gPiA+ICsjZGVmaW5lICAgTUlfU0RJX0dH
VFQJCQkJUkVHX0JJVCgyMikNCj4gPiA+ID4gPiArI2RlZmluZSAgIE1JX0ZPUkNFX1dSSVRFX0NP
TVBMRVRJT05fQ0hFQ0sJUkVHX0JJVCgxMCkNCj4gPiA+ID4gPiArI2RlZmluZSAgIE1JX1NESV9M
RU5fRFcJCQkJR0VOTUFTSyg5LCAwKQ0KPiA+ID4gPiA+ICsjZGVmaW5lICAgTUlfU0RJX05VTV9E
Vyh4KQkJCVJFR19GSUVMRF9QUkVQKE1JX1NESV9MRU5fRFcsICh4KSArIDMgLSAyKQ0KPiA+ID4g
PiA+ICsjZGVmaW5lICAgTUlfU0RJX05VTV9RVyh4KQkJCShSRUdfRklFTERfUFJFUChNSV9TRElf
TEVOX0RXLCAyICogKHgpICsgMyAtIDIpIHwgXA0KPiA+ID4gPiA+ICsJCQkJCQkgUkVHX0JJVCgy
MSkpDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gICNkZWZpbmUgTUlfTE9BRF9SRUdJU1RFUl9JTU0J
CV9fTUlfSU5TVFIoMHgyMikNCj4gPiA+ID4gPiAgI2RlZmluZSAgIE1JX0xSSV9MUk1fQ1NfTU1J
TwkJUkVHX0JJVCgxOSkNCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX21pZ3JhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMNCj4gPiA+ID4g
PiBpbmRleCAxYjk3ZDkwYWFkZGFmLi44YjMyZmFkNjc4NzgyIDEwMDY0NA0KPiA+ID4gPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMNCj4gPiA+ID4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jDQo+ID4gPiA+ID4gQEAgLTU4MSw3ICs1ODEsOSBA
QCBzdGF0aWMgdm9pZCBlbWl0X3B0ZShzdHJ1Y3QgeGVfbWlncmF0ZSAqbSwNCj4gPiA+ID4gPiAJ
CXdoaWxlIChwdGVzKSB7DQo+ID4gPiA+ID4gCQkJdTMyIGNodW5rID0gbWluKE1BWF9QVEVfUEVS
X1NESSwgcHRlcyk7DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gLQkJYmItPmNzW2JiLT5sZW4rK10g
PSBNSV9TVE9SRV9EQVRBX0lNTSB8IE1JX1NESV9OVU1fUVcoY2h1bmspOw0KPiA+ID4gPiA+ICsJ
CWJiLT5jc1tiYi0+bGVuKytdID0gTUlfU1RPUkVfREFUQV9JTU0gfA0KPiA+ID4gPiA+ICsJCQkJ
ICAgIE1JX0ZPUkNFX1dSSVRFX0NPTVBMRVRJT05fQ0hFQ0sgfA0KPiA+ID4gPiA+ICsJCQkJICAg
IE1JX1NESV9OVU1fUVcoY2h1bmspOw0KPiA+ID4gPiA+IAkJCWJiLT5jc1tiYi0+bGVuKytdID0g
b2ZzOw0KPiA+ID4gPiA+IAkJCWJiLT5jc1tiYi0+bGVuKytdID0gMDsNCj4gPiA+ID4gPiANCj4g
PiA+ID4gPiBAQCAtMTIyMyw3ICsxMjI1LDkgQEAgc3RhdGljIHZvaWQgd3JpdGVfcGd0YWJsZShz
dHJ1Y3QgeGVfdGlsZSAqdGlsZSwgc3RydWN0IHhlX2JiICpiYiwgdTY0IHBwZ3R0X29mcywNCj4g
PiA+ID4gPiAJCQlpZiAoIShiYi0+bGVuICYgMSkpDQo+ID4gPiA+ID4gCQkJCWJiLT5jc1tiYi0+
bGVuKytdID0gTUlfTk9PUDsNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiAtCQliYi0+Y3NbYmItPmxl
bisrXSA9IE1JX1NUT1JFX0RBVEFfSU1NIHwgTUlfU0RJX05VTV9RVyhjaHVuayk7DQo+ID4gPiA+
ID4gKwkJYmItPmNzW2JiLT5sZW4rK10gPSBNSV9TVE9SRV9EQVRBX0lNTSB8DQo+ID4gPiA+ID4g
KwkJCQkgICAgTUlfRk9SQ0VfV1JJVEVfQ09NUExFVElPTl9DSEVDSyB8DQo+ID4gPiA+ID4gKwkJ
CQkgICAgTUlfU0RJX05VTV9RVyhjaHVuayk7DQo+ID4gPiA+ID4gCQkJYmItPmNzW2JiLT5sZW4r
K10gPSBsb3dlcl8zMl9iaXRzKGFkZHIpOw0KPiA+ID4gPiA+IAkJCWJiLT5jc1tiYi0+bGVuKytd
ID0gdXBwZXJfMzJfYml0cyhhZGRyKTsNCj4gPiA+ID4gPiAJCQlpZiAocHRfb3AtPmJpbmQpDQo+
ID4gPiA+ID4gQEAgLTEzODgsNyArMTM5Miw4IEBAIF9feGVfbWlncmF0ZV91cGRhdGVfcGd0YWJs
ZXMoc3RydWN0IHhlX21pZ3JhdGUgKm0sDQo+ID4gPiA+ID4gCQkJCXUzMiBpZHggPSAwOw0KPiA+
ID4gPiA+IA0KPiA+ID4gPiA+IAkJCQliYi0+Y3NbYmItPmxlbisrXSA9IE1JX1NUT1JFX0RBVEFf
SU1NIHwNCj4gPiA+ID4gPiAtCQkJCU1JX1NESV9OVU1fUVcoY2h1bmspOw0KPiA+ID4gPiA+ICsJ
CQkJCSAgICBNSV9GT1JDRV9XUklURV9DT01QTEVUSU9OX0NIRUNLIHwNCj4gPiA+ID4gPiArCQkJ
CQkgICAgTUlfU0RJX05VTV9RVyhjaHVuayk7DQo+ID4gPiA+ID4gCQkJCWJiLT5jc1tiYi0+bGVu
KytdID0gb2ZzOw0KPiA+ID4gPiA+IAkJCQliYi0+Y3NbYmItPmxlbisrXSA9IDA7IC8qIHVwcGVy
XzMyX2JpdHMgKi8NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX29hLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfb2EuYw0KPiA+ID4gPiA+
IGluZGV4IDU2YmYzNzVhOWQ0YmMuLmFlOTQ0OTBiMGVhYzggMTAwNjQ0DQo+ID4gPiA+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX29hLmMNCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfb2EuYw0KPiA+ID4gPiA+IEBAIC02OTAsNyArNjkwLDkgQEAgc3RhdGljIHZv
aWQgeGVfb2Ffc3RvcmVfZmxleChzdHJ1Y3QgeGVfb2Ffc3RyZWFtICpzdHJlYW0sIHN0cnVjdCB4
ZV9scmMgKmxyYywNCj4gPiA+ID4gPiAJCXUzMiBvZmZzZXQgPSB4ZV9ib19nZ3R0X2FkZHIobHJj
LT5ibyk7DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gCQlkbyB7DQo+ID4gPiA+ID4gLQkJYmItPmNz
W2JiLT5sZW4rK10gPSBNSV9TVE9SRV9EQVRBX0lNTSB8IE1JX1NESV9HR1RUIHwgTUlfU0RJX05V
TV9EVygxKTsNCj4gPiA+ID4gPiArCQliYi0+Y3NbYmItPmxlbisrXSA9IE1JX1NUT1JFX0RBVEFf
SU1NIHwgTUlfU0RJX0dHVFQgfA0KPiA+ID4gPiA+ICsJCQkJICAgIE1JX0ZPUkNFX1dSSVRFX0NP
TVBMRVRJT05fQ0hFQ0sgfA0KPiA+ID4gPiA+ICsJCQkJICAgIE1JX1NESV9OVU1fRFcoMSk7DQo+
ID4gPiA+ID4gCQkJYmItPmNzW2JiLT5sZW4rK10gPSBvZmZzZXQgKyBmbGV4LT5vZmZzZXQgKiBz
aXplb2YodTMyKTsNCj4gPiA+ID4gPiAJCQliYi0+Y3NbYmItPmxlbisrXSA9IDA7DQo+ID4gPiA+
ID4gCQkJYmItPmNzW2JiLT5sZW4rK10gPSBmbGV4LT52YWx1ZTsNCj4gPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfcmluZ19vcHMuYw0KPiA+ID4gPiA+IGluZGV4IDBiZTRmNDg5ZDNlMTIuLjNhNzVhMDhi
NmJlOTIgMTAwNjQ0DQo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdf
b3BzLmMNCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYw0K
PiA+ID4gPiA+IEBAIC03Miw3ICs3Miw4IEBAIHN0YXRpYyBpbnQgZW1pdF91c2VyX2ludGVycnVw
dCh1MzIgKmR3LCBpbnQgaSkNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiAgc3RhdGljIGludCBlbWl0
X3N0b3JlX2ltbV9nZ3R0KHUzMiBhZGRyLCB1MzIgdmFsdWUsIHUzMiAqZHcsIGludCBpKQ0KPiA+
ID4gPiA+ICB7DQo+ID4gPiA+ID4gLQlkd1tpKytdID0gTUlfU1RPUkVfREFUQV9JTU0gfCBNSV9T
RElfR0dUVCB8IE1JX1NESV9OVU1fRFcoMSk7DQo+ID4gPiA+ID4gKwlkd1tpKytdID0gTUlfU1RP
UkVfREFUQV9JTU0gfCBNSV9TRElfR0dUVCB8DQo+ID4gPiA+ID4gKwkJICBNSV9GT1JDRV9XUklU
RV9DT01QTEVUSU9OX0NIRUNLIHwgTUlfU0RJX05VTV9EVygxKTsNCj4gPiA+ID4gPiAJCWR3W2kr
K10gPSBhZGRyOw0KPiA+ID4gPiA+IAkJZHdbaSsrXSA9IDA7DQo+ID4gPiA+ID4gCQlkd1tpKytd
ID0gdmFsdWU7DQo+ID4gPiA+ID4gQEAgLTE2Miw3ICsxNjMsOCBAQCBzdGF0aWMgaW50IGVtaXRf
cGlwZV9pbnZhbGlkYXRlKHUzMiBtYXNrX2ZsYWdzLCBib29sIGludmFsaWRhdGVfdGxiLCB1MzIg
KmR3LA0KPiA+ID4gPiA+ICBzdGF0aWMgaW50IGVtaXRfc3RvcmVfaW1tX3BwZ3R0X3Bvc3RlZCh1
NjQgYWRkciwgdTY0IHZhbHVlLA0KPiA+ID4gPiA+IAkJCQkJICAgICAgIHUzMiAqZHcsIGludCBp
KQ0KPiA+ID4gPiA+ICB7DQo+ID4gPiA+ID4gLQlkd1tpKytdID0gTUlfU1RPUkVfREFUQV9JTU0g
fCBNSV9TRElfTlVNX1FXKDEpOw0KPiA+ID4gPiA+ICsJZHdbaSsrXSA9IE1JX1NUT1JFX0RBVEFf
SU1NIHwgTUlfRk9SQ0VfV1JJVEVfQ09NUExFVElPTl9DSEVDSyB8DQo+ID4gPiA+ID4gKwkJICBN
SV9TRElfTlVNX1FXKDEpOw0KPiA+ID4gPiA+IAkJZHdbaSsrXSA9IGxvd2VyXzMyX2JpdHMoYWRk
cik7DQo+ID4gPiA+ID4gCQlkd1tpKytdID0gdXBwZXJfMzJfYml0cyhhZGRyKTsNCj4gPiA+ID4g
PiAJCWR3W2krK10gPSBsb3dlcl8zMl9iaXRzKHZhbHVlKTsNCj4gPiA+ID4gPiAtLQ0KPiA+ID4g
PiA+IDIuNDcuMQ0KPiA+ID4gPiA+IA0KPiA+ID4gDQoNCg==
