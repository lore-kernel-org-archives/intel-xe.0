Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B49C0218A
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 04:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842BC10E246;
	Mon,  3 Feb 2025 04:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nkgfvx9l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5759210E05C;
 Mon,  3 Feb 2025 04:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738558216; x=1770094216;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=22t8+K+60z/ybsQrnTeFAy0WbLC6zLrsNOnputIvMds=;
 b=Nkgfvx9l97eZSO/0Co7MJng53db9bwrYw5Ff84cwbfEeB0QBMYDIMMv9
 iSUM1OoR5pHbZYok9fq2g3mAUz0WqX4k+cQRSER+rMTny3aTY3QQ/+kUv
 8wQ99rfWaqgEoVuUJlM/swhP89jHlyTLDvI9a4XRAA3ulGVoXhWFYbdIf
 Nwv6IVRiMdD6jk5cREswfa4xlcWzEO1uBR9mnR2iKLeEI19VksN8wrEhY
 9VMCUXqSkx9E/ynJRMXfkLEN1FmzU92ohwGNyzUrA4MWYRK9vzmWF+qsh
 aNGSxwhz0D7SLLOxB2hbKTgJD1lYUgH143SPqWlCZ8heeCRQ3m2cPAV/h A==;
X-CSE-ConnectionGUID: qxYJWoJ9Sc2mQPBZUc/uFg==
X-CSE-MsgGUID: T0rS9hD3TU+5v96Ng5KwsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="50034656"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="50034656"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 20:50:07 -0800
X-CSE-ConnectionGUID: 6HWjkU5MTgKoBv3cYCeFAg==
X-CSE-MsgGUID: kAz0B3u5QZq9rD52RWWDGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="110751911"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2025 20:50:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Feb 2025 20:50:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 2 Feb 2025 20:50:05 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Feb 2025 20:50:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRDaYTVPeyJ4/SnTPcZV4aCf3JaXJfBHQA8rlw6XKN5qPnZJCaSgItO394wLWXDX1X/bng2ftPVHryWgprtOk3XEjxZZHifb25AEnPJ2aqiCORQbDtc2VbrjQZ9BV3+2Lv22idmNQ9sd9vuzLkyjtK7JcwJkFIuEPAkbVotb+Va+KRnlSlofJfDhoEITjoge9VAzCVtk9k2ZAUdXpAXH0ICNA+0GywulgbwCv+vcaBRz4nZsVdAzClFAEvoy7FSL6rDkLXD88NxCiYc9zLBmnWd66sGAVXbonXYK/kNNwdIgnnLZ9SthUxZtU05WHXGu6qGUJ6PsqA2F6U/YWB3hiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22t8+K+60z/ybsQrnTeFAy0WbLC6zLrsNOnputIvMds=;
 b=E3Vhwyyyd1fdSz33vBY1OY7TLyb/LZkX4z7Rff/92+gaAGJ2+x4J6RAbj4obErnkAC1J33QNO+8BXnqLthxsD3iI1HHm+RWbpR2Wq2aKaTaKFV409lNk/Lgf/TKIzL0hJMDrBLLeMIoMJJPLvi2BoNTy7gg509Wl53Mpy+zXWkCXhwQJe7d0aLoyYjf4cSutlo4cQlwamUvkzHx1FkkDdZttCgBRpVv26cNxyA1Y31r/OY80LmoLhBQ3q8W1zTPQKHlzwX3DfOPqL+nhv76g10L5PuLjVCcn2+SipcHdVgx/JZGentPfVgCwWkXSnLY6PTZ2bONZ5ST4ypSmYk5gJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by SJ2PR11MB7501.namprd11.prod.outlook.com (2603:10b6:a03:4d2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 04:49:49 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%6]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 04:49:49 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "Sousa, Gustavo"
 <gustavo.sousa@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIGRybS94ZTogRml4IHNv?=
 =?utf-8?Q?rt_order_of_.o_lists_in_Makefile?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVyZSBmb3IgZHJtL3hlOiBGaXggc29ydCBv?=
 =?utf-8?Q?rder_of_.o_lists_in_Makefile?=
Thread-Index: AQHbZ2mDwe0FgsvNwkueP8V/Tx02T7MvrgmAgAVxbuA=
Date: Mon, 3 Feb 2025 04:49:49 +0000
Message-ID: <CH0PR11MB5491540133AAB5239ED04BFCEFF52@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250115140812.20799-1-gustavo.sousa@intel.com>
 <173695374387.3983181.14187231526385162871@b555e5b46a47>
 <173695805941.3159.1159064316268223503@intel.com>
 <20250130174311.GS5109@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20250130174311.GS5109@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|SJ2PR11MB7501:EE_
x-ms-office365-filtering-correlation-id: 5f98488a-c751-4ee5-057b-08dd440e30d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007|13003099007; 
x-microsoft-antispam-message-info: =?utf-8?B?NjR4T1RCTzZtNVBzbWtBNEErRVR6cHpGTkVLOFpueGtCNnZNeWpoQ0F3RDUv?=
 =?utf-8?B?ZWthUlJuenpTTCsrcU9MaU5mVVpJMWpQaXVrdG4zUTFZM01yWGxhQmtobStI?=
 =?utf-8?B?bm1CdmQ5bEdCOWtwcGxTUXM5STFpdlJKNVlLU1NmNHZuTlU2cjFQYVZOUEt2?=
 =?utf-8?B?am52dnhrZXZHZ0FVbDcvVWdLZG92WnVHaFB4bDhOSGJCNmVuNm5rckltQWxW?=
 =?utf-8?B?aUZRSDRJQ3ZPaEt1SWRmYnVNNGRjWTM3bXVIU28yWUNMREJLWVFvZXkySVZy?=
 =?utf-8?B?Qm5KSUYyRU96czhBazZIN0VYa2pRWkFVcTdvMXFmWHFjMlIxUFh3WnNnUnNo?=
 =?utf-8?B?SnYxYlI4SXlVREwwQVBEWjlLV25kUnVpR2lPWWIzV09kY0tHYU04V0JNcS9v?=
 =?utf-8?B?ckZ5aklaNXJqSzZMd2FtVXBKeDk5dWNMQTVVSWYrMFNSbjVMRmJlWGdidFhY?=
 =?utf-8?B?dHorT0FmL3k2Um1WWmt6c3p5aERBdTB0WGpFT3l4czRsS0dOc0hKTUNsS0cy?=
 =?utf-8?B?WExwNVV3L1puZ1Z0djdyU2N5bjBzZDh0eEQ4TUtMaGxvNWhCN2x6anF6MlBx?=
 =?utf-8?B?Y01vbzlRcWpTYmlGdjNGa3QxaHFqcHpaZ05YeUN1VVd6bmM1c2crVDRJVktT?=
 =?utf-8?B?cEhYT0xmQWxTN1N1VGhma2JrMEw3RXhMSzBSQXBmRXFkeDVyeW01RTZQSk1Q?=
 =?utf-8?B?MkQyQXh1YkJBcUlFVHlWS1IwclIwdVRVQ3Y0MzBTcU1Va3dsMWt4emJxU3BS?=
 =?utf-8?B?ZWQ5Q2VUZ280TFBCUURnZTZqdXpIZnIwelF3TVZPU1Q4R3p1a2dBWTgzOGhu?=
 =?utf-8?B?WHA4a1d5Y0FxUVcrUDlyUGU2UzcvQ0prc2VXN1oyNDg3RzZ4R1NyTXFNVVBt?=
 =?utf-8?B?VW9FcTlZUjNuNkwvQXBRMjhuMEVwRmQxNGg0dHliWG9OQlhUbU5kYmY4Z251?=
 =?utf-8?B?Qk4rWloydkRReVpXdUhFOGJmM0UwRGRIWG0zWnE2Q1M2VlhNMlZaOFFORncw?=
 =?utf-8?B?WHZybFgyU2VVWDNUMHF2Ni9VNXlQOWEvbVJFWjBLSk5PMXFkbmhmQW9Wb1FO?=
 =?utf-8?B?UDNZa0lPVEpUZ2RTaHlUeGUyblFaOW94SW9sWUpWTUQ1Nk52cy9PejB2RjBx?=
 =?utf-8?B?QjdTTmR0dWVPR1J1WVZDN01ONHdBNmhtOWNQVFlzTEc2MDFmNytJaU83K0tS?=
 =?utf-8?B?cHV2Um9PVURxSml2NERpbmxHWWZXRFREVkpWNFEvdVdmZURaT0ZiQ3JONEI0?=
 =?utf-8?B?U29QeXRDK0ZTdE05U0hteDNhY2JyNDA4N1prdEFEL1NRQVhoTkZBR2QxaEgx?=
 =?utf-8?B?N00zbWxWVW9WaUY1NHJWOWVKOHBRR000aW1acU9LUXk4bVFZZVZQNXA0WmlE?=
 =?utf-8?B?enlPaC9BVHpJWFJVQ0Q2K1VBYnZGaytXYkZ3MFVHNGhIQ0svTzVqR29ScU9R?=
 =?utf-8?B?MWNKOVdYMlBwQmhaMDRvVUJ3WEtDUkV5UDFRZjBCdnlxOWNINk1DUGpnSmU0?=
 =?utf-8?B?Z1d1RkR2dTlPNWJhV09MQWljWTFzcWpVV0lDd0NhUVk1RHZ2NytiMk93bHhs?=
 =?utf-8?B?aU9oYWlYbWp4Tk00MFZiN1VtMTZ1QmtSNjI0MS9VaGRoemU5aFJtZ1dZRGV5?=
 =?utf-8?B?RHdlZmhQcG9XYWIrdmw3Z0VQUVMxa1I4cFRSMXBWQzI5Wm83MUxSaWJ6QkRP?=
 =?utf-8?B?bjNWME44WCtQV1lUT2RSNlVSblVrcExHNVBiSVNORW1Tcm9RdUJMbXRNZU1N?=
 =?utf-8?B?aFVkYVpUYUVHRngxa2kzN2tYdmVDNUhqcW5KS0V4Z3R1Q2J2cUZVVmo4dW9Y?=
 =?utf-8?B?aVowTXJnN21KeDYvVmRWOS9qS3dpS3I0Ti9UcTNQN0hVVy9zc2dVNDI3ZUky?=
 =?utf-8?B?bVhuYWEzVGV1aU5GWGNUb2QvWXlOL1ZwTlBTK094VVNCQVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TDBNNENscDFuVWtxNVdRSC9EMjZrRlN5aitEM28vZmExTTVEREU4UVV2aG5n?=
 =?utf-8?B?cncraEVJWXNBUkRWSmtzaE8zWGltRzRqT3ovZ1IwZ253NzdyVGZtVXVpdHRW?=
 =?utf-8?B?bzRuSVQ2MDE1cjA5OEZLOFJoOFU1ZklpV2xqMEFQQk5HbWxCdmNoTW94eWFU?=
 =?utf-8?B?OXZDWWJkQmJjUlpvdTdvcjBUYlBlOXJkS2JjYVVVUE5EMmxmQUZDMGNrYUJi?=
 =?utf-8?B?eDhvd2YwOFNBMXhsWHpocXRUNlY0WWZGUUVkOERpYjJ0TnVjUHF3RXowRnB0?=
 =?utf-8?B?b2pOU3Y3cWJIeTF6WGx4RnQ2emdPWlRkTWpWWTc3K1VHT3FEQzZGZUFSTDli?=
 =?utf-8?B?cXN0dTRyUnNFNzZBUkhKNTFSVDJaN0FNK0hEZDUrQ0tXY2tiaTFIS3pZeE5j?=
 =?utf-8?B?OGM1cXIzK04yVEJtVzgvQ1U2a2txWktaRTNTU3ZYR255aDVtckJpUWxtaDk5?=
 =?utf-8?B?aUJPMnhnTGxlME5xVmR1SXBTWTQ0V0lDTGtkOFBGUXUxOXpKT0ZoNVhadld4?=
 =?utf-8?B?dTBvcWYvRGpOWEJPUGczNEpIcmp4VzkrcXlzNVpsZ0pWRjhvdTlWdEZEeEFD?=
 =?utf-8?B?bElXY1BLNHk3S2ZLOE91a0FlUjJUUlhUZHZjTS81U3p1NGorOXRnYitQNTZZ?=
 =?utf-8?B?K3dsRTUvWWUwQmFVRzA0L1E1Mk1IYXNhWHN4a2hCWnErYWI4L2VOTkI2SUFa?=
 =?utf-8?B?WmNPZWg0bUgrREplTk83eFpwWGJPWW9lRkg3Vnl2Sm56RWd2aldnc1RUZmdt?=
 =?utf-8?B?SHJwTUd5UlJEZTlPeHpxN252aDhaQU50UE9sOVdTYWZWSUU0NFN1cy9uR2FR?=
 =?utf-8?B?U1ZUOFZ5UU1mOVB1aDVsamhMa05pMitjQkErc091cXl0ZE9aM0xBTWdxU3R6?=
 =?utf-8?B?RWZnUlAxb25zY2psdTRiRDhtSFpSZTE5ZEV4Qnk1Q1gzQUxQb1lqcWVmTW5h?=
 =?utf-8?B?VkU2aVdWWXJteUhjMHlMM2p4R2JoTU9IS0Q3UlNnTlZaNmNSbll5NEhKTzRv?=
 =?utf-8?B?d2VpamxiZXVNTzZmM29EZkY4enhVWSs4elNvSXk4TFYzK0V1ZXZsRFFCUUFG?=
 =?utf-8?B?cVZrN2c0eU5FdDU1K2lrTktYZjhTSGV6L1RZT2pWcnU0elB2UEs5cUo4Z0k3?=
 =?utf-8?B?dnluT0hmQjlxb2k1dTA1U0c0WHdlRUFtN3JpTWhXRHMzQ2c3VFR3ZDRRS0Mz?=
 =?utf-8?B?c2hMK3U5VW9YbFFWaEhjZjZ1UCtqYW9UZ0J3dGpWV0M4djNqMzF6Q1ZWTTJO?=
 =?utf-8?B?c0RJQnI5UVhZbDVUNmljNTNBcnhPYXZNU0x1K0g1QTVVOUlieVBydkROSkNp?=
 =?utf-8?B?eFVrbmhET2REKzBCbmJsTnhtbktLUzJqUXFuSHpFNmZTaHBDVzhNUHRjS0VD?=
 =?utf-8?B?RE4zak0zRHBlM0ZmR3lTL0FTcEQvSmJ2YmtzeWpLTHFDZkZQTTNqMDZUeG9q?=
 =?utf-8?B?S2EzaW8zSTB5YklvcWwyK3BRWkJLdGRTd29wbHcyMHlpcUZHenVCa0M0TnNs?=
 =?utf-8?B?MFdkRFBYWGNXUGpGMmx1U21hSUR3KzFoQkFqN0ZSaHhuOVlGdmhEcVBNemEy?=
 =?utf-8?B?cFNuSXBVNVVDcDhleTZnZHZ3MzZsc09WUHdmWjdOdVk0ZFhnbHVwTkVjT0xy?=
 =?utf-8?B?VzRtcFVGL2Z5QzRzVittZlcrbTNkcWxjcFF5MDJFYmZ4eXk4R3ZjV011dHFG?=
 =?utf-8?B?R1NaMHVlKytwSDFkZ1NqZ3FaWHJrSTVoVTFVWU1GalpXekxmMUFsTFQvTFFa?=
 =?utf-8?B?ZVFRUUdPMnBFUzdnVWZLRjRhZkE2cUtVT3hEYk5sYnljU1V5NjcyWEZCcnBT?=
 =?utf-8?B?WEVvNkZvUkFzcU95L3NKT0NBaEhsdHFxTnpNT3hJZG9XdnlRUThsNGFUMXYy?=
 =?utf-8?B?SFNTaVJ5YTJhckk5ZTc2bm1neWpEWnU1UEhnVWxqbHl4SFZIR2d3ZHB6WnVK?=
 =?utf-8?B?bUxncGJHOE93V2VBNXFnUFRrVkFNY2FXUXE3bkt5d3AvUmpGQ1dhSVcxN25C?=
 =?utf-8?B?ZURHWnJMSVhXWm1SUWFPdTlnQ3RMUGUyYzhzQ2E3K0VkWmk2UFFNWURxVDBa?=
 =?utf-8?B?UEp3RTBWS1NYTGlUWnIrQTJEMHBIblBOUW5FeG9ZbzdaMlBEWFExNkNYUnQy?=
 =?utf-8?Q?QtUo04eNrh7HM3DviuKQrSVIm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f98488a-c751-4ee5-057b-08dd440e30d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 04:49:49.5704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xkc5Y5Rxu63DSh/dioWOu242BV+wnYq57XnrD+jfhTUaP4ai/PZ8rHdxcOiCOFziuXjMMhqBfk0yLdJUgmgoCoW8OV9kGakO7EBjG6JJXRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7501
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQzNTU3LyAt
IHJlLXJlcG9ydGVkDQoNClhlLkNJLkJBVCAtIEFkZHJlc3NlZCBmYWlsdXJlcywgWGUgY2Fubm90
IGJlIHJlLXJlcG9ydGVkLiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICANClhlLkNJLkZ1bGwgLSBBZGRyZXNzZWQgZmFpbHVy
ZXMsIFhlIGNhbm5vdCBiZSByZS1yZXBvcnRlZC4NCg0KVGhhbmtzLA0KUmF2YWxpDQoNCi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBJOTE1LWNpLWluZnJhIDxpOTE1LWNpLWluZnJh
LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTWF0dCBSb3Blcg0K
U2VudDogMzAgSmFudWFyeSAyMDI1IDIzOjEzDQpUbzogU291c2EsIEd1c3Rhdm8gPGd1c3Rhdm8u
c291c2FAaW50ZWwuY29tPg0KQ2M6IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiDinJcgWGUuQ0ku
QkFUOiBmYWlsdXJlIGZvciBkcm0veGU6IEZpeCBzb3J0IG9yZGVyIG9mIC5vIGxpc3RzIGluIE1h
a2VmaWxlDQoNCk9uIFdlZCwgSmFuIDE1LCAyMDI1IGF0IDAxOjIwOjU5UE0gLTAzMDAsIEd1c3Rh
dm8gU291c2Egd3JvdGU6DQo+IFF1b3RpbmcgUGF0Y2h3b3JrICgyMDI1LTAxLTE1IDEyOjA5OjAz
LTAzOjAwKQ0KPiA+PT0gU2VyaWVzIERldGFpbHMgPT0NCj4gPg0KPiA+U2VyaWVzOiBkcm0veGU6
IEZpeCBzb3J0IG9yZGVyIG9mIC5vIGxpc3RzIGluIE1ha2VmaWxlDQo+ID5VUkwgICA6IGh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTQzNTU3Lw0KPiA+U3RhdGUgOiBm
YWlsdXJlDQo+ID4NCj4gPj09IFN1bW1hcnkgPT0NCj4gPg0KPiA+Q0kgQnVnIExvZyAtIGNoYW5n
ZXMgZnJvbSANCj4gPnhlLTI0OTItNzI0MDA5MzdlNzZjMDJhZTYzNDVmMGRmYTVhNTk4ZjBiMjg0
YWIwOV9CQVQgLT4gDQo+ID54ZS1wdy0xNDM1NTd2MV9CQVQgDQo+ID49PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4NCj4gPlN1bW1hcnkNCj4g
Pi0tLS0tLS0NCj4gPg0KPiA+ICAqKkZBSUxVUkUqKg0KPiA+DQo+ID4gIFNlcmlvdXMgdW5rbm93
biBjaGFuZ2VzIGNvbWluZyB3aXRoIHhlLXB3LTE0MzU1N3YxX0JBVCBhYnNvbHV0ZWx5IA0KPiA+
IG5lZWQgdG8gYmUgIHZlcmlmaWVkIG1hbnVhbGx5Lg0KPiA+ICANCj4gPiAgSWYgeW91IHRoaW5r
IHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSANCj4gPiBj
aGFuZ2VzICBpbnRyb2R1Y2VkIGluIHhlLXB3LTE0MzU1N3YxX0JBVCwgcGxlYXNlIG5vdGlmeSB5
b3VyIGJ1ZyANCj4gPiB0ZWFtIChJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykg
dG8gYWxsb3cgdGhlbSAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3
aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+ID4NCj4gPiAgDQo+ID4NCj4gPlBh
cnRpY2lwYXRpbmcgaG9zdHMgKDkgLT4gOCkNCj4gPi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KPiA+DQo+ID4gIE1pc3NpbmcgICAgKDEpOiBiYXQtYWRscC12bSANCj4gPg0KPiA+UG9z
c2libGUgbmV3IGlzc3Vlcw0KPiA+LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+DQo+ID4gIEhlcmUg
YXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4g
eGUtcHctMTQzNTU3djFfQkFUOg0KPiA+DQo+ID4jIyMgSUdUIGNoYW5nZXMgIyMjDQo+ID4NCj4g
PiMjIyMgUG9zc2libGUgcmVncmVzc2lvbnMgIyMjIw0KPiA+DQo+ID4gICogaWd0QHhlX3ZtQHNo
YXJlZC1wZGUyLXBhZ2U6DQo+ID4gICAgLSBiYXQtYWRscC12ZjogICAgICAgIFtQQVNTXVsxXSAt
PiBbRE1FU0ctV0FSTl1bMl0NCj4gPiAgIFsxXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3Jn
L3RyZWUvaW50ZWwteGUveGUtMjQ5Mi03MjQwMDkzN2U3NmMwMmFlNjM0NWYwZGZhNWE1OThmMGIy
ODRhYjA5L2JhdC1hZGxwLXZmL2lndEB4ZV92bUBzaGFyZWQtcGRlMi1wYWdlLmh0bWwNCj4gPiAg
IFsyXTogDQo+ID4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUveGUt
cHctMTQzNTU3djEvYmF0LWFkbHAtdmYNCj4gPiAvaWd0QHhlX3ZtQHNoYXJlZC1wZGUyLXBhZ2Uu
aHRtbA0KPiANCj4gSGksIENJIHRlYW0uDQo+IA0KPiBUaGlzIGlzIHVucmVsYXRlZCB0byBteSBz
ZXJpZXMsIHdoaWNoIGNvbnRhaW5zIG9ubHkgbm9uLWZ1bmN0aW9uYWwgDQo+IGNoYW5nZXMuIENv
dWxkIHlvdSByZS1yZXBvcnQgcGxlYXNlPw0KDQpBcHBsaWVkIHRvIGRybS14ZS1uZXh0LiAgVGhh
bmtzIGZvciB0aGUgcGF0Y2ggYW5kIHJldmlld3MuDQoNCg0KTWF0dA0KDQo+IA0KPiAtLQ0KPiBH
dXN0YXZvIFNvdXNhDQoNCi0tDQpNYXR0IFJvcGVyDQpHcmFwaGljcyBTb2Z0d2FyZSBFbmdpbmVl
cg0KTGludXggR1BVIFBsYXRmb3JtIEVuYWJsZW1lbnQNCkludGVsIENvcnBvcmF0aW9uDQo=
