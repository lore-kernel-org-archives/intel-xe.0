Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0073C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 14:43:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6574C10E0EE;
	Tue, 21 May 2024 14:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkLJIhsI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF8A10E0EE
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 14:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716302606; x=1747838606;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7g1QBgGfAsEKYYnBJuQ8addaUgpNlIDehgnQRmX0PPc=;
 b=VkLJIhsI5RaYtEEGFOgpzaCjfNChtdjTsxL9Mlk5MJlb7xcYO3mEpuyR
 VMvGGPO9ZW1WS8oNB1Uli8ol3lqSzALrduGJLpIRR61S268LAyTzACg6+
 UURxyp5mKtO7tkKjw8444L/KTOppeeNUIUozvfsOswqsseAB1PLUm/69I
 JhfLmutQpuFvH3zCO4s0QgnqVmzEx47z9yL2bZJlKp1MgKe9hKqCQh/Ei
 JWuWKzq6NBJrVhTbsoUhqQZoJqJkxX3+6D3iYw/w+hiTKAssAW1RFlKyq
 ScpGTo2sTVbZbpPuI/rMs7052QP9Fulmdhz+Weo5q5mYlpHCCwXG/gm4Y A==;
X-CSE-ConnectionGUID: NlwvCmSHRIqgP7M0kXs4Dg==
X-CSE-MsgGUID: 5n9OZw9fRduqJDO4uLnOLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12616225"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="12616225"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 07:43:26 -0700
X-CSE-ConnectionGUID: bMiolMTWRbe1RbBXnxFrig==
X-CSE-MsgGUID: MwFZ0QK/T3aAz2Ba61DPjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="37717532"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 07:43:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 07:43:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 07:43:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 07:43:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgkqJTBowNP3BgYsismeckPw9wUVPbaimHRQw2ZRWxxMcipBsxx5E4AcmnooESK00ZzFrcsb5idK61sLOl61nLM7RkUASia1FZVbrFpR9k6KvAoiOqpBGGVzIRJgf//bbcx4ygfX91aSN06CWGAC1Kr5cl+3U2moXQQBrxtmM4Y4ADIiNKHVAKLg45ECIx8N4mHf9GQg9XksNEeJtKzx4EPESYaLhYVDNHl6QBcbpTqQxO1jo9PG+VXvAy9JnnYURvzWEpLigdjBQnukl3y3TXyu9qI+TWOHhxh6dzz2+gbQOdjNCn0FiIAprJ9LNHYIGW9pNWYAhFQVeAhjXc8Vrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7g1QBgGfAsEKYYnBJuQ8addaUgpNlIDehgnQRmX0PPc=;
 b=EmQ8m9r5q9aswzqQ/0cbf1rweV4EKUhSyhQJqF9DXEbNQVvM3iVUzxxPkzC96LQ1uCXtyBdEpxZO8kyMbeuoU/geKXLg6sesWLZjU8EKWKpS4nodRRfUXEo0AdyS0tdDA4cUmnB80ybN1XKRUnRQ12PK39Zb8WeZ6hBn+FFDoGnXRmFjzpiZP0S74F6FYNXmFzliDor3vYaFU7gATldcH6y35GNc13PxCLy57SJsgReowViGxtUULhARk5DYEtgQ7PqTmSA0NsSCTUqWSXNxUXyWecEgmSTv33jfa8vLEzEMQRBK4CiEBItLomWNKtB7+FuKHkdM0mYNA9IHd3idxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH8PR11MB7069.namprd11.prod.outlook.com (2603:10b6:510:217::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Tue, 21 May
 2024 14:43:21 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.7587.028; Tue, 21 May 2024
 14:43:21 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Krzemien, Robert" <robert.krzemien@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH 00/17] Add OA functionality to Xe
Thread-Topic: [PATCH 00/17] Add OA functionality to Xe
Thread-Index: AQHadnkcIUwutN2VakWosatViFIW8bGcJwYAgAB1PYCABZE6AA==
Date: Tue, 21 May 2024 14:43:21 +0000
Message-ID: <96d03111d07e8182e7ecb3c0ca1942c7fef22e6f.camel@intel.com>
References: <20240315013518.2848986-1-ashutosh.dixit@intel.com>
 <438b276a653bf56fe1e0e131709d615dec86ae3e.camel@intel.com>
 <87frufuc96.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87frufuc96.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH8PR11MB7069:EE_
x-ms-office365-filtering-correlation-id: deee4d62-90cd-46a4-7818-08dc79a45c9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?S3FsWE9YbGcrZ1g1NnZOVzV5eFdMNVZBNHY5TllqRXhua2VKVkNkY3V4dXRK?=
 =?utf-8?B?NUxvYkwxdWgzbmF5YVNiMnMyd1NFK2R3NFZ2SUl0dTlsRWlheW43TTB4K2o0?=
 =?utf-8?B?MHVXcURmUWZ5NG41Z1JjSXBtLy8wOXNBV2pVaWxRQm93Tm0wWkRNODVXUXB3?=
 =?utf-8?B?UDRRWmZWdnRUS3NpaUg3MHkrbFcremxBL2pZN1dwbmxzc3lKWjNGa2ZxZnJw?=
 =?utf-8?B?cHZ0bXJQNVdZOWYwQVJ6bkZjOGMxWXloWUttT3BSOENaUVZnRnhrQmlKMkRz?=
 =?utf-8?B?SHdCNUlWSldYSzU5NXpVWEZIKzZUM2dQbEx2RmkyWkY3d1B4VCtRMStrUC9B?=
 =?utf-8?B?Ly9WanR0aFVaeVV2UWZqR1FwN2oxMmpDOTV5QmVhTFNUSHN2N2I4b2pnZ3Q5?=
 =?utf-8?B?dFl6UnBSdktvOGMzVCtWb05JNXBWcTk2MERCL3RlUlBiZ1VudXdTdEROMGx5?=
 =?utf-8?B?bUgrR1RtVWd4b0ZpYUF4YkJpMzY2Q095VjdoMHlHMDZPNjBiNHpCV0lwRTFK?=
 =?utf-8?B?UHhQdExteWVLbGJYeVo3THdTNnNuSCt5MGxjdnl0czdLb3ZrT1VhTTNNakZ3?=
 =?utf-8?B?K1NYcU93aG0zaGZZZkJ3Y01zeFVrdXNUWXRYRFZyelUxT3BHckpzamlwU0dx?=
 =?utf-8?B?M0tKWmhiMnFMZ1NkaVM3Y0hVWmpFVHZuNWMrUDBteUhTOVdZOUtxTEFHS0dE?=
 =?utf-8?B?TXVmVEUxdjJmRWRUcUdtbEptd1RtNmpKR3VkWUxsYzdkTzNRMGNCdkV4eXZx?=
 =?utf-8?B?ZFF1elNGQzBzYzU1QjNaNDUvNGRlTGVVRUVlYndmWTAwMVdhUGhUb0JHNnhm?=
 =?utf-8?B?V0ljbWFYVkdhSkw0YkpiaC9XOWVpZm1vV00xWUN0TUhJVUpXc01hYlRjMER5?=
 =?utf-8?B?c3hVUU9rRUtXS21hN3BDbkErQ1d0QTk1bUZKdzcvR2p2Mi9xazZUMzNKeTRJ?=
 =?utf-8?B?c3Q0cVpGWFFWRE51U0lqSnFGWFo1bUtCckk5NTdDZEJIVWpqYlM4OTNsMDZp?=
 =?utf-8?B?a3hNa2Q3dm9FWkduUzJkN1ZEc3F4T0JrQSt3T3lkV3NmODlUMXpvOHJaWmo3?=
 =?utf-8?B?VHBwNXNPdlU2bVM5cnJYMElaTFlMSU9Nc01PVCticWJkVWlPcVFraVh2N040?=
 =?utf-8?B?SHVJbEw5aThDcGQ2T012YXFsQjVyMTBNN25QRVJYREhEYTlaVnlWcUNJQkxU?=
 =?utf-8?B?QXhSZEhkYzArbU9sSXJVdHBxTXl4cmlEOTFsTnhSaEd6d1lyWFVvcFkyWFlr?=
 =?utf-8?B?Unh6R3FXNGw5SHZTcHJsRTRqQ3NzVjF4cUVZWFBXRSsxVWQxYlIwakZRckxz?=
 =?utf-8?B?cVhHbDNLcW1ETGdkWmNrenBhTUZoR3lreFJObURwSWFiS244ZnkyUjd0VlM4?=
 =?utf-8?B?K2dJUlZKK2JIQzdMWVlqOHB5RlErZlVpQno2emZqSWxJK3Q4MUlER2xqVEZh?=
 =?utf-8?B?UGxLemxSMHhMR3k2RVgwRUVpZFEwNEZ0NUNvWkpJQTQ1VlVXSjZtSkdCMmI2?=
 =?utf-8?B?ZTR4TTZJT0pzNzcwZ3BhZkkzUUF4Nk1aYUFsYXFhZjlmd25zeTkyZjFPWEJN?=
 =?utf-8?B?dzlRZDdlR1RyazlOcGpLUm5uY1NvamNWL0FBUE9tK1IvWGJmZlVLQmlCcCtY?=
 =?utf-8?B?RmdvUXEwN3Uxb05PNmp2bFB6YXRoV2pibG9VdEdYMFF1Vml1ZStNd3RlMDN1?=
 =?utf-8?B?VWdJaWZaQW1wZERrOGNWZm4zVkNqQVJ1bVBqc0xHbmlRVGpRbm5VRmxwdnBj?=
 =?utf-8?B?YXZDTGFWcmQvNzVYalVUYlYvVnk5UnpKQWlGeHoxaWE3Z3RLU2Z2ZFF3VnI1?=
 =?utf-8?B?UGFNVFQ3WVI0QzlWdlUxUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ymp5cVZEOUU3aGVQa0J4NVZlUnplSTdMdytxM1VISFl2WHFhejM1ZzJsamE1?=
 =?utf-8?B?MXR6UWhtS0lySHZmWTZmOStudHpxYWFidExTT3BnQU1jSG4yTkFSekhSemNv?=
 =?utf-8?B?Y1lLWWkxQ3R2R3lmNURqR1R1MjF5dUtkNmREUGFYZ3dyNTY4QjlvQ0w1cERI?=
 =?utf-8?B?aGkxYkpoZm55QnBEcWFpWHNSZHNUUitxMHZaOHFKZHFHMWh6ZXhlaVluVTk5?=
 =?utf-8?B?UjF5TDZlTnNoNllzZ25CVGlWSFh1YnVRd0JRRDg1cW5JWjUrYks0bFc0OEt5?=
 =?utf-8?B?MHREbnZVaFRpa0RUMHFWVVVVNTBNOW91Smh1cVlIeXVQNmk1eXljRFByZTNN?=
 =?utf-8?B?Y3M1cWQ1aGZKSllCRmdmc2pyUmxWTnZtVGM4UG5wL2kwVU0wVGFXM2ZVcHRO?=
 =?utf-8?B?ZDBpZ2hSZ0QxUkEyNCswdWNvMU1hbWZ4aGYvbnJXWUlQcDNjT1hxQnVQclgx?=
 =?utf-8?B?MUFKSncvaWNTMXdoeWtjVGx2cGV2WmdMbW1MbHp4VGlTVEpoTi8rc1VzUmdV?=
 =?utf-8?B?NXFMeGt3ditJdmFBQzVwVCt0SFlReW1vRlNOWkJhejFXcjJRSTNIZnBVcGNo?=
 =?utf-8?B?Q3FtcFcvdFMvK0dmak4wWEVWS3haVCtweHB6ZUg0NVJ4L2lBelQ3VS82Mk5q?=
 =?utf-8?B?YTJpOGRUWTVGdS9PTUZSVlJXSDV3Q3VWSGt5Wm5QdksyUXR3YVJiZ2hZMmFL?=
 =?utf-8?B?eFljSjRSRWliTlVCYkI4QmhHTUgxZ2FFMzFoR0I3amo1cXdnc3kzdGtWalJR?=
 =?utf-8?B?L25HTkUycXlpM1FxV1VJTGdvSnZDa1BMdjFGMGNBcDJVK01IWC85c2xmTmp1?=
 =?utf-8?B?YldYeUJpRnNCbXkwUjB6THFzN2lwQkFrUUFCVGwvMjVKL205bUFwL0pmRU4z?=
 =?utf-8?B?Wjd1enlyTkVKRCtZVzZueDBxb0F3cVE2R3lhWEU3NDloMHllQnlMWm43ZDVU?=
 =?utf-8?B?RzJ4eXZHYlBxTGhnVytrQm5nYkZ2RThYanJOd0x1aUhDY2IyWjE0U1dOQ3Zq?=
 =?utf-8?B?VzVGelNkcURhNUdRa3YyZkhvRDQ5MFdVS0FQOTZKZ3Vvdi9vWm5zb295UmNT?=
 =?utf-8?B?T3Q5Z2IvS0NBOXRCRHRnd1JwR1VQbFJaMng1czhrb0llM05NbVNlNmNNNWpV?=
 =?utf-8?B?bjhFWGFET1FwZWIwaU9VbmpReG5UNGd2dnVLWWtQOEl4K1Q0VlhsQXFxM09u?=
 =?utf-8?B?a3o4ZEI1Y25kcFA2RjBBMWNraGljc0VYREtYc21Dc0xhbHRKdktsWW1tRWdu?=
 =?utf-8?B?SGd4djFJVi8reEJmQVZQa3lubCtTdjc5NkdUK0NQMGNUZUJFcWNZRVgvMWpr?=
 =?utf-8?B?U0l0QTFZaFVWeEhBUVZ5SHdYRDlPWFVaWkNmT0x0NXl6dHB3WkZVUGJhc2Jr?=
 =?utf-8?B?U1lRYzJHTGVWV09WbG10WlFuOGNaQVFRYXFqTnJQRzhTTmUzVllUOHYyRHQx?=
 =?utf-8?B?MnJTK2VHZEM1SHZoZVFSaGRkVHBjdSsva0VnMHhoQzNtalBZRkVDdHlOdFFp?=
 =?utf-8?B?OEFrcm5za1hVOEF3ZEJnbE9icThJMXFxcnhJdjNHR3hBV3d4bjdYdy9Ud3Vs?=
 =?utf-8?B?dEVMMFYvS2NSYUp0SmpqU0lyZ21zektad1prNlhSVmt5WVNoMklzakRTcURW?=
 =?utf-8?B?YXRXS2labEEvTzgyMXJmQURiV0JEdmJDWStDNjhGdyt6Qjlvc09wdTFFUU1F?=
 =?utf-8?B?cW9VZk5EakRBSlBudWp6bEw2R2VKRHU1S0ZSbUc1TXFFcnMyaWd1c0ZaTW5p?=
 =?utf-8?B?OXY1MGEydkttYnp6ZzdteThaKytTUTE1dCtsWkdlVmljandNK3ZuR2hKTFhZ?=
 =?utf-8?B?RUZWUFNYTElxVWRMN29wSnRIMnVOM1R3SGRQWm9QV3hEa3FkTThvVWNhMUs1?=
 =?utf-8?B?M3RQSFRURSsvWHFRb3duWnFwRjh2c0VwUm04Zk5WcFp5SzdjTHZ0N21UdEg5?=
 =?utf-8?B?WG90QzNjdFZPM2pkVW1YV2VXOG15T2h5N24ybmEwbDhmTWE2VFFGVlBWMFVk?=
 =?utf-8?B?a2xpRklnbG9HZ0FWMzZBeUhPeE1PM09ZUldsSlcyYnN5MjZ1bXAzbWNzd21l?=
 =?utf-8?B?aC9jZ3pxMk5zYTMyaXFCNnEvU3A3OFhLYS9KbXJlUFlhdm80YjI3Vkt6WVEr?=
 =?utf-8?B?SHhqRFA2SXM2MzZzVnYwYzZiWlNOQmtUOU4zU2h5eUY2MzlEOTFXWVNLWmdj?=
 =?utf-8?B?clE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56232D883A7771489B963E18CDB774FC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deee4d62-90cd-46a4-7818-08dc79a45c9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 14:43:21.5111 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aX0564ej4q/o3684Rh0zKGkC3QI3SyfnNIyB5PybCljMXDWeiw++lVwfc/pAl+9HEVqHIECRnmw5mr4CPKT8Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7069
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

T24gRnJpLCAyMDI0LTA1LTE3IGF0IDE4OjQyIC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIEZyaSwgMTcgTWF5IDIwMjQgMTE6NDI6MzkgLTA3MDAsIFNvdXphLCBKb3NlIHdyb3Rl
Og0KPiA+IA0KPiANCj4gSGkgSm9zZSwNCj4gDQo+ID4gSGkNCj4gPiANCj4gPiBJIGhvcGUgSSdt
IHJlcGx5aW5nIHRvIHRoZSBsYXRlc3QgdmVyc2lvbi4uLg0KPiA+IA0KPiA+IEp1c3QgYSBmZXcg
Y29tbWVudHMgSSBoYXZlIGluIHRoZSB1QVBJOg0KPiA+IA0KPiA+IC0gUmVuYW1lIERSTV9YRV9P
QV9QUk9QRVJUWV9PQV9FWFBPTkVOVCB0byBEUk1fWEVfT0FfUFJPUEVSVFlfT0FfUEVSSU9EX0VY
UE9ORU5ULCBmb3IgYmV0dGVyIGNsYXJpdHkuDQo+IA0KPiBTdXJlLCB3aWxsIGRvLg0KPiANCj4g
PiAtIFNvbWUgUGVyZiB1QVBJcyBhZGRlZCBoZXJlIGRvbid0IGhhdmUgdXNhZ2UgaW4gTWVzYSwg
c2VlIHRob3NlIGJlbG93LiBOb3Qgc3VyZSBpZiBNREFQSSBvciBndml6IHdpbGwgbWFrZSB1c2Ug
b2YgaXQsIGlmIG5vdCB0aGUgYXBwcm9hY2ggaXMgdG8NCj4gPiByZW1vdmUgdUFQSXMgdW50aWwg
dGhlcmUgaXMgVU1EIHVzaW5nIGl0Og0KPiA+IAktIERSTV9YRV9QRVJGX0lPQ1RMX0lORk8gKyBk
cm1feGVfb2Ffc3RyZWFtX2luZm8NCj4gDQo+IE1EQVBJIHVzZXMgdGhpcyB0byBpbXBsZW1lbnQg
bW1hcCArIG1taW8gdHJpZ2dlci4NCj4gDQo+ID4gCS0gRFJNX1hFX0RFVklDRV9RVUVSWV9PQV9V
TklUUyArIGRybV94ZV9xdWVyeV9vYV91bml0cyArIGRybV94ZV9vYV91bml0DQo+IA0KPiBZZXMg
R3B1dmlzIGFzIHdlbGwgYXMgSSBiZWxpZXZlIE1EQVBJIHVzZSB0aGlzLiBBY3R1YWxseSBJIGFt
IHN1cnByaXNlZA0KPiBNZXNhIGlzIG5vdCB1c2luZyB0aGlzLiBCYXNpY2FsbHkgdGhlIHF1ZXJ5
IHByb3ZpZGVzIHRoZSBmb2xsb3dpbmcNCj4gaW5mb3JtYXRpb246DQo+IA0KPiAqIFdoaWNoIGVu
Z2luZXMgYXJlIGF0dGFjaGVkIHRvIHdoaWNoIE9BIHVuaXRzLiBUaGlzIG1heWJlIE1lc2EgY2Fu
IHNraXANCj4gICBzaW5jZSByZW5kZXIgZW5naW5lIGlzIGFsbW9zdCBjZXJ0YWlubHkgYXR0YWNo
ZWQgdG8gT0EgdW5pdCAwDQo+ICAgKERSTV9YRV9PQV9QUk9QRVJUWV9PQV9VTklUX0lEIHRvIGJl
IHByb3ZpZGVkIHdoZW4gb3BlbmluZyBPQSBzdHJlYW0pLg0KPiANCj4gKiBCdXQgdGhlIHF1ZXJ5
IGFsc28gcHJvdmlkZXMgb2FfdGltZXN0YW1wX2ZyZXEgd2hpY2ggbmVlZHMgdG8gYmUgdXNlZCBp
bg0KPiAgIGludGVycHJldGluZyBPQSB0aW1lc3RhbXBzLiBvYV90aW1lc3RhbXBfZnJlcSBjYW4g
ZGlmZmVyIGZyb20NCj4gICByZWZlcmVuY2VfY2xvY2sgaW5jbHVkZWQgaW4gJ3N0cnVjdCBkcm1f
eGVfZ3QnIGZvciBjZXJ0YWluIHBsYXRmb3Jtcw0KPiAgIChjdXJyZW50bHkgREcyL1BWQy9NVEwp
LiBTbyBpZiBNZXNhIG5lZWRzIHRvIHdvcmsgZm9yIHRoZXNlIHBsYXRmb3JtcywNCj4gICB5b3Ug
bmVlZCB0byB1c2UgZHJtX3hlX3F1ZXJ5X29hX3VuaXRzLg0KPiANCj4gPiAtIERSTV9YRV9PQVNU
QVRVU18qIHZhbHVlcyBhcmUgYmFzZWQgb24gSFcgZGVmaW5pdGlvbiwgSSB0aGluayBpdCBzaG91
bGQNCj4gPiBub3QgZm9sbG93IEhXIGF0IGxlYXN0IGZvciBEUk1fWEVfT0FTVEFUVVNfTU1JT19U
UkdfUV9GVUxMIGFuZCBhdm9pZCBoYXZlDQo+ID4gYSBibGFuayBzcGFjZSBvZiBiaXRzIG5vdCB1
c2VkIGluIHRoZSB1QVBJDQo+IA0KPiBTdXJlLCB3aWxsIGNoYW5nZSB0aGlzIHRvby4gVW1lc2gg
YWxzbyBtZW50aW9uZWQgdGhpcy4NCj4gDQo+ID4gLSBQZXJmIHN0cmVhbSByZWFkKCkgc2hvdWxk
IGdpdmUgdXMgYSBoaW50IHRoYXQgZHJtX3hlX29hX3N0cmVhbV9zdGF0dXMNCj4gPiAtIG5lZWRz
IHRvIGJlIHJlYWQsIHRoYXQgZGlzY3Vzc2lvbiBpcyBhbHJlYWR5IGluIHByb2dyZXNzIHRoYW5r
IHlvdSBmb3INCj4gPiAtIHRoYXQNCj4gDQo+IFllcywgd2UgYXJlIGdvaW5nIGFoZWFkIHdpdGgg
dGhhdCwgcmVhZCgpIHdpbGwgcmV0dXJuIEVJTyBlcnJubyB3aGVuIEtNRA0KPiBlbmNvdW50ZXJz
IGVycm9ycyAob3Igb2FzdGF0dXMpIHNpZ25hbGxlZCBieSBIVywgYW5kIHdoZW4gVU1EIHNlZXMg
dGhhdCwNCj4gVU1EIGNhbiBjYWxsIHRoZSBzdHJlYW0gc3RhdHVzIGlvY3RsIHRvIGdldCB0aGUg
c3RhdHVzLg0KPiANCj4gPiANCj4gPiBPdGhlciB0aGFuIHRoYXQgdGhlIHVBUEkgTEdUTS4NCj4g
PiANCj4gPiBUaGVyZSBpcyB0aGUgaG9sZF9wcmVlbXB0aW9uIGZlYXR1cmUgdGhhdCBpcyBtaXNz
aW5nIGJ1dCBJIHRoaW5rIHRoYXQgY2FuDQo+ID4gYmUgYWRkZWQgbGF0ZXIuLi4NCj4gDQo+IFll
cywgdGhlIHBsYW4gaXMgdG8gaW1wbGVtZW50IGl0IHNvb24uIEFsc28gYW5vdGhlciBmZWF0dXJl
IHRvIHN5bmNocm9uaXplDQo+IE9BIHVuaXQgcHJvZ3JhbW1pbmcgd2l0aCB3b3JrbG9hZCBzdWJt
aXNzaW9uIGlzIG1pc3NpbmcsIGFuZCB0aGUgcGxhbiBpcyB0bw0KPiBpbXBsZW1lbnQgdGhhdCBz
b29uIHRvby4gSG9wZWZ1bGx5LCB3ZSBjYW4gZ2V0IHdoYXQgd2UgY3VycmVudGx5IGhhdmUNCj4g
bWVyZ2VkIGZpcnN0LCBiYXNlZCBvbiBNZXNhIGFuZCBHcHVWaXMgcHVsbCByZXF1ZXN0cyBhbmQg
ZG8gdGhlc2UgbWlzc2luZw0KPiBwaWVjZXMgYXMgZm9sbG93IG9uJ3MuDQo+IA0KPiA+IA0KPiA+
IHRoYW5rIHlvdQ0KDQpPdGhlciBhc2ssIGNhbiB5b3UgcmVtb3ZlIHRoaXMgJ0ZhaWxlZCB0byBy
ZW1vdmUgdW5rbm93biBPQSBjb25maWcnIGRlYnVnIG1lc3NhZ2UgZnJvbSB4ZV9vYV9yZW1vdmVf
Y29uZmlnX2lvY3RsKCk/DQpNZXNhIHdpbGwgYmUgdXNpbmcgRFJNX1hFX1BFUkZfT1BfUkVNT1ZF
X0NPTkZJRyB3aXRoIGNvbmZpZyBpZCBzZXQgdG8gVUlOVDY0X01BWCB0byBkZXRlY3QgaWYgWGUg
S01EIHN1cHBvcnRzIE9BIGNvdW50ZXJzIGFuZCBpZiBhcHBsaWNhdGlvbiBoYXMNCmVub3VnaCBw
ZXJtaXNzaW9ucyB0byB1c2UgaXQuDQpTbyBpdCBjYXVzZXMgZG1lc2cgdG8gYmUgZmxvb2RlZCB3
aXRoICd4ZSAwMDAwOjAwOjAyLjA6IFtkcm06eGVfb2FfcmVtb3ZlX2NvbmZpZ19pb2N0bCBbeGVd
XSBGYWlsZWQgdG8gcmVtb3ZlIHVua25vd24gT0EgY29uZmlnJyBtZXNzYWdlcyB3aGVuIHJ1bm5p
bmcNCnRlc3RzIHN1aXRlcy4NCg0KT3IgZG8geW91IGhhdmUgb3RoZXIgc3VnZ2VzdGlvbiBvZiB1
QVBJIHRoYXQgSSBjYW4gdXNlLg0KDQo+IA0KPiBUaGFua3MgZm9yIHRoZSByZXZpZXcgYW5kIGZl
ZWRiYWNrIDopDQo+IC0tDQo+IEFzaHV0b3NoDQoNCg==
