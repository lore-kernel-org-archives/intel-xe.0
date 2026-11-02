Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741C4606A326
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 09:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Duqge4Uz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343E910E5AB;
	Mon,  2 Nov 2026 09:49:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4F510E06A
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 09:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793612962; x=1825148962;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xx/bCbW/lYPgYgWQr2Rb1yAb9sydQq7o1tNPYyJ4+CA=;
 b=Duqge4UzoQryoHFFpXfq6BDtZe1Lls5i1hoEQ0F6c93CUD0ZrvVsKRd2
 gUDXSJmy0838p35RAxQWe8tNPmUZzb52yG0+J9UuAETZw7+yv7xX6/BS1
 5kvXHtPytNmA6TvlUwTIWU0+l4i4cyDZUuVK29YN8GYS305EKrcZpRRf0
 gNk1ZCI8etO1xX7phAGrgYP9fHsK0JNUHjVd4DlATF2Vj+kwrIcocXu7P
 r9yJhkTt94dnRxoqvUd381biCDLazl2cttP/zVlBLhtsCkZ+GENxhLDSW
 oRSDn9idKAjD3Fo/tjZ3RkSqR+w2kU6Nfspej5X+HAs1lzhXsqNgItyz8 w==;
X-CSE-ConnectionGUID: eWwmVnUsQjGP+FT/WOlfGA==
X-CSE-MsgGUID: d7qQu6seSDi0kiRxaJkhDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2197602"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2197602"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 01:49:21 -0800
X-CSE-ConnectionGUID: SLG3E8+2RhSMGeivAm4U3Q==
X-CSE-MsgGUID: tC0ibgKkRrOEvUKKbPPg9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6389133"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 01:49:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 01:49:13 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 01:49:13 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 01:49:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIRuTz6YB1s00d50a77MQSWwKqEiBf7y/oKxy/s7tF94ZIN4CC/zbJIPP8eLu5YGugv4jP46LbhdzMQ+tOldqZa5SWZbeusfjFte2BP7flRYastXJ4ZpSWZxFjaPcGou+6ce8+rFoKwcOBw+DSuMMuBJWR40wU9mz58O6LHB0peS+huypDc18qEne5ZfPv4tTNcjC0hBXGcmdXzMum3oC+0E0z5u26g+xuAqFpyM8D8oFeJX7afbFL+Hv38FM32TxMsn3N3bdo/6hskyWvxj335r/Y7h4ZfDTNKb2Zl0yuaggfKEjMGhlb0KFDImZAdndJwf9HdL1uUC2NgqLhNCeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3gmKqBQrVxFUOuNWsK92RIvC98co9UKJPZQhcUGw3k=;
 b=VmbIoia1W4vxh2Dux0CK152+RaCuMfz4FY4zw1mT8qv1azsCU9K3enmOgHKKmvcbapcS6sq3guzCDog6KGL9EFGyx9zegZ1eMUvcn7FPhmNTZU5wbp4JO6Om8LMg/AQ+iRAwacg46boXxxJs90JHupNMmb2LBMpL0GfSSIqhqupkbOogycxD9IEcPoSvQUTMlQflXumPrQyDy0/SlsLEl4PDFl+J3hr6ZDxOja1NP62joSa5SLHDLChIKrqUJWKESgAjTE+q/NzgZvDI5aArJLMlN0Fll9AEqZ2AyoCjQYhLyCQUZlLHex71+gllIi+eLnU2hXu+3Ih6WRXCIHj7wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 09:49:07 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 09:49:06 +0000
Message-ID: <b4e8b8ce-f5f8-4ff4-837a-fb403eaa2617@intel.com>
Date: Mon, 2 Nov 2026 15:18:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] drm/xe/xe_ras: Disable hw error worker when AER
 handling is in progress
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-18-riana.tauro@intel.com>
 <260fff8f-f1e4-4de3-862c-af96ece94b39@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <260fff8f-f1e4-4de3-862c-af96ece94b39@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0113.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d0fab2-42d2-4816-c1ad-08df38c6891c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261021121427099003|261022105027099003|261009220027099003|261009221727099003|261009223027099003|261009221227099003|261009223327099003|261026121527099003|261026140227099003|261028144727099003|4143699003|11063799006|10067099003|56012099006|260925021311599003|260925021911599003|260925022911599003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: KH99TkFXT2Yl/lhYk5/8reF+If7FMeW+yGI+7dWUH9khM95Pp1cHmIFLk8QBdXAkiS3RLlKn2g0vbjC1rtKWQZeOsgwxU+MIAKQlRGNnej68B2ssafv+5mWPw9j4wOOZyPzTkMvHGBNg/bVMlGNjVTpalNLgAZKWqXk46WkSf99BzYOq4u3jSnbVb6aDLhlR7CIvgXJlaNYYyTnkAlcRpsvR4rsx/4fa8h50F3Kf2l8m74fmSmnZKH360yKequesXHST67ooyEdklfzmYNdHRI2vBLIH5qgPNYEQpu80OoDGirNfTzhV2/ceS8rEbOoESW4mmcE+ksa9b7uu3JKcFRhYMGttWdRo6FOI1oYyIS+hgzkH9Wh3g/zmMCatLzbZsoIEK88MpqVNbnG1qtVnCJmSgwaQDCmDWuqVOm4flKgTXIxKWr0bbz3Lu04rHiTFsZgpBTZ6nHpt5u+urGVNfUTwORKxXLG4Ha4CCOSnzArVsH62B2yhJv035e4GCWYAEjrarix4e9nrxQkali885DrATuFKtLAeNOFOf0XY7mcrogYXFicQ++NMqOXSyGnIJ9kBMgfmtyHogEMiZbkgMVKZoWbTDKQ4nfPIWgX1P0pWBazG3AFppbgrcjm9hbYWAZrdSyPJIzFeCiZsWbBvpVtY/URC/3giQjzAwK24UHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261021121427099003)(261022105027099003)(261009220027099003)(261009221727099003)(261009223027099003)(261009221227099003)(261009223327099003)(261026121527099003)(261026140227099003)(261028144727099003)(4143699003)(11063799006)(10067099003)(56012099006)(260925021311599003)(260925021911599003)(260925022911599003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXFlTm5JMEl6aFBPN0plSUNCSHZJS3VBN3lidmJGY0NHUHBxSU9EMmtMTE53?=
 =?utf-8?B?WFFzUlJDZTJ4eVdmN21SelVicmRZVHpyZ3ptSkdhZ3U4N3RONEtsRHlDcWxl?=
 =?utf-8?B?MGVObmlQZXlBZ2ZaMWZnZFFCd21BUExGVHR5bXRHUUxwUmFURm5aMzJhQlFZ?=
 =?utf-8?B?L0c3TmJuUUtka2xiWGl4cXBJVlI5cHJtSS9kU2xoeXp2YTdsd2s1YW5hb09h?=
 =?utf-8?B?VFVDR0xXYk55ekZ2cE1Ec0NSU2FnVGp3NmZNZ0xPOEhNZXZsc0lMczRaQmN6?=
 =?utf-8?B?Nm5va0Nod0hzNFh4eGNJVlFDajRXN2hDQUdjQWliS0F3aFplc3pkT20zK1pU?=
 =?utf-8?B?Y0ozZGlibFdta01RRTQwaGNCR3dIWGN0bHRqOXpzeFo5dFN0ZTl0V0dudmc1?=
 =?utf-8?B?SXJIQVFteGZ2SnBoS1dSS3pyeURlWk14Y2RtTHFZSnNDcFJIbE9sT1NEMTg3?=
 =?utf-8?B?WjFCbGR1TjREcjFDdVNWdjFpWTQ0b0NTUmN6NzBjM1pFYWNzVGIwNXM1cS9O?=
 =?utf-8?B?ck1seEZFUm5UTDZkbDVOeDNXbngxSmpLQnNmNEpFZ0cyMmw1b3FkWjRXUldF?=
 =?utf-8?B?aEU2SitLNHdmYkZ6Tm5vaUhsYzJmc01NaW9UNVdyZnR3Rk9Sb0I2TUp4TjA1?=
 =?utf-8?B?d1Bua3dmMU5Pa0FUQUdvZHVxUWN3WlNDdFRnclNFa2dpZGh1U1R3R0tzNEJk?=
 =?utf-8?B?cFJ6cVJ0Y3ZXNE1xaHNIcXppeU9wYUJvMExZSUppaFlReGQ2Zkx4SEw2WUw3?=
 =?utf-8?B?ekt0WDBlZ0dxNDZhSU9xN296Ym9iYVNNTHp5Z0hGTVZVcU9HdzFFUnhEWHVN?=
 =?utf-8?B?OVNBcXpYNDc3YU95dEY4TklGMi9xR2U5ZFVTbllkWTRSZ0JHWngyMVRSMnYr?=
 =?utf-8?B?aS9YMTdoZUlWUUNPQjF3eDRNbGl4a3A4Rjc3WGFHcXhsdWZ2cy9kemJteHpQ?=
 =?utf-8?B?dTFqSFR6YVV2VzBaK2FRYWdJYUFMdkVNaFJlcGQxSnErZnZiK1hXeTR3Z1hx?=
 =?utf-8?B?Q3VoamhNZFZOMU9jQU1kTEFlVGZKaktUMWYydFZCMWRMem94QUNPMzZZb2tO?=
 =?utf-8?B?UVJ3dE9Qd0ZJT29nU3Zxbm9CNlVqV2pnZkNteHRGcTJQVUxOcE5KNE9ubGtI?=
 =?utf-8?B?cDI4RG1FNnFCN29HTU5yZVE3bHFudmlYL3RNY1lrQTdtNkRuMVU0WTdkMzFr?=
 =?utf-8?B?RHZZWXdVREhpMHcxZC9KVkQrSk5GSU1yL3hibEg5R0pDQ0Jxa3hKY2hIRm9q?=
 =?utf-8?B?bzNkSFUxVlNhT3dFOGREVGFYNnZpNWRqckhOOTI4MUthMXZmK1pmNFdmd0N2?=
 =?utf-8?B?cVNDVDk0WTZUUEZad3RqbHRNVmRwVjFhMmU0TUI3Y2s3a3UzSGVqT3FZSmFJ?=
 =?utf-8?B?NEFHQ21OZUV2ZlI2MHZzam5Ca2E2VFVyTFFWNVNTT215K3ErRWtVRnVaK1Fl?=
 =?utf-8?B?ZERoVXRYbVZJZ05zSWZaL29LMWc1MDFiRzQ4TUE1RmNmaEZvbHFHK293NDcw?=
 =?utf-8?B?Ry8zTjdvWnI1OE5kT2owb1hQcVNDMmQ4a0Ewd1NBMVg2Z2MxZlFIQkczN1p5?=
 =?utf-8?B?T01ORk5JbThEYmFNVFk2a0VBZkt1aExoalFSa2oxY0Exa1llQ2lZZ2MxU0k5?=
 =?utf-8?B?a25manloQUJpSFJYWTZscTNrb0kweVMxTHJLYlZrMEVkY2dRN1hPZ3dWV3pk?=
 =?utf-8?B?Sk1xMFNOMlY5bCswMEhsaXRadTJwR013Y1BtRE03OW5pT0VxYmVMalVpSUp3?=
 =?utf-8?B?M2dIckFTL3cwOXJuMVpRaFF5T0E4dTBJQjlNaHhHRm5ISG81cnJaT2pZc25r?=
 =?utf-8?B?ejVSQ0RSc3JHRGlHUTZpa3hSTzZJRU9tdG1rdUNqR2hOUFRDbjgwTldyUkJm?=
 =?utf-8?B?Tm9NdDNKK2NMTmpJaUVDWGg1L0dSOUROUkNTMzlvdjNqQXd5Q0kyTmZRZ0Vs?=
 =?utf-8?B?djBhbWRBVmlIUHVBdGZsbHNzSGRyMi8vTmdqMkxhUmJIQ1NnSnh3enpJdjJZ?=
 =?utf-8?B?eUx6ZWg4cnhJL3BXQk51Nk5FVjY3RWZwNkxENUJJdlZyd1R5WEMvV3U2dWVx?=
 =?utf-8?B?dVVCSThmOE9vK3R6UUVDYnkvUFlYRXFvTGh5eUJPZno5VEtKTTliTHplMXpL?=
 =?utf-8?B?ekVmOFpSV09tU1lOSHVZYnZwM0lnNGw5ZzZFZFZPWnBPdVVzZW1jelBsTDlB?=
 =?utf-8?B?MG9BZytBTkphSW1WYXk3TGFvNEFScjhJb2Nub1ZWOFhxb1kwNi9WNExGSHJ4?=
 =?utf-8?B?QjRzS1U4dkVNWTZ2Q2oyNXRwSmszRWZ2OWtqZHEwak03RFV1aERabXFmNWhY?=
 =?utf-8?B?WE95Z2h5TEpDQ0JNSGNuZzluNTVNdTdlNTlVSmF6WHcwY2c4dFZyZz09?=
X-Exchange-RoutingPolicyChecked: Om4IjICH5+UcOWWe6WNO1HsnEzmAKBdcQ/42ycoHcTbHFqyc1JJFiOICux3O0Mljd6DMHE8cqfS/22C3RqSh78izPlXI8QTgeaL61bicwCYLl+U8gwkKAsyocKLXEw6VCYDwHJ42yBPtRq50f6OL25UGvOXJtpthrXb+2xuytFb9gLV7T26+gGb12+gq8+LfzJcEIsTQiZ6JfPu3ZX9oSCeAkmfv6INW85kywSHpwbXrmqt2wvV/HUuech0ubaRqx6bLI7hYh+bInwREx8rjuguFuAJAQIR1l0obq8+eV3u8vhOcu2WZ4swARApbeZ8IsUHXPK7/cJD+bGBcPLFt3w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d0fab2-42d2-4816-c1ad-08df38c6891c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 09:49:06.8505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27Q0dKIz4VFnmetu0lo3wrjBraGrZvmx04g6gPtzr6Q1cp8xRXmy4A1hE4Y/pwXagfBWQRKVMXvuuaJJaLfn5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 30-10-2026 11:57, Mallesh, Koujalagi wrote:
>
> On 26-10-2026 11:35 am, Riana Tauro wrote:
>> An uncorrectable internal AER error event is triggered for device fatal
>> errors. If non-fatal error processing is in progress, flush and disable
>> the worker to prevent further processing, as a reset is imminent.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pci_error.c | 33 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.c       | 12 +++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h       |  1 +
>>   drivers/gpu/drm/xe/xe_ras_types.h |  2 ++
>>   4 files changed, 48 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c 
>> b/drivers/gpu/drm/xe/xe_pci_error.c
>> index 9bf0da3a3d15..b27f8a0f1b17 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -5,14 +5,18 @@
>>     #include <linux/pci.h>
>>   +#include <generated/xe_device_wa_oob.h>
>> +
>>   #include "xe_device.h"
>>   #include "xe_gt.h"
>> +#include "xe_hw_error.h"
>>   #include "xe_log.h"
>>   #include "xe_pci.h"
>>   #include "xe_pm.h"
>>   #include "xe_printk.h"
>>   #include "xe_ras.h"
>>   #include "xe_survivability_mode.h"
>> +#include "xe_wa.h"
>>   #include "xe_wedge.h"
>>     static void prepare_device_for_reset(struct pci_dev *pdev)
>> @@ -54,6 +58,26 @@ static pci_ers_result_t 
>> ras_action_to_pci_result(struct pci_dev *pdev, u8 action
>>       }
>>   }
>>   +static bool is_aer_internal_error(struct pci_dev *pdev)
>> +{
>> +    struct pci_dev *usp;
>> +    u16 aer_cap;
>> +    u32 status;
>> +
>> +    usp = xe_pci_get_usp_dev(pdev);
>> +    if (!usp)
>> +        return false;
>> +
>> +    aer_cap = pci_find_ext_capability(usp, PCI_EXT_CAP_ID_ERR);
>> +    if (!aer_cap) {
>> +        dev_warn(&usp->dev, "AER capability unavailable\n");
>> +        return false;
>> +    }
>> +
>> +    pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, 
>> &status);
>> +    return status & PCI_ERR_UNC_INTN;
>> +}
>> +
>>   static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, 
>> pci_channel_state_t state)
>>   {
>>       struct xe_device *xe = pdev_to_xe_device(pdev);
>> @@ -67,6 +91,15 @@ static pci_ers_result_t 
>> xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>>       if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
>>           return PCI_ERS_RESULT_DISCONNECT;
>>   +    /*
>> +     * If non-fatal error processing is in progress when 
>> uncorrectable internal error occurs,
>> +     * flush and disable the worker to prevent further processing, 
>> as a reset is imminent.
>> +     */
>> +    if (XE_DEVICE_WA(xe, 14028434957) && is_aer_internal_error(pdev)) {
>> +        xe_ras_set_aer_path(xe, true);
>
> hmm, we are setting AER path flag true here, do we need to set false? 
> since same flag is used IRQ path as well.
>
> What will happen after setting AER path true and we see Double bit 
> memory errors occurred on IRQ path always,


Please take a look at the last patch for this query.

Thanks
Riana


>
> So the memory page are not going to offline right? how are we going to 
> handle such cases?
>
>
> Thanks
>
> -/Mallesh
>
>> +        xe_hw_error_work_disable(xe);
>> +    }
>> +
>>       switch (state) {
>>       case pci_channel_io_normal:
>>           return PCI_ERS_RESULT_CAN_RECOVER;
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index a91c3d924e8c..42fb24366a6b 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -1170,6 +1170,18 @@ u32 xe_ras_get_max_pages(struct xe_device *xe)
>>       return xe->ras.state.max_pages;
>>   }
>>   +/**
>> + * xe_ras_set_aer_path - Set whether errors are processed via the 
>> AER path
>> + * @xe: xe device instance
>> + * @aer_path: true if errors are processed via the AER path, false 
>> if via irq
>> + *
>> + * Set if errors are processed via AER
>> + */
>> +void xe_ras_set_aer_path(struct xe_device *xe, bool aer_path)
>> +{
>> +    xe->ras.state.aer_path = aer_path;
>> +}
>> +
>>   /**
>>    * xe_ras_init - Initialize Xe RAS
>>    * @xe: xe device instance
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index 1b358c7d040f..06518226db85 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -23,5 +23,6 @@ int xe_ras_init(struct xe_device *xe);
>>   enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device 
>> *xe);
>>   bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
>>   u32 xe_ras_get_max_pages(struct xe_device *xe);
>> +void xe_ras_set_aer_path(struct xe_device *xe, bool aer_path);
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h 
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index a86f9d2b8c92..558df12bcd9b 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -414,6 +414,8 @@ struct xe_ras_set_health_response {
>>    * struct xe_ras_state - RAS device and firmware state
>>    */
>>   struct xe_ras_state {
>> +    /** @aer_path: True if errors are processed via the AER path, 
>> false if via irq */
>> +    bool aer_path;
>>       /** @disable_vram_page_offline: cached configfs policy, 
>> immutable after init */
>>       bool disable_vram_page_offline;
>>       /** @max_pages: Total number of pages that can be stored by 
>> firmware */
