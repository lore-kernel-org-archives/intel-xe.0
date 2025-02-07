Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F34C02194
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 13:37:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19D910EAF0;
	Fri,  7 Feb 2025 13:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+AzzyK5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F0310EAF0
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 13:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738935435; x=1770471435;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GMYYEcg/qBAtrzsUM1WCMVzVwjXj5mMAYTlppcfxaB4=;
 b=a+AzzyK5dGw1wqw1LSoNhtROQKNj2kJh9q4dSaKM5WZ4Q14qEeSz+Z80
 OWlsvb8BzkIHjJBltn8QrJo4pCv4ElJ7qTXKjzoP3vF/GpvShznUMLF8C
 XDqEcA7ezBSGJAuG1b8u164u1bIavWLDu6dXJlFqSg6+dCxlynAV5FrFU
 qE/Rr3NjireDh/Xf3aMLviT9M8QYIVgdQWhvvK5dLm8QkFIP6B7+CZ7hy
 eupFj4ENpWNaTsxboj7pq100HxLAJ6CEf6GSE836IJ3X8Z6TqFUnBrUtU
 wHQk0pWiM6XdGluPQvu+j99x3uCFlXput5c0z/64aKgqnBGBqynRSg3ps w==;
X-CSE-ConnectionGUID: 2IywvOKXTiqyZWtq1QFNyQ==
X-CSE-MsgGUID: DunPTM8xSmyBAAIlw3xY4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="42416533"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="42416533"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:37:10 -0800
X-CSE-ConnectionGUID: etOVRblwSiSDjBWmp2E80g==
X-CSE-MsgGUID: SCY3dMgBTzWUHP8cSzRSEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="116574753"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 05:37:09 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 05:37:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 05:37:09 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 05:37:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEENWokShlkMyyiNJ0RAQqKsKv3Ngh7OYQ9zJuutE9nhCHEYTjdG2GNnqWmzryhpik4UhlOO5dyp6CprHacc2getFGSaVmrs7rfgkE0kwPhiAugYZo6Kb69wGA+lYO+ZxH8dEn38Cc000KzMCdTilyoMn481yWCeFOl4C4AZyhCTrkgj1//e+0oOA6eYyMNyjVhhtWSqaWl4HMebmm2e22R4LFn7kh15LDS6SRJvbZHJ6Q6nWsbIqPncNt84E/PkvOWc62/MYQgRA9mXkzsIfP7d7KV5iDb4QPrjy1GE3A1XwyvBE+PfzAYfHYXGz/XXN3qaGTHJaeTSua9AFiEiUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMYYEcg/qBAtrzsUM1WCMVzVwjXj5mMAYTlppcfxaB4=;
 b=T72gr0N/H1+w0E/sdhdy0PErqJJJHRY4CJqSEcrXSaRFooGbdXTC8+NDgJLEEg9agFr48gY/zSC7B6rLHmPHIxQXC5LgZVD3FlOQmM4os03TPZWkow12YxRJJrLpIirN3s2wZ5bl1h5pBnivk/+2uAWywIekLq2if+KSAMFIsXd7fAfmim/ANV1umkptEDoenY7aDnqak+LNTpCw8xpZf+T/ceR368L3nAcHnPn322gIoOQWXg8rnRrYCbqpAFdBfbs7Z9jGp0pXGJ6GU66r6oCF0yWYIrytKhAzCg0+TGEdQVZJGY4+EjnWL9e+ExlODdPBrDs3Er2hWvEQtyhkkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CH2PR11MB8833.namprd11.prod.outlook.com (2603:10b6:610:282::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 13:37:06 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8422.009; Fri, 7 Feb 2025
 13:37:06 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Winiarski, Michal"
 <michal.winiarski@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v4 1/1] drm/xe/pf: Use an explicit check to see if the
 device has LMTT
Thread-Topic: [PATCH v4 1/1] drm/xe/pf: Use an explicit check to see if the
 device has LMTT
Thread-Index: AQHbeVPop4a7cJrj60iY652Muecxi7M71waw
Date: Fri, 7 Feb 2025 13:37:05 +0000
Message-ID: <SJ1PR11MB62044BD1B5165A2CB26804CD81F12@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250207113111.853821-1-piotr.piorkowski@intel.com>
 <20250207113111.853821-2-piotr.piorkowski@intel.com>
In-Reply-To: <20250207113111.853821-2-piotr.piorkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CH2PR11MB8833:EE_
x-ms-office365-filtering-correlation-id: 33b778a7-1901-40bc-4143-08dd477c833f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?MUFjZnFZcHlrdVJwTGF2VTdRQVNEd1AwaWNDOXpJZWNDSkdBb1JEaS81TVBO?=
 =?utf-8?B?T0JXUmdyV2ZaZWpmaTU4SHNVUWxDUSs4WDREQklPZEtGWU9QNVRqLzBWaUh6?=
 =?utf-8?B?aHRYK3JkY1B5aU5tdkxBQW1kaDl1N3o3aFArSkxRaktkWFpUL1pJYVNWL0JP?=
 =?utf-8?B?SUU2VmdDYkFuUnF2aWhUdlRjUEFiZHF1anVVdyt0aUZWamZyRUlFa2EzV3JR?=
 =?utf-8?B?Z1I1SFh4ZDFRdmdiRzhaZUNhTkdqb3F6VG5OVU5XdGY0NFJkWkhDV1Q5b25O?=
 =?utf-8?B?U3lUVjA1OWF3NXdPSS9YZ0hWdWZqTFNHMDQrdHlWa2ZOK1JQOE5yZmdMUXBY?=
 =?utf-8?B?SFZmRmRkY01rM05KTURWS21DOTJmcUlnMERnMzBsV1V2NzFqa2EvUkV4RDlL?=
 =?utf-8?B?T2FpVnhxTmRvWmJEcEZNbSt4NS9SaHFoSVJrelltQ2Z5QWxwdzdOWld2dWpv?=
 =?utf-8?B?UmtiSENSUEF4QnhsZXFiSzdNZG9pMmYzT3lkZUl2ako2dytUWXUwRG9sY3dn?=
 =?utf-8?B?VzZORURYVnB0YVBENEU3eEQyTGVZQ3VNY1RjWGxVNWl5V1NoZ280MkVLUktZ?=
 =?utf-8?B?MlFraStSL0hqY0M1eG8rRmxSRVBGSkFDYlZUcHV5Q3ViQ2phS0p6UjQ3OFVw?=
 =?utf-8?B?WVRJenB5ZlpLSzFCY2dvdHZ5TlhWV3dJcGo4YlJNRGk1S1dQWm1oaUFSMUJS?=
 =?utf-8?B?T1VDV2lQZ2hXVGYzTTM3Mkd2V3Vsek9KL2crSFJwV2w5ZWNBMDRqaWhvakVq?=
 =?utf-8?B?anNXNTdnbnJ5aVVYbHA5dy9BLzZTZDk1czFIdjRkMXFtNWdDYzRmNGFMcEQy?=
 =?utf-8?B?Q21rQ1RSQWcwdmNtNVA4SGVrbllPTVZPK2xZMiszTitaZHVLQk92S2NPUGx4?=
 =?utf-8?B?bWFBL2h6WUcrMXo5VG5uMU4vei9iT1pueTJzUmlkNUV2eldGRm1aZmxKcGN4?=
 =?utf-8?B?ZkZlazdKQlJTMHhoK3VrYVV5ZWRnc3JwWVJJcXMvaTVJUnlyeUVUVUU5NEE4?=
 =?utf-8?B?VE52bkgybmZPaE5DVmJCVUl1Y3FvYnV5WkVNaXg1STNFeUJqM3JENGRhamlP?=
 =?utf-8?B?MzVWYW9XM2lkT3hkbzBXT2Vqc2lqNjREVnN4OEwyMXhjWk9rRHpCMFZsNHlm?=
 =?utf-8?B?T0ttUHVPMDl3QjFHNVJSYWxoNWppSDRnU29nd0lrUFFLa05WbUFCR1NzTjha?=
 =?utf-8?B?b2s0MXNsMmlpVVhqTmUwSVI0ZnhLR2Z4U1VwNUIvU2lFUnJ3Y2F1T09ybnlI?=
 =?utf-8?B?dGJ1THV3MU9SMGlvNlpzcVVPWlp2alZSYXArd003ZVJKRW9JZHZjWGVrUDBL?=
 =?utf-8?B?TVo3L24vbkZvUWErRFowcStkU3ErVmJjS3JlRzNOWXpXemQwN2wwWVRRM0tp?=
 =?utf-8?B?YkJOMisxQlJDZU9pcjRFYlRJeXhsdVJ1ZU1QQ2haaUpGeHR4Q3FkYUFXY3A2?=
 =?utf-8?B?RHY3VW5jNk9pNktLOEZTNTFDV2xtYzJDRnhPeWNPMnhzT2kreVRDSmhMYXZN?=
 =?utf-8?B?Q25BMUVqSkRNY0xpa211YW5wN3pseExMSGlSRm9EMEluWkVrTzVCaVIvNzhp?=
 =?utf-8?B?cVRCKzZBUjU4ZG8rV2R6TEJsWXE1eG55eXpLWldxczl5YWhUa21yaFNPejBN?=
 =?utf-8?B?WXZtd1phaisrd2h4M2k2M2xsZE1OY0VSYXgvU3crcXZxakVNVUJvZHNaaHlJ?=
 =?utf-8?B?T1NPdTg0TW9MY0tUbGNZU21mUXdIbWZQaEVyWWwwY0FpWDM4bjU4QXIyN2da?=
 =?utf-8?B?bTBXeWUyMnBEV3VKS3huWk9ZcWV2VTZTekFlMDFaOHgrKzdqNVpjWTUvU0hN?=
 =?utf-8?B?bnh6NituYU5RRmZqZ1VHeEh1a1BWSTFpL0RodDdxa2YxQWxGQjlpSFRZczgx?=
 =?utf-8?B?RXJYdW1SUzdRUlNoQ2VsaU5pZ2d6MkdvRHBDdmlwQ2hHQkVIeUhpcDJLOVhX?=
 =?utf-8?Q?gI5Q6WrmIvFZklva+i+92WYrta7Em4Xj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVBDNlpNSFo1VXhDSVdvWmh4SXdpY0RscURYSHUvNnZtZEtsK1lhMUFMdHRx?=
 =?utf-8?B?TExkOXh6alpoUnZHV2xSK09GODBuTWtZWDQzK1NsNFEzMjlyMEUyR215K1FN?=
 =?utf-8?B?eEVBZm9rekkvY0xRYnRTbTZPWEFMVTVQbzFWMkRiK2l1RHFiYkwzVFZBZ1ND?=
 =?utf-8?B?M201R2E1MVNQYmVZaklJdno0RjV5bjNtSXoxdE5YbWovcG9ZZ3RmVkMxcmJ3?=
 =?utf-8?B?QndTUVJEaEorSmVCOHFJMndodDBFa0lzczRybmgzYWFqbm5ydVZsUzlmSDk5?=
 =?utf-8?B?Ryt4UkVHYi82TFVsRnp0dnVFcmJUQ3RDaDMvaHN1QWtmeDdOV2MrcVIydy80?=
 =?utf-8?B?Mm5raEgzMG95ODdKRGJiSlR0bG9ObnFNUUVQeHBkT29jRDhtZ0FxTGpZU0FZ?=
 =?utf-8?B?TUlDak9ycytvckcxdFBzbkU5T3owNGE1SzFMaThmTmtzVXRwUUpwazlQMVJD?=
 =?utf-8?B?STUxNnBXSUFtTUtpb1lTamNZQUtzNHZJWDlmK1RTcGt3MENrWHNmYlY0ODVR?=
 =?utf-8?B?Sytic0c5dmdBTFBYQWZ1NFRKQVpqT0ljZVVQVjBFM05sU0FmdFhmd3hKS2RC?=
 =?utf-8?B?blgvNFNMQjZVdi9GOHd5SDhNQTNYWGd4MDhUK2FtVitwck1aV3MvMFNLblBW?=
 =?utf-8?B?MGpYTHBlaC9kQldUaUYyTUdqUERzL1cwTk51R09pdms3bXFxQkhTbkJlVHNV?=
 =?utf-8?B?TzBtdUZpRXduY0R4TUsxQk5yU3c1MXFmWXk3Y0ozRnQ1cnJ6M2RyaUVLaTF3?=
 =?utf-8?B?N3RxZ1BGbUlzUXJMYnRTMzFubmRZaTFGYjJpdXJhV0l3bllUbG5yeUovMzls?=
 =?utf-8?B?bERseVhNSFRSV3BJcGhsbEpJN0IzQnBIZFRwbkdUWWMvWjZwZElkMTZSRDgw?=
 =?utf-8?B?UGZzRnM1b3k1bkdkS085Tm0wWWE0eTg2TFQ1TURMZTJTRFBmTzVmTlFRTmdB?=
 =?utf-8?B?RE44ejMxdTJNSk9kMnhLUUsxWVJ5VWRDVjAyb2hadHAyREJTWXVGeDUva0xD?=
 =?utf-8?B?K3lCN3ROa3RRVVFXUHYxYm0wUUdhMVNsZUQ0Q2xld2E1UVBpTkxQV09CdXBO?=
 =?utf-8?B?Q21Ccy9pUUtGSUJvLzhORWFXYzM4eVZFcUU3Z0lWWHpuZ0tZVEgxa0Vhc0hH?=
 =?utf-8?B?QzhFbVNhNDAwODNFZ2JROUFWdk1TM1EvZDNzQWxNTGRtY3luRi85NFI2c1ZV?=
 =?utf-8?B?aGxmdXQxMUxsUExTZ1Q4VktkYjVEaUJxeGtNTWxyT0FqdVpSU290d1J3RWJi?=
 =?utf-8?B?KzNBb2dwUEV2azhkbXhCSWxDU2JwaFh2Si96KzBLSmgwVWY1cHY3ejNZRFBv?=
 =?utf-8?B?L2RYUGFPRUFjUGVQdVlZTVhpa0Jxbnoxb0NXR0Rrd0kwdlh3V1pYYldvRm55?=
 =?utf-8?B?ZG5sT2RVWWd1S2dvcmVsNWhPNjJVNzBOVzVWWmd1cEFVRDBGWTlDVDNMSElL?=
 =?utf-8?B?a3YzRmtFZ3FrWDBKb21FQ2pkdTJIamwvelBzVU1DVGtud3VXeVlDb2JTSHJR?=
 =?utf-8?B?T1J5SitpQ2NjN1BwNkl3bTRlUEh5eXh1YjZYVzRtSzA0WHhGODVSY0dZeVow?=
 =?utf-8?B?d0xqVi9VVGh1RVFJQjg5ZnJFQkhyUi9lY1g4N2xzeDZrbTVBOExQY1FkZUxp?=
 =?utf-8?B?RFNNYVhOUUZJanRvTXY2cURZdEtCL1pZZnR2U01MdDdBQWJFMmhuUWU5d1Jx?=
 =?utf-8?B?dmlOa1JYR0NwVHFLbm91Y0djV05yOWxKT2I0dmZlU0xjWk9GRDRXbEFXUk92?=
 =?utf-8?B?bGh5SmZ2aVVkVjZ4SWRmR0pXYURLR3cwMXNOSFEzZUtuYWwzd0tmeFR5a3Bq?=
 =?utf-8?B?RGQrN01XaFMraWk3eVpFNWNkSzZDREdVR0poSlBMaGg0R1VJMjZIa0NncitE?=
 =?utf-8?B?a3FMRTN3MWFlVzFYWEdtLzJ2Tit3UTBIL1hBYm1jdGVieU9nMTUrc0JvZG1U?=
 =?utf-8?B?cnhtVGwrQWd5aDE5S2NQdXM3TUlQYjRpM2lDYmVPdHgvNzNXanJkcmk5ZVgz?=
 =?utf-8?B?M21Xci9nbHhENHBadVZ4elNtNmxqVzg5MUI4Z09iazhBSjhlZkVOazhQL1Fj?=
 =?utf-8?B?RjdHM28ramp1L0N3UTV4QkxUdUxZOXVGeFlocWd2VlhrU2FsNkZJTXR6WnZt?=
 =?utf-8?Q?2lcDe7NKlprRvF3D8GHXo3Arr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b778a7-1901-40bc-4143-08dd477c833f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 13:37:05.9538 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eRg5Nx09hp7+OprS6mWmV2al47Y4hkz7XREM5Vr5byd7GExIG7lUDNuFnUyqD4e8xXa/6MUMNMrql6BexzAKg0+FgkTq4/oqpAeOr5w/hi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8833
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gUGnDs3Jr
b3dza2ksIFBpb3RyDQo+IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgNywgMjAyNSA1OjAxIFBNDQo+
IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFBpb3Jrb3dza2ksIFBp
b3RyIDxwaW90ci5waW9ya293c2tpQGludGVsLmNvbT47IFdhamRlY3prbywgTWljaGFsDQo+IDxN
aWNoYWwuV2FqZGVjemtvQGludGVsLmNvbT47IFdpbmlhcnNraSwgTWljaGFsDQo+IDxtaWNoYWwu
d2luaWFyc2tpQGludGVsLmNvbT47IEsgViBQLCBTYXR5YW5hcmF5YW5hDQo+IDxzYXR5YW5hcmF5
YW5hLmsudi5wQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHY0IDEvMV0gZHJtL3hlL3Bm
OiBVc2UgYW4gZXhwbGljaXQgY2hlY2sgdG8gc2VlIGlmIHRoZSBkZXZpY2UNCj4gaGFzIExNVFQN
Cj4gDQo+IEZyb206IFBpb3RyIFBpw7Nya293c2tpIDxwaW90ci5waW9ya293c2tpQGludGVsLmNv
bT4NCj4gDQo+IFNvIGZhciwgdGhlIG1haW4gY29uZGl0aW9uIGZvciB1c2luZyBMTVRUIGhhcyBi
ZWVuIHRvIGNoZWNrIHRoYXQgdGhlIGRldmljZSBpcyBhDQo+IGRpc2NyZXRlIGdmeC4NCj4gTGV0
J3MgYWRkIGEgZGVkaWNhdGVkIGZ1bmN0aW9uIHRvIGNoZWNrIGlmIHRoZSBkZXZpY2Ugc3VwcG9y
dHMgTE1UVCBhcyBub3QgYWxsDQo+IGZ1dHVyZSBkaXNjcmV0ZSBHUFUgcGxhdGZvcm1zIHdpbGwg
cmVxdWlyZSBMTVRULg0KPiANCj4gdjI6DQo+ICAtIHVzZSB4ZV9oYXNfZGV2aWNlX2xtdHQgb25s
eSB3aGVuIG5lY2Vzc2FyeSAtIGxlYXZlIElTX0RHRlggZm9yIG90aGVyDQo+ICAgIHRoaW5ncyBy
ZWxhdGVkIHRvIExNRU0gcHJvdmlzaW9uaW5nDQo+IHYzOg0KPiAgLSByZW1vdmUgSVNfU1JJT1Zf
UEYgY29uZGl0aW9uIGZyb20geGVfZGV2aWNlX2hhc19sbXR0IChNaWNoYWwNCj4gICAgV2FqZGVj
emtvKQ0KPiAgLSBrZWVwIElTX1NSSU9WX1BGIGFzc2VydHMgaW4gTE1UVC1yZWxhdGVkIGNvZGUg
KE1pY2hhbCBXYWpkZWN6a28pDQo+IHY0Og0KPiAgLSB1cGRhdGUgY29tbWl0IGRlc2NyaXB0aW9u
DQo+IA0KDQpDaGFuZ2UgTEdUTSwNClJldmlld2VkLWJ5OiBUZWphcyBVcGFkaHlheSA8dGVqYXMu
dXBhZGh5YXlAaW50ZWwuY29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IFBpb3RyIFBpw7Nya293c2tp
IDxwaW90ci5waW9ya293c2tpQGludGVsLmNvbT4NCj4gQ2M6IE1pY2hhbCBXYWpkZWN6a28gPG1p
Y2hhbC53YWpkZWN6a29AaW50ZWwuY29tPg0KPiBDYzogTWljaGHFgiBXaW5pYXJza2kgPG1pY2hh
bC53aW5pYXJza2lAaW50ZWwuY29tPg0KPiBDYzogU2F0eWFuYXJheWFuYSBLIFYgUCA8c2F0eWFu
YXJheWFuYS5rLnYucEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RldmljZS5oICAgICAgICAgICAgIHwgIDUgKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndF9zcmlvdl9wZl9jb25maWcuYyB8IDIxICsrKysrKysrKysrKystLS0tLS0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2xtdHQuYyAgICAgICAgICAgICAgIHwgIDQgKystLQ0KPiAgMyBm
aWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4gYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2aWNlLmggaW5kZXggZmMzYzJhZjNmYjdmLi4wYmMzYmM4ZTY4MDMNCj4g
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaA0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4gQEAgLTE3MCw2ICsxNzAsMTEgQEAgc3Rh
dGljIGlubGluZSBib29sIHhlX2RldmljZV91c2VzX21lbWlycShzdHJ1Y3QNCj4geGVfZGV2aWNl
ICp4ZSkNCj4gIAlyZXR1cm4geGVfZGV2aWNlX2hhc19tZW1pcnEoeGUpICYmIChJU19TUklPVl9W
Rih4ZSkgfHwNCj4geGVfZGV2aWNlX2hhc19tc2l4KHhlKSk7ICB9DQo+IA0KPiArc3RhdGljIGlu
bGluZSBib29sIHhlX2RldmljZV9oYXNfbG10dChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkgew0KPiAr
CXJldHVybiBJU19ER0ZYKHhlKTsNCj4gK30NCj4gKw0KPiAgdTMyIHhlX2RldmljZV9jY3NfYnl0
ZXMoc3RydWN0IHhlX2RldmljZSAqeGUsIHU2NCBzaXplKTsNCj4gDQo+ICB2b2lkIHhlX2Rldmlj
ZV9zbmFwc2hvdF9wcmludChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IGRybV9wcmludGVy
ICpwKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zcmlvdl9wZl9j
b25maWcuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zcmlvdl9wZl9jb25maWcuYw0K
PiBpbmRleCBiMWQ5OTRkNjU1ODkuLjVjM2U5ZTViZDA1MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d0X3NyaW92X3BmX2NvbmZpZy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF9zcmlvdl9wZl9jb25maWcuYw0KPiBAQCAtMTMzNiw3ICsxMzM2LDcgQEAg
c3RhdGljIHZvaWQgcGZfcmVzZXRfdmZfbG10dChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gdW5z
aWduZWQgaW50IHZmaWQpDQo+ICAJc3RydWN0IHhlX3RpbGUgKnRpbGU7DQo+ICAJdW5zaWduZWQg
aW50IHRpZDsNCj4gDQo+IC0JeGVfYXNzZXJ0KHhlLCBJU19ER0ZYKHhlKSk7DQo+ICsJeGVfYXNz
ZXJ0KHhlLCB4ZV9kZXZpY2VfaGFzX2xtdHQoeGUpKTsNCj4gIAl4ZV9hc3NlcnQoeGUsIElTX1NS
SU9WX1BGKHhlKSk7DQo+IA0KPiAgCWZvcl9lYWNoX3RpbGUodGlsZSwgeGUsIHRpZCkgew0KPiBA
QCAtMTM1Nyw3ICsxMzU3LDcgQEAgc3RhdGljIGludCBwZl91cGRhdGVfdmZfbG10dChzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZSwNCj4gdW5zaWduZWQgaW50IHZmaWQpDQo+ICAJdW5zaWduZWQgaW50IHRp
ZDsNCj4gIAlpbnQgZXJyOw0KPiANCj4gLQl4ZV9hc3NlcnQoeGUsIElTX0RHRlgoeGUpKTsNCj4g
Kwl4ZV9hc3NlcnQoeGUsIHhlX2RldmljZV9oYXNfbG10dCh4ZSkpOw0KPiAgCXhlX2Fzc2VydCh4
ZSwgSVNfU1JJT1ZfUEYoeGUpKTsNCj4gDQo+ICAJdG90YWwgPSAwOw0KPiBAQCAtMTQzNCw3ICsx
NDM0LDggQEAgc3RhdGljIGludCBwZl9wcm92aXNpb25fdmZfbG1lbShzdHJ1Y3QgeGVfZ3QgKmd0
LA0KPiB1bnNpZ25lZCBpbnQgdmZpZCwgdTY0IHNpemUpDQo+ICAJCWlmICh1bmxpa2VseShlcnIp
KQ0KPiAgCQkJcmV0dXJuIGVycjsNCj4gDQo+IC0JCXBmX3Jlc2V0X3ZmX2xtdHQoeGUsIHZmaWQp
Ow0KPiArCQlpZiAoeGVfZGV2aWNlX2hhc19sbXR0KHhlKSkNCj4gKwkJCXBmX3Jlc2V0X3ZmX2xt
dHQoeGUsIHZmaWQpOw0KPiAgCQlwZl9yZWxlYXNlX3ZmX2NvbmZpZ19sbWVtKGd0LCBjb25maWcp
Ow0KPiAgCX0NCj4gIAl4ZV9ndF9hc3NlcnQoZ3QsICFjb25maWctPmxtZW1fb2JqKTsNCj4gQEAg
LTE0NTQsOSArMTQ1NSwxMSBAQCBzdGF0aWMgaW50IHBmX3Byb3Zpc2lvbl92Zl9sbWVtKHN0cnVj
dCB4ZV9ndCAqZ3QsDQo+IHVuc2lnbmVkIGludCB2ZmlkLCB1NjQgc2l6ZSkNCj4gDQo+ICAJY29u
ZmlnLT5sbWVtX29iaiA9IGJvOw0KPiANCj4gLQllcnIgPSBwZl91cGRhdGVfdmZfbG10dCh4ZSwg
dmZpZCk7DQo+IC0JaWYgKHVubGlrZWx5KGVycikpDQo+IC0JCWdvdG8gcmVsZWFzZTsNCj4gKwlp
ZiAoeGVfZGV2aWNlX2hhc19sbXR0KHhlKSkgew0KPiArCQllcnIgPSBwZl91cGRhdGVfdmZfbG10
dCh4ZSwgdmZpZCk7DQo+ICsJCWlmICh1bmxpa2VseShlcnIpKQ0KPiArCQkJZ290byByZWxlYXNl
Ow0KPiArCX0NCj4gDQo+ICAJZXJyID0gcGZfcHVzaF92Zl9jZmdfbG1lbShndCwgdmZpZCwgYm8t
PnNpemUpOw0KPiAgCWlmICh1bmxpa2VseShlcnIpKQ0KPiBAQCAtMTQ2Nyw3ICsxNDcwLDggQEAg
c3RhdGljIGludCBwZl9wcm92aXNpb25fdmZfbG1lbShzdHJ1Y3QgeGVfZ3QgKmd0LA0KPiB1bnNp
Z25lZCBpbnQgdmZpZCwgdTY0IHNpemUpDQo+ICAJcmV0dXJuIDA7DQo+IA0KPiAgcmVzZXRfbG10
dDoNCj4gLQlwZl9yZXNldF92Zl9sbXR0KHhlLCB2ZmlkKTsNCj4gKwlpZiAoeGVfZGV2aWNlX2hh
c19sbXR0KHhlKSkNCj4gKwkJcGZfcmVzZXRfdmZfbG10dCh4ZSwgdmZpZCk7DQo+ICByZWxlYXNl
Og0KPiAgCXBmX3JlbGVhc2VfdmZfY29uZmlnX2xtZW0oZ3QsIGNvbmZpZyk7DQo+ICAJcmV0dXJu
IGVycjsNCj4gQEAgLTE5ODEsNyArMTk4NSw4IEBAIHN0YXRpYyB2b2lkIHBmX3JlbGVhc2VfdmZf
Y29uZmlnKHN0cnVjdCB4ZV9ndCAqZ3QsDQo+IHVuc2lnbmVkIGludCB2ZmlkKQ0KPiAgCQlwZl9y
ZWxlYXNlX3ZmX2NvbmZpZ19nZ3R0KGd0LCBjb25maWcpOw0KPiAgCQlpZiAoSVNfREdGWCh4ZSkp
IHsNCj4gIAkJCXBmX3JlbGVhc2VfdmZfY29uZmlnX2xtZW0oZ3QsIGNvbmZpZyk7DQo+IC0JCQlw
Zl91cGRhdGVfdmZfbG10dCh4ZSwgdmZpZCk7DQo+ICsJCQlpZiAoeGVfZGV2aWNlX2hhc19sbXR0
KHhlKSkNCj4gKwkJCQlwZl91cGRhdGVfdmZfbG10dCh4ZSwgdmZpZCk7DQo+ICAJCX0NCj4gIAl9
DQo+ICAJcGZfcmVsZWFzZV9jb25maWdfY3R4cyhndCwgY29uZmlnKTsNCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9sbXR0LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbG10
dC5jDQo+IGluZGV4IGE2MGNlYWU0YzZkZC4uODkzOTNkY2I1M2Q5IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfbG10dC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9sbXR0LmMNCj4gQEAgLTE2NCw3ICsxNjQsNyBAQCBpbnQgeGVfbG10dF9pbml0KHN0cnVjdCB4
ZV9sbXR0ICpsbXR0KQ0KPiAgCWxtdHRfYXNzZXJ0KGxtdHQsIElTX1NSSU9WX1BGKHhlKSk7DQo+
ICAJbG10dF9hc3NlcnQobG10dCwgIWxtdHQtPm9wcyk7DQo+IA0KPiAtCWlmICghSVNfREdGWCh4
ZSkpDQo+ICsJaWYgKCF4ZV9kZXZpY2VfaGFzX2xtdHQoeGUpKQ0KPiAgCQlyZXR1cm4gMDsNCj4g
DQo+ICAJaWYgKHhlX2hhc19tdWx0aV9sZXZlbF9sbXR0KHhlKSkNCj4gQEAgLTQ4Niw3ICs0ODYs
NyBAQCB1NjQgeGVfbG10dF9lc3RpbWF0ZV9wdF9zaXplKHN0cnVjdCB4ZV9sbXR0ICpsbXR0LA0K
PiB1NjQgc2l6ZSkNCj4gIAl1NjQgcHRfc2l6ZTsNCj4gDQo+ICAJbG10dF9hc3NlcnQobG10dCwg
SVNfU1JJT1ZfUEYobG10dF90b194ZShsbXR0KSkpOw0KPiAtCWxtdHRfYXNzZXJ0KGxtdHQsIElT
X0RHRlgobG10dF90b194ZShsbXR0KSkpOw0KPiArCWxtdHRfYXNzZXJ0KGxtdHQsIHhlX2Rldmlj
ZV9oYXNfbG10dChsbXR0X3RvX3hlKGxtdHQpKSk7DQo+ICAJbG10dF9hc3NlcnQobG10dCwgbG10
dC0+b3BzKTsNCj4gDQo+ICAJcHRfc2l6ZSA9IFBBR0VfQUxJR04obG10dC0+b3BzLT5sbXR0X3B0
ZV9zaXplKGxldmVsKSAqDQo+IC0tDQo+IDIuMzQuMQ0KDQo=
