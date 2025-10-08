Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2447CAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 20:37:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C2410E886;
	Wed,  8 Oct 2025 20:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IjE3qx+5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0413F10E895
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 20:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759955819; x=1791491819;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mleUa7IqZHFwogYTuL2d1c6oXzZ5mYKV2DmuX1H5Few=;
 b=IjE3qx+52j8RwwSLCazyRKxjN9E0uWqDx3ADpFutIproTmMseuXZOwuR
 pAgylUzcQwoppEsn9+ynvrxFcsMgdj0qtU5Afyt2B2gq99L7fPNxx3pXg
 NqqjroqH+Ci38i8KyPZj7TAnHdjDBCliC00tdqRQnYAGgeGzV7EKBLmJf
 G3qcs+ivp5PVcUgBIfjn3E1TU8NeAIkjNwMpDDkolW8Qkl3mgmhBlgGEw
 EK2H1vfdLwZ51r82V6v9XCiXz14KNTNO4CHSylYPGn1k+2rcLDMDm2Zva
 ixM3troeFIQ0oUJbJPwVmjSV4pmeZ9ZWqYoyJXBKkBc0OEfirPF9J/DTy w==;
X-CSE-ConnectionGUID: WyyiuVr6TR2MuGMcwIonRA==
X-CSE-MsgGUID: yCwPYx5WTp6crJVzouu3Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="64777779"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="64777779"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 13:36:58 -0700
X-CSE-ConnectionGUID: bnH2CcduTQKm2eNnZNni/A==
X-CSE-MsgGUID: EiqzktjZRoW2xnGcyIfEzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="180472442"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 13:36:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 13:36:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 13:36:58 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 13:36:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdrAq8ohrHkiAItDJhJtMVLF6idzKbnIGX6tevqFDDCr0xIB+rta2+PQ3ijmw2/m8MeZPxjqqkJ/r7GNh+Kjt5XdIMny5+kVFUybNV0aivNntAIi7XZaQjb1/DaAAqRrMYRlAIIeMO5FWXz7LdP9nHeBLb3PLeqqvl1PWegVWFToWHShzXOUC538EbGOTvzX/jZ7ddi6uxgX7BwdzsD6e+8oILPwiabvcAH1C6Xlo6kU1Nw7R1FGSrBzeoiAwS8e9a0lcW8ir/kPP7aS7hjz0VZwYsRzAKkBCkiT0Gr+V5ap1tTzJX744diioyYU1eJ0HHM+evHpgwH881jN+UtKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbGwPTugcDIn3FFH8MVWIJnIaA4VTwzmTCqAr5lPDkQ=;
 b=YFnf+yMRiHosRctNBtLuK17UlYtTYif5N3cUhiMuF03WtYVVGM6Xv5iHc5CIsGK31yV9XBlLNZxLOkQhXe8tWINxXGWXHkw2tHUe9X67Idu9rq1qK0xzZoHPayFSTAYvy6Z4lL7i+qWSZ5z8C28jYBUi0/B6NcfRgSwvqc1Q91qEpL21xPSvVNADE3cOGG2rED58L4bxMHddI/Ax4l4/I22m/u53Y/m/v2zEfESccmaL3PJVigBiyeov3eCOsyKpUrF9993YqECHk1tnQMfpCV1veGCOLZHa+1qkjNWNa+4pCvqnbbvFm0txHMIk9XF4TOLYUCDYS50N9kZykCDEkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH3PPF6CF64E2E6.namprd11.prod.outlook.com (2603:10b6:518:1::d2b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Wed, 8 Oct
 2025 20:36:51 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 20:36:51 +0000
Message-ID: <f6faff6c-7fda-4719-ae4f-1a179b538096@intel.com>
Date: Wed, 8 Oct 2025 22:36:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/34] drm/xe/vf: Move LMEM config to tile layer
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251008180500.3261209-1-matthew.brost@intel.com>
 <20251008180500.3261209-14-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251008180500.3261209-14-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0202CA0017.eurprd02.prod.outlook.com
 (2603:10a6:803:14::30) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH3PPF6CF64E2E6:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dad7751-949f-4e2f-cd8b-08de06aa6950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3FFbUZveU9GSmhiTmJNRlZNa3h4bk40ZFFwRlRPYmNsdEwvQ0RjQTdpSENQ?=
 =?utf-8?B?TlA2TFNhblVWMCtvQkdwcm1pU1dIanFkS0xHRFNaN1RzeC9kN3FLTE9yRVhF?=
 =?utf-8?B?cUF6VG16WW14Y0ZiSEZFU21xNFVsLzZwZ0o4c3d2UDhkQkJmVTF4ZEI2NFBv?=
 =?utf-8?B?RlJGUE9RbmpMbnVRd1BYU2l2RVB3YnNPTEY2WHF2NGxlMVBjK2x6WWdsRlRU?=
 =?utf-8?B?a0JHTVRMcFRXT3FoUk1GZDdoMFdpdWFJVG8rSFdqMDZHQzFkVERpb1V3SXNp?=
 =?utf-8?B?cXJuRXJqU2lWOC9yZGhzaWtaVU96WXVCRTkzVnBjS1YranI5bU9yVGpxK2dk?=
 =?utf-8?B?QXVsS1ZVMFhyZWtZdmViWGJrd0NaSVFiWkRrVWsrR2h0M2ZDQXVVR0Y0R2gv?=
 =?utf-8?B?a1g3Q1hqUEdCaDM0SmtGSTBqT0xvaGgvS0NHaEYzMVZndktyd2R1YkdtRXFh?=
 =?utf-8?B?SDFWeUN0b2QvaWVsN1RCQ2RvZjdVQ3lKai9yWTlsanhkS0V6aUd1Y2p5Qk5v?=
 =?utf-8?B?SjdTWE8rWDM0UTdkdVM1dlYwaVdLcVdVN2dxK2hqc29wY04rOURHNThYakhJ?=
 =?utf-8?B?TTlqeWtKY2RzMS9YaUxuQVNpQ3laaWl3RkFiVFJCbDY1QlFYTEFSUDFQUWp4?=
 =?utf-8?B?R1Q4WElDZlBXQW1HUVluVkh1czZqR2dyRS9oVjUzaEw4ak5UaWk1S0RFZ1pk?=
 =?utf-8?B?ekkxbDVBUXlVMDV1bnZKMWs5bVBRYlZCSm4xQVFqZWMrYXc4eGMwemhBMzQ4?=
 =?utf-8?B?NTF5RFo1UEdYS0dHdjk2bSszZWcxQWVtRThZOTNoY3BqQTVWOVhDZGdZS0Yy?=
 =?utf-8?B?cjNMNXpDU21rUjFDN2UrTGRSVFZNZU1Dbks5VUYreWs5RWtVZ3hMZUljRzdh?=
 =?utf-8?B?WFpEaXRZalRjOC9YRjBDVndPdEI0c1hzOWMydnZEWTVBVDkwdE9tS3NHTk5u?=
 =?utf-8?B?WXlJdVBpRy96M1kvNUVJWHFOVHVwRlZKQ1pxN2NRR1QyMTlwQU9YWTRxYlov?=
 =?utf-8?B?TTNaMXJPMXQ2K3dTQkQxeWEyTnIzZ2U3Z3VmaHpHQWw0Uk9ydk9WS2RBZDN5?=
 =?utf-8?B?aGd0WElGT1hialoyZ08rOHcyWStLak5VdHdaZGtQbkNuY0xtVDdsekNPVUZ6?=
 =?utf-8?B?NmI5TTFid2NmWEZzMkV0ZUFia0JsTWR2QUYrWTQzcnNjL01Wczd3ay9iRy9k?=
 =?utf-8?B?NHBiU0l1TDFaOEU4ZlMxbDAvZFBnZDFpaFhZRkxQS1IrWVY5enRFRm1NWU5q?=
 =?utf-8?B?NElDaWphS1l1Z29HbVpFYjh5Z2N0eTBHSnE5T2w3UTZsT1lreEM0K1hRRWZt?=
 =?utf-8?B?SlZ3MVU0clM2SFk1TUNHbzZqRjlYQldENnFCY3ZSU1BiVGlPcFI2Z1Q2Sm1p?=
 =?utf-8?B?N3NJZGFVa0U3S3Q2NHZqZjZ5YU1nU2xvazBpWEczaGx3bjVoVnUxallxbm5L?=
 =?utf-8?B?SzMxWG9UK1VKNktWL3kySlRiYUFHL0RJb2JqKzFiTlZMbU8rUjA2SnVNWmg1?=
 =?utf-8?B?QWl0Rlpibk1ReXNpWkkrUWEva203TU1LTFp3TE1tZ3lqTERtU0Y0emRlMjQ3?=
 =?utf-8?B?TVd5b2lDU3lNSXg3UEFmT3ljeTlEb3pVb1ZNWmJ0b0tjZWFLNlFxcjAxZ3Bl?=
 =?utf-8?B?cU5va3RTWUJ0YWFkL2ZtS254UVJoTjZHRm9VSjZRU2g4VVFpNUNUSng5bXZT?=
 =?utf-8?B?cnhnbEc0ODFpMFRzbG8wam42TkhBL1M0QXBINjZPcDFYTGRkR2x1YTVZVUJw?=
 =?utf-8?B?Tzg0MjhTMlFnVjVzK2ZRM0NmeDRPZUlhM0hPSjM2V0lMKytnNERLVEZsVElr?=
 =?utf-8?B?QjBHSm5JaURLVkJXTFlHOEhWWXR3UElzUExSZ2ZsOUptaVNhVmN0NHRFaHFk?=
 =?utf-8?B?TnNkQlgzT1QzbmlsQXp5Mjc3dGxxM2hGYzU4VCsxZ3RVQlN6aVVWdVU4OHBa?=
 =?utf-8?Q?6qQ2298D1Cf7wny//BmoVk1Hlwt3iFlC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eE51d0owK0EybUJ4NVZsUGdSUFRMZTUwRGs5RzNTakZ3cWY5QnNyaERJcmN6?=
 =?utf-8?B?VE01aXFQaE16KzZlRUdjWUprTWY2bmVNdldnUW1ReVp6eG9hQXZOUCtCWUJO?=
 =?utf-8?B?bmRuWjhia3orMlhPa254NFJ3SENVUWUzMGVXK2VacDh0amFTL0lLbW1vSy9a?=
 =?utf-8?B?dlNZTFRTc3lJV2ZNZVgzUWJ5SFBnQUtBRUFiRk9NUW9HbmQrUWFrNWh6WTdF?=
 =?utf-8?B?bWY5aHR3RDlaM09RTjNVTllTcHR6Yms1WWRaUEpPMmZ6UklvcFg0UlpzZitS?=
 =?utf-8?B?eUhmZ1Q3RTNCWjJaSEtVTjRCRmZJUEd6SmFiY3hTZzNOc0Z0blRTcUhVWVpo?=
 =?utf-8?B?eWFYL0dxaVhwVlhGWjlPdFhjNnhaRi9CMHBFMXFvc2lpYVhsZTl2NjF0Uysw?=
 =?utf-8?B?YVVUMTY0VDl4QkUraDhuUWZSdDltZ2hCODNON05hY3J0OEN6bGxjVHhXRDdN?=
 =?utf-8?B?THJuRWtlcG1xWVdkNlhXbDBPRXEvRngyRURERDRSeHhwdU1qZzd3aVdsbk85?=
 =?utf-8?B?N3JSYnZ4RmRoWVhHS1JWU2tXQ0NrSm1RK2QyWFZyR1pjczk1S290OVZ4a2ZY?=
 =?utf-8?B?SmQ5VHZZeTRudFY5MUZDU0dZTHlyZ1dLeDA5dGRJdU9RUlVVc2x2WnBpVXNF?=
 =?utf-8?B?Qy9FZkM3dVVOVi9pTUNFVnovUU55VXRLSXJRZm1nZDNFNWFJYmJyWndmRXQ2?=
 =?utf-8?B?Vmx2Q1NMTnZSSDdzNGFhUUVRSDFCSnA5ZE1FMU9ueG1ScXRDTytOZCtTcitF?=
 =?utf-8?B?Yno0OUJ0eHF0TExoQUo5ZStCOTd3WnNONFdBQ2ZGMkpvUUFqRGdpQ2JSaVlt?=
 =?utf-8?B?c3VFbDg1RExxa0QzK3BQNmN1dkpDcDBFeGY2Q0ZFdmRnMGp1QkVERmdxMW5j?=
 =?utf-8?B?M2ZsaU5vck5xdnREb2QwMnJrZlBKaGVjR1FVR0pic3pUKyt0TUF2YUZWVFR3?=
 =?utf-8?B?UGtZcG1CVVl4Yks3WS91VWhZSVR3WVNqUXIxMWdDSjJhbERIelhIbzF6Ymp5?=
 =?utf-8?B?OXE4NzNFdVRTemIvUEV1UTljMG5Dc0NqSXNhZ0c4TUovYStuUXVHNk1CUVE0?=
 =?utf-8?B?a3NnUUd3dXZuVVliYW0yZGNyMGlVOUVJL0sybVZzQXpaTE96bEFZbGtqYmJO?=
 =?utf-8?B?OHc5S2lCdzFuelJ5WmV4SUlaMG5jNFVVSlVtSEJNVUtUWlhHUkxSRjE2bTZ6?=
 =?utf-8?B?UG01clNUeDdOWEZRVVZ0K0twQ0JyRnZMMFR2Z0NaSXQ4dzBNNXdORk1qbkc1?=
 =?utf-8?B?ZU0rdFBLUjVJOWRqQklqeSs0ZFRFZ0pTSWhlWWVpTUhyb05LQlk2ZlVhejly?=
 =?utf-8?B?V0lSRGpsY0Z3b2dKOGZ0UzNoRjA2a2xia3E2bktaUTcrY3BLMUYxeUtEclFk?=
 =?utf-8?B?RVBaM1g5RmZaR0F5MG5FZ09OR0Y0T25XK0xnajJvUVF6UTRuejdldEN5SHRX?=
 =?utf-8?B?ODhDbk9sbWE5OXRTTmxLS2lRaEpsdjVzL01zeExPcUZtMm9sNjZWWEtLSGh3?=
 =?utf-8?B?dXN0a2tuNS9MblludXFoUFY1UUNqbXhEekNQbE1UYjN2dUNZdTlPYThVT0Y3?=
 =?utf-8?B?bFJrUkVNTFFlRmlJb1J3QmVYVHBON1JwdDdPcWIxK2dlK2ZuYnpGWlhIdENN?=
 =?utf-8?B?YUxlaWsrNlgwWnhyeFJSRmliUlZ6b214VW1UclQvZXZETmhlbStzT3VIcDNO?=
 =?utf-8?B?RE41VnBsK2VRVTdJV2dHRDVkckw4Q2ptTjAxSHV0MytUNy9hVGtXUVgrQ1l2?=
 =?utf-8?B?VEdRWkh0Mk8yU2hKUGY4MjJvRUtSRE00bHJkWHNhWEcwL1pYcVFTWGRCa2tm?=
 =?utf-8?B?VStHQXZLOFJhVDVRa2VMS1RSVmZwTXF1NHZuRDlBaWZzZHFxK3BvNVIyTVhu?=
 =?utf-8?B?TFpGdzIzRnQwVlBWM1ZIOFNnZ3FMODRiUFo0bzdrNXRrZWhYSTNtay93R2tN?=
 =?utf-8?B?NjRWZXl3UFVmUXFSeXhZT2RDR3hOa0pwV0VHdlp4REdXbElDcUFTR2tVdUpx?=
 =?utf-8?B?bmlTVGRkcFpGVVZTQ3RhMFBsZThJVTN5d0RDeU9yVXNSTW43aE9yVy9zbWVR?=
 =?utf-8?B?NVVsUDVkZnp2QnF2dnBwejVoNlVmb2dBRUxqQ1dpbzNybmo5c2hFaWpTbWRn?=
 =?utf-8?B?dXU5aUJMbEJmbkF5dXQyZE54aVhvcVo4L201Ly9hMDVwdko4TU9LbHhyRHp4?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dad7751-949f-4e2f-cd8b-08de06aa6950
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 20:36:51.7291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b9HHQFTNzIgeiD72N0pjb+c2sp6OmfbQ6c2D4E79rtbN/yZYq4DMdAOdBqtnM1v1BiYa48S6hEZBC/6QhW+TTeamVDnFPDAKQQesAkdbHpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF6CF64E2E6
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



On 10/8/2025 8:04 PM, Matthew Brost wrote:
> The LMEM VF provision is tile-layer-specific information. Move the LMEM
> configuration to the tile layer accordingly.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h        |  3 ++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 36 +++++++--------------
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  2 --
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.c       | 33 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |  2 ++
>  drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h | 19 +++++++++++
>  drivers/gpu/drm/xe/xe_vram.c                |  6 ++--
>  7 files changed, 71 insertions(+), 30 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 1d2718b70a5c..c66523bf4bf0 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -27,6 +27,7 @@
>  #include "xe_sriov_vf_ccs_types.h"
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
> +#include "xe_tile_sriov_vf_types.h"
>  #include "xe_validation.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> @@ -193,6 +194,8 @@ struct xe_tile {
>  		struct {
>  			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
>  			struct xe_ggtt_node *ggtt_balloon[2];
> +			/** @sriov.vf.self_config: VF configuration data */
> +			struct xe_tile_sriov_vf_selfconfig self_config;
>  		} vf;
>  	} sriov;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 31a80d77da36..6f3d9bc5ed22 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -471,10 +471,10 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  
>  static int vf_get_lmem_info(struct xe_gt *gt)
>  {
> -	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_guc *guc = &gt->uc.guc;
>  	char size_str[10];
> -	u64 size;
> +	u64 size, lmem_size;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> @@ -483,18 +483,19 @@ static int vf_get_lmem_info(struct xe_gt *gt)
>  	if (unlikely(err))
>  		return err;
>  
> -	if (config->lmem_size && config->lmem_size != size) {
> +	lmem_size = xe_tile_sriov_vf_lmem(tile);
> +	if (lmem_size && lmem_size != size) {
>  		xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
> -				size / SZ_1M, config->lmem_size / SZ_1M);
> +				size / SZ_1M, lmem_size / SZ_1M);
>  		return -EREMCHG;
>  	}
>  
>  	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
>  	xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);
>  
> -	config->lmem_size = size;
> +	xe_tile_sriov_vf_lmem_store(tile, size);
>  
> -	return config->lmem_size ? 0 : -ENODATA;
> +	return size ? 0 : -ENODATA;
>  }
>  
>  static int vf_get_submission_cfg(struct xe_gt *gt)
> @@ -591,23 +592,6 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>  	return gt->sriov.vf.self_config.num_ctxs;
>  }
>  
> -/**
> - * xe_gt_sriov_vf_lmem - VF LMEM configuration.
> - * @gt: the &xe_gt
> - *
> - * This function is for VF use only.
> - *
> - * Return: size of the LMEM assigned to VF.
> - */
> -u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
> -{
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> -	xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
> -
> -	return gt->sriov.vf.self_config.lmem_size;
> -}
> -
>  /**
>   * xe_gt_sriov_vf_ggtt - VF GGTT configuration.
>   * @gt: the &xe_gt
> @@ -1059,6 +1043,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>  	struct xe_device *xe = gt_to_xe(gt);
> +	u64 lmem_size;
>  	char buf[10];
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> @@ -1072,9 +1057,10 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>  
>  	drm_printf(p, "GGTT shift on last restore:\t%lld\n", config->ggtt_shift);
>  
> +	lmem_size = xe_tile_sriov_vf_lmem(gt_to_tile(gt));

that should be under below "if"

>  	if (IS_DGFX(xe) && xe_gt_is_main_type(gt)) {
> -		string_get_size(config->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> -		drm_printf(p, "LMEM size:\t%llu (%s)\n", config->lmem_size, buf);
> +		string_get_size(lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> +		drm_printf(p, "LMEM size:\t%llu (%s)\n", lmem_size, buf);
>  	}
>  
>  	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index e753646debc4..aff76051c9bb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -20,8 +20,6 @@ struct xe_gt_sriov_vf_selfconfig {
>  	u64 ggtt_size;
>  	/** @ggtt_shift: difference in ggtt_base on last migration */
>  	s64 ggtt_shift;
> -	/** @lmem_size: assigned size of the LMEM. */
> -	u64 lmem_size;
>  	/** @num_ctxs: assigned number of GuC submission context IDs. */
>  	u16 num_ctxs;
>  	/** @num_dbs: assigned number of GuC doorbells IDs. */
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> index f221dbed16f0..02430a53da9f 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
> @@ -252,3 +252,36 @@ void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift)
>  
>  	mutex_unlock(&ggtt->lock);
>  }
> +
> +/**
> + * xe_tile_sriov_vf_lmem - VF LMEM configuration.
> + * @tile: the &xe_tile
> + *
> + * This function is for VF use only.
> + *
> + * Return: size of the LMEM assigned to VF.
> + */
> +u64 xe_tile_sriov_vf_lmem(struct xe_tile *tile)
> +{
> +	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
> +
> +	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> +
> +	return config->lmem_size;
> +}
> +
> +/**
> + * xe_tile_sriov_vf_lmem_store - Store VF LMEM configuration
> + * @tile: the &xe_tile
> + * @lmem_size: VF LMEM size to store
> + *
> + * This function is for VF use only.
> + */
> +void xe_tile_sriov_vf_lmem_store(struct xe_tile *tile, u64 lmem_size)
> +{
> +	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
> +
> +	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> +
> +	config->lmem_size = lmem_size;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> index 93eb043171e8..86d750a57530 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
> @@ -14,5 +14,7 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
>  int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile);
>  void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
>  void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift);
> +u64 xe_tile_sriov_vf_lmem(struct xe_tile *tile);
> +void xe_tile_sriov_vf_lmem_store(struct xe_tile *tile, u64 lmem_size);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> new file mode 100644
> index 000000000000..f49afa8338f1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_TILE_SRIOV_VF_TYPES_H_
> +#define _XE_TILE_SRIOV_VF_TYPES_H_
> +
> +#include <linux/mutex.h>

that's not needed

it should be <linux/types.h> instead

> +
> +/**
> + * struct xe_tile_sriov_vf_selfconfig - VF configuration data.
> + */
> +struct xe_tile_sriov_vf_selfconfig {
> +	/** @lmem_size: assigned size of the LMEM. */
> +	u64 lmem_size;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 7adfccf68e4c..70bcbb188867 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -17,10 +17,10 @@
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt_mcr.h"
> -#include "xe_gt_sriov_vf.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
>  #include "xe_sriov.h"
> +#include "xe_tile_sriov_vf.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_vram.h"
>  #include "xe_vram_types.h"
> @@ -238,9 +238,9 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>  		offset = 0;
>  		for_each_tile(t, xe, id)
>  			for_each_if(t->id < tile->id)
> -				offset += xe_gt_sriov_vf_lmem(t->primary_gt);
> +				offset += xe_tile_sriov_vf_lmem(t);
>  
> -		*tile_size = xe_gt_sriov_vf_lmem(gt);
> +		*tile_size = xe_tile_sriov_vf_lmem(tile);
>  		*vram_size = *tile_size;
>  		*tile_offset = offset;
>  

two small nits, but LGTM

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

