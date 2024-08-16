Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6C4C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 06:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3307F10E588;
	Fri, 16 Aug 2024 06:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gG0cgXrM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FC210E588
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 06:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723789473; x=1755325473;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PZ+uQ1ZyI0ACDrZOHPihI0I4gXd79nV/vWoe/pBQMR4=;
 b=gG0cgXrMz27swGP+bVXztgup5qUbrva2LmkXIEkJT2rY+3miUT3MTOUh
 tLTC/c5epMUtxn24rxSAvY29EFaEbciyBMm+S5UrsmXnNYTwhtAVoGi4i
 Uhsxt1i/k9ESeAFNkqLkgTjV1bw5ejbCBpnIOytSXB5cQ3D75FGHG2DRE
 5zw3GmGi9k+f1B0Ltczz9Y4BYnaxH3pUESuApRb57lM25guuxA9ofBG3X
 XaRaQFhza17lvuMAdDe3odHBMCU8zjS0SFyx3T9qYquj3vaI7XEaCh4ay
 O3hKxm+A7JA/Bvo1N+R8s+zrfPsg8R3LBQPnBpK6L0VbWWAdGzoCawJ39 g==;
X-CSE-ConnectionGUID: S1/nEWkKQY6ygN1FXQms1g==
X-CSE-MsgGUID: crop9FH9SHGshpT+LHv2Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="13048894"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="13048894"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 23:24:32 -0700
X-CSE-ConnectionGUID: YgXRdC2cSdOnm8mXyvH0EA==
X-CSE-MsgGUID: fznAbO4ZQFSZphZvx8DoQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="59532464"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 23:24:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 23:24:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 23:24:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 23:24:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 23:24:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSqYurtXTrCQl5S3YiPZCHlExgpFMqDH3f34BVdXjG+E72DeHjgZ+bWL8sUM2R98a84HSHANM70aYV2GvYXYixcN03SgPoeMtFuOvWqRuQLQ80G0g5GbyaGyYrWfEL0NsSP1SgJWaz+bnRgvfg/l3gTy5CQ8jJ4MrPj48svMHhcjo5c616aMc30ur1w4fJFvT1r9nfGTGz+OYm4wV9a18b+veFKdB/k/QIAeUjusBbPJw2s+6dnbtDiu0djd7Bg+6h/8Aq5vHuY58H4C9Y0nZ2pfV8W+w3w+R+EBvs0BUwZUCuuPmt699LPlCZwOJheIb0/onphJoDFnXJErMVfRNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZ+uQ1ZyI0ACDrZOHPihI0I4gXd79nV/vWoe/pBQMR4=;
 b=VCRcnBa8b/qsVXS9ihtNnVAXIA9cLbZ92105ogEkGtm6EGKJa7UL6/Q8+BdhOHolMUfdiWYkIPA97t8cI88zQQazzzfa5UocTgqjB+SZzE3rBqrFrhDAR9s3YhaOk9y1pa/PZkpk8f41COwHr2slWuWRLI4j1+oxv3DeGaabkRsMn0Y/wnWmNCje0N7U6LJUJ55sCpHKeHhLxUC4I2shtXzGlUC92uUsHWhHnQMfl5j+zTE4FK8q8R61aEKCIQKhLEzE6HJ/sLsepUjkniYmURBXSvvm79aqK0lmquvwlOuSAfwJDczzcKbJI9+pMvsZKesf/4j2Pl8GeRYDpqnQZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7054.namprd11.prod.outlook.com (2603:10b6:303:219::20)
 by BN9PR11MB5225.namprd11.prod.outlook.com (2603:10b6:408:132::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 06:24:27 +0000
Received: from MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::9504:33a7:4018:581e]) by MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::9504:33a7:4018:581e%3]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 06:24:27 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 1/3] drm/i915/display: Don't enable decompression on Xe2
 with Tile4
Thread-Topic: [PATCH 1/3] drm/i915/display: Don't enable decompression on Xe2
 with Tile4
Thread-Index: AQHa7wFI0JIePNecWEa/aB+rCrrZArIpa6Eg
Date: Fri, 16 Aug 2024 06:24:27 +0000
Message-ID: <MW4PR11MB70546DE27A00A336AE14EE73EF812@MW4PR11MB7054.namprd11.prod.outlook.com>
References: <20240812201549.2014168-1-juhapekka.heikkila@gmail.com>
 <20240812201549.2014168-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240812201549.2014168-2-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7054:EE_|BN9PR11MB5225:EE_
x-ms-office365-filtering-correlation-id: 8318ad1a-1a03-4c81-61bf-08dcbdbc144d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dG5ESUE5VVJqNVdxcmtNQ0c1MXcwdU0wLytMbXBXOFRBQTB1V0I3MnhkRWFR?=
 =?utf-8?B?VU5jZGl1SG1QVUV2TWVZM2N4Um1YWHlYYmxZUG53RzNyRjUreHRyZjFkeitF?=
 =?utf-8?B?d3ZDN3VBZzFGcDJ6VVd3M3FCRTJsZ0xxd0RrOERsMFkyWXdOVmRIb2NaS2l5?=
 =?utf-8?B?VVdqS0JySUNuZGxGanZVUWZOOWpLZSt4Q2ptaCtRKzZlb2lHN0F0RGk5YzBJ?=
 =?utf-8?B?R3BqU1YraEh4bkpCWUw3dW1KQVkvUDVYRGxEQmQ5UVhWSWtVRXlHbGR4MytM?=
 =?utf-8?B?SVkxYzNmNWNsSzlxUWEya1pteGROMktuSDFSZkljckdWSnJJUkZqS3RhNkNW?=
 =?utf-8?B?eVJHQ000Q2d5MUs3UUhCdkhYUFZtNTBwLy93SHp6cUZpeWRxQTlEd1NLM1BU?=
 =?utf-8?B?bCtLYWJWOW1yZkszTk9tdUJmRnVOZ3RWWDNaZ1pwN1BnMUIrL1YrVTNxZnVq?=
 =?utf-8?B?c3BYQllaeElVSDV3ZFc4MHlXU3F2Qk9CR2QrbDZSZTArM1pPR3NhTlJmNGhN?=
 =?utf-8?B?clZKNU84eDFQeXVQZmlxVWNTeklrVXZ6NkY1K2hoVCtZN0gyTk1aOTVkbWNs?=
 =?utf-8?B?Tlc1UDhtZTlzamJ6YktxMExNc3dlVEN5MmlWS2lqaUcxUE5QSjdhbS9UQWZz?=
 =?utf-8?B?cWlVTi83dnR6NUxINUNWUWQwWjJqUDJPaVJMM3c1b0dUN2lMMUdFWWpKQ2M0?=
 =?utf-8?B?S1MxWXpkbEd4eUdOdm95Z1BoOVRqY2RENzBpTktoMFB0dlNqNE1IWEs4WkFV?=
 =?utf-8?B?Z3hEQWxmaERUc0luWlJ6dTBUZzh2bUxRZWJycjljZmFtbzFNNnpZYWRoQTln?=
 =?utf-8?B?cy9OL2wxb3J3N1Q3NCtzMmdoNnNMYjEvanFoRkZKNkdvRFRvT0JUb05YTFVP?=
 =?utf-8?B?MWpjandycUJGY1MwNmdna21INzR5UWRlMXltamVPSmdteElUNERsTDBzM2Jt?=
 =?utf-8?B?SVBtdkFYMDQxK2ZGQy9Sb3JnRFNHQm8zNndrZ1dLVkkrK0tSQklIREgwbmpl?=
 =?utf-8?B?RjNKMkt4WGxTVis4MFlFOTluTnZsZEliWlBidlZQQVBLR2VyZEl1NjVHMGlP?=
 =?utf-8?B?RERHVFFTekYwRVVNRzRZMkwvYmFjR08wV3ZIbGNuNlZLa3BKc2VDL0UvMDdx?=
 =?utf-8?B?WnpDSG80cmM4bVNKZDBhZ1VSZngrS1Bxd2xVcCt6cEdKSGcwVzUvRlZaM25x?=
 =?utf-8?B?d1NHUXBRSGxUY3VoaEpWVEpxV1QrNllLK3FWdUNTdVBBZjNqMFV6MHFyTmM3?=
 =?utf-8?B?T2haTXBITis1aEFZaEI0ZW9aTXdKeC9ENWtCNVczaC9HZHZNZnFYZHJhY1pZ?=
 =?utf-8?B?bmtqZFp4L1dWRVNJUjRHWlo3Z250TnNlZGN1ZGxSdTEzOElWNWlDc3FNM1Nv?=
 =?utf-8?B?YVVJS1dhMXJZN3ZlRTg4NXhEMEJYMnZ2SFNWNk9IVXlLQUQ1c3RrbTh3SE0z?=
 =?utf-8?B?WENsZGUyRFRNaWt3eEVvbmt0Y0RoZWtCWFV5Yk54cVhuVkd5T3J5TnVaTzZY?=
 =?utf-8?B?TkRSb0w5cU1wVlZWSW43ZlhCMFlLVlhYRGh5UTBuWlZtZlF0U0thYTcwckR6?=
 =?utf-8?B?eHdRU0VFa2JLblMrMmQ5cFZYMEIrVklhbjZaT2RCRC9NdFg0dmI0bFNBT1hJ?=
 =?utf-8?B?ellKQUFTRmFVcjF1R1BOdlU4bGQ0RFZqV3N3VUd2MkdxZXl3a3prOFdjcFZh?=
 =?utf-8?B?clBaZGI0UmE2clkrWTZaNm5xZ1p0eWtGT0x5TWZESGQxOFB4UUphcFRqN3Jn?=
 =?utf-8?B?MkFjaE02a2k2M2lGYjZBWGJuTXJ0TDVQSFR2ZWROOGhQUklxekFISHIyUXlp?=
 =?utf-8?B?UUp5T3RBaE0xanZoeDZpWFZLd05wczBPZDZub1NveTNkTUluTksvalBaOWtZ?=
 =?utf-8?B?WS9PQjAvL096cGpMdzhNRmRUcjdNbnB3OE5ZbkxHdjVlMGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUh2UjRjQ0hKUXl4WURENEdhdzlTQVhWOG5tN2J3MVBJdjVKQjlpN3o1RGpK?=
 =?utf-8?B?dEM1WVI5SzduSmRNSWY5ZGRtK2p5Z2Nrd0J6UVd1NFBxVTAxUkxUREw2WTl6?=
 =?utf-8?B?eDlXS0h5cmg5aDBZM3lEaUs4UktVK2lzMDFuUEZUU2V3SzE3STJPN011L2Nq?=
 =?utf-8?B?Mys4YklQQmREWnMydUlDR05tZ0FWc0JzVWdnOHRYcGdYZ2tHL21VaFJnZTJO?=
 =?utf-8?B?STIxZUk1Q25wd2VTcjRnOHhnVW94QUQxbFdDZmNoQndVaU95d1IyUy8rREtY?=
 =?utf-8?B?MjZZTkJWLzdZQi94RTduN3dMWndkeHdIS1VZNDdOS1JDYlBkU05uak95a25Y?=
 =?utf-8?B?ZUw3TDhmMG1TR3hlVFhJWTBiaVVxU1YvVXN3ZCtpR3poSVVvZWVxUEo0NlFj?=
 =?utf-8?B?SmFvOWo1L2FNR1lmYndpcjRRRGp4K2dEVUJrODhZNDN3M3dSWWcvdFltdmhR?=
 =?utf-8?B?YXJGdXVSa2VlOWI5Nko4VDdxVU5CWXBiZ2VMTHRqWjRqSUgvbFJ1QjBKTzB2?=
 =?utf-8?B?TXhvVko3ZHI4L0ZhbFB1Zk1CVXdKMHQ4djRycjI0bzZDcnErRjBReE5tTk9F?=
 =?utf-8?B?WGdSeVNINm10eFZPcksveC84YlJuRWt0Yi9aL2hiUzVGKy9kUVdrOXpjNlpO?=
 =?utf-8?B?eXpJU20xOU5OWUp3RlFMc1I0OWlVMCtGK0NPbFgrTDhKTjRXQ2pCSzA0Umpv?=
 =?utf-8?B?bXlQc0tGQ3B5MXlWYlprZkM4ME14ZnNvUGZwNWYyV1JSNmUyUU9udWkyVXhL?=
 =?utf-8?B?dTd1bEg3MVE1SEpabkE5RzFlOXpDZjFmTThYUXJ0VlZScklSVXFmdndXaXNJ?=
 =?utf-8?B?VkxQZkM3aHFmN1FUdE9nOTBPbjFtNytxRXdZalpNWFRPWDFONEs2NTR4Zzky?=
 =?utf-8?B?bHpyczRJd3FkUS9WT3NsSzdKWmdINjZBVjdza1g0YkM1ZzhUUEtKQkgxdzNY?=
 =?utf-8?B?Wi9LMTdHOW15QytOaFRDelRjMVBqM2xQMnBCcDFYS0txbHRuOFkya1NJSmRH?=
 =?utf-8?B?N0doRTdhSDNRM25scFk3dGpGZGlqYmhTVkNIQjRzZXFsa3I1ZGdQelRRNEhl?=
 =?utf-8?B?Z3Y5SHRybyt5NzVQOHRHazA0ek1ISnhQS29MSkZEZVpPaE9FZ2QxS2M3bXJV?=
 =?utf-8?B?NnhWdGRWU0U1VW9vdE9DQ0NTOVJRVm8wUWlRMG1PbHpWaStiOEFReWpxOWVV?=
 =?utf-8?B?Z25HcjVWVm52Qkcvb05QWmd4NWhOWHZ6VE5GeHRpNWJ3QlNXdjdOQ0ppUWMz?=
 =?utf-8?B?OThiZHFMYUl4N1VuRzFTUWk5YXdaclZ3RVcxcUt4N3RES0h4YVBFcVJxVXpN?=
 =?utf-8?B?QVdIMkZPUDEvVWJVTWIwU2g5K0tIejNkUEEyT0taa0JVaFlHWWVrK3dRZWFz?=
 =?utf-8?B?bWlBa1N5aXdlSCtGVWhmVUpUQTlWbXEwSExObVQwT0ptOUJoNWl2bjhmQUMv?=
 =?utf-8?B?RGN2Ymx5UW5MMzNTdk9nckdXSHZhN2VyeWdHSnJlR0ZiRVk1OVM3VDlSZWJR?=
 =?utf-8?B?b1NjZHdVZXNWbTJNMjkyMDNFdVNTRGJ4a2NqQmNyWm1CckRKQVpFVmxsdWho?=
 =?utf-8?B?eUE2TXJrMVBETTZHZml0YWxySk9qR01GSWhCdnBiLzZ6NnJGMjBWTThrUTUw?=
 =?utf-8?B?aHFZbTQwZ3doakxYMzhXbXRseW42aThxekdwdjMwa1lkUDduaWx5RU9NNHRG?=
 =?utf-8?B?Umc2dnBTdFh6YTZRK0NJbHI0MjVhTGlxdEY1NnNNM0ZQbnF0Sk9adHowZmlq?=
 =?utf-8?B?UkFtM2JxWVBhQUhNMVFHejNaazBuMGpaUXRWZHFLdlBzcWVPTmluM1phOUF1?=
 =?utf-8?B?Wkk4N0xnWktFczcyK0d3cW50MGYyUXZqRWM3VDR4SGNpeDNMVUZrNTY0Y2Fx?=
 =?utf-8?B?L1l3TGUyOCtVZjhkU3BuK0ZzbDFsdTBHdERRbURCTE02M2trUnlwRXRWMDVR?=
 =?utf-8?B?VnFpaUw4OHh5SGJDbEFzOXUyUXRGVkpVampzQWM0ZjVqYmRVeEE2blAzYzFW?=
 =?utf-8?B?TVB3bHhmN0p3dmtuUVUyT3RmcFJyN0crL01XNXJVV0NaUUUveXZrTXNzUkx2?=
 =?utf-8?B?aDNCbFRWRFc2QWZoN0ExYU9GSTN3Qyt3NkpUYktsUXNJeFNrWElhNy9NU0l4?=
 =?utf-8?Q?y2xMOGs6sHZ6n7z+h1FNE5LGz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8318ad1a-1a03-4c81-61bf-08dcbdbc144d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 06:24:27.1301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vIKuJk3STSMjbhw7w5pZSOw1QxKgj6zXtaxzgjZL0lpEs7n7dqobYDzF6V608FQvBWw6MuFZ7kSzxL6QXfjGrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5225
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWhhLVBla2thIEhlaWtraWxh
IDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPg0KPiBTZW50OiBNb25kYXksIEF1Z3VzdCAx
MiwgMjAyNCAxMToxNSBQTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
IENjOiBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0ggMS8zXSBkcm0vaTkxNS9kaXNwbGF5OiBEb24ndCBlbmFibGUgZGVj
b21wcmVzc2lvbiBvbiBYZTIgd2l0aCBUaWxlNA0KPiANCj4gRnJvbSBub3cgb24gZXhwZWN0IFRp
bGU0IG5vdCB0byBiZSB1c2luZyBjb21wcmVzc2lvbg0KPiANCg0KUmV2aWV3ZWQtYnk6IE1pa2Eg
S2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogSnVoYS1Q
ZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJzYWxfcGxhbmUuYyB8IDUgLS0t
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMNCj4gaW5k
ZXggYmE1YTYyOGI0NzU3Li5hMWFiNjRkYjAxMzAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jDQo+IEBAIC0xMDg1LDEx
ICsxMDg1LDYgQEAgc3RhdGljIHUzMiBza2xfcGxhbmVfY3RsKGNvbnN0IHN0cnVjdCBpbnRlbF9j
cnRjX3N0YXRlDQo+ICpjcnRjX3N0YXRlLA0KPiAgCWlmIChESVNQTEFZX1ZFUihkZXZfcHJpdikg
PT0gMTMpDQo+ICAJCXBsYW5lX2N0bCB8PSBhZGxwX3BsYW5lX2N0bF9hcmJfc2xvdHMocGxhbmVf
c3RhdGUpOw0KPiANCj4gLQlpZiAoR1JBUEhJQ1NfVkVSKGRldl9wcml2KSA+PSAyMCAmJg0KPiAt
CSAgICBmYi0+bW9kaWZpZXIgPT0gSTkxNV9GT1JNQVRfTU9EXzRfVElMRUQpIHsNCj4gLQkJcGxh
bmVfY3RsIHw9IFBMQU5FX0NUTF9SRU5ERVJfREVDT01QUkVTU0lPTl9FTkFCTEU7DQo+IC0JfQ0K
PiAtDQo+ICAJcmV0dXJuIHBsYW5lX2N0bDsNCj4gIH0NCj4gDQo+IC0tDQo+IDIuNDUuMg0K
