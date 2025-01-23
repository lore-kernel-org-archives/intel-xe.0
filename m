Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66F1C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 09:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF72810E79C;
	Thu, 23 Jan 2025 09:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7MD2qCi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0AB10E79C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 09:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737623410; x=1769159410;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+GcDQ/4y/NKFHmEsdKW9Da1O0BeA4zUk4bSqeuk1JVk=;
 b=f7MD2qCiw/Gv8MZ48l3sdiTL/9GbPacgKWwy/6QyCLqf07hj7eV7eO9O
 w7lfZ2jYft0jJePfJg9mlVXS0sVGoKEhd8mFKe1rVbE6X0fAJIdzAk4PE
 kuI85lqebrUDeMS7RzzZ0eqt+P+utZyEfc5EriyWmGn1RpS22g/zHtmrC
 x8BzIbUngGC2U8TsPoGixpjz/jT3pmR3DWEQ28NXFdNVz/+O5G4sSlyQg
 wbBejfFjLi4lKqBltkuG0t6ls2F9uRvKL5IqMKFQAIo/pppLYANktZAst
 dICIpttl3wwwr250TjX+HINbT9DLnB65d/fMXkNP1oVtQkz43xlwYVh+m A==;
X-CSE-ConnectionGUID: OeN2q8kdTMGezCAWgVFADA==
X-CSE-MsgGUID: Pfw5T8O5RFyALjWnQyM9kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38141684"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="38141684"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 01:10:10 -0800
X-CSE-ConnectionGUID: RVF0ibRXSK6/19anjWpT4Q==
X-CSE-MsgGUID: don45LWwQhmXe+an0KGMdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="107320408"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 01:10:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 01:10:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 01:10:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 01:09:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGS1F5fW6XGi+rINmYNZn21JTY5gov9/Q4pIarkMMlePTC+SEOc48aG5teNgtTRMWsG/eZ/DmMJGb5Q/Mkg8x2fv6sfObb/6iTCjRk9PGad8flhh8ROaeFKbyWNwFDof56Ec/ZnXCOxaHQjsHtj2dBNzFRCGeGuQ2nnitNsALVXTfdPLNRrwVLKTL0Fye8xVlHny4R0qi0YdQnCb21rCwsSRJ3ZNgGP0Z8I+xjf1zWzjeJ1Elwnu+Yd8jMQqEjqeOrmT0wxxqZMLGzq+mQTh0/tqpDo5MnPZbumqEQLEPl4dUqeOlHw6vD9FUH0vAYPkJTrOFZy23M/C4ekSjcAF+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GcDQ/4y/NKFHmEsdKW9Da1O0BeA4zUk4bSqeuk1JVk=;
 b=d3dgX5WopZNPbtjZoSsD09L7iJPdH3r8IPXoZ9ijhyIgqmtoIHeISTqIBzfa5zqU7BTKI4LsOA/7pdZb6tPgdh3BGKdgY5vFRKh09KVoneqAV3w1u2TuzSWbpd7hu6vGx6NOVBOeb0UWlNyAyQeo/pNWl8VPAvgZ1uR5luSp6jX7HfkfBU0YOz3eUwxjBDUpNNf5jlBXXN4+RMkYMd/q2P01JrcVb46ja2ZV7AqbMBVpL/zTnRNMx276IGziwbnY5ShjXP6iIfEQIuYhiGr8w1dZSJ6YZ07OjFrMkaLv/qDSMUNeitp9IDeMH0ydaSBCamxrDRVRtSY1MTDij+Opcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by PH7PR11MB6770.namprd11.prod.outlook.com (2603:10b6:510:1b4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Thu, 23 Jan
 2025 09:09:28 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 09:09:28 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v2 6/7] drm/xe: allow non-contig VRAM kernel BO
Thread-Topic: [PATCH v2 6/7] drm/xe: allow non-contig VRAM kernel BO
Thread-Index: AQHbUUccffavudI+ikeL6k1rBRHAyLMkSj/w
Date: Thu, 23 Jan 2025 09:09:28 +0000
Message-ID: <LV3PR11MB869501EF6A487CFB3484FE57F9E02@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20241218121837.226393-9-matthew.auld@intel.com>
 <20241218121837.226393-15-matthew.auld@intel.com>
In-Reply-To: <20241218121837.226393-15-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|PH7PR11MB6770:EE_
x-ms-office365-filtering-correlation-id: 81694bcb-2072-432f-97b6-08dd3b8da3df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?YlBrTWJ6bDA4dXF5VTU5bHpiWTZGWGtkOWxYNDZXSElTSHNYaE5SZVBXbHBL?=
 =?utf-8?B?UmJmZkVEZFliT3FkL2U5RHZDcFdpMTJuZmR1cUtSNGQxYmMzdTRYM3NEN1J0?=
 =?utf-8?B?TnhzN1MrR3oxUmJYMFhadC9VaWQ1MGpnem8yR2hsTy93OVlINTk4K2g4MG5u?=
 =?utf-8?B?OEhOYjFKSUo3RUUxQlUzRFZUNDhDazd2eXVOTFpRcVVzZm5lK1RDUWcxSG1I?=
 =?utf-8?B?Y0NRQzJJVWpvNXN3YUNVWGJpWnNMUUc3MktXYjJyVGdXZHVIWVFEWDVmTVdZ?=
 =?utf-8?B?bWJOSWViRXZ4TFlzOXdPMWxCYnh2bWxFd1o0Nmc4ZVNFb0RRYmhEV0xCenNI?=
 =?utf-8?B?T2VlVkNnZFlyUUl5RGF4eEFSM2VRUW5TcThmbG51V2ZNcGk3NWFUV2ZuNlVZ?=
 =?utf-8?B?UGFkcFE2RkZveWVWVWp5RG5BclMzYm8wQ21IM2FJcUVqekc2Z0JxV1E5dkFo?=
 =?utf-8?B?eERHSlhDRkhXTi9QNmNFd0xuWmdIdndjV1VLaTVOMWUwUXRDZlVuc283Vktm?=
 =?utf-8?B?QzRxQVQ5Ni9FT1ViYkZ3d2pWdlZuU3k1d2RuRHc1M3RqRVFhQVB2TmdYZEcr?=
 =?utf-8?B?NEgzVkw3WlNsNldBSHdUblE4bzk0V0hmcTArTmkvek84ZE9JSCtYa25WYUdS?=
 =?utf-8?B?cDBmbjBoSkpidHN3SmVDYzJVUXdtVWZwcyttNFNtbFp1ZjJWREJoM3ZLQ1pk?=
 =?utf-8?B?ZS9wbDA4bGk3VjNFdUgvdk1FeXVLOUE1SnY1NE5JQ09BMG4vSmduQWhYUnVI?=
 =?utf-8?B?K3FHQ1lUVnc4TjYrQjA0WElxNTRIbFMxQ1paakRyci9hcU5QTENKYTBNYStW?=
 =?utf-8?B?eVFkcmVNMDl6RmpQNHVkVkRQK0RtL1F4b25HbWQ3RHgrRndZYXRnQnNGZGlO?=
 =?utf-8?B?Y3BzeGtlOFNvTG5lcEtOd3Z0aXJJZU5VVnQ3QjhiUCtvV2lOVU9UZXZGTzNJ?=
 =?utf-8?B?MlF1MjZveXg0a0xyZ0lWMmpDZjNxMlhCekIwM1pVZjgxZFJNZmlnbXJZREFB?=
 =?utf-8?B?STZmVktyV1BoR2F3Um90b0pHU2xob3Rlc1E4WmtqRThIN1BvaHFoMmpDNUpC?=
 =?utf-8?B?QkVkYnU4N0UxTEljSHpVVzJ2TWdGWFRyWFY4UmREWTBKenV3NWpwdFdIZDBQ?=
 =?utf-8?B?dEJyWHdTcG5uemNPWlB5NXZibFFEMnlGTkdFMDlLdmRIdVJhWGlsN0FSQlRz?=
 =?utf-8?B?ekFKT3NXNjVLSDJpV1dOQTM3SGNPUS9Ia2NCSndLUjg1NDFNSEJZMGo3Vmh1?=
 =?utf-8?B?ZnB5UTNOandRTHBpZGJKcjRhdXk2UVJNWGVFWFVvZ1pxRVZ0OS9IRS9qUmY1?=
 =?utf-8?B?MERqMm5uWW1KS1UrUDJZUmYzOGNnck5SdXVIVnJGR1hVMHQ0Z09sZzNteElO?=
 =?utf-8?B?ZmR4NjdtWWVUaFhoUWZpcjM4YjMxV29JanNGQmM5UllqdEVFaUoxM29SQnZG?=
 =?utf-8?B?QXhpaXFJN212SzdNdGVsS2NxRHAzbjIyTVZmekdVMEhDQXdIenNqcjdQc0JC?=
 =?utf-8?B?aFN1b0ViVHBnK2ZCa3FBMDU1SDk1SGQvRjVmeDlhY0luTWptU09zbXBCOU1T?=
 =?utf-8?B?a05WTUFYOTBzZWRrRkdOa2lIeVdvdjBqMUtON3pVcGMxVTBQRzJmTUs5SW9M?=
 =?utf-8?B?dXEwR3R2M0tuV1lJMFErWU50dnRZckVLUXN0TE5xSkR3MXZkMmtvNjlsNFQr?=
 =?utf-8?B?cHlwQmM2dEdiMUZTaFhaUXlMWlVuSnQxekY3OEtBWjdLSmxYbFlVaEVaMmt1?=
 =?utf-8?B?NTRWYVkwbTFWUWE2WEVOK2kzdGt0cGExVVlXdEtmdnI5MlZVNFZPSFJ0YzNP?=
 =?utf-8?B?ZjVXZ3MraHJRY2NBRkZRRXFDV0svQjByTis2eStBZ2RQV2JYM01VNEtlT1JS?=
 =?utf-8?B?cGJkczlRdjJYamh0S3RWbVdweFNuQjBSV0U2bnJic0Y0ZUNVaStJdTkzUWpq?=
 =?utf-8?Q?pmxJqAvY2lYFAmzXO6Sb+DjWhFx9sPIk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NEN3VXc3cFdIQnN1bzJrN1JjdEVuV3VjZnNtUEdxRGRHQ3lmaFhsVzU5UXl1?=
 =?utf-8?B?akJ3Tmd3Yk93MUsxbk1zMExCVXM0Z1VPZEZIUEtLQVdTZDZrK3pTY1ZYSmlt?=
 =?utf-8?B?cnNhMXhLZ3FjeU9XczVJSk5QVGtvZmoxNXpkT1dmQW5JTWp1QVNJaXAvWWJH?=
 =?utf-8?B?cGJncTRLK0NmaHd5LzczUUxnZkFrNTFBN3pXaUp0ZzlOY1hHOXgzaktzYmlL?=
 =?utf-8?B?bi9iR0RUV3ZiNk5JeWNSQTk3amk2WlZBaEJ6YlppUVVib3ZvWkVhQ01ob2RZ?=
 =?utf-8?B?K0FkZDRtMnY0MGtvaDRKWXBsVzcvWjR2OGFCL1F1Um41UlV1RklUU2VWTWVM?=
 =?utf-8?B?L3cyT2s0bEl1Y2EzdEtkaDkyazFwNTFodWd1NVVJREJrV0xjeTlzengwVWxp?=
 =?utf-8?B?SXJsektVVVdBb1hjUVNkVnh3a2QyaEZaZ2tuWkh0MXB3aFVCMmhQUE1ObS80?=
 =?utf-8?B?SE52bzE5d1Q1RWE5VlpjRHNVQ3BPTzhEYjJWUWE2NTJHWGtmbVlta3B3bE5W?=
 =?utf-8?B?Q3JJK1dWT1FjbzlNTE8xeHIvRms4cVMySCtCZDZRUVVJSTVrcUFKR3FqRXdB?=
 =?utf-8?B?L2pOamFUaVhZVUhPVzg4aS9Kc1JIMU1zTHd1b0krYXFSZ3lHK1lSZnVURjFL?=
 =?utf-8?B?NjF3RmxudEs4LzJrVVlOZU05ZFRJTjdQaTh4MzJlK2lTZnNQbGk5MnNjakJT?=
 =?utf-8?B?S01Yb3pabHBDMXpPUEtRZTdtS1hTM09NMWdUV1VhOWxtd0RBbmV4ZGVqclly?=
 =?utf-8?B?amtWakxZSmJYT1VDK2piVmVlYWdlT09hU0JEa0NPUE5YRDB0S3pOTElRcnFz?=
 =?utf-8?B?UVVxVnBRL1dJN2VDRUFEbSt4djBiUVlHVENXRUNlaHo4eW8vVzJGeldmWFJy?=
 =?utf-8?B?QmsxMDNHS1JadXI5akxtbU9ucWxpUkFvTXdaRkRvdUkrQ1VxdlIwMGY2SVFF?=
 =?utf-8?B?MHh3cm54NStLUzAxeEVER3l4dEVlVmZHWDg0ZTQ1OXNLQmg5OTU0ZVRlSlZi?=
 =?utf-8?B?UG5LOFkxQzdsb0NoRHh6ZlNKQkUvZC9GaGw0RnhxQkYwZzN0UGtpQVBiMFYw?=
 =?utf-8?B?c0JYL1ZYOGV0VTRxK0d0VFRlUXM4bGlrRFRMclpxS1dkTnJLcWR4WStEN0hG?=
 =?utf-8?B?L0tFRVBQcnJtT2xTc1RvbDhETE5DUHQ4Sy9OOGVWRmFvZmNMcjNxZGFrcTRs?=
 =?utf-8?B?RHJaU3MraXJRcXB5RnR5UHh4dVZTdzBXaFY4Y1F6VVMxZURKVEhpVTFvaHIw?=
 =?utf-8?B?V3pLa05ySk5LV2pYdVRiMTR0elFZMnpsZ1JUZDcyaFJSZVFHTUJBNVNYN0xU?=
 =?utf-8?B?ZVBwWmZoMFdyRCtheDlublFaMkEvRE90Y2RxcTVUWmsvZitaRzF1RnljbFRL?=
 =?utf-8?B?cnh4SSs5WGYwTllRK1JNQzI3V1hlWWZIK0VXeUJqRFF5eDZPSHR6YmNidlBE?=
 =?utf-8?B?V1U1b3VLSzl4bm84RzFZVC9nU1NOdWhoU3dieFZNbFJvSjRLVnhCbGFBdTFq?=
 =?utf-8?B?d1NEajRhZGkzWnpKUTdUbkZOR0FZL2sraXl2bk53Z2ttODl2OFlyOHo2VUFj?=
 =?utf-8?B?V1pJT2g2TFE1bFRxTGIrWGt0ZGg1MEx5WEJ6anJ2M3dIeVQrQko5WXlqOVNn?=
 =?utf-8?B?QndyY1NDeHhieEVkQW9LTVIzek1ZVkdEWGRoNDd3OGdTR1ZjYzJ4UVBhSEcy?=
 =?utf-8?B?c0g0Z21vZFVlN3RDVmcyNnM3RkRFTEY2QXNFTGRTUGVOMkQ1cXEyU0VlUzBn?=
 =?utf-8?B?c1ZqQ2lSZWZtN2MrbnhFbTRVWmRQb3FLZHJiS0hoeDJVRUFocXdxamRBY2hU?=
 =?utf-8?B?Yi9IT25nWUFpUVg4aHlYQXNWdStYdzBaaTRxTnU0WGNPOGNhU0dRZjduV0Zq?=
 =?utf-8?B?S2EyaVVxVGRkOE1iMnNjZGx0aGRMUGNvektOTEtMYVNuK0k5NE56b3kvemQ1?=
 =?utf-8?B?UUlENWswR0JoQ1BCamhpcG1zWHZlV2d6c2dsTXA2MHNuMDNYZGNWWXVlQ3dN?=
 =?utf-8?B?R1lFZml1N1owR3Y3MXltcWxkR1MrSGd5dXlYY0Urb1RMcE1TcURzTjA5OXB0?=
 =?utf-8?B?blFmcmlrcnpRUlcxdkxOWVFuR3EyTTVUUW95S2lRaFNOM1g3TXMyOUVZTVEv?=
 =?utf-8?B?WVNSa0RMdk1jd1hOanJvbmVLZzJhR2dYR1dpUHpybVJXeU9GSzc0eXg4c1lw?=
 =?utf-8?B?elE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81694bcb-2072-432f-97b6-08dd3b8da3df
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 09:09:28.1621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AlEggaxUyhF92EMvhaJyzvjf1Vv4oouVlmiWBVXr5y9+95uh60SXRCIHF0EjWE9vo5bNlwlPHeRNBQQ1UWAZpal+3r8FaUF9OPJlmT3IYaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6770
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC14ZSA8aW50ZWwteGUt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBNYXR0aGV3IEF1
bGQNCj4gU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAxOCwgMjAyNCA1OjQ5IFBNDQo+IFRvOiBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0
aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT47IEJyb3N0LCBNYXR0aGV3DQo+IDxtYXR0
aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYyIDYvN10gZHJtL3hlOiBh
bGxvdyBub24tY29udGlnIFZSQU0ga2VybmVsIEJPDQo+IA0KPiBJZiB0aGUga2VybmVsIGJvIGRv
ZXNuJ3QgY2FyZSBhYm91dCB2bWFwKCksIGVpdGhlciBkaXJlY3RseSBvcg0KPiBpbmRpcmVjdGx5
IHdpdGggc2F2ZS9yZXN0b3JlIHRoZW4gd2UgZG9uJ3QgbmVlZCB0byBmb3JjZSBjb250aWcgZm9y
IHN1Y2gNCj4gYnVmZmVycy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQXVsZCA8bWF0
dGhldy5hdWxkQGludGVsLmNvbT4NCj4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVs
bHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJv
c3RAaW50ZWwuY29tPg0KPiAtLS0NClJldmlld2VkLWJ5OiBTYXR5YW5hcmF5YW5hIEsgViBQIDxz
YXR5YW5hcmF5YW5hLmsudi5wQGludGVsLmNvbT4NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9i
by5jIHwgOCArKysrKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5j
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4gaW5kZXggNzc5MThlMzBiOTA0Li45ZTVi
Yjg3YTFiM2MgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+IEBAIC0xNjQsMTEgKzE2NCwxNyBAQCBz
dGF0aWMgdm9pZCB0cnlfYWRkX3N5c3RlbShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gc3RydWN0
IHhlX2JvICpibywNCj4gDQo+ICBzdGF0aWMgYm9vbCBmb3JjZV9jb250aWd1b3VzKHUzMiBib19m
bGFncykNCj4gIHsNCj4gKwlpZiAoYm9fZmxhZ3MgJiBYRV9CT19GTEFHX1NUT0xFTikNCj4gKwkJ
cmV0dXJuIHRydWU7IC8qIHVzZXJzIGV4cGVjdCB0aGlzICovDQo+ICsJZWxzZSBpZiAoYm9fZmxh
Z3MgJiBYRV9CT19GTEFHX1BJTk5FRF9FQVJMWV9SRVNUT1JFKQ0KPiArCQlyZXR1cm4gdHJ1ZTsg
LyogbmVlZHMgdm1hcCAqLw0KPiArDQo+ICAJLyoNCj4gIAkgKiBGb3IgZXZpY3Rpb24gLyByZXN0
b3JlIG9uIHN1c3BlbmQgLyByZXN1bWUgb2JqZWN0cyBwaW5uZWQgaW4gVlJBTQ0KPiAgCSAqIG11
c3QgYmUgY29udGlndW91cywgYWxzbyBvbmx5IGNvbnRpZ3VvdXMgQk9zIHN1cHBvcnQNCj4geGVf
Ym9fdm1hcC4NCj4gIAkgKi8NCj4gLQlyZXR1cm4gYm9fZmxhZ3MgJiAoWEVfQk9fRkxBR19QSU5O
RUQgfCBYRV9CT19GTEFHX0dHVFQpOw0KPiArCXJldHVybiBib19mbGFncyAmIFhFX0JPX0ZMQUdf
TkVFRFNfQ1BVX0FDQ0VTUyAmJg0KPiArCSAgICAgICBib19mbGFncyAmIFhFX0JPX0ZMQUdfUElO
TkVEOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyB2b2lkIGFkZF92cmFtKHN0cnVjdCB4ZV9kZXZpY2Ug
KnhlLCBzdHJ1Y3QgeGVfYm8gKmJvLA0KPiAtLQ0KPiAyLjQ3LjENCg0K
