Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A02C3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 17:54:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975A110E47B;
	Mon, 15 Jul 2024 17:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n4fLvzLf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6BD10E47B
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 17:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721066069; x=1752602069;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=5Qyh7mmJjIuOLe1IPi1kcoeLkfUGv9UTGPJVIyJ2mSQ=;
 b=n4fLvzLfbF8Y/eq5RBf4RoGt70aJrGdgW8R7EXDUqFptOu6RX+VEoEox
 ifRMGCGvaLQcTGst9CcNzYDt6A60RQiO3UzHt9p2pplYIYQ1cbKwSKe1G
 86pxa9dAJi+p1xolxrunGI1fIRWp0wrqSVKfX0M77w+Yli23VsNR98mJr
 LdSSqxSidvGr0GoNbP0OcySocP89OopMqojNg/7Q9TLGZkXx4gvGdbf1y
 wdSaSw2yH0SAz+Sr+V5zc1zREELWYTRoV5Wdm6NdpTg1Al5EQvNr41Uc3
 WQRYTsxjT23Z9JCtwTcSiMfQo1uT5qwpsPm84d5RyVYnLnRvvddd6H74Y Q==;
X-CSE-ConnectionGUID: nbsdV0TTTcqrjJXPQFiGjw==
X-CSE-MsgGUID: TCldgbJeTAGQO1lNcEyE4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="40989240"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="40989240"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 10:54:28 -0700
X-CSE-ConnectionGUID: W4Rr4y+ER+qFfg7lrkbtDw==
X-CSE-MsgGUID: lm9+EGTWTTKBTpEv9hnNNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="49596700"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 10:54:29 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 10:54:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 10:54:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 10:54:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLKQPtRM/Auf4C0wm9UcW2U2jqZ7untbRg/Fg6oyOsXE526VgCCMSh8CbTNqxFpHhFgPSjWVw+ysI5NDIC9NZ/Ncr05Mh+diH741dQ4Xet1ozrqIoHEP7tfH/vKWC963Q3w9cad0ht70KoBXCbtD5ZnoHkKvfP45CKO8XloiGIH3vxDZ2CQx+QDlxwKnObGMSKd7J1jFoSjWyaSVyyYyKu91pDSKiQHVMugb7MmvWZdJGMMVglWVzjGLJMPQTXGszMbQa4J7oDXD+seEFhCV9MarF6POZwgwpJGyK7+rziUWQ/RcTHRc8+U7iD3TBtMm5TyTX13M3yiF1lb9sOUnqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Qyh7mmJjIuOLe1IPi1kcoeLkfUGv9UTGPJVIyJ2mSQ=;
 b=Yo3oO0NLrJBWEQWFWx5lFyCyGco1d5jV7vB58nXqRm6iE5DuF4rLUY0lacs/3UCLIDQd78d314jNJdxtWnsdEdih8ZiN1oR3dw67P2VQG4YvtN+PxiPBxSSK52DNaJoWDYZoMtDi9kAJiLBj15il99yI8PtP7b0ccyPlqfpvWMMzKK2idl3Emprl3zvStjM3mZoo99F7qPk6jPKbXwT6A9qq+lcTh0xz1DCX5QwEbAJujSbV4EYd2hXcnMVooNgO1tk7QqEccbjyA1WBvx8upSOxvwtVFFPQ23rQCX8LkjpWZmIuExf5NOMg9FKdjU0ZeTUoxriH07m6g8p38ixdQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by IA1PR11MB6147.namprd11.prod.outlook.com (2603:10b6:208:3ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Mon, 15 Jul
 2024 17:54:25 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7762.025; Mon, 15 Jul 2024
 17:54:25 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [RFC 10/14] drm/xe/pxp: add a query for PXP status
Thread-Topic: [RFC 10/14] drm/xe/pxp: add a query for PXP status
Thread-Index: AQHa1KKqyknsydPSIEe1bcUngUe0p7H4FsYA
Date: Mon, 15 Jul 2024 17:54:24 +0000
Message-ID: <9da733063a97cdf30473f2f97382eed62eacf251.camel@intel.com>
References: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
 <20240712212901.2684239-11-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240712212901.2684239-11-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|IA1PR11MB6147:EE_
x-ms-office365-filtering-correlation-id: 77bec92d-aac5-4073-d433-08dca4f72a22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Z1lWT3NZT1RwR3dzcmNvSHVxc1BtTU1iV0NwQTlPeDZycnIvWFJadFhFUGpJ?=
 =?utf-8?B?dUJKWGtTS3Z2UlhmeXVtTDFDbnZ4a21CWUZKTFhZY1I0N1dYK3d4aTdscWNE?=
 =?utf-8?B?WVNESDF6SG4weVlxbCtjZHBVeXJjcmR1a1QrSStxUlVsZUpSZEtkS3Z0QjJz?=
 =?utf-8?B?S3NTSS9MWUhZeDlHZGRCWU03aUxjYjdFTUNOZzR0b1NCbklOU0lySVhidFBB?=
 =?utf-8?B?d05zd0tETFN1WkFCbktzRzRsY25SaGhzN0YyK3Foc3k0OWhoZlFoYzNoSVl3?=
 =?utf-8?B?UmFyM1g5RXVINGZacmxTWFY1anlyb1dSemhyME9NR0Z1dVVvOCszYnZhOWlv?=
 =?utf-8?B?NWMrZDlIbUNmTlZQdnZIY281bDFiRW9haFprY1dPRENndlZMVjBDWTE0NEJs?=
 =?utf-8?B?Q1VLTE5nV0FsaXNBMGoxdXBqcHdoa25NYVhIb3h6cFF4blZOZHRvRTZTNTRE?=
 =?utf-8?B?UW5RT1BJY3ZuenZjcEtyS0RmTklVZExablBEeDJCN3p4akFtVkw1N3RxWkZD?=
 =?utf-8?B?QzhJeERNcjJXdjlTNC9aM3FycnpCMUEyZnFrMUIwZU11YXNkNmEwVTZKbnli?=
 =?utf-8?B?QXFQU01BbVVUSnRacmJhTDVMb3FKY2ZVRjg3ZTBUNis2bkVpZ0dwOW5pT0NK?=
 =?utf-8?B?ZzhMWjd4TWZSb0FReUdKbVRkUnRxQUMraU8wUDd4WmszUXNLaWNuQitOMTAz?=
 =?utf-8?B?bDhKSW1FUElHMVFuSlF0U1JrRDNmNUowK0dwV2lSaWhnWUlDUTlmb0plSzdI?=
 =?utf-8?B?THRuRllPOXUvcElnWnJtbEtNUEVtbFhyR0pwS0pvQk5UNkhUNlBFMmh1SEhr?=
 =?utf-8?B?aHF1YXFFKzVRdzBBQXRrNXdKYnBkRDA2VkxnVVdjNWdMd1Zqa0VHTDdBai9p?=
 =?utf-8?B?Q2VmSkp0aTIrWmd1aUFvbHRnSzdBNHYxcU14Vmlnd09QL0ptUkhQMUNkZ0pC?=
 =?utf-8?B?Zk5ZTytPdDNUMnhyTTh5cjFHNXp0Sm9xUXhSbnV2UWRBL0Npbml6Tit6U2Zw?=
 =?utf-8?B?NHlPVG10SVZlclRKbTVVYzFvaWtTYWQ4M2pFS3UvYjR3Y1REV0o4Rlh3b0xw?=
 =?utf-8?B?SmlobTZ2SXFFTWhtK2V0OVBlZmZwdGNxZFRtWldUTmQ5TFRLRmFlb0pyZDZO?=
 =?utf-8?B?c0tNYVUyMDlmMENJeTN1ZG1lYTNiZmtTTHdjOHMveWhqbXp5WHM3SEpacVpX?=
 =?utf-8?B?T1FGUDFod1pxK2tweWJKallKY1RtK01kK3R5TFNGOEkzUzVBNjN5Tm1xQWF6?=
 =?utf-8?B?REZIMTZRUXhaZ3JoRC96bmUzYWhlRkUxaXR5ZWJkNENPbEJtRGJmVmJoYjRB?=
 =?utf-8?B?cG1ScU5HbUU3RHdQOE0yaHk5VVF0UC9seUVTd2lwREJtZ1c1ZTdDTDFtV1BV?=
 =?utf-8?B?VGd4ZUFndXRlMHkvOGtqMGJiT29MckU2L2twVFU5OGcxV2RvUk1tRU0vanJl?=
 =?utf-8?B?SVRWd3RLQlpPZ2NVVGNrdEZzaXM0RlIvanpHcWRESFhKNUZHcVVtb1M5c0sz?=
 =?utf-8?B?WTduRGJXWVlqL2l3RkNPYVRwYVltQ04xWnIrQm1HNkx3VXZXbzZxeGtnYStN?=
 =?utf-8?B?ZCtXMGNDeE5Qc3Q4N1V6OU0vWDVicVhPZEpwek5NWWl5UnduSXJYOEJuemVa?=
 =?utf-8?B?cm92Ni9VTHo2WHlBZHdjbVpZVCthZmxWMGJYMWw5NUswUUdoNUdFcEJRYU94?=
 =?utf-8?B?UEgwZzF6VTNqRGJ0VVlzNEdFZTd5bkhzWTg4OHBBdkRSMjBpSWxPRGZZNUdC?=
 =?utf-8?B?aDBYdHhoWVJiSUZoeE9IeWhtRjZtYXp5dHdBMWJOVVlUOVR6NkZsUGtGeCtC?=
 =?utf-8?B?ZjMrNlV2bkZBSVYvWlhMNHpoNlZCaXA4SDBFK0o3SUtsMEY0bFZ3aFEyQmV6?=
 =?utf-8?B?NVY5TGRQY0xuUnlGcFNhYktpTmJ3eHVUQkw1a2I2S1E0ckE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUd0RUVTa0Q2bUhqS3hzRGlFQ0F1Vko3eFdJMmY5UTQrWnNGUjRJNEhHb0Ux?=
 =?utf-8?B?Smg5bVpVUnJFNjMrSFpEOWRObCtZYWZ2NmdzcjEvZGZSZ1h5ektEU3VqeUM1?=
 =?utf-8?B?aWhFQTBsaDJ5OXlDOXBmZUxBaXdobDRnUHpaeWZuLzkyd2liV0FOS0hZaTZR?=
 =?utf-8?B?MUlFZEIwWkt3Q1lOY1FvMm8yZE1Vc2RGbjVNbVBDVVc0WjhINENHQ240Kzhh?=
 =?utf-8?B?R1o1Tk5TK0lRYWM0K0w3VjRhSi93RU1ZZkh6ak1zWG5pdnNlZkhEdzJVU21J?=
 =?utf-8?B?MzlUbUsrL1FrVm5Qa1BaNUlDUnBNMHZ1c2VHbXAxaE9ZQmpqbGxBaXdBaXJD?=
 =?utf-8?B?Yi80dDBsZTNZQmFIbDZUaG1YRW56dTMyMTFjVEd2KzRCcUYzTEx2SG5LbVRH?=
 =?utf-8?B?OGtualkyOE9HNmFJM2Fyak5ZUEYrem4xMjlQeEpnS1pCWDFwSUxYbmc4dytG?=
 =?utf-8?B?SmUxUU5vSGZjU2tEUDZvY09VUUdIdWpMdTNURFljZDRlUXBzcElPME9YSEUw?=
 =?utf-8?B?S1luMlArSzYzTG9WQkZYemJVT2JxUmowWDdTL2FUS2hKcmRGMDZUTE9hZG1H?=
 =?utf-8?B?T01oMHZSa05Ec1NGOWpzdXd3MGh2cmJWN2VJSUtkakpTZ3EwMkNnQ1lJVHMz?=
 =?utf-8?B?VTVVRzBRUnduOXBoRmthSmxvQUpYMW9kZ3Z6TENmbFRHM2RrcXkwUy9OYVN1?=
 =?utf-8?B?SHM2eDdhWkJlUTBOSlhTRVZFRWdmQmg5cHNhclNNYlFQa2Y3eGNyZW82WjhS?=
 =?utf-8?B?ajVPanoyYitiK1BELy83WTkrdnFUVUc5dGpUS2pqY0tNK0J3MmJaZFdGRzVR?=
 =?utf-8?B?ZzE5bDVSRGQybTc2YXdWVGhSd0kyWmpza0VBRGp5djJFQ2Nhd3VsWVh4ck9k?=
 =?utf-8?B?aWdtNDZNMktlQlFWSnRaYzd2UUY4d2pTTW9hZEY1TWxCM1p1bnJ0UWhGZ3h6?=
 =?utf-8?B?Nm93V3BBekphbWNRZ2VZRkRidjFiaC9GdThaNGxJWm5rNVRwRkJ6MkRCdjVo?=
 =?utf-8?B?NEd2aC9mamJ2UkJMOEQ1N0tMVFViNXk5V2IvTWFLT2hWZ3JjWHVQeXNiQU1x?=
 =?utf-8?B?MzVIT2VhRW8rR25Ya0NLUVhBSXpZdXZUVDBVenNFOUx5eGEveE1wMDRQUm5S?=
 =?utf-8?B?VHVCMkUvcHBYWmVpSXR4ZVl0YVVVQmk4ckNvMkNYSE1pME02RDdDQ2g5OS9z?=
 =?utf-8?B?Uy91S3BzZk4zdTIzN0FsUTZDdDhINnNTR1MrdE1xcnhGOG5rOSs0WnRvek8w?=
 =?utf-8?B?dGRqbVVDTENsTWF4czNNUm1WVDBtUDBLM0ZuQ0dNMTk5Ym5sT09WL3VxUW9X?=
 =?utf-8?B?aXN2dDZFa0REeE8yL0xRdWdCYy9VRlB3a3diM3FSdHZ3d1dNZzhMYm5lM2Fp?=
 =?utf-8?B?NFByZC9TU2g0aGN4RzBtRis3ZlRORStUMnhaQmxJak11aWhkLzRYYWVTSWIx?=
 =?utf-8?B?ZkQzNkxuZXFDWGtQcERkTUY3NnNDWjNObDMrbDZJMFBQU3pFdlhYWFdsRVZ4?=
 =?utf-8?B?U3RkREhRS0RPM2pXamFKOFN5b21mR2NMdXZINWtnRnlxZmF2TkZqeWh4Z0gv?=
 =?utf-8?B?bDRKWGsrdm41Mmk4WFJncXBtMEgxQ204TjE0V2lKYUdYYmlkQXJId2VtVUZF?=
 =?utf-8?B?Q2dPRmt5T3piZ0V5Ti82N1F4akxkWFFscnp1OVMwMldtbnBNcmU1d01KOXFK?=
 =?utf-8?B?R013WW1ZSlgwY3dKamlaTzFyRUNncHp4enAveWZ3SmlSelJJcWRMa3VaZFhN?=
 =?utf-8?B?dzd2eS9NempaMi9XMnZCTWt1bWIvWXRlVmpUalRjTW50dlRuRU9oUXRhdHo2?=
 =?utf-8?B?WDdKRXZ6Z0tkdHVXc3FlSmgzSTliZzU3ZFlHVS8xaVo1QXhIVU5Nd3RWdUE4?=
 =?utf-8?B?cThXVG13S2NRUWRDa1A3LzFYazNGNlJqUHJjaGhGOVQ3TFdWQnNSM3Jhc0xl?=
 =?utf-8?B?K01pdTNNWE8vYXFkd0VIWXF2NkZLTUYvcVQvMzgzb1p6dm1QaUtjd2lmNHl4?=
 =?utf-8?B?Z2tpMHg3TVZvVTRoNFR6OW1Nb0h5TUFOL04wSXFDK1h5RDhwYktJYVh6enhB?=
 =?utf-8?B?amNwTmVLa2VQRkZkWTF3aXpsUEhiYTA0RS85TE9weWFlS21BRS9KYTlyY1l4?=
 =?utf-8?B?NUx4SjBBSjhGWUFPeVhja0ZHTjZLQ1FMbDhoc0kwdVhheHZrYWk3NnhKQ2M1?=
 =?utf-8?B?Umc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E020B1540546134BB890D79BD4B711D1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bec92d-aac5-4073-d433-08dca4f72a22
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2024 17:54:24.9980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4bW0A7AC/52UyCvRGdcRTb5QpilgTfuYsErp83b47K9JKuF5n0ZTrGKLFIfdDvVU6jLTW95tKxWmyeZX0PTwkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6147
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

T24gRnJpLCAyMDI0LTA3LTEyIGF0IDE0OjI4IC0wNzAwLCBEYW5pZWxlIENlcmFvbG8gU3B1cmlv
IHdyb3RlOg0KPiBQWFAgcHJlcmVxdWlzaXRlcyAoU1cgcHJveHkgYW5kIEh1QyBhdXRoIHZpYSBH
U0MpIGFyZSBjb21wbGV0ZWQNCj4gYXN5bmNocm9ub3VzbHkgZnJvbSBkcml2ZXIgbG9hZCwgd2hp
Y2ggbWVhbnMgdGhhdCB1c2Vyc3BhY2UgY2FuIHN0YXJ0DQo+IHN1Ym1pdHRpbmcgYmVmb3JlIHdl
J3JlIHJlYWR5IHRvIHN0YXJ0IGEgUFhQIHNlc3Npb24uIFRoZXJlZm9yZSwgd2UgbmVlZA0KPiBh
IHF1ZXJ5IHRoYXQgdXNlcnNwYWNlIGNhbiB1c2UgdG8gY2hlY2sgbm90IG9ubHkgaWYgUFhQIGlz
IHN1cHBvcnRlZCBieQ0KPiBhbHNvIHRvIHdhaXQgdW50aWwgdGhlIHByZXJlcXVpc2l0ZXMgYXJl
IGRvbmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5p
ZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9weHAuYyAgIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICBk
cml2ZXJzL2dwdS9kcm0veGUveGVfcHhwLmggICB8ICAxICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9xdWVyeS5jIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICBp
bmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysNCj4gIDQgZmlsZXMgY2hhbmdlZCwgOTUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9weHAuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9weHAuYw0KPiBpbmRleCBlOTc5YjQ3ZjE1NWEuLmUzOWE0N2FlYjA1MCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B4cC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9weHAuYw0KPiBAQCAtNjAsNiArNjAsMzkgQEAgc3RhdGljIGJvb2wgcHhwX3ByZXJlcXVp
c2l0ZXNfZG9uZShjb25zdCBzdHJ1Y3QgeGVfcHhwICpweHApDQo+ICAJcmV0dXJuIHJlYWR5Ow0K
PiAgfQ0KPiAgDQo+ICsvKioNCj4gKyAqIHhlX3B4cF9nZXRfcmVhZGluZXNzX3N0YXR1cyAtIGNo
ZWNrIHdoZXRoZXIgUFhQIGlzIHJlYWR5IGZvciB1c2Vyc3BhY2UgdXNlDQo+ICsgKiBAcHhwOiB0
aGUgeGVfcHhwIHBvaW50ZXIgKGNhbiBiZSBOVUxMIGlmIFBYUCBpcyBkaXNhYmxlZCkNCj4gKyAq
DQo+ICsgKiBUaGlzIGZ1bmN0aW9uIGlzIHVzZWQgZm9yIHN0YXR1cyBxdWVyeSBmcm9tIHVzZXJz
cGFjZSwgc28gdGhlIHJldHVybmVkIHZhbHVlDQo+ICsgKiBmb2xsb3cgdGhlIHVhcGkgKHNlZSBk
cm1feGVfcXVlcnlfcHhwX3N0YXR1cykNCj4gKyAqDQo+ICsgKiBSZXR1cm5zOiAwIGlmIFBYUCBp
cyBub3QgcmVhZHkgeWV0LCAxIGlmIGl0IGlzIHJlYWR5LCBhbiBlcnJubyB2YWx1ZSBpZiBQWFAN
Cj4gKyAqIGlzIG5vdCBzdXBwb3J0ZWQvZW5hYmxlZCBvciBpZiBzb21ldGhpbmcgd2VudCB3cm9u
ZyBpbiB0aGUgaW5pdGlhbGl6YXRpb24gb2YNCj4gKyAqIHRoZSBwcmVyZXF1aXNpdGVzLg0KPiAr
ICovDQo+ICtpbnQgeGVfcHhwX2dldF9yZWFkaW5lc3Nfc3RhdHVzKHN0cnVjdCB4ZV9weHAgKnB4
cCkNCj4gK3sNCj4gKwlpbnQgcmV0ID0gMDsNCj4gKw0KPiArCWlmICgheGVfcHhwX2lzX2VuYWJs
ZWQocHhwKSkNCj4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+ICsNCj4gKwkvKiBpZiB0aGUgR1NDIG9y
IEh1QyBGVyBhcmUgaW4gYW4gZXJyb3Igc3RhdGUsIFBYUCB3aWxsIG5ldmVyIHdvcmsgKi8NCj4g
KwlpZiAoeGVfdWNfZndfc3RhdHVzX3RvX2Vycm9yKHB4cC0+Z3QtPnVjLmh1Yy5mdy5zdGF0dXMp
IHx8DQo+ICsJICAgIHhlX3VjX2Z3X3N0YXR1c190b19lcnJvcihweHAtPmd0LT51Yy5nc2MuZncu
c3RhdHVzKSkNCj4gKwkJcmV0dXJuIC1FSU87DQo+ICsNCj4gKwl4ZV9wbV9ydW50aW1lX2dldChw
eHAtPnhlKTsNCj4gKw0KPiArCS8qIFBYUCByZXF1aXJlcyBib3RoIEh1QyBsb2FkZWQgYW5kIEdT
QyBwcm94eSBpbml0aWFsaXplZCAqLw0KPiArCWlmIChweHBfcHJlcmVxdWlzaXRlc19kb25lKHB4
cCkpDQo+ICsJCXJldCA9IDE7DQo+ICsNCj4gKwl4ZV9wbV9ydW50aW1lX3B1dChweHAtPnhlKTsN
Cj4gKwlyZXR1cm4gcmV0Ow0KPiArfQ0KPiArDQo+ICBzdGF0aWMgYm9vbCBweHBfc2Vzc2lvbl9p
c19pbl9wbGF5KHN0cnVjdCB4ZV9weHAgKnB4cCwgdTMyIGlkKQ0KPiAgew0KPiAgCXN0cnVjdCB4
ZV9ndCAqZ3QgPSBweHAtPmd0Ow0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3B4cC5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B4cC5oDQo+IGluZGV4IDhmMGEzYTUxNGZi
OC4uYjJhYWU0YWJkZDBlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcHhw
LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B4cC5oDQo+IEBAIC0xNCw2ICsxNCw3
IEBAIHN0cnVjdCB4ZV9weHA7DQo+ICANCj4gIGJvb2wgeGVfcHhwX2lzX3N1cHBvcnRlZChjb25z
dCBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7DQo+ICBib29sIHhlX3B4cF9pc19lbmFibGVkKGNvbnN0
IHN0cnVjdCB4ZV9weHAgKnB4cCk7DQo+ICtpbnQgeGVfcHhwX2dldF9yZWFkaW5lc3Nfc3RhdHVz
KHN0cnVjdCB4ZV9weHAgKnB4cCk7DQo+ICANCj4gIGludCB4ZV9weHBfaW5pdChzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSk7DQo+ICB2b2lkIHhlX3B4cF9pcnFfaGFuZGxlcihzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSwgdTE2IGlpcik7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVl
cnkuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+IGluZGV4IDRlMDFkZjZiMWI3
YS4uNWRhOWY0MDNjMmI5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVl
cnkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiBAQCAtMjIsNiAr
MjIsNyBAQA0KPiAgI2luY2x1ZGUgInhlX2d1Y19od2NvbmZpZy5oIg0KPiAgI2luY2x1ZGUgInhl
X21hY3Jvcy5oIg0KPiAgI2luY2x1ZGUgInhlX21taW8uaCINCj4gKyNpbmNsdWRlICJ4ZV9weHAu
aCINCj4gICNpbmNsdWRlICJ4ZV90dG1fdnJhbV9tZ3IuaCINCj4gIA0KPiAgc3RhdGljIGNvbnN0
IHUxNiB4ZV90b191c2VyX2VuZ2luZV9jbGFzc1tdID0gew0KPiBAQCAtNjc4LDYgKzY3OSwzNyBA
QCBzdGF0aWMgaW50IHF1ZXJ5X29hX3VuaXRzKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiAgCXJl
dHVybiByZXQgPyAtRUZBVUxUIDogMDsNCj4gIH0NCj4gIA0KPiArc3RhdGljIGludCBxdWVyeV9w
eHBfc3RhdHVzKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgZHJtX3hlX2RldmljZV9xdWVy
eSAqcXVlcnkpDQo+ICt7DQo+ICsJc3RydWN0IGRybV94ZV9xdWVyeV9weHBfc3RhdHVzIF9fdXNl
ciAqcXVlcnlfcHRyID0gdTY0X3RvX3VzZXJfcHRyKHF1ZXJ5LT5kYXRhKTsNCj4gKwlzaXplX3Qg
c2l6ZSA9IHNpemVvZihzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X3B4cF9zdGF0dXMpOw0KPiArCXN0cnVj
dCBkcm1feGVfcXVlcnlfcHhwX3N0YXR1cyByZXNwOw0KPiArCWludCByZXQ7DQo+ICsNCj4gKwlp
ZiAocXVlcnktPnNpemUgPT0gMCkgew0KPiArCQlxdWVyeS0+c2l6ZSA9IHNpemU7DQo+ICsJCXJl
dHVybiAwOw0KPiArCX0gZWxzZSBpZiAoWEVfSU9DVExfREJHKHhlLCBxdWVyeS0+c2l6ZSAhPSBz
aXplKSkgew0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICsNCj4gKwlpZiAoY29weV9m
cm9tX3VzZXIoJnJlc3AsIHF1ZXJ5X3B0ciwgc2l6ZSkpDQo+ICsJCXJldHVybiAtRUZBVUxUOw0K
PiArDQo+ICsJcmV0ID0geGVfcHhwX2dldF9yZWFkaW5lc3Nfc3RhdHVzKHhlLT5weHApOw0KPiAr
CWlmIChyZXQgPCAwKQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJcmVzcC5zdGF0dXMgPSBy
ZXQ7DQoNCndoZW4gc3RhdHVzIGlzID09IDA/IGRvZXMgaXQgbWVhbnMgdGhhdCB3aWxsIGFsd2F5
cyBzdWNjZWVkPyBpdCBqdXN0IG1hdHRlciBvZiB0aW1lLg0KRm9yIGk5MTUgaW4gc29tZSBvbGRl
ciBrZXJuZWwgdmVyc2lvbnMgd2UgaGFkIHRvIGNyZWF0ZSBhIGdlbV9jb250ZXh0IHdpdGggSTkx
NV9DT05URVhUX1BBUkFNX1BST1RFQ1RFRF9DT05URU5UIHNldCB0byB2ZXJpZnkgZm9yIHN1cmUg
aWYgc3VwcG9ydGVkIG9yDQpub3QuDQoNCj4gKwlyZXNwLnN1cHBvcnRlZF9zZXNzaW9uX3R5cGVz
ID0NCj4gKwkJQklUKERSTV9YRV9QWFBfVFlQRV9OT05FKSB8IEJJVChEUk1fWEVfUFhQX1RZUEVf
SFdEUk0pOw0KDQpMb29rcyBvZGQgdG8gbWUgdGhhdCB5b3UgcmV0dXJuIERSTV9YRV9QWFBfVFlQ
RV9OT05FIGFzIHN1cHBvcnRlZC4uLg0KDQo+ICsNCj4gKwlpZiAoY29weV90b191c2VyKHF1ZXJ5
X3B0ciwgJnJlc3AsIHNpemUpKQ0KPiArCQkgcmV0dXJuIC1FRkFVTFQ7DQo+ICsNCj4gKwlyZXR1
cm4gMDsNCj4gK30NCj4gKw0KPiAgc3RhdGljIGludCAoKiBjb25zdCB4ZV9xdWVyeV9mdW5jc1td
KShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gIAkJCQkgICAgICBzdHJ1Y3QgZHJtX3hlX2Rldmlj
ZV9xdWVyeSAqcXVlcnkpID0gew0KPiAgCXF1ZXJ5X2VuZ2luZXMsDQo+IEBAIC02ODksNiArNzIx
LDcgQEAgc3RhdGljIGludCAoKiBjb25zdCB4ZV9xdWVyeV9mdW5jc1tdKShzdHJ1Y3QgeGVfZGV2
aWNlICp4ZSwNCj4gIAlxdWVyeV9lbmdpbmVfY3ljbGVzLA0KPiAgCXF1ZXJ5X3VjX2Z3X3ZlcnNp
b24sDQo+ICAJcXVlcnlfb2FfdW5pdHMsDQo+ICsJcXVlcnlfcHhwX3N0YXR1cywNCj4gIH07DQo+
ICANCj4gIGludCB4ZV9xdWVyeV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpk
YXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkv
ZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBpbmRleCA2MzFmZGMy
ZWQ0OTMuLjc0NmJjMTZiZDIyMCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS94ZV9k
cm0uaA0KPiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IEBAIC02MTksNiArNjE5
LDMyIEBAIHN0cnVjdCBkcm1feGVfcXVlcnlfdWNfZndfdmVyc2lvbiB7DQo+ICAJX191NjQgcmVz
ZXJ2ZWQ7DQo+ICB9Ow0KPiAgDQo+ICsvKioNCj4gKyAqIHN0cnVjdCBkcm1feGVfcXVlcnlfcHhw
X3N0YXR1cyAtIHF1ZXJ5IGlmIFBYUCBpcyByZWFkeQ0KPiArICoNCj4gKyAqIElmIFBYUCBpcyBl
bmFibGVkIGFuZCBubyBmYXRhbCBlcnJvciBhcyBvY2N1cnJlZCwgdGhlIHN0YXR1cyB3aWxsIGJl
IHNldCB0bw0KPiArICogb25lIG9mIHRoZSBmb2xsb3dpbmcgdmFsdWVzOg0KPiArICogMDogUFhQ
IGluaXQgc3RpbGwgaW4gcHJvZ3Jlc3MNCj4gKyAqIDE6IFBYUCBpbml0IGNvbXBsZXRlDQo+ICsg
Kg0KPiArICogVGhlIHN1cHBvcnRlZCBzZXNzaW9uIHR5cGUgYml0bWFzayBpcyBiYXNlZCBvbiB0
aGUgdmFsdWVzIGluDQo+ICsgKiBlbnVtIGRybV94ZV9weHBfc2Vzc2lvbl90eXBlLCBpbmNsdWRp
bmcgVFlQRV9OT05FLg0KPiArICoNCj4gKyAqIElmIFBYUCBpcyBub3QgZW5hYmxlZCBvciBzb21l
dGhpbmcgaGFzIGdvbmUgd3JvbmcsIHRoZSBxdWVyeSB3aWxsIGJlIGZhaWxlZA0KPiArICogd2l0
aCBvbmUgb2YgdGhlIGZvbGxvd2luZyBlcnJvciBjb2RlczoNCj4gKyAqIC1FTk9ERVY6IFBYUCBu
b3Qgc3VwcG9ydGVkIG9yIGRpc2FibGVkOw0KPiArICogLUVJTzogZmF0YWwgZXJyb3Igb2NjdXJy
ZWQgZHVyaW5nIGluaXQsIHNvIFBYUCB3aWxsIG5ldmVyIGJlIGVuYWJsZWQ7DQo+ICsgKiAtRUlO
VkFMOiBpbmNvcnJlY3QgdmFsdWUgcHJvdmlkZWQgYXMgcGFydCBvZiB0aGUgcXVlcnk7DQo+ICsg
KiAtRUZBVUxUOiBlcnJvciBjb3B5aW5nIHRoZSBtZW1vcnkgYmV0d2VlbiBrZXJuZWwgYW5kIHVz
ZXJzcGFjZS4NCj4gKyAqLw0KPiArc3RydWN0IGRybV94ZV9xdWVyeV9weHBfc3RhdHVzIHsNCj4g
KwkvKiogQHN0YXR1czogY3VycmVudCBQWFAgc3RhdHVzICovDQo+ICsJX191MzIgc3RhdHVzOw0K
PiArDQo+ICsJLyoqIEBzdXBwb3J0ZWRfc2Vzc2lvbl90eXBlczogYml0bWFzayBvZiBzdXBwb3J0
ZWQgUFhQIHNlc3Npb24gdHlwZXMgKi8NCj4gKwlfX3UzMiBzdXBwb3J0ZWRfc2Vzc2lvbl90eXBl
czsNCj4gK307DQo+ICsNCj4gIC8qKg0KPiAgICogc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkg
LSBJbnB1dCBvZiAmRFJNX0lPQ1RMX1hFX0RFVklDRV9RVUVSWSAtIG1haW4NCj4gICAqIHN0cnVj
dHVyZSB0byBxdWVyeSBkZXZpY2UgaW5mb3JtYXRpb24NCj4gQEAgLTYzOCw2ICs2NjQsNyBAQCBz
dHJ1Y3QgZHJtX3hlX3F1ZXJ5X3VjX2Z3X3ZlcnNpb24gew0KPiAgICogICAgYXR0cmlidXRlcy4N
Cj4gICAqICAtICVEUk1fWEVfREVWSUNFX1FVRVJZX0dUX1RPUE9MT0dZDQo+ICAgKiAgLSAlRFJN
X1hFX0RFVklDRV9RVUVSWV9FTkdJTkVfQ1lDTEVTDQo+ICsgKiAgLSAlRFJNX1hFX0RFVklDRV9R
VUVSWV9QWFBfU1RBVFVTDQo+ICAgKg0KPiAgICogSWYgc2l6ZSBpcyBzZXQgdG8gMCwgdGhlIGRy
aXZlciBmaWxscyBpdCB3aXRoIHRoZSByZXF1aXJlZCBzaXplIGZvcg0KPiAgICogdGhlIHJlcXVl
c3RlZCB0eXBlIG9mIGRhdGEgdG8gcXVlcnkuIElmIHNpemUgaXMgZXF1YWwgdG8gdGhlIHJlcXVp
cmVkDQo+IEBAIC02OTAsNiArNzE3LDcgQEAgc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgew0K
PiAgI2RlZmluZSBEUk1fWEVfREVWSUNFX1FVRVJZX0VOR0lORV9DWUNMRVMJNg0KPiAgI2RlZmlu
ZSBEUk1fWEVfREVWSUNFX1FVRVJZX1VDX0ZXX1ZFUlNJT04JNw0KPiAgI2RlZmluZSBEUk1fWEVf
REVWSUNFX1FVRVJZX09BX1VOSVRTCQk4DQo+ICsjZGVmaW5lIERSTV9YRV9ERVZJQ0VfUVVFUllf
UFhQX1NUQVRVUwkJOQ0KPiAgCS8qKiBAcXVlcnk6IFRoZSB0eXBlIG9mIGRhdGEgdG8gcXVlcnkg
Ki8NCj4gIAlfX3UzMiBxdWVyeTsNCj4gIA0KDQo=
