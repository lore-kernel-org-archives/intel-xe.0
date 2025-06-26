Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA6CC77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 06:43:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5977D10E849;
	Thu, 26 Jun 2025 06:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aljEtMv2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D270210E26D
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 06:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750920183; x=1782456183;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3mR35n+VosUmVkr3EGz5lZjqCAsWb7W1HNBZMHJSDO4=;
 b=aljEtMv2nIPfhO6RBnelRT94UyzO/6NlkJ2S3tIATlGnbWxL/gTYQFnO
 t1Kz43EFJd6UESUXOw4aT9A2KLy4MvU5UkO4hJWnpAaqRgIwJBKRoxl8O
 muuBXtjz1xlAuOa1l40il8NYH8G4o6LWiDG/JaNu2s46hivBGaypNq+IA
 wFK5t0q627kZrLLBCbw0wskgm888jouiWEKY+BydWN4iYpoqrjj8PhkNQ
 UWOlzWHw0pkVCPJHHBHKyS4lMx0YlXAn9I/vz2tBXD6cEJY7P4yQkRy5b
 RQ0bi1ooZJxO+fFe0H4umblgUnBezU6dznKr/H4h1Zhc25oZKoAPc9o09 w==;
X-CSE-ConnectionGUID: 8Ks+ik53QASYPaOAnMN5BA==
X-CSE-MsgGUID: cN8JpjpPRjGxFHhx/k1Y2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63802864"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="63802864"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 23:43:03 -0700
X-CSE-ConnectionGUID: raFSJ00gRHKIsSpPVwtsJQ==
X-CSE-MsgGUID: vbIEdD6fRpqWG5wZarHDCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="176090247"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 23:43:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 23:43:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 23:43:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.86) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 23:43:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7oZQM4C/4QFJsBED1g4cTvXEFTHtQev+3MzbWFaCWX7BGfzTP4gHfupTTBcSKdkchvjx+JyAPoD8Z4RW0hlVtdkFrum5NdbrZv5ewBGjYxs/K77Ou6yrYHrucxwukuRpIC2wm+4MQXdvz4Xv7mVLQyHpFbubl9T4UTIZrvXoqAR7x7o5yCGfiLqZMvNCY1YMnp1BW7MGCxw1euEwSf3yqS2rFnDuJOqtbBKKB8pfd0YDBxAlRQXfqZHCUf341/i3/esiInzFDXiViMG3vaWHXPM7rf7E4JVV6RbU/VjimIPE8Z55efw277dLiVR3xVWEaMJo2eFvzEl+mcQ53EmMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i39HUZLp1Ddp7qnSUHbUT4W2zQn5EBa8EpJ4Bg8SHN0=;
 b=PFnIbH3JhEKBZKsaSdifApI3NthJ1ek6xKRikwsXSnfeULBAcONnOmGaqmqKeo5RwxnrKWOz7DcOpB24zntpwuCyFxDa5NJgXcGsVsF8NRdHYsebV2w3Hlue0uEsjcEDa7WVr8tiUgLEh7ihE1aXT3dmEEgeH0znQpVN7tsnhX2CnYExPbvI+iXOcJZ1kvtjYCne9dRWKL0GwVHUTivyhqaFwg+DGEbcFNXetJpD7EuO1pX6e6h0SC9Qrhu9pxcy4oipBjR3eZbSQDbAfcB/IteePGaLiU5ytIMYUBu1Jw4yR+C2OVS4oac7z7N0VyMq5GFdd6lcBUFymX1jNP65kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by PH0PR11MB5109.namprd11.prod.outlook.com (2603:10b6:510:3e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 06:42:58 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 06:42:58 +0000
Message-ID: <80e31d56-fb63-487f-a2fa-2771337cc9ca@intel.com>
Date: Thu, 26 Jun 2025 12:12:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie
 link state residency offset
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>
References: <20250625143254.3505218-1-soham.purkait@intel.com>
 <20250625143254.3505218-2-soham.purkait@intel.com>
 <CH0PR11MB54441FE7C1243F0C77D1A53FE57BA@CH0PR11MB5444.namprd11.prod.outlook.com>
 <2817e1a9-9109-4f4f-90d0-2ee31799dbf1@intel.com>
In-Reply-To: <2817e1a9-9109-4f4f-90d0-2ee31799dbf1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::22) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|PH0PR11MB5109:EE_
X-MS-Office365-Filtering-Correlation-Id: 1933f1c0-bccd-4f0e-3250-08ddb47cb034
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUpKdzB5ZFpRekRUd3p1dDhkb3BXL3JzVFR3OWpXSFFLYlJsY1pQdzRnUkx1?=
 =?utf-8?B?K2VQbWNHakdGK0dZMGk0Vml2VmM1L2ZsTFNGYzQ5aEllY1BLTVBqTnR5Ti9p?=
 =?utf-8?B?bXljbUZabXdybG9sWjF6ZFYxdm5JSC9IMWNSQUFJWlpsaXlsRzMwNUZyME14?=
 =?utf-8?B?a25YbXJ2Wk9CNUxqZHd4MDlXSzQyWE02RTAveEg1ZDlJa0VEVnZLaDN1L3dU?=
 =?utf-8?B?RkRXQ2tKbE90ZU1pVWhNUFRRRTd1WE9FbmhObkRVN0dORWUyWHg1OFBpYzh3?=
 =?utf-8?B?Y1JXV29NTnBCWGtsVU5EWTNkajA0QXlrUVVrWmV6V0JQTU1taWJMSVUyYXV3?=
 =?utf-8?B?ampNTXBKSUJmT0Rxb3pWalI5R0RlNC8yd2kyOTZnTW5MV25zbzQ5Qk5KSnh4?=
 =?utf-8?B?V1ZodXM2NWZkN3RSNG55MEp2SUJ5Q1E1TUFqZmdwSXo2bkcyTmpSNXJrVEhY?=
 =?utf-8?B?TDNGYnNyV2hWL0xyeGdSem1pcVVPV05janRFU3RhaXZ2eDh4U3lERmk5ckw5?=
 =?utf-8?B?WnJpRy8yYXpPNml3Qy83UjVheGpsY0QvNU5RcFBaZXo1a09iTi9aQ0tIUXFO?=
 =?utf-8?B?NWZaWXhNdFQxQTdVM1ZWZkdtUVlIaFA4VndiRTUwZ3lDMjNYSVZ0aDVXMS93?=
 =?utf-8?B?VG4yRWk5cWhXV1hkajdTeklpM0EvQjluUXljMVhJZHZpOXRIVGxYVitpQmNn?=
 =?utf-8?B?enNycTlKYTEzVVNQUTBTSk5ZajNsMzllWkQ0RFNXcnd5MmI0N2FmYTJLYXEw?=
 =?utf-8?B?dnFsS1pzNkJSeVFTV25FWHNkNW9FVjdEc2ZrVG5qWkdUY3hnY28wd25wSnFn?=
 =?utf-8?B?U0pZOFVZTUJJbFdUMng5M3V4Q0RGd3VoL1lGRDZ2SWJNdEc3N0NQc3hVOVRq?=
 =?utf-8?B?ZDdUM0xGMnY1YnpkQ1Y0Ri9BUnplcmNrQVA1VW9JQWRTK1dDVnJPMXZOQ0dB?=
 =?utf-8?B?MmlIaTZ5WHhyVlBWcGRsY1JSS0R3OGw0b2lKZEhLRW1GNTY2a1dUcTZyQTlv?=
 =?utf-8?B?dGRrY251N0lwQ0g4ZXg1VjdQcG5WTmQ0ZWdub2FIUU51V3MrWmNZckhsUXFI?=
 =?utf-8?B?WGFVbjVxYjRabnpnZk54Y016UjI1NFlPdElIUDVWOXpybWtJaTFaWjBFZmlB?=
 =?utf-8?B?SFZocXF0V045QjNNdnBDVkV1UFFHMFVKc2g0ZWRJeWM4SmVMZGgyTDRXUkVQ?=
 =?utf-8?B?c1pndXZ4aUViU25OdVQ1RSs5a0FVZ2tPbnhiTnZwclpFL1UvWmZHYjg2SHl5?=
 =?utf-8?B?QXlKYlp1YjdQR3dkaHB4SDBsOFBrSCtnRnFtNk1BdkJ3Q0IwTFhxV0t5dGYy?=
 =?utf-8?B?SUdzRDNldnp1WFN4dko3bjhuZXBUc3VxcFQ0d2UvcSs3b2tiMWZyR2J0dS9k?=
 =?utf-8?B?VHBkK1NOVXI5ejhaZjlxb0Z0WENZbVovaEhkaUp0MHNYYTdmSC9TRkVaeEJM?=
 =?utf-8?B?U1dvMmFuWDRiR0F3RHVVblREaHhqU3ViV0RnUDhsTVhHZ3E5TkowZE15a3NP?=
 =?utf-8?B?dkpIbUZhVlczRGRncDBQSVh5Nng0cHd1anJBU3liWFloZ3hyejBmK09qWVFN?=
 =?utf-8?B?bEw0ZUg5RlY0MzY4WFBZU3FsOVBLM0tBT2ZtTWk4TlF3Q1NBcWJ1dnloM2cz?=
 =?utf-8?B?VE1CalkwZHhKMDFld1NTZzBoUWJaMzdFUXpnYlc1b1lRMlh2RmRqWTk0dVBo?=
 =?utf-8?B?bVYvZzdRTzFSYUlKZWxxZXVjM0lUaklsTEpkcG9SWmxQbm5temF6dHJDd3pl?=
 =?utf-8?B?UkZLaEJHR3FnVnVFR2NsQ0M0NU1vTGRZaEJHZDg3RndFSXhoNXU5cEE5REpm?=
 =?utf-8?B?N25XdGxXZ0dMRkN4djRyRG9vMkk3V3VOWFYrbDkwb0xYRlROTFdDSnI2QzBX?=
 =?utf-8?B?NGgvMXJrRWpSNUVsMHIvYWRsVnorN0NvZ1ZoanRzcUhDRjBNTWx1VTFyaUNU?=
 =?utf-8?B?RUFJVmkzRDJtamNyUjh6anhFMDBCdE9KZTNhZFZRVHUyMWRKQ1BYU2oyaWVV?=
 =?utf-8?B?Vkp1ZUczQ2FnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(921020)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE55S0YrMXd2d3kwM2gzR0x3bHltcm5ueVRQa0p4VENIcnVWN1ZhNVNEY3Fj?=
 =?utf-8?B?eXVKZ0YyTUJyQ1d5cVRmM1pmWjRNRkg1c1E3Z2VYNHduNmovWHM0YjlUaXkz?=
 =?utf-8?B?amcvOHdoTFJXZnhQaXRwY0pPejVoOTBXaStLajhOWWxJR0RYWUNoOTF4RzYy?=
 =?utf-8?B?UjlQZzZoNm00NzJhRWNSMEM2Vm1EaHM0YUYySmRTcnVlUHhSbmpIOWdSWWpU?=
 =?utf-8?B?NXhLK2c2TXBRak8zd2RGS2xaTmdZc2NwQjlxRkZpZEsyMFlSK1l6MDVKYm1a?=
 =?utf-8?B?OXNZM1RJUlRYS0ZNT2hiTEdoNjN3cXowMC83b2lnL3dHeGdrZ2dvbFVrOEVS?=
 =?utf-8?B?QXZFMVVJSTloeU11c0xnOVZnRWMxaFpQMVR4YUtsYjNwNVkvTTBtKzRYa0Fw?=
 =?utf-8?B?S1pzcFV4Vmg4dWhPZk50NTZLNm1DalRwUlFmcjZ5czY3YkpGZFBFUWhYWm5E?=
 =?utf-8?B?cWVLYW1lNVprTEtrbWRvUVpoQlo1dWFtUWk2RFF3dlMxT2VOM24rTFhTT3d3?=
 =?utf-8?B?enNpMGVNS2F1bUdtcmJYVFdmaVF6dDVJMTdrUkVKK1hiRC9hUHMwT0x0ZkQ5?=
 =?utf-8?B?eU9ydDdyVnN0U1FRUkNkWUY5SmlSbm5ObVdmbUZOaS9jcW00eFVXTU9ua05D?=
 =?utf-8?B?UEtpRWJDUUMyUU8xNWd6c3hzdzE1UzR1SUNvZEU3cVkvMGNoMHNBV2lwcWJZ?=
 =?utf-8?B?UUpIRlR3MkNQbFpVNTVGTjRJaWZWYkMvcFlNUDhrU2NwaXFlNjNhd1lyUlEv?=
 =?utf-8?B?RlFyRy8vMnlobnJQNHI1VUZ1SndPenFGcVMwM1FaVG1NWHBndmhLZVI2M2hW?=
 =?utf-8?B?ckpEMkZwYUxSRkZKVWFKUkR3REZlWVBEL1JzNUxucEJpUmhKbWtRSXlGSUkw?=
 =?utf-8?B?OVhaYW5qMTVPdEFKV0svb1pJR2JJWnUzQ3ZRckFVNk9QWmxJMFVHekFsNmtI?=
 =?utf-8?B?Y2l1TDBUZUFVUkVJYTVoZTJVeTVLR05TYWFlVWxhWm1RWTg0dnpyOTA4aVE1?=
 =?utf-8?B?c290UkVlNnZSRU9lM1JpWE41czBpaTBzaDJ2VTVaV0RjMUVSZ005S05IR2ZZ?=
 =?utf-8?B?azVqZjNtNkp4V29mR3hpbWp0NTVQaE03WXc2OTRLQkVraENOdStZQ01vTEdw?=
 =?utf-8?B?ek1PeFZiUDFXeTlYSzhxMWx0ZnQvSjVwa2hZU3B1TFBTRlVyditrVkVhd3J2?=
 =?utf-8?B?SmxSVHdzTGh6REdUNzBKWGtlWnVKanBvMXFXUlRrbHNUYU9iamVHS3p5OHhI?=
 =?utf-8?B?VEw0Vk96blB3cjFsRDJEZUdGZUtrMy9iQmpHdUwxS2VUMmdmNnBuNTkwaXh0?=
 =?utf-8?B?MGs0WThkNmJMRDZGd3JvTVVBRHVwVWRHbEhmQmJJVFVNRHF3NUpFUGlCRG1C?=
 =?utf-8?B?Y0h4ejVYaU51YkZEcUZXZVVkeW9PVExtZldSSE5heHYra2dkcXpLSjNkUlVm?=
 =?utf-8?B?S0ErcktFWnZEeGRmOWx2NnF5a01UYnhiVTNSUWZzQVhlbFY3UjlLVGw3RStq?=
 =?utf-8?B?M21TZnhxNW9GYU1iZU1CS3JmOXB4bmc0RFM1UXJ4alBzbUViTUV4c3k0enRD?=
 =?utf-8?B?UXlJTnZXTXE3amRjRW9BQ29sYnFFNmx3ZGV4b2lKWnBGTmNiOXRsSnVzbnJG?=
 =?utf-8?B?K3gvaHk2VzRIZFdxcHNEOHNld2RpYkcvbHgwdldoa2NMMms0SXF5UUV5VCtv?=
 =?utf-8?B?OHhpa0w2QWtoVWdlTlhGazRLcDJsVS9CRkt6N3V5ZjNieDFMbWc2Q0wzb29K?=
 =?utf-8?B?OFJWSldRNlg4Tk9NeU5KbWJxMXNycHZnSjQxM0FEeVlJak15RUFTcHJqNGZn?=
 =?utf-8?B?VTFIaGNBQy9mZXVNYlg1dWFvR0M5V01UNXJWdDhMWWhXcFhBV09jN2FvekxI?=
 =?utf-8?B?SWNUY0JML3lmOEFQRmZmN2hiQ25rVFF3TitCbzNGNnhMem9sNjdERXlVNmJm?=
 =?utf-8?B?ejdjNUMvZ1g3cWNMOVRNT0xmMkpIV0lYbWpwY2FoQ1VCOSt1bGFWaVhuOVNq?=
 =?utf-8?B?NkFpVTRraVdwb0QrM01wWU1JQ3RHY24zMVR4bWhPeGxnYzRzaVpSS0VzNllS?=
 =?utf-8?B?eG81aThBc3g3aFpyTWMycEZQOFFpckFTTlMzT0NPSWxpbGIzeUhqd1BuZmRr?=
 =?utf-8?B?SmkzbFFoZUozSnYyUm9WZ0FGL3QvMkF4VTRYRzZpTlpJb0l4Tm5nTzNPNzZl?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1933f1c0-bccd-4f0e-3250-08ddb47cb034
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 06:42:58.7035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8z726pFUvondta2EQ9t1o7b6D3PI6xW4/UXAdh/XGquiFSes8Z7vePWDaZfzPIByhJLqsXpcrTxRZNcvnnk3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5109
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


On 26-06-2025 12:05, Poosa, Karthik wrote:
>
> On 25-06-2025 20:16, Cavitt, Jonathan wrote:
>> -----Original Message-----
>> From: Purkait, Soham <soham.purkait@intel.com>
>> Sent: Wednesday, June 25, 2025 7:33 AM
>> To: intel-xe@lists.freedesktop.org; Gupta, Anshuman 
>> <anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>; 
>> Poosa, Karthik <karthik.poosa@intel.com>; Tauro, Riana 
>> <riana.tauro@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
>> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Purkait, Soham 
>> <soham.purkait@intel.com>; Dixit, Ashutosh 
>> <ashutosh.dixit@intel.com>; Nikula, Jani <jani.nikula@intel.com>
>> Subject: [PATCH v6 1/2] drm/xe/regs/xe_pmt: Macros for G-State and 
>> pcie link state residency offset
>>> Add G-State residency and pcie link state residency
>>> offset macros for G2, G6, G8, G10, ModS and L0, L1, L1.2
>>> respectively.
>>>
>>> v1:
>>>   - Move offset macros to drm/xe/regs/xe_pmt. (Riana)
>>> v6:

What are the changes that went in from v2 to v5. If there are none, this 
should be v2.

These version here reflects the patch versions change not the cover 
letter revision.

>>>   - Mark MBG to pcie link residency offset. (Anshuman)
>> s/MBG/BMG ?
>
> Soham, you can also rephase this as -
>
> Add BMG prefix to PCIe Link state residency counters macros names. 
> (Anshman)
>
>>
>> But otherwise:
>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> -Jonathan Cavitt
>>
>>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/regs/xe_pmt.h | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h 
>>> b/drivers/gpu/drm/xe/regs/xe_pmt.h
>>> index b0efd9b48d1e..34f5bfdffe46 100644
>>> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
>>> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
>>> @@ -21,4 +21,14 @@
>>>   #define SG_REMAP_INDEX1            XE_REG(SOC_BASE + 0x08)
>>>   #define   SG_REMAP_BITS            REG_GENMASK(31, 24)
>>>   +#define BMG_G2_RESIDENCY_OFFSET            (0x530)
>>> +#define BMG_G6_RESIDENCY_OFFSET            (0x538)
>>> +#define BMG_G8_RESIDENCY_OFFSET            (0x540)
>>> +#define BMG_G10_RESIDENCY_OFFSET        (0x548)
>>> +#define BMG_MODS_RESIDENCY_OFFSET        (0x4D0)
>>> +
>>> +#define BMG_PCIE_LINK_L0_RESIDENCY_OFFSET    (0x570)
>>> +#define BMG_PCIE_LINK_L1_RESIDENCY_OFFSET    (0x578)
>>> +#define BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET    (0x580)
>>> +
>>>   #endif
>>> -- 
>>> 2.34.1
>>>
>>>
