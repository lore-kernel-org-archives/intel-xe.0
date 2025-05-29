Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0008C3ABB2
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 03:04:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A975910E1C6;
	Thu, 29 May 2025 03:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g0P2lX3q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C6F10E1C6
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 03:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748487882; x=1780023882;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xa0A1czwAXOl0KcxQFvDkoIk6AV2B29QaQ/siSoRQZA=;
 b=g0P2lX3qwZDVW95SiTk0egbkJr/9LoI4TJxmtjQI1a1Ml86pYPGtenPR
 WaAKBnL4nB1oqxG4EBGEPYuFsERVb+OUvC0PGbTjEDIdpW41lobvE+5y+
 v6Sta1sglCOTURa6nrI9qC3bQgI9YmDkksGRqz4UcuCyMch9zAstcqpKU
 7FpyDTCoDvBOIsmEmePUGgLx8Q73D6ndrC5l+StnPJrdGq/JCb/17hTRf
 6MHtoDkDo9lZOeokK/1JTPqsbzokAOK28jk/say/KjkAY51cKgtL+tgl7
 YzjEkxfsYpTvU28U9Sn4a08ve8wK1dd1SvMLqrHTdwZn/hAesugt1UsBd g==;
X-CSE-ConnectionGUID: QpLYQV3wT+uNAuvQFBcPqA==
X-CSE-MsgGUID: g+qH6TcpSCOt6ZBzs0Lqgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61889312"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="61889312"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP; 28 May 2025 20:04:34 -0700
X-CSE-ConnectionGUID: ofVWWZyvTmKsM3x7DfiVFA==
X-CSE-MsgGUID: aAaqtjaeSPOwIFso/M2PMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143414159"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 20:03:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 20:03:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 20:03:47 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.58) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 20:03:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2VoqVZkUNueYUp7qLYyAFVvcOmq2dXz72OpRmx/nYKxo/HszrstXX6i+8xAO13ftFyAufHmjw70PVkQMYi95zP/AIZqTW9kGNXArvqy0l2I1qlg+WDciQTMQAY/XxW/rD1noNNZPHnYMf1gtedxhsECkjbCrtRgJBcPRonNJoVCkixEoLUkxso4zG7TBMdetAYt881Tle31LlEPMKKPKH7UTdunH2XJ8vhIyM/4rIBWmM4csgoWsonPzkQ4sCVMt+TOoN12/xTfxRavimmjp9VHJX4zGhxhfinzVN8iLYd7PcGDacPxlF+HHdN5IUI6uwec9nV/PgTmRiJ3567mYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Lv4cPdS8LPa/iQPEfVvz8XF32FUqTvInTzQETrJQGU=;
 b=TbnOSlta/k2t4TWa7Snc9B9GpERF8RyzB923jnI6BcBa+6ocyhuL8yG6WZ5hGm/ZoW1a9I6LXkwrGtcYhwgn0+wKJQay9LN/ESzCY1XF/vmsmyg1n2yzCaV/YwglUKnOmFetd4vLJS3KO+z+ovnfxYuStSyiOeQKRkMnfkbsBUQei2nhdte43lpm0EHOE09IwgfZ838xjhTXqLG/qT2mwSVTyogxGBoSnhGjPFXJg8g+R6DSv9LwpZ3tC3QO50QkUIRtCn0gQG/TpTAoEPc4go3maQMqA9JmgBvsvxTuNMTf7YGHODS7hET+GVCDXrBWtchi/hRfdVVso51lq0Ob1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22)
 by DS4PPF00BBED10C.namprd11.prod.outlook.com (2603:10b6:f:fc02::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Thu, 29 May
 2025 03:03:45 +0000
Received: from SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674]) by SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674%7]) with mapi id 15.20.8722.024; Thu, 29 May 2025
 03:03:45 +0000
Message-ID: <1d9199e9-bcaf-4755-9ce6-d9b6bfec2bc0@intel.com>
Date: Thu, 29 May 2025 08:33:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/19] drm/xe/bo: Update atomic_access attribute on
 madvise
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-20-himal.prasad.ghimiray@intel.com>
 <aDegZWGbMc1pNw5V@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aDegZWGbMc1pNw5V@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::25) To SA1PR11MB7038.namprd11.prod.outlook.com
 (2603:10b6:806:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7038:EE_|DS4PPF00BBED10C:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d4e389-b4c7-4497-cab7-08dd9e5d6cfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T29Gbmo0V0RqcFczUVNLWTVSRDZiM3M5aUlVZmtzUVVJTUlvQ2ZUb3RKT2dK?=
 =?utf-8?B?RmxISm1EUVZsdCt2N3UyUTZNWnRieURwMS8wSEc5c1M1N3NhMWRTMWtwWTlZ?=
 =?utf-8?B?UFZUZHlkcGlPcHhyMy92L2srQ055RmdnQllMTEltWUFoc1BpLyt0SGJUYVNs?=
 =?utf-8?B?b0I0RGwyQWExTjREcU43U05NQmpFWlJRbFZabHBLa0N5U3ZucHIvc2NFOVY5?=
 =?utf-8?B?V2g4ejNxMlM4QnBhSUU5MzNWbDNNUmFPSWF4ZStFckdScmlKajR0dmJuaTJq?=
 =?utf-8?B?TGdBWEJ6Lys1WGxnaTBLMDgxTE1rSHJ1dXZQaDI0ajlEZE54RzRSMW1ONSt3?=
 =?utf-8?B?SjJKVWdwd2VZUFpmRWU0Tk9INWpIRElyb3Vqa0owYzNhN1VzVTJpdFREMkpw?=
 =?utf-8?B?aDJDajVZWUdLMDFaQXlDNHV4Ujl5bmtqQmlyMEVvSHNRQVZOQVQwNDdncjJN?=
 =?utf-8?B?bndUeElaNnNzRE4ycUMxWlpsT1o3VWF2bzlub2pNWk5Vei9QT0VGR1N2eU9O?=
 =?utf-8?B?TDNlbGhobmJTMU5hQXhTSFgxeElYaWJjVVd3Q2RLMitxb2loa0pHUkZMZ2pB?=
 =?utf-8?B?ZTF2cThwWXh1eWFKK2Z2MnVyRUpxSFlIeTlvZjZJM0RoSFhRaW5sQnNnbUIr?=
 =?utf-8?B?bERMa3JOeTJzQTZHcWcvWjExUVNITys1WWxoQlB4Q2c4ZFBVOHVYVEQzanB6?=
 =?utf-8?B?ejlnVGRsRXBreElUVy8rTTZnclR1eTFtc0NBb2ZNeGtpSnBZTFNKVjFIMEg1?=
 =?utf-8?B?bkRqSXZwZGNBdHhqaUswVnZGbmMxMmlUTFV0b2s2Q3cxSmg0c0txY3NyQTRj?=
 =?utf-8?B?NVF0NGFmZG0wc3JPcUlDcnQ0MFpuTEtTblhjSnNqYUxwRitzTG9QRjJvUWFK?=
 =?utf-8?B?b0RaZGpiWXBTa3hKaERZZlEyL2F3TjlZRGk5dzVFNlFnOTJ6aDExSmpjRUVQ?=
 =?utf-8?B?OUFpMEl6OGxDUEpqZ0dMTW1Ud3ZUc2dZU0tzaHRtYWsrNUNkK0VBckhaUXJ4?=
 =?utf-8?B?THVLRVVGVmxzSDJEV2Q5QVZ6S2FJbXJXZW5WeVRjSVoyMU9XS2VZbnFhVVM0?=
 =?utf-8?B?NWkwZVQ5ME9IVVJWdGxCZGZnS1p4NDJSSE1veUc5dWZwbG9HcnAvTU1jdjln?=
 =?utf-8?B?MDM1UzlNUjRYencxSFdYdWFQSWgxS1d0czJzNDIrRXdtN2lKTm94SEtBRHl2?=
 =?utf-8?B?ODRVSDFBQlVDRFJZajd5NGtrWGNma1FmRTVUMkVrTlp5U1BFcDA1T0I5RWIv?=
 =?utf-8?B?ZDBFdDdWNG56aFVNRm1UcWpNdEgraGtuUDFsQkJobVhBQU1QTnhxbEozWGdC?=
 =?utf-8?B?UEdkbEl6WHRXKzFvZjFHeGRFSXZqcytLRFNQYWt1UXNHcUprTDloQ1MwQ2VC?=
 =?utf-8?B?cWRLcU9RT0JEUldDcHlWYzFDMC9CUWw3eUJ4cjZwS0pMZW9QRmZ4OGlOOWRZ?=
 =?utf-8?B?ZXg4bjZvUmUrSC83UjVPTml3dE5tcGd5OENaNkV0MDRuREFXWnZ6d3Z6VElW?=
 =?utf-8?B?SEFNR3FndWJXTzNldldtd3dhYXJjQTZ4cytXNzVpZkdwZ00xZVJicSt5aW9N?=
 =?utf-8?B?SlhQcUREVEMyK0dld2d0bldxejllWTROZCs2dityY0I0SmJDWExqR1lnNUh5?=
 =?utf-8?B?aUtnSmRyMzBqZjFUcXZ2eU9keGN2ZkVEV256TDFuVGFlcWRHRmVJQi9ZTlFx?=
 =?utf-8?B?ei83K3R5cC9naklJakRwT0wrK1dtL25ZNFNUWTBGVDdMSUVFbjJLeWxnQmZL?=
 =?utf-8?B?WE51Q1ZjVFpML2hwNDNQOW4xWTRaNVZSQ1JpQzJzVHJzeTlpUjE4N21lSXhW?=
 =?utf-8?B?djJHZzgvTS9UcVp5OGdJcHQ1ZmswYjJRdWJ3S2ZoWkl6REwrbzNXenNjMTJY?=
 =?utf-8?B?a1J4NWM1Tm9wV0tvdW8zWkRldGRzQ1Q5Q0RzS3FaSlVjTEVwcEIzb05ic0ln?=
 =?utf-8?Q?SYWrw403lgg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7038.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUUyU1d0QlBIMERhNGl6NEUyRkQvRmZNSWpxMTJBM2tmenVnVlVZemxHdTFY?=
 =?utf-8?B?QmFiYnZHbmpuNkxkV1FqU3YxNXhkQ2IwWEE1WGRCR0VDb0wxcm43R29OY29a?=
 =?utf-8?B?VGppL1JYdFh2ZW90YWprRWZXaE1BdFJBSUlVdlRXS1krVDYwRXU3MElMYTZR?=
 =?utf-8?B?Q2FoYWI1OVcrUERqajRzQTQzSFQyOWFaTUQ5NjV6T1BtSi9KZXZGOEtFV1Nr?=
 =?utf-8?B?V3dSQ3FkbjduUDdLUG4xV3UvOWJKQXhaUnRacUh4dHZFYUpGT3R2MHlERi9h?=
 =?utf-8?B?a1p1Y0JYNm5tL0Q0VEJ0TFMwWHVrRkxzUUtVNFRNWFhNTFdlYSttTFN0SlhH?=
 =?utf-8?B?ZUM4cDVrVHM2T0F5c0Rkblh5amhBZmc4bk1HWFBYb1NlZU8xbUtxd3YwcUd1?=
 =?utf-8?B?TVByOXh3NDJvRXFCTHhySE9obmZ3Mm1qK2piQXoySVdSd3BCOWwzWk1SZ3Q4?=
 =?utf-8?B?SmtzV1M3RE1yMThkSXdUOFlVc0ZzVk9oSzNtWEVUalY0TzVERTYrTG5WS0tZ?=
 =?utf-8?B?L3FQV1JudmZjU0hDYWdLSHBCUXlPRStBQ01nOTlDeWhKYXBkQkMxdXlzd005?=
 =?utf-8?B?anF6bmdqZ242MU5HV0RCSnNVWHcwampRQXlVYkxkK2hoS1o3c3EvNFp0dElJ?=
 =?utf-8?B?NjhmTUk4SVVYMzdxZG5ZdlNEZnJZc0t4enM1N2JuNTFTL2dhaXFGREFVa09N?=
 =?utf-8?B?ckRVWlcyRnovcHFHS3h5YU9Uc1Nya20rQ1ptOTJGR1RyYjY0Tmg1aytCeGVZ?=
 =?utf-8?B?ZXBkUnBGWUJOSWdHN0ZyM3FPZDVlUjFzU1RTUFNFdzluRGdnUFRtUkRtTzlR?=
 =?utf-8?B?SmlrcFk5S3pSejZMVmpkUXVuSU9HeWtaNGxaRWtuYlJnNEsvSnUzNmtxbStT?=
 =?utf-8?B?WjdmYXR1UmRUUFNhZmhmSXE3MkxjQjMzTUl4M2QzcDRqZzJuSnQzbTRaV2Nn?=
 =?utf-8?B?T3pwOEJhcTFOb0I2dE9nWEJvRHA2Ym13YkZlU0I2S2hubGFuem1Cd3hzWTJM?=
 =?utf-8?B?SHBoWHU1eVd3NlVTaFVTTTNYK3ZldmZheWRWNFZmREpZTVk3V0pqTktWSEMr?=
 =?utf-8?B?WTdHNFpaVkdJdkZKOFo1WGI1NjMzWk9aN0p1TkNIZENTaC8yRExDaXM1ck9q?=
 =?utf-8?B?QldoYmZ2QXFLUGlSYzhsWXNRaStvS05zbVI4bTFrUWZKSS9mSWRoNG94ZFEz?=
 =?utf-8?B?WEUyaVFhdXJUT3o4RFR3NUJPdk5SaDlDbzlGeEFMaUFISXhQQzZEaTFCajhn?=
 =?utf-8?B?TVdRcU5yRVVjVzJFUWIvZE83a0FVRk5iUVdsNzJXM1IwSVlJREk1Ym5TdXo3?=
 =?utf-8?B?anY5YlVEMjBNTkpNZWlteUJpeWtWcXVNU1h0YWZZdUQ3bG4reXROaXhYOTR1?=
 =?utf-8?B?dUVRR0I1UXR1eVRSaktPZjhiZXdNM21rWlhFbkV0OVNOOUU5VFh0MUhOZDNQ?=
 =?utf-8?B?WFZ1L3hpa0I4NDk2UjZJSUV5cUsvaHhGTllTOXZGZWhBYkwrRlZmV0lYVnU4?=
 =?utf-8?B?TmNUWnA4eDVBTzlFckhMY3BzRnZ6RFhadXpnS2g0Tk94MzVOaC82aldEamVj?=
 =?utf-8?B?WU9scHFzZEczVmxhZW1BRDdKNHZ4Zm8yUytPNG4rdUhPVnd3T2JVd2NTckFl?=
 =?utf-8?B?Zk40alFmb3VqcmNEQVV0NHRsbXUxdmtWK0dyQ2cvYjNiYUliQ2pmUTJnUzdh?=
 =?utf-8?B?bWE2R05VZ2VDRjV2cGFBcXVSeTZ4NWljbzQ3VTg3UnphMFdrQk9EeW9oU0RI?=
 =?utf-8?B?aVF1akpESmZCKzBSa0hzSDVkVDZsSzI3am1EeUE2TzBsWng5REkrR21BZEc3?=
 =?utf-8?B?ZWZLd1lSSUhmK0szd0pqNGFjOWdQMEM2c09FT3hmMWZENDlCUzhzeEJEY2t3?=
 =?utf-8?B?dEt0QnBlWmNvdUE4eXkyeEwxdjJ1Z3Z0VXNUTkFRMEIxUmV0QTNaR0dySU52?=
 =?utf-8?B?UTZQUmx0OU1TSUt0MUZoYlEyNWtwdEV6eFVaS2lwU0UxY21tRVIxV254Y0F3?=
 =?utf-8?B?QW5xa3IwT2VCVGZhdXBRSlhSd1NzdVZoTExXV05jZklkalZYemN5bXNqdHdl?=
 =?utf-8?B?US8vN0VVS2xnRDljMWk3VlhPZ25ENUd0TlhqV2VQV0ZwS0RvYmtOZUdJcUFI?=
 =?utf-8?B?U0t4UzQ5NGpQUnJsZHBUSHBVQnlTTXk4UWNZbVJPcUVBdzNZUXFZclRzWFNY?=
 =?utf-8?Q?F8js4vDiEgvbVxfGBb8T2z4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d4e389-b4c7-4497-cab7-08dd9e5d6cfa
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7038.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 03:03:45.7424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ii9WJL45xXXK2HrkbUOkSD9DtrTmpw2a6Hy7Z2Ht9eDesf9k7QK7noAJXw8wxXdm34OiuXi3eV1JeqiLnJ1ebpZEoN4uKA6tMQOyl9fysFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF00BBED10C
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



On 29-05-2025 05:16, Matthew Brost wrote:
> On Tue, May 27, 2025 at 10:10:03PM +0530, Himal Prasad Ghimiray wrote:
>> Update the bo_atomic_access based on user-provided input and determine
>> the migration to smem during a CPU fault
>>
>> v2 (Matthew Brost)
>> - Avoid cpu unmapping if bo is already in smem
>> - check atomics on smem too for ioctl
>> - Add comments
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c         | 21 ++++++++++++--
>>   drivers/gpu/drm/xe/xe_vm.c         | 11 ++++++--
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 45 ++++++++++++++++++++++++++++--
>>   3 files changed, 69 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index d99d91fe8aa9..9072e8ae3f3e 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -1662,6 +1662,12 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
>>   	}
>>   }
>>   
>> +static bool should_migrate_to_smem(struct xe_bo *bo)
>> +{
> 
> xe_bo_assert_held, more on that in reply to previous patch.

Sure

> 
>> +	return bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL ||
>> +	       bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU;
>> +}
>> +
> 
> Hmm, this is tricky. I guess this means sharded atomics on BOs do not
> just work whereas for SVM they do (i.e., DRM_XE_VMA_ATOMIC_UNDEFINED
> means atomics do not work for BOs but for SVM they do). I suppose this
> is the current behavior. I think this will need to be document in the
> uAPI kernel doc.

Makes sense

> 
>>   static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>>   {
>>   	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
>> @@ -1670,7 +1676,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>>   	struct xe_bo *bo = ttm_to_xe_bo(tbo);
>>   	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
>>   	vm_fault_t ret;
>> -	int idx;
>> +	int idx, r = 0;
>>   
>>   	if (needs_rpm)
>>   		xe_pm_runtime_get(xe);
>> @@ -1682,8 +1688,17 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>>   	if (drm_dev_enter(ddev, &idx)) {
>>   		trace_xe_bo_cpu_fault(bo);
>>   
>> -		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
>> -					       TTM_BO_VM_NUM_PREFAULT);
>> +		if (should_migrate_to_smem(bo)) {
>> +			r = xe_bo_migrate(bo, XE_PL_TT);
>> +			if (r == -EBUSY || r == -ERESTARTSYS || r == -EINTR)
>> +				ret = VM_FAULT_NOPAGE;
>> +			else if (r)
>> +				ret = VM_FAULT_SIGBUS;
>> +		}
>> +		if (!ret)
>> +			ret = ttm_bo_vm_fault_reserved(vmf,
>> +						       vmf->vma->vm_page_prot,
>> +						       TTM_BO_VM_NUM_PREFAULT);
>>   		drm_dev_exit(idx);
>>   	} else {
>>   		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 9611d7ca2bed..1bdf85c12374 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3116,9 +3116,16 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   		err = vma_lock_and_validate(exec,
>>   					    gpuva_to_vma(op->base.prefetch.va),
>>   					    false);
>> -		if (!err && !xe_vma_has_no_bo(vma))
>> -			err = xe_bo_migrate(xe_vma_bo(vma),
>> +		if (!err && !xe_vma_has_no_bo(vma)) {
>> +			struct xe_bo *bo = xe_vma_bo(vma);
>> +
>> +			if (region == 0 && !vm->xe->info.has_device_atomics_on_smem &&
>> +			    bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE)
>> +				region = 1;
> 
> I wonder if it better to just leave region as is and let the next atomic
> fault trigger the migration.

Ok. lets do it that way.

> 
>> +
>> +			err = xe_bo_migrate(bo,
>>   					    region_to_mem_type[region]);
>> +		}
>>   		break;
>>   	}
>>   	default:
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index 0f0b94cb43f2..e048eb48826c 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -82,15 +82,54 @@ static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>>   			  struct xe_vma **vmas, int num_vmas,
>>   			  struct drm_xe_madvise_ops ops)
>>   {
>> -	int i;
>> +	struct xe_bo *bo;
>> +	int err, i;
>>   
>>   	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_ATOMIC);
>>   	xe_assert(vm->xe, ops.atomic.val > DRM_XE_VMA_ATOMIC_UNDEFINED &&
>>   		  ops.atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
>>   
> 
> Do you sanitize ops.atomic.val prior to this? Also do we disallow a user
> setting DRM_XE_VMA_ATOMIC_UNDEFINED? If not, then this needs to be >=
> DRM_XE_VMA_ATOMIC_UNDEFINED.
Agreed it should be  >= DRM_XE_VMA_ATOMIC_UNDEFINED. And instead of 
assertion will sanitize it here only.

> 
>> -	for (i = 0; i < num_vmas; i++)
>> +	for (i = 0; i < num_vmas; i++) {
>>   		vmas[i]->attr.atomic_access = ops.atomic.val;
>> -	/*TODO: handle bo backed vmas */
>> +
>> +		bo = xe_vma_bo(vmas[i]);
>> +		if (!bo)
>> +			continue;
>> +
>> +		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_CPU &&
>> +				 !(bo->flags & XE_BO_FLAG_SYSTEM)))
>> +			return -EINVAL;
>> +
> 
> Note when we fail here (or anywhere else in madvise), we could be in a
> state where madvise has partially completed. I think that is actually ok
> as nothing in madvise is fatal as we are just changing attributes. But I
> think we need to document this in the uAPI kernel doc that if madvise
> fails, the state of madvise attributes are undefined.

Will add in kernel-doc of uAPI.

> 
> In practice this really should never fail unless a user is giving bad
> input or extreme memory pressure and kmalloc fails.
> 
> Matt
> 
>> +		/* NOTE: The following atomic checks are platform-specific. For example,
>> +		 * if a device supports CXL atomics, these may not be necessary or
>> +		 * may behave differently.
>> +		 */
>> +		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_DEVICE &&
>> +				 !(bo->flags & XE_BO_FLAG_VRAM0) &&
>> +				 !(bo->flags & XE_BO_FLAG_VRAM1) &&
>> +				 !(bo->flags & XE_BO_FLAG_SYSTEM &&
>> +				   xe->info.has_device_atomics_on_smem)))
>> +			return -EINVAL;
>> +
>> +		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_GLOBAL &&
>> +				 (!(bo->flags & XE_BO_FLAG_SYSTEM) ||
>> +				  (!(bo->flags & XE_BO_FLAG_VRAM0) &&
>> +				   !(bo->flags & XE_BO_FLAG_VRAM1)))))
>> +			return -EINVAL;
>> +
>> +		err = xe_bo_lock(bo, true);
>> +		if (err)
>> +			return err;
>> +		bo->attr.atomic_access = ops.atomic.val;
>> +
>> +		/* Invalidate cpu page table, so bo can migrate to smem in next access */
>> +		if (xe_bo_is_vram(bo) &&
>> +		    (bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU ||
>> +		     bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL))
>> +			ttm_bo_unmap_virtual(&bo->ttm);
>> +
>> +		xe_bo_unlock(bo);
>> +	}
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.34.1
>>

