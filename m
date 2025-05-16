Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823E1C3ABC9
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 18:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A43C10EB60;
	Fri, 16 May 2025 18:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WvXg4Cge";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B9B10EB60
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 18:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747418827; x=1778954827;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sTKjONiId+5OvZpcAZwnpSF9tCEsJbjPLD8d3i6dzS0=;
 b=WvXg4CgeDU2fKrkhqzwnGZfMANnBFgr2i5AvfhqKoTL7hD1wkwynbp8M
 UrzwAFFNu/TWhXHJjZFuMfb0m5RaeYcWc0bynW/kqT3JFhPV8+rZ8TmF7
 L40DnwMleDJZ1rKgYPe462VWpeuG+D3l2etMpbd8p6vVslVJ641Qy5WGb
 qLZQ1rGEb+12l1D/soHQWkneFi9N88wKheGNuIAT2SfvTv22Vp/c6tmmG
 fXi8vDnJVE/KDRt9Q1gARH5g9Eenxcjp4y+wgXWq8mZOSDiwnz+PKJCZG
 +fnX8IaV9AOf29GYPnQKaAG0Yd4g3ZtWEd4774ZRocDHMQml2DyB4OsTr w==;
X-CSE-ConnectionGUID: NpP1HqRoSWy6TBZytS2Swg==
X-CSE-MsgGUID: HzA9zI9CQxStuI/YV5e8tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="74799413"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="74799413"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 11:06:37 -0700
X-CSE-ConnectionGUID: EzPWFV0YQwOy0AsjqC1zfQ==
X-CSE-MsgGUID: /knJ1Ni1Qtm7bJVCB7CHIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="175891809"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 11:06:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 11:06:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 16 May 2025 11:06:36 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 16 May 2025 11:06:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/UqJ7ZVDTKbbki/PvIpZAfyl0dwAcImOhTsM7pp3tpx29cGMkhTponWCEFwoU7cDxX4NifA6o5rP56/9UUM0MpjL7eVPXUXQkf+oTYZgdbLrkjXpgUlSDd+KiaVzXWMly4n8yzMYrTRzCs8ujKT2urRjAwxzXVCI4sL2LNf8sBcBc3tSWAnT0lz31qWnuszc2nrkCPjvcYUa84OBOCMp7D3AxjA4VISG/HKgxWRaLU5WYzv5gnJDgmzpBd2thUk+SnYAXnRX1oXFhUYFgucNx/lLkA528e1SH6p3HmYiIjazsUoALM6OQzn7C07lyX8qTpo0hnAoDbHggOyWVEA8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTKjONiId+5OvZpcAZwnpSF9tCEsJbjPLD8d3i6dzS0=;
 b=HnEZcDgzkT4eeJsDCSc83fsrCwBrKkjiqC4eWxfuANz3hq47KMHUiRDPgIo2K5ssuEQK2fUf6Ui/9XuHPJt6rriRHqZfTtDr8tZQUGHvrfjS05lx0w5yz12mxeanf2yPH2AYv0lvd20waNRWRJlfsZtafO0A348IDAcqYx3lageYQPcSHwoYf1qFVpdzhD3N4IWxqNIgZ2FhRrgRo1A9+9xWMs9wBmdsvk0sks7dcj1iA+H8m26mMeHlW0+Wo1+y7yGPJmABPmZJq40weWIVlawYkKSM5CRFwdpxwclkDqaHjChwa1UqJewjYh3eDoaVoK9Tz5gFwOGbjVOTSPxTSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MW3PR11MB4716.namprd11.prod.outlook.com (2603:10b6:303:53::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 18:06:04 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 18:06:03 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/bo: optimise CCS case for WB pages
Thread-Topic: [PATCH] drm/xe/bo: optimise CCS case for WB pages
Thread-Index: AQHbxnia9mlpOWCaJkeLOTA7oRXFkbPVjWoA
Date: Fri, 16 May 2025 18:06:03 +0000
Message-ID: <e71b1d8791c3b98f1c82e3553c1b8e47e4c4f07c.camel@intel.com>
References: <20250516153810.223530-2-matthew.auld@intel.com>
In-Reply-To: <20250516153810.223530-2-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MW3PR11MB4716:EE_
x-ms-office365-filtering-correlation-id: a575976a-ffdc-4061-cc40-08dd94a452ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YXlaUnV3cnpLRlIzbEE5SFdJbzg1QU9QSzh1RGViZjZGM2xubUxtaktlVjMw?=
 =?utf-8?B?TElQQ3h0Z3dmT3YvTjlPQUoxNW5CcmZONkdXQWw0NlhXeFlSY0Z2R09MWlBl?=
 =?utf-8?B?QnB5QS80bGY4dzdNR0Nkam1GV01ReDhmcXAzYWJkcVJQQU1Ob1ZDeWdDc2Fj?=
 =?utf-8?B?aWFNaENCZEVBRHRZM1d0a2ZHQ0JBK0FvUFZNR3RENWhCNWlQbE5MbGVIZy9u?=
 =?utf-8?B?aWhTY1FVT0tBajZqRzR5WDAxbG5IOWNnNXR2L3lXdkFWdXRoazRRTHRTSzZN?=
 =?utf-8?B?RmJQL0JZWHVha0IvWDRpRzNDUDBQSW1FZTEzOVM3bUtCbW1GcFpoajJKRmpV?=
 =?utf-8?B?Uml3bFBMeURoeHVaR1FYS0xTSzNHTEFFc3VlMkJHR05ZbGxRQlU5bUZqR2Yw?=
 =?utf-8?B?VCtRMFl2dElxc280WEk0eGY3SkdjK3NnRzUvQmkyeGtSYVZONHlXY3VvSnRV?=
 =?utf-8?B?dDUzb3p6RmNZd3ZYbzI4cDdGdVJzT1AxbmNveG9MempwUkZreWovR25lRW1Y?=
 =?utf-8?B?WDR0V3JGTzMyczB6ZlFmek5EYm1oM1EyZENmT3MybnNGVmhzaXlpWDhvSVRx?=
 =?utf-8?B?cFQ1K2pPNkkxdTFFeXVCOGZPYkxwZFd5dCs5T3BEeFhRU2tjalNKUEpXdjAx?=
 =?utf-8?B?MzJxdCt6OVFETGVQU05lRTdQczluOVlPM2hqM1kxbGp6SCtmTVJlVkNhVUN6?=
 =?utf-8?B?dnhUVjdINW1QVzVpZXFMdHJqaU41M2MyeUJvaXV0dFFXK3crVitXbm8vM21M?=
 =?utf-8?B?eW9aOVREQ09UWEVwOWpGSlF4RjEvMmIrcFpYRFBxcTAxWUErNHJISktFM2hT?=
 =?utf-8?B?T1V2THRSMk5ZMXczaHpFVUFOTkNqOHI5bTh3RWZYbmxFTWkxK1dCRDR1M1Fo?=
 =?utf-8?B?Rko4aUxRTk9NRmNMTWhsQlFqTzRKdmwzT05sUzRVeEZkcUxja1VtWGtiQjRa?=
 =?utf-8?B?TnhnY25NRFVXQ1I3YXJrbm9kZEtjclE0UXZlZGZGMWRyaEZlSjhjNlZZaENo?=
 =?utf-8?B?QnRRU3E2MFdLNU8vUTB2N1hhWDZ3QUFYU3BkZjBtY3pCV1RTQkduOVlXYk1r?=
 =?utf-8?B?cDhHbVJGN3I1K1IvbXAybVdaUGluM21oN1VBNnRtUXU4RGRaaTVaWDVhMXBX?=
 =?utf-8?B?aGd1SEVpQXA3aVZsRkdzZlgxUkNLWjg4WTR2Z2luTlZlcW5lRXp0N3hCUzNP?=
 =?utf-8?B?clNDSkhNR0diak1jQ2RhVDZRQU5jWm9VNFR3VExUTUNhR2hWU3ZzWlNnbTRB?=
 =?utf-8?B?YUVrZW5TTmRFWGNuTTJBUmlkRlFBNGQvWTRKd1g4ZGdaZ2RkQXFSN0JDdlJk?=
 =?utf-8?B?WURuUDlZNnkrUkFPS3htN1JpcjFyRTBVT1l3dWU4WjJDWWhDL21aUVNFOVlF?=
 =?utf-8?B?b3piZ25OSFEyWWg4R2lLakxMUUIyQU5VL1hrRmJTYk0yWURsQ1dWM0RWdEto?=
 =?utf-8?B?dklheUg2MnFteTRwd3V2RE4zMFBqbkJvSlovSnRLM0d4VjAxdW40bTRqN0pT?=
 =?utf-8?B?dTZUQnduWWxraTZrdXZLOW93aDFzdWMyNURjZ2FDL3dBOGhmcFRuSnM3OElS?=
 =?utf-8?B?L0RxV24vN1BiQ0tLNHpEM1dkYUNwbmcrNkFxZkhKYjMreDBJY2RWNlZXMmlR?=
 =?utf-8?B?MDIvVE5ZdndWc01rSXpVKytLU1lrNmJnMkRYYjBEUnBkQlZlT0hrVjBlQW1m?=
 =?utf-8?B?SlJ0Nm5NeFdkK2IrdS9jZ1JNTXN6SEtHRnNOUHZBek4yUTJjOG1KMHpNbCtU?=
 =?utf-8?B?UVU1REs1SWZrVVJ3THVQRmRUU0R1SCsrMEF2ME9SaFhyV0lRT2hmUXRLSHl1?=
 =?utf-8?B?b3VVZ3NlOUhCZ0tUUmZmOWV1ZG1IOERjenBEY3R2MlJBYmtQaEJ2UE1vaXcy?=
 =?utf-8?B?b3A3ZS9nbTZ0YjFEdkRabEdFZmdpbE1oaTk0TXZqWTNybnJwVG02VVdTU2xr?=
 =?utf-8?B?KytIcXBEcDRLZmRxTVpIUWh5NTRvVGJvZDJnOTcvVlhXOFdQQWlKaUtMaTlK?=
 =?utf-8?Q?fSF0/KKjjW3AXNTG7mFAMQYqQ9fo6w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUNQUWpGWlZGUjBrejBrUGt1b25zMFhqeU5oRzUvSzZBYW9nUzdJOHJTbzNz?=
 =?utf-8?B?K25MWHZuN2d0U2duRFpuY0tsZXdDVytqVTVrbTUwNFNWWUhIYk1yVTJuS2R6?=
 =?utf-8?B?STJkbTBrMGFRVGJRcnVVcWRGaUoxbm9pL3IzUDhsalFKTHpDMWR6UklySXR4?=
 =?utf-8?B?WFJRQ1RjbTFxQ2wvVFphS0taZGRnNW9yTDFEN1V5dHUvVDU4OWozZVVXUXpu?=
 =?utf-8?B?U0hJZzY4Mit6NHVSL0JSc2JoektHMkw5MDFzcFRlcUxDQVk3azZwaGRHTkJk?=
 =?utf-8?B?VnFGK0RBMnAzRnNJaktObVk1dUpZUWp6ZU5ZTVBNU09SamNJMnJ5UkRTVVI4?=
 =?utf-8?B?d3ZJODFQSjJqK0o2N0w5K1FHZmhmUDlzc0hWSlJUWGxJOFhuQ09WTUkvSzlu?=
 =?utf-8?B?NC92T1pKSWJFZnRuVWIvdFlTT0lOSnRLeVB0dlEyZ1ptaGNtalE4SkkrY2hT?=
 =?utf-8?B?RUVmMkYyYyt6VUkwczV0U2tQSTZvdlNJRFdzbUdSWUQrbEQrV1ZybGF4eU5y?=
 =?utf-8?B?NzM5Uit6aVNZMlFGdnpTZ0NpbVI1SGplV0UvQUVrTElLK25mYzdYMW1vRXVr?=
 =?utf-8?B?OURxRkFzWS82TTNCN2Y4eU5zaklxWVNqd2hOcFBZaU9rUkpKcnRmRDNiUXhl?=
 =?utf-8?B?K2JMMnNBT1JYMnJTbFI3SFh1VzhTaGJVQjBIWDgrV1lYTTNBSVNaUWhlcmdQ?=
 =?utf-8?B?TEZ5R09GZys5bEJGbCs2eGZCK0d1N1N5bTRSN3BQNng4ZUhOeXF4MC9YSzRm?=
 =?utf-8?B?RisxMWFYVlpYMmFXSjI2QnZUdVBlNm51SFI3MW5uZ3VWS1YzOUFYTGtuMVNY?=
 =?utf-8?B?amtpVFFLZWlUcy9IUXM2YitMbXRwMXpSdjhkWWFLMVZEVkFuemJGemprdVlz?=
 =?utf-8?B?aHJXMENQc0NNTE1tY0lVRzlkakQrYWIwajFqOG5PNFZKTDd0WlRRa0M0VWhv?=
 =?utf-8?B?MXFpNEw5ODZLb013YlNycWRuT0dJSTU1S1hxREthQ1BHTitRa0IvdDUvN2Fj?=
 =?utf-8?B?MExzVFYybkN0TmVoTnUrRjNTNC9PNEl0QjBaNExUZUZIR3hkM3hRSVJmNkJX?=
 =?utf-8?B?aTRWbU5DOUU5d0Q5NU5uRnpSS21EWU5VU0p6YUQ5NVlKK3FKSDRDTDBvdmhW?=
 =?utf-8?B?Y1NnRzJlVGxDY09sOHk1cjBhZkJDRkx6NFRvWjBmdUYwcDZCT2wxWDlvY3Q0?=
 =?utf-8?B?VGhYRlZMYnp6QzY5S3l0aDNaRWVKKzQzd1VMdElHOEovSzExNlp3Vk9MOGNF?=
 =?utf-8?B?Y0U4QmtJS2tGTzh6NDlPbzFkVElwem9oRFpUTm1WdEF5cWl3MW95SVFoa0xQ?=
 =?utf-8?B?YlF2QkpNV0dZd2VSUC9MVE85Tkh4cFVxR0hFV1JsMHhMRFJJSUh4dDRHNjBZ?=
 =?utf-8?B?K0g4L3dKT0ZzMm52ZGhGNnVGY3l6U3dudTRFQmJVVERNUFV4cVVReWZHeDUy?=
 =?utf-8?B?cVlsenBCN1NPeFM3NU1uOWlNVXFLUTJCNXhuQStGaGxhcktESmZlUDJEb2Q2?=
 =?utf-8?B?Vk9FVEF5c2JkSTE0M2lzVi9QeXZkT1kwVjhWek1jckR6VW9tRzNlOHl1VzNM?=
 =?utf-8?B?NzhyaEQvWHVRbDN1b3IzTmlRYmVtRUFoM3JwM3ZlWWRZSHJsTUVyeFlwalA2?=
 =?utf-8?B?YVI2RXl3elBkRFNKVldxOTM0ZUZNS1NnKzF5R293UU96RFVQZ21IK3FlMHNR?=
 =?utf-8?B?MU1BVm1sSXZKdENjWUJuNHNMdjlaQTh3R01VazBnK0F4ckl3VldjcUdUTlhS?=
 =?utf-8?B?MlhramJlZDEzNis0NVlUakViWE5TMEtLaEpRU1RMVVJmeWU3V1VkVDgzdndN?=
 =?utf-8?B?bklJNmtOM0pnd1BuNm05bHFHcDM2Z3ZTY3NYTkZiZGxjU05tRmNDRk9rQWNo?=
 =?utf-8?B?V2QxKytULyt4M283aEZNVnpBUUFYTkIwYXorYUJDWVVrWXo1U1J3anZweXdx?=
 =?utf-8?B?d2oxMWZIQThXTHF3a3VaZlJiSVdSRUEwU08yYldLeXBjaTBwVDFyRXBNZFE0?=
 =?utf-8?B?RzN6TVRvQ2IvVng3bnR3OG93QlpsUjV3VlZWOUp2UjR2a1RNZ1g0akpUZDJo?=
 =?utf-8?B?djJmeE5GU2tBUThRanAvcUhsb0pMK0V4Y2xscThtNXppWTB4Sm1paHZtbFhp?=
 =?utf-8?Q?KebDjJCHlXaFUhKctF4gu0ZWK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <084BEFFF25143541BD988F4EE80886B0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a575976a-ffdc-4061-cc40-08dd94a452ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 18:06:03.8667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lp/4ig8WDLCi1sWuMBhREvqD356qjn91TMNSuppQ4XTmMR4gtIUPvD6WjyMO7y4l4s1oaCGXbP2EpoTvcWkdCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4716
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

T24gRnJpLCAyMDI1LTA1LTE2IGF0IDE2OjM4ICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IERlYWxpbmcgd2l0aCBDQ1Mgc3RhdGUgaXMgc2lnbmlmaWNhbnQgb24gTE5MKywgd2hlcmUgd2Ug
ZW5kIHVwIGNsZWFyaW5nDQo+IHRoZSBjb21wcmVzc2lvbiBzdGF0ZSBvbiBldmVyeSBwYWdlIGFs
bG9jIHVzaW5nIHRoZSBibGl0dGVyIGZvciB1c2VyDQo+IGJ1ZmZlcnMsIGluY2x1ZGluZyBhbHNv
IHNhdmluZyBhbmQgcmVzdG9yaW5nIGl0IHdoZW4gbW92aW5nIGJldHdlZW4NCj4gZG9tYWlucywg
cGx1cyB3ZSBuZWVkIHRvIGFsbG9jIGV4dHJhIHBhZ2VzIHRvIGhvbGQgdGhlIHJhdyBDQ1Mgc3Rh
dGUgZm9yDQo+IHRoZSBzYXZlIHN0ZXAuDQo+IA0KPiBIb3dldmVyIGFsbCBjb21wcmVzc2lvbiBQ
QVQgbW9kZXMsIG9uIHBsYXRmb3JtcyBsaWtlIExOTCwgYWxzbyByZXF1aXJlDQo+IGNvaF9ub25l
LCBtZWFuaW5nIHRoYXQgb25seSBXQyBtZW1vcnkgY2FuIHVzZSBjb21wcmVzc2lvbiBpbiB0aGUg
Zmlyc3QNCj4gcGxhY2UuIFdpdGggdGhpcyB3ZSBjYW4gYmUgc25lYWt5IGFuZCBjb21wbGV0ZWx5
IGlnbm9yZSBDQ1MgZm9yIFdCDQo+IGJ1ZmZlcnMsIHdoaWNoIGlzIGxpa2VseSB0aGUgY29tbW9u
IGNhc2UgYW55d2F5LiBUaGlzIHdvdWxkIHRoZW4gc2tpcA0KPiBhbGwgYmxpdHRlciBtb3Zlcy9j
bGVhcnMgYmV0d2VlbiBzeXMgPC0+IHR0IGFuZCB0aGVuIGFsc28gbWVhbnMgd2UgY2FuDQo+IGRy
b3AgdGhlIGV4dHJhIENDUyBwYWdlcy4NCj4gDQo+IFRoaXMgc2hvdWxkIGJlIHNhZmUgc2luY2Ug
dGhlcmUgaXMgbm8gd2F5IHRvIGludGVyYWN0IHdpdGggdGhlDQo+IGNvbXByZXNzaW9uIHN0YXRl
IChwb3RlbnRpYWxseSB1bmNsZWFyZWQpIHdpdGhvdXQgdXNpbmcgYSBQQVQgZW5hYmxlZA0KPiBp
bmRleCAod2hpY2ggaXMgcmVqZWN0ZWQgYXQgYmluZCksIGluY2x1ZGluZyBpZiB0cnlpbmcgdG8g
YmUgbWFsaWNpb3VzDQo+IGFuZCBjb3B5IHRoZSByYXcgQ0NTIHN0YXRlIGZyb20gdXNlcnBhY2Us
IHdoaWNoIHNob3VsZCBnaXZlIGJhY2sgYWxsDQo+IHplcm9lcyBpZiB0aGUgc3JjIHN1cmZhY2Ug
KGluZGlyZWN0KSBpcyBsYWNraW5nIGNvbXByZXNzZWQgUEFUIGluZGV4Lg0KDQpBdCBsZWFzdCBv
biBNZXNhIGNhc2Ugd2Uga25vdyBhdCBnZW1fY3JlYXRlIHRpbWUgaWYgYm8gaXMgZ29pbmcgdG8g
aGF2ZSBhIGNvbXByZXNzZWQgb3Igbm90IFBBVCBpbmRleC4NCldlIGNvdWxkIG9wdGltaXplIGl0
IGV2ZW4gZnVydGhlciBieSBoYXZpbmcgYSBmbGFnIGluIGRybV94ZV9nZW1fY3JlYXRlLCBzb21l
dGhpbmcgb24gZmxhZ3Mgb3IgY3B1X2NhY2hpbmcuLi4NCg0KQW55d2F5cyB0aGlzIExHVE06DQoN
ClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNv
bT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50
ZWwuY29tPg0KPiBDYzogU2F0eWFuYXJheWFuYSBLIFYgUCA8c2F0eWFuYXJheWFuYS5rLnYucEBp
bnRlbC5jb20+DQo+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51
eC5pbnRlbC5jb20+DQo+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNv
bT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYyAgfCA4ICsrKysrKysrDQo+
ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcGF0LmMgfCAzICsrLQ0KPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfYm8uYw0KPiBp
bmRleCBkOTlkOTFmZThhYTkuLjNmYWZkY2I4ZDk1YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2JvLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMNCj4g
QEAgLTI5ODIsNiArMjk4MiwxNCBAQCBib29sIHhlX2JvX25lZWRzX2Njc19wYWdlcyhzdHJ1Y3Qg
eGVfYm8gKmJvKQ0KPiAgCWlmIChJU19ER0ZYKHhlKSAmJiAoYm8tPmZsYWdzICYgWEVfQk9fRkxB
R19TWVNURU0pKQ0KPiAgCQlyZXR1cm4gZmFsc2U7DQo+ICANCj4gKwkvKg0KPiArCSAqIENvbXBy
ZXNzaW9uIGltcGxpZXMgY29oX25vbmUsIHRoZXJlZm9yZSB3ZSBrbm93IGZvciBzdXJlIHRoYXQg
V0INCj4gKwkgKiBtZW1vcnkgY2FuJ3QgY3VycmVudGx5IHVzZSBjb21wcmVzc2lvbiwgd2hpY2gg
aXMgbGlrZWx5IG9uZSBvZiB0aGUNCj4gKwkgKiBjb21tb24gY2FzZXMuDQo+ICsJICovDQo+ICsJ
aWYgKGJvLT5jcHVfY2FjaGluZyA9PSBEUk1fWEVfR0VNX0NQVV9DQUNISU5HX1dCKQ0KPiArCQly
ZXR1cm4gZmFsc2U7DQo+ICsNCj4gIAlyZXR1cm4gdHJ1ZTsNCj4gIH0NCj4gIA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhdC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3BhdC5jDQo+IGluZGV4IDMwZmRiZGI5MzQxZS4uMzhhNmE0OWMxYjJhIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGF0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BhdC5jDQo+IEBAIC0xMDMsNyArMTAzLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9w
YXRfdGFibGVfZW50cnkgeGVscGdfcGF0X3RhYmxlW10gPSB7DQo+ICAgKg0KPiAgICogTm90ZTog
VGhlcmUgaXMgYW4gaW1wbGljaXQgYXNzdW1wdGlvbiBpbiB0aGUgZHJpdmVyIHRoYXQgY29tcHJl
c3Npb24gYW5kDQo+ICAgKiBjb2hfMXdheSsgYXJlIG11dHVhbGx5IGV4Y2x1c2l2ZS4gSWYgdGhp
cyBpcyBldmVyIG5vdCB0cnVlIHRoZW4gdXNlcnB0cg0KPiAtICogYW5kIGltcG9ydGVkIGRtYS1i
dWYgZnJvbSBleHRlcm5hbCBkZXZpY2Ugd2lsbCBoYXZlIHVuY2xlYXJlZCBjY3Mgc3RhdGUuDQo+
ICsgKiBhbmQgaW1wb3J0ZWQgZG1hLWJ1ZiBmcm9tIGV4dGVybmFsIGRldmljZSB3aWxsIGhhdmUg
dW5jbGVhcmVkIGNjcyBzdGF0ZS4gU2VlDQo+ICsgKiBhbHNvIHhlX2JvX25lZWRzX2Njc19wYWdl
cygpLg0KPiAgICovDQo+ICAjZGVmaW5lIFhFMl9QQVQobm9fcHJvbW90ZSwgY29tcF9lbiwgbDNj
bG9zLCBsM19wb2xpY3ksIGw0X3BvbGljeSwgX19jb2hfbW9kZSkgXA0KPiAgCXsgXA0K
