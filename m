Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8914EC25B75
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 00:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D42811314D;
	Thu, 30 May 2024 00:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2d859MC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9524A11314D
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 00:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717029137; x=1748565137;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=RpQ8OuwMJY9Zn1QwKQJS3EnvXGAmXFcwc7Y2hlKaBkE=;
 b=d2d859MCKQK40TFGEroxg1SfTKTajTAM2AGJj2nigkMGssfMPx1rQYEw
 XJj8Y8DPrmpSDy3oBn0HEdo+9tKhbvfidBOpdwzjEnqndclzukUitJz4S
 rw/EWQAhcDkeG+Iyo2rZ5AVvHEIjefyLHUb5Z2GmKtTqNBe7vpKqOMbOn
 PgKxkKtC3A2ws86Z/EMYEs7U17hsAcmwpZtQV1D8Nlak1HtRFNzEkNU/m
 B/1Kmq7nWAyxc3FaIAncPDyAe9/ff17wJzrtHUZ+0R1lDpgImSVoARf3Q
 uSMFMYAZkOWMD+835mIxUIFu1Fo87WIeUMpG9XXZmpSE952TmObRcKqx2 A==;
X-CSE-ConnectionGUID: Tv4hLg0cTaCwAIipNarxjw==
X-CSE-MsgGUID: Li/9YmPTTi28u8w8ToVqOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13321067"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13321067"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 17:32:16 -0700
X-CSE-ConnectionGUID: c83gyqXPQIiJcY+d2kqPvA==
X-CSE-MsgGUID: 9Jy4KAKMQam0fn3QhvIWHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="58798352"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 17:32:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 17:32:15 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 17:32:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 17:32:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 17:32:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+jRUl/Y9Ewf9Lpg67+3/JpaKHOBkXLreDRCeVeChr7PubkqQrtY+yrsfsiUk6KUZZVAsyzq1nhRqgi0a+12Ia9LlczPz5+ZPTZVWHbod0Yr/KQW7tD0QLqgO3I0qGsxFH79LRgmk296EQ7PGK6PNKTTsZbWx3xDrt18RQZE7ciiQxLvQYO7hB0/4EaZyUjwtIRNh3zSZPzz1Ocrmk4Wr3JqB8fujtKbl0/a1MvlsVb3QnyFoRiocz39AbYje4LTYDUG0s6TpUfJ9Dx2jsPcHBueZ5+zbnxfA0hgKzJYWFf8QZ1sdU9t3mtD4sRgZTVoFA6pzPfBviYQz8fYF12X6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpQ8OuwMJY9Zn1QwKQJS3EnvXGAmXFcwc7Y2hlKaBkE=;
 b=aTc/q9B6Lqa287LRYGOfpYnO8Vgdz8snptEcSq8zfYBuwDnLIiP8zKPj2QXH27fa9OymCdLpUYZbSvAZ9koHDYE55a6ks0awta4Aoivls/lNBXGXI3rHinzi8+/mt4SVKxWOtpWVKQfpNz3+V95Apdcbgv7Vdol+Fwq9wmWc/jHVrY5GIBJy3w5uXWeSTiP2H68CK6p1jikOGOrWt/xH6nGDzlQQw4+MbbLuVWW3L7nPi2KCkE+9umOMeRwgzf/VqzH4iZSk9CceYoSu7ATEX7CzwuAo8IYyVldzx3Nbpu0r7ljtobvd55LXlAr9d5Q0KHeCowTQs0sYYcvyqtcX9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO6PR11MB5620.namprd11.prod.outlook.com (2603:10b6:303:13e::17)
 by BL1PR11MB5224.namprd11.prod.outlook.com (2603:10b6:208:30a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Thu, 30 May
 2024 00:32:12 +0000
Received: from CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::f75e:610a:4cc0:5ede]) by CO6PR11MB5620.namprd11.prod.outlook.com
 ([fe80::f75e:610a:4cc0:5ede%5]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 00:32:12 +0000
From: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Zeng, Oak" <oak.zeng@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 3/5] drm/xe: Convert multiple bind ops into single job
Thread-Topic: [PATCH v3 3/5] drm/xe: Convert multiple bind ops into single job
Thread-Index: AQHasfZ4ReVE8M+tyUWKIiBdo97KLLGu7bMA
Date: Thu, 30 May 2024 00:32:12 +0000
Message-ID: <ff4c4590de0714b72278fee242460c3a2982d2fd.camel@intel.com>
References: <20240529183148.1713695-1-matthew.brost@intel.com>
 <20240529183148.1713695-4-matthew.brost@intel.com>
In-Reply-To: <20240529183148.1713695-4-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4-2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5620:EE_|BL1PR11MB5224:EE_
x-ms-office365-filtering-correlation-id: b4118953-7bc5-470e-868e-08dc803ff304
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?TU1wYW5Ib0V2SkpwYTVSM0tmMmplc3JkSG9BenFpVmxkSUtLM01hN3grUUN2?=
 =?utf-8?B?UEhBdEdta05LdElCc1M2YVN3SGlJM015Y2xnWkdLRlRIK2wwTTFWMUpoUVNF?=
 =?utf-8?B?UkRjN1hkbzh3S3BhcGlnaEh6bXZiK2ltaWNJamFQcUJoS0hId0p5QmtPdjlJ?=
 =?utf-8?B?UExIdnpIZVhGNUtwTFhoM0dVUWxmclMrZEtYSVZGK1ZuOGZMd1RDT3JYYmFp?=
 =?utf-8?B?ZHFydHg0OUl1Z0NnRzUwcU9WODNaV3pwcTBWS2tLMU9VMnd1YVBPeUl4THVu?=
 =?utf-8?B?UWhDS0F4SXIyODEzZ21IU0x4TU9XRWJPVGFPMWNZV2R2ZDNUYWR1bE9BQ2JW?=
 =?utf-8?B?alhvcUp3U2RUOFIwVE5zVGk3Uk4rL3VYbzN6L1JSWW1Da3M1U0ZLTUxEek1T?=
 =?utf-8?B?QmIxNU9SZldQaXM5dUpMY1JTNkptR3NwZENmZlE3bUlYbkUxYTZ0WWFLRUtE?=
 =?utf-8?B?Q3EyL0U3eHg3ak82enhLK3VKTURoYlFCZk9VcUpSYmZ6OUxTdHhRNFprMUJE?=
 =?utf-8?B?aUhOa05PZnBOMCtCelpPZWRuSVVuNk5CdEdxU3o4OHdwaVQ0OVZYWnMyOElI?=
 =?utf-8?B?dy8rdEtGdUNvTDRoT1ZJL1dsNmtTenNIVUNiYkloekJ3MXVQaEZIV0JDWllE?=
 =?utf-8?B?bUdGeFl3dXRPZGVjWVVYWHJlNGpCR2Z4aUVTKzZ3UnI5RWsrL0RyS05Rc2F1?=
 =?utf-8?B?MS9mU0FwVVFUQXZDNkU0elpuSzdzeUdVbTJRYUt0UmN3OGhWRTViSTVnM05m?=
 =?utf-8?B?WHZ1akhSL1hwak51TWFueExnTkNwak9wZXlCTFJyWHVkbmNQK1NDaGhUTGdu?=
 =?utf-8?B?YkNWZmtZVHJKSXFveG8wZlNVSGNzck8wYnZ2SEVIY2JGTUx0ci9DeEc2amRi?=
 =?utf-8?B?OG9QVmVydWdOMVQweFVuQ3VaNW1MaVBkdmdJZ2JDaXBZaHM0U3JpQ0hTR0Vs?=
 =?utf-8?B?RW5DVi9IRTVYY2ZGclg2Qk9LWXZJeTYyK29pKytQYjRNQ2toOUl6VzJrZUZR?=
 =?utf-8?B?RTBOalRZV3lFUW12eHBIWkdQOWhOWGg5NEl0WTZQOWJUekowQmJNYUVpVXZV?=
 =?utf-8?B?RkhtL0xWdHoxZ0U0UFd6Q1RRb2krSDN6TDAwbzN4WlFMbmlIZ0I1OU43QVR4?=
 =?utf-8?B?bEM3L3hFOHJ1OXVJYzFSTWkzdzhqa0w4bVcvOHprTVhhTU0ydVZEZSsxb0Uw?=
 =?utf-8?B?dk42L0tyVDVYZzgwNU9TT1BDUm45bm5xL0cwbXl6T3d3bkJlanpiS2ovUXFt?=
 =?utf-8?B?RFpMcjFrdGNITTBydStDMWEwV2JPaW9ZUWtFaHJkQzMrSHhXNlgvTWExd3l0?=
 =?utf-8?B?Z05ncHBDd05YWjVoQnpIMkFPSVJQRWdFWkhad0tvNFZkSWl2bUVtQmNCWmpQ?=
 =?utf-8?B?amRUNDYzR0cxWVVOd0QrQmlVZks2c29wdEN0b1BaWHJ1allPbnNSSm5LSENU?=
 =?utf-8?B?bVBSUnRweFNZb1lRcDhQWVhoa3Y3cy9hWC84SFVTUjI2c2syVkFQaHBrbW5I?=
 =?utf-8?B?bGdRN0V2ZFpTKzlXVmdYTC9NRWNValEwVmlnN2Q4YVEvNXg2UWF5Rlo1K1JV?=
 =?utf-8?B?SjAzNUg4VmlyL0JRTjRMdkRDMjNta2d1RXJIVno1NG9YVlIvYTNQRHhMRklj?=
 =?utf-8?B?LzBJYWVDLzZVaFAvZmxOSnM1bDRjZk9ndlpLK3VlUWJKUG9kTEpxZHVwNUoz?=
 =?utf-8?B?eFM4YzJUOHVodld1RG9hWlQ1RFhBYXNJZzFLZm03bkFsS2lHbEpOTEJBblNL?=
 =?utf-8?B?eUxRYVNFQnZLSkU2OWhtOWNrVmJVMVNrVnhpd2UwUmp2ZnQ2dkErZmJjdGlx?=
 =?utf-8?B?dHhTeW5xVllRKzhjWkZVQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTZMZVd6YTFPb0JXMCtDbi9UcmpDR3ViOFN2eDV4YXJaTVFJd1VCUW1uRXNM?=
 =?utf-8?B?MHQ5TnNsSUFRNnl5QjdYTG5odXZkNFBZK01uRFdvSmJveXpZTFY3SzZHZG8z?=
 =?utf-8?B?WGtSWEhYd3d0ZlE2NkFLcGNmMXhIV2dUUlpNV2V3aFB4VUMwYVJ1dHo3amMv?=
 =?utf-8?B?WTVENENkMGVFQnYxekg0a0xYeFc0c012NW1lVjdud2ljYXhFT1NCNnlCRWxu?=
 =?utf-8?B?V0IwTHhoYmpZRFdWNUp4VXZNRmtDU0J5ZzNTY3c5OWNNWHNKNmJrQzNvWjNS?=
 =?utf-8?B?eHJoUXVvR0R5NU9PU0R2dmUvWjlVaTJ1TWEzWWJVcEFPV1d5NFc4VElKVFh1?=
 =?utf-8?B?ZWppU0o4aXp0c045VXJIU21OYWVRazBEeEsvenlHNmkwM3AwdWpJMlNHTmJY?=
 =?utf-8?B?N2J0N09pS0xnNHUvY0QvUXptS0F1Qk10SW5zREVEZlVpb3JOZHY0aGNiREF0?=
 =?utf-8?B?Ry9pdm0vZkl3RzZRK0tmREhmdW5tU0U2bzU0c1N1cEg5UnV3QVRaNjFWcERM?=
 =?utf-8?B?bjNvS2RvRGVKR1FOTjZLdG8xTVJVZUZScTRlUnM5dHhmZ1RYQWVlVU44aks3?=
 =?utf-8?B?eTNRQzZ0Yzg5VDJhSWsvc0tabFJjWGdRS0NQL3BVZk5GYk5YNHhKNU56RFRY?=
 =?utf-8?B?RU5YNkZLZ2NYaFVIUERvaFlUc2tFaG56aW42Q2lrY1dhdTdIVWoyNjdVK0xo?=
 =?utf-8?B?cWQ3T3lzcldwbjlIbHNkaVFGcGxiQ3pjMWJYaXplR3orR3F2eWNIMXFwc2k2?=
 =?utf-8?B?TzNOUEF0VytzbmZRd094dm1TSklLYkF0SUhnUFMxWHBqMTkwNVprdy81Qkpa?=
 =?utf-8?B?T0MySm9lNUFyeWdlVUtSN09rU1hYcVloRHdOS29HcklrY3hVREc4Z1djUzJu?=
 =?utf-8?B?MjJ4WHN1VHNWTjZRa2w1SXg2THFxSjBFY1hLSjVPc2ZBOHNvUXprMkdVVkNJ?=
 =?utf-8?B?ZHE1aHFrNDVHekgwUnpVK21md2Q5WUVGWGIvT01NTzhSVHgrZElhWlVVUGRK?=
 =?utf-8?B?c04zR1JzOVNFOThvaXUyRTN4UWhSSDcwN1VaOVRZOGJvdVB6bktMbXlUQ056?=
 =?utf-8?B?cE5TNUlHeThFOHQ0cVN0T3cwQis4NW9UQkt5VmJUcHFJcjBpK0tNMC9EMkVC?=
 =?utf-8?B?TWJUVUZRanJGOUZIWEQxeEltQ20vOUNJYWxibWFad1J0SVMxZkpTM2M1dlg2?=
 =?utf-8?B?UDJLazQ5NmIzc0pzZkNHdW1XZEIxS2lxTFh2eGJQMy90bTRmaEdMbmhuR3J2?=
 =?utf-8?B?VEloYTZkZC8rSGRYaW40eXhieXkwN3A4ZVdTTklhVEh0Q2ZVdm1aajBLRXhj?=
 =?utf-8?B?M1lvck04VG9WWVNyRUd1bHVhZC9rdW5ObEJ6am1JbjVIeVFVaGg5MUsweWtW?=
 =?utf-8?B?S2kycnBBc2Z4QzBrbDRyMi8wUkZ5R1kwQnl5Qy9EZW44Q1hFMXZGSXd5cEJ0?=
 =?utf-8?B?OFpiMVRDRlk3Vk5mNGQ0RFhqNEJhY0FtUDJIY1pWSlRqQS9DV2pqSDJVUGV4?=
 =?utf-8?B?WUtRWi94NzB5b0Y0TlUrUXlaL1MrR2ZxWTFES1VlMEh5cWlGWkxpZUVjZVFK?=
 =?utf-8?B?amw2NGFzbWZzRDM5bFA5MjBXcnlGRFFzM0NhL0hJMCtGcHhub2VMVlFsbHVX?=
 =?utf-8?B?dVViWkRhZFJPTnFpNW9CWVZHNE9OSXo1bUtNb3AvVUtXTFlKaWpRSE5kVUhI?=
 =?utf-8?B?dFBuc1phZmVSdEh3TkI5QkF3THJOdkdSRzFFRmo5b05DU1ByWStwWE90UFZq?=
 =?utf-8?B?aUoxMGF3TFUybytEK2RwaUpkaDkybGlHNzBHOUlkaTNuOWV6WGdqT21pVEdB?=
 =?utf-8?B?Wks3d2VDUTAzKzl5VlJreFJjQXUvc0huV2s5ZjJSZkZkZE1rVjk1Z2l6bDY0?=
 =?utf-8?B?UWFURmZISExIMUc5OEJ4T0VpQW5zVVhKbm1QcTlKMUhlSnVlVWM4Z3NOSlQz?=
 =?utf-8?B?Z1UzQm1DRGQwRDdTbnNybnJLTFFvK3pMOE5JRUUxdDgzakt2eG5McWVxdnNo?=
 =?utf-8?B?NFduTFViQXJVMzdUZEYwaXZrdVlQc1FDNUlPaTBFRlJpQ1Bna0FCeVNCN0dC?=
 =?utf-8?B?YXZDeXhXUU0zc2hjN0lpSCtiNWdwMkFOc292NTdoSjJVUmo0aWNrNEErSHZ3?=
 =?utf-8?B?YktmU0tBcTZlOXFhYzczZ1dkOUlVZHM0YkgyRTk5MnBUQ2NMdS9FZ09zYURB?=
 =?utf-8?B?c0hUQWh1bXNIWnJqb0VZWXNoVE9idGNFaFpPd245NTloZWZjU2UrRWlDNTQy?=
 =?utf-8?B?RGpvME93UVh0Y3B0OG9aazRlYUxRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <87BC8418BEB4414ABB361296DEA3A4DB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4118953-7bc5-470e-868e-08dc803ff304
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2024 00:32:12.8104 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pLPVe3cADvpAkluGd7sYusT303jFMvfi2luL+O4z+REa9BjlytsbPaYDgcJ27CB1dN7kDSU/3maRD9yZOlZeMmvpu6deRvo3eaEDhzK/13g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5224
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

T24gV2VkLCAyMDI0LTA1LTI5IGF0IDExOjMxIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBUaGlzIGFsaWducyB3aXRoIHRoZSB1QVBJIG9mIGFuIGFycmF5IG9mIGJpbmRzIG9yIHNpbmds
ZSBiaW5kIHRoYXQNCj4gcmVzdWx0cyBpbiBtdWx0aXBsZSBHUFVWQSBvcHMgdG8gYmUgY29uc2lk
ZXJlZCBhIHNpbmdsZSBhdG9taWMNCj4gb3BlcmF0aW9ucy4NCj4gDQo+IFRoZSBpbXBsZW1lbmF0
aW9uIGlzIHJvdWdobHk6DQo+IC0geGVfdm1hX29wcyBpcyBhIGxpc3Qgb2YgeGVfdm1hX29wIChH
UFVWQSBvcCkNCj4gLSBlYWNoIHhlX3ZtYV9vcCByZXNvbHZlcyB0byAwLTMgUFQgb3BzDQo+IC0g
eGVfdm1hX29wcyBjcmVhdGVzIGEgc2luZ2xlIGpvYg0KPiAtIGlmIGF0IGFueSBwb2ludCBkdXJp
bmcgYmluZGluZyBhIGZhaWx1cmUgb2NjdXJzLCB4ZV92bWFfb3BzIGNvbnRhaW5zDQo+ICAgdGhl
IGluZm9ybWF0aW9uIG5lY2Vzc2FyeSB1bndpbmQgdGhlIFBUIGFuZCBWTUEgKEdQVVZBKSBzdGF0
ZQ0KPiANCj4gdjI6DQo+ICAtIGFkZCBtaXNzaW5nIGRtYS1yZXN2IHNsb3QgcmVzZXJ2YXRpb24g
KENJLCB0ZXN0aW5nKQ0KPiANCj4gQ2M6IE9hayBaZW5nIDxvYWsuemVuZ0BpbnRlbC5jb20+DQo+
IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+
DQo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ib190eXBlcy5oIHwgICAgMiArDQo+
ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jICB8ICAyOTYgKysrKy0tLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmggIHwgICAzMiArLQ0KPiAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3B0LmMgICAgICAgfCAxMTA4ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmggICAgICAgfCAgIDE0ICstDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfcHRfdHlwZXMuaCB8ICAgMzYgKw0KPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3ZtLmMgICAgICAgfCAgNTE5ICsrKy0tLS0tLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0veGUveGVfdm0uaCAgICAgICB8ICAgIDIgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zt
X3R5cGVzLmggfCAgIDQ1ICstDQo+ICA5IGZpbGVzIGNoYW5nZWQsIDEwMzIgaW5zZXJ0aW9ucygr
KSwgMTAyMiBkZWxldGlvbnMoLSkNCj4gDQoNCihzbmlwKQ0KDQo+IA0KPiAtLyoqDQo+IC0gKiBf
X3hlX3B0X2JpbmRfdm1hKCkgLSBCdWlsZCBhbmQgY29ubmVjdCBhIHBhZ2UtdGFibGUgdHJlZSBm
b3IgdGhlIHZtYQ0KPiAtICogYWRkcmVzcyByYW5nZS4NCj4gLSAqIEB0aWxlOiBUaGUgdGlsZSB0
byBiaW5kIGZvci4NCj4gLSAqIEB2bWE6IFRoZSB2bWEgdG8gYmluZC4NCj4gLSAqIEBxOiBUaGUg
ZXhlY19xdWV1ZSB3aXRoIHdoaWNoIHRvIGRvIHBpcGVsaW5lZCBwYWdlLXRhYmxlIHVwZGF0ZXMu
DQo+IC0gKiBAc3luY3M6IEVudHJpZXMgdG8gc3luYyBvbiBiZWZvcmUgYmluZGluZyB0aGUgYnVp
bHQgdHJlZSB0byB0aGUgbGl2ZSB2bSB0cmVlLg0KPiAtICogQG51bV9zeW5jczogTnVtYmVyIG9m
IEBzeW5jIGVudHJpZXMuDQo+IC0gKiBAcmViaW5kOiBXaGV0aGVyIHdlJ3JlIHJlYmluZGluZyB0
aGlzIHZtYSB0byB0aGUgc2FtZSBhZGRyZXNzIHJhbmdlIHdpdGhvdXQNCj4gLSAqIGFuIHVuYmlu
ZCBpbi1iZXR3ZWVuLg0KPiAtICoNCj4gLSAqIFRoaXMgZnVuY3Rpb24gYnVpbGRzIGEgcGFnZS10
YWJsZSB0cmVlIChzZWUgeGVfcHRfc3RhZ2VfYmluZCgpIGZvciBtb3JlDQo+IC0gKiBpbmZvcm1h
dGlvbiBvbiBwYWdlLXRhYmxlIGJ1aWxkaW5nKSwgYW5kIHRoZSB4ZV92bV9wZ3RhYmxlX3VwZGF0
ZSBlbnRyaWVzDQo+IC0gKiBhYnN0cmFjdGluZyB0aGUgb3BlcmF0aW9ucyBuZWVkZWQgdG8gYXR0
YWNoIGl0IHRvIHRoZSBtYWluIHZtIHRyZWUuIEl0DQo+IC0gKiB0aGVuIHRha2VzIHRoZSByZWxl
dmFudCBsb2NrcyBhbmQgdXBkYXRlcyB0aGUgbWV0YWRhdGEgc2lkZSBvZiB0aGUgbWFpbg0KPiAt
ICogdm0gdHJlZSBhbmQgc3VibWl0cyB0aGUgb3BlcmF0aW9ucyBmb3IgcGlwZWxpbmVkIGF0dGFj
aG1lbnQgb2YgdGhlDQo+IC0gKiBncHUgcGFnZS10YWJsZSB0byB0aGUgdm0gbWFpbiB0cmVlLCAo
d2hpY2ggY2FuIGJlIGRvbmUgZWl0aGVyIGJ5IHRoZQ0KPiAtICogY3B1IGFuZCB0aGUgR1BVKS4N
Cj4gLSAqDQo+IC0gKiBSZXR1cm46IEEgdmFsaWQgZG1hLWZlbmNlIHJlcHJlc2VudGluZyB0aGUg
cGlwZWxpbmVkIGF0dGFjaG1lbnQgb3BlcmF0aW9uDQo+IC0gKiBvbiBzdWNjZXNzLCBhbiBlcnJv
ciBwb2ludGVyIG9uIGVycm9yLg0KPiAtICovDQo+IC1zdHJ1Y3QgZG1hX2ZlbmNlICoNCj4gLV9f
eGVfcHRfYmluZF92bWEoc3RydWN0IHhlX3RpbGUgKnRpbGUsIHN0cnVjdCB4ZV92bWEgKnZtYSwg
c3RydWN0IHhlX2V4ZWNfcXVldWUgKnEsDQo+IC0JCSBzdHJ1Y3QgeGVfc3luY19lbnRyeSAqc3lu
Y3MsIHUzMiBudW1fc3luY3MsDQo+IC0JCSBib29sIHJlYmluZCkNCj4gLXsNCj4gLQlzdHJ1Y3Qg
eGVfdm1fcGd0YWJsZV91cGRhdGUgZW50cmllc1tYRV9WTV9NQVhfTEVWRUwgKiAyICsgMV07DQo+
IC0Jc3RydWN0IHhlX3B0X21pZ3JhdGVfcHRfdXBkYXRlIGJpbmRfcHRfdXBkYXRlID0gew0KPiAt
CQkuYmFzZSA9IHsNCj4gLQkJCS5vcHMgPSB4ZV92bWFfaXNfdXNlcnB0cih2bWEpID8gJnVzZXJw
dHJfYmluZF9vcHMgOiAmYmluZF9vcHMsDQo+IC0JCQkudm1hID0gdm1hLA0KPiAtCQkJLnRpbGVf
aWQgPSB0aWxlLT5pZCwNCj4gLQkJfSwNCj4gLQkJLmJpbmQgPSB0cnVlLA0KPiAtCX07DQo+IC0J
c3RydWN0IHhlX3ZtICp2bSA9IHhlX3ZtYV92bSh2bWEpOw0KPiAtCXUzMiBudW1fZW50cmllczsN
Cj4gLQlzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZTsNCj4gLQlzdHJ1Y3QgaW52YWxpZGF0aW9uX2Zl
bmNlICppZmVuY2UgPSBOVUxMOw0KPiAtCXN0cnVjdCB4ZV9yYW5nZV9mZW5jZSAqcmZlbmNlOw0K
PiAtCWludCBlcnI7DQo+IC0NCj4gLQliaW5kX3B0X3VwZGF0ZS5sb2NrZWQgPSBmYWxzZTsNCj4g
LQl4ZV9ib19hc3NlcnRfaGVsZCh4ZV92bWFfYm8odm1hKSk7DQo+IC0JeGVfdm1fYXNzZXJ0X2hl
bGQodm0pOw0KPiAtDQo+IC0Jdm1fZGJnKCZ4ZV92bWFfdm0odm1hKS0+eGUtPmRybSwNCj4gLQkg
ICAgICAgIlByZXBhcmluZyBiaW5kLCB3aXRoIHJhbmdlIFslbGx4Li4uJWxseCkgZW5naW5lICVw
LlxuIiwNCj4gLQkgICAgICAgeGVfdm1hX3N0YXJ0KHZtYSksIHhlX3ZtYV9lbmQodm1hKSwgcSk7
DQo+IC0NCj4gLQllcnIgPSB4ZV9wdF9wcmVwYXJlX2JpbmQodGlsZSwgdm1hLCBlbnRyaWVzLCAm
bnVtX2VudHJpZXMpOw0KPiAtCWlmIChlcnIpDQo+IC0JCWdvdG8gZXJyOw0KPiAtDQo+IC0JZXJy
ID0gZG1hX3Jlc3ZfcmVzZXJ2ZV9mZW5jZXMoeGVfdm1fcmVzdih2bSksIDEpOw0KPiAtCWlmICgh
ZXJyICYmICF4ZV92bWFfaGFzX25vX2JvKHZtYSkgJiYgIXhlX3ZtYV9ibyh2bWEpLT52bSkNCj4g
LQkJZXJyID0gZG1hX3Jlc3ZfcmVzZXJ2ZV9mZW5jZXMoeGVfdm1hX2JvKHZtYSktPnR0bS5iYXNl
LnJlc3YsIDEpOw0KPiAtCWlmIChlcnIpDQo+IC0JCWdvdG8gZXJyOw0KPiAtDQo+IC0JeGVfdGls
ZV9hc3NlcnQodGlsZSwgbnVtX2VudHJpZXMgPD0gQVJSQVlfU0laRShlbnRyaWVzKSk7DQo+IC0N
Cj4gLQl4ZV92bV9kYmdfcHJpbnRfZW50cmllcyh0aWxlX3RvX3hlKHRpbGUpLCBlbnRyaWVzLCBu
dW1fZW50cmllcyk7DQo+IC0JeGVfcHRfY2FsY19yZmVuY2VfaW50ZXJ2YWwodm1hLCAmYmluZF9w
dF91cGRhdGUsIGVudHJpZXMsDQo+IC0JCQkJICAgbnVtX2VudHJpZXMpOw0KPiAtDQo+IC0JLyoN
Cj4gLQkgKiBJZiByZWJpbmQsIHdlIGhhdmUgdG8gaW52YWxpZGF0ZSBUTEIgb24gIUxSIHZtcyB0
byBpbnZhbGlkYXRlDQo+IC0JICogY2FjaGVkIFBURXMgcG9pbnQgdG8gZnJlZWQgbWVtb3J5LiBv
biBMUiB2bXMgdGhpcyBpcyBkb25lDQo+IC0JICogYXV0b21hdGljYWxseSB3aGVuIHRoZSBjb250
ZXh0IGlzIHJlLWVuYWJsZWQgYnkgdGhlIHJlYmluZCB3b3JrZXIsDQo+IC0JICogb3IgaW4gZmF1
bHQgbW9kZSBpdCB3YXMgaW52YWxpZGF0ZWQgb24gUFRFIHphcHBpbmcuDQo+IC0JICoNCj4gLQkg
KiBJZiAhcmViaW5kLCBhbmQgc2NyYXRjaCBlbmFibGVkIFZNcywgdGhlcmUgaXMgYSBjaGFuY2Ug
dGhlIHNjcmF0Y2gNCj4gLQkgKiBQVEUgaXMgYWxyZWFkeSBjYWNoZWQgaW4gdGhlIFRMQiBzbyBp
dCBuZWVkcyB0byBiZSBpbnZhbGlkYXRlZC4NCj4gLQkgKiBvbiAhTFIgVk1zIHRoaXMgaXMgZG9u
ZSBpbiB0aGUgcmluZyBvcHMgcHJlY2VkaW5nIGEgYmF0Y2gsIGJ1dCBvbg0KPiAtCSAqIG5vbi1m
YXVsdGluZyBMUiwgaW4gcGFydGljdWxhciBvbiB1c2VyLXNwYWNlIGJhdGNoIGJ1ZmZlciBjaGFp
bmluZywNCj4gLQkgKiBpdCBuZWVkcyB0byBiZSBkb25lIGhlcmUuDQo+IC0JICovDQo+IC0JaWYg
KCghcmViaW5kICYmIHhlX3ZtX2hhc19zY3JhdGNoKHZtKSAmJiB4ZV92bV9pbl9wcmVlbXB0X2Zl
bmNlX21vZGUodm0pKSkgew0KPiAtCQlpZmVuY2UgPSBremFsbG9jKHNpemVvZigqaWZlbmNlKSwg
R0ZQX0tFUk5FTCk7DQo+IC0JCWlmICghaWZlbmNlKQ0KPiAtCQkJcmV0dXJuIEVSUl9QVFIoLUVO
T01FTSk7DQo+IC0JfSBlbHNlIGlmIChyZWJpbmQgJiYgIXhlX3ZtX2luX2xyX21vZGUodm0pKSB7
DQo+IC0JCS8qIFdlIGJ1bXAgYWxzbyBpZiBiYXRjaF9pbnZhbGlkYXRlX3RsYiBpcyB0cnVlICov
DQo+IC0JCXZtLT50bGJfZmx1c2hfc2Vxbm8rKzsNCg0KVGhpcyB3YXMgdGhlIG9ubHkgdGhpbmcg
YWN0dWFsbHkgc2V0dGluZyBhIHZhbHVlIG9mICJ0bGJfZmx1c2hfc2Vxbm8iDQp0byBhbnl0aGlu
ZyBpbiB0aGUgZHJpdmVyLiBOb3cgdGhlIG9ubHkgdGhpbmcgdGhhdCByZW1haW5zIHNldHRpbmcg
YW55DQp2YWx1ZSB0byB0bGJfZmx1c2hfc2Vxbm8gaXMgeGVfc2NoZWRfam9iX2FybSgpIHdoZXJl
IHdlIGhhdmU6DQoNCnEtPnRsYl9mbHVzaF9zZXFubyA9IHZtLT50bGJfZmx1c2hfc2Vxbm87DQoN
CihidXQgdGhlcmUgc2VlbXMgdG8gYmUgbm8gbGluZSBldmVyIGluaXRpYWxpemluZyB2bS0+dGxi
X2ZsdXNoX3NlcW5vKQ0KDQpTb21ldGhpbmcgbWF5IGJlIHdyb25nIGhlcmUuIFdlJ3JlIG5vdCBz
ZXR0aW5nIGluaXRpYWwgdmFsdWVzIGJ1dCB3ZSdyZQ0KY29weWluZyB2YWx1ZXMgYW5kIGNoZWNr
aW5nIHRoZW0gaW4gYW4gImlmIiBzdGF0ZW1lbnQuDQoNClRoZSBmb2xsb3dpbmcgY29tcGlsZXM6
DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZV90eXBlcy5o
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMuaA0KaW5kZXggZTgxNzA0
YzdjMDMwYS4uZGQ1MWI1OWU0NDMzZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9leGVjX3F1ZXVlX3R5cGVzLmgNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1
ZXVlX3R5cGVzLmgNCkBAIC0xMzYsMTEgKzEzNiw2IEBAIHN0cnVjdCB4ZV9leGVjX3F1ZXVlIHsN
CiAgICAgICAgY29uc3Qgc3RydWN0IHhlX3Jpbmdfb3BzICpyaW5nX29wczsNCiAgICAgICAgLyoq
IEBlbnRpdHk6IERSTSBzY2hlZCBlbnRpdHkgZm9yIHRoaXMgZXhlYyBxdWV1ZSAoMSB0byAxIHJl
bGF0aW9uc2hpcCkgKi8NCiAgICAgICAgc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eTsN
Ci0gICAgICAgLyoqDQotICAgICAgICAqIEB0bGJfZmx1c2hfc2Vxbm86IFRoZSBzZXFubyBvZiB0
aGUgbGFzdCByZWJpbmQgdGxiIGZsdXNoIHBlcmZvcm1lZA0KLSAgICAgICAgKiBQcm90ZWN0ZWQg
YnkgQHZtJ3MgcmVzdi4gVW51c2VkIGlmIEB2bSA9PSBOVUxMLg0KLSAgICAgICAgKi8NCi0gICAg
ICAgdTY0IHRsYl9mbHVzaF9zZXFubzsNCiAgICAgICAgLyoqIEBvbGRfcnVuX3RpY2tzOiBwcmlv
ciBodyBlbmdpbmUgY2xhc3MgcnVuIHRpbWUgaW4gdGlja3MgZm9yIHRoaXMgZXhlYyBxdWV1ZSAq
Lw0KICAgICAgICB1NjQgb2xkX3J1bl90aWNrczsNCiAgICAgICAgLyoqIEBydW5fdGlja3M6IGh3
IGVuZ2luZSBjbGFzcyBydW4gdGltZSBpbiB0aWNrcyBmb3IgdGhpcyBleGVjIHF1ZXVlICovDQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3NjaGVkX2pvYi5jIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3NjaGVkX2pvYi5jDQppbmRleCAyOWYzMjAxZDdkZmFjLi42YzNjYjdlMjk1
YWM3IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3NjaGVkX2pvYi5jDQorKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc2NoZWRfam9iLmMNCkBAIC0yNTQsOSArMjU0LDggQEAg
dm9pZCB4ZV9zY2hlZF9qb2JfYXJtKHN0cnVjdCB4ZV9zY2hlZF9qb2IgKmpvYikNCiAgICAgICAg
fQ0KIA0KICAgICAgICBpZiAodm0gJiYgIXhlX3NjaGVkX2pvYl9pc19taWdyYXRpb24ocSkgJiYg
IXhlX3ZtX2luX2xyX21vZGUodm0pICYmDQotICAgICAgICAgICAodm0tPmJhdGNoX2ludmFsaWRh
dGVfdGxiIHx8IHZtLT50bGJfZmx1c2hfc2Vxbm8gIT0gcS0+dGxiX2ZsdXNoX3NlcW5vKSkgew0K
KyAgICAgICAgICAgdm0tPmJhdGNoX2ludmFsaWRhdGVfdGxiKSB7DQogICAgICAgICAgICAgICAg
eGVfdm1fYXNzZXJ0X2hlbGQodm0pOw0KLSAgICAgICAgICAgICAgIHEtPnRsYl9mbHVzaF9zZXFu
byA9IHZtLT50bGJfZmx1c2hfc2Vxbm87DQogICAgICAgICAgICAgICAgam9iLT5yaW5nX29wc19m
bHVzaF90bGIgPSB0cnVlOw0KICAgICAgICB9DQogDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZtX3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm1fdHlwZXMuaA0K
aW5kZXggMjdkNjUxMDkzZDMwNy4uMDNlODM5ZWZiMjM0ZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV92bV90eXBlcy5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm1f
dHlwZXMuaA0KQEAgLTI2MywxMSArMjYzLDYgQEAgc3RydWN0IHhlX3ZtIHsNCiAgICAgICAgICAg
ICAgICBib29sIGNhcHR1cmVfb25jZTsNCiAgICAgICAgfSBlcnJvcl9jYXB0dXJlOw0KIA0KLSAg
ICAgICAvKioNCi0gICAgICAgICogQHRsYl9mbHVzaF9zZXFubzogUmVxdWlyZWQgVExCIGZsdXNo
IHNlcW5vIGZvciB0aGUgbmV4dCBleGVjLg0KLSAgICAgICAgKiBwcm90ZWN0ZWQgYnkgdGhlIHZt
IHJlc3YuDQotICAgICAgICAqLw0KLSAgICAgICB1NjQgdGxiX2ZsdXNoX3NlcW5vOw0KICAgICAg
ICAvKiogQGJhdGNoX2ludmFsaWRhdGVfdGxiOiBBbHdheXMgaW52YWxpZGF0ZSBUTEIgYmVmb3Jl
IGJhdGNoIHN0YXJ0ICovDQogICAgICAgIGJvb2wgYmF0Y2hfaW52YWxpZGF0ZV90bGI7DQogICAg
ICAgIC8qKiBAeGVmOiBYRSBmaWxlIGhhbmRsZSBmb3IgdHJhY2tpbmcgdGhpcyBWTSdzIGRybSBj
bGllbnQgKi8NCg0KDQoNCg==
