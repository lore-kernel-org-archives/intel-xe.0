Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00263E7718B
	for <intel-xe@archiver.kernel.org>; Fri, 27 Dec 2024 14:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8266810E20C;
	Fri, 27 Dec 2024 14:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k871lY/5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1715810E20C
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Dec 2024 14:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735309497; x=1766845497;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ny0RuMeNxIxBCe8F49lcurObC3pysFXiQ0ksCVs5Byo=;
 b=k871lY/5kH1UHnAhTkbIO7hrncLEMIeBO6qSLUZ98eS1MaAdiirrcFzl
 FllvzymrEMKbGZfQUsU8P+BtqYIo2bM5BMRAbQlemVFxOFCA7EGH/eSqA
 EjxS5AmDKEcO5vu5hX50jsrsIn/m/HDQsT1DRfDmzhhLoaLs/dcuryWNm
 ZxQmHSwBpDHgVZ5h4d86cjy0pFYYOz+wjHepA7SDR3u8vRUn16MgjDeGA
 TvE/1jN/oUgkec+rz2vXc9lDWcWPz4GCI25zSEd1i76V7O/QO5e/5TsOU
 JUY4OEKMrbTvjLZ7UBD2UHfQ7ZZ3U1PCLs3qbPgh1wWSUFEn+MnOW4oiW g==;
X-CSE-ConnectionGUID: a4464VtwQIm8m5QR0fHkEA==
X-CSE-MsgGUID: cryehg8NSuqZ81TudVUbuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="46301174"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; d="scan'208";a="46301174"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2024 06:24:56 -0800
X-CSE-ConnectionGUID: sA4j347GSg+eEs8Wqi77tw==
X-CSE-MsgGUID: fWP0dXkrSCCjM9g/eOAZYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="104238985"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2024 06:24:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 27 Dec 2024 06:24:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 27 Dec 2024 06:24:55 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 27 Dec 2024 06:24:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szJIGjpoSjd7LQJQvCSuiast9DtZU7tnPV6H2zhJZG69B0NUVl+RMINrsrPjav9POjqBxD+f5zrMHkEz8EhtW1I2Pm+iMtf5y5xlObRtb82zNcnjRNF+b7uwG7zwt3tM3gyL2j50jl/Pgul2joFJiRqdgzrN/neKLhS6Jg2sEU8hgemz1rEFDqncb5zC8KMqZZ9vPUp/lhUkIeMVnADmw1jHRlSEZL/Kk+huRzEIhgInjbVvIs5T8gbd6bJP8aUfmCWfoVKRHdX4eomZ6CS+ABSbWfweIShUG+6FKPzKSrwDL2yAcenkP1ajyAbso0cGg/bhlWO5nzTh+7eoO3ldYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ny0RuMeNxIxBCe8F49lcurObC3pysFXiQ0ksCVs5Byo=;
 b=Sh5D8LKdsB6Vf6De7MBSaNTApNnmMFtOpyKUdg1WLkDAtq8pjvHNLMCbCnnRmwKGerl4ZmKaZkf7gGanVFHn9bn3jBWQPuijh4eRAPktVtkRu915NHwdnp3hLyAdEyakljlpyGJaKxH5pfOmc83ibrZw29UwwzrRkRb5r/FnwIGJdRilOGZbZdj0G3eJIR2irSyS/Znf2s4n7BlHtewu56ukM1SKtBM768kA6+twW71w/iwjFmuVUSREKMZahu3IPiYvRRbeMg17VqfU6QonkKg09FfclzpBHXof0SIdnX4aEKfPyBa6aEG1gC8xjyPIlA5RgO/eGMtGM7UfspCblw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by PH8PR11MB8064.namprd11.prod.outlook.com (2603:10b6:510:253::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Fri, 27 Dec
 2024 14:24:22 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%4]) with mapi id 15.20.8293.000; Fri, 27 Dec 2024
 14:24:22 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] Revert "drm/xe: Force write completion of
 MI_STORE_DATA_IMM"
Thread-Topic: [PATCH] Revert "drm/xe: Force write completion of
 MI_STORE_DATA_IMM"
Thread-Index: AQHbV7KCOVvlDN/Ef0Kpcb0t0Xr2yrL5cEiAgAC2W4A=
Date: Fri, 27 Dec 2024 14:24:22 +0000
Message-ID: <4e19a92bbd488944c52aa93f9cbaee7c70295a44.camel@intel.com>
References: <20241226162310.47489-1-jose.souza@intel.com>
 <85a5ch244k.wl-ashutosh.dixit@intel.com>
In-Reply-To: <85a5ch244k.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8185:EE_|PH8PR11MB8064:EE_
x-ms-office365-filtering-correlation-id: bdee3508-0552-4e54-b163-08dd268228a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eldqc3A1TERUT3FFcHlxNmhkUUFpdGYxd0FKOEhHM3RuZFNXZUJmdTVrOHFQ?=
 =?utf-8?B?N2c2MkxNYnB3ZUVUVGwwWDZzZTQ5N2xqd2NqWnh1TnlNWUVLMWlmTnRNTFYz?=
 =?utf-8?B?Mzg0SmRDQ1BlZ3FDNFNDK04wcnp3UEx2YzVSRy9ZdGRhdUJrR3hSMEVjNHJT?=
 =?utf-8?B?bWRrSUxJTUo4NVprSUpzVTRDT21Rd2IyaGxtZmJyNkFSYVkzWHlnWExwUTM4?=
 =?utf-8?B?UWdGZTVMWCtDS2F2bTR5QlVvdlB0V0JuVDZ6M0ZVV3lGYkRYUVVLZ0lnL2pF?=
 =?utf-8?B?c05RdTBoNUJnZTJTR0syTmRBYUN0Zks3OEVkUnRQVWVDb0Q2cjdIWXdzcStk?=
 =?utf-8?B?M3hQb3MzbkY4cUptSjRRd0loWEh5bTRXZUg5NmxDcmNqNXdKeDlCS2QwMUhp?=
 =?utf-8?B?bjBXM2JzbFdvK3Y2TFhZVkxpckxWZkVtcDlmUmRBSUI1V2llZElkaVRFbGVQ?=
 =?utf-8?B?dS9RUzFkTnRqd1N6UDhDcUdPN2NxMDh1aHR6KzJUeEVvZU1lRDdna1V5S3pR?=
 =?utf-8?B?UzJ5WFExR01JRW5jWENFOURNdVUyYTJlUDJwYjZIWElCaFJ0bWpoUm10T3do?=
 =?utf-8?B?bU5pTkJxeDJBRWx3R1hnQzlVRHE1UGtVM3duMmtFZHV6TzdWblBoZ2ZPZW5C?=
 =?utf-8?B?bkYxWFRleVBDR0lvTG5XKzg3blB5V0JvVWRxeFBvRVU1RGQxT2ppblpQeDN6?=
 =?utf-8?B?Q1FNR0pTcndvSmFNMXMxTm1BOVhneE1CUTFLT1cxVXdmSkY3Q1Z6eUZaRURl?=
 =?utf-8?B?NmVUSkZJRklPL2kvdDZmaUtRT3Q5NTNSbDZEeUlGanYxaTJYY285K1lkYjNt?=
 =?utf-8?B?Tm4xU1hoZWtzVXNVQUxGQ0I5UHJZOXcrbG9NaGo2Wms1WWg5QkZ5elZBdVU4?=
 =?utf-8?B?cXV6SW9GRklCVmRmVFUzUzlNWGE3c0NUTUZlU2N4V2QxZVB0bTgra0p4YlJC?=
 =?utf-8?B?eEhrNEd2L3RpNmZKV3ltQlhGbFV1VUhidmFoamVPc2xpR1c1ZjJkR2ZlbW5s?=
 =?utf-8?B?MWZHbXg1Z3FSMlhtdXk2d2FmYkhwUE1uMXFLWDcwWklXSkwzMlNrWFVMc1Rz?=
 =?utf-8?B?Y1pXZU1JRjlnUVBMbmpMNTkySWJueDJBRStVWDVORENRT0ExdlY4MlNQRFFx?=
 =?utf-8?B?OWtSR01xWHpxZHMxVHF5ZzdoWE5BUWFrZ0dMUGJjREdVNFZXa05VTTFsV2Qz?=
 =?utf-8?B?SlYrMjRENU9vYTRMWFQyZkdsZlhTV2o3N2d6T0lyd2lncjhxUjFHazRUREN3?=
 =?utf-8?B?QjZxOVRweWhKM3ZjQzlRWDhZL3ppcWRPTloycWEra2ppZWRqb2Y0aEwrL0Ni?=
 =?utf-8?B?aVBNcXkvazhZdFdyUHJWenNRZW9OZW1KTzlGSjhHbE84bjhFekVMeHF4eUZ4?=
 =?utf-8?B?b2NyOVlEaEkzY2lsL1lqWCtjcTFqUyttMEdNUTc5Mi9RM2oxMWdOaW5JdW1T?=
 =?utf-8?B?ZDkrZm9STFM1VE1sY1VIUVNVZ1VIcThESnNoZWNreC96RkV0dG0reXc0RXAr?=
 =?utf-8?B?Z1BwQUx2aEFjYmg5MGIrRDFLWHRraEI2dnVZekJ0OTlpYW0vcjVONHhHbmR1?=
 =?utf-8?B?NVNmeDFJUkVTbDBIaXk0Vm1DRlFCdUphWG1XYVc2YklWTGxPU1g0QkExVlVj?=
 =?utf-8?B?cHpSYjh3clFlSlNIS1lUUHNFaVByR1YrWmxLY0g4UDF0QStYSlBxQlBnbEwx?=
 =?utf-8?B?RWxQbHA0aWpiYWxlVU1JaFg4Nk5NMis2SEV0dTdaclN3eEkwNFhtazVURDJB?=
 =?utf-8?B?UmRWTVMwVVVmbW1UeUFHSUV3V04zdmtWSmlQZGlPOU9QeS9rWjA0eWZnVEJ4?=
 =?utf-8?B?T0dJd3RwSFJCVlErZ0M0WGNVZTFkazhYSmhiL1ZLaU1nR2VLTWZaSkFpN1BS?=
 =?utf-8?B?Z3Q4K1NVdWs1VXpSRDJwVGtLU0piL21EVTYvemM4b1lGUGgxdmJCd3VTOVJr?=
 =?utf-8?Q?m0F5eex0lLktxBCSpS86V0IICtt/xcen?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlJOWEQ0TXMwUVRPOVBsM3ljWHIyRi9vcHJ4TWw2SGpXZVZaSng5RlNkYTR1?=
 =?utf-8?B?OGIxNFZYNnE5WGE5YmlLdnpnR1BtNEVkSDVWbWMxYUNzNXRBaXNJTFYzS0pX?=
 =?utf-8?B?U3R2WWE4OEYvTFVYN2dVZUJvNUgrS1g4M3dyQWYyL1E3bmdNWlNPdm1lUms5?=
 =?utf-8?B?Vk1wcTRLalJ4cVhWbDJ0RHJqRUdycHJ6OUpKN3M3L2xSVmVXQWJ3ZCt1dkh1?=
 =?utf-8?B?ZHo2RWlPYzhyUmtNWG40ZlptdHJsSS9uR25GbTZDOTdET09NdURpdnA0eWtJ?=
 =?utf-8?B?eVEzTUg4eDY2b2ltZ3dpcGVKZDNkL3UzdjFLSkRHYnA4L042Q0tkSHk3bXky?=
 =?utf-8?B?ZGlZYXdmbFB5cXFQdmZUZThHZFkzNm5MbCtmNDI0TDBhcmNyMWFFNHFJZktO?=
 =?utf-8?B?NEMvcXlOSmZQSVZoa1FBZDFFV1VySDRqMDBwaWxneVp6a2orTTJudm9Sd3h4?=
 =?utf-8?B?emM3cm1PTXdWblVDNFEwVFRyRzBtTzRSaUoxaW52YVJyV0JhUjVxTWdGb0NJ?=
 =?utf-8?B?aDdKNVdtZGpTNGhiNERjUWhzcU1JbXE2RkJRMDljZ0htSmxYN0tKV3NzdzdK?=
 =?utf-8?B?Q3BLL1I1TjhSSFV4TDRHTzltNnpTbFJSREhUUG9kUWcvNEQxM1NxeUZteXQx?=
 =?utf-8?B?ckp2ZUVnaWViV1JVRXZoMFM2M1orWUxVT0hiSzdLRjk0djdiTG1HQUNhdTI5?=
 =?utf-8?B?UGJZZGtlK0ErYmxGMjBLeUhJTzNUOVd2dFljcUtMQW5pRFZyMUlVMk9CMk9K?=
 =?utf-8?B?dDBORm1CRnRtSXZaZ3Q2dFNKU2c1YmFYanR3clpDdVNjMWZPTWNRRkN5ZDkr?=
 =?utf-8?B?VTVsZmhUVzFrZ1NGRW5vbkF6WituUS94MXlwSXpPVk1GRXRzWDdZcnFFczZQ?=
 =?utf-8?B?ME14T1ZIbnNML3NCdFh5RUVUdVN3emlJN2xIM21EeER4SE54U1NsM2p4N1Fx?=
 =?utf-8?B?RnNNd1YyYk5XVnh2YS9xV0xWU2JTV1o3cWFzOHRwcVRVZTJRRG1mM0NzZnlN?=
 =?utf-8?B?elE4dHN3Y3d2K3g0WVpmZmk2dlhtUWhQMjFtSFNER00rZTJGK1hxdC9xRVVw?=
 =?utf-8?B?R2RsOWNSRVRwYklmcVdzZURtUlVPcW1mVlFHM3A1MkFyRmJHUmk4TDZrSXFt?=
 =?utf-8?B?ejdNTEFVNkpnMnRJUjBuZ1MwdmFJcHlWZWZoZnRCUVlEVXhOUmxlS0JKZ0tu?=
 =?utf-8?B?UWlWWjUrQnFLM3o0RlNVSFJPTDBEL0lXbXpQOE9XZkdzTVc2akJZaXQ2aFBk?=
 =?utf-8?B?V2VhanlPY0xOTVppZEtuaUdKdFR3Qk1SYkh5VDdqU2dZemFZVmlZM3Q5WEV4?=
 =?utf-8?B?amhjNStaMThiY3BaY2ZsdHVqMjNOd0F0VnRyK2hTS0ppT1ZFRlhjNE5qeFcz?=
 =?utf-8?B?d1R6QzZHS2JuU1pDd09XajlyYnBpd1NhRjNOaDM2N0VOdFA4aXNraFNPSncx?=
 =?utf-8?B?Vnp2VXdmSGtRVzNvd2hxa3VqUVUzMzQ2RlViS084a0pLTUtEQ05QaXI2dzI3?=
 =?utf-8?B?clBDdDg5TlFRUGVoVmx5bWVRcTNOSmp5NXV5S1VhVy9FZ1pNS0s1TGt5ejdX?=
 =?utf-8?B?OEdIWERpUmdDOGt6Z1YvbE5HT1pnZm4rZjk5dEZjc1BBVE0rT1F2VUVpYmFv?=
 =?utf-8?B?ZFd0UWtjUVBKZDMweXA1SVdDUzNqdXZ3Y0cweUo4SUZZdU9rNVg3aTViR3kv?=
 =?utf-8?B?SElEVVJpT0hFZkNPeExuZ1EvY0d2NkQ3dUZXRGpKaWRpS1UxODhWSDMzNzl2?=
 =?utf-8?B?ZzRES09acG5ydVljVFVDVGw2M3JpaHZPczAzb0Vzb1NVUUdGL2xZZUN0TXpR?=
 =?utf-8?B?VUhxOUpYaDFTYUhnOW1wdXNBNjNVNlFMNXYyVE5IQkNOTy9oRkdGTXNLQkNh?=
 =?utf-8?B?YXlDdFJ3dEVieDNaa3RZdzIrbm5nSFFXSWlTNzJjcUNhckNkOUVTcDhOK2Ir?=
 =?utf-8?B?NU94NWtacFRBdldsVllJQjIvYVdjbXk3UllNL2pwalhsZjladlA0NXNnWDlt?=
 =?utf-8?B?d1Q3MFB3KzBDczdRdWc4dE5UeDVBSENYL3JpdlVGUmh2MXpaQzllTGxYbEFO?=
 =?utf-8?B?MkFpbkdxL1hCMjRLT25xajF3d0dvdXI1dzB3bC8rclhuaG9YUlhVOUNwT2Fm?=
 =?utf-8?Q?NKZaUa1W1w+AM4dpnOWO4Z29w?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <23FB36031CA8C24DB926A698F052F88A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdee3508-0552-4e54-b163-08dd268228a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2024 14:24:22.5851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a3O3egmNyofxiLYdl19T7vP+jIDSeQ5nPQZHHX1wdz8j/Wj26s33D//hwd0SrZD+NHuKptD5FszOgLmbHTem5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8064
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

T24gVGh1LCAyMDI0LTEyLTI2IGF0IDE5OjMxIC0wODAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIFRodSwgMjYgRGVjIDIwMjQgMDg6MjM6MTAgLTA4MDAsIEpvc8OpIFJvYmVydG8gZGUg
U291emEgd3JvdGU6DQo+ID4gDQo+ID4gVGhpcyByZXZlcnRzIGNvbW1pdCAxNDYwYmIxZmVmOWNj
ZjczOTBhZjBkNzRhMTUyNTI0NDJmZDZlZmZkLg0KPiA+IA0KPiA+IEluIGFsbCBwbGFjZXMgdGhl
IE1JX1NUT1JFX0RBVEFfSU1NIGFyZSBub3QgZm9sbG93ZWQgYnkgYSByZWFkIG9mDQo+ID4gdGhl
IHNhbWUgbWVtb3J5IGFkZHJlc3MgaW4gdGhlIHNhbWUgYmF0Y2ggYnVmZmVyIGFuZCB0aGUgcG9z
dGVkIHdyaXRlcw0KPiA+IGFyZSBmbHVzaGVkIHdpdGggUElQRV9DT05UUk9MIG9yIE1JX0ZMVVNI
X0RXIGluIHhlX3Jpbmdfb3BzLmMgZnVuY3Rpb25zDQo+ID4gc28gdGhlcmUgaXMgbm8gbmVlZCB0
byBzZXQgdGhpcyByZWdpc3Rlci4NCj4gDQo+IEFzIEkgd2FzIHNheWluZyB0aGlzIGNvbW1pdCBt
ZXNzYWdlIHNob3VsZCBqdXN0IGJlOg0KPiANCj4gSW4gYWxsIHBsYWNlcyB3aGVyZSBNSV9TVE9S
RV9EQVRBX0lNTSBpcyB1c2VkLCBwb3N0ZWQgd3JpdGVzIGFyZSBmbHVzaGVkDQo+IHdpdGggUElQ
RV9DT05UUk9MIG9yIE1JX0ZMVVNIX0RXIGluIHhlX3Jpbmdfb3BzLmMgZnVuY3Rpb25zLCBzbyB0
aGVyZSBpcyBubw0KPiBuZWVkIHRvIHNldCB0aGlzIHJlZ2lzdGVyLg0KPiANCj4gU28gYWNjb3Jk
aW5nIHRvIG1lIHRoZSAiYXJlIG5vdCBmb2xsb3dlZCBieSBhIHJlYWQgb2YgdGhlIHNhbWUgbWVt
b3J5DQo+IGFkZHJlc3MgaW4gdGhlIHNhbWUgYmF0Y2ggYnVmZmVyIiBpcyBpbmNvcnJlY3QsIGl0
IHdpbGwgd29yayBldmVuIHdpdGhvdXQNCj4gc2V0dGluZyB0aGUgZmxhZy4NCg0KTm90IG9uIFhl
MissIHdpdGggQ1NfUFJJT1JJVFlfTUVNX1JFQUQgc2V0IHRoZXJlIGlzIGEgcHJpb3JpdHkgcGF0
aCB0byBtZW1vcnkgZm9yIHJlYWRzIGFuZCBvdGhlciBmb3Igd3JpdGVzLg0KDQo+IA0KPiBBbnl3
YXkgYXBhcnQgZnJvbSB0aGF0IG5pdCwgdGhpcyBpczoNCj4gDQo+IFJldmlld2VkLWJ5OiBBc2h1
dG9zaCBEaXhpdCA8YXNodXRvc2guZGl4aXRAaW50ZWwuY29tPg0KPiANCj4gPiANCj4gPiBDYzog
VGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiA+
IENjOiBBc2h1dG9zaCBEaXhpdCA8YXNodXRvc2guZGl4aXRAaW50ZWwuY29tPg0KPiA+IEZpeGVz
OiAxNDYwYmIxZmVmOWMgKCJkcm0veGU6IEZvcmNlIHdyaXRlIGNvbXBsZXRpb24gb2YgTUlfU1RP
UkVfREFUQV9JTU0iKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEg
PGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUv
aW5zdHJ1Y3Rpb25zL3hlX21pX2NvbW1hbmRzLmggfCAxMyArKysrKystLS0tLS0tDQo+ID4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMgICAgICAgICAgICAgICAgICB8IDExICsrKy0t
LS0tLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jICAgICAgICAgICAg
ICAgICB8ICA2ICsrLS0tLQ0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDE5IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUvaW5zdHJ1Y3Rpb25zL3hlX21pX2NvbW1hbmRzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUvaW5z
dHJ1Y3Rpb25zL3hlX21pX2NvbW1hbmRzLmgNCj4gPiBpbmRleCBmNGVlOTEwZjA5NDMyLi4xMGVj
MjkyMGQzMWIzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS9pbnN0cnVjdGlv
bnMveGVfbWlfY29tbWFuZHMuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9pbnN0cnVj
dGlvbnMveGVfbWlfY29tbWFuZHMuaA0KPiA+IEBAIC0zMywxMyArMzMsMTIgQEANCj4gPiAgI2Rl
ZmluZSBNSV9UT1BPTE9HWV9GSUxURVIJCV9fTUlfSU5TVFIoMHhEKQ0KPiA+ICAjZGVmaW5lIE1J
X0ZPUkNFX1dBS0VVUAkJCV9fTUlfSU5TVFIoMHgxRCkNCj4gPiANCj4gPiAtI2RlZmluZSBNSV9T
VE9SRV9EQVRBX0lNTQkJCV9fTUlfSU5TVFIoMHgyMCkNCj4gPiAtI2RlZmluZSAgIE1JX1NESV9H
R1RUCQkJCVJFR19CSVQoMjIpDQo+ID4gLSNkZWZpbmUgICBNSV9GT1JDRV9XUklURV9DT01QTEVU
SU9OX0NIRUNLCVJFR19CSVQoMTApDQo+ID4gLSNkZWZpbmUgICBNSV9TRElfTEVOX0RXCQkJCUdF
Tk1BU0soOSwgMCkNCj4gPiAtI2RlZmluZSAgIE1JX1NESV9OVU1fRFcoeCkJCQlSRUdfRklFTERf
UFJFUChNSV9TRElfTEVOX0RXLCAoeCkgKyAzIC0gMikNCj4gPiAtI2RlZmluZSAgIE1JX1NESV9O
VU1fUVcoeCkJCQkoUkVHX0ZJRUxEX1BSRVAoTUlfU0RJX0xFTl9EVywgMiAqICh4KSArIDMgLSAy
KSB8IFwNCj4gPiAtCQkJCQkJIFJFR19CSVQoMjEpKQ0KPiA+ICsjZGVmaW5lIE1JX1NUT1JFX0RB
VEFfSU1NCQlfX01JX0lOU1RSKDB4MjApDQo+ID4gKyNkZWZpbmUgICBNSV9TRElfR0dUVAkJCVJF
R19CSVQoMjIpDQo+ID4gKyNkZWZpbmUgICBNSV9TRElfTEVOX0RXCQkJR0VOTUFTSyg5LCAwKQ0K
PiA+ICsjZGVmaW5lICAgTUlfU0RJX05VTV9EVyh4KQkJUkVHX0ZJRUxEX1BSRVAoTUlfU0RJX0xF
Tl9EVywgKHgpICsgMyAtIDIpDQo+ID4gKyNkZWZpbmUgICBNSV9TRElfTlVNX1FXKHgpCQkoUkVH
X0ZJRUxEX1BSRVAoTUlfU0RJX0xFTl9EVywgMiAqICh4KSArIDMgLSAyKSB8IFwNCj4gPiArCQkJ
CQkgUkVHX0JJVCgyMSkpDQo+ID4gDQo+ID4gICNkZWZpbmUgTUlfTE9BRF9SRUdJU1RFUl9JTU0J
CV9fTUlfSU5TVFIoMHgyMikNCj4gPiAgI2RlZmluZSAgIE1JX0xSSV9MUk1fQ1NfTU1JTwkJUkVH
X0JJVCgxOSkNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUu
YyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMNCj4gPiBpbmRleCA4YjMyZmFkNjc4
NzgyLi4xYjk3ZDkwYWFkZGFmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9taWdyYXRlLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jDQo+
ID4gQEAgLTU4MSw5ICs1ODEsNyBAQCBzdGF0aWMgdm9pZCBlbWl0X3B0ZShzdHJ1Y3QgeGVfbWln
cmF0ZSAqbSwNCj4gPiAJd2hpbGUgKHB0ZXMpIHsNCj4gPiAJCXUzMiBjaHVuayA9IG1pbihNQVhf
UFRFX1BFUl9TREksIHB0ZXMpOw0KPiA+IA0KPiA+IC0JCWJiLT5jc1tiYi0+bGVuKytdID0gTUlf
U1RPUkVfREFUQV9JTU0gfA0KPiA+IC0JCQkJICAgIE1JX0ZPUkNFX1dSSVRFX0NPTVBMRVRJT05f
Q0hFQ0sgfA0KPiA+IC0JCQkJICAgIE1JX1NESV9OVU1fUVcoY2h1bmspOw0KPiA+ICsJCWJiLT5j
c1tiYi0+bGVuKytdID0gTUlfU1RPUkVfREFUQV9JTU0gfCBNSV9TRElfTlVNX1FXKGNodW5rKTsN
Cj4gPiAJCWJiLT5jc1tiYi0+bGVuKytdID0gb2ZzOw0KPiA+IAkJYmItPmNzW2JiLT5sZW4rK10g
PSAwOw0KPiA+IA0KPiA+IEBAIC0xMjI1LDkgKzEyMjMsNyBAQCBzdGF0aWMgdm9pZCB3cml0ZV9w
Z3RhYmxlKHN0cnVjdCB4ZV90aWxlICp0aWxlLCBzdHJ1Y3QgeGVfYmIgKmJiLCB1NjQgcHBndHRf
b2ZzLA0KPiA+IAkJaWYgKCEoYmItPmxlbiAmIDEpKQ0KPiA+IAkJCWJiLT5jc1tiYi0+bGVuKytd
ID0gTUlfTk9PUDsNCj4gPiANCj4gPiAtCQliYi0+Y3NbYmItPmxlbisrXSA9IE1JX1NUT1JFX0RB
VEFfSU1NIHwNCj4gPiAtCQkJCSAgICBNSV9GT1JDRV9XUklURV9DT01QTEVUSU9OX0NIRUNLIHwN
Cj4gPiAtCQkJCSAgICBNSV9TRElfTlVNX1FXKGNodW5rKTsNCj4gPiArCQliYi0+Y3NbYmItPmxl
bisrXSA9IE1JX1NUT1JFX0RBVEFfSU1NIHwgTUlfU0RJX05VTV9RVyhjaHVuayk7DQo+ID4gCQli
Yi0+Y3NbYmItPmxlbisrXSA9IGxvd2VyXzMyX2JpdHMoYWRkcik7DQo+ID4gCQliYi0+Y3NbYmIt
PmxlbisrXSA9IHVwcGVyXzMyX2JpdHMoYWRkcik7DQo+ID4gCQlpZiAocHRfb3AtPmJpbmQpDQo+
ID4gQEAgLTEzOTIsOCArMTM4OCw3IEBAIF9feGVfbWlncmF0ZV91cGRhdGVfcGd0YWJsZXMoc3Ry
dWN0IHhlX21pZ3JhdGUgKm0sDQo+ID4gCQkJdTMyIGlkeCA9IDA7DQo+ID4gDQo+ID4gCQkJYmIt
PmNzW2JiLT5sZW4rK10gPSBNSV9TVE9SRV9EQVRBX0lNTSB8DQo+ID4gLQkJCQkJICAgIE1JX0ZP
UkNFX1dSSVRFX0NPTVBMRVRJT05fQ0hFQ0sgfA0KPiA+IC0JCQkJCSAgICBNSV9TRElfTlVNX1FX
KGNodW5rKTsNCj4gPiArCQkJCU1JX1NESV9OVU1fUVcoY2h1bmspOw0KPiA+IAkJCWJiLT5jc1ti
Yi0+bGVuKytdID0gb2ZzOw0KPiA+IAkJCWJiLT5jc1tiYi0+bGVuKytdID0gMDsgLyogdXBwZXJf
MzJfYml0cyAqLw0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cmluZ19vcHMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jDQo+ID4gaW5kZXgg
YzhhYjM3ZmEwZDE5OC4uOWYzMjdmMjdjMDcyNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfcmluZ19vcHMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9y
aW5nX29wcy5jDQo+ID4gQEAgLTcyLDggKzcyLDcgQEAgc3RhdGljIGludCBlbWl0X3VzZXJfaW50
ZXJydXB0KHUzMiAqZHcsIGludCBpKQ0KPiA+IA0KPiA+ICBzdGF0aWMgaW50IGVtaXRfc3RvcmVf
aW1tX2dndHQodTMyIGFkZHIsIHUzMiB2YWx1ZSwgdTMyICpkdywgaW50IGkpDQo+ID4gIHsNCj4g
PiAtCWR3W2krK10gPSBNSV9TVE9SRV9EQVRBX0lNTSB8IE1JX1NESV9HR1RUIHwNCj4gPiAtCQkg
IE1JX0ZPUkNFX1dSSVRFX0NPTVBMRVRJT05fQ0hFQ0sgfCBNSV9TRElfTlVNX0RXKDEpOw0KPiA+
ICsJZHdbaSsrXSA9IE1JX1NUT1JFX0RBVEFfSU1NIHwgTUlfU0RJX0dHVFQgfCBNSV9TRElfTlVN
X0RXKDEpOw0KPiA+IAlkd1tpKytdID0gYWRkcjsNCj4gPiAJZHdbaSsrXSA9IDA7DQo+ID4gCWR3
W2krK10gPSB2YWx1ZTsNCj4gPiBAQCAtMTYzLDggKzE2Miw3IEBAIHN0YXRpYyBpbnQgZW1pdF9w
aXBlX2ludmFsaWRhdGUodTMyIG1hc2tfZmxhZ3MsIGJvb2wgaW52YWxpZGF0ZV90bGIsIHUzMiAq
ZHcsDQo+ID4gIHN0YXRpYyBpbnQgZW1pdF9zdG9yZV9pbW1fcHBndHRfcG9zdGVkKHU2NCBhZGRy
LCB1NjQgdmFsdWUsDQo+ID4gCQkJCSAgICAgICB1MzIgKmR3LCBpbnQgaSkNCj4gPiAgew0KPiA+
IC0JZHdbaSsrXSA9IE1JX1NUT1JFX0RBVEFfSU1NIHwgTUlfRk9SQ0VfV1JJVEVfQ09NUExFVElP
Tl9DSEVDSyB8DQo+ID4gLQkJICBNSV9TRElfTlVNX1FXKDEpOw0KPiA+ICsJZHdbaSsrXSA9IE1J
X1NUT1JFX0RBVEFfSU1NIHwgTUlfU0RJX05VTV9RVygxKTsNCj4gPiAJZHdbaSsrXSA9IGxvd2Vy
XzMyX2JpdHMoYWRkcik7DQo+ID4gCWR3W2krK10gPSB1cHBlcl8zMl9iaXRzKGFkZHIpOw0KPiA+
IAlkd1tpKytdID0gbG93ZXJfMzJfYml0cyh2YWx1ZSk7DQo+ID4gLS0NCj4gPiAyLjQ3LjENCj4g
PiANCg0K
