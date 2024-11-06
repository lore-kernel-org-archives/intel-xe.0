Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58C2D59F7A
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 22:27:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A85D10E798;
	Wed,  6 Nov 2024 22:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLEgmbNx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AC810E798
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 22:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730932054; x=1762468054;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CccL7B4buK5lf2SheCtMDLtXis995QGglise2bEDKZo=;
 b=bLEgmbNx/ffllBJE5UAZObeEY2ncZHMTcI/CQDuRMdpZ3MlLoMeLo7GS
 iwEWC0zdSuWgQ1tE90A6+Jh2W+Evg+lEsJi+wQNLB8JaeOgcTdXHHMRYC
 +iMtiMcEloz9GEUAAfS02pEBXMatsd0NQ+VHuRE37i2LaAP652P4OsNeB
 BqIH2ANP/GyP4s4+LHB1EJpSfi7XDSePswQlqWorlGC6Xb8bggaj18LVL
 AsrA+Rcl38JIWKC9GWR2jv6xCxyO2qj/gwW7pdvRbJY53Pk/HlMJxIh/u
 HUks89CwGm4fAn78XtOHg7K1fhX0hSrgL+GzikpBsB2UuFsmKHiDqxm/4 Q==;
X-CSE-ConnectionGUID: p4YukbEORWC1ULvOCMTNGw==
X-CSE-MsgGUID: 26YRRywrRO+a6d8xX6SYsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41854711"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41854711"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 14:27:33 -0800
X-CSE-ConnectionGUID: p2kG1uLpTJa6VDu7eIjeeA==
X-CSE-MsgGUID: ty0KbnCcSBuGdagGjGsnBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; d="scan'208";a="89914385"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 14:25:41 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 14:25:40 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 14:25:40 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 14:25:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCy5qh1KAPn/dzFHueO+XPBfc/quSK9c3PRKqQ8pNMVnvYZcV0yL+ZCgv5AlNlH+NosOanmMSsvS1MydMDXWX+Ka0zJZP01CSV17wn2a3auCLXxuHudhhJ357OtoAtFf0iK0HV7m7z3KzPb2lQRRU45pVoseCwUbwBO0Xey/dmjhwgqJKcPbSKrldFJt73YpoPbaGq17miCOsrm2GLAcseFPD7vw9yR0PK65Gj8E3m5wfvY7vFVyUwed1d6ZHep/WmDniH2+sM5t9pd7/SGbXWoSO9DKn6+2JuUxMn7ZierMxpPEGhqj/VnPKTF0QHEVWDvV9v0RJ/ojYOQf8TbnXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zb4s7MaUHH9DHoW3qSBI8lD3VQAvHDC9WMIU6myH3zs=;
 b=IShjExSKgtimgBNC1dNJtZNcXjPpxwbP4i6mrkmgOE8pzTtRQMxqSii5rcYYWzEGJBBVcCa3Wll4GfN5ZgGItnVBH9MI7TdBE7xQWz/XfyiWdNPFSolcneeTJvN0kxMNEnS7vI7PwU9BVOq0BDz7xa9txr0PSnVqoNCY/WrQK4bImuMg64n1ePC15a48sryNN11iaB6tKYJ0VCTaswOh4/PLAKwum0vOUjtiXJP80k8UZVFbkOAR1fU/icnRMRggC4KbBxbOwQxYYAtI7L9WD2w4mXW0bSYGz6UV47FBxQCRCnXkZR1UqlGBjLto9bh0r7VKylw53xcAgKjchEFqug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB8178.namprd11.prod.outlook.com (2603:10b6:8:18f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 22:25:37 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 22:25:36 +0000
Message-ID: <66944388-a948-45c0-af89-51969343101f@intel.com>
Date: Wed, 6 Nov 2024 14:25:34 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] drm/xe/pxp: Allocate PXP execution resources
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
 <20240816190024.2176976-3-daniele.ceraolospurio@intel.com>
 <051cab8c-7c8b-494a-97cd-58952920815d@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <051cab8c-7c8b-494a-97cd-58952920815d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::34) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c952a6-4297-4b57-bc52-08dcfeb1efd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OURlbGNOQzROYlBZK25ldndTdnp0d1h2ZmlPSFhrK2lZay9JelBFeE8zYjBY?=
 =?utf-8?B?VWtObGc4YSs2Qkk0VUpsSEE2WHBQektyVFZSOVQwY2toSlZGRXVRblNleGd1?=
 =?utf-8?B?TmtjbDd6d2dlRVp5RE9hY0F5ZWEvY3MrdHQyUmNEUzFVaENsbHNXazNHREZC?=
 =?utf-8?B?UDR4RU9QZzZyMGJIZGcvTkJwaXZMSThoN3o3UlNsNkpudXdZK1JjenQzMjlp?=
 =?utf-8?B?Ni9ITUNxQWQyaFJ5V3pFdCtVNk43emhPNmlMOEsrKzBJVEZUVis2YXphaVpS?=
 =?utf-8?B?eG1PVkFaSFQ3VEJoMFZqZVI3VlMwMW1uUHNVZ0JxMnpSN25Ccm4xR3dlM0VW?=
 =?utf-8?B?alRkTEhrUEczQ01VT2xobnBKdVpSQTdDRjh4aU1pVFQwbkNobXN3N25aWCtG?=
 =?utf-8?B?VHczbkFiUGtUdHJKQ1M1RitpUWFyYjk1d0dodkdldCtXQ21zOGtRcmwyRUZ4?=
 =?utf-8?B?dTI0cUVNSXR3ZFV4YmMxQ2ZoRFpkUXB0NWQ4QmN5M2JYMHVtVmg5YVpkK0t1?=
 =?utf-8?B?M0VXV3Vwclp2cWs2dHJiSmh2cmIvKzB2amFVTWkxSmxWTk9YenpES3JNb1Rt?=
 =?utf-8?B?SFI0M1VxcUtmWmhCS1VGdXBIRXAzUWVkTlU3b2E0TEFqcHZvN2JLcGJsODJI?=
 =?utf-8?B?SllxLzVjODZabndFeU5WcUhDUDMwN0E4VEZQaXBaNHQvNW9xUFgzUmhlUDJu?=
 =?utf-8?B?dldzREMrdjBPdHROQVZabXU0TDZrdklmcERnQ0pFV2JuT2ovV2t0akJCdXQy?=
 =?utf-8?B?SEk5NHZ6bnlTemVVZHpsQmNDeG51WG9wMVpzQ0xyS3ZjUnZycW9ORXB3RXRi?=
 =?utf-8?B?M3R0OFE0bXBYL2xNR3ZGMVplcjNVYk9tQmsxK0NaeGQxSmc2L0lCQU1LcGdm?=
 =?utf-8?B?dVRTNjFJUTQ3Q0k0ZnlGZUlaSkFFU2tQOUtncVFlMWZGQ2ZaTDhyQ3R0SlRQ?=
 =?utf-8?B?RTNjd1RIZnZsTEFOVGg1ZUJ1alJxb2tQS1Bub2FxY25LVmpXK01KU0s2VTRm?=
 =?utf-8?B?ZklFMjlZYVVFeFkrc1lQNG1rR2t6S0prb2liNTJaRDMxWXJRcFVLekdXYmhp?=
 =?utf-8?B?T2EvbXZkb2U2eVpFQk1abXk5RWdvMm9XQi9CbzRldmx4U092UkE4d3VwRUpn?=
 =?utf-8?B?cWlFcFVjTnFnNGU4RERPVWRQWEZqOURaRG9kUlV2NW5YV1BJMzMwSFY1UWZw?=
 =?utf-8?B?L01lY1YzRVVXV29LZGYvMVFHZXN0MHlIdkhHR1BzMWphZVFpRUwzM0NERUlh?=
 =?utf-8?B?Qkdtb1pMTXlmZit1WkpYTjRZWEN5N1pXc08rcm5nMkppRGlzbUg3bUozZUYy?=
 =?utf-8?B?M293cHpLRjBleDM4M3JJdThvYVlUVmVzdFZlZHBPdktMV0dxQWVJOFBteksz?=
 =?utf-8?B?dm9wemdQZUZ6SzVJWDNVZk9xQkVmU3F3N1ZqSVhYd05zeXArSE9wbUtqeVhD?=
 =?utf-8?B?ZzIxUTZuVUtENlUxYkN5S2RYUVV0cnpxeUxLWk1qZXdVRHJkc1lDd3BaZUc0?=
 =?utf-8?B?VmQ2QUFDby9EL3VNNSs2ZGgwdmE4WUN1NmNqY1NtVisrODhiajRZTVVXb0t4?=
 =?utf-8?B?clliSFNZQisvQndHOFUwT3ZKNXVZeUZOdEcwbVh3ZU1jWEFwMXdlSDk1aFZo?=
 =?utf-8?B?aXFiSEJzZUxQY005bGwzM1kxMDAwR1ZuaUpCaFNwVWtIOUt6eFRPMkpBb1hu?=
 =?utf-8?B?Lzl5RVZQY0pnN3RGRkxYQXJ0Q3hONldKdUhhQzJUM1FHQU90a3pEU3dYbU9C?=
 =?utf-8?Q?aoFanhmjVkxNkvPC74K5pR0igT4sCViW6V7PMS3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEMvM08vR1R0czZGbEdiRkpoOUZWd2hDNVVKQ3lURjlLa1dIRmNJVSs5L3FZ?=
 =?utf-8?B?R2ptOVJaTVdnaG52NUp6dVJkYXNjaUE5ZDEydGwrMDZsT3VEQ1ZZckdkWERr?=
 =?utf-8?B?SFhDUkRTMTJ6Qm1DQlVwRnhWRkRrTzZsSnN6ZXkrNGswUThhOC9NOGg3eE5Z?=
 =?utf-8?B?QlpVNnBXN3VwMUxGcUM5dWYwR2xnNFdjR3FwMDJLc1FVM2QvQmlDeC9UYjFp?=
 =?utf-8?B?bWFML3NrbTNaTkcyY1pyL05CYllsb2dEYURyOUpZd21uWWNibUdCRHM2eUta?=
 =?utf-8?B?c3VRNEpJNTdFL0xHdUp1UzV2eEtoV25vZXN0QjVwOHpKeTU3OWZBQUNzK3lD?=
 =?utf-8?B?TSt0RW5qV3BDNmo2OW55SlVYUzZibEhJNTd4VFp0Vi9BcGRjUjczcGF4c3oy?=
 =?utf-8?B?dG03NWRodUU4Z3RJVE9PZWNGbW9rWlAvVW9jOW4vRG93TTU2enVrMkNpcW9U?=
 =?utf-8?B?NEowSmk5OWNqYXB6cTcvT1hjZXJpcVAybDF1cTQ3Skx1WE5IajlYWVBWNVFS?=
 =?utf-8?B?VUpRSDJBalEyZm9FMEpvOW5LU2xqMHNlYk1iMStac3lBTkYrQVpJUmt3MUxl?=
 =?utf-8?B?cmRIVGtzWU5IcytTWEE1Z2lQYnZ3eENNZWhXMzFHN0RMelYzdWNQSlNNUElR?=
 =?utf-8?B?cXA4a1ZRUWxlVStVaWk4WkZRWkJncGdIc0I2Ny9UMEhoMEkvakNvTnczekJP?=
 =?utf-8?B?ektITG1aWHB4MUI1eHQ3NHVuVHEvbmFLNlRnOGpwcm11elVwbjFxMFV4aHh4?=
 =?utf-8?B?VCtoSjU3N1NUSzJjdVhST3BYWlNXUWhaaUo0UXNBRzBFdk9DSUwrVzA3d1V3?=
 =?utf-8?B?dFRjTHBlQ3cyS3E5SFJNd3ltUHhhV2E0dTJoZnhPTm5PbFA0ZHoxZjRiVUJB?=
 =?utf-8?B?UzhMaVh6UmJWSzFZdG5XUEVYcUh6TzlPdURKbkN6ejZyZ3E0WTNqdlJ6czJ2?=
 =?utf-8?B?ZVFIUmtQWHhGbXN2R0hmZFhMWC9vSEp3UlRkOE5McFRZNnVuT3EwUFgzbjdo?=
 =?utf-8?B?QWlRbHB5eEFtQXZPdGtQalkrcE1SUWRaL0hEVjgwR05nd1JoQVVkWWRTdFl3?=
 =?utf-8?B?N0d3YXBQNnVISUxtYUsxZUVHd0NHMkh1Q3IrUEs3NHFXWVZLMG5JaWdHeml6?=
 =?utf-8?B?b05KTDhrRGZZSW5Gay9rVVZnN2ZFUzdKUG16UlUvSmF5ZHVwbmFRL2xJc2tE?=
 =?utf-8?B?b200dks3L05MUm9tUk82UVR5OVF3S3RVdWcxVjRFUHRFdTlQV0tyemc2cHVv?=
 =?utf-8?B?eFEzTVRudTZwZ1luM1lMajRkNmt1My8vLzgvZ2VFbmhSU0lTd0hlMUV0enA3?=
 =?utf-8?B?dFRUSFBLRTBaNGd6aVRCMHB0Q2tYQUhTTXhmTDB4WTJoZkJEMEx6Z0d6d3la?=
 =?utf-8?B?SVQ0bDNDTWRJM2JpUzdlcTRKZER2LzdIOWNoMi92RUE0cENteVBYcEZJRmVL?=
 =?utf-8?B?V3prNGs1V0EvbThueUlLRzlUdG1DYVA1UWZLc3F4TlVpSlR4dENpSm9BenV3?=
 =?utf-8?B?Y29pR1JLd1dZTHcrSktLOEsxTk9NSmszTlBrUTNqT3J5b3BYakZQZWtlUC9S?=
 =?utf-8?B?RUUrenpkaHIxejVnMGcrNTRNTzdkaVZuOFRkbk5FTFBEcWZZQTBsVkxrNjhV?=
 =?utf-8?B?NVZhM3JSanRkR0FQS2dZcEFIVFF0Ykh4Zll3a0lEYlo4ZHRhcEo1NGdzczBu?=
 =?utf-8?B?Y0JHdUc5YVM2a1lYd1ArdldDeG1iMEtQMm1pQWRQS2MzQ3Z4RnRraUFPUXh4?=
 =?utf-8?B?VkF6RCtBUzBKQmN2YUJGSjhhN3hQelo1VGlYelFUYWVGYUtKMWtvdGRnUGtr?=
 =?utf-8?B?clhvNGdYcTRyUUZqdExaNU5VQk9jTjZndDQ4K3U0RnV1ZUdtb1htYVJMd1Ru?=
 =?utf-8?B?Qko4bCtLWXh5cXlPM29rZnp5OUtVU0xveHExaUVrSDJSY2l1czRzRVorTlpa?=
 =?utf-8?B?eUtSUHJZYlpmLzVxVTdjNXk5d1BjdEhibmVFVjZZcDdvY1VFdW5FajBvcnNK?=
 =?utf-8?B?UnhNZWxXdEdqTG9Tb2VtbkRLQmVSdkovcGdibzJYckw5QUNGR0p6VUN2T2Vi?=
 =?utf-8?B?OXB5RHdSZEZidVNqZENGYjJiMDVyYWJjY2NxQWRnT0JMN1hvWjd5ZERxdjk0?=
 =?utf-8?B?N0FlbWtyRlhrb2IydWlLUkJrUWpTQmY5bmNaOHAveVEzWEs4VzdUUjdFUmhB?=
 =?utf-8?Q?neQzyrYW+HnwCVAP9ERZ/zw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c952a6-4297-4b57-bc52-08dcfeb1efd6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 22:25:36.8460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1q4Nqe+LNWc6I3MR8vxz3zDMvE+6E56G0Lw/f4FrgGGK9GY9tUG/8M8pIvYR5pyFa1HWXzUIfb3ZQNCz/ne3Z9yXrhM00GlJN9U3PnCPBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8178
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

<snip>

>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 6dd76f77b504..56f105797ae6 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1381,6 +1381,15 @@ struct xe_vm *xe_vm_create(struct xe_device 
>> *xe, u32 flags)
>>       struct xe_tile *tile;
>>       u8 id;
>>   +    /*
>> +     * All GSC VMs are owned by the kernel and can also only be used on
>> +     * the GSCCS. We don't want a kernel-owned VM to put the device in
>> +     * either fault or not fault mode, so we need to exclude the GSC 
>> VMs
>> +     * from that count; this is only safe if we ensure that all GSC 
>> VMs are
>> +     * non-faulting.
>> +     */
>> +    xe_assert(xe, !((flags & XE_VM_FLAG_GSC) && (flags & 
>> XE_VM_FLAG_FAULT_MODE)));
>> +
>>       vm = kzalloc(sizeof(*vm), GFP_KERNEL);
>>       if (!vm)
>>           return ERR_PTR(-ENOMEM);
>> @@ -1391,7 +1400,21 @@ struct xe_vm *xe_vm_create(struct xe_device 
>> *xe, u32 flags)
>>         vm->flags = flags;
>>   -    init_rwsem(&vm->lock);
>> +    /**
>> +     * GSC VMs are kernel-owned, only used for PXP ops and can be
>> +     * manipulated under the PXP mutex. However, the PXP mutex can 
>> be taken
> Is that 'can be (but don't have to be) manipulated' or 'can only be 
> manipulated'?

The first one, will reword.

>
>> +     * under a user-VM lock when the PXP session is started at 
>> exec_queue
>> +     * creation time. Those are different VMs and therefore there is 
>> no risk
>> +     * of deadlock, but we need to tell lockdep that this is the 
>> case or it
>> +     * will print a warning.
>> +     */
>> +    if (flags & XE_VM_FLAG_GSC) {
>> +        static struct lock_class_key gsc_vm_key;
>> +
>> +        __init_rwsem(&vm->lock, "gsc_vm", &gsc_vm_key);
>> +    } else {
>> +        init_rwsem(&vm->lock);
>> +    }
>>       mutex_init(&vm->snap_mutex);
>>         INIT_LIST_HEAD(&vm->rebind_list);
>> @@ -1510,7 +1533,7 @@ struct xe_vm *xe_vm_create(struct xe_device 
>> *xe, u32 flags)
>>       mutex_lock(&xe->usm.lock);
>>       if (flags & XE_VM_FLAG_FAULT_MODE)
>>           xe->usm.num_vm_in_fault_mode++;
>> -    else if (!(flags & XE_VM_FLAG_MIGRATION))
>> +    else if (!(flags & (XE_VM_FLAG_MIGRATION | XE_VM_FLAG_GSC)))
>>           xe->usm.num_vm_in_non_fault_mode++;
>>       mutex_unlock(&xe->usm.lock);
>>   @@ -2694,11 +2717,10 @@ static void vm_bind_ioctl_ops_fini(struct 
>> xe_vm *vm, struct xe_vma_ops *vops,
>>       for (i = 0; i < vops->num_syncs; i++)
>>           xe_sync_entry_signal(vops->syncs + i, fence);
>>       xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
>> -    dma_fence_put(fence);
>>   }
>>   -static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>> -                     struct xe_vma_ops *vops)
>> +static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>> +                           struct xe_vma_ops *vops)
> Rather than changing the internals, is it not possible to just call 
> xe_exec_queue_last_fence_get() after vm_bind_ioctl_ops_execute has 
> returned?

If you have multiple bind ops, the last fence can be overwritten, so we 
might end up waiting for a different (newer) allocation.

>
>>   {
>>       struct drm_exec exec;
>>       struct dma_fence *fence;
>> @@ -2711,21 +2733,21 @@ static int vm_bind_ioctl_ops_execute(struct 
>> xe_vm *vm,
>>       drm_exec_until_all_locked(&exec) {
>>           err = vm_bind_ioctl_ops_lock_and_prep(&exec, vm, vops);
>>           drm_exec_retry_on_contention(&exec);
>> -        if (err)
>> +        if (err) {
>> +            fence = ERR_PTR(err);
>>               goto unlock;
>> +        }
>>             fence = ops_execute(vm, vops);
>> -        if (IS_ERR(fence)) {
>> -            err = PTR_ERR(fence);
>> +        if (IS_ERR(fence))
>>               goto unlock;
>> -        }
>>             vm_bind_ioctl_ops_fini(vm, vops, fence);
>>       }
>>     unlock:
>>       drm_exec_fini(&exec);
>> -    return err;
>> +    return fence;
>>   }
>>     #define SUPPORTED_FLAGS_STUB  \
>> @@ -2946,6 +2968,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, 
>> void *data, struct drm_file *file)
>>       struct xe_sync_entry *syncs = NULL;
>>       struct drm_xe_vm_bind_op *bind_ops;
>>       struct xe_vma_ops vops;
>> +    struct dma_fence *fence;
>>       int err;
>>       int i;
>>   @@ -3108,7 +3131,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, 
>> void *data, struct drm_file *file)
>>       if (err)
>>           goto unwind_ops;
>>   -    err = vm_bind_ioctl_ops_execute(vm, &vops);
>> +    fence = vm_bind_ioctl_ops_execute(vm, &vops);
>> +    if (IS_ERR(fence))
>> +        err = PTR_ERR(fence);
>> +    else
>> +        dma_fence_put(fence);
> There isn't a new fence get in vm_bind_ioctl_ops_execute(). The change 
> in return value is the only difference in behaviour. So why is an 
> extra put required?

I've removed a dma_fence_put from vm_bind_ioctl_ops_fini (which is 
called from ops_execute), so this is not extra.

>
>>     unwind_ops:
>>       if (err && err != -ENODATA)
>> @@ -3142,6 +3169,81 @@ int xe_vm_bind_ioctl(struct drm_device *dev, 
>> void *data, struct drm_file *file)
>>       return err;
>>   }
>>   +/**
>> + * xe_vm_bind_bo - bind a kernel BO to a VM
>> + * @vm: VM to bind the BO to
>> + * @bo: BO to bind
>> + * @q: exec queue to use for the bind (optional)
>> + * @addr: address at which to bind the BO
>> + * @cache_lvl: PAT cache level to use
>> + *
>> + * Execute a VM bind map operation on a kernel-owned BO to bind it 
>> into a
>> + * kernel-owned VM.
>> + *
>> + * Returns a dma_fence to track the binding completion if the job to 
>> do so was
>> + * successfully submitted, an error pointer otherwise.
>> + */
>> +struct dma_fence *xe_vm_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
>> +                struct xe_exec_queue *q, u64 addr,
>> +                enum xe_cache_level cache_lvl)
> Should this have '_kernel_' in the name given the description of 
> kernel-owned BO to kernel-owned VM?

will rename.

Daniele

>
> John.
>
>> +{
>> +    struct xe_vma_ops vops;
>> +    struct drm_gpuva_ops *ops = NULL;
>> +    struct dma_fence *fence;
>> +    int err;
>> +
>> +    xe_bo_get(bo);
>> +    xe_vm_get(vm);
>> +    if (q)
>> +        xe_exec_queue_get(q);
>> +
>> +    down_write(&vm->lock);
>> +
>> +    xe_vma_ops_init(&vops, vm, q, NULL, 0);
>> +
>> +    ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,
>> +                       DRM_XE_VM_BIND_OP_MAP, 0, 0,
>> +                       vm->xe->pat.idx[cache_lvl]);
>> +    if (IS_ERR(ops)) {
>> +        err = PTR_ERR(ops);
>> +        goto release_vm_lock;
>> +    }
>> +
>> +    err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
>> +    if (err)
>> +        goto release_vm_lock;
>> +
>> +    xe_assert(vm->xe, !list_empty(&vops.list));
>> +
>> +    err = xe_vma_ops_alloc(&vops, false);
>> +    if (err)
>> +        goto unwind_ops;
>> +
>> +    fence = vm_bind_ioctl_ops_execute(vm, &vops);
>> +    if (IS_ERR(fence))
>> +        err = PTR_ERR(fence);
>> +
>> +unwind_ops:
>> +    if (err && err != -ENODATA)
>> +        vm_bind_ioctl_ops_unwind(vm, &ops, 1);
>> +
>> +    xe_vma_ops_fini(&vops);
>> +    drm_gpuva_ops_free(&vm->gpuvm, ops);
>> +
>> +release_vm_lock:
>> +    up_write(&vm->lock);
>> +
>> +    if (q)
>> +        xe_exec_queue_put(q);
>> +    xe_vm_put(vm);
>> +    xe_bo_put(bo);
>> +
>> +    if (err)
>> +        fence = ERR_PTR(err);
>> +
>> +    return fence;
>> +}
>> +
>>   /**
>>    * xe_vm_lock() - Lock the vm's dma_resv object
>>    * @vm: The struct xe_vm whose lock is to be locked
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index c864dba35e1d..bfc19e8113c3 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -19,6 +19,8 @@ struct drm_file;
>>   struct ttm_buffer_object;
>>   struct ttm_validate_buffer;
>>   +struct dma_fence;
>> +
>>   struct xe_exec_queue;
>>   struct xe_file;
>>   struct xe_sync_entry;
>> @@ -248,6 +250,10 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct 
>> xe_vma *vma);
>>   int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
>>                 unsigned int num_fences);
>>   +struct dma_fence *xe_vm_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
>> +                struct xe_exec_queue *q, u64 addr,
>> +                enum xe_cache_level cache_lvl);
>> +
>>   /**
>>    * xe_vm_resv() - Return's the vm's reservation object
>>    * @vm: The vm
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h 
>> b/drivers/gpu/drm/xe/xe_vm_types.h
>> index 7f9a303e51d8..52467b9b5348 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -164,6 +164,7 @@ struct xe_vm {
>>   #define XE_VM_FLAG_BANNED        BIT(5)
>>   #define XE_VM_FLAG_TILE_ID(flags)    FIELD_GET(GENMASK(7, 6), flags)
>>   #define XE_VM_FLAG_SET_TILE_ID(tile)    FIELD_PREP(GENMASK(7, 6), 
>> (tile)->id)
>> +#define XE_VM_FLAG_GSC            BIT(8)
>>       unsigned long flags;
>>         /** @composite_fence_ctx: context composite fence */

