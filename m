Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F33DD116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 11:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0421F10E0A0;
	Mon,  1 Dec 2025 11:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RYEWnoFg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0439B10E0A0
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 11:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764589846; x=1796125846;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0USBDxE/gt5BSzH0FIOjOjgT34mGPwgQ+vbHgybJ2gM=;
 b=RYEWnoFgVvYdUlLI51kGeb8gCSTrE6ETTkPuSGUD8fL12nE4uGB5WSUV
 k9rjwArJ8gDLBZtmBtSJ0fQiNJjr9+kF2DcoApkL5OHkQubSVqVQCBNqn
 QddRA3hF+Ns7E1Zy0kzI878oj9IuaOMrOAJFVNxCx66YXsrh7NxrYAvX7
 kLqB66eTizrL8449O5Hg6pEY02AfByWVg7kDsqIK24qw1X7q0e3ew83Zp
 nUzMLK/gAdrP1Y+TjKME6d7kD9MbZxtHdjKwYTrxvKVJ8HPvXZGh/0nUT
 regDTePMOy2zHiOAKle6+ExBu7Ohh6bHRSpGtI9nwgeBVp3cGV7rRuny/ w==;
X-CSE-ConnectionGUID: SyeN8d/5QaG4QWXmZj5eAQ==
X-CSE-MsgGUID: 7scdeufiSludNZmwb27x8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="83915384"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="83915384"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 03:50:45 -0800
X-CSE-ConnectionGUID: HyOacOtvQIiwcuC5cNYpmw==
X-CSE-MsgGUID: bDWzDgrkQcaa/HpLlSbbWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="225034029"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 03:50:45 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 03:50:45 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 03:50:45 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 03:50:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eti9KeEoJkC2ucdw9OrE6RMMMTd2FxEH32i+qgcma4ccQZ3kMd5IDpSYsn7TlZPfqnyT/PSosRoe25luU23O9biyWhuJKA4l8vvqbd6sANOrznOEf+DQoUj5Ti/5yg8cFbKYgDe0BqIBysFy1VCMBQI6up+Q358sK6vs/EEo6HzUJhiYZdm4qhzXCE3D68FzPHbT2v4BgzD/pngMyPRPT/sbKUjOSsBgzEfzSJoc2x065CxxJOrSmJ0UC5ZU3fDg/MGJHtWXn05yEXH4DlVZyX+Oiz7minsSpqsUSvR4WmZL7y2wA5KK5lTgsBerTlDLYZae9zPRkvsekIV9L5itXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0USBDxE/gt5BSzH0FIOjOjgT34mGPwgQ+vbHgybJ2gM=;
 b=LTQ/7ft2fDV/QppIdEF9dHZkrtP2rNEWaxrUmLafjYJ9O3myxKAPVp2z+PVaRRFUURd26/w3PSpxjyHoZPGQUGFvuLhiXN8l3Pow+YTJz4Aho50NGvQ4vMR4ucoGoytTWcWZvKsbSWhQei2AY0tqcsr3Ok0de0EkQ2N8U9I9VKbBurxWrqeZroF8MijRKm4q8C5QiyXnfKXdLWbW+9PLdl9nKfIsGb8sFI/Lnp0z/Z5wrXh8XQARoFv3eRIiFOoY4h4ya+ChSiXP0HDpp8k2AQGzyY9Mjqa5sxrvWQJ9Q6599uw7xqNrvw0G82rt3OcH9GjosWVmhLmn/HBCsOHXrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS4PPF6915D992B.namprd11.prod.outlook.com (2603:10b6:f:fc02::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 11:50:43 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 11:50:43 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>, "Gote, Nitin R"
 <nitin.r.gote@intel.com>
Subject: RE: [PATCH] drm/xe: Use IS_ENABLED() for config checks instead of
 defined()
Thread-Topic: [PATCH] drm/xe: Use IS_ENABLED() for config checks instead of
 defined()
Thread-Index: AQHcX7v+0exscRzAbkSF1nu6U6JdmLUMsc8w
Date: Mon, 1 Dec 2025 11:50:43 +0000
Message-ID: <SJ1PR11MB620465985EABAEF33646A24581DBA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20251127170651.3798-2-nitin.r.gote@intel.com>
In-Reply-To: <20251127170651.3798-2-nitin.r.gote@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS4PPF6915D992B:EE_
x-ms-office365-filtering-correlation-id: 04e881b3-b5f5-4a81-440e-08de30cfdb79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?bHpFU0VNTkxYV09iaWNKZCtrQ25qTWpzUDRvSXlWeWNOTVdVWHUzU0F2TlQ1?=
 =?utf-8?B?dHptbEZYSUZua2l5ejJIaEhSa2VlZWNLdDBheXd3NVJ5dU1WNzRwWng3WEJZ?=
 =?utf-8?B?blJFcmI0M1I1Z2x6bmx3SWI3am8xOHpGZkNCaU0xQm5JcktlaHI5WUN5LzYv?=
 =?utf-8?B?UUk4L1BOSGtyZ0JvLzFlb2R2WUpIajdqNXBmUWxvYXNUZTdUYzhKK01va0tE?=
 =?utf-8?B?SjFSSUhZRWZPa0hzaUpzQ0ZuNkoxOC9UcXVMS0hpdWRwUWRjNURJSmZ2dzYr?=
 =?utf-8?B?TGlFYm11MkNQVWRyeTYwWVBadzJ5Vzl5QktKb1hRcFo4L0x5UFZVRVlvTWRj?=
 =?utf-8?B?RUFUV2U1K25QTlpnM3laZ0Z3ZGxYUjZTR2Y1U3pLRENMWlNOMTNEUkFLa2lI?=
 =?utf-8?B?RnFMUmdHRVh0aTNFU0ZaUXB5Q1I5RnkzaSt3b1FuQlpKSW9KUVVnOGZIaHQ3?=
 =?utf-8?B?eTFhV2t0OGpUQXVPSWxwaEd1cmVmSDJNbTRsMGxtSkdIKytDRnVvWHc0VHJ5?=
 =?utf-8?B?VWlmejZTM0czVjlCNjgvL0RYWFIxOGh6alZ3Qk9XdmdibHhmeWY5UnJyWW03?=
 =?utf-8?B?MWFteGpmaHlHWUl1WEtoTTJKVzNuZGFHM1ZiS2IvZlptcWxGeldvY2Z0TG1q?=
 =?utf-8?B?a0xBZGMxVGpXdCszblk0a1dsWitUZGJPcDhySHhwSlloblRLejhkcVdXRmtx?=
 =?utf-8?B?bmtla0p5QWNXdXI1UjZvcnpsTWs3MGU1bUNPU0grUHQ0T2pTU0JRdnl5ck1E?=
 =?utf-8?B?RFRldHJuZlFPOFhmN0dHRW8yaFU4YVRwVFFjakpCWDNqc1oxcmZucmZZSy9j?=
 =?utf-8?B?TjFIV1M1d3J4U2I5bEE0a3FuU3FtV1AxWTN0Q0Z3dmhqK3RaS1hSY0FsRSt2?=
 =?utf-8?B?VXJrQ1Q0RDN1VjYvbms2Z0dUKzRUOUFyUWJEcDVPM1g4WFZvcEI0bmlac1hn?=
 =?utf-8?B?SG9TV1pGV2Rxb3lteG5vSGVpaldQa2hzMXdzYVdvWmdKRjlpVXY1L0FZVENE?=
 =?utf-8?B?RDVPNDhMN0tNWGo3VmZNT1h1ekl5M3BycXdDcno4bCtFOFZ0dmFGRGRleHE0?=
 =?utf-8?B?cllVTE10aXU2OVM2Z1cvUTJyZ0NCWHlicFJ5T2hsS1pUWVhHeERCN1lLK0Q1?=
 =?utf-8?B?K3hzaGE5WElmOFNObDEvczJUUEFDdHNVTUNyRGIvMnBUa2k2K2FhVm1NS29z?=
 =?utf-8?B?QzdnNm9LbzBBSmVWc0ZrSS9wdytybDloT2czVWk1cWlLdnVZQ2V2cEdJVVZa?=
 =?utf-8?B?SzM1dXlHZGRabUpYNUZJRDhPMGwwN1pvWnFWSU8vUTQzVVdTSUJTKzA5TEhN?=
 =?utf-8?B?aHgwcEsxRkZVbGd0dklaTENFMGU2SnhHU1JzN0ZZd2cvcDV1Ny9VMTNuL0JJ?=
 =?utf-8?B?M2tYdXFSc0pUdlJYZmdwMVhVU28weW9pUitHeEVyNzE2MzAzOW1WL2ZrVXpH?=
 =?utf-8?B?dU56QitWcDZRUDhueG45elFQaU1BQlNZcVJWLzNtbWNhZXEzVVJlODE4Qzlh?=
 =?utf-8?B?WVBjcTRuL3FBQ1h0WW5RM29zazdpeDdMaVE0eE1lVGRyS2U1QXozelAzSE9W?=
 =?utf-8?B?R2tlTWhVVE5RV0QxMURWY3oyT3B5Q1YveFJHTG9EalAxNzlGQkZCTnN2d1Bx?=
 =?utf-8?B?bk02M2RzM2Z4bzA1bU15L1c2YlZXc2RyZVUrWkRzMyszcGd1MFh3UkJmbVhO?=
 =?utf-8?B?YnMzYTJKRVR3TTl1SXNqOUJKdzd4NzlUZmVkaG0rOEhlRnlnMDFrQ2FTdzBv?=
 =?utf-8?B?OFF3dTUzNStPVENTWDJEbCsrWERIYTdBN0ZDd0g3VzY3a1dNaE9kZXJVb21t?=
 =?utf-8?B?MDZ6Sk15MXZHRk40ajIyT3Iyb0ZieW91N3doR3IzNWx2WERaVzFIL0VKc2lm?=
 =?utf-8?B?akFoc2VMOTA2LzNrMG9nMGdtOFg3Y0RlZXIzU1FiVDB0TVM1blVDc1dDNmhx?=
 =?utf-8?B?UTVCYjhNVnBWcktnWXhVMzhvVVRrNFRzRThEdnNZcXZpOUphQWtiaWxCaEsr?=
 =?utf-8?B?eWpGcVMzQjUxaWE4blkvR0tQVVc1bTM3ZG5FZGpaVWF5cHFKOWhtL3BKY0JC?=
 =?utf-8?Q?ApWd5m?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVZsOUZNN2FIYVlVZ2k1cGc5UjdMT0ovR0RLUnZoa0VwTXFOakhWMFpuWmNG?=
 =?utf-8?B?ZFBvWjFaQUNpbTdCNmwwblAxYWZBL0dvNjZxMVBVei8wcHFIKzAyaFB5cnhk?=
 =?utf-8?B?UnhLblFkUUhqRU91eTBkUzd2ZUx0dFVPaGNrb3Rpd29hNkh3M0NwN3VYazhY?=
 =?utf-8?B?alMySVQySDJ2bWlUR1R4Q0xYVjcvYXNJZjFxaEVLTGdqMDVHWjFKOElTSXlZ?=
 =?utf-8?B?K1U0Q3VTcTg2elF0MGJrZEpPdUl2YkU1TlVzbjR3ODZuNVRTNUZNSzQ5NXZ3?=
 =?utf-8?B?NXRGd1UrVTVZTHE1SXMrSDdLV0JsU0poNHpScU1TZGdnZHhnQnQ0d2Y4QmpF?=
 =?utf-8?B?K2UycTVMUkVHVXJTNFJtNzVBVVZwQ1dZdFR6UGJJYmV2cEk3VTQ4RUpwcWZk?=
 =?utf-8?B?VGZwLzZCaVg2bTJ2MEVqRUNVc3VCQUh2eHAvSTZpU1p1T0JEMk5NRzdzeCtV?=
 =?utf-8?B?ZThnb01IUjEya3JPbm9PbzMvcFMrOHM3TGtRYzFTMTJZc3oxL2RHTitoZFNG?=
 =?utf-8?B?MnpHRXpCWlBlcFZtV09OV21YRHVXZzM3V0NYUndDUDhSaW9iTUl1SEluTXlR?=
 =?utf-8?B?RE0xZm42UndmVWNWa0QxRDI4S2tFV1dudi8xMGpxN0t2TmFnMDVaUmVHK0JP?=
 =?utf-8?B?d0E0WmM0NEJ0T1grU0YxR0ErWEdWdSs5Q3B1Uk9MNUVtT1d6cUxGKzMrUTlx?=
 =?utf-8?B?bjJZdVdPdVhXUWtFQU9kYVYxN0V1aGZiQUhXVGxiOUVYajJVVjh4dlBsTzhM?=
 =?utf-8?B?MHRRQXMxd0tOQUVVZEVnMFhQVFlhQjREcnhtczdjbi9CSEx6UHRlUHpPcWZx?=
 =?utf-8?B?RksxS1BKSE5WdkRmZVlMVG1iMnNKVWxtRGplVyt0SFNiakZnZjJaMi9iTC8z?=
 =?utf-8?B?THVWenBUb0t3dTNvL21MZ3BJK1lMUlU0ZjdJQWE1WmRSNlRKRVo0UmIxeGFv?=
 =?utf-8?B?WE5MMXc3T0ZKMkJGblJlOFZGUTZxTkNnSnNtdmEvekp5SE1XaEtnY083RVVt?=
 =?utf-8?B?NlJSb3BkMzduWlNBRmhta0ZscHFxQ3d6ZHhFOVpKQVVxNkkzNWdzU200Z2R3?=
 =?utf-8?B?NFE0cnF6L1F0ZXNCN3FOcUErb2pMV1BlSUNjYUtNVnJzZlZEZk5uOW4zVlN4?=
 =?utf-8?B?NzViUkVCcEgxdUpsbks3TGNmQ281VittS3hvQTc3VUVWb1Z1TXJqNWkxRUlT?=
 =?utf-8?B?bzlWejl5YmNTblhrdVV2dERWc25WUUNuZXV4ajZBSHRLbFZFYWFmbW1KYldR?=
 =?utf-8?B?VWsySy8wbllIVlhCTlBSNncyM09VZ3V6anBoZXJ4b0FKaGhCK1FhcTk3dzZk?=
 =?utf-8?B?UUE5TGNvRDZ1ekRrTlpnZkpyMjQ0eW90emNFTjQ4N2toemowbUl4V2VQeDVi?=
 =?utf-8?B?L2xWeVRsQktIcy82azRWc3V0OFFPY01pbUdVR1ordVR3RXhONGRsZXp6czB1?=
 =?utf-8?B?Y2I5OElPS21IRmhPa084MXBhM2MvWHJjK3NRa3JiNXBjZFZ5UE55M2wzWFlt?=
 =?utf-8?B?MHEzYzlTU1IzYXpzeXpBa1czUGdsOWZpY014aXlTeXlNS2NMWlZZRlVwNHdw?=
 =?utf-8?B?WUxLRlZWNUZ3MHBEd2tiVXlZNGtwKzRuVm5pVjRyRkRTY3EzR0hiU3dpM05h?=
 =?utf-8?B?T2hBVVdUYnJiMTZRMHByV29MdWh0QS9YYzVvSWFyQ2pmK2UwUTczS3FUYXRn?=
 =?utf-8?B?Vjh3citwSHNSRHhVV2FhaXd2a0ttQU9OTlJlOVNWQjlZZTFnNTI0eHpBVTNQ?=
 =?utf-8?B?b1d2REFDK3JWRDR5TmZ5S3lLaEx0T2pGTEg2NG16Znhuc3ppY3NwMHpka2lG?=
 =?utf-8?B?YWE4UTJhNTdTMWFmN2VIaXpXNW80a2I0TTgwTmJTZWhUM25OMHZ5RDJDaDNq?=
 =?utf-8?B?RU5Tc25kdWx2dkFWWXlIRSttZVNqT3l4T2p6QjFadHlRVFdZTE5idkFxRVV1?=
 =?utf-8?B?Y3k3TmFqM0VBMmlieGtkWHJxZG02UEtsVTVuaHJuS2xMcngrYSt3OTdRSkdG?=
 =?utf-8?B?YVJEaTJudllTYjRLZDlMVkx6R0JvSnNTMzEzMjJ0TEJ5cytUOVM4QU9pMzJM?=
 =?utf-8?B?TzdENzl4cFNSNXNCWUpDZ3dKSHU0bnNUSVhIYXZKN2Fuc3FyVzUvYTBlOG5S?=
 =?utf-8?B?em1Hc2k0V0tOVHlDZ3NkYUlkU1pJd1VJbjFPLzBEZFpZRWhWV2ZOUDZNNGtI?=
 =?utf-8?Q?bfSzh9k9j0I8uRmvY9zNMSIsT0+Lxy9CxVci/px+71CY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e881b3-b5f5-4a81-440e-08de30cfdb79
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 11:50:43.1661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gdp8NOCWQ7LI8JAYcVRWyqy9cqtUrIlzCkC2+GH5wnTZRvNM4aq4RojIC6KCPyKhSFS3BFTXIeG07BNGITaZCONQcUJBRs4evWiDN8sBkZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6915D992B
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
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTml0aW4NCj4g
R290ZQ0KPiBTZW50OiAyNyBOb3ZlbWJlciAyMDI1IDIyOjM3DQo+IFRvOiBpbnRlbC14ZUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFBpb3Jrb3dza2ksIFBpb3RyIDxwaW90ci5waW9ya293
c2tpQGludGVsLmNvbT47IEdvdGUsIE5pdGluIFINCj4gPG5pdGluLnIuZ290ZUBpbnRlbC5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL3hlOiBVc2UgSVNfRU5BQkxFRCgpIGZvciBjb25maWcg
Y2hlY2tzIGluc3RlYWQgb2YNCj4gZGVmaW5lZCgpDQo+IA0KPiBQcmVmZXIgSVNfRU5BQkxFRCgp
IGluc3RlYWQgb2YgZGVmaW5lZCgpIGZvciBjaGVja2luZyB3aGV0aGVyIGEga2NvbmZpZw0KPiBv
cHRpb24gaXMgZW5hYmxlZC4NCg0KQWRkIGxpdHRsZSBpbmZvIHdoeQ0KDQpUZWphcw0KPiANCj4g
U2lnbmVkLW9mZi1ieTogTml0aW4gR290ZSA8bml0aW4uci5nb3RlQGludGVsLmNvbT4NCj4gLS0t
DQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdnJhbS5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3ZyYW0uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92cmFtLmMN
Cj4gaW5kZXggMGE2NDVlNzZlNWZhLi44ZmFjMWNjMDhkYzkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV92cmFtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Zy
YW0uYw0KPiBAQCAtMzI1LDcgKzMyNSw3IEBAIHN0cnVjdCB4ZV92cmFtX3JlZ2lvbiAqeGVfdnJh
bV9yZWdpb25fYWxsb2Moc3RydWN0DQo+IHhlX2RldmljZSAqeGUsIHU4IGlkLCB1MzIgcGxhDQo+
ICAJdnJhbS0+eGUgPSB4ZTsNCj4gIAl2cmFtLT5pZCA9IGlkOw0KPiAgCXZyYW0tPnBsYWNlbWVu
dCA9IHBsYWNlbWVudDsNCj4gLSNpZiBkZWZpbmVkKENPTkZJR19EUk1fWEVfUEFHRU1BUCkNCj4g
KyNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fWEVfUEFHRU1BUCkNCj4gIAl2cmFtLT5taWdyYXRl
ID0geGUtPnRpbGVzW2lkXS5taWdyYXRlOyAgI2VuZGlmDQo+ICAJcmV0dXJuIHZyYW07DQo+IC0t
DQo+IDIuNTAuMQ0KDQo=
