Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1FEC83F26
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 18:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423A210E22C;
	Wed, 30 Jul 2025 18:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eHL8SQZz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DC010E22C
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 18:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753899907; x=1785435907;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XyDeAYPF75xvakY88VR4I08ASUM4MXaxBNtZIFEKq6s=;
 b=eHL8SQZzJy/6IMMcodfaS7gV7kv3Wn1XDxbYlPybfTJgEVxdVBUjVFuJ
 suY4ApmYyI4ZcFq/aQQfeRCgSDMyX7IV8W3xkcMuDIW6pq4p3Q2/L9uvb
 0/aa6fh1ycXA/1gLG1u45YycVBIVwrtd4PAuYKPSiH5AM9dh1815/TMDC
 QiTowJxRdOEvuT5o7OViCHg6UZ6XlzeYzTf34MD3tta+zuncIcu3e4+Mk
 i2kgdn3hVMqy20KiMs2OBX9zOHlrCXOFFRfb8Pp7EitXhOpYmtI4cdiIt
 OlCgOAkl42EeVjayVxSJ2zWLduByEKIv79Iik/ago4cYqXk8K9OI3Hj7c A==;
X-CSE-ConnectionGUID: 1PNGvHH0RKCJaaYE23ji5Q==
X-CSE-MsgGUID: eqibA3OHQx2EhZwnX8o4yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66484969"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66484969"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 11:25:07 -0700
X-CSE-ConnectionGUID: C88SWRshQUGroy7GzP53TA==
X-CSE-MsgGUID: 2r47/mhBS8mleT/94UiZew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162318690"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 11:25:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 11:25:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 11:25:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.74)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 11:25:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0A2RBmZif/sErixgJl2fEXq4HfQ0hsgX7UKm4bDJUFWkzqoNY9QMYdu127D46zJyJokbZ8Lw81YH3FeI3CZLBgnf+dFauIK8X1tZwpE20c5brUYbm+uZzF93Hx08x+Vgr2JF0C3ER64P5d/lkh8GWkEOa24EZO0JlQXHQdcd0OgtsLQxUpSXd5bJLKMUbLAh/QAuQpPKsbemDa1Jx7VYaas0Z1Nw0mfoHx2f972Du36ajbz2KgFjPBJxAPO/sBKB44cpK+k0L6gPbxSs/woPjrRJLf/qnpV1uE4YfEb/ijeYXZm6wXbitf1I/uIxHm8omzgwoOhuSVUUyEw3Q985A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyDeAYPF75xvakY88VR4I08ASUM4MXaxBNtZIFEKq6s=;
 b=CTE/G6XDZ6CClUMh9lqJJMzv1W1BGyj+ITWf7yH1inuWeURZ4Hri5UXvoNbqK1YV9CbjrkldMJ4yBg7WYIWpfH1xoQvV9FhN0EcrCT3awuosOz6bKuTQd4g1ydTTnARL+0QdvvyIr6GScNKyitpKV6VDu7cvp3iW+vodTkzRvkcLQqmB+/nrQxLvbvTTfg2dL8JlIVlVj7HdGmMOAgdgzQN/DRNU8hXBm+e7aYWIPKC5e7hgvoM/9ACzzRo1jYH2+CuHMaSjj/YAo/eKXIhE1CP5XD/c+vJXwLI7cjCV0eBN9oQpcJMfD38KfpwhK/79aLM81KEl7YDn7TCDCFtelg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM6PR11MB4705.namprd11.prod.outlook.com (2603:10b6:5:2a9::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.26; Wed, 30 Jul 2025 18:25:04 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8964.025; Wed, 30 Jul 2025
 18:25:04 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
CC: "Patelczyk, Maciej" <maciej.patelczyk@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: Re: [PATCH 2/3] drm/xe/migrate: don't overflow max copy size
Thread-Topic: [PATCH 2/3] drm/xe/migrate: don't overflow max copy size
Thread-Index: AQHcAV8ZnGd1bkIpskWoyAj34dPe1rRK+8gA
Date: Wed, 30 Jul 2025 18:25:03 +0000
Message-ID: <d5135cd4c939bfb73123aac8f3adac9c7cd2a846.camel@intel.com>
References: <20250730143335.174373-5-matthew.auld@intel.com>
 <20250730143335.174373-7-matthew.auld@intel.com>
In-Reply-To: <20250730143335.174373-7-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM6PR11MB4705:EE_
x-ms-office365-filtering-correlation-id: fb4e226d-62e3-4bb3-f1ff-08ddcf96672e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M21jbTdsKzREcDBEZW43MjNJVDF0MlRIbVFPQ2huRWo5S1JIMkpkVzdvK3hR?=
 =?utf-8?B?QkZZTGo2THZ6M1VTVDNoNHdYMG5idkJGdlhGbS81eThDdHN1bHg5eXNxbUVn?=
 =?utf-8?B?Qk9FVDBLSHBZbUhmTHdoTWpCR3cxbHNWR3FMUnE4aXJya0dVcEcxa3E5T2JS?=
 =?utf-8?B?RUw2a2phN1EyNWNEOWdtR1prSkl3cEdUYTJWV0IrL3dYdllRY3RkbWJjZnFZ?=
 =?utf-8?B?WFdGVUZOdWM4Vm1xdDdLQ3JvdG1UbUZVRlp2V3JkaFVhSUFrWWVaTlFmNE1U?=
 =?utf-8?B?SmpLNk9XSHhQQU10WG5PY1U3bWcxTUlLRUNYU3U4eTA4WUdYRFdXN1BNejJY?=
 =?utf-8?B?aEpnYVgxZ2owNXFJQjM5UzdzRjVMZ1J4czg2VytnR0p3a3RsNjhnUkhvNmpI?=
 =?utf-8?B?UmN3Nm5WWEJDaVRQc0NjSVhaWHYxU2NLbi9iOTMxWkltSGJGcmV5NnYzbDI3?=
 =?utf-8?B?VGlxMDNvbUs5Y3RMc05VZm40c0tpZTM5cFpzYkFIVjE0WkJCYTFWMmtkMlEv?=
 =?utf-8?B?WG40Y2hXeG1CRE1HVXczODUwMHVQNlgrUUk0UEZjUVZSaTdBSk1UaldrZldw?=
 =?utf-8?B?VS90dURQTm9jYXJDaWVrZStxeUFXSHFhRDVrbU13c1d2cU9SYkZLZXlvNDFo?=
 =?utf-8?B?NXltOE5uS0pRbjNpSW1hald3cTN0bG5JZEJmU1Y3MnY4QnBWTDR2RitRUVhS?=
 =?utf-8?B?dDlFakJ3NExvOTVFUXk0dVg3TTNKRW11VkhsWVA2RE5WZEZGMmMyM2s4Zi9L?=
 =?utf-8?B?ME5LeHVsVlp1Rk1BQUsxblZDRE5UQklzcml0SnNMSEgwbjN5NWhpWWxzdS9Q?=
 =?utf-8?B?V0hqNzZ0R1RHb2t4VHZEaElINnBVWTVxNlRZTXVoQzVDR1Y1RkVsSGd0cDgz?=
 =?utf-8?B?U0ZxUEZNbUtobGpoOGgzUzNJcjVrUVVqY1h0VUd3eDZQUWRVWUNaTkt4QS93?=
 =?utf-8?B?SEdCaWFoY3VCZFRVMm9wMzZlMGNsN3JrUGptOGpKNXYzS3NKdExxenRwVU9I?=
 =?utf-8?B?SlArM1V2VXlvWXlXSy9SbTNtcEdMRGNqWmhyR3Z3TDFGcnpQbm0wTWY1OFVm?=
 =?utf-8?B?NVl2M2Vyc1dnUlc0NTgzTXpndzc0ZDZpZUtaZCszZWRTUkhVclExRkZ1YVNh?=
 =?utf-8?B?RzdIQ1ppTjZSTjM2Z3lTU2x3QjUxRW5MaHNlb2FwYm5jY3J1RTR6amVkcEZD?=
 =?utf-8?B?L2dPQzBsZU00SjkvcFRRSnYya1lxN3dTa0o1dllUb3E5QWt6QysxZWR3c0My?=
 =?utf-8?B?eDd3eE56djgwQnRYSkg1L0hJcmtPeTBLL1ZGQ2hzMzJZdkJmYXdVZTFuZDQz?=
 =?utf-8?B?UmRyT09mZ0ZZdVVYYU13V0FsMXcvSm95STdvcmIyL3BvRVdNVUJXM1A3VFdh?=
 =?utf-8?B?NG9ZQjFEdlVKZmc1V1YvTnJRMkRQd1ovQkNnbHVVNERvN3kxNEtmYlpNVWQ0?=
 =?utf-8?B?YVRvc0p0Vkg2M0dBcHlqa1VSZGlDempvekxGT05NYWdqaXBWb3N2cDU3ZG0x?=
 =?utf-8?B?U2txVEdTNzArcCs0TlhmV041N3NZSEJnM3VsV2MxMWR1dm1xMkFNa0haSHpG?=
 =?utf-8?B?ZWgvc0I1ZWJkcXBaZVI1MGJYMEVxWWZFVVFCcE5tbU5zTFF6QTUyMk55WGJt?=
 =?utf-8?B?NHhMWDluYWZOY21TS3pQMkEzb2F4dGZlMW1BUk1iR0h1ZURxck1MdlczYmlN?=
 =?utf-8?B?T2NWckFRaDJReHZuTmt1TWVFTW1MZ01leGdacTJ6NlM2T0phUnV5UFVFbXhB?=
 =?utf-8?B?aUk3amJBRXA0WFZrd3QrMUs4aFF4Zzd4MWZIaG82RTJjbnNtMFduMzE1ME9l?=
 =?utf-8?B?ZzFaWTJtTzhaUnRnYVBiamVObXdFRWQ2UjFKQ0dFVmdlMHFDNkZWUlV5M2dy?=
 =?utf-8?B?Vml5bFp1d3VRakR3MFVNQ3lGTU5IMWM4V3JHaE02Y2FtVUtiN3VHTEhpODZa?=
 =?utf-8?B?cHRadkxydFl3dDlRTFdLOGJOaExLQ0FFanJJNjFaNkdSRWdtT0JMQVducXJL?=
 =?utf-8?B?a1BlOTdsZmxRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVpjUEZJMDF2OHVHSmRtb0J2ZDNRNnhuRzNwYzVHeGdiUW43SStGdGU3U3N4?=
 =?utf-8?B?cXEvbFlkeDlzb1Z3bnBiZWRNSEJ4eWpiSkthMkNyQTBsTzVlS1oyMXIvTGZu?=
 =?utf-8?B?aUhFbmRMYzFXeWRNY2xnY21pSCs1SUV0R2owVGJMYTVqcklTSkp0bFVFb0JB?=
 =?utf-8?B?VkxhNFQ3L1d3emdJV3d6aElFOHEzWVhVZ200NzllVW5lNTNoTURrUE5kSWFt?=
 =?utf-8?B?akVmQmdTbFVxWUZrOUsxT1p2YnZiS0E0anBpL0o0L093by9MaEVwK3JSSjVo?=
 =?utf-8?B?YXdWbWs3NWxQNnJCSDRqUmVHcENubFdBZ3hmUUt6NlZEeUVVZHVjbTRJb1JT?=
 =?utf-8?B?eTN4bTJ6Wk9pNkJFb1lsZmRJNCtZNW5RTnh3QXlZbW55cXExNXBEU3hrakJT?=
 =?utf-8?B?N0xRcUxLNjVzaTZXTW1lMmZqYW1mT3Zjci8razlJb0c1Zmd6ZzBjeDZjMzVH?=
 =?utf-8?B?UTZuZXYxejdLK2lwUkdiek9xSlBmU01qaE1PRHBKamZyalNWbEtrY003NlBl?=
 =?utf-8?B?TmJTWFQrSWp4RUNZVFpLRW5idWFvSW5Lelh2aFFWOVdnMEc5bUxhRk5YMStn?=
 =?utf-8?B?M2ZKYlpNbWV3MnNZQlNOQ3ZBNWk1R2JHTlRWRTRTdFpWTVF0SHhrb1BLVG5R?=
 =?utf-8?B?cXFoTDJlUXRvSWpaR2RLMkpkK1V2MmJ2RG5kSXd2bFFHUGJuOFVZT0tRbDhq?=
 =?utf-8?B?M1B1R3hMRi9veHp1QWtablV5QitzNk83Vld1Y3RMbkkwUGJIeHA1aE1pa3VD?=
 =?utf-8?B?MkpubmQwbk9xazVJc2tnUC9ocXdNcU5wRVl2SEhFa0lRbStuOEZRVlQ0OFV5?=
 =?utf-8?B?cnFZWnAyN0hPMFZRQmVrSHJ1WkpzTU5WSER6OEowczFpUXEwRk1zclN5SXBO?=
 =?utf-8?B?VHcyTWF5d0Y1QlErRnppUDhHWTc4V1RzNjQ5c1F0QlU1YU1sZGlWR0txSS9L?=
 =?utf-8?B?bDVYTk9oUFYwZTA2M1Yra2lib1RPNTVNbjNOVFc2d1ptOUFYSW1TSzdJNUdH?=
 =?utf-8?B?TFFqN29XWlRwZ3V4YmZheDU5dmdXalFYQ20rTktkS3lHSnhSQXp0bU5wQ3hv?=
 =?utf-8?B?NWNpWWxCcTg3WGMwektBRmgveGFOUVdaL082SFl6VEFOWjRDWGp3UXZNL1U1?=
 =?utf-8?B?TnpSQ0V4MHl4NzV5T0hYT1VvbUxoUFFFVHZCNW5LQlVVeFNxaWEyMmpzMzh3?=
 =?utf-8?B?VzlzRDZlUGpQNDFQWmVhOHRTZkVuc29GOENWKzJSNHpwRldzZEFEQzI3ODZG?=
 =?utf-8?B?RmRyZ0ZZWE43MXNxTUNuRFJ1WGZuNWhjcWFDQnRTRXFBaHBuSTV0NHM4UjB6?=
 =?utf-8?B?TDlUR29ETkplTVQvS1VKMVhiSnV4U0hGTGxTSWZqU25CeW5KVTlnNzhLVjBp?=
 =?utf-8?B?OE4wMEJVVmJycWdlRm96ejR6VW1TUTZvQzN6VFVtSHkybmhFMkZsTkMvOVli?=
 =?utf-8?B?aWdUVStPUlFFRWZ3SThBYlRCQVgzN01CS2FGRi9nYnZqSnRWWll6d0dCVmVV?=
 =?utf-8?B?ZVRkUmVnTERaMXYxM2JIcUd6MkVMN0NGNXhhcXpnbVR4elNPUDQwQSswT04z?=
 =?utf-8?B?M3J5YkdtMlh3U2VsVlJwaTdQVzNUdk1ZcnFQTmFnbDVGTjVqMmFFNExBV0RU?=
 =?utf-8?B?QkFRNTIxeUhHcFZFa2xzV3RYUDZIdnJiMWNjR1Q2OTR6YStZUDRZSDZVNm1E?=
 =?utf-8?B?MHRiOUV5UzhudlorNVJNZDlXa1JoL25mc3hTSWpJdG0vcFNIRTh3djFFM1FT?=
 =?utf-8?B?QVhmSW5WaG9mL3Y2RmRkdUZIRnhQZWdlNTMwdnhqTWRjT1ZUVkZ5ZDBMOThQ?=
 =?utf-8?B?MmRCVEpuNWNnaGtLN1M4eWZrZmV4OG1XcndMT3pSa2lHRXY3U1dRVUdUMU00?=
 =?utf-8?B?TG5oaHpSQStOOWhqQkU1QmErcEkwbCtSY005Ym5XUVpRN0FFaXk3R3RrQng3?=
 =?utf-8?B?S1pldEF5NDV2RHh4K1Z0dUhvWnBheWZpbHdmTW1PWXR1Z21oVkI3c044ejR1?=
 =?utf-8?B?NnRUK1hvZUNaSzZBUmZzSmRFeFNhOS9aa1VySmZ0WUFOQkN0V2lNMXpVQnNj?=
 =?utf-8?B?NUJMZk5pRXlxUEpSc1YrQlBDVkRHQUxFSTVRMFJpeWN4cnJ5SUZvQVNKZlZy?=
 =?utf-8?B?SWxDOEtZdHVrcUxHcHoxUVhBUjJ1TTBxNEhIZVZzMjB1VTR2Rzk0ZXZUM29F?=
 =?utf-8?B?TGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00BC9747F3C39141B961195B23B5C450@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4e226d-62e3-4bb3-f1ff-08ddcf96672e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 18:25:03.9102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6de2LSEaoHDagyolee6JfCfO3MG27RN9D8yoLtdmzp7Q8YeTx8wfASVcxmoNht1cHFfBqLF4zo4HZqq6HGRaMBZV26JaVw1WJ2q8ICs2E6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4705
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

T24gV2VkLCAyMDI1LTA3LTMwIGF0IDE1OjMzICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IFdpdGggbm9uLXBhZ2UgYWxpZ25lZCBjb3B5LCB3ZSBuZWVkIHRvIHVzZSBieXRlIGFsaWduZWQg
cGl0Y2gsDQo+IGhvd2V2ZXINCj4gdGhlIHNpemUgaXRzZWxmIG1pZ2h0IHN0aWxsIGJlIGNsb3Nl
IHRvIG91ciBtYXhpbXVtIG9mIH44TSwgYW5kIHNvDQo+IHRoZQ0KPiBkaW1lbnNpb25zIG9mIHRo
ZSBjb3B5IGNhbiBlYXNpbHkgZXhjZWVkIHRoZSBTMTZfTUFYIGxpbWl0IG9mIHRoZQ0KPiBjb3B5
DQo+IGNvbW1hbmQgbGVhZGluZyB0byB0aGUgZm9sbG93aW5nIGFzc2VydDoNCj4gDQo+IHhlIDAw
MDA6MDM6MDAuMDogW2RybV0gQXNzZXJ0aW9uIGBzaXplIC8gcGl0Y2ggPD0gKChzMTYpKCgodTE2
KX4wVSkNCj4gPj4gMSkpYCBmYWlsZWQhDQo+IHBsYXRmb3JtOiBCQVRUTEVNQUdFIHN1YnBsYXRm
b3JtOiAxDQo+IGdyYXBoaWNzOiBYZTJfSFBHIDIwLjAxIHN0ZXAgQTANCj4gbWVkaWE6IFhlMl9I
UE0gMTMuMDEgc3RlcCBBMQ0KPiB0aWxlOiAwIFZSQU0gMTAuMCBHaUINCj4gR1Q6IDAgdHlwZSAx
DQo+IA0KPiBXQVJOSU5HOiBDUFU6IDIzIFBJRDogMTA2MDUgYXQgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX21pZ3JhdGUuYzo2NzMNCj4gZW1pdF9jb3B5KzB4NGI1LzB4NGUwIFt4ZV0NCj4gDQo+IFRv
IGZpeCB0aGlzIGFjY291bnQgZm9yIHRoZSBwaXRjaCB3aGVuIGNhbGN1bGF0aW5nIHRoZSBudW1i
ZXIgb2YNCj4gY3VycmVudA0KPiBieXRlcyB0byBjb3B5Lg0KPiANCj4gRml4ZXM6IDI3MDE3MmY2
NGIxMSAoImRybS94ZTogVXBkYXRlIHhlX3R0bV9hY2Nlc3NfbWVtb3J5IHRvIHVzZSBHUFUNCj4g
Zm9yIG5vbi12aXNpYmxlIGFjY2VzcyIpDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQXVsZCA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gQ2M6IE1hY2llaiBQYXRlbGN6eWsgPG1hY2llai5w
YXRlbGN6eWtAaW50ZWwuY29tPg0KPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBp
bnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMgfCA2
ICsrKysrKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jDQo+IGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX21pZ3JhdGUuYw0KPiBpbmRleCBiNmJkYzliZDMyYjAuLmRhY2ExOGI1YjQ1ZiAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jDQo+IEBAIC0yMDU2LDYgKzIwNTYsMTIgQEAg
aW50IHhlX21pZ3JhdGVfYWNjZXNzX21lbW9yeShzdHJ1Y3QgeGVfbWlncmF0ZQ0KPiAqbSwgc3Ry
dWN0IHhlX2JvICpibywNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlbHNlDQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGN1cnJlbnRf
Ynl0ZXMgPSBtaW5fdChpbnQsIGJ5dGVzX2xlZnQsDQo+IGN1cnNvci5zaXplKTsNCj4gwqANCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChjdXJyZW50X2J5dGVzICYgflBBR0Vf
TUFTSykgew0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGludCBwaXRjaCA9IDQ7DQoNClRoaXMgNCBpcyBuZHdvcmRzIHJpZ2h0PyBJdCB3b3VsZCBiZSBu
aWNlIHRvIGhhdmUgYSBtYWNybyBoZXJlIGluc3RlYWQNCm9mIGp1c3QgYXNzdW1pbmcgdGhhdCBh
bGwgb3ZlciB0aGlzIGZpbGUuIEJ1dCBub3QgYSByZXZpZXcgYmxvY2tlci4uDQoNClJldmlld2Vk
LWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KDQo+ICsNCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjdXJyZW50X2J5
dGVzID0gbWluX3QoaW50LCBjdXJyZW50X2J5dGVzLA0KPiBTMTZfTUFYICogcGl0Y2gpOw0KPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQ0KPiArDQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgaWYgKGZlbmNlKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBkbWFfZmVuY2VfcHV0KGZlbmNlKTsNCj4gwqANCg0K
