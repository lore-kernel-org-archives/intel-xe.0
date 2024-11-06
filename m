Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF5CD59F73
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 21:32:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61A810E319;
	Wed,  6 Nov 2024 21:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HYfuhaWB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE38310E319
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 21:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730928770; x=1762464770;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=Qg8OxULfvlyZsslOM/lj9u0krw2cnlaX/CMRFoj3ETk=;
 b=HYfuhaWB9LR1NMorEedfQE0lrEukiy3IVtdW/RahrQhG4OQHO0RNrSmB
 8HlTB4nGrvcPTE6FBOcfzkRlCs8UKuxmvzP0WX0ZET7p9+mTv7BX2F7Ck
 rabSxSJZVXDHhue/WNNl3cuQW3EfJDN/S6Km+jZaD3Jz3ksU8tnWY0GXr
 b26gFbqTBjdz7tfcFQgOT32ts7iAUm6OHnS2RZ9JJr85Z4Ac9X9xnprIO
 iXYWrvZs/a7lysIMT0VRh8ibhmucnsnmoSgCOhQrIEeeZiYmhBSLEfF3Q
 HoV/66UypWtrd7VDFswcgYR32GV5fFrjbbM6O8sOYUbVLk2HA9iNzb6tv A==;
X-CSE-ConnectionGUID: Gg6wInBbQsSi1TtIOWa8tw==
X-CSE-MsgGUID: MU3zaJueSJKbm6HcouwPUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41303512"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41303512"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 13:32:50 -0800
X-CSE-ConnectionGUID: wglAh8YtQ+iGL8tWQ7xcuA==
X-CSE-MsgGUID: tPdwn4mUT/aCd5bBT1obhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="115570619"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 13:32:49 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 13:32:48 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 13:32:48 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 13:32:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8YSeNNm8dJZtVsuIOOYKXwr++lN1Mla7ObkzOAIuNdJjyhpDPzPzLRj69dG1v8vJ+RN9PwJUhSEf/Vn+/MK3cqwqUeOtTmfswZgcHQhuv/gpRgjRXhyGtnvmOm7V8KMebrtR53aX5wd8sJABBvXLNvhKQr64zZDx/Al1GWBt5eSs7+kioQ4FAQ7GkBFlxUzFe1pzSB8F5GKax/+v3VBm3KVy5y1XAwOuP3INqR2KnklGL0wNlq1pVqfjZZ4eV8AWnej7hVha/dngBbLMRx0WcMqz7p9BoCuVEi+34Kckuw+HIyT3HCSqgpEg+xdP0PsBm4VHGrMHEpV3d/zKrt2uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qg8OxULfvlyZsslOM/lj9u0krw2cnlaX/CMRFoj3ETk=;
 b=GftETxwANEI3DCXcppxCuF+8JVCX6MhV35W+LWf5HF2YEA+NZtC4jC5d4u1H4hLoc0eDg4ne6ipL8CyKHUN3Wv3kYSUIfykREPSWHHEGWgMo8mi1HZRSao4XcK1xHsC5wxeiRmjc2VJqKduA4S6hN0Q/m4nUCBANQUyj3QMhZQj4+iIgMXgfIIHcLaom+BowRbYQTyOl2Reptg/Uq9GZwSm5lHKY8TtA3BewnqFkZxGe84UNYcK/CwuMwHKVTTWeXNJEWWQF8y1Vmu3LrTD5ya84dpca+fE8de62fXfueYRl/2/KiVYwFgeUNx5qgXdWNwveQXisoOn+z+9reqEB1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CO1PR11MB4929.namprd11.prod.outlook.com (2603:10b6:303:6d::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.19; Wed, 6 Nov 2024 21:32:45 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%6]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 21:32:45 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe/gsc: Improve SW proxy error checking and logging
Thread-Topic: [PATCH] drm/xe/gsc: Improve SW proxy error checking and logging
Thread-Index: AQHbL+I91K9JhQmdaUiCVC5Dv96ypLKqxw+A
Date: Wed, 6 Nov 2024 21:32:45 +0000
Message-ID: <ff7c3a68ff23eb99b6e56b4067f1a7996a18c0bd.camel@intel.com>
References: <20241106002402.486700-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20241106002402.486700-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CO1PR11MB4929:EE_
x-ms-office365-filtering-correlation-id: dcf6ff29-c31e-4bc4-6a51-08dcfeaa8da8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UHlzLzdWVzl1TXhqVUI1N3ZUamlWbHUrbE5JTVdTejJQekIySGFPRFIraGp3?=
 =?utf-8?B?YXB4bXZ6Zko0V1BtUDdFUUdzNVN1eS85TlVQMVhQVG9HWHdJdS92RFp6dTlT?=
 =?utf-8?B?Z0pSU004OUwwNUxtSm0rQmYyK1hJREpUM3ZYN0lLamtiQk9iUzVNREhpUkNt?=
 =?utf-8?B?bXR4bE9mWS9ocytJK0lrdTFoZGZENUoxbVptc20raFpRWmV2V2VhbHFCQ2Mz?=
 =?utf-8?B?TUFtNFZPa2dsa2RNVnYwYW1Rek9TZ1h2V3QzNk1FaGZ1akFSUjYrMTFzZThh?=
 =?utf-8?B?eE1wbVZsbkpWaHRKRVBLM3ovYWxHdFoyQnR0d3lYU1hhMlRPRVcwdmxITjl2?=
 =?utf-8?B?MWJQTWVaeHQ1LzBCUCtQN1NGOG9HVWFzSEluUUxpZm1iaUNlckEyY2I3Z0NF?=
 =?utf-8?B?Q2NWUnRaOWlOVU1pOUZKUXNid1cxNkMzR3AyRTdOM1VIZFp2d1M5Q0Freks1?=
 =?utf-8?B?T0tTUU5lb2dKVUE2ZjlJdFQyQkc5STMvUmk1SUtEd1VQWmVUblpDWlNmdHgw?=
 =?utf-8?B?SGQrM1J5UGI5UmE5MVFXMnNzdW9IcFR3N2VqSVZaV3dwbEFOU3pndUFJd3E0?=
 =?utf-8?B?MGRpcE81YmJWTkJqc1Bvb25tNTByakoxdVFwTXdzbjBhdzkxWjlUM0VpMWZ1?=
 =?utf-8?B?SVAwUlJWWC96dWZUYzZPaWR3QXN2aVpHSnNRM3Y5aFVmU2I5cENIMkhoemlD?=
 =?utf-8?B?Yy9LT0QvR01OQlM4NXE2VmtCZ2M0OUdpV3N2ZEkwTTZ1TitKdkhieGlZZTBu?=
 =?utf-8?B?Z3hrWTJKMTBGUG9VYTdJRFkyRlQ1eUVod3gweEZxTUZnMGRqZ0ZUWEp3dWdz?=
 =?utf-8?B?REl5dVh4ZTE0bVREWDdOdzNISXRiWWJCbFRmcHVKTC9hZDVGYlZDY3ltSERJ?=
 =?utf-8?B?WW5YUTBwTlRpaDVUZXBjU2xQR0JOR21RaEVxUHMxV0V4Q0pDazBBZDZlTjV2?=
 =?utf-8?B?a1AvSXkvQ2JNMnN5QjlkNzFsYVBDVFZXVEl0Q3dQUzVhZ1ViRFhFd2c3dE94?=
 =?utf-8?B?bFMzUnV3RXRZV2pDRG1qdHljcmhQTUdrWWhEdHpaUVBQVEMzcDBmRERjNk1S?=
 =?utf-8?B?QUVIbWt1MHlyYWhLemdXbHNtV1NwbHE1VnZxWXRDOE80dDJQL01HVWZQeXVL?=
 =?utf-8?B?RmQrdG9DSHhpcE5HcWdOTldCcEJ1VUtBYTgzcXZjTWVwYk03ZFBEc1QxM2Vz?=
 =?utf-8?B?MHRmWUFyYUo2R0M2OFhscU9OZlBxTG9KR2swNkU2U0syMnk3aVJKS2pvdnc0?=
 =?utf-8?B?ZVJ1Qm1LZWFZY1RNYWx0aHBWOTRqN2FMQlNCMUtoMXMwNmVoaFFkSTZWcnNB?=
 =?utf-8?B?b2p5c3lJZTNxbnRLaWhldk9teThuaklyRzJ1V2JWQmp3NWUySlhPckV5M1JK?=
 =?utf-8?B?UCtaRGFScjh6bG81cEJrMDk3Ny9oZGZPQWgyMnN1UFV1MDVlRWVUL1FDRGRj?=
 =?utf-8?B?ci9VMnNnRDdVOVMxVmRJMno1NjFHQytkUTF1SERZWlBjT1hyVWZrMm5rZlVK?=
 =?utf-8?B?YU9DRzdCQVBUd1k4clgyb05MTXJtVTMrWnVjS2JVVkxwTllPeldHTjRVVDB0?=
 =?utf-8?B?dWpjcXpYa216cUNwY2J2dXpNS1dydDNnbmdHZUhDZ01qUHRRM3ZwWkZ4OVA2?=
 =?utf-8?B?ZVVOZElKQTl4ck5GaTVwZVB5ditwV2JBTFpTNTFNMHZQaFZaTTJlU2VzVTVG?=
 =?utf-8?B?YS94c3MrYkVscVNuRWtGUDVYQUhMUk40MlVES0wwZXVjNmVLaVNnQ2N2dFpk?=
 =?utf-8?B?TFFXNGtIakFSbm5EVWs1cmJ1bzhWd1kzNlNPY0xyVUc4SjdPMHBwUW1aNXg5?=
 =?utf-8?Q?mIxABYn3wTMXA1fkXQ8XVNXg+Kwfm0V6LIXeM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUF0QmdkQVdhSVhBZ09pZmxnWld2L3MyaElleVV6T2I2YWd3VnVwK3lVQXdu?=
 =?utf-8?B?Mnk5Y2ZFVUcwOHhzeGNmTytCNitIOHMwNmRRV0hMa2o4MnpwVkNOVTl5RXNM?=
 =?utf-8?B?cmhlNXVJZDRJeTZaSVdTa0NRRlJDdjI3elREV3VnTVhXY2lyTS9Cay9UYzRL?=
 =?utf-8?B?RTBweVkyRC9RRktRNERvU2hBTnR4Vkhpd1dsMFhORE1PYUVOVFY3cUZHTGww?=
 =?utf-8?B?YVFoSmR6ejd3YUEwMW1vSkV6d2dObEtCREpueU9VU003cXplb29KR0YraVh0?=
 =?utf-8?B?aGNwWC96cXZZSHZvZ05DQ2ZEN0dRQTNBRFlrUGk0a2ZuT2VmNHFkRGVhSXBu?=
 =?utf-8?B?ZFRDKzNqeXpTT0kxek1UQmRadi9HQnBFemxiZ1AwV3RQbHBzRXh1VHp2Q05N?=
 =?utf-8?B?UERiUFpIWlBBelNQbDZjeGlFeWdDY0xqQ3ZNMnZSTXk0L2RHZEM0Yk8wRmVh?=
 =?utf-8?B?Y0Jlem9vODJiZlFuTXNMZ0JaZmZvWG8wTXRJdGtydGZnN1BUbWwrVmp4SEc0?=
 =?utf-8?B?UXpybXFWcVg5TSt3Q3c0bFNEZjdXc0x2MUU1akd2WE1OSU9tekJPVDdkTTcy?=
 =?utf-8?B?STF2bkdmaFpta1pPZjlzYXRRR0oyaG1DYldheTdsaUZGaEdqSExvTmFla3ox?=
 =?utf-8?B?dm5vZTJ2YzJIcHRoZDVQQkx5TEdIcXkwSTI5M2lDendOZFdSbWJxSEl4UnIz?=
 =?utf-8?B?TnFncEVzZmVDcld6amw5K3NENytkTlRkNlFvOFU4a2ZPbWQ3YXNWUE1VbTA0?=
 =?utf-8?B?WThDZXBNWnpiVlVkSmZFSEdMaXZQbEhqelJQTFFVTE9HUDV5TW1IWi96enJB?=
 =?utf-8?B?a2p1RDJDQlQwOVM1ZjE0a0RMQ0Q0NnBpYVc3WTZGRXZvcENoMFVWR1ExVjdr?=
 =?utf-8?B?a2QyV0hVL0Fzamkvc3JiMVJoSm83d1VnMUJrcXNSUEh2TTlmM1ljMmNVSW40?=
 =?utf-8?B?MXNZMWlERC9hVlpmWFBqcUJkYWp2OGRwZERkMFpVYVQ1Z3Q3WUpxTk14UFZt?=
 =?utf-8?B?QUlBRDA1Wlo2ZmlHMDFYRVhvUFlxbWVrU0VuajhpYVRtdEgvTzBGeGV1WCtU?=
 =?utf-8?B?empWK2tIY2JRZ1pOZi9iajNJZXV6NmJkU2hTQWZjNGRmUGIya25aR1N0aHhI?=
 =?utf-8?B?TkJPSWRXWXB0VnFDZFZzOEtmQ211Tld2UFVZSCtjMi9Oc3ZMMUR0QWlWU1hT?=
 =?utf-8?B?MUZPWjluNFBOMDVmL0ZvcmJoZlBTT3EwNWFNQnBnQTE1MnY1aUJzakt3cXVD?=
 =?utf-8?B?SmpCK2hUdTFIeHFmUzZtcFE0L081NkNCYmNBWVRTZjBZMWR2OEJna0x1SXVs?=
 =?utf-8?B?eHMwUmtXQ1lDa2ZFZHZWV3Fud05jdWZ4VzNheFgrcXpIdDJFRmJ1am9DYUNY?=
 =?utf-8?B?aXdCNW1YZkxQOENvMWRuNWVpME82Yk5vaUtJQytpbzVuNjhGU1E5VTJpSWJG?=
 =?utf-8?B?SndlMzRJNDF4ZHZOLys2VVZwYkpRcWZ4cEFwZ1g5TmFBZ3N1MXhZS1VOL1pu?=
 =?utf-8?B?L1E3ZkRiKzNNOXZtb3doNkJHYXphR3A4RWtNSkc3SWZ4bmVEbkh2RzFqdENk?=
 =?utf-8?B?OUpFdXJ1bmpRcGxjOFdqTUpjbDdLMTZGS3NOVzlkRGhvMlMzRHRaMEJmblRx?=
 =?utf-8?B?YS9pMS9zRHB6Y1BGcWR5VldDc2pObndqNmRzNHN0bDYwY1RPN3d4TFlHOG4x?=
 =?utf-8?B?UnJqb2dxdkxNWHBLMDAwaDlXRzFnNjBmUitNWkVHbWkvb3A1ekVsUHQ5RkN3?=
 =?utf-8?B?cWF1NUlLMFp1MUduSFRuWVBocW82YWh3WWlRMnFYeWJMSWxiSURzdDNhTG5Z?=
 =?utf-8?B?YUJOd0d4YWQyVktZN3UxSGRHTGovSXJibWhURVlTR040WWJrdVBIS1crdm94?=
 =?utf-8?B?dHdkemVSRGlJbDdOaFdaYzFNS1ZZeFhjWk5NcWtjNlZtaC9YVjVldlg5KzlL?=
 =?utf-8?B?NG1JRi9UaEhvVmpnL0FQZ0l2Z2dIZTZ0L3lndGFVVXdhUFppMVUwMXFEOC9a?=
 =?utf-8?B?bDljdzIrd0htT1VHaGx2MmNUUGt2M2EyeWFoeTkrQnNyeDg4bStZZGZmSWlO?=
 =?utf-8?B?alFmSWV3NWdacDZXZjBVaTZ3SnNlRXdTd3NYZFNUVnFmbDExenVkMy83NGpM?=
 =?utf-8?B?YmRXU29rNkNDV2d1SHVQZG9rVzM1a1pOaUxubFVYT0lhbnA4VGtwYVo1QjV4?=
 =?utf-8?Q?LbSBvBGZ6u1Val5ckuTVxI4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <25342E10F4463845964CA03031B7DA05@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf6ff29-c31e-4bc4-6a51-08dcfeaa8da8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 21:32:45.3911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leuo37WhUfp8dkP1xDieUFXW7rYtLzmZbb9+Iay7sGQB3ehjVJJ3JWJASQckf8C/XG7pGHMlm/FAMk52w6n0Kt8Ph5GpqqprqSVk6JF8ickIOG7KxNJ+5rOVCntSgvmm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4929
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

U2ltcGxlIHBhdGNoLCBMR1RNLAoKUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZp
bi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPgoKT24gVHVlLCAyMDI0LTExLTA1IGF0IDE2OjI0IC0w
ODAwLCBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIHdyb3RlOgo+IElmIGFuIGVycm9yIG9jY3VycyBp
biB0aGUgR1NDPC0+Q1NNRSBoYW5kc2hha2UsIHRoZSBHU0Mgd2lsbCBzZW5kIGEKPiBQUk9YWV9F
TkQgbXNnIHRvIHRoZSBkcml2ZXIgd2l0aCB0aGUgc3RhdHVzIHNldCB0byBhbiBlcnJvciBjb2Rl
LiBXZQo+IGN1cnJlbnRseSBkb24ndCBjaGVjayB0aGUgc3RhdHVzIHdoZW4gcmVjZWl2aW5nIGEg
UFJPWFlfRU5EIG1lc3NhZ2UgYW5kCj4gaW5zdGVhZCBjaGVjayB0aGUgcHJveHkgaW5pdGlhbGl6
YXRpb24gc3RhdHVzIGluIHRoZSBGV1NUUyByZWc7Cj4gdGhlcmVmb3JlLCB3aGlsZSBzdGlsbCBj
YXRjaGluZyBhbnkgaW5pdGlhbGl6YXRpb24gZmFpbHVyZXMsIHdlIGxvc2UgdGhlCj4gYWN0dWFs
IHJldHVybmVkIGVycm9yIGNvZGUuIFRoaXMgY2FuIGJlIGVhc2lseSBpbXByb3ZlZCBieSBjaGVj
a2luZyB0aGUKPiBzdGF0dXMgdmFsdWUgYW5kIHByaW50aW5nIGl0IHRvIGRtZXNnIGlmIGl0J3Mg
YW4gZXJyb3IuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFu
aWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4KPiBDYzogQWxhbiBQcmV2aW4gPGFsYW4ucHJl
dmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3NjX3Byb3h5LmMgfCA0NyArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4gwqAx
IGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9nc2NfcHJveHkuYyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9nc2NfcHJveHkuYwo+IGluZGV4IGZjNjRiNDVkMzI0Yi4uMjRjYzZhNGY5YTk2
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9nc2NfcHJveHkuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9nc2NfcHJveHkuYwo+IEBAIC0xMzksMTcgKzEzOSwyOSBA
QCBzdGF0aWMgaW50IHByb3h5X3NlbmRfdG9fZ3NjKHN0cnVjdCB4ZV9nc2MgKmdzYywgdTMyIHNp
emUpCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+IMKgfQo+IMKgCj4gLXN0YXRpYyBpbnQg
dmFsaWRhdGVfcHJveHlfaGVhZGVyKHN0cnVjdCB4ZV9nc2NfcHJveHlfaGVhZGVyICpoZWFkZXIs
Cj4gK3N0YXRpYyBpbnQgdmFsaWRhdGVfcHJveHlfaGVhZGVyKHN0cnVjdCB4ZV9ndCAqZ3QsCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHN0cnVjdCB4ZV9nc2NfcHJveHlfaGVhZGVyICpoZWFkZXIsCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIg
c291cmNlLCB1MzIgZGVzdCwgdTMyIG1heF9zaXplKQo+IMKgewo+IMKgwqDCoMKgwqDCoMKgwqB1
MzIgdHlwZSA9IEZJRUxEX0dFVChHU0NfUFJPWFlfVFlQRSwgaGVhZGVyLT5oZHIpOwo+IMKgwqDC
oMKgwqDCoMKgwqB1MzIgbGVuZ3RoID0gRklFTERfR0VUKEdTQ19QUk9YWV9QQVlMT0FEX0xFTkdU
SCwgaGVhZGVyLT5oZHIpOwo+ICvCoMKgwqDCoMKgwqDCoGludCByZXQgPSAwOwo+IMKgCj4gLcKg
wqDCoMKgwqDCoMKgaWYgKGhlYWRlci0+ZGVzdGluYXRpb24gIT0gZGVzdCB8fCBoZWFkZXItPnNv
dXJjZSAhPSBzb3VyY2UpCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAt
RU5PRVhFQzsKPiArwqDCoMKgwqDCoMKgwqBpZiAoaGVhZGVyLT5kZXN0aW5hdGlvbiAhPSBkZXN0
IHx8IGhlYWRlci0+c291cmNlICE9IHNvdXJjZSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZXQgPSAtRU5PRVhFQzsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Z290byBvdXQ7Cj4gK8KgwqDCoMKgwqDCoMKgfQo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgaWYgKGxl
bmd0aCArIFBST1hZX0hEUl9TSVpFID4gbWF4X3NpemUpCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHJldHVybiAtRTJCSUc7Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKGxlbmd0aCArIFBS
T1hZX0hEUl9TSVpFID4gbWF4X3NpemUpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0ID0gLUUyQklHOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIG91
dDsKPiArwqDCoMKgwqDCoMKgwqB9Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoC8qIFdlIG9ubHkgY2Fy
ZSBhYm91dCB0aGUgc3RhdHVzIGlmIHRoaXMgaXMgYSBtZXNzYWdlIGZvciB0aGUgZHJpdmVyICov
Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKGRlc3QgPT0gR1NDX1BST1hZX0FERFJFU1NJTkdfS01EICYm
IGhlYWRlci0+c3RhdHVzICE9IDApIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmV0ID0gLUVJTzsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBvdXQ7Cj4g
K8KgwqDCoMKgwqDCoMKgfQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHN3aXRjaCAodHlwZSkgewo+
IMKgwqDCoMKgwqDCoMKgwqBjYXNlIEdTQ19QUk9YWV9NU0dfVFlQRV9QUk9YWV9QQVlMT0FEOgo+
IEBAIC0xNTcsMTIgKzE2OSwyMCBAQCBzdGF0aWMgaW50IHZhbGlkYXRlX3Byb3h5X2hlYWRlcihz
dHJ1Y3QgeGVfZ3NjX3Byb3h5X2hlYWRlciAqaGVhZGVyLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgZmFsbHRocm91Z2g7Cj4gwqDCoMKgwqDCoMKgwqDCoGNhc2UgR1NDX1BST1hZ
X01TR19UWVBFX1BST1hZX0lOVkFMSUQ6Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJldHVybiAtRUlPOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSAtRUlP
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiDCoMKgwqDCoMKgwqDC
oMKgZGVmYXVsdDoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+IMKg
wqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiArb3V0Ogo+
ICvCoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHhlX2d0X2VycihndCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICJHU0MgcHJveHkgZXJyb3I6IHM9MHgleFsweCV4XSwgZD0weCV4WzB4JXhdLCB0
PSV1LCBsPTB4JXgsIHN0PTB4JXhcbiIsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBoZWFkZXItPnNvdXJjZSwgc291cmNlLCBoZWFkZXItPmRlc3Rp
bmF0aW9uLCBkZXN0LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdHlwZSwgbGVuZ3RoLCBoZWFkZXItPnN0YXR1cyk7Cj4gKwo+ICvCoMKgwqDCoMKg
wqDCoHJldHVybiByZXQ7Cj4gwqB9Cj4gwqAKPiDCoCNkZWZpbmUgcHJveHlfaGVhZGVyX3dyKHhl
XywgbWFwXywgb2Zmc2V0XywgZmllbGRfLCB2YWxfKSBcCj4gQEAgLTIyOCwxMiArMjQ4LDE3IEBA
IHN0YXRpYyBpbnQgcHJveHlfcXVlcnkoc3RydWN0IHhlX2dzYyAqZ3NjKQo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfbWFwX21lbWNweV9mcm9tKHhlLCB0b19jc21lX2hkciwg
JmdzYy0+cHJveHkuZnJvbV9nc2MsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVwbHlfb2Zmc2V0LCBQUk9YWV9I
RFJfU0laRSk7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogc3RvcCBp
ZiB0aGlzIHdhcyB0aGUgbGFzdCBtZXNzYWdlICovCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGlmIChGSUVMRF9HRVQoR1NDX1BST1hZX1RZUEUsIHRvX2NzbWVfaGRyLT5oZHIpID09
IEdTQ19QUk9YWV9NU0dfVFlQRV9QUk9YWV9FTkQpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoC8qIENoZWNrIHRoZSBzdGF0dXMgYW5kIHN0b3AgaWYgdGhpcyB3YXMgdGhlIGxhc3Qg
bWVzc2FnZSAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoRklFTERfR0VU
KEdTQ19QUk9YWV9UWVBFLCB0b19jc21lX2hkci0+aGRyKSA9PSBHU0NfUFJPWFlfTVNHX1RZUEVf
UFJPWFlfRU5EKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqByZXQgPSB2YWxpZGF0ZV9wcm94eV9oZWFkZXIoZ3QsIHRvX2NzbWVfaGRyLAo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdTQ19QUk9YWV9BRERSRVNT
SU5HX0dTQywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBH
U0NfUFJPWFlfQUREUkVTU0lOR19LTUQsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgR1NDX1BST1hZX0JVRkZFUl9TSVpFIC0gcmVwbHlfb2Zmc2V0KTsKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAvKiBtYWtlIHN1cmUgdGhlIEdTQy10by1DU01FIHByb3h5IGhlYWRlciBp
cyBzYW5lICovCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHZhbGlkYXRl
X3Byb3h5X2hlYWRlcih0b19jc21lX2hkciwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0ID0gdmFsaWRhdGVfcHJveHlfaGVhZGVyKGd0LCB0b19jc21lX2hkciwKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHU0NfUFJPWFlfQUREUkVTU0lOR19HU0MsCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR1NDX1BST1hZX0FERFJFU1NJTkdfQ1NNRSwKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHU0NfUFJPWFlfQlVGRkVSX1NJWkUgLSByZXBseV9v
ZmZzZXQpOwo+IEBAIC0yNjIsNyArMjg3LDcgQEAgc3RhdGljIGludCBwcm94eV9xdWVyeShzdHJ1
Y3QgeGVfZ3NjICpnc2MpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqAK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIG1ha2Ugc3VyZSB0aGUgQ1NNRS10
by1HU0MgcHJveHkgaGVhZGVyIGlzIHNhbmUgKi8KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0ID0gdmFsaWRhdGVfcHJveHlfaGVhZGVyKGdzYy0+cHJveHkuZnJvbV9jc21lLAo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSB2YWxpZGF0ZV9wcm94eV9oZWFk
ZXIoZ3QsIGdzYy0+cHJveHkuZnJvbV9jc21lLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIEdTQ19QUk9YWV9BRERSRVNTSU5HX0NTTUUsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgR1NDX1BST1hZX0FERFJFU1NJTkdfR1NDLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIEdTQ19QUk9YWV9CVUZGRVJfU0laRSAtIHJlcGx5X29mZnNldCk7Cgo=
