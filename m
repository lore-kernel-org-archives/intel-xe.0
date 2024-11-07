Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3E8D59F7F
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 00:13:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7279910E174;
	Thu,  7 Nov 2024 00:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jwVr/gi+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8869C10E174
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 00:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730938411; x=1762474411;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=34sb8jPgoNmFhDdzLLtw42B7InTAJoTSFUBMBL49t80=;
 b=jwVr/gi+8y9hHNp2p32Gcwu+xKFR+2ij5KBg1Ex3rW6rdtSmqfG5Aet0
 8jI1vdcqAZTNJrhV34lP97hGC4+7Lk5x7auXW/hLV36UPH+XH2mE+iw1B
 m8F0/FrGC5Q2mpCZK46+JUYZGs+f7hQGq+hUzY9yuRZ78Y8Y+ziPc61hw
 /yL4/LiEv1DOqyS29YIi6OmwgI11FGgbrs94g42ZKj0r1xIVTqJuQG6NS
 IYJO4468gLqa5IFLBalKrm8c0h9GRsoV1nTHkAlMllso0V5Uf53Y65vnV
 7xW2b8Y0oj9cithi7xXqwJ4lsHQv24w/OVqchzCv0Jjj+KJ/+OthCnwGH A==;
X-CSE-ConnectionGUID: 2Bz6mI2DRAWHhW1+xYB3Gw==
X-CSE-MsgGUID: bJnHpuCAR+Sm9HCtn3r0Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="42166818"
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; d="scan'208";a="42166818"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 16:13:30 -0800
X-CSE-ConnectionGUID: 8X41plgnSSCzEtTpF41bwA==
X-CSE-MsgGUID: NhyyIDIDQDGzYX4VAKxqNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; d="scan'208";a="84946940"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 16:13:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 16:13:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 16:13:29 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 16:12:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEn3HyhB61JnwAlIGJYGvJ+e7myPyrEp7zXspMJb+zagi/1qbRmUYZonjIjtGYJM4XIUUcbypZBM9MGsw2HFUSXTE5/EPXLGf/kPk2uB5vKfwvlDJi3HFI1+pxYqWWnVOiDnakC76n0FZtNVHGQx+SGoMs9hwLQ/rkvtY9s9+PwMObUcdM8LsfDTNWXutxVShh2KOK082T/WZR3Kan7/MFiB+mvee3LXyF9yFFUsWlMGDS0DKV24PD9x2pFJg+ovnA28A3tbfyeZ29NSbD+PiqEqTI9Z+o8lLxyH+Or4VuW/cM2rIBCV7F7x3choEqiJrdwcgXO70O+alhmV9HQUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34sb8jPgoNmFhDdzLLtw42B7InTAJoTSFUBMBL49t80=;
 b=ndNH4HVeSN9jcp25iTTawqfWXEOTxzt7Hgn6Nkb+piquzDYdYfyqjbQzw83Yvdoru8h2TfrkJQoqDHb6zrerstMZtqcp7odvbxnPqKjC1j8GcCZALaq1NpLZUB8eo7RA4r/jfurrx1X3rCL/sAqI6Wp5W2cBWrp6320d80KORekDLa+kR+3WPWLvRu52ov5mUCLf8dyLBFWcCaiGcO0nAz9s+fCHgVa+rJluLBib+/thPBN+BAE6Cg1ewcHDfHTcv5KM+2mrM+7ifVduW565bjVhgRFPTT5CtYVcNmcUOJmgcrQrxzCpluDuGR4k47jwccHDgIFZLyZ1C7s+tfYN8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB7004.namprd11.prod.outlook.com (2603:10b6:510:20b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.30; Thu, 7 Nov 2024 00:12:57 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%6]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 00:12:57 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1] drm/xe/guc: Remove duplicate source field
Thread-Topic: [PATCH v1] drm/xe/guc: Remove duplicate source field
Thread-Index: AQHbMKOIzeUXVNT+3kmv+K4sHMTxGLKq8kqA
Date: Thu, 7 Nov 2024 00:12:57 +0000
Message-ID: <c07048c36dd566aae7a4780b2ab9c569976ea715.camel@intel.com>
References: <20241106232752.374240-1-zhanjun.dong@intel.com>
In-Reply-To: <20241106232752.374240-1-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH7PR11MB7004:EE_
x-ms-office365-filtering-correlation-id: e23fdf11-18f4-4494-fd02-08dcfec0eebf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ak4yZW45QlAyOHcvNlFLMGlwZU9NbGdrK09GWW9CNm4vUFNHMEpicldTMVFD?=
 =?utf-8?B?OVVWUEVJRlp6OXlTY2Vad3J6U2dReksyRGZ5TVdQTE9mSU9Lbm5WVW9aQUNp?=
 =?utf-8?B?UFdIRURGN3dsVWJWdXk1YnRWNUVBVzlyVWwwbktRbTgwN0tyLzRkTEU1L090?=
 =?utf-8?B?Skp4ZmtYTzJXcEVDYkpMNlptaUltTEZqT2VSRGFFNmVSUmpZUVkrSkhGVS9h?=
 =?utf-8?B?eTk2QkdLNDZEeW96aUZ6UjJXU21OOFJ5ejcvRkt1TlRYeWZ5Um9ZcUw5bUZR?=
 =?utf-8?B?bS9JN29xMGxUV1ZlOG44cis1clJWTFpTL1NRSzhOc0ZtRDIySVErbTNMQnZq?=
 =?utf-8?B?N1lmdHIzLyt6azNySlRlaXJqV3lWV2hVVzlpblE1NnltUll4TStUeVFGTE53?=
 =?utf-8?B?Z0tRdHFRelFNdmlVSkg0M0h6bWZhQnVzZEpZYzR5UytXT0NhM2JJS1g1U0lQ?=
 =?utf-8?B?bmt1T1AzQ3ArQW5YZ1p1VnFHKzhaSVNscXllcG9kcHdsZUNtNUsxVHJnNGMv?=
 =?utf-8?B?YzhFNVBXZ0NFZmV4MFFvOTNPeUE0bk81SC9maUR3L2JIem8wZ1BheG95Sjkv?=
 =?utf-8?B?L0JoVDBoVnMya2hjUzRINnkrQjgzRHVRTVFEeGpRS0crdzU1U3pheFdyYWh2?=
 =?utf-8?B?dk4vbFg5UXJkR0Vra1FRUEFQdklBRDAvN0o4SEk5NlFVT280WE83QkxkMnZm?=
 =?utf-8?B?aWorUXNvTWdGbjZHTTUyNitsWWxFOERoTzk4d08zMWlsV0NHL20zYkNHcTFR?=
 =?utf-8?B?SzBYd0pQRFJNdGl0YWx3bmxkTFBtTFlicDNGWWdMZzNPbE9GNmFWOEVNWng5?=
 =?utf-8?B?ZXJEMXBTcU5EcG9NdG5rUlN3VVFCZkh2dWNUSC9TTUJpVDJsOTU5NEQyQWV0?=
 =?utf-8?B?MWkxaWNxZ2FRRlJWYmZ2RW9rMDlqSmV4Z0hwRm9tV1RQUUlmdDhKSDRlUEtE?=
 =?utf-8?B?ZkorYndESllxQThFcE8rQkhRVGN1T1RhbWRTdG5HZ3hOUVFMa1NHa094cXVU?=
 =?utf-8?B?MDliYUdKbWxxUTVEUVpyV2RKcXllK0taRzdnbU5Ka1ZiOCttdUNnWGh4Q3NQ?=
 =?utf-8?B?cWorQ3dQbnpjK3FudEF6VHMrZzBIVUlSVS9WbENHRjY2c0FMSytTUlpSWCtW?=
 =?utf-8?B?WFhDVjA0RlVLZVlac1ZOY1RqNnpHejluQmxsbjRnUTVkREp6VHEwR2JlWlcx?=
 =?utf-8?B?KzN5N0owRUd2c3pha3c2K25xUVYzYlB0K0IxTFF2RHNKS0wvNDYyMmloTm5y?=
 =?utf-8?B?WG9vM25wMjhxMG1ib0hRQW42enowUk05eHdRZEQvUzYwYThmTGJhQ2QvSkxS?=
 =?utf-8?B?WFJob3FlK055V0k1VlhsdkNwdnNqdmNVYXlvVllXcHlPemVERkwxeHRJeUg1?=
 =?utf-8?B?NkNEZW1IMjR2Ym9hbHhNbFYrUGhUSDNhMlVtWFdqR1lGWkZYS085N3RuVlFW?=
 =?utf-8?B?N3p3NXROVVlDejVZSm0xSVhwTnhUdFIzdFZvckRYcDV4bkF0VktxWU4xR2tE?=
 =?utf-8?B?QmVnQjRNRjhlZFh4bEI5QzRlUThjTXMvVmpnaVpuMjg0b1lCc1JLRWhPZmdX?=
 =?utf-8?B?TFBFVjJKSzFjdHArMlFnV3o0eXNDTnAwQkN5bFVubW1pRTVCa2puRmxBVjgw?=
 =?utf-8?B?TFRYSXJZZHhMZk1McGxDODN0TlNaTGJseU9maDN5U2NpZm9EZ1RUaEN3SFk5?=
 =?utf-8?B?NlBiSDVXSHh4Y3RtZHFxUjMvWllJTFdzYnhVYTF2NjFrRmpjSXZMYTdkTnp1?=
 =?utf-8?B?d3BQblJwcHhocFZHelo1cUVIOHJqVVg3cWJJY3RucE5nYVUrMDJXTTh6ZUZs?=
 =?utf-8?Q?T/8TntaxdOLbIfJY+yKkk2Ywej1T4iogjF2R8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Uy83WURjMWp1T3I1UnJEY250TmRITGlhUWJLakQ1NllnTCszdERraWtvQ3Ny?=
 =?utf-8?B?OS91VFRDVmk2U0k2SHQreXp6QlFJTzJ6L3pPbUx0M0hLUzdHYXM2aVpVSE1w?=
 =?utf-8?B?UTJFVnUzeEM2YWlOcGdIeUVWVWZWMDJFL25YbmMxUVRLNTZnRWdoeUV4Y1Iy?=
 =?utf-8?B?YVBlU01SeFpLQWJzQWJKS0h3cllzcldEZ0FrOWxuQjBqUHN3M0l2amREVTAv?=
 =?utf-8?B?R3g1eTQrL2xDZDB4TnhuSWtUa09qeUdCcUNpT0VEeHJuTlAvbHZhZkI5L1NC?=
 =?utf-8?B?YXEvQXg5cmx3ZVAwN3lhbXkvUUQ3blNqaHhjekpPOU4vc0Eydy8yYi9vMnpB?=
 =?utf-8?B?dFBNVlYyMmhDSXVHMEplWFYyOVVDaGxLUldNbmwyWVExMmZkZ2pnR3A5ZkE5?=
 =?utf-8?B?cDNRL0p1aUFvZitUVG03ei9JVmpSSDhqN25rZDd4Ty9nSjlwb3dpaXJ5U0lS?=
 =?utf-8?B?WEZOREptcy9kRmdkcUZUS3p6RWlqcWlPYkJjREJtRmtES1pKNnpNdlU5T2FB?=
 =?utf-8?B?Mmc3eEdXc2dEQW1PMHJZbGxNS3lYNm55ZVZEdDN6MDc3NzJzRFBreWtNY0Za?=
 =?utf-8?B?eGNUR2haT0prRnliaEN6bHp3UHg3bzdFVzl5N3ZHSzVidUtnckYveUt6K2hN?=
 =?utf-8?B?TzlDTUtZQnp2RFRHMFluekc5b3RnV3UrSU0ra1IzSHpKbjBjYWlPSnZHbGRX?=
 =?utf-8?B?QnZlUzBsQ0E0SE0xVmE5VTEwK1BzUlNYZ0NJemttNGs1UzY4Y1krVjAvYU5Q?=
 =?utf-8?B?RlJXNWpPUlhtSW9sekxubm53NTA1RGxDeWozMklDc24yMjZMb2ZZT0Zlcmp1?=
 =?utf-8?B?Y0hSclZ5d3N2dFNENmU0YlNsSzI5N0RiK01MVCtnZGc4Z21rNmZGODdMalV6?=
 =?utf-8?B?UDFVbjRKVDQ4N0dOTTdscEdZVFJDRkxuREtUVzdHbmc1WFVtOGRZVlkvcEVW?=
 =?utf-8?B?Q05BczB3ZjFmdEFic2ZGWllrR0drSmtvSGFIQ2VDakxiZ0l0Z1R3SU1xeFlJ?=
 =?utf-8?B?dTk0aGdQWkhZNS9MdFp6T1Q1WkQyakRpRXU2K21BaFN5dFdjOVpqYW8wUjky?=
 =?utf-8?B?ZXI1TVBCaDRRUGs2SS9jeTl5eSsyYmlLelJqRitFMXlUOFRYa25EYmNieFhN?=
 =?utf-8?B?RHZyWTh4Nk5EMnRtU3pGYVBrd3Z2b0JvM1NZTnh6MDIzeEVqQUNFWmNVSExr?=
 =?utf-8?B?MTdJYU5xNkt5UGlUcDBtajY2cjRiWDk4aS9JZnExR0hScXlCYUJTQXpVUXFm?=
 =?utf-8?B?RE0wWjhNM2ttTGFpMmZ3ZnhWRlFLQy9YcGpRWDl4dWU3dDNMSjA5aG1QbXpP?=
 =?utf-8?B?Nlh3cllsWUdHekJrQ21FVEhIWFZ6SlBFYk9GakQvOHlteDhOZURFSGtOd1FG?=
 =?utf-8?B?YUxTMHBObmxMcE5MWlBZSzlUT0ZVUDFRb0lrMUFQUU9rdFc1Uy9Wd2dHdDNo?=
 =?utf-8?B?Y1Zud3FjbVBBdFU1ajB2dFJ3SFVEaHRwbzVEcy9KM1lQL0ZYc3kwYWJuQ3NS?=
 =?utf-8?B?UngwaUVoMlFjdThwa1FmdlJOQTJ1RTNxRUxSQ1BGbzVLRWs0MkZCY2VBbTlZ?=
 =?utf-8?B?NDh5eUdBdTJaeGkyeWRHbmtYNFlGaVlKUVMxVVd4Umk1amhaU2Y1UFJselRn?=
 =?utf-8?B?K0dCVU0waEhzUndnOXgvcnBSQ0dDa290NHVrVHhLc2ZsUWRmTHdNUnFnL1V2?=
 =?utf-8?B?d2h3dS9mRVZQUWFDU2xlQXVCNmV3RVZVYnpUYXhlRE5vNFpQRUNIN3BCSTZC?=
 =?utf-8?B?NkpEU2l6N09WakZPenpVM1RzZEx3Nk9NRjBiL3FuUkt2UVdWOENoTFlua01S?=
 =?utf-8?B?dHZEK2FrTGVKd1hNZnhKdHp2MGRuMkUwOEYrVFJPSWxESDdtd0NnUVdwa0d2?=
 =?utf-8?B?bGxGSi9RZVU5QTFVeFZQeWR1eUZ1Zno1a1EzT2VzcFlmQzJ1WEdmaXEza0h2?=
 =?utf-8?B?R1hRYXV6UUtseUk2eDBkOEZWaUlYRjJaSWZhcm14MHdWdm1kNHJMQlREejBi?=
 =?utf-8?B?UUNPaUVZUzFTWHVPZnJDVkt3ZUVFbWpsempDMmJCeGwrQ0UvaDArdmxHRUNQ?=
 =?utf-8?B?ZDVyNFliWjdKTXV1L0ZaTm9reEdlZENTUnhsOThZc0h2TWxGaHZzM2tvMTFY?=
 =?utf-8?B?K0l1SEdXa0ZhaXRlSE4vQ0xieDRIYnpiT3dTMVBwTFpHSkg1OU9jdk1vT3A0?=
 =?utf-8?Q?2Dzu88+jIu2EscIZYQavkMg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7A898D88E9F024897651CF6ABC4D8B6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e23fdf11-18f4-4494-fd02-08dcfec0eebf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2024 00:12:57.2484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WVY6ksJgMfW8YCI4LL6VnYjMsYEbju8HyHVC/bunWpc7o0cmyaJ3R0bKvMhr6JZpOKZaUtrEixvbpRBf44KFf0ehr8yJEsPwOGS9NhlapWD9Wox9Vo72ZvHzgycbxYWo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7004
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

DQpPbiBXZWQsIDIwMjQtMTEtMDYgYXQgMTU6MjcgLTA4MDAsIFpoYW5qdW4gRG9uZyB3cm90ZToN
Cj4geGVfaHdfZW5naW5lX3NuYXBzaG90LnNvdXJjZSBzYXZlIHRoZSBpbmZvcm1hdGlvbiBvZiB3
aGVyZSBkYXRhIGNvcGllZA0KPiBmcm9tLiBCZWNhdXNlIGl0IHNob3VsZCBhbHdheXMgZXF1YWwg
dG8gdGhlIHNvdXJjZSBvZiB0aGUgbWF0Y2hlZCBub2RlLA0KPiB0aGlzIGZpZWxkIGlzIGR1cGxp
Y2F0ZSBkYXRhLCB0aGVyZWZvciBjb3VsZCBiZSBvcHRpbWl6ZWQgb3V0Lg0KYWxhbjogbml0OiBz
b21lIGFkZGl0aW9uYWwgY2xhcmlmaWNhdGlvbjoNCiJCZWNhdXNlIHRoZSAnc291cmNlJyBmaWVs
ZCBpcyBhbHJlYWR5IHBvcHVsYXRlZCBpbnNpZGUgJ21hdGNoZWRfbm9kZScgcHRyIGhhbmdpbmcg
b2ZmDQp4ZV9kZXZjb3JlZHVtcF9zbmFwc2hvdCwgd2hpY2ggaGFwcGVubmVkIGVpdGhlciBpbiBn
dWNfY2FwdHVyZV9leHRyYWN0X3JlZ2xpc3RzIG9yIHhlX2VuZ2luZV9tYW51YWxfY2FwdHVyZSwg
DQp3ZSBjYW4gcmVtb3ZlIHRoaXMgcmVkdW5kYW50IGNvcHkgb2YgJ3NvdXJjZScgZnJvbSB4ZV9o
d19lbmdpbmVfc25hcHNob3QuDQoNCmFsYW46IGNvbW1lbnQgb25seTogSSBub3RpY2UgdGhhdCB5
b3UgcmVtb3ZlZCB0aGUgYXNzZXJ0IG9mIHRoZSByYW5nZSBvZiBzb3VyY2UgaW4gZGV2Y29yZWR1
bXAncw0KbWF0Y2hlZF9ub2RlLCBidXQgc2luY2UgdGhlIHBvcHVsYXRpb24gaXMgYWxyZWFkeSBj
b3JyZWN0IGluIHRoZSBvbmx5IHR3byBmdW5jdGlvbnMNCnRoYXQgY291bGQgZXZlciBnZW5lcmF0
ZSB0aGUgbWF0Y2hlZF9ub2RlLCB3ZSBjYW4gcmVtb3ZlIHRoYXQgY2hlY2suDQoNClRodXM6DQpS
ZXZpZXdlZC1ieTogQWxhbiBQcmV2aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5j
b20+DQoNCg==
