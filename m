Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43D5C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 13:10:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3AA10E7C4;
	Fri, 23 Aug 2024 13:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTeDRd7P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4524F10E750
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 13:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724418601; x=1755954601;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xD43IMl0fhlfJDrAn5tC+qDJ3BPXggKug7P076mOLbE=;
 b=HTeDRd7PxPD6RoaZg9gh/eJhx84qq0C9dkSQDBjZAS5ZbF//LB4CrWfI
 /JzUL7y1xYr6OpvEAX2dAaVpBAz4EkzBvAo4jIJu7h2DboA79R8ah7aeY
 2msMGhYGrnTluxBqYQ/utk6d72o9dfkIAdSgShn9dGQy5/KWpOSsUJ/Mb
 Kbg3cWsjxVdiPXNgRdHPO1O2pLXKMFZnof4Y7RwyFMixBlY+aSH795IVZ
 TD1038f6KWL9ppUkPGImd/IsQnErfolaa32AoMvnhbvRwbLE1aM/ayhPm
 QSZINH4C3dLaSlAreMAokeYx1xK89AtzGlzQ9lE36RfWoomUeEYr3ZLxs w==;
X-CSE-ConnectionGUID: /WcKu+p+QwuxKXkRPmPEzg==
X-CSE-MsgGUID: z+UfRNjGRkWF7gwcz10g0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="34263706"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="34263706"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:10:01 -0700
X-CSE-ConnectionGUID: r/9GJ1ZPRV6C8ynMaz1JvQ==
X-CSE-MsgGUID: XDnfCftTTBeRgh4b7NfmhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="84975312"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 06:10:01 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 06:10:00 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 06:10:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 06:10:00 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 06:10:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fa9N+7327HqlV1mhVi0PfJQd0GKlg2cdwkXjZx3l0zZ5/pN9vQgiTepD3PG441b5TXULV9RJpqyKLMi/XzWWyFLbZPcdw6CPbOXIixak9yPPWot96pR3BhlId/VQeu6a+BZpyXca3JcLChu+jW9xPeM486sWT/3R8RTVhTOognQKPRjFTBDjjQmfT07jrl+Yqf+93iWkMskiPY+Dz6YXHWIhEzC3cJ6y3e0kcGO0mr9ck4+ATh5KGSmGzDHBd/ocHozeVz6cuwhBjpfaT5e7LpRD2g9Ukym69kUDH1nSQhfQ1yMIcNDEVkEqwDK3Oeh5q+4fWXRttu06fWVM3YTAgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xD43IMl0fhlfJDrAn5tC+qDJ3BPXggKug7P076mOLbE=;
 b=SCmjkCV3vtdwjsMzw1rPHOPRdRlTlLVr1y1fMkG1QtuJNbpFXCS+buIjXDLuBPSy+/VeIvzFbUe14F0lIn/jEurCMyYeemAb3QX4gtfeMRJOcLSiqpelsLzCvTvQmbuafJTj19QWPbISBWj0BGfTTNG874q6qly5K6mbaA9+z175qh6l1L4KlV0d3WE2WKKxnJAKjqb7JaAHQlT40ewvhDs0jF5Dnx7PZOCgJ7OVDUapR6PNbv7s6JOpqxTSKWXsNlp5EnIba1jry4TpxOj7eCZ3KYY8DZ2gO8567uYbPj6IKjHg8SRmIRiKrMU3TkrpwZGGmxICBh3yuxTg80Isgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ1PR11MB6297.namprd11.prod.outlook.com (2603:10b6:a03:458::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 13:09:58 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%3]) with mapi id 15.20.7875.019; Fri, 23 Aug 2024
 13:09:58 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Cabral, Matias A"
 <matias.a.cabral@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Degrood, Felix J" <felix.j.degrood@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ranjan, Joshua Santhosh"
 <joshua.santosh.ranjan@intel.com>, "Chegondi, Harish"
 <harish.chegondi@intel.com>, "Kumar, Shubham" <shubham.kumar@intel.com>,
 "Ausmus, James" <james.ausmus@intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall sampling
Thread-Topic: [PATCH v2 1/1] drm/xe/eustall: Add support for EU stall sampling
Thread-Index: AQHa0L7jLk5Pn9W4/0+8hkrEd96MvLIquGGAgAeoyoCAAcmYgIAA7z2A
Date: Fri, 23 Aug 2024 13:09:58 +0000
Message-ID: <1be86c4c39c244712b72c60be709a04d80cf48b7.camel@intel.com>
References: <20240707224141.2865472-1-ashutosh.dixit@intel.com>
 <20240707224141.2865472-2-ashutosh.dixit@intel.com>
 <878qww3xh8.wl-ashutosh.dixit@intel.com>
 <CYYPR11MB83605299AB7259BC17AF3E38B28E2@CYYPR11MB8360.namprd11.prod.outlook.com>
 <87frqwyxsc.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87frqwyxsc.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ1PR11MB6297:EE_
x-ms-office365-filtering-correlation-id: c47098b1-9c14-42f2-a226-08dcc374e3a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YnVpMDdUZ1JMaSt4ZVVhZm1ieUFlakpIVWxkUDF0bFByak4zUkdlMGVxcjNC?=
 =?utf-8?B?bThWU1l0QVRKdTQ2RUlQTk5kZVJYM0Npem9haW5LZk85S1JsT2ltRHE4NHdn?=
 =?utf-8?B?Mll3bE4zM1VVNklYL0h5SFRQb1BTSXRYMGp1ZnVKTjZZYUx4bkZueFdpWWhX?=
 =?utf-8?B?SW9DY1hmYVdVUmNkaEUrOEhZN01nWUMrbWN3alZZOE00RmNJSVZLYUpYSTBR?=
 =?utf-8?B?RU5kUUJaVzYvSVJjMGIweHN4a3ZwWTY3VXI5alFRZmtXdVp6bXdWc0k1d05s?=
 =?utf-8?B?UThlRzFPV2c0SXJuelcyaVJGMkx4aTRZdHQxSnBCUmdTek10bURHUHcrY1d2?=
 =?utf-8?B?SDE2dkNRREpRRGxuRmZoZGZaMEV0UThoMHBIYjZRUTJhaWc5ZVN5U040VWtz?=
 =?utf-8?B?VUpXalYrOXhWdW9IL3VtdzRjQXF2WGlUeU1ROTFsbVBkU3A5b2p5Q2tQcGFs?=
 =?utf-8?B?RkgxVTlzQjZGVDl1eFJVWGN1S1d0T1FTT2phZnVTL3JRVDVRdElPcCtpcjRX?=
 =?utf-8?B?UkVPbms4TkFpQkxXV0pScWp4WFdLRGg1UUJVS0ZtUnUvVjd5V2M0bEFLWGV6?=
 =?utf-8?B?b2QrU0Z2LzlYaytKdnpheXV4NGl5eXdRYzBGUHJyTmE0OUJrTzJORjYwT01h?=
 =?utf-8?B?eFVVeTFuUVJ3SXhjaVpDVkZxNzI5NXRaNE1reklUZk02aU8xU2lXUm80dzQ1?=
 =?utf-8?B?bSt3dXNrOWxGQkEzalFkUUNtZEQzMXI5cEFwcmtkdU44QVBUajZITTdFMW1w?=
 =?utf-8?B?anN2enIwc3J0aFBTU1dnV2xaK2NWTGIvYkM1bzRPMHNLOXJZQmxuRGx3YmM4?=
 =?utf-8?B?aWRoTHpMcUNpN21icUZkVHBRQ21KaVFOeUVYNkMzeDFLNVlUNWdqaDZiU0pN?=
 =?utf-8?B?RHZkQU9BSlQyUytNZmQ5MkgxQStWbmZCalRsVmpqOVZldjRrMVVNQmdrRXg1?=
 =?utf-8?B?UEQwN3FuR2RYZFF5cUMrdVNPSG9mR1FCZnFmckxUYUUyamVhcWNnVnp3VWJi?=
 =?utf-8?B?K0Ftb0oxc1BCajVOcUVHWVhIWkJmbTVKM3NJaExiU1Y0eklNSVpGTHFPbHdn?=
 =?utf-8?B?NEtmNHFTbUVyUHUweFNWdno2TEZJdUREVFRXN21FeVVuMGZzZG1wVVlxbkFI?=
 =?utf-8?B?Sk5ZVFhPeENUYVRaWUlSblRYMXUxUjRuZmxqSXk4bTZuYWkrbFRmZ3M5bkVH?=
 =?utf-8?B?Vy9tdEtDM1pWbjNwcHRVMEkzaTZFNjhMOGN1UDhWbmNrMTRYNmZSYmgvN0pJ?=
 =?utf-8?B?bDh3cDRSeHhtMzNmeFpNOGgwWTMyZlZENzVxYWY3Vk1oZzJaSVJPeWFoYXh0?=
 =?utf-8?B?ZVNCZWZKdnNad0lKRUgyNnVaVU4ydS9qWWg0MTk4VXU4ZytmZW81VjRETThZ?=
 =?utf-8?B?ZTUvcnlYVmVLWHJ0R3Rkd1VvUSs4L2pMRk1VYXVwZllnNDdMa1FtditTbFE1?=
 =?utf-8?B?OHJNdEhzdmhlamRJdUdPcTBua2hOMlVZWEMvSFEwdEs5VUtsUzhrSWZaSDRE?=
 =?utf-8?B?Y1YyblZEOHNaZVhST1BZeStZamNENXpwMExUWk81ZmFXMTgwa3p3cVJyVWQ2?=
 =?utf-8?B?SVZMSWtFeE00Vm9TbjhvWEJTREk5TVZkbzQ3K2hKeXhDWUdzWHhnYWFEdkZu?=
 =?utf-8?B?WjdYbUVXdjVReTBqRnhaSFFKLzk0NGpmRUpCUGQrSm9qSXg4OTNwNW9paHUw?=
 =?utf-8?B?ZExSUCtrcEdMaEdDaVdTckJLMnRnVVR1S3dVR2VTeWlJTjFsT0l1aHgrTisy?=
 =?utf-8?B?VEQ1TEh1N1BIN0JRMVUyaDNUd1Jyamw5dkhxeHh2cFM1ZHd3NnlLc01wMzlO?=
 =?utf-8?Q?b3oUfFMZsWt/eLxMdj5jhTK7nPkUtMP5FhqoM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUl1SE5sS0x5V09aSjdyNWtabG5tK0VPdm0wczJVdU1ZcFgxRnNCQXdQYjRJ?=
 =?utf-8?B?anBnbjdjSnVQRWJYTENhZHAxMXFOWDJqN1p6dVh5N2hUR21KdGdJdEkvS1dY?=
 =?utf-8?B?bGovSjBjUHFVai9KM0g5bG5YOWFITEd2SGxkSzQrU2V4a0xSc1VUaWZ2cXQ3?=
 =?utf-8?B?Q0h4bjJqaGRtbTNrekxqZWE5RlhKdmJTbklBM1lldkY1RE5Nc29ZZ1ZXT1dG?=
 =?utf-8?B?alhxQ0NXTS81aWFMNHpFSVljTzhpRkY5aEY2cklyTkkvbWcrRVBjMU5uMGc1?=
 =?utf-8?B?TUNYb0R1eHA1OWNIS0EvWkRPckVRZHVxNnRLYXlSNmZaazBUdHl1OFFPQXN5?=
 =?utf-8?B?d3lyUjdvdmhUaVJ0T2pPajJocC9RQ25QZTlzNlJyVUxyTjVyUlBhQjN6NFU0?=
 =?utf-8?B?SWFmK1hoYjdkT3Fxa2l0OUxMV2dNMGhvL00wNk90bG53LzZVS2d2T1pDYUhl?=
 =?utf-8?B?OXhCRnI1QXc5RGhDWTZqeUN3UlhOVW1QK3NrQSt1NDViODZRK2owWUtjSlhr?=
 =?utf-8?B?SWI1ZTNVRTlNNDV0anE5S2RNbGVrNjlxaXJwakZWaGtsdmlJZTJ4OElNcGRJ?=
 =?utf-8?B?UGFVWVFKKy9FWW9oL0pTYXBLVldYcjYxeGNMbFI1TE16NVJyR20vRG5Edkoz?=
 =?utf-8?B?RkR5Uk93S1Q5UTVNTVllZXhqYUdHM1lDZ2VXcWtwMTlndUhOa1RhV1JFaGxT?=
 =?utf-8?B?cDZ0S0hBbUw2UUpMTkREZlVtUVdLampHMXRoS2pBbGppZDkxS2ZpOWc2eWh1?=
 =?utf-8?B?SDVuY3h0ZEs4cEhueG4zL0JKYWxhVitPR2E4VVNUdXJ4L05YQWxxN0N5Zzdq?=
 =?utf-8?B?czlnaks4akNBVWE1SktjZ2dqY2R6dkJCTU16a1hHbFVtT1VNZU5LZFNTZ3Q0?=
 =?utf-8?B?a3FBZkpGOW1TVnFxaTBha2hSTHdTcFpYdWNENkxUbTY5TDR4YytxcDBsbEYw?=
 =?utf-8?B?K1pKRWwyMk4zeEllSTM4RVdiQVFmQytsOEFCWDBYb2YwWVJxZGtYMVVQNWU4?=
 =?utf-8?B?aHpuU2taVitIaUhSbHpKTkZsSVJRMnhqMjgvYWpzU1JKbkw1aEExa0ZBYzFD?=
 =?utf-8?B?OXpYUmFXUkF4Q1oxNmUwN0RGT0tkbEpWVmhiTTRNV055UTRTc2FjcVVTYXpn?=
 =?utf-8?B?Z2h6U09WdmR4TENRYnQzbzU3OWhTM0h3S0cwbkNGOHZOZlRFeVMyT1laNHB1?=
 =?utf-8?B?UzhwU2I1aERPbEpKSU9Kbml6STFNUkIrdVdtWUdybjNucDFrdjJ5YTFjSFRK?=
 =?utf-8?B?OHlVN3A3Q3Awank4bVRaR2FBcHZWR2dRZ29YeDZFTU03MjZMcDV0M0hLM0dy?=
 =?utf-8?B?bEZIczVwTHVReHZuM1JIaklUSmUreTlzRVV5akptU3ZsK3VvN0JmTHYzYlpZ?=
 =?utf-8?B?Sjc5UU91NmU2aE1jQnJ6Mk9HOE1Qcm9MTGZMY0JkUFlCMzlSdXJQWnp4Z05F?=
 =?utf-8?B?elZXQ1pKT1ZQUFIyRndQaUtqbXJSb24zVGdPcm03bEJ4S2pid3ZiR0k5RFdt?=
 =?utf-8?B?SytZUXl2a09qeWJlWEFNNzhLKzM4a3QxcUE4Z3RIY0JtZW5GSTNEYS8zUG1T?=
 =?utf-8?B?ZGhIUXR3U05RLzUydVQyZVBHYUpZc1h6SlBlekl2Z3lRV1lSR1AxMkRrWkZI?=
 =?utf-8?B?ODdDZ3p5VWRLbkFGempEZUNBb1dQL0dwSmdHQmFHS1haTVgxcGdUWXplT1Za?=
 =?utf-8?B?OEMzaDA1Y3ViVmhJeHAyY1VNRmNZVVRDMDBOQ3N0Q1lTbWZRbmNsRmRLR1hW?=
 =?utf-8?B?NU9LOGo2SFdISi9oVE1JdEpLRjV0U2FMaUluOEJ4TnBrV1h3RXJZM3krZ01y?=
 =?utf-8?B?c1VnV00xS3dxMnJFTTRQYlNXL2dWVHhvMU5mU2duR2EvNm5BT0VVMFZkZk52?=
 =?utf-8?B?eHFVbUY5VWdlbVo1MWI0VWN6L3RGakQrN2MvSXdoVnJTV0doRnlkVmRvdjRN?=
 =?utf-8?B?YVVqUGdwOG9tT2E1NE1Laks5cERJMFROeVRFWEdqbWJTUzRlbDhLMjVjblZz?=
 =?utf-8?B?S3E2UWNSNVZMYzhkZzVYTFB6OUVObnE3NEZzVFhMbXA0Mkk2K3dDMnRRemRx?=
 =?utf-8?B?QWNhYkhHb3BWZTl5ZVVxMVdzNzBFcWx5RTcvZllRMlpYb2hLUXZRRkRlQWRK?=
 =?utf-8?B?UUJuZzU5THpLK0ZBTlp4QUJEMUlTbE9pQU1zaHlOeDBqSDlaWGFCcGNYQ0VO?=
 =?utf-8?B?REE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAC46F0222F8E14D8879B6EC44FE49E3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c47098b1-9c14-42f2-a226-08dcc374e3a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 13:09:58.2630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LP933JEDqNl8fLu/k+ZDxI21JWMFnd6LpTYSfWkWui3ylflXAZTUSwqHi33Soe876X13fB7u8TqlaR1K+4n6wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6297
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

T24gVGh1LCAyMDI0LTA4LTIyIGF0IDE1OjUzIC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIFdlZCwgMjEgQXVnIDIwMjQgMTI6MzU6NTEgLTA3MDAsIENhYnJhbCwgTWF0aWFzIEEg
d3JvdGU6DQo+IA0KPiBIaSBNYXRpYXMsDQo+IA0KPiBUaGFua3MgZm9yIHJlc3BvbmRpbmcsIHRo
ZSBpbnB1dCBpcyBfdmVyeV8gaGVscGZ1bC4NCj4gDQo+IE1lc2EgZm9sa3M6IHdvdWxkIGl0IGJl
IHBvc3NpYmxlIGZvciB5b3UgdG8gcHJvdmlkZSBzaW1pbGFyIGlucHV0IHRvbz8NCg0KaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzYwMjU1My8/c2VyaWVzPTEzNTU1OSZy
ZXY9MiNjb21tZW50XzEwOTgxMDANCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9w
YXRjaC82MDI1NTMvP3Nlcmllcz0xMzU1NTkmcmV2PTIjY29tbWVudF8xMDk5ODAzDQoNCj4gDQo+
IFRoYW5rcy4NCj4gLS0NCj4gQXNodXRvc2gNCj4gDQo+IA0KPiA+IA0KPiA+IEhpIEFzaHV0b3No
LA0KPiA+IA0KPiA+IFNvbWUgaW5saW5lIHF1ZXN0aW9ucyBiZWxvdyBbTUFDXQ0KPiA+IA0KPiA+
IFRoYW5rcywNCj4gPiBfTUFDDQo+ID4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPiBGcm9tOiBEaXhpdCwgQXNodXRvc2ggPGFzaHV0b3NoLmRpeGl0QGludGVsLmNvbT4NCj4g
PiBTZW50OiBGcmlkYXksIEF1Z3VzdCAxNiwgMjAyNCAzOjM4IFBNDQo+ID4gVG86IGludGVsLXhl
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IENjOiBDaGVnb25kaSwgSGFyaXNoIDxoYXJpc2gu
Y2hlZ29uZGlAaW50ZWwuY29tPjsgTmVybGlnZSBSYW1hcHBhLCBVbWVzaCA8dW1lc2gubmVybGln
ZS5yYW1hcHBhQGludGVsLmNvbT47IERlZ3Jvb2QsIEZlbGl4IEogPGZlbGl4LmouZGVncm9vZEBp
bnRlbC5jb20+OyBTb3V6YSwgSm9zZSA8am9zZS5zb3V6YUBpbnRlbC5jb20+OyBDYWJyYWwsIE1h
dGlhcyBBIDxtYXRpYXMuYS5jYWJyYWxAaW50ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjIgMS8xXSBkcm0veGUvZXVzdGFsbDogQWRkIHN1cHBvcnQgZm9yIEVVIHN0YWxsIHNhbXBs
aW5nDQo+ID4gDQo+ID4gT24gU3VuLCAwNyBKdWwgMjAyNCAxNTo0MTo0MSAtMDcwMCwgQXNodXRv
c2ggRGl4aXQgd3JvdGU6DQo+ID4gDQo+ID4gSGkgSGFyaXNoLA0KPiA+IA0KPiA+IFNvbWUgY29t
bWVudHMgYmVsb3cgb24ganVzdCB0aGUgdWFwaSBmaXJzdCwgdG93YXJkcyBmaW5hbGl6aW5nIHRo
ZSB1YXBpDQo+ID4gd2l0aCB0aGUgVU1EJ3Mgd2hvIGNvbnN1bWUgdGhpcyBkYXRhLiBBbmQgYWxz
byBjb21wYXJpbmcgdGhlIHVhcGkgd2l0aA0KPiA+IHdoYXQgd2UgZGlkIGluIE9BLg0KPiA+IA0K
PiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBiL2lu
Y2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPiA+IGluZGV4IDE5NjE5ZDQ5NTJhOC4uMzQzZGU3
MDBkMTBkIDEwMDY0NA0KPiA+IA0KPiA+IC9zbmlwLw0KPiA+IA0KPiA+ID4gKy8qKg0KPiA+ID4g
KyAqIHN0cnVjdCBkcm1feGVfZXVfc3RhbGxfZGF0YV9oZWFkZXIgLSBFVSBzdGFsbCBkYXRhIGhl
YWRlci4NCj4gPiA+ICsgKiBIZWFkZXIgd2l0aCBhZGRpdGlvbmFsIGluZm9ybWF0aW9uIHRoYXQg
dGhlIGRyaXZlciBhZGRzDQo+ID4gPiArICogYmVmb3JlIEVVIHN0YWxsIGRhdGEgb2YgZWFjaCBz
dWJzbGljZSBkdXJpbmcgcmVhZCgpLg0KPiA+IA0KPiA+IE9uZSBxdWVzdGlvbiB0byByZXNvbHZl
IGlzIGlmIHdlIHJlYWxseSBuZWVkIHRoaXMgaGVhZGVyIGFuZCBpZiBVTUQncyBhcmUNCj4gPiBh
Y3R1YWxseSB1c2luZyB0aGUgaW5mb3JtYXRpb24gaW4gdGhpcyBoZWFkZXIuIEluIE9BIHdlIGRy
b3BwZWQgdGhlDQo+ID4gaGVhZGVyIGFuZCBhcmUgcHJvdmlkaW5nIGluZm9ybWF0aW9uIGluIHRo
ZSBoZWFkZXIgdmlhIGRpZmZlcmVudCBtZWFucw0KPiA+IChzZWUgYmVsb3cpLg0KPiA+IA0KPiA+
IEFub3RoZXIgb3B0aW9uIGlzIHRvIGFjdHVhbGx5IGFkZCBhIHByb3BlcnR5IGZvciB0aGUgaGVh
ZGVyLiBTbyBoZWFkZXJzDQo+ID4gYXJlIGFkZGVkIG9ubHkgd2hlbiB1c2VyIHNwYWNlIHJlcXVl
c3RzIGhlYWRlcnMuDQo+ID4gDQo+ID4gPiArICovDQo+ID4gPiArc3RydWN0IGRybV94ZV9ldV9z
dGFsbF9kYXRhX2hlYWRlciB7DQo+ID4gPiArCS8qKiBAc3Vic2xpY2U6IHN1YnNsaWNlIG51bWJl
ciBmcm9tIHdoaWNoIHRoZSBmb2xsb3dpbmcgZGF0YQ0KPiA+ID4gKwkgKiBoYXMgYmVlbiBjYXB0
dXJlZC4NCj4gPiA+ICsJICovDQo+ID4gPiArCV9fdTE2IHN1YnNsaWNlOw0KPiA+IA0KPiA+IERv
IFVNRCdzIHVzZSB0aGlzIHN1YnNsaWNlIGluZm9ybWF0aW9uPyBXZSBzaG91bGQgY2hlY2sgd2l0
aCBMMCBhbmQgTWVzYSBhYm91dCB0aGlzLg0KPiA+IA0KPiA+IFtNQUNdIEwwIGRvZXMgbm90IGN1
cnJlbnRseSB1c2UgdGhpcy4NCj4gPiANCj4gPiBBbHNvIGFib3V0IHdoZXRoZXIgVU1EJ3MgbmVl
ZCBvciB3YW50IHRoZSBoZWFkZXIgaXRzZWxmLiBGb3IgT0EsIFVNRCdzDQo+ID4gd2VyZSBoYXBw
eSBub3QgaGF2aW5nIHRvIHBhcnNlIHRoZSBoZWFkZXIuDQo+ID4gDQo+ID4gPiArCS8qKiBAZmxh
Z3M6IGZsYWdzICovDQo+ID4gPiArCV9fdTE2IGZsYWdzOw0KPiA+ID4gKy8qIEVVIHN0YWxsIGRh
dGEgZHJvcHBlZCBieSB0aGUgSFcgZHVlIHRvIG1lbW9yeSBidWZmZXIgYmVpbmcgZnVsbCAqLw0K
PiA+ID4gKyNkZWZpbmUgWEVfRVVfU1RBTExfRkxBR19PVkVSRkxPV19EUk9QCSgxIDw8IDApDQo+
ID4gDQo+ID4gSW4gT0Egc3VjaCBpbmZvcm1hdGlvbiBpcyByZXR1cm5lZCB2aWENCj4gPiBEUk1f
WEVfT0JTRVJWQVRJT05fSU9DVExfU1RBVFVTLiBGb3IgRVUgc3RhbGwsIGUuZy4gd2UgY291bGQg
cmV0dXJuIGEgYml0DQo+ID4gbWFzayBvZiBzdWJzbGljZXMgd2hpY2ggcmVwb3J0aW5nIGRyb3Bz
LiBTbyBzaW1pbGFyIHRvIE9BLCB3ZSBjb3VsZA0KPiA+IHJldHVybiAtRUlPIHdoZW4gSFcgcmVw
b3J0cyBkcm9wcyBhbmQgdXNlcnNwYWNlIG9wdGlvbmFsbHkgaXNzdWVzDQo+ID4gRFJNX1hFX09C
U0VSVkFUSU9OX0lPQ1RMX1NUQVRVUyB0byByZXRyaWV2ZSB3aGljaCBzdWJzbGljZXMgYXJlIHJl
cG9ydGluZw0KPiA+IGRyb3BzLg0KPiA+IA0KPiA+IFtNQUNdIGhhdmluZyBhIHJldHVybiBjb2Rl
IHRvIG5vdGlmeSBvZiByZXBvcnRzIGRyb3BzIHdvdWxkIGJlIG11Y2gNCj4gPiBwcmVmZXJhYmxl
LiBUaGlzIHdvdWxkIGFsbG93IHRoZSBVTUQgZGV0ZWN0aW5nIHRoaXMgY29uZGl0aW9uIGR1cmlu
ZyB0aGUNCj4gPiByZWFkIHBoYXNlIHdpdGhvdXQgbmVlZGluZyB0byBwcm9jZXNzL3BhcnNlIGVh
Y2ggcmVwb3J0Lg0KPiA+IA0KPiA+ID4gKwkvKiogQHJlY29yZF9zaXplOiBzaXplIG9mIGVhY2gg
RVUgc3RhbGwgZGF0YSByZWNvcmQgKi8NCj4gPiA+ICsJX191MTYgcmVjb3JkX3NpemU7DQo+ID4g
DQo+ID4gVGhpcyBpcyBzdGF0aWMgaW5mb3JtYXRpb24uIERvZXMgaXQgbmVlZCB0byBiZSBpbiBl
YWNoIHBhY2tldCBoZWFkZXI/DQo+ID4gRS5nLiBpdCBjYW4gYmUgcmV0dXJuZWQgdmlhIERSTV9Y
RV9PQlNFUlZBVElPTl9JT0NUTF9JTkZPIGFmdGVyIGEgRVUNCj4gPiBTdGFsbCBzdHJlYW0gaGFz
IGJlZW4gb3BlbmVkLg0KPiA+IA0KPiA+IFtNQUNdIHNpbmNlIHRoZSBzaXplIGlzIGNvbnN0YW50
LCBpdCBzZWVtcyBhbiBvdmVyaGVhZCBpbmNsdWRpbmcgdGhlIGluZm8NCj4gPiBpbiBldmVyeSBy
ZXBvcnQuDQo+ID4gDQo+ID4gVGhlIElORk8gZGF0YSBzdHJ1Y3QgY291bGQgYWxzbyBpbmNsdWRl
IGEgY2FwYWJpbGl0aWVzIGZpZWxkLiBTbyBpZiBuZXcNCj4gPiBmZWF0dXJlcyBhcmUgYWRkZWQg
dG8gRVUgc3RhbGwgaW4gdGhlIGZ1dHVyZSwgdGhleSB3b3VsZCBiZSBhZHZlcnRpemVkIHRvDQo+
ID4gdXNlciBzcGFjZSB1c2luZyB0aGUgY2FwYWJpbGl0aWVzIGZpZWxkLg0KPiA+IA0KPiA+ID4g
KwkvKiogQG51bV9yZWNvcmRzOiBudW1iZXIgb2YgcmVjb3JkcyBmb2xsb3dpbmcgdGhlIGhlYWRl
ciAqLw0KPiA+ID4gKwlfX3UxNiBudW1fcmVjb3JkczsNCj4gPiANCj4gPiBUaGlzIHdpbGwgbm90
IGJlIG5lZWRlZCBpZiBqdXN0IHJldHVybiByYXcgRVUgU3RhbGwgZGF0YSB3aXRob3V0DQo+ID4g
aGVhZGVycy4gT3IgZXZlbiBvdGhlcndpc2UgaXQgaXMgcHJvYmFibHkgbm90IG5lZWRlZCwgaXQg
aXMgdGhlIHRvdGFsDQo+ID4gc2l6ZSBvZiByZXR1cm5lZCBkYXRhIG1pbnVzIHRoZSBzaXplIG9m
IHRoZSBoZWFkZXIuIFByb3ZpZGVkIHdlIHJldHVybg0KPiA+IGFsbCBhdmFpbGFibGUgZGF0YS4N
Cj4gPiANCj4gPiBbTUFDXSB0aGUgS01EIHdpbGwgYWx3YXlzIHJldHVybiBhdG9taWMgdW5pdHMg
b2YgcmVwb3J0cywgcmlnaHQ/IFRoZW4NCj4gPiB0aGlzIGlzIG5vdCBuZWVkZWQsIGhhdmluZyBV
TUQgdGhlIHBvc3NpYmlsaXR5IHRvIHF1ZXJ5IHJlcG9ydCBzaXplIHdoZW4NCj4gPiBvcGVuaW5n
IHRoZSBzdHJlYW0sIHRoZSBVTUQgY2FuIGtub3cgaG93IG1hbnkgcmVwb3J0cyBhcmUgaW4gZWFj
aCByZWFkLg0KPiA+IA0KPiA+ID4gKwkvKiogQHJlc2VydmVkOiBSZXNlcnZlZCAqLw0KPiA+ID4g
KwlfX3UxNiByZXNlcnZlZFs0XTsNCj4gPiANCj4gPiBUaGlzIGNhbiBiZSBoYW5kbGVkIHZpYSAn
ZXh0ZW5zaW9ucycuIEFuZCBpZiBoZWFkZXJzIGNoYW5nZSB0aGV5IGNhbiBiZQ0KPiA+IGFkdmVy
dGl6ZWQgaW4gY2FwYWJpbGl0aWVzLg0KPiA+IA0KPiA+ID4gK307DQo+ID4gPiArDQo+ID4gPiAg
I2lmIGRlZmluZWQoX19jcGx1c3BsdXMpDQo+ID4gPiAgfQ0KPiA+ID4gICNlbmRpZg0KPiA+ID4g
LS0NCj4gPiA+IDIuNDEuMA0KPiA+ID4gDQo+ID4gDQo+ID4gVGhhbmtzLg0KPiA+IC0tDQo+ID4g
QXNodXRvc2gNCg0K
